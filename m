Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D86FB95
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 10:48:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpTxA-0003wu-Ip; Mon, 22 Jul 2019 08:45:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbCh=VT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpTx9-0003wn-AC
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 08:45:51 +0000
X-Inumbo-ID: 1afb2216-ac5d-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1afb2216-ac5d-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 08:45:50 +0000 (UTC)
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
IronPort-SDR: YTPY+rk3grW7u1v41kjz+68uZEU9BS44vZx9LPxFGp50LBr5iXjpz4CAOq6ibmDaWhvDPxAAPr
 OwYqTOwt9+a1cZyBaaEXoiGp38b+BLyLmsnkkwDkM1Xm4BNlHwxt0VwxP9miT7qY7WE9D3J26+
 smh87VO0gDL6tT3QHYAmw03bVuwdgMY3z/1R+uHRsFLsVQOjaFPv/0gE5prKGU+39/jCvPFCos
 LcHxP1zN0443ofHRf4t/SGB83rOGnH5JonjaUR0lWyDN8Ld3oLld4p2MrXyNv/F4KF0mAg+MAp
 QFg=
X-SBRS: 2.7
X-MesageID: 3287013
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,294,1559534400"; 
   d="scan'208";a="3287013"
Date: Mon, 22 Jul 2019 10:45:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190722084533.a2tq7qzpunepiguv@Air-de-Roger>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
 <49a30043-1dd1-0069-1e3b-c593542f425c@arm.com>
 <20190720212102.GC1250@mail-itl>
 <29595834-4c39-b806-e54d-c73968dd65a9@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29595834-4c39-b806-e54d-c73968dd65a9@arm.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Tim Deegan <tim@xen.org>, Simon
 Gaiser <simon@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBKdWwgMjEsIDIwMTkgYXQgMDc6MDU6MTZQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDcvMjAvMTkgMTA6MjEgUE0sIE1hcmVrIE1hcmN6eWtvd3NraS1H
w7NyZWNraSB3cm90ZToKPiA+IE9uIFNhdCwgSnVsIDIwLCAyMDE5IGF0IDA1OjQ4OjU2UE0gKzAx
MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGksCj4gPiA+IAo+ID4gPiBTb3JyeSBmb3Ig
anVtcGluZyBsYXRlIGluIHRoZSBkaXNjdXNzaW9uLgo+ID4gPiAKPiA+ID4gT24gNy8xNy8xOSAy
OjAwIEFNLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4gPiA+ID4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pcnEuaCBiL3hlbi9pbmNsdWRlL3hlbi9pcnEuaAo+ID4g
PiA+IGluZGV4IDU4NmI3ODMuLmM3YTZhODMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEveGVuL2luY2x1
ZGUveGVuL2lycS5oCj4gPiA+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lycS5oCj4gPiA+ID4g
QEAgLTkxLDYgKzkxLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgaXJxX2Rlc2Mgewo+ID4gPiA+ICAgICAg
ICBzcGlubG9ja190IGxvY2s7Cj4gPiA+ID4gICAgICAgIHN0cnVjdCBhcmNoX2lycV9kZXNjIGFy
Y2g7Cj4gPiA+ID4gICAgICAgIGNwdW1hc2tfdmFyX3QgYWZmaW5pdHk7Cj4gPiA+ID4gKyAgICBk
b21pZF90IGNyZWF0b3JfZG9taWQ7IC8qIHdlYWsgcmVmZXJlbmNlIHRvIGRvbWFpbiBoYW5kbGlu
ZyB0aGlzIElSUSAqLwo+ID4gPiAKPiA+ID4gVGhpcyB4ODYgb25seS4gQ2FuIHRoaXMgYmUgbW92
ZWQgaW4gYXJjaF9pcnFfZGVzYyB0byBhdm9pZCBpbmNyZWFzaW5nIHRoZQo+ID4gPiBzdHJ1Y3R1
cmUgb24gQXJtPwo+ID4gCj4gPiBIb3cgKGlmIGF0IGFsbCkgUENJIHBhc3N0aHJvdWdoIGlzIHN1
cHBvcnRlZCBvbiBBUk0/IElzIHFlbXUgaW52b2x2ZWQ/Cj4gPiBJZiBzbywgYW5kIGlmIHRoYXQg
cWVtdSB3b3VsZCBiZSBpc29sYXRlZCBpbiBzdHViZG9tYWluLCBJIHRoaW5rIEFSTQo+ID4gd291
bGQgbmVlZCBhIHNpbWlsYXIgZmVhdHVyZS4gSWYgaXQgbm90IHRoZSBjYXNlIHJpZ2h0IG5vdywg
YnV0IGl0IGlzCj4gPiBwbGFubmVkLCBkbyB5b3UgdGhpbmsgaXQncyB3b3J0aCBtb3ZpbmcgaXQg
dG8gYXJjaF9pcnFfZGVzYyBhbmQgcG9zc2libHkKPiA+IG1vdmUgYmFjayBsYXRlcj8KPiAKPiBQ
Q0kgcGFzc3Rocm91Z2ggaXMgbm90IHlldCBzdXBwb3J0ZWQgb24gQXJtLiBIb3dldmVyLCBJIHdv
dWxkIG5vdCBleHBlY3QKPiBRRU1VIHRvIGJlIGludm9sdmVkIGF0IGFsbCBmb3IgQXJtLgo+IAo+
IEluIGFueSBjYXNlLCBJIHdvdWxkIHN0aWxsIHByZWZlciB0byBrZWVwIGZpZWxkIGluIGFyY2hf
aXJxX2Rlc2MgdW50aWwgd2UKPiBzZWUgYW55IHVzYWdlIG9uIEFybS4KCkknbSBmaW5lIHdpdGgg
cHV0dGluZyBpdCBpbnNpZGUgb2YgdGhlIGFyY2ggc3RydWN0LCBidXQgdGhlcmUncwpub3RoaW5n
IHg4NiBzcGVjaWZpYyBhYm91dCB0aGlzIGZpZWxkLiBSZWdhcmRsZXNzIG9mIHdoZXRoZXIgeW91
IHVzZQpRRU1VIG9yIHNvbWV0aGluZyBkaWZmZXJlbnQsIGlmIHlvdSB3YW50IHRvIGFsbG93IHBh
c3N0aHJvdWdoIG9uIEFSTQpmcm9tIGRvbWFpbnMgIT0gZG9tMCB5b3Ugd2lsbCBuZWVkIHRoaXMg
ZmllbGQgYW55d2F5LCBzbyB0aGF0IHRoZQpkb21haW4gcnVubmluZyB0aGUgcGFzc3Rocm91Z2gg
ZW11bGF0b3IgY2FuIHByb3Blcmx5IG1hbmFnZSBpbnRlcnJ1cHRzCm9uIGJlaGFsZiBvZiB0aGUg
Z3Vlc3QuCgpJZiB5b3Ugb25seSBwbGFuIHRvIHN1cHBvcnQgc29tZXRoaW5nIGxpa2UgdlBDSSBp
bnNpZGUgb2YgWGVuIHRoZW4gSQpndWVzcyB0aGVyZSdzIG5vIG5lZWQgZm9yIHRoZSBmaWVsZCwg
c2luY2UgWGVuIGlzIGFsd2F5cyBnb2luZyB0byBiZQp0aGUgb25lIGRvaW5nIHRoZSBwYXNzdGhy
b3VnaC4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
