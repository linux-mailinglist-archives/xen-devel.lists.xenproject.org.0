Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415DD12BCEA
	for <lists+xen-devel@lfdr.de>; Sat, 28 Dec 2019 07:56:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1il5wi-0002P8-BP; Sat, 28 Dec 2019 06:51:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/3VV=2S=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1il1ae-0005zz-2r
 for xen-devel@lists.xenproject.org; Sat, 28 Dec 2019 02:12:28 +0000
X-Inumbo-ID: 76f2b3f2-2917-11ea-b6f1-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.191])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76f2b3f2-2917-11ea-b6f1-bc764e2007e4;
 Sat, 28 Dec 2019 02:12:16 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E7744630B12EED7488EB;
 Sat, 28 Dec 2019 10:12:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Sat, 28 Dec 2019 10:12:03 +0800
From: Wei Xu <xuwei5@hisilicon.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 <xen-devel@lists.xenproject.org>
Date: Sat, 28 Dec 2019 10:08:42 +0800
Message-ID: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 28 Dec 2019 06:51:32 +0000
Subject: [Xen-devel] [PATCH] xen/arm: vgic-v3: Fix the typo of GICD IRQ
 active status range
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
Cc: prime.zeng@hisilicon.com, shameerali.kolothum.thodi@huawei.com,
 xuwei5@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBmaXhlcyB0aGUgdHlwbyBhYm91dCB0aGUgYWN0aXZlIHN0YXR1cyByYW5nZSBv
ZiBhbiBJUlEKdmlhIEdJQ0QuIE90aGVyd2lzZSBpdCB3aWxsIGJlIGZhaWxlZCB0byBoYW5kbGUg
dGhlIG1taW8gYWNjZXNzIGFuZAppbmplY3QgYSBkYXRhIGFib3J0LgoKRml4ZXM6IGEyYjgzZjk1
YmZhZCAoInhlbi9hcm06IHZnaWM6IFByb3Blcmx5IGVtdWxhdGUgdGhlIGZ1bGwgcmVnaXN0ZXIi
KQoKU2lnbmVkLW9mZi1ieTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29uLmNvbT4KLS0tCiB4ZW4v
YXJjaC9hcm0vdmdpYy12My5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYyBiL3hl
bi9hcmNoL2FybS92Z2ljLXYzLmMKaW5kZXggNDIyYjk0Zi4uZTgwMmYyMCAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gvYXJtL3ZnaWMtdjMuYworKysgYi94ZW4vYXJjaC9hcm0vdmdpYy12My5jCkBAIC03
MDYsNyArNzA2LDcgQEAgc3RhdGljIGludCBfX3ZnaWNfdjNfZGlzdHJfY29tbW9uX21taW9fcmVh
ZChjb25zdCBjaGFyICpuYW1lLCBzdHJ1Y3QgdmNwdSAqdiwKICAgICAgICAgZ290byByZWFkX2Fz
X3plcm87CiAKICAgICAvKiBSZWFkIHRoZSBhY3RpdmUgc3RhdHVzIG9mIGFuIElSUSB2aWEgR0lD
RC9HSUNSIGlzIG5vdCBzdXBwb3J0ZWQgKi8KLSAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNBQ1RJ
VkVSLCBHSUNEX0lTQUNUSVZFUik6CisgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lTQUNUSVZFUiwg
R0lDRF9JU0FDVElWRVJOKToKICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUNBQ1RJVkVSLCBHSUNE
X0lDQUNUSVZFUk4pOgogICAgICAgICBnb3RvIHJlYWRfYXNfemVybzsKIAotLSAKMi44LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
