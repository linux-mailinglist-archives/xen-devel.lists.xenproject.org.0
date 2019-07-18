Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7B6CF1C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:49:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6jk-0002Lf-Kf; Thu, 18 Jul 2019 13:46:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MdgZ=VP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ho6ji-0002LY-JB
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:46:18 +0000
X-Inumbo-ID: 690baab2-a962-11e9-ac97-6b5696d25514
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 690baab2-a962-11e9-ac97-6b5696d25514;
 Thu, 18 Jul 2019 13:46:15 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4Wb3cmiVCO5Da/Jj2RzqHC6/aPiumIubipQ8DsIWpDoc8QMR2YzSR5F6FtDzvyzYe64fuEFWAE
 JY7BL3O1TTMWozX9Q0B5R5Ch6rmL4YTAAPMUp5fK3WDGOLonkE3w4kbMaXYRNIc6BZNMzenEW1
 VotbwqJ9SuP90jw0432NtqXma9b0rJSK0UvPeSBcEfQHF9FCnp0NyiI9ej98L2dfjfWfzBsW0u
 6P/D19bgLAbMXMZfG0xnIitBPxKlxNVJ32u8HQN2Mf6Krb0pjYGVC2NcfzOigDBYM7YZwk6hcF
 vNY=
X-SBRS: 2.7
X-MesageID: 3198980
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3198980"
Date: Thu, 18 Jul 2019 15:46:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717235426.GX1250@mail-itl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDE6NTQ6MjZBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDE3LCAyMDE5IGF0IDEyOjE4OjQzUE0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBh
dCAwMzowMDo0M0FNICswMjAwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4g
PiA+IEFsbG93IGRldmljZSBtb2RlbCBydW5uaW5nIGluIHN0dWJkb21haW4gdG8gZW5hYmxlL2Rp
c2FibGUgTVNJKC1YKSwKPiA+ID4gYnlwYXNzaW5nIHBjaWJhY2suIFdoaWxlIHBjaWJhY2sgaXMg
c3RpbGwgdXNlZCB0byBhY2Nlc3MgY29uZmlnIHNwYWNlCj4gPiA+IGZyb20gd2l0aGluIHN0dWJk
b21haW4sIGl0IHJlZnVzZSB0byB3cml0ZSB0bwo+ID4gPiBQQ0lfTVNJX0ZMQUdTX0VOQUJMRS9Q
Q0lfTVNJWF9GTEFHU19FTkFCTEUgaW4gbm9uLXBlcm1pc3NpdmUgbW9kZS4gV2hpY2gKPiA+ID4g
aXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGZvciBQViBkb21haW4gKHRoZSBtYWluIHVzZSBjYXNl
IGZvciBwY2liYWNrKSwKPiA+ID4gYXMgUFYgZG9tYWluIHNob3VsZCB1c2UgWEVOX1BDSV9PUF8q
IGNvbW1hbmRzIGZvciB0aGF0LiBVbmZvcnR1bmF0ZWx5Cj4gPiA+IHRob3NlIGNvbW1hbmRzIGFy
ZSBub3QgZ29vZCBmb3Igc3R1YmRvbWFpbiB1c2UsIGFzIHRoZXkgY29uZmlndXJlIE1TSSBpbgo+
ID4gPiBkb20wJ3Mga2VybmVsIHRvbywgd2hpY2ggc2hvdWxkIG5vdCBoYXBwZW4gZm9yIEhWTSBk
b21haW4uCj4gPiA+IAo+ID4gPiBUaGlzIG5ldyBwaHlzZGV2b3AgaXMgYWxsb3dlZCBvbmx5IGZv
ciBzdHViZG9tYWluIGNvbnRyb2xsaW5nIHRoZSBkb21haW4KPiA+ID4gd2hpY2ggb3duIHRoZSBk
ZXZpY2UuCj4gPiAKPiA+IEkgdGhpbmsgSSdtIG1pc3NpbmcgdGhhdCBwYXJ0LCBpcyB0aGlzIG1h
eWJlIGRvbmUgYnkgdGhlIFhTTSBzdHVmZj8KPiAKPiBZZXMsIHNwZWNpZmljYWxseSB4c21fbXNp
X2NvbnRyb2woWFNNX0RNX1BSSVYsIHBkZXYtPmRvbWFpbiwgLi4uKSBjYWxsLgo+IFhTTV9ETV9Q
UklWIGFsbG93cyBjYWxsIGlmIHNyYy0+aXNfcHJpdmlsZWdlZCwgb3IgaWYgc3JjLT50YXJnZXQg
PT0KPiB0YXJnZXQuIE5vdGUgdGhlIHRhcmdldCBiZWluZyBvd25lciBvZiB0aGUgZGV2aWNlIGhl
cmUuCgpPaCB0aGFua3MsIEknbSBjZXJ0YWlubHkgcXVpdGUgbG9zdCB3aGVuIGl0IGNvbWVzIHRv
IFhTTS4KCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8Oz
cmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gPiA+IC0tLQo+ID4gPiBD
aGFuZ2VzIGluIHYzOgo+ID4gPiAgLSBuZXcgcGF0Y2gKPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+
ID4gIC0gYWRqdXN0IGNvZGUgc3R5bGUKPiA+ID4gIC0gcy9tc2lfbXNpeC9tc2kvCj4gPiA+ICAt
IGFkZCBtc2lfc2V0X2VuYWJsZSBYU00gaG9vawo+ID4gPiAgLSBmbGF0dGVuIHN0cnVjdCBwaHlz
ZGV2X21zaV9zZXRfZW5hYmxlCj4gPiA+ICAtIGFkZCB0byBpbmNsdWRlL3hsYXQubHN0Cj4gPiA+
IENoYW5nZXMgaW4gdjU6Cj4gPiA+ICAtIHJlbmFtZSB0byBQSFlTREVWT1BfbXNpX2NvbnRyb2wK
PiA+ID4gIC0gY29tYmluZSAibW9kZSIgYW5kICJlbmFibGUiIGludG8gImZsYWdzIgo+ID4gPiAg
LSByZWZ1c2UgdG8gZW5hYmxlIGJvdGggTVNJIGFuZCBNU0ktWCwgYW5kIGFsc28gdG8gZW5hYmxl
IE1TSSgtWCkgb24KPiA+ID4gICAgaW5jYXBhYmxlIGRldmljZQo+ID4gPiAgLSBkaXNhYmxlL2Vu
YWJsZSBJTlR4IHdoZW4gZW5hYmxpbmcvZGlzYWJsaW5nIE1TSSAoPykKPiA+IAo+ID4gWW91IGRv
bid0IGVuYWJsZSBJTlR4IHdoZW4gTVNJIGlzIGRpc2FibGVkLgo+IAo+IEFoLCBpbmRlZWQuIFdo
ZW4gSSBsb29rIGZvciBzaW1pbGFyIGNvZGUgaW4gWGVuIGVsc2V3aGVyZSwgSSBmb3VuZAo+IF9f
cGNpX2Rpc2FibGVfbXNpKCkgaGFzIGV4dHJhIGNvbmRpdGlvbnMgZm9yIHBjaV9pbnR4KGRldiwg
dHJ1ZSk6Cj4gCj4gICAgIGlmICggZW50cnktPmlycSA+IDAgJiYgIShpcnFfdG9fZGVzYyhlbnRy
eS0+aXJxKS0+c3RhdHVzICYgSVJRX0dVRVNUKSApCj4gICAgICAgICBwY2lfaW50eChkZXYsIHRy
dWUpOwo+IAo+IFNob3VsZCB0aGlzIGJlIG1pcnJvcmVkIHRoZXJlIHRvbz8gSXNuJ3QgSVJRX0dV
RVNUIGFsd2F5cyBzZXQgaW4gY2FzZSBvZgo+IHBhc3N0aHJvdWdoIHRvIEhWTSAodGhlIGNhc2Ug
dGhpcyBwYXRjaCBjYXJlKT8KCkl0IGlzLCBidXQgeW91IHdvdWxkIGhhdmUgdG8gaXRlcmF0ZSBv
dmVyIGFsbCB0aGUgZW50cmllcywgd2hpY2ggSQpkb24ndCB0aGluayBpdCdzIGludGVuZGVkIGhl
cmUuIEEgZ3Vlc3QgY291bGQgZGlzYWJsZSBNU0koLVgpIHdoaWxlCmhhdmluZyBlbnRyaWVzIHNl
dHVwLCBhbmQgSSBkb24ndCB0aGluayB0ZWFyaW5nIGRvd24gdGhvc2UgZW50cmllcwpzaG91bGQg
YmUgZG9uZSBoZXJlLgoKSW4gZmFjdCBJIGRvbid0IHRoaW5rIElOVHggc2hvdWxkIGJlIGVuYWJs
ZWQgd2hlbiBNU0koLVgpIGlzIGRpc2FibGVkLApRRU1VIGFscmVhZHkgdHJhcHMgd3JpdGVzIHRv
IHRoZSBjb21tYW5kIHJlZ2lzdGVyLCBhbmQgaXQgd2lsbCBtYW5hZ2UKSU5UeCBlbmFibGluZy9k
aXNhYmxpbmcgYnkgaXRzZWxmLiBJIHRoaW5rIHRoZSBvbmx5IGNoZWNrIHJlcXVpcmVkIGlzCnRo
YXQgTVNJKC1YKSBjYW5ub3QgYmUgZW5hYmxlZCBpZiBJTlR4IGlzIGFsc28gZW5hYmxlZC4gSW4g
dGhlIHNhbWUKd2F5IGJvdGggTVNJIGNhc3BhYmlsaXRpZXMgY2Fubm90IGJlIGVuYWJsZWQgc2lt
dWx0YW5lb3VzbHkuIFRoZQpmdW5jdGlvbiBzaG91bGQgbm90IGV4cGxpY2l0bHkgZGlzYWJsZSBh
bnkgb2YgdGhlIG90aGVyIGNhcGFiaWxpdGllcywKYW5kIGp1c3QgcmV0dXJuIC1FQlVTWSBpZiB0
aGUgY2FsbGVyIGF0dGVtcHRzIGZvciBleGFtcGxlIHRvIGVuYWJsZQpNU0kgd2hpbGUgSU5UeCBv
ciBNU0ktWCBpcyBlbmFibGVkLgoKPiA+IGlmICggZW5hYmxlICkKPiA+IHsKPiA+ICAgICBwY2lf
aW50eChwZGV2LCBmYWxzZSk7Cj4gPiAgICAgaWYgKCBtc2l4ICkKPiA+ICAgICAgICAgbXNpX3Nl
dF9lbmFibGUocGRldiwgZmFsc2UpOwo+ID4gICAgIGVsc2UKPiA+ICAgICAgICAgbXNpeF9zZXRf
ZW5hYmxlKHBkZXYsIGZhbHNlKTsKPiA+IH0KPiA+IAo+ID4gaWYgKCBtc2l4ICkKPiA+ICAgICBt
c2l4X3NldF9lbmFibGUocGRldiwgZW5hYmxlKTsKPiA+IGVsc2UKPiA+ICAgICBtc2lfc2V0X2Vu
YWJsZShwZGV2LCBlbmFibGUpOwo+ID4gCj4gPiBOb3RlIHRoYXQgaW4gdGhlIHNhbWUgd2F5IHlv
dSBtYWtlIHN1cmUgSU5UeCBpcyBkaXNhYmxlZCwgeW91IHNob3VsZAo+ID4gYWxzbyBtYWtlIHN1
cmUgTVNJIGFuZCBNU0ktWCBhcmUgbm90IGVuYWJsZWQgYXQgdGhlIHNhbWUgdGltZS4KPiAKPiBU
aGlzIGlzIGV4YWN0bHkgd2hhdCB0aGUgY29kZSBpbiB0aGUgcGF0Y2ggYWxyZWFkeSBkb2VzLgoK
U2VlIG15IHJhbnQgYWJvdmUsIEkgZG9uJ3QgdGhpbmsgdGhpcyBoeXBlcmNhbGwgc2hvdWxkIGJl
IHRvdWNoaW5nCklOVHgsIG9yIGRpc2FibGluZy9lbmFibGluZyBvdGhlciBNU0kgY2FwYWJpbGl0
aWVzLCBhbmQgaW5zdGVhZCBqdXN0CnJldHVybmluZyAtRUJVU1kgaWYgdGhlIHJlcXVlc3RlZCBv
cGVyYXRpb24gaXMgbm90IGFjY2VwdGVkIGJlY2F1c2UKdGhlcmUgYXJlIG90aGVyIGNhcGFiaWxp
dGllcyBlbmFibGVkLgoKPiA+ID4gKy8qIHdoZW4gUEhZU0RFVk9QX01TSV9DT05UUk9MX01TSVgg
bm90IHNldCwgY29udHJvbCBNU0kgKi8KPiA+ID4gKyNkZWZpbmUgUEhZU0RFVk9QX01TSV9DT05U
Uk9MX01TSVggICAgMQo+ID4gPiArLyogd2hlbiBQSFlTREVWT1BfTVNJX0NPTlRST0xfRU5BQkxF
IG5vdCBzZXQsIGRpc2FibGUgKi8KPiA+ID4gKyNkZWZpbmUgUEhZU0RFVk9QX01TSV9DT05UUk9M
X0VOQUJMRSAgMgo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIFBIWVNERVZPUF9tc2lfY29udHJvbCAg
IDMyCj4gPiA+ICtzdHJ1Y3QgcGh5c2Rldl9tc2lfY29udHJvbCB7Cj4gPiA+ICsgICAgLyogSU4g
Ki8KPiA+ID4gKyAgICB1aW50MTZfdCBzZWc7Cj4gPiA+ICsgICAgdWludDhfdCBidXM7Cj4gPiA+
ICsgICAgdWludDhfdCBkZXZmbjsKPiA+ID4gKyAgICB1aW50OF90IGZsYWdzOwo+ID4gCj4gPiBJ
IHdvdWxkIGp1c3QgbWFrZSBmbGFncyB1aW50MzJfdCwgdGhlIHBhZGRpbmcgdG8gYWxpZ24gaXMg
Z29pbmcgdG8gYmUKPiA+IGFkZGVkIGluIGFueSBjYXNlLgo+IAo+IFRoYXQgd291bGQgbWFrZSB0
aGUgc3RydWN0dXJlIDggYnl0ZXMsIG5vdCA2LiBEaWQgeW91IG1lYW4gdWludDE2X3Q/IAo+IEJ1
dCBzdHJ1Y3R1cmUgc2l6ZSBoZXJlIGRvZXNuJ3QgcmVhbGx5IG1hdHRlciBhbnl3YXkuCgpZZXMg
c29ycnksIHVpbnQxNl90LiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiwgYnV0IHNpbmNl
IHRoZQpzdHJ1Y3R1cmUgaXMgYWxyZWFkeSA2Ynl0ZXMgaW4gc2l6ZSwgSSB0aG91Z2h0IGl0IG1p
Z2h0IGJlIGJldHRlciB0bwpoYXZlIHRoYXQgcGFkZGluZyBhc3NpZ25lZCB0byBmbGFncyBpbnN0
ZWFkIG9mIGJlaW5nIGhpZGRlbi4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
