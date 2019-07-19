Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E546E66C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:33:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSys-0002sP-Ns; Fri, 19 Jul 2019 13:31:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoSyr-0002sF-FG
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:31:25 +0000
X-Inumbo-ID: 80b8dfde-aa29-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 80b8dfde-aa29-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:31:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFEF0337;
 Fri, 19 Jul 2019 06:31:23 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 516823F71A;
 Fri, 19 Jul 2019 06:31:22 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
 <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
 <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
 <a0c71023-2546-d7c4-771c-02a944c93d90@arm.com>
 <CABfawhm+e4YfnPGT9K-aWqipAFJp1tqfFr9dNDm6g0Twb2gGoA@mail.gmail.com>
 <d9f6faf8-c784-7998-e184-19702a625ca9@arm.com>
Message-ID: <6cabe11e-af20-2096-5516-02c0deaf6fca@arm.com>
Date: Fri, 19 Jul 2019 14:31:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <d9f6faf8-c784-7998-e184-19702a625ca9@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS8wNy8yMDE5IDE0OjI0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgVGFtYXMsCj4g
Cj4gT24gMTkvMDcvMjAxOSAxNDoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+PiBPbiBGcmks
IEp1bCAxOSwgMjAxOSBhdCA3OjExIEFNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+IHdyb3RlOgo+Pj4KPj4+IEhpIFRhbWFzLAo+Pj4KPj4+IE9uIDE5LzA3LzIwMTkgMTQ6MDAs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+PiBPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCAyOjQz
IEFNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+
PiBIaSBUYW1hcywKPj4+Pj4KPj4+Pj4gT24gMTgvMDcvMjAxOSAxODo0OCwgVGFtYXMgSyBMZW5n
eWVsIHdyb3RlOgo+Pj4+Pj4+IMKgwqDCoMKgwqAgLSBMaW5lIDEwMjU6IFRoZSB0b29scyBuZWVk
cyB0byBiZSBhYmxlIHRvIGRlYWwgZm9yX2VhY2hfdmNwdSguLi4pIAo+Pj4+Pj4+ICYgY28uCj4+
Pj4+Pgo+Pj4+Pj4gVGhlc2UgY2FuIGJlIG1hZGUgT0sgYnkgYWRkaW5nIGJyYWNlcy4gT3RoZXIg
dGhhbiB0aGF0IHRoZSBvbmx5IHdheSBJCj4+Pj4+PiBmb3VuZCB0byBtYWtlIGl0IG5vdCBjaGFu
Z2UgdGhlIGluZGVudGF0aW9uIGlzIHRvIGFkZCB0aGUgY29tbWVudCAiLyoKPj4+Pj4+ICpJTkRF
TlQtT0ZGKiAqLyIgYmVmb3JlIHRoZSBibG9jayBhbmQgIi8qICpJTkRFTlQtT04qICovIiBhZnRl
cndhcmRzLgo+Pj4+Pgo+Pj4+PiBOb25lIG9mIHRoZW0gbG9va3MgcmVhbGx5IGFwcGVhbGluZyBi
ZWNhdXNlIGl0IG1lYW5zIGFzdHlsZSB3aWxsIG5vdCBjb3JyZWN0bHkKPj4+Pj4gaW5kZW50IGlm
IHRoZSB1c2VyIGRvZXMgbm90IGFkZCBicmFjZXMgb3IgY29tbWVudHMuCj4+Pj4+Cj4+Pj4+IENv
dWxkIGFzdHlsZSBiZSBlYXNpbHkgbW9kaWZpZWQgdG8gcmVjb2duaXplIGZvcmVhY2ggbWFjcm9z
Pwo+Pj4+Cj4+Pj4gTm90IHRoYXQgSSdtIGF3YXJlIG9mLiBJZiB5b3UgZG9uJ3Qgd2FudCB0byBt
YW51YWxseSBhbm5vdGF0ZSBmaWxlcwo+Pj4+IHdpdGggdW5zdXBwb3J0ZWQgbWFjcm9zIHRoZW4g
anVzdCBleGNsdWRlIHRob3NlIGZpbGVzIGZyb20gYXN0eWxlLiBJCj4+Pj4gd291bGRuJ3QgcmVj
b21tZW5kIGFkZGluZyB0aGlzIHRvIHRoZSBDSSBmb3IgYWxsIGZpbGVzLCBvbmx5IGZvciB0aG9z
ZQo+Pj4+IHRoYXQgdGhlaXIgcmVzcGVjdGl2ZSBtYWludGFpbmVycyBoYXZlIGNvbmZpcm1lZCB0
byBjb25mb3JtIHRvIHRoZQo+Pj4+IHN0eWxlIGFuZCB3YW50IHRvIGVuZm9yY2UgaXQgZ29pbmcg
Zm9yd2FyZC4KPj4+Cj4+PiBTbyBhIGNvdXBsZSB1c2Ugb2YgYW4gdW5zdXBwb3J0ZWQgbWFjcm9z
IHdvdWxkIG1ha2UgaW1wb3NzaWJsZSB0byBlbmZvcmNlIHRoZQo+Pj4gY29kaW5nIHN0eWxlLiBU
aGlzIGlzIG5vdCBhIHZlcnkgaWRlYWwgcG9zaXRpb24gdG8gYmUgaW4uCj4+Pgo+Pj4gX2lmXyB3
ZSBhcmUgZ29pbmcgdG8gYWRvcHQgYXN0eWxlIHRoZW4gd2UgbmVlZCB0byBiZSBhYmxlIHRvIGVu
Zm9yY2UgaXQgb24gZXZlcnkKPj4+IFhlbiBmaWxlcyBsb25nLXRlcm0uIElmIGl0IGlzIG5vdCBw
b3NzaWJsZSB0byBkbyBpdCB3aXRoIGFzdHlsZSwgdGhlbiBtYXliZSB0aGlzCj4+PiBpcyBub3Qg
dGhlIHJpZ2h0IHRvb2wgdG8gdXNlLgo+Pj4KPj4+IEZvciBpbnN0YW5jZSwgSSBrbm93IHRoYXQg
dG9vbHMgc3VjaCBhcyBjbGFuZy1mb3JtYXQgaXMgYWJsZSB0byBkZWFsIHdpdGgKPj4+IGZvcmVh
Y2ggbWFjcm9zLgo+Pgo+PiBJZiB0aGVyZSBhcmUgYmV0dGVyIHRvb2xzIHRoZW4gc3VyZSwgSSBk
b24ndCByZWFsbHkgbWluZCB1c2luZwo+PiBzb21ldGhpbmcgZWxzZS4gSSBqdXN0IGRvbid0IGhh
dmUgdGltZSB0byBkbyB0aGUgbWFudWFsIHN0eWxlIGNoZWNrCj4+IGJhY2stYW5kLWZvcnRoIGFu
eW1vcmUsIHNvIHRoZSBzb29uZXIgd2UgaGF2ZSBzb21ldGhpbmcgaW4gcGxhY2UgdGhlCj4+IGJl
dHRlci4KPiAKPiBJIHRvdGFsbHkgYWdyZWUgd2UgbmVlZCBhIHRvb2wgc28gdGhlIHJldmlld2Vy
IGNhbiBmcmVlLXVwIHNvbWUgdGltZSB0byBmb2N1cyBvbiAKPiBtb3JlIGltcG9ydGFudCB0aGlu
Z3MuIEhvd2V2ZXIsIEkgdGhpbmsgd2Ugc2hvdWxkIGJlIGNhcmVmdWwgb24gd2hhdCB3ZSBhZG9w
dCBoZXJlLgo+IAo+IFNpbWlsYXIgdG8gQW5kcmV3LCBJIGFtIG9wZW4gd2l0aCBtb2RpZnlpbmcg
dGhlIGNvZGluZyBzdHlsZSB0byBoZWxwIHRoZSAKPiBhdXRvbWF0aWMgc3R5bGUgY2hlY2suIEJ1
dCBJIGFtIG5vdCBoYXBweSB0byBkaXNhYmxlIGF1dG9tYXRpYyBzdHlsZSBvbiBwYXJ0IChvciAK
PiBlbnRpcmUpIG9mIGZpbGVzIGZvcmV2ZXIuCj4gCj4gQXQgdGhlIG1vbWVudCwgY2xhbmctZm9y
bWF0IGZlZWxzIG1vcmUgcG93ZXJmdWwgYW5kIHRoZXJlIGFyZSBwZW9wbGUgd29ya2luZyBvbiBp
dC4KCkZZSSwgYmVsb3cgYSBsaW5rIHRvIHRoZSBjbGFuZy1mb3JtYXQgY2hhbmdlczoKCmh0dHBz
Oi8vZ2l0aHViLmNvbS94ZW4tdHJvb3BzL1hlbi1DbGFuZy1mb3JtYXQvYmxvYi9kZXZlbC9jbGFu
Zy1mb3JtYXQucGF0Y2gKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
