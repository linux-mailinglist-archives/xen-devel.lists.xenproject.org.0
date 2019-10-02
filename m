Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA2C905D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 20:03:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiw6-0005Od-9h; Wed, 02 Oct 2019 18:01:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFiw5-0005O6-2w
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 18:01:13 +0000
X-Inumbo-ID: 96037564-e53e-11e9-971c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 96037564-e53e-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 18:00:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABDA41597;
 Wed,  2 Oct 2019 11:00:57 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF5153F706;
 Wed,  2 Oct 2019 11:00:56 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:00:46 +0100
Message-Id: <20191002180047.17144-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191002180047.17144-1-julien.grall@arm.com>
References: <20191002180047.17144-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 5/6] xen/arm: mm: Mark
 check_memory_layout_alignment_constraints as unused
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
bW0uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwpp
bmRleCA5ZTBmZGMzOWY5Li5iZTIzYWNmZTI2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0u
YworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTkwLDcgKzE5MCw4IEBAIHVuc2lnbmVkIGxv
bmcgdG90YWxfcGFnZXM7CiBleHRlcm4gY2hhciBfX2luaXRfYmVnaW5bXSwgX19pbml0X2VuZFtd
OwogCiAvKiBDaGVja2luZyBWQSBtZW1vcnkgbGF5b3V0IGFsaWdubWVudC4gKi8KLXN0YXRpYyBp
bmxpbmUgdm9pZCBjaGVja19tZW1vcnlfbGF5b3V0X2FsaWdubWVudF9jb25zdHJhaW50cyh2b2lk
KSB7CitzdGF0aWMgdm9pZCBfX2luaXQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9ucyh2
b2lkKQorewogICAgIC8qIDJNQiBhbGlnbmVkIHJlZ2lvbnMgKi8KICAgICBCVUlMRF9CVUdfT04o
WEVOX1ZJUlRfU1RBUlQgJiB+U0VDT05EX01BU0spOwogICAgIEJVSUxEX0JVR19PTihGSVhNQVBf
QUREUigwKSAmIH5TRUNPTkRfTUFTSyk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
