Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D43762DD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 11:57:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqwuZ-0002nq-9c; Fri, 26 Jul 2019 09:53:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X75G=VX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqwuX-0002nl-Tw
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 09:53:13 +0000
X-Inumbo-ID: 2d8064a4-af8b-11e9-9dba-774e040f92c8
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d8064a4-af8b-11e9-9dba-774e040f92c8;
 Fri, 26 Jul 2019 09:53:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 90B77AE2C;
 Fri, 26 Jul 2019 09:53:10 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190724112658.31495-1-jgross@suse.com>
 <20190724112658.31495-3-jgross@suse.com>
 <ff7462b4-f440-4fda-1a1c-5ff3e7352b3d@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2f65f3af-5ffa-0efc-4afa-afde8c72f09d@suse.com>
Date: Fri, 26 Jul 2019 11:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ff7462b4-f440-4fda-1a1c-5ff3e7352b3d@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMTkgMTE6NDYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjQvMDcvMjAxOSAx
MjoyNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vd2Fp
dC5jIGIveGVuL2NvbW1vbi93YWl0LmMKPj4gaW5kZXggNGY4MzBhMTRlOC4uM2ZjNWY2ODYxMSAx
MDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi93YWl0LmMKPj4gKysrIGIveGVuL2NvbW1vbi93YWl0
LmMKPj4gQEAgLTM0LDggKzM0LDYgQEAgc3RydWN0IHdhaXRxdWV1ZV92Y3B1IHsKPj4gICAgICAg
ICovCj4+ICAgICAgIHZvaWQgKmVzcDsKPj4gICAgICAgY2hhciAqc3RhY2s7Cj4+IC0gICAgY3B1
bWFza190IHNhdmVkX2FmZmluaXR5Owo+PiAtICAgIHVuc2lnbmVkIGludCB3YWtldXBfY3B1Owo+
PiAgICNlbmRpZgo+PiAgIH07Cj4+ICAgCj4+IEBAIC0xMzEsMTIgKzEyOSwxMCBAQCBzdGF0aWMg
dm9pZCBfX3ByZXBhcmVfdG9fd2FpdChzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUgKndxdikKPj4gICAg
ICAgQVNTRVJUKHdxdi0+ZXNwID09IDApOwo+PiAgIAo+PiAgICAgICAvKiBTYXZlIGN1cnJlbnQg
VkNQVSBhZmZpbml0eTsgZm9yY2Ugd2FrZXVwIG9uICp0aGlzKiBDUFUgb25seS4gKi8KPj4gLSAg
ICB3cXYtPndha2V1cF9jcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+IC0gICAgY3B1bWFza19j
b3B5KCZ3cXYtPnNhdmVkX2FmZmluaXR5LCBjdXJyLT5jcHVfaGFyZF9hZmZpbml0eSk7Cj4+IC0g
ICAgaWYgKCB2Y3B1X3NldF9oYXJkX2FmZmluaXR5KGN1cnIsIGNwdW1hc2tfb2Yod3F2LT53YWtl
dXBfY3B1KSkgKQo+PiArICAgIGlmICggdmNwdV90ZW1wb3JhcnlfYWZmaW5pdHkoY3Vyciwgc21w
X3Byb2Nlc3Nvcl9pZCgpLCBWQ1BVX0FGRklOSVRZX1dBSVQpICkKPj4gICAgICAgewo+PiAgICAg
ICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIlVuYWJsZSB0byBzZXQgdmNwdSBhZmZpbml0eVxu
Iik7Cj4+IC0gICAgICAgIGRvbWFpbl9jcmFzaChjdXJyZW50LT5kb21haW4pOwo+PiArICAgICAg
ICBkb21haW5fY3Jhc2goY3Vyci0+ZG9tYWluKTsKPj4gICAKPj4gICAgICAgICAgIGZvciAoIDsg
OyApCj4+ICAgICAgICAgICAgICAgZG9fc29mdGlycSgpOwo+PiBAQCAtMTcwLDcgKzE2Niw3IEBA
IHN0YXRpYyB2b2lkIF9fcHJlcGFyZV90b193YWl0KHN0cnVjdCB3YWl0cXVldWVfdmNwdSAqd3F2
KQo+PiAgICAgICBpZiAoIHVubGlrZWx5KHdxdi0+ZXNwID09IDApICkKPj4gICAgICAgewo+PiAg
ICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIlN0YWNrIHRvbyBsYXJnZSBpbiAlc1xuIiwg
X19mdW5jX18pOwo+PiAtICAgICAgICBkb21haW5fY3Jhc2goY3VycmVudC0+ZG9tYWluKTsKPj4g
KyAgICAgICAgZG9tYWluX2NyYXNoKGN1cnItPmRvbWFpbik7Cj4+ICAgCj4+ICAgICAgICAgICBm
b3IgKCA7IDsgKQo+PiAgICAgICAgICAgICAgIGRvX3NvZnRpcnEoKTsKPj4gQEAgLTE4MiwzMCAr
MTc4LDI0IEBAIHN0YXRpYyB2b2lkIF9fcHJlcGFyZV90b193YWl0KHN0cnVjdCB3YWl0cXVldWVf
dmNwdSAqd3F2KQo+PiAgIHN0YXRpYyB2b2lkIF9fZmluaXNoX3dhaXQoc3RydWN0IHdhaXRxdWV1
ZV92Y3B1ICp3cXYpCj4+ICAgewo+PiAgICAgICB3cXYtPmVzcCA9IE5VTEw7Cj4+IC0gICAgKHZv
aWQpdmNwdV9zZXRfaGFyZF9hZmZpbml0eShjdXJyZW50LCAmd3F2LT5zYXZlZF9hZmZpbml0eSk7
Cj4+ICsgICAgdmNwdV90ZW1wb3JhcnlfYWZmaW5pdHkoY3VycmVudCwgTlJfQ1BVUywgVkNQVV9B
RkZJTklUWV9XQUlUKTsKPj4gICB9Cj4+ICAgCj4+ICAgdm9pZCBjaGVja193YWtldXBfZnJvbV93
YWl0KHZvaWQpCj4+ICAgewo+PiAtICAgIHN0cnVjdCB3YWl0cXVldWVfdmNwdSAqd3F2ID0gY3Vy
cmVudC0+d2FpdHF1ZXVlX3ZjcHU7Cj4+ICsgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50
Owo+PiArICAgIHN0cnVjdCB3YWl0cXVldWVfdmNwdSAqd3F2ID0gY3Vyci0+d2FpdHF1ZXVlX3Zj
cHU7Cj4+ICAgCj4+ICAgICAgIEFTU0VSVChsaXN0X2VtcHR5KCZ3cXYtPmxpc3QpKTsKPj4gICAK
Pj4gICAgICAgaWYgKCBsaWtlbHkod3F2LT5lc3AgPT0gTlVMTCkgKQo+PiAgICAgICAgICAgcmV0
dXJuOwo+PiAgIAo+PiAtICAgIC8qIENoZWNrIGlmIHdlIHdva2UgdXAgb24gdGhlIHdyb25nIENQ
VS4gKi8KPj4gLSAgICBpZiAoIHVubGlrZWx5KHNtcF9wcm9jZXNzb3JfaWQoKSAhPSB3cXYtPndh
a2V1cF9jcHUpICkKPj4gKyAgICAvKiBDaGVjayBpZiB3ZSBhcmUgc3RpbGwgcGlubmVkLiAqLwo+
PiArICAgIGlmICggdW5saWtlbHkoIShjdXJyLT5hZmZpbml0eV9icm9rZW4gJiBWQ1BVX0FGRklO
SVRZX1dBSVQpKSApCj4+ICAgICAgIHsKPj4gLSAgICAgICAgLyogUmUtc2V0IFZDUFUgYWZmaW5p
dHkgYW5kIHJlLWVudGVyIHRoZSBzY2hlZHVsZXIuICovCj4+IC0gICAgICAgIHN0cnVjdCB2Y3B1
ICpjdXJyID0gY3VycmVudDsKPj4gLSAgICAgICAgY3B1bWFza19jb3B5KCZ3cXYtPnNhdmVkX2Fm
ZmluaXR5LCBjdXJyLT5jcHVfaGFyZF9hZmZpbml0eSk7Cj4+IC0gICAgICAgIGlmICggdmNwdV9z
ZXRfaGFyZF9hZmZpbml0eShjdXJyLCBjcHVtYXNrX29mKHdxdi0+d2FrZXVwX2NwdSkpICkKPj4g
LSAgICAgICAgewo+PiAtICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIlVuYWJsZSB0
byBzZXQgdmNwdSBhZmZpbml0eVxuIik7Cj4+IC0gICAgICAgICAgICBkb21haW5fY3Jhc2goY3Vy
cmVudC0+ZG9tYWluKTsKPj4gLSAgICAgICAgfQo+PiAtICAgICAgICB3YWl0KCk7IC8qIHRha2Vz
IHVzIGJhY2sgaW50byB0aGUgc2NoZWR1bGVyICovCj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxP
R19FUlIsICJ2Y3B1IGFmZmluaXR5IGxvc3RcbiIpOwo+PiArICAgICAgICBkb21haW5fY3Jhc2go
Y3Vyci0+ZG9tYWluKTsKPj4gICAgICAgfQo+IAo+IEknbSBzb3JyeSB0byByZXRyYWN0IG15IFIt
YnkgYWZ0ZXIgdGhlIGZhY3QsIGJ1dCBJJ3ZlIG9ubHkganVzdCBub3RpY2VkCj4gKHdoaWxlIHJl
YmFzaW5nIHNvbWUgb2YgbXkgcGVuZGluZyB3b3JrIG92ZXIgdGhpcykgdGhhdCBpdCBpcyBidWdn
eS4KPiAKPiBUaGUgcmVhc29uIHdhaXQoKSB3YXMgY2FsbGVkIGlzIGJlY2F1c2UgaXQgaXMgbm90
IHNhZmUgdG8gbGVhdmUgdGhhdAo+IGlmKCkgY2xhdXNlLgo+IAo+IFdpdGggdGhpcyBjaGFuZ2Ug
aW4gcGxhY2UsIHdlJ2xsIGFycmFuZ2UgZm9yIHRoZSBWTSB0byBiZSBjcmFzaGVkLCB0aGVuCj4g
bG9uZ2p1bXAgYmFjayBpbnRvIHRoZSBzdGFjayBmcm9tIGZyb20gdGhlIHdhaXRpbmcgdkNQVSwg
b24gdGhlIHdyb25nCj4gQ1BVLsKgIEFueSBjYWxsZXIgd2l0aCBzbXBfcHJvY2Vzc29yX2lkKCkg
b3IgdGhyZWFkLWxvY2FsIHZhcmlhYmxlcyBjYWNoZQo+IGJ5IHBvaW50ZXIgb24gdGhlIHN0YWNr
IHdpbGwgdGhlbiBjYXVzZSBtZW1vcnkgY29ycnVwdGlvbi4KPiAKPiBJdHMgbm90IGltbWVkaWF0
ZWx5IG9idmlvdXMgaG93IHRvIGZpeCB0aGlzLCBidXQgYmVhciBpbiBtaW5kIHRoYXQgYXMKPiBz
b29uIGFzIHRoZSB2bS1ldmVudCBpbnRlcmZhY2UgaXMgZG9uZSwgSSBwbGFuIHRvIGRlbGV0ZSB0
aGlzIHdob2xlCj4gd2FpdHF1ZXVlIGluZnJhc3RydWN0dXJlIGFueXdheS4KClNob3VsZG4ndCBq
dXN0IGNhbGxpbmcgd2FpdCgpIGFmdGVyIGRvbWFpbl9jcmFzaCgpIGJlIGZpbmUgdGhlbj8KClRo
YXQncyB3aGF0IHdvdWxkIGhhdmUgaGFwcGVuZWQgaW4gdGhlIG9yaWdpbmFsIGVycm9yIGNhc2Us
IHRvby4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
