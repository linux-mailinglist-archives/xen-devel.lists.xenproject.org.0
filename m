Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A0C87739
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:27:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw23U-0000fT-8t; Fri, 09 Aug 2019 10:23:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hw23S-0000fO-US
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:23:26 +0000
X-Inumbo-ID: b1b84fc0-ba8f-11e9-9fa0-33c23fa2ab4e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b1b84fc0-ba8f-11e9-9fa0-33c23fa2ab4e;
 Fri, 09 Aug 2019 10:23:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 690251596;
 Fri,  9 Aug 2019 03:23:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B424D3F575;
 Fri,  9 Aug 2019 03:23:12 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-2-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6f326378-dfdd-8570-fa10-b32c6dc93c3c@arm.com>
Date: Fri, 9 Aug 2019 11:23:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807002311.9906-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, JBeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNy8wOC8yMDE5IDAxOjIzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gQWRk
IGEgcDJtdCBwYXJhbWV0ZXIgdG8gbWFwX21taW9fcmVnaW9ucywgcGFzcyBwMm1fbW1pb19kaXJl
Y3RfZGV2IG9uCj4gQVJNIGFuZCBwMm1fbW1pb19kaXJlY3Qgb24geDg2IC0tIG5vIGNoYW5nZXMg
aW4gYmVoYXZpb3IuCj4gCj4gT24geDg2LCBpbnRyb2R1Y2UgYSBtYWNybyB0byBzdHJpcCBhd2F5
IHRoZSBsYXN0IHBhcmFtZXRlciBhbmQgcmVuYW1lCj4gdGhlIGV4aXN0aW5nIGltcGxlbWVudGF0
aW9uIG9mIG1hcF9tbWlvX3JlZ2lvbnMgdG8gbWFwX21taW9fcmVnaW9uLgo+IFVzZSBtYXBfbW1p
b19yZWdpb24gaW4gdnBjaSBhcyBpdCBpcyB4ODYtb25seSB0b2RheS4KClRoaXMgZmVlbHMgcXVp
dGUgd3JvbmcuIFlvdSBoYXZlIGEgInBsdXJhbCIgZnVuY3Rpb24gY2FsbGluZyBhICJzaW5ndWxh
ciIgCmZ1bmN0aW9uLiBUaGlzIGlzIHVzdWFsbHkgdGhlIG90aGVyIHdheSBhcm91bmQuIFRoaXMg
aXMgYWxzbyBxdWl0ZSBkaWZmaWN1bHQgZm9yIAphIHVzZXIgdG8gdW5kZXJzdGFuZCB3aHkgdGhl
ICdzJyBpcyBiZWVuIGRyb3BwZWQvYWRkZWQgKGRlcGVuZGluZyBob3cgeW91IHZpZXcgCml0KSBi
ZWNhdXNlIGluIGJvdGggY2FzZSB5b3Ugb25seSBkZWFsIHdpdGggYSBzaW5nbGUgcmVnaW9uLgoK
VGhlIGNvbmZ1c2lvbiBpcyBhZGRlZCBiZWNhdXNlIHRoZXJlIGFyZSBubyB1bm1hcF9tbWlvX3Jl
Z2lvbiBzbyB0aGUgY29kZSBsb29rcyAKc3RyYW5nZSB0byByZWFkOgoKID4gKyAgICAgICAgcmMg
PSBtYXAtPm1hcCA/IG1hcF9tbWlvX3JlZ2lvbihtYXAtPmQsIF9nZm4ocyksIHNpemUsIF9tZm4o
cykpCiA+ICAgICAgICAgICAgICAgICAgICAgICAgIDogdW5tYXBfbW1pb19yZWdpb25zKG1hcC0+
ZCwgX2dmbihzKSwgc2l6ZSwgX21mbihzKSk7CgpBbnl3YXksIEkgcmVhbGl6ZWQgdGhhdCBKYW4g
c3VnZ2VzdGVkIGl0IGFuZCBpdCBpcyB4ODYgY29kZS4gU28gaWYgaGUgaXMgaGFwcHkgCndpdGgg
aXQgc28gaXQgYmUuCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21jdGwuYyBi
L3hlbi9jb21tb24vZG9tY3RsLmMKPiBpbmRleCBiNDhlNDA4NTgzLi4yNjc0Y2FhMDA1IDEwMDY0
NAo+IC0tLSBhL3hlbi9jb21tb24vZG9tY3RsLmMKPiArKysgYi94ZW4vY29tbW9uL2RvbWN0bC5j
Cj4gQEAgLTkxOSw2ICs5MTksNyBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BB
UkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpCj4gICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJf
bWZucyA9IG9wLT51Lm1lbW9yeV9tYXBwaW5nLm5yX21mbnM7Cj4gICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgbWZuX2VuZCA9IG1mbiArIG5yX21mbnMgLSAxOwo+ICAgICAgICAgICBpbnQgYWRkID0g
b3AtPnUubWVtb3J5X21hcHBpbmcuYWRkX21hcHBpbmc7Cj4gKyAgICAgICAgcDJtX3R5cGVfdCBw
Mm10Owo+ICAgCj4gICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gICAgICAgICAgIGlmICggbWZu
X2VuZCA8IG1mbiB8fCAvKiB3cmFwPyAqLwo+IEBAIC05MzEsNiArOTMyLDEwIEBAIGxvbmcgZG9f
ZG9tY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkKPiAg
ICAgICAgICAgLyogTXVzdCBicmVhayBoeXBlcmNhbGwgdXAgYXMgdGhpcyBjb3VsZCB0YWtlIGEg
d2hpbGUuICovCj4gICAgICAgICAgIGlmICggbnJfbWZucyA+IDY0ICkKPiAgICAgICAgICAgICAg
IGJyZWFrOwo+ICsKPiArICAgICAgICBwMm10ID0gcDJtX21taW9fZGlyZWN0X2RldjsKPiArI2Vs
c2UKPiArICAgICAgICBwMm10ID0gcDJtX21taW9fZGlyZWN0OwoKSSB0aGluayBpdCBpcyBhIHBy
ZXR0eSBiYWQgaWRlYSB0byBoYXZlIGFyY2ggc3BlY2lmaWMgY29kZSBpbiBjb21tb24gY29kZS4g
VGhpcyAKaXMgb25seSB0byBtYWtlIG1vcmUgZGlmZmljdWx0IHRvIGFkZCBuZXcgYXJjaCAoc3Vj
aCBhcyBSSVNDdikuIEluc3RlYWQgd2UgCnNob3VsZCBwcm92aWRlIGhlbHBlciBpbiBhcmNoIGNv
ZGUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
