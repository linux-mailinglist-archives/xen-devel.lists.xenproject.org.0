Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6971A101D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 17:23:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLq47-0005gw-S1; Tue, 07 Apr 2020 15:23:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DsZW=5X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jLq47-0005gf-19
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 15:23:03 +0000
X-Inumbo-ID: a8d342d0-78e3-11ea-9e09-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8d342d0-78e3-11ea-9e09-bc764e2007e4;
 Tue, 07 Apr 2020 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586272978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zpD/qULcUWjnXe5Pei47zmPvZSaeufrHyKCovEQ8IY0=;
 b=fBP35TLK1W/7PZUQGPLuBQDyE/1dS3G8hMgq+nJfTCgrE2B8oNJ+B30z
 5zTkLiCo/P1IFfN2L7Mj9WkQ4zCYhByMmsmKqzAW5b2v2ZKVPIblSkG/Y
 GUG6+MICz7W/hpKtC+l5Pl2kHsE6rJULOcbrNMuiT5X4NglJXI93mzfoP I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kIpJUdp/ueeziAdKh5CGN0J6Of7NJxXM7lkAmrFurtwL8Nti4/kW70mNzCLO/YPcuUrkSBnyju
 hOF6Jspwi3Xkj/jXa0FPpfunPEQRgsAup8Eto8FuPJqlIK/0knMN1H429JH7VaUHURz/KgN/Ea
 XkzvyPWPQZ+Up7cJv2GF+q9Hh27bPlEZxtTGJyjkroE/fsDBaWYSEoVsuZggKe23bYe1EDPO1h
 JgFukRRiHec3wCj2Fjqoe8xuvbxriSu1WnXngqD3AbMNLELlA7KKs70KShHxsWTh9Saf1EMVzV
 PKk=
X-SBRS: 2.7
X-MesageID: 15534906
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,355,1580792400"; d="scan'208";a="15534906"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 3/3] MAINTAINERS: Add xen-usb.c to Xen section
Date: Tue, 7 Apr 2020 16:22:37 +0100
Message-ID: <20200407152237.1468704-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200407152237.1468704-1-anthony.perard@citrix.com>
References: <20200407152237.1468704-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Paul Durrant <paul@xen.org>
Message-Id: <20200406165043.1447837-1-anthony.perard@citrix.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d156d73b31e..839959f7e4ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -440,6 +440,7 @@ F: hw/9pfs/xen-9p*
 F: hw/char/xen_console.c
 F: hw/display/xenfb.c
 F: hw/net/xen_nic.c
+F: hw/usb/xen-usb.c
 F: hw/block/xen*
 F: hw/block/dataplane/xen*
 F: hw/xen/
-- 
Anthony PERARD


