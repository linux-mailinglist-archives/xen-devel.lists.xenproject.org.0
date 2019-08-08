Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980838608A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:03:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvgAX-0005W6-Kb; Thu, 08 Aug 2019 11:01:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvgAX-0005Vz-0K
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:01:17 +0000
X-Inumbo-ID: d6b37558-b9cb-11e9-9dcc-ab50f1e60ffd
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6b37558-b9cb-11e9-9dcc-ab50f1e60ffd;
 Thu, 08 Aug 2019 11:01:14 +0000 (UTC)
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
IronPort-SDR: 8vGl+XtWyCp+lgNJONXtoi0yG3cV5iHr5hquJz1/3Pt+L77LJw4UQZaNQ9OZWJIQjAlfpBPvXl
 3sd+9k4xhz8JMI5SF59brTbD8ctGqb9Qt+lEmYX+361qkCzdrb6f9ZkqA+rQ3a/QWVDdimuJjj
 Kj+p9bDQHzrKzQ+LpQNfbohJ2OEtrFjrd6STfepKr6GoDp2Titk3iHdXYhIfeHNwuoB1h3umqA
 Hudxovr4NHP0TwrGibk/DivGOsCjsTWhFcs0bfY37KW+drcMHd++/xg/e+4e80X1l7DWHjSgua
 2Gk=
X-SBRS: 2.7
X-MesageID: 4157400
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4157400"
Date: Thu, 8 Aug 2019 13:01:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Message-ID: <20190808110107.kh2jbl2eztgzong3@Air-de-Roger>
References: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/arm: Let the IOMMU be accessible by
 Dom0 if forcibly disabled in Xen
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
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 sstabellini@kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDE6NTM6MjNQTSArMDMwMCwgT2xla3NhbmRyIFR5c2hj
aGVua28gd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNo
Y2hlbmtvQGVwYW0uY29tPgo+IAo+IERvbid0IHNraXAgSU9NTVUgbm9kZXMgd2hlbiBjcmVhdGlu
ZyBEVCBmb3IgRG9tMCBpZiBJT01NVSBoYXMgYmVlbgo+IGZvcmNpYmx5IGRpc2FibGVkIGluIGJv
b3RhcmdzIChlLmcuICJpb21tdT0wIikgaW4gb3JkZXIgdG8gbGV0Cj4gdGhlIElPTU1VIGJlIGFj
Y2Vzc2libGUgYnkgRE9NMC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5r
byA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gLS0tCj4gSSBoYXZlIGhlYXJkIHRo
ZXJlIGlzIGEgInBvc3NpYmxlIiBjYXNlIHdoZW4gdGhlIElPTU1VIGNvdWxkIGJlIGFjY2Vzc2li
bGUgYnkgRE9NMC4KPiBTbywgSSB0aGluaywgZm9yIHRoaXMgdG8gd29yayB3ZSBuZWVkIHRvIGNy
ZWF0ZSBjb3JyZXNwb25kaW5nIERUIG5vZGVzIGluIHRoZSBEVAo+IGF0IGxlYXN0LgoKZG9tMCBv
biBBUk0gYmVpbmcgYW4gYXV0b3RyYW5zbGF0ZWQgZ3Vlc3QgSSdtIG5vdCBzdXJlIGhvdyBpdCdz
IGdvaW5nCnRvIHByb2dyYW0gdGhlIERNQSByZW1hcHBpbmcgaW4gdGhlIGlvbW11LCBzaW5jZSBp
dCBkb2Vzbid0IGtub3cgdGhlCm1mbnMgb2YgdGhlIG1lbW9yeSBpdCB1c2VzIGF0IGFsbCwgaGVu
Y2UgSSBkb24ndCBzZWUgdGhlIHBvaW50IGluCmV4cG9zaW5nIHRoZSBoYXJkd2FyZSBpb21tdSB0
byBkb20wIHVubGVzcyB0aGVyZSdzIHNvbWUgZW11bGF0aW9uIGRvbmUKdG8gbWFrZSBkb20wIGFi
bGUgdG8gYWNjZXNzIGl0LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
