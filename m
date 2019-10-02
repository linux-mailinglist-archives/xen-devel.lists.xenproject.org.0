Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2DEC9060
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 20:04:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFivt-0005I8-Ay; Wed, 02 Oct 2019 18:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFivr-0005Hb-LC
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 18:00:59 +0000
X-Inumbo-ID: 96a62a7a-e53e-11e9-8628-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 96a62a7a-e53e-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 18:00:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF84815A1;
 Wed,  2 Oct 2019 11:00:58 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E25773F706;
 Wed,  2 Oct 2019 11:00:57 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:00:47 +0100
Message-Id: <20191002180047.17144-7-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191002180047.17144-1-julien.grall@arm.com>
References: <20191002180047.17144-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 6/6] xen/arm: traps: Mark
 check_stack_alignment_constraints as unused
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
Cc: Artem_Mygaiev@epam.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhbmcgd2lsbCB0aHJvdyBhbiBlcnJvciBpZiBhIGZ1bmN0aW9uIGlzIHVudXNlZCB1bmxlc3Mg
eW91IHRlbGwKdG8gaWdub3JlIGl0LiBUaGlzIGNhbiBiZSBkb25lIHVzaW5nIF9fbWF5YmVfdW51
c2VkLgoKV2hpbGUgbW9kaWZ5aW5nIHRoZSBkZWNsYXJhdGlvbiwgdXBkYXRlIGl0IHRvIG1hdGNo
IHByb3RvdHlwZSBvZiBzaW1pbGFyCmZ1bmN0aW9ucyAoc2VlIGJ1aWxkX2Fzc2VydGlvbnMpLiBU
aGlzIGhlbHBzIHRvIHVuZGVyc3RhbmQgdGhhdCB0aGUgc29sZQpwdXJwb3NlIG9mIHRoZSBmdW5j
dGlvbiBpcyB0byBob2xkIEJVSUxEX0JVR19PTigpLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAg
ICAtIFVwZGF0ZSB0aGUgcHJvdG90eXBlIHRvIG1hdGNoIHN0eWxlIG9mIG90aGVyIGZ1bmN0aW9u
cyBob2xkaW5nCiAgICAgICAgb24gYnVpbGQgYXNzZXJ0aW9ucy4KLS0tCiB4ZW4vYXJjaC9hcm0v
dHJhcHMuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0v
dHJhcHMuYwppbmRleCBhM2I5NjFiZDA2Li5hM2RlYjU5MzcyIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC9hcm0vdHJhcHMuYworKysgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwpAQCAtNTQsNyArNTQsOCBA
QAogICogdGhhdCBib3RoIHRoZSBrZXJuZWwgaGFsZiBvZiBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAo
d2hpY2ggaXMgcHVzaGVkIGluCiAgKiBlbnRyeS5TKSBhbmQgc3RydWN0IGNwdV9pbmZvICh3aGlj
aCBsaXZlcyBhdCB0aGUgYm90dG9tIG9mIGEgWGVuCiAgKiBzdGFjaykgbXVzdCBiZSBkb3VibGV3
b3JkLWFsaWduZWQgaW4gc2l6ZS4gICovCi1zdGF0aWMgaW5saW5lIHZvaWQgY2hlY2tfc3RhY2tf
YWxpZ25tZW50X2NvbnN0cmFpbnRzKHZvaWQpIHsKK3N0YXRpYyB2b2lkIF9faW5pdCBfX21heWJl
X3VudXNlZCBidWlsZF9hc3NlcnRpb25zKHZvaWQpCit7CiAjaWZkZWYgQ09ORklHX0FSTV82NAog
ICAgIEJVSUxEX0JVR19PTigoc2l6ZW9mIChzdHJ1Y3QgY3B1X3VzZXJfcmVncykpICYgMHhmKTsK
ICAgICBCVUlMRF9CVUdfT04oKG9mZnNldG9mKHN0cnVjdCBjcHVfdXNlcl9yZWdzLCBzcHNyX2Vs
MSkpICYgMHhmKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
