Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B33285DA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91802.173223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlv3-00066L-Gl; Mon, 01 Mar 2021 17:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91802.173223; Mon, 01 Mar 2021 17:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlv3-00065l-Bn; Mon, 01 Mar 2021 17:01:17 +0000
Received: by outflank-mailman (input) for mailman id 91802;
 Mon, 01 Mar 2021 17:01:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGlv1-00062i-Be
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:01:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50051d20-5e5d-4b78-8405-480cb8369e0c;
 Mon, 01 Mar 2021 17:01:10 +0000 (UTC)
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
X-Inumbo-ID: 50051d20-5e5d-4b78-8405-480cb8369e0c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614618070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=X0/GB4CAinlU2bd2Nnz46CPqRoIoBMMDymVSzGexTAk=;
  b=d3kL2qWvT9eBr6HU+n7I1jrSSvpalLvXPQk8mHy7YGqqgPbsa/ObzCjJ
   3+J4LT8/8H1ZX/s8mRK6zgTl+tQnmXWyWPu72yU6eKqhrXKNdcJJ328xs
   Bpl2rEM8q89tUInt8xQbeGZENmgCfTgNqKsXMOrp462fY/8EvuNI5oJUC
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zAgcpBW/a8KTBJBGF7NGVISZB9r478yOLjt6pAwcTD1q0IR4gVQ4oIZ1DTmHvm7XWIcQ/P5EJ6
 BKpJRMwINT6IOfksguSm4K16ZhHh09j90uFfnZISXOhbPQIHTls5JnQe/EE3BrJyUtuLn89z6o
 5PonzNhOLWqar48+CWZ5bkbu7WutWSLqzfX2iZNFf2vS8Uen8iktpl8gBha46TvmauY6faBymI
 WQ6q1oFsgXqwDxeEdYRybA3xFarK9VDlBida+pYfkt6q7gTsDEFSfcaS7mo3wyHL9wwe6A/fjp
 f1M=
X-SBRS: 5.2
X-MesageID: 39657548
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="39657548"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] tools: Check for abi-compliance-checker in ./configure
Date: Mon, 1 Mar 2021 17:00:42 +0000
Message-ID: <20210301170044.23295-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210301170044.23295-1-andrew.cooper3@citrix.com>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This will be optional.  No functional change

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 config/Tools.mk.in |  1 +
 tools/configure    | 41 +++++++++++++++++++++++++++++++++++++++++
 tools/configure.ac |  1 +
 3 files changed, 43 insertions(+)

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index d47936686b..8e2268da3e 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -20,6 +20,7 @@ IASL                := @IASL@
 AWK                 := @AWK@
 FETCHER             := @FETCHER@
 ABI_DUMPER          := @ABI_DUMPER@
+ABI_COMPLIANCE_CHECKER := @ABI_COMPLIANCE_CHECKER@
 
 # Extra folder for libs/includes
 PREPEND_INCLUDES    := @PREPEND_INCLUDES@
diff --git a/tools/configure b/tools/configure
index bb5acf9d43..f77bf6f66d 100755
--- a/tools/configure
+++ b/tools/configure
@@ -682,6 +682,7 @@ OCAMLOPT
 OCAMLLIB
 OCAMLVERSION
 OCAMLC
+ABI_COMPLIANCE_CHECKER
 ABI_DUMPER
 INSTALL_DATA
 INSTALL_SCRIPT
@@ -5483,6 +5484,46 @@ $as_echo "no" >&6; }
 fi
 
 
+# Extract the first word of "abi-compliance-checker", so it can be a program name with args.
+set dummy abi-compliance-checker; ac_word=$2
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
+if ${ac_cv_path_ABI_COMPLIANCE_CHECKER+:} false; then :
+  $as_echo_n "(cached) " >&6
+else
+  case $ABI_COMPLIANCE_CHECKER in
+  [\\/]* | ?:[\\/]*)
+  ac_cv_path_ABI_COMPLIANCE_CHECKER="$ABI_COMPLIANCE_CHECKER" # Let the user override the test with a path.
+  ;;
+  *)
+  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+    ac_cv_path_ABI_COMPLIANCE_CHECKER="$as_dir/$ac_word$ac_exec_ext"
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
+ABI_COMPLIANCE_CHECKER=$ac_cv_path_ABI_COMPLIANCE_CHECKER
+if test -n "$ABI_COMPLIANCE_CHECKER"; then
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ABI_COMPLIANCE_CHECKER" >&5
+$as_echo "$ABI_COMPLIANCE_CHECKER" >&6; }
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
index 636e7077be..d84f2edcdc 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -311,6 +311,7 @@ AC_PROG_MAKE_SET
 AC_PROG_INSTALL
 AC_PATH_PROG([FLEX], [flex])
 AC_PATH_PROG([ABI_DUMPER], [abi-dumper])
+AC_PATH_PROG([ABI_COMPLIANCE_CHECKER], [abi-compliance-checker])
 AX_PATH_PROG_OR_FAIL([PERL], [perl])
 AX_PATH_PROG_OR_FAIL([AWK], [awk])
 
-- 
2.11.0


