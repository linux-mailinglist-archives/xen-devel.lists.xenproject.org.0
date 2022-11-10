Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5381F624962
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 19:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442122.696155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otCI7-0000EP-2b; Thu, 10 Nov 2022 18:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442122.696155; Thu, 10 Nov 2022 18:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otCI6-0000Ac-VK; Thu, 10 Nov 2022 18:28:42 +0000
Received: by outflank-mailman (input) for mailman id 442122;
 Thu, 10 Nov 2022 18:28:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MRTG=3K=citrix.com=prvs=306de517a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1otCI5-0000AV-95
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 18:28:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e43e841-6125-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 19:28:39 +0100 (CET)
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
X-Inumbo-ID: 7e43e841-6125-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668104919;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IplWisakSoiSoSMaFnJnLlsHSTrJiLd8Gc+8zqQWMhs=;
  b=YFoudXFVA/Gi/K2/i8FqrnRyFOp+XidXY5C9tkwypHewbjNTQ67OLbd0
   c0AykJq5vFEYGRdXrR/D7rQUnfSyAP9VsY14NtR/bWhMueMWk0znnzjmO
   VNuO/c8sdbTylUJMa6ATGTzu3wtT/+iIg3WEnNsf+15mlao46W0xxtoet
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84184755
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XsRbWKuW+dqYHgzt0+dPgfr4pefnVFpeMUV32f8akzHdYApBsoF/q
 tZmKWuBPvveYTP0KdojOdzkoU0EscSDn4cxHQQ6qy00ECtE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaHzyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCA8xZVe+oeaP0L+SVbIwmN8JJdX2FdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XfjFGqVTTua0t5Gv7xw1tyrn9dtHSf7RmQO0Fwh/I+
 j2bogwVBDlHKduHwB6Uw0uzl/bjmhHadNwjSqGRo6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8wwufHHlCcTdHZ/QvrspwTjsvv
 neFls3kLSZiu7qUTTSa7Lj8kN+pEXFLdylYP3ZCFFZbpYm4yG0usv7RZvZcLKXys/vxICH96
 i/R8DYlrbwPkOdegs1X4mv7qz6ro5HISCs86QPWQn+p42tFWWK1W2C7wQOFtKgdde51WnHE5
 SFZwJbGsIjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meJ52u9B7cJZhNGiJObhKrgY/nGNYC6SbzYugn8N7KjovFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yUyZCUPQ2lGLqHL11PVoXKscWnD27eHwG507/jer2iIC9Fd/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnC/zGPSRHhURUUG6Wfe8JUKJ7LbfFA3QAnMyZb5mNscRmCspIwN/s+gw
 513chUwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:dCzgW6BAC7FAXhblHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.96,154,1665460800"; 
   d="scan'208";a="84184755"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [[PATCH for-4.17 v1]] tools/ocaml/xenstored/xenstored.ml: fix incorrect scope
Date: Thu, 10 Nov 2022 18:28:10 +0000
Message-ID: <356deefe1251ac353b346762df94a134c02508f0.1668104890.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A debug statement got introduced and code not reindented
(as it was part of a security fix and was trying to avoid that),
however that resulted in *only* the debug statement being part of the 'if',
and everything else outside of it.
This results in some unnecessary ring checks for domains which otherwise
have IO credit.

Remove the debug line.

Fixes: 42f0581a91 ("tools/oxenstored: Implement live update for socket connections")

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- bugfix for commit already in master

Changes since v3:
- new in v4
---
 tools/ocaml/xenstored/xenstored.ml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index ffd43a4eee..79f04178d8 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -476,7 +476,6 @@ let _ =
 	let ring_scan_checker dom =
 		(* no need to scan domains already marked as for processing *)
 		if not (Domain.get_io_credit dom > 0) then
-			debug "Looking up domid %d" (Domain.get_id dom);
 			let con = Connections.find_domain cons (Domain.get_id dom) in
 			if not (Connection.has_more_work con) then (
 				Process.do_output store cons domains con;
-- 
2.34.1


