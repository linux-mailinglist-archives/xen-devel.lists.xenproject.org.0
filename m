Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC26124458
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:21:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihWPP-0002E4-GM; Wed, 18 Dec 2019 10:18:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihWPN-0002Dz-T8
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 10:18:21 +0000
X-Inumbo-ID: b236a7ba-217f-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b236a7ba-217f-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 10:18:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C58CDB19A;
 Wed, 18 Dec 2019 10:18:11 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <20191217151144.9781-2-aisaila@bitdefender.com>
 <c0bc8c84-dbb5-0030-061a-a665a7901b80@suse.com>
 <3afbe9f0-0b89-f566-b5f0-b656cb2f23da@bitdefender.com>
 <fe9f516c-7f8e-f3ac-cc30-e7e8a6f882fb@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <600c17a8-e205-ce7d-69bf-036c004459a0@suse.com>
Date: Wed, 18 Dec 2019 11:18:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <fe9f516c-7f8e-f3ac-cc30-e7e8a6f882fb@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 2/4] x86/altp2m: Add hypercall to set a
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAwOTo0NSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMTguMTIuMjAxOSAxMDoxMywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+
Cj4+Pj4gKy8qCj4+Pj4gKyAqIFNldC9jbGVhciB0aGUgI1ZFIHN1cHByZXNzIGJpdCBmb3IgbXVs
dGlwbGUgcGFnZXMuICBPbmx5IGF2YWlsYWJsZSBvbiBWTVguCj4+Pj4gKyAqLwo+Pj4+ICtpbnQg
cDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShzdHJ1Y3QgZG9tYWluICpkLAo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVf
bXVsdGkgKnN2ZSkKPj4+PiArewo+Pj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKmhvc3RfcDJt
ID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+Pj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKmFwMm0g
PSBOVUxMOwo+Pj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IGhvc3RfcDJtOwo+Pj4+
ICsgICAgdWludDY0X3Qgc3RhcnQgPSBzdmUtPmZpcnN0X2dmbjsKPj4+PiArICAgIGludCByYyA9
IDA7Cj4+Pj4gKyAgICB1aW50NjRfdCBtYXhfcGh5c19hZGRyID0gKDFVTCA8PCBkLT5hcmNoLmNw
dWlkLT5leHRkLm1heHBoeXNhZGRyKSAtIDE7Cj4+Pj4gKwo+Pj4+ICsgICAgaWYgKCBzdmUtPnZp
ZXcgPiAwICkKPj4+PiArICAgIHsKPj4+PiArICAgICAgICBpZiAoIHN2ZS0+dmlldyA+PSBNQVhf
QUxUUDJNIHx8Cj4+Pj4gKyAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2lu
ZGV4X25vc3BlYyhzdmUtPnZpZXcsIE1BWF9FUFRQKV0gPT0KPj4+PiArICAgICAgICAgICAgIG1m
bl94KElOVkFMSURfTUZOKSApCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+
ICsKPj4+PiArICAgICAgICBwMm0gPSBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2lu
ZGV4X25vc3BlYyhzdmUtPnZpZXcsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFYX0FMVFAyTSldOwo+Pj4+ICsgICAgfQo+
Pj4+ICsKPj4+PiArICAgIHAybV9sb2NrKGhvc3RfcDJtKTsKPj4+PiArCj4+Pj4gKyAgICBpZiAo
IGFwMm0gKQo+Pj4+ICsgICAgICAgIHAybV9sb2NrKGFwMm0pOwo+Pj4+ICsKPj4+PiArICAgIHdo
aWxlICggc3ZlLT5sYXN0X2dmbiA+PSBzdGFydCAmJiBzdGFydCA8IG1heF9waHlzX2FkZHIgKQo+
Pj4KPj4+IFdoeSBkb24ndCB5b3UgY2xpcCAtPmxhc3RfZ2ZuIGFoZWFkIG9mIHRoZSBsb29wLCBz
YXZpbmcgb25lCj4+PiBjb21wYXJpc29uIHBlciBpdGVyYXRpb24/Cj4+Cj4+IEkndmUgZG9uZSB0
aGlzIHNvIGl0IHdpbGwgaGF2ZSBmZXdlciBsaW5lcyBidXQgc3VyZSwgSSBjYW4gaGF2ZSB0aGUK
Pj4gLT5sYXN0X2dmbiBjaGVjayBiZWZvcmUgdGhlIGxvb3AuCj4gCj4gV291bGRuJ3QgdGhlcmUg
YmUgYSBpc3N1ZSBpZiBzdGFydCBnb2VzIG92ZXIgLT5sYXN0X2dmbiBhbmQgdGhlcmUgaXMgbm8g
Cj4gYnJlYWsgZm9yIHByZWVtcHRpb24/IFRoZW4gdGhlIGxvb3Agd2lsbCBydW4gdW50aWwgbWF4
X3BoeXNfYWRkci4KCkknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQuIE15IGd1ZXNzIGlzIGEgbWlz
dW5kZXJzdGFuZGluZyAtIEknbQphc2tpbmcgdG8gcmVwbGFjZSB0aGUgcmlnaHQgc2lkZSBvZiB0
aGUgJiYsIGFuZCBpdCBsb29rcyB5b3UKdW5kZXJzdG9vZCBtZSB0byBtZWFuIHRoZSBsZWFzdCBz
aWRlLiBOb3RlIGhvdyBJIHNhaWQgImNsaXAiIGluCm15IGVhcmxpZXIgcmVwbHksIG1lYW5pbmcg
eW91IHRvIHVwZGF0ZSAtPmxhc3RfZ2ZuIGFoZWFkIG9mIHRoZQpsb29wIGlmIGl0J3MgYWJvdmUg
KDFVTCA8PCBkLT5hcmNoLmNwdWlkLT5leHRkLm1heHBoeXNhZGRyKSAtIDEuClBlcmhhcHMgdGhp
cyBjb3VsZCBldmVuIGJlIGRvbmUgaW4gdGhlIGNhbGxlciB0b2dldGhlciB3aXRoIChhbmQKcG9z
c2libHkgYWhlYWQgb2YpIHRoZSBvdGhlciBzYW5pdHkgY2hlY2tpbmcgb2YgaW5jb21pbmcgdmFs
dWVzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
