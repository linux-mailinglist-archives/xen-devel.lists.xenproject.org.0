Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623517DD5D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBfO-0003AR-8E; Thu, 01 Aug 2019 14:02:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qeGT=V5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htBfM-0003AG-Ql
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:02:48 +0000
X-Inumbo-ID: 0a3c4588-b465-11e9-bd01-1f98d9730c83
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0a3c4588-b465-11e9-bd01-1f98d9730c83;
 Thu, 01 Aug 2019 14:02:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C86B337;
 Thu,  1 Aug 2019 07:02:46 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD0133F71F;
 Thu,  1 Aug 2019 07:02:45 -0700 (PDT)
To: Lars Kurth <lars.kurth.xen@gmail.com>
References: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
 <878sseieu1.fsf@epam.com>
 <CAOcoXZatOXLnvYjum+EGCwnxDRUG1eGJbeENQcSyNYX6JXFizw@mail.gmail.com>
 <15e988be-80bd-f729-ea39-8e7cbc16007f@arm.com>
 <CAOcoXZZbu5-RSJxM8jzDh4EQbq8O11prOkJfrrzqWT45ppCzFQ@mail.gmail.com>
 <c7ce6c8d-3b79-8510-a4df-9d95e3adc6c0@arm.com>
 <269AA3CE-4B2D-4651-B65D-907E64B43473@xenproject.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6b3a71b6-4040-9e42-4f83-daa07f2ae15b@arm.com>
