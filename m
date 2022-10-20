Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6E2606659
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 18:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426978.675767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olYpP-0004dC-Id; Thu, 20 Oct 2022 16:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426978.675767; Thu, 20 Oct 2022 16:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olYpP-0004ap-F9; Thu, 20 Oct 2022 16:55:31 +0000
Received: by outflank-mailman (input) for mailman id 426978;
 Thu, 20 Oct 2022 16:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LaG4=2V=citrix.com=prvs=285635b8e=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1olYpN-0004ai-FA
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 16:55:29 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdf194b3-5097-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 18:55:27 +0200 (CEST)
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
X-Inumbo-ID: fdf194b3-5097-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666284926;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OCBu0vUP3JpjZrFBNRbFle7ZV/pcVcLzjOv+Nrmf73g=;
  b=UBgvrU1SPQMXit+hMSzthGqADGQYirWm9IbUsu4ezMMIR40RF8dwnDYY
   r+KjaTbMxm/6pRCJWikZzNGnhkma+VqZL5Gf0vddbkLC+NE8BGEkA5daF
   UEjF3VOu6mLfBoyBvgptUetLl8kic6BkFEZ0l9mGTLuWQsoiFsMLprbNO
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 83171108
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AN0fb6Nx6cdymQrvrR28l8FynXyQoLVcMsEvi/4bfWQNrUpzgzFVn
 WQXUWyHa67eYTHyc4t3Odi/9hgA7ZaBm4NjQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayo4GtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eNJQeysN4XWZ32
 uVCDTUmUAqtqdCM3+fuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnN1sJCZR4gOCygXrXeDxEslOF46Ew5gA/ySQhi+GyaYONKrRmQ+1+nka3u
 lnqr13aH0slEfK66iO9wmqV07qncSTTB9tJSezQGuRRqEKX7nweDlsRT1TTidm0jFSvHe1WL
 UM88zAr66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZNYcIrnNU7Tjsr0
 hmOhdyBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZQIc5enGr900tz3WFPNmO5CvoPPHIy6ll
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkeS+F0e5eI1cFh
 XM/XisIvfdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxDOhjm9zBRyyvxlU
 Xt+TSpLJS9AYZmLMRLsH7tNuVPV7npWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt0EAFe/iFyNq
 b53bpLSoz0GCbGWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l9UaOOkOx8JNE+90mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:3DtL9qhGJZAzkRqffkm7Ewbql3BQXtQji2hC6mlwRA09TySZ//
 rOoB19726TtN9xYgBGpTnuAtjifZqxz/FICOoqTNOftWvdyQmVxehZhOOIqVCNJ8SXzJ8l6U
 4KSchD4bPLY2SS9fyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.95,199,1661832000"; 
   d="scan'208";a="83171108"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.17] tools/ocaml/xenstored: fix live update exception
Date: Thu, 20 Oct 2022 17:54:55 +0100
Message-ID: <12d90632bf881e96e0b6c256df193f00df187dc1.1666284745.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

During live update we will load the /tool/xenstored path from the previous binary,
and then try to mkdir /tool again which will fail with EEXIST.
Check for existence of the path before creating it.

The write call to /tool/xenstored should not need any changes
(and we do want to overwrite any previous path, in case it changed).

Prior to 7110192b1df6 live update would work only if the binary path was
specified, and with 7110192b1df6 and this live update also works when
no binary path is specified in `xenstore-control live-update`.

Fixes: 7110192b1df6 ("tools/oxenstored: Fix Oxenstored Live Update")
Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/xenstored.ml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index fc90fcdeb5..3299fe73f7 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -353,7 +353,9 @@ let _ =
 	) in
 
 	(* required for xenstore-control to detect availability of live-update *)
-	Store.mkdir store Perms.Connection.full_rights (Store.Path.of_string "/tool");
+	let tool_path = Store.Path.of_string "/tool" in
+	if not (Store.path_exists store tool_path) then
+					Store.mkdir store Perms.Connection.full_rights tool_path;
 	Store.write store Perms.Connection.full_rights
 		(Store.Path.of_string "/tool/xenstored") Sys.executable_name;
 

base-commit: 0c06760be3dc3f286015e18c4b1d1694e55da026
-- 
2.34.1


