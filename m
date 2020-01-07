Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF013244C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 11:58:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iomXP-00067T-8a; Tue, 07 Jan 2020 10:56:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HT65=24=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1iomXN-00067O-JX
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 10:56:37 +0000
X-Inumbo-ID: 5e886bae-313c-11ea-abc9-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.190])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e886bae-313c-11ea-abc9-12813bfff9fa;
 Tue, 07 Jan 2020 10:56:35 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 04A64F1EBAA735872813;
 Tue,  7 Jan 2020 18:56:33 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Tue, 7 Jan 2020
 18:56:22 +0800
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
 <5E071910.2070002@hisilicon.com>
 <alpine.DEB.2.21.2001061359580.732@sstabellini-ThinkPad-T480s>
 <5E1443CD.3060908@hisilicon.com>
 <5e39e799-a716-ee84-2061-a295335607e8@xen.org>
 <5E144F54.8000702@hisilicon.com>
 <3c34a558-43dc-c6e4-0db2-aa7393e53440@xen.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E1463D6.50108@hisilicon.com>
Date: Tue, 7 Jan 2020 18:56:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <3c34a558-43dc-c6e4-0db2-aa7393e53440@xen.org>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH] xen/arm: vgic-v3: Fix the typo of GICD IRQ
 active status range
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, prime.zeng@hisilicon.com,
 shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKT24gMjAyMC8xLzcgMTg6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPgo+Cj4g
