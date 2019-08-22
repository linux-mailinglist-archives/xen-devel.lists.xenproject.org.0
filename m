Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DE79913D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 12:46:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0kYw-0001uL-VU; Thu, 22 Aug 2019 10:43:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r9la=WS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0kYv-0001u2-1f
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 10:43:25 +0000
X-Inumbo-ID: a9c82d64-c4c9-11e9-951b-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a9c82d64-c4c9-11e9-951b-bc764e2007e4;
 Thu, 22 Aug 2019 10:43:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 512B615AD;
 Thu, 22 Aug 2019 03:43:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E6DB3F246;
 Thu, 22 Aug 2019 03:43:20 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
 <680c5b24-b3fd-97b6-c048-49a2bdba4a3d@arm.com>
 <BEEC1E7D-4A4D-406E-97C3-D5433BAE8CAF@amazon.com>
 <5526b464-24a6-6aca-a9f3-095492abecdd@arm.com>
 <485AB113-81CD-4700-8A29-F2939F125EA6@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <24f7f2f0-13f3-58e1-0891-921b5048d939@arm.com>
Date: Thu, 22 Aug 2019 11:43:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <485AB113-81CD-4700-8A29-F2939F125EA6@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMi8wOC8yMDE5IDExOjIwLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4+
IE9uIDIyLiBBdWcgMjAxOSwgYXQgMTI6MDcsIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20gCj4+IDxtYWlsdG86anVsaWVuLmdyYWxsQGFybS5jb20+PiB3cm90ZToKPj4gT24gMjIv
MDgvMjAxOSAwODo0NCwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3RlOgo+Pj4+PiBkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oIGIveGVuL2luY2x1ZGUveGVuL2xpdmVw
YXRjaC5oCj4+Pj4+IGluZGV4IDJhZWM1MzJlZTIuLmE5MzEyNmY2MzEgMTAwNjQ0Cj4+Pj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2guaAo+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94
ZW4vbGl2ZXBhdGNoLmgKPj4+Pj4gQEAgLTExNyw3ICsxMTcsNyBAQCBpbnQgYXJjaF9saXZlcGF0
Y2hfcXVpZXNjZSh2b2lkKTsKPj4+Pj4gwqB2b2lkIGFyY2hfbGl2ZXBhdGNoX3Jldml2ZSh2b2lk
KTsKPj4+Pj4gwqDCoMKgdm9pZCBhcmNoX2xpdmVwYXRjaF9hcHBseShzdHJ1Y3QgbGl2ZXBhdGNo
X2Z1bmMgKmZ1bmMpOwo+Pj4+PiAtdm9pZCBhcmNoX2xpdmVwYXRjaF9yZXZlcnQoY29uc3Qgc3Ry
dWN0IGxpdmVwYXRjaF9mdW5jICpmdW5jKTsKPj4+Pj4gK3ZvaWQgYXJjaF9saXZlcGF0Y2hfcmV2
ZXJ0KHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVuYyk7Cj4+Pj4KPj4+PiBJIGRvdWJ0IGxpdmVw
YXRjaCBvbiBBcm0gd2lsbCBjb21waWxlIGFmdGVyIHRoaXMgY2hhbmdlLgo+Pj4+Cj4+PiBXaGF0
IHdvdWxkIGJlIHlvdSBzdWdnZXN0aW9uIHRoZW4/Cj4+Cj4+IENyb3NzLWNvbXBpbGVyIGFyZSBu
b3dhZGF5cyB3aWRlbHkgYXZhaWxhYmxlLiBTbyBidWlsZCB0ZXN0aW5nIHlvdXIgY2hhbmdlcyBp
biAKPj4gY29tbW9uIGNvZGUgd291bGQgYmUgdGhlIG1pbmltdW0uCj4+Cj4gCj4gSSB3aXNoIGl0
IHdhcyB0aGF0IHNpbXBsZS4gTmV2ZXJ0aGVsZXNzLCBJIHdpbGwgdHJ5IHRvIHByZXBhcmUgYW4g
ZW52aXJvbm1lbnQgdG8gCj4gcGVyZm9ybSBzdWNoIGJ1aWxkcy4KCkNyb3NzLWNvbXBpbGluZyB0
aGUgaHlwZXJ2aXNvciBpcyByZWFsbHkgZWFzeSA7KS4KCjEpIERvd25sb2FkIHRoZSBjcm9zcy1j
b21waWxlciB0YXJiYWxsIChoZXJlIG9uZSBbMV0pIGFuZCB1bmNvbXByZXNzIGl0LiBZb3UgY2Fu
IAphbHNvIGluc3RhbGwgdGhlIG9uZSBwcm92aWRlZCBieSB5b3VyIGRpc3Ryby4KCjIpIEJ1aWxk
IFhlbiBoeXBlcnZpc29yLiBIZXJlIGFuIGV4YW1wbGUgZm9yIGFybTY0OgoKNDJzaD4gY2QgeGVu
LmdpdC94ZW4KNDJzaD4gbWFrZSBYRU5fVEFSR0VUX0FSQ0g9YXJtNjQgQ1JPU1NfQ09NUElMRVI9
PHRyaXBsZXQ+LQoKSW4gbXkgY2FzZSwgSSBhbSB1c2luZyB0aGUgQXJtIHRvb2xjaGFpbiBBQXJj
aDY0IEdOVS9MaW51eCB0YXJnZXQgCihhYXJjaDY0LWxpbnV4LWdudSkuIFNvIHRoZSA8dHJpcGxl
dD4gd291bGQgYmUgYWFyY2g2NC1saW51eC1nbnUuCgpUaGlzIGlzIGFzc3VtaW5nIHlvdSBoYXZl
IHRoZSBjb21waWxlcnMgYmluYXJ5IGluIHlvdXIgUEFUSC4gSWYgbm90LCB5b3UgY2FuIHVzZSAK
Z2l2ZSB0aGUgZnVsbCBwYXRoOgoKQ1JPU1NfQ09NUElMRVI9L29wdC9nY2MtYXJtLTguMy0yMDE5
LjAzLXg4Nl82NC1hYXJjaDY0LWxpbnV4LWdudS9iaW4vYWFyY2g2NC1saW51eC1nbnUtCgo+IAo+
PiBJbiB0aGlzIGNhc2UsIGFzIHlvdSBkcm9wcGVkIHRoZSBjb25zdCBmcm9tIHRoZSBwcm90b3R5
cGUsIHlvdSB3aWxsIG5lZWQgdG8gZG8gCj4+IHRoZSBzYW1lIGluIHRoZSBkZWNsYXJhdGlvbi4K
Pj4KPiAKPiBZZXMsIGJ1dCBJIHNlZSAyIG9wdGlvbnMgaGVyZToKPiAtIEVuYWJsZSB0aGUgZmVh
dHVyZSBhbHNvIGZvciBBcm0gKEkgcHJlZmVyIHRoYXQsIGJ1dCB3aWxsIG5vdCBiZSBhYmxlIHRv
IHRlc3QgCj4gdGhhdCBpbiBuZWFyZXN0IGZ1dHVyZSkKCkkgdGhpbmsgc29tZSBvZiB0aGUgY29k
ZSBjYW4gYmUgbWFkZSBjb21tb24uIFNvIHdlIGNvdWxkIHBvc3NpYmx5IHJlbHkgb24geDg2IApm
b3IgdGhhdC4gQWRkaXRpb25hbGx5LCBJSVJDLCBLb25yYWQgaGFzIGEgc2V0dXAgb24gdGhlIGN1
YmlldHJ1Y2sgZm9yIHRlc3RpbmcgCmxpdmVwYXRjaC4KCj4gLSBLZWVwIEFybSBleGNsdWRlZCBh
bmQgc3ByaW5rbGUgY29kZSB3aXRoICNpZmRlZiBDT05GSUdfWDg2CgpQbGVhc2Ugbm8gI2lmZGVm
IENPTkZJR19YODYgaW4gdGhlIGNvbW1vbiBjb2RlLiBJZiB5b3UgZG9uJ3QgcGxhbiB0byBzdXBw
b3J0IApBcm0sIHRoZW4gd2Ugc2hvdWxkIGludHJvZHVjZSBhIG5ldyBLY29uZmlnIHRoYXQgd2ls
bCBnYXRlIGFsbCB0aG9zZSBjaGFuZ2VzLgoKQ2hlZXJzLAoKWzFdIApodHRwczovL2RldmVsb3Bl
ci5hcm0uY29tL3Rvb2xzLWFuZC1zb2Z0d2FyZS9vcGVuLXNvdXJjZS1zb2Z0d2FyZS9kZXZlbG9w
ZXItdG9vbHMvZ251LXRvb2xjaGFpbi9nbnUtYS9kb3dubG9hZHMKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
