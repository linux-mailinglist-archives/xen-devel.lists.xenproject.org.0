Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F9417E2B
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 18:37:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOPWG-0002LQ-VE; Wed, 08 May 2019 16:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7fFX=TI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOPWF-0002LI-Pa
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 16:34:11 +0000
X-Inumbo-ID: 1b7321b2-71af-11e9-9a51-4342d0c48583
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1b7321b2-71af-11e9-9a51-4342d0c48583;
 Wed, 08 May 2019 16:34:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39EFC374;
 Wed,  8 May 2019 09:34:10 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F0273F238;
 Wed,  8 May 2019 09:34:09 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
 <ec3339b0-6588-2a54-d0db-1e9c157f9259@arm.com>
 <128c02c6-412a-bb65-c665-133c525e506e@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <08ad173c-2c2c-967c-84fa-6b848ab52659@arm.com>
Date: Wed, 8 May 2019 17:34:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <128c02c6-412a-bb65-c665-133c525e506e@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 0/4] Renesas Stout board support (R-Car
 Gen2)
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOC8wNS8yMDE5IDE3OjMwLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gT24gMDguMDUuMTkg
MTk6MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgT2xla3NhbmRyLAo+IAo+IEhpIEp1bGll
bgo+IAo+IAo+Pgo+PiBPbiAwMi8wNS8yMDE5IDE4OjAwLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToKPj4+IE9sZWtzYW5kciBUeXNoY2hlbmtvICg0KToKPj4+IMKgwqAgeGVuL2FybTogZHJp
dmVyczogc2NpZjogRXh0ZW5kIGRyaXZlciB0byBoYW5kbGUgb3RoZXIgaW50ZXJmYWNlcwo+Pj4g
wqDCoCB4ZW4vYXJtOiBkcml2ZXJzOiBzY2lmOiBBZGQgc3VwcG9ydCBmb3IgU0NJRkEgY29tcGF0
aWJsZSBVQVJUcwo+Pgo+PiBJIGhhdmUgbWVyZ2VkIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBpbiBt
eSBicmFuY2ggeGVuLTQuMTMuIEkgd2lsbCBtZXJnZSB0aGVtIAo+PiBpbiBzdGFnaW5nIG9uIHRo
ZSB0cmVlIGlzIHJlb3BlbmVkLgo+IAo+IFRoYW5rIHlvdSEKPiAKPiAKPiBKdXN0IHRvIGNsYXJp
Znk6Cj4gCj4gV2UgYXJlIHdhaXRpbmcgZm9yIHRoZSByZXZpZXcgZnJvbSBTdGVmYW5vIGZvciB0
aGUgZm9sbG93aW5nIHBhdGNoOgo+IAo+ICJbUEFUQ0ggVjUgMy80XSB4ZW4vYXJtOiBFeHRlbmQg
U0NJRiBlYXJseSBwcmluayBjb2RlIHRvIGhhbmRsZSBvdGhlciBpbnRlcmZhY2VzIgo+IAo+IAo+
IEFtIEkgY29ycmVjdD8KClRoYXQncyBjb3JyZWN0LiBJZiBJIGRvbid0IGhlYXIgYW55dGhpbmcg
YnkgTW9uZGF5LCBJIHdpbGwgbWVyZ2UgdGhlIHR3byBwYXRjaGVzLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
