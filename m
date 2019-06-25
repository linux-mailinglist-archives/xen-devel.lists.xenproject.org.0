Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757DD54F5A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 14:52:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfks8-0001XP-De; Tue, 25 Jun 2019 12:48:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ez/b=UY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hfks7-0001XG-0R
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 12:48:27 +0000
X-Inumbo-ID: 8472bd72-9747-11e9-a564-3f71b4846dc7
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8472bd72-9747-11e9-a564-3f71b4846dc7;
 Tue, 25 Jun 2019 12:48:23 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5kaaSmpQjcHcoccKLdI5CYfzgiOwvgyT6Jk2I1BmhJwH93D9k58qFswAhuwwJOozR+AVxhdU5r
 hV9j5BAeuBD8wbV2EQj5j1mX31k7DRqNEVYiSwcD/dVgSI4F79PRLKtkt4G9VVFcPz89Kigm0x
 8V/EhKQh/IsZGrEKN1okkw/7pf6z1s9O2Hw36oQbk0vigizlC0y7imHf9T29O5sP82FK2b+Be3
 yhUCL1MtRu+1LOf/WJw4eqNEFG+EYVd//s2Vg0qpmBfC/BkvtR04+rSydD5JGK9ehi2/MECVal
 uSc=
X-SBRS: 2.7
X-MesageID: 2204302
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,415,1557201600"; 
   d="scan'208";a="2204302"
