Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6154893D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:48:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hculV-0007KO-W5; Mon, 17 Jun 2019 16:45:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JT4l=UQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hculU-0007KJ-HA
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:45:52 +0000
X-Inumbo-ID: 5b968af6-911f-11e9-a6de-973c76944586
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b968af6-911f-11e9-a6de-973c76944586;
 Mon, 17 Jun 2019 16:45:48 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nbsi8hxYU8uehLQNpHdOUnkTBbXHr8DkPGtF7GnrdJYIoAaRLJDHZ+PeAprz9udzI+HGOxXSg3
 MUcxFzyUKdHL3qSXYruhlV1niOT6Gc6u75w4QLxGWr5ZqNZiNiAf6Gz/cTC+mkB500+MpHhbrn
 zh+rrrv4WbnN3Gi1AJB5gVUf+n59CTb3C0k32Vg++HQ55HLvrP1cwQICIYUX850HPt585yZbLy
 Dn3MTtKYY9k/UEe4kwrl4I5OHdFuMqG+Pu3Eo0G3Wg2I1eukcNbwyc6gOrVIqASHMJObrLjyfp
 +so=
X-SBRS: 2.7
X-MesageID: 1852595
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1852595"
Date: Mon, 17 Jun 2019 17:45:44 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190617164544.GA13449@perard.uk.xensource.com>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-4-anthony.perard@citrix.com>
 <21258fd1788f418bb1a0007a43bf0250@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21258fd1788f418bb1a0007a43bf0250@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 3/4] xen: Import Xen public headers used by
 xen-hvm.c
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDU6MTU6NTFQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEFudGhvbnkgUEVS
QVJEIFttYWlsdG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiA+IFNlbnQ6IDE3IEp1bmUg
MjAxOSAxNjo0MQo+ID4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZwo+ID4gQ2M6IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkKPiA+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiA+IFN1YmplY3Q6IFtQ
QVRDSCAzLzRdIHhlbjogSW1wb3J0IFhlbiBwdWJsaWMgaGVhZGVycyB1c2VkIGJ5IHhlbi1odm0u
Ywo+ID4gCj4gPiBGb2xsb3dpbmcgInhlbjogRml4IGJ1aWxkIHdpdGggcHVibGljIGhlYWRlcnMi
LCBpbXBvcnQgb3RoZXIgWGVuCj4gPiBwdWJsaWMgaGVhZGVycyB0aGF0IGFyZSBkZXNjcmliaW5n
IGludGVyZmFjZXMuCj4gPiAKPiA+IFRoZSBoZWFkZXJzIGFyZSBjbGVhbmVkIHVwIGEgYml0IHdo
aWxlIGltcG9ydGluZyB0aGVtLiBUaGUgaGVhZGVyCj4gPiBndWFyZCBzeW1ib2xzIGFyZSBjaGFu
Z2VkIHRvIG1hdGNoIFFFTVUncyBjb2Rpbmcgc3R5bGUsIHNvbWUgb3RoZXIKPiA+IHBhcnQgb2Yg
dGhlIGZpbGVzIHRoYXQgUUVNVSBkb2Vzbid0IHVzZSBhcmUgcmVtb3ZlZC4KPiA+IAo+ID4geGVu
LW1hcGNhY2hlLmMgZG9lc24ndCBuZWVkcyBwYXJhbXMuaCwgc28gcmVtb3ZlIHRoZSBpbmNsdWRl
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIGh3L2kzODYveGVuL3hlbi1odm0uYyAgICAgICAgICAg
ICAgICAgfCAgIDYgKy0KPiA+ICBody9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYyAgICAgICAgICAg
IHwgICAyIC0KPiA+ICBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2U4MjAuaCAgIHwgIDI4
ICsrKysrKysKPiA+ICBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2lvcmVxLmggIHwgMTAx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNl
L2h2bS9wYXJhbXMuaCB8ICAzMyArKysrKysrKysKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE2NSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2U4MjAuaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBp
bmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2lvcmVxLmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2h2bS9wYXJhbXMuaAo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvaHcvaTM4Ni94ZW4veGVuLWh2bS5jIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCj4gPiBp
bmRleCAyOTM5MTIyZTdjLi43MjVmOWMyMjc4IDEwMDY0NAo+ID4gLS0tIGEvaHcvaTM4Ni94ZW4v
eGVuLWh2bS5jCj4gPiArKysgYi9ody9pMzg2L3hlbi94ZW4taHZtLmMKPiA+IEBAIC0yNiw5ICsy
Niw5IEBACj4gPiAgI2luY2x1ZGUgInRyYWNlLmgiCj4gPiAgI2luY2x1ZGUgImV4ZWMvYWRkcmVz
cy1zcGFjZXMuaCIKPiA+IAo+ID4gLSNpbmNsdWRlIDx4ZW4vaHZtL2lvcmVxLmg+Cj4gPiAtI2lu
Y2x1ZGUgPHhlbi9odm0vcGFyYW1zLmg+Cj4gPiAtI2luY2x1ZGUgPHhlbi9odm0vZTgyMC5oPgo+
ID4gKyNpbmNsdWRlICJody94ZW4vaW50ZXJmYWNlL2h2bS9pb3JlcS5oIgo+ID4gKyNpbmNsdWRl
ICJody94ZW4vaW50ZXJmYWNlL2h2bS9wYXJhbXMuaCIKPiAKPiBBRkFJQ1QgdGhlIG9ubHkgcGxh
Y2UgKGFwYXJ0IGZyb20gbGVnYWN5IGNvZGUgaW4geGVuX2NvbW1vbi5oKSB0aGF0Cj4gcGFyYW1z
LmggaXMgbmVjZXNzYXJ5IGlzIGluIHhlbl9zdXNwZW5kX25vdGlmaWVyKCkuIEkgd29uZGVyIHdo
ZXRoZXIKPiB0aGF0IHdvdWxkIGJlIGJldHRlciBtb3ZlZCBpbnRvIHhlbl9jb21tb24uaCB0b28g
KHNpbmNlIGl0J3MganVzdCBhCj4gd3JhcHBlciByb3VuZCB4Y19zZXRfaHZtX3BhcmFtKCkgYW5k
IHRoZW4gdGhlIGluY2x1c2lvbiBvZiBwYXJhbXMuaAo+IGNhbiBiZSBtb3ZlZCB0aGVyZSBhcyB3
ZWxsLgoKOigsIEkgZGlkbid0IHJlYWxpc2VkIHRoYXQgeGVuX2NvbW1vbi5oIG5lZWRlZCBwYXJh
bXMuaCB0b28uIFRoYXQgcGF0Y2gKc2VyaWVzIG1pZ2h0IG5vdCBidWlsZCBvbiBvbGRlciB2ZXJz
aW9uIG9mIFhlbi4gSSdsbCBtb3ZlIHRoZSBpbmNsdXNpb24Kb2YgcGFyYW1zLmggdG8geGVuX2Nv
bW1vbi5oLCBhbmQgZml4IHBhcmFtcy5oIHRvIGhhdmUgYWxsIHRoZSBuZWVkZWQKI2RlZmluZXMu
CgpBYm91dCB4ZW5fc3VzcGVuZF9ub3RpZmllcigpLCBpdCdzIGFjdHVhbGx5IG1vcmUgdGhhbiBh
IHdyYXBwZXIsIGl0J3MKYWxzbyBhIGZ1bmN0aW9uLiBBIHBvaW50ZXIgdG8gdGhlIGZ1bmN0aW9u
IGlzIGdpdmVuIHRvIGEgbm90aWZpZXIuClNvIEkgZG9uJ3QgdGhpbmsgdXNpbmcgImlubGluZSIg
d2lsbCB3b3JrLCBhbmQgSSBkb24ndCB0aGluayBpdCBtYWtlcwpzZW5zZSB0byBoYXZlIGEgZnVu
Y3Rpb24gd2l0aG91dCAiaW5saW5lIiBpbiB4ZW5fY29tbW9uLmguIFNvIEkgdGhpbmsKeGVuX3tz
dXNwZW5kLHdha2V1cH1fbm90aWZpZXIgYXJlIGZpbmUgd2hlcmUgdGhlcmUgYXJlLCBkbyB5b3Ug
YWdyZWU/CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
