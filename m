Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35F32303
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2019 12:41:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXNs0-00022Z-KN; Sun, 02 Jun 2019 10:37:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tfz6=UB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXNrz-00022U-6Y
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2019 10:37:43 +0000
X-Inumbo-ID: 73097436-8522-11e9-bfe0-47ebf4313174
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 73097436-8522-11e9-bfe0-47ebf4313174;
 Sun, 02 Jun 2019 10:37:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 583F3374;
 Sun,  2 Jun 2019 03:37:41 -0700 (PDT)
Received: from [10.37.12.21] (unknown [10.37.12.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6479F3F5AF;
 Sun,  2 Jun 2019 03:37:39 -0700 (PDT)
To: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "JBeulich@suse.com" <JBeulich@suse.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
 <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
 <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
 <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
 <83c1a4f7-0714-0ee5-e225-835126d92c5d@arm.com>
 <5CE540960200007800231571@prv1-mh.provo.novell.com>
 <109e62db-9ed6-309b-44cc-63e7cffa2c67@arm.com>
 <59be6ac5f732609593c263eb29fcae372301a2f2.camel@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0d2dbdda-d95b-67c9-76f5-ac7925258968@arm.com>
Date: Sun, 2 Jun 2019 11:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <59be6ac5f732609593c263eb29fcae372301a2f2.camel@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Ian.Jackson@eu.citrix.com" <Ian.Jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQXJ0ZW0sCgpPbiA1LzIyLzE5IDc6MDUgUE0sIEFydGVtIE15Z2FpZXYgd3JvdGU6Cj4gT24g
V2VkLCAyMDE5LTA1LTIyIGF0IDE0OjAwICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9u
IDIyLzA1LzIwMTkgMTM6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjIuMDUuMTkg
YXQgMTQ6MjAsIDwKPj4+Pj4+IGp1bGllbi5ncmFsbEBhcm0uY29tCj4+Pj4+Pj4gd3JvdGU6Cj4+
Pj4gT24gMjEvMDUvMjAxOSAxMDo1NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+PiBIaSBKYW4s
Cj4+Pj4+Cj4+Pj4+IE9uIDUvMjEvMTkgMTA6NDMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4+Pj4gT24gMjEuMDUuMTkgYXQgMTE6MzUsIDwKPj4+Pj4+Pj4+IGp1bGllbi5ncmFsbEBhcm0u
Y29tCj4+Pj4+Pj4+Pj4gd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+PiBPbiA1LzIxLzE5IDEwOjI2IEFN
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4+Pj4gT24gMjAuMDUuMTkgYXQgMjA6MTIsIDwK
Pj4+Pj4+Pj4+Pj4ganVsaWVuLmdyYWxsQGFybS5jb20KPj4+Pj4+Pj4+Pj4+IHdyb3RlOgo+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+ICAgICAgICAgQXMgdGhpcyBpcyBub3cgWGVuIGFuZCB0b29scyBvbmx5
LCBJIGFtCj4+Pj4+Pj4+PiB3b25kZXJpbmcgd2hldGhlciB0aGUgY2hlY2sgb24KPj4+Pj4+Pj4+
ICAgICAgICAgR05VX0MgaXMgc3RpbGwgbmVjZXNzYXJ5LiBJIGFtIGhhcHB5IHRvIHNlbmQgYQo+
Pj4+Pj4+Pj4gZm9sbG93LXVwIHBhdGNoIChvciBmb2xkCj4+Pj4+Pj4+PiAgICAgICAgIGluIHRo
aXMgb25lKSBpZiBpdCBjYW4gYmUgcmVtb3ZlZC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSB0aGluayB0
aGlzIHNob3VsZCBiZSBkcm9wcGVkIGlmIGl0IGNhbiBiZSB3aXRob3V0Cj4+Pj4+Pj4+IGJyZWFr
aW5nIGFueQo+Pj4+Pj4+PiBwYXJ0IG9mIHRoZSBidWlsZAo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBp
cyBiZWNhdXNlIGFsbCB0aGUgdG9vbHMgYXJlIHBhcnQgb2YgeGVuLmdpdCwgcmlnaHQ/Cj4+Pj4+
Pgo+Pj4+Pj4gUmlnaHQgLSBuby1vbmUgZWxzZSBpcyBzdXBwb3NlZCB0byBkZWZpbmUgX19YRU5f
VE9PTFNfXywgb3IKPj4+Pj4+IGlmIGFueW9uZSBkb2VzLCB0aGV5J3JlIG9uIHRoZWlyIG93bi4K
Pj4+Pj4KPj4+Pj4gVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uIEkgd2lsbCBkbyBhIGZ1bGwg
YnVpbGQgY2hlY2suCj4+Pj4KPj4+PiBJIHRob3VnaHQgYWJvdXQgdGhpcyBhZ2FpbiwgbG9uZyB0
ZXJtIHRoZXJlIGFyZSBhbiBhdHRlbXB0IHRvCj4+Pj4gYnVpbGQgeGVuIHdpdGgKPj4+PiBvdGhl
ciBjb21waWxlciBub3QgbmVjZXNzYXJpbHkgc3VwcG9ydGluZyBHTlUgQyBleHRlbnNpb24uCj4+
Pj4gV2hpbGUgdGhpcyB3b3VsZCBwcm9iYWJseSBub3QgYmUgdGhlIG9ubHkgcGxhY2UgdGhhdCBu
ZWVkIHRvIGJlCj4+Pj4gcmV3b3JrZWQsIHdlCj4+Pj4gd291bGQgaGF2ZSB0byByZXZlcnQgcGFy
dCBvZiB0aGlzIGNoYW5nZS4gU28gSSB3aWxsIG5vdCBkcm9wIHRoZQo+Pj4+ICNpZmRlZiBoZXJl
Lgo+Pj4KPj4+IFdlbGwsIEkgZG9uJ3Qga25vdyBob3cgaXQgaXMgZm9yIEFybSwgYnV0IG9uIHg4
NiB3ZSBhY3R1YWxseSB1c2UKPj4+IHRoZQo+Pj4gImV4dGVuZGVkIiBuYW1pbmcgcXVpdGUgZXh0
ZW5zaXZlbHksIHNvIGJ1aWxkaW5nIHdpdGggYSBjb21waWxlcgo+Pj4gdGhhdCBkb2Vzbid0IHN1
cHBvcnQgdGhpcyBleHRlbnNpb24gaXMgbm90IHJlYWxseSBhbiBvcHRpb24gdGhlcmUuCj4+Cj4+
IEZvciB0aGUgQXJtLCBJIHRoaW5rIG9ubHkgY3B1X3VzZXJfcmVncyBpcyB1c2luZyAiZXh0ZW5k
ZWQiIG5hbWluZy4KPj4gSXQgc2hvdWxkIGJlCj4+IHBvc3NpYmxlIHRvIHJlbW92ZSBpdCB3aXRo
b3V0IHRvbyBtdWNoIHRyb3VibGUgaGVyZS4KPj4KPj4gQEFydGVtLCBpcyB0aGVyZSBhbnkgcmVz
dHJpY3Rpb24gdG8gdXNlIGFub255bW91cyB1bmlvbiBpbiBmdW5jdGlvbmFsCj4+IHNhZmV0eT8K
Pj4KPiAKPiBJbiBnZW5lcmFsLCB1bmlvbnMgYXJlIG5vdCBhbGxvd2VkIGluIHNhZmV0eSByZWd1
bGF0ZWQgcHJvZ3JhbW1pbmcsCj4gdGhleSBhbHdheXMgcmVxdWlyZSBhICJkZXZpYXRpb24iIC0g
ZS5nLiB1bmlvbnMgdXNlIGZvciBkYXRhIHBhY2tpbmcgaXMKPiB1c3VhbGx5IGFjY2VwdGVkIGRp
c3JlZ2FyZGluZyBhbm9ueW1vdXMgb3Igbm90LgoKVGhhdCdzIGdvb2QgdG8ga25vdy4gSSBhbSBn
b2luZyB0byBrZWVwIGZvciBub3cgdGhlIHR3byBkZWZpbml0aW9ucyBvZiAKX19ERUNMX1JFRy4g
V2UgY2FuIHJlbW92ZSB0aGVtIGxhdGVyIG9uIGlmIGl0IGlzIG5vdCBuZWNlc3NhcnkuCgo+IAo+
IENvdXBsZSBvZiBvdGhlciB0aGluZ3MgSSB3YW50ZWQgdG8gbWVudGlvbjoKPiAxLiBhbGwgcHJv
dGVjdGl2ZSBwcm9ncmFtbWluZyBzdGFuZGFyZHMgZS5nLiBNSVNSQSByZWNvbW1lbmQgcmVkdWNp
bmcKPiB2aXNpYmlsaXR5IG9mIGZ1bmN0aW9ucyBhbmQgdmFyaWFibGVzIHRvIHJlZHVjZSBBUEkg
c3VyZmFjZSBhbnMgdGh1cwo+IG5lZWQgZm9yIHRlc3QgY292ZXJhZ2UgYW5kIHN5c3RlbWF0aWMg
ZmF1bHQgcHJvYmFiaWxpdHkuCgpJbiBnZW5lcmFsLCB3ZSB3YW50IHRvIGxpbWl0IHRoZSBBUEkg
ZXhwb3NlZCB0byBndWVzdCBhcyB0aGlzIGlzIHN0YWJsZS4KTGV0IHVzIGtub3cgaWYgeW91IHNl
ZSBvdGhlciBwbGFjZXMgd2hlcmUgd2UgY291bGQgcG90ZW50aWFsbHkgcmVkdWNlIAp0aGUgQVBJ
IHdpdGhvdXQgaW1wYWN0aW5nIGV4aXN0aW5nIGd1ZXN0LgoKPiAyLiBjdXJyZW50IGltcGxlbWVu
dGF0aW9uIHhlbiB0b29scyBhcmUgdmVyeSBoYXJkIHRvIHVzZSBpbiBzYWZldHkgZm9yCj4gbWFu
eSByZWFzb25zLCBJIGhvcGUgdG8gZm9sbG93IHVwIG9uIHRoaXMgc29vbi4uLgoKVGhhbmsgeW91
IGZvciB0aGUgZmVlZGJhY2shCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
