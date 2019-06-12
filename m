Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C341C59
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 08:38:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hawq0-0005Uw-2r; Wed, 12 Jun 2019 06:34:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hawpz-0005Ur-3e
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 06:34:23 +0000
X-Inumbo-ID: 1a92c58e-8cdc-11e9-98a0-fff7973fd03b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a92c58e-8cdc-11e9-98a0-fff7973fd03b;
 Wed, 12 Jun 2019 06:34:18 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 00:34:17 -0600
Message-Id: <5D009CE602000078002374B3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 00:34:14 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Baodong Chen" <chenbaodong@mxnavi.com>
References: <5942544893366d8ff51fdf603fd13f18@sslemail.net>
 <5CFFB4A30200007800237133@prv1-mh.provo.novell.com>
 <492c0277-7413-d306-b350-58167a526486@mxnavi.com>
In-Reply-To: <492c0277-7413-d306-b350-58167a526486@mxnavi.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/coverage: wrap coverage related things
 under 'CONFIG_COVERAGE'
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
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEyLjA2LjE5IGF0IDAyOjIzLCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cj4gT24gNi8xMS8xOSAyMjowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDExLjA2LjE5
IGF0IDA4OjAyLCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4v
YXJjaC94ODYveGVuLmxkcy5TCj4+PiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4+PiBA
QCAtMjQwLDEyICsyNDAsMTQgQEAgU0VDVElPTlMKPj4+ICAgICAgICAgICAqKC5hbHRpbnN0cnVj
dGlvbnMpCj4+PiAgICAgICAgICAgX19hbHRfaW5zdHJ1Y3Rpb25zX2VuZCA9IC47Cj4+PiAgIAo+
Pj4gKyNpZiBkZWZpbmVkKENPTkZJR19DT1ZFUkFHRSkKPj4+ICAgICAgICAgIC4gPSBBTElHTig4
KTsKPj4+ICAgICAgICAgIF9fY3RvcnNfc3RhcnQgPSAuOwo+Pj4gICAgICAgICAgKiguY3RvcnMp
Cj4+PiAgICAgICAgICAqKC5pbml0X2FycmF5KQo+Pj4gICAgICAgICAgKihTT1JUKC5pbml0X2Fy
cmF5LiopKQo+Pj4gICAgICAgICAgX19jdG9yc19lbmQgPSAuOwo+Pj4gKyNlbmRpZgo+PiBIb3cg
aXMgdGhpcyAob25seSkgY292ZXJhZ2UgcmVsYXRlZD8gQW5kIGhvdyBpcyBtYWtpbmcgdGhpcyBj
b25kaXRpb25hbAo+PiBnb2luZyB0byBoZWxwIGluIGFueSB3YXk/Cj4gCj4gSGVsbG8gSmFuLAo+
IAo+IFdoZW4gaSByZWFkIHRoZSBjb2RlICdpbml0X2NvbnN0cnVjdG9ycygpJywgaSB3YW50IHRv
IHVuZGVyc3RhbmQgd2hlbiAKPiBpdCdzIHVzZWQuCj4gCj4gSSBjYW4gbm90IGZpbmQgYW55IGhl
bHBlciBtYWNyb3MgbGlrZSAnX19pbml0JyBpbiBpbml0LmgsIHB1dCB0aGluZ3MgaW4gCj4gdGhp
cyBzZWN0aW9uLgo+IAo+IEFsc28gcnVuIHVuZGVyIGFybSBmb3VuZGF0aW9uIHBsYXRmb3JtLCB0
aGUgc2VjdGlvbiBpcyBlbXB0eS4KPiAKPiBTbyBpIGNoZWNrIGNvbW1pdCBoaXN0b3J5IGFuZCBm
b3VuZCBpdCdzIGNvbW1pdCBsb2dzOiBpdCBpcyBjb3ZlcmFnZSAKPiByZWxhdGVkLgo+IAo+IEFu
ZCBjb21waWxlZCB3aXRoIENPTkZJR19DT1ZFUkFHRSBlbmFibGVkLCB0aGlzIHNlY3Rpb24gaXMg
bm90IGVtcHR5IAo+IGFueW1vcmUuCj4gCj4gU28gdGhlIHBhdGNoIG1haW5seSB3YW50IHRvIGNs
YXJpZnkgdGhlIGNvZGUgaXMgY292ZXJhZ2UgcmVsYXRlZCwKPiAKPiB3aGljaCB3YW50IHRvIGhl
bHAgbmV3Y29tZXIgZWFzaWx5IHVuZGVyc3RhbmQgdGhpcyBjb2RlLgo+IAo+IEFtIGkgbWlzdW5k
ZXJzdGFuZGluZyBoZXJlPwoKVGhlIGNvZGUgbWF5IGhhdmUgYmVlbiBfaW50cm9kdWNlZF8gZm9y
IGNvdmVyYWdlLCBidXQgYXJlIHlvdQp3aWxsaW5nIHRvIGd1YXJhbnRlZSBpdCdzIGNvdmVyYWdl
LW9ubHk/IFBsdXMgLSB3aGF0IGRvZXMgcmVtb3ZpbmcKYW4gZW1wdHkgc2VjdGlvbiBidXkgeW91
PwoKPj4+IC0tLSBhL3hlbi9jb21tb24vbGliLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vbGliLmMK
Pj4+IEBAIC00OTEsMTUgKzQ5MSwyMCBAQCB1bnNpZ25lZCBsb25nIGxvbmcgcGFyc2Vfc2l6ZV9h
bmRfdW5pdChjb25zdCBjaGFyICpzLCBjb25zdCBjaGFyICoqcHMpCj4+PiAgICAgICByZXR1cm4g
cmV0Owo+Pj4gICB9Cj4+PiAgIAo+Pj4gKyNpZiBkZWZpbmVkKENPTkZJR19DT1ZFUkFHRSkKPj4+
ICAgdHlwZWRlZiB2b2lkICgqY3Rvcl9mdW5jX3QpKHZvaWQpOwo+Pj4gICBleHRlcm4gY29uc3Qg
Y3Rvcl9mdW5jX3QgX19jdG9yc19zdGFydFtdLCBfX2N0b3JzX2VuZFtdOwo+Pj4gKyNlbmRpZgo+
PiBBZ2FpbiAtIGhvdyBkb2VzIHRoaXMgaGVscD8KPiBXYW50IHRvIGNsYXJpZnkgdGhpcyBpcyBj
b3ZlcmFnZSByZWxhdGVkIGNvZGUuCgpJZiBvbmx5IGl0IHJlYWxseSB3YXMgKHByb3ZhYmx5KS4K
Cj4+PiArLyogc2VlICdkb2NzL2h5cGVydmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QnICov
Cj4+PiAgIHZvaWQgX19pbml0IGluaXRfY29uc3RydWN0b3JzKHZvaWQpCj4+IFRoZXJlJ3Mgbm8g
bWVudGlvbiBvZiB0aGlzIGZ1bmN0aW9uIGluIHRoZSByZWZlcmVuY2VkIGRvY3MgZmlsZS4KPiAK
PiBTYW1lIGFzIGFib3ZlLgoKTm8uIFRoZSByZWZlcmVuY2UgbWFrZXMgbm8gc2Vuc2UgaGVyZSB3
aXRob3V0IHRoYXQgZG9jIHNvbWVob3cKbWVudGlvbmluZyB0aGUgZnVuY3Rpb24geW91IGF0dGFj
aCB0aGUgY29tbWVudCB0by4KCj4+PiAgIHsKPj4+ICsjaWYgZGVmaW5lZChDT05GSUdfQ09WRVJB
R0UpCj4+PiAgICAgICBjb25zdCBjdG9yX2Z1bmNfdCAqZjsKPj4+ICAgICAgIGZvciAoIGYgPSBf
X2N0b3JzX3N0YXJ0OyBmIDwgX19jdG9yc19lbmQ7ICsrZiApCj4+PiAgICAgICAgICAgKCpmKSgp
Owo+Pj4gICAKPj4+ICsjZW5kaWYKPj4+ICAgICAgIC8qIFB1dHRpbmcgdGhpcyBoZXJlIHNlZW1z
IGFzIGdvb2QgKG9yIGJhZCkgYXMgYW55IG90aGVyIHBsYWNlLiAqLwo+PiBBZ2FpbiwgYmVzaWRl
cyBsYWNraW5nIHN1aXRhYmxlIHJlYXNvbmluZyB5b3UgYWxzbyBzaG91bGQgbG9vawo+PiBtb3Jl
IGNsb3NlbHksIGluIHRoaXMgY2FzZSB3aGVyZSBleGFjdGx5IGl0IG1ha2VzIHNlbnNlIHRvIHBs
YWNlCj4+IHRoZSAjZW5kaWYuCj4gCj4gVGhlIGJsYW5rIGxpbmUgaGVyZT8gSWYgeWVzLCBjYW4g
YmUgcmVtb3ZlZC4gaSBtaXNzZWQgdGhpcy4KClJlbW92ZWQ/IE5vLiBJZiBhbnl0aGluZyB0aGVy
ZSdzIG9uZSBtaXNzaW5nLiBZb3UndmUgaW5zZXJ0ZWQKdGhlICNpZmRlZiBhZnRlciB0aGUgYmxh
bmsgbGluZSByYXRoZXIgdGhhbiBiZWZvcmUgaXQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
