Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866DBCB5B1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 10:06:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGIY8-0004nP-3T; Fri, 04 Oct 2019 08:02:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEoo=X5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iGIY6-0004nK-FV
 for xen-devel@lists.xen.org; Fri, 04 Oct 2019 08:02:50 +0000
X-Inumbo-ID: 5b7f0cec-e67d-11e9-80e3-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5b7f0cec-e67d-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 08:02:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09C0F1597;
 Fri,  4 Oct 2019 01:02:49 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3393B3F739;
 Fri,  4 Oct 2019 01:02:48 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1910031812380.30844@sstabellini-ThinkPad-T480s>
 <20191004011457.11126-8-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a0127862-bd28-d1e3-fb2f-200d672f8934@arm.com>
Date: Fri, 4 Oct 2019 09:02:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004011457.11126-8-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 8/8] xen/arm: add dom0-less device
 assignment info to docs
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA0LzEwLzIwMTkgMDI6MTQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiArCj4gK0RvbTAtbGVzcyBEZXZpY2UgUGFzc3Rocm91Z2gKPiArPT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+ICsKPiArVGhlIHBhcnRpYWwgZGV2aWNlIHRyZWUgZm9yIGRvbTAtbGVz
cyBndWVzdHMgc2hvdWxkIGhhdmUgdGhlIGZvbGxvd2luZwo+ICtwcm9wZXJ0aWVzIGZvciBlYWNo
IG5vZGUgY29ycmVzcG9uZGluZyB0byBhIHBoeXNpY2FsIGRldmljZSB0byBhc3NpZ24gdG8KPiAr
dGhlIGd1ZXN0Ogo+ICsKPiArLSB4ZW4scmVnCj4gKwo+ICsgIFRoZSB4ZW4scmVnIHByb3BlcnR5
IGlzIGFuIGFycmF5IG9mOgo+ICsKPiArICAgIDxwaHlzX2FkZHIgc2l6ZSBndWVzdF9hZGRyPgo+
ICsKPiArICBUaGV5IHNwZWNpZnkgdGhlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhl
IGRldmljZSBtZW1vcnkKPiArICByYW5nZXMgdG9nZXRoZXIgd2l0aCB0aGUgY29ycmVzcG9uZGlu
ZyBndWVzdCBhZGRyZXNzIHRvIG1hcCB0aGVtIHRvLgo+ICsgIFRoZSBzaXplIG9mIGBwaHlzX2Fk
ZHInIGFuZCBgZ3Vlc3RfYWRkcicgaXMgZGV0ZXJtaW5lZCBieQo+ICsgICNhZGRyZXNzLWNlbGxz
LCB0aGUgc2l6ZSBvZiBgc2l6ZScgaXMgZGV0ZXJtaW5lZCBieSAjc2l6ZS1jZWxscywgb2YKPiAr
ICB0aGUgcGFydGlhbCBkZXZpY2UgdHJlZS4KPiArICBUaGUgbWVtb3J5IHdpbGwgYmUgbWFwcGVk
IGFzIGRldmljZSBtZW1vcnkgaW4gdGhlIGd1ZXN0IChEZXZpY2UtbkduUkUpLgo+ICsKPiArLSB4
ZW4scGF0aAo+ICsKPiArICBBIHN0cmluZyBwcm9wZXJ0eSByZXByZXNlbnRpbmcgdGhlIHBhdGgg
aW4gdGhlIGhvc3QgZGV2aWNlIHRyZWUgdG8gdGhlCj4gKyAgY29ycmVzcG9uZGluZyBkZXZpY2Ug
bm9kZS4KPiArCj4gKy0geGVuLGZvcmNlLWFzc2lnbi13aXRob3V0LWlvbW11CgpQbGVhc2UgYWRk
IGEgbmV3bGluZSBoZXJlIHRvIG1hdGNoIHRoZSByZXN0IG9mIHRoZSBkb2N1bWVudGF0aW9uLgoK
V2l0aCB0aGF0OgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CgpDaGVlcnMsCgo+ICsgIElmIHhlbixmb3JjZS1hc3NpZ24td2l0aG91dC1pb21tdSBpcyBwcmVz
ZW50LCBYZW4gYWxsb3dzIHRvIGFzc2lnbiBhCj4gKyAgZGV2aWNlIGV2ZW4gaWYgaXQgaXMgbm90
IGJlaGluZCBhbiBJT01NVS4gVGhpcyByZW5kZXJzIHlvdXIgcGxhdGZvcm0KPiArICAqdW5zYWZl
KiBpZiB0aGUgZGV2aWNlIGlzIERNQS1jYXBhYmxlLgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
