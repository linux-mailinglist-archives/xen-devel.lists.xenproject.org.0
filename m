Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CE013B550
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 23:27:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irUbi-0001SF-EP; Tue, 14 Jan 2020 22:24:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MmA+=3D=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1irUbh-0001SA-8k
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 22:24:17 +0000
X-Inumbo-ID: 99a63b86-371c-11ea-ac27-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99a63b86-371c-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 22:24:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1CD22187F;
 Tue, 14 Jan 2020 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579040656;
 bh=DqVNYSeqbrYwUTE9ta4I3VviL13WmSQ8zYEdOXG5tN0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=PpErBQR/fGCq6ZXLmbmebI9kxj1x2d/WGNM+OHNbPjE01aR4gun+ubGxwwEhNXssn
 CO6T3run5kTA4SWCoiQPCvr6ph6dRS6ICrpBVdiWNC/1mJiXH/dKhsuIxsspNURqen
 uRP1GAcpc+6F1gkpgSlI0jWb2qfOaZDuYkXPhb1s=
Date: Tue, 14 Jan 2020 14:24:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <1567bba4-f984-acb6-0a04-8f5e13aa5ef5@xen.org>
Message-ID: <alpine.DEB.2.21.2001141423100.6687@sstabellini-ThinkPad-T480s>
References: <1578619590-3661-1-git-send-email-brian.woods@xilinx.com>
 <1578619590-3661-2-git-send-email-brian.woods@xilinx.com>
 <1567bba4-f984-acb6-0a04-8f5e13aa5ef5@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC 1/2] arm,
 smmu: add support for iommu_fwspec functions
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
Cc: Brian Woods <brian.woods@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBKYW4gMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEJyaWFuLAo+IAo+
IE9uIDEwLzAxLzIwMjAgMDE6MjYsIEJyaWFuIFdvb2RzIHdyb3RlOgo+ID4gTW9kaWZ5IHRoZSBz
bW11IGRyaXZlciBzbyB0aGF0IGl0IHVzZXMgdGhlIGlvbW11X2Z3c3BlYyBoZWxwZXIKPiA+IGZ1
bmN0aW9ucy4gIFRoaXMgbWVhbnMgYm90aCBBUk0gSU9NTVUgZHJpdmVycyB3aWxsIGJvdGggdXNl
IHRoZQo+ID4gaW9tbXVfZndzcGVjIGhlbHBlciBmdW5jdGlvbnMsIG1ha2luZyBlbmFibGluZyBn
ZW5lcmljIGRldmljZSB0cmVlCj4gPiBiaW5kaW5ncyBpbiB0aGUgU01NVSBkcml2ZXIgbXVjaCBj
bGVhbmVyLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNA
eGlsaW54LmNvbT4KPiA+IC0tLQo+ID4gUkZDIGVzcGVjaWFsbHkgd2FudGVkIG9uOgo+ID4gICAg
LSBDaGVjayBpbiBkZXZpY2VfdHJlZS5jLiAgVGhpcyBpcyBuZWVkZWQsIG90aGVyd2lzZSBpdCB3
b24ndCBib290IGR1ZQo+ID4gICAgICB0byBkZXZfaW9tbXVfZndzcGVjX2dldChkZXYpIGJlaW5n
IHRydWUgYW5kIHJldHVybmluZyBFRVhJU1QuICBJJ20KPiA+ICAgICAgbm90IGNvbXBsZXRlbHkg
c3VyZSB3aGF0IHR5cGUgb2YgY2hlY2sgaXMgYmVzdCBoZXJlLgo+IAo+IEkgZ3Vlc3MgdGhpcyBi
ZWNhdXNlIHRoZSBtYXN0ZXJzIGFyZSByZWdpc3RlcmVkIGR1cmluZyB0aGUgaW5pdGlhbGl6YXRp
b24gb2YKPiB0aGUgU01NVS4gQ291bGQgd2UgaW5zdGVhZCBsb29rIGF0IHJlZ2lzdGVyaW5nIHRo
ZW0gZnJvbSB0aGUgYWRkX2RldmljZQo+IGNhbGxiYWNrPwo+IAo+IEkgdW5kZXJzdGFuZCB0aGlz
IHdvdWxkIG1lYW4gdG8gZ28gdGhyb3VnaCBhbGwgdGhlIFNNTVUgYW5kIHJlcXVpcmUgYSBiaXQg
bW9yZQo+IHdvcmsuIEJ1dCBJIHRoaW5rIGl0IHdpbGwgaGVscCBsb25nZXIgdGVybSBhcyB0aGUg
d29ya2Zsb3cgZm9yIHJlZ2lzdGVyaW5nIGEKPiBtYXN0ZXIgd291bGQgYmUgc2ltaWxhciB3aGV0
aGVyIGxlZ2FjeSBvciBnZW5lcmljIGJpbmRpbmdzIGFyZSB1c2VkLgo+IAo+IEBTdGVmYW5vIGFu
eSBvcGluaW9ucz8KClllYWgsIGFkZF9kZXZpY2UgbG9va3MgbGlrZSBhIGJldHRlciBmaXQgZm9y
IHRoZSBuZXcgYmluZGluZ3MuCgoKPiA+ICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3Nt
bXUuYyAgICB8IDc0Cj4gPiArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ID4g
ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jIHwgIDMgKysgPiAgIDIgZmls
ZXMgY2hhbmdlZCwgNDkKPiA+IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwo+ID4gYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCj4gPiBpbmRleCA5NDY2MmE4Li5jNWRi
NWJlIDEwMDY0NAo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwo+
ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwo+ID4gQEAgLTQ5LDYg
KzQ5LDcgQEAKPiA+ICAgI2luY2x1ZGUgPGFzbS9hdG9taWMuaD4KPiA+ICAgI2luY2x1ZGUgPGFz
bS9kZXZpY2UuaD4KPiA+ICAgI2luY2x1ZGUgPGFzbS9pby5oPgo+ID4gKyNpbmNsdWRlIDxhc20v
aW9tbXVfZndzcGVjLmg+Cj4gPiAgICNpbmNsdWRlIDxhc20vcGxhdGZvcm0uaD4KPiA+ICAgICAv
KiBYZW46IFRoZSBiZWxvdyBkZWZpbmVzIGFyZSByZWRlZmluZWQgd2l0aGluIHRoZSBmaWxlLiBV
bmRlZiBpdCAqLwo+ID4gQEAgLTU5Nyw4ICs1OTgsNyBAQCBzdHJ1Y3QgYXJtX3NtbXVfc21yIHsK
PiA+ICAgfTsKPiA+ICAgICBzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyX2NmZyB7Cj4gPiAtCWludAkJ
CQludW1fc3RyZWFtaWRzOwo+ID4gLQl1MTYJCQkJc3RyZWFtaWRzW01BWF9NQVNURVJfU1RSRUFN
SURTXTsKPiAKPiBOb3cgdGhhdCB3ZSB1c2UgZndzcGVjLCBkbyB3ZSByZWFsbHkgbmVlZCB0byBr
ZWVwIHRoZSBNQVhfTUFTVEVSX1NUUkVBTUlEUwo+IGxpbWl0Pwo+IAo+ID4gKwlzdHJ1Y3QgaW9t
bXVfZndzcGVjCQkqZndzcGVjOwo+IAo+IE5JVDogQ2FuIHRoZSBjb250ZW50IGJlIGNvbnN0Pwo+
IAo+ID4gICAJc3RydWN0IGFybV9zbW11X3NtcgkJKnNtcnM7Cj4gPiAgIH07Cj4gPiAgIEBAIC03
NzksNyArNzc5LDcgQEAgc3RhdGljIGludCByZWdpc3Rlcl9zbW11X21hc3RlcihzdHJ1Y3QgYXJt
X3NtbXVfZGV2aWNlCj4gPiAqc21tdSwKPiA+ICAgCQkJCXN0cnVjdCBkZXZpY2UgKmRldiwKPiA+
ICAgCQkJCXN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKm1hc3RlcnNwZWMpCj4gPiAgIHsKPiA+IC0J
aW50IGk7Cj4gPiArCWludCBpLCByZXQgPSAwOwo+ID4gICAJc3RydWN0IGFybV9zbW11X21hc3Rl
ciAqbWFzdGVyOwo+ID4gICAgIAltYXN0ZXIgPSBmaW5kX3NtbXVfbWFzdGVyKHNtbXUsIG1hc3Rl
cnNwZWMtPm5wKTsKPiA+IEBAIC03OTgsMjYgKzc5OCwzNyBAQCBzdGF0aWMgaW50IHJlZ2lzdGVy
X3NtbXVfbWFzdGVyKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UKPiA+ICpzbW11LAo+ID4gICAJfQo+
ID4gICAgIAltYXN0ZXIgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKm1hc3RlciksIEdGUF9L
RVJORUwpOwo+ID4gLQlpZiAoIW1hc3RlcikKPiA+ICsJaWYgKCFtYXN0ZXIpIHsKPiA+ICAgCQly
ZXR1cm4gLUVOT01FTTsKPiA+ICsJfQo+IAo+IE5JVDogTWF5IEkgYXNrIHdoeSBkaWQgeW91IGFk
ZCB0aGUge30gaGVyZT8KPiAKPiAKPiBDaGVlcnMsCj4gCj4gLS0gCj4gSnVsaWVuIEdyYWxsCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
