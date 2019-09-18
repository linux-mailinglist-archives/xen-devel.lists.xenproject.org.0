Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF210B6228
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 13:22:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXvL-0008J7-Jp; Wed, 18 Sep 2019 11:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FY6t=XN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAXvJ-0008J2-Me
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:15:01 +0000
X-Inumbo-ID: 8ce9d6ba-da05-11e9-b76c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8ce9d6ba-da05-11e9-b76c-bc764e2007e4;
 Wed, 18 Sep 2019 11:14:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54C18337;
 Wed, 18 Sep 2019 04:14:58 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 146703F575;
 Wed, 18 Sep 2019 04:14:55 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4b6e25f7-5bcf-e2bb-0ac8-0eaba9686e4e@arm.com>
Date: Wed, 18 Sep 2019 12:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23938.2492.424579.175738@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMTgvMDkvMjAxOSAxMTo0MSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSnVsaWVu
IEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIGNyZWF0ZS1kaWZmLW9iamVjdDogbW9yZSBwcmVj
aXNlbHkgaWRlbnRpZnkgLnJvZGF0YSBzZWN0aW9ucyIpOgo+PiBPbiAxOC8wOS8yMDE5IDEwOjUy
LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4+PiAkIHNjcmlwdHMvLi9hZGRfbWFpbnRh
aW5lcnMucGwgLWQgfi9naXQvbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzCj4+Cj4+ICctZCcgb25seSB0
ZWxscyB5b3Ugd2hlcmUgdGhlIHBhdGNoZXMgZmlsZXMgYXJlLiBUaGUgc2NyaXB0IHdpbGwgbG9v
ayB1cCBmb3IgdGhlCj4+IE1BSU5UQUlORVJTIGZpbGUgaW4gdGhlIGN1cnJlbnQgZGlyZWN0b3J5
Lgo+IAo+IEhtbW0uICBJIHdvbmRlciBpZiB3ZSBjb3VsZCBkZXRlY3QgdGhpcyBzaXR1YXRpb24g
c29tZWhvdy4gIFRoaXMgd2lsbAo+IGJlIGEgY29tbW9uIHVzZXIgZXJyb3IgSSB0aGluay4KSSB0
aGluayBpdCB3b3VsZCBiZSBwb3NzaWJsZSBmb3IgcGF0Y2ggbW9kaWZ5aW5nIGZpbGUuIFdlIGNv
dWxkIGNoZWNrIHdoZXRoZXIgCnRoZSBmaWxlIG1vZGlmaWVkIGV4aXN0IGluIHRoZSByZXBvLiBU
aG91Z2gsIEkgYW0gbm90IHN1cmUgaG93IGRpZmZpY3VsdCBpdCAKd291bGQgYmUgdG8gaW1wbGVt
ZW50LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
