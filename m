Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E391773D3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 11:18:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j94ao-0000eO-HY; Tue, 03 Mar 2020 10:16:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j94an-0000eJ-Qt
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 10:16:01 +0000
X-Inumbo-ID: fb49281c-5d37-11ea-82f6-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb49281c-5d37-11ea-82f6-bc764e2007e4;
 Tue, 03 Mar 2020 10:16:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32F46AE35;
 Tue,  3 Mar 2020 10:16:00 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200226131806.32444-1-aisaila@bitdefender.com>
 <e94a2335-cd08-339f-4fb0-9d1cb72b78d3@suse.com>
 <4d92a595-28d6-cf73-3d84-80ffcf970331@bitdefender.com>
 <71a5d12c-e886-4b6e-c954-d4a300bf0aab@suse.com>
 <537b518b-1ca3-304b-8634-d7bf44c3ed89@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68f3e19a-4071-5759-8324-d857ec8c041b@suse.com>
Date: Tue, 3 Mar 2020 11:15:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <537b518b-1ca3-304b-8634-d7bf44c3ed89@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxMDo1OSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMDMuMDMuMjAyMCAxMTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAzLjAzLjIw
MjAgMTA6NDMsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAw
My4wMy4yMDIwIDExOjMwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNi4wMi4yMDIwIDE0
OjE4LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4+Pj4gQEAgLTQ4NDAsNiArNDg0
MSwxOSBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPj4+Pj4gICAgICAgICAgICBicmVhazsK
Pj4+Pj4gICAgICAgIH0KPj4+Pj4gICAgCj4+Pj4+ICsgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0
X3Zpc2liaWxpdHk6Cj4+Pj4+ICsgICAgewo+Pj4+PiArICAgICAgICB1aW50MTZfdCBpZHggPSBh
LnUuc2V0X3Zpc2liaWxpdHkuYWx0cDJtX2lkeDsKPj4+Pgo+Pj4+IFdoeSBhIGZpeGVkIHdpZHRo
IHR5cGUgKGFuZCBldmVuIG9uZSBpbmVmZmljaWVudCB0byBkZWFsIHdpdGgpPwo+Pj4+IChPbmUg
bWlnaHQgZXZlbiBhc2sgLSB3aHkgYSBsb2NhbCB2YXJpYWJsZSBpbiB0aGUgZmlyc3QgcGxhY2Us
Cj4+Pj4gd2hlbiBpdCdzIHVzZWQgLi4uCj4+Pj4KPj4+Pj4gKyAgICAgICAgaWYgKCBhLnUuc2V0
X3Zpc2liaWxpdHkucGFkICkKPj4+Pj4gKyAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPj4+Pj4g
KyAgICAgICAgZWxzZSBpZiAoICFhbHRwMm1fYWN0aXZlKGQpICkKPj4+Pj4gKyAgICAgICAgICAg
IHJjID0gLUVPUE5PVFNVUFA7Cj4+Pj4+ICsgICAgICAgIGVsc2UKPj4+Pj4gKyAgICAgICAgICAg
IHJjID0gcDJtX3NldF9hbHRwMm1fdmlld192aXNpYmlsaXR5KGQsIGlkeCwKPj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGEudS5zZXRfdmlzaWJp
bGl0eS52aXNpYmxlKTsKPj4+Pgo+Pj4+IC4uLiBqdXN0IG9uY2UgaGVyZS4pIFRoZSBmdW5jdGlv
biB0YWtlcyAidW5zaWduZWQgaW50IiBpbiBhbnkKPj4+PiBldmVudC4KPj4+Cj4+PiBTdXJlLCBJ
IGNhbiBoYXZlIHRoaXMgaWR4IGRyb3BwZWQgYW5kIHVzZSB0aGUgdmFsdWUgaW4gdGhlIHN0cnVj
dHVyZS4KPj4+IEkgaGFkIHRoYXQgaW4gcGxhY2UgdG8gaGF2ZSBsaW5lIHNpemUgc21hbGxlciBh
bmQgdGhlIGNvZGUgZWFzeSB0byByZWFkLgo+Pgo+PiBEcm9wcGluZyB0aGUgdmFyaWFibGUgaXMg
c2Vjb25kYXJ5IC0gaWYgeW91IHByZWZlciB5b3Uga2VlcCBpdCwgc28KPj4gYmUgaXQuIEJ1dCBp
ZiB5b3Uga2VlcCBpdCwgaXRzIHR5cGUgc2hvdWxkIGJ5IGluIGxpbmUgd2l0aAo+PiAuL0NPRElO
R19TVFlMRS4KPj4KPiAKPiBBaCB5ZXMsIHlvdSBhcmUgcmlnaHQsIEkgd2lsbCBjaGFuZ2UgdGhl
IHR5cGUgdG8gdW5zaWduZWQgaW50Lgo+IAo+IAo+IE9uIHRoZSByYyBwb2ludCB5b3UgbWVudGlv
bmVkLCBJIHRoaW5rIGl0IHdpbGwgYmUgYmV0dGVyIHRvIGhhdmUgYSBnb3RvIAo+IGxhYmVsIHRo
ZXJlIGFuZCBoYXZlIHRoZSBjbGVhbnVwIG9uICJvdXQ6IgoKTXkgZ2VuZXJhbCBwb3NpdGlvbiBp
cyB0aGF0IHdoZW4gZXJyb3IgcGF0aHMgYXJlIGNvbXBsaWNhdGVkLCAiZ290byIKaXMgYWNjZXB0
YWJsZS4gQnV0IHdoZW4gdGhpbmdzIGNhbiBlYXNpbHkgYmUgZG9uZSB3aXRob3V0ICJnb3RvIiwg
aXRzCnVzZSB3b3VsZCBiZXR0ZXIgYmUgYXZvaWRlZC4gSW4gdGhlIGNhc2UgaGVyZSBhbGwgeW91
IG5lZWQgKGFmYWljdCkKaXMgYSBzaW1wbGUgc2VxdWVuY2Ugb2YgaWYvZWxzZS1pZi9lbHNlLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
