Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7385529AD3
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 17:18:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUBuj-0008AP-Pw; Fri, 24 May 2019 15:15:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEXw=TY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hUBuh-0008AK-J3
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 15:15:19 +0000
X-Inumbo-ID: bcc10357-7e36-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bcc10357-7e36-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 15:15:17 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: dZ5ZSisvD3AvlonCOBpdLm5nAutxKbYfPXx1bHBYLdPn165gNUl6+oYXTpcNfOmWH5rKJEx/Tg
 QpWjBOxMK8nym/i2nKJn4lYEPq0gVDDg5wk29x/mQ09qY/tRKok2dUeIRFMLBZF/pfKswCAZb7
 uVeN2a7kz9rFxBsBfK5SM74Z2Pn5zQXGUW+qh/2BXyJaRfdSmqtH95vR75DidFTBd81C41rSH3
 i5dsWJ36gNuL9690PVDysx6nzP9ms15gbJpdR9M3NpTob5f3x6rSkPKfKyCrldUXonB/+p409F
 Uy4=
X-SBRS: 2.7
X-MesageID: 893902
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,507,1549947600"; 
   d="scan'208";a="893902"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 24 May 2019 16:15:04 +0100
Message-ID: <1558710904-8210-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tests/x86emul: Annotate test blobs as
 executable code
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBjYXVzZXMgb2JqZHVtcCB0byBkaXNhc3NlbWJsZSB0aGVtLCByYXRoZXIgdGhhbiByZW5k
ZXJpbmcgdGhlbSBhcwpzdHJhaWdodCBoZXggZGF0YS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHRvb2xzL3Rlc3RzL3g4
Nl9lbXVsYXRvci9NYWtlZmlsZSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0cy94ODZfZW11bGF0
b3IvTWFrZWZpbGUgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IvTWFrZWZpbGUKaW5kZXggOTcw
ZWMzZS4uYjU0NjAzZCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2Vm
aWxlCisrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZQpAQCAtMTQ5LDcgKzE0
OSw3IEBAICQoYWRkc3VmZml4IC5oLCQoVEVTVENBU0VTKSk6ICUuaDogJS5jIHRlc3RjYXNlLm1r
IE1ha2VmaWxlCiAJCShlY2hvICdzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IF9fYXR0cmlidXRl
X18oKHNlY3Rpb24oIi50ZXN0LCBcImF4XCIsIEBwcm9nYml0cyAjIikpKScgXAogCQkgICAgICAi
JCR7cHJlZml4fV8kKGFyY2gpJCR7Zmxhdm9yfVtdID0geyI7IFwKIAkJIG9kIC12IC10IHggJCou
YmluIHwgc2VkIC1lICdzL15bMC05XSogLzB4LycgLWUgJ3MvIC8sIDB4L2cnIC1lICdzLyQkLywv
JzsgXAotCQkgZWNobyAifTsiKSA+PiRALm5ldzsgXAorCQkgZWNobyAifTsgYXNtKFwiLnR5cGUg
JCR7cHJlZml4fV8kKGFyY2gpJCR7Zmxhdm9yfSwgU1RUX0ZVTkM7XCIpOyIpID4+JEAubmV3OyBc
CiAJCXJtIC1mICQqLmJpbjsgXAogCSAgICBkb25lOyBcCiAJKQpAQCAtMTY1LDcgKzE2NSw3IEBA
ICQoYWRkc3VmZml4IC1vcG1hc2suaCwkKE9QTUFTSykpOiAlLmg6IG9wbWFzay5TIHRlc3RjYXNl
Lm1rIE1ha2VmaWxlCiAJCShlY2hvICdzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IF9fYXR0cmli
dXRlX18oKHNlY3Rpb24oIi50ZXN0LCBcImF4XCIsIEBwcm9nYml0cyAjIikpKScgXAogCQkgICAg
ICAiJCR7cHJlZml4fV8kKGFyY2gpJCR7Zmxhdm9yfVtdID0geyI7IFwKIAkJIG9kIC12IC10IHgg
JCouYmluIHwgc2VkIC1lICdzL15bMC05XSogLzB4LycgLWUgJ3MvIC8sIDB4L2cnIC1lICdzLyQk
LywvJzsgXAotCQkgZWNobyAifTsiKSA+PiRALm5ldzsgXAorCQkgZWNobyAifTsgYXNtKFwiLnR5
cGUgJCR7cHJlZml4fV8kKGFyY2gpJCR7Zmxhdm9yfSwgU1RUX0ZVTkM7XCIpOyIpID4+JEAubmV3
OyBcCiAJCXJtIC1mICQqLmJpbjsgXAogCSAgICBkb25lOyBcCiAJKQotLSAKMi4xLjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
