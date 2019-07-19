Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D5D6E67E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSyO-0002pW-E2; Fri, 19 Jul 2019 13:30:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5H1R=VQ=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hoSyN-0002pQ-3s
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:30:55 +0000
X-Inumbo-ID: 6d981670-aa29-11e9-b313-7febcc9172a8
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d981670-aa29-11e9-b313-7febcc9172a8;
 Fri, 19 Jul 2019 13:30:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8F16B305FFA7; Fri, 19 Jul 2019 16:30:51 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 67D27304F606;
 Fri, 19 Jul 2019 16:30:51 +0300 (EEST)
To: Jan Beulich <JBeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <8817949d-a99c-ae0f-93b1-13c0bebacae6@bitdefender.com>
Date: Fri, 19 Jul 2019 16:30:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
Cc: PetreOvidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xOS8xOSA0OjE4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxOS4wNy4yMDE5IDE0
OjM0LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4gT24gMTguMDcuMjAxOSAxNTo1
OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAwMy4wNy4yMDE5IDEyOjU2LCBBbGV4YW5kcnUg
U3RlZmFuIElTQUlMQSB3cm90ZToKPj4+PiBBL0QgYml0IHdyaXRlcyAob24gcGFnZSB3YWxrcykg
Y2FuIGJlIGNvbnNpZGVyZWQgYmVuaWduIGJ5IGFuIGludHJvc3BlY3Rpb24KPj4+PiBhZ2VudCwg
c28gcmVjZWl2aW5nIHZtX2V2ZW50cyBmb3IgdGhlbSBpcyBhIHBlc3NpbWl6YXRpb24uIFdlIHRy
eSBoZXJlIHRvCj4+Pj4gb3B0aW1pemUgYnkgZml0ZXJpbmcgdGhlc2UgZXZlbnRzIG91dC4KPj4+
Cj4+PiBCdXQgeW91IGFkZCB0aGUgc2VuZGluZyBvZiBtb3JlIGV2ZW50cyAtIGhvdyBkb2VzICJm
aWx0ZXIgb3V0IiBtYXRjaAo+Pj4gdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbj8KPj4KPj4gVGhl
IGV2ZW50cyBhcmUgc2VuZCBvbmx5IGlmIHRoZXJlIGlzIGEgbWVtIGFjY2VzcyB2aW9sYXRpb24g
dGhlcmVmb3JlIHdlCj4+IGFyZSBmaWx0ZXJpbmcgYW5kIG9ubHkgc2VuZGluZyB0aGUgZXZlbnRz
IHRoYXQgYXJlIGludGVyZXN0aW5nIHRvCj4+IGludHJvc3BlY3Rpb24uCj4gCj4gV2hlcmUgaXMg
aXQgdGhhdCB5b3UgcHJldmVudCBhbnkgZXZlbnQgZnJvbSBiZWluZyBzZW50PyBBcyBzYWlkLAo+
IHJlYWRpbmcgdGhlIHBhdGNoIEkgb25seSBzZWUgbmV3IHNlbmRpbmcgc2l0ZXMgdG8gZ2V0IGFk
ZGVkLgoKSWYgd2UgZG9uJ3QgZW11bGF0ZSwgd2Ugd291bGQgcmVjZWl2ZSB0aGUgcGFnZS13YWxr
LWdlbmVyYXRlZCBldmVudHMgCl9hbmRfIHRoZSB0b3VjaGluZy10aGUtcGFnZS10aGUtaW5zdHJ1
Y3Rpb24taXMtdG91Y2hpbmcgZXZlbnRzLgoKSW4gY29tcGFyaXNvbiB0byB0aGUgImhhcmR3YXJl
IiBjYXNlLCB0aGUgY2FzZSB3aGVyZSB3ZSBlbXVsYXRlIHRoZSAKaW5zdHJ1Y3Rpb24gd2l0aCB0
aGUgcGFnZSB3YWxrIGlnbm9yaW5nIHRoZSBFUFQgcmVzdWx0cyBpbiBsZXNzIGV2ZW50cywgCmhl
bmNlIHRoZSBwcmV2ZW50aW9uIG9mIHNvbWUgZXZlbnRzIGJlaW5nIHNlbnQgb3V0LgoKClRoYW5r
cywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
