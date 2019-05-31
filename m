Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF889309E2
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 10:12:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWcbc-0003pf-2O; Fri, 31 May 2019 08:09:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q4nb=T7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hWcbb-0003pa-2o
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 08:09:39 +0000
X-Inumbo-ID: 6e688b6c-837b-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6e688b6c-837b-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 08:09:37 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: MuFDzrJnaA4RhYJ96ED2uey0fkt9GUZ9QvgjXsm4lQ3MCgXuwE1tUgqnhxr8RX3blU5cMZ0qAq
 +L/7Omh/Mek4+wVc9cdH+iZHvg3O2+Vh/vk4sLoHwnS47H9HpH+jYkXQfb3wKWZ5lGZ3s2jJfx
 2I0ZVXZiC1BQ9bijpZA+prpr6J83fTGga2C0IXEeUFsBABgtWSPB8lZYcs3xbZz7QVo3bze2ns
 mJCzaWCo7xa0TYZx2PZycCqXhMmWMcPYi5G8zryECCfdFyplCo2DaBhrq9lJ8aepD+AAv3slrd
 IEw=
X-SBRS: 2.7
X-MesageID: 1118491
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,534,1549947600"; 
   d="scan'208";a="1118491"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Wei Liu <wei.liu2@citrix.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Thread-Topic: [PATCH net-next] Update my email address
Thread-Index: AQHVF4LOwmQKDAbmA0WtXQmNdTyAy6aE4S7A
Date: Fri, 31 May 2019 08:09:34 +0000
Message-ID: <619c8073a46446ce819addd44bd03756@AMSPEX02CL03.citrite.net>
References: <20190531073102.5334-1-wei.liu2@citrix.com>
In-Reply-To: <20190531073102.5334-1-wei.liu2@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH net-next] Update my email address
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgW21haWx0bzp3ZWku
bGl1MkBjaXRyaXguY29tXQo+IFNlbnQ6IDMxIE1heSAyMDE5IDA4OjMxCj4gVG86IG5ldGRldkB2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogWGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgRGF2aWQgTWls
bGVyCj4gPGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+IFN1YmplY3Q6IFtQQVRDSCBuZXQtbmV4dF0gVXBkYXRlIG15IGVtYWlsIGFkZHJlc3MKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6
IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cgo+IC0tLQo+ICBNQUlOVEFJ
TkVSUyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCAw
YzU1YjBmZWRiZTIuLmUyMTJjNmE0MmRkZiAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsr
KyBiL01BSU5UQUlORVJTCj4gQEAgLTE3Mjk1LDcgKzE3Mjk1LDcgQEAgRjoJRG9jdW1lbnRhdGlv
bi9BQkkvc3RhYmxlL3N5c2ZzLWh5cGVydmlzb3IteGVuCj4gIEY6CURvY3VtZW50YXRpb24vQUJJ
L3Rlc3Rpbmcvc3lzZnMtaHlwZXJ2aXNvci14ZW4KPiAKPiAgWEVOIE5FVFdPUksgQkFDS0VORCBE
UklWRVIKPiAtTToJV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiArTToJV2VpIExpdSA8
d2VpLmxpdUBrZXJuZWwub3JnPgo+ICBNOglQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPgo+ICBMOgl4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcgKG1vZGVyYXRlZCBm
b3Igbm9uLXN1YnNjcmliZXJzKQo+ICBMOgluZXRkZXZAdmdlci5rZXJuZWwub3JnCj4gLS0KPiAy
LjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
