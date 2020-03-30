Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6F1197DC3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 16:01:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIuvS-0002aQ-QE; Mon, 30 Mar 2020 13:58:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UV6F=5P=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jIuvR-0002a6-GO
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 13:58:01 +0000
X-Inumbo-ID: 6f004df6-728e-11ea-83d8-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f004df6-728e-11ea-83d8-bc764e2007e4;
 Mon, 30 Mar 2020 13:57:46 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jIuvB-0007Qg-Oo; Mon, 30 Mar 2020 14:57:45 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 14:57:34 +0100
Message-Id: <20200330135735.31512-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200330135735.31512-1-ian.jackson@eu.citrix.com>
References: <20200330135735.31512-1-ian.jackson@eu.citrix.com>
Subject: [Xen-devel] [PATCH 2/3] docs etc.: https: Fix references to other
 Xen pages
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Change the url scheme to https.  This is all in-tree references to
xenbits and the main website except for those in Config.mk.

We leave Config.mk alone for now because those urls are used by CI
systems and we need to check that nothing breaks when we change the
download method.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 README                               |  8 ++++----
 SUPPORT.md                           |  2 +-
 configure                            |  6 +++---
 configure.ac                         |  2 +-
 docs/configure                       |  6 +++---
 docs/configure.ac                    |  2 +-
 docs/misc/9pfs.pandoc                |  4 ++--
 docs/misc/livepatch.pandoc           |  4 ++--
 docs/misc/pvcalls.pandoc             |  6 +++---
 docs/misc/xen-command-line.pandoc    |  2 +-
 docs/misc/xenstore-paths.pandoc      | 22 +++++++++++-----------
 docs/misc/xsm-flask.txt              |  4 ++--
 docs/process/branching-checklist.txt |  2 +-
 stubdom/configure                    |  6 +++---
 stubdom/configure.ac                 |  2 +-
 tools/configure                      |  6 +++---
 tools/configure.ac                   |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c           |  2 +-
 xen/include/public/io/blkif.h        |  2 +-
 19 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/README b/README
index 712d05d69d..555f3415fa 100644
--- a/README
+++ b/README
@@ -7,7 +7,7 @@
 
 #################################
 
-http://www.xen.org/
+https://www.xen.org/
 
 What is Xen?
 ============
@@ -17,10 +17,10 @@ Systems Research Group of the University of Cambridge Computer
 Laboratory, as part of the UK-EPSRC funded XenoServers project.  Xen
 is freely-distributable Open Source software, released under the GNU
 GPL. Since its initial public release, Xen has grown a large
