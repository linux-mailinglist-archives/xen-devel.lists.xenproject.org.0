Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48474132EE
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 19:12:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbgM-0001LX-Om; Fri, 03 May 2019 17:09:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMbgL-0001LS-T7
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:09:09 +0000
X-Inumbo-ID: 2a053d53-6dc6-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 2a053d53-6dc6-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:09:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12CF15A2;
 Fri,  3 May 2019 10:09:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A74AF3F557;
 Fri,  3 May 2019 10:09:07 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-16-julien.grall@arm.com>
 <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <60d4ba1e-9bbe-04af-8050-02ddda48e7a3@arm.com>
Date: Fri, 3 May 2019 18:09:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 15/20] xen/arm: mm: Use the shorter version
 __aligned(PAGE_SIZE) to align page-tables
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMy8wNS8yMDE5IDE2OjU4LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDIy
LjA0LjE5IDE5OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdlIGN1cnJlbnRseSB1c2UgdGhl
IHZlcnkgbG9uZyB2ZXJzaW9uIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZCg0MDk2KSkpCj4+IHRv
IGFsaWduIHBhZ2UtdGFibGVzLiBUaGFua2Z1bGx5IHRoZXJlIGlzIGEgc2hvcnRlciB2ZXJzaW9u
IHRvIG1ha2UKPiAKPiBJTU8gaXQgaXMgYmV0dGVyIHRvIGNoYW5nZSBgdmVyc2lvbmAgdG8gYG1h
Y3JvYC4gSW4gb3JkZXIgdG8gc3BlY2lmeSBpdCBpcyBub3QgYSAKPiBjb21waWxlciBzcGVjaWZp
YyBidXQgc3BlY2lmaWMgdG8gWEVOLgoKSSB3aWxsIHJld29yZCB0byAiVGhhbmtmdWxseSBYZW4g
cHJvdmlkZXMgYW4gaGFuZHkgbWFjcm8gdGhhdCB3aWxsIG1ha2UgdGhlIGNvZGUgCm1vcmUgcmVh
ZGFibGUiLgoKPiAKPj4gdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4KPj4KPj4gV2hpbGUgbW9kaWZ5
aW5nIHRoZSBhdHRyaWJ1dGU6Cj4+IMKgwqDCoMKgIDEpIE1vdmUgaXQgYmVmb3JlIHRoZSB2YXJp
YWJsZSBuYW1lIGFzIHdlIGRvIGluIG90aGVyIHBhcnQgb2YgWGVuCj4+IMKgwqDCoMKgIDIpIFN3
aXRjaCB0byBQQUdFX1NJWkUgaW5zdGVhZCBvZiA0MDk2IHRvIG1ha2UgbW9yZSBmdXR1cmUtcHJv
b2YKPj4gwqDCoMKgwqAgMykgTWFyayBzdGF0aWMgcGFnZS10YWJsZXMgbm90IHVzZWQgb3V0c2lk
ZSB0aGUgZmlsZSAoaS5lIGFueQo+PiDCoMKgwqDCoMKgwqDCoCBwYWdlLXRhYmxlcyBvdGhlciB0
aGFuIGJvb3RfKiBhbmQgeGVuX2ZpeG1hcCkuCj4+Cj4+IExhc3RseSwgc29tZSBvZiB0aGUgdmFy
aWFibGVzIHVzZSBfX2F0dHJpYnV0ZV9fKF9fYWxpZ25lZChYICogNDA5NikpLgo+PiBIb3dldmVy
IHRoaXMgaXMgbm90IG5lY2Vzc2FyeSBhcyBwYWdlLXRhYmxlcyBhcmUgb25seSByZXF1aXJlZCB0
byBiZQo+PiB0byBiZSBhbGlnbmVkIHRvIGEgcGFnZS1zaXplLiBTbyB1c2UgX19hbGlnbmVkKFBB
R0VfU0laRSkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gVGhvdWdoOgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRy
aWlfYW5pc292QGVwYW0uY29tPgo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
