Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6920AAFFDC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84Pc-0001ax-MR; Wed, 11 Sep 2019 15:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VrDL=XG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i84Pb-0001Vm-HQ
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:20:03 +0000
X-Inumbo-ID: a041242e-d4a7-11e9-83d7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a041242e-d4a7-11e9-83d7-12813bfff9fa;
 Wed, 11 Sep 2019 15:20:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24D6A28;
 Wed, 11 Sep 2019 08:20:02 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EE313F67D;
 Wed, 11 Sep 2019 08:20:01 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 16:19:42 +0100
Message-Id: <20190911151942.28459-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: bootfd: Fix indentation in
 process_multiboot_node()
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

T25lIGxpbmUgaW4gcHJvY2Vzc19tdWx0aWJvb3Rfbm9kZSgpIGlzIHVzaW5nIGhhcmQgdGFiIHJh
dGhlciB0aGFuIHNvZnQKdGFiLiBTbyBmaXggaXQhCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwpp
bmRleCAyNThiMDU3ZjAwLi42MjMxNzNiYzdmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYm9v
dGZkdC5jCisrKyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKQEAgLTI2NCw3ICsyNjQsNyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tdWx0aWJvb3Rfbm9kZShjb25zdCB2b2lkICpmZHQs
IGludCBub2RlLAogICAgICAgICBjYXNlIDE6IGtpbmQgPSBCT09UTU9EX1JBTURJU0s7IGJyZWFr
OwogICAgICAgICBkZWZhdWx0OiBicmVhazsKICAgICAgICAgfQotCWlmICgga2luZF9ndWVzcyA+
IDEgJiYgaGFzX3hzbV9tYWdpYyhzdGFydCkgKQorICAgICAgICBpZiAoIGtpbmRfZ3Vlc3MgPiAx
ICYmIGhhc194c21fbWFnaWMoc3RhcnQpICkKICAgICAgICAgICAgIGtpbmQgPSBCT09UTU9EX1hT
TTsKICAgICB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
