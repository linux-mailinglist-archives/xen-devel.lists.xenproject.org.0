Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA28EB39B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:12:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC5Y-0007Y2-Sl; Thu, 31 Oct 2019 15:10:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC5X-0007Wu-Am
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:10:15 +0000
X-Inumbo-ID: 7b1b11f0-fbf0-11e9-954c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7b1b11f0-fbf0-11e9-954c-12813bfff9fa;
 Thu, 31 Oct 2019 15:09:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F9D468D;
 Thu, 31 Oct 2019 08:09:49 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8BE3F71E;
 Thu, 31 Oct 2019 08:09:48 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:16 +0000
Message-Id: <20191031150922.22938-14-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 13/19] xen/arm: alternative: Remove
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <volodymyr.babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1hY3JvIGFsdGVybmF0aXZlX2lmX25vdF9jYXAgaXMgdGFraW5nIHR3byBwYXJhbWV0ZXJz
LiBUaGUgc2Vjb25kCnBhcmFtZXRlciBpcyBuZXZlciB1c2VkIGFuZCBpdCBpcyBoYXJkIHRvIHNl
ZSBob3cgdGhpcyBjYW4gYmUgdXNlZApjb3JyZWN0bHkgYXMgaXQgaXMgb25seSBwcm90ZWN0aW5n
IHRoZSBhbHRlcm5hdGl2ZSBzZWN0aW9uIG1hZ2ljLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVr
IDx2b2xvZHlteXIuYmFiY2h1a0BlcGFtLmNvbT4KQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCi0tLQoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAg
ICAgLSBBZGQgVm9sb2R5bXlyJ3MgcmV2aWV3ZWQtYnkKICAgICAgICAtIEFkZCBTdGVmYW5vJ3Mg
YWNrZWQtYnkKLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2FsdGVybmF0aXZlLmggfCA0ICstLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FsdGVybmF0aXZlLmggYi94ZW4vaW5jbHVkZS9hc20t
YXJtL2FsdGVybmF0aXZlLmgKaW5kZXggZGVkYjZkZDAwMS4uMjgzMGE2ZGEyZCAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hbHRlcm5hdGl2ZS5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vYWx0ZXJuYXRpdmUuaApAQCAtMTE2LDEzICsxMTYsMTEgQEAgaW50IGFwcGx5X2FsdGVy
bmF0aXZlcyhjb25zdCBzdHJ1Y3QgYWx0X2luc3RyICpzdGFydCwgY29uc3Qgc3RydWN0IGFsdF9p
bnN0ciAqZW4KICAqIFRoZSBjb2RlIHRoYXQgZm9sbG93cyB0aGlzIG1hY3JvIHdpbGwgYmUgYXNz
ZW1ibGVkIGFuZCBsaW5rZWQgYXMKICAqIG5vcm1hbC4gVGhlcmUgYXJlIG5vIHJlc3RyaWN0aW9u
cyBvbiB0aGlzIGNvZGUuCiAgKi8KLS5tYWNybyBhbHRlcm5hdGl2ZV9pZl9ub3QgY2FwLCBlbmFi
bGUgPSAxCi0JLmlmIFxlbmFibGUKKy5tYWNybyBhbHRlcm5hdGl2ZV9pZl9ub3QgY2FwCiAJLnB1
c2hzZWN0aW9uIC5hbHRpbnN0cnVjdGlvbnMsICJhIgogCWFsdGluc3RydWN0aW9uX2VudHJ5IDY2
MWYsIDY2M2YsIFxjYXAsIDY2MmYtNjYxZiwgNjY0Zi02NjNmCiAJLnBvcHNlY3Rpb24KIDY2MToK
LQkuZW5kaWYKIC5lbmRtCiAKIC8qCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
