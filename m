Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DAD31A1E4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84314.158124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYz-0001JQ-Ck; Fri, 12 Feb 2021 15:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84314.158124; Fri, 12 Feb 2021 15:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYz-0001IS-7q; Fri, 12 Feb 2021 15:40:57 +0000
Received: by outflank-mailman (input) for mailman id 84314;
 Fri, 12 Feb 2021 15:40:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaYx-0000ix-Oy
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:40:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99fc8af0-a1b5-402c-8def-985e4836a66a;
 Fri, 12 Feb 2021 15:40:17 +0000 (UTC)
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
X-Inumbo-ID: 99fc8af0-a1b5-402c-8def-985e4836a66a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=lsfae/ZYMUTtHloQUljGbO2IeSsesWCyE9jSqEqM860=;
  b=PJ+jrVw2narBucB2O8lVOiUQP7ECcfL9NAcYtcWXamn3TauhlcsIv7UZ
   xBmOnqrAGGK6iwhXUdzLQeiCwhNaNcMUHVXb5jqLq6H61oXouOeygKa2X
   vov6d5KnhjX2he4rUe1OnzdYAnUyLLkjEB4Jemd0OO62Hz16M4ZKCJcFr
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yEUYvSEFIim5Jdww6A+wuZKUVYJBIVxGk/i2RPOJroGXupap9BtvLjgddQdvX1G0VHk2n+RkTA
 OhwPiTmolbklJkbR6p1H0zPWtnYB6lgJ+CfEGD8l1UUVMo4ny20DCUvksAbbDipn5eLBehOXsQ
 m+CF6O7Jo0ksSqTgC702zvQOuEdb57hY6od5ZkM5wBUBn0qosfdajOcyVRCm1IU3EvzYpFbtuF
 /dGkkjUraGXyhe2E819M1jGeZyinFk/mebU4g9S/bstypBwq2c8DkA/yLOIgJrvp5PESSaSUYe
 GX4=
X-SBRS: 5.2
X-MesageID: 38508888
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="38508888"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 08/10] tools: Check for abi-dumper in ./configure
Date: Fri, 12 Feb 2021 15:39:51 +0000
Message-ID: <20210212153953.4582-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This will be optional.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 config/Tools.mk.in |  1 +
 tools/configure    | 41 +++++++++++++++++++++++++++++++++++++++++
 tools/configure.ac |  1 +
 3 files changed, 43 insertions(+)

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 48bd9ab731..d47936686b 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -19,6 +19,7 @@ BCC                 := @BCC@
 IASL                := @IASL@
 AWK                 := @AWK@
 FETCHER             := @FETCHER@
+ABI_DUMPER          := @ABI_DUMPER@
 
 # Extra folder for libs/includes
 PREPEND_INCLUDES    := @PREPEND_INCLUDES@
diff --git a/tools/configure b/tools/configure
index e63ca3797d..bb5acf9d43 100755
--- a/tools/configure
+++ b/tools/configure
@@ -682,6 +682,7 @@ OCAMLOPT
 OCAMLLIB
 OCAMLVERSION
 OCAMLC
+ABI_DUMPER
 INSTALL_DATA
 INSTALL_SCRIPT
 INSTALL_PROGRAM
@@ -5442,6 +5443,46 @@ $as_echo "no" >&6; }
 fi
 
 
+# Extract the first word of "abi-dumper", so it can be a program name with args.
+set dummy abi-dumper; ac_word=$2
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
+if ${ac_cv_path_ABI_DUMPER+:} false; then :
+  $as_echo_n "(cached) " >&6
+else
+  case $ABI_DUMPER in
+  [\\/]* | ?:[\\/]*)
+  ac_cv_path_ABI_DUMPER="$ABI_DUMPER" # Let the user override the test with a path.
+  ;;
+  *)
+  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+    ac_cv_path_ABI_DUMPER="$as_dir/$ac_word$ac_exec_ext"
+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
+
+  ;;
+esac
+fi
+ABI_DUMPER=$ac_cv_path_ABI_DUMPER
+if test -n "$ABI_DUMPER"; then
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ABI_DUMPER" >&5
+$as_echo "$ABI_DUMPER" >&6; }
+else
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+fi
+
+
 # Extract the first word of "perl", so it can be a program name with args.
 set dummy perl; ac_word=$2
 { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
diff --git a/tools/configure.ac b/tools/configure.ac
index 6b611deb13..636e7077be 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -310,6 +310,7 @@ AC_PROG_CC
 AC_PROG_MAKE_SET
 AC_PROG_INSTALL
 AC_PATH_PROG([FLEX], [flex])
+AC_PATH_PROG([ABI_DUMPER], [abi-dumper])
 AX_PATH_PROG_OR_FAIL([PERL], [perl])
 AX_PATH_PROG_OR_FAIL([AWK], [awk])
 
-- 
2.11.0


