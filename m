Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A641E11A2C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:29:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBkP-0004I6-Lt; Thu, 02 May 2019 13:27:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hMBkN-0004Hy-Qi
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:27:35 +0000
X-Inumbo-ID: 010794d2-6cde-11e9-b96d-1f5d2cddec18
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 010794d2-6cde-11e9-b96d-1f5d2cddec18;
 Thu, 02 May 2019 13:27:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="84946941"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 2 May 2019 14:27:07 +0100
Message-ID: <1556803627-22855-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Annotate the Real Mode entry points
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
 David Woodhouse <dwmw2@infradead.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIGJlY2F1c2UgaXRzIGFscmVhZHkgaGFyZCBlbm91Z2ggdG8gZm9sbG93LiAgQ3Jvc3MgcmVm
ZXJlbmNlIHRoZSBsb2NhdGlvbnMKaW4gQyB3aGljaCBzZXQgdGhlIGVudHJ5cG9pbnRzIHVwLCBh
bmQgc3RhdGUgdGhlIGFsaWdubWVudCByZXF1aXJlbWVudHMgYW5kCmVudHJ5IGNvbmRpdGlvbnMu
CgpEcm9wIGEgcmVkdW5kYW50IC5hbGlnbiAxNiwgYW5kIHBhbmljKCkgaW4gZG9fYm9vdF9jcHUo
KSBpZiB0aGUgQVAgdHJhbXBvbGluZQppc24ndCBzZXQgdXAgcHJvcGVybHkgcmF0aGVyIHRoYW4g
YmxpbmRseSBjb250aW51aW5nIGFuIGxldHRpbmcgdGhlIEFQcwpleGVjdXRlIGp1bmssIG9yIHNo
aWZ0aW5nIHBhcnQgb2YgdGhlIGFkZHJlc3MgaW50byB1bnJlbGF0ZWQgZmllbGRzIGluIElDUi4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgpDQzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPgotLS0KIHhlbi9h
cmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUyB8ICA2ICsrKysrKwogeGVuL2FyY2gveDg2L2Jvb3Qv
d2FrZXVwLlMgICAgIHwgMTAgKysrKysrKysrLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyAgICAg
ICAgIHwgIDUgKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMgYi94
ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKaW5kZXggMTI1YmRiNS4uY2FjMGYzZTEgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUworKysgYi94ZW4vYXJjaC94
ODYvYm9vdC90cmFtcG9saW5lLlMKQEAgLTM4LDYgKzM4LDEyIEBACiAKICAgICAgICAgLmNvZGUx
NgogCisvKgorICogZG9fYm9vdF9jcHUoKSBwcm9ncmFtcyB0aGUgU3RhcnR1cC1JUEkgdG8gcG9p
bnQgaGVyZS4gIER1ZSB0byB0aGUgU0lQSQorICogZm9ybWF0LCB0aGUgcmVsb2NhdGVkIGVudHJ5
cG9pbnQgbXVzdCBiZSA0ayBhbGlnbmVkLgorICoKKyAqIEl0IGlzIGVudGVyZWQgaW4gUmVhbCBN
b2RlLCB3aXRoICVjcyA9IHdha2V1cF9zdGFydCA+PiA0IGFuZCAlaXAgPSAwLgorICovCiBHTE9C
QUwodHJhbXBvbGluZV9yZWFsbW9kZV9lbnRyeSkKICAgICAgICAgbW92ICAgICAlY3MsJWF4CiAg
ICAgICAgIG1vdiAgICAgJWF4LCVkcwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3Qvd2Fr
ZXVwLlMgYi94ZW4vYXJjaC94ODYvYm9vdC93YWtldXAuUwppbmRleCA4OWRmMjYxLi5lM2NiOWUw
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC93YWtldXAuUworKysgYi94ZW4vYXJjaC94
ODYvYm9vdC93YWtldXAuUwpAQCAtMiw3ICsyLDE1IEBACiAKICNkZWZpbmUgd2FrZXN5bShzeW0p
IChzeW0gLSB3YWtldXBfc3RhcnQpCiAKLSAgICAgICAgLmFsaWduIDE2CisvKgorICogYWNwaV9z
bGVlcF9wcmVwYXJlKCkgcHJvZ3JhbXMgdGhlIFMzIHdha2V1cCB2ZWN0b3IgdG8gcG9pbnQgaGVy
ZS4KKyAqCisgKiBUaGUgQUNQSSBzcGVjIHNheXMgdGhhdCB3ZSBzaGFsbCBiZSBlbnRlcmVkIGlu
IFJlYWwgTW9kZSB3aXRoOgorICogICAlY3MgPSB3YWtldXBfc3RhcnQgPj4gNAorICogICAlaXAg
PSB3YWtldXBfc3RhcnQgJiAweGYKKyAqCisgKiBBcyB3YWtldXBfc3RhcnQgaXMgMTYtYnl0ZSBh
bGlnbmVkLCAlaXAgaXMgMCBpbiBwcmFjdGljZS4KKyAqLwogRU5UUlkod2FrZXVwX3N0YXJ0KQog
ICAgICAgICBjbGkKICAgICAgICAgY2xkCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9v
dC5jIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwppbmRleCBiN2EwYTRhLi40ZjY1YzhkIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290
LmMKQEAgLTU0OCw5ICs1NDgsMTIgQEAgc3RhdGljIGludCBkb19ib290X2NwdShpbnQgYXBpY2lk
LCBpbnQgY3B1KQogCiAgICAgYm9vdGluZ19jcHUgPSBjcHU7CiAKLSAgICAvKiBzdGFydF9laXAg
aGFkIGJldHRlciBiZSBwYWdlLWFsaWduZWQhICovCiAgICAgc3RhcnRfZWlwID0gc2V0dXBfdHJh
bXBvbGluZSgpOwogCisgICAgLyogc3RhcnRfZWlwIG5lZWRzIGJlIHBhZ2UgYWxpZ25lZCwgYW5k
IGJlbG93IHRoZSAxTSBib3VuZGFyeS4gKi8KKyAgICBpZiAoIHN0YXJ0X2VpcCAmIH4weGZmMDAw
ICkKKyAgICAgICAgcGFuaWMoIkFQIHRyYW1wb2xpbmUgJSNseCBub3Qgc3VpdGFibHkgcG9zaXRp
b25lZFxuIiwgc3RhcnRfZWlwKTsKKwogICAgIC8qIFNvIHdlIHNlZSB3aGF0J3MgdXAgICAqLwog
ICAgIGlmICggb3B0X2NwdV9pbmZvICkKICAgICAgICAgcHJpbnRrKCJCb290aW5nIHByb2Nlc3Nv
ciAlZC8lZCBlaXAgJWx4XG4iLAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
