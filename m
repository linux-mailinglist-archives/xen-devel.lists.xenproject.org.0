Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F6A0672
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 17:38:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2zyV-0004wP-Kw; Wed, 28 Aug 2019 15:35:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWOn=WY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2zyT-0004wK-On
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 15:35:05 +0000
X-Inumbo-ID: 68141f92-c9a9-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68141f92-c9a9-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 15:35:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14A44ABE3;
 Wed, 28 Aug 2019 15:35:04 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <CABfawhm+eu2ebwdou3btLJxcxBbq+uCHNxf82zahxp8dcsoDEQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c7ba37a-7fd0-4901-fd5b-4d04e02d63fc@suse.com>
Date: Wed, 28 Aug 2019 17:35:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawhm+eu2ebwdou3btLJxcxBbq+uCHNxf82zahxp8dcsoDEQ@mail.gmail.com>
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

T24gMjguMDguMjAxOSAxNzoyOCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEhpIGFsbCwKPiBJ
J20gdHJ5aW5nIHRvIHRyYWNrIGRvd24gaG93IGEgY2FsbCBpbiBjb21tb24vZ3JhbnRfdGFibGUu
YyB0bwo+IHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qgd2lsbCBhY3R1YWxseSBwb3B1bGF0ZSB0
aGF0IHBhZ2UgaW50byB0aGUKPiBndWVzdCdzIHBoeXNtYXAuIEltbWVkaWF0ZWx5IGFmdGVyIHRo
ZSBjYWxsIHRoZSBwYWdlIGRvZXNuJ3Qgc2VlbSB0bwo+IGJlIHByZXNlbnQgaW4gdGhlIHBoeXNt
YXAsIGFzIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qgd2lsbCBqdXN0IGFkZAo+IHRoZSBwYWdl
IHRvIHRoZSBkb21haW4ncyB4ZW5wYWdlX2xpc3QgbGlua2VkLWxpc3Q6Cj4gCj4gICAgICAgICB1
bnNpZ25lZCBsb25nIG1mbjsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuOwo+IAo+ICAgICAg
ICAgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCh2aXJ0X3RvX3BhZ2UoZ3QtPnNoYXJlZF9yYXdb
aV0pLCBkLCBTSEFSRV9ydyk7Cj4gCj4gICAgICAgICBtZm4gPSB2aXJ0X3RvX21mbihndC0+c2hh
cmVkX3Jhd1tpXSk7Cj4gICAgICAgICBnZm4gPSBtZm5fdG9fZ21mbihkLCBtZm4pOwo+IAo+ICAg
ICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJTaGFyaW5nICVseCAtPiAlbHggd2l0aCBkb21h
aW4gJXVcbiIsCj4gZ2ZuLCBtZm4sIGQtPmRvbWFpbl9pZCk7Cj4gCj4gVGhpcyByZXN1bHRzIGlu
IHRoZSBmb2xsb3dpbmc6Cj4gCj4gKFhFTikgZ3JhbnRfdGFibGUuYzoxODIwOmQwdjAgU2hhcmlu
ZyBmZmZmZmZmZmZmZmZmZmZmIC0+IDQyYzcxZSB3aXRoIGRvbWFpbiAxCj4gCj4gQUZBSUNUIHRo
ZSBwYWdlIG9ubHkgZ2V0cyBwb3B1bGF0ZWQgaW50byB0aGUgcGh5c21hcCBvbmNlIHRoZSBkb21h
aW4KPiBnZXRzIHVucGF1c2VkLiBJZiBJIGxldCB0aGUgZG9tYWluIHJ1biBhbmQgdGhlbiBwYXVz
ZSBpdCBJIGNhbiBzZWUKPiB0aGF0IHRoZSBwYWdlIGlzIGluIHRoZSBndWVzdCdzIHBoeXNtYXAg
KGJ5IGxvb3BpbmcgdGhyb3VnaCBhbGwgdGhlCj4gZW50cmllcyBpbiBpdHMgRVBUKToKPiAKPiAo
WEVOKSBtZW1fc2hhcmluZy5jOjE2MzY6ZDB2MCAweGYyMDAwIC0+IDB4NDJjNzFlIGlzIGEgZ3Jh
bnQgbWFwcGluZwo+IHNoYXJlZCB3aXRoIHRoZSBndWVzdAoKVGhpcyBzaG91bGQgYmUgdGhlIHJl
c3VsdCBvZiB0aGUgZG9tYWluIGhhdmluZyBtYWRlIGEgcmVzcGVjdGl2ZQpYRU5NQVBTUEFDRV9n
cmFudF90YWJsZSByZXF1ZXN0LCBzaG91bGRuJ3QgaXQ/CgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
