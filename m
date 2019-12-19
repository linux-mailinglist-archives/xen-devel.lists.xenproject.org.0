Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B74126222
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 13:27:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihus7-0003jH-7j; Thu, 19 Dec 2019 12:25:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FCfx=2J=arm.com=mark.brown@srs-us1.protection.inumbo.net>)
 id 1ihus5-0003jC-QB
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 12:25:37 +0000
X-Inumbo-ID: a92ee296-225a-11ea-919a-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a92ee296-225a-11ea-919a-12813bfff9fa;
 Thu, 19 Dec 2019 12:25:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5FA731B;
 Thu, 19 Dec 2019 04:25:36 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 243E83F719;
 Thu, 19 Dec 2019 04:25:35 -0800 (PST)
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Date: Thu, 19 Dec 2019 12:25:32 +0000
Message-Id: <20191219122532.6538-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] arm64: xen: Use modern annotations for
 assembly functions
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
Cc: xen-devel@lists.xenproject.org, Mark Brown <broonie@kernel.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gYW4gZWZmb3J0IHRvIGNsYXJpZnkgYW5kIHNpbXBsaWZ5IHRoZSBhbm5vdGF0aW9uIG9mIGFz
c2VtYmx5IGZ1bmN0aW9ucwppbiB0aGUga2VybmVsIG5ldyBtYWNyb3MgaGF2ZSBiZWVuIGludHJv
ZHVjZWQuIFRoZXNlIHJlcGxhY2UgRU5UUlkgYW5kCkVORFBST0MuIFVwZGF0ZSB0aGUgYW5ub3Rh
dGlvbnMgaW4gdGhlIHhlbiBjb2RlIHRvIHRoZSBuZXcgbWFjcm9zLgoKU2lnbmVkLW9mZi1ieTog
TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KLS0tCiBhcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUyB8IDggKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC94ZW4vaHlwZXJjYWxsLlMgYi9hcmNoL2FybTY0L3hlbi9o
eXBlcmNhbGwuUwppbmRleCBjNWYwNWM0YTRkMDAuLjViMDlhY2E1NTEwOCAxMDA2NDQKLS0tIGEv
YXJjaC9hcm02NC94ZW4vaHlwZXJjYWxsLlMKKysrIGIvYXJjaC9hcm02NC94ZW4vaHlwZXJjYWxs
LlMKQEAgLTU2LDExICs1NiwxMSBAQAogI2RlZmluZSBYRU5fSU1NIDB4RUExCiAKICNkZWZpbmUg
SFlQRVJDQUxMX1NJTVBMRShoeXBlcmNhbGwpCQlcCi1FTlRSWShIWVBFUlZJU09SXyMjaHlwZXJj
YWxsKQkJCVwKK1NZTV9GVU5DX1NUQVJUKEhZUEVSVklTT1JfIyNoeXBlcmNhbGwpCQlcCiAJbW92
IHgxNiwgI19fSFlQRVJWSVNPUl8jI2h5cGVyY2FsbDsJXAogCWh2YyBYRU5fSU1NOwkJCQlcCiAJ
cmV0OwkJCQkJXAotRU5EUFJPQyhIWVBFUlZJU09SXyMjaHlwZXJjYWxsKQorU1lNX0ZVTkNfRU5E
KEhZUEVSVklTT1JfIyNoeXBlcmNhbGwpCiAKICNkZWZpbmUgSFlQRVJDQUxMMCBIWVBFUkNBTExf
U0lNUExFCiAjZGVmaW5lIEhZUEVSQ0FMTDEgSFlQRVJDQUxMX1NJTVBMRQpAQCAtODYsNyArODYs
NyBAQCBIWVBFUkNBTEwyKG11bHRpY2FsbCk7CiBIWVBFUkNBTEwyKHZtX2Fzc2lzdCk7CiBIWVBF
UkNBTEwzKGRtX29wKTsKIAotRU5UUlkocHJpdmNtZF9jYWxsKQorU1lNX0ZVTkNfU1RBUlQocHJp
dmNtZF9jYWxsKQogCW1vdiB4MTYsIHgwCiAJbW92IHgwLCB4MQogCW1vdiB4MSwgeDIKQEAgLTEw
OSw0ICsxMDksNCBAQCBFTlRSWShwcml2Y21kX2NhbGwpCiAJICovCiAJdWFjY2Vzc190dGJyMF9k
aXNhYmxlIHg2LCB4NwogCXJldAotRU5EUFJPQyhwcml2Y21kX2NhbGwpOworU1lNX0ZVTkNfRU5E
KHByaXZjbWRfY2FsbCk7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
