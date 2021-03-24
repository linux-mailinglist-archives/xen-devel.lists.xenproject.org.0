Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B0347DAE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101072.193007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6NA-0006yk-7c; Wed, 24 Mar 2021 16:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101072.193007; Wed, 24 Mar 2021 16:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6NA-0006yN-1y; Wed, 24 Mar 2021 16:28:44 +0000
Received: by outflank-mailman (input) for mailman id 101072;
 Wed, 24 Mar 2021 16:28:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6N7-0006yE-Te
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:28:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6N7-0005Gr-RP
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:28:41 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6N7-0001lv-QZ
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:28:41 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lP6N6-0005Ub-4r; Wed, 24 Mar 2021 16:28:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=g2CGi3AJQnTLTaMdIFMGJ/off184UKmv2NDKJ5aFPew=; b=hFZmW8xlGsTbysewovdNoqZJQb
	sh8JnF3ZfMjHORVT23H16UPodto83JWBxKCTlMa3Yw0DyTVZA4mrARSpjtvgtVrZFDG0+YXYGS8ya
	MkIqfa93bO++zk1edJBqRW7CvwYWZFzT95jMXPYag328/p0woK2oROS/ZAccv2qqrJFw=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
Subject: [PATCH 2/2] Branching: Rerun autoconf to put version right
Date: Wed, 24 Mar 2021 16:28:31 +0000
Message-Id: <20210324162831.7587-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324162831.7587-1-iwj@xenproject.org>
References: <20210324162831.7587-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 configure         | 18 +++++++++---------
 docs/configure    | 18 +++++++++---------
 stubdom/configure | 18 +++++++++---------
 tools/configure   | 18 +++++++++---------
 4 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/configure b/configure
index a2789ae480..62f6c2d47a 100755
--- a/configure
+++ b/configure
@@ -1,6 +1,6 @@
 #! /bin/sh
 # Guess values for system-dependent variables and create Makefiles.
-# Generated by GNU Autoconf 2.69 for Xen Hypervisor 4.15.
+# Generated by GNU Autoconf 2.69 for Xen Hypervisor 4.16.
 #
 # Report bugs to <xen-devel@lists.xen.org>.
 #
@@ -579,8 +579,8 @@ MAKEFLAGS=
 # Identity of this package.
 PACKAGE_NAME='Xen Hypervisor'
 PACKAGE_TARNAME='xen'
-PACKAGE_VERSION='4.15'
-PACKAGE_STRING='Xen Hypervisor 4.15'
+PACKAGE_VERSION='4.16'
+PACKAGE_STRING='Xen Hypervisor 4.16'
 PACKAGE_BUGREPORT='xen-devel@lists.xen.org'
 PACKAGE_URL='https://www.xen.org/'
 
@@ -1236,7 +1236,7 @@ if test "$ac_init_help" = "long"; then
   # Omit some internal or obsolete options to make the list less imposing.
   # This message is too long to be a string in the A/UX 3.1 sh.
   cat <<_ACEOF
