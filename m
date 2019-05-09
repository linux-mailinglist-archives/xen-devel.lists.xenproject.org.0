Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E101519505
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 00:05:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOr7R-0002KD-NK; Thu, 09 May 2019 22:02:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GyTO=TJ=citrix.com=prvs=025853ab4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hOr7Q-0002K7-8A
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 22:02:24 +0000
X-Inumbo-ID: 1d079178-72a6-11e9-9d10-a35840d6a125
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d079178-72a6-11e9-9d10-a35840d6a125;
 Thu, 09 May 2019 22:02:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,450,1549929600"; d="scan'208";a="89694374"
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Mathieu Tarral
 <mathieu.tarral@protonmail.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
 <66aeafd6-a87e-2f76-e0a3-6d0ad1e6f35f@bitdefender.com>
 <bf8797be-72f8-b38a-0e61-56ed69269652@citrix.com>
 <b09c9ca3-7ea7-da79-4a92-38119b5ff651@bitdefender.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5d1870c1-62f2-5939-82d1-01352542598f@citrix.com>
Date: Thu, 9 May 2019 23:02:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b09c9ca3-7ea7-da79-4a92-38119b5ff651@bitdefender.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [VMI] How to add support for MOV-TO-DRx events ?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDUvMjAxOSAyMjo1MCwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDUvMTAvMTkg
MTI6MzEgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IFdoYXQgd2UnbGwgaGF2ZSB0byBkbyBp
cyBlbmQgdXAgaW4gYSBwb3NpdGlvbiB3aGVyZSB3ZSBjYW4gaGF2ZSBzb21lCj4+IHJlYWwgJWRy
IHNldHRpbmdzIGdpdmVuIGJ5IHRoZSBWTUkgYWdlbnQsIGFuZCBzb21lIHNoYWRvdyAlZHIgc2V0
dGluZ3MKPj4gd2hpY2ggdGhlIGd1ZXN0IGludGVyYWN0cyB3aXRoLsKgIEFsc28gSSBzaG91bGQg
d2FybiB5b3UgYXQgdGhpcyBwb2ludAo+PiB0aGF0LCBiZWNhdXNlIG9mIGhvdyB0aGUgcmVnaXN0
ZXJzIHdvcmssIEl0IHdpbGwgbm90IGJlIHBvc3NpYmxlIHRvIGhhdmUKPj4gZ3Vlc3Qtc2hhZG93
ZWQgJWRyIGZ1bmN0aW9uaW5nIGF0IHRoZSBzYW1lIHRpbWUgYXMgVk1JLXByb3ZpZGVkICVkcgo+
PiBzZXR0aW5ncy4KPj4KPj4gSSBndWVzcyB0aGUgbWFpbiB1c2VjYXNlIGhlcmUgaXMgc2ltcGx5
IGhpZGluZyBmcm9tIHRoZSBndWVzdCBrZXJuZWwKPj4gdGhhdCBkZWJ1Z2dpbmcgYWN0aXZpdGll
cyBhcmUgaW4gdXNlLCBhbmQgd2UgYXJlIG9rIHRvIGJyZWFrIHRoZSByZWFsCj4+IHVzZSBvZiBn
ZGIvb3RoZXIgaW5zaWRlIHRoZSBndWVzdD/CoCBSYXp2YW4vVGFtYXM6IEFzIHlvdXIgdGhlCj4+
IG1haW50YWluZXJzLCBpdCBpcyB5b3VyIGNhbGwsIHVsdGltYXRlbHkuCj4gV2hhdCB3b3JyaWVz
IG1lIGhlcmUgaXMgdGhhdCBpbiB0aGF0IGNhc2UgaXQgYmVjb21lcyBlYXNpZXIgZm9yIGEgcm9n
dWUKPiBhcHBsaWNhdGlvbiBpbnNpZGUgdGhlIGd1ZXN0IHRvIGZpZ3VyZSBvdXQgdGhhdCB0aGUg
Z3Vlc3QncyBiZWluZwo+IG1vbml0b3JlZCwgaWYgSSB1bmRlcnN0YW5kIHRoaW5ncyBjb3JyZWN0
bHkuCj4KPiBPZiBjb3Vyc2UsIGEgZG9tMCBpbnRyb3NwZWN0aW9uIGFnZW50IG1heSBjaG9vc2Ug
dG8gc2ltcGx5IG5vdCBzdWJzY3JpYmUKPiB0byBEUiBldmVudHMsIGFuZCB0aHVzIG5vdCBhbHRl
ciB0aGUgY3VycmVudCBmbG93IGF0IGFsbCwgd2hpY2ggbWFrZXMKPiB0aGluZ3MgYmV0dGVyLgoK
QSBzZXBhcmF0ZSBhbmdsZSBJIGhhZG4ndCBjb25zaWRlcmVkIGhlcmUgaXMgdGhhdCBvZiB0aGUK
ZC0+ZGVidWdnZXJfYXR0YWNoZWQgaW5mcmFzdHJ1Y3R1cmUsIHdoaWNoIGlzIGVudGlyZWx5IHNl
cGFyYXRlIGFuZCBraW5kCm9mIG9uIHRoZSBzaWRlLCBidXQgaXMgcHJlc3VtYWJseSB2aXNpYmxl
IHRvIHRoZSBndWVzdC7CoCBJdCB3b3VsZCBhbHNvCnByb2JhYmx5IGJlIGEgbmljZSB0aGluZyB0
byBtb3ZlIHRoaXMgbG9naWNhbGx5IHdpdGhpbiBWTUkgKEkgdGhpbms/KQoKSSB0aGluayB0aGUg
bW9zdCBpbXBvcnRhbnQgdGhpbmcgdG8gZG8gZmlyc3QgaXMgdG8gdW5kZXJzdGFuZCBob3cgTU9W
LURSCmV2ZW50cyBhcmUgaW50ZW5kZWQgdG8gYmUgdXNlZCwgYW5kIHdoYXQga2luZCBvZiBiZWhh
dmlvdXIgd2Ugd2FudCwKZ2l2ZW4gdGhhdCB0aGUgdHdvIGNhbid0IGJlIHNoYXJlZCBpbiBwcmFj
dGljZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
