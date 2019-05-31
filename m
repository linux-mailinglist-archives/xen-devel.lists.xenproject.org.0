Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6BF30C6F
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:14:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWeV8-00080U-7S; Fri, 31 May 2019 10:11:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWeV6-00080O-6E
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:11:04 +0000
X-Inumbo-ID: 653a760d-838c-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 653a760d-838c-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 10:11:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96551341;
 Fri, 31 May 2019 03:11:02 -0700 (PDT)
Received: from [10.37.12.213] (unknown [10.37.12.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BC563F59C;
 Fri, 31 May 2019 03:11:00 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
 <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
 <5CF0FC080200007800233E50@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7ca91b27-1c37-70ab-e367-494603e4464d@arm.com>
Date: Fri, 31 May 2019 11:10:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF0FC080200007800233E50@prv1-mh.provo.novell.com>
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

SGkgSmFuLAoKT24gNS8zMS8xOSAxMTowMyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MzEuMDUuMTkgYXQgMTE6NTIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDUv
MzEvMTkgMTA6NDkgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMzEuMDUuMTkgYXQg
MTE6NDIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gNS8zMS8xOSAxMDoz
NSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5o
Cj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4+Pj4+IEBAIC02NDQsNiArNjQ0LDkg
QEAgc3RhdGljIGlubGluZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYQo+Pj4+PiAgICAgCj4+
Pj4+ICAgICAvKiBQcml2YXRlIGRvbWFpbiBzdHJ1Y3RzIGZvciBET01JRF9YRU4sIERPTUlEX0lP
LCBldGMuICovCj4+Pj4+ICAgICBleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX3hlbiwgKmRvbV9p
bywgKmRvbV9jb3c7Cj4+Pj4KPj4+PiBEb24ndCB5b3Ugd2FudCB0byBwcm90ZWN0IGRvbV9jb3cg
d2l0aCAiI2lmZGVmIENPTkZJR19IQVNfTUVNX1NIQVJJTkciPwo+Pj4KPj4+IFRoZXJlJ3Mgbm8g
bmVlZCB0byB3aXRoIC4uLgo+Pj4KPj4+Pj4gKyNpZm5kZWYgQ09ORklHX0hBU19NRU1fU0hBUklO
Rwo+Pj4+PiArIyBkZWZpbmUgZG9tX2NvdyBOVUxMCj4+Pj4+ICsjZW5kaWYKPj4+Cj4+PiAuLi4g
dGhpcywgYW5kIHRoaXMgd2F5IHRoZXJlJ3MgbGVzcyBjbHV0dGVyIG92ZXJhbGwuCj4+Cj4+IEkg
YW0gYWxsIGZvciBhdm9pZGluZyBjbHV0dGVyaW5nIGJ1dCBub3QgYXQgdGhlIGV4cGVuc2Ugb2Yg
bWFraW5nIHRoZQo+PiBjb2RlIGxlc3MgaW50dWl0aXZlLiBJbiB0aGlzIGNhc2UsIEkgd291bGQg
cHJlZmVyIHRoZSBkZWNsZXJhdGlvbgo+PiBkb21fY293IHRvIGJlIGd1YXJkZWQuCj4gCj4gV2hp
bGUgaXQgd291bGQgYmUgZWFzeSBlbm91Z2ggdG8gZG8sIEkgZmFpbCB0byBzZWUgaG93IHRoZSBj
aG9zZW4KPiBjb25zdHJ1Y3QgaXMgbm90ICJpbnR1aXRpdmUiLgoKRXZlbiBpZiBJIGtub3cgdGhl
IHByZS1wcmVwcm9jZXNzb3Igd2lsbCBkbyB0aGUgcmlnaHQgdGhpbmcgaGVyZSwgeW91IApjb3Vs
ZCBzcGFyZSB0aGUgZGV2ZWxvcHBlciB0byB0cmlwIG92ZXIgdGhpcyBjb2RlIGFuZCB3b25kZXIg
d2h5IGl0IGlzIApmaXJzdCBkZWZpbmVkIGFuZCB0aGVuIG92ZXJyaWRlIHdpdGggTlVMTC4KCj4g
SW4gZmFjdCBJIGRvbid0IHRoaW5rIHRoaXMgd291bGQgYmUgdGhlCj4gZmlyc3QgaW5zdGFuY2Ug
b2YgYSAjZGVmaW5lIG92ZXJyaWRpbmcgYSBwcmlvciBkZWNsYXJhdGlvbi4gRG9pbmcgc28KPiB1
dGlsaXplcyBvbmUgb2YgdGhlIHZlcnkgYmFzaWMgQyBwcmVwcm9jZXNzb3IgcHJpbmNpcGxlcy4K
CllvdSBhcmUgdGhlIGZpcnN0IG9uZSB1c3VhbGx5IHRvIHNheSB0aGF0IHNvbWUgY2hvaWNlcyBp
biBYZW4gd2VyZSBub3QgCmNvcnJlY3QgYW5kIHRoZXJlZm9yZSBubyBtb3JlIGluc3RhbmNlIHNo
b3VsZCBiZSBhZGRlZC4KClRoaXMgaXMgb25lIGNhc2Ugd2hlcmUgdGhlIHJlc3VsdGluZyBjb2Rl
IGlzIGNvdW50ZXItaW50dWl0aXZlIGFuZCB1Z2x5LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
