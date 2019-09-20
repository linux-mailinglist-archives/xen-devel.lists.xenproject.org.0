Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A328B93E7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 17:23:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBKhU-0000UD-Q6; Fri, 20 Sep 2019 15:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBKhT-0000U8-Hl
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 15:19:59 +0000
X-Inumbo-ID: 1b25cc44-dbba-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b25cc44-dbba-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 15:19:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1083FB652;
 Fri, 20 Sep 2019 15:19:57 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190920121636.2573-1-aisaila@bitdefender.com>
 <8ea5be2f-289f-a291-074a-63f731f2de57@suse.com>
 <a2beaebb-d1ef-9267-0167-65c62b5ab190@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87157d30-1f99-9fb7-72d0-537d331f7ba1@suse.com>
Date: Fri, 20 Sep 2019 17:20:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a2beaebb-d1ef-9267-0167-65c62b5ab190@bitdefender.com>
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
Cc: PetreOvidiu PIRCALABU <ppircalabu@bitdefender.com>,
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

T24gMjAuMDkuMjAxOSAxNjo1OSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMjAuMDkuMjAxOSAxNzoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIwLjA5LjIw
MTkgMTQ6MTYsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gSW4gb3JkZXIgdG8g
aGF2ZSBfX2h2bV9jb3B5KCkgaXNzdWUgflg4NkVNVUxfUkVUUlkgYSBuZXcgcmV0dXJuIHR5cGUs
Cj4+PiBIVk1UUkFOU19uZWVkX3JldHJ5LCB3YXMgYWRkZWQgYW5kIGFsbCB0aGUgcGxhY2VzIHRo
YXQgY29uc3VtZSBIVk1UUkFOUyoKPj4+IGFuZCBuZWVkZWQgYWRqdXN0bWVudCB3aGVyZSBjaGFu
Z2VkIGFjY29yZGluZ2x5Lgo+Pgo+PiBUaGlzIGlzIHdyb25nIGFuZCBoZW5jZSBjb25mdXNpbmc6
IF9faHZtX2NvcHkoKSB3b3VsZCBuZXZlciByZXR1cm4KPj4gflg4NkVNVUxfUkVUUlkuIEluIGZh
Y3QgSSB0aGluayB5b3UndmUgY29uZnVzZWQgeW91cnNlbGYgZW5vdWdoIHRvCj4+IG1ha2UgYSBx
dWVzdGlvbmFibGUgKHBvc3NpYmx5IHJlc3VsdGluZykgY2hhbmdlOgo+IAo+IFRoZSBpZGVhIHdh
cyB0byBnZXQgWDg2RU1VTF9SRVRSWSBkb3duIHRoZSBsaW5lIGZyb20gX19odm1fY29weSgpLgo+
IEkgd2lsbCBhZGp1c3QgdGhpcy4KPiAKPj4KPj4+IEBAIC01ODIsNyArNTgzLDcgQEAgc3RhdGlj
IHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKAo+Pj4gICAgICAgICAgIEFTU0VSVChtZm5f
eCgqbWZuKSA9PSAwKTsKPj4+ICAgCj4+PiAgICAgICAgICAgcmVzID0gaHZtX3RyYW5zbGF0ZV9n
ZXRfcGFnZShjdXJyLCBhZGRyLCB0cnVlLCBwZmVjLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmcGZpbmZvLCAmcGFnZSwgTlVMTCwgJnAybXQpOwo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcGZpbmZvLCAmcGFnZSwgJmdmbiwgJnAy
bXQpOwo+Pgo+PiBUaGlzIGZ1bmN0aW9uIC4uLgo+Pgo+Pj4gICAgICAgICAgIHN3aXRjaCAoIHJl
cyApCj4+PiAgICAgICAgICAgewo+Pj4gQEAgLTYwMSw2ICs2MDIsNyBAQCBzdGF0aWMgdm9pZCAq
aHZtZW11bF9tYXBfbGluZWFyX2FkZHIoCj4+PiAgIAo+Pj4gICAgICAgICAgIGNhc2UgSFZNVFJB
TlNfZ2ZuX3BhZ2VkX291dDoKPj4+ICAgICAgICAgICBjYXNlIEhWTVRSQU5TX2dmbl9zaGFyZWQ6
Cj4+PiArICAgICAgICBjYXNlIEhWTVRSQU5TX25lZWRfcmV0cnk6Cj4+Cj4+IC4uLiBjYW4ndCBy
ZXR1cm4gdGhpcyB2YWx1ZSwgc28geW91IHNob3VsZCBvbWl0IHRoaXMgYWRkaXRpb24sCj4+IGxl
dHRpbmcgdGhlIG5ldyByZXR1cm4gdmFsdWUgZ28gdGhyb3VnaCAiZGVmYXVsdDoiLgo+IAo+IEl0
IGlzIHZlcnkgY2xlYXIgdGhhdCBIVk1UUkFOU19uZWVkX3JldHJ5IHdpbGwgbm90IGJlIHJldHVy
bmVkIGZvcm0gdGhhdCAKPiBmdW5jdGlvbi4gQXQgbGVhc3QgZm9yIG5vdy4gSSB0aG91Z2h0IHlv
dSB3YW50ZWQgdG8gaGF2ZSBldmVyeSBwb3NzaWJsZSAKPiBjYXNlIGNvdmVyZWQgaW4gdGhlIHN3
aXRjaC4gSSBjYW4gcmVtb3ZlIHRoYXQgY2FzZSwgdGhlcmUgaXMgbm90IHByb2JsZW0gCj4gaGVy
ZSBiZWNhdXNlLCBsaWtlIEkndmUgc2FpZCwgaXQgd2lsbCBuZXZlciBlbnRlciB0aGF0IGNhc2Uu
Cj4gCj4gQnV0IGFzIHlvdSBzYWlkIGxhdGVyIHdvcmsgd2l0aCBIVk1UUkFOU19uZWVkX3JldHJ5
IHdpbGwgcmVzdWx0IGluIAo+IHJldHVybmluZyBYODZFTVVMX1JFVFJZLiBBbnkgd2F5IGl0J3Mg
eW91ciBjYWxsIGlmIEkgc2hvdWxkIHJlbW92ZSBpdCBvciAKPiBub3QuCgpUaGUgcmVzdWx0IHNo
b3VsZCBiZSBjb25zaXN0ZW50IChpLmUuIGJldHdlZW4gdGhlIGNhc2UgaGVyZQphbmQgdGhlIHJl
cF9tb3ZzIC8gcmVwX3N0b3MgY2FzZXMgYmVsb3cpLiBPdmVyYWxsIEkgdGhpbmsgaXQKd291bGQg
YmUgY2xlYW5lc3QgaWYgaW4gYWxsIHRocmVlIGNhc2VzIGFuIEFTU0VSVF9VTlJFQUNIQUJMRSgp
CmZlbGwgdGhyb3VnaCB0byBhICJyZXR1cm4gWDg2RU1VTF9SRVRSWTsiLgoKPj4+IEBAIC0xODUy
LDYgKzE4NjQsOCBAQCBzdGF0aWMgaW50IGh2bWVtdWxfcmVwX21vdnMoCj4+PiAgIAo+Pj4gICAg
ICAgeGZyZWUoYnVmKTsKPj4+ICAgCj4+PiArICAgIEFTU0VSVChyYyAhPSBIVk1UUkFOU19uZWVk
X3JldHJ5KTsKPj4+ICsKPj4+ICAgICAgIGlmICggcmMgPT0gSFZNVFJBTlNfZ2ZuX3BhZ2VkX291
dCApCj4+PiAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfUkVUUlk7Cj4+PiAgICAgICBpZiAoIHJj
ID09IEhWTVRSQU5TX2dmbl9zaGFyZWQgKQo+Pj4gQEAgLTE5NjQsNiArMTk3OCw4IEBAIHN0YXRp
YyBpbnQgaHZtZW11bF9yZXBfc3RvcygKPj4+ICAgICAgICAgICBpZiAoIGJ1ZiAhPSBwX2RhdGEg
KQo+Pj4gICAgICAgICAgICAgICB4ZnJlZShidWYpOwo+Pj4gICAKPj4+ICsgICAgICAgIEFTU0VS
VChyYyAhPSBIVk1UUkFOU19uZWVkX3JldHJ5KTsKPj4+ICsKPj4+ICAgICAgICAgICBzd2l0Y2gg
KCByYyApCj4+PiAgICAgICAgICAgewo+Pj4gICAgICAgICAgIGNhc2UgSFZNVFJBTlNfZ2ZuX3Bh
Z2VkX291dDoKPj4KPj4gTG9va2luZyBhdCB0aGlzIGFnYWluLCBJIHRoaW5rIGl0IHdvdWxkIGJl
dHRlciBiZSBhbiBhZGRpdGlvbiB0bwo+PiB0aGUgc3dpdGNoKCkgKHVzaW5nIEFTU0VSVF9VTlJF
QUNIQUJMRSgpKS4gR2VuZXJhbGx5IHRoaXMgaXMKPj4gdHJ1ZSBmb3IgdGhlIHJlcF9tb3ZzIGNh
c2UgYXMgd2VsbCwgYnV0IHRoYXQgb25lIHdvdWxkIGZpcnN0Cj4+IG5lZWQgY29udmVydGluZyB0
byBzd2l0Y2goKSwgd2hpY2ggSSBhZ3JlZSBpcyBiZXlvbmQgdGhlIHNjb3BlCj4gCj4gSSBhZ3Jl
ZSB0aGF0IHRoaXMgaXMgYmV5b25kIHRoZSBzY29wZSBvZiB0aGlzIHBhdGNoIGJ1dCBpdCdzIG5v
dCB0aGF0IAo+IGJpZyBvZiBhIGNoYW5nZSBhbmQgaXQgY2FuIGJlIGRvbmUuCj4gCj4gQnV0IGlz
bid0IGhhdmluZyBhIGRlZmF1bHQgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IGluIGJvdGggc3dpdGNo
IGNhc2VzIAo+IGNoYW5nZSB0aGUgYmVoYXZpb3Igb2YgdGhlIGZ1bmN0aW9uPwoKSXQgc2hvdWxk
bid0IGJlIHRoZSBkZWZhdWx0IGNhc2UgdGhhdCBnYWlucyB0aGlzIGFzc2VydGlvbiwKYnV0IHRo
ZSBIVk1UUkFOU19uZWVkX3JldHJ5IG9uZSB0aGF0IGlzIHRvIGJlIGFkZGVkLgoKPj4gb2YgdGhp
cyBjaGFuZ2UuIEluIGJvdGggY2FzZXMgYSBicmllZiBjb21tZW50IHdvdWxkIHNlZW0KPj4gd29y
dGh3aGlsZSBhZGRpbmcsIGNsYXJpZnlpbmcgdGhhdCB0aGUgbmV3IHJldHVybiB2YWx1ZSBjYW4K
Pj4gcmVzdWx0IGZyb20gaHZtX2NvcHlfKl9ndWVzdF9saW5lYXIoKSBvbmx5LiBUaGlzIG1pZ2h0
IGJlY29tZQo+PiByZWxldmFudCBpbiBwYXJ0aWN1bGFyIGlmLCBkb3duIHRoZSByb2FkLCB3ZSBp
bnZlbnQgbW9yZSBjYXNlcwo+PiB3aGVyZSBIVk1UUkFOU19uZWVkX3JldHJ5IGlzIHByb2R1Y2Vk
Lgo+IAo+IElzIHRoaXMgY29tbWVudCBhaW1lZCBmb3IgdGhlIGNvbW1pdCBtZXNzYWdlIG9yIGFu
b3RoZXIgcGxhY2U/CgpJZiB5b3UgZ28gdGhlIEFTU0VSVF9VTlJFQUNIQUJMRSgpIHJvdXRlLCB0
aGVuIHRoZSBjb21tZW50KHMpCnNob3VsZCBiZSBjb2RlIGNvbW1lbnRzIG5leHQgdG8gdGhlc2Ug
YXNzZXJ0aW9ucy4gVGhleSdkIGJlCnRoZXJlIHRvIGF2b2lkIHBlb3BsZSBoYXZpbmcgdG8gZGln
IG91dCB0aGUgcmVhc29uIGZvciB3aHkKdGhleSdyZSB0aGVyZSwgdG8gbWFrZSBpdCBlYXN5IHRv
IGRlY2lkZSB3aGV0aGVyIGl0IGlzIHNhZmUgdG8KZHJvcCB0aGVtIG9uY2Ugc29tZSBuZXcgcHJv
ZHVjZXIgb2YgSFZNVFJBTlNfbmVlZF9yZXRyeSB3b3VsZAphcHBlYXIuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