-development community, spearheaded by xen.org (http://www.xen.org).
+development community, spearheaded by xen.org (https://www.xen.org).
 
 This file contains some quick-start instructions to install Xen on
-your system. For more information see http:/www.xen.org/ and
+your system. For more information see https:/www.xen.org/ and
 https://wiki.xen.org/
 
 Quick-Start Guide
@@ -99,7 +99,7 @@ performed with root privileges.]
 1. Download and untar the source tarball file. This will be a
    file named xen-unstable-src.tgz, or xen-$version-src.tgz.
    You can also pull the current version from the git or mercurial
-   repositories at http://xenbits.xen.org/
+   repositories at https://xenbits.xen.org/
 
     # tar xzf xen-unstable-src.tgz
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 169b6f8fcf..7270c9b021 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -627,7 +627,7 @@ Virtual Performance Management Unit for HVM guests
     Status, x86: Supported, Not security supported
 
 Disabled by default (enable with hypervisor command line option).
-This feature is not security supported: see http://xenbits.xen.org/xsa/advisory-163.html
+This feature is not security supported: see https://xenbits.xen.org/xsa/advisory-163.html
 
 ### Argo: Inter-domain message delivery by hypercall
 
diff --git a/configure b/configure
index 83f84b049f..9da3970cef 100755
--- a/configure
+++ b/configure
@@ -582,7 +582,7 @@ PACKAGE_TARNAME='xen'
 PACKAGE_VERSION='4.14'
 PACKAGE_STRING='Xen Hypervisor 4.14'
 PACKAGE_BUGREPORT='xen-devel@lists.xen.org'
-PACKAGE_URL='http://www.xen.org/'
+PACKAGE_URL='https://www.xen.org/'
 
 ac_unique_file="./xen/common/kernel.c"
 enable_option_checking=no
@@ -1336,7 +1336,7 @@ Optional Packages:
                           [PREFIX/lib/debug]
 
 Report bugs to <xen-devel@lists.xen.org>.
-Xen Hypervisor home page: <http://www.xen.org/>.
+Xen Hypervisor home page: <https://www.xen.org/>.
 _ACEOF
 ac_status=$?
 fi
@@ -2904,7 +2904,7 @@ Configuration files:
 $config_files
 
 Report bugs to <xen-devel@lists.xen.org>.
-Xen Hypervisor home page: <http://www.xen.org/>."
+Xen Hypervisor home page: <https://www.xen.org/>."
 
 _ACEOF
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
diff --git a/configure.ac b/configure.ac
index 7388b282f9..3aea407153 100644
--- a/configure.ac
+++ b/configure.ac
@@ -3,7 +3,7 @@
 
 AC_PREREQ([2.67])
 AC_INIT([Xen Hypervisor], m4_esyscmd([./version.sh ./xen/Makefile]),
-    [xen-devel@lists.xen.org], [xen], [http://www.xen.org/])
+    [xen-devel@lists.xen.org], [xen], [https://www.xen.org/])
 AC_CONFIG_SRCDIR([./xen/common/kernel.c])
 AC_CONFIG_FILES([
 	config/Toplevel.mk
diff --git a/docs/configure b/docs/configure
index fdfc110311..9e3ed60462 100755
--- a/docs/configure
+++ b/docs/configure
@@ -582,7 +582,7 @@ PACKAGE_TARNAME='xen'
 PACKAGE_VERSION='4.14'
 PACKAGE_STRING='Xen Hypervisor Documentation 4.14'
 PACKAGE_BUGREPORT='xen-devel@lists.xen.org'
-PACKAGE_URL='http://www.xen.org/'
+PACKAGE_URL='https://www.xen.org/'
 
 ac_unique_file="misc/xen-command-line.pandoc"
 ac_subst_vars='LTLIBOBJS
@@ -1320,7 +1320,7 @@ Use these variables to override the choices made by `configure' or to help
 it to find libraries and programs with nonstandard names/locations.
 
 Report bugs to <xen-devel@lists.xen.org>.
-Xen Hypervisor Documentation home page: <http://www.xen.org/>.
+Xen Hypervisor Documentation home page: <https://www.xen.org/>.
 _ACEOF
 ac_status=$?
 fi
@@ -2857,7 +2857,7 @@ Configuration files:
 $config_files
 
 Report bugs to <xen-devel@lists.xen.org>.
-Xen Hypervisor Documentation home page: <http://www.xen.org/>."
+Xen Hypervisor Documentation home page: <https://www.xen.org/>."
 
 _ACEOF
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
diff --git a/docs/configure.ac b/docs/configure.ac
index e795bec04c..cb5a6eaa4c 100644
--- a/docs/configure.ac
+++ b/docs/configure.ac
@@ -3,7 +3,7 @@
 
 AC_PREREQ([2.67])
 AC_INIT([Xen Hypervisor Documentation], m4_esyscmd([../version.sh ../xen/Makefile]),
-    [xen-devel@lists.xen.org], [xen], [http://www.xen.org/])
+    [xen-devel@lists.xen.org], [xen], [https://www.xen.org/])
 AC_CONFIG_SRCDIR([misc/xen-command-line.pandoc])
 AC_CONFIG_FILES([
 ../config/Docs.mk
diff --git a/docs/misc/9pfs.pandoc b/docs/misc/9pfs.pandoc
index a4dc86f639..b034fb5fa6 100644
--- a/docs/misc/9pfs.pandoc
+++ b/docs/misc/9pfs.pandoc
@@ -415,5 +415,5 @@ the *size* field of the 9pfs header.
 
 [paper]: https://www.usenix.org/legacy/event/usenix05/tech/freenix/full_papers/hensbergen/hensbergen.pdf
 [website]: https://github.com/chaos/diod/blob/master/protocol.md
-[XenbusStateInitialising]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,xenbus.h.html
-[ring.h]: http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/io/ring.h;hb=HEAD
+[XenbusStateInitialising]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,xenbus.h.html
+[ring.h]: https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/io/ring.h;hb=HEAD
diff --git a/docs/misc/livepatch.pandoc b/docs/misc/livepatch.pandoc
index 9473ad5991..d38e4ce074 100644
--- a/docs/misc/livepatch.pandoc
+++ b/docs/misc/livepatch.pandoc
@@ -88,7 +88,7 @@ mechanism. See `Trampoline (e9 opcode)` section for more details.
 ### Example of trampoline and in-place splicing
 
 As example we will assume the hypervisor does not have XSA-132 (see
-[domctl/sysctl: don't leak hypervisor stack to toolstacks](http://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=4ff3449f0e9d175ceb9551d3f2aecb59273f639d))
+[domctl/sysctl: don't leak hypervisor stack to toolstacks](https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=4ff3449f0e9d175ceb9551d3f2aecb59273f639d))
 and we would like to binary patch the hypervisor with it. The original code
 looks as so:
 
@@ -157,7 +157,7 @@ CPU branching logic (I-cache, but it is just one unconditional jump).
 
 For this example we will assume that the hypervisor has not been compiled with
 XSA-125 (see
-[pre-fill structures for certain HYPERVISOR_xen_version sub-ops](http://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=fe2e079f642effb3d24a6e1a7096ef26e691d93e))
+[pre-fill structures for certain HYPERVISOR_xen_version sub-ops](https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=fe2e079f642effb3d24a6e1a7096ef26e691d93e))
 which mem-sets an structure in `xen_version` hypercall. This function is not
 called **anywhere** in the hypervisor (it is called by the guest) but
 referenced in the `compat_hypercall_table` and `hypercall_table` (and
diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
index 729cf97bdf..665dad556c 100644
--- a/docs/misc/pvcalls.pandoc
+++ b/docs/misc/pvcalls.pandoc
@@ -1078,8 +1078,8 @@ only as many bytes as available in the buffer up to *[in|out]_prod*.
 reading from the socket.
 
 
-[xenstore]: http://xenbits.xen.org/docs/unstable/misc/xenstore.txt
-[XenbusStateInitialising]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,xenbus.h.html
+[xenstore]: https://xenbits.xen.org/docs/unstable/misc/xenstore.txt
+[XenbusStateInitialising]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,xenbus.h.html
 [address]: http://pubs.opengroup.org/onlinepubs/7908799/xns/syssocket.h.html
 [in]: http://pubs.opengroup.org/onlinepubs/000095399/basedefs/netinet/in.h.html
 [socket]: http://pubs.opengroup.org/onlinepubs/009695399/functions/socket.html
@@ -1089,4 +1089,4 @@ reading from the socket.
 [listen]: http://pubs.opengroup.org/onlinepubs/7908799/xns/listen.html
 [accept]: http://pubs.opengroup.org/onlinepubs/7908799/xns/accept.html
 [poll]: http://pubs.opengroup.org/onlinepubs/7908799/xsh/poll.html
-[ring.h]: http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/io/ring.h;hb=HEAD
+[ring.h]: https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/io/ring.h;hb=HEAD
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6ff317d15d..acd0b3d994 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2294,7 +2294,7 @@ provide access to a wealth of low level processor information.
 
 *Warning:*
 As the virtualisation is not 100% safe, don't use the vpmu flag on
-production systems (see http://xenbits.xen.org/xsa/advisory-163.html)!
+production systems (see https://xenbits.xen.org/xsa/advisory-163.html)!
 
 ### vwfi (arm)
 > `= trap | native`
diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index ff3ca04069..a152f5ea68 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -636,14 +636,14 @@ for the toolstack to obtain e.g. the domain id of a xenstore domain.
 Domain Id of the xenstore domain in case xenstore is provided via a
 domain instead of a daemon in dom0.
 
-[BLKIF]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,blkif.h.html
-[FBIF]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,fbif.h.html
-[HVMPARAMS]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,hvm,params.h.html
-[KBDIF]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,kbdif.h.html
-[LIBXLMEM]: http://xenbits.xen.org/docs/unstable/misc/libxl_memory.txt
-[NETIF]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,netif.h.html
-[SCSIIF]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,vscsiif.h.html
-[SI]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,xen.h.html#Struct_start_info
-[USBIF]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,usbif.h.html
-[VCPU]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,vcpu.h.html
-[XSWIRE]: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,xs_wire.h.html
+[BLKIF]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,blkif.h.html
+[FBIF]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,fbif.h.html
+[HVMPARAMS]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,hvm,params.h.html
+[KBDIF]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,kbdif.h.html
+[LIBXLMEM]: https://xenbits.xen.org/docs/unstable/misc/libxl_memory.txt
+[NETIF]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,netif.h.html
+[SCSIIF]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,vscsiif.h.html
+[SI]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,xen.h.html#Struct_start_info
+[USBIF]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,usbif.h.html
+[VCPU]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,vcpu.h.html
+[XSWIRE]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,xs_wire.h.html
diff --git a/docs/misc/xsm-flask.txt b/docs/misc/xsm-flask.txt
index 40e5fc845e..2419c5cf29 100644
--- a/docs/misc/xsm-flask.txt
+++ b/docs/misc/xsm-flask.txt
@@ -49,13 +49,13 @@ driver domains, or stub xenstored - even if those bugs do no worse
 than reduce the security of such a system to one whose device models,
 backend drivers, or xenstore, run in dom0.
 
-For more information see http://xenbits.xen.org/xsa/advisory-77.html.
+For more information see https://xenbits.xen.org/xsa/advisory-77.html.
 
 The following interfaces are covered by this statement.  Interfaces
 not listed here are considered safe for disaggregation, security
 issues found in interfaces not listed here will be handled according
 to the normal security problem response policy
-http://www.xenproject.org/security-policy.html.
+https://www.xenproject.org/security-policy.html.
 
 __HYPERVISOR_domctl (xen/include/public/domctl.h)
 
diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 1dfa1a2ec7..e286e65962 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -25,7 +25,7 @@ ov=4.0
 
 # update xendocs@xenbits docs generator to generate new stable branch
 #  docs too. commit to git.
-* make 13:37 <ijc> http://xenbits.xen.org/docs/4.2-testing/ is now live true
+* make 13:37 <ijc> https://xenbits.xen.org/docs/4.2-testing/ is now live true
 #14:17 <ijc> HOWTO: login to xenbits. become "xendocs" . cd cronjobs . edit
 #            xenbits-docs-all.sh in the obvious way. git commit
 	ssh root@xenbits.xen.org
diff --git a/stubdom/configure b/stubdom/configure
index 8f0bdcf191..da03da535a 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -582,7 +582,7 @@ PACKAGE_TARNAME='xen'
 PACKAGE_VERSION='4.14'
 PACKAGE_STRING='Xen Hypervisor Stub Domains 4.14'
 PACKAGE_BUGREPORT='xen-devel@lists.xen.org'
-PACKAGE_URL='http://www.xen.org/'
+PACKAGE_URL='https://www.xen.org/'
 
 ac_unique_file="xenstore-minios.cfg"
 ac_subst_vars='LTLIBOBJS
@@ -1376,7 +1376,7 @@ Use these variables to override the choices made by `configure' or to help
 it to find libraries and programs with nonstandard names/locations.
 
 Report bugs to <xen-devel@lists.xen.org>.
-Xen Hypervisor Stub Domains home page: <http://www.xen.org/>.
+Xen Hypervisor Stub Domains home page: <https://www.xen.org/>.
 _ACEOF
 ac_status=$?
 fi
@@ -4296,7 +4296,7 @@ Configuration files:
 $config_files
 
 Report bugs to <xen-devel@lists.xen.org>.
-Xen Hypervisor Stub Domains home page: <http://www.xen.org/>."
+Xen Hypervisor Stub Domains home page: <https://www.xen.org/>."
 
 _ACEOF
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index 9066dfaaa7..a2d514c021 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -3,7 +3,7 @@
 
 AC_PREREQ([2.67])
 AC_INIT([Xen Hypervisor Stub Domains], m4_esyscmd([../version.sh ../xen/Makefile]),
-    [xen-devel@lists.xen.org], [xen], [http://www.xen.org/])
+    [xen-devel@lists.xen.org], [xen], [https://www.xen.org/])
 AC_CONFIG_SRCDIR([xenstore-minios.cfg])
 AC_CONFIG_FILES([../config/Stubdom.mk])
 AC_CONFIG_AUX_DIR([../])
diff --git a/tools/configure b/tools/configure
index 13ee7f135c..4fa5f7b937 100755
--- a/tools/configure
+++ b/tools/configure
@@ -583,7 +583,7 @@ PACKAGE_TARNAME='xen'
 PACKAGE_VERSION='4.14'
 PACKAGE_STRING='Xen Hypervisor Tools 4.14'
 PACKAGE_BUGREPORT='xen-devel@lists.xen.org'
-PACKAGE_URL='http://www.xen.org/'
+PACKAGE_URL='https://www.xen.org/'
 
 ac_unique_file="libxl/libxl.c"
 # Factoring default headers for most tests.
@@ -1611,7 +1611,7 @@ Use these variables to override the choices made by `configure' or to help
 it to find libraries and programs with nonstandard names/locations.
 
 Report bugs to <xen-devel@lists.xen.org>.
-Xen Hypervisor Tools home page: <http://www.xen.org/>.
+Xen Hypervisor Tools home page: <https://www.xen.org/>.
 _ACEOF
 ac_status=$?
 fi
@@ -10373,7 +10373,7 @@ Configuration headers:
 $config_headers
 
 Report bugs to <xen-devel@lists.xen.org>.
-Xen Hypervisor Tools home page: <http://www.xen.org/>."
+Xen Hypervisor Tools home page: <https://www.xen.org/>."
 
 _ACEOF
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
diff --git a/tools/configure.ac b/tools/configure.ac
index f288d2cc3f..ea0272766f 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -3,7 +3,7 @@
 
 AC_PREREQ([2.67])
 AC_INIT([Xen Hypervisor Tools], m4_esyscmd([../version.sh ../xen/Makefile]),
-    [xen-devel@lists.xen.org], [xen], [http://www.xen.org/])
+    [xen-devel@lists.xen.org], [xen], [https://www.xen.org/])
 AC_CONFIG_SRCDIR([libxl/libxl.c])
 AC_CONFIG_FILES([
 ../config/Tools.mk
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d265ed46ad..1c398fdb6e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2490,7 +2490,7 @@ const struct hvm_function_table * __init start_vmx(void)
 
     /*
      * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
-     * (refer to http://xenbits.xen.org/xsa/advisory-60.html).
+     * (refer to https://xenbits.xen.org/xsa/advisory-60.html).
      */
     if ( cpu_has_vmx_ept && (cpu_has_vmx_pat || opt_force_ept) )
     {
diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
index d4a34de94c..4cdba79aba 100644
--- a/xen/include/public/io/blkif.h
+++ b/xen/include/public/io/blkif.h
@@ -118,7 +118,7 @@
  *
  *      The underlying storage is not affected by the direct IO memory
  *      lifetime bug.  See:
- *        http://lists.xen.org/archives/html/xen-devel/2012-12/msg01154.html
+ *        https://lists.xen.org/archives/html/xen-devel/2012-12/msg01154.html
  *
  *      Therefore this option gives the backend permission to use
  *      O_DIRECT, notwithstanding that bug.
-- 
2.11.0


