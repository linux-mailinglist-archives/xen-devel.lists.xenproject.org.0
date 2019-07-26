Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA277341
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 23:11:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr7Sa-0001PL-L4; Fri, 26 Jul 2019 21:09:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr7SY-0001PB-UL
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 21:09:02 +0000
X-Inumbo-ID: 968a9cfe-afe9-11e9-b341-4fb6c9d206aa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 968a9cfe-afe9-11e9-b341-4fb6c9d206aa;
 Fri, 26 Jul 2019 21:09:00 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aLiF5VPRwK3JWDL3LohE+JYAoXE9zpIfJbC5fD+jKvH/Ou5Ew6TTT8SB2HhjOTmKxk7MV37j6c
 gaqlKt1ORbWz+vyjC73wzoSBDyRqVaLhmEBXpjVWloD5gpm8q1CuegsGb1wH7QZFJEQHRTeOFs
 bb7GxdKNt7LVo8Ynurpv0h+mIZTyhEapOiUxgq6JjGUwLLWYf51jC3/8BNqntwcoie3k8HuBmj
 WkQIpyoksIqXRG7i9ZdfFTg6ExOZbBwE+WrCtBptmR0LxebD8lMoVWXt1URy6W/7YMJPosyi3X
 2ho=
X-SBRS: 2.7
X-MesageID: 3511831
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,312,1559534400"; 
   d="scan'208";a="3511831"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 22:08:53 +0100
