Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C36A52636
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 10:13:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfgXQ-0004Yd-By; Tue, 25 Jun 2019 08:10:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ez/b=UY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hfgXO-0004YX-VT
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 08:10:47 +0000
X-Inumbo-ID: b961240a-9720-11e9-906e-4795873d9366
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b961240a-9720-11e9-906e-4795873d9366;
 Tue, 25 Jun 2019 08:10:42 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xX+FEPkb1JRAeb9CSbV1E0f/CqqxYIIZZA8eh0Ak/aWV/QRjhpdtI7Zw+455z10LE2YJfGeGTD
 vRmHPS4ZgdVnM4RbGSa2pcW/uXZ38/69kGItxo7j4a7m5p2+jBASmzhZrNUqnksA8WhFBSTlnR
 EvrF067RzY6LNN674JmU2EHuDN7UBLZqcuG2Dezl98fdygbkG08pqjIEyRBAJ2GNDDB/Ffk+dI
 Fbg44RaXB53fQbOt2t36FHz5eKR6VjxGO/Gz5auF6VJTJsGl1EAG6HQN8x28M4LdcR0MByTeDi
 cpw=
X-SBRS: 2.7
X-MesageID: 2206681
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,415,1557201600"; 
   d="scan'208";a="2206681"
Date: Tue, 25 Jun 2019 10:10:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Daniel Kiper <daniel.kiper@oracle.com>
Message-ID: <20190625081034.n7bvsd4zdcdqsfua@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
 <20190624112402.thhrmu7tynfnjujw@tomti.i.net-space.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624112402.thhrmu7tynfnjujw@tomti.i.net-space.pl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDE6MjQ6MDJQTSArMDIwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9uIEZyaSwgSnVuIDIxLCAyMDE5IGF0IDEyOjM0OjEzQU0gLTA2MDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+ID4gPj4+IE9uIDE5LjA2LjE5IGF0IDE3OjA2LCA8cm9nZXIucGF1QGNpdHJp
