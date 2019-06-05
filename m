Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8935834
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 09:58:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYQlx-0005M2-DF; Wed, 05 Jun 2019 07:55:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYQlv-0005Lx-Ru
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 07:55:47 +0000
X-Inumbo-ID: 53273c65-8767-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 53273c65-8767-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 07:55:46 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 01:55:45 -0600
Message-Id: <5CF7757E02000078002355E1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 01:55:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
 <20190604084807.3hevw5rh6qu5w3ul@Air-de-Roger>
 <5CF66BCE0200007800235184@prv1-mh.provo.novell.com>
 <20190604162052.oypj4kpllvueusd3@Air-de-Roger>
In-Reply-To: <20190604162052.oypj4kpllvueusd3@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDE4OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVuIDA0LCAyMDE5IGF0IDA3OjAyOjA2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMDYuMTkgYXQgMTA6NDgsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDc6MDA6MjVBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYjZiZDAyYjdhODc3Zjlm
YWMyZGU2OWU2NGQ4MjQ1ZDU2ZjkyYWIyNS4gVGhlIGNoYW5nZQo+PiA+PiB3YXMgcmVkdW5kYW50
IHdpdGggYW1kX2lvbW11X2RldGVjdF9vbmVfYWNwaSgpIGFscmVhZHkgY2FsbGluZwo+PiA+PiBw
Y2lfcm9fZGV2aWNlKCkuCj4+ID4+IAo+PiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+ID4gCj4+ID4gSSB0aGluayB0aGlzIG5lZWRzIHRvIGJlIHNx
dWFzaGVkIHRvZ2V0aGVyIHdpdGggeW91ciBgQU1EL0lPTU1VOiBkb24ndAo+PiA+ICJhZGQiIElP
TU1Vc2AgcGF0Y2gsIG9yIGVsc2UgUFZIIGRvbTAgd2lsbCBicmVhayBiZWNhdXNlCj4+ID4gdXBk
YXRlX3BhZ2luZ19tb2RlIHdpbGwgZmluZCBkZXZpY2VzIG5vdCBiZWhpbmQgYW4gSU9NTVUgYXNz
aWduZWQgdG8KPj4gPiBkb20wLCB0aHVzIHJldHVybmluZyBhbiBlcnJvciBhbmQgY3Jhc2hpbmcg
ZG9tMC4KPj4gCj4+IEkndmUgdGFrZW4gYW5vdGhlciBsb29rICh3aGlsZSBjb3JyZWN0aW5nIHRo
ZSBvdGhlciBwYXRjaCwgbm93IHNlbnQKPj4gYXMgdjIpOiB1cGRhdGVfcGFnaW5nX21vZGUoKSBp
dGVyYXRlcyBvdmVyIGFsbCBkZXZpY2VzIHRoZSBkb21haW4KPj4gb3ducy4gVGhlIElPTU1VIG9u
ZXMsIGhhdmluZyBiZWVuIHN1YmplY3Qgb2YgYW4gZWFybHkKPj4gcGNpX3JvX2RldmljZSgpLCBz
aG91bGQgbmV2ZXIgZW5kIHVwIG9uIERvbTAncyBsaXN0LiBBbmQgbG9va2luZyBhdAo+PiB0aGUg
Y29kZSBJIGFsc28gY2FuJ3QgLSBmb3Igbm93IGF0IGxlYXN0IC0gc2VlIGhvdyB0aGV5IGNvdWxk
IGdldAo+PiBtb3ZlZCB0aGVyZS4gSW4gZmFjdCBJJ3ZlIHZlcmlmaWVkIHRoYXQgdGhleSB0YWtl
IHRoZSAib3ZlcnJpZGUiCj4+IHBhdGggaW4gX3NldHVwX2h3ZG9tX3BjaV9kZXZpY2VzKCkuCj4g
Cj4gQXMgeW91IHJlYWxpemVkIHRoaXMgY29tbWl0IHdhcyBpbmRlZWQgcGFwZXJpbmcgb3ZlciBh
biBleGlzdGluZyBpc3N1ZQo+IGVsc2V3aGVyZS4gV2hlbiBJIGRpZCB0aGlzIHBhdGNoIEkgZGlk
bid0IHJlYWxpemUKPiBhbWRfaW9tbXVfZGV0ZWN0X29uZV9hY3BpIHdhcyBjYWxsaW5nIHBjaV9y
b19kZXZpY2UuCj4gCj4gVGhlIGlzc3VlIGlzIHRoYXQgd2hlbiBwY2lfcm9fZGV2aWNlIGdldHMg
Y2FsbGVkIGJ5Cj4gYW1kX2lvbW11X2RldGVjdF9vbmVfYWNwaSBkb21feGVuIGhhcyBub3QgYmVl
biBjcmVhdGVkIHlldCwgc28KPiBwZGV2LT5kb21haW4gZW5kcyB1cCBiZWluZyBOVUxMLgoKV2Vs
bCwgdGhhdCdzIGJlaW5nIGZpeGVkIGJ5ICJhZGp1c3Qgc3lzdGVtIGRvbWFpbiBjcmVhdGlvbiAo
YW5kIGNhbGwgaXQKZWFybGllciBvbiB4ODYpIiAobm90ZSB0aGF0IGl0J3MgInNwZWNpYWwiIHJh
dGhlciB0aGFuICJzeXN0ZW0iIGluIHRoZQpwb3N0ZWQgdmVyc2lvbikuIHBkZXYtPmRvbWFpbiBy
ZW1haW5pbmcgdG8gYmUgTlVMTCByZWFsbHkgaXMgdGhlCnNtYWxsZXIgb2YgdGhlIHByb2JsZW1z
OyBhY2Nlc3NpbmcgZG9tX3hlbi0+YXJjaC5wZGV2X2xpc3QgaXMgdGhlCndvcnNlIHBhcnQgaGVy
ZS4KCk9uZSB0aGluZyBpcyBjdXJpb3VzIHRob3VnaDogU28gZmFyIEkgdGhvdWdodCBJIHdvdWxk
IGhhdmUgc2NyZXdlZAp1cCB0aGluZ3MgYnkgaGF2aW5nIGFtZF9pb21tdV9kZXRlY3Rfb25lX2Fj
cGkoKSBjYWxsZWQgZWFybGllciwKYXMgbWVudGlvbmVkIGluIHRoYXQgcGF0Y2gncyBkZXNjcmlw
dGlvbi4gWW91ciBjaGFuZ2UgdGhhdCBJJ2QgbGlrZQp0byByZXZlcnQgcHJlZGF0ZXMgdGhhdCB0
aG91Z2ggYnkgc2V2ZXJhbCBtb250aHMsIHNvIEknbSBnZXR0aW5nCnRoZSBpbXByZXNzaW9uIHRo
ZSBpc3N1ZSBoYXMgYmVlbiBvbGRlci4gQXMgYSByZXN1bHQgdGhlIHJhbmdlIG9mCnZlcnNpb25z
IHRvIGJhY2twb3J0IHRoaXMgdG8gbWF5IGhhdmUgdG8gZ3Jvdy4KCj4gT24gYSB0YW5nZW50aWFs
IG5vdGUsIHRoZXJlJ3MgYWxzbyBhIGRlcmVmZXJlbmNlIG9mIGRvbV94ZW4gaW4KPiBfcGNpX2hp
ZGVfZGV2aWNlIHdoaWNoIGRvZXNuJ3QgdHJpZ2dlciBhIHBhZ2UgZmF1bHQuIERvIHdlIGhhdmUK
PiBzb21ldGhpbmcgbWFwcGVkIGF0IGxpbmVhciBhZGRyZXNzIDAgb24gcHVycG9zZT8KClllcywg
ZHVyaW5nIGVhcmx5IChsZWdhY3kpIGJvb3QuIFRoYXQncyBob3cgdGhlIGluaXRpYWwgcGFnZSB0
YWJsZXMKZ2V0IGNvbnN0cnVjdGVkLiBBbmQgSSBkaWQgbm90aWNlIGl0IGFzIGFuIGFjdHVhbCBj
cmFzaCBiZWNhdXNlIHRoZQpuZXdlciBib3ggYm9vdHMgZnJvbSBFRkksIHdoZXJlIHRoZXJlJ3Mg
bm8gbWFwcGluZyBhdCBsaW5lYXIKYWRkcmVzcyAwLiBIZW5jZSB0aGF0IHBhdGNoIG1lbnRpb25l
ZCBhYm92ZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
