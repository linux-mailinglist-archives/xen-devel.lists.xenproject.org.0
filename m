Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EDA14F0D1
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:45:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixZND-0008BX-5U; Fri, 31 Jan 2020 16:42:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixZNC-0008BS-3O
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:42:26 +0000
X-Inumbo-ID: a88dd706-4448-11ea-8bec-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a88dd706-4448-11ea-8bec-12813bfff9fa;
 Fri, 31 Jan 2020 16:42:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5565AD3C;
 Fri, 31 Jan 2020 16:42:23 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
Message-ID: <bfc4d4ad-85a5-2d79-748a-c7b72ba40bce@suse.com>
Date: Fri, 31 Jan 2020 17:42:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v4 1/7] SVM: drop asm/hvm/emulate.h inclusion
 from vmcb.h
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQncyBub3QgbmVlZGVkIHRoZXJlIGFuZCBpbnRyb2R1Y2VzIGEgbmVlZGxlc3MsIGFsbW9zdCBn
bG9iYWwKZGVwZW5kZW5jeS4gSW5jbHVkZSB0aGUgZmlsZSAob3IgaW4gc29tZSBjYXNlcyBqdXN0
IHhlbi9lcnIuaCkgd2hlcmUKYWN0dWFsbHkgbmVlZGVkLCBvciAtIGluIG9uZSBjYXNlIC0gc2lt
cGx5IGZvcndhcmQtZGVjbGFyZSBhIHN0cnVjdC4gSW4KbWljcm9jb2RlKi5jIHRha2UgdGhlIG9w
cG9ydHVuaXR5IGFuZCBhbHNvIHJlLW9yZGVyIGEgZmV3IG90aGVyCiNpbmNsdWRlLXMuCgpTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2NDogTmV3LgoK
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
CkBAIC01NSw2ICs1NSw3IEBACiAjaW5jbHVkZSA8YXNtL21jMTQ2ODE4cnRjLmg+CiAjaW5jbHVk
ZSA8YXNtL21jZS5oPgogI2luY2x1ZGUgPGFzbS9tb25pdG9yLmg+CisjaW5jbHVkZSA8YXNtL2h2
bS9lbXVsYXRlLmg+CiAjaW5jbHVkZSA8YXNtL2h2bS9odm0uaD4KICNpbmNsdWRlIDxhc20vaHZt
L3ZwdC5oPgogI2luY2x1ZGUgPGFzbS9odm0vc3VwcG9ydC5oPgotLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2lvcmVxLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCkBAIC0yOCw2ICsyOCw3
IEBACiAjaW5jbHVkZSA8eGVuL3BhZ2luZy5oPgogI2luY2x1ZGUgPHhlbi92cGNpLmg+CiAKKyNp
bmNsdWRlIDxhc20vaHZtL2VtdWxhdGUuaD4KICNpbmNsdWRlIDxhc20vaHZtL2h2bS5oPgogI2lu
Y2x1ZGUgPGFzbS9odm0vaW9yZXEuaD4KICNpbmNsdWRlIDxhc20vaHZtL3ZteC92bXguaD4KLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0v
c3ZtL2VtdWxhdGUuYwpAQCAtMjAsNiArMjAsNyBAQAogI2luY2x1ZGUgPHhlbi9saWIuaD4KICNp
bmNsdWRlIDx4ZW4vdHJhY2UuaD4KICNpbmNsdWRlIDxhc20vbXNyLmg+CisjaW5jbHVkZSA8YXNt
L2h2bS9lbXVsYXRlLmg+CiAjaW5jbHVkZSA8YXNtL2h2bS9odm0uaD4KICNpbmNsdWRlIDxhc20v
aHZtL3N1cHBvcnQuaD4KICNpbmNsdWRlIDxhc20vaHZtL3N2bS9zdm0uaD4KLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS92bV9ldmVudC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm1fZXZlbnQuYwpA
QCAtMjIsNiArMjIsNyBAQAogCiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+CiAjaW5jbHVkZSA8eGVu
L3ZtX2V2ZW50Lmg+CisjaW5jbHVkZSA8YXNtL2h2bS9lbXVsYXRlLmg+CiAjaW5jbHVkZSA8YXNt
L2h2bS9zdXBwb3J0Lmg+CiAjaW5jbHVkZSA8YXNtL3ZtX2V2ZW50Lmg+CiAKLS0tIGEveGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwpAQCAtMjIs
OSArMjIsMTAgQEAKICAqLwogCiAjaW5jbHVkZSA8eGVuL2NwdS5oPgotI2luY2x1ZGUgPHhlbi9s
aWIuaD4KLSNpbmNsdWRlIDx4ZW4va2VybmVsLmg+CisjaW5jbHVkZSA8eGVuL2Vyci5oPgogI2lu
Y2x1ZGUgPHhlbi9pbml0Lmg+CisjaW5jbHVkZSA8eGVuL2tlcm5lbC5oPgorI2luY2x1ZGUgPHhl
bi9saWIuaD4KICNpbmNsdWRlIDx4ZW4vbm90aWZpZXIuaD4KICNpbmNsdWRlIDx4ZW4vc2NoZWQu
aD4KICNpbmNsdWRlIDx4ZW4vc21wLmg+Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1k
LmMKKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYwpAQCAtMTQsOSArMTQsMTAgQEAK
ICAqICBMaWNlbnNlIHZlcnNpb24gMi4gU2VlIGZpbGUgQ09QWUlORyBmb3IgZGV0YWlscy4KICAq
LwogCi0jaW5jbHVkZSA8eGVuL2xpYi5oPgotI2luY2x1ZGUgPHhlbi9rZXJuZWwuaD4KKyNpbmNs
dWRlIDx4ZW4vZXJyLmg+CiAjaW5jbHVkZSA8eGVuL2luaXQuaD4KKyNpbmNsdWRlIDx4ZW4va2Vy
bmVsLmg+CisjaW5jbHVkZSA8eGVuL2xpYi5oPgogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgogI2lu
Y2x1ZGUgPHhlbi9zbXAuaD4KICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KLS0tIGEveGVuL2Fy
Y2gveDg2L21pY3JvY29kZV9pbnRlbC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50
ZWwuYwpAQCAtMjEsOSArMjEsMTAgQEAKICAqIDIgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3Vy
IG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCiAgKi8KIAotI2luY2x1ZGUgPHhlbi9saWIuaD4K
LSNpbmNsdWRlIDx4ZW4va2VybmVsLmg+CisjaW5jbHVkZSA8eGVuL2Vyci5oPgogI2luY2x1ZGUg
PHhlbi9pbml0Lmg+CisjaW5jbHVkZSA8eGVuL2tlcm5lbC5oPgorI2luY2x1ZGUgPHhlbi9saWIu
aD4KICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KICNpbmNsdWRlIDx4ZW4vc21wLmg+CiAjaW5jbHVk
ZSA8eGVuL3NwaW5sb2NrLmg+Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvaHZtLmMKKysr
IGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYwpAQCAtMjgsNiArMjgsNyBAQAogI2luY2x1
ZGUgPHhlbi90cmFjZS5oPgogCiAjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4KKyNpbmNsdWRlIDxh
c20vaHZtL2VtdWxhdGUuaD4KICNpbmNsdWRlIDxhc20vc2hhZG93Lmg+CiAKICNpbmNsdWRlICJw
cml2YXRlLmgiCi0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLWdhdGUtb3AuYworKysgYi94ZW4v
YXJjaC94ODYvcHYvZW11bC1nYXRlLW9wLmMKQEAgLTE5LDYgKzE5LDcgQEAKICAqIGFsb25nIHdp
dGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uCiAgKi8KIAorI2luY2x1ZGUgPHhlbi9lcnIuaD4KICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4K
ICNpbmNsdWRlIDx4ZW4vZXZlbnQuaD4KICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNiLmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaApAQCAtMjAsOCArMjAsNiBAQAogI2RlZmluZSBfX0FTTV9Y
ODZfSFZNX1NWTV9WTUNCX0hfXwogCiAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Ci0jaW5jbHVkZSA8
YXNtL2h2bS9lbXVsYXRlLmg+Ci0KIAogLyogZ2VuZXJhbCAxIGludGVyY2VwdHMgKi8KIGVudW0g
R2VuZXJpY0ludGVyY2VwdDFiaXRzCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92
bXguaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm14LmgKQEAgLTk3LDYgKzk3
LDcgQEAgdm9pZCB2bXhfYXNtX2RvX3ZtZW50cnkodm9pZCk7CiB2b2lkIHZteF9pbnRyX2Fzc2lz
dCh2b2lkKTsKIHZvaWQgbm9yZXR1cm4gdm14X2RvX3Jlc3VtZShzdHJ1Y3QgdmNwdSAqKTsKIHZv
aWQgdm14X3ZsYXBpY19tc3JfY2hhbmdlZChzdHJ1Y3QgdmNwdSAqdik7CitzdHJ1Y3QgaHZtX2Vt
dWxhdGVfY3R4dDsKIHZvaWQgdm14X3JlYWxtb2RlX2VtdWxhdGVfb25lKHN0cnVjdCBodm1fZW11
bGF0ZV9jdHh0ICpodm1lbXVsX2N0eHQpOwogdm9pZCB2bXhfcmVhbG1vZGUoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MpOwogdm9pZCB2bXhfdXBkYXRlX2RlYnVnX3N0YXRlKHN0cnVjdCB2Y3B1
ICp2KTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
