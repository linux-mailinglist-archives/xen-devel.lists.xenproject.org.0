Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDBA34A87C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101828.195032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmnA-00008U-N1; Fri, 26 Mar 2021 13:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101828.195032; Fri, 26 Mar 2021 13:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmnA-00007p-J9; Fri, 26 Mar 2021 13:46:24 +0000
Received: by outflank-mailman (input) for mailman id 101828;
 Fri, 26 Mar 2021 13:46:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPmn8-0008UZ-No
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:46:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8284796-d387-47d0-b70e-f8555ff22a35;
 Fri, 26 Mar 2021 13:46:17 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c8284796-d387-47d0-b70e-f8555ff22a35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616766377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Om/4bT9oHNke97XURkVAntc90WqkaYpRePK16Ft6AU=;
  b=bXCA7vMp7VSeBvqxOK9n/aY3b3aiGuDvY1kpJBv2rLRVlc3xvO4m+Iht
   YgCyJWz/kl2z7YC8E69qDAxTW/1gg+rgn9Od5+cPOEnP+pU32k8cohNGY
   U55gKsegAtZJa8Na4n6ssSef6hh/yPrA4Vg5aFc4Pngo4cGQKhZri2VHO
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EbHClvXuJLYR3qeVXLH/U6L88lysVWI9IYjc507tBYIqBPqrR1mWGzqrRApddQHFQFRI+mZu0p
 dowk+I1Iqnmn5ONi64CYG5CWyo0J4dU3kTxfI+PdoUkzjS54xiVzVX8WxshrM+ohqyRPobcgKt
 qcCQJm1H7sc8UyifPIJbBeHff5t2vZn5/F3lCdNJ6KjtYB4abr1Q/JyCVqHdxQFTwoxKUz3uMG
 XmZ7ZwqzcFP0t55XMy3Z9mHKrIZqeISWxlHtrGe0g4e4fI3i5dKUQv+/fRZI5vFVzTLGyAkMDP
 lg8=
X-SBRS: 4.0
X-MesageID: 40222025
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rohZg6gW6cHI7a1BYz2Y8yWD1XBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.81,280,1610427600"; 
   d="scan'208";a="40222025"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [PATCH 1/2] tools: Drop gettext as a build dependency
Date: Fri, 26 Mar 2021 13:45:57 +0000
Message-ID: <20210326134558.7751-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210326134558.7751-1-andrew.cooper3@citrix.com>
References: <20210326134558.7751-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It has not been a dependency since at least 4.13.  Remove its mandatory check
from ./configure.

Annotate the dependency in the CI dockerfiles which are used for 4.14 or
older.  Drop the dependency from Alpine and Ubuntu Focal which are new
containers in 4.15, as well as dropping from CirrusCI and TravisCI.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Doug Goldstein <cardoe@cardoe.com>

CI Proofs of correctness.

  https://cirrus-ci.com/build/5554642114314240
  https://www.travis-ci.org/github/andyhhp/xen/builds/764514317 (x86 builds
  only.  ARM are permenantly broken now.)
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/277055305 (using
  test Alpine and Focal containers rebuild without gettext).

For 4.15.  This is long overdue, and simplifies everyones life building 4.15.
If this doesn't go into 4.15, then we can't shrink the alpine/focal containers.
---
 .cirrus.yml                                        |  2 +-
 .travis.yml                                        |  1 -
 README                                             |  1 -
 automation/build/alpine/3.12-arm64v8.dockerfile    |  1 -
 automation/build/alpine/3.12.dockerfile            |  1 -
 automation/build/centos/7.2.dockerfile             |  1 +
 automation/build/centos/7.dockerfile               |  1 +
 automation/build/debian/jessie-i386.dockerfile     |  1 +
 automation/build/debian/jessie.dockerfile          |  1 +
 automation/build/debian/stretch-i386.dockerfile    |  1 +
 automation/build/debian/stretch.dockerfile         |  1 +
 .../build/debian/unstable-arm64v8.dockerfile       |  1 +
 automation/build/debian/unstable-i386.dockerfile   |  1 +
 automation/build/debian/unstable.dockerfile        |  1 +
 automation/build/fedora/29.dockerfile              |  1 +
 automation/build/suse/opensuse-leap.dockerfile     |  1 +
 .../build/suse/opensuse-tumbleweed.dockerfile      |  1 +
 automation/build/ubuntu/bionic.dockerfile          |  1 +
 automation/build/ubuntu/focal.dockerfile           |  1 -
 automation/build/ubuntu/trusty.dockerfile          |  1 +
 automation/build/ubuntu/xenial.dockerfile          |  1 +
 .../tests-artifacts/alpine/3.12-arm64v8.dockerfile |  1 +
 tools/configure                                    | 49 ----------------------
 tools/configure.ac                                 |  2 -
 24 files changed, 17 insertions(+), 57 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 0efff6fa98..fdb1c9c94d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -4,7 +4,7 @@ freebsd_template: &FREEBSD_TEMPLATE
     APPEND_LIB: /usr/local/lib
     APPEND_INCLUDES: /usr/local/include
 
