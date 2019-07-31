Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724EB7CCBA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 21:27:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsuBk-0006iB-7K; Wed, 31 Jul 2019 19:23:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsuBj-0006i4-Cg
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 19:23:03 +0000
X-Inumbo-ID: 9c4275c6-b3c8-11e9-9061-93c00561030e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9c4275c6-b3c8-11e9-9061-93c00561030e;
 Wed, 31 Jul 2019 19:23:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91B00169E;
 Wed, 31 Jul 2019 12:23:00 -0700 (PDT)
Received: from [10.37.9.90] (unknown [10.37.9.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DACA73F71F;
 Wed, 31 Jul 2019 12:22:57 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
 <5b954e12-0a2e-6cbf-4ead-ad7f84092e4f@arm.com>
Message-ID: <9316e710-607d-6bff-0d09-b8b5a4c78355@arm.com>
Date: Wed, 31 Jul 2019 20:22:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5b954e12-0a2e-6cbf-4ead-ad7f84092e4f@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Raspberry Pi 4 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzMxLzE5IDE6MDUgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBPbiAyOS8wNy8y
MDE5IDE0OjE5LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4+IFRoaXMgaXMgYSBzZXJpZXMg
dG8gZW5hYmxlIFVBUlQgY29uc29sZSBmb3IgUmFzcGJlcnJ5IFBpIDQuIE5vdGUgdGhhdCAKPj4g
SSdtIHJlbHlpbmcgb24gdGhlIGZpcm13YXJlIHRvIGluaXRpYWxpemUgdGhlIFVBUlQgKGkuZS4g
ZW5hYmxlX3VhcnQ9MSAKPj4gaW4gY29uZmlnLnR4dCksIHNpbmNlIGZ1bGwgVUFSVCBpbml0aWFs
aXphdGlvbiBvbiB0aGlzIHBsYXRmb3JtIAo+PiByZXF1aXJlcyBhY2Nlc3Npbmcgc29tZSByZWdp
c3RlcnMgb3V0c2lkZSB0aGUgcmFuZ2Ugc3BlY2lmaWVkIGluIHRoZSAKPj4gYnJjbSxiY20yODM1
LWF1eC11YXJ0IG5vZGUuCj4+Cj4+IEkgaGF2ZSBiZWVuIGFibGUgdG8gZ2V0IFhlbitkb20wK2Rv
bVVzIGJvb3RpbmcuIFRlc3RlZCB3aXRoIFhlbiA0LjEyIAo+PiBhbmQgNC4xMy11bnN0YWJsZSAo
YjRjOGEyN2Q1YikgYW5kIExpbnV4IDQuMTkueSAoUmFzcGJlcnJ5IFBpIGxpbnV4IAo+PiB0cmVl
ICsgYSBjb3VwbGUgb2YgcGF0Y2hlcykuIFBsZWFzZSBzZWUgWzFdIGZvciBidWlsZCBpbnN0cnVj
dGlvbnMgYW5kIAo+PiBsaW1pdGF0aW9ucy4KPj4KPj4gTmV3IGluIHYyOgo+PiAqIERyb3AgZWFy
bHkgcHJpbnRrIGFsaWFzCj4+ICogU2V0IHJlZy1zaGlmdCBhbmQgcmVnLWlvLXdpZHRoIGluIHRo
ZSBYZW4gZHJpdmVyCj4+ICogQmxhY2tsaXN0IG90aGVyIGF1eCBwZXJpcGhlcmFscyBpbiBwbGF0
Zm9ybSBzZXR0aW5ncyAoc3BpMSwgc3BpMiwgCj4+IGFuZCBhIGNvdXBsZSBvZiBiYXNlIGF1eCBy
ZWdpc3RlcnMpCj4+Cj4+IFRoYW5rcywKPj4gU3Rld2FydCBIaWxkZWJyYW5kCj4+IERvcm5lcldv
cmtzLCBMdGQKPj4KPj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9kb3JuZXJ3b3Jrcy94ZW4tcnBp
NC1idWlsZGVyCj4+Cj4+IFN0ZXdhcnQgSGlsZGVicmFuZCAoMik6Cj4+IMKgwqAgbnMxNjU1MDog
QWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciBSYXNwYmVycnkgUGkgNAo+IAo+IEkgaGF2ZSBjb21t
aXR0ZWQgdGhpcyBwYXRjaC4uLgo+IAo+PiDCoMKgIHhlbi9hcm06IHBsYXRmb3JtOiBBZGQgUmFz
cGJlcnJ5IFBpIHBsYXRmb3JtCj4gLi4uIHRoaXMgb25lIG5lZWQgYW4gYW5zd2VyIHJlZ2FyZGlu
ZyB0aGUgaW1wYWN0IG9uIGJsYWNrbGlzdCBzcGkxIGFuZCAKPiBzcGkyLgoKVGhpcyBwYXRjaCBp
cyBub3cgbWVyZ2VkIGFzIHdlbGwuIFRoYW5rIHlvdSBmb3IgYWRkaW5nIHN1cHBvcnQgZm9yIHRo
ZSBSUEk0IQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
