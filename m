Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F52A4E2
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2019 16:27:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUXaN-0005zW-La; Sat, 25 May 2019 14:23:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y4rX=TZ=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1hUXaM-0005zR-Bc
 for xen-devel@lists.xenproject.org; Sat, 25 May 2019 14:23:46 +0000
X-Inumbo-ID: b1f5bb7a-7ef8-11e9-8980-bc764e045a96
Received: from huawei.com (unknown [45.249.212.35])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b1f5bb7a-7ef8-11e9-8980-bc764e045a96;
 Sat, 25 May 2019 14:23:43 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 11DD55A3F6E314F1B66A;
 Sat, 25 May 2019 22:23:40 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Sat, 25 May 2019
 22:23:30 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>
Date: Sat, 25 May 2019 22:21:51 +0800
Message-ID: <20190525142151.4664-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Subject: [Xen-devel] [PATCH -next] xen/pvcalls: Remove set but not used
 variable
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
Cc: xen-devel@lists.xenproject.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy94
ZW4vcHZjYWxscy1mcm9udC5jOiBJbiBmdW5jdGlvbiBwdmNhbGxzX2Zyb250X3NlbmRtc2c6CmRy
aXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYzo1NDM6MjU6IHdhcm5pbmc6IHZhcmlhYmxlIGJlZGF0
YSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQpkcml2ZXJzL3hl
bi9wdmNhbGxzLWZyb250LmM6IEluIGZ1bmN0aW9uIHB2Y2FsbHNfZnJvbnRfcmVjdm1zZzoKZHJp
dmVycy94ZW4vcHZjYWxscy1mcm9udC5jOjYzODoyNTogd2FybmluZzogdmFyaWFibGUgYmVkYXRh
IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpUaGV5IGFyZSBu
ZXZlciB1c2VkIHNpbmNlIGludHJvZHVjdGlvbi4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcg
PHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMg
fCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwpp
bmRleCA4YTI0OWM5NWMxOTMuLmQ3NDM4ZmRjNTcwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4v
cHZjYWxscy1mcm9udC5jCisrKyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwpAQCAtNTQw
LDcgKzU0MCw2IEBAIHN0YXRpYyBpbnQgX193cml0ZV9yaW5nKHN0cnVjdCBwdmNhbGxzX2RhdGFf
aW50ZiAqaW50ZiwKIGludCBwdmNhbGxzX2Zyb250X3NlbmRtc2coc3RydWN0IHNvY2tldCAqc29j
aywgc3RydWN0IG1zZ2hkciAqbXNnLAogCQkJICBzaXplX3QgbGVuKQogewotCXN0cnVjdCBwdmNh
bGxzX2JlZGF0YSAqYmVkYXRhOwogCXN0cnVjdCBzb2NrX21hcHBpbmcgKm1hcDsKIAlpbnQgc2Vu
dCwgdG90X3NlbnQgPSAwOwogCWludCBjb3VudCA9IDAsIGZsYWdzOwpAQCAtNTUyLDcgKzU1MSw2
IEBAIGludCBwdmNhbGxzX2Zyb250X3NlbmRtc2coc3RydWN0IHNvY2tldCAqc29jaywgc3RydWN0
IG1zZ2hkciAqbXNnLAogCW1hcCA9IHB2Y2FsbHNfZW50ZXJfc29jayhzb2NrKTsKIAlpZiAoSVNf
RVJSKG1hcCkpCiAJCXJldHVybiBQVFJfRVJSKG1hcCk7Ci0JYmVkYXRhID0gZGV2X2dldF9kcnZk
YXRhKCZwdmNhbGxzX2Zyb250X2Rldi0+ZGV2KTsKIAogCW11dGV4X2xvY2soJm1hcC0+YWN0aXZl
Lm91dF9tdXRleCk7CiAJaWYgKChmbGFncyAmIE1TR19ET05UV0FJVCkgJiYgIXB2Y2FsbHNfZnJv
bnRfd3JpdGVfdG9kbyhtYXApKSB7CkBAIC02MzUsNyArNjMzLDYgQEAgc3RhdGljIGludCBfX3Jl
YWRfcmluZyhzdHJ1Y3QgcHZjYWxsc19kYXRhX2ludGYgKmludGYsCiBpbnQgcHZjYWxsc19mcm9u
dF9yZWN2bXNnKHN0cnVjdCBzb2NrZXQgKnNvY2ssIHN0cnVjdCBtc2doZHIgKm1zZywgc2l6ZV90
IGxlbiwKIAkJICAgICBpbnQgZmxhZ3MpCiB7Ci0Jc3RydWN0IHB2Y2FsbHNfYmVkYXRhICpiZWRh
dGE7CiAJaW50IHJldDsKIAlzdHJ1Y3Qgc29ja19tYXBwaW5nICptYXA7CiAKQEAgLTY0NSw3ICs2
NDIsNiBAQCBpbnQgcHZjYWxsc19mcm9udF9yZWN2bXNnKHN0cnVjdCBzb2NrZXQgKnNvY2ssIHN0
cnVjdCBtc2doZHIgKm1zZywgc2l6ZV90IGxlbiwKIAltYXAgPSBwdmNhbGxzX2VudGVyX3NvY2so
c29jayk7CiAJaWYgKElTX0VSUihtYXApKQogCQlyZXR1cm4gUFRSX0VSUihtYXApOwotCWJlZGF0
YSA9IGRldl9nZXRfZHJ2ZGF0YSgmcHZjYWxsc19mcm9udF9kZXYtPmRldik7CiAKIAltdXRleF9s
b2NrKCZtYXAtPmFjdGl2ZS5pbl9tdXRleCk7CiAJaWYgKGxlbiA+IFhFTl9GTEVYX1JJTkdfU0la
RShQVkNBTExTX1JJTkdfT1JERVIpKQotLSAKMi4xNy4xCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
