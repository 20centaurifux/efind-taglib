Name: efind-taglib
Version: 0.1.0
Release:        1%{?dist}
Summary: Filter search results by audio tags and properties.

License: GPLv3+
URL: https://github.com/20centaurifux/efind-taglib
Source0: efind-taglib-0.1.0.tar.xz

BuildRequires: taglib-devel
Requires: taglib, efind

%description
efind-taglib is an extension for efind. It makes it possible
to filter search results by audio tags and properties.

%prep
%setup -q


%build
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
%make_install


%files
%{_sysconfdir}/*



%changelog
