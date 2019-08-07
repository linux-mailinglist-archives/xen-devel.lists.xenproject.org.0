Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339EA8512E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:36:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOtC-00065M-Mb; Wed, 07 Aug 2019 16:34:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvOtB-000659-1o
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:34:13 +0000
X-Inumbo-ID: 2eb6b638-b931-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2eb6b638-b931-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:34:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E09FAE1C;
 Wed,  7 Aug 2019 16:34:09 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20190807132657.GA2852@mail-itl>
 <7e7da376-462f-9bd0-5b82-137c059feb13@suse.com>
 <20190807151703.GA2659@mail-itl>
 <59f6c90b-3dbb-b0eb-ff45-0f8fd4c915de@suse.com>
 <20190807155112.GA3257@mail-itl>
 <642fe1a7-741d-2b42-f810-7c9cdb9c5120@suse.com>
 <20190807160451.GB3257@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f8f28f3a-0fad-cbd2-44e0-9a0ecf8ac06d@suse.com>
Date: Wed, 7 Aug 2019 18:34:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807160451.GB3257@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxODowNCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAwNTo1ODo1OVBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDcuMDguMjAxOSAxNzo1MSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA1OjMzOjA1UE0gKzAyMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjA4LjIwMTkgMTc6MTcsIE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSAgd3JvdGU6Cj4+Pj4+IEFjdHVhbGx5LCBJJ3ZlIGFscmVhZHkgdHJpZWQs
IGJ1dCBldmVyeSBvdGhlciBidWlsZCBJIHRyeSwgSSBnZXQgZXZlbgo+Pj4+PiBsZXNzIHVzZWZ1
bCBjYWxsIHRyYWNlLCBmb3IgZXhhbXBsZSBkZWJ1ZyB1bnN0YWJsZSBidWlsZDoKPj4+Pj4KPj4+
Pj4gICAgICAgIFhlbiBjYWxsIHRyYWNlOgo+Pj4+PiAgICAgICAgICAgWzwwMDAwMDAwMDdiNzUx
YzA5Pl0gMDAwMDAwMDA3Yjc1MWMwOQo+Pj4+PiAgICAgICAgICAgWzw4YzJiMDM5OGUwMDAwZGFh
Pl0gOGMyYjAzOThlMDAwMGRhYQo+Pj4+PiAuLi4KPj4+Pj4gICAgICAgIEdFTkVSQUwgUFJPVEVD
VElPTiBGQVVMVAo+Pj4+PiAgICAgICAgW2Vycm9yX2NvZGU9MDAwMF0KPj4+Pgo+Pj4+IEJ1dCB0
aGlzIG1ha2VzIHJlYXNvbmFibGUgc2Vuc2U6IFRoZSBmYXVsdGluZyBpbnNuIGlzICJjYWxsICow
eDE4KCVyYXgpIgo+Pj4+IGFuZCAlcmF4IGlzIDY5NTRiMmIwLCB3aGljaCBwb2ludHMgaW50byBh
IGJsb2NrIG9mIHR5cGUKPj4+PiBFZmlCb290U2VydmljZXNEYXRhIChhbmQgaGVuY2UgbGlrZWx5
IHJldXNlZCBieSB0aGUgdGltZSBvZiB0aGUgY3Jhc2gKPj4+PiBmb3Igb3RoZXIgcHVycG9zZXMp
LiBIZW5jZSB0aGUgIi9tYXBicyIgb3B0aW9uIG9mIHhlbi5lZmkgbWlnaHQgaGVscAo+Pj4+IGhl
cmUgdG9vLCBidXQgaWlyYyB0aGVyZSdzIG5vIGVxdWl2YWxlbnQgZm9yIGl0IGluIHRoZSBNQjIg
Y2FzZS4KPj4+Cj4+PiBPaCwgeWVzLCBpbmRlZWQgaW4gUXViZXMgd2UgaGF2ZSAvbWFwYnMgZW5h
YmxlZCBieSBkZWZhdWx0IHdpdGggeGVuLmVmaS4KPj4+IEknZCBsaWtlIHRvIGFkZCBpdCB0byBN
QjIgY2FzZSB0b28uIElzIGNvbW1hbmQgbGluZSBwYXJzZWQgYXQgdGhpcyBwb2ludAo+Pj4gKGVm
aV9leGl0X2Jvb3QoKSkgYWxyZWFkeT8KPj4KPj4gSSdtIHN0cnVnZ2xpbmcgYSBsaXR0bGUgaG93
IHRvIHJlcGx5LCBjb25zaWRlcmluZyB0aGF0IEkndmUgYWxyZWFkeQo+PiBzYWlkICJpaXJjIHRo
ZXJlJ3Mgbm8gZXF1aXZhbGVudCBmb3IgaXQgaW4gdGhlIE1CMiBjYXNlIi4gU28gSSBndWVzcwo+
PiBJJ20gc2ltcGx5IG5vdCB1bmRlcnN0YW5kaW5nIHlvdXIgcXVlc3Rpb24sIG9yIG1vcmUgc3Bl
Y2lmaWNhbGx5Cj4+IHdoZXJlIHlvdSB3YW50IHRvIGdldCB3aXRoIGl0Lgo+IAo+IC9tYXBicyBv
cHRpb24gaXMgdmVyeSBzcGVjaWZpYyB0byB4ZW4uZWZpLiBJJ2QgbGlrZSB0byBhZGQgYSBtZWFu
cyB0bwo+IHNldCBtYXBfYnMgdmFyaWFibGUgaW4gTUIyIGNhc2UgdG9vLiBJJ20gYXNraW5nIHdo
ZXRoZXIgSSBjYW4gdXNlCj4gc3RhbmRhcmQgY29tbWFuZCBsaW5lIHBhcnNlciwgb3IgZG8gSSBu
ZWVkIHNvbWV0aGluZyBzcGVjaWFsIGV4dHJhY3RpbmcKPiBpdCBmcm9tIE1CMiBzdHJ1Y3R1cmVz
IGRpcmVjdGx5LgoKV2VsbCwgZWZpX211bHRpYm9vdDIoKSBnZXRzIGNhbGxlZCBmcm9tIGhlYWQu
UywgZXZlbiBiZWZvcmUgdGhlCihub24tRUZJIG9ubHkpIGNtZGxpbmVfcGFyc2VfZWFybHkuIEkg
ZG9uJ3Qgc3VwcG9zZSB0aGVyZSdzIGEgd2F5CnRvIGF2b2lkIG1peGluZyB0aGlzIG5ldyBvcHRp
b24gaW50byB0aGUgIm5vcm1hbCIgY29tbWFuZCBsaW5lLAphbmQgaGVuY2UgdGhlcmUncyBhbHNv
IG5vIHdheSBhcm91bmQgcGVla2luZyBpbnRvIHRoZSBjb21tYW5kCmxpbmUgZWFybHkuIE9mIGNv
dXJzZSB0aGVyZSdzIHRoZSBvcHRpb24gdG8gc2VlIHdoZXRoZXIgd2hhdAplZmlfYXJjaF9wcm9j
ZXNzX21lbW9yeV9tYXAoKSBjb3VsZCBiZSBkZWZlcnJlZCB1bnRpbCBsYXRlci4gQnV0Cmxpa2Vs
eSB0aGF0IHdvdWxkIGJlIGEgZmFyIG1vcmUgaW50cnVzaXZlIGNoYW5nZSB0aGFuIHdoYXQgeW91
J3JlCmNvbnNpZGVyaW5nIHRvIGNhcnJ5IG91dC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
