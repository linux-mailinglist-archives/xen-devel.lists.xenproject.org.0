Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E08B75041
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:54:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqe9h-0002fQ-Vc; Thu, 25 Jul 2019 13:51:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqe9h-0002fL-3d
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:51:37 +0000
X-Inumbo-ID: 50f557bd-aee3-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 50f557bd-aee3-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 13:51:35 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /mzbpsdHtpYr5TL0PxeWME5JAn8A34wH2F36ArJ7GJ1vz3LnZQK2kZMvU0r+PQu9dAqhY0nNtn
 wnPsm6hnqA9PiHFTxnpKkIfcIr1wi1tXdEt3UGjXtJMVP7IUR4tymH1tfgpram/UOGAxq2doTf
 AoK5JBXl3UYiCcZlW5gOiYRXyvwJDlZkpctcKa3weAV7CGr2O/mElIzdnd+DQEhdDTXNyGLcli
 qYwmNzZ2hWC3kj8Oc1WPkmIJhE1vyyPuD4dCR0TXdYmDMSqws3qP6YSkEhowqlA/RHPUoeX2jQ
 jl0=
X-SBRS: 2.7
X-MesageID: 3553751
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3553751"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Jul 2019 15:51:12 +0200
Message-ID: <20190725135112.83569-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tboot: remove maintainers and declare orphaned
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2FuZyBXZWkgSW50ZWwgZW1haWwgYWRkcmVzcyBoYXMgYmVlbiBib3VuY2luZyBmb3Igc29tZSB0
aW1lIG5vdywgYW5kCnRoZSBvdGhlciBtYWludGFpbmVyIGlzIG5vbi1yZXNwb25zaXZlIHRvIHBh
dGNoZXMgWzBdLCBzbyByZW1vdmUKbWFpbnRhaW5lcnMgYW5kIGRlY2xhcmUgSU5URUwoUikgVFJV
U1RFRCBFWEVDVVRJT04gVEVDSE5PTE9HWSAoVFhUKQpvcnBoYW5lZC4KClswXSBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDA1
NjMuaHRtbAoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Q2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRp
bUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IEdhbmcgV2VpIDxnYW5nLndl
aUBpbnRlbC5jb20+CkNjOiBTaGFuZSBXYW5nIDxzaGFuZS53YW5nQGludGVsLmNvbT4KLS0tCiBN
QUlOVEFJTkVSUyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXgg
NGU3NjgwOTM0Yi4uODlhMDFiNzEwYiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJ
TlRBSU5FUlMKQEAgLTI0MCw5ICsyNDAsNyBAQCBTOglNYWludGFpbmVkCiBGOgl0b29scy9nb2xh
bmcKIAogSU5URUwoUikgVFJVU1RFRCBFWEVDVVRJT04gVEVDSE5PTE9HWSAoVFhUKQotTToJR2Fu
ZyBXZWkgPGdhbmcud2VpQGludGVsLmNvbT4KLU06CVNoYW5lIFdhbmcgPHNoYW5lLndhbmdAaW50
ZWwuY29tPgotUzoJU3VwcG9ydGVkCitTOglPcnBoYW5lZAogRjoJeGVuL2FyY2gveDg2L3Rib290
LmMKIEY6CXhlbi9pbmNsdWRlL2FzbS14ODYvdGJvb3QuaAogCi0tIAoyLjIwLjEgKEFwcGxlIEdp
dC0xMTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
