Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89535244FBE
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 00:13:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6hwE-000899-6M; Fri, 14 Aug 2020 22:12:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uEIT=BY=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k6hwC-000891-1z
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 22:12:36 +0000
X-Inumbo-ID: ac1994c2-799c-4656-a432-1ce28cd9734c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac1994c2-799c-4656-a432-1ce28cd9734c;
 Fri, 14 Aug 2020 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597443155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMCBsmOzak2flXbv7Zo/YlQyvKHgExmZi0mtL3kNGOc=;
 b=ZlKPQRZfhRC0Hf0U9ZiW8CyAKhhc5FiGxOZs3ZeNZiiMJqpUkYp/jS2N
 MQ295C29rc7RGWzvpaB/HrbqqbV9YuNoM0QXn8Or/GenA02gvZi6UyG0h
 M3/CPz6S1AH7zsmY9ikJT1NAnLKakSnzBt23t7OmBlruYiPGF6UY0MGGx I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8o2irhUK6ivwW2LwCmgsbAmHRyIZbk6sxuvhZuSNn4hpq4reWoYmwVZjpdYsbegpOvYh31Y/Hj
 rX+Trj8uYTTx/i4yPQdMJQmtRcBjheyi35nNkQLcHyp+LrpwlApFUKINMzME+WM65kibFpmjpy
 uaAmcWvvzGt4XDR8wSHZJoI+EKggsKuabmWL1oDzSpbodHTmwPHms1AUncYSEsffTm5ethXrQu
 wtqJx64k+3PW09sJvNXExBQ54LZNxhjrhDnHpuDVltZR/o77dlitTX8AO3AVrXCC8fbsYL6rCv
 cgc=
X-SBRS: 2.7
X-MesageID: 24917745
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24917745"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 1/6] tools/ocaml/libs/xc: Fix ambiguous documentation
 comment
Date: Fri, 14 Aug 2020 23:11:41 +0100
Message-ID: <f9a32b2d1012ab49572f18722122502342e052ea.1597442238.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1597442238.git.edvin.torok@citrix.com>
References: <cover.1597442238.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FTLPEX02CAS02.citrite.net (10.13.99.123) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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


