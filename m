Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B3144998
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 02:54:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu5Bi-0004sF-At; Wed, 22 Jan 2020 01:52:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Syo=3L=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1iu5Bh-0004sA-3D
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 01:52:09 +0000
X-Inumbo-ID: ca92ca0a-3cb9-11ea-bbc8-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.190])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca92ca0a-3cb9-11ea-bbc8-12813bfff9fa;
 Wed, 22 Jan 2020 01:52:06 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 30F8E8AC09DE38C9CA05;
 Wed, 22 Jan 2020 09:52:04 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Wed, 22 Jan 2020
 09:51:56 +0800
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5E26C935.9080107@hisilicon.com>
 <9f8c3201-e40b-18bf-12e5-ed9f3f0a563a@bitdefender.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E27AABB.6010609@hisilicon.com>
Date: Wed, 22 Jan 2020 09:51:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <9f8c3201-e40b-18bf-12e5-ed9f3f0a563a@bitdefender.com>
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
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxleGFuZHJ1LAoKT24gMjAyMC8xLzIxIDE4OjAxLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlM
QSB3cm90ZToKPiAKPiAKPiBPbiAyMS4wMS4yMDIwIDExOjQ5LCBXZWkgWHUgd3JvdGU6Cj4+IEFk
ZCBfX2FjcGlfdW5tYXBfdGFibGUgZnVuY3Rpb24gZm9yIEFSTSBhbmQgaW52b2tlIGl0IGF0IGFj
cGlfb3NfdW5tYXBfbWVtb3J5Cj4+IHRvIG1ha2Ugc3VyZSB0aGUgcmVsYXRlZCBmaXhtYXAgaGFz
IGJlZW4gY2xlYXJlZCBiZWZvcmUgdXNpbmcgaXQgZm9yIGEKPj4gZGlmZmVyZW50IG1hcHBpbmcu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBYdTx4dXdlaTVAaGlzaWxpY29uLmNvbT4KPj4gLS0t
Cj4+ICAgeGVuL2FyY2gvYXJtL2FjcGkvbGliLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysr
KysrCj4+ICAgeGVuL2RyaXZlcnMvYWNwaS9vc2wuYyAgfCAgMiArKwo+PiAgIHhlbi9pbmNsdWRl
L3hlbi9hY3BpLmggIHwgIDEgKwo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FjcGkvbGliLmMgYi94ZW4vYXJjaC9h
cm0vYWNwaS9saWIuYwo+PiBpbmRleCA0ZmM2ZTE3Li42OWU4N2VjIDEwMDY0NAo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vYWNwaS9saWIuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYWNwaS9saWIuYwo+
PiBAQCAtNDksNiArNDksMzEgQEAgY2hhciAqX19hY3BpX21hcF90YWJsZShwYWRkcl90IHBoeXMs
IHVuc2lnbmVkIGxvbmcgc2l6ZSkKPj4gICAgICAgcmV0dXJuICgoY2hhciAqKSBiYXNlICsgb2Zm
c2V0KTsKPj4gICB9Cj4+ICAgCj4+ICt2b2lkIF9fYWNwaV91bm1hcF90YWJsZSh2b2lkIF9faW9t
ZW0gKiB2aXJ0LCB1bnNpZ25lZCBsb25nIHNpemUpCj4gCj4gWW91IGhhdmUgYSBzdHJheSBzcGFj
ZSBoZXJlIGFmdGVyICIqIgoKU29ycnksIEkgd2lsbCByZW1vdmUgaXQuCgo+IAo+PiArewo+PiAr
ICAgIHVuc2lnbmVkIGxvbmcgYmFzZSwgZW5kOwo+PiArICAgIGludCBpZHg7Cj4+ICsKPj4gKyAg
ICBiYXNlID0gRklYTUFQX0FERFIoRklYTUFQX0FDUElfQkVHSU4pOwo+PiArICAgIGVuZCA9IEZJ
WE1BUF9BRERSKEZJWE1BUF9BQ1BJX0VORCk7Cj4gCj4gTWF5YmUgdGhlIGluaXRpYWxpemF0aW9u
IGNhbiBiZSBtb3ZlZCB0byB0aGUgZGVjbGFyYXRpb24/CgpPSy4KSSB3aWxsIG1vdmUgaXQuCgpU
aGFua3MhCgpCZXN0IFJlZ2FyZHMsCldlaQoKPiAKPiAKPiBBbGV4Cj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
