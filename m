Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D147984886
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 11:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvI3f-0006hj-GC; Wed, 07 Aug 2019 09:16:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvI3e-0006he-4L
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 09:16:34 +0000
X-Inumbo-ID: 0a014260-b8f4-11e9-b637-07de7a738cec
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0a014260-b8f4-11e9-b637-07de7a738cec;
 Wed, 07 Aug 2019 09:16:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E194F28;
 Wed,  7 Aug 2019 02:16:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84F943F575;
 Wed,  7 Aug 2019 02:16:27 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-6-sstabellini@kernel.org>
 <887f853a-d715-b33e-8c76-4280cdbfbab1@arm.com>
Message-ID: <18fa3016-573c-2f87-4a35-ed27bb7cb4a0@arm.com>
Date: Wed, 7 Aug 2019 10:16:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <887f853a-d715-b33e-8c76-4280cdbfbab1@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/6] xen/arm: clarify the support status
 of iomem configurations
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, WeiLiu <wl@xen.org>,
 konrad.wilk@oracle.com, George Dunlap <george.dunlap@eu.citrix.com>,
 andrew.cooper3@citrix.com, tim@xen.org, JBeulich@suse.com,
 ian.jackson@eu.citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNy8wOC8yMDE5IDEwOjA4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4g
T24gMDcvMDgvMjAxOSAwMToyMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBpb21lbSBz
ZXR0aW5ncyBmYWxsIHVuZGVyIHRoZSBicm9hZGVyIGNhdGVnb3J5IG9mICJOb24tUENJIGRldmlj
ZQo+PiBwYXNzdGhyb3VnaCI6IHRoZXkgYXJlIG5vdCBzZWN1cml0eSBzdXBwb3J0ZWQuIE1ha2Ug
aXQgY2xlYXJlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVm
YW5vc0B4aWxpbnguY29tPgo+PiBDQzogdGltQHhlbi5vcmcKPj4gQ0M6IGtvbnJhZC53aWxrQG9y
YWNsZS5jb20KPj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IEND
OiBKQmV1bGljaEBzdXNlLmNvbQo+PiBDQzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQo+PiBD
QzogaWFuLmphY2tzb25AZXUuY2l0cml4LmNvbQo+PiBDQzogd2VpLmxpdTJAY2l0cml4LmNvbQoK
SSBqdXN0IHJlYWxpemVkIGFmdGVyIHNlbmRpbmcgdGhlIGUtbWFpbCB0aGF0IHRoZSBsaXN0IG9m
IENDIGlzIHNtYWxsZXIgdGhhbiBpdCAKc2hvdWxkIGFuZCBXZWkncyBlLW1haWwgaXMgaW5jb3Jy
ZWN0LiBPbiB0aGUgb3RoZXIgZS1tYWlscywgeW91IGZvcmdvdCB0byBDQyAKVm9sb2R5bXlyIGFz
IEFybSByZXZpZXdlci4KCkkgYW0gcHJldHR5IHN1cmUgSSBhbHJlYWR5IHBvaW50ZWQgdGhhdCBv
dXQgaW4gdGhlIHBhc3QuLi4gV2UgaGF2ZSB0b29scyBpbiAKcGxhY2UgdG8gZmluZCBvdXQgdGhl
IG1haW50YWluZXJzIHRvIENDIGFuZCBhZGQgdGhlbSAoc2VlIApzY3JpcHRzL2FkZF9tYWludGFp
bmVycy5wbCkuIFNvIHRoZXJlIGFyZSBubyBuZWVkIHRvIGRvIHRoaXMgbWFudWFsbHkgYW55bW9y
ZS4KCj4+IC0tLQo+PiDCoCBTVVBQT1JULm1kIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL1NVUFBPUlQu
bWQgYi9TVVBQT1JULm1kCj4+IGluZGV4IDM3NTQ3M2E0NTYuLmJjNmZiNThlMDQgMTAwNjQ0Cj4+
IC0tLSBhL1NVUFBPUlQubWQKPj4gKysrIGIvU1VQUE9SVC5tZAo+PiBAQCAtNjM5LDcgKzYzOSw3
IEBAIHRvIGJlIHVzZWQgaW4gYWRkaXRpb24gdG8gUUVNVS4KPj4gwqDCoMKgwqDCoCBTdGF0dXM6
IEV4cGVyaW1lbnRhbAo+PiAtIyMjIEFSTS9Ob24tUENJIGRldmljZSBwYXNzdGhyb3VnaAo+PiAr
IyMjIEFSTS9Ob24tUENJIGRldmljZSBwYXNzdGhyb3VnaCBhbmQgb3RoZXIgaW9tZW0gY29uZmln
dXJhdGlvbnMKPiAKPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIG5ldyB0aXRsZS4gV2hhdCBhcmUg
dGhlIG90aGVyIHVzZSBjYXNlIG9mIElPTUVNIAo+IGNvbmZpZ3VyYXRpb25zPwo+IAo+IENoZWVy
cywKPiAKPj4gwqDCoMKgwqDCoCBTdGF0dXM6IFN1cHBvcnRlZCwgbm90IHNlY3VyaXR5IHN1cHBv
cnRlZAo+Pgo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
