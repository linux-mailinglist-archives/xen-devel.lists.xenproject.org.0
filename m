Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D7488B6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:18:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcuIX-0004Yz-6P; Mon, 17 Jun 2019 16:15:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SIu5=UQ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hcuIV-0004Yt-Q0
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:15:55 +0000
X-Inumbo-ID: 2ea5bd5b-911b-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ea5bd5b-911b-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 16:15:54 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aEzKPu4143wsPNjn2qCm88TiHxo45GA+zo+E/WjeZyYpYVhhbCCIsb+mu2z2mtykI0ZHg5rHkg
 aeorHqKA9DIFJKZMS/S2LwQHBi9W99jQM21Oj55zfTXHXxv0CepQmBARZX8AvEJMK/4eOJzM4V
 jTYl90mESRje8jyKfuq10wH5weKVIJtTCvVwf9x6Qdqc//o2TUtV5OxRADfX4B7P3BzvtLqJeJ
 nWjbcQhVP9aaf7L4vCGfh5/9M4n0OoSEMfOcbcA8Jho9MH8n3mktnLI3LBLvdiT00foq8c3X63
 /vw=
X-SBRS: 2.7
X-MesageID: 1841053
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1841053"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [PATCH 3/4] xen: Import Xen public headers used by xen-hvm.c
Thread-Index: AQHVJSMVksnbyKoRC0SnNZiHFchLQ6agBEVg
Date: Mon, 17 Jun 2019 16:15:51 +0000
Message-ID: <21258fd1788f418bb1a0007a43bf0250@AMSPEX02CL03.citrite.net>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-4-anthony.perard@citrix.com>
In-Reply-To: <20190617154105.32323-4-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxNyBKdW5lIDIwMTkgMTY6NDEK
PiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBTdGVm
YW5vIFN0YWJlbGxpbmkKPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFBhdWwgRHVycmFudCA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogW1BBVENIIDMvNF0geGVuOiBJbXBv
cnQgWGVuIHB1YmxpYyBoZWFkZXJzIHVzZWQgYnkgeGVuLWh2bS5jCj4gCj4gRm9sbG93aW5nICJ4
ZW46IEZpeCBidWlsZCB3aXRoIHB1YmxpYyBoZWFkZXJzIiwgaW1wb3J0IG90aGVyIFhlbgo+IHB1
YmxpYyBoZWFkZXJzIHRoYXQgYXJlIGRlc2NyaWJpbmcgaW50ZXJmYWNlcy4KPiAKPiBUaGUgaGVh
ZGVycyBhcmUgY2xlYW5lZCB1cCBhIGJpdCB3aGlsZSBpbXBvcnRpbmcgdGhlbS4gVGhlIGhlYWRl
cgo+IGd1YXJkIHN5bWJvbHMgYXJlIGNoYW5nZWQgdG8gbWF0Y2ggUUVNVSdzIGNvZGluZyBzdHls
ZSwgc29tZSBvdGhlcgo+IHBhcnQgb2YgdGhlIGZpbGVzIHRoYXQgUUVNVSBkb2Vzbid0IHVzZSBh
cmUgcmVtb3ZlZC4KPiAKPiB4ZW4tbWFwY2FjaGUuYyBkb2Vzbid0IG5lZWRzIHBhcmFtcy5oLCBz
byByZW1vdmUgdGhlIGluY2x1ZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gIGh3L2kzODYveGVuL3hlbi1odm0u
YyAgICAgICAgICAgICAgICAgfCAgIDYgKy0KPiAgaHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMg
ICAgICAgICAgICB8ICAgMiAtCj4gIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9odm0vZTgyMC5o
ICAgfCAgMjggKysrKysrKwo+ICBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2lvcmVxLmgg
IHwgMTAxICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvaHcveGVuL2ludGVy
ZmFjZS9odm0vcGFyYW1zLmggfCAgMzMgKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTY1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2U4MjAuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9ody94ZW4vaW50ZXJmYWNlL2h2bS9pb3JlcS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBp
bmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL3BhcmFtcy5oCj4gCj4gZGlmZiAtLWdpdCBhL2h3
L2kzODYveGVuL3hlbi1odm0uYyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwo+IGluZGV4IDI5Mzkx
MjJlN2MuLjcyNWY5YzIyNzggMTAwNjQ0Cj4gLS0tIGEvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCj4g
KysrIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCj4gQEAgLTI2LDkgKzI2LDkgQEAKPiAgI2luY2x1
ZGUgInRyYWNlLmgiCj4gICNpbmNsdWRlICJleGVjL2FkZHJlc3Mtc3BhY2VzLmgiCj4gCj4gLSNp
bmNsdWRlIDx4ZW4vaHZtL2lvcmVxLmg+Cj4gLSNpbmNsdWRlIDx4ZW4vaHZtL3BhcmFtcy5oPgo+
IC0jaW5jbHVkZSA8eGVuL2h2bS9lODIwLmg+Cj4gKyNpbmNsdWRlICJody94ZW4vaW50ZXJmYWNl
L2h2bS9pb3JlcS5oIgo+ICsjaW5jbHVkZSAiaHcveGVuL2ludGVyZmFjZS9odm0vcGFyYW1zLmgi
CgpBRkFJQ1QgdGhlIG9ubHkgcGxhY2UgKGFwYXJ0IGZyb20gbGVnYWN5IGNvZGUgaW4geGVuX2Nv
bW1vbi5oKSB0aGF0IHBhcmFtcy5oIGlzIG5lY2Vzc2FyeSBpcyBpbiB4ZW5fc3VzcGVuZF9ub3Rp
ZmllcigpLiBJIHdvbmRlciB3aGV0aGVyIHRoYXQgd291bGQgYmUgYmV0dGVyIG1vdmVkIGludG8g
eGVuX2NvbW1vbi5oIHRvbyAoc2luY2UgaXQncyBqdXN0IGEgd3JhcHBlciByb3VuZCB4Y19zZXRf
aHZtX3BhcmFtKCkgYW5kIHRoZW4gdGhlIGluY2x1c2lvbiBvZiBwYXJhbXMuaCBjYW4gYmUgbW92
ZWQgdGhlcmUgYXMgd2VsbC4KCiAgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
