Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC11184B4A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:18:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKs6-0005fz-4j; Wed, 07 Aug 2019 12:16:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvKs5-0005fs-4Z
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:16:49 +0000
X-Inumbo-ID: 3a43adcc-b90d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3a43adcc-b90d-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:16:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6158E28;
 Wed,  7 Aug 2019 05:16:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA5343F575;
 Wed,  7 Aug 2019 05:16:46 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190807101028.28778-1-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7de9777c-ee83-e4f6-b12d-127bc3671c6b@arm.com>
Date: Wed, 7 Aug 2019 13:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807101028.28778-1-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 0/2] xen/arm: Consolidate make_timer_node
 and make_timer_domU_node
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaGFuayB5b3UgZm9yIGFkZGluZyB0aGUgY292ZXIgbGV0dGVyLiBBbHRob3VnaCwgb25l
IG1vcmUgcmVxdWVzdCA6KS4KClBsZWFzZSBDQyByZXZpZXdlcnMgb24geW91ciBjb3ZlciBsZXR0
ZXIuIE90aGVyd2lzZSwgaXQgd2lsbCBsaWtlbHkgbGFuZCBpbiBhIApkaWZmZXJlbnQgZm9sZGVy
IGFuZCBiZSBtaXNzZWQuCgpUaGUgc2NyaXB0IHNjcmlwdHMvYWRkX21haW50YWluZXJzLnBsIHNo
b3VsZCBkbyB0aGUgam9iIGZvciB5b3UuCgpDaGVlcnMsCgpPbiAwNy8wOC8yMDE5IDExOjEwLCBW
aWt0b3IgTWl0aW4gd3JvdGU6Cj4gRnVuY3Rpb25zIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90
aW1lcl9kb21VX25vZGUgYXJlIHF1aXRlIHNpbWlsYXIsCj4gc28gaXQgaXMgYmV0dGVyIHRvIGNv
bnNvbGlkYXRlIHRoZW0gdG8gYXZvaWQgZGlzY3JlcGFuY3kuCj4gCj4gVGhpcyBwYXRjaCBzZXJp
ZXMgYWNoaXZlcyB0aGlzIGdvYWwgaW4gdHdvIHN0ZXBzOgo+IC0gRXh0ZW5kIGZkdF9wcm9wZXJ0
eV9pbnRlcnJ1cHRzIHRvIGRlYWwgd2l0aCBvdGhlciBkb21haW4gdGhhbiB0aGUgaHdkb20uCj4g
LSBDb25zb2xpZGF0ZSBtYWtlX3RpbWVyX25vZGUgYW5kIG1ha2VfdGltZXJfZG9tVV9ub2RlIGlu
dG8gb25lIGZ1bmN0aW9uOgo+IAo+IFZpa3RvciBNaXRpbiAoMik6Cj4gICAgeGVuL2FybTogZXh0
ZW5kIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzIHRvIHN1cHBvcnQgRG9tVQo+ICAgIHhlbi9hcm06
IGNvbnNvbGlkYXRlIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9kb21VX25vZGUKPiAK
PiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDExOCArKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA3
NCBkZWxldGlvbnMoLSkKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
