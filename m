Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7973ABA25
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:02:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6En2-0006Sj-4o; Fri, 06 Sep 2019 14:00:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6Emz-0006Se-VN
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:00:37 +0000
X-Inumbo-ID: b38426a0-d0ae-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b38426a0-d0ae-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 14:00:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3840FB0E2;
 Fri,  6 Sep 2019 14:00:36 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67f6d8cc-05cf-ac8e-38c0-55578f9f595a@suse.com>
Message-ID: <ee1bfe4b-0f40-9beb-e891-47370436005d@suse.com>
Date: Fri, 6 Sep 2019 16:00:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <67f6d8cc-05cf-ac8e-38c0-55578f9f595a@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/3] x86: drop CONFIG_X86_MCE_THERMAL
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

VGhlcmUncyBubyBwb2ludCBoYXZpbmcgdGhpcyBpZiBpdCdzIG5vdCBleHBvc2VkIHRocm91Z2gg
S2NvbmZpZy4KClRha2UgdGhlIGxpYmVydHkgYW5kIGFsc28gZHJvcCBhbiB1bm5lY2Vzc2FyeSAi
cmV0dXJuIiBpbiBjb250ZXh0LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2FwaWMuYworKysgYi94ZW4vYXJjaC94ODYv
YXBpYy5jCkBAIC0xODksMTkgKzE4OSwxNSBAQCB2b2lkIGNsZWFyX2xvY2FsX0FQSUModm9pZCkK
ICAgICAgICAgdiA9IGFwaWNfcmVhZChBUElDX0xWVFBDKTsKICAgICAgICAgYXBpY193cml0ZShB
UElDX0xWVFBDLCB2IHwgQVBJQ19MVlRfTUFTS0VEKTsKICAgICB9Ci0KLS8qIGxldHMgbm90IHRv
dWNoIHRoaXMgaWYgd2UgZGlkbid0IGZyb2IgaXQgKi8KLSNpZmRlZiBDT05GSUdfWDg2X01DRV9U
SEVSTUFMCiAgICAgaWYgKG1heGx2dCA+PSA1KSB7CiAgICAgICAgIHYgPSBhcGljX3JlYWQoQVBJ
Q19MVlRUSE1SKTsKICAgICAgICAgYXBpY193cml0ZShBUElDX0xWVFRITVIsIHYgfCBBUElDX0xW
VF9NQVNLRUQpOwogICAgIH0KLSNlbmRpZgotCiAgICAgaWYgKG1heGx2dCA+PSA2KSB7CiAgICAg
ICAgIHYgPSBhcGljX3JlYWQoQVBJQ19DTUNJKTsKICAgICAgICAgYXBpY193cml0ZShBUElDX0NN
Q0ksIHYgfCBBUElDX0xWVF9NQVNLRUQpOwogICAgIH0KKwogICAgIC8qCiAgICAgICogQ2xlYW4g
QVBJQyBzdGF0ZSBmb3Igb3RoZXIgT1NzOgogICAgICAqLwpAQCAtMjEyLDExICsyMDgsOCBAQCB2
b2lkIGNsZWFyX2xvY2FsX0FQSUModm9pZCkKICAgICAgICAgYXBpY193cml0ZShBUElDX0xWVEVS
UiwgQVBJQ19MVlRfTUFTS0VEKTsKICAgICBpZiAobWF4bHZ0ID49IDQpCiAgICAgICAgIGFwaWNf
d3JpdGUoQVBJQ19MVlRQQywgQVBJQ19MVlRfTUFTS0VEKTsKLQotI2lmZGVmIENPTkZJR19YODZf
TUNFX1RIRVJNQUwKICAgICBpZiAobWF4bHZ0ID49IDUpCiAgICAgICAgIGFwaWNfd3JpdGUoQVBJ
Q19MVlRUSE1SLCBBUElDX0xWVF9NQVNLRUQpOwotI2VuZGlmCiAgICAgaWYgKG1heGx2dCA+PSA2
KQogICAgICAgICBhcGljX3dyaXRlKEFQSUNfQ01DSSwgQVBJQ19MVlRfTUFTS0VEKTsKIAotLS0g
YS94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY2VfaW50ZWwuYworKysgYi94ZW4vYXJjaC94ODYv
Y3B1L21jaGVjay9tY2VfaW50ZWwuYwpAQCAtNTEsNyArNTEsNiBAQCBib29sIF9fcmVhZF9tb3N0
bHkgbG1jZV9zdXBwb3J0OwogI2RlZmluZSBJTlRFTF9TUkFSX0RBVEFfTE9BRAkweDEzNAogI2Rl
ZmluZSBJTlRFTF9TUkFSX0lOU1RSX0ZFVENICTB4MTUwCiAKLSNpZmRlZiBDT05GSUdfWDg2X01D
RV9USEVSTUFMCiAjZGVmaW5lIE1DRV9SSU5HICAgICAgICAgICAgICAgIDB4MQogc3RhdGljIERF
RklORV9QRVJfQ1BVKGludCwgbGFzdF9zdGF0ZSk7CiAKQEAgLTE3NCw5ICsxNzMsNyBAQCBzdGF0
aWMgdm9pZCBpbnRlbF9pbml0X3RoZXJtYWwoc3RydWN0IGNwCiAgICAgaWYgKCBvcHRfY3B1X2lu
Zm8gKQogICAgICAgICBwcmludGsoS0VSTl9JTkZPICJDUFUldTogVGhlcm1hbCBtb25pdG9yaW5n
IGVuYWJsZWQgKCVzKVxuIiwKICAgICAgICAgICAgICAgIGNwdSwgdG0yID8gIlRNMiIgOiAiVE0x
Iik7Ci0gICAgcmV0dXJuOwogfQotI2VuZGlmIC8qIENPTkZJR19YODZfTUNFX1RIRVJNQUwgKi8K
IAogLyogSW50ZWwgTUNFIGhhbmRsZXIgKi8KIHN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlbF9nZXRf
ZXh0ZW5kZWRfbXNyKHN0cnVjdCBtY2luZm9fZXh0ZW5kZWQgKmV4dCwgdTMyIG1zcikKQEAgLTk0
MSw5ICs5MzgsOCBAQCBlbnVtIG1jaGVja190eXBlIGludGVsX21jaGVja19pbml0KHN0cnVjCiAg
ICAgaW50ZWxfaW5pdF9tY2UoKTsKIAogICAgIGludGVsX2luaXRfY21jaShjKTsKLSNpZmRlZiBD
T05GSUdfWDg2X01DRV9USEVSTUFMCisKICAgICBpbnRlbF9pbml0X3RoZXJtYWwoYyk7Ci0jZW5k
aWYKIAogICAgIHJldHVybiBtY2hlY2tfaW50ZWw7CiB9Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvY29uZmlnLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaApAQCAtMjEsNyAr
MjEsNiBAQAogCiAjZGVmaW5lIENPTkZJR19YODZfUE1fVElNRVIgMQogI2RlZmluZSBDT05GSUdf
SFBFVF9USU1FUiAxCi0jZGVmaW5lIENPTkZJR19YODZfTUNFX1RIRVJNQUwgMQogI2RlZmluZSBD
T05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyAxCiAjZGVmaW5lIENPTkZJR19E
SVNDT05USUdNRU0gMQogI2RlZmluZSBDT05GSUdfTlVNQV9FTVUgMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
