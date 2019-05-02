Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFD411B45
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 16:21:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCXV-00027K-U1; Thu, 02 May 2019 14:18:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3XpE=TC=citrix.com=prvs=01897380a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hMCXU-00027D-Ec
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:18:20 +0000
X-Inumbo-ID: 2127e31e-6ce5-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2127e31e-6ce5-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 14:18:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89575897"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>
Thread-Topic: [PATCH] x86/HVM: p2m_ram_ro is incompatible with device
 pass-through
Thread-Index: AQHVAOK7/bND1zq6eEG3MTVoeyPCQaZXqpOAgAAEn4CAAAcvAIAABAIAgAAlwzA=
Date: Thu, 2 May 2019 14:12:59 +0000
Message-ID: <941b423b37074521af2e4559fd19c149@AMSPEX02CL03.citrite.net>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
 <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
 <a99e7a6b-6c45-759b-ee0e-ed9174397de3@citrix.com>
 <5CCAF70E020000780022B4A1@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAF70E020000780022B4A1@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDIgTWF5IDIwMTkgMTQ6NTcKPiBUbzogQW5kcmV3
IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogUGF1bCBEdXJyYW50IDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+OyBXZWkgTGl1Cj4gPHdlaS5saXUyQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ODYvSFZNOiBwMm1fcmFtX3Jv
IGlzIGluY29tcGF0aWJsZSB3aXRoIGRldmljZSBwYXNzLXRocm91Z2gKPiAKPiA+Pj4gT24gMDIu
MDUuMTkgYXQgMTU6NDIsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+IE9u
IDAyLzA1LzIwMTkgMTQ6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+IE9uIDAyLjA1LjE5
IGF0IDE0OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4+IE9uIDAy
LzA1LzIwMTkgMTM6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMKPiA+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3BjaS5jCj4gPj4+PiBAQCAtMTQ1MCwxNyArMTQ1MCwzNiBAQCBzdGF0aWMgaW50IGFzc2lnbl9k
ZXZpY2Uoc3RydWN0IGRvbWFpbiAqCj4gPj4+PiAgICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwg
IWhkLT5wbGF0Zm9ybV9vcHMgKQo+ID4+Pj4gICAgICAgICAgcmV0dXJuIDA7Cj4gPj4+Pgo+ID4+
Pj4gLSAgICAvKiBQcmV2ZW50IGRldmljZSBhc3NpZ24gaWYgbWVtIHBhZ2luZyBvciBtZW0gc2hh
cmluZyBoYXZlIGJlZW4KPiA+Pj4+IC0gICAgICogZW5hYmxlZCBmb3IgdGhpcyBkb21haW4gKi8K
PiA+Pj4+IC0gICAgaWYgKCB1bmxpa2VseShkLT5hcmNoLmh2bS5tZW1fc2hhcmluZ19lbmFibGVk
IHx8Cj4gPj4+PiAtICAgICAgICAgICAgICAgICAgdm1fZXZlbnRfY2hlY2tfcmluZyhkLT52bV9l
dmVudF9wYWdpbmcpIHx8Cj4gPj4+PiArICAgIGRvbWFpbl9sb2NrKGQpOwo+ID4+Pj4gKwo+ID4+
Pj4gKyAgICAvKgo+ID4+Pj4gKyAgICAgKiBQcmV2ZW50IGRldmljZSBhc3NpZ25tZW50IGlmIGFu
eSBvZgo+ID4+Pj4gKyAgICAgKiAtIG1lbSBwYWdpbmcKPiA+Pj4+ICsgICAgICogLSBtZW0gc2hh
cmluZwo+ID4+Pj4gKyAgICAgKiAtIHRoZSBwMm1fcmFtX3JvIHR5cGUKPiA+Pj4+ICsgICAgICog
LSBnbG9iYWwgbG9nLWRpcnR5IG1vZGUKPiA+Pj4gWGVuU2VydmVyIGhhcyB3b3JraW5nIGxpdmUg
bWlncmF0aW9uIHdpdGggR1BVcywgd2hpY2ggdGhpcyBjaGFuZ2Ugd291bGQKPiA+Pj4gcmVncmVz
cy4KPiA+Pj4KPiA+Pj4gQmVoaW5kIHRoZSBzY2VuZXMsIHdlIGNvbWJpbmUgWGVuJ3MgbG9nZGly
dHkgYml0bWFwIHdpdGggb25lIHByb3ZpZGVkIGJ5Cj4gPj4+IHRoZSBHUFUsIHRvIGVuc3VyZSB0
aGF0IGFsbCBkaXJ0eSB1cGRhdGVzIGFyZSB0cmFja2VkLgo+ID4+IEJ1dCB0aGlzIHNheXMgbm90
aGluZyBmb3IgdGhlIHBhdGNoIGhlcmUuCj4gPgo+ID4gWWVzIGl0IGRvZXMuCj4gCj4gV2VsbCwg
b2theSwgdGhlbiB0aGUgd29yZGluZyBvZiB5b3VyIHJlcGx5IHBsdXMgbWUganVzdCBhZGRpbmcK
PiBhIGNvbW1lbnQgZm9yIGEgcHJlLWV4aXN0aW5nIGNoZWNrIGhhcyBtaXNsZWFkIG1lLgo+IAo+
ID4gVGhlcmUgaXMgbm90aGluZyBpbmhlcmVudCBhYm91dCBnbG9iYWwgbG9nLWRpcnR5IG1vZGUg
d2hpY2ggaXMKPiA+IGluY29tcGF0aWJsZSB3aXRoIHBhc3N0aHJvdWdoIHdoZW4gdGhlIElPTU1V
IHBhZ2V0YWJsZXMgYXJlIG5vdCBzaGFyZWQKPiA+IHdpdGggRVBULgo+ID4KPiA+PiBBcyBsb25n
IGFzIGl0IGRvZXNuJ3Qgd29yayBpbiB0aGUgc3RhZ2luZyB0cmVlLCBpdCBzaG91bGQgYmUgcHJl
dmVudGVkLgo+ID4KPiA+IC4uLiBidXQgaXQgZG9lcyB3b3JrLgo+IAo+IE5vdGUgaG93IChhcyBz
YWlkIGFib3ZlKSB0aGUgcGF0Y2ggZG9lcyBfbm90XyBhZGQgYW55Cj4gLT5nbG9iYWxfbG9nZGly
dHkgY2hlY2ssIGl0IG1lcmVseSBhZGRzIGEgY29tbWVudCBlbnVtZXJhdGluZwo+IGV2ZXJ5dGhp
bmcgdGhhdCdzIGdldHRpbmcgY2hlY2tlZC4gSSdtIGFmcmFpZCBJIGRvbid0IHNlZSBob3cKPiBh
ZGRpbmcgYSBjb21tZW50IHRvIHN0YXRlIGhvdyB0aGluZ3MgYXJlIGNhbiByZWdyZXNzIGFueXRo
aW5nLgo+IAo+IFRoZSBvbmx5IGNoZWNrIHRoZSBwYXRjaCBhZGRzIGlzIHRoYXQgb2YgdGhlIG5l
dwo+IHAybV9yYW1fcm9fdXNlZCBmbGFnLgo+IAoKQWN0dWFsbHksIHNpbmNlIGdsb2JhbF9sb2dk
aXJ0eSBpcyBzb21ld2hhdCB0cmFuc2llbnQgc2hvdWxkIHdlIG5vdCBhbHNvIGhhdmUgYSBjaGVj
ayB0byBwcmV2ZW50IHAybV9yYW1fbG9nZGlydHkgZnJvbSBiZWluZyBzZXQgZm9yIGEgZG9tYWlu
IHdpdGggYXNzaWduZWQgZGV2aWNlcyBhbmQgc2hhcmVkIEVQVD8KCiAgUGF1bAoKPiBKYW4KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
