function tightplot(filename)
    set(gcf,'color','w');
    export_fig([filename,'.pdf'], '-pdf');
end