Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A958570BBC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2V-0002R5-AR; Mon, 22 Jul 2019 21:40:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2U-0002QR-75
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:10 +0000
X-Inumbo-ID: 462f4016-acc9-11e9-82ce-3b34b8d0f432
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 462f4016-acc9-11e9-82ce-3b34b8d0f432;
 Mon, 22 Jul 2019 21:40:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82D38152F;
 Mon, 22 Jul 2019 14:40:07 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0BC13F71F;
 Mon, 22 Jul 2019 14:40:06 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:25 +0100
Message-Id: <20190722213958.5761-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 02/35] xen/arm64: head: Mark the end of
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cHV0bigpIGFuZCBwdXRzKCkgYXJlIHR3byBzdWJyb3V0aW5lcy4gQWRkIEVORFBST0MgZm9yIHRo
ZSBiZW5lZml0cyBvZgpzdGF0aWMgYW5hbHlzaXMgdG9vbHMgYW5kIHRoZSByZWFkZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKLS0tCiAgICBD
aGFuZ2VzIGluIHYyOgogICAgICAgIC0gRml4IHR5cG8gaW4gdGhlIGNvbW1pdCB0aXRsZQogICAg
ICAgIC0gQWRkIFN0ZWZhbm8ncyByZXZpZXdlZC1ieQotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9o
ZWFkLlMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMK
aW5kZXggMDgwOTRhMjczZS4uZjJkNzQ0NWY2YSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC02MzgsNiArNjM4
LDcgQEAgcHV0czoKICAgICAgICAgYiAgICAgcHV0cwogMToKICAgICAgICAgcmV0CitFTkRQUk9D
KHB1dHMpCiAKIC8qIFByaW50IGEgMzItYml0IG51bWJlciBpbiBoZXguICBTcGVjaWZpYyB0byB0
aGUgUEwwMTEgVUFSVC4KICAqIHgwOiBOdW1iZXIgdG8gcHJpbnQuCkBAIC02NTYsNiArNjU3LDcg
QEAgcHV0bjoKICAgICAgICAgc3VicyAgeDMsIHgzLCAjMQogICAgICAgICBiLm5lICAxYgogICAg
ICAgICByZXQKK0VORFBST0MocHV0bikKIAogaGV4OiAgICAuYXNjaWkgIjAxMjM0NTY3ODlhYmNk
ZWYiCiAgICAgICAgIC5hbGlnbiAyCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
