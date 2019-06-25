Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EDC54D4D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 13:12:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfjJt-0001S4-I4; Tue, 25 Jun 2019 11:09:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ez/b=UY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hfjJr-0001Rz-C7
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 11:08:59 +0000
X-Inumbo-ID: 9fb9fdba-9739-11e9-b9d4-ab69804b8e2b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fb9fdba-9739-11e9-b9d4-ab69804b8e2b;
 Tue, 25 Jun 2019 11:08:56 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3DOVaNfb0cwns1eIpxfbemU8BwxAw5L2gAT7PKrJ4pFL6+TWp7LfaZrvmPFXaN4P2ffR0H7b40
 Yq/oY76m1seQtaV6Na6rFjsaNo+awP4yJ0dlK3v/7+mKBE0aspKMXxmgUHxCOaWbD+vDpo1MKA
 wvl/sMnSQzSZfikc3Qy7pAPzqYnzOc/TZp7t7edZOIHc3s/NWzBq1Dt2aJmyKqvGWvgaspNjNC
 EPBj9h+GNbzW5gVWHJlmRheVB6x3Y9Z3tws5SoD0ZjZL8ma/I2CYM2U47a8I2vWOsLA8nn6kZ7
 Wuk=
X-SBRS: 2.7
X-MesageID: 2187882
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,415,1557201600"; 
   d="scan'208";a="2187882"
Date: Tue, 25 Jun 2019 13:08:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190625110849.lo7zxh3p5ico4rdd@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
 <20190624112402.thhrmu7tynfnjujw@tomti.i.net-space.pl>
 <20190625081034.n7bvsd4zdcdqsfua@MacBook-Air-de-Roger.local>
 <5D11E6D6020000780023ADDF@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D11E6D6020000780023ADDF@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Kiper <daniel.kiper@oracle.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDM6MTg6MTRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI1LjA2LjE5IGF0IDEwOjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDE6MjQ6MDJQTSArMDIwMCwgRGFuaWVs
