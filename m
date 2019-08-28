Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303FA06C4
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 17:57:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i30H3-0006gs-Vt; Wed, 28 Aug 2019 15:54:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWOn=WY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i30H2-0006gm-Qm
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 15:54:16 +0000
X-Inumbo-ID: 15d8835a-c9ac-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15d8835a-c9ac-11e9-951b-bc764e2007e4;
 Wed, 28 Aug 2019 15:54:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8EEA4ABE3;
 Wed, 28 Aug 2019 15:54:14 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <CABfawhm+eu2ebwdou3btLJxcxBbq+uCHNxf82zahxp8dcsoDEQ@mail.gmail.com>
 <8c7ba37a-7fd0-4901-fd5b-4d04e02d63fc@suse.com>
 <CABfawhkHm89cqMu5m-6SiLU-r8m4kFXcTMAH_3cFfvRQCUDBug@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43f75b07-0e2d-1c71-1a98-d3e875e09b82@suse.com>
Date: Wed, 28 Aug 2019 17:54:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawhkHm89cqMu5m-6SiLU-r8m4kFXcTMAH_3cFfvRQCUDBug@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Question about xenpage_list
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDguMjAxOSAxNzo1MSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgQXVn
IDI4LCAyMDE5IGF0IDk6MzUgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMjguMDguMjAxOSAxNzoyOCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
SGkgYWxsLAo+Pj4gSSdtIHRyeWluZyB0byB0cmFjayBkb3duIGhvdyBhIGNhbGwgaW4gY29tbW9u
L2dyYW50X3RhYmxlLmMgdG8KPj4+IHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qgd2lsbCBhY3R1
YWxseSBwb3B1bGF0ZSB0aGF0IHBhZ2UgaW50byB0aGUKPj4+IGd1ZXN0J3MgcGh5c21hcC4gSW1t
ZWRpYXRlbHkgYWZ0ZXIgdGhlIGNhbGwgdGhlIHBhZ2UgZG9lc24ndCBzZWVtIHRvCj4+PiBiZSBw
cmVzZW50IGluIHRoZSBwaHlzbWFwLCBhcyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0IHdpbGwg
anVzdCBhZGQKPj4+IHRoZSBwYWdlIHRvIHRoZSBkb21haW4ncyB4ZW5wYWdlX2xpc3QgbGlua2Vk
LWxpc3Q6Cj4+Pgo+Pj4gICAgICAgICB1bnNpZ25lZCBsb25nIG1mbjsKPj4+ICAgICAgICAgdW5z
aWduZWQgbG9uZyBnZm47Cj4+Pgo+Pj4gICAgICAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0
KHZpcnRfdG9fcGFnZShndC0+c2hhcmVkX3Jhd1tpXSksIGQsIFNIQVJFX3J3KTsKPj4+Cj4+PiAg
ICAgICAgIG1mbiA9IHZpcnRfdG9fbWZuKGd0LT5zaGFyZWRfcmF3W2ldKTsKPj4+ICAgICAgICAg
Z2ZuID0gbWZuX3RvX2dtZm4oZCwgbWZuKTsKPj4+Cj4+PiAgICAgICAgIGdkcHJpbnRrKFhFTkxP
R19JTkZPLCAiU2hhcmluZyAlbHggLT4gJWx4IHdpdGggZG9tYWluICV1XG4iLAo+Pj4gZ2ZuLCBt
Zm4sIGQtPmRvbWFpbl9pZCk7Cj4+Pgo+Pj4gVGhpcyByZXN1bHRzIGluIHRoZSBmb2xsb3dpbmc6
Cj4+Pgo+Pj4gKFhFTikgZ3JhbnRfdGFibGUuYzoxODIwOmQwdjAgU2hhcmluZyBmZmZmZmZmZmZm
ZmZmZmZmIC0+IDQyYzcxZSB3aXRoIGRvbWFpbiAxCj4+Pgo+Pj4gQUZBSUNUIHRoZSBwYWdlIG9u
bHkgZ2V0cyBwb3B1bGF0ZWQgaW50byB0aGUgcGh5c21hcCBvbmNlIHRoZSBkb21haW4KPj4+IGdl
dHMgdW5wYXVzZWQuIElmIEkgbGV0IHRoZSBkb21haW4gcnVuIGFuZCB0aGVuIHBhdXNlIGl0IEkg
Y2FuIHNlZQo+Pj4gdGhhdCB0aGUgcGFnZSBpcyBpbiB0aGUgZ3Vlc3QncyBwaHlzbWFwIChieSBs
b29waW5nIHRocm91Z2ggYWxsIHRoZQo+Pj4gZW50cmllcyBpbiBpdHMgRVBUKToKPj4+Cj4+PiAo
WEVOKSBtZW1fc2hhcmluZy5jOjE2MzY6ZDB2MCAweGYyMDAwIC0+IDB4NDJjNzFlIGlzIGEgZ3Jh
bnQgbWFwcGluZwo+Pj4gc2hhcmVkIHdpdGggdGhlIGd1ZXN0Cj4+Cj4+IFRoaXMgc2hvdWxkIGJl
IHRoZSByZXN1bHQgb2YgdGhlIGRvbWFpbiBoYXZpbmcgbWFkZSBhIHJlc3BlY3RpdmUKPj4gWEVO
TUFQU1BBQ0VfZ3JhbnRfdGFibGUgcmVxdWVzdCwgc2hvdWxkbid0IGl0Pwo+Pgo+IAo+IERvIHlv
dSBtZWFuIHRoZSBndWVzdCBpdHNlbGYgb3IgdGhlIHRvb2xzdGFjaz8KClRoZSBndWVzdCBpdHNl
bGYgLSBob3cgd291bGQgdGhlIHRvb2wgc3RhY2sga25vdyB3aGVyZSB0byBwdXQgdGhlCmZyYW1l
KHMpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
