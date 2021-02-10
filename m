Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9031685D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 14:54:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83607.155986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pwT-00080f-Ok; Wed, 10 Feb 2021 13:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83607.155986; Wed, 10 Feb 2021 13:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pwT-00080G-LF; Wed, 10 Feb 2021 13:54:05 +0000
Received: by outflank-mailman (input) for mailman id 83607;
 Wed, 10 Feb 2021 13:54:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08uA=HM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9pwS-00080B-Fo
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 13:54:04 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bc84721-3a5a-4feb-9ee3-b785dbd0bddf;
 Wed, 10 Feb 2021 13:54:03 +0000 (UTC)
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
X-Inumbo-ID: 6bc84721-3a5a-4feb-9ee3-b785dbd0bddf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612965243;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=RrarCaL9pi9yussd3vp/1m7VSdSMaXQNb/eS0BJptNk=;
  b=AslQ+jX0vX+fv2+3Sad/o7PfsxQNGgCxmkRcgNxepAdOue4pkOYlyonZ
   t0LdLLYsp70resbdvgMFC+pWjTlDed0oN/HnBUc6ITSQRb04j5z71AbY1
   CQyxRC4synSRni8c/AelKOSPjb/MtL3RjpYctzFAGvabvKKE1f4VCsTiT
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WIxDXhesAKCygVA1AKvENqXn7Mr8GPspEYgnMo9r1Pll+y+sC3SR8XoGCxELy5yI2/HSKJV8CE
 nyhWNwg5gBHDvqxACdBRO3Vp64cTub/Wman/cxULaAgFCzskuh/gWflUNVWgvBAnp07fL/wmF+
 pY+T/yTEvCZ9HXHNaZcmMltSwU3rYfnBVZUnUUXuhUZfkwNSzsnL0XqHJ/qvl8Z74FVCWptZA/
 DYtGqKYlJKdLY0z8cyJiFRsjk3PYSCWLti0ZQzGcRAlOXln8kcB2fqS6PPB/Wxtprt+G9NMgdZ
 lfw=
X-SBRS: 5.1
X-MesageID: 37147615
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="37147615"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.15] tools/libxl: Document where the magic MAC numbers come from
Date: Wed, 10 Feb 2021 13:53:35 +0000
Message-ID: <20210210135335.29180-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Matches the comment in the xl-network-configuration manpage.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_nic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index 144e9e23e1..0b45469dca 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -73,6 +73,7 @@ static int libxl__device_nic_setdefault(libxl__gc *gc, uint32_t domid,
         libxl_uuid_generate(&uuid);
         r = libxl_uuid_bytearray(&uuid);
 
+        /* Generate a random MAC address, with Xen's OUI (00:16:3e) */
         nic->mac[0] = 0x00;
         nic->mac[1] = 0x16;
         nic->mac[2] = 0x3e;
-- 
2.11.0


