Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047337AE3E
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125959.237087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWyy-0007ie-IN; Tue, 11 May 2021 18:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125959.237087; Tue, 11 May 2021 18:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWyy-0007gC-Ei; Tue, 11 May 2021 18:19:48 +0000
Received: by outflank-mailman (input) for mailman id 125959;
 Tue, 11 May 2021 18:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWyw-0007fz-6U
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:19:46 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a4fe988-ddc3-46cd-ab49-5b2f1a4c3dcd;
 Tue, 11 May 2021 18:19:44 +0000 (UTC)
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
X-Inumbo-ID: 7a4fe988-ddc3-46cd-ab49-5b2f1a4c3dcd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620757184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mfyFDJgIkLfaf/q9LEu49lHIlJRkjQUjve9JlgsoDR8=;
  b=fGYhQP2ai9DgOHZnAjk2WWVyFQjmJ6XaPuIHTgU3ZfgbcVcfuYn4MEkd
   g920QAUan/R0iZZ9faOMaskSd5Fe+sfa4OdqkDf68PHUA/o47nJU18q5U
   vawgbDNLs494HbRi9Oas8M4EE/TfpC/3l5ybNJCvSVPqD0V2eIeQ0q02M
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iyilpD8SzCuioWNXOA9zFQdv0QcR3XhXht5LopOS6cVHbkq7tv7tK6I/yHXjb/ouc6mgLZvkvm
 Vp0V5STd83/IReHf6355A4PJeDdXxclLhlEbM6eX/TORACxQJbqoPVWC9GLOntlt4cYetwS/LX
 5hgPDAVyhtIlp+jxOznnPz2jNGB13Ux4NtM+q2MYYtdTri0/mpbF1m4h2uEIqq/PFsmjTFsSRq
 yHomvODWg6ssASAGw9fxtJDw9HE5ZP70w5jMVtJtozSajL4Wzge+1rvn4zwV8d8Tju8Pem+hTU
 70s=
X-SBRS: 5.1
X-MesageID: 43676913
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:msXP7qz674nE3o0i9+mmKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43676913"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 17/17] tools/ocaml/libs/mmap: Clean up unused read/write
Date: Tue, 11 May 2021 19:05:30 +0100
Message-ID: <9bfd0989994953f08142d26cbe5a22651a1faa2a.1620755943.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xenmmap is only modified by the ring functions,
these functions are unused.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/xenmmap.ml      |  5 ----
 tools/ocaml/libs/mmap/xenmmap.mli     |  4 ---
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 41 ---------------------------
 3 files changed, 50 deletions(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap.ml b/tools/ocaml/libs/mmap/xenmmap.ml
index af258942a0..e17a62e607 100644
--- a/tools/ocaml/libs/mmap/xenmmap.ml
+++ b/tools/ocaml/libs/mmap/xenmmap.ml
@@ -24,11 +24,6 @@ type mmap_map_flag = SHARED | PRIVATE
 (* mmap: fd -> prot_flag -> map_flag -> length -> offset -> interface *)
 external mmap': Unix.file_descr -> mmap_prot_flag -> mmap_map_flag
 		-> int -> int -> mmap_interface = "stub_mmap_init"
-(* read: interface -> start -> length -> data *)
-external read: mmap_interface -> int -> int -> string = "stub_mmap_read"
-(* write: interface -> data -> start -> length -> unit *)
-external write: mmap_interface -> string -> int -> int -> unit = "stub_mmap_write"
-(* getpagesize: unit -> size of page *)
 external unmap': mmap_interface -> unit = "stub_mmap_final"
 (* getpagesize: unit -> size of page *)
 let make ?(unmap=unmap') interface = interface, unmap
diff --git a/tools/ocaml/libs/mmap/xenmmap.mli b/tools/ocaml/libs/mmap/xenmmap.mli
index 075b24eab4..abf2a50131 100644
--- a/tools/ocaml/libs/mmap/xenmmap.mli
+++ b/tools/ocaml/libs/mmap/xenmmap.mli
@@ -19,10 +19,6 @@ type mmap_interface
 type mmap_prot_flag = RDONLY | WRONLY | RDWR
 type mmap_map_flag = SHARED | PRIVATE
 
-external read : mmap_interface -> int -> int -> string = "stub_mmap_read"
-external write : mmap_interface -> string -> int -> int -> unit
-               = "stub_mmap_write"
-
 val mmap : Unix.file_descr -> mmap_prot_flag -> mmap_map_flag -> int -> int -> t
 val unmap : t -> unit
 
diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index e8d2d6add5..633e1fa916 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -96,47 +96,6 @@ CAMLprim value stub_mmap_final(value intf)
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_mmap_read(value intf, value start, value len)
-{
-	CAMLparam3(intf, start, len);
-	CAMLlocal1(data);
-	int c_start;
-	int c_len;
-
-	c_start = Int_val(start);
-	c_len = Int_val(len);
-
-	if (c_start > Intf_val(intf)->len)
-		caml_invalid_argument("start invalid");
-	if (c_start + c_len > Intf_val(intf)->len)
-		caml_invalid_argument("len invalid");
-
-	data = caml_alloc_string(c_len);
-	memcpy((char *) data, Intf_val(intf)->addr + c_start, c_len);
-
-	CAMLreturn(data);
-}
-
-CAMLprim value stub_mmap_write(value intf, value data,
-                               value start, value len)
-{
-	CAMLparam4(intf, data, start, len);
-	int c_start;
-	int c_len;
-
-	c_start = Int_val(start);
-	c_len = Int_val(len);
-
-	if (c_start > Intf_val(intf)->len)
-		caml_invalid_argument("start invalid");
-	if (c_start + c_len > Intf_val(intf)->len)
-		caml_invalid_argument("len invalid");
-
-	memcpy(Intf_val(intf)->addr + c_start, (char *) data, c_len);
-
-	CAMLreturn(Val_unit);
-}
-
 CAMLprim value stub_mmap_getpagesize(value unit)
 {
 	CAMLparam1(unit);
-- 
2.25.1


