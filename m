Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DE3D0D32
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:53:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI9Xn-0004Qk-Sh; Wed, 09 Oct 2019 10:50:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iI9Xm-0004Qf-Cq
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:50:10 +0000
X-Inumbo-ID: 8fda498a-ea82-11e9-96dc-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fda498a-ea82-11e9-96dc-bc764e2007e4;
 Wed, 09 Oct 2019 10:50:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94067AF9F;
 Wed,  9 Oct 2019 10:50:08 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <f8f28f3a-0fad-cbd2-44e0-9a0ecf8ac06d@suse.com>
 <20190807192557.GC3257@mail-itl> <20190808025321.GF3257@mail-itl>
 <36989497-d4d5-a9b3-7de1-8ebb3582cd0a@suse.com>
 <20191008115014.GI8065@mail-itl>
 <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
 <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
 <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
 <20191009103153.GO8065@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
Date: Wed, 9 Oct 2019 12:50:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009103153.GO8065@mail-itl>
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

T24gMDkuMTAuMjAxOSAxMjozMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBXZWQsIE9jdCAwOSwgMjAxOSBhdCAxMDo1Njo1NkFNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDguMTAuMjAxOSAxODoyOSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IE9uIFR1ZSwgT2N0IDA4LCAyMDE5IGF0IDA0OjE5OjEzUE0gKzAyMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4LjEwLjIwMTkgMTU6NTIsIE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSAgd3JvdGU6Cj4+Pj4+IEluIExpbnV4IGNhc2UsIGl0IGxvb2tzIGxpa2Ug
aXQgcGFzc2VzIGFyb3VuZCB0aGUgRUZJIG1lbW9yeSBtYXAgdXNpbmcKPj4+Pj4gc29tZSBMaW51
eC1zcGVjaWZpYyBtZWNoYW5pc20sIGJ1dCBJIGRvbid0IGZpbmQgaXQgcGFydGljdWxhcmx5Cj4+
Pj4+IGFwcGVhbGluZyBvcHRpb24uCj4+Cj4+IC4uLiB0aGF0IHRoaXMgd291bGQgcmVxdWlyZSBY
ZW4gZm9sbG93aW5nIGEgTGludXggcHJvdG9jb2wuCj4+IFRoaXMgaXMgbm90aGluZyB0aGF0IGNh
biB3b3JrIGJ1aWxkaW5nIG9uIEVGSSBpbnRlcmZhY2VzIGFsb25lLgo+IAo+IEFjdHVhbGx5LCB0
aGVyZSBpcyBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZSB1c2VkOiBwcmVzZW5jZSBvZiBib290Cj4g
c2VydmljZXMuIElmIHRoZSBjYWxsIHRvIFNldFZpcnR1YWxBZGRyZXNzTWFwKCkgaXMgYm91bmQg
dG8gaW5pdGlhbAo+IHByZXNlbmNlIG9mIGJvb3Qgc2VydmljZXMsIHRoZW4gaXQgc3VyZWx5IHdv
bid0IGhhcHBlbiBhZnRlciBrZXhlYywgYXMKPiBib290IHNlcnZpY2VzIGFyZSBub3QgYXZhaWxh
YmxlIGFueW1vcmUuIEluIGZhY3QgdGhlIHBhdGNoIEkndmUgc2VudAo+IGRvZXMgZXhhY3RseSB0
aGF0IC0gY2FsbCBTZXRWaXJ0dWFsQWRkcmVzc01hcCgpIGRpcmVjdGx5IGFmdGVyCj4gRXhpdEJv
b3RTZXJ2aWNlcygpLCBidXQgSSd2ZSByZWFsaXplZCB0aGlzIHByb3BlcnR5IG9ubHkgbm93LiBJ
biB0aGlzCj4gY2FzZSwgbWF5YmUga2NvbmZpZyBvcHRpb24gaXMgbm90IG5lZWRlZCBhbnltb3Jl
PwoKSSdtIHVuYXdhcmUgb2YgYSBwcm9wZXJ0eSB0ZWxsaW5nIGFuIEVGSSBhcHBsaWNhdGlvbiB3
aGV0aGVyCmJvb3Qgc2VydmljZXMgYXJlIGF2YWlsYWJsZS4gQnkgdGhlIGRlZmluaXRpb24gSSBr
bm93IHRoZXkncmUKYXZhaWxhYmxlIHVwIGFuZCB1bnRpbCBFeGl0Qm9vdFNlcnZpY2VzKCkgZ2V0
cyBjYWxsZWQuCgo+IEJUVyBIb3cgcnVudGltZSBzZXJ2aWNlcyB3b3JrIGFmdGVyIGtleGVjPyBJ
IGRvbid0IHNlZSBFRkkgaGFuZGxlcwo+IGhhbmRlZCBvdmVyIGtleGVjLCBhcmUgdGhleSBzb21l
aG93IHJlLWRpc2NvdmVyZWQ/CgpXaGF0IEVGSSBoYW5kbGVzIGFyZSB5b3UgdGFsa2luZyBhYm91
dD8gRm9yIHJ1bnRpbWUgc2VydmljZXMKd2hhdCBhIGNvbnN1bWVyIG5lZWRzIGlzIGEgdGFibGUg
cG9pbnRlciwgd2hpY2ggaXMgYSBmaWVsZAppbiB0aGUgc3lzdGVtIHRhYmxlLCB3aGljaCBpbiB0
dXJuIGlzIGFuIGFyZ3VtZW50IHBhc3NlZCB0bwp0aGUgRUZJIGFwcGxpY2F0aW9uJ3MgZW50cnkg
cG9pbnQuIEkgZGlkbid0IHRoaW5rIHRoZXJlIGFyZQpwcm92aXNpb25zIGluIHRoZSBzcGVjIGZv
ciBlaXRoZXIgb2YgdGhlc2UgcG9pbnRlcnMgYmVpbmcgTlVMTC4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
