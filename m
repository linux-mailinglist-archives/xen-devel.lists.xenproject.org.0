Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC865854ED
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 20:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377743.611065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUSU-0005DL-0z; Fri, 29 Jul 2022 18:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377743.611065; Fri, 29 Jul 2022 18:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUST-0005AT-UG; Fri, 29 Jul 2022 18:11:33 +0000
Received: by outflank-mailman (input) for mailman id 377743;
 Fri, 29 Jul 2022 18:11:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UihI=YC=citrix.com=prvs=202bfa127=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oHUSS-0005AN-Q2
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 18:11:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dce3f90b-0f69-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 20:11:31 +0200 (CEST)
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
X-Inumbo-ID: dce3f90b-0f69-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659118291;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fbnyQbuVinN9b4ozPR7RGmkrCgeSjUTEZSqSwPVZFkw=;
  b=fYEvUK97P9qx3GB3fnHdk0x721XgxPXyvOm5hVQbScbEx4KUdu/ewk5B
   sopnP5/KSTAuEKIgP9Y6ifseY8jXh76tvG69MQLkn2VSX1HLqZdDtqfS1
   Y0pw3nuW7G48m2fvelW4W3dCuqCLb6bKUGYMstyva2BsxIM48PctJ8t9h
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77390064
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0Si6WK0EnHs4uULhWfbD5YNxkn2cJEfYwER7XKvMYLTBsI5bp2QBx
 jNLCzyOaPzfN2Dzet1/aIvlp0xXuMTRxtRnHQVlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrc8kI35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj669jKFM0LI4Zw8w0BlwTr
 vARLm0tYjnW0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRBnMfRxJfEsQEpU9tOypmmP+Y3tTr1f9Sa8fvDeInVQpjuSF3Nz9cc7JXN97gB+km
 VnZxkLZBD0jDsK+8G/Qmp6rrrCWxn6qMG4IL5Wn8tZ6jVvVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZmRMTM4kpcw3fBZp0
 WLUxN/gA2FPvJTAHBpx6YyoQSOO1Tk9dDFfNHdZHFZdsrEPs6lo0EuRE48L/Lqdy4SsRGqum
 23iQD0W3e17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGWxFADpU
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWn8oyX4JtAMv2shTKuMDirjUWazC
 HI/RCsLvMMDVJdURfQfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDK6ENVVTRfJhwjFzRlz+ZzTz
 L/BLq5A+15GVvk8pNd3Ls9BuYIWKtcWnz+KHMCjlEj6uVdcDVbMIYo43JK1RrhRxMu5TM/9r
 r6z6+PiJ81jbdDD
IronPort-HdrOrdr: A9a23:z27dQK4mr3S8gzXnXQPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="77390064"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>
Subject: [RFC PATCH] tools/configure: require OCaml >= 4.06.1 for oxenstored
Date: Fri, 29 Jul 2022 19:10:44 +0100
Message-ID: <ac885ce2b63159d26d857dc3e53cf8aa63ae3646.1659118200.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

OCaml 4.06.1 is widely available in distributions: https://repology.org/project/ocaml/versions

oxenstored already includes some compatibility code to be able to run on
versions older than 4.06, however this is slightly less efficient than
just using the new features in 4.06 standard library:
https://lore.kernel.org/xen-devel/b94cd2ad099486678609909e12b045c54abb2f27.camel@citrix.com/

The OCaml version in stubdom/ is unchanged for now as it is unclear how
this used. Typically to run OCaml code as a stubdom one would use the mirage
tooling to build a unikernel, which handles cross-compilation using
Dune.
The unikernel itself also uses Solo5 instead of MiniOS, so the OCaml
code in stubdom/ is probably stale.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>
---
 tools/configure    | 2 +-
 tools/configure.ac | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/configure b/tools/configure
index 41deb7fb96..8f391e2da4 100755
--- a/tools/configure
+++ b/tools/configure
@@ -6765,7 +6765,7 @@ else
                      -e 's/[^0-9]//g'`
 
 
-  ax_compare_version_B=`echo "4.02.0" | sed -e 's/\([0-9]*\)/Z\1Z/g' \
+  ax_compare_version_B=`echo "4.06.1" | sed -e 's/\([0-9]*\)/Z\1Z/g' \
                      -e 's/Z\([0-9]\)Z/Z0\1Z/g' \
                      -e 's/Z\([0-9][0-9]\)Z/Z0\1Z/g' \
                      -e 's/Z\([0-9][0-9][0-9]\)Z/Z0\1Z/g' \
diff --git a/tools/configure.ac b/tools/configure.ac
index 32cbe6bd3c..7518199ec8 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -310,7 +310,7 @@ AS_IF([test "x$ocamltools" = "xy"], [
             AC_MSG_ERROR([Ocaml tools enabled, but missing ocamlopt or ocamlfind])])
         ocamltools="n"
     ], [
-        AX_COMPARE_VERSION([$OCAMLVERSION], [lt], [4.02.0], [
+        AX_COMPARE_VERSION([$OCAMLVERSION], [lt], [4.06.1], [
             AS_IF([test "x$enable_ocamltools" = "xyes"], [
                 AC_MSG_ERROR([Your version of OCaml: $OCAMLVERSION is not supported])])
             ocamltools="n"
-- 
2.34.1


