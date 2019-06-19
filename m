Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D72E4C229
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 22:14:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdgvh-0002h6-It; Wed, 19 Jun 2019 20:11:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iLMg=US=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdgvg-0002h1-Gi
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 20:11:36 +0000
X-Inumbo-ID: 6f21a65e-92ce-11e9-b0f0-e3c021641c09
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f21a65e-92ce-11e9-b0f0-e3c021641c09;
 Wed, 19 Jun 2019 20:11:34 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RXn7b7lHeTLSAtjGslDKFl9I66NiuxfzMZgfIm8pZIKToqAMc/gpFJX9GGaotfp5QmeqrYMtq6
 MxTyQV8+96/+/VCkBqkp+Wca8wP0F/g+IOz1eXJ0j5DlMHq5pfY94F7DjUyfE3ksg+C5lIv6F3
 tZz+MQe19UXuHgpCA0CdBbXVzjL+H9b8Y2giIABG6slZkQgStqE6GILW14WPmQgdWW+uXANiiT
 BsDvEXFMSwngsewjx3l5TjzjH+HMLH1DnMzrsNOx/wJWAymK1G15sOIlOtX8EANBEl8ED4gdZx
 NT8=
X-SBRS: 2.7
X-MesageID: 1992902
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,394,1557201600"; 
   d="scan'208";a="1992902"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 21:11:27 +0100
Message-ID: <1560975087-25632-5-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] xen/link: Misc cleanup
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ICogRHJvcCAuZ251Lndhcm5pbmcuICBYZW4sIG5vdCBiZWluZyBhIGxpYnJhcnksIGhhcyBubyBu
ZWVkIGZvcgogICBfX2F0dHJpYnV0ZV9fKChfX3dhcm5pbmdfXygic3RyIikpKSBhbmQgaXNuJ3Qg
bGlhYmxlIHRvIGV2ZXIgZ2FpbiBzdWNoCiAgIGFubm90YXRpb25zIGZvciBsaW5rIHRpbWUgd2Fy
bmluZ3MuCiAqIEFkanVzdCB0aGUgaW5kZW50YXRpb24gb2YgdGhlIHN0YXJ0IG9mIEFSTSdzIC5y
b2RhdGEgc2VjdGlvbi4KICogRGlzY2FyZCAuZGlzY2FyZCBvbiBBUk0uCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3hlbi5sZHMuUyB8IDcgKysrKy0tLQogeGVu
L2FyY2gveDg2L3hlbi5sZHMuUyB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUyBi
L3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKaW5kZXggM2RjNTExNy4uYzVlZjVkNSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUworKysgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCkBA
IC0zNSwxNCArMzUsMTMgQEAgU0VDVElPTlMKICAgICAgICAqKC50ZXh0LmNvbGQpCiAgICAgICAg
KigudGV4dC51bmxpa2VseSkKICAgICAgICAqKC5maXh1cCkKLSAgICAgICAqKC5nbnUud2Fybmlu
ZykKICAgICAgICBfZXRleHQgPSAuOyAgICAgICAgICAgICAvKiBFbmQgb2YgdGV4dCBzZWN0aW9u
ICovCiAgIH0gOnRleHQgPSAweDkwOTAKIAogICAuID0gQUxJR04oUEFHRV9TSVpFKTsKICAgLnJv
ZGF0YSA6IHsKLSAgICAgICAgX3Nyb2RhdGEgPSAuOyAgICAgICAgICAvKiBSZWFkLW9ubHkgZGF0
YSAqLwotICAgICAgICAvKiBCdWcgZnJhbWVzIHRhYmxlICovCisgICAgICAgX3Nyb2RhdGEgPSAu
OyAgICAgICAgICAgLyogUmVhZC1vbmx5IGRhdGEgKi8KKyAgICAgICAvKiBCdWcgZnJhbWVzIHRh
YmxlICovCiAgICAgICAgX19zdGFydF9idWdfZnJhbWVzID0gLjsKICAgICAgICAqKC5idWdfZnJh
bWVzLjApCiAgICAgICAgX19zdG9wX2J1Z19mcmFtZXNfMCA9IC47CkBAIC0yMDksNiArMjA4LDgg
QEAgU0VDVElPTlMKICAgICAgICAqKC5leGl0LnRleHQpCiAgICAgICAgKiguZXhpdC5kYXRhKQog
ICAgICAgICooLmV4aXRjYWxsLmV4aXQpCisgICAgICAgKiguZGlzY2FyZCkKKyAgICAgICAqKC5k
aXNjYXJkLiopCiAgICAgICAgKiguZWhfZnJhbWUpCiAgIH0KIApkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKaW5kZXggZWYxMTk0OS4u
OGJjMmJlMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUworKysgYi94ZW4vYXJj
aC94ODYveGVuLmxkcy5TCkBAIC04Miw3ICs4Miw2IEBAIFNFQ1RJT05TCiAgICAgICAgKigudGV4
dC51bmxpa2VseSkKICAgICAgICAqKC5maXh1cCkKICAgICAgICAqKC50ZXh0LmtleGVjKQotICAg
ICAgICooLmdudS53YXJuaW5nKQogICAgICAgIF9ldGV4dCA9IC47ICAgICAgICAgICAgIC8qIEVu
ZCBvZiB0ZXh0IHNlY3Rpb24gKi8KICAgfSA6dGV4dCA9IDB4OTA5MAogCi0tIAoyLjEuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
