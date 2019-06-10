Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3745D3BCEA
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:34:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ1n-0007cY-S5; Mon, 10 Jun 2019 19:32:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1m-0007cJ-Vv
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:23 +0000
X-Inumbo-ID: 7763f4f6-8bb6-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7763f4f6-8bb6-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 19:32:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C956346;
 Mon, 10 Jun 2019 12:32:21 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5468B3F73C;
 Mon, 10 Jun 2019 12:32:20 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:31:59 +0100
Message-Id: <20190610193215.23704-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 01/17] xen/arm64: head Mark the end of
 subroutines with ENDPROC
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cHV0bigpIGFuZCBwdXRzKCkgYXJlIHR3byBzdWJyb3V0aW5lcy4gQWRkIEVORFBST0MgZm9yIHRo
ZSBiZW5lZml0cyBvZgpzdGF0aWMgYW5hbHlzaXMgdG9vbHMgYW5kIHRoZSByZWFkZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2Fy
bS9hcm02NC9oZWFkLlMKaW5kZXggZGRkM2EzMzEwOC4uYzhiYmRmMDVhNiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
CkBAIC02NDYsNiArNjQ2LDcgQEAgcHV0czoKICAgICAgICAgYiAgICAgcHV0cwogMToKICAgICAg
ICAgcmV0CitFTkRQUk9DKHB1dHMpCiAKIC8qIFByaW50IGEgMzItYml0IG51bWJlciBpbiBoZXgu
ICBTcGVjaWZpYyB0byB0aGUgUEwwMTEgVUFSVC4KICAqIHgwOiBOdW1iZXIgdG8gcHJpbnQuCkBA
IC02NjQsNiArNjY1LDcgQEAgcHV0bjoKICAgICAgICAgc3VicyAgeDMsIHgzLCAjMQogICAgICAg
ICBiLm5lICAxYgogICAgICAgICByZXQKK0VORFBST0MocHV0bikKIAogaGV4OiAgICAuYXNjaWkg
IjAxMjM0NTY3ODlhYmNkZWYiCiAgICAgICAgIC5hbGlnbiAyCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
