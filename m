Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7F737990
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 18:31:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYvGF-0000YV-2J; Thu, 06 Jun 2019 16:29:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATwH=UF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hYvGD-0000YP-Qj
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 16:29:05 +0000
X-Inumbo-ID: 31ee8852-8878-11e9-8603-33cceb201940
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31ee8852-8878-11e9-8603-33cceb201940;
 Thu, 06 Jun 2019 16:29:03 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=SoftFail smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 64q8f7yZmMhszNgICr12Zzz5XFWgRQPQwTKdd+ZTmI/T1T3qdGsK/6IFyFoz+J2pBqdOL0gZIj
 2d7bWTnYQYIHARH+kIXJl6JhTO1Xp8jZTeJJV3C9mgURFmsplWji1o6AGuF76stC6UT4srFdFK
 dGGm/bcR1DqODRuW4UIdV9702j/R2Rmp2NZf2UdNQfaN16d/fIRJ2v5yrCdAS3H4sIreGtcvrw
 6J+4h9B+YRsiaszjr3oy+yGrnLh7Qg9ViN9qZqMxRPwX9MYjM41uzgZa/cYh9Q1B10gMclml6W
 cBM=
X-SBRS: -0.9
X-MesageID: 1387503
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,560,1557201600"; 
   d="scan'208";a="1387503"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 04/12] pci: make PCI_SBDF2 return a
 pci_sbdf_t
Thread-Index: AQHVHEa0DjJS7EJ5PEeTWCtwaOUxuaaOe04QgAA0HICAACGv0A==
Date: Thu, 6 Jun 2019 16:28:58 +0000
Message-ID: <b854c588c1384900a7ba5c3a5448864b@AMSPEX02CL03.citrite.net>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-5-roger.pau@citrix.com>
 <4ca7756ef46f4bd4aa08fbf2ac838200@AMSPEX02CL03.citrite.net>
 <20190606162735.wppqpdb6wpa7kapb@Air-de-Roger>
In-Reply-To: <20190606162735.wppqpdb6wpa7kapb@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 04/12] pci: make PCI_SBDF2 return a
 pci_sbdf_t
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
Cc: Kevin
 Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZQo+IFNl
