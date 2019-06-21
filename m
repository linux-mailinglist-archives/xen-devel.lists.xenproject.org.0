Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E06D4EA21
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:03:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heK5W-00067U-HV; Fri, 21 Jun 2019 14:00:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heK5U-00067J-8q
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:00:20 +0000
X-Inumbo-ID: e71978a5-942c-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e71978a5-942c-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 14:00:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 08:00:18 -0600
Message-Id: <5D0CE2F0020000780023A265@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 08:00:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8733020000780021F323@prv1-mh.provo.novell.com>
 <27e0b6ee-5987-cc13-72e9-03a4f860ea6c@citrix.com>
In-Reply-To: <27e0b6ee-5987-cc13-72e9-03a4f860ea6c@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 46/50] x86emul: support GFNI insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDE1OjE5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMTowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE5vdGUgdGhh
dCB0aGUgSVNBIGV4dGVuc2lvbnMgZG9jdW1lbnQgcmV2aXNpb24gMDM1IGlzIGFtYmlndW91cwo+
PiByZWdhcmRpbmcgZmF1bHQgc3VwcHJlc3Npb24gZm9yIFZHRjJQOE1VTEI6IFRleHQgc2F5cyBp
dCdzIHN1cHBvcnRlZCwKPj4gd2hpbGUgdGhlIGV4Y2VwdGlvbiBzcGVjaWZpY2F0aW9uIGxpc3Rl
ZCBpcyBFNE5GLiBHaXZlbiB0aGUgd29yZGluZyBoZXJlCj4+IGFuZCBmb3IgdGhlIG90aGVyIHR3
byBpbnNucyBJJ20gaW5jbGluZWQgdG8gdHJ1c3QgdGhlIHRleHQgbW9yZSB0aGFuIHRoZQo+PiBl
eGNlcHRpb24gcmVmZXJlbmNlLCB3aGljaCB3YXMgYWxzbyBjb25maXJtZWQgaW5mb3JtYWxseS4K
PiAKPiBWZXJzaW9uIDAzNyBoYXMgdGhlIGV4Y2VwdGlvbiByZWZlcmVuY2UgYXMgRTQgcmF0aGVy
IHRoYW4gRTRORiwgc28gSQo+IHRoaW5rIHRoaXMgZW50aXJlIHBhcmFncmFwaCBpcyBzdGFsZSBu
b3cgYW5kIGNhbiBiZSBkcm9wcGVkLgoKT2gsIGluZGVlZCwgdGhleSd2ZSBjb3JyZWN0ZWQgdGhh
dC4KCj4gKE9uIGEgdGFuZ2VudCwgQVZYNTEyX1ZQMklOVEVSU0VDVCBub3cgZXhpc3RzIGluIHRo
ZSBleHRlbnNpb25zIGRvYy4pCgpBbmQgSSBoYXZlIGl0IGltcGxlbWVudGVkLCBidXQgbm8gd2F5
IHRvIHRlc3QgdW50aWwgc2RlIHN1cHBvcnRzIGl0LgoKPj4gQXMgdG8gdGhlIGZlYXR1cmUgZGVw
ZW5kZW5jeSBhZGp1c3RtZW50LCB3aGlsZSBzdHJpY3RseSBzcGVha2luZyBTU0UgaXMKPj4gYSBz
dWZmaWNpZW50IHByZXJlcSAodG8gaGF2ZSBYTU0gcmVnaXN0ZXJzKSwgdmVjdG9ycyBvZiBieXRl
cyBhbmQgcXdvcmRzCj4+IGhhdmUgZ290IGludHJvZHVjZWQgb25seSB3aXRoIFNTRTIuIGdjYywg
Zm9yIGV4YW1wbGUsIHVzZXMgYSBzaW1pbGFyCj4+IGNvbm5lY3Rpb24gaW4gaXRzIHJlc3BlY3Rp
dmUgaW50cmluc2ljcyBoZWFkZXIuCj4gCj4gVGhpcyBpcyBzdGFsZSBub3cgdGhhdCB5b3UndmUg
bW92ZWQgdGhlIG90aGVyIGludGVnZXIgZGVwZW5kZW5jZXMgdG8gU1NFMi4KCkhtbSwgaXQncyBy
ZWR1bmRhbnQgd2l0aCB0aGF0IG90aGVyIGNoYW5nZSwgYnV0IG5vdCByZWFsbHkgc3RhbGUuCkkg
Y2FuIGRyb3AgaXQgaWYgeW91IHdhbnQuCgo+PiBAQCAtMTM4LDYgKzE0MSwyNiBAQCBzdGF0aWMg
Ym9vbCBzaW1kX2NoZWNrX2F2eDUxMnZibWlfdmwodm9pCj4+ICAgICAgcmV0dXJuIGNwdV9oYXNf
YXZ4NTEyX3ZibWkgJiYgY3B1X2hhc19hdng1MTJ2bDsKPj4gIH0KPj4gIAo+PiArc3RhdGljIGJv
b2wgc2ltZF9jaGVja19zc2UyX2dmKHZvaWQpCj4+ICt7Cj4+ICsgICAgcmV0dXJuIGNwdV9oYXNf
Z2ZuaSAmJiBjcHVfaGFzX3NzZTI7Cj4gCj4gVGhpcyBkZXBlbmRlbmN5IGRvZXNuJ3QgbWF0Y2gg
dGhlIG1hbnVhbC4gIFRoZSBsZWdhY3kgZW5jb2RpbmcgbmVlZHMKPiBHRk5JIGFsb25lLgo+IAo+
IGdlbi1jcHVpZC5weSBpcyB0cnlpbmcgdG8gcmVkdWNlIHRoZSBhYmlsaXR5IHRvIGNyZWF0ZSB0
b3RhbGx5Cj4gaW1wbGF1c2libGUgY29uZmlndXJhdGlvbnMgdmlhIGxldmVsbGluZywgYnV0IGZv
ciBzb2Z0d2FyZSBjaGVja3MsIHdlCj4gc2hvdWxkIGZvbGxvdyB0aGUgbWFudWFsIHRvIHRoZSBs
ZXR0ZXIuCgpUaGlzIGlzIHRlc3QgaGFybmVzcyBjb2RlIC0gSSdkIHJhdGhlciBiZSBhIGxpdHRs
ZSBtb3JlIHN0cmljdCBoZXJlIHRoYW4KaGF2aW5nIHRvIG5lZWRsZXNzbHkgc3BlbmQgdGltZSBm
aXhpbmcgYW4gaXNzdWUgaW4gdGhlcmUuIEZ1cnRoZXJtb3JlCnRoaXMgbWF0Y2hlcyBob3cgZ2Nj
IGVuZm9yY2VzIGRlcGVuZGVuY2llcy4KCj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBib29sIHNpbWRf
Y2hlY2tfYXZ4Ml9nZih2b2lkKQo+PiArewo+PiArICAgIHJldHVybiBjcHVfaGFzX2dmbmkgJiYg
Y3B1X2hhc19hdngyOwo+IAo+IEhlcmUsIHRoZSBkZXBlbmRlbmN5IGlzIG9ubHkgb24gQVZYLCB3
aGljaCBJIHRoaW5rIGlzIHByb2JhYmx5IHRyeWluZyB0bwo+IGV4cHJlc3MgYSBkZXBlbmRlbmN5
IG9uIHhjcjAueW1tCgpNb3N0bHkgYXMgcGVyIGFib3ZlLCBleGNlcHQgdGhhdCBoZXJlIGdjYyAo
aW1vIHdyb25nbHkpIGVuYWJsZXMganVzdApBVlguCgo+PiArfQo+PiArCj4+ICtzdGF0aWMgYm9v
bCBzaW1kX2NoZWNrX2F2eDUxMmJ3X2dmKHZvaWQpCj4+ICt7Cj4+ICsgICAgcmV0dXJuIGNwdV9o
YXNfZ2ZuaSAmJiBjcHVfaGFzX2F2eDUxMmJ3Owo+IAo+IEkgZG9uJ3Qgc2VlIGFueSBCVyBpbnRl
cmFjdGlvbiBhbnl3aGVyZSAoaW4gdGhlIG1hbnVhbCksIGRlc3BpdGUgdGhlCj4gZmFjdCBpdCBv
cGVyYXRlcyBvbiBhIGRhdGF0eXBlIG9mIGludDguCgpCdXQgYnkgb3BlcmF0aW5nIG9uIHZlY3Rv
cnMgb2YgYnl0ZXMsIGl0IHJlcXVpcmVzIDY0IGJpdHMgd2lkZSBtYXNrCnJlZ2lzdGVycywgd2hp
Y2ggaXMgdGhlIGNvbm5lY3Rpb24gdG8gQlcuIEFnYWluIGdjYyBhbHNvIGRvZXMgc28uCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
