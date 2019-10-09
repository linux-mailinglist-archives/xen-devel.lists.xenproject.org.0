Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACDDD0E6F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 14:10:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIAkG-00031p-Mz; Wed, 09 Oct 2019 12:07:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIAkE-00031k-TL
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 12:07:06 +0000
X-Inumbo-ID: 4f452074-ea8d-11e9-96dc-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f452074-ea8d-11e9-96dc-bc764e2007e4;
 Wed, 09 Oct 2019 12:07:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 03BF6AEF1;
 Wed,  9 Oct 2019 12:07:05 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20191008115014.GI8065@mail-itl>
 <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
 <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
 <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
 <20191009103153.GO8065@mail-itl>
 <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
 <20191009110051.GP8065@mail-itl>
 <3a75989f-d655-3bb7-4a71-5421c6f8a625@suse.com>
 <20191009115254.GQ8065@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26a97d5f-5100-19ea-a945-f2954a3d9d09@suse.com>
Date: Wed, 9 Oct 2019 14:07:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009115254.GQ8065@mail-itl>
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

T24gMDkuMTAuMjAxOSAxMzo1MiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBXZWQsIE9jdCAwOSwgMjAxOSBhdCAwMTo0ODozOFBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDkuMTAuMjAxOSAxMzowMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IE9uIFdlZCwgT2N0IDA5LCAyMDE5IGF0IDEyOjUwOjA5UE0gKzAyMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA5LjEwLjIwMTkgMTI6MzEsIE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSAgd3JvdGU6Cj4+Pj4+IEJUVyBIb3cgcnVudGltZSBzZXJ2aWNlcyB3b3Jr
IGFmdGVyIGtleGVjPyBJIGRvbid0IHNlZSBFRkkgaGFuZGxlcwo+Pj4+PiBoYW5kZWQgb3ZlciBr
ZXhlYywgYXJlIHRoZXkgc29tZWhvdyByZS1kaXNjb3ZlcmVkPwo+Pj4+Cj4+Pj4gV2hhdCBFRkkg
aGFuZGxlcyBhcmUgeW91IHRhbGtpbmcgYWJvdXQ/IEZvciBydW50aW1lIHNlcnZpY2VzCj4+Pj4g
d2hhdCBhIGNvbnN1bWVyIG5lZWRzIGlzIGEgdGFibGUgcG9pbnRlciwgd2hpY2ggaXMgYSBmaWVs
ZAo+Pj4+IGluIHRoZSBzeXN0ZW0gdGFibGUsIHdoaWNoIGluIHR1cm4gaXMgYW4gYXJndW1lbnQg
cGFzc2VkIHRvCj4+Pj4gdGhlIEVGSSBhcHBsaWNhdGlvbidzIGVudHJ5IHBvaW50Lgo+Pj4KPj4+
IFllcywgSSdtIHRhbGtpbmcgYWJvdXQgdGhvc2UgcG9pbnRlcnMgKHN5c3RlbSB0YWJsZSBzcGVj
aWZpY2FsbHkpLgo+Pj4KPj4+PiBJIGRpZG4ndCB0aGluayB0aGVyZSBhcmUKPj4+PiBwcm92aXNp
b25zIGluIHRoZSBzcGVjIGZvciBlaXRoZXIgb2YgdGhlc2UgcG9pbnRlcnMgYmVpbmcgTlVMTC4K
Pj4+Cj4+PiBCdXQgSSBkb24ndCBzZWUga2V4ZWMgdXNpbmcgRUZJIGFwcGxpY2F0aW9uIGVudHJ5
IHBvaW50LiBBbSBJIG1pc3NpbmcKPj4+IHNvbWV0aGluZz8KPj4KPj4gQ2FuIHdlIHN0b3AgdGhp
bmtpbmcgYWJvdXQgYSBMaW51eCAtPiBYZW4gdHJhbnNpdGlvbiBvbiB0aGlzCj4+IHRocmVhZCBw
bGVhc2U/IAo+IAo+IEknbSB0YWxraW5nIGFib3V0IFhlbi0+WGVuIHRyYW5zaXRpb24gaGVyZS4g
SG93IHN5c3RlbSB0YWJsZSBwb2ludGVyIGlzCj4gcGFzc2VkIGZyb20gb2xkIFhlbiB0byBuZXcg
WGVuIGluc3RhbmNlPyBBbmQgaG93IHRoZSBuZXcgWGVuIGluc3RhbmNlCj4gZGVhbHMgd2l0aCBi
b290IHNlcnZpY2VzIGJlaW5nIG5vdCBhdmFpbGFibGUgYW55bW9yZT8KCkl0IGRvZXNuJ3QuIEkg
c2hvdWxkIGJldHRlciBoYXZlIHNhaWQgIiogLT4gWGVuIHRyYW5zaXRpb25zIiBpbgpteSBlYXJs
aWVyIHJlcGx5LiBJIHNpbXBseSBjYW4ndCBzZWUgaG93IHRoaXMgY2FuIGFsbCB3b3JrIHdpdGgK
RUZJIHVuZGVybmVhdGggd2l0aG91dCBzb21lIGV4dHJhIGNvbnZleWluZyBvZiBkYXRhIGZyb20g
dGhlIG9sZAp0byB0aGUgbmV3IGluc3RhbmNlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
