Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0974E8B068
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 09:02:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQlJ-0005DV-W6; Tue, 13 Aug 2019 06:58:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxQlJ-0005DK-3b
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:58:29 +0000
X-Inumbo-ID: e4c30aec-bd26-11e9-921e-0bdc7fa6004d
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e4c30aec-bd26-11e9-921e-0bdc7fa6004d;
 Mon, 12 Aug 2019 17:30:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A75A15AB;
 Mon, 12 Aug 2019 10:30:35 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD6FF3F706;
 Mon, 12 Aug 2019 10:30:34 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:00 +0100
Message-Id: <20190812173019.11956-10-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 09/28] xen/arm32: head: Mark the end of
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabllini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cHV0bigpIGFuZCBwdXRzKCkgYXJlIHR3byBzdWJyb3V0aW5lcy4gQWRkIEVORFBST0MgZm9yIHRo
ZSBiZW5lZml0cyBvZgpzdGF0aWMgYW5hbHlzaXMgdG9vbHMgYW5kIHRoZSByZWFkZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpBY2tlZC1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmxsaW5pQGtlcm5lbC5vcmc+CgotLS0KICAgIENoYW5n
ZXMgaW4gdjM6CiAgICAgICAgLSBBZGQgU3RlZmFubydzIGFja2VkLWJ5CgogICAgQ2hhbmdlcyBp
biB2MjoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQu
UyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwppbmRl
eCA5OWY0YWYxOGQ4Li44YjRjOGE0NzE0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTUxOCw2ICs1MTgsNyBA
QCBwdXRzOgogICAgICAgICBtb3ZlcSBwYywgbHIKICAgICAgICAgZWFybHlfdWFydF90cmFuc21p
dCByMTEsIHIxCiAgICAgICAgIGIgcHV0cworRU5EUFJPQyhwdXRzKQogCiAvKgogICogUHJpbnQg
YSAzMi1iaXQgbnVtYmVyIGluIGhleC4gIFNwZWNpZmljIHRvIHRoZSBQTDAxMSBVQVJULgpAQCAt
NTM3LDYgKzUzOCw3IEBAIHB1dG46CiAgICAgICAgIHN1YnMgIHIzLCByMywgIzEKICAgICAgICAg
Ym5lICAgMWIKICAgICAgICAgbW92ICAgcGMsIGxyCitFTkRQUk9DKHB1dG4pCiAKIGhleDogICAg
LmFzY2lpICIwMTIzNDU2Nzg5YWJjZGVmIgogICAgICAgICAuYWxpZ24gMgotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
