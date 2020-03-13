Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB921845D1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:19:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiJw-0006ZS-RN; Fri, 13 Mar 2020 11:17:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCiJv-0006ZE-Cu
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:17:39 +0000
X-Inumbo-ID: 3f5c2d7e-651c-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f5c2d7e-651c-11ea-92cf-bc764e2007e4;
 Fri, 13 Mar 2020 11:17:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E471BAAC7;
 Fri, 13 Mar 2020 11:17:37 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Message-ID: <741ed63a-f100-d011-218c-74e4265cd3c3@suse.com>
Date: Fri, 13 Mar 2020 12:17:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 8/9] x86/HVM: reduce hvm.h include
 dependencies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYsIGFuZCBhZGQg
c21hbGxlciBzY29wZQpvbmVzIGluc3RlYWQuIFB1dCB0aGUgb25lcyBuZWVkZWQgaW50byB3aGlj
aGV2ZXIgb3RoZXIgZmlsZXMgYWN0dWFsbHkKbmVlZCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxw
YXVsQHhlbi5vcmc+ClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT4KLS0tCnYyOiBBbHNvIG1ha2UgdGhpbmdzIGJ1aWxkIHdpdGggUFZfU0hJTV9FWENMVVNJVkU9
eS4KCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2VtdWxhdGUuaAorKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS9lbXVsYXRlLmgKQEAgLTEzLDYgKzEzLDcgQEAKICNkZWZpbmUgX19B
U01fWDg2X0hWTV9FTVVMQVRFX0hfXwogCiAjaW5jbHVkZSA8eGVuL2Vyci5oPgorI2luY2x1ZGUg
PHhlbi9tbS5oPgogI2luY2x1ZGUgPGFzbS9odm0vaHZtLmg+CiAjaW5jbHVkZSA8YXNtL3g4Nl9l
bXVsYXRlLmg+CiAKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKQEAgLTIwLDEyICsyMCwxMSBAQAogI2lmbmRlZiBf
X0FTTV9YODZfSFZNX0hWTV9IX18KICNkZWZpbmUgX19BU01fWDg2X0hWTV9IVk1fSF9fCiAKKyNp
bmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KKyNpbmNsdWRlIDxhc20vYXNtX2RlZm5zLmg+CiAj
aW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4KICNpbmNsdWRlIDxhc20veDg2X2VtdWxhdGUuaD4KICNp
bmNsdWRlIDxhc20vaHZtL2FzaWQuaD4KLSNpbmNsdWRlIDxwdWJsaWMvZG9tY3RsLmg+Ci0jaW5j
bHVkZSA8cHVibGljL2h2bS9zYXZlLmg+Ci0jaW5jbHVkZSA8eGVuL21tLmg+CiAKICNpZmRlZiBD
T05GSUdfSFZNX0ZFUAogLyogUGVybWl0IHVzZSBvZiB0aGUgRm9yY2VkIEVtdWxhdGlvbiBQcmVm
aXggaW4gSFZNIGd1ZXN0cyAqLwpAQCAtMzI2LDYgKzMyNSw3IEBAIGludCBodm1fZGVidWdfb3Ao
c3RydWN0IHZjcHUgKnYsIGludDMyX3QKIHZvaWQgaHZtX3RvZ2dsZV9zaW5nbGVzdGVwKHN0cnVj
dCB2Y3B1ICp2KTsKIHZvaWQgaHZtX2Zhc3Rfc2luZ2xlc3RlcChzdHJ1Y3QgdmNwdSAqdiwgdWlu
dDE2X3QgcDJtaWR4KTsKIAorc3RydWN0IG5wZmVjOwogaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2Vf
ZmF1bHQocGFkZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IG5wZmVjIG5wZmVjKTsKIAotLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS92bXgvdm1jcy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNz
LmgKQEAgLTE4LDYgKzE4LDggQEAKICNpZm5kZWYgX19BU01fWDg2X0hWTV9WTVhfVk1DU19IX18K
ICNkZWZpbmUgX19BU01fWDg2X0hWTV9WTVhfVk1DU19IX18KIAorI2luY2x1ZGUgPHhlbi9tbS5o
PgorCiBleHRlcm4gdm9pZCB2bWNzX2R1bXBfdmNwdShzdHJ1Y3QgdmNwdSAqdik7CiBleHRlcm4g
dm9pZCBzZXR1cF92bWNzX2R1bXAodm9pZCk7CiBleHRlcm4gaW50ICB2bXhfY3B1X3VwX3ByZXBh
cmUodW5zaWduZWQgaW50IGNwdSk7Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5oCkBAIC0yMSw2ICsyMSw3IEBACiAK
ICNpbmNsdWRlIDx4ZW4vdGltZXIuaD4KICNpbmNsdWRlIDx4ZW4vbGlzdC5oPgorI2luY2x1ZGUg
PHhlbi9yd2xvY2suaD4KICNpbmNsdWRlIDxhc20vaHZtL2h2bS5oPgogCiAvKgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
