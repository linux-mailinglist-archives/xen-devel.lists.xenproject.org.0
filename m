Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE44BD65
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 18:01:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdczf-0004u6-CY; Wed, 19 Jun 2019 15:59:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdczd-0004u1-Vu
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 15:59:26 +0000
X-Inumbo-ID: 3529eb40-92ab-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3529eb40-92ab-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 15:59:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83EC6344;
 Wed, 19 Jun 2019 08:59:23 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBAC03F246;
 Wed, 19 Jun 2019 08:59:22 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <2B31D2BD02000066A2327079@prv1-mh.provo.novell.com>
 <5D09E4310200007800239852@prv1-mh.provo.novell.com>
 <60ff0360-50be-8545-45d8-799ef9fcb95b@arm.com>
Message-ID: <5de0325f-0782-34c5-3118-5ac9a2fafcb9@arm.com>
Date: Wed, 19 Jun 2019 16:59:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <60ff0360-50be-8545-45d8-799ef9fcb95b@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Fwd: [xen-4.10-testing bisection] complete
 test-armhf-armhf-xl-arndale
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5zd2VyaW5nIHRvIG15c2VsZi4KCk9uIDE5LzA2LzIwMTkgMTA6MDIsIEp1bGllbiBHcmFsbCB3
cm90ZToKPiBIaSwKPiAKPiBPbiA2LzE5LzE5IDg6MjggQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+
Pj4+PiBPbiAxOS4wNi4xOSBhdCAwOTowNiwgPG9zc3Rlc3QtYWRtaW5AeGVucHJvamVjdC5vcmc+
IHdyb3RlOgo+Pj4gYnJhbmNoIHhlbi00LjEwLXRlc3RpbmcKPj4+IHhlbmJyYW5jaCB4ZW4tNC4x
MC10ZXN0aW5nCj4+PiBqb2IgdGVzdC1hcm1oZi1hcm1oZi14bC1hcm5kYWxlCj4+PiB0ZXN0aWQg
ZGViaWFuLWluc3RhbGwKPj4+Cj4+PiBUcmVlOiBsaW51eCBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcv
bGludXgtcHZvcHMuZ2l0Cj4+PiBUcmVlOiBsaW51eGZpcm13YXJlIGdpdDovL3hlbmJpdHMueGVu
Lm9yZy9vc3N0ZXN0L2xpbnV4LWZpcm13YXJlLmdpdAo+Pj4gVHJlZTogb3ZtZiBnaXQ6Ly94ZW5i
aXRzLnhlbi5vcmcvb3NzdGVzdC9vdm1mLmdpdAo+Pj4gVHJlZTogcWVtdXUgZ2l0Oi8veGVuYml0
cy54ZW4ub3JnL3FlbXUteGVuLmdpdAo+Pj4gVHJlZTogeGVuIGdpdDovL3hlbmJpdHMueGVuLm9y
Zy94ZW4uZ2l0Cj4+Pgo+Pj4gKioqIEZvdW5kIGFuZCByZXByb2R1Y2VkIHByb2JsZW0gY2hhbmdl
c2V0ICoqKgo+Pj4KPj4+IMKgwqAgQnVnIGlzIGluIHRyZWU6wqAgeGVuIGdpdDovL3hlbmJpdHMu
eGVuLm9yZy94ZW4uZ2l0Cj4+PiDCoMKgIEJ1ZyBpbnRyb2R1Y2VkOsKgIDcwMmM5MTQ2YzAwZDY1
ZDFlOWM1OTU1MzM1YmEwMDI1MDVlOTdlMDkKPj4+IMKgwqAgQnVnIG5vdCBwcmVzZW50OiA1MjIy
MGI1ZjQzN2E4ZDAzYmExMDhlMTI3ZTdkNzE3NjU3ZWRmOTljCj4+PiDCoMKgIExhc3QgZmFpbCBy
ZXBybzogaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEz
ODAwNS8KPj4+Cj4+Pgo+Pj4gwqDCoCBjb21taXQgNzAyYzkxNDZjMDBkNjVkMWU5YzU5NTUzMzVi
YTAwMjUwNWU5N2UwOQo+Pj4gwqDCoCBBdXRob3I6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4+PiDCoMKgIERhdGU6wqDCoCBNb24gQXByIDI5IDE1OjA1OjE2IDIwMTkgKzAx
MDAKPj4+IMKgwqDCoMKgwqDCoCB4ZW4vYXJtOiBBZGQgYW4gaXNiKCkgYmVmb3JlIHJlYWRpbmcg
Q05UUENUX0VMMCB0byBwcmV2ZW50IHJlLW9yZGVyaW5nCj4+PiDCoMKgwqDCoMKgwqAgUGVyIEQ4
LjIuMSBpbiBBUk0gRERJIDA0ODdDLmEsICJhIHJlYWQgdG8gQ05UUENUX0VMMCBjYW4gb2NjdXIK
Pj4+IMKgwqDCoMKgwqDCoCBzcGVjdWxhdGl2ZWx5IGFuZCBvdXQgb2Ygb3JkZXIgcmVsYXRpdmUg
dG8gb3RoZXIgaW5zdHJ1Y3Rpb25zIGV4ZWN1dGVkCj4+PiDCoMKgwqDCoMKgwqAgb24gdGhlIHNh
bWUgUEUuIgo+Pj4gwqDCoMKgwqDCoMKgIEFkZCBhbiBpbnN0cnVjdGlvbiBiYXJyaWVyIHRvIGdl
dCBhY2N1cmF0ZSBudW1iZXIgb2YgY3ljbGVzIHdoZW4KPj4+IMKgwqDCoMKgwqDCoCByZXF1ZXN0
ZWQgaW4gZ2V0X2N5Y2xlcygpLiBGb3IgdGhlIG90aGVyIHVzZXJzIG9mIENOUENUX0VMMCwgcmVw
bGFjZSBieQo+Pj4gwqDCoMKgwqDCoMKgIGEgY2FsbCB0byBnZXRfY3ljbGVzKCkuCj4+PiDCoMKg
wqDCoMKgwqAgVGhpcyBpcyBwYXJ0IG9mIFhTQS0yOTUuCj4+PiDCoMKgwqDCoMKgwqAgU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+IMKgwqDCoMKg
wqDCoCBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+Pgo+PiBKdXN0IGluIGNhc2UgeW91IGRpZG4ndCBub3RpY2UgdGhpcyBjb21pbmcgaW4uCj4g
Cj4gSSBzYXcgaXQgdGhpcyBtb3JuaW5nLiBCdXQgSSBmYWlsIHRvIHVuZGVyc3RhbmQgaG93IHRo
ZSBpbnN0cnVjdGlvbiBiYXJyaWVyIHdpbGwgCj4gcmVzdWx0IGluIGEgdGltZW91dCBkdXJpbmcg
dGhlIGd1ZXN0IGluc3RhbGxhdGlvbi4uLgoKT25lIHRoaW5nIHRvIGtlZXAgaW4gbWluZCBoZXJl
IGlzIGlzYigpIHdpbGwgYWxzbyBjYXJyeSBhIGNvbXBpbGVyIGJhcnJpZXIuIFNvIAp0aGUgcmVz
dWx0aW5nIGJpbmFyeSBtYXkgYmUgZGlmZmVyZW50IGFzIHRoZSBjb21waWxlciBtYXkgcmUtb3Jk
ZXIgdGhlIGxvYWQuCgpPbmUgcG9zc2liaWxpdHkgaXMgdGhlcmUgYXJlIGEgbWlzc2luZyBkYXRh
IGJhcnJpZXIgaW4gb3RoZXIgcGFydCBvZiB0aGUgY29kZS4gClRoZSBpc2IoKSB3b3VsZCBleHBv
c2UgaXQuCgo+IAo+IFRoZSBtb3JlIHRoaXMgb25seSBkb2Vzbid0IHNlZW0gdG8gYXBwZWFyIG9u
IHN0YWdpbmctNC4xMi4KCkBTdGVmYW5vLCBhcyB3ZSBrbm93IHN0YWdpbmctNC4xMiBpcyB3b3Jr
aW5nLCBvbmUgd2F5IHRvIGRlYnVnIHRoaXMgaXMgdG8gdHJ5IHRvIApyZXByb2R1Y2UgaW4gZGlm
ZmVyZW50IGNvbW1pdCBiZXR3ZWVuIHN0YWdpbmctNC4xMiB3aXRoIHRoZSBpc2IoKSBwYXRjaCBh
cHBsaWVkLgoKSG9wZWZ1bGx5IHRoaXMgc2hvdWxkIHRlc3QgdXMgd2hlcmUgdGhlIGJ1ZyB3YXMg
Zml4ZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
