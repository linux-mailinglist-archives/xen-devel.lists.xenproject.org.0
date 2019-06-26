Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6BA55D32
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 03:05:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfwLF-00030S-L1; Wed, 26 Jun 2019 01:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfwLD-000309-QN
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 01:03:15 +0000
X-Inumbo-ID: 2d2fde48-97ae-11e9-ab23-c744898eca6f
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d2fde48-97ae-11e9-ab23-c744898eca6f;
 Wed, 26 Jun 2019 01:03:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0150C2085A;
 Wed, 26 Jun 2019 01:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561510994;
 bh=8r+EKji2Tb+y0H78nEKldZkpS2EEWoxzRNuQiAM3Wek=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=zW7DrGA6aszlV/R6jWP+tWdQfcTj3t+PYpvBb0K/D1N68Ayw+90DZ6/sEXAi33Bkb
 JVP2LY2p/Dd6sER6XT/I0DL/VMw+XV9/e+SPrj0wvifm4hpVZlCHX2eAXBIUO2CiSW
 7wh2P+6k+No4jBZSPLPEQZJSeY33P6VATY/xYOow=
Date: Tue, 25 Jun 2019 18:03:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-12-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251754050.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-12-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 11/17] xen/arm64: head: Document enable_mmu()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IERvY3VtZW50IHRoZSBi
ZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiBlbmFibGVfbW11KCku
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
PiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDcgKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gaW5kZXggN2I5MmMxYzhl
Yi4uZDY3M2Y3YzBkOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4g
KysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC01ODMsNiArNTgzLDEzIEBAIHZp
cnRwaHlzX2NsYXNoOgo+ICAgICAgICAgIHJldAo+ICBFTkRQUk9DKGNyZWF0ZV9wYWdlX3RhYmxl
cykKPiAgCj4gKy8qCj4gKyAqIFR1cm4gb24gdGhlIERhdGEgQ2FjaGUgYW5kIHRoZSBNTVUuIFRo
ZSBmdW5jdGlvbiB3aWxsIHJldHVybiBvbiB0aGUgSUQKPiArICogbWFwcGluZy4gSW4gb3RoZXIg
d29yZCwgdGhlIGNhbGxlciBpcyByZXNwb25zaWJsZSB0byBzd2l0Y2ggdG8gdGhlIHJ1bnRpbWUK
PiArICogbWFwcGluZy4KPiArICoKPiArICogQ2xvYmJlcnMgeDAgLSB4MQo+ICsgKi8KCmFzIGl0
IGNhbGxzIFBSSU5ULCBzaG91bGRuJ3QgaXQgYmUgeDAgLSB4Mz8KCj4gIGVuYWJsZV9tbXU6Cj4g
ICAgICAgICAgUFJJTlQoIi0gVHVybmluZyBvbiBwYWdpbmcgLVxyXG4iKQo+ICAKPiAtLSAKPiAy
LjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
