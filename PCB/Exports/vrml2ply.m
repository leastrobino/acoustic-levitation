%
% VRML IndexedFaceSet to PLY
% Created by Léa Strobino (2018)
%

function vrml2ply(varargin)

vrml = varargin{1};
if nargin > 1
  ply = varargin{2};
else
  [p,n] = fileparts(vrml);
  ply = fullfile(p,[n '.ply']);
end

t = tic();

[id,root] = openVRML(vrml);
o = processNode(id,root);
d = vrsfunc('GetSceneProperty',id,'description');
closeVRML(id);

writePLY(o,ply,d);

fprintf('Elapsed time: %.1f s\n',toc(t));


function [id,root] = openVRML(file)
fprintf('Reading file: %s\n',file);
id = vrsfunc('VRT3LoadScene',file,false);
vrsfunc('VRT3SceneOpen',id);
root = vrsfunc('GetRootNodeName',id);


function closeVRML(id)
vrsfunc('VRT3SceneClose',id);
vrsfunc('VRT3RemoveScene',id);


function o = processNode(id,node,m)
persistent v f cdata
if nargout
  m = eye(4);
  v = single([]);
  f = cell(0);
  cdata = uint8([]);
end
switch vrsfunc('VRT3NodeType',id,node)
  case 'Group'
    c = vrsfunc('VRT3GetField',id,node,'children');
    cellfun(@(c)processNode(id,c,m),c);
  case 'Transform'
    s = vrsfunc('VRT3GetField',id,node,'scale');
    r = vrsfunc('VRT3GetField',id,node,'rotation');
    t = vrsfunc('VRT3GetField',id,node,'translation');
    m = m*[rotvec2mat(r) t' ; 0 0 0 1]*diag([s 1]);
    c = vrsfunc('VRT3GetField',id,node,'children');
    cellfun(@(c)processNode(id,c,m),c);
  case 'Inline'
    u = vrsfunc('VRT3GetField',id,node,'url');
    [id,root] = openVRML(u{1});
    processNode(id,root,m);
    closeVRML(id);
  case 'Shape'
    g = vrsfunc('VRT3GetField',id,node,'geometry');
    if ~isempty(g)
      c = vrsfunc('VRT3GetField',id,vrsfunc('VRT3GetField',id,vrsfunc('VRT3GetField',id,node,'appearance'),'material'),'diffuseColor')';
      pts = vrsfunc('VRT3GetField',id,vrsfunc('VRT3GetField',id,g,'coord'),'point')';
      ind = int32(vrsfunc('VRT3GetField',id,g,'coordIndex'))';
      pts(4,:) = 1;
      pts = m*pts;
      ind = ind+size(v,2);
      s = find(ind == size(v,2)-1);
      f = [f arrayfun(@(b,e)ind(b:e),[1 s(1:end-1)+1],s-1,'UniformOutput',0)];
      v = [v pts(1:3,:)];
      cdata = [cdata repmat(255*c,1,size(pts,2))];
    end
end
if nargout
  o.Vertices = v;
  o.Faces = f;
  o.VertexCData = cdata;
end


function m = rotvec2mat(v)
c = cos(v(4));
s = sin(v(4));
t = 1-c;
v = v(1:3)/sqrt(sum(v(1:3).^2));
m = [t*v(1)^2+c t*v(1)*v(2)-s*v(3) t*v(1)*v(3)+s*v(2) ; t*v(1)*v(2)+s*v(3) t*v(2)^2+c t*v(2)*v(3)-s*v(1) ; t*v(1)*v(3)-s*v(2) t*v(2)*v(3)+s*v(1) t*v(3)^2+c];


function writePLY(o,filename,description)
fprintf('Writing file: %s\n',filename);
h = fopen(filename,'w');
fprintf(h,'ply\nformat binary_little_endian 1.0\n');
if nargin > 2 && ~isempty(description)
  fprintf(h,'comment %s\n',description);
end
fprintf(h,'comment Created by MATLAB %s\n',version());
fprintf(h,'element vertex %d\nproperty float32 x\nproperty float32 y\nproperty float32 z\nproperty uint8 red\nproperty uint8 green\nproperty uint8 blue\n',size(o.Vertices,2));
fprintf(h,'element face %d\nproperty list uint8 int32 vertex_indices\n',numel(o.Faces));
fprintf(h,'end_header\n');
x = reshape(typecast(o.Vertices(1,:),'uint8'),4,[]);
y = reshape(typecast(o.Vertices(2,:),'uint8'),4,[]);
z = reshape(typecast(o.Vertices(3,:),'uint8'),4,[]);
fwrite(h,[x ; y ; z ; o.VertexCData],'uint8');
f = cellfun(@(f)[numel(f) typecast(f,'uint8')],o.Faces,'UniformOutput',0);
fwrite(h,[f{:}],'uint8');
fclose(h);