-  install_script: pkg install -y seabios gettext-tools gmake
+  install_script: pkg install -y seabios gmake
                                  pkgconf python libiconv bison perl5
                                  yajl lzo2 pixman argp-standalone
                                  libxml2 glib git
diff --git a/.travis.yml b/.travis.yml
index 2362475f7a..f3cd15b79f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -54,7 +54,6 @@ addons:
             - pkg-config
             - flex
             - bison
-            - gettext
             - acpica-tools
             - bin86
             - bcc
diff --git a/README b/README
index fad96672af..562b808080 100644
--- a/README
+++ b/README
@@ -63,7 +63,6 @@ provided by your OS distributor:
     * bridge-utils package (/sbin/brctl)
     * iproute package (/sbin/ip)
     * GNU bison and GNU flex
-    * GNU gettext
     * ACPI ASL compiler (iasl)
 
 In addition to the above there are a number of optional build
diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
index d6cdf5b200..01f0eedad4 100644
--- a/automation/build/alpine/3.12-arm64v8.dockerfile
+++ b/automation/build/alpine/3.12-arm64v8.dockerfile
@@ -22,7 +22,6 @@ RUN \
   apk add dev86 && \
   apk add dtc-dev && \
   apk add gcc  && \
-  apk add gettext && \
   apk add git && \
   apk add iasl && \
   apk add libaio-dev && \
diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index 94557e239b..8631d221db 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -23,7 +23,6 @@ RUN \
   apk add gcc  && \
   apk add g++ && \
   apk add clang  && \
-  apk add gettext && \
   apk add git && \
   apk add iasl && \
   apk add libaio-dev && \
diff --git a/automation/build/centos/7.2.dockerfile b/automation/build/centos/7.2.dockerfile
index af672a0be1..4baa097e31 100644
--- a/automation/build/centos/7.2.dockerfile
+++ b/automation/build/centos/7.2.dockerfile
@@ -26,6 +26,7 @@ RUN rpm --rebuilddb && \
         python-devel \
         libuuid-devel \
         pkgconfig \
+        # gettext for Xen < 4.13
         gettext \
         flex \
         bison \
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index 5f83c97d0c..e688a4cece 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -24,6 +24,7 @@ RUN yum -y install \
         python-devel \
         libuuid-devel \
         pkgconfig \
+        # gettext for Xen < 4.13
         gettext \
         flex \
         bison \
diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index 66a6abb381..3f86d91f63 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -28,6 +28,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 808d6272e4..2f19adcad3 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -26,6 +26,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index 7b6f8eff69..c7840d33ab 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -29,6 +29,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index e3bace1f87..e2ee14e201 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/unstable-arm64v8.dockerfile b/automation/build/debian/unstable-arm64v8.dockerfile
index 8455d67b72..4409f596e1 100644
--- a/automation/build/debian/unstable-arm64v8.dockerfile
+++ b/automation/build/debian/unstable-arm64v8.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         libfdt-dev \
diff --git a/automation/build/debian/unstable-i386.dockerfile b/automation/build/debian/unstable-i386.dockerfile
index 86ff3585df..06ffb97384 100644
--- a/automation/build/debian/unstable-i386.dockerfile
+++ b/automation/build/debian/unstable-i386.dockerfile
@@ -29,6 +29,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
index 9a10ee08d6..bd61cd12c2 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/unstable.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index 5482952523..027b93ceaf 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -17,6 +17,7 @@ RUN dnf -y install \
         python3-devel \
         libuuid-devel \
         pkgconfig \
+        # gettext for Xen < 4.13
         gettext \
         flex \
         bison \
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 685dd5d7fd..573fbd8ae4 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -22,6 +22,7 @@ RUN zypper install -y --no-recommends \
         flex \
         gcc \
         gcc-c++ \
+        # gettext-tools for Xen < 4.13
         gettext-tools \
         git \
         glib2-devel \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 061173e751..8ff7b9b5ce 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -22,6 +22,7 @@ RUN zypper install -y --no-recommends \
         flex \
         gcc \
         gcc-c++ \