-\`configure' configures Xen Hypervisor 4.15 to adapt to many kinds of systems.
+\`configure' configures Xen Hypervisor 4.16 to adapt to many kinds of systems.
 
 Usage: $0 [OPTION]... [VAR=VALUE]...
 
@@ -1302,7 +1302,7 @@ fi
 
 if test -n "$ac_init_help"; then
   case $ac_init_help in
-     short | recursive ) echo "Configuration of Xen Hypervisor 4.15:";;
+     short | recursive ) echo "Configuration of Xen Hypervisor 4.16:";;
    esac
   cat <<\_ACEOF
 
@@ -1403,7 +1403,7 @@ fi
 test -n "$ac_init_help" && exit $ac_status
 if $ac_init_version; then
   cat <<\_ACEOF
-Xen Hypervisor configure 4.15
+Xen Hypervisor configure 4.16
 generated by GNU Autoconf 2.69
 
 Copyright (C) 2012 Free Software Foundation, Inc.
@@ -1420,7 +1420,7 @@ cat >config.log <<_ACEOF
 This file contains any messages produced by compilers while
 running configure, to aid debugging if configure makes a mistake.
 
-It was created by Xen Hypervisor $as_me 4.15, which was
+It was created by Xen Hypervisor $as_me 4.16, which was
 generated by GNU Autoconf 2.69.  Invocation command line was
 
   $ $0 $@
@@ -2868,7 +2868,7 @@ cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
 # report actual input values of CONFIG_FILES etc. instead of their
 # values after options handling.
 ac_log="
-This file was extended by Xen Hypervisor $as_me 4.15, which was
+This file was extended by Xen Hypervisor $as_me 4.16, which was
 generated by GNU Autoconf 2.69.  Invocation command line was
 
   CONFIG_FILES    = $CONFIG_FILES
@@ -2922,7 +2922,7 @@ _ACEOF
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
 ac_cs_config="`$as_echo "$ac_configure_args" | sed 's/^ //; s/[\\""\`\$]/\\\\&/g'`"
 ac_cs_version="\\
-Xen Hypervisor config.status 4.15
+Xen Hypervisor config.status 4.16
 configured by $0, generated by GNU Autoconf 2.69,
   with options \\"\$ac_cs_config\\"
 
diff --git a/docs/configure b/docs/configure
index e9c040cb84..569bd4c2ff 100755
--- a/docs/configure
+++ b/docs/configure
@@ -1,6 +1,6 @@
 #! /bin/sh
 # Guess values for system-dependent variables and create Makefiles.
-# Generated by GNU Autoconf 2.69 for Xen Hypervisor Documentation 4.15.
+# Generated by GNU Autoconf 2.69 for Xen Hypervisor Documentation 4.16.
 #
 # Report bugs to <xen-devel@lists.xen.org>.
 #
@@ -579,8 +579,8 @@ MAKEFLAGS=
 # Identity of this package.
 PACKAGE_NAME='Xen Hypervisor Documentation'
 PACKAGE_TARNAME='xen'
-PACKAGE_VERSION='4.15'
-PACKAGE_STRING='Xen Hypervisor Documentation 4.15'
+PACKAGE_VERSION='4.16'
+PACKAGE_STRING='Xen Hypervisor Documentation 4.16'
 PACKAGE_BUGREPORT='xen-devel@lists.xen.org'
 PACKAGE_URL='https://www.xen.org/'
 
@@ -1224,7 +1224,7 @@ if test "$ac_init_help" = "long"; then
   # Omit some internal or obsolete options to make the list less imposing.
   # This message is too long to be a string in the A/UX 3.1 sh.
   cat <<_ACEOF
-\`configure' configures Xen Hypervisor Documentation 4.15 to adapt to many kinds of systems.
+\`configure' configures Xen Hypervisor Documentation 4.16 to adapt to many kinds of systems.
 
 Usage: $0 [OPTION]... [VAR=VALUE]...
 
@@ -1286,7 +1286,7 @@ fi
 
 if test -n "$ac_init_help"; then
   case $ac_init_help in
-     short | recursive ) echo "Configuration of Xen Hypervisor Documentation 4.15:";;
+     short | recursive ) echo "Configuration of Xen Hypervisor Documentation 4.16:";;
    esac
   cat <<\_ACEOF
 
@@ -1387,7 +1387,7 @@ fi
 test -n "$ac_init_help" && exit $ac_status
 if $ac_init_version; then
   cat <<\_ACEOF
-Xen Hypervisor Documentation configure 4.15
+Xen Hypervisor Documentation configure 4.16
 generated by GNU Autoconf 2.69
 
 Copyright (C) 2012 Free Software Foundation, Inc.
@@ -1404,7 +1404,7 @@ cat >config.log <<_ACEOF
 This file contains any messages produced by compilers while
 running configure, to aid debugging if configure makes a mistake.
 
-It was created by Xen Hypervisor Documentation $as_me 4.15, which was
+It was created by Xen Hypervisor Documentation $as_me 4.16, which was
 generated by GNU Autoconf 2.69.  Invocation command line was
 
   $ $0 $@
@@ -2821,7 +2821,7 @@ cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
 # report actual input values of CONFIG_FILES etc. instead of their
 # values after options handling.
 ac_log="
-This file was extended by Xen Hypervisor Documentation $as_me 4.15, which was
+This file was extended by Xen Hypervisor Documentation $as_me 4.16, which was
 generated by GNU Autoconf 2.69.  Invocation command line was
 
   CONFIG_FILES    = $CONFIG_FILES
@@ -2875,7 +2875,7 @@ _ACEOF
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
 ac_cs_config="`$as_echo "$ac_configure_args" | sed 's/^ //; s/[\\""\`\$]/\\\\&/g'`"
 ac_cs_version="\\
-Xen Hypervisor Documentation config.status 4.15
+Xen Hypervisor Documentation config.status 4.16
 configured by $0, generated by GNU Autoconf 2.69,
   with options \\"\$ac_cs_config\\"
 
diff --git a/stubdom/configure b/stubdom/configure
index 6068f58d12..aa48df986d 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -1,6 +1,6 @@
 #! /bin/sh
 # Guess values for system-dependent variables and create Makefiles.
-# Generated by GNU Autoconf 2.69 for Xen Hypervisor Stub Domains 4.15.
+# Generated by GNU Autoconf 2.69 for Xen Hypervisor Stub Domains 4.16.
 #
 # Report bugs to <xen-devel@lists.xen.org>.
 #
@@ -579,8 +579,8 @@ MAKEFLAGS=
 # Identity of this package.
 PACKAGE_NAME='Xen Hypervisor Stub Domains'
 PACKAGE_TARNAME='xen'
-PACKAGE_VERSION='4.15'
-PACKAGE_STRING='Xen Hypervisor Stub Domains 4.15'
+PACKAGE_VERSION='4.16'
+PACKAGE_STRING='Xen Hypervisor Stub Domains 4.16'
 PACKAGE_BUGREPORT='xen-devel@lists.xen.org'
 PACKAGE_URL='https://www.xen.org/'
 
@@ -1265,7 +1265,7 @@ if test "$ac_init_help" = "long"; then
   # Omit some internal or obsolete options to make the list less imposing.
   # This message is too long to be a string in the A/UX 3.1 sh.
   cat <<_ACEOF
-\`configure' configures Xen Hypervisor Stub Domains 4.15 to adapt to many kinds of systems.
+\`configure' configures Xen Hypervisor Stub Domains 4.16 to adapt to many kinds of systems.
 
 Usage: $0 [OPTION]... [VAR=VALUE]...
 
@@ -1331,7 +1331,7 @@ fi
 
 if test -n "$ac_init_help"; then
   case $ac_init_help in
-     short | recursive ) echo "Configuration of Xen Hypervisor Stub Domains 4.15:";;
+     short | recursive ) echo "Configuration of Xen Hypervisor Stub Domains 4.16:";;
    esac
   cat <<\_ACEOF
 
@@ -1444,7 +1444,7 @@ fi
 test -n "$ac_init_help" && exit $ac_status
 if $ac_init_version; then
   cat <<\_ACEOF
-Xen Hypervisor Stub Domains configure 4.15
+Xen Hypervisor Stub Domains configure 4.16
 generated by GNU Autoconf 2.69
 
 Copyright (C) 2012 Free Software Foundation, Inc.
@@ -1499,7 +1499,7 @@ cat >config.log <<_ACEOF
 This file contains any messages produced by compilers while
 running configure, to aid debugging if configure makes a mistake.
 
-It was created by Xen Hypervisor Stub Domains $as_me 4.15, which was
+It was created by Xen Hypervisor Stub Domains $as_me 4.16, which was
 generated by GNU Autoconf 2.69.  Invocation command line was
 
   $ $0 $@
@@ -4295,7 +4295,7 @@ cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
 # report actual input values of CONFIG_FILES etc. instead of their
 # values after options handling.
 ac_log="
-This file was extended by Xen Hypervisor Stub Domains $as_me 4.15, which was
+This file was extended by Xen Hypervisor Stub Domains $as_me 4.16, which was
 generated by GNU Autoconf 2.69.  Invocation command line was
 
   CONFIG_FILES    = $CONFIG_FILES
@@ -4349,7 +4349,7 @@ _ACEOF
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
 ac_cs_config="`$as_echo "$ac_configure_args" | sed 's/^ //; s/[\\""\`\$]/\\\\&/g'`"
 ac_cs_version="\\
-Xen Hypervisor Stub Domains config.status 4.15
+Xen Hypervisor Stub Domains config.status 4.16
 configured by $0, generated by GNU Autoconf 2.69,
   with options \\"\$ac_cs_config\\"
 
diff --git a/tools/configure b/tools/configure
index bb5acf9d43..99d08a4d81 100755
--- a/tools/configure
+++ b/tools/configure
@@ -1,6 +1,6 @@
 #! /bin/sh
 # Guess values for system-dependent variables and create Makefiles.
-# Generated by GNU Autoconf 2.69 for Xen Hypervisor Tools 4.15.
+# Generated by GNU Autoconf 2.69 for Xen Hypervisor Tools 4.16.
 #
 # Report bugs to <xen-devel@lists.xen.org>.
 #
@@ -580,8 +580,8 @@ MAKEFLAGS=
 # Identity of this package.
 PACKAGE_NAME='Xen Hypervisor Tools'
 PACKAGE_TARNAME='xen'
-PACKAGE_VERSION='4.15'
-PACKAGE_STRING='Xen Hypervisor Tools 4.15'
+PACKAGE_VERSION='4.16'
+PACKAGE_STRING='Xen Hypervisor Tools 4.16'
 PACKAGE_BUGREPORT='xen-devel@lists.xen.org'
 PACKAGE_URL='https://www.xen.org/'
 
@@ -1417,7 +1417,7 @@ if test "$ac_init_help" = "long"; then
   # Omit some internal or obsolete options to make the list less imposing.
   # This message is too long to be a string in the A/UX 3.1 sh.
   cat <<_ACEOF
-\`configure' configures Xen Hypervisor Tools 4.15 to adapt to many kinds of systems.
+\`configure' configures Xen Hypervisor Tools 4.16 to adapt to many kinds of systems.
 
 Usage: $0 [OPTION]... [VAR=VALUE]...
 
@@ -1483,7 +1483,7 @@ fi
 
 if test -n "$ac_init_help"; then
   case $ac_init_help in
-     short | recursive ) echo "Configuration of Xen Hypervisor Tools 4.15:";;
+     short | recursive ) echo "Configuration of Xen Hypervisor Tools 4.16:";;
    esac
   cat <<\_ACEOF
 
@@ -1693,7 +1693,7 @@ fi
 test -n "$ac_init_help" && exit $ac_status
 if $ac_init_version; then
   cat <<\_ACEOF
-Xen Hypervisor Tools configure 4.15
+Xen Hypervisor Tools configure 4.16
 generated by GNU Autoconf 2.69
 
 Copyright (C) 2012 Free Software Foundation, Inc.
@@ -2108,7 +2108,7 @@ cat >config.log <<_ACEOF
 This file contains any messages produced by compilers while
 running configure, to aid debugging if configure makes a mistake.
 
-It was created by Xen Hypervisor Tools $as_me 4.15, which was
+It was created by Xen Hypervisor Tools $as_me 4.16, which was
 generated by GNU Autoconf 2.69.  Invocation command line was
 
   $ $0 $@
@@ -10752,7 +10752,7 @@ cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
 # report actual input values of CONFIG_FILES etc. instead of their
 # values after options handling.
 ac_log="
-This file was extended by Xen Hypervisor Tools $as_me 4.15, which was
+This file was extended by Xen Hypervisor Tools $as_me 4.16, which was
 generated by GNU Autoconf 2.69.  Invocation command line was
 
   CONFIG_FILES    = $CONFIG_FILES
@@ -10815,7 +10815,7 @@ _ACEOF
 cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
 ac_cs_config="`$as_echo "$ac_configure_args" | sed 's/^ //; s/[\\""\`\$]/\\\\&/g'`"
 ac_cs_version="\\
-Xen Hypervisor Tools config.status 4.15
+Xen Hypervisor Tools config.status 4.16
 configured by $0, generated by GNU Autoconf 2.69,
   with options \\"\$ac_cs_config\\"
 
-- 
2.20.1


