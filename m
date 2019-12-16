Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C58120EA9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 16:59:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igsij-0006IR-GB; Mon, 16 Dec 2019 15:55:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igsii-0006IH-AD
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 15:55:40 +0000
X-Inumbo-ID: 7ac8495a-201c-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ac8495a-201c-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 15:55:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 839CAAC2C;
 Mon, 16 Dec 2019 15:55:27 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-4-anthony.perard@citrix.com>
 <9073662c-9cc4-cb6c-8402-941864cc779a@suse.com>
 <20191213154946.GM1155@perard.uk.xensource.com>
 <4022441e-bdbd-e78b-c8a4-d3fd9a09311a@suse.com>
 <b6dc71f0-1158-c6ac-18b6-fe72d495cde4@citrix.com>
 <ad54009f-8cc1-20f6-a9bb-630fda7f8d54@suse.com>
 <20191216135658.GA1267@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b4a6d47-0181-fac3-7a48-5cfbc85ee575@suse.com>
Date: Mon, 16 Dec 2019 16:55:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216135658.GA1267@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH 3/8] xen: Update Kconfig to Linux v5.4
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTIuMjAxOSAxNTowMSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gTW9uLCBEZWMg
MTYsIDIwMTkgYXQgMTE6MTY6NTJBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoYXQg
aGVhZGVycyBhcmUgeW91IHRha2luZyBhYm91dD8gTXkgcXVlc3Rpb24gd2FzIGFib3V0IHRoZSBw
bGFjZW1lbnQKPj4gb2YgLmdpdGlnbm9yZSBlbnRyaWVzIG9ubHkuIEknbSBwcmV0dHkgc3VyZSBJ
IGhhZCBwcmV2aW91c2x5IGV4cHJlc3NlZAo+PiB0aGF0IEknbSBub3Qgb3Zlcmx5IGhhcHB5IHRv
IHNlZSBuZWVkbGVzcyBzY2F0dGVyaW5nIGFyb3VuZCBvZiB0aGVtLgo+PiBJJ20gbWVyZWx5IHRy
eWluZyB0byB1bmRlcnN0YW5kIGlmIGhlcmUgd2UgaGF2ZSBhIGNhc2Ugb2YgIm5lZWRsZXNzIi4K
Pj4KPj4+IEkgZmluZCB5b3VyIGxhY2sgb2YgY29uc2lzdGVuY3kgaW4gcmV2aWV3IHJlcXVlc3Rz
IGltcG9zc2libGUgdG8gcHJlZGljdC4KPj4KPj4gV2hhdCBjb25zaXN0ZW5jeT8gV2hhdCdzIHdy
b25nIHdpdGggcHV0dGluZyB0aGUgdHdvIGxpbmVzIGluIHRoZSB0b3AKPj4gbGV2ZWwgLmdpdGln
bm9yZSwgb3Iga2VlcGluZyB0aGVtIHdoZXJlIHRoZXkgYXJlPyBJIGFueXdheSBkb3VidAo+PiB0
aGVyZSdzIGEgbmVlZCB0byBrZWVwIG91ciAuZ2l0aWdub3JlIGluIHN5bmMgd2l0aCBMaW51eCdl
cy4KPiAKPiBJIHRoaW5rIHNjYXR0ZXJpbmcgdGhlIC5naXRpZ25vcmUgYXJvdW5kIG1ha2UgdGhl
bSBlYXNpZXIgdG8gbWFuYWdlLAo+IGVzcGVjaWFsbHkgd2hlbiBlbnRyaWVzIGFyZW4ndCB1c2Vm
dWwgYW55bW9yZS4gT3RoZXJ3aXNlLCB3ZSBlbmQgdXAKPiB3aXRoIGEgLmdpdGlnbm9yZSBhdCB0
aGUgcm9vdCB3aXRoIGVudHJpZXMgdGhhdCBhcmVuJ3QgbmVlZGVkIGFueW1vcmUKPiBiZWNhdXNl
IHRoZXkgY2FuIGJlIGhhcmQgdG8gZmlndXJlIG91dCBpZiB0aGV5IGFyZSB1c2VmdWwgb3Igbm90
Lgo+IE9yLCB3aGVuIGdsb2JpbmcgaXMgaW52b2x2ZSwgd2UgY291bGQgZW5kLXVwIGlnbm9yaW5n
IGZpbGVzIHRoYXQKPiBzaG91bGRuJ3QuCgpSaWdodCwgZXNwZWNpYWxseSB0aGlzIGxhc3QgcG9p
bnQgbWFrZXMgc2NhdHRlcmluZyBlbnRyaWVzIGhhdmUgc29tZQp2YWx1ZS4gQnV0IHRoZW4gbGV0
J3MgdHJ1bHkgc2NhdHRlciB0aGVtLCBub3QgYWNjdW11bGF0ZSBhbGwgc29ydHMKb2Ygc3R1ZmYg
aW4geGVuLy5naXRpZ25vcmUuCgo+IEknbSBwbGFubmluZyB0byBpbXBvcnQgbW9yZSBvZiBLYnVp
bGQsIHdoaWNoIE1ha2VmaWxlLmhvc3QgY29tZXMgZnJvbSwKPiB0byBidWlsZCBvbmx5IHRoZSBo
eXBlcnZpc29yLCBzbyB0aGVyZSdzIGdvaW5nIHRvIGJlIG90aGVyIGFydGVmYWN0IHRoYXQKPiB3
aWxsIGJlIGdlbmVyYXRlZCBvbmx5IGluIHhlbi8uIFNvIEkndmUgYWRkZWQgdGhvc2UgdHdvIG5l
dyBlbnRyaWVzIGluCj4geGVuLy5naXRpZ25vcmUgaW4gYW50aWNpcGF0aW9uLCBhbmQgdG8gYXZv
aWQgZ2V0dGluZyB4ZW4vdG9vbHMva2NvbmZpZwo+IG91dC1vZi1zeW5jIHdpdGggTGludXgncyBv
bmUgKFdlbGwgSSBkaWRuJ3Qga25vdyB0aG9zZSB0d28gZW50cmllcyB3ZXJlCj4gdGhlcmUgaW4g
dGhlIGZpcnN0IHBsYWNlKS4KPiAKPiBJIGNvdWxkIGFkZCAiL3hlbi8qKi8qLnRhYi5bY2hdIiBp
biB0aGUgcm9vdCAuZ2l0aWdub3JlIGlmIHlvdSBwcmVmZXIKPiBldmVuIHRob3VnaCBJIGRvbid0
IGxpa2UgdGhpcyBhcHByb2NoLgoKQnV0IHRoaXMgdGhlbiBzdGlsbCBpcyB0b28gd2lkZSBhIHBh
dHRlcm4sIGFzIHBlciBhYm92ZS4gQQpzdWZmaWNpZW50bHkgc3BlY2lmaWMgb25lIHdvdWxkIGJl
IGFzIGdvb2QgYXMgb25lIHdpdGhvdXQgcGF0aAppbiBhIC5naXRpZ25vcmUgZGVlcCBlbm91Z2gg
aW50byB0aGUgdHJlZSwgaWYgd2Ugd2FudGVkIHRvIGdvCnRoZSAidHJ1bHkgc2NhdHRlciIgcm91
dGUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
