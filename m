Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1BF7DBBA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 14:45:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htAOr-0005LJ-OM; Thu, 01 Aug 2019 12:41:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qeGT=V5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htAOq-0005LE-7B
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 12:41:40 +0000
X-Inumbo-ID: b4ae91e6-b459-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b4ae91e6-b459-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 12:41:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89D801570;
 Thu,  1 Aug 2019 05:41:38 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D69603F575;
 Thu,  1 Aug 2019 05:41:37 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
 <878sseieu1.fsf@epam.com>
 <CAOcoXZatOXLnvYjum+EGCwnxDRUG1eGJbeENQcSyNYX6JXFizw@mail.gmail.com>
 <15e988be-80bd-f729-ea39-8e7cbc16007f@arm.com>
 <CAOcoXZZbu5-RSJxM8jzDh4EQbq8O11prOkJfrrzqWT45ppCzFQ@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c7ce6c8d-3b79-8510-a4df-9d95e3adc6c0@arm.com>
Date: Thu, 1 Aug 2019 13:41:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZZbu5-RSJxM8jzDh4EQbq8O11prOkJfrrzqWT45ppCzFQ@mail.gmail.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmlrdG9yLAoKT24gMDEvMDgvMjAxOSAxMzoyNiwgVmlrdG9yIE1pdGluIHdyb3RlOgo+IEhp
IEp1bGllbiBhbmQgVm9sb2R5bXlyLAo+IAo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDM6NTIg
UE0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpLAo+
Pgo+Pj4+IEl0IGlzIHJlY29tbWVuZGVkIChhbmQgcHJvYmFibHkgcmVxdWlyZWQsIGJ1dCBJIGNh
bid0IGZpbmQgZXhhY3QgcGxhY2UKPj4+PiBpbiB0aGUgcnVsZXMpIHRvIGluY2x1ZGUgY292ZXIg
bGV0dGVyIGlmIHlvdSBhcmUgc2VuZGluZyBtb3JlIHRoYXQgb25lCj4+Pj4gcGF0Y2ggaW4gc2Vy
aWVzLiBUaGlzIHdpbGwgZWFzZSB1cCByZXZpZXcgcHJvY2VzcywgYmVjYXVzZSByZXZpZXdlciB3
aWxsCj4+Pj4ga25vdyB3aGF0IHRvIGV4cGVjdCBpbiB0aGUgc2VyaWVzLgo+Pj4gICA+IFRoZXJl
IGlzIG5vIHN1Y2ggcmVxdWlyZW1lbnQsIG9ubHkgcmVjb21tZW5kYXRpb24uCj4+Cj4+IEl0IGlz
IGEgc3Ryb25nIHJlY29tbWVuZGF0aW9uOiAiSWYgeW91IG5lZWQgdG8gc2VuZCBtb3JlIHRoYW4g
b25lIHBhdGNoZXMgKHdoaWNoCj4+IG5vcm1hbGx5IG1lYW5zIHlvdSdyZSBzZW5kaW5nIGEgcGF0
Y2ggc2VyaWVzIHdpdGggY292ZXIgbGV0dGVyKSwiLgo+Pgo+Pj4gSSBkaWQgbm90IHB1dCBpdCBz
aW5jZSB0aGlzIGlzIHNpbXBsZSBzaG9ydCBwYXRjaCBzZXJpZXMgYW5kIGJvdGgKPj4+IHBhdGNo
ZXMgaW4gdGhpcyBzZXJpZXMgaGF2ZSBiZWVuIGRpc2N1c3NlZCBwcmV2aW91c2x5LCBzbyBpdCBp
cyBrbm93bgo+Pj4gd2hhdCBpdCBpcyBhYm91dC4KPj4KPj4gRm9yIGEgZmlyc3QsIGlmIHlvdSBk
b24ndCBoYXZlIGEgY292ZXIgbGV0dGVyIHRoZW4gdGhlIHRocmVhZGluZyBpbiBlLW1haWwKPj4g
Y2xpZW50IHdvdWxkIGxvb2sgd2VpcmQ6Cj4+ICAgICAgW1BBVENIIHY0IDEvMl0geGVuL2FybTog
ZXh0ZW5kIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzCj4+ICAgICAgICAgfC0+IFtQQVRDSCB2NCAy
LzJdIHhlbi9hcm06IG1lcmdlIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9kb21VX25v
ZGUKPj4KPj4gSSB0ZW5kIHRvIGhpZCBhbnl0aGluZyB3aXRoaW4gdGhlIHRocmVhZCBzbyBJIGhh
dmUgb25seSBvbmUgdGl0bGUuIEZvciB0aGUgdGl0bGUKPj4gaXQgaXMgbm90IGNsZWFyIHRvIG1l
IHdoYXQncyB0aGUgcHVycG9zZSBvZiB0aGUgZS1tYWlsLgo+Pgo+PiBUaGUgY292ZXIgbGV0dGVy
IGlzIGFsc28gdXNlZCB0byBrZWVwIGEgc3VtbWFyeSBvZiB3aGF0IHdhcyBkaXNjdXNzZWQgYW5k
IHRoZQo+PiBvdmVyYWxsIGdvYWwuIEl0IGRvZXMgbm90IG1hdHRlciBpZiBpdCBpcyBqdXN0IGEg
ZmV3IGxpbmVzLiBUaGlzIGlzIGFsc28gYSBnb29kCj4+IHBsYWNlIHRvIGhhdmUgYSBkaXNjdXNz
aW9uIG9mIHRoZSBvdmVyYWxsIHNlcmllcyAoaS5lIG5vdCBzcGVjaWZpYyB0byBhIHBhdGNoKS4K
Pj4KPj4gTGFzdGx5LCB5b3UgbWF5IGhhdmUgbmV3IHJldmlld2VycyB0aGF0IGhhdmVuJ3QgZm9s
bG93ZWQgdGhlIHByZXZpb3VzCj4+IGRpc2N1c3Npb24uIFlvdSBoYXZlIGFsc28gcmV2aWV3ZXJz
IGxpa2UgbWUgd2hpY2ggcmVjZWl2ZSBhIGZldyBodW5kcmVkcyBlLW1haWxzCj4+IHBlciB3ZWVr
IChqdXN0IGNvdW50aW5nIG15IGluYm94IHNvIGUtbWFpbCBJIGFtIENDZWQgdG8pLiBXaGlsZSBJ
IGhhdmUgYSBnb29kCj4+IG1lbW9yeSwgSSBjYW4ndCBwb3NzaWJseSByZW1lbWJlciBldmVyeXRo
aW5nIHNpbmdsZSBlLW1haWxzLgo+Pgo+PiBTbyB0aGUgY292ZXIgbGV0dGVyIGlzIGEgZ29vZCBw
bGFjZSB0byBleHBsYWluIHdoYXQgY2hhbmdlcyBoYXZlIGJlZW4gZG9uZQo+PiBiZXR3ZWVuIHNl
cmllcy4gWW91IGNhbiBhbHNvIGRvIHRoYXQgcGVyLXBhdGNoLgo+Pgo+PiBTcGVha2luZyBhYm91
dCBjaGFuZ2Vsb2csIEkgd291bGQgaGlnaGx5IHJlY29tbWVuZCB0byBrZWVwIGFsbCB0aGUgY2hh
bmdlbG9nCj4+IGZyb20gdjEuIFRoaXMgZ2l2ZXMgdXMgYW4gaWRlYSB3aGF0IGhhcHBlbiBvdmVy
IHRoZSByZXZpZXcuCj4gCj4gVGhhbmsgeW91IGZvciB0aGlzIGdyZWF0IGFuZCBkZXRhaWxlZCBh
cmd1bWVudGF0aW9uIHByb3ZpZGVkLiBJdCBtYWtlcwo+IHNlbnNlLCBzbyBwcm9iYWJseSBYZW4g
cGF0Y2hlcyB3aWtpIHNob3VsZCBiZSB1cGRhdGVkIHdpdGggdGhpcwo+IGluZm9ybWF0aW9uIGFu
ZCBjb3ZlciBsZXR0ZXIgc2hvdWxkIGJlY29tZSBub3QgYSByZWNvbW1lbmRhdGlvbiwgYnV0IGEK
PiBydWxlLgoKVXBkYXRlIHRvIHRoZSB3aWtpIGFyZSBhbHdheXMgd2VsY29tZWQuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
