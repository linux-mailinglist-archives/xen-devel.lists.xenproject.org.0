Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134EE6D28D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:10:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho9sO-0003MZ-8c; Thu, 18 Jul 2019 17:07:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho9sN-0003MO-6O
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:07:27 +0000
X-Inumbo-ID: 83c30ab4-a97e-11e9-97fd-ef20e9fe1be9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83c30ab4-a97e-11e9-97fd-ef20e9fe1be9;
 Thu, 18 Jul 2019 17:07:25 +0000 (UTC)
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
IronPort-SDR: EfFeoVcuHT7sNx0g3xoEnUEhIahC62ZXc+EqqqFpeJRMcylO3cFj5stOVMM857E8i2y4PEaLA3
 34FrPlINoNA/tclXdPhpgFKrZ6bKrPLgb2QFp53YQDJdyOKTLPgXS8YflXYSpUGFF2XB0aN6eL
 s/Wn0MQjrYr4y9B9/qGteBidbi5gKQfBAToStLp4PKLB9Zvp0ccJbRZefvFmJdh9rY4d+c96OB
 5CzXsW36j8XaWy3ER3Kh4H8kRbL4w+Qu49PBihrOS3uabj0X2C1XbCKuACYdfoN0xZ0ah/znEX
 ZEA=
X-SBRS: 2.7
X-MesageID: 3137450
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3137450"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 18 Jul 2019 18:07:16 +0100
Message-ID: <20190718170716.22544-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190718170716.22544-1-andrew.cooper3@citrix.com>
References: <20190718170716.22544-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] xen/trace: Adjust types in function
 declarations
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIHVpbnQzMl90IGNvbnNpc3RlbnRseSBmb3IgJ2V2ZW50JywgYm9vbCBjb25zaXN0ZW50bHkg
Zm9yICdjeWNsZXMnLAphbmQgdW5zaWduZWQgaW50IGNvbnNpc3RlbnRseSBmb3IgJ2V4dHJhJwoK
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpD
QzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2luY2x1
ZGUveGVuL3RyYWNlLmggfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vdHJhY2UuaCBi
L3hlbi9pbmNsdWRlL3hlbi90cmFjZS5oCmluZGV4IDdmNWE5MDQxMDMuLmFmOTI1YmNmY2MgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi90cmFjZS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi90
cmFjZS5oCkBAIC00MSw5ICs0MSw5IEBAIGludCB0Yl9jb250cm9sKHN0cnVjdCB4ZW5fc3lzY3Rs
X3RidWZfb3AgKnRiYyk7CiAKIGludCB0cmFjZV93aWxsX3RyYWNlX2V2ZW50KHUzMiBldmVudCk7
CiAKLXZvaWQgX190cmFjZV92YXIodTMyIGV2ZW50LCBib29sX3QgY3ljbGVzLCB1bnNpZ25lZCBp
bnQgZXh0cmEsIGNvbnN0IHZvaWQgKik7Cit2b2lkIF9fdHJhY2VfdmFyKHVpbnQzMl90IGV2ZW50
LCBib29sIGN5Y2xlcywgdW5zaWduZWQgaW50IGV4dHJhLCBjb25zdCB2b2lkICopOwogCi1zdGF0
aWMgaW5saW5lIHZvaWQgdHJhY2VfdmFyKHUzMiBldmVudCwgaW50IGN5Y2xlcywgaW50IGV4dHJh
LAorc3RhdGljIGlubGluZSB2b2lkIHRyYWNlX3Zhcih1aW50MzJfdCBldmVudCwgYm9vbCBjeWNs
ZXMsIHVuc2lnbmVkIGludCBleHRyYSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgdm9pZCAqZXh0cmFfZGF0YSkKIHsKICAgICBpZiAoIHVubGlrZWx5KHRiX2luaXRfZG9uZSkg
KQpAQCAtNjgsNyArNjgsNyBAQCBzdGF0aWMgaW5saW5lIGludCB0cmFjZV93aWxsX3RyYWNlX2V2
ZW50KHVpbnQzMl90IGV2ZW50KQogICAgIHJldHVybiAwOwogfQogCi1zdGF0aWMgaW5saW5lIHZv
aWQgdHJhY2VfdmFyKHVpbnQzMl90IGV2ZW50LCBpbnQgY3ljbGVzLCBpbnQgZXh0cmEsCitzdGF0
aWMgaW5saW5lIHZvaWQgdHJhY2VfdmFyKHVpbnQzMl90IGV2ZW50LCBib29sIGN5Y2xlcywgdW5z
aWduZWQgaW50IGV4dHJhLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lk
ICpleHRyYV9kYXRhKSB7fQogc3RhdGljIGlubGluZSB2b2lkIF9fdHJhY2VfdmFyKHVpbnQzMl90
IGV2ZW50LCBib29sIGN5Y2xlcywgdW5zaWduZWQgaW50IGV4dHJhLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHZvaWQgKmV4dHJhX2RhdGEpIHt9Ci0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
