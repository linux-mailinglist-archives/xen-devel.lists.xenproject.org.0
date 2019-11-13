Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3AFB5C1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 17:55:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUvsp-00069h-ON; Wed, 13 Nov 2019 16:52:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUvso-00069c-PV
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 16:52:42 +0000
X-Inumbo-ID: 00fb589c-0636-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00fb589c-0636-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 16:52:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 93C76ACA7;
 Wed, 13 Nov 2019 16:52:39 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <CABfawhkjgmyYa11CMH1fBZG+Ee2ngvsoFzBvCixrj08FMcMT5A@mail.gmail.com>
 <2ba0e8d7-0e58-62c0-6c2b-8d9934b1137e@suse.com>
 <CABfawhnUtzWm25XOpr+BLkUuqA-OtpOUAh+91xBsk93dprWAyg@mail.gmail.com>
 <CABfawhkBqpiJNrLSMFhW7GnXwKAx2-7Hi+uH+F=9DJEVuhecaw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20633eaf-0bc4-939c-3f55-599a54c8e154@suse.com>
Date: Wed, 13 Nov 2019 17:52:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkBqpiJNrLSMFhW7GnXwKAx2-7Hi+uH+F=9DJEVuhecaw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAxNTo1NywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgTm92
IDEzLCAyMDE5IGF0IDc6NTEgQU0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
PiB3cm90ZToKPj4KPj4gT24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgNzozMSBBTSBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4KPj4+IE9uIDEyLjExLjIwMTkgMTU6MDUs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+PiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCA0OjU0
IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDA2LjEx
LjIwMTkgMTY6MzUsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4+Pj4gKyAgICAg
ICAgZWxzZQo+Pj4+Pj4gKyAgICAgICAgewo+Pj4+Pj4gKyAgICAgICAgICAgIHJjID0gcDJtX3Nl
dF9zdXBwcmVzc192ZV9tdWx0aShkLCAmYS51LnN1cHByZXNzX3ZlKTsKPj4+Pj4+ICsKPj4+Pj4+
ICsgICAgICAgICAgICBpZiAoIHJjID09IC1FUkVTVEFSVCApCj4+Pj4+PiArICAgICAgICAgICAg
ICAgIGlmICggX19jb3B5X2ZpZWxkX3RvX2d1ZXN0KGd1ZXN0X2hhbmRsZV9jYXN0KGFyZywKPj4+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVuX2h2bV9h
bHRwMm1fb3BfdCksCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZhLCB1LnN1cHByZXNzX3ZlLm9wYXF1ZSkgKQo+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgcmMgPSAtRUZBVUxUOwo+Pj4+Pgo+Pj4+PiBJZiB0aGUgb3BlcmF0aW9uIGlzIGJlc3Qg
ZWZmb3J0LCBfc29tZV8gaW5kaWNhdGlvbiBvZiBmYWlsdXJlIHNob3VsZAo+Pj4+PiBzdGlsbCBi
ZSBoYW5kZWQgYmFjayB0byB0aGUgY2FsbGVyLiBXaGV0aGVyIHRoYXQncyB0aHJvdWdoIHRoZSBv
cGFxdWUKPj4+Pj4gZmllbGQgb3IgYnkgc29tZSBvdGhlciBtZWFucyBpcyBzZWNvbmRhcnkuIElm
IG5vdCB2aWEgdGhhdCBmaWVsZAo+Pj4+PiAod2hpY2ggd291bGQgbWFrZSB0aGUgb3V0ZXIgb2Yg
dGhlIHR3byBpZigpLXMgZGlzYXBwZWFyKSwgcGxlYXNlIGZvbGQKPj4+Pj4gdGhlIGlmKCktcy4K
Pj4+Pgo+Pj4+IEF0IGxlYXN0IGZvciBtZW1fc2hhcmluZ19yYW5nZV9vcCB3ZSBhbHNvIGRvIGEg
YmVzdC1lZmZvcnQgYW5kIGRvbid0Cj4+Pj4gcmV0dXJuIGFuIGVycm9yIGZvciBwYWdlcyB3aGVy
ZSBpdCB3YXNuJ3QgcG9zc2libGUgdG8gc2hhcmUuIFNvIEkKPj4+PiBkb24ndCB0aGluayBpdCdz
IGFic29sdXRlbHkgbmVjZXNzYXJ5IHRvIGRvIHRoYXQsIGVzcGVjaWFsbHkgaWYgdGhlCj4+Pj4g
Y2FsbGVyIGNhbid0IGRvIGFueXRoaW5nIGFib3V0IHRob3NlIGVycm9ycyBhbnl3YXkuCj4+Pgo+
Pj4gbWVtLXNoYXJpbmcgaXMgYSBsaXR0bGUgZGlmZmVyZW50IGluIG5hdHVyZSwgaXNuJ3QgaXQ/
IElmIHlvdQo+Pj4gY2FuJ3Qgc2hhcmUgYSBwYWdlLCBib3RoIGludm9sdmVkIGd1ZXN0cyB3aWxs
IGNvbnRpbnVlIHRvIHJ1bgo+Pj4gd2l0aCB0aGVpciBvd24gaW5zdGFuY2VzLiBJZiB5b3Ugd2Fu
dCB0byBzdXBwcmVzcyAjVkUgZGVsaXZlcnkKPj4+IGFuZCBpdCBmYWlscywgYmVoYXZpb3Igd29u
J3QgYmUgdHJhbnNwYXJlbnRseSBjb3JyZWN0LCBhcwo+Pj4gdGhlcmUnbGwgcG90ZW50aWFsbHkg
YmUgI1ZFIHdoZW4gdGhlcmUgc2hvdWxkIGJlIG5vbmUuIFdoZXRoZXIKPj4+IHRoYXQncyBiZW5p
Z24gdG8gdGhlIGd1ZXN0IHZlcnkgbXVjaCBkZXBlbmRzIG9uIGl0cyBoYW5kbGVyLgo+Pgo+PiBN
YWtlcyBtZSB3b25kZXIgd2hldGhlciBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8gZmxpcCB0
aGlzIHRoaW5nIG9uCj4+IGl0cyBoZWFkIGFuZCBoYXZlIHN1cHJlc3NfdmUgYmUgc2V0IGJ5IGRl
ZmF1bHQgKHNpbmNlIGl0cyBpZ25vcmVkIGJ5Cj4+IGRlZmF1bHQpIGFuZCB0aGVuIGhhdmUgcGFn
ZXMgZm9yIHdoaWNoIHRoZSBFUFQgdmlvbGF0aW9uIHNob3VsZCBiZQo+PiBjb252ZXJ0aWJsZSB0
byAjVkUgYmUgc3BlY2lmaWNhbGx5IGVuYWJsZWQgYnkgdHVybmluZyBzdXBwcmVzc192ZSBvZmYu
Cj4+IFRoYXQgd291bGQgZWxpbWluYXRlIHRoZSBwb3NzaWJpbGl0eSBvZiBoYXZpbmcgdGhlIGlu
LWd1ZXN0IGhhbmRsZXIKPj4gZ2V0dGluZyAjVkUgZm9yIHBhZ2VzIGl0IGlzIG5vdCByZWFkeSB0
byBoYW5kbGUuIFRoZSBoeXBlcnZpc29yIChhbmQKPj4gdGhlIGV4dGVybmFsIFZNSSB0b29sc3Rh
Y2spIE9UT0ggc2hvdWxkIGFsd2F5cyBiZSBpbiBhIHBvc2l0aW9uIHRvCj4+IGhhbmRsZSBFUFQg
dmlvbGF0aW9ucyBpdCBpdHNlbGYgY2F1c2VzIGJ5IGNoYW5naW5nIHRoZSBwYWdlCj4+IHBlcm1p
c3Npb25zLgo+IAo+IEFjdHVhbGx5LCBub3cgdGhhdCBJIGxvb2tlZCBhdCBpdCwgdGhhdCdzIF9l
eGFjdGx5XyB3aGF0IHdlIGRvCj4gYWxyZWFkeS4gVGhlIHN1cHByZXNzX3ZlIGJpdCBpcyBhbHdh
eXMgc2V0IGZvciBhbGwgRVBUIHBhZ2VzLiBTbyB0aGlzCj4gb3BlcmF0aW9uIGhlcmUgaXMgZ29p
bmcgdG8gYmUgdXNlZCB0byBlbmFibGUgI1ZFIGZvciBwYWdlcywgbm90IHRoZQo+IG90aGVyIHdh
eSBhcm91bmQuIFNvIHRoZXJlIHdvdWxkbid0IGJlIGEgY2FzZSBvZiAicG90ZW50aWFsbHkgYmUg
I1ZFCj4gd2hlbiB0aGVyZSBzaG91bGQgYmUgbm9uZSIuCgpCdXQgdGhpcyBkb2Vzbid0IGNoYW5n
ZSB0aGUgYm90dG9tIGxpbmUgb2YgbXkgZWFybGllciBjb21tZW50OiBJdCdzCmFzIGJhZCB0byBh
biBPUyB0byBzZWUgdG9vIG1hbnkgI1ZFIGFzIGl0IGlzIHRvIG1pc3MgYW55IHRoYXQgYXJlCmV4
cGVjdGVkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