Date: Tue, 25 Jun 2019 14:48:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190625124813.hnvxyvbvjfzdbfib@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
 <20190624112402.thhrmu7tynfnjujw@tomti.i.net-space.pl>
 <20190625081034.n7bvsd4zdcdqsfua@MacBook-Air-de-Roger.local>
 <5D11E6D6020000780023ADDF@prv1-mh.provo.novell.com>
 <20190625110849.lo7zxh3p5ico4rdd@MacBook-Air-de-Roger.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625110849.lo7zxh3p5ico4rdd@MacBook-Air-de-Roger.local>
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
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDE6MDg6NDlQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAwMzoxODoxNEFNIC0wNjAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAyNS4wNi4xOSBhdCAxMDoxMCwgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiA+ID4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDE6MjQ6MDJQ
TSArMDIwMCwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+ID4gPj4gT24gRnJpLCBKdW4gMjEsIDIwMTkg
YXQgMTI6MzQ6MTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+PiA+ID4+PiBPbiAx
OS4wNi4xOSBhdCAxNzowNiwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4+ID4g
PiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAwNjo1NzowNUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+ID4+ID4gPj4gPj4+IE9uIDE5LjA2LjE5IGF0IDEzOjAyLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4gPj4gPiA+PiA+IElmIHRoZSBoeXBlcnZpc29yIGhhcyBiZWVu
IGJ1aWx0IHdpdGggRUZJIHN1cHBvcnQgKGllOiBtdWx0aWJvb3QyKS4KPiA+ID4+ID4gPj4gPiBU
aGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24gY29ycmVjdGx5IGluIHRo
ZSBvdXRwdXQKPiA+ID4+ID4gPj4gPiBiaW5hcnksIG9yIGVsc2UgdGhlIGxpbmtlciBtaWdodCBw
bGFjZSAucmVsb2MgYmVmb3JlIHRoZSAudGV4dAo+ID4gPj4gPiA+PiA+IHNlY3Rpb24uCj4gPiA+
PiA+ID4+ID4KPiA+ID4+ID4gPj4gPiBOb3RlIHRoYXQgdGhlIC5yZWxvYyBzZWN0aW9uIGlzIG1v
dmVkIGJlZm9yZSAuYnNzIGZvciB0d28gcmVhc29uczogaW4KPiA+ID4+ID4gPj4gPiBvcmRlciBm
b3IgdGhlIHJlc3VsdGluZyBiaW5hcnkgdG8gbm90IGNvbnRhaW4gYW55IHNlY3Rpb24gd2l0aCBk
YXRhCj4gPiA+PiA+ID4+ID4gYWZ0ZXIgLmJzcywgc28gdGhhdCB0aGUgZmlsZSBzaXplIGNhbiBi
ZSBzbWFsbGVyIHRoYW4gdGhlIGxvYWRlZAo+ID4gPj4gPiA+PiA+IG1lbW9yeSBzaXplLCBhbmQg
YmVjYXVzZSB0aGUgZGF0YSBpdCBjb250YWlucyBpcyByZWFkLW9ubHksIHNvIGl0Cj4gPiA+PiA+
ID4+ID4gYmVsb25ncyB3aXRoIHRoZSBvdGhlciBzZWN0aW9ucyBjb250YWluaW5nIHJlYWQtb25s
eSBkYXRhLgo+ID4gPj4gPiA+Pgo+ID4gPj4gPiA+PiBXaGlsZSB0aGlzIG1heSBiZSBmaW5lIGZv
ciBFTEYsIEknbSBhZnJhaWQgaXQgd291bGQgYmUgY2FsbGluZyBmb3IKPiA+ID4+ID4gPj4gc3Vi
dGxlIGlzc3VlcyB3aXRoIHhlbi5lZmkgKGkuZS4gdGhlIFBFIGJpbmFyeSk6IFRoZXJlIGEgLnJl
bG9jCj4gPiA+PiA+ID4+IHNlY3Rpb24gaXMgZ2VuZXJhbGx5IGV4cGVjdGVkIHRvIGNvbWUgYWZ0
ZXIgIm5vcm1hbCIgZGF0YQo+ID4gPj4gPiA+PiBzZWN0aW9ucy4KPiA+ID4+ID4gPgo+ID4gPj4g
PiA+IE9LLCB3b3VsZCB5b3UgbGlrZSBtZSB0byBsZWF2ZSB0aGUgLnJlbG9jIHNlY3Rpb24gYXQg
dGhlIHByZXZpb3VzCj4gPiA+PiA+ID4gcG9zaXRpb24gZm9yIEVGSSBidWlsZHMgdGhlbj8KPiA+
ID4+ID4KPiA+ID4+ID4gV2VsbCwgdGhpcyBwYXJ0IGlzIGEgcmVxdWlyZW1lbnQsIG5vdCBhIHF1
ZXN0aW9uIG9mIG1lIGxpa2luZyB5b3UKPiA+ID4+ID4gdG8gZG8gc28uCj4gPiA+PiA+Cj4gPiA+
PiA+ID4gT3IgZG8gd2UgcHJlZmVyIHRvIGxlYXZlIC5yZWxvYyBvcnBoYW5lZCBpbiB0aGUgRUxG
IGJ1aWxkPwo+ID4gPj4gPgo+ID4gPj4gPiBEYW5pZWwgbWlnaHQgaGF2ZSBhbiBvcGluaW9uIGhl
cmUgd2l0aCBoaXMgcGxhbnMgdG8gYWN0dWFsbHkKPiA+ID4+ID4gYWRkIHJlbG9jYXRpb25zIHRo
ZXJlIGluIHRoZSBub24tbGlua2VyLWdlbmVyYXRlZC1QRSBidWlsZC4gSQo+ID4gPj4gPiBkb24n
dCBoYXZlIGEgc3Ryb25nIG9waW5pb24gZWl0aGVyIHdheSwgYXMgbG9uZyBhcyB0aGUKPiA+ID4+
ID4gY3VycmVudCBtZXRob2Qgb2YgYnVpbGRpbmcgZ2V0cyBsZWZ0IGFzIGlzIChvciBldmVuIHNp
bXBsaWZpZWQpLgo+ID4gPj4gCj4gPiA+PiBJIHdvdWxkIG5vdCBkcm9wIC5yZWxvYyBzZWN0aW9u
IGZyb20geGVuLXN5bXMgYmVjYXVzZSBpdCBjYW4gYmUgdXNlZnVsCj4gPiA+PiBmb3IgIm1hbnVh
bCIgRUZJIGltYWdlIHJlbG9jcyBnZW5lcmF0aW9uLiBIb3dldmVyLCBJIGFtIG5vdCBzdHJvbmds
eQo+ID4gPj4gdGllZCB0byBpdC4gSWYgeW91IHdpc2ggdG8gZHJvcCBpdCBnbyBhaGVhZC4gSSBj
YW4gcmVhZGQgaXQgbGF0dGVyIGlmCj4gPiA+PiBJIGdldCBiYWNrIHRvIG15IG5ldyBQRSBidWls
ZCB3b3JrLgo+ID4gPiAKPiA+ID4gRG8geW91IG1lYW4gdGhhdCB0aGUgZHVtbXkgLnJlbG9jIHNl
Y3Rpb24gYWRkZWQgdG8gbm9uLVBFIGJ1aWxkcyBjYW4KPiA+ID4gYmUgZHJvcHBlZD8gKGllOiBy
ZW1vdmUgeGVuL2FyY2gveDg2L2VmaS9yZWxvY3MtZHVtbXkuUyBmcm9tIHRoZSBidWlsZCkKPiA+
IAo+ID4gR2l2ZW4gbXkgZWFybGllciByZXBseSBpdCdzIG5vdCBjbGVhciB0byBtZSB3aGF0IHlv
dSBtZWFuIGJ5ICJyZW1vdmUiCj4gPiBoZXJlLiBBcyBhIHJlc3VsdCAuLi4KPiA+IAo+ID4gPiBJ
J20gc2xpZ2h0bHkgbG9zdCwgLnJlbG9jIGJlZ2luIGEgc2VjdGlvbiB0aGF0J3MgZXhwbGljaXRs
eSBhZGRlZCB0bwo+ID4gPiBub24tUEUgYnVpbGRzIGJ5IHJlbG9jcy1kdW1teS5TIEkgYXNzdW1l
ZCBpdCB3YXMgbmVlZGVkIGZvciBzb21lCj4gPiA+IHJlYXNvbi4KPiA+IAo+ID4gLi4uIGl0J3Mg
YWxzbyBub3QgY2xlYXIgd2hhdCBleGFjdGx5IHlvdSBtZWFuIGhlcmUsIGFuZCBoZW5jZSB3aGV0
aGVyCj4gPiB0aGVyZSdzIGFueSByZWFzb24gbmVlZGVkIGJleW9uZCB0aGUgcmVmZXJlbmNlIHRv
IHRoZSB0d28gYm91bmRpbmcKPiA+IHN5bWJvbHMgYnkgZWZpX2FyY2hfcmVsb2NhdGVfaW1hZ2Uo
KS4KPiAKPiBTb3JyeSBmb3Igbm90IGJlaW5nIGNsZWFyLiBCeSByZW1vdmUgSSBtZWFuIGBnaXQg
cm0KPiB4ZW4vYXJjaC94ODYvZWZpL3JlbG9jcy1kdW1teS5TYCBhbmQgZml4IHRoZSBidWlsZCwg
bGlrZSB0aGUgZGlmZgo+IGFwcGVuZGVkIGJlbG93LgoKVGhlIGNodW5rIGJlbG93IHdpbGwgbm90
IHdvcmsgYmVjYXVzZSByZWxvY3MtZHVtbXkgaXMgYWxzbyBuZWVkZWQKYnkgdGhlIEVGSSBidWls
ZC4gSSdtIGhvd2V2ZXIgbG9zdCBhdCB3aHkgdGhpcyBpcyByZXF1aXJlZCwgYW5kIHRoZQpjb21t
aXQgbWVzc2FnZSB0aGF0IGludHJvZHVjZWQgdGhlIGZpbGUgKGJmNjUwMWE2MmUpIGRvZXNuJ3Qg
YWRkIGFueQpyZWFzb25pbmcuCgpJcyBtYXliZSAucmVsb2MgbWFuZGF0b3J5IGZvciBQRSBmb3Jt
YXQ/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
