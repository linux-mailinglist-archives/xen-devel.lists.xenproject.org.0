Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD99AD571
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 11:13:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7FfP-0003dl-6f; Mon, 09 Sep 2019 09:08:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7FfN-0003dg-Rx
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 09:08:57 +0000
X-Inumbo-ID: 737a4442-d2e1-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 737a4442-d2e1-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 09:08:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67757AE12;
 Mon,  9 Sep 2019 09:08:55 +0000 (UTC)
To: Daniel Smith <dpsmith.dev@gmail.com>
References: <CADAP9AWJ46Oh=b-1K1hTNnkD=0DTYtYGX4L7VQp51QBaQCeYNw@mail.gmail.com>
 <2e2293bc-4187-3fe8-52d6-96f709ae4c3c@suse.com>
 <CADAP9AVJqfBGNBQVE-4ztA7Tjdwf0Y9GC-P=jwkx8sTM98BzVw@mail.gmail.com>
 <CADAP9AUFVXMBLVkROPTWE_ox5CnvDRC6rdv2Mam=wDn7+TedcA@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <48d9fcf2-ee8b-b551-bb73-5d79c7fb4c0b@suse.com>
Date: Mon, 9 Sep 2019 11:08:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADAP9AUFVXMBLVkROPTWE_ox5CnvDRC6rdv2Mam=wDn7+TedcA@mail.gmail.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Running xenstored in Linux stubdom
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDkuMTkgMjA6MDEsIERhbmllbCBTbWl0aCB3cm90ZToKPiBPbiBXZWQsIFNlcCA0LCAy
MDE5IGF0IDE6MjYgUE0gRGFuaWVsIFNtaXRoIDxkcHNtaXRoLmRldkBnbWFpbC5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDEyOjEyIFBNIEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gVGhlIHN0dWJkb20gZ2V0cyBhbiBldmVudCBj
aGFubmVsIHRvIHVzZSBmb3IgZG9tMCB4ZW5ic3RvcmUgY29ubmVjdGlvbgo+Pj4gdmlhIGNvbW1h
bmRsaW5lIHBhcmFtZXRlciAoIi0tZXZlbnQgPGV2ZW50LW5yPiIpLiBUaGlzIG5lZWRzIHRvIGJl
IHVzZWQKPj4+IGluIHRoZSBzdHViZG9tIGZvciBzZXR0aW5nIHVwIHRoZSBjb21tdW5pY2F0aW9u
IHBhdGguCj4+Pgo+Pj4KPj4+IEp1ZXJnZW4KPj4KPj4gSGkgSnVlcmdlbiwKPj4KPj4gVGhhbmtz
IGZvciB0aGUgcXVpY2sgcmVzcG9uc2UhIHRyYWNpbmcgdGhyb3VnaCB4ZW5zdG9yZWQsIGxvb2tz
IGxpa2UKPj4gdGhhdCBmbGFnIHNldHMgdGhlIHZhcmlhYmxlIGRvbTBfZXZlbnQgd2hpY2ggaXMg
b25seSB1c2VkIGluIHRoZQo+PiB4ZW5zdG9yZWRfbWluaW9zLmMgYXMgdGhlIHJldHVybiB2YWx1
ZSB0byB0aGUgeGVuYnVzX2V2dGNobigpIGNhbGwuIEkKPj4gY291bGQgbmFpdmVseSBzaG9ydCBj
aXJjdWl0IHhlbmJ1c19ldnRjaG4oKSB1bmRlciB4ZW5zdG9yZWRfcG9zaXguYyB0bwo+PiByZXR1
cm4gaW1tZWRpYXRlbHkgaWYgZG9tMF9ldmVudCBoYXMgYmVlbiBzZXQuIElmIHRoYXQgd29ya3Ms
IEkgd291bGQKPj4gYmUgZ2xhZCB0byBzdWJtaXQgaXQgYmFjayB1cHN0cmVhbSBpZiB0aGVyZSBp
cyBpbnRlcmVzdCBpbgo+PiBpbmNvcnBvcmF0aW5nIGl0Lgo+IAo+IEhpIGFnYWluLAo+IAo+IEkg
bWFkZSB0aGUgY2hhbmdlIHRvIHNob3J0IGNpcmN1aXQgdGhlIHhlbmJ1c19ldnRjaG4gYW5kIGRp
ZCB0ZXN0aW5nCj4gYXMgYSBndWVzdCBkb21haW4gYXBwcm9hY2ggdG8gY29uZmlybSB0aGF0IGkg
d2FzIHBhcnNpbmcgdGhlCj4gcGFyYW1ldGVycyBjb3JyZWN0bHkgaW4gaW5pdHJhbWZzIHNjcmlw
dCB0aGF0IGluaXQteGVuc3RvcmUtaGVscGVyCj4gcGFzc2VkLiBJIGFtIHN0aWxsIGl0IGhhbmdp
bmcgYWZ0ZXIgdGhlIGF0dGVtcHQgdG8gd3JpdGUKPiAvdG9vbC94ZW5zdG9yZWQvZG9taWQuIEF0
IHRoaXMgcG9pbnQgSSB3YXMgd29uZGVyaW5nIGlmIHRoZXJlIG1pZ2h0IGJlCj4gYSB3YXkgdG8g
Z2V0IGNvbnNvbGUgb3V0cHV0IGZyb20gdGhlIGRvbWFpbiB0byB0cnkgYW5kIHRyb3VibGVzaG9v
dCBpZgo+IHhlbnN0b3JlZCBpcyBnZXR0aW5nIHN0YXJ0ZWQgd2hlbiBhY3R1YWxseSBydW5uaW5n
IGFzIHRoZSBhY3R1YWwKPiBzdHViZG9tIGluc3RlYWQgb2YgYXMgYSBndWVzdD8KCkkgdGhpbmsg
eW91IGFyZSBub3QgbWFwcGluZyBkb20wIHhlbmJ1cyBwYWdlLiBIYXZlIGEgbG9vayBhdAp4ZW5i
dXNfbWFwKCkgaW4geGVuc3RvcmVkX21pbmlvcy5jLiBZb3UgY291bGQgZG8gdGhlIGFsdGVybmF0
aXZlCmhhbmRsaW5nIGRlcGVuZGluZyBvbiB0aGUgLS1ldmVudCBwYXJhbWV0ZXIgc3BlY2lmaWVk
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
