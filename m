Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0B1425F6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 09:42:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itSaQ-0005iT-Cr; Mon, 20 Jan 2020 08:39:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itSaO-0005iN-RH
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 08:39:04 +0000
X-Inumbo-ID: 4b73abd6-3b60-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b73abd6-3b60-11ea-8e9a-bc764e2007e4;
 Mon, 20 Jan 2020 08:38:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 307FCB2BD;
 Mon, 20 Jan 2020 08:38:53 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <1579232458-26803-1-git-send-email-xuwei5@hisilicon.com>
 <539d5900-1cc6-a490-7319-5357c6aa1219@suse.com>
 <d936960f-214d-788b-29cf-7be147332ea9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d658434-0dfd-24bb-9b84-8ae365e1feac@suse.com>
Date: Mon, 20 Jan 2020 09:38:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d936960f-214d-788b-29cf-7be147332ea9@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ns16550: Add ACPI support
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, linuxarm@huawei.com,
 Wei Xu <xuwei5@hisilicon.com>, shameerali.kolothum.thodi@huawei.com,
 prime.zeng@hisilicon.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDEuMjAyMCAxMzozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE3LzAxLzIwMjAg
MDg6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxNy4wMS4yMDIwIDA0OjQwLCBXZWkgWHUg
d3JvdGU6Cj4+PiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+Pj4gKysrIGIveGVu
L2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPj4+IEBAIC0xNjIwLDYgKzE2MjAsNjEgQEAgRFRfREVW
SUNFX1NUQVJUKG5zMTY1NTAsICJOUzE2NTUwIFVBUlQiLCBERVZJQ0VfU0VSSUFMKQo+Pj4gICBE
VF9ERVZJQ0VfRU5ECj4+PiAgIAo+Pj4gICAjZW5kaWYgLyogSEFTX0RFVklDRV9UUkVFICovCj4+
PiArCj4+PiArI2lmZGVmIENPTkZJR19BQ1BJCj4+PiArI2luY2x1ZGUgPHhlbi9hY3BpLmg+Cj4+
PiArCj4+PiArc3RhdGljIGludCBfX2luaXQgbnMxNjU1MF9hY3BpX3VhcnRfaW5pdChjb25zdCB2
b2lkICpkYXRhKQo+Pj4gK3sKPj4+ICsgICAgc3RydWN0IGFjcGlfdGFibGVfc3BjciAqc3BjciA9
IE5VTEw7Cj4+PiArICAgIGFjcGlfc3RhdHVzIHN0YXR1czsKPj4+ICsgICAgc3RydWN0IG5zMTY1
NTAgKnVhcnQ7Cj4+PiArCj4+PiArICAgIHN0YXR1cyA9IGFjcGlfZ2V0X3RhYmxlKEFDUElfU0lH
X1NQQ1IsIDAsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzdHJ1Y3QgYWNwaV90
YWJsZV9oZWFkZXIgKiopJnNwY3IpOwo+Pj4gKwo+Pj4gKyAgICBpZiAoIEFDUElfRkFJTFVSRShz
dGF0dXMpICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBGYWlsZWQg
dG8gZ2V0IFNQQ1IgdGFibGVcbiIpOwo+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiAr
ICAgIH0KPj4+ICsKPj4+ICsgICAgdWFydCA9ICZuczE2NTUwX2NvbVswXTsKPj4KPj4gWW91IHdh
bnQgdG8ganVzdGlmeSB0aGUgY2hvaWNlIG9mIHdoYXQgKG9uIHg4NiBhdCBsZWFzdD0gd2UnZCBj
YWxsCj4+IGNvbTEgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uLiBBbHNvIHRoaXMgY291bGQgYmUg
dGhlIGluaXRpYWxpemVyCj4+IG9mIHRoZSB2YXJpYWJsZS4KPiAKPiBUaGlzIGlzIHRoZSBzYW1l
IGNob2ljZSBhcyB3ZSBtYWRlIGZvciB0aGUgRFQgYmluZGluZyAoc2VlIAo+IG5zMTY1NTBfdWFy
dCgpKS4gV2Ugb25seSBzdXBwb3J0IG9uZSBVQVJUIG9uIEFybSB3aGljaCBoYXBwZW4gdG8gYmUg
Cj4gbnMxNjU1MF9jb21bMF0gKGJ1dCBuYW1lZCBkaWZlcnJlbnRseSkuCj4gCj4gVGhlIGNvZGUg
YmVsb3cgaXMgYWN0dWFsbHkgcXVpdGUgc2ltaWxhciB0byB0aGUgRFQgcGFyc2luZywgc28gbWF5
YmUgd2UgCj4gd2FudCB0byBwcm92aWRlIGEgY29tbW9uIGhlbHBlciBoZXJlLgoKVGhhdCdzIGFs
bCBmaW5lLCBidXQgZG9lc24ndCBlbGltaW5hdGUgdGhlIG5lZWQgdG8gc2F5IHNvIGluIHRoZQpk
ZXNjcmlwdGlvbi4KCj4+PiArICAgIC8qICBSZWdpc3RlciB3aXRoIGdlbmVyaWMgc2VyaWFsIGRy
aXZlci4gKi8KPj4+ICsgICAgc2VyaWFsX3JlZ2lzdGVyX3VhcnQodWFydCAtIG5zMTY1NTBfY29t
LCAmbnMxNjU1MF9kcml2ZXIsIHVhcnQpOwo+Pj4gKwo+Pj4gKyAgICByZXR1cm4gMDsKPj4+ICt9
Cj4+PiArCj4+PiArQUNQSV9ERVZJQ0VfU1RBUlQoYW5zMTY1NTAsICJOUzE2NTUwIFVBUlQiLCBE
RVZJQ0VfU0VSSUFMKQo+Pj4gKyAgICAuY2xhc3NfdHlwZSA9IEFDUElfREJHMl8xNjU1MF9DT01Q
QVRJQkxFLAo+Pj4gKyAgICAuaW5pdCA9IG5zMTY1NTBfYWNwaV91YXJ0X2luaXQsCj4+PiArQUNQ
SV9ERVZJQ0VfRU5ECj4+Cj4+IEkgZG9uJ3QgZXhwZWN0IHRoaXMgdG8gYnVpbGQgb24geDg2Lgo+
IAo+IFRoaXMgaXMgb25seSBtZWFudCB0byB0YXJnZXQgQXJtLiBTbyBtYXliZSB3ZSB3YW50IHRv
IHByb3RlY3QgdGhlIHdob2xlIAo+IGNvZGUgd2l0aCBkZWZpbmVkKENPTkZJR19BQ1BJKSAmJiBk
ZWZpbmVkKENPTkZJR19BUk0pLgoKSW5kZWVkLCB0aGF0J3Mgd2hhdCB0aGUgcmVtYXJrIHdhcyBh
aW1pbmcgYXQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
