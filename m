Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD674D1042
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 15:35:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIC4G-0002vk-OR; Wed, 09 Oct 2019 13:31:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIC4E-0002vf-LD
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 13:31:50 +0000
X-Inumbo-ID: 25827ca9-ea99-11e9-97f1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25827ca9-ea99-11e9-97f1-12813bfff9fa;
 Wed, 09 Oct 2019 13:31:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A316CAF6B;
 Wed,  9 Oct 2019 13:31:48 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
 <20191009103153.GO8065@mail-itl>
 <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
 <20191009110051.GP8065@mail-itl>
 <3a75989f-d655-3bb7-4a71-5421c6f8a625@suse.com>
 <20191009115254.GQ8065@mail-itl>
 <26a97d5f-5100-19ea-a945-f2954a3d9d09@suse.com>
 <20191009122109.GR8065@mail-itl>
 <bddff3b2-a0cc-1a7e-8702-86bea33c9e16@suse.com>
 <20191009122702.GS8065@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a598f3a-ccad-62f7-acc7-1d00953feef6@suse.com>
Date: Wed, 9 Oct 2019 15:31:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009122702.GS8065@mail-itl>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxNDoyNywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBXZWQsIE9jdCAwOSwgMjAxOSBhdCAwMjoyNDozMVBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDkuMTAuMjAxOSAxNDoyMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IE9uIFdlZCwgT2N0IDA5LCAyMDE5IGF0IDAyOjA3OjA1UE0gKzAyMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA5LjEwLjIwMTkgMTM6NTIsIE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSAgd3JvdGU6Cj4+Pj4+IEknbSB0YWxraW5nIGFib3V0IFhlbi0+WGVuIHRy
YW5zaXRpb24gaGVyZS4gSG93IHN5c3RlbSB0YWJsZSBwb2ludGVyIGlzCj4+Pj4+IHBhc3NlZCBm
cm9tIG9sZCBYZW4gdG8gbmV3IFhlbiBpbnN0YW5jZT8gQW5kIGhvdyB0aGUgbmV3IFhlbiBpbnN0
YW5jZQo+Pj4+PiBkZWFscyB3aXRoIGJvb3Qgc2VydmljZXMgYmVpbmcgbm90IGF2YWlsYWJsZSBh
bnltb3JlPwo+Pj4+Cj4+Pj4gSXQgZG9lc24ndC4gSSBzaG91bGQgYmV0dGVyIGhhdmUgc2FpZCAi
KiAtPiBYZW4gdHJhbnNpdGlvbnMiIGluCj4+Pj4gbXkgZWFybGllciByZXBseS4gSSBzaW1wbHkg
Y2FuJ3Qgc2VlIGhvdyB0aGlzIGNhbiBhbGwgd29yayB3aXRoCj4+Pj4gRUZJIHVuZGVybmVhdGgg
d2l0aG91dCBzb21lIGV4dHJhIGNvbnZleWluZyBvZiBkYXRhIGZyb20gdGhlIG9sZAo+Pj4+IHRv
IHRoZSBuZXcgaW5zdGFuY2UuCj4+Pgo+Pj4gRG9lcyBpdCBtZWFuIHRoZSB3aG9sZSBkaXNjdXNz
aW9uIGFib3V0IFNldFZpcnR1YWxBZGRyZXNzTWFwKCkgYmVpbmcKPj4+IGluY29tcGF0aWJsZSB3
aXRoIGtleGVjIGlzIG1vb3QsIGJlY2F1c2UgcnVudGltZSBzZXJ2aWNlcyAoaW5jbHVkaW5nCj4+
PiBTZXRWaXJ0dWFsQWRkcmVzc01hcCgpKSBhcmUgbm90IHVzZWQgYnkgWGVuIGFmdGVyIGtleGVj
IGFueXdheT8gSWYgSQo+Pj4gdW5kZXJzdGFuZCBjb3JyZWN0bHksIHlvdSBqdXN0IHNhaWQgdGhl
IFhlbiBhZnRlciBrZXhlYyBkb24ndCBoYXZlCj4+PiBydW50aW1lIHNlcnZpY2VzIHBvaW50ZXIu
Cj4+Cj4+IFRoZSBjb25jZXJuIGlzIGFib3V0IGtleGVjLWluZyB0byBMaW51eCAoYmFzZWQgb24g
d2hhdCBJIHJlY2FsbAo+PiBmcm9tIHdoZW4gSSB3cm90ZSB0aGlzIGNvZGU7IGFzIHNhaWQgdGhl
IHNpdHVhdGlvbiBtYXkgaGF2ZQo+PiBjaGFuZ2VkIGZvciBtb2Rlcm4gTGludXgpLgo+IAo+IEJ1
dCB0aGVuLCBMaW51eCB3b24ndCBoYXZlIEVGSSBzeXN0ZW0gdGFibGUgcG9pbnRlciBlaXRoZXIs
IG5vPyBJIGRvbid0Cj4gc2VlIFhlbiBwYXNzaW5nIGl0IG92ZXIgaW4gYW55IHdheS4KCk1ha2lu
ZyB0aGUgc3lzdGVtIHRhYmxlIHBvaW50ZXIgYXZhaWxhYmxlIGUuZy4gdG8ga2V4ZWMgdXNlcnNw
YWNlCihzbyBpdCBjYW4gcGFzcyBpdCBpbiB3aGF0ZXZlciBzdWl0YWJsZSB3YXkpIHdvdWxkIGJl
IGFuIGVhc3kKYWRkaXRpb24uIFVzZSBvZiBTZXRWaXJ0dWFsQWRkcmVzc01hcCgpLCBvdG9oLCB3
b3VsZCBoYXZlIGJlZW4gYQpoYXJkIHRvIHVuZG8gc3RlcCBpZiBJIGhhZCBtYWRlIFhlbidzIEVG
SSBib290IHBhdGggcmVseSBvbiBpdC4KVGhlIGtleGVjIHNpdHVhdGlvbiB3cnQgRUZJIHdhcyB2
ZXJ5IG11Y2ggaW4gZmx1eCBiYWNrIHRoZW4sIGFuZApoZW5jZSBJIGRpZG4ndCB3YW50IHRvIHRh
a2UgdW5uZWNlc3Nhcnkgcmlza3Mgb2YgZnV0dXJlCmNvbXBsaWNhdGlvbnMuIEFueSBzdGVwIGNo
YW5naW5nIHRoZSBjdXJyZW50IHN0YXRlIG9mIGFmZmFpcnMKd2FudHMgdG8gcHJvdmlkZSBhc3N1
cmFuY2UgdGhhdCBpdCBkb2Vzbid0IGNsb3NlIHJvYWRzIHdoaWNoIHdlCm1heSBuZWVkIHRvIGdv
IGF0IHNvbWUgcG9pbnQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