eC5jb20+IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAwNjo1NzowNUFNIC0w
NjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4+ID4+PiBPbiAxOS4wNi4xOSBhdCAxMzowMiwg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4+ID4gSWYgdGhlIGh5cGVydmlzb3Ig
aGFzIGJlZW4gYnVpbHQgd2l0aCBFRkkgc3VwcG9ydCAoaWU6IG11bHRpYm9vdDIpLgo+ID4gPj4g
PiBUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24gY29ycmVjdGx5IGlu
IHRoZSBvdXRwdXQKPiA+ID4+ID4gYmluYXJ5LCBvciBlbHNlIHRoZSBsaW5rZXIgbWlnaHQgcGxh
Y2UgLnJlbG9jIGJlZm9yZSB0aGUgLnRleHQKPiA+ID4+ID4gc2VjdGlvbi4KPiA+ID4+ID4KPiA+
ID4+ID4gTm90ZSB0aGF0IHRoZSAucmVsb2Mgc2VjdGlvbiBpcyBtb3ZlZCBiZWZvcmUgLmJzcyBm
b3IgdHdvIHJlYXNvbnM6IGluCj4gPiA+PiA+IG9yZGVyIGZvciB0aGUgcmVzdWx0aW5nIGJpbmFy
eSB0byBub3QgY29udGFpbiBhbnkgc2VjdGlvbiB3aXRoIGRhdGEKPiA+ID4+ID4gYWZ0ZXIgLmJz
cywgc28gdGhhdCB0aGUgZmlsZSBzaXplIGNhbiBiZSBzbWFsbGVyIHRoYW4gdGhlIGxvYWRlZAo+
ID4gPj4gPiBtZW1vcnkgc2l6ZSwgYW5kIGJlY2F1c2UgdGhlIGRhdGEgaXQgY29udGFpbnMgaXMg
cmVhZC1vbmx5LCBzbyBpdAo+ID4gPj4gPiBiZWxvbmdzIHdpdGggdGhlIG90aGVyIHNlY3Rpb25z
IGNvbnRhaW5pbmcgcmVhZC1vbmx5IGRhdGEuCj4gPiA+Pgo+ID4gPj4gV2hpbGUgdGhpcyBtYXkg
YmUgZmluZSBmb3IgRUxGLCBJJ20gYWZyYWlkIGl0IHdvdWxkIGJlIGNhbGxpbmcgZm9yCj4gPiA+
PiBzdWJ0bGUgaXNzdWVzIHdpdGggeGVuLmVmaSAoaS5lLiB0aGUgUEUgYmluYXJ5KTogVGhlcmUg
YSAucmVsb2MKPiA+ID4+IHNlY3Rpb24gaXMgZ2VuZXJhbGx5IGV4cGVjdGVkIHRvIGNvbWUgYWZ0
ZXIgIm5vcm1hbCIgZGF0YQo+ID4gPj4gc2VjdGlvbnMuCj4gPiA+Cj4gPiA+IE9LLCB3b3VsZCB5
b3UgbGlrZSBtZSB0byBsZWF2ZSB0aGUgLnJlbG9jIHNlY3Rpb24gYXQgdGhlIHByZXZpb3VzCj4g
PiA+IHBvc2l0aW9uIGZvciBFRkkgYnVpbGRzIHRoZW4/Cj4gPgo+ID4gV2VsbCwgdGhpcyBwYXJ0
IGlzIGEgcmVxdWlyZW1lbnQsIG5vdCBhIHF1ZXN0aW9uIG9mIG1lIGxpa2luZyB5b3UKPiA+IHRv
IGRvIHNvLgo+ID4KPiA+ID4gT3IgZG8gd2UgcHJlZmVyIHRvIGxlYXZlIC5yZWxvYyBvcnBoYW5l
ZCBpbiB0aGUgRUxGIGJ1aWxkPwo+ID4KPiA+IERhbmllbCBtaWdodCBoYXZlIGFuIG9waW5pb24g
aGVyZSB3aXRoIGhpcyBwbGFucyB0byBhY3R1YWxseQo+ID4gYWRkIHJlbG9jYXRpb25zIHRoZXJl
IGluIHRoZSBub24tbGlua2VyLWdlbmVyYXRlZC1QRSBidWlsZC4gSQo+ID4gZG9uJ3QgaGF2ZSBh
IHN0cm9uZyBvcGluaW9uIGVpdGhlciB3YXksIGFzIGxvbmcgYXMgdGhlCj4gPiBjdXJyZW50IG1l
dGhvZCBvZiBidWlsZGluZyBnZXRzIGxlZnQgYXMgaXMgKG9yIGV2ZW4gc2ltcGxpZmllZCkuCj4g
Cj4gSSB3b3VsZCBub3QgZHJvcCAucmVsb2Mgc2VjdGlvbiBmcm9tIHhlbi1zeW1zIGJlY2F1c2Ug
aXQgY2FuIGJlIHVzZWZ1bAo+IGZvciAibWFudWFsIiBFRkkgaW1hZ2UgcmVsb2NzIGdlbmVyYXRp
b24uIEhvd2V2ZXIsIEkgYW0gbm90IHN0cm9uZ2x5Cj4gdGllZCB0byBpdC4gSWYgeW91IHdpc2gg
dG8gZHJvcCBpdCBnbyBhaGVhZC4gSSBjYW4gcmVhZGQgaXQgbGF0dGVyIGlmCj4gSSBnZXQgYmFj
ayB0byBteSBuZXcgUEUgYnVpbGQgd29yay4KCkRvIHlvdSBtZWFuIHRoYXQgdGhlIGR1bW15IC5y
ZWxvYyBzZWN0aW9uIGFkZGVkIHRvIG5vbi1QRSBidWlsZHMgY2FuCmJlIGRyb3BwZWQ/IChpZTog
cmVtb3ZlIHhlbi9hcmNoL3g4Ni9lZmkvcmVsb2NzLWR1bW15LlMgZnJvbSB0aGUgYnVpbGQpCgpJ
J20gc2xpZ2h0bHkgbG9zdCwgLnJlbG9jIGJlZ2luIGEgc2VjdGlvbiB0aGF0J3MgZXhwbGljaXRs
eSBhZGRlZCB0bwpub24tUEUgYnVpbGRzIGJ5IHJlbG9jcy1kdW1teS5TIEkgYXNzdW1lZCBpdCB3
YXMgbmVlZGVkIGZvciBzb21lCnJlYXNvbi4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
