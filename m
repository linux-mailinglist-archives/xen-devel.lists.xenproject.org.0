Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147421BA04C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 11:47:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT0Lb-0005U6-Vy; Mon, 27 Apr 2020 09:46:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTJa=6L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jT0La-0005U1-If
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 09:46:42 +0000
X-Inumbo-ID: fdc748d0-886b-11ea-974f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdc748d0-886b-11ea-974f-12813bfff9fa;
 Mon, 27 Apr 2020 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587980799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oJswjhzBTiefkpVsFIjUnMokq0duzsFgotK/E6vUzs0=;
 b=fO33Me8oOtV8iMg8K+POh+mZ2QewR550AYIbUAta3hcAcAzWGlp+SN5u
 OiCD2hbHdapMAOR9IXwWyNQLApaakky7iRKzjBKPDaJPtE8sR9flNHHKs
 xNxyNjyqeELl7N+LBsItRtPyJrahhP4uH+jP/p9eX1mzXZZdPkQvdJBjp 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tkJBaL4wiIXD/F8yyz9kgBaUnDKE/smQCOWhVNPgoFXHBClaPONtp13GZzhwnnUvtH6aE58RjV
 P0n4JpDzgtPQFkzrMtBWZuCFtBlg3vcwbUlL9f6C0LWBOL2F8xgqBXgGv1eS5lCUeGQ7fOBLOk
 GEAPhbgfr4DgU5+y3W0/OLcRsRmyENFA7R3iSl+q2n+KyMx+1zQ1pm/XMH6kNXfGQFjV6BUsxs
 zhUlFG+PaPwLSeyuWODI2gxn6OswmdeQO4H48LBNqJjZUNmW0Q4FEKwibgmo47rpqV4/4e/Pj/
 J2A=
X-SBRS: 2.7
X-MesageID: 16604035
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,323,1583211600"; d="scan'208";a="16604035"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 2/2] golang/xenlight: stop tracking generated files
Thread-Topic: [PATCH 2/2] golang/xenlight: stop tracking generated files
Thread-Index: AQHWGQW3KWV19rAkYkmTfkaVJgFqA6iMneeA
Date: Mon, 27 Apr 2020 09:46:35 +0000
Message-ID: <F960BC2C-8E5C-4E1E-9808-988844012426@citrix.com>
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
 <f4fd2508a9cbceec2d1b8b480d4e4a15422d67d2.1587599095.git.rosbrookn@ainfosec.com>
In-Reply-To: <f4fd2508a9cbceec2d1b8b480d4e4a15422d67d2.1587599095.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A2FB48AC54E2F41A42B80EB69F4639F@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIEFwciAyMywgMjAyMCwgYXQgMToyNSBBTSwgTmljayBSb3Nicm9vayA8cm9zYnJvb2tu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgZ2VuZXJhdGVkIGdvIGZpbGVzIHdlcmUgdHJh
Y2tlZCB0ZW1wb3JhcmlseSB3aGlsZSB0aGUgaW5pdGlhbA0KPiBpbXBsZW1lbnRhdGlvbiBvZiBn
ZW5nb3R5cGVzLnB5IHdhcyBpbiBwcm9ncmVzcy4gVGhleSBjYW4gbm93IGJlIHJlbW92ZWQNCj4g
YW5kIGlnbm9yZWQgYnkgZ2l0IGFuZCBoZy4NCj4gDQo+IFdoaWxlIGhlcmUsIG1ha2Ugc3VyZSBn
ZW5lcmF0ZWQgZmlsZXMgYXJlIHJlbW92ZWQgYnkgbWFrZSBjbGVhbi4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQoNCkp1c3QgdG8g
YmUgY2xlYXIsIHRvIG9ubG9va2VycyAocGFydGljdWxhcmx5IGNvbW1pdHRlcnMpOiBpdOKAmXMg
bG9va2luZyBsaWtlIHdl4oCZcmUgZ29pbmcgdG8gbGVhdmUgdGhlIGdlbmVyYXRlZCBmaWxlcyBp
biB0aGUgdHJlZTsgc28gdGhpcyBwYXRjaCBpcyBwcm9iYWJseSBvYnNvbGV0ZS4NCg0KIC1HZW9y
Z2U=

