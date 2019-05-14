Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C601C88C
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:25:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWRZ-0008NS-Vw; Tue, 14 May 2019 12:22:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRY-0008Ki-01
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:22:04 +0000
X-Inumbo-ID: e1362347-7642-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e1362347-7642-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:22:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB7BD15AD;
 Tue, 14 May 2019 05:22:02 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A859B3F71E;
 Tue, 14 May 2019 05:22:01 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:21:22 +0100
Message-Id: <20190514122136.28215-14-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 v2 07/19] xen/arm64: head: Remove
 unnecessary comment
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U28gZmFyLCB3ZSBkb24ndCBoYXZlIHNwZWNpZmljIGNvcmUgaW5pdGlhbGl6YXRpb24gYXQgYm9v
dC4gU28gcmVtb3ZlCnRoZSBjb21tZW50LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9h
bmlzb3ZAZXBhbS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBGaXggdHlw
byBpbiB0aGUgY29tbWl0IG1lc3NhZ2UKICAgICAgICAtIEFkZCBBbmRyaWkncyByZXZpZXdlZC1i
eQotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwppbmRleCBjYjMwZDZmMjJlLi5hZDQ0NmU3MzQ1IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMKQEAgLTM0NCw4ICszNDQsNiBAQCBlbDI6ICAgIFBSSU5UKCItIFhlbiBzdGFy
dGluZyBhdCBFTDIgLVxyXG4iKQogc2tpcF9ic3M6CiAgICAgICAgIFBSSU5UKCItIFNldHRpbmcg
dXAgY29udHJvbCByZWdpc3RlcnMgLVxyXG4iKQogCi0gICAgICAgIC8qIFhYWFggY2FsbCBQUk9D
SU5GT19jcHVfaW5pdCBoZXJlICovCi0KICAgICAgICAgLyogU2V0IHVwIG1lbW9yeSBhdHRyaWJ1
dGUgdHlwZSB0YWJsZXMgKi8KICAgICAgICAgbGRyICAgeDAsID1NQUlSVkFMCiAgICAgICAgIG1z
ciAgIG1haXJfZWwyLCB4MAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
