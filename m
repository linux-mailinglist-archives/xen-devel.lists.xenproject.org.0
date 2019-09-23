Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B933BBB5B5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:47:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOdH-0002ez-2g; Mon, 23 Sep 2019 13:44:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCOdF-0002eg-I4
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:44:01 +0000
X-Inumbo-ID: 32aeb1b5-de08-11e9-95fe-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32aeb1b5-de08-11e9-95fe-12813bfff9fa;
 Mon, 23 Sep 2019 13:44:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4047AF5B;
 Mon, 23 Sep 2019 13:43:59 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190923120539.25242-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec3b6788-a354-f0bf-0d62-0f7a116bc435@suse.com>
Date: Mon, 23 Sep 2019 15:43:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923120539.25242-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v13] x86/emulate: Send vm_event from emulate
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

T24gMjMuMDkuMjAxOSAxNDowNSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQEAg
LTU5OSw4ICs2MDAsMTUgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKAo+
ICAgICAgICAgICAgICBlcnIgPSBOVUxMOwo+ICAgICAgICAgICAgICBnb3RvIG91dDsKPiAgCj4g
LSAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRfb3V0Ogo+ICsgICAgICAgIGNhc2UgSFZN
VFJBTlNfbmVlZF9yZXRyeToKPiArICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICogaHZt
X3RyYW5zbGF0ZV9nZXRfcGFnZSgpIGRvZXMgbm90IHJldHVybiBIVk1UUkFOU19uZWVkX3JldHJ5
Lgo+ICsgICAgICAgICAgICAgKiBJdCBjYW4gZHJvcHBlZCBpZiBmdXR1cmUgd29yayByZXF1aXJl
cyB0aGlzLgo+ICsgICAgICAgICAgICAgKi8KClRvIG1lLCAiaXQiIGluIHRoaXMgY29tbWVudCBj
YW4gb25seSByZWZlciB0byBzb21ldGhpbmcgbWVudGlvbmVkIGluCnRoZSBwcmlvciBzZW50ZW5j
ZS4gQnV0IHRvIGJlIGhvbmVzdCBJJ2QgZHJvcCB0aGUgMm5kIHNlbnRlbmNlCmFsdG9nZXRoZXIs
IGFkZGluZyAiY3VycmVudGx5IiB0byB0aGUgMXN0IG9uZS4gKFNhbWUgZnVydGhlciBkb3duCnRo
ZW4uKQoKPiArICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gKyAgICAgICAgICAg
IC8qIGZhbGwgdGhyb3VnaCAqLwo+ICAgICAgICAgIGNhc2UgSFZNVFJBTlNfZ2ZuX3NoYXJlZDoK
PiArICAgICAgICBjYXNlIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ6Cj4gICAgICAgICAgICAgIGVy
ciA9IEVSUl9QVFIoflg4NkVNVUxfUkVUUlkpOwo+ICAgICAgICAgICAgICBnb3RvIG91dDsKCkl0
IGFsc28gZXNjYXBlcyBtZSB3aHkgeW91IGZlbHQgbGlrZSBtb3ZpbmcgdGhlCiJjYXNlIEhWTVRS
QU5TX2dmbl9wYWdlZF9vdXQ6IiBsaW5lLgoKPiBAQCAtMTg1MiwxOSArMTg3MCwyNyBAQCBzdGF0
aWMgaW50IGh2bWVtdWxfcmVwX21vdnMoCj4gIAo+ICAgICAgeGZyZWUoYnVmKTsKPiAgCj4gLSAg
ICBpZiAoIHJjID09IEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQgKQo+IC0gICAgICAgIHJldHVybiBY
ODZFTVVMX1JFVFJZOwo+IC0gICAgaWYgKCByYyA9PSBIVk1UUkFOU19nZm5fc2hhcmVkICkKPiAt
ICAgICAgICByZXR1cm4gWDg2RU1VTF9SRVRSWTsKPiAtICAgIGlmICggcmMgIT0gSFZNVFJBTlNf
b2theSApCj4gKyAgICBzd2l0Y2ggKCByYyApCj4gICAgICB7Cj4gLSAgICAgICAgZ2RwcmludGso
WEVOTE9HX1dBUk5JTkcsICJGYWlsZWQgbWVtb3J5LXRvLW1lbW9yeSBSRVAgTU9WUzogc2dwYT0l
Igo+IC0gICAgICAgICAgICAgICAgIFBSSXBhZGRyIiBkZ3BhPSUiUFJJcGFkZHIiIHJlcHM9JWx1
IGJ5dGVzX3Blcl9yZXA9JXVcbiIsCj4gLSAgICAgICAgICAgICAgICAgc2dwYSwgZGdwYSwgKnJl
cHMsIGJ5dGVzX3Blcl9yZXApOwo+IC0gICAgICAgIHJldHVybiBYODZFTVVMX1VOSEFORExFQUJM
RTsKPiArICAgIGNhc2UgSFZNVFJBTlNfbmVlZF9yZXRyeToKPiArICAgICAgICAvKgo+ICsgICAg
ICAgICAqIGh2bV9jb3B5X3RvX2d1ZXN0X3BoeXMoKSBkb2VzIG5vdCByZXR1cm4gSFZNVFJBTlNf
bmVlZF9yZXRyeS4KPiArICAgICAgICAgKiBJdCBjYW4gZHJvcHBlZCBpZiBmdXR1cmUgd29yayBy
ZXF1aXJlcyB0aGlzLgo+ICsgICAgICAgICAqLwoKVW5saWtlIGluIGl0cyByZXBfc3RvcyBjb3Vu
dGVycGFydCwgaGVyZSB0aGUgcmV0dXJuIHZhbHVlIG1heSBjb21lCmZyb20gaHZtX2NvcHlfZnJv
bV9ndWVzdF9waHlzKCkgb3IgaHZtX2NvcHlfdG9fZ3Vlc3RfcGh5cygpLCBhbmQgSQp0aGluayB0
aGUgY29tbWVudCBzaG91bGQgbm90IHNheSBvdGhlcndpc2UuCgpXaXRoIHRoZXNlIGNoYW5nZXMg
KHdoaWNoIGFyZSBvZiBlbm91Z2ggb2YgYSBjb3NtZXRpYyBuYXR1cmUgdGhhdAp0aGV5IGNvdWxk
IHByb2JhYmx5IGJlIHRha2VuIGNhcmUgb2Ygd2hpbGUgY29tbWl0dGluZywgcHJvdmlkZWQKeW91
IGFncmVlKSwgbm9uLW1vbml0b3Itc3BlY2lmaWMgcGFydHMKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
