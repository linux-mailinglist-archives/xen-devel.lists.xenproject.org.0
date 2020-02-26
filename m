Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2516F47A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 01:44:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6klN-0001Bl-S6; Wed, 26 Feb 2020 00:41:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yd+m=4O=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j6klM-0001Bf-Ux
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 00:41:20 +0000
X-Inumbo-ID: b2d41742-5830-11ea-a490-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2d41742-5830-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 00:41:19 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9130649AB56167503454;
 Wed, 26 Feb 2020 08:41:15 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 26 Feb 2020
 08:41:03 +0800
To: Jan Beulich <jbeulich@suse.com>
References: <5E53B3E3.6070304@hisilicon.com>
 <8bb7d100-0ca4-c0f9-b294-f2e7a173e1c9@xen.org> <5E546B6B.70906@hisilicon.com>
 <cdcc6ec0-4dfa-20eb-a160-c803f5f95f93@suse.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E55BE9F.1090801@hisilicon.com>
Date: Wed, 26 Feb 2020 08:41:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <cdcc6ec0-4dfa-20eb-a160-c803f5f95f93@suse.com>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH] ns16550: Re-order the serial port address
 checking
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjAyMC8yLzI1IDIxOjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNS4w
Mi4yMDIwIDAxOjMzLCBXZWkgWHUgd3JvdGU6Cj4+IE9uIDIwMjAvMi8yNSA2OjAzLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+PiBUaGFuayB5b3UgZm9yIHNlbmRpbmcgYSBmb2xsb3ctdXAuCj4+Pgo+
Pj4gT24gMjQvMDIvMjAyMCAxMTozMCwgV2VpIFh1IHdyb3RlOgo+Pj4+IENoZWNrIHRoZSBzZXJp
YWwgcG9ydCBhZGRyZXNzIHNwYWNlIGJlZm9yZSBjaGVja2luZyB0aGUgYWRkcmVzcy4KPj4+Cj4+
PiBDb3VsZCB5b3UgZXhwbGFpbiBpbiBhIHNlbnRlbmNlIHdoeSB5b3Ugd2FudCB0byByZS1vcmRl
cj8KPj4KPj4gRG8geW91IHRoaW5rIGlzIGl0IE9LIHRvIGV4cGxhaW4gYXMgZm9sbG93aW5nOgo+
Pgo+PiBUaGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBzcGFjZSBJRCBxdWFsaWZpZXMgdGhlIGFkZHJl
c3MuCj4+IFdoZXRoZXIgYSB2YWx1ZSBvZiB6ZXJvIGZvciB0aGUgc2VyaWFsIHBvcnQgYWRkcmVz
cyBjYW4gc2Vuc2libHkKPj4gbWVhbiAiZGlzYWJsZWQiIGRlcGVuZHMgb24gdGhlIGFkZHJlc3Mg
c3BhY2UgSUQuIEhlbmNlIGNoZWNrIHRoZQo+PiBhZGRyZXNzIHNwYWNlIElEIGJlZm9yZSBjaGVj
a2luZyB0aGUgYWRkcmVzcy4KPiAKPiBXaXRoIHRoaXMgZGVzY3JpcHRpb24gLi4uCj4gCj4+Pj4g
U2lnbmVkLW9mZi1ieTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29uLmNvbT4KPiAKPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhhbmtzIQoKQmVzdCBSZWdh
cmRzLApXZWkKCj4gCj4gQW5kIEknbSBzb3JyeSBmb3IgaGF2aW5nIGZvcmdvdHRlbiB0byBzd2l0
Y2ggdGhlc2UgYXJvdW5kCj4gd2hpbGUgY29tbWl0dGluZyB5b3VyIGVhcmxpZXIgcGF0Y2guCj4g
Cj4gSmFuCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
