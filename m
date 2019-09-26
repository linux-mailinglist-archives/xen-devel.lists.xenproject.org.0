Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AE9BF960
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 20:42:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDYeu-0002Sr-9b; Thu, 26 Sep 2019 18:38:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDYes-0002Rw-QZ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 18:38:30 +0000
X-Inumbo-ID: cf323ec6-e08c-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id cf323ec6-e08c-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 18:38:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 705BA1596;
 Thu, 26 Sep 2019 11:38:18 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A36583F67D;
 Thu, 26 Sep 2019 11:38:17 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 19:38:03 +0100
Message-Id: <20190926183808.11630-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190926183808.11630-1-julien.grall@arm.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH RFC for-4.13 05/10] xen/arm: alternative: Remove
 unused parameter for alternative_if_not_cap
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrii.anisov@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1hY3JvIGFsdGVybmF0aXZlX2lmX25vdF9jYXAgaXMgdGFraW5nIHR3byBwYXJhbWV0ZXJz
LiBUaGUgc2Vjb25kCnBhcmFtZXRlciBpcyBuZXZlciB1c2VkIGFuZCBpdCBpcyBoYXJkIHRvIHNl
ZSBob3cgdGhpcyBjYW4gYmUgdXNlZApjb3JyZWN0bHkgYXMgaXQgaXMgb25seSBwcm90ZWN0aW5n
IHRoZSBhbHRlcm5hdGl2ZSBzZWN0aW9uIG1hZ2ljLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2FsdGVy
bmF0aXZlLmggfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FsdGVybmF0aXZlLmgg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL2FsdGVybmF0aXZlLmgKaW5kZXggZGVkYjZkZDAwMS4uMjgz
MGE2ZGEyZCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hbHRlcm5hdGl2ZS5oCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYWx0ZXJuYXRpdmUuaApAQCAtMTE2LDEzICsxMTYsMTEg
QEAgaW50IGFwcGx5X2FsdGVybmF0aXZlcyhjb25zdCBzdHJ1Y3QgYWx0X2luc3RyICpzdGFydCwg
Y29uc3Qgc3RydWN0IGFsdF9pbnN0ciAqZW4KICAqIFRoZSBjb2RlIHRoYXQgZm9sbG93cyB0aGlz
IG1hY3JvIHdpbGwgYmUgYXNzZW1ibGVkIGFuZCBsaW5rZWQgYXMKICAqIG5vcm1hbC4gVGhlcmUg
YXJlIG5vIHJlc3RyaWN0aW9ucyBvbiB0aGlzIGNvZGUuCiAgKi8KLS5tYWNybyBhbHRlcm5hdGl2
ZV9pZl9ub3QgY2FwLCBlbmFibGUgPSAxCi0JLmlmIFxlbmFibGUKKy5tYWNybyBhbHRlcm5hdGl2
ZV9pZl9ub3QgY2FwCiAJLnB1c2hzZWN0aW9uIC5hbHRpbnN0cnVjdGlvbnMsICJhIgogCWFsdGlu
c3RydWN0aW9uX2VudHJ5IDY2MWYsIDY2M2YsIFxjYXAsIDY2MmYtNjYxZiwgNjY0Zi02NjNmCiAJ
LnBvcHNlY3Rpb24KIDY2MToKLQkuZW5kaWYKIC5lbmRtCiAKIC8qCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
