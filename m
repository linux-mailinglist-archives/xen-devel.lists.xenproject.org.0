Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E71E30CB4
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:37:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWerx-0001r7-HI; Fri, 31 May 2019 10:34:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWerw-0001qu-D8
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:34:40 +0000
X-Inumbo-ID: b1aa68e2-838f-11e9-991e-f7e585938989
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b1aa68e2-838f-11e9-991e-f7e585938989;
 Fri, 31 May 2019 10:34:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51C81341;
 Fri, 31 May 2019 03:34:39 -0700 (PDT)
Received: from [10.37.12.213] (unknown [10.37.12.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EBCD3F59C;
 Fri, 31 May 2019 03:34:37 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
 <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
 <5CF0FC080200007800233E50@prv1-mh.provo.novell.com>
 <7ca91b27-1c37-70ab-e367-494603e4464d@arm.com>
 <5CF1026F0200007800233ED8@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <aa27503b-7fcb-dbf0-1f69-6aae35b6f4c1@arm.com>
Date: Fri, 31 May 2019 11:34:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF1026F0200007800233ED8@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNS8zMS8xOSAxMTozMSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MzEuMDUuMTkgYXQgMTI6MTAsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDUv
MzEvMTkgMTE6MDMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMzEuMDUuMTkgYXQg
MTE6NTIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gNS8zMS8xOSAxMDo0
OSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IE9uIDMxLjA1LjE5IGF0IDExOjQyLCA8
anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+Pj4gT24gNS8zMS8xOSAxMDozNSBBTSwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL21tLmgKPj4+
Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+Pj4+Pj4+IEBAIC02NDQsNiArNjQ0LDkg
QEAgc3RhdGljIGlubGluZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYQo+Pj4+Pj4+ICAgICAg
Cj4+Pj4+Pj4gICAgICAvKiBQcml2YXRlIGRvbWFpbiBzdHJ1Y3RzIGZvciBET01JRF9YRU4sIERP
TUlEX0lPLCBldGMuICovCj4+Pj4+Pj4gICAgICBleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX3hl
biwgKmRvbV9pbywgKmRvbV9jb3c7Cj4+Pj4+Pgo+Pj4+Pj4gRG9uJ3QgeW91IHdhbnQgdG8gcHJv
dGVjdCBkb21fY293IHdpdGggIiNpZmRlZiBDT05GSUdfSEFTX01FTV9TSEFSSU5HIj8KPj4+Pj4K
Pj4+Pj4gVGhlcmUncyBubyBuZWVkIHRvIHdpdGggLi4uCj4+Pj4+Cj4+Pj4+Pj4gKyNpZm5kZWYg
Q09ORklHX0hBU19NRU1fU0hBUklORwo+Pj4+Pj4+ICsjIGRlZmluZSBkb21fY293IE5VTEwKPj4+
Pj4+PiArI2VuZGlmCj4+Pj4+Cj4+Pj4+IC4uLiB0aGlzLCBhbmQgdGhpcyB3YXkgdGhlcmUncyBs
ZXNzIGNsdXR0ZXIgb3ZlcmFsbC4KPj4+Pgo+Pj4+IEkgYW0gYWxsIGZvciBhdm9pZGluZyBjbHV0
dGVyaW5nIGJ1dCBub3QgYXQgdGhlIGV4cGVuc2Ugb2YgbWFraW5nIHRoZQo+Pj4+IGNvZGUgbGVz
cyBpbnR1aXRpdmUuIEluIHRoaXMgY2FzZSwgSSB3b3VsZCBwcmVmZXIgdGhlIGRlY2xlcmF0aW9u
Cj4+Pj4gZG9tX2NvdyB0byBiZSBndWFyZGVkLgo+Pj4KPj4+IFdoaWxlIGl0IHdvdWxkIGJlIGVh
c3kgZW5vdWdoIHRvIGRvLCBJIGZhaWwgdG8gc2VlIGhvdyB0aGUgY2hvc2VuCj4+PiBjb25zdHJ1
Y3QgaXMgbm90ICJpbnR1aXRpdmUiLgo+Pgo+PiBFdmVuIGlmIEkga25vdyB0aGUgcHJlLXByZXBy
b2Nlc3NvciB3aWxsIGRvIHRoZSByaWdodCB0aGluZyBoZXJlLCB5b3UKPj4gY291bGQgc3BhcmUg
dGhlIGRldmVsb3BwZXIgdG8gdHJpcCBvdmVyIHRoaXMgY29kZSBhbmQgd29uZGVyIHdoeSBpdCBp
cwo+PiBmaXJzdCBkZWZpbmVkIGFuZCB0aGVuIG92ZXJyaWRlIHdpdGggTlVMTC4KPiAKPiBUbyBi
ZSBob25lc3QsIGFuIHVuY29uZGl0aW9uYWwgZGVjbGFyYXRpb24gd2l0aCBhIGNvbmRpdGlvbmFs
Cj4gb3ZlcnJpZGUgZG9lc24ndCBsZWF2ZSBtdWNoIHRvIHdvbmRlciBhYm91dC4gSSdsbCB3YWl0
IHRvIHNlZQo+IHdoYXQgb3RoZXIgbWFpbnRhaW5lcnMgdGhpbmsgYmVmb3JlIGRlY2lkaW5nIGVp
dGhlciB3YXkuCj4gCj4+PiBJbiBmYWN0IEkgZG9uJ3QgdGhpbmsgdGhpcyB3b3VsZCBiZSB0aGUK
Pj4+IGZpcnN0IGluc3RhbmNlIG9mIGEgI2RlZmluZSBvdmVycmlkaW5nIGEgcHJpb3IgZGVjbGFy
YXRpb24uIERvaW5nIHNvCj4+PiB1dGlsaXplcyBvbmUgb2YgdGhlIHZlcnkgYmFzaWMgQyBwcmVw
cm9jZXNzb3IgcHJpbmNpcGxlcy4KPj4KPj4gWW91IGFyZSB0aGUgZmlyc3Qgb25lIHVzdWFsbHkg
dG8gc2F5IHRoYXQgc29tZSBjaG9pY2VzIGluIFhlbiB3ZXJlIG5vdAo+PiBjb3JyZWN0IGFuZCB0
aGVyZWZvcmUgbm8gbW9yZSBpbnN0YW5jZSBzaG91bGQgYmUgYWRkZWQuCj4gCj4gT2gsIGRpZCBt
eSBlYXJsaWVyIHJlcGx5IHNvdW5kIGFzIGlmIEknbSBub3QgaGFwcHkgYWJvdXQgdGhvc2UKPiBt
ZW50aW9uZWQgaW5zdGFuY2VzPyAKCk5vIGl0IHdhcyBhIG1vcmUgZ2VuZXJpYyBzdGF0ZW1lbnQg
b24gdGhlIHN0YW5jZSAiSXQgYWxyZWFkeSBleGlzdHMgaW4gClhlbiBzbyBpdCBpcyBmaW5lIHRv
IHNwcmVhZCB0aGVtIGEgYml0IG1vcmUiLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
