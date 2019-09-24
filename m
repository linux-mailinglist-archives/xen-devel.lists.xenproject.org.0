Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4251ABCA32
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:27:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClkn-0007zp-9v; Tue, 24 Sep 2019 14:25:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iClkl-0007zk-4S
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:25:19 +0000
X-Inumbo-ID: 21a0d18e-ded7-11e9-961e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 21a0d18e-ded7-11e9-961e-12813bfff9fa;
 Tue, 24 Sep 2019 14:25:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CC713AE2D;
 Tue, 24 Sep 2019 14:25:16 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-30-jgross@suse.com>
 <c82b5b04-ff81-8600-d959-b3dcc90575a2@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <184451ad-4314-8887-651a-028b4b5844e5@suse.com>
Date: Tue, 24 Sep 2019 16:25:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c82b5b04-ff81-8600-d959-b3dcc90575a2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 29/47] xen/sched: introduce
 unit_runnable_state()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMTkgMTc6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRvZGF5IHRoZSB2Y3B1IHJ1bnN0YXRlIG9mIGEg
bmV3IHNjaGVkdWxlZCB2Y3B1IGlzIGFsd2F5cyBzZXQgdG8KPj4gInJ1bm5pbmciIGV2ZW4gaWYg
YXQgdGhhdCB0aW1lIHZjcHVfcnVubmFibGUoKSBpcyBhbHJlYWR5IHJldHVybmluZwo+PiBmYWxz
ZSBkdWUgdG8gYSByYWNlIChlLmcuIHdpdGggcGF1c2luZyB0aGUgdmNwdSkuCj4gCj4gSSBjYW4g
c2VlIHRoaXMgcGFydCwgLi4uCj4gCj4+IFdpdGggY29yZSBzY2hlZHVsaW5nIHRoaXMgY2FuIG5v
IGxvbmdlciB3b3JrIGFzIG5vdCBhbGwgdmNwdXMgb2YgYQo+PiBzY2hlZHVsZSB1bml0IGhhdmUg
dG8gYmUgInJ1bm5pbmciIHdoZW4gYmVpbmcgc2NoZWR1bGVkLiBTbyB0aGUgdmNwdSdzCj4+IG5l
dyBydW5zdGF0ZSBoYXMgdG8gYmUgc2VsZWN0ZWQgYXQgdGhlIHNhbWUgdGltZSBhcyB0aGUgcnVu
bmFiaWxpdHkgb2YKPj4gdGhlIHJlbGF0ZWQgc2NoZWR1bGUgdW5pdCBpcyBwcm9iZWQuCj4gCj4g
Li4uIGJ1dCBJIGNvbnRpbnVlIGhhdmluZyB0cm91YmxlIGhlcmUuIElmIGl0IGhhcyBiZWVuIG9r
YXkgdG8gc2V0Cj4gYSB2Q1BVIG5vIGxvbmdlciBydW5uYWJsZSB0byAicnVubmluZyIgbmV2ZXJ0
aGVsZXNzLCB3aHkgd291bGQgdGhlCj4gc2FtZSBub3QgYmUgdHJ1ZSBmb3Igc2NoZWR1bGUgdW5p
dHM/IFBhcnQgb2YgdGhlIHByb2JsZW0gbWF5IGJlCj4gdGhhdCAuLi4KClRoZSBkaWZmZXJlbmNl
IGlzIHRoZSBuZWVkIHRvIGRyb3AgdGhlIHNjaGVkdWxpbmcgbG9jayBmb3IgZG9pbmcgdGhlCnJl
bmRlenZvdXMuIHZjcHVfc2xlZXAoKSBvciB2Y3B1X3dha2UoKSBjb3VsZCBub3cgaW50ZXJmZXJl
IHdpdGgKc2NoZWR1bGluZyBpbiBhIHdheSB3aGljaCB3YXMgbm90IHBvc3NpYmxlIGJlZm9yZS4K
Cj4gCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC1pZi5oCj4+IEBAIC03Niw2ICs3NiwyOSBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgdW5pdF9ydW5uYWJsZShjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPj4gICAgICAg
cmV0dXJuIHZjcHVfcnVubmFibGUodW5pdC0+dmNwdV9saXN0KTsKPiAKPiAuLi4gdGhpcyBjbGVh
cmx5IHN0aWxsIGlzbid0IGRvaW5nIHRoZSAoSSBzdXBwb3NlKSBpbnRlbmRlZCBsb29wLAo+IGFu
ZCBoZW5jZSAuLi4KPiAKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgdW5pdF9y
dW5uYWJsZV9zdGF0ZShjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPj4gK3sKPj4gKyAg
ICBzdHJ1Y3QgdmNwdSAqdjsKPj4gKyAgICBib29sIHJ1bm5hYmxlLCByZXQgPSBmYWxzZTsKPj4g
Kwo+PiArICAgIGlmICggaXNfaWRsZV91bml0KHVuaXQpICkKPj4gKyAgICAgICAgcmV0dXJuIHRy
dWU7Cj4+ICsKPj4gKyAgICBmb3JfZWFjaF9zY2hlZF91bml0X3ZjcHUgKCB1bml0LCB2ICkKPj4g
KyAgICB7Cj4+ICsgICAgICAgIHJ1bm5hYmxlID0gdmNwdV9ydW5uYWJsZSh2KTsKPj4gKwo+PiAr
ICAgICAgICB2LT5uZXdfc3RhdGUgPSBydW5uYWJsZSA/IFJVTlNUQVRFX3J1bm5pbmcKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAodi0+cGF1c2VfZmxhZ3MgJiBWUEZfYmxv
Y2tlZCkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA/IFJVTlNUQVRFX2Js
b2NrZWQgOiBSVU5TVEFURV9vZmZsaW5lOwo+PiArCj4+ICsgICAgICAgIGlmICggcnVubmFibGUg
KQo+PiArICAgICAgICAgICAgcmV0ID0gdHJ1ZTsKPj4gKyAgICB9Cj4+ICsKPj4gKyAgICByZXR1
cm4gcmV0Owo+PiArfQo+IAo+IC4uLiBpdCdzIG5vdCBvYnZpb3VzIHdoYXQgdGhlIGV2ZW50dWFs
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIGlzCj4gZ29pbmcgdG8gYmUuCj4gCj4gRnVydGhl
cm1vcmUgSSB0aGluayBhIGZ1bmN0aW9uIG9mIHRoZSBnaXZlbiBuYW1lLCByZXR1cm5pbmcgYm9v
bCwgYW5kCj4gdGFraW5nIGEgcG9pbnRlciB0byBjb25zdCBkZXNlcnZlcyBhIGNvbW1lbnQgYXMg
dG8gdGhlIChwb3NzaWJseQo+IHNsaWdodGx5IHVuZXhwZWN0ZWQpIHN0YXRlIGNoYW5nZSBpdCBk
b2VzLiBUaGlzIGNvbW1lbnQgbWlnaHQgdGhlbiBiZQo+IHdvcnRod2hpbGUgdG8gZXh0ZW5kIHRv
IGFsc28gb3V0bGluZSB0aGUgdXNhZ2UgZGlmZmVyZW5jZSBiZXR3ZWVuIGl0Cj4gYW5kIGl0cyBz
aWJsaW5nIGFib3ZlLgoKSSdsbCBhZGQgdGhhdC4KCj4gCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+IEBAIC0xNzQsNiAr
MTc0LDcgQEAgc3RydWN0IHZjcHUKPj4gICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEUodmNwdV9y
dW5zdGF0ZV9pbmZvX2NvbXBhdF90KSBjb21wYXQ7Cj4+ICAgICAgIH0gcnVuc3RhdGVfZ3Vlc3Q7
IC8qIGd1ZXN0IGFkZHJlc3MgKi8KPj4gICAjZW5kaWYKPj4gKyAgICB1bnNpZ25lZCBpbnQgICAg
IG5ld19zdGF0ZTsKPiAKPiBTaW1pbGFybHkgSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIGZvciB0
aGlzIGZpZWxkIHRvIGdhaW4gYSBicmllZgo+IGNvbW1lbnQgYXMgdG8gaXRzIHB1cnBvc2UgY29t
cGFyZWQgdG8gcnVuc3RhdGUuc3RhdGUuCgpPa2F5LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
