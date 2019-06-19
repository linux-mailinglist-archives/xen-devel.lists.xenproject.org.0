Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6034B400
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 10:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdVpl-0006S8-Eu; Wed, 19 Jun 2019 08:20:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YSQz=US=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hdVpj-0006S0-Gw
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 08:20:43 +0000
X-Inumbo-ID: 1ea19378-926b-11e9-8574-732901adfbe9
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ea19378-926b-11e9-8574-732901adfbe9;
 Wed, 19 Jun 2019 08:20:39 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RsTPXZCHaEggXz4Q/f9uOdg1TAnOMn7UqtCdldedlBjTG08uUAu4/GFN/lhS6f2qQ0B8wfw/l2
 jn4rByTwQ3mncifMVvY2DQSN45+JCHecxj0NygHy89jjdo4St1mxy2qzc89D+YS3kHCNQPiOTA
 l5h9MMSQY60XJ6NJkNMkgU/ZcJKd3ozP1986YflerMknbVLq2kBDDpYaG0K7YvTvE2QfwC1nTp
 +gmybZnZrM8vKYar2gQTMrHqrFvgfygQZdG8Jq+Il0y43J2KCYbd4/ELcvrpMZbFV8c2KuZHMU
 eIc=
X-SBRS: 2.7
X-MesageID: 1920649
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1920649"
From: Lars Kurth <lars.kurth@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien.grall@arm.com>
Thread-Topic: [PATCH v6 02/10] xen/arm: optee: add OP-TEE header files
Thread-Index: AQHVJSDP2t5buFPM1U29ksaFvJE1Qqaf54cAgAABygCAAA8JgIACnFwA
Date: Wed, 19 Jun 2019 08:20:35 +0000
Message-ID: <FFA82A74-1DD5-48EE-B326-E298BDC23B1D@citrix.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-3-volodymyr_babchuk@epam.com>
 <686a7564-5c8b-937f-1e14-671e7b08a18b@arm.com>
 <1a81a53d-91e3-37e0-79df-8f59a0dc6a2a@arm.com>
 <alpine.DEB.2.21.1906170926150.2072@sstabellini-ThinkPad-T480s>
 <3274e117-4e51-5360-8f94-ece7a6981998@arm.com>
 <alpine.DEB.2.21.1906171026050.2072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906171026050.2072@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.b.190609
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <F374846778A77D4191EBDEAFD9E5176E@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 02/10] xen/arm: optee: add OP-TEE header
 files
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE3LzA2LzIwMTksIDE4OjI4LCAiU3RlZmFubyBTdGFiZWxsaW5pIiA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQoNCiAgICBPbiBNb24sIDE3IEp1biAyMDE5LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQogICAgPiBPbiAxNy8wNi8yMDE5IDE3OjI4LCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6DQogICAgPiA+IExvb2tpbmcgYXQgaHR0cHM6Ly93d3cuZ251Lm9yZy9saWNl
bnNlcy9saWNlbnNlLWxpc3QuZW4uaHRtbCBhbmQgYWxzbw0KICAgID4gPiBsb29raW5nIGF0IHRo
ZSB1c2FnZSBpbiB0aGUgTGludXgga2VybmVsLCBJIGFtIHByZXR0eSBzdXJlIGl0IGlzDQogICAg
PiA+IGNvbXBhdGlibGUuIEhvd2V2ZXIsIGdpdmVuIHRoYXQgdGhlIFhlbiBoeXBlcnZpc29yIGFz
IGEgd2hvbGUgaXMgR1BMdjIsDQogICAgPiA+IEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBwcmVj
aXNlIHRvIHNheToNCiAgICA+ID4gDQogICAgPiA+IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCiAgICA+IA0KICAgID4gV2VsbCwgdGhpcyBp
cyBpbXBvcnRlZCBmcm9tIE9QLVRFRS4gU28gSSBkb24ndCB0aGluayB3ZSBoYXZlIHRoZSBmcmVl
ZG9tIHRvDQogICAgPiBjaGFuZ2UgdGhpcyBjb3B5cmlnaHQgaGVhZGVyIGhlcmUuLi4NCiAgICAN
CiAgICBJbnRlcmVzdGluZyBwb2ludDogSSB3b3VsZCBoYXZlIHRob3VnaHQgdGhhdCBnaXZlbiB0
aGF0IHRoaXMgaXMgYSBHUEx2Mg0KICAgIHByb2plY3QsIGlmIHdlIHdlbnQgd2l0aCBTUERYLCBh
bGwgZmlsZXMgd291bGQgbmVlZCB0byBoYXZlIGENCiAgICBHUEwtMi4wLW9ubHkgdGFnIG9uIHRo
ZW0sIHBsdXMsIG9wdGlvbmFsbHksIGFuIE9SIFhYWCBjbGF1c2UuDQogICAgDQogICAgU29tZXRo
aW5nIGZvciBMYXJzIHRvIGludmVzdGlnYXRlLg0KDQpUaGF0IGlzIG5vdCByZWFsbHkgaG93IHRo
aXMgd29ya3MuIFRoZSByZXN1bHRpbmcgWGVuIGJpbmFyeSB3b3VsZCBiZSBHUEwgMi4wLCB3aGls
ZSBpbmRpdmlkdWFsIHBhcnRzIG9mIHRoZSBzb3VyY2UgdHJlZSBjYW4gYmUgb2YgZGlmZmVyZW50
IGxpY2Vuc2VzLiAgIA0KICAgIA0KICAgID4gV2hhdCBJIHdhcyBhc2tpbmcgaXMgd2hldGhlciB0
aGlzIGlzIE9LIHRvIGltcG9ydCBCU0QtMi1DbGF1c2UgY29kZSBpbiBYZW4uDQogICAgPiBZb3Ug
c2VlbSB0byBhZ3JlZSB0aGF0IGl0IHNob3VsZCBiZSBwb3NzaWJsZS4NCiAgICANCiAgICBZZXAu
IFRoZSBwcm9ibGVtYXRpYyBCU0QgbGljZW5zZSBpcyB0aGUgQlNELTQtQ2xhdXNlLg0KICAgIA0K
SXQgaXMgZGVmaW5pdGVseSBPSzogc2VlIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PXhlbi5naXQ7YT1ibG9iO2Y9Q09OVFJJQlVUSU5HDQoNCkxhcnMgDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
