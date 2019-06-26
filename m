Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD156B6C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 15:59:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg8P7-0007In-E3; Wed, 26 Jun 2019 13:56:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehih=UZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hg8P5-0007I1-OY
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 13:56:03 +0000
X-Inumbo-ID: 228604f5-981a-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 228604f5-981a-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 13:56:03 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SYOG+juS/zpIgf1y2oaRxEhn9LtHaxkMmlKIHXyV/7wv/adlCTJVYjCfnVXfOZJcIAx807gpOb
 OYYv0qcfMVnckiZ3Hnm8qBYDR3Fqiriw0dXO2UdjR7FGGBVuOmF0jeIP0ZZ2TJNgQZdBGZZpT/
 F7LOwcUMONSY2EwwyFfLKBfOXma/rXzRFjPVcVkCJInWBBN/B48ENaCxyObOSyDkwbwxnwBLGY
 VwyA9EttrhS0C4I57VB6OEloFD4VjhUpYbCZXjc/YlCk63z+ZjegiBt/YpS3kELwGGQWr6KWZS
 aTI=
X-SBRS: 2.7
X-MesageID: 2273621
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2273621"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Jun 2019 15:55:46 +0200
Message-ID: <20190626135546.50665-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190626135546.50665-1-roger.pau@citrix.com>
References: <20190626135546.50665-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/5] travis: pass a correct CC/CXX if
 CROSS_COMPILE is defined
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgYjQxNjY2ZjJjMSBYZW4gbm8gbG9uZ2VyIG92ZXJ3cml0ZXMgdGhlIG5hbWVzIG9mIHRo
ZSBidWlsZAp0b29sY2hhaW4gdXRpbGl0aWVzIHJlcXVpcmVkIGR1cmluZyB0aGUgYnVpbGQgcHJv
Y2VzcywgYW5kIGluc3RlYWQKdXNlcyB0aGUgdmFsdWVzIGZyb20gdGhlIGVudmlyb25tZW50LgoK
SW4gdGhhdCBjYXNlLCBpZiB0aGUgdXNlciB3YW50cyB0byBkZWZpbmUgQ0Mgb3Igb3RoZXIgdmFy
aWFibGVzIHRvCnBvaW50IHRvIHNwZWNpZmljIHRvb2xjaGFpbiB1dGlsaXRpZXMgdG8gdXNlIGl0
IG11c3QgYWxzbyB0YWtlIGludG8KYWNjb3VudCB0aGF0IHN1Y2ggdmFyaWFibGVzIG11c3QgYmUg
cHJlZml4ZWQgd2l0aCBDUk9TU19DT01QSUxFLCBzaW5jZQpYZW4gd2lsbCBubyBsb25nZXIgZG8g
dGhpcy4KCkZpeGVzOiBiNDE2NjZmMmMxICgnY29uZmlnOiBkb24ndCBoYXJkY29kZSB0b29sY2hh
aW4gYmluYXJpZXMnKQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KLS0tCkNjOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Ci0t
LQogc2NyaXB0cy90cmF2aXMtYnVpbGQgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmF2aXMtYnVpbGQgYi9zY3JpcHRz
L3RyYXZpcy1idWlsZAppbmRleCAwY2IxNWE4OWU0Li5hMjY0ZTI4NmIyIDEwMDc1NQotLS0gYS9z
Y3JpcHRzL3RyYXZpcy1idWlsZAorKysgYi9zY3JpcHRzL3RyYXZpcy1idWlsZApAQCAtMSw2ICsx
LDE0IEBACiAjIS9iaW4vYmFzaCAtZXgKIAorIyBTZXQgSE9TVHtDQy9DWFh9IGluIGNhc2Ugd2Ug
YXJlIGNyb3NzIGJ1aWxkaW5nCitleHBvcnQgSE9TVENDPSR7Q0N9CitleHBvcnQgSE9TVENYWD0k
e0NYWH0KKyMgUHJlZml4IGVudmlyb25tZW50IENDL0NYWCB3aXRoIENST1NTX0NPTVBJTEUgaWYg
cHJlc2VudAorZXhwb3J0IENDPSR7Q1JPU1NfQ09NUElMRX0ke0NDfQorZXhwb3J0IENYWD0ke0NS
T1NTX0NPTVBJTEV9JHtDWFh9CisKICRDQyAtLXZlcnNpb24KK1tbICIke0NDfSIgIT0gIiR7SE9T
VENDfSIgXV0gJiYgJEhPU1RDQyAtLXZlcnNpb24KIAogIyByYW5kb20gY29uZmlnIG9yIGRlZmF1
bHQgY29uZmlnCiBpZiBbWyAiJHtSQU5EQ09ORklHfSIgPT0gInkiIF1dOyB0aGVuCi0tIAoyLjIw
LjEgKEFwcGxlIEdpdC0xMTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
