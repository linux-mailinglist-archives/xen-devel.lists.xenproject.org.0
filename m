Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8078B03F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQhK-0002i9-I0; Tue, 13 Aug 2019 06:54:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxQhI-0002g2-Bb
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:54:20 +0000
X-Inumbo-ID: e3a0e620-bd26-11e9-a3f0-5f35362fd25f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e3a0e620-bd26-11e9-a3f0-5f35362fd25f;
 Mon, 12 Aug 2019 17:30:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 923E3174E;
 Mon, 12 Aug 2019 10:30:33 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D75B03F706;
 Mon, 12 Aug 2019 10:30:32 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:29:58 +0100
Message-Id: <20190812173019.11956-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 07/28] xen/arm64: head: Fix typo in the
 documentation on top of init_uart()
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

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQog
ICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2FyY2gvYXJt
L2FybTY0L2hlYWQuUyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4v
YXJjaC9hcm0vYXJtNjQvaGVhZC5TCmluZGV4IGNkMDMxMDExOTYuLmE2ZjNhYTRlZTUgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUwpAQCAtODI1LDcgKzgyNSw3IEBAIEVOVFJZKHN3aXRjaF90dGJyKQogLyoKICAqIElu
aXRpYWxpemUgdGhlIFVBUlQuIFNob3VsZCBvbmx5IGJlIGNhbGxlZCBvbiB0aGUgYm9vdCBDUFUu
CiAgKgotICogT3VwdXQ6CisgKiBPdXRwdXQ6CiAgKiAgeDIzOiBFYXJseSBVQVJUIGJhc2UgcGh5
c2ljYWwgYWRkcmVzcwogICoKICAqIENsb2JiZXJzIHgwIC0geDEKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
