Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C41E2047
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:13:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJDg-0003ni-2q; Wed, 23 Oct 2019 16:10:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNJDe-0003nd-Su
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:10:42 +0000
X-Inumbo-ID: a89635f0-f5af-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a89635f0-f5af-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 16:10:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6FC57B04F;
 Wed, 23 Oct 2019 16:10:40 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20191023153643.GI1410@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d7e16767-94ef-a83c-3995-3f991c54c69d@suse.com>
Date: Wed, 23 Oct 2019 18:10:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023153643.GI1410@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] efi: remove old
 SetVirtualAddressMap() arrangement
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxNzozNiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IE9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDA1OjE1OjQyUE0gKzAyMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBPbiAxMy4xMC4yMDE5IDAwOjExLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
IHdyb3RlOgo+Pj4gQEAgLTEwOTksOSArMTA5Niw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlf
ZXhpdF9ib290KEVGSV9IQU5ETEUgSW1hZ2VIYW5kbGUsIEVGSV9TWVNURU1fVEFCTEUgKlN5c3Rl
Cj4+PiAgCj4+PiAgICAgIC8qIEFkanVzdCBwb2ludGVycyBpbnRvIEVGSS4gKi8KPj4+ICAgICAg
ZWZpX2N0ID0gKHZvaWQgKillZmlfY3QgKyBESVJFQ1RNQVBfVklSVF9TVEFSVDsKPj4+IC0jaWZk
ZWYgVVNFX1NFVF9WSVJUVUFMX0FERFJFU1NfTUFQCj4+PiAtICAgIGVmaV9ycyA9ICh2b2lkICop
ZWZpX3JzICsgRElSRUNUTUFQX1ZJUlRfU1RBUlQ7Cj4+PiAtI2VuZGlmCj4+Cj4+IFRoaXMgZG9l
c24ndCBnZXQgcmUtaW5zdGF0ZWQgaW4gYW55IHdheSBieSBwYXRjaCAyLiAKPiAKPiBUaGlzIGNv
bW1pdCByZW1vdmUgZGVhZCBjb2RlLgo+IAo+PiBIb3cgY29tZSB5b3UKPj4gZ2V0IGF3YXkgd2l0
aG91dD8gCj4gCj4gVGhlIHNlY29uZCBwYXRjaCBkb2Vzbid0IGp1c3QgZml4IHdoYXQgd2FzIHVu
ZGVyICNpZmRlZgo+IFVTRV9TRVRfVklSVFVBTF9BRERSRVNTX01BUC4gSXQgZG9lcyBhIGNvbXBs
ZXRlbHkgZGlmZmVyZW50IGFwcHJvYWNoIHRvCj4gdXNpbmcgU2V0VmlydHVhbEFkZHJlc3NNYXAu
IFNlZSBiZWxvdy4KPiAKPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAwNToyNjo0OFBNICswMjAw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMTAuMjAxOSAwMDoxMSwgTWFyZWsgTWFyY3p5
a293c2tpLUfDs3JlY2tpICB3cm90ZToKPj4+IEBAIC0xNTkxLDEwICsxNTc2LDYgQEAgdm9pZCBf
X2luaXQgZWZpX2luaXRfbWVtb3J5KHZvaWQpCj4+PiAgICAgICAgICByZXR1cm47Cj4+PiAgICAg
IH0KPj4+ICAKPj4+IC0jaWZkZWYgVVNFX1NFVF9WSVJUVUFMX0FERFJFU1NfTUFQCj4+PiAtICAg
IGVmaV9ycy0+U2V0VmlydHVhbEFkZHJlc3NNYXAoZWZpX21lbW1hcF9zaXplLCBlZmlfbWRlc2Nf
c2l6ZSwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZGVzY192ZXIsIGVm
aV9tZW1tYXApOwo+Pj4gLSNlbHNlCj4+PiAgICAgIC8qIFNldCB1cCAxOjEgcGFnZSB0YWJsZXMg
dG8gZG8gcnVudGltZSBjYWxscyBpbiAicGh5c2ljYWwiIG1vZGUuICovCj4+Cj4+IFRoaXMgY29t
bWVudCwgYnR3LCBhbHNvIHdhbnRzIGVpdGhlciBhZGp1c3Rpbmcgb3IgcmVtb3ZpbmcuCj4gCj4g
Tm8sIGl0IHN0aWxsIHNldHVwIDE6MSBwYWdlIHRhYmxlcyBmb3IgdGhlIHJ1bnRpbWUgY2FsbHMs
IGV4YWN0bHkgYXMgaXQKPiB3YXMgYmVmb3JlLgoKQnV0IHRoZSAicGh5c2ljYWwiIGlzIG5vIGxv
bmdlciBjb3JyZWN0LgoKPiBUaGlzIGlzIGFsc28gd2h5IEkgZG9uJ3QgbmVlZCB0byBhZGp1c3Qg
ZWZpX3JzLgoKV2VsbCwgeW91IG1heSBub3QgX25lZWRfIHRvIHdpdGggdGhlIGN1cnJlbnQgY29k
ZSBzdHJ1Y3R1cmUsIGJ1dCBJCndvbmRlciBpZiB5b3UgYmV0dGVyIHdvdWxkLiBJbiBmYWN0IEkg
d29uZGVyIHdoZXRoZXIgdGhlICNpZmRlZgphcm91bmQgdGhlIGxpbmUgZnVydGhlciB1cCBzaG91
bGRuJ3QgaGF2ZSBiZWVuIHJlbW92ZWQgYWxyZWFkeQooYW5kIGhlbmNlIHRoYXQncyB3aGF0IHlv
dSB3YW50IHRvIGRvKTogVGFrZSB0aGUgcHJvY2Vzc2luZyBvZgpYRU5fRUZJX3F1ZXJ5X3Zhcmlh
YmxlX2luZm8gLSBpdCBjb3VsZCBkbyB0aGUgdmVyc2lvbiBjaGVjawpvdXRzaWRlIG9mIHRoZSBl
ZmlfcnNfe2VudGVyLGV4aXR9KCkgcmVnaW9uIGlmIGVmaV9ycyB3YXMgcHJvcGVybHkKcmVsb2Nh
dGVkLiBSaWdodCBub3cgaXQncyBhIHJlcXVpcmVtZW50IHRvIG1ha2UgYWxsIGFjY2Vzc2VzIHRv
CmVmaV9ycyB3aXRoaW4gc3VjaCByZWdpb25zLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
