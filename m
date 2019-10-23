Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE8E1F8D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:40:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNIhN-00086W-DE; Wed, 23 Oct 2019 15:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNIhM-00086O-Rz
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:37:20 +0000
X-Inumbo-ID: ff3c9674-f5aa-11e9-8aca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff3c9674-f5aa-11e9-8aca-bc764e2007e4;
 Wed, 23 Oct 2019 15:37:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3FB3CBC1C;
 Wed, 23 Oct 2019 15:37:18 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.b80738fa53144bc6e5e32c048ccf4e4b95355844.1570918263.git-series.marmarek@invisiblethingslab.com>
 <aedda92afd26caac474870d44504074d3b2ff6d0.1570918263.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24d8f989-92e6-d6a0-7c77-f02ae6a4ef54@suse.com>
Date: Wed, 23 Oct 2019 17:37:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <aedda92afd26caac474870d44504074d3b2ff6d0.1570918263.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen/efi: optionally call
 SetVirtualAddressMap()
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTAuMjAxOSAwMDoxMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBTb21lIFVFRkkgaW1wbGVtZW50YXRpb25zIGFyZSBub3QgaGFwcHkgYWJvdXQgcnVubmluZyBp
biAxOjEgYWRkcmVzc2luZywKPiBidXQgcmVhbGx5IHZpcnR1YWwgYWRkcmVzcyBzcGFjZS4KCkkg
aGF2ZSB0byBhZG1pdCB0aGF0IEkgZmluZCB0aGlzIG1pc2xlYWRpbmcuIFRoZXJlJ3Mgbm8gdHJ1
ZSAicGh5c2ljYWwKbW9kZSIgb24geDg2LTY0IGFueXdheS4gV2hhdCBJIGFzc3VtZSBoYXBwZW5z
IGlzIHRoYXQgcGVvcGxlIGFidXNlIHRoZQphZGRyZXNzIG1hcCBjaGFuZ2Ugbm90aWZpY2F0aW9u
IHRvIGRvIHRoaW5ncyBiZXlvbmQgdGhlIG5lY2Vzc2FyeQpDb252ZXJ0UG9pbnRlcigoKSBjYWxs
cy4KCj4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmln
Cj4gQEAgLTg4LDYgKzg4LDE5IEBAIGNvbmZpZyBLRVhFQwo+ICAKPiAgCSAgSWYgdW5zdXJlLCBz
YXkgWS4KPiAgCj4gK2NvbmZpZyBTRVRfVklSVFVBTF9BRERSRVNTX01BUAoKSSdtIG9mIHRoZSBz
dHJvbmcgb3BpbmlvbiB0aGF0IHRoaXMgd2FudHMgdG8gaGF2ZSBhbiBFRklfIHByZWZpeC4KCj4g
KyAgICBib29sICJFRkk6IGNhbGwgU2V0VmlydHVhbEFkZHJlc3NNYXAoKSIgaWYgRVhQRVJUID0g
InkiCj4gKyAgICBkZWZhdWx0IG4KCkkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdGhpcyBsaW5lLgoK
PiBAQCAtMTA5NCw2ICsxMTAwLDI2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfZXhpdF9ib290
KEVGSV9IQU5ETEUgSW1hZ2VIYW5kbGUsIEVGSV9TWVNURU1fVEFCTEUgKlN5c3RlCj4gICAgICBp
ZiAoIEVGSV9FUlJPUihzdGF0dXMpICkKPiAgICAgICAgICBQcmludEVyck1lc2coTCJDYW5ub3Qg
ZXhpdCBib290IHNlcnZpY2VzIiwgc3RhdHVzKTsKPiAgCj4gKyNpZmRlZiBDT05GSUdfU0VUX1ZJ
UlRVQUxfQUREUkVTU19NQVAKPiArICAgIGZvciAoIGkgPSAwOyBpIDwgZWZpX21lbW1hcF9zaXpl
OyBpICs9IGVmaV9tZGVzY19zaXplICkKPiArICAgIHsKPiArICAgICAgICBFRklfTUVNT1JZX0RF
U0NSSVBUT1IgKmRlc2MgPSBlZmlfbWVtbWFwICsgaTsKPiArCj4gKyAgICAgICAgaWYgKCBkZXNj
LT5BdHRyaWJ1dGUgJiBFRklfTUVNT1JZX1JVTlRJTUUgKQo+ICsgICAgICAgICAgICBkZXNjLT5W
aXJ0dWFsU3RhcnQgPSBkZXNjLT5QaHlzaWNhbFN0YXJ0Owo+ICsgICAgICAgIGVsc2UKPiArICAg
ICAgICAgICAgZGVzYy0+VmlydHVhbFN0YXJ0ID0gSU5WQUxJRF9WSVJUVUFMX0FERFJFU1M7Cj4g
KyAgICB9Cj4gKyAgICBzdGF0dXMgPSBlZmlfcnMtPlNldFZpcnR1YWxBZGRyZXNzTWFwKGVmaV9t
ZW1tYXBfc2l6ZSwgZWZpX21kZXNjX3NpemUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG1kZXNjX3ZlciwgZWZpX21lbW1hcCk7Cj4gKyAgICBpZiAoIHN0YXR1
cyAhPSBFRklfU1VDQ0VTUyApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIg
IkVGSTogU2V0VmlydHVhbEFkZHJlc3NNYXAoKSBmYWlsZWQgKCUjbHgpLCBkaXNhYmxpbmcgcnVu
dGltZSBzZXJ2aWNlc1xuIiwKPiArICAgICAgICAgICAgICAgc3RhdHVzKTsKPiArICAgICAgICBf
X2NsZWFyX2JpdChFRklfUlMsICZlZmlfZmxhZ3MpOwo+ICsgICAgfQo+ICsjZW5kaWYKClRoaXMg
bmV3IHBsYWNlbWVudCB1bmRlcm1pbmVzIChvciBhdCBsZWFzdCBjb21wbGljYXRlcyBhZmFpY3Qp
IHRoZQpvcmlnaW5hbCBpbnRlbnRpb24gdG8gYWxsb3cgcGlja2luZyB2aXJ0dWFsIGFkZHJlc3Nl
cyB3aGljaCBkb24ndAptYXRjaCB0aGUgZGlyZWN0bWFwLiBJIGNhbiBhY2NlcHQgdGhpcyBhcyBh
biBpbnRlbmRlZCB0cmFkZW9mZiAoYXMKeW91IHZhbGlkbHkgbWVudGlvbiBpbiB0aGUgb3RoZXIg
cGF0Y2ggd2UgZG9uJ3QgaG9ub3IgdGhlIDE6MSBtYXAKcmVxdWlyZW1lbnQgYXQgdGhlIHRpbWUg
b2YgdGhlIGNhbGwgd2l0aCBpdHMgb3JpZ2luYWwgcGxhY2VtZW50KSwKYnV0IGl0IHNob3VsZCBi
ZSBtZW50aW9uZWQgaW4gb25lIG9mIHRoZSB0d28gcGF0Y2ggZGVzY3JpcHRpb25zLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
