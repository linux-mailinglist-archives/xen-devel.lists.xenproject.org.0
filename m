Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F0B7B79
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 16:03:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAwyM-00070S-2L; Thu, 19 Sep 2019 13:59:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAwyL-00070I-4U
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 13:59:49 +0000
X-Inumbo-ID: ba8ab7fc-dae5-11e9-9660-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba8ab7fc-dae5-11e9-9660-12813bfff9fa;
 Thu, 19 Sep 2019 13:59:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ACD12ACEC;
 Thu, 19 Sep 2019 13:59:41 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190919130338.3132-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03e3bb4f-e6da-b5a5-d337-4e91215dc2fe@suse.com>
Date: Thu, 19 Sep 2019 15:59:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190919130338.3132-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDkuMjAxOSAxNTowMywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQEAg
LTYwMSw2ICs2MDIsNyBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoCj4g
IAo+ICAgICAgICAgIGNhc2UgSFZNVFJBTlNfZ2ZuX3BhZ2VkX291dDoKPiAgICAgICAgICBjYXNl
IEhWTVRSQU5TX2dmbl9zaGFyZWQ6Cj4gKyAgICAgICAgY2FzZSBIVk1UUkFOU19iYWRfZ2ZuX2Fj
Y2VzczoKPiAgICAgICAgICAgICAgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7Cj4gICAg
ICAgICAgICAgIGdvdG8gb3V0OwoKVGhpcyBsb29rcyBwcmV0dHkgc3VzcGljaW91cyBub3cgLSB3
aHkgd291bGQgKHdpdGhvdXQga25vd2luZyBhbGwKdGhlIGJhY2tncm91bmQpICJiYWQgYWNjZXNz
IiB0cmFuc2xhdGUgaW50byAicmV0cnkiLiBXaGlsZSB5b3UgZGlkCnBvc3QgdGhlIHN1Z2dlc3Rl
ZCBuYW1lIGJlZm9yZSwgaXQncyBuZXZlcnRoZWxlc3MgcHJldHR5IGNsZWFyIG5vdwp0aGF0IGl0
IG5lZWRzIGNoYW5naW5nLiBQZXJoYXBzIEhWTVRSQU5TX25lZWRfcmV0cnkgb3Igc29tZSBzdWNo
PwoKPiBAQCAtMTg1Miw2ICsxODY0LDggQEAgc3RhdGljIGludCBodm1lbXVsX3JlcF9tb3ZzKAo+
ICAKPiAgICAgIHhmcmVlKGJ1Zik7Cj4gIAo+ICsgICAgQVNTRVJUKHJjICE9IEhWTVRSQU5TX2Jh
ZF9nZm5fYWNjZXNzKTsKPiArCj4gICAgICBpZiAoIHJjID09IEhWTVRSQU5TX2dmbl9wYWdlZF9v
dXQgKQo+ICAgICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOwo+ICAgICAgaWYgKCByYyA9PSBI
Vk1UUkFOU19nZm5fc2hhcmVkICkKPiBAQCAtMTk2NCw2ICsxOTc4LDggQEAgc3RhdGljIGludCBo
dm1lbXVsX3JlcF9zdG9zKAo+ICAgICAgICAgIGlmICggYnVmICE9IHBfZGF0YSApCj4gICAgICAg
ICAgICAgIHhmcmVlKGJ1Zik7Cj4gIAo+ICsgICAgICAgIEFTU0VSVChyYyAhPSBIVk1UUkFOU19i
YWRfZ2ZuX2FjY2Vzcyk7Cj4gKwo+ICAgICAgICAgIHN3aXRjaCAoIHJjICkKPiAgICAgICAgICB7
Cj4gICAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRfb3V0OgoKVGhlc2UgYXJlIGNoYW5n
ZXMgdG8gcGxhY2VzIHRoYXQgd2VyZSBwb2ludGVkIG91dCBiZWZvcmUgZG8gY29uc3VtZQpIVk1U
UkFOU18qIHJldHVybiB2YWx1ZXMuIERpZCB5b3UgZ28gdGhyb3VnaCBhbmQgY2hlY2sgbm90aGlu
ZyBlbHNlCm5lZWRzIGFkanVzdG1lbnQ/IFlvdSBkb24ndCBzYXkgYW55dGhpbmcgaW4gdGhpcyBy
ZWdhcmQgaW4gdGhlCmRlc2NyaXB0aW9uLiBGb3IgZXhhbXBsZSwgaWYgc2hhZG93J3MgaHZtX3Jl
YWQoKSB3b3VsZCBnZXQgdG8gc2VlCnRoZSBuZXcgdmFsdWUsIGl0IHdvdWxkIGZhbGwgb3V0IG9m
IGl0cyBzd2l0Y2goKSBpbnRvIGEgQlVHKCkuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZt
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gQEAgLTMyMzYsNiArMzIzNiwxOSBA
QCBzdGF0aWMgZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHkoCj4gICAgICAg
ICAgICAgIHJldHVybiBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjsKPiAgICAgICAgICB9Cj4gIAo+
ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogSW4gY2FzZSBhIHZtIGV2ZW50IHdhcyBzZW50IHJl
dHVybiBwYWdlZF9vdXQgc28gdGhlIGVtdWxhdGlvbiB3aWxsCj4gKyAgICAgICAgICogc3RvcCB3
aXRoIG5vIHNpZGUgZWZmZWN0Cj4gKyAgICAgICAgICovCj4gKyAgICAgICAgaWYgKCAoZmxhZ3Mg
JiBIVk1DT1BZX2xpbmVhcikgJiYKPiArICAgICAgICAgICAgIHVubGlrZWx5KHYtPmFyY2gudm1f
ZXZlbnQpICYmCj4gKyAgICAgICAgICAgICB2LT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50ICYm
Cj4gKyAgICAgICAgICAgICBodm1fbW9uaXRvcl9jaGVja19wMm0oYWRkciwgZ2ZuLCBwZmVjLCBu
cGZlY19raW5kX3dpdGhfZ2xhKSApCgpJbiBzdWNoIGEgc2VxdWVuY2Ugb2YgY2hlY2tzIHdpdGgg
X3NvbWVfIHBhcnQgdXNpbmcgdW5saWtlbHkoKSBJCnRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0
byBoYXZlIHRoZSB1bmxpa2VseSgpIG9uZSBmaXJzdCAodW5sZXNzCml0J3MgYSByZWxhdGl2ZWx5
IGV4cGVuc2l2ZSBjaGVjaywgd2hpY2ggaXNuJ3QgdGhlIGNhc2UgaGVyZSksIHRvCmhhdmUgYXMg
bGl0dGxlIGFzIHBvc3NpYmxlIHVubmVjZXNzYXJ5IGNvbXB1dGF0aW9ucyAvIGJyYW5jaGVzIGlu
CnRoZSBjb21tb24gKGZhc3QgcGF0aCkgY2FzZS4KCkZ1cnRoZXJtb3JlIHdoaWxlIHlvdSBub3cg
cmVzdHJpY3QgdGhlIGNoZWNrIHRvIGxpbmVhciBhZGRyZXNzCmJhc2VkIGFjY2Vzc2VzLCBvdGhl
ciB0aGFuIHRoZSBkZXNjcmlwdGlvbiBzYXlzIChvciBhdCBsZWFzdAppbXBsaWVzKSB5b3UgZG8g
bm90IHJlc3RyaWN0IGl0IHRvIHJlYWQgYW5kIGV4ZWMgYWNjZXNzZXMuIEl0J3MKbm90IGNsZWFy
IHRvIG1lIHdoZXRoZXIgdGhhdCdzIGludGVudGlvbmFsLCB5ZXQgaXQgYWZmZWN0cyB3aGljaApo
dm1fY29weV8qX2xpbmVhcigpIGNhbGxlcnMgbmVlZCBhdWRpdGluZy4KCkZpbmFsbHksIHdoYXQg
YWJvdXQgLT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50IHJlbWFpbmluZyBzZXQKYWZ0ZXIgaHZt
X2VtdWxhdGVfb25lX3ZtX2V2ZW50KCksIGJlY2F1c2UgaHZtX21vbml0b3JfY2hlY2tfcDJtKCkK
KHRoZSBvbmx5IHBsYWNlIHdoZXJlIHRoZSBmbGFnIHdvdWxkIGdldCBjbGVhcmVkKSB3YXMgbmV2
ZXIgaGl0CmluIHRoZSBwcm9jZXNzPyBBbmQgd2hhdCBhYm91dCBhbiBpbnN0cnVjdGlvbiBhY2Nl
c3NpbmcgdHdvIChvcgptb3JlKSBkaXN0aW5jdCBhZGRyZXNzZXM/IFRoZSBmbGFnIHdvdWxkIGJl
IGNsZWFyIGFmdGVyIHRoZSBmaXJzdApvbmUgd2FzIGNoZWNrZWQgYWZhaWN0LgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
