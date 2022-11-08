Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532A8621866
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440124.694228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQch-0002qy-SN; Tue, 08 Nov 2022 15:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440124.694228; Tue, 08 Nov 2022 15:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQch-0002gc-OS; Tue, 08 Nov 2022 15:34:47 +0000
Received: by outflank-mailman (input) for mailman id 440124;
 Tue, 08 Nov 2022 15:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQcf-0001RY-UK
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:34:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dea3d7d7-5f7a-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:34:44 +0100 (CET)
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
X-Inumbo-ID: dea3d7d7-5f7a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=15Hgb+sdjhnccr4MqijiUOJ5Qs+Ch7oxO+EvADCJqio=;
  b=WRHD33tLaxdZpcMyw14p5Y07FIyljOBgqRa+zRGCsf5WGPeYiVR3OxiY
   J0LxnKadRNLGztmi9VCKkD3djdr2mTQLk1173EALzs2comeZh4y5Gx5wi
   fq+OhBRpZAvSDVx8fkzJsjvJsNodUG70b9c5qG+0RacwmPYgt9XwUANPZ
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 83996682
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mkHlkaMkoFRuu6PvrR2pl8FynXyQoLVcMsEvi/4bfWQNrUoj0mBRz
 GsXCDuHM/6OYDejc493b4i09h4C7J+BzN5nSAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5gxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s9RAEVl+
 eIjEi8qQTOd2+Tr2+uwUuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIJ8yguauwGX4aTpbgFmUubA28y7YywkZPL3FYIGEK4LUFZ89ckCwp
 HDeoG6oEw0mE92t5DuZ9Wy3h9HRtHauMG4VPOLhraM76LGJ/UQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O8037hucjJXd5QmxD3IBCDVGbbQOuMYoSBQw2
 1SOntevAiZg2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fHKhoAXpR7Rdex8N4GWkIHzRCqpy
 CiF+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBaJhsldzBO
 hW7VeZtCHh7bROXgVdfOd7ZNijT5fGI+BSMfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/9ga
 cvFKJ70VyhKYUiC8NZRb75DuYLHOwhknT+DLXwF50jPPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPToyiykYTWPEHqzGLkBQlbcCdhXsuu+5U/myzqClMOJVzNwsT5mdsJE7GJVYwO/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:4uIkDaiJIUIvYGmCAsI09W+H7XBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="83996682"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 02/15] tools/ocaml/libs/xc: OCaml 5.0 compatibility
Date: Tue, 8 Nov 2022 15:33:54 +0000
Message-ID: <b960f0c26e21c065dcbbd38cdedd2536fc52f31d.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Follow the manual to avoid naked pointers:
https://v2.ocaml.org/manual/intfc.html#ss:c-outside-head

No functional change, except on OCaml 5.0 where it is a bugfix.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Reason for inclusion in 4.17:
- bugfix for upcoming OCaml 5.0 compiler (already in beta)

Changes since v2:
- add Acked-by line
---
 tools/ocaml/libs/mmap/mmap_stubs.h  |  5 +++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 11 ++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/ocaml/libs/mmap/mmap_stubs.h b/tools/ocaml/libs/mmap/mmap_stubs.h
index 65e4239890..5c65cc86fb 100644
--- a/tools/ocaml/libs/mmap/mmap_stubs.h
+++ b/tools/ocaml/libs/mmap/mmap_stubs.h
@@ -30,4 +30,9 @@ struct mmap_interface
 	int len;
 };
 
+/* for compatibility with OCaml 4.02.3 */
+#ifndef Data_abstract_val
+#define Data_abstract_val(v) ((void*) Op_val(v))
+#endif
+
 #endif
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index a8789d19be..8cd11060ec 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -37,7 +37,7 @@
 
 #include "mmap_stubs.h"
 
-#define _H(__h) ((xc_interface *)(__h))
+#define _H(__h) *((xc_interface **) Data_abstract_val(__h))
 #define _D(__d) ((uint32_t)Int_val(__d))
 
 #ifndef Val_none
@@ -70,14 +70,15 @@ static void Noreturn failwith_xc(xc_interface *xch)
 CAMLprim value stub_xc_interface_open(void)
 {
 	CAMLparam0();
-        xc_interface *xch;
+	CAMLlocal1(result);
 
+	result = caml_alloc(1, Abstract_tag);
 	/* Don't assert XC_OPENFLAG_NON_REENTRANT because these bindings
 	 * do not prevent re-entrancy to libxc */
-        xch = xc_interface_open(NULL, NULL, 0);
-        if (xch == NULL)
+	_H(result) = xc_interface_open(NULL, NULL, 0);
+	if (_H(result) == NULL)
 		failwith_xc(NULL);
-        CAMLreturn((value)xch);
+	CAMLreturn(result);
 }
 
 
-- 
2.34.1


