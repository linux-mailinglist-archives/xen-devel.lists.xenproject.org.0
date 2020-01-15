Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A1E13C96D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 17:34:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irlZn-0005CJ-AI; Wed, 15 Jan 2020 16:31:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irlZl-0005CC-Fg
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 16:31:25 +0000
X-Inumbo-ID: 73c5cf6a-37b4-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73c5cf6a-37b4-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 16:31:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A0B7AE19;
 Wed, 15 Jan 2020 16:31:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <39b51904-37d8-f0c0-2ad3-6a0dd7df59d7@suse.com>
 <b68451ec-6594-d4a4-1227-fa3026608122@citrix.com>
 <0d70e32d-b1ff-8b3e-e6f6-dee52734534f@suse.com>
 <ba696fe6-fb33-d1dd-c2df-02348f202961@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a9b46615-cf5f-7034-5575-b5a61a103f9a@suse.com>
Date: Wed, 15 Jan 2020 17:31:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ba696fe6-fb33-d1dd-c2df-02348f202961@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: refine link time stub area related
 assertion
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxNzoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8wMS8yMDIw
IDE2OjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTUuMDEuMjAyMCAxNTozNiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDE1LzAxLzIwMjAgMTA6MjYsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IFdoaWxlIGl0IGhhcyBiZWVuIG1lIHRvIGludHJvZHVjZSB0aGlzLCB0aGUgdXNlIG9m
IHwgdGhlcmUgaGFzIGJlY29tZQo+Pj4+IChhbmQgcGVyaGFwcyB3YXMgZnJvbSB0aGUgdmVyeSBi
ZWdpbm5pbmcpIG1pc2xlYWRpbmcuIFJhdGhlciB0aGFuCj4+Pj4gYXZvaWRpbmcgdGhlIHJpZ2h0
IHNpZGUgb2YgaXQgd2hlbiBsaW5raW5nIHRoZSB4ZW4uZWZpIGludGVybWVkaWF0ZSBmaWxlCj4+
Pj4gYXQgYSBkaWZmZXJlbnQgYmFzZSBhZGRyZXNzLCBtYWtlIHRoZSBleHByZXNzaW9uIGNvcGUg
d2l0aCB0aGF0IGNhc2UsCj4+Pj4gdGh1cyB2ZXJpZnlpbmcgcGxhY2VtZW50IG9uIGV2ZXJ5IHN0
ZXAuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4+PiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gYXMgdGhpcyBpcyBzaW1wbHkgYQo+Pj4gcmVhcnJhbmdpbmcsIGJ1dC4uLgo+Pj4KPj4+PiAt
LS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3hlbi5s
ZHMuUwo+Pj4+IEBAIC0zNTEsOCArMzUxLDggQEAgU0VDVElPTlMKPj4+PiAgICAuY29tbWVudCAw
IDogeyAqKC5jb21tZW50KSB9Cj4+Pj4gIH0KPj4+PiAgCj4+Pj4gLUFTU0VSVChfX2ltYWdlX2Jh
c2VfXyA+IFhFTl9WSVJUX1NUQVJUIHwKPj4+PiAtICAgICAgIF9fMk1fcndkYXRhX2VuZCA8PSBY
RU5fVklSVF9FTkQgLSBOUl9DUFVTICogUEFHRV9TSVpFLAo+Pj4+ICtBU1NFUlQoX18yTV9yd2Rh
dGFfZW5kIDw9IFhFTl9WSVJUX0VORCAtIFhFTl9WSVJUX1NUQVJUICsgX19YRU5fVklSVF9TVEFS
VCAtCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgTlJfQ1BVUyAqIFBBR0VfU0laRSwK
Pj4+IC4uLiBkb2Vzbid0IHRoaXMgd2FudCBhIHN0dWJzX3Blcl9wYWdlIHRlcm0/wqAgV2UgZG9u
J3QgaGF2ZSA0ayBwZXIgY3B1Lgo+PiBHb29kIHBvaW50IC0gbGV0IG1lIHNlZSBpZiBJIGNhbiBm
aXggdGhpcyBhdCB0aGlzIHNhbWUgb2NjYXNpb24uCj4+IEkgZ3Vlc3Mgd2hlbiBpbnRyb2R1Y2lu
ZyB0aGVzZSBwYWdlcyBJIGhhZCBvbmUgcGVyIENQVSBpbml0aWFsbHksCj4+IGFuZCB0aGVuIGZv
cmdvdCB0byB1cGRhdGUgdGhlIGFzc2VydGlvbiBoZXJlIChpdCBiZWluZyB0b28gc3RyaWN0Cj4+
IG9mIGNvdXJzZSBpcyBiZXR0ZXIgdGhhbiBpdCBiZWluZyB0b28gbGF4KS4KPiAKPiBXaXRoIHNv
bWUgc3VpdGFibGUgdGVybSwgZmVlbCBmcmVlIHRvIHVwIG15IEEtYnkgdG8gUi1ieS4KCkxldCBt
ZSByYXRoZXIgcG9zdCB3aGF0IEkgaGF2ZSwgYmVjYXVzZSB0aGVyZSdzIGdvaW5nIHRvIGJlIHNv
bWUKdWdsaW5lc3MgKGFuZCBoZW5jZSByb29tIGZvciBtaXN0YWtlcykgYmVjYXVzZSBvZiB0aGUg
cm91bmRpbmcKbmVlZGVkLiBCdXQgdGhhbmtzIGZvciB0aGUgb2ZmZXIuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
