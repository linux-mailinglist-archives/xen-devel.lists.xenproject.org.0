Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83180FB1AB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:46:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUswv-0001tQ-H3; Wed, 13 Nov 2019 13:44:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUswu-0001tK-6t
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:44:44 +0000
X-Inumbo-ID: bdc4eb52-061b-11ea-a230-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdc4eb52-061b-11ea-a230-12813bfff9fa;
 Wed, 13 Nov 2019 13:44:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 360A0AD79;
 Wed, 13 Nov 2019 13:44:40 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
 <c1f58da4-0a05-5f77-13bd-a421582675d0@suse.com>
 <9466c080-9926-0d9f-435a-ddf0c3ec7812@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f8bbcb2-2eb9-c9f4-622a-43a6d0814b94@suse.com>
Date: Wed, 13 Nov 2019 14:44:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9466c080-9926-0d9f-435a-ddf0c3ec7812@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] xen/mcelog: add PPIN to record when
 available
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAwMToxMSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDExLzExLzE5
IDk6NDYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9tc3ItaW5kZXguaAo+PiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaAo+
PiBAQCAtMzkzLDYgKzM5Myw4IEBACj4+ICAjZGVmaW5lIE1TUl9BTURfUFNUQVRFX0RFRl9CQVNF
CQkweGMwMDEwMDY0Cj4+ICAjZGVmaW5lIE1TUl9BTUQ2NF9PU1ZXX0lEX0xFTkdUSAkweGMwMDEw
MTQwCj4+ICAjZGVmaW5lIE1TUl9BTUQ2NF9PU1ZXX1NUQVRVUwkJMHhjMDAxMDE0MQo+PiArI2Rl
ZmluZSBNU1JfQU1EX1BQSU5fQ1RMCQkweGMwMDEwMmYwCj4+ICsjZGVmaW5lIE1TUl9BTURfUFBJ
TgkJCTB4YzAwMTAyZjEKPiAKPiBXaGljaCBwcm9jZXNzb3JzIGFyZSB0aGVzZSBkZWZpbmVkIGZv
cj8gSSBsb29rZWQgYXQgYSBjb3VwbGUgKGZhbSAxNWgKPiBhbmQgMTdoKSBhbmQgZGlkbid0IHNl
ZSB0aG9zZS4gQW5kIEkgZG9uJ3Qgc2VlIHRoZW0gaW4gTGludXguCgpDZXJ0YWluIEZhbTE3IG9u
ZXMsIFJvbWUgaW4gcGFydGljdWxhciAod2hpY2ggaXMgd2hlcmUgSSd2ZQp0ZXN0ZWQgdGhpcyku
Cgo+PiAtLS0gYS9pbmNsdWRlL3hlbi9pbnRlcmZhY2UveGVuLW1jYS5oCj4+ICsrKyBiL2luY2x1
ZGUveGVuL2ludGVyZmFjZS94ZW4tbWNhLmgKPj4gQEAgLTMzMiw3ICszMzIsMTEgQEAgc3RydWN0
IHhlbl9tYyB7Cj4+ICB9Owo+PiAgREVGSU5FX0dVRVNUX0hBTkRMRV9TVFJVQ1QoeGVuX21jKTsK
Pj4gIAo+PiAtLyogRmllbGRzIGFyZSB6ZXJvIHdoZW4gbm90IGF2YWlsYWJsZSAqLwo+PiArLyoK
Pj4gKyAqIEZpZWxkcyBhcmUgemVybyB3aGVuIG5vdCBhdmFpbGFibGUuIEFsc28sIHRoaXMgc3Ry
dWN0IGlzIHNoYXJlZCB3aXRoCj4+ICsgKiB1c2Vyc3BhY2UgbWNlbG9nIGFuZCB0aHVzIG11c3Qg
a2VlcCBleGlzdGluZyBmaWVsZHMgYXQgY3VycmVudCBvZmZzZXRzLgo+PiArICogT25seSBhZGQg
bmV3IGZpZWxkcyB0byB0aGUgZW5kIG9mIHRoZSBzdHJ1Y3R1cmUKPj4gKyAqLwo+PiAgc3RydWN0
IHhlbl9tY2Ugewo+IAo+IFdoeSBpcyB0aGlzIHN0cnVjdHVyZSBpcyBwYXJ0IG9mIHRoZSBpbnRl
cmZhY2U/CgpUaGF0J3MgYSBxdWVzdGlvbiB0byB3aG9ldmVyIHB1dCBpdCB0aGVyZS4gVGhlcmUg
bG9vayB0byBoYXZlCmJlZW4gZGVjaXNpb25zIChzZWUgYWxzbyBwYXRjaCAxKSB0byBoYXZlIHRo
ZSBMaW51eCBjbG9uZXMgb2YKWGVuJ3MgcHVibGljIGhlYWRlcnMgZGV2aWF0ZSBmYXIgbW9yZSBm
cm9tIHRoZWlyIG9yaWdpbmFsCnRoYW4gSSB3b3VsZCBjb25zaWRlciByZWFzb25hYmxlLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