IEtpcGVyIHdyb3RlOgo+ID4+IE9uIEZyaSwgSnVuIDIxLCAyMDE5IGF0IDEyOjM0OjEzQU0gLTA2
MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+ID4gPj4+IE9uIDE5LjA2LjE5IGF0IDE3OjA2LCA8
cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gPiBPbiBXZWQsIEp1biAxOSwgMjAx
OSBhdCAwNjo1NzowNUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiA+ID4+ID4+PiBP
biAxOS4wNi4xOSBhdCAxMzowMiwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+PiA+
ID4+ID4gSWYgdGhlIGh5cGVydmlzb3IgaGFzIGJlZW4gYnVpbHQgd2l0aCBFRkkgc3VwcG9ydCAo
aWU6IG11bHRpYm9vdDIpLgo+ID4+ID4gPj4gPiBUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUg
LnJlbG9jIHNlY3Rpb24gY29ycmVjdGx5IGluIHRoZSBvdXRwdXQKPiA+PiA+ID4+ID4gYmluYXJ5
LCBvciBlbHNlIHRoZSBsaW5rZXIgbWlnaHQgcGxhY2UgLnJlbG9jIGJlZm9yZSB0aGUgLnRleHQK
PiA+PiA+ID4+ID4gc2VjdGlvbi4KPiA+PiA+ID4+ID4KPiA+PiA+ID4+ID4gTm90ZSB0aGF0IHRo
ZSAucmVsb2Mgc2VjdGlvbiBpcyBtb3ZlZCBiZWZvcmUgLmJzcyBmb3IgdHdvIHJlYXNvbnM6IGlu
Cj4gPj4gPiA+PiA+IG9yZGVyIGZvciB0aGUgcmVzdWx0aW5nIGJpbmFyeSB0byBub3QgY29udGFp
biBhbnkgc2VjdGlvbiB3aXRoIGRhdGEKPiA+PiA+ID4+ID4gYWZ0ZXIgLmJzcywgc28gdGhhdCB0
aGUgZmlsZSBzaXplIGNhbiBiZSBzbWFsbGVyIHRoYW4gdGhlIGxvYWRlZAo+ID4+ID4gPj4gPiBt
ZW1vcnkgc2l6ZSwgYW5kIGJlY2F1c2UgdGhlIGRhdGEgaXQgY29udGFpbnMgaXMgcmVhZC1vbmx5
LCBzbyBpdAo+ID4+ID4gPj4gPiBiZWxvbmdzIHdpdGggdGhlIG90aGVyIHNlY3Rpb25zIGNvbnRh
aW5pbmcgcmVhZC1vbmx5IGRhdGEuCj4gPj4gPiA+Pgo+ID4+ID4gPj4gV2hpbGUgdGhpcyBtYXkg
YmUgZmluZSBmb3IgRUxGLCBJJ20gYWZyYWlkIGl0IHdvdWxkIGJlIGNhbGxpbmcgZm9yCj4gPj4g
PiA+PiBzdWJ0bGUgaXNzdWVzIHdpdGggeGVuLmVmaSAoaS5lLiB0aGUgUEUgYmluYXJ5KTogVGhl
cmUgYSAucmVsb2MKPiA+PiA+ID4+IHNlY3Rpb24gaXMgZ2VuZXJhbGx5IGV4cGVjdGVkIHRvIGNv
bWUgYWZ0ZXIgIm5vcm1hbCIgZGF0YQo+ID4+ID4gPj4gc2VjdGlvbnMuCj4gPj4gPiA+Cj4gPj4g
PiA+IE9LLCB3b3VsZCB5b3UgbGlrZSBtZSB0byBsZWF2ZSB0aGUgLnJlbG9jIHNlY3Rpb24gYXQg
dGhlIHByZXZpb3VzCj4gPj4gPiA+IHBvc2l0aW9uIGZvciBFRkkgYnVpbGRzIHRoZW4/Cj4gPj4g
Pgo+ID4+ID4gV2VsbCwgdGhpcyBwYXJ0IGlzIGEgcmVxdWlyZW1lbnQsIG5vdCBhIHF1ZXN0aW9u
IG9mIG1lIGxpa2luZyB5b3UKPiA+PiA+IHRvIGRvIHNvLgo+ID4+ID4KPiA+PiA+ID4gT3IgZG8g
d2UgcHJlZmVyIHRvIGxlYXZlIC5yZWxvYyBvcnBoYW5lZCBpbiB0aGUgRUxGIGJ1aWxkPwo+ID4+
ID4KPiA+PiA+IERhbmllbCBtaWdodCBoYXZlIGFuIG9waW5pb24gaGVyZSB3aXRoIGhpcyBwbGFu
cyB0byBhY3R1YWxseQo+ID4+ID4gYWRkIHJlbG9jYXRpb25zIHRoZXJlIGluIHRoZSBub24tbGlu
a2VyLWdlbmVyYXRlZC1QRSBidWlsZC4gSQo+ID4+ID4gZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGlu
aW9uIGVpdGhlciB3YXksIGFzIGxvbmcgYXMgdGhlCj4gPj4gPiBjdXJyZW50IG1ldGhvZCBvZiBi
dWlsZGluZyBnZXRzIGxlZnQgYXMgaXMgKG9yIGV2ZW4gc2ltcGxpZmllZCkuCj4gPj4gCj4gPj4g
SSB3b3VsZCBub3QgZHJvcCAucmVsb2Mgc2VjdGlvbiBmcm9tIHhlbi1zeW1zIGJlY2F1c2UgaXQg
Y2FuIGJlIHVzZWZ1bAo+ID4+IGZvciAibWFudWFsIiBFRkkgaW1hZ2UgcmVsb2NzIGdlbmVyYXRp
b24uIEhvd2V2ZXIsIEkgYW0gbm90IHN0cm9uZ2x5Cj4gPj4gdGllZCB0byBpdC4gSWYgeW91IHdp
c2ggdG8gZHJvcCBpdCBnbyBhaGVhZC4gSSBjYW4gcmVhZGQgaXQgbGF0dGVyIGlmCj4gPj4gSSBn
ZXQgYmFjayB0byBteSBuZXcgUEUgYnVpbGQgd29yay4KPiA+IAo+ID4gRG8geW91IG1lYW4gdGhh
dCB0aGUgZHVtbXkgLnJlbG9jIHNlY3Rpb24gYWRkZWQgdG8gbm9uLVBFIGJ1aWxkcyBjYW4KPiA+
IGJlIGRyb3BwZWQ/IChpZTogcmVtb3ZlIHhlbi9hcmNoL3g4Ni9lZmkvcmVsb2NzLWR1bW15LlMg
ZnJvbSB0aGUgYnVpbGQpCj4gCj4gR2l2ZW4gbXkgZWFybGllciByZXBseSBpdCdzIG5vdCBjbGVh
ciB0byBtZSB3aGF0IHlvdSBtZWFuIGJ5ICJyZW1vdmUiCj4gaGVyZS4gQXMgYSByZXN1bHQgLi4u
Cj4gCj4gPiBJJ20gc2xpZ2h0bHkgbG9zdCwgLnJlbG9jIGJlZ2luIGEgc2VjdGlvbiB0aGF0J3Mg
ZXhwbGljaXRseSBhZGRlZCB0bwo+ID4gbm9uLVBFIGJ1aWxkcyBieSByZWxvY3MtZHVtbXkuUyBJ
IGFzc3VtZWQgaXQgd2FzIG5lZWRlZCBmb3Igc29tZQo+ID4gcmVhc29uLgo+IAo+IC4uLiBpdCdz
IGFsc28gbm90IGNsZWFyIHdoYXQgZXhhY3RseSB5b3UgbWVhbiBoZXJlLCBhbmQgaGVuY2Ugd2hl
dGhlcgo+IHRoZXJlJ3MgYW55IHJlYXNvbiBuZWVkZWQgYmV5b25kIHRoZSByZWZlcmVuY2UgdG8g
dGhlIHR3byBib3VuZGluZwo+IHN5bWJvbHMgYnkgZWZpX2FyY2hfcmVsb2NhdGVfaW1hZ2UoKS4K
ClNvcnJ5IGZvciBub3QgYmVpbmcgY2xlYXIuIEJ5IHJlbW92ZSBJIG1lYW4gYGdpdCBybQp4ZW4v
YXJjaC94ODYvZWZpL3JlbG9jcy1kdW1teS5TYCBhbmQgZml4IHRoZSBidWlsZCwgbGlrZSB0aGUg
ZGlmZgphcHBlbmRlZCBiZWxvdy4KCklzIHRoZXJlIGFueSByZWFzb24gd2Ugc2hvdWxkIGtlZXAg
dGhlIGR1bW15IC5yZWxvYyBpbiB0aGUgRUxGCm91dHB1dD8KClRoYW5rcywgUm9nZXIuCi0tLTg8
LS0tCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZWZpL01ha2VmaWxlIGIveGVuL2FyY2gveDg2
L2VmaS9NYWtlZmlsZQppbmRleCA0YmMwYTE5NmU5Li41ODQ5NjA0NzY2IDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvZWZpL01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvTWFrZWZpbGUK
QEAgLTExLDYgKzExLDYgQEAgJChjYWxsIGNjLW9wdGlvbi1hZGQsY2ZsYWdzLXN0YWNrLWJvdW5k
YXJ5LENDLC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQpCiAkKEVGSU9CSik6IENGTEFHUy1z
dGFjay1ib3VuZGFyeSA6PSAkKGNmbGFncy1zdGFjay1ib3VuZGFyeSkKIAogb2JqLXkgOj0gc3R1
Yi5vCi1vYmotJChYRU5fQlVJTERfRUZJKSA6PSAkKEVGSU9CSikgcmVsb2NzLWR1bW15Lm8KK29i
ai0kKFhFTl9CVUlMRF9FRkkpIDo9ICQoRUZJT0JKKQogZXh0cmEtJChYRU5fQlVJTERfRUZJKSAr
PSBidWlsZGlkLm8KIG5vY292LSQoWEVOX0JVSUxEX0VGSSkgKz0gc3R1Yi5vCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290
LmgKaW5kZXggN2ExM2EzMGJjMC4uMmNmNDQwZTJhZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2VmaS9lZmktYm9vdC5oCisrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaApAQCAtMzks
NiArMzksNyBAQCBleHRlcm4gY29uc3QgaW50cHRlX3QgX19wYWdlX3RhYmxlc19zdGFydFtdLCBf
X3BhZ2VfdGFibGVzX2VuZFtdOwogI2RlZmluZSBQRV9CQVNFX1JFTE9DX0hJR0hMT1cgIDMKICNk
ZWZpbmUgUEVfQkFTRV9SRUxPQ19ESVI2NCAgIDEwCiAKKyNpZmRlZiBYRU5fQlVJTERfUEUKIGV4
dGVybiBjb25zdCBzdHJ1Y3QgcGVfYmFzZV9yZWxvY3MgewogICAgIHUzMiBydmE7CiAgICAgdTMy
IHNpemU7CkBAIC05Nyw2ICs5OCwxMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfcmVs
b2NhdGVfaW1hZ2UodW5zaWduZWQgbG9uZyBkZWx0YSkKICAgICAgICAgYmFzZV9yZWxvY3MgPSAo
Y29uc3Qgdm9pZCAqKShiYXNlX3JlbG9jcy0+ZW50cmllcyArIGkgKyAoaSAmIDEpKTsKICAgICB9
CiB9CisjZWxzZSAvKiAhWEVOX0JVSUxEX1BFICovCitzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2Fy
Y2hfcmVsb2NhdGVfaW1hZ2UodW5zaWduZWQgbG9uZyBkZWx0YSkKK3sKKyAgICBBU1NFUlRfVU5S
RUFDSEFCTEUoKTsKK30KKyNlbmRpZiAvKiBYRU5fQlVJTERfUEUgKi8KIAogZXh0ZXJuIGNvbnN0
IHMzMiBfX3RyYW1wb2xpbmVfcmVsX3N0YXJ0W10sIF9fdHJhbXBvbGluZV9yZWxfc3RvcFtdOwog
ZXh0ZXJuIGNvbnN0IHMzMiBfX3RyYW1wb2xpbmVfc2VnX3N0YXJ0W10sIF9fdHJhbXBvbGluZV9z
ZWdfc3RvcFtdOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2VmaS9yZWxvY3MtZHVtbXkuUyBi
L3hlbi9hcmNoL3g4Ni9lZmkvcmVsb2NzLWR1bW15LlMKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IGQ5MjhhODJkNTMuLjAwMDAwMDAwMDAKLS0tIGEveGVuL2FyY2gveDg2L2VmaS9yZWxv
Y3MtZHVtbXkuUworKysgL2Rldi9udWxsCkBAIC0xLDExICswLDAgQEAKLQotCS5zZWN0aW9uIC5y
ZWxvYywgImEiLCBAcHJvZ2JpdHMKLQkuYmFsaWduIDQKLUdMT0JBTChfX2Jhc2VfcmVsb2NzX3N0
YXJ0KQotCS5sb25nIDAKLQkubG9uZyA4Ci1HTE9CQUwoX19iYXNlX3JlbG9jc19lbmQpCi0KLQku
Z2xvYmwgVklSVF9TVEFSVCwgQUxUX1NUQVJUCi0JLmVxdSBWSVJUX1NUQVJULCBYRU5fVklSVF9T
VEFSVAotCS5lcXUgQUxUX1NUQVJULCBYRU5fVklSVF9FTkQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
