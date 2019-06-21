Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B44EA36
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:07:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heK9H-0006L8-4J; Fri, 21 Jun 2019 14:04:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heK9G-0006L3-BV
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:04:14 +0000
X-Inumbo-ID: 71e0c090-942d-11e9-8387-ab03b0cd0a18
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71e0c090-942d-11e9-8387-ab03b0cd0a18;
 Fri, 21 Jun 2019 14:04:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 08:04:11 -0600
Message-Id: <5D0CE3D9020000780023A268@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 08:04:09 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8771020000780021F329@prv1-mh.provo.novell.com>
 <21de62e1-ce94-2c61-5186-33a7d4b800b5@citrix.com>
In-Reply-To: <21de62e1-ce94-2c61-5186-33a7d4b800b5@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 48/50] x86emul: add an AES/VAES test case
 to the harness
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

Pj4+IE9uIDIxLjA2LjE5IGF0IDE1OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBUaGlzIGZlZWxzIGxp
a2UgaXQgc2hvdWxkIGJlIGZvbGRlZCB3aXRoIHBhdGNoIDQ1IChvciBwZXJoYXBzIGVhc2llciwg
NDUKPiBtb3ZlZCBsYXRlciBhbmQgZm9sZGVkIGludG8gdGhpcyBvbmUuICBUaGUgZXhhY3Qgb3Jk
ZXJpbmcgb2YgcGF0Y2hlcwo+IHJlYWxseSBkb2Vzbid0IG1hdHRlcikuCgpOb3QgcmVhbGx5IGlt
byAtIHdlJ3ZlIGhhZCBBRVNOSSBzdXBwb3J0IGV2ZW4gYmVmb3JlIHRoaXMgc2VyaWVzLgpUZXN0
IGhhcm5lc3MgY292ZXJhZ2UgZm9yIGV2ZXJ5dGhpbmcgZ2V0cyBhZGRlZCBoZXJlLiBBcGFydApm
cm9tIHRoaXMgdGhlIGxhdGUgcGxhY2VtZW50IGluIHRoZSBzZXJpZXMgaXMgYXR0cmlidXRlZCB0
byBpdHMgaGlzdG9yeToKSXQgdG9vayBtZSBhIHdoaWxlIGFmdGVyIGhhdmluZyBmaW5pc2hlZCB0
aGUgbWFpbiBBVlg1MTIgd29yayB0bwpmaW5kIHRpbWUgdG8gYWN0dWFsbHkgY29tZSB1cCB3aXRo
IGF0IGxlYXN0IG1hcmdpbmFsbHkgc2Vuc2libGUgdGVzdHMKaGVyZS4KCkknZCBwcmVmZXIgaWYg
dGhpbmdzIHJlbWFpbmVkIHNwbGl0IHRoZSB3YXkgdGhleSBhcmUuCgo+PiBAQCAtOTEsNiArOTUs
MTYgQEAgc3RhdGljIGJvb2wgc2ltZF9jaGVja194b3Aodm9pZCkKPj4gICAgICByZXR1cm4gY3B1
X2hhc194b3A7Cj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyBib29sIHNpbWRfY2hlY2tfc3NzZTNfYWVz
KHZvaWQpCj4+ICt7Cj4+ICsgICAgcmV0dXJuIGNwdV9oYXNfYWVzbmkgJiYgY3B1X2hhc19zc3Nl
MzsKPj4gK30KPj4gKwo+PiArc3RhdGljIGJvb2wgc2ltZF9jaGVja19hdnhfYWVzKHZvaWQpCj4+
ICt7Cj4+ICsgICAgcmV0dXJuIGNwdV9oYXNfYWVzbmkgJiYgY3B1X2hhc19hdng7Cj4+ICt9Cj4+
ICsKPj4gIHN0YXRpYyBib29sIHNpbWRfY2hlY2tfYXZ4NTEyZih2b2lkKQo+PiAgewo+PiAgICAg
IHJldHVybiBjcHVfaGFzX2F2eDUxMmY7Cj4+IEBAIC0xNDEsNiArMTU1LDIyIEBAIHN0YXRpYyBi
b29sIHNpbWRfY2hlY2tfYXZ4NTEydmJtaV92bCh2b2kKPj4gICAgICByZXR1cm4gY3B1X2hhc19h
dng1MTJfdmJtaSAmJiBjcHVfaGFzX2F2eDUxMnZsOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgYm9v
bCBzaW1kX2NoZWNrX2F2eDJfdmFlcyh2b2lkKQo+PiArewo+PiArICAgIHJldHVybiBjcHVfaGFz
X2Flc25pICYmIGNwdV9oYXNfdmFlcyAmJiBjcHVfaGFzX2F2eDI7Cj4+ICt9Cj4+ICsKPj4gK3N0
YXRpYyBib29sIHNpbWRfY2hlY2tfYXZ4NTEyYndfdmFlcyh2b2lkKQo+PiArewo+PiArICAgIHJl
dHVybiBjcHVfaGFzX2Flc25pICYmIGNwdV9oYXNfdmFlcyAmJiBjcHVfaGFzX2F2eDUxMmJ3Owo+
PiArfQo+PiArCj4+ICtzdGF0aWMgYm9vbCBzaW1kX2NoZWNrX2F2eDUxMmJ3X3ZhZXNfdmwodm9p
ZCkKPj4gK3sKPj4gKyAgICByZXR1cm4gY3B1X2hhc19hZXNuaSAmJiBjcHVfaGFzX3ZhZXMgJiYK
Pj4gKyAgICAgICAgICAgY3B1X2hhc19hdng1MTJidyAmJiBjcHVfaGFzX2F2eDUxMnZsOwo+PiAr
fQo+IAo+IEkndmUgZ290IHRoZSBzYW1lIGNvbmNlcm5zIFdSVCBmZWF0dXJlIHRlc3RzIGFzIHdp
dGggdGhlIHByZXZpb3VzCj4gcGF0Y2guICBFdmVyeXRoaW5nIGVsc2UgTEdUTS4KClJpZ2h0IC0g
bGV0J3Mgc2V0dGxlIG9uIHRoYXQgYXNwZWN0IHRoZXJlIGZpcnN0LgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
