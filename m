Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986EEE751F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 16:30:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP6vN-0000ZO-UK; Mon, 28 Oct 2019 15:27:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vp8f=YV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iP6vN-0000ZJ-Co
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 15:27:17 +0000
X-Inumbo-ID: 6b6a5fd0-f997-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b6a5fd0-f997-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 15:27:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 228F3AEEE;
 Mon, 28 Oct 2019 15:27:13 +0000 (UTC)
To: Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, julien.grall@arm.com,
 andrew.cooper3@citrix.com, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com,
 ian.jackson@eu.citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, konrad.wilk@oracle.com,
 Jan Beulich <jbeulich@suse.com>
References: <20190930085659.708-1-andr2000@gmail.com>
 <9df7bc3c-8019-ee76-983c-c43befc3662a@citrix.com>
 <4c84b6a3-9cb6-3fc4-8283-f52cc280c16e@citrix.com>
 <196f1dc7-f291-d728-1617-dbf46240f966@suse.com>
 <1547ccdf-b696-9054-7148-8a03773a13a8@citrix.com>
 <1922332d-e014-3e98-3c66-fd39a1106059@gmail.com>
 <1f8e0399-5b52-5c67-868b-5ff624d9b351@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a75199fb-ea49-b55a-cb3d-740cff55e1ac@suse.com>
Date: Mon, 28 Oct 2019 16:27:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1f8e0399-5b52-5c67-868b-5ff624d9b351@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] SUPPORT.md: Add PV display/sound,
 update keyboard
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMTkgMTY6MTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAyOC8x
MC8yMDE5IDA3OjI0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4KPj4gT24gOS8z
MC8xOSAyOjI2IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gOS8zMC8xOSAxMTo1MyBB
TSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+PiBPbiAzMC4wOS4xOSAxMjozMywgR2VvcmdlIER1
bmxhcCB3cm90ZToKPj4+Pj4gT24gOS8zMC8xOSAxMToyOSBBTSwgR2VvcmdlIER1bmxhcCB3cm90
ZToKPj4+Pj4+IE9uIDkvMzAvMTkgOTo1NiBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3Jv
dGU6Cj4+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRy
dXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28KPj4+Pj4+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqDCoCBTVVBQT1JULm1kIHwgMTUgKysrKysrKysrKysr
KystCj4+Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL1NVUFBPUlQubWQgYi9TVVBQT1JU
Lm1kCj4+Pj4+Pj4gaW5kZXggMzc1NDczYTQ1NjQwLi5iNTM2Y2YwODE0ZjMgMTAwNjQ0Cj4+Pj4+
Pj4gLS0tIGEvU1VQUE9SVC5tZAo+Pj4+Pj4+ICsrKyBiL1NVUFBPUlQubWQKPj4+Pj4+PiBAQCAt
MzcyLDYgKzM3MiwxMiBAQCBHdWVzdC1zaWRlIGRyaXZlciBjYXBhYmxlIG9mIHNwZWFraW5nIHRo
ZSBYZW4KPj4+Pj4+PiBQViBGcmFtZWJ1ZmZlciBwcm90b2NvbAo+Pj4+Pj4+IMKgwqAgwqDCoMKg
wqDCoCBTdGF0dXMsIExpbnV4ICh4ZW4tZmJmcm9udCk6IFN1cHBvcnRlZAo+Pj4+Pj4+IMKgwqAg
KyMjIyBQViBkaXNwbGF5IChmcm9udGVuZCkKPj4+Pj4+PiArCj4+Pj4+Pj4gK0d1ZXN0LXNpZGUg
ZHJpdmVyIGNhcGFibGUgb2Ygc3BlYWtpbmcgdGhlIFhlbiBQViBkaXNwbGF5IHByb3RvY29sCj4+
Pj4+Pj4gKwo+Pj4+Pj4+ICvCoMKgwqAgU3RhdHVzLCBMaW51eDogU3VwcG9ydGVkCj4+Pj4+PiAi
U3VwcG9ydGVkIiBoYXMgaW1wbGljYXRpb25zIGZvciB0aGUgc2VjdXJpdHkgdGVhbTogbmFtZWx5
LCBpZiBhCj4+Pj4+PiBzZWN1cml0eSBpc3N1ZSBpcyBkaXNjb3ZlcmVkLCB3ZSB3aWxsIGlzc3Vl
IGFuIFhTQS7CoCBKdWVyZ2VuLCBhcmUgeW91Cj4+Pj4+PiBzYXRpc2ZpZWQgdGhhdCB0aGUgUFYg
ZGlzcGxheSAvIHNvdW5kIGRyaXZlcnMgYXJlIG9mIHN1ZmZpY2llbnQgCj4+Pj4+PiBxdWFsaXR5
Cj4+Pj4+PiB0aGF0IHdlIGNhbiByZWNvbW1lbmQgcGVvcGxlIHVzZSB0aGVtPwo+Pj4+PiBTb3Jy
eSwgSSBtZWFudCB0byBhZGQ6ICJJbiB0aGUgZmFjZSBvZiBhbiBhY3RpdmUgYWR2ZXJzYXJ5Ii4K
Pj4+PiBZZXMsIEkgdGhpbmsgInN1cHBvcnRlZCIgaXMgZmluZS4KPj4+IEluIHRoYXQgY2FzZToK
Pj4+Cj4+PiBBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
Pgo+PiBDYW4gd2UgcGxlYXNlIGhhdmUgdGhpcyBpbj8KPiAKPiBASnVlcmdlbjogQXJlIHlvdSBo
YXBweSB0byBzZWUgUFYgZGlzcGxheS9zb3VuZCBtYXJrZWQgYXMgc3VwcG9ydGVkIGZvciAKPiBY
ZW4gNC4xMz8KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
