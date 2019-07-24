Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D024E73149
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:12:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqHx7-0006Bk-LJ; Wed, 24 Jul 2019 14:09:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZIb3=VV=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1hqHx6-0006Bf-9I
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:09:08 +0000
X-Inumbo-ID: 97d005fe-ae1c-11e9-8980-bc764e045a96
Received: from huawei.com (unknown [45.249.212.191])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 97d005fe-ae1c-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 14:09:06 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B2EAF9EA050138488E51;
 Wed, 24 Jul 2019 22:09:02 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Wed, 24 Jul 2019
 22:08:56 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>
Date: Wed, 24 Jul 2019 22:08:50 +0800
Message-ID: <20190724140850.10760-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Subject: [Xen-devel] [PATCH] xen/pciback: remove set but not used variable
 'old_state'
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
ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZV9jYXBhYmlsaXR5LmM6IEluIGZ1bmN0aW9uIHBtX2N0
cmxfd3JpdGU6CmRyaXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZfc3BhY2VfY2FwYWJpbGl0eS5j
OjExOToyNTogd2FybmluZzoKIHZhcmlhYmxlIG9sZF9zdGF0ZSBzZXQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbmV2ZXIgdXNlZCBzbyBjYW4gYmUgcmVt
b3ZlZC4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVk
LW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMv
eGVuL3hlbi1wY2liYWNrL2NvbmZfc3BhY2VfY2FwYWJpbGl0eS5jIHwgMyArLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3hlbi94ZW4tcGNpYmFjay9jb25mX3NwYWNlX2NhcGFiaWxpdHkuYyBiL2RyaXZlcnMveGVu
L3hlbi1wY2liYWNrL2NvbmZfc3BhY2VfY2FwYWJpbGl0eS5jCmluZGV4IDczNDI3ZDguLmU1Njk0
MTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZfc3BhY2VfY2FwYWJp
bGl0eS5jCisrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZfc3BhY2VfY2FwYWJpbGl0
eS5jCkBAIC0xMTYsMTMgKzExNiwxMiBAQCBzdGF0aWMgaW50IHBtX2N0cmxfd3JpdGUoc3RydWN0
IHBjaV9kZXYgKmRldiwgaW50IG9mZnNldCwgdTE2IG5ld192YWx1ZSwKIHsKIAlpbnQgZXJyOwog
CXUxNiBvbGRfdmFsdWU7Ci0JcGNpX3Bvd2VyX3QgbmV3X3N0YXRlLCBvbGRfc3RhdGU7CisJcGNp
X3Bvd2VyX3QgbmV3X3N0YXRlOwogCiAJZXJyID0gcGNpX3JlYWRfY29uZmlnX3dvcmQoZGV2LCBv
ZmZzZXQsICZvbGRfdmFsdWUpOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0OwogCi0Jb2xkX3N0YXRl
ID0gKHBjaV9wb3dlcl90KShvbGRfdmFsdWUgJiBQQ0lfUE1fQ1RSTF9TVEFURV9NQVNLKTsKIAlu
ZXdfc3RhdGUgPSAocGNpX3Bvd2VyX3QpKG5ld192YWx1ZSAmIFBDSV9QTV9DVFJMX1NUQVRFX01B
U0spOwogCiAJbmV3X3ZhbHVlICY9IFBNX09LX0JJVFM7Ci0tIAoyLjcuNAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