Date: Thu, 1 Aug 2019 15:02:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <269AA3CE-4B2D-4651-B65D-907E64B43473@xenproject.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/arm: extend
 fdt_property_interrupts
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDAxLzA4LzIwMTkgMTQ6NTksIExhcnMgS3VydGggd3JvdGU6Cj4gCj4gCj4+
IE9uIDEgQXVnIDIwMTksIGF0IDEzOjQxLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tIAo+PiA8bWFpbHRvOmp1bGllbi5ncmFsbEBhcm0uY29tPj4gd3JvdGU6Cj4+Cj4+IEhpIFZp
a3RvciwKPj4KPj4gT24gMDEvMDgvMjAxOSAxMzoyNiwgVmlrdG9yIE1pdGluIHdyb3RlOgo+Pj4g
SGkgSnVsaWVuIGFuZCBWb2xvZHlteXIsCj4+PiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAzOjUy
IFBNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20gCj4+PiA8bWFpbHRvOmp1bGll
bi5ncmFsbEBhcm0uY29tPj4gd3JvdGU6Cj4+Pj4KPj4+PiBIaSwKPj4+Pgo+Pj4+Pj4gSXQgaXMg
cmVjb21tZW5kZWQgKGFuZCBwcm9iYWJseSByZXF1aXJlZCwgYnV0IEkgY2FuJ3QgZmluZCBleGFj
dCBwbGFjZQo+Pj4+Pj4gaW4gdGhlIHJ1bGVzKSB0byBpbmNsdWRlIGNvdmVyIGxldHRlciBpZiB5
b3UgYXJlIHNlbmRpbmcgbW9yZSB0aGF0IG9uZQo+Pj4+Pj4gcGF0Y2ggaW4gc2VyaWVzLiBUaGlz
IHdpbGwgZWFzZSB1cCByZXZpZXcgcHJvY2VzcywgYmVjYXVzZSByZXZpZXdlciB3aWxsCj4+Pj4+
PiBrbm93IHdoYXQgdG8gZXhwZWN0IGluIHRoZSBzZXJpZXMuCj4+Pj4+IMKgPiBUaGVyZSBpcyBu
byBzdWNoIHJlcXVpcmVtZW50LCBvbmx5IHJlY29tbWVuZGF0aW9uLgo+Pj4+Cj4+Pj4gSXQgaXMg
YSBzdHJvbmcgcmVjb21tZW5kYXRpb246ICJJZiB5b3UgbmVlZCB0byBzZW5kIG1vcmUgdGhhbiBv
bmUgcGF0Y2hlcyAod2hpY2gKPj4+PiBub3JtYWxseSBtZWFucyB5b3UncmUgc2VuZGluZyBhIHBh
dGNoIHNlcmllcyB3aXRoIGNvdmVyIGxldHRlciksIi4KPj4+Pgo+Pj4+PiBJIGRpZCBub3QgcHV0
IGl0IHNpbmNlIHRoaXMgaXMgc2ltcGxlIHNob3J0IHBhdGNoIHNlcmllcyBhbmQgYm90aAo+Pj4+
PiBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGhhdmUgYmVlbiBkaXNjdXNzZWQgcHJldmlvdXNseSwg
c28gaXQgaXMga25vd24KPj4+Pj4gd2hhdCBpdCBpcyBhYm91dC4KPj4+Pgo+Pj4+IEZvciBhIGZp
cnN0LCBpZiB5b3UgZG9uJ3QgaGF2ZSBhIGNvdmVyIGxldHRlciB0aGVuIHRoZSB0aHJlYWRpbmcg
aW4gZS1tYWlsCj4+Pj4gY2xpZW50IHdvdWxkIGxvb2sgd2VpcmQ6Cj4+Pj4gwqDCoMKgwqBbUEFU
Q0ggdjQgMS8yXSB4ZW4vYXJtOiBleHRlbmQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHMKPj4+PiDC
oMKgwqDCoMKgwqDCoHwtPiBbUEFUQ0ggdjQgMi8yXSB4ZW4vYXJtOiBtZXJnZSBtYWtlX3RpbWVy
X25vZGUgYW5kIAo+Pj4+IG1ha2VfdGltZXJfZG9tVV9ub2RlCj4+Pj4KPj4+PiBJIHRlbmQgdG8g
aGlkIGFueXRoaW5nIHdpdGhpbiB0aGUgdGhyZWFkIHNvIEkgaGF2ZSBvbmx5IG9uZSB0aXRsZS4g
Rm9yIHRoZSB0aXRsZQo+Pj4+IGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aGF0J3MgdGhlIHB1cnBv
c2Ugb2YgdGhlIGUtbWFpbC4KPj4+Pgo+Pj4+IFRoZSBjb3ZlciBsZXR0ZXIgaXMgYWxzbyB1c2Vk
IHRvIGtlZXAgYSBzdW1tYXJ5IG9mIHdoYXQgd2FzIGRpc2N1c3NlZCBhbmQgdGhlCj4+Pj4gb3Zl
cmFsbCBnb2FsLiBJdCBkb2VzIG5vdCBtYXR0ZXIgaWYgaXQgaXMganVzdCBhIGZldyBsaW5lcy4g
VGhpcyBpcyBhbHNvIGEgZ29vZAo+Pj4+IHBsYWNlIHRvIGhhdmUgYSBkaXNjdXNzaW9uIG9mIHRo
ZSBvdmVyYWxsIHNlcmllcyAoaS5lIG5vdCBzcGVjaWZpYyB0byBhIHBhdGNoKS4KPj4+Pgo+Pj4+
IExhc3RseSwgeW91IG1heSBoYXZlIG5ldyByZXZpZXdlcnMgdGhhdCBoYXZlbid0IGZvbGxvd2Vk
IHRoZSBwcmV2aW91cwo+Pj4+IGRpc2N1c3Npb24uIFlvdSBoYXZlIGFsc28gcmV2aWV3ZXJzIGxp
a2UgbWUgd2hpY2ggcmVjZWl2ZSBhIGZldyBodW5kcmVkcyBlLW1haWxzCj4+Pj4gcGVyIHdlZWsg
KGp1c3QgY291bnRpbmcgbXkgaW5ib3ggc28gZS1tYWlsIEkgYW0gQ0NlZCB0bykuIFdoaWxlIEkg
aGF2ZSBhIGdvb2QKPj4+PiBtZW1vcnksIEkgY2FuJ3QgcG9zc2libHkgcmVtZW1iZXIgZXZlcnl0
aGluZyBzaW5nbGUgZS1tYWlscy4KPj4+Pgo+Pj4+IFNvIHRoZSBjb3ZlciBsZXR0ZXIgaXMgYSBn
b29kIHBsYWNlIHRvIGV4cGxhaW4gd2hhdCBjaGFuZ2VzIGhhdmUgYmVlbiBkb25lCj4+Pj4gYmV0
d2VlbiBzZXJpZXMuIFlvdSBjYW4gYWxzbyBkbyB0aGF0IHBlci1wYXRjaC4KPj4+Pgo+Pj4+IFNw
ZWFraW5nIGFib3V0IGNoYW5nZWxvZywgSSB3b3VsZCBoaWdobHkgcmVjb21tZW5kIHRvIGtlZXAg
YWxsIHRoZSBjaGFuZ2Vsb2cKPj4+PiBmcm9tIHYxLiBUaGlzIGdpdmVzIHVzIGFuIGlkZWEgd2hh
dCBoYXBwZW4gb3ZlciB0aGUgcmV2aWV3Lgo+Pj4gVGhhbmsgeW91IGZvciB0aGlzIGdyZWF0IGFu
ZCBkZXRhaWxlZCBhcmd1bWVudGF0aW9uIHByb3ZpZGVkLiBJdCBtYWtlcwo+Pj4gc2Vuc2UsIHNv
IHByb2JhYmx5IFhlbiBwYXRjaGVzIHdpa2kgc2hvdWxkIGJlIHVwZGF0ZWQgd2l0aCB0aGlzCj4+
PiBpbmZvcm1hdGlvbiBhbmQgY292ZXIgbGV0dGVyIHNob3VsZCBiZWNvbWUgbm90IGEgcmVjb21t
ZW5kYXRpb24sIGJ1dCBhCj4+PiBydWxlLgo+Pgo+PiBVcGRhdGUgdG8gdGhlIHdpa2kgYXJlIGFs
d2F5cyB3ZWxjb21lZC4KPiAKPiBJIHN0aWxsIGhhdmUgYW4gYWN0aW9uIHRvIHJld29yayAKPiBo
dHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1Bh
dGNoZXPCoGFuZCAKPiA8aHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvU3VibWl0dGlu
Z19YZW5fUHJvamVjdF9QYXRjaGVzYW5kPsKgbWlncmF0ZSB0aGUgCj4gY29udGVudCB0byB0aGUg
c3BoaW54IGRvY3MKPiAKPiBAVmljdG9yOiBjYW4geW91IHF1aWNrbHkgcG9pbnQgb3V0IHdoZXJl
IHdlIHJlY29tbWVuZCB0byB1c2UgY292ZXIgbGV0dGVycyAoaWYgCj4geW91IHJlbWVtYmVyKS4g
SSB0aG91Z2h0IGl0IHdhcyBhIHJlcXVpcmVtZW50CgpJdCBpcyBub3QgZXhwbGljaXRseSB3cml0
dGVuIGluIHRoZSB3aWtpIHBhZ2UuIEJ1dCBpdCBpcyBpbXBsaWVkIGluIGEgZmV3IHBsYWNlcyAK
c3VjaCBhcyBpbiB0aGUgc2VjdGlvbiAiUHJvdmlkaW5nIGEgZ2l0IGJyYW5jaCIsICJVc2luZyBn
aXQgc2VuZC1lbWFpbCBhbG9uZSIuCj4gCj4gTGFycwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
