Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A015F48907
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:34:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcuY0-0006BA-VG; Mon, 17 Jun 2019 16:31:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SIu5=UQ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hcuY0-0006B5-0T
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:31:56 +0000
X-Inumbo-ID: 6a979b84-911d-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6a979b84-911d-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 16:31:54 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QQ/rfxEcGjGzBgptmwE8OyQbiZrSWu7ph6VvoUqOunZfDswzVO5LyNf9RQ2sEZ7iNgl3jOcotX
 EwbWCY0ooNgwoWkR9jPWqlsunt8MwoQK4FVemR6MY0dU3l2FlIrer8UNFyaWv+AiabeKIq5Kzv
 yKgwhbvexJXENWGEZXsrQe7pVWa0JBUU0rTPELduEMmKEY67pLtRh7DKIldfRtQZFwuYEmYPFq
 GDyqUicDIuToFMKWOmhkkZjDqM23kpJhOavNq5OA/MhLFE+L8U5rB3AcXBZQy8uPV+yifoZ8wb
 iGI=
X-SBRS: 2.7
X-MesageID: 1850360
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1850360"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [PATCH 2/4] xen: Import other xen/io/*.h
Thread-Index: AQHVJSMYBHo7zZ9H6ESjDdTrHmXuOqagA5zg
Date: Mon, 17 Jun 2019 16:09:39 +0000
Message-ID: <f9d21559066445a3afc0f6ee32d01ac9@AMSPEX02CL03.citrite.net>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-3-anthony.perard@citrix.com>
In-Reply-To: <20190617154105.32323-3-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/4] xen: Import other xen/io/*.h
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
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogW1BBVENIIDIvNF0geGVuOiBJbXBv
cnQgb3RoZXIgeGVuL2lvLyouaAo+IAo+IEZvbGxvd2luZyAieGVuOiBGaXggYnVpbGQgd2l0aCBw
dWJsaWMgaGVhZGVycyIsIGltcG9ydCBvdGhlciBYZW4KPiBwdWJsaWMgaGVhZGVycyB0aGF0IGFy
ZSBkZXNjcmliaW5nIGludGVyZmFjZXMuCj4gCj4gSW1wb3J0IGZiaWYuaCwga2JkaWYuaCwgbmV0
aWYuaCwgY29uc29sZS5oLCB4ZW5idXMuaCwgcHJvdG9jb2xzLmguCj4gCj4gV2hpbGUgZWRpdGlu
ZyB4ZW5mYi5jLCByZW1vdmUgdGhlIGluY2x1ZGUgb2YgZXZlbnRfY2hhbm5lbC5oIGFzIGl0Cj4g
aXNuJ3QgbmVlZGVkLgo+IAo+IFRoZSBoZWFkZXJzIGFyZSBjbGVhbmVkIHVwIGEgYml0IHdoaWxl
IGltcG9ydGluZyB0aGVtLiBUaGUgaGVhZGVyCj4gZ3VhcmQgc3ltYm9scyBhcmUgY2hhbmdlZCB0
byBtYXRjaCBRRU1VJ3MgY29kaW5nIHN0eWxlLCBzb21lIG90aGVyCj4gcGFydCBvZiB0aGUgZmls
ZSB0aGF0IFFFTVUgZG9lc24ndCB1c2UgYXJlIHJlbW92ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
