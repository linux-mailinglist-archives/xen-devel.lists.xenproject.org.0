Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949BFB91C9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 16:25:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBJo6-0002VM-Pk; Fri, 20 Sep 2019 14:22:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBJo5-0002VC-RB
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 14:22:45 +0000
X-Inumbo-ID: 1c9c0154-dbb2-11e9-9591-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c9c0154-dbb2-11e9-9591-12813bfff9fa;
 Fri, 20 Sep 2019 14:22:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8106EAF68;
 Fri, 20 Sep 2019 14:22:43 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190920121636.2573-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ea5be2f-289f-a291-074a-63f731f2de57@suse.com>
Date: Fri, 20 Sep 2019 16:22:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920121636.2573-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v12] x86/emulate: Send vm_event from emulate
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

T24gMjAuMDkuMjAxOSAxNDoxNiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gSW4g
b3JkZXIgdG8gaGF2ZSBfX2h2bV9jb3B5KCkgaXNzdWUgflg4NkVNVUxfUkVUUlkgYSBuZXcgcmV0
dXJuIHR5cGUsCj4gSFZNVFJBTlNfbmVlZF9yZXRyeSwgd2FzIGFkZGVkIGFuZCBhbGwgdGhlIHBs
YWNlcyB0aGF0IGNvbnN1bWUgSFZNVFJBTlMqCj4gYW5kIG5lZWRlZCBhZGp1c3RtZW50IHdoZXJl
IGNoYW5nZWQgYWNjb3JkaW5nbHkuCgpUaGlzIGlzIHdyb25nIGFuZCBoZW5jZSBjb25mdXNpbmc6
IF9faHZtX2NvcHkoKSB3b3VsZCBuZXZlciByZXR1cm4Kflg4NkVNVUxfUkVUUlkuIEluIGZhY3Qg
SSB0aGluayB5b3UndmUgY29uZnVzZWQgeW91cnNlbGYgZW5vdWdoIHRvCm1ha2UgYSBxdWVzdGlv
bmFibGUgKHBvc3NpYmx5IHJlc3VsdGluZykgY2hhbmdlOgoKPiBAQCAtNTgyLDcgKzU4Myw3IEBA
IHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5lYXJfYWRkcigKPiAgICAgICAgICBBU1NFUlQo
bWZuX3goKm1mbikgPT0gMCk7Cj4gIAo+ICAgICAgICAgIHJlcyA9IGh2bV90cmFuc2xhdGVfZ2V0
X3BhZ2UoY3VyciwgYWRkciwgdHJ1ZSwgcGZlYywKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZwZmluZm8sICZwYWdlLCBOVUxMLCAmcDJtdCk7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmcGZpbmZvLCAmcGFnZSwgJmdmbiwgJnAybXQpOwoK
VGhpcyBmdW5jdGlvbiAuLi4KCj4gICAgICAgICAgc3dpdGNoICggcmVzICkKPiAgICAgICAgICB7
Cj4gQEAgLTYwMSw2ICs2MDIsNyBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGluZWFyX2Fk
ZHIoCj4gIAo+ICAgICAgICAgIGNhc2UgSFZNVFJBTlNfZ2ZuX3BhZ2VkX291dDoKPiAgICAgICAg
ICBjYXNlIEhWTVRSQU5TX2dmbl9zaGFyZWQ6Cj4gKyAgICAgICAgY2FzZSBIVk1UUkFOU19uZWVk
X3JldHJ5OgoKLi4uIGNhbid0IHJldHVybiB0aGlzIHZhbHVlLCBzbyB5b3Ugc2hvdWxkIG9taXQg
dGhpcyBhZGRpdGlvbiwKbGV0dGluZyB0aGUgbmV3IHJldHVybiB2YWx1ZSBnbyB0aHJvdWdoICJk
ZWZhdWx0OiIuCgo+IEBAIC0xODUyLDYgKzE4NjQsOCBAQCBzdGF0aWMgaW50IGh2bWVtdWxfcmVw
X21vdnMoCj4gIAo+ICAgICAgeGZyZWUoYnVmKTsKPiAgCj4gKyAgICBBU1NFUlQocmMgIT0gSFZN
VFJBTlNfbmVlZF9yZXRyeSk7Cj4gKwo+ICAgICAgaWYgKCByYyA9PSBIVk1UUkFOU19nZm5fcGFn
ZWRfb3V0ICkKPiAgICAgICAgICByZXR1cm4gWDg2RU1VTF9SRVRSWTsKPiAgICAgIGlmICggcmMg
PT0gSFZNVFJBTlNfZ2ZuX3NoYXJlZCApCj4gQEAgLTE5NjQsNiArMTk3OCw4IEBAIHN0YXRpYyBp
bnQgaHZtZW11bF9yZXBfc3RvcygKPiAgICAgICAgICBpZiAoIGJ1ZiAhPSBwX2RhdGEgKQo+ICAg
ICAgICAgICAgICB4ZnJlZShidWYpOwo+ICAKPiArICAgICAgICBBU1NFUlQocmMgIT0gSFZNVFJB
TlNfbmVlZF9yZXRyeSk7Cj4gKwo+ICAgICAgICAgIHN3aXRjaCAoIHJjICkKPiAgICAgICAgICB7
Cj4gICAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRfb3V0OgoKTG9va2luZyBhdCB0aGlz
IGFnYWluLCBJIHRoaW5rIGl0IHdvdWxkIGJldHRlciBiZSBhbiBhZGRpdGlvbiB0bwp0aGUgc3dp
dGNoKCkgKHVzaW5nIEFTU0VSVF9VTlJFQUNIQUJMRSgpKS4gR2VuZXJhbGx5IHRoaXMgaXMKdHJ1
ZSBmb3IgdGhlIHJlcF9tb3ZzIGNhc2UgYXMgd2VsbCwgYnV0IHRoYXQgb25lIHdvdWxkIGZpcnN0
Cm5lZWQgY29udmVydGluZyB0byBzd2l0Y2goKSwgd2hpY2ggSSBhZ3JlZSBpcyBiZXlvbmQgdGhl
IHNjb3BlCm9mIHRoaXMgY2hhbmdlLiBJbiBib3RoIGNhc2VzIGEgYnJpZWYgY29tbWVudCB3b3Vs
ZCBzZWVtCndvcnRod2hpbGUgYWRkaW5nLCBjbGFyaWZ5aW5nIHRoYXQgdGhlIG5ldyByZXR1cm4g
dmFsdWUgY2FuCnJlc3VsdCBmcm9tIGh2bV9jb3B5XypfZ3Vlc3RfbGluZWFyKCkgb25seS4gVGhp
cyBtaWdodCBiZWNvbWUKcmVsZXZhbnQgaW4gcGFydGljdWxhciBpZiwgZG93biB0aGUgcm9hZCwg
d2UgaW52ZW50IG1vcmUgY2FzZXMKd2hlcmUgSFZNVFJBTlNfbmVlZF9yZXRyeSBpcyBwcm9kdWNl
ZC4KClRoZW4gYWdhaW4gbWF5YmUgc3dpdGNoaW5nIHJlcF9tb3ZzIHRvIHN3aXRjaCgpIHdvdWxk
IHN0aWxsIGJlCmEgZ29vZCB0aGluZyB0byBkbyBoZXJlOiBEb24ndCB5b3UgYWdyZWUgdGhhdCBm
cm9tIGFuIGFic3RyYWN0CnBvdiBpbiBib3RoIGNhc2VzIGFib3ZlIFg4NkVNVUxfUkVUUlkgc2hv
dWxkIGJlIHByb2R1Y2VkLCBpZiBhdAphIGZ1dHVyZSBwb2ludCBwaHlzaWNhbCBhY2Nlc3NlcyBj
b3VsZCBhbHNvIHByb2R1Y2UKSFZNVFJBTlNfbmVlZF9yZXRyeT8gV2l0aCB0aGlzIHJldGFpbmlu
ZyB0aGUgYXNzZXJ0aW9ucyBpcwpjZXJ0YWlubHkgYW4gb3B0aW9uLCBidXQgSSB0aGluayB0aGUg
ZmFsbGJhY2sgcmV0dXJuIHZhbHVlIGZvcgp0aGlzIGNhc2Ugc2hvdWxkIHN0aWxsIGJlIFg4NkVN
VUxfUkVUUlkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
