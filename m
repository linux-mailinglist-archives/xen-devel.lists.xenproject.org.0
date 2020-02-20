Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF62165947
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:35:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4hH9-0005H3-39; Thu, 20 Feb 2020 08:33:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4hH7-0005Gy-F4
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:33:37 +0000
X-Inumbo-ID: afaac3be-53bb-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afaac3be-53bb-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 08:33:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C68B0AC8F;
 Thu, 20 Feb 2020 08:33:34 +0000 (UTC)
To: Wei Xu <xuwei5@hisilicon.com>
References: <5E38023B.8090306@hisilicon.com>
 <4824cb1a-c920-e2be-c603-185c0bfdb66e@suse.com>
 <5E4E38F0.6000403@hisilicon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d723ed36-a38d-63c3-07ea-97a2c97f6c9c@suse.com>
Date: Thu, 20 Feb 2020 09:33:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5E4E38F0.6000403@hisilicon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] ns16550: Add ACPI support for ARM only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAwODo0NCwgV2VpIFh1IHdyb3RlOgo+IE9uIDIwMjAvMi8xNyAyMTo1Mywg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAzLjAyLjIwMjAgMTI6MjEsIFdlaSBYdSB3cm90ZToK
Pj4+ICtzdGF0aWMgaW50IF9faW5pdCBuczE2NTUwX2FjcGlfdWFydF9pbml0KGNvbnN0IHZvaWQg
KmRhdGEpCj4+PiArewo+Pj4gKyAgICBzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIgKnRhYmxlOwo+
Pj4gKyAgICBzdHJ1Y3QgYWNwaV90YWJsZV9zcGNyICpzcGNyOwo+Pj4gKyAgICBhY3BpX3N0YXR1
cyBzdGF0dXM7Cj4+PiArICAgIC8qCj4+PiArICAgICAqIFNhbWUgYXMgdGhlIERUIHBhcnQuCj4+
PiArICAgICAqIE9ubHkgc3VwcG9ydCBvbmUgVUFSVCBvbiBBUk0gd2hpY2ggaGFwcGVuIHRvIGJl
IG5zMTY1NTBfY29tWzBdLgo+Pj4gKyAgICAgKi8KPj4+ICsgICAgc3RydWN0IG5zMTY1NTAgKnVh
cnQgPSAmbnMxNjU1MF9jb21bMF07Cj4+PiArCj4+PiArICAgIHN0YXR1cyA9IGFjcGlfZ2V0X3Rh
YmxlKEFDUElfU0lHX1NQQ1IsIDAsICZ0YWJsZSk7Cj4+PiArICAgIGlmICggQUNQSV9GQUlMVVJF
KHN0YXR1cykgKQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICBwcmludGsoIm5zMTY1NTA6IEZhaWxl
ZCB0byBnZXQgU1BDUiB0YWJsZVxuIik7Cj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+
ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBzcGNyID0gY29udGFpbmVyX29mKHRhYmxlLCBzdHJ1Y3Qg
YWNwaV90YWJsZV9zcGNyLCBoZWFkZXIpOwo+Pj4gKwo+Pj4gKyAgICAvKgo+Pj4gKyAgICAgKiBU
aGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBtYXkgYmUgMCBmb3IgZXhhbXBsZQo+Pj4gKyAgICAgKiBp
ZiB0aGUgY29uc29sZSByZWRpcmVjdGlvbiBpcyBkaXNhYmxlZC4KPj4+ICsgICAgICovCj4+PiAr
ICAgIGlmICggdW5saWtlbHkoIXNwY3ItPnNlcmlhbF9wb3J0LmFkZHJlc3MpICkKPj4+ICsgICAg
ewo+Pj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiB0aGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBp
cyBpbnZhbGlkXG4iKTsKPj4KPj4gSXMgemVybyByZWFsbHkgYW4gaW52YWxpZCBhZGRyZXNzLCBv
ciBpcyBpdCByYXRoZXIgYSBwcm9wZXIKPj4gaW5kaWNhdG9yIG9mIHRoZXJlIG5vdCBiZWluZyBh
bnkgZGV2aWNlPwo+IAo+IEkgd2lsbCBjaGFuZ2UgdGhlIG1zZyB0byAiVGhlIGNvbnNvbGUgcmVk
aXJlY3Rpb24gaXMgZGlzYWJsZWQuIiBmb2xsb3dpbmcgdGhlIGRlc2NyaXB0aW9uIGluIHRoZSBz
cGNyLgo+IElzIHRoYXQgT0s/CgpXaXRoIHRoZSAiVGhlIiBwcmVmZXJhYmx5IGRyb3BwZWQsIHll
cy4KCj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAg
ICBuczE2NTUwX2luaXRfY29tbW9uKHVhcnQpOwo+Pj4gKwo+Pj4gKyAgICAvKgo+Pj4gKyAgICAg
KiBUaGUgYmF1ZCByYXRlIGlzIHByZS1jb25maWd1cmVkIGJ5IHRoZSBmaXJtd2FyZS4KPj4KPj4g
QnV0IHRoaXMgaXNuJ3QgdGhlIHNhbWUgYXMgQkFVRF9BVVRPLCBpcyBpdD8gSWYgZmlybXdhcmUg
cHJlLWNvbmZpZ3VyZXMKPj4gdGhlIGJhdWQgcmF0ZSwgaXNuJ3QgaXQgdGhpcyBzdHJ1Y3R1cmUg
d2hpY2ggaXQgd291bGQgdXNlIHRvIGNvbW11bmljYXRlCj4+IHRoZSBpbmZvcm1hdGlvbj8KPj4K
PiAKPiBObywgdGhlIGNvbW1lbnRzIG9mIHRoZSBCQVVEX0FVVE8gc3RhdGVkIGxpa2UgdGhhdAo+
IGFuZCBpbiBmYWN0IHRoZSBiYXVkIHJhdGUgaXMgbm90IGNoYW5nZWQgYWZ0ZXIgdGhlIGZpcm1t
d2FyZS4KCk9oLCBJIHNlZS4gSSBzaG91bGQgaGF2ZSBjaGVja2VkIHRoZSBjb21tZW50IGluc3Rl
YWQgb2YgaW1wbHlpbmcKbWVhbmluZyBhc3NpZ25lZCB0byBzaW1pbGFybHkgbmFtZWQgdGhpbmdz
IGVsc2V3aGVyZS4gS2VlcCBhcyBpcy4KCj4+PiArICAgICAqLwo+Pj4gKyAgICB1YXJ0LT5iYXVk
ID0gQkFVRF9BVVRPOwo+Pj4gKyAgICB1YXJ0LT5kYXRhX2JpdHMgPSA4Owo+Pj4gKyAgICB1YXJ0
LT5wYXJpdHkgPSBzcGNyLT5wYXJpdHk7Cj4+PiArICAgIHVhcnQtPnN0b3BfYml0cyA9IHNwY3It
PnN0b3BfYml0czsKPj4+ICsgICAgdWFydC0+aW9fYmFzZSA9IHNwY3ItPnNlcmlhbF9wb3J0LmFk
ZHJlc3M7Cj4+PiArICAgIHVhcnQtPmlvX3NpemUgPSBzcGNyLT5zZXJpYWxfcG9ydC5iaXRfd2lk
dGg7Cj4+Cj4+IE9uY2UgYWdhaW46IFlvdSBzaG91bGQgbm90IGlnbm9yZSB0aGUgR0FTIGFkZHJl
c3Mgc3BhY2UgaW5kaWNhdG9yLgo+IAo+IFNvcnJ5LCBJIGRpZCBub3QgZ2V0IHRoZSBwb2ludC4K
PiBEbyB5b3UgbWVhbiBjaGVjayB0aGUgYWRkcmVzcyBpcyAwIG9yIG5vdD8KCk5vLiBJIG1lYW4g
eW91IHNob3VsZG4ndCBpZ25vcmUgb3RoZXIgcGFydHMgb2YgdGhlIHN0cnVjdHVyZToKCnN0cnVj
dCBhY3BpX2dlbmVyaWNfYWRkcmVzcyB7Cgl1OCBzcGFjZV9pZDsJCS8qIEFkZHJlc3Mgc3BhY2Ug
d2hlcmUgc3RydWN0IG9yIHJlZ2lzdGVyIGV4aXN0cyAqLwoJdTggYml0X3dpZHRoOwkJLyogU2l6
ZSBpbiBiaXRzIG9mIGdpdmVuIHJlZ2lzdGVyICovCgl1OCBiaXRfb2Zmc2V0OwkJLyogQml0IG9m
ZnNldCB3aXRoaW4gdGhlIHJlZ2lzdGVyICovCgl1OCBhY2Nlc3Nfd2lkdGg7CS8qIE1pbmltdW0g
QWNjZXNzIHNpemUgKEFDUEkgMy4wKSAqLwoJdTY0IGFkZHJlc3M7CQkvKiA2NC1iaXQgYWRkcmVz
cyBvZiBzdHJ1Y3Qgb3IgcmVnaXN0ZXIgKi8KfTsKCklpcmMgeW91IG5vdyBjb25zdW1lIGFsbCBm
aWVsZHMgZXhjZXB0IHNwYWNlX2lkLCB5ZXQgc3BhY2VfaWQKaXMgYSBxdWFsaWZpZXIgdG8gdGhl
IGFkZHJlc3MgZmllbGQgKHdoaWNoIHlvdSBvYnZpb3VzbHkgdXNlKS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
