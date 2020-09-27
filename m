Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37E27A1D0
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 18:18:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMZMr-00045m-MN; Sun, 27 Sep 2020 16:17:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xgli=DE=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1kMZMq-00045h-AY
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 16:17:40 +0000
X-Inumbo-ID: 55052ae4-1a33-4705-8e7a-68b345f0802f
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55052ae4-1a33-4705-8e7a-68b345f0802f;
 Sun, 27 Sep 2020 16:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 9E041EC7;
 Sun, 27 Sep 2020 18:17:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJicQpqzhaud; Sun, 27 Sep 2020 18:17:29 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 1CEE079;
 Sun, 27 Sep 2020 18:17:29 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1kMZMd-005ntk-8j; Sun, 27 Sep 2020 18:17:27 +0200
Date: Sun, 27 Sep 2020 18:17:27 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] stubdom: add xenstore pvh stubdom
Message-ID: <20200927161727.jdaflyh4km7fjoqm@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200923064541.19546-1-jgross@suse.com>
 <20200923064541.19546-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923064541.19546-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross, le mer. 23 sept. 2020 08:45:41 +0200, a ecrit:
> Add a PVH xenstore stubdom in order to support a Xenstore stubdom on
> a hypervisor built without PV-support.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  .gitignore                     |  1 +
>  stubdom/Makefile               | 31 ++++++++++++++++++++--
>  stubdom/configure              | 47 ++++++++++++++++++++++++++++++++++
>  stubdom/configure.ac           |  1 +
>  stubdom/xenstorepvh-minios.cfg | 10 ++++++++
>  5 files changed, 88 insertions(+), 2 deletions(-)
>  create mode 100644 stubdom/xenstorepvh-minios.cfg
> 
> diff --git a/.gitignore b/.gitignore
> index 5e8c47e2db..e7b388e31b 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -91,6 +91,7 @@ stubdom/stubdompath.sh
>  stubdom/tpm_emulator-*
>  stubdom/vtpm/vtpm_manager.h
>  stubdom/xenstore
> +stubdom/xenstorepvh
>  stubdom/zlib-*
>  tools/*/build/lib*/*.py
>  tools/autom4te.cache/
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index fb9617fa14..90d9ffcd9f 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -367,7 +367,10 @@ $(foreach lib,$(STUB_LIBS),$(eval $(call BUILD_lib,$(lib))))
>  xenstore/stamp: $(XEN_ROOT)/tools/xenstore/Makefile
>  	$(do_links)
>  
> -LINK_DIRS := xenstore $(foreach dir,$(STUB_LIBS),libs-$(XEN_TARGET_ARCH)/$(dir))
> +xenstorepvh/stamp: $(XEN_ROOT)/tools/xenstore/Makefile
> +	$(do_links)
> +
> +LINK_DIRS := xenstore xenstorepvh $(foreach dir,$(STUB_LIBS),libs-$(XEN_TARGET_ARCH)/$(dir))
>  LINK_STAMPS := $(foreach dir,$(LINK_DIRS),$(dir)/stamp)
>  
>  mk-headers-$(XEN_TARGET_ARCH): $(IOEMU_LINKFARM_TARGET) $(LINK_STAMPS)
> @@ -486,6 +489,17 @@ xenstore-minios-config.mk: $(CURDIR)/xenstore-minios.cfg
>  xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
>  	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstore-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ xenstored.a CONFIG_STUBDOM=y
>  
> +#############
> +# xenstorepvh
> +#############
> +
> +xenstorepvh-minios-config.mk: $(CURDIR)/xenstorepvh-minios.cfg
> +	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
> +
> +.PHONY: xenstorepvh
> +xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
> +	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstorepvh-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ xenstored.a CONFIG_STUBDOM=y
> +
>  ########
>  # minios
>  ########
> @@ -519,6 +533,10 @@ pv-grub: mini-os-$(XEN_TARGET_ARCH)-grub libxenguest grub
>  xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxenguest xenstore
>  	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
>  
> +.PHONY: xenstorepvh-stubdom
> +xenstorepvh-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstorepvh libxenguest xenstorepvh
> +	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstorepvh-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstorepvh/xenstored.a
> +
>  #########
>  # install
>  #########
> @@ -548,6 +566,10 @@ install-xenstore: xenstore-stubdom
>  	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
>  	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-xenstore/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/xenstore-stubdom.gz"
>  
> +install-xenstorepvh: xenstorepvh-stubdom
> +	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
> +	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-xenstorepvh/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/xenstorepvh-stubdom.gz"
> +
>  install-vtpm: vtpm-stubdom
>  	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
>  	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-vtpm/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/vtpm-stubdom.gz"
> @@ -581,6 +603,9 @@ uninstall-grub:
>  uninstall-xenstore:
>  	rm -f $(DESTDIR)$(XENFIRMWAREDIR)/xenstore-stubdom.gz
>  
> +uninstall-xenstorepvh:
> +	rm -f $(DESTDIR)$(XENFIRMWAREDIR)/xenstorepvh-stubdom.gz
> +
>  uninstall-vtpm:
>  	rm -f $(DESTDIR)$(XENFIRMWAREDIR)/vtpm-stubdom.gz
>  
> @@ -600,6 +625,7 @@ clean:
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-caml
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-grub
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstore
> +	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstorepvh
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-vtpm
>  	rm -fr mini-os-$(XEN_TARGET_ARCH)-vtpmmgr
>  	$(MAKE) DESTDIR= -C caml clean
> @@ -612,6 +638,7 @@ clean:
>  	rm -fr pkg-config
>  	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
>  	-[ ! -d xenstore ] || $(MAKE) DESTDIR= -C xenstore clean
> +	-[ ! -d xenstorepvh ] || $(MAKE) DESTDIR= -C xenstorepvh clean
>  
>  # clean the cross-compilation result
>  .PHONY: crossclean
> @@ -620,7 +647,7 @@ crossclean: clean
>  	rm -fr newlib-$(XEN_TARGET_ARCH)
>  	rm -fr zlib-$(XEN_TARGET_ARCH) pciutils-$(XEN_TARGET_ARCH)
>  	rm -fr libs-$(XEN_TARGET_ARCH)
> -	rm -fr ioemu xenstore
> +	rm -fr ioemu xenstore xenstorepvh
>  	rm -fr gmp-$(XEN_TARGET_ARCH)
>  	rm -fr polarssl-$(XEN_TARGET_ARCH)
>  	rm -fr openssl-$(XEN_TARGET_ARCH)
> diff --git a/stubdom/configure b/stubdom/configure
> index 3668203db8..903414589b 100755
> --- a/stubdom/configure
> +++ b/stubdom/configure
> @@ -630,6 +630,7 @@ WGET
>  CMAKE
>  extfiles
>  debug
> +xenstorepvh
>  xenstore
>  grub
>  caml
> @@ -689,6 +690,7 @@ enable_c_stubdom
>  enable_caml_stubdom
>  enable_pv_grub
>  enable_xenstore_stubdom
> +enable_xenstore_pvh_stubdom
>  enable_vtpm_stubdom
>  enable_vtpmmgr_stubdom
>  enable_qemu_traditional
> @@ -1344,6 +1346,9 @@ Optional Features:
>    --disable-xenstore-stubdom
>                            Build and install xenstore-stubdom (default is
>                            ENABLED)
> +  --disable-xenstorepvh-stubdom
> +                          Build and install xenstorepvh-stubdom (default is
> +                          ENABLED)
>    --enable-vtpm-stubdom   Build and install vtpm-stubdom
>    --enable-vtpmmgr-stubdom
>                            Build and install vtpmmgr-stubdom
> @@ -2178,6 +2183,48 @@ fi
>  
>  
>  
> +# Check whether --enable-xenstorepvh-stubdom was given.
> +if test "${enable_xenstore_pvh_stubdom+set}" = set; then :
> +  enableval=$enable_xenstore_pvh_stubdom;
> +
> +if test "x$enableval" = "xyes"; then :
> +
> +
> +xenstorepvh=y
> +STUBDOM_TARGETS="$STUBDOM_TARGETS xenstorepvh"
> +STUBDOM_BUILD="$STUBDOM_BUILD xenstorepvh-stubdom"
> +STUBDOM_INSTALL="$STUBDOM_INSTALL install-xenstorepvh"
> +STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-xenstorepvh"
> +
> +
> +else
> +
> +if test "x$enableval" = "xno"; then :
> +
> +
> +xenstorepvh=n
> +
> +
> +fi
> +
> +fi
> +
> +
> +else
> +
> +
> +xenstorepvh=y
> +STUBDOM_TARGETS="$STUBDOM_TARGETS xenstorepvh"
> +STUBDOM_BUILD="$STUBDOM_BUILD xenstorepvh-stubdom"
> +STUBDOM_INSTALL="$STUBDOM_INSTALL install-xenstorepvh"
> +STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-xenstorepvh"
> +
> +
> +fi
> +
> +
> +
> +
>  # Check whether --enable-vtpm-stubdom was given.
>  if test "${enable_vtpm_stubdom+set}" = set; then :
>    enableval=$enable_vtpm_stubdom;
> diff --git a/stubdom/configure.ac b/stubdom/configure.ac
> index a2d514c021..bd6f765929 100644
> --- a/stubdom/configure.ac
> +++ b/stubdom/configure.ac
> @@ -23,6 +23,7 @@ AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
>  AX_STUBDOM_DEFAULT_DISABLE([caml-stubdom], [caml])
>  AX_STUBDOM_DEFAULT_ENABLE([pv-grub], [grub])
>  AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
> +AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
>  AX_STUBDOM_CONDITIONAL([vtpm-stubdom], [vtpm])
>  AX_STUBDOM_CONDITIONAL([vtpmmgr-stubdom], [vtpmmgr])
>  
> diff --git a/stubdom/xenstorepvh-minios.cfg b/stubdom/xenstorepvh-minios.cfg
> new file mode 100644
> index 0000000000..6af51f5753
> --- /dev/null
> +++ b/stubdom/xenstorepvh-minios.cfg
> @@ -0,0 +1,10 @@
> +CONFIG_PARAVIRT=n
> +CONFIG_BLKFRONT=n
> +CONFIG_NETFRONT=n
> +CONFIG_FBFRONT=n
> +CONFIG_KBDFRONT=n
> +CONFIG_CONSFRONT=n
> +CONFIG_XENBUS=n
> +CONFIG_LWIP=n
> +CONFIG_BALLOON=y
> +XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
> -- 
> 2.26.2
> 

