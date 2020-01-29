Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E65114C7CC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 10:02:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwjBq-0004jA-2E; Wed, 29 Jan 2020 08:59:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwjBo-0004j3-Db
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 08:59:12 +0000
X-Inumbo-ID: 9d4484a0-4275-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d4484a0-4275-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 08:59:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F1A1AE50;
 Wed, 29 Jan 2020 08:59:10 +0000 (UTC)
To: Peter.Kurfer@gdata.de
References: <8e3c6908ce4b48689817b32c538fecf9@gdata.de>
 <4d99fec9-013a-ff99-8813-2c464be8e970@suse.com>
 <5d912751441542ce841c5c4c2f9b7758@gdata.de>
 <adc62139-1330-ea1c-92fa-33939ceb14ac@suse.com>
 <b11cccbee7504efb8ea9d3fa14a85afc@gdata.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc3bef3c-a10d-2cba-0277-d4a6b32bebf8@suse.com>
Date: Wed, 29 Jan 2020 09:59:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b11cccbee7504efb8ea9d3fa14a85afc@gdata.de>
Content-Language: en-US
Subject: Re: [Xen-devel] Host freezing after "fixing" recursive fault
 starting in multicalls.c
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAwOToyOSwgUGV0ZXIuS3VyZmVyQGdkYXRhLmRlIHdyb3RlOgo+IEFzIHJl
cXVlc3RlZCBJIGNvbmZpZ3VyZWQgb25lIGhvc3Qgd2l0aDoKPiAKPj4gbG9nbHZsPWFsbCBndWVz
dF9sb2dsdmw9YWxsCj4gCj4gYW5kwqBjb2xsZWN0ZWQgb25lIGRheSBvZiBsb2dzIHZpYSBzZXJp
YWwgaW50ZXJmYWNlOgo+IAo+IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9kcml2ZS9mb2xkZXJz
LzFzUXZ5TkgwU3oyOHRVZVZSWmw5bW93aEIwSHRkOFpwTz91c3A9c2hhcmluZwo+IAo+IHNlYXJj
aGluZyBmb3IgImVycm9yIiBvciAibXVsdGljYWxscy5jIiBsZWFkcyB0byBzb21lIHN0YWNrdHJh
Y2VzIHRoYXQgbWlnaHQgYmUgaW50ZXJlc3RpbmcuCgpSaWdodCwgYnV0IHRoZSBiYWQgbmV3cyBp
cyB0aGF0IHRoZXJlIGFyZSBubyBoZWxwZnVsIGh5cGVydmlzb3IKbWVzc2FnZXMgYXQgYWxsLiBT
YWRseSB0aGlzIGlzIHBhcnRseSBteSBmYXVsdCwgYmVjYXVzZSBJIHNob3VsZApoYXZlIGFza2Vk
IHlvdSB0byBkbyB0aGlzIGxvZyBjb2xsZWN0aW9uIHdpdGggYSBkZWJ1ZyBoeXBlcnZpc29yLgpN
b3N0IG9mIHRoZSBwb3NzaWJseSBpbnRlcmVzdGluZyBtZXNzYWdlcyB3b3VsZCBhcHBlYXIgb25s
eSB0aGVyZS4KCkluIGFueSBldmVudCwgcHJvYmxlbXMgc3RhcnQgcXVpdGUgYSBiaXQgZWFybGll
ciwgYW5kIHR5cGljYWxseQppdCdzIHRoZSBmaXJzdCBpbnN0YW5jZSBvZiBhIHByb2JsZW0gdGhh
dCBpcyB0aGUgbW9zdCBoZWxwZnVsIHRvCmFuYWx5emUsIGFzIGxhdGVyIG9uZXMgbWF5IGJlIGNh
c2NhZGUgaXNzdWVzLiBUaGUgZmlyc3Qgc2lnbiBvZgpwcm9ibGVtcyBpcyBhbiBvdmVybGFwcGlu
ZwoKWzE0OTkxLjgyNzc2Ml0gQlVHOiB1bmFibGUgdG8gaGFuZGxlIHBhZ2UgZmF1bHQgZm9yIGFk
ZHJlc3M6IGZmZmY4ODhhZTJlYjZiZDgKCmFuZAoKWzE0OTkxLjgyODE3Ml0gV0FSTklORzogQ1BV
OiA1IFBJRDogMjU4NSBhdCBhcmNoL3g4Ni94ZW4vbXVsdGljYWxscy5jOjEwMiB4ZW5fbWNfZmx1
c2grMHgxOTQvMHgxYzAKCm9uIENQVXMgOCBhbmQgNS4KCj4gQXMgZmFyIGFzIEkga25vdyB0aGUg
QUNQSSBlcnJvcnMgaW4gdGhlIGNvbnRleHQgb2YgSVBNSSBjYW4gYmUgaWdub3JlZC4KCkxvb2tz
IGxpa2Ugc28sIHllcywgYXQgbGVhc3QgZm9yIHRoZSBwdXJwb3NlcyBoZXJlLiBXaGF0IEkgd291
bGRuJ3QKcHV0IG9mZiBhcyBhIHBvc3NpYmxlIHJlYXNvbiBmb3IgcHJvYmxlbXMgaXMgdGhlIHNp
Z25pZmljYW50IGFtb3VudApvZiB0ZW1wZXJhdHVyZSByZWxhdGVkIG1lc3NhZ2VzLiBXaGF0IEkg
YWxzbyBmaW5kIGF0IGxlYXN0IGN1cmlvdXMKKGJ1dCBwb3NzaWJseSBqdXN0IGJlY2F1c2UgSSBr
bm93IHRvbyBsaXR0bGUgb2YgdGhlIHJlc3BlY3RpdmUKYXNwZWN0cyBvZiBtb2Rlcm4ga2VybmVs
cykgYXJlIHRoZSByZWN1cnJpbmcgX190ZXh0X3Bva2UoKSBpbnN0YW5jZXMKb24gdGhlIHN0YWNr
IHRyYWNlcy4gQXNzdW1pbmcgdGhlc2UgYXJlIHRvIGJlIGV4cGVjdGVkIGluIHRoZSBmaXJzdApw
bGFjZSwgdGhlcmUgbWlnaHQgYmUgYSByYWNlIGhlcmUgd2hpY2ggaXMgZWl0aGVyIFhlbi1zcGVj
aWZpYyBvcgpzaW1wbHkgaGFzIGEgbXVjaCBiZXR0ZXIgY2hhbmNlIG9mIGhpdHRpbmcgKGxhcmdl
ciB3aW5kb3c/KSB3aGVuCnJ1bm5pbmcgb24gWGVuLiBCdXQgSSdtIGFmcmFpZCB0aGlzIHdpbGwg
bmVlZCBsb29raW5nIGludG8gKG9yIGF0CmxlYXN0IGNvbW1lbnRpbmcgb24pIGJ5IGEga2VybmVs
IHBlcnNvbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