+        # gettext-tools for Xen < 4.13
         gettext-tools \
         git \
         glib2-devel \
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index 408063698c..406a97494c 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 90b4001a6a..6c4565745b 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -26,7 +26,6 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
-        gettext \
         acpica-tools \
         bin86 \
         bcc \
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index fd377d948f..b4b2f85e73 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index 57a71eb8c6..82171d856d 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -27,6 +27,7 @@ RUN apt-get update && \
         pkg-config \
         flex \
         bison \
+        # gettext for Xen < 4.13
         gettext \
         acpica-tools \
         bin86 \
diff --git a/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
index 9457009452..7eb1f22940 100644
--- a/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
+++ b/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
@@ -19,6 +19,7 @@ RUN \
   apk add dbus && \
   apk add bash && \
   apk add python2 && \
+  # gettext for Xen < 4.13
   apk add gettext && \
   apk add zlib && \
   apk add ncurses && \
diff --git a/tools/configure b/tools/configure
index 99d08a4d81..33814b24b3 100755
--- a/tools/configure
+++ b/tools/configure
@@ -689,7 +689,6 @@ INSTALL_PROGRAM
 SET_MAKE
 AWK
 IASL
-XGETTEXT
 FLEX
 BISON
 PERL
@@ -847,7 +846,6 @@ PYTHON
 PERL
 BISON
 FLEX
-XGETTEXT
 AS86
 LD86
 BCC
@@ -1597,7 +1595,6 @@ Some influential environment variables:
   PERL        Path to Perl parser
   BISON       Path to Bison parser generator
   FLEX        Path to Flex lexical analyser generator
-  XGETTEXT    Path to xgetttext tool
   AS86        Path to as86 tool
   LD86        Path to ld86 tool
   BCC         Path to bcc tool
@@ -4738,7 +4735,6 @@ LDFLAGS="$PREPEND_LDFLAGS $LDFLAGS $APPEND_LDFLAGS"
 
 
 
-
 # Checks for programs.
 ac_ext=c
 ac_cpp='$CPP $CPPFLAGS'
@@ -7846,51 +7842,6 @@ fi
 
 if ! $rump; then
 
-# Extract the first word of "xgettext", so it can be a program name with args.
-set dummy xgettext; ac_word=$2
-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
-$as_echo_n "checking for $ac_word... " >&6; }
-if ${ac_cv_path_XGETTEXT+:} false; then :
-  $as_echo_n "(cached) " >&6
-else
-  case $XGETTEXT in
-  [\\/]* | ?:[\\/]*)
-  ac_cv_path_XGETTEXT="$XGETTEXT" # Let the user override the test with a path.
-  ;;
-  *)
-  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-for as_dir in $PATH
-do
-  IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-    for ac_exec_ext in '' $ac_executable_extensions; do
-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_path_XGETTEXT="$as_dir/$ac_word$ac_exec_ext"
-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
-    break 2
-  fi
-done
-  done
-IFS=$as_save_IFS
-
-  test -z "$ac_cv_path_XGETTEXT" && ac_cv_path_XGETTEXT="no"
-  ;;
-esac
-fi
-XGETTEXT=$ac_cv_path_XGETTEXT
-if test -n "$XGETTEXT"; then
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $XGETTEXT" >&5
-$as_echo "$XGETTEXT" >&6; }
-else
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
-$as_echo "no" >&6; }
-fi
-
-
-if test x"${XGETTEXT}" = x"no"
-then
-    as_fn_error $? "Unable to find xgettext, please install xgettext" "$LINENO" 5
-fi
 case "$host_cpu" in
 i[3456]86|x86_64|aarch64)
     # Extract the first word of "iasl", so it can be a program name with args.
diff --git a/tools/configure.ac b/tools/configure.ac
index 636e7077be..6414fcbb44 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -298,7 +298,6 @@ AC_ARG_VAR([PYTHON], [Path to the Python parser])
 AC_ARG_VAR([PERL], [Path to Perl parser])
 AC_ARG_VAR([BISON], [Path to Bison parser generator])
 AC_ARG_VAR([FLEX], [Path to Flex lexical analyser generator])
-AC_ARG_VAR([XGETTEXT], [Path to xgetttext tool])
 AC_ARG_VAR([AS86], [Path to as86 tool])
 AC_ARG_VAR([LD86], [Path to ld86 tool])
 AC_ARG_VAR([BCC], [Path to bcc tool])
@@ -381,7 +380,6 @@ AS_IF([test "$cross_compiling" != yes], [
 
 if ! $rump; then
 
-AX_PATH_PROG_OR_FAIL([XGETTEXT], [xgettext])
 dnl as86, ld86, bcc and iasl are only required when the host system is x86*.
 dnl "host" here means the platform on which the hypervisor and tools is
 dnl going to run, not the platform on which we are building (known as
-- 
2.11.0


