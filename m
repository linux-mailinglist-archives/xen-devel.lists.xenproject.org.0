Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B2872C6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 09:11:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvyzB-0002fN-Bk; Fri, 09 Aug 2019 07:06:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvyz9-0002fI-At
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 07:06:47 +0000
X-Inumbo-ID: 3ede1b9e-ba74-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3ede1b9e-ba74-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 07:06:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05F87AE03;
 Fri,  9 Aug 2019 07:06:43 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
 <fc039376-dfc6-b281-c00d-3d1d263744c6@suse.com>
 <20190808092154.GG3257@mail-itl>
 <4d5cdd7d-c73f-88f6-0680-97a67506f095@suse.com>
 <20190808160806.GI3257@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61398db6-bc89-1d93-9fd1-402324062260@suse.com>
Date: Fri, 9 Aug 2019 09:06:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808160806.GI3257@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] EFI: add efi=mapbs option and parse efi=
 early
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxODowOCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwMzoyNToxOVBNICswMDAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDguMDguMjAxOSAxMToyMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDA4OjIxOjU0QU0gKzAwMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4LjA4LjIwMTkgMDI6MzEsIE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSAgd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJv
b3QuaAo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKPj4+Pj4gQEAgLTMx
NSw4ICszMTUsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX2hhbmRsZV9jbWRsaW5l
KENIQVIxNiAqaW1hZ2VfbmFtZSwKPj4+Pj4gICAgICAgICAgICAgbmFtZS5zID0gInhlbiI7Cj4+
Pj4+ICAgICAgICAgcGxhY2Vfc3RyaW5nKCZtYmkuY21kbGluZSwgbmFtZS5zKTsKPj4+Pj4gICAg
IAo+Pj4+PiAtICAgIGlmICggbWJpLmNtZGxpbmUgKQo+Pj4+PiArICAgIGlmICggbWJpLmNtZGxp
bmUgKSB7Cj4+Pj4+ICAgICAgICAgICAgIG1iaS5mbGFncyB8PSBNQklfQ01ETElORTsKPj4+Pj4g
KyAgICAgICAgZWZpX2Vhcmx5X3BhcnNlX2NtZGxpbmUobWJpLmNtZGxpbmUpOwo+Pj4+PiArICAg
IH0KPj4+Pgo+Pj4+IFdoeT8gVGhpcyBpcyB0aGUgeGVuLmVmaSBib290IHBhdGgsIGlzbid0IGl0
Pwo+Pj4KPj4+IFllcywgYXMgZXhwbGFpbmVkIGluIGNvbW1pdCBtZXNzYWdlLCB0aGlzIGlzIHRv
IG1ha2UgaXQgbGVzcyBjb25mdXNpbmcKPj4+IHdoYXQgb3B0aW9uIGNhbiBiZSB1c2VkIHdoZW4u
IFRvIHNheSAiZWZpPW1hcGJzIGRvZXMgWCIgaW5zdGVhZCBvZgo+Pj4gImVmaT1tYXBicyBkb2Vz
IFgsIGJ1dCBvbmx5IGlmIFksIFogYW5kIEsiLgo+Pgo+PiBPdG9oIGl0IGlzIGdvaW5nIHRvIGJl
IGNvbmZ1c2luZyB3aHkgdGhlcmUgYXJlIHR3byB3YXlzIG9mIHNldHRpbmcKPj4gdGhpcyB3aXRo
IHhlbi5lZmkuCj4gCj4gVEJIIEkgdGhpbmsgaXQncyBtb3JlIGNvbmZ1c2luZyB0aGF0IC9tYXBi
cyBjYW4gYmUgc3BlY2lmaWVkIG9ubHkgb24KPiB4ZW4uZWZpIGNtZGxpbmUsIGJ1dCBmb3IgZXhh
bXBsZSBlZmk9bm8tcnMgY2FuIGJlIHVzZWQgb24gYm90aCB4ZW4uZWZpCj4gY21kbGluZSBhbmQg
bm9ybWFsIHhlbiBvcHRpb25zLiBPbmNlIGVmaT0gaXMgcGFyc2VkIGVhcmx5LCBJIHdvdWxkCj4g
Y29uc2lkZXIgZGVwcmVjYXRpbmcgeGVuLmVmaSBzcGVjaWZpYyBvcHRpb25zICh5b3UgY2FuIHVz
ZSBlZmk9IHRoZXJlCj4gYWxyZWFkeSkgYW5kIG1vdmUgb3RoZXIgeGVuLmVmaSBzcGVjaWZpYyBv
cHRpb25zIGFzIGVmaT0uCgpUaGF0J3MgYW4gb3B0aW9uLCB5ZXMuCgo+Pj4+PiBAQCAtMTQxMiwx
NiArMTQxNywzMiBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9lZmlfcGFyYW0oY29uc3QgY2hh
ciAqcykKPj4+Pj4gICAgICAgICAgICAgICAgZWxzZQo+Pj4+PiAgICAgICAgICAgICAgICAgICAg
cmMgPSAtRUlOVkFMOwo+Pj4+PiAgICAgICAgICAgIH0KPj4+Pj4gKyAgICAgICAgZWxzZSBpZiAo
ICh2YWwgPSBwYXJzZV9ib29sZWFuKCJtYXBicyIsIHMsIHNzKSkgPj0gMCApCj4+Pj4+ICsgICAg
ICAgIHsKPj4+Pj4gKyAgICAgICAgICAgIG1hcF9icyA9IHZhbDsKPj4+Pj4gKyAgICAgICAgfQo+
Pj4+Cj4+Pj4gVGhpcyBtYXkgX25vdF8gYmUgYWNjZXB0ZWQgd2hlbiBjYWxsZWQgdGhlICJub3Jt
YWwiIHdheSwgc2luY2UgaXQKPj4+PiB3b3VsZCB0aGVuIGZhaWwgdG8gYWZmZWN0IGVmaV9hcmNo
X3Byb2Nlc3NfbWVtb3J5X21hcCgpLCBidXQgaXQKPj4+PiB3b3VsZCBhZmZlY3QgZWZpX2luaXRf
bWVtb3J5KCkuCj4+Pgo+Pj4gV2hhdCBkbyB5b3UgbWVhbj8gSGF2ZSBJIG1pc3NlZCBzb21lIEVG
SSBib290IGNvZGUgcGF0aD8gV2hlcmUgaXQgd291bGQKPj4+IG1pc3MgdG8gYWZmZWN0IGVmaV9h
cmNoX3Byb2Nlc3NfbWVtb3J5X21hcCgpID8KPj4KPj4gSSdtIGltcGx5aW5nIHRoZSBjaGFuZ2Ug
dG8gZWZpX2FyY2hfaGFuZGxlX2NtZGxpbmUoKSBhYm92ZSB0bwo+PiBub3QgYmUgdGhlcmUuIEFu
ZCBJJ20gYWxzbyBjb25zaWRlcmluZyB0aGUgY2FzZSB3aGVyZSwgZHVlIHRvCj4+IHNvbWUgb3Zl
cnNpZ2h0IChsaWtlIGlzIHRoZSBjYXNlIGhlcmUgYXMgbWVudGlvbmVkIGluIG90aGVyCj4+IHBs
YWNlcyksIHRoZSB0d28gY29tbWFuZCBsaW5lIHByb2Nlc3Npbmcgc3RlcHMgcG90ZW50aWFsbHkK
Pj4gcHJvZHVjZSBkaWZmZXJlbnQgcmVzdWx0cyAodGhlIGV4YW1wbGUgd2l0aCB0aGUgY3VycmVu
dCBjb2RlCj4+IHdvdWxkIGJlICJlZmk9bm8tcnMgZWZpPW1hcGJzIikuCj4gCj4gWWVzLCBidWdn
eSBoYW5kbGluZyBtdWx0aXBsZSBlZmk9IG9yIG90aGVyIGNhc2VzIHlvdSBtZW50aW9uZWQgaXMg
YSBidWcKPiB0aGF0IG5lZWRzIHRvIGJlIGZpeGVkLiBCdXQgSSBkb24ndCB0aGluayBpdCBzaG91
bGQgcHJldmVudCBfdW5pZnlpbmdfCj4gRUZJIG9wdGlvbnMgaGFuZGxpbmcuIE5vdyAod2l0aG91
dCB0aGlzIHBhdGNoKSB3ZSBoYXZlIHNvbWUgRUZJIG9wdGlvbnMKPiB0aGF0IGNhbiBiZSB1dGls
aXplZCBvbmx5IGluIHNvbWUgRUZJIGJvb3QgcGF0aHMuIFRoaXMgaXMgSU1PIGJpZ2dlcgo+IGlz
c3VlLgo+IAo+IEFueXdheSwgeW91ciBjb25jZXJuIGFib3V0IG1hcF9icyBiZWluZyBzZXQgb25s
eSBsYXRlciBjYW4gYmUgc29sdmVkIGJ5Cj4gcGFyc2luZyByZWxldmFudCBlZmk9IG9wdGlvbnMg
ZWFybHkgX29ubHlfIChpbiBlZmlfZWFybHlfcGFyc2VfY21kbGluZSgpCj4gZGlyZWN0bHkpIGFu
ZCBpZ25vcmUgdGhlbSBpbiBwYXJzZV9lZmlfcGFyYW0oKS4gV2hhdCBkbyB5b3UgdGhpbms/CgpU
aGUgIm5vcm1hbCIgY21kbGluZSBwYXJzaW5nIHRpbWUgaW52b2NhdGlvbiBzaG91bGQgdGhlbiBi
ZWNvbWUgYSBuby1vcAppZiBhdCBhbGwgcG9zc2libGUsIGkuZS4gSSB3b3VsZCBzdGlsbCBhZHZv
Y2F0ZSBmb3IgdGhlcmUgYmVpbmcgZXhhY3RseQpvbmUgdGltZSB3aGVyZSAiZWZpPSIgZ2V0cyBh
Y3R1YWxseSBwYXJzZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
