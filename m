Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F181881
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 13:55:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubXc-0004vE-Md; Mon, 05 Aug 2019 11:52:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6VNZ=WB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hubXb-0004v7-DB
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 11:52:39 +0000
X-Inumbo-ID: 83ed2838-b777-11e9-b4b1-a7487910beea
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83ed2838-b777-11e9-b4b1-a7487910beea;
 Mon, 05 Aug 2019 11:52:35 +0000 (UTC)
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
IronPort-SDR: YqUNMJOOh/1bh1lE6v6+UIotNYmMZbKDx66wy7YszIvNyqLMQcEe/43wVdfSuQaIMAlp1WmL5o
 v7LLYazGwvjb+qZu1du7FOsnFGjG25yB4lkM5J8Jb66RczUacHihuvjt1jy3HGWD0ASdLXHtVz
 Yco8wEyjXzfIv20v6KKRLmFhPuJOyAlMgVDlrHHKKRvyVAs21DRCbrnSvztRitn2h6DnKV4/Zw
 KCGypcMTOp0E8o77CphGWiJx5Z48XmWW43Dcs1RSpwRjgRY12ivzk7MTJRQBWdM4uhWvXMpcEq
 esI=
X-SBRS: 2.7
X-MesageID: 3868071
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,349,1559534400"; 
   d="scan'208";a="3868071"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 5 Aug 2019 12:52:32 +0100
Message-ID: <20190805115232.28002-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/shim: Refresh pvshim_defconfig
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KiBBZGQgYSBkZXBlbmRlbmN5IHNvIHRoZSBzaGltIGdldHMgcmVidWlsdCB3aGVuIHB2c2hpbV9k
ZWZjb25maWcgY2hhbmdlcy4KKiBEZWZhdWx0IHRvIHRoZSBOVUxMIHNjaGVkdWxlciBub3cgdGhh
dCBpdCB3b3JrcyB3aXRoIHZjcHUgb25saW5lL29mZmxpbmUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNo
IDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IERhcmlvIEZhZ2dpb2xpIDxkZmFn
Z2lvbGlAc3VzZS5jb20+Cgp2MjoKICogRHJvcCBNRU1fQUNDRVNTIGNoYW5nZXMuICB4ODYgZG9l
c24ndCBjb21waWxlIHdpdGhvdXQgaXQsIGFuZCBJIGRvbid0IGhhdmUKICAgdGltZSB0byBmaXgg
dGhhdC4KLS0tCiB0b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlICAgICAgIHwgMiArLQog
eGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZyB8IDMgKystCiAyIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29s
cy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtl
ZmlsZQppbmRleCA4MzU5N2YwMDE3Li43NDM1NDIxMjUxIDEwMDY0NAotLS0gYS90b29scy9maXJt
d2FyZS94ZW4tZGlyL01ha2VmaWxlCisrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZp
bGUKQEAgLTQxLDcgKzQxLDcgQEAgbGlua2Zhcm0uc3RhbXA6ICQoREVQX0RJUlMpICQoREVQX0ZJ
TEVTKSBGT1JDRQogJChEKTogbGlua2Zhcm0uc3RhbXAKIAkkKE1BS0UpIC1DICQoRCkveGVuIGRp
c3RjbGVhbgogCi0kKEQpL3hlbi8uY29uZmlnOiAkKEQpCiskKEQpL3hlbi8uY29uZmlnOiAkKEQp
ICQoRCkveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZwogCSQoTUFLRSkgLUMg
JChARCkgS0JVSUxEX0RFRkNPTkZJRz1wdnNoaW1fZGVmY29uZmlnIFhFTl9DT05GSUdfRVhQRVJU
PXkgZGVmY29uZmlnCiAKIHhlbi1zaGltOiAkKEQpL3hlbi8uY29uZmlnCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnIGIveGVuL2FyY2gveDg2L2NvbmZp
Z3MvcHZzaGltX2RlZmNvbmZpZwppbmRleCA5NzEwYWE2MjM4Li5hNWU4ZTE0MTcxIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCisrKyBiL3hlbi9hcmNo
L3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcKQEAgLTUsNiArNSw3IEBAIENPTkZJR19QVkhf
R1VFU1Q9eQogQ09ORklHX1BWX1NISU09eQogQ09ORklHX1BWX1NISU1fRVhDTFVTSVZFPXkKIENP
TkZJR19OUl9DUFVTPTMyCitDT05GSUdfU0NIRURfTlVMTD15CiAjIERpc2FibGUgZmVhdHVyZXMg
bm90IHVzZWQgYnkgdGhlIFBWIHNoaW0KICMgQ09ORklHX1NIQURPV19QQUdJTkcgaXMgbm90IHNl
dAogIyBDT05GSUdfQklHTUVNIGlzIG5vdCBzZXQKQEAgLTEzLDEwICsxNCwxMCBAQCBDT05GSUdf
TlJfQ1BVUz0zMgogIyBDT05GSUdfS0VYRUMgaXMgbm90IHNldAogIyBDT05GSUdfWEVOT1BST0Yg
aXMgbm90IHNldAogIyBDT05GSUdfWFNNIGlzIG5vdCBzZXQKKyMgQ09ORklHX1NDSEVEX0NSRURJ
VCBpcyBub3Qgc2V0CiAjIENPTkZJR19TQ0hFRF9DUkVESVQyIGlzIG5vdCBzZXQKICMgQ09ORklH
X1NDSEVEX1JURFMgaXMgbm90IHNldAogIyBDT05GSUdfU0NIRURfQVJJTkM2NTMgaXMgbm90IHNl
dAotIyBDT05GSUdfU0NIRURfTlVMTCBpcyBub3Qgc2V0CiAjIENPTkZJR19MSVZFUEFUQ0ggaXMg
bm90IHNldAogIyBDT05GSUdfU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUyBpcyBu
b3Qgc2V0CiAjIENPTkZJR19ERUJVRyBpcyBub3Qgc2V0Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
