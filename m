Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86946E3211
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:16:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNc0o-0005mN-OT; Thu, 24 Oct 2019 12:14:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IXfy=YR=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iNc0m-0005lV-Or
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:14:40 +0000
X-Inumbo-ID: d7afcbfb-f657-11e9-949f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7afcbfb-f657-11e9-949f-12813bfff9fa;
 Thu, 24 Oct 2019 12:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571919277;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AWNYplv986FUlbaXB8umzjjVFATGtVTkTBqRJ8QZlVA=;
 b=Pd8AAyjuDFA8V+kGp5NXWKEy6OphWJqnfIw3dbLYS4/w2lZoq9upW3Qd
 NA9koaNK+2YXahbpcyT4La3W+xCVv/8Su12PRr3eTNW7LAHx/1OQMYmCE
 xQMAYEU1tw858PTTD9bKFL39jTI6MCZqZhjjhJ8s9I6Tx/W2uP0+cRPlu 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QBwj21kZrQPBsXIc8HPetFZvpVgpNH/MHoVVDDEUbLSUpqFdtWz4rUTXzaae461fhyXwdqT5i8
 N6hzKURZIo1JHZuY/FCI5JW46fOHWgMXhiZd32Z5m53hwgtdH40QKSBtD9cFUGViclRpivsZPo
 Jg7xyvZa2STH7e6RprLzvHpHnUkzufqvri18cGKOL4V/tnSlryaQPO/MkXo0Q1kmUND0Vgdspp
 d6LtGNbL+3ap1USRG2dWqDLOJezDqihBhzDUWPg6F5jfWYEPbXgPA5cdyfQ78wjHEu+0AmgfzU
 kiM=
X-SBRS: 2.7
X-MesageID: 7681220
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,224,1569297600"; 
   d="scan'208";a="7681220"
From: Lars Kurth <lars.kurth@citrix.com>
To: Wei Liu <wl@xen.org>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Thread-Topic: [Xen-devel] [PATCH for-4.13] CONTRIBUTING: drop reference to
 blktap2
Thread-Index: AQHVilsYSAeUGDEC90ubf4t9LwpRaKdpgc+AgAAClACAAB9TgA==
Date: Thu, 24 Oct 2019 12:14:33 +0000
Message-ID: <5B1B130A-0E1F-4977-91B0-9E283D6CDC36@citrix.com>
References: <20191024110618.6436-1-wl@xen.org>
 <e05ef290-8e71-046f-a687-9d1a8e1ea7fe@suse.com>
 <20191024112226.ugcmzmsyndg3sfeb@debian>
In-Reply-To: <20191024112226.ugcmzmsyndg3sfeb@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <4D696A3133A5144FBD8597F7CD2152C2@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] CONTRIBUTING: drop reference to
 blktap2
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI0LzEwLzIwMTksIDEyOjIyLCAiV2VpIExpdSIgPHdsQHhlbi5vcmc+IHdyb3Rl
Og0KDQogICAgT24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDE6MTM6MTNQTSArMDIwMCwgSsO8cmdl
biBHcm/DnyB3cm90ZToNCiAgICA+IE9uIDI0LjEwLjE5IDEzOjA2LCBXZWkgTGl1IHdyb3RlOg0K
ICAgID4gPiBCbGt0YXAyIGlzIGdvbmUuDQogICAgPiA+IA0KICAgID4gPiBTaWduZWQtb2ZmLWJ5
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KICAgID4gPiAtLS0NCiAgICA+ID4gICBDT05UUklCVVRJ
TkcgfCAxIC0NCiAgICA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KICAgID4g
PiANCiAgICA+ID4gZGlmZiAtLWdpdCBhL0NPTlRSSUJVVElORyBiL0NPTlRSSUJVVElORw0KICAg
ID4gPiBpbmRleCA0N2Y1M2U5YTQ5Li40ZmZmNGZkOWY2IDEwMDY0NA0KICAgID4gPiAtLS0gYS9D
T05UUklCVVRJTkcNCiAgICA+ID4gKysrIGIvQ09OVFJJQlVUSU5HDQogICAgPiA+IEBAIC0xMyw3
ICsxMyw2IEBAIE1vc3Qgb2YgdGhlIFhlbiBQcm9qZWN0IGNvZGUgaXMgbGljZW5zZWQgdW5kZXIg
R1BMdjIsIGJ1dCBhIG51bWJlciBvZg0KICAgID4gPiAgIGRpcmVjdG9yaWVzIGFyZSBwcmltYXJp
bHkgbGljZW5zZWQgdW5kZXIgZGlmZmVyZW50IGxpY2Vuc2VzLg0KICAgID4gPiAgIE1vc3Qgbm90
YWJseToNCiAgICA+ID4gLSAtIHRvb2xzL2Jsa3RhcDIgICAgICA6IEJTRC1Nb2RpZmllZA0KICAg
ID4gPiAgICAtIHRvb2xzL2xpYnhjICAgICAgICA6IExHUEwgdjIuMQ0KICAgID4gPiAgICAtIHRv
b2xzL2xpYnhsICAgICAgICA6IExHUEwgdjIuMQ0KICAgID4gPiAgICAtIHRvb2xzL3hsICAgICAg
ICAgICA6IExHUEwgdjIuMQ0KICAgID4gPiANCiAgICA+IA0KICAgID4gTWluZCBhZGRpbmcgdG9v
bHMvbGlicyBpbnN0ZWFkPw0KICAgIA0KICAgIFN1cmUuIFRoYXQgY2FuIGJlIGRvbmUuDQogICAg
DQogICAgQmVjYXVzZSB0b29scy9saWJzJyBjb2RlIGlzIG1vc3RseSBzcGxpdCBmcm9tIGxpYnhj
IGFuZCBmcmllbmRzLCBJDQogICAgYXNzdW1lIGl0IGlzIGdvaW5nIHRvIGJlIExHUEwgdjIuMSBh
cyB3ZWxsLg0KICAgIA0KICAgIExhcnMgYW5kIElhbiwgeW91ciBvcGluaW9uPw0KICAgIA0KVG9v
bHMvbGlicyBkb2VzIG5vdCBoYXZlIGEgQ09QWUlORyBmaWxlLCBzbyBpdCBpcyBHUEwgYnkgZGVm
YXVsdC4gSG93ZXZlciwgYWxsIHRoZSBmaWxlcyBJIGNoZWNrZWQgYXBwZWFyIHRvIGhhdmUgTEdQ
TCB2Mi4xDQpTbywgdGhlIGRpcmVjdG9yeSBzaG91bGQgcHJvYmFibHkgaGF2ZSBhbiBhcHByb3By
aWF0ZSBDT1BZSU5HIGZpbGUsIGJ1dCB3ZSBkbyBuZWVkIHRvIGNoZWNrIGFsbCBmaWxlcyBpbiBp
dA0KDQpSZWdhcmRzDQpMYXJzIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
