Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A4A6E745
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 16:26:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoTnG-0000na-Gf; Fri, 19 Jul 2019 14:23:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5H1R=VQ=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hoTnE-0000n6-Qv
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 14:23:28 +0000
X-Inumbo-ID: c5f74ae6-aa30-11e9-b6d2-57ed8fbc49e8
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5f74ae6-aa30-11e9-b6d2-57ed8fbc49e8;
 Fri, 19 Jul 2019 14:23:27 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 67B9C3016E6E; Fri, 19 Jul 2019 17:23:26 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 4B87A304F605;
 Fri, 19 Jul 2019 17:23:26 +0300 (EEST)
To: Jan Beulich <JBeulich@suse.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <8817949d-a99c-ae0f-93b1-13c0bebacae6@bitdefender.com>
 <08ed1d56-b24b-66bd-34da-d0c329a2eecf@suse.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <ded7b153-d2cd-15e1-93cc-9aaab2a06d95@bitdefender.com>
Date: Fri, 19 Jul 2019 17:23:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <08ed1d56-b24b-66bd-34da-d0c329a2eecf@suse.com>
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
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xOS8xOSA0OjM4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxOS4wNy4yMDE5IDE1
OjMwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IE9uIDcvMTkvMTkgNDoxOCBQTSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxOS4wNy4yMDE5IDE0OjM0LCBBbGV4YW5kcnUgU3RlZmFuIElT
QUlMQSB3cm90ZToKPj4+PiBPbiAxOC4wNy4yMDE5IDE1OjU4LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+Pj4gT24gMDMuMDcuMjAxOSAxMjo1NiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6
Cj4+Pj4+PiBBL0QgYml0IHdyaXRlcyAob24gcGFnZSB3YWxrcykgY2FuIGJlIGNvbnNpZGVyZWQg
YmVuaWduIGJ5IGFuIGludHJvc3BlY3Rpb24KPj4+Pj4+IGFnZW50LCBzbyByZWNlaXZpbmcgdm1f
ZXZlbnRzIGZvciB0aGVtIGlzIGEgcGVzc2ltaXphdGlvbi4gV2UgdHJ5IGhlcmUgdG8KPj4+Pj4+
IG9wdGltaXplIGJ5IGZpdGVyaW5nIHRoZXNlIGV2ZW50cyBvdXQuCj4+Pj4+Cj4+Pj4+IEJ1dCB5
b3UgYWRkIHRoZSBzZW5kaW5nIG9mIG1vcmUgZXZlbnRzIC0gaG93IGRvZXMgImZpbHRlciBvdXQi
IG1hdGNoCj4+Pj4+IHRoZSBhY3R1YWwgaW1wbGVtZW50YXRpb24/Cj4+Pj4KPj4+PiBUaGUgZXZl
bnRzIGFyZSBzZW5kIG9ubHkgaWYgdGhlcmUgaXMgYSBtZW0gYWNjZXNzIHZpb2xhdGlvbiB0aGVy
ZWZvcmUgd2UKPj4+PiBhcmUgZmlsdGVyaW5nIGFuZCBvbmx5IHNlbmRpbmcgdGhlIGV2ZW50cyB0
aGF0IGFyZSBpbnRlcmVzdGluZyB0bwo+Pj4+IGludHJvc3BlY3Rpb24uCj4+Pgo+Pj4gV2hlcmUg
aXMgaXQgdGhhdCB5b3UgcHJldmVudCBhbnkgZXZlbnQgZnJvbSBiZWluZyBzZW50PyBBcyBzYWlk
LAo+Pj4gcmVhZGluZyB0aGUgcGF0Y2ggSSBvbmx5IHNlZSBuZXcgc2VuZGluZyBzaXRlcyB0byBn
ZXQgYWRkZWQuCj4+Cj4+IElmIHdlIGRvbid0IGVtdWxhdGUsIHdlIHdvdWxkIHJlY2VpdmUgdGhl
IHBhZ2Utd2Fsay1nZW5lcmF0ZWQgZXZlbnRzCj4+IF9hbmRfIHRoZSB0b3VjaGluZy10aGUtcGFn
ZS10aGUtaW5zdHJ1Y3Rpb24taXMtdG91Y2hpbmcgZXZlbnRzLgo+IAo+IFNpbmNlIHRoZSBwYXRj
aCBoZXJlIGFsdGVycyBlbXVsYXRpb24gcGF0aHMgb25seSwgaG93IGRvIHlvdSBrbm93Cj4gd2hl
dGhlciB0byBlbXVsYXRlPyBJbiBvcmRlciB0byBub3QgcmVjZWl2ZSB1bmR1ZSBldmVudHMgaXQg
d291bGQKPiBzZWVtIHRvIG1lIHRoYXQgeW91J2QgZmlyc3QgaGF2ZSB0byBpbnRlcmNlcHQgdGhl
IGd1ZXN0IG9uIGluc25zCj4gb2YgaW50ZXJlc3QgLi4uIE92ZXJhbGwgSSB0aGluayB0aGF0IHRo
ZSBwYXRjaCBkZXNjcmlwdGlvbiwgd2hpbGUKPiBpdCBoYXMgaW1wcm92ZWQsIGlzIHN0aWxsIGxh
Y2tpbmcgc3VmZmljaWVudCBpbmZvcm1hdGlvbiBmb3IgYQo+IHBlcnNvbiBsaWtlIG1lIChub3Qg
a25vd2luZyBtdWNoIGFib3V0IHlvdXIgbW9uaXRvciB0b29scykgdG8gYmUKPiBhYmxlIHRvIHNl
bnNpYmx5IHJldmlldyB0aGlzICh3aGljaCBpbmNsdWRlcyB1bmRlcnN0YW5kaW5nIHRoZQo+IHBy
ZWNpc2Ugc2NlbmFyaW8geW91IHdhbnQgdG8gaW1wcm92ZSkuCgpJZiB0aGUgaGFyZHdhcmUgZXhp
dHMgYmVjYXVzZSBvZiBhbiBFUFQgZmF1bHQgY2F1c2VkIGJ5IGEgcGFnZSB3YWxrLCB3ZSAKZW5k
IHVwIGluIHAybV9tZW1fYWNjZXNzX2NoZWNrKCksIGF0IHdoaWNoIHBvaW50IHdlIG5lZWQgdG8g
ZGVjaWRlIGlmIHdlIAp3YW50IHRvIHNlbmQgb3V0IGEgdm1fZXZlbnQgb3Igbm90LgoKSWYgd2Ug
d2VyZSB0byBzZW5kIG91dCB0aGlzIHZtX2V2ZW50LCBhbmQgaXQgd291bGQgdGhlbiBiZSBtYWdp
Y2FsbHkgCnRyZWF0ZWQgc28gdGhhdCB3ZSBnZXQgdG8gYWN0dWFsbHkgcnVuIHRoZSBpbnN0cnVj
dGlvbiBhdCBSSVAsIHNhaWQgCmluc3RydWN0aW9uIG1pZ2h0IGFsc28gaGl0IGEgcHJvdGVjdGVk
IHBhZ2UgYW5kIHByb3Zva2UgYSB2bV9ldmVudC4KCk5vdywgaWYgbnBmZWMua2luZCAhPSBucGZl
Y19raW5kX3dpdGhfZ2xhLCB0aGVuIHdlJ3JlIGluIHRoZSBwYWdlIHdhbGsgCmNhc2UsIGFuZCBz
byBpbiB0aGlzIGNhc2Ugb25seSwgYW5kIG9ubHkgaWYgCmQtPmFyY2gubW9uaXRvci5pbmd1ZXN0
X3BhZ2VmYXVsdF9kaXNhYmxlZCBpcyB0cnVlLCB3ZSB3b3VsZCBjaG9vc2UgdG8gCmRvIHRoaXMg
ZW11bGF0aW9uIHRyaWNrOiBlbXVsYXRlIF90aGVfcGFnZV93YWxrXyB3aGlsZSBpZ25vcmluZyB0
aGUgRVBULCAKYnV0IGRvbid0IGlnbm9yZSB0aGUgRVBUIGZvciB0aGUgZW11bGF0aW9uIG9mIHRo
ZSBhY3R1YWwgaW5zdHJ1Y3Rpb24uCgpTbyB3aGVyZSBpbiB0aGUgZmlyc3QgY2FzZSB3ZSB3b3Vs
ZCBoYXZlIDIgRVBUIGV2ZW50cywgaW4gdGhlIHNlY29uZCB3ZSAKb25seSBoYXZlIG9uZSAob3Ig
aWYgdGhlIGluc3RydWN0aW9uIGF0IFJJUCBkb2VzIG5vdCB0cmlnZ2VyIGFuIEVQVCAKZXZlbnQs
IHdlIHdvdWxkIGhhdmUgMSBldmVudCBpbiB0aGUgZmlyc3QgY2FzZSwgYW5kIG5vbmUgaW4gdGhl
IHNlY29uZCkuCkhlbmNlIHRoZSBmaWx0ZXJpbmcgbWVudGlvbmVkLgoKU28gdG8gYW5zd2VyIHlv
dXIgcXVlc3Rpb246ICJob3cgZG8geW91IGtub3cgd2hldGhlciB0byBlbXVsYXRlIiwgd2UgZG8g
CnNvIG9ubHkgaWYgbnBmZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhfZ2xhICYmIApkLT5hcmNo
Lm1vbml0b3IuaW5ndWVzdF9wYWdlZmF1bHRfZGlzYWJsZWQuCgpJIGhvcGUgdGhpcyBjbGVhcnMg
aXQgdXAgc29tZXdoYXQuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
