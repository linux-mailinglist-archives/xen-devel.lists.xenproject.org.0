Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7524E2056
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:16:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJGG-00042k-02; Wed, 23 Oct 2019 16:13:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNJGE-00042a-BL
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:13:22 +0000
X-Inumbo-ID: 08090882-f5b0-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08090882-f5b0-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 16:13:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81267B722;
 Wed, 23 Oct 2019 16:13:20 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.b80738fa53144bc6e5e32c048ccf4e4b95355844.1570918263.git-series.marmarek@invisiblethingslab.com>
 <aedda92afd26caac474870d44504074d3b2ff6d0.1570918263.git-series.marmarek@invisiblethingslab.com>
 <24d8f989-92e6-d6a0-7c77-f02ae6a4ef54@suse.com>
 <20191023160705.GJ1410@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e7f7c95-252b-697a-0585-4aad63671949@suse.com>
Date: Wed, 23 Oct 2019 18:13:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023160705.GJ1410@mail-itl>
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

T24gMjMuMTAuMjAxOSAxODowNywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IE9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDA1OjM3OjMzUE0gKzAyMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBPbiAxMy4xMC4yMDE5IDAwOjExLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
IHdyb3RlOgo+Pj4gQEAgLTEwOTQsNiArMTEwMCwyNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWZp
X2V4aXRfYm9vdChFRklfSEFORExFIEltYWdlSGFuZGxlLCBFRklfU1lTVEVNX1RBQkxFICpTeXN0
ZQo+Pj4gICAgICBpZiAoIEVGSV9FUlJPUihzdGF0dXMpICkKPj4+ICAgICAgICAgIFByaW50RXJy
TWVzZyhMIkNhbm5vdCBleGl0IGJvb3Qgc2VydmljZXMiLCBzdGF0dXMpOwo+Pj4gIAo+Pj4gKyNp
ZmRlZiBDT05GSUdfU0VUX1ZJUlRVQUxfQUREUkVTU19NQVAKPj4+ICsgICAgZm9yICggaSA9IDA7
IGkgPCBlZmlfbWVtbWFwX3NpemU7IGkgKz0gZWZpX21kZXNjX3NpemUgKQo+Pj4gKyAgICB7Cj4+
PiArICAgICAgICBFRklfTUVNT1JZX0RFU0NSSVBUT1IgKmRlc2MgPSBlZmlfbWVtbWFwICsgaTsK
Pj4+ICsKPj4+ICsgICAgICAgIGlmICggZGVzYy0+QXR0cmlidXRlICYgRUZJX01FTU9SWV9SVU5U
SU1FICkKPj4+ICsgICAgICAgICAgICBkZXNjLT5WaXJ0dWFsU3RhcnQgPSBkZXNjLT5QaHlzaWNh
bFN0YXJ0Owo+Pj4gKyAgICAgICAgZWxzZQo+Pj4gKyAgICAgICAgICAgIGRlc2MtPlZpcnR1YWxT
dGFydCA9IElOVkFMSURfVklSVFVBTF9BRERSRVNTOwo+Pj4gKyAgICB9Cj4+PiArICAgIHN0YXR1
cyA9IGVmaV9ycy0+U2V0VmlydHVhbEFkZHJlc3NNYXAoZWZpX21lbW1hcF9zaXplLCBlZmlfbWRl
c2Nfc2l6ZSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
ZGVzY192ZXIsIGVmaV9tZW1tYXApOwo+Pj4gKyAgICBpZiAoIHN0YXR1cyAhPSBFRklfU1VDQ0VT
UyApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJFRkk6IFNldFZp
cnR1YWxBZGRyZXNzTWFwKCkgZmFpbGVkICglI2x4KSwgZGlzYWJsaW5nIHJ1bnRpbWUgc2Vydmlj
ZXNcbiIsCj4+PiArICAgICAgICAgICAgICAgc3RhdHVzKTsKPj4+ICsgICAgICAgIF9fY2xlYXJf
Yml0KEVGSV9SUywgJmVmaV9mbGFncyk7Cj4+PiArICAgIH0KPj4+ICsjZW5kaWYKPj4KPj4gVGhp
cyBuZXcgcGxhY2VtZW50IHVuZGVybWluZXMgKG9yIGF0IGxlYXN0IGNvbXBsaWNhdGVzIGFmYWlj
dCkgdGhlCj4+IG9yaWdpbmFsIGludGVudGlvbiB0byBhbGxvdyBwaWNraW5nIHZpcnR1YWwgYWRk
cmVzc2VzIHdoaWNoIGRvbid0Cj4+IG1hdGNoIHRoZSBkaXJlY3RtYXAuCj4gCj4gSWYgSSByZWFk
IGl0IHJpZ2h0LCB0aGUgb3JpZ2luYWwgaW50ZW50aW9uIHdhcyB0byBzcGVjaWZpY2FsbHkgdXNl
Cj4gZGlyZWN0bWFwLCBub3Qgc29tZSBvdGhlciB2aXJ0dWFsIGFkZHJlc3Nlcy4gV2hpY2ggaXMg
Zmxhd2VkLCBiZWNhdXNlCj4gZGlyZWN0bWFwIGlzIG1hcHBlZCB3aXRoIE5YLCBzbyBhdCBsZWFz
dCBFZmlSdW50aW1lU2VydmljZXNDb2RlIHdpbGwKPiBicmVhay4gVGhpcyBtZWFucywgZXZlbiB3
aGVuIHVzaW5nIGRpcmVjdG1hcCwgWGVuIHdvdWxkIG5lZWQgdG8gc3dpdGNoCj4gcGFnZSB0YWJs
ZXMgZm9yIHRoZSBydW50aW1lIGNhbGwgdGltZSB0byBhbGxvdyBleGVjdXRpbmcgdGhhdCBjb2Rl
LgoKSnVzdCBGWUk6IFRoZSBOWC1pZnlpbmcgcG9zdC1kYXRlcyB0aGUgRUZJIHdvcmsgYnkgc2V2
ZXJhbCB5ZWFycy4KCj4gVGhlcmUgaXMgb2YgY291cnNlIGFuIG9wdGlvbiB0byByZXdyaXRlIGl0
IGNvbXBsZXRlbHkgZGlmZmVyZW50bHksCj4gbWFwcGluZyBFRkkgcnVudGltZSByZWdpb25zIHNv
bWV3aGVyZSBlbHNlIChub3QgMToxIGFuZCBub3QgcmUtdXNlCj4gZGlyZWN0bWFwKS4gQnV0IEkg
ZG9uJ3QgdGhpbmsgaXQgd29ydGggdGhlIGVmZm9ydCwgYW5kIGFsc28gaXMgZGVmaW5pdGVseQo+
IHRvbyBjb21wbGV4IHRoaXMgZmFyIGluIDQuMTMgcmVsZWFzZSBjeWNsZS4KCkVzcGVjaWFsbHkg
b24gdGhpcyBsYXN0IHBvaW50IC0gZnVsbHkgYWdyZWUuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