T24gMDcvMDEvMjAyMCAwOToyOCwgV2VpIFh1IHdyb3RlOgo+PiBIaSBKdWxpZW4sCj4+Cj4+IE9u
IDIwMjAvMS83IDE3OjEwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDA3LzAx
LzIwMjAgMDg6MzksIFdlaSBYdSB3cm90ZToKPj4+PiBIaSBTdGVmYW5vLAo+Pj4+Cj4+Pj4gT24g
MjAyMC8xLzcgNjowMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+PiBPbiBTYXQsIDI4
IERlYyAyMDE5LCBXZWkgWHUgd3JvdGU6Cj4+Pj4+PiBIaSBKdWxpZW4sCj4+Pj4+Pgo+Pj4+Pj4g
T24gMjAxOS8xMi8yOCAxNjowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+IEhpLAo+Pj4+
Pj4+Cj4+Pj4+Pj4gT24gMjgvMTIvMjAxOSAwMzowOCwgV2VpIFh1IHdyb3RlOgo+Pj4+Pj4+PiBU
aGlzIHBhdGNoIGZpeGVzIHRoZSB0eXBvIGFib3V0IHRoZSBhY3RpdmUgc3RhdHVzIHJhbmdlIG9m
IGFuIElSUQo+Pj4+Pj4+PiB2aWEgR0lDRC4gT3RoZXJ3aXNlIGl0IHdpbGwgYmUgZmFpbGVkIHRv
IGhhbmRsZSB0aGUgbW1pbyBhY2Nlc3MgCj4+Pj4+Pj4+IGFuZAo+Pj4+Pj4+PiBpbmplY3QgYSBk
YXRhIGFib3J0Lgo+Pj4+Pj4+IEkgaGF2ZSBzZWVuIGEgcGF0Y2ggc2ltaWxhciBmcm9tIE5YUCBh
IG1vbnRoIGFnbyBhbmQgSSBkaXNhZ3JlZWQgCj4+Pj4+Pj4gb24gdGhlCj4+Pj4+Pj4gYXBwcm9h
Y2guCj4+Pj4+Pj4KPj4+Pj4+PiBJZiB5b3UgbG9vayBhdCB0aGUgY29udGV4dCB5b3UgbW9kaWZl
ZCwgaXQgc2F5cyB0aGF0IHJlYWRpbmcgCj4+Pj4+Pj4gQUNUSVZFUiBpcyBub3QKPj4+Pj4+PiBz
dXBwb3J0ZWQuIFdoaWxlIEkgYWdyZWUgdGhlIGJlaGF2aW9yIGlzIG5vdCBjb25zaXN0ZW50IGFj
Y3Jvc3MgCj4+Pj4+Pj4gQUNUSVZFUiwKPj4+Pj4+PiBpbmplY3RpbmcgYSBkYXRhIGFib3J0IGlz
IGEgcGVyZmVjdGx5IGZpbmUgYmVoYXZpb3IgdG8gbWUgCj4+Pj4+Pj4gKHRob3VnaCBub3Qgc3Bl
Ywo+Pj4+Pj4+IGNvbXBsaWFudCkgYXMgd2UgZG9uJ3QgaW1wbGVtZW50IHRoZSByZWdpc3RlcnMg
Y29ycmVjdGx5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBndWVzcyB5b3UgYXJlIHNlbmRpbmcgdGhpcyBw
YXRjaCwgYmVjYXVzZSB5b3UgdHJpZWQgTGludXggNS40IAo+Pj4+Pj4+IChvciBsYXRlcikKPj4+
Pj4+PiBvbiBYZW4sIHJpZ2h0PyBMaW51eCBoYXMgcmVjZW50bHkgYmVnYW4gdG8gcmVhZCBBQ1RJ
VkVSIHRvIGNoZWNrIAo+Pj4+Pj4+IHdoZXRoZXIgYW4KPj4+Pj4+PiBJUlEgaXMgYWN0aXZlIGF0
IHRoZSBIVyBsZXZlbCBkdXJpbmcgdGhlIHN5bmNocm9uaXppbmcgb2YgdGhlIAo+Pj4+Pj4+IElS
UVMuIEZyb20gbXkKPj4+Pj4+PiB1bmRlcnN0YW5kaW5nLCB0aGlzIGlzIHVzZWQgYmVjYXVzZSB0
aGVyZSBpcyBhIHdpbmRvdyB3aGVyZSB0aGUgCj4+Pj4+Pj4gaW50ZXJydXB0IGlzCj4+Pj4+Pj4g
YWN0aXZlIGF0IHRoZSBIVyBsZXZlbCBidXQgdGhlIExpbnV4IElSUSBzdWJzeXN0ZW0gaXMgbm90
IGF3YXJlIAo+Pj4+Pj4+IG9mIGl0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2hpbGUgdGhlIHBhdGNoIGJl
bG93IHdpbGwgYWxsb3cgTGludXggNS40IHRvIG5vdCBjcmFzaCwgaXQgaXMgCj4+Pj4+Pj4gbm90
IGdvaW5nIHRvCj4+Pj4+Pj4gbWFrZSBpdCBmbHkgdmVyeSBmYXIgYmVjYXVzZSBvZiB0aGUgYWJv
dmUuIFNvIEkgYW0gcmF0aGVyIG5vdCAKPj4+Pj4+PiBoYXBweSB3aXRoCj4+Pj4+Pj4gcGVyc3Vp
bmcgd2l0aCByZXR1cm5pbmcgMC4KPj4+Pj4+Pgo+Pj4+Pj4gWWVzLCBJIGFtIHVzaW5nIExpbnV4
IDUuNS1yYzIgOikKPj4+Pj4+IEdvdCBpdCBhbmQgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24u
Cj4+Pj4+PiBJIGFtIG5vdCBpbnNpc3RlbnQgb24gdGhpcyBhbmQgT0sgdG8gd2FpdCBmb3IgdGhl
IHVwZGF0ZS4KPj4+Pj4+IFRoYW5rcyBhbmQgaGF2ZSBhIHZlcnkgaGFwcHkgbmV3IHllYXIhCj4+
Pj4+IEhpIFdlaSwKPj4+Pj4KPj4+Pj4gd2hhdCBkbyB5b3UgZG8gdG8gcmVwcm9kdWNlIHRoZSBp
c3N1ZT8gQXJlIHlvdSBqdXN0IGJvb3RpbmcgTGludXgKPj4+Pj4gNS41LXJjMiBhcyBkb20wIGFu
ZCBzZWVpbmcgdGhlIGlzc3VlIGR1cmluZyBib290LCBvciBhcmUgeW91IGRvaW5nCj4+Pj4+IHNv
bWV0aGluZyBzcGVjaWZpYz8KPj4+Pj4KPj4+Pj4gLgo+Pj4+Pgo+Pj4+Cj4+Pj4gSSBkaXJlY3Rs
eSB0ZXN0ZWQgdGhlIG1haW5saW5lIGtlcm5lbCB3aXRoIGRlZmNvbmZpZy4KPj4+PiBBbmQgdGhl
IDUuNS1yYzUga2VybmVsIGJvb3RpbmcgbG9nIGlzIGFzIGJlbG93Ogo+Pj4+Cj4+Pj4gICAgICBy
b290QHVidW50dTp+IyBkbWVzZyB8IG1vcmUKPj4+PiAgICAgIFsgICAgMC4wMDAwMDBdIEJvb3Rp
bmcgTGludXggb24gcGh5c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCAKPj4+PiBbMHg0ODFmZDAxMF0K
Pj4+PiAgICAgIFsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS41LjAtcmM1IChqb3l4QFR1
cmluZy1BcmNoLWIpIAo+Pj4+IChnY2MgdmVyc2lvbiA0LjkuMSAyCj4+Pj4gICAgICAwMTQwNTA1
IChwcmVyZWxlYXNlKSAoY3Jvc3N0b29sLU5HIGxpbmFyby0xLjEzLjEtNC45LTIwMTQuMDUgLSAK
Pj4+PiBMaW5hcm8gR0NDIDQuOS0yMAo+Pj4+ICAgICAgMTQuMDUpKSAjMTMyIFNNUCBQUkVFTVBU
IFR1ZSBKYW4gNyAxNTo0MzowNiBDU1QgMjAyMAo+Pj4+ICAgICAgWyAgICAwLjAwMDAwMF0gWGVu
IFhFTl9WRVJTSU9OLlhFTl9TVUJWRVJTSU9OIHN1cHBvcnQgZm91bmQKPj4+PiAgICAgIFsgICAg
MC4wMDAwMDBdIGVmaTogR2V0dGluZyBFRkkgcGFyYW1ldGVycyBmcm9tIEZEVDoKPj4+PiAgICAg
IFsgICAgMC4wMDAwMDBdIGVmaTogRUZJIHYyLjUwIGJ5IFhlbgo+Pj4+ICAgICAgWyAgICAwLjAw
MDAwMF0gZWZpOiAgQUNQSSAyLjA9MHgxODFkMGU3MAo+Pj4+ICAgICAgWyAgICAwLjAwMDAwMF0g
Y21hOiBSZXNlcnZlZCAzMiBNaUIgYXQgMHgwMDAwMDAwMDdlMDAwMDAwCj4+Pj4gICAgICBbICAg
IDAuMDAwMDAwXSBBQ1BJOiBFYXJseSB0YWJsZSBjaGVja3N1bSB2ZXJpZmljYXRpb24gZGlzYWJs
ZWQKPj4+PiAgICAgIFsgICAgMC4wMDAwMDBdIEFDUEk6IFJTRFAgMHgwMDAwMDAwMDE4MUQwRTcw
IDAwMDAyNCAodjAyIEhJU0kgICkKPj4+PiAgICAgIFsgICAgMC4wMDAwMDBdIEFDUEk6IFhTRFQg
MHgwMDAwMDAwMDE4MUQwREIwIDAwMDBCQyAodjAxIEhJU0kgCj4+Pj4gSElQMDggICAgMDAwMDAw
MAo+Pj4+ICAgICAgMCAgICAgIDAxMDAwMDEzKQo+Pj4KPj4+IElzIHRoYXQgdGhlIGZ1bGwgbG9n
IGZyb20gTGludXg/IElmIG5vdCwgY2FuIHlvdSBwb3N0IGl0IGluIGZ1bGw/Cj4+Cj4+IEkgd2ls
bCByZXBseSB0aGUgb3RoZXIgcXVlc3Rpb25zIGluIGFub3RoZXIgbWFpbCBzaW5jZSB0aGUgYmVs
b3cgbG9nIAo+PiBpcyB0b28gYmlnLgo+Cj4gTWF5YmUgSSBhbSBtaXNzaW5nIHNvbWV0aGluZywg
YnV0IExpbnV4IHNlZW1zIHRvIGJlIHJ1bm5pbmcgZmluZSBhbmQgSSAKPiBjYW4ndCBzcG90IGFu
eSBlcnJvciByZWxhdGVkIHRvIHJlYWQgdGhlIGFjdGl2ZSBzdGF0dXMgcmVnaXN0ZXIuIEJ5IAo+
IGFueSBjaGFuY2UsIGRpZCB5b3UgYnVpbGQgWGVuIHdpdGggeW91ciBwYXRjaD8KPgoKWWVzLCBJ
IGJ1aWx0IFhlbiB3aXRoIG15IHBhdGNoLgoKQmVzdCBSZWdhcmRzLApXZWkKCj4gQ2hlZXJzLAo+
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
