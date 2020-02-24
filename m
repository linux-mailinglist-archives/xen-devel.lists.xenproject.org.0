Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA316A49D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 12:10:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Ba5-00077E-8K; Mon, 24 Feb 2020 11:07:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZQR9=4M=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j6Ba3-000778-RK
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 11:07:19 +0000
X-Inumbo-ID: d0ec5b72-56f5-11ea-bc8e-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.191])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0ec5b72-56f5-11ea-bc8e-bc764e2007e4;
 Mon, 24 Feb 2020 11:07:18 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id ED88BAD407C1A4A17667;
 Mon, 24 Feb 2020 19:07:13 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Mon, 24 Feb 2020
 19:07:04 +0800
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <5E532442.1040401@hisilicon.com>
 <96315706-b884-aa1c-8160-b6c2f338c1be@xen.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E53AE58.3050109@hisilicon.com>
Date: Mon, 24 Feb 2020 19:07:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <96315706-b884-aa1c-8160-b6c2f338c1be@xen.org>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH v5] ns16550: Add ACPI support for ARM only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKT24gMjAyMC8yLzI0IDE4OjA5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkg
V2VpLAo+IAo+IE9uIDI0LzAyLzIwMjAgMDE6MTcsIFdlaSBYdSB3cm90ZToKPj4gUGFyc2UgdGhl
IEFDUEkgU1BDUiB0YWJsZSBhbmQgaW5pdGlhbGl6ZSB0aGUgMTY1NTAgY29tcGF0aWJsZSBzZXJp
YWwgcG9ydAo+PiBmb3IgQVJNIG9ubHkuIEN1cnJlbnRseSB3ZSBvbmx5IHN1cHBvcnQgb25lIFVB
UlQgb24gQVJNLiBTb21lIGZpZWxkcwo+PiB3aGljaCB3ZSBkbyBub3QgY2FyZSB5ZXQgb24gQVJN
IGFyZSBpZ25vcmVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgWHUgPHh1d2VpNUBoaXNpbGlj
b24uY29tPgo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IAo+IEkgZG9uJ3QgdGhpbmsgSmFuIGdhdmUgYW4gZXhwbGljaXQgcmV2aWV3ZWQtYnkgZm9yIHRo
aXMgcGF0Y2guIEhvd2V2ZXIuLi4KClNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2QgaXQuCgo+IAo+PiBB
Y2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPj4KPj4gLS0tCj4+IENoYW5n
ZXMgaW4gdjU6Cj4+IC0gY2hlY2sgdGhlIHNlcmlhbCBwb3J0IGFkZHJlc3Mgc3BhY2UgYmVmb3Jl
IGNoZWNraW5nIHRoZSBhZGRyZXNzCj4gCj4gLi4uIHZlcnNpb24gNCBvZiB0aGlzIHBhdGNoIGhh
cyBhbHJlYWR5IGJlZW4gbWVyZ2VkLiBTbyBjYW4geW91IHNlbmQgYSBmb2xsb3ctdXAgdG8gcmUt
b3JkZXIgdGhlIGNoZWNrPwoKSSB3aWxsIHNlbmQgYSBmb2xsb3ctdXAgdG8gcmUtb3JkZXIgaXQu
ClRoYW5rcyEKCkJlc3QgUmVnYXJkcywKV2VpCgo+IAo+IEJlc3QgcmVnYXJkcywKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
