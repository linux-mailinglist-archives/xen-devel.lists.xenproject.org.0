Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B1C1519D3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:26:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iywK2-0003XM-FQ; Tue, 04 Feb 2020 11:24:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iywK0-0003XC-Ab
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:24:48 +0000
X-Inumbo-ID: f30b485e-4740-11ea-8f0f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f30b485e-4740-11ea-8f0f-12813bfff9fa;
 Tue, 04 Feb 2020 11:24:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E125AC4A;
 Tue,  4 Feb 2020 11:24:46 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200203173728.18135-1-roger.pau@citrix.com>
 <20200203173728.18135-2-roger.pau@citrix.com>
 <99dbde26-e11e-5bc5-b702-3c76a8370d91@suse.com>
 <20200204111349.GI4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e27cd9d3-ccbc-7a24-651b-4b33db071ceb@suse.com>
Date: Tue, 4 Feb 2020 12:24:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204111349.GI4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] nvmx: implement support for MSR
 bitmaps
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxMjoxMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAwNCwgMjAyMCBhdCAxMDozMjo0N0FNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDMuMDIuMjAyMCAxODozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gQEAgLTE4Miw2ICsx
OTIsMTEgQEAgdm9pZCBudm14X3ZjcHVfZGVzdHJveShzdHJ1Y3QgdmNwdSAqdikKPj4+ICAgICAg
ICAgIGZyZWVfZG9taGVhcF9wYWdlKHYtPmFyY2guaHZtLnZteC52bXdyaXRlX2JpdG1hcCk7Cj4+
PiAgICAgICAgICB2LT5hcmNoLmh2bS52bXgudm13cml0ZV9iaXRtYXAgPSBOVUxMOwo+Pj4gICAg
ICB9Cj4+PiArICAgIGlmICggbnZteC0+bXNyX21lcmdlZCApCj4+PiArICAgIHsKPj4+ICsgICAg
ICAgIGZyZWVfZG9taGVhcF9wYWdlKG52bXgtPm1zcl9tZXJnZWQpOwo+Pj4gKyAgICAgICAgbnZt
eC0+bXNyX21lcmdlZCA9IE5VTEw7Cj4+PiArICAgIH0KPj4KPj4gQ2FuIHRoaXMgbm90IGJlIGRv
bmUgLi4uCj4+Cj4+PiAgfQo+Pj4gICAKPj4+ICB2b2lkIG52bXhfZG9tYWluX3JlbGlucXVpc2hf
cmVzb3VyY2VzKHN0cnVjdCBkb21haW4gKmQpCj4+Cj4+IC4uLiBpbiB0aGlzIGZ1bmN0aW9uLCB0
aHVzIGhhcHBlbmluZyBlYXJsaWVyIHVwb24gZG9tYWluCj4+IGNsZWFudXAsIGFuZCBsZWF2aW5n
IGxlc3MgcmVzb3VyY2VzIGFsbG9jYXRlZCBpbiBjYXNlIGEgZG9tYWluCj4+IGVuZHMgdXAgYXMg
em9tYmllIChkdWUgdG8gYW5vdGhlciBidWcgZWxzZXdoZXJlKT8gQWN0dWFsbHkgLQo+PiBhcmVu
J3QgeW91IGV4dGVuZGluZyBhbiBleGlzdGluZyBidWcgdGhpcyB3YXk/IFdoZW4KPj4gbmVzdGVk
aHZtX3ZjcHVfaW5pdGlhbGlzZSgpIGZhaWxzLCBuZXN0ZWRodm1fdmNwdV9kZXN0cm95KCkKPj4g
d29uJ3QgYmUgY2FsbGVkIGFmYWljdC4KPiAKPiBuZXN0ZWRodm1fdmNwdV9kZXN0cm95IHdpbGwg
YmUgY2FsbGVkIGJ5IGh2bV92Y3B1X2luaXRpYWxpc2UgKHRoZQo+IGNhbGxlciBvZiBuZXN0ZWRo
dm1fdmNwdV9pbml0aWFsaXNlKSBBRkFJQ1QuCgpVbmxlc3MgbmVzdGVkaHZtX3ZjcHVfaW5pdGlh
bGlzZSgpIGl0c2VsZiBmYWlsczoKCiAgICBpZiAoIG5lc3RlZGh2bV9lbmFibGVkKGQpCiAgICAg
ICAgICYmIChyYyA9IG5lc3RlZGh2bV92Y3B1X2luaXRpYWxpc2UodikpIDwgMCApIC8qIHRlYXJk
b3duOiBuZXN0ZWRodm1fdmNwdV9kZXN0cm95ICovCiAgICAgICAgZ290byBmYWlsNTsKLi4uCiBm
YWlsNjoKICAgIG5lc3RlZGh2bV92Y3B1X2Rlc3Ryb3kodik7CiBmYWlsNToKICAgIGZyZWVfY29t
cGF0X2FyZ194bGF0KHYpOwoKVGhlIGNvbW1vbiBpc3N1ZSBvZiB0aGVzZSBmdW5jdGlvbnMgbm90
IGJlaW5nIGlkZW1wb3RlbnQuCgo+PiBIZW5jZSBudm14X3ZjcHVfaW5pdGlhbGlzZSgpIG5vdAo+
PiBjbGVhbmluZyB1cCBhZnRlciBpdHNlbGYgaW4gY2FzZSBvZiBmYWlsdXJlIGxvb2tzIHRvIGJl
IGEKPj4gbWVtb3J5IGxlYWsuIEFzIG9mIGIzMzQ0YmIxY2FlMCBhbnkgc3VjaCB3aWxsIGJlIHRh
a2VuIGNhcmUKPj4gb2YgaW1wbGljaXRseSBhcyBsb25nIGFzIHRoZSBmcmVlaW5nIGhhcHBlbnMg
b24gdGhlCj4+IHJlbGlucXVpc2gtcmVzb3VyY2VzIHBhdGhzLgo+IAo+IEkgY2FuIG1vdmUgdGhl
IG5ldyBhZGRpdGlvbiB0byBudm14X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcywgSSd2ZQo+
IG9yaWdpbmFsbHkgYWRkZWQgaXQgdG8gbnZteF92Y3B1X2Rlc3Ryb3kgYmVjYXVzZSB0aGF0J3Mg
d2hlcmUgb3RoZXIKPiBwYWdlcyBhcmUgYWxzbyBmcmVlZC4KClJpZ2h0LCBoZW5jZSBtZSBtZW50
aW9uaW5nIGEgcHJlLWV4aXN0aW5nIGlzc3VlIHRoYXQgeW91J3JlCndpZGVuaW5nIGEgbGl0dGxl
IHRoZSB3YXkgdGhpbmdzIGFyZSBjdXJyZW50bHkgZG9uZS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
