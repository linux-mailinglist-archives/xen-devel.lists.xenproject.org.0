Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCCC37ADD0
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125900.237004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmf-0001S0-ND; Tue, 11 May 2021 18:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125900.237004; Tue, 11 May 2021 18:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmf-0001Pl-JY; Tue, 11 May 2021 18:07:05 +0000
Received: by outflank-mailman (input) for mailman id 125900;
 Tue, 11 May 2021 18:07:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWmd-0000hb-Pq
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:07:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14ac971e-46fa-49c1-92ac-8e32a0151c57;
 Tue, 11 May 2021 18:06:54 +0000 (UTC)
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
X-Inumbo-ID: 14ac971e-46fa-49c1-92ac-8e32a0151c57
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620756414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s2aBGweGMww0BGayyrFXSOFGfJlyB1IK+/pB0SJODd8=;
  b=KPwqoeBw7FcAG6ALJDV6OGEnwixHJZgTswzPxdpIdycbXu02xiMee1Ad
   WtuAQgqLu0AXTqdCreRLrV4n4JvaVPGzpSxuaRkhv62VcK3vW82G+ONCU
   py55mgrGoFVmH1szTMeWs+t1H8fdy6/b8SpkgGcApTSnNHgcuJHgSGtDt
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CC1zsBr/y4R9C1vbycjoeM34x5WOX++nyZQxUXs1mWepQr6wdkd9KquzfTu26GaKMb9rIV28Bf
 VkqG/NiLqAJN4s5eRzIwoLoat2Sg28bNpgLsomHzX5L1LW3VnVxzeo+x52Z60B8CoOKfP8aJj9
 9hbUSg/SUl7SFIi8EErjV5KuS3+leimLLtWmCd2dZkffUyHFDvjlohuiFu6b7tgDFpvZuyqKgL
 2Ko6WRTnV6OFSiT5M0C8ZoELGnm7T/eL9SSGF1gNtLxrOwrvvEgdSWd/mM804sYTPXD3jBbmm/
 Osw=
X-SBRS: 5.1
X-MesageID: 43579255
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AyA/h6DE+dEyxXvlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43579255"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 01/17] docs/designs/xenstore-migration.md: clarify that deletes are recursive
Date: Tue, 11 May 2021 19:05:14 +0100
Message-ID: <3d46415392bd8f90266b624a2ea9c220b3164d18.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 docs/designs/xenstore-migration.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 5f1155273e..87ef540918 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -364,7 +364,8 @@ record previously present).
 |              | 0x0001: read                                   |
 |              | 0x0002: written                                |
 |              |                                                |
-|              | The value will be zero for a deleted node      |
+|              | The value will be zero for a recursively       |
+|              | deleted node                                   |
 |              |                                                |
 | `perm-count` | The number (N) of node permission specifiers   |
 |              | (which will be 0 for a node deleted in a       |
-- 
2.25.1


