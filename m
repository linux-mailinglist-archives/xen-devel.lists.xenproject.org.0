Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8A8605F16
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426643.675224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTsv-0006Oa-Hv; Thu, 20 Oct 2022 11:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426643.675224; Thu, 20 Oct 2022 11:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTsv-0006M1-EG; Thu, 20 Oct 2022 11:38:49 +0000
Received: by outflank-mailman (input) for mailman id 426643;
 Thu, 20 Oct 2022 11:38:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+B4=2V=citrix.com=prvs=285f10a64=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1olTst-0006HM-QO
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:38:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0bd5ed3-506b-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 13:38:45 +0200 (CEST)
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
X-Inumbo-ID: c0bd5ed3-506b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666265925;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=HyEBvSsR+BA/QEyJKmgf3CwK36Yop80LjXHTORlueGA=;
  b=PqMnaLj1awOj2t6rUkPd5IrPqVDKwL65TXgZvUUTOMVEMqTjnpss7Ugg
   LROF99Vq+g8/QzyDf/xeSDHIANcP8sM3O/lqhLTe7XowBgXzzt8u1sqK1
   Aj/jFNYACHf1Zs+y9OFmdqlgmz7auA4G4L7laJmGjSZe4rciLvX/fsjPi
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82258612
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EMLJ9K0OYe4u2e6G7fbD5cVxkn2cJEfYwER7XKvMYLTBsI5bp2MGz
 GAbCz/VO/iIZGH2KY8jPNi28UNXv8CDydNiSwA5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlA5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVG4fhMPThu2
 8dAORYtMhaorbu5n4KCH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8+Dp4kkfjurX74azBC83qepLYt4niVxwt0uFToGIqPIIHaG5wP9qqej
 lLb7UnBCC8YDtfF4CKlol+vo7/hmRquDer+E5Xnr6U30TV/3Fc7KBAQT0r9nvC/hWa3QdcZI
 EsRkgIipLY/3FamRd78W1u/unHslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9c3QcXhNdbSU+u8jFgN01pTiWQYlTKfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT+FWyzyGskTKuMDirjUWawC
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKlHepXEyORDLgjqFfK0QfUYXY
 M3zTCpRJSxCVfQPIMSeHY/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7hjhIvd+V292
 48Ga6O3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrTac1s3Rj59V6K5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:QmfSjKOIFKKOFcBcTtejsMiBIKoaSvp037Eqv3oedfU1SL3+qy
 nAppQmPHPP5Ar5O0tQ/exoWpPwIk80nKQdieJ6UItKNDOW3VdAR7sC0WKN+VLd8lXFh4xg6Z
 s=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="82258612"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
Date: Thu, 20 Oct 2022 12:38:10 +0100
Message-ID: <20221020113810.20844-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

tl;dr This hunk was part of the patch emailed to xen-devel, but was missing
from what ultimately got committed.

https://lore.kernel.org/xen-devel/4164cb728313c3b9fc38cf5e9ecb790ac93a9600.1610748224.git.edvin.torok@citrix.com/
is the patch in question, but was part of a series that had threading issues.
I have a vague recollection that I sourced the commits from a local branch,
which clearly wasn't as up-to-date as I had thought.

Either way, it's my fault/mistake, and this hunk should have been part of what
got comitted.

Fixes: 00c48f57ab36 ("tools/oxenstored: Start live update process")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>

Found while reviewing the XenServer patchqueue.  This is low risk for 4.17 and
fixes a feature which we thought had been working since 4.15.
---
 tools/ocaml/xenstored/xenstored.ml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index d44ae673c42a..fc90fcdeb5d6 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -352,6 +352,11 @@ let _ =
 		rw_sock
 	) in
 
+	(* required for xenstore-control to detect availability of live-update *)
+	Store.mkdir store Perms.Connection.full_rights (Store.Path.of_string "/tool");
+	Store.write store Perms.Connection.full_rights
+		(Store.Path.of_string "/tool/xenstored") Sys.executable_name;
+
 	Sys.set_signal Sys.sighup (Sys.Signal_handle sighup_handler);
 	Sys.set_signal Sys.sigterm (Sys.Signal_handle (fun _ ->
 		info "Received SIGTERM";
-- 
2.11.0


