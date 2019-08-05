Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74556819E8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 14:46:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hucKX-0000c3-He; Mon, 05 Aug 2019 12:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6VNZ=WB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hucKW-0000bn-C7
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 12:43:12 +0000
X-Inumbo-ID: 92092122-b77e-11e9-a4cf-43c0d977d3b7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92092122-b77e-11e9-a4cf-43c0d977d3b7;
 Mon, 05 Aug 2019 12:43:06 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: viAMqxWudlJ/+nqyH8tCi6VbslHEgqqs4OCGgBQhSK5SCeJsIClGUgoW1RypU1BAm4Fm5pxtul
 cxMqgpzrd3b65zFHQvjTseuYcUYrGWdPPK69WqpfD0reXnmlAFQ5AuUdWt61pjHdiYtZkZnd7B
 8RBCzNd8vIQYu9fLry2osbpCYajjRvJUxfjPLtgroR7zJe6I0IujU6aSmeaaYDS455Z5o1GJVd
 rGP45wWQpKoxAKVXaDUmImjX+hOdCyL+EALdFJlC54mmJmF9p3bRSF3ZRGtF666WZgQOYAo7iQ
 sAU=
X-SBRS: 2.7
X-MesageID: 3859931
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,349,1559534400"; 
   d="scan'208";a="3859931"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 5 Aug 2019 13:42:57 +0100
Message-ID: <20190805124301.12887-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] x86/boot: Cleanup
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmFyaW91cyBiaXRzIG9mIGNsZWFudXAgaW50ZW5kZWQgdG8gbWFrZSB0aGUgYm9vdCBzZXF1ZW5j
ZSBjbGVhcmVyIHRvIGZvbGxvdywKYW5kIHJlbW92ZSBiaXRzIG9mIGFzbSB3aGljaCBzaG91bGRu
J3QgYmUgd3JpdHRlbiBpbiBhc20uCgpObyBjaGFuZ2VzIHRvIGZ1bmN0aW9uYWxpdHkuCgpBbmRy
ZXcgQ29vcGVyICg0KToKICB4ODYvYXNtOiBJbmNsdWRlIG1zci1pbmRleC5oIHJhdGhlciB0aGFu
IG1zci5oCiAgeDg2L2Jvb3Q6IE1pbm9yIGltcHJvdmVtZW50cyB0byBlZmlfYXJjaF9wb3N0X2V4
aXRfYm9vdCgpCiAgeDg2L2Rlc2M6IFNob3J0ZW4gYm9vdF97LGNvbWF0X31nZHRbXSB2YXJpYWJs
ZSBuYW1lcwogIHg4Ni9kZXNjOiBCdWlsZCBib290X3ssY29tcGF0X31nZHRbXSBpbiBDCgogeGVu
L2FyY2gveDg2L01ha2VmaWxlICAgICAgICAgICAgIHwgIDEgKwogeGVuL2FyY2gveDg2L2Jvb3Qv
aGVhZC5TICAgICAgICAgIHwgIDMgKy0KIHhlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TICAgICAg
ICB8IDM1ICstLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyAgICAg
ICAgIHwgIDQgKy0tCiB4ZW4vYXJjaC94ODYvZGVzYy5jICAgICAgICAgICAgICAgfCA3NSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9kb21haW4u
YyAgICAgICAgICAgICB8ICA3ICsrLS0KIHhlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaCAgICAg
ICB8IDE3ICsrKysrLS0tLQogeGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgICAgICAgIHwgIDIg
Ky0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYyAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94
ODYvc21wYm9vdC5jICAgICAgICAgICAgfCAxOCArKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYvdHJh
cHMuYyAgICAgICAgICAgICAgfCAzMCArKysrKysrKy0tLS0tLS0tCiB4ZW4vYXJjaC94ODYveDg2
XzY0L2tleGVjX3JlbG9jLlMgfCAgMiArLQogeGVuL2NvbW1vbi9lZmkvcnVudGltZS5jICAgICAg
ICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZGVzYy5oICAgICAgICB8IDE0ICsrKyst
LS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2xkdC5oICAgICAgICAgfCAgMyArLQogMTUgZmlsZXMg
Y2hhbmdlZCwgMTI4IGluc2VydGlvbnMoKyksIDg3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9hcmNoL3g4Ni9kZXNjLmMKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
