Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE63934F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 19:33:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZIhh-0003OS-7e; Fri, 07 Jun 2019 17:31:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OKkm=UG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hZIhg-0003OL-L5
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 17:31:00 +0000
X-Inumbo-ID: 036b23fd-894a-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 036b23fd-894a-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 17:30:59 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5InRkduLE4O2xqrdVaugAkltBqiuJ4zyQBIYBfFp0iWPruo0FDzEb1CK1IqmPVzMD2sB3TWo1+
 0vRTo+5LTMUdWPILZ8kDwizeVZ6nyeaVpw39BXkPFF1G6PjxuCvqlnhwm4V7avG1abAiBEC+2V
 mMOE+EQi4r9sKj5PnxB8p3O5HxJgZaAEjDnRO1SidGk4mgm818+0I5eqRLQan5sQ91gAqFUkIG
 R46kjqcO5+bcvSP6iJ7eAludo3HvRDEUfhWiev+MKx7QSm12Zp8CV9fp6LSRjKPYMBeAPjWeKg
 3kQ=
X-SBRS: -0.9
X-MesageID: 1468981
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,563,1557201600"; 
   d="scan'208";a="1468981"
Date: Fri, 7 Jun 2019 18:22:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190607172238.GM2126@perard.uk.xensource.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-7-anthony.perard@citrix.com>
 <23798.43626.668549.272351@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23798.43626.668549.272351@mariner.uk.xensource.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH 6/9] libxl_disk: Cut libxl_cdrom_insert into
 steps ..
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDY6Mjk6MTRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDYvOV0gbGlieGxfZGlzazogQ3V0
IGxpYnhsX2Nkcm9tX2luc2VydCBpbnRvIHN0ZXBzIC4uIik6Cj4gPiBUaGlzIHBhdGNoIGN1dCBs
aWJ4bF9jZHJvbV9pbnNlcnQgaW50byBkaWZmZXJlbnQgc3RlcC9mdW5jdGlvbiBidXQgdGhlcmUK
PiA+IGFyZSBzdGlsbCBjYWxsZWQgc3luY2hyb25vdXNseS4gQSBsYXRlciBwYXRjaCB3aWxsIGNh
bGwgdGhlbQo+ID4gYXN5bmNocm9ub3VzbHkgd2hlbiBRTVAgaXMgaW52b2x2ZWQuCj4gPiAKPiA+
IFRoZSBqc29uX2xvY2sgaGFzIGJlZW4gcmVwbGFjZWQgYnkgdGhlIHFtcF9sb2NrIGZvciBwcm90
ZWN0aW9uIGFnYWluc3QKPiA+IGNvbmN1cnJlbnQgY2hhbmdlcyB0byB0aGUgY2Ryb20uIFRoZSBq
c29uX2xvY2sgaXMgbm93IG9ubHkgdXNlZCB3aGVuCj4gPiByZWFkaW5nL21vZGlmeWluZyB0aGUg
ZG9tYWluIHVzZXJkYXRhLgo+IAo+IAo+IFlvdXIgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIHFtcCBs
b2NrLCB0YWtlbiByb3VnaGx5IGZyb20gbXkgaWRlYSwgaXMKPiB0aGF0IHRoZSBxbXAgbG9jayBj
b3ZlcnMgbW9kaWZ5aW5nIHRoaW5ncyB2aWEgcW1wLiAgQnV0IEkgdGhpbmsgaGVyZQo+IHlvdSB1
c2UgaXQgZm9yIHVwZGF0ZXMgdmlhIHhlbnN0b3JlID8KClRoYXQgeGVuc3RvcmUgY29kZSB1cGRh
dGUgaXMga2luZCBvZiB3ZWlyZCwgbGlieGwgd3JpdGVzIGl0IGJ1dCBub3RoaW5nCnJlYWxseSBy
ZWFkcyBpdC4KCkZvciB0aGUgZWplY3QgcGFydCBvZiB0aGUgeGVuc3RvcmUgdXBkYXRlLCBpdCBw
cm9iYWJseSBkb2Vzbid0IG1hdHRlciBpZgp0aGUganNvbl9sb2NrIGlzIGhlbGQgb3Igbm90LiBC
dXQgZm9yIHRoZSBpbnNlcnQgcGFydCBvZiB0aGUgeGVuc3RvcmUKdXBkYXRlLCBsaWJ4bCB3cml0
ZXMgdGhlIGRvbWFpbiBjb25maWcgd2hpbGUgaW4gdGhlIG1pZGRsZSBvZiB0aGUgeGVuc3RvcmUK
dHJhbnNhY3Rpb24uIFNvIGluIHRoZSBzZWNvbmQgY2FzZSwgdGhlIGpzb25fbG9jayBuZWVkcyB0
byBiZSBoZWxkLgoKPiBJIHRoaW5rIHRoaXMgaXMgT0sgYmVjYXVzZSB3aGF0IG1hdHRlcnMgaXMg
dGhhdCBhbnkgb25lIHRoaW5nIGlzCj4gYWx3YXlzIGNvdmVyZWQgYnkgdGhlIHNhbWUgbG9jayAt
IGFuZCBoZXJlIHRoZSBjZHJvbSBpcyBpcyBhICJ0aGluZyIuCj4gQnV0IEkgdGhpbmsgdGhpcyBt
ZWFucyB0aGUgY29tbWVudGFyeSBpcyB3cm9uZyA/CgpJIGNhbiB0cnkgdG8gcmV3cml0ZSB0aGUg
Y29tbWVudGFyeSB0byBtYWtlIGl0IGxlc3Mgd3JvbmcuIE9yIGNoYW5nZSB0aGUKY29kZSBzbyB0
aGUgY29tbWVudCBhcHBsaWVzIHRvIGl0LiAoSSdsbCBnbyB3aXRoIHJld3JpdGluZyB0aGUgcGF0
Y2gKZGVzY3JpcHRpb24gZm9yIG5vdy4pCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
