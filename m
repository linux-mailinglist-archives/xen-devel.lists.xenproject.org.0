Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9441B426CB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 14:57:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb2mH-0008H9-Q9; Wed, 12 Jun 2019 12:54:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7kto=UL=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hb2mG-0008H4-Cy
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 12:54:56 +0000
X-Inumbo-ID: 4194a564-8d11-11e9-85db-d71cbe48ed62
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4194a564-8d11-11e9-85db-d71cbe48ed62;
 Wed, 12 Jun 2019 12:54:48 +0000 (UTC)
Received: from MK-FE.hygon.cn ([172.23.18.61])
 by spam2.hygon.cn with ESMTP id x5CCsNeK054980;
 Wed, 12 Jun 2019 20:54:23 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-FE.hygon.cn with ESMTP id x5CCsIti048429;
 Wed, 12 Jun 2019 20:54:18 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from pw-vbox.hygon.cn (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 12 Jun
 2019 20:54:22 +0800
From: Pu Wen <puwen@hygon.cn>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 12 Jun 2019 20:53:58 +0800
Message-ID: <ce618b9652acb40e209f33b44e1394fe0f99451d.1560342915.git.puwen@hygon.cn>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex02.Hygon.cn (172.23.18.12) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam2.hygon.cn x5CCsNeK054980
X-DNSRBL: 
Subject: [Xen-devel] [PATCH v6] x86/acpi: Add Hygon Dhyana support
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
Cc: Pu Wen <puwen@hygon.cn>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0IHRvIHRoZSBhY3BpIGNwdWZyZXEgYW5kIGNwdWlkbGUg
c3Vic3lzdGVtcyBieQp1c2luZyB0aGUgY29kZSBwYXRoIG9mIEFNRC4KCltSZWJhc2Ugb3ZlciAw
Y2QwNzQxNCAieDg2L2NwdTogUmVudW1iZXIgWDg2X1ZFTkRPUl8qIHRvIGZvcm0gYSBiaXRtYXAi
XQoKU2lnbmVkLW9mZi1ieTogUHUgV2VuIDxwdXdlbkBoeWdvbi5jbj4KQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRs
ZS5jICAgICAgICAgfCAzICsrLQogeGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9jcHVmcmVxLmMg
IHwgOCArKysrKy0tLQogeGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9wb3dlcm5vdy5jIHwgMiAr
LQogMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYyBiL3hlbi9hcmNoL3g4Ni9hY3Bp
L2NwdV9pZGxlLmMKaW5kZXggODg0NjcyMi4uNTkzMTkyOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2FjcGkvY3B1X2lkbGUuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jCkBA
IC04MDIsNyArODAyLDggQEAgdm9pZCBhY3BpX2RlYWRfaWRsZSh2b2lkKQogICAgICAgICAgICAg
X19td2FpdChjeC0+YWRkcmVzcywgMCk7CiAgICAgICAgIH0KICAgICB9Ci0gICAgZWxzZSBpZiAo
IGN1cnJlbnRfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FNRCAmJgorICAgIGVs
c2UgaWYgKCAoY3VycmVudF9jcHVfZGF0YS54ODZfdmVuZG9yICYKKyAgICAgICAgICAgICAgIChY
ODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pKSAmJgogICAgICAgICAgICAgICBjeC0+
ZW50cnlfbWV0aG9kID09IEFDUElfQ1NUQVRFX0VNX1NZU0lPICkKICAgICB7CiAgICAgICAgIC8q
IEludGVsIHByZWZlcnMgbm90IHRvIHVzZSBTWVNJTyAqLwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2FjcGkvY3B1ZnJlcS9jcHVmcmVxLmMgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2Nw
dWZyZXEuYwppbmRleCBmNGUxM2UxLi43MDg2ZDFhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
YWNwaS9jcHVmcmVxL2NwdWZyZXEuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2Nw
dWZyZXEuYwpAQCAtNjQ5LDcgKzY0OSw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGNwdWZyZXFfZHJp
dmVyX2luaXQodm9pZCkKICAgICAgICAgKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZf
VkVORE9SX0lOVEVMKSkKICAgICAgICAgcmV0ID0gY3B1ZnJlcV9yZWdpc3Rlcl9kcml2ZXIoJmFj
cGlfY3B1ZnJlcV9kcml2ZXIpOwogICAgIGVsc2UgaWYgKChjcHVmcmVxX2NvbnRyb2xsZXIgPT0g
RlJFUUNUTF94ZW4pICYmCi0gICAgICAgIChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2
X1ZFTkRPUl9BTUQpKQorICAgICAgICAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYKKyAgICAg
ICAgIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pKSkKICAgICAgICAgcmV0ID0g
cG93ZXJub3dfcmVnaXN0ZXJfZHJpdmVyKCk7CiAKICAgICByZXR1cm4gcmV0OwpAQCAtNjYwLDgg
KzY2MSw5IEBAIGludCBjcHVmcmVxX2NwdV9pbml0KHVuc2lnbmVkIGludCBjcHVpZCkKIHsKICAg
ICBpbnQgcmV0OwogCi0gICAgLyogQ3VycmVudGx5IHdlIG9ubHkgaGFuZGxlIEludGVsIGFuZCBB
TUQgcHJvY2Vzc29yICovCi0gICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJiAoWDg2
X1ZFTkRPUl9JTlRFTCB8IFg4Nl9WRU5ET1JfQU1EKSApCisgICAgLyogQ3VycmVudGx5IHdlIG9u
bHkgaGFuZGxlIEludGVsLCBBTUQgYW5kIEh5Z29uIHByb2Nlc3NvciAqLworICAgIGlmICggYm9v
dF9jcHVfZGF0YS54ODZfdmVuZG9yICYKKyAgICAgICAgIChYODZfVkVORE9SX0lOVEVMIHwgWDg2
X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSApCiAgICAgICAgIHJldCA9IGNwdWZyZXFf
YWRkX2NwdShjcHVpZCk7CiAgICAgZWxzZQogICAgICAgICByZXQgPSAtRUZBVUxUOwpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9wb3dlcm5vdy5jIGIveGVuL2FyY2gveDg2
L2FjcGkvY3B1ZnJlcS9wb3dlcm5vdy5jCmluZGV4IDAyNWIzN2QuLjcyYWI2YTEgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvcG93ZXJub3cuYworKysgYi94ZW4vYXJjaC94
ODYvYWNwaS9jcHVmcmVxL3Bvd2Vybm93LmMKQEAgLTM2MCw3ICszNjAsNyBAQCB1bnNpZ25lZCBp
bnQgX19pbml0IHBvd2Vybm93X3JlZ2lzdGVyX2RyaXZlcigpCiAKICAgICBmb3JfZWFjaF9vbmxp
bmVfY3B1KGkpIHsKICAgICAgICAgc3RydWN0IGNwdWluZm9feDg2ICpjID0gJmNwdV9kYXRhW2ld
OwotICAgICAgICBpZiAoYy0+eDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0FNRCkKKyAgICAgICAg
aWYgKCEoYy0+eDg2X3ZlbmRvciAmIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04p
KSkKICAgICAgICAgICAgIHJldCA9IC1FTk9ERVY7CiAgICAgICAgIGVsc2UKICAgICAgICAgewot
LSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
