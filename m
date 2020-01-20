Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C642B14224C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 05:08:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itOJe-0008Nk-Ia; Mon, 20 Jan 2020 04:05:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=epd5=3J=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1itOJd-0008Nf-42
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 04:05:29 +0000
X-Inumbo-ID: 10f7e376-3b3a-11ea-9fd7-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.191])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10f7e376-3b3a-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 04:05:18 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AE89AC00D4C99429A262;
 Mon, 20 Jan 2020 12:05:15 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Mon, 20 Jan 2020
 12:05:05 +0800
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
 <5E071910.2070002@hisilicon.com>
 <alpine.DEB.2.21.2001061359580.732@sstabellini-ThinkPad-T480s>
 <5E1443CD.3060908@hisilicon.com>
 <5e39e799-a716-ee84-2061-a295335607e8@xen.org> <5E1453F5.50704@hisilicon.com>
 <94aa0896-b6cf-01b4-7bde-2a4870fa37ff@xen.org>
 <5E147FA8.1000401@hisilicon.com>
 <79e63299-ce00-b417-5002-aff6d4f6bb2e@xen.org>
 <5E21792C.9020602@hisilicon.com>
 <2469482d-c8b1-6505-b143-511da015c426@xen.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E2526F1.3070903@hisilicon.com>
Date: Mon, 20 Jan 2020 12:05:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <2469482d-c8b1-6505-b143-511da015c426@xen.org>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] Interaction between ACPI and
 dt_unreserved_regions() (WAS: Re: [PATCH] xen/arm: vgic-v3: Fix the typo of
 GICD IRQ active status range)
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

