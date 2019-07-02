Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124BB5D169
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 16:19:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiJaD-0005f5-6U; Tue, 02 Jul 2019 14:16:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ftjz=U7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hiJaB-0005ev-AV
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 14:16:31 +0000
X-Inumbo-ID: fc26d587-9cd3-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc26d587-9cd3-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 14:16:29 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nqOq9o5D7Dn6AJog2QVXzLQvaQOEvRiBfHOjMZ5Y+gtEXKQ+s1/jbDByBUojtl/fVuRmArbS25
 HB03toXM6CM+u+Zd2b96zmZMFxrYvkCwIWPzQx7CE3Nn6nZ3lQ9i/2gGm+Llc3VVwOExkZhP7y
 mgIJMDVETszMZZ+jxd9l32816jqSv9vWV5nfobvhLMW63EBTd12tGX2VrOhfVtNSBdTB25am01
 51QEvpiB1tcq7FlkO6tobrqmOfQxO7h9wuaoyUDKBGfN18WalTppEkxw6jd3tBGVeH23MmeS12
 Dfk=
X-SBRS: 2.7
X-MesageID: 2491413
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2491413"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 2 Jul 2019 14:53:27 +0100
Message-ID: <20190702135327.26543-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] MAINTAINERS: Add Anthony as libxl maintainer
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
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3JlYXRlIGEgbmV3IHNlY3Rpb24gd2l0aCBvbmx5IGxpYnhsLgoKU2lnbmVkLW9mZi1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgotLS0KSSd2ZSBjcmVhdGVk
IGEgbmV3IHNlY3Rpb24gZm9yIG9ubHkgbGlieGVubGlnaHQgYnV0IGlmIHlvdSB3b3VsZApwcmVm
ZXIgdG8gYWRkIG1lIGludG8gVE9PTFNUQUNLIGluc3RlYWQsIHRoYXQgbWlnaHQgYmUgb2suIEkg
anVzdApkb24ndCBoYXZlIG11Y2ggZXhwZXJpZW5jZSB3aXRoIHRoZSByZXN0IG9mIHRvb2xzLy4K
LS0tCiBNQUlOVEFJTkVSUyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggODgyZTRl
ZmEyMi4uYjhlNGRhYWU0MSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5F
UlMKQEAgLTI4NCw2ICsyODQsMTMgQEAgRjoJeGVuL2luY2x1ZGUve2tleGVjLGtpbWFnZX0uaAog
RjoJeGVuL2FyY2gveDg2L21hY2hpbmVfa2V4ZWMuYwogRjoJeGVuL2FyY2gveDg2L3g4Nl82NC9r
ZXhlY19yZWxvYy5TCiAKK0xJQlhFTkxJR0hUCitNOglJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KK006CVdlaSBMaXUgPHdsQHhlbi5vcmc+CitNOglBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KK1M6CVN1cHBvcnRlZAorRjoJdG9vbHMvbGli
eGwvCisKIExJVkVQQVRDSAogTToJS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPgogTToJUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+
Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
