Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4114721B2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 23:39:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq2S4-0001vF-71; Tue, 23 Jul 2019 21:36:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wlUe=VU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hq2S2-0001vA-HZ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 21:36:02 +0000
X-Inumbo-ID: dcf360ae-ad91-11e9-93d8-a38452e62f58
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id dcf360ae-ad91-11e9-93d8-a38452e62f58;
 Tue, 23 Jul 2019 21:36:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C868A28;
 Tue, 23 Jul 2019 14:35:59 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C36173F71F;
 Tue, 23 Jul 2019 14:35:58 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2019 22:35:46 +0100
Message-Id: <20190723213553.22300-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH 0/7] xen/arm: Xen hardening for newer Armv8
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBpcyBhIG5vdC15ZXQgY29tcGxldGUgc2VyaWVzIHRvIGhhcmRlbiBYZW4g
Zm9yIGxhdGVyIHJldmlzaW9uIG9mCkFybXY4LiBUaGUgbWFpbiBnb2FscyBhcmU6CiAgICAtIFJl
ZHVjaW5nIHRoZSBudW1iZXIgb2YgQlVHX09OKCkgdG8gY2hlY2sgZ3Vlc3Qgc3RhdGUKICAgIC0g
Rml4IHN5c3RlbSByZWdpc3RlcnMgc2l6ZSBhcyB0aGV5IGFyZSBhbHdheXMgNjQtYml0IG9uIEFB
cmNoNjQKICAgIChub3QgMzItYml0ISkuCgpUaGVyZSBhcmUgbW9yZSB3b3JrIHRvIGRvLiBJIHdp
bGwgc2VuZCB0aGVtIGluIHNtYWxsZXIgYmF0Y2ggYXMgSSBmaW5kCnNwYXJlIHRpbWUgdG8gcmV3
b3JrIGJpdHMgb2YgWGVuLgoKTm90ZSB0aGF0IHBhdGNoICMxIHdhcyBhbHJlYWR5IHNlbnQgc2Vw
YXJhdGVseSBidXQgYWRkZWQgaGVyZSBmb3IgY29udmVuaWVuY2UuCgpDaGVlcnMsCgpKdWxpZW4g
R3JhbGwgKDcpOgogIHhlbi9wdWJsaWM6IGFyY2gtYXJtOiBSZXN0cmljdCB0aGUgdmlzaWJpbGl0
eSBvZiBzdHJ1Y3QKICAgIHZjcHVfZ3Vlc3RfY29yZV9yZWdzCiAgeGVuL2FybTogU0NUTFJfRUwx
IGlzIGEgNjQtYml0IHJlZ2lzdGVyIG9uIEFybTY0CiAgeGVuL2FybTogUmV3b3JrIHBzcl9tb2Rl
X2lzXzMyYml0KCkKICB4ZW4vYXJtOiB0cmFwczogQXZvaWQgdXNpbmcgQlVHX09OKCkgaW4gX3No
b3dfcmVnaXN0ZXJzKCkKICB4ZW4vYXJtOiB0cmFwczogQXZvaWQgQlVHX09OKCkgaW4gZG9fdHJh
cF9icmsoKQogIHhlbi9hcm06IHZzbWM6IFRoZSBmdW5jdGlvbiBpZGVudGlmaWVyIGlzIGFsd2F5
cyAzMi1iaXQKICB4ZW4vYXJtOiB0eXBlczogU3BlY2lmeSB0aGUgemVybyBwYWRkaW5nIGluIHRo
ZSBkZWZpbml0aW9uIG9mCiAgICBQUklyZWdpc3RlcgoKIHRvb2xzL3hlbnRyYWNlL3hlbmN0eC5j
ICAgICAgIHwgIDQgKystCiB4ZW4vYXJjaC9hcm0vZ3Vlc3Rfd2Fsay5jICAgICB8ICAyICstCiB4
ZW4vYXJjaC9hcm0vdHJhcHMuYyAgICAgICAgICB8IDczICsrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL2FybS92c21jLmMgICAgICAgICAgIHwgIDQg
Ky0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oICB8ICAzICstCiB4ZW4vaW5jbHVkZS9h
c20tYXJtL3AybS5oICAgICB8ICA0ICstLQogeGVuL2luY2x1ZGUvYXNtLWFybS9yZWdzLmggICAg
fCAgOSArKysrKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vdHlwZXMuaCAgIHwgIDQgKy0tCiB4ZW4v
aW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCB8IDI4ICsrKysrKysrLS0tLS0tLS0tCiA5IGZpbGVz
IGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDYzIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