CgpPbiAyMDIwLzEvMTggNDo0MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IChSZW5hbWluZyB0aGUg
dGl0bGUgdG8gYXZvaWQgY29uZnVzaW9uKQo+Cj4gT24gMTcvMDEvMjAyMCAwOTowNiwgV2VpIFh1
IHdyb3RlOgo+PiBIaSBKdWxpZW4sCj4KPiBIaSBXZWksCj4KPj4gT24gMjAyMC8xLzcgMjM6MTIs
IEp1bGllbiBHcmFsbCB3cm90ZToKPj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IQo+Cj4gRG9u
J3Qgd29ycnksIHRoYW5rIHlvdSBmb3IgbG9va2luZyBpbnRvIHRoZSBidWchCj4KPj4gVGhlIFBD
IHJlZmVycyB0byBmZHRfbnVtX21lbV9yc3YgZHVyaW5nIGluaXRfZG9uZS4KPj4gQnV0IHRoZSBk
ZXZpY2VfdHJlZV9mbGF0dGVuZWQgaXMgTlVMTCB0aGF0IHRoZSBkYXRhIGFib3J0IGhhcHBlbmVk
Lgo+Cj4gQWgsIEkgZGlkbid0IHJlYWxpemUgdGhhdCBkZXZpY2VfdHJlZV9mbGF0dGVuZWQgd2hl
cmUgc3RpbGwgdXNlZCAKPiBhZnRlcndhcmRzLiBTb3JyeSBmb3IgdGhlIGJyZWFrYWdlLiBJIHJl
YWxseSBuZWVkIHRvIHNldHVwIGEgZGV2Ym94IAo+IHdpdGggQUNQSSBzbyBJIGNhbiB0ZXN0IGNo
YW5nZXMgcHJvcGVybHkuCj4KPj4gU28gSSBhZGRlZCBiZWxvdyBjaGFuZ2VzIGFuZCB0aGUgWEVO
IGRvbTAgY2FuIGJlIGJvb3RlZC4KPj4KPj4gICAgICBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+PiAgICAgIGluZGV4IDFlODMzNTEuLjFh
YjgwYTEgMTAwNjQ0Cj4+ICAgICAgLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPj4gICAgICAr
KysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+PiAgICAgIEBAIC0zOTIsNyArMzkyLDggQEAgdm9p
ZCBfX2luaXQgZGlzY2FyZF9pbml0aWFsX21vZHVsZXModm9pZCkKPj4gICAgICAgICAgICAgICAg
ICAgICFtZm5fdmFsaWQobWFkZHJfdG9fbWZuKGUpKSApCj4+ICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOwo+Pgo+PiAgICAgIC0gICAgICAgIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhzLCBlLCBp
bml0X2RvbWhlYXBfcGFnZXMsIDApOwo+PiAgICAgICsgICAgICAgaWYoIGFjcGlfZGlzYWJsZWQg
KQo+PiAgICAgICsgICAgICAgICAgIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhzLCBlLCBpbml0X2Rv
bWhlYXBfcGFnZXMsIDApOwo+Cj4gV2hpbGUgSSB1bmRlcnN0YW5kIGhvdyB0aGlzIGlzIGZpeGlu
ZyB5b3VyIHByb2JsZW0sIHRoaXMgdW5mb3J0dW5hdGVseSAKPiBtZWFucyB0aGUgbWVtb3J5IHJh
bmdlcyB1c2VkIGJ5IHRoZSBpbml0YWwgbW9kdWxlcyAoZS5nIEtlcm5lbCwgCj4gSW5pdHJkKSB3
aWxsIG5vdCBiZSByZS11c2VkIGJ5IFhlbi4gU28gdGhpcyBpcyBhICJzbGlnaHQiIHdhc3RlIG9m
IAo+IG1lbW9yeS4KPgo+IFRoZXJlIGFyZSBhIGZldyBvdGhlciBwbGFjZXMgd2hlcmUgZHRfdW5y
ZXNlcnZlZF9yZWdpb25zKCkgaXMgY2FsbGVkIAo+IChzZWUgc2V0dXBfbW0oKSkuIEhvd2V2ZXIs
IGluIHRoZSBjYXNlIG9mIHNldHVwX21tKCkgd2UgaGF2ZSBhIHBvaW50ZXIgCj4gdG8gRFQgYXMg
d2UgZG9uJ3Qga25vdyB5ZXQgd2UgYXJlIHJ1bm5pbmcgb24gQUNQSSBzeXN0ZW1zLgo+Cj4gQnV0
IGl0IGZlZWxzIHdyb25nIHRvIHRyeSB0byBmaW5kIG91dCB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJh
bmdlIAo+IHRocm91Z2ggdGhlIERUIHdoZW4gQUNQSSB3aWxsIGJlIHVzZWQuIFRoZSBEVCBpcyBl
aXRoZXIgZ29pbmcgdG8gYmUgCj4gbmVhcmx5IGVtcHR5LCBvciBjb250YWluIHRoZSBmdWxsIGRl
c2NyaXB0aW9uIG9mIHRoZSBwbGF0Zm9ybS4gSSBkb24ndCAKPiBrbm93IGVub3VnaCB0byBiZSBh
YmxlIHRvIHNheSBpZiBzb21ldGhpbmcgaXMgZ29pbmcgdG8gZ28gd3JvbmcuCj4KPiBJIGFtIHRo
aW5raW5nIHRvIHN1Z2dlc3QgdG8gY3JlYXRlIGFuIGhlbHBlciB0aGF0IHdpbGwgZG8gdGhlIGpv
YiBmb3IgCj4geW91LiBTb21ldGhpbmcgbGlrZToKPgo+IHZvaWQgZnd0YWJsZV91bnJlc2VydmVk
X3JlZ2lvbnMocGFkZHJfdCBzLCBwYWRkcl90IGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2b2lkICgqY2IpKHBhZGRyX3QsIHBhZGRyX3QpLCBpbnQgZmlyc3QpCj4gewo+ICAg
IGlmICggYWNwaV9kaXNhYmxlZCApCj4gICAgICBkdF91bnJlc2VydmVkX3JlZ2lvbnMocywgZSwg
Y2IsIGZpcnN0KTsKPiAgICBlbHNlCj4gICAgICBjYihzLCBlKTsKPiB9Cj4KPiBSZWdhcmRpbmcg
dGhlIGVsc2UgcGFydCwgdGhpcyBtYXkgbmVlZCBzb21lIGFkanVzdG1lbnQgaWYgd2UgbmVlZCB0
byAKPiBza2lwIHNvbWUgcmVzZXJ2ZWQgcmVnaW9uIGZvciBBQ1BJLiBPbiBYZW4gNC4xMywgd2Ug
c2hvdWxkIG9ubHkgaGF2ZSAKPiB1c3VhYmxlIFJBTSBpbiBoYW5kICh0aGUgRUZJIHN0dWIgaXMg
ZG9pbmcgdG8gc29ydGluZyBmb3IgdXMpLiBEbyB5b3UgCj4ga25vdyB3aGV0aGVyIEFDUEkgZGVz
Y3JpYmVzIHNvbWV0aGluZyBzaW1pbGFyIHRvIHJlc2VydmVkLW1lbW9yeSBpbiBEVCAKPiAoaS5l
IFJBTSByZWdpb25zIHJlc2VydmVkIGZvciBjbWEuLi4pPwo+CgpIaSBKdWxpZW4sCgpJIHRoaW5r
IFVFRkkgZGVzY3JpYmVzIGl0IHZpYSBBUk1fTUVNT1JZX1JFR0lPTl9ERVNDUklQVE9SWzFdCmFu
ZCBYRU4gcGFyc2VzIGl0IGF0IGVmaV9pbml0X21lbW9yeSBidXQgSSBkaWQgbm90IGZpbmQgd2hl
cmUgdG8gcmVzZXJ2ZSAKdGhlIG1lbW9yeS4KCjE6IApodHRwczovL2dpdGh1Yi5jb20vdGlhbm9j
b3JlL2VkazItcGxhdGZvcm1zL2Jsb2IvbWFzdGVyL1BsYXRmb3JtL0FSTS9KdW5vUGtnL0xpYnJh
cnkvQXJtSnVub0xpYi9Bcm1KdW5vTWVtLmMKClRoYW5rcyEKCkJlc3QgUmVnYXJkcywKV2VpCgo+
IENoZWVycywKPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
