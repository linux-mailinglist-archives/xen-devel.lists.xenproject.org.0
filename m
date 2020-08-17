Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F8247236
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7k3h-0006MV-97; Mon, 17 Aug 2020 18:40:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7k3f-0006K5-KS
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:40:35 +0000
X-Inumbo-ID: ff0bf0b5-983a-40c0-ae17-e360a2ab2589
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff0bf0b5-983a-40c0-ae17-e360a2ab2589;
 Mon, 17 Aug 2020 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597689630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMCBsmOzak2flXbv7Zo/YlQyvKHgExmZi0mtL3kNGOc=;
 b=afxhTm9mWzEx2d89NiJyAXts3/Z8KQOOcGflEgWvKGsMvjbDu0k26oLQ
 jK3GiU8cjeU+aCibj883K1jpsLpQTWVzXdo0uNEKWTn71lChujJrSyxBO
 igVfAtu5trH1J8O+IYxCheao2awtWZGZMtigcu6X9SlKZvweZbKjklLWr I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mhKFR8RnMJvc76G+UaDC07GmXiAY1GpLIXajbdGiZuqySt0lUcrTjJt3TWIck+J5GXZ6l12+Mb
 d3ItWNEUHP414igvJAUPSymxFE8RQe7l5VCmgvEd67ypqlykwdvR9t2qnu2KdjIwVmCdtJfXeB
 SfSTRU0CzM2fsG1OfbAaBSe/NGP8eJRV20prGm4h+auBL4pkfb+I27HaEa5z18JJqr2Y/bBQQw
 w93NtqG3zWZQFA4VMoWx33Y/JkOrNO4bbs0ocs289rr/6YcvHy7xactmtkAYQH8EESOs9+d3xm
 6Ow=
X-SBRS: 2.7
X-MesageID: 24867841
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24867841"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/6] tools/ocaml/libs/xc: Fix ambiguous documentation
 comment
Date: Mon, 17 Aug 2020 19:39:49 +0100
Message-ID: <2ed1526e3f369f843871fcf166bf3e14ced36dfb.1597689211.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1597689211.git.edvin.torok@citrix.com>
References: <cover.1597689211.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl.mli | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 26ec7e59b1..f7f6ec570d 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -132,8 +132,10 @@ external interface_close : handle -> unit = "stub_xc_interface_close"
  * interface_open and interface_close or with_intf although mixing both
  * is possible *)
 val with_intf : (handle -> 'a) -> 'a
+
 (** [get_handle] returns the global handle used by [with_intf] *)
 val get_handle: unit -> handle option
+
 (** [close handle] closes the handle maintained by [with_intf]. This
  * should only be closed before process exit. It must not be called from
  * a function called directly or indirectly by with_intf as this
-- 
2.25.1


