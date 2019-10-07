Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD966CDFE3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 13:09:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHQr8-0001xK-3d; Mon, 07 Oct 2019 11:07:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J9qX=YA=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iHQr6-0001x6-D6
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 11:07:08 +0000
X-Inumbo-ID: 99d22ebc-e8f2-11e9-97ab-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99d22ebc-e8f2-11e9-97ab-12813bfff9fa;
 Mon, 07 Oct 2019 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570446427;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TucBBYKtyFJGaBUQUqA653/yziYcNX22ruFJ6IIVis4=;
 b=eE/lcdmBU8RW89fCI569FxoXn0vrpyHX9am3oxgTPIz0Bop43qEWz30x
 oxfsZumshcAGoAdl+18E5zKWmjwXlWjkOWvB5mWgjzgT48OMXVK7nhps7
 4kXK1DvEXyNO4hMXTPZq1g1bide7s7iAs/7KIduuMYfFqvalTxnOsOPgk U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: irtljgXMmOsfZAY1spQkuxJsonFcg1ExGBWjGpTMT2Pil1NAp+LYU53yNCIfjd/bRiXBY0V4oM
 luX8RvPI6+9H6h2Sb6gDgDr/waQYnr+33jO1g9tNglVJC3PJ2UGdqxfN1v9diKU3XMVsUBHvot
 PdfdJI00mij5Nr00S6455igs/D+7Mmyg4xJBrnicko+bjvoAL1wnWFs9Dl4XNzaShQIdp+FyF7
 npkvM7a32zCzxHIAV6BQVl18/n0aLY66K+Cv+SfhWTmLZWQXvIj6zP43CpTdbRuE3+k+QDerlJ
 muo=
X-SBRS: 2.7
X-MesageID: 6845469
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,268,1566878400"; 
   d="scan'208";a="6845469"
From: Lars Kurth <lars.kurth@citrix.com>
To: Wei Liu <wl@xen.org>
Thread-Topic: [PATCH for-4.13] docs: update all URLs in man pages
Thread-Index: AQHVegVbVDevXTtO/kiOWKJCl1zny6dKDe0AgAS7WYD///y6AIAAM+UA
Date: Mon, 7 Oct 2019 11:07:03 +0000
Message-ID: <89DCD1DE-6232-46DA-86D6-C0E671885671@citrix.com>
References: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
 <20191004085728.ba4tpw6gfvhcaowz@debian>
 <1B611AEA-677A-47CF-8F6D-BA811F0D5330@citrix.com>
 <CAK9nU=pUpSfOJrh7cOjVZmCsgfr79C2txdqYUyfvrQCxQweCnA@mail.gmail.com>
In-Reply-To: <CAK9nU=pUpSfOJrh7cOjVZmCsgfr79C2txdqYUyfvrQCxQweCnA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <630B493D25AE3F4D9BC4ABECDB94E750@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] docs: update all URLs in man pages
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA3LzEwLzIwMTksIDEwOjAxLCAiV2VpIExpdSIgPHdsQHhlbi5vcmc+IHdyb3Rl
Og0KDQogICAgT24gTW9uLCA3IE9jdCAyMDE5IGF0IDA5OjEzLCBMYXJzIEt1cnRoIDxsYXJzLmt1
cnRoQGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4gT24gMDQv
MTAvMjAxOSwgMDk6NTcsICJXZWkgTGl1IiA8d2xAeGVuLm9yZz4gd3JvdGU6DQogICAgPg0KICAg
ID4gICAgIE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA0OjEyOjMwUE0gKzAwMDAsIExhcnMgS3Vy
dGggd3JvdGU6DQogICAgPiAgICAgPiBTcGVjaWZpY2FsbHkNCiAgICA+ICAgICA+ICogeGVuLm9y
ZyB0byB4ZW5wcm9qZWN0Lm9yZw0KICAgID4gICAgID4gKiBodHRwIHRvIGh0dHBzDQogICAgPiAg
ICAgPiAqIFJlcGxhY2VkIHBhZ2VzIHdoZXJlIHBhZ2UgaGFzIG1vdmVkDQogICAgPiAgICAgPiAg
IChpbmNsdWRpbmcgb24geGVuIHBhZ2VzIGFzIHdlbGwgYXMgZXh0ZXJuYWwgcGFnZXMpDQogICAg
PiAgICAgPiAqIFJlbW92ZWQgc29tZSBVUkxzIChlLmcuIGRvd25sb2FkcyBmb3IgTGludXggUFYg
ZHJpdmVycykNCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBUZXN0ZWQtYnk6IExhcnMgS3VydGgg
PGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAgICA+ICAgICA+IFNpZ25lZC1vZmYtYnk6IExhcnMg
S3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAgICA+DQogICAgPiAgICAgRG8geW91IGhh
dmUgYSBicmFuY2ggZm9yIHRoaXMgcGF0Y2g/DQogICAgPg0KICAgID4gVW5mb3J0dW5hdGVseSwg
bm90OiBJIG5ldmVyIGNyZWF0ZWQgYSBwZXJzb25hbCBjb3B5IG9mIHhlbi5naXQgb24geGVuYml0
cw0KICAgID4gUmVhbGx5IHNob3VsZCBkbyB0aGlzDQogICAgDQogICAgUGxlYXNlIGRvLiBJIGNv
dWxkbid0IHJlcGx5IHRoaXMgcGF0Y2ggY2xlYW5seS4gTm90IHN1cmUgd2h5IGdpdA0KICAgIHdh
c24ndCBoYXBweSBhYm91dCBpdC4NCiAgICANCiAgICBXZWkuDQogICAgDQpIaSBXZWksDQoNCkkg
Zml4ZWQgdGhlIG1pc3NpbmcgaHR0cCBsaW5rIGFuZCByZWJhc2VkIHRvIHN0YWdpbmcNClNlZSBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvbGFyc2sveGVuLmdpdDthPWNv
bW1pdDtoPTA4OGMyNzgxNzk1YzU5MjRjZDFmYzdmMTFmM2QzMTE1NGQ4NjY3OTkgJiBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvbGFyc2sveGVuLmdpdDthPXNob3J0bG9n
O2g9cmVmcy9oZWFkcy9kb2NzLWNoYW5nZXMtNC4xMy12MiANCg0KV2hlbiByZWJhc2luZyB0aGVy
ZSB3YXMgbm8gY29uZmxpY3QsIHNvIG5vdCBzdXJlIHdoeSBpdCBkaWRuJ3QgYXBwbHkgZm9yIHlv
dQ0KDQpSZWdhcmRzDQpMYXJzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