Message-ID: <20190726210854.6408-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190726210854.6408-1-andrew.cooper3@citrix.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] xen/percpu: Drop unused asm/percpu.h
 includes
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgZmlsZXMgZWl0aGVyIGRvbid0IHVzZSBhbnkgUEVSX0NQVSgpIGluZnJhc3RydWN0dXJl
IGF0IGFsbCwgb3IgdXNlCkRFRklORV9QRVJfQ1BVXyooKS4gIFRoaXMgaXMgZGVjbGFyZWQgaW4g
eGVuL3BlcmNwdS5oLCBub3QgYXNtL3BlcmNwdS5oLCB3aGljaAptZWFucyB0aGF0IHhlbi9wZXJj
cHUuaCBpcyBpbmNsdWRlZCB2aWEgYSBkaWZmZXJlbnQgcGF0aC4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT4KLS0tCiB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TICAgICAgICAgICAgICAgfCAxIC0KIHhlbi9h
cmNoL3g4Ni9hY3BpL2NwdWZyZXEvY3B1ZnJlcS5jICB8IDEgLQogeGVuL2FyY2gveDg2L2FjcGkv
Y3B1ZnJlcS9wb3dlcm5vdy5jIHwgMSAtCiB4ZW4vYXJjaC94ODYvY3Jhc2guYyAgICAgICAgICAg
ICAgICAgfCAxIC0KIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICAgICAgICAgICAgICB8IDEgLQog
eGVuL2NvbW1vbi9jb3JlX3BhcmtpbmcuYyAgICAgICAgICAgIHwgMiArLQogeGVuL2RyaXZlcnMv
Y3B1ZnJlcS9jcHVmcmVxLmMgICAgICAgIHwgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21f
ZGVmbnMuaCAgICAgIHwgMSAtCiB4ZW4vaW5jbHVkZS94ZW4va2V4ZWMuaCAgICAgICAgICAgICAg
fCAxIC0KIDkgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxk
cy5TCmluZGV4IDA3Y2JkZjI1NDMuLjA5ZWM5OWJhZjUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2Fy
bS94ZW4ubGRzLlMKKysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwpAQCAtNCw3ICs0LDYgQEAK
IAogI2luY2x1ZGUgPHhlbi9jYWNoZS5oPgogI2luY2x1ZGUgPGFzbS9wYWdlLmg+Ci0jaW5jbHVk
ZSA8YXNtL3BlcmNwdS5oPgogI3VuZGVmIEVOVFJZCiAjdW5kZWYgQUxJR04KIApkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9jcHVmcmVxLmMgYi94ZW4vYXJjaC94ODYvYWNw
aS9jcHVmcmVxL2NwdWZyZXEuYwppbmRleCA3MDg2ZDFhYTE1Li5mMDUyNzU1NzhkIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2NwdWZyZXEuYworKysgYi94ZW4vYXJjaC94
ODYvYWNwaS9jcHVmcmVxL2NwdWZyZXEuYwpAQCAtMzgsNyArMzgsNiBAQAogI2luY2x1ZGUgPGFz
bS9tc3IuaD4KICNpbmNsdWRlIDxhc20vaW8uaD4KICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+
Ci0jaW5jbHVkZSA8YXNtL3BlcmNwdS5oPgogI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+CiAj
aW5jbHVkZSA8YWNwaS9hY3BpLmg+CiAjaW5jbHVkZSA8YWNwaS9jcHVmcmVxL2NwdWZyZXEuaD4K
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvcG93ZXJub3cuYyBiL3hlbi9h
cmNoL3g4Ni9hY3BpL2NwdWZyZXEvcG93ZXJub3cuYwppbmRleCA3MmFiNmExZWJhLi4zY2Y5YzZj
ZDA1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL3Bvd2Vybm93LmMKKysr
IGIveGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9wb3dlcm5vdy5jCkBAIC0zMiw3ICszMiw2IEBA
CiAjaW5jbHVkZSA8YXNtL21zci5oPgogI2luY2x1ZGUgPGFzbS9pby5oPgogI2luY2x1ZGUgPGFz
bS9wcm9jZXNzb3IuaD4KLSNpbmNsdWRlIDxhc20vcGVyY3B1Lmg+CiAjaW5jbHVkZSA8YXNtL2Nw
dWZlYXR1cmUuaD4KICNpbmNsdWRlIDxhY3BpL2FjcGkuaD4KICNpbmNsdWRlIDxhY3BpL2NwdWZy
ZXEvY3B1ZnJlcS5oPgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NyYXNoLmMgYi94ZW4vYXJj
aC94ODYvY3Jhc2guYwppbmRleCBhOWYzZTE4OTBjLi5jZTM2MWFmZDdjIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvY3Jhc2guYworKysgYi94ZW4vYXJjaC94ODYvY3Jhc2guYwpAQCAtMTAsNyAr
MTAsNiBAQAogCiAjaW5jbHVkZSA8YXNtL2F0b21pYy5oPgogI2luY2x1ZGUgPGFzbS9lbGYuaD4K
LSNpbmNsdWRlIDxhc20vcGVyY3B1Lmg+CiAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+CiAjaW5jbHVk
ZSA8eGVuL2lycS5oPgogI2luY2x1ZGUgPGFzbS9ubWkuaD4KZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCmluZGV4IGM4MmUxZTUwNGEu
LmZjYTI1YWQ1NGMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKKysrIGIveGVu
L2FyY2gveDg2L3hlbi5sZHMuUwpAQCAtMyw3ICszLDYgQEAKIAogI2luY2x1ZGUgPHhlbi9jYWNo
ZS5oPgogI2luY2x1ZGUgPGFzbS9wYWdlLmg+Ci0jaW5jbHVkZSA8YXNtL3BlcmNwdS5oPgogI3Vu
ZGVmIEVOVFJZCiAjdW5kZWYgQUxJR04KIApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jb3JlX3Bh
cmtpbmcuYyBiL3hlbi9jb21tb24vY29yZV9wYXJraW5nLmMKaW5kZXggN2FlNWQ2Mjc4ZS4uYzIy
NzEwZjk0ZCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9jb3JlX3BhcmtpbmcuYworKysgYi94ZW4v
Y29tbW9uL2NvcmVfcGFya2luZy5jCkBAIC0xOSw3ICsxOSw3IEBACiAjaW5jbHVkZSA8eGVuL2Nw
dS5oPgogI2luY2x1ZGUgPHhlbi9pbml0Lmg+CiAjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4KLSNp
bmNsdWRlIDxhc20vcGVyY3B1Lmg+CisKICNpbmNsdWRlIDxhc20vc21wLmg+CiAKICNkZWZpbmUg
Q09SRV9QQVJLSU5HX0lOQ1JFTUVOVCAxCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jcHVmcmVx
L2NwdWZyZXEuYyBiL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jCmluZGV4IGJhOTg5N2Ey
MmIuLjJkNzE2YWJmNzIgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5j
CisrKyBiL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jCkBAIC00MSw3ICs0MSw3IEBACiAj
aW5jbHVkZSA8YXNtL2J1Zy5oPgogI2luY2x1ZGUgPGFzbS9pby5oPgogI2luY2x1ZGUgPGFzbS9w
cm9jZXNzb3IuaD4KLSNpbmNsdWRlIDxhc20vcGVyY3B1Lmg+CisKICNpbmNsdWRlIDxhY3BpL2Fj
cGkuaD4KICNpbmNsdWRlIDxhY3BpL2NwdWZyZXEvY3B1ZnJlcS5oPgogCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L2FzbV9kZWZucy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21f
ZGVmbnMuaAppbmRleCA0ZmU1NTU2YTM0Li5jNGY0OWEzNWQzIDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L2FzbV9kZWZucy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2Rl
Zm5zLmgKQEAgLTcsNyArNyw2IEBACiAjaW5jbHVkZSA8YXNtL2FzbS1vZmZzZXRzLmg+CiAjZW5k
aWYKICNpbmNsdWRlIDxhc20vYnVnLmg+Ci0jaW5jbHVkZSA8YXNtL3BlcmNwdS5oPgogI2luY2x1
ZGUgPGFzbS94ODYtZGVmbnMuaD4KICNpbmNsdWRlIDx4ZW4vc3RyaW5naWZ5Lmg+CiAjaW5jbHVk
ZSA8YXNtL2NwdWZlYXR1cmUuaD4KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9rZXhlYy5o
IGIveGVuL2luY2x1ZGUveGVuL2tleGVjLmgKaW5kZXggZjViOWQxNjVhZS4uMTA2OGYzNGM1YiAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2tleGVjLmgKKysrIGIveGVuL2luY2x1ZGUveGVu
L2tleGVjLmgKQEAgLTQsNyArNCw2IEBACiAjaWZkZWYgQ09ORklHX0tFWEVDCiAKICNpbmNsdWRl
IDxwdWJsaWMva2V4ZWMuaD4KLSNpbmNsdWRlIDxhc20vcGVyY3B1Lmg+CiAjaW5jbHVkZSA8eGVu
L2VsZmNvcmUuaD4KICNpbmNsdWRlIDx4ZW4va2ltYWdlLmg+CiAKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