bnQ6IDA2IEp1bmUgMjAxOSAxNzoyOAo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBj
aXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pCj4gPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlCj4gRHVubGFwIDxHZW9yZ2UuRHVu
bGFwQGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgSWFuIEphY2tzb24KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFRpbSAoWGVuLm9yZykg
PHRpbUB4ZW4ub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEphbgo+
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBb
UEFUQ0ggdjIgMDQvMTJdIHBjaTogbWFrZSBQQ0lfU0JERjIgcmV0dXJuIGEgcGNpX3NiZGZfdAo+
IAo+IE9uIFRodSwgSnVuIDA2LCAyMDE5IGF0IDAxOjIyOjMwUE0gKzAyMDAsIFBhdWwgRHVycmFu
dCB3cm90ZToKPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gRnJvbTogWGVu
LWRldmVsIFttYWlsdG86eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmddIE9u
IEJlaGFsZiBPZiBSb2dlciBQYXUgTW9ubmUKPiA+ID4gU2VudDogMDYgSnVuZSAyMDE5IDEwOjAy
Cj4gPiA+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+ID4gQ2M6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgV2VpIExpdQo+ID4gPiA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVz
enV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAKPiA+ID4g
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIz
QGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbgo+ID4gPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47
IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT47IEphbgo+ID4gPiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+IFN1YmplY3Q6IFtYZW4tZGV2ZWxd
IFtQQVRDSCB2MiAwNC8xMl0gcGNpOiBtYWtlIFBDSV9TQkRGMiByZXR1cm4gYSBwY2lfc2JkZl90
Cj4gPiA+Cj4gPiA+IEFuZCBmaXggaXQncyBvbmx5IGNhbGxlci4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+IC0t
LQo+ID4gPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gPiA+IENjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gPiBDYzogR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+ID4gPiBDYzogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPiA+IENjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gPiA+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgo+ID4gPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPgo+ID4gPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+ID4gPiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gPiA+IENjOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+ID4gPiAtLS0KPiA+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9k
bWFyLmMgfCAyICstCj4gPiA+ICB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICAgICAgIHwg
MyArKy0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2RtYXIuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKPiA+ID4gaW5kZXgg
NTlhNDZjZDFjNi4uYjg1OGZlN2M4MCAxMDA2NDQKPiA+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2RtYXIuYwo+ID4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92
dGQvZG1hci5jCj4gPiA+IEBAIC0xMDQ3LDcgKzEwNDcsNyBAQCBpbnQgaW50ZWxfaW9tbXVfZ2V0
X3Jlc2VydmVkX2RldmljZV9tZW1vcnkoaW9tbXVfZ3JkbV90ICpmdW5jLCB2b2lkICpjdHh0KQo+
ID4gPgo+ID4gPiAgICAgICAgICByYyA9IGZ1bmMoUEZOX0RPV04ocm1yci0+YmFzZV9hZGRyZXNz
KSwKPiA+ID4gICAgICAgICAgICAgICAgICAgIFBGTl9VUChybXJyLT5lbmRfYWRkcmVzcykgLSBQ
Rk5fRE9XTihybXJyLT5iYXNlX2FkZHJlc3MpLAo+ID4gPiAtICAgICAgICAgICAgICAgICAgUENJ
X1NCREYyKHJtcnItPnNlZ21lbnQsIGJkZiksIGN0eHQpOwo+ID4gPiArICAgICAgICAgICAgICAg
ICAgUENJX1NCREYyKHJtcnItPnNlZ21lbnQsIGJkZikuc2JkZiwgY3R4dCk7Cj4gPiA+Cj4gPiA+
ICAgICAgICAgIGlmICggdW5saWtlbHkocmMgPCAwKSApCj4gPiA+ICAgICAgICAgICAgICByZXR1
cm4gcmM7Cj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmggYi94ZW4vaW5j
bHVkZS94ZW4vcGNpLmgKPiA+ID4gaW5kZXggOWVhNDE3ODlkMC4uMzBhZmFjYTgzOCAxMDA2NDQK
PiA+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPiA+ICsrKyBiL3hlbi9pbmNsdWRl
L3hlbi9wY2kuaAo+ID4gPiBAQCAtMzYsNyArMzYsOCBAQAo+ID4gPiAgI2RlZmluZSBQQ0lfQkRG
MihiLGRmKSAgKCgoKGIpICYgMHhmZikgPDwgOCkgfCAoKGRmKSAmIDB4ZmYpKQo+ID4gPiAgI2Rl
ZmluZSBQQ0lfU0JERihzLGIsZCxmKSBcCj4gPiA+ICAgICAgKChwY2lfc2JkZl90KSB7IC5zYmRm
ID0gKCgocykgJiAweGZmZmYpIDw8IDE2KSB8IFBDSV9CREYoYixkLGYpIH0pCj4gPiA+IC0jZGVm
aW5lIFBDSV9TQkRGMihzLGJkZikgKCgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCAoKGJkZikgJiAw
eGZmZmYpKQo+ID4gPiArI2RlZmluZSBQQ0lfU0JERjIocyxiZGYpIFwKPiA+ID4gKyAgICAoKHBj
aV9zYmRmX3QpIHsgLnNiZGYgPSAoKChzKSAmIDB4ZmZmZikgPDwgMTYpIHwgKChiZGYpICYgMHhm
ZmZmKSB9KQo+ID4KPiA+IFBlcmhhcHMuLi4KPiA+Cj4gPiAoKHBjaV9zYmRmX3QpIHsgLnNlZyA9
IHMsIC5iZGYgPSBiZGYgfSkKPiAKPiBUaGF0IEknbSBhZnJhaWQgd29uJ3Qgd29yayB3aXRoIG9s
ZGVyIHZlcnNpb25zIG9mIGdjYy4KPiAKClllYWgsIEkgZ3Vlc3NlZCB0aGF0IHdvdWxkIGJlIHRo
ZSBjYXNlIGFmdGVyIEphbidzIHJlcGx5IG9uIHBhdGNoICMzLiBTaGFtZSB0aG91Z2guCgogIFBh
dWwKCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
