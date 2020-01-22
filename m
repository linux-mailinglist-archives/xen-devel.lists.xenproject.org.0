Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61892144E31
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 10:07:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBwS-00039x-HS; Wed, 22 Jan 2020 09:04:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Syo=3L=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1iuBwQ-00039n-KX
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 09:04:50 +0000
X-Inumbo-ID: 37622c70-3cf6-11ea-9fd7-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.191])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37622c70-3cf6-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 09:04:39 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B9E4F5BB3B25735B87FE;
 Wed, 22 Jan 2020 17:04:36 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 22 Jan 2020
 17:04:30 +0800
To: Jan Beulich <jbeulich@suse.com>
References: <5E26C935.9080107@hisilicon.com>
 <c15dab3d-3c25-4d14-506a-a6859a5dd99b@suse.com>
 <5E27E466.50109@hisilicon.com>
 <e5082f00-ad1a-ab2b-bc1f-b58714d08a02@suse.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E28101C.2030405@hisilicon.com>
Date: Wed, 22 Jan 2020 17:04:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <e5082f00-ad1a-ab2b-bc1f-b58714d08a02@suse.com>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH] arm/acpi: Add __acpi_unmap_table function
 for ARM
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
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjAyMC8xLzIyIDE2OjI0LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMi4w
MS4yMDIwIDA2OjU3LCBXZWkgWHUgd3JvdGU6Cj4+IE9uIDIwMjAvMS8yMSAxOTowMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyMS4wMS4yMDIwIDEwOjQ5LCBXZWkgWHUgd3JvdGU6Cj4+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvYWNwaS9vc2wuYwo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL2FjcGkv
b3NsLmMKPj4+PiBAQCAtMTE0LDYgKzExNCw4IEBAIHZvaWQgYWNwaV9vc191bm1hcF9tZW1vcnko
dm9pZCBfX2lvbWVtICogdmlydCwgYWNwaV9zaXplIHNpemUpCj4+Pj4gICAJCXJldHVybjsKPj4+
PiAgIAl9Cj4+Pj4gICAKPj4+PiArCV9fYWNwaV91bm1hcF90YWJsZSh2aXJ0LCBzaXplKTsKPj4+
PiArCj4+Pj4gICAJaWYgKHN5c3RlbV9zdGF0ZSA+PSBTWVNfU1RBVEVfYm9vdCkKPj4+PiAgIAkJ
dnVubWFwKCh2b2lkICopKCh1bnNpZ25lZCBsb25nKXZpcnQgJiBQQUdFX01BU0spKTsKPj4+Cj4+
PiBIb3cgY2FuIGl0IHBvc3NpYmx5IGJlIGNvcnJlY3QgdG8gY2FsbCBib3RoIHZ1bm1hcCgpIGFu
ZCB5b3VyIG5ldwo+Pj4gZnVuY3Rpb24/IEFuZCBob3cgaXMgdGhpcywgaGF2aW5nIGpzdXQgYW4g
QXJtIGltcGxlbWVudGF0aW9uLAo+Pj4gZ29pbmcgdG8gY29tcGlsZSBmb3IgeDg2PyBTZWVpbmcg
dGhhdCB4ODYgZ2V0cyBhd2F5IHdpdGhvdXQgdGhpcywKPj4+IG1heSBJIHN1Z2dlc3QgdGhhdCB5
b3UgbG9vayBhdCB0aGUgeDg2IGNvZGUgdG8gc2VlIHdoeSB0aGF0IGlzLAo+Pj4gYW5kIHRoZW4g
Y29uc2lkZXIgd2hldGhlciB0aGUgc2FtZSBtb2RlbCBtYWtlcyBzZW5zZSBmb3IgQXJtPyBBbmQK
Pj4+IGlmIGl0IGRvZXNuJ3QsIGNoZWNrIHdoZXRoZXIgdGhlIG5ldyBBcm0gbW9kZWwgd291bGQg
bWFrZSBzZW5zZQo+Pj4gdG8gYWxzbyB1c2Ugb24geDg2Pwo+Pj4KPj4KPj4gU29ycnksIEkgdGhv
dWdodCBhY3BpX29zX3VubWFwX21lbW9yeSBpcyBzcGVjaWZpYyBmb3IgQVJNLgo+PiBKdXN0IG5v
dyBJIGNoZWNrZWQgbWFwX3BhZ2VzX3RvX3hlbiBpbiBhcmNoL3g4Ni9tbS5jIGFuZCBkaWQgbm90
IGZpbmQgYW55IHBsYWNlCj4+IHRvIGZvcmJpZCB0aGUgbW9kaWZpY2F0aW9uIG9mIGEgbWFwcGlu
Zy4gTWF5YmUgY2xlYXJpbmcgbWFwcGluZyBiZWZvcmUgbW9kaWZpY2F0aW9uCj4+IGlzIG5vdCBu
ZWNlc3NhcnkgZm9yIFg4Ni4gRG8geW91IHRoaW5rIGlzIGl0IE9LIHRvIGFkZCBhIGVtcHR5IHN0
dWIgZnVuY3Rpb24KPj4gZm9yIHRoZSBvdGhlciBjYXNlcyBleGNlcHQgQVJNIGFuZCBpbnZva2Ug
aXQgYWZ0ZXIgdnVubWFwIGFzIGZvbGxvd2luZz8KPiAKPiBOby4gVGhpcyBpcyBzdGlsbCBkb2lu
ZyB0d28gdW5tYXBzIHdoZW4gc3lzdGVtX3N0YXRlID49IFNZU19TVEFURV9ib290Lgo+IEF0IHRo
ZSB2ZXJ5IGxlYXN0IHRoaXMgbmVlZCB0byBnbyBpbiBhbiAiZWxzZSIgYmxvY2sgdG8gdGhlIGV4
aXN0aW5nCj4gaWYoKS4gVGhlcmUgYWxzbyBzaG91bGRuJ3QgYmUgYSBibGFua2V0IGVtcHR5IHN0
dWIgZnVuY3Rpb24uIEV2ZW4gb24KPiB4ODYgaXQgd291bGQgYmUgX2JldHRlcl8gKGFsYmVpdCBu
b3Qgc3RyaWN0bHkgbmVlZGVkKSBpZiB0aGUgdW5tYXAKPiBpbmRlZWQgemFwcGVkIHRoZSBmaXht
YXAgbWFwcGluZ3MuIEFuZCBmb3IgcG90ZW50aWFsIGZ1dHVyZSBwb3J0cyBpdAo+IHdvdWxkIGJl
IG91dHJpZ2h0IGRhbmdlcm91cyB0byBoYXZlIHN1Y2ggYW4gZW1wdHkgc3R1Yi4KCkdvdCBpdC4K
SSB3aWxsIGNoZWNrIGhvdyB0byBjbGVhciB0aGUgZml4bWFwIG9uIFg4Ni4KVGhhbmtzIQoKQmVz
dCBSZWdhcmRzLApXZWkKCj4gCj4gSmFuCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
