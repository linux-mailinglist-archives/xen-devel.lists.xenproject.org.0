Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E97816E3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 12:21:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hua3l-0005f6-P8; Mon, 05 Aug 2019 10:17:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9cV=WB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hua3k-0005ew-Gi
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 10:17:44 +0000
X-Inumbo-ID: 42a84f19-b76a-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 42a84f19-b76a-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 10:17:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4582528;
 Mon,  5 Aug 2019 03:17:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 259923F694;
 Mon,  5 Aug 2019 03:17:41 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
 <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
 <231b516e-5d23-167f-92c8-f9dcf717467d@arm.com>
 <6c0b17c8-2c50-ed56-702f-165bd692699b@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cebbe948-924b-3d63-5be5-c5b693a882a8@arm.com>
Date: Mon, 5 Aug 2019 11:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6c0b17c8-2c50-ed56-702f-165bd692699b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMDgvMjAxOSAxMTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUu
MDguMjAxOSAxMTo0MCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMDkvMDQv
MjAxOSAxMjo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwOS4wNC4xOSBhdCAxMzoy
NiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBPbiAwMy8wNC8yMDE5IDE0OjA0
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gQWxzbyBwbGVhc2Ugbm90ZSB0aGUgcXVvdGF0aW9u
IHVzZWQgYnkgdGhlIG1lbnRpb25lZAo+Pj4+PiBleGlzdGluZyBkb2MgY29tbWVudHMsIGFzIHdl
bGwgYXMgYSBmZXcgb3RoZXIgZm9ybWFsIGFzcGVjdHMKPj4+Pj4gKGxpa2UgdGhlbSBhbHNvIG1h
a2luZyBjbGVhciB3aGF0IHRoZSByZXR1cm4gdHlwZSBpcykuIEkgdGhpbmsKPj4+Pj4gdGhhdCdz
IGEgbW9kZWwgdXNlZCBlbHNld2hlcmUgYXMgd2VsbCwgc28gSSB0aGluayB5b3Ugc2hvdWxkCj4+
Pj4+IGZvbGxvdyBpdCBoZXJlLgo+Pj4+Cj4+Pj4gSSBoYXZlbid0IHJlcGxpY2F0ZWQgdGhlIGAg
YmVjYXVzZSBJIGhhdmUgbm8gaWRlYSB3aGF0IHRoZXkgYXJlIHVzZWQgZm9yLiBJCj4+Pj4gd291
bGQgYXBwcmVjaWF0ZSBpZiB5b3UgcHJvdmlkZSBwb2ludGVyIGhvdyB0byB1c2UgdGhlbS4KPj4+
Cj4+PiBXZWxsLCBJIGNhbiBvbmx5IHBvaW50IHlvdSBhdCB0aGUgaGlzdG9yeSBvZiB0aGluZ3Ms
IGUuZy4KPj4+IDI2MmUxMThhMzcgImRvY3MvaHRtbC86IEFubm90YXRpb25zIGZvciB0d28gaHlw
ZXJjYWxscyIuCj4+Pgo+Pj4+PiBUaGUgb3RoZXIgdGhpbmcgaXM6IEFzIG1lbnRpb25lZCBlbHNl
d2hlcmUsIEkgZG9uJ3QgdGhpbmsgdGhlCj4+Pj4+IGZpcnN0IHR3byBwYXJhbWV0ZXJzIHNob3Vs
ZCBiZSBwbGFpbiBpbnQuIEknbSBub3QgaGFwcHkgdG8gc2VlCj4+Pj4+IHRoaXMgcHJvbGlmZXJh
dGUgaW50byBkb2N1bWVudGF0aW9uIGFzIHdlbGwsIGkuZS4gSSdkIHByZWZlciBpZgo+Pj4+PiB0
aGlzIHdhcyBjb3JyZWN0ZWQgYmVmb3JlIGFkZGluZyBkb2N1bWVudGF0aW9uLiBXb3VsZCB5b3UK
Pj4+Pj4gYmUgd2lsbGluZyB0byBkbyB0aGlzLCBvciBzaG91bGQgSSBhZGQgaXQgdG8gbXkgdG9k
byBsaXN0Pwo+Pj4+Cj4+Pj4gV2hpbGUgc3dpdGNoaW5nIGZyb20gY21kIGZyb20gc2lnbmVkIHRv
IHVuc2lnbmVkIHNob3VsZCBiZSBvay4gVGhpcyB3b3VsZAo+Pj4+IGludHJvZHVjZSBhIGRpZmZl
cmVudCBiZWhhdmlvciBvZiBmb3IgY291bnQuCj4+Pgo+Pj4gU2luY2UgdGhpcyByZW1vdmVzIGFu
IGVycm9yIGNvbmRpdGlvbiwgSSB0aGluayB0aGlzIGlzIGFuIG9rYXkgY2hhbmdlCj4+PiB0byBo
YXBwZW4sIHdpdGhvdXQgLi4uCj4+Pgo+Pj4+IEFyZSB3ZSBoYXBweSB3aXRoIHRoYXQsIG9yIHNo
YWxsIHdlIGFkZCBhIGNoZWNrICgoaW50KWNvdW50KSA+IDA/Cj4+Pgo+Pj4gLi4uIGFueSBzdWNo
IGV4dHJhIGNoZWNrLiBUaGlzIGFsc28gaXNuJ3QgZ29pbmcgdG8gaW50cm9kdWNlIGFueSBuZXcK
Pj4+IHJlYWwgcmlzayBvZiBhIGxvbmcgcnVubmluZyBvcGVyYXRpb24gb3Igc29tZSBzdWNoIC0g
aWYgMkdiIG9mIGlucHV0Cj4+PiBkYXRhIGFyZSBmaW5lLCBJIGNhbid0IHNlZSB3aHkgNEdiIHdv
dWxkbid0IGJlLCB0b28uCj4+Cj4+IEFjdHVhbGx5LCBpdCB3aWxsIG5vdCBiZSBmaW5lIGF0IGxl
YXN0IGZvciB0aGUgcmVhZCBjYXNlLiBUaGUgcmV0dXJuIHZhbHVlIGlzIGEgMzItYml0IHZhbHVl
IChvbiBBQXJjaDMyIGFuZCBpZiB5b3Ugd2FudCB0byBrZWVwIGNvbXBhdCBiZXR3ZWVuIDY0LWJp
dCBhbmQgMzItYml0KS4gQSBuZWdhdGl2ZSB2YWx1ZSBpbmRpY2F0ZXMgYW4gZXJyb3IuIEFzIHdl
IHJldHVybiB0aGUgbnVtYmVyIG9mIGNoYXJhY3RlcnMgcmVhZCwgaXQgbWVhbnMgd2UgY2FuIG9u
bHkgaGFuZGxlIDJHQi4KPiAKPiBIbW0sIHZhbGlkIHBvaW50Lgo+IAo+PiBTbyBJIHdvdWxkIHJh
dGhlciBsaW1pdCB0aGUgYnVmZmVyIHRvIDJHQiBmb3IgZXZlcnlvbmUuCj4gCj4gUHJvYmFibHkg
ZmFpciBlbm91Z2ggdGhlbiAoaWYgZXhwbGljaXRseSBzdGF0ZWQpLiBQZXJzb25hbGx5IEkgd291
bGQKPiBuZXZlcnRoZWxlc3MgYWxsb3cgc2l6ZXMgdXAgdG8gNEdiLTRrYiwgYnV0IEkgY2FuIHNl
ZSB3aHkgdGhpcyBtYXkKPiBub3QgYmUgbGlrZWQgYnkgZXZlcnlvbmUuIEknZCBsaWtlIHRvIHBv
aW50IG91dCB0aG91Z2ggdGhhdCB0aGUKPiBQVFJfRVJSKCkgbWFjaGluZXJ5IHdlJ3ZlIGluaGVy
aXRlZCBmcm9tIExpbnV4IHV0aWxpemVzIGV4YWN0bHkgdGhhdC4KCldlbGwsIHRoYXQncyBhIGNv
bnNvbGUgYnVmZmVyLiBUaGUgY2hhbmNlIHlvdSBoYXZlIHdyaXRlL3JlYWQgbW9yZSB0aGFuIDJH
QiBpbiBhIApyb3cgaXMgdmVyeSB1bmxpa2VseS4KClNvIGl0IGZlZWxzIHRvIG1lIHRoYXQgZXhw
b3NpbmcgUFRSX0VSUiguLi4pIGxpa2UgaW50ZXJmYWNlIGlzIG5vdCB3b3J0aCBpdC4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
