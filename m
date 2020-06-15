Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372DD1F9575
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 13:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jknVf-0002de-N3; Mon, 15 Jun 2020 11:42:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hlp=74=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jknVd-0002cv-KU
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 11:42:37 +0000
X-Inumbo-ID: 4f01be44-aefd-11ea-b7bb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f01be44-aefd-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 11:42:36 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fYcpnAMj5QakSDLOon9DMnk0cUKJ62zFVtVmeFl15rdfY8uJjciPfeUNFU/+C/9JQKDx3hAlZB
 NXzDXlpfIHz4w6Lt7m4ajUlBxq3kC1U27xEBGo33kXtngR9ECYTnNz4eJjoFKdLePVieMhzvDh
 PqXmpLMGcl+YL9LrzkJdoxJ0t4QbA8Z7PucKXRZ5nCNSnlmMsDYz5ntsGAEUezoLUUTXJd8NUQ
 0241Z3W4VEGsdus0YLKtogWeQkytNqvA80Rk+xJd4U422FbCHDR7/YWLLr6aCPnCqS1gR8AnXr
 Huc=
X-SBRS: 2.7
X-MesageID: 20821990
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20821990"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH for-4.14] tools: check go compiler version if present
Thread-Topic: [PATCH for-4.14] tools: check go compiler version if present
Thread-Index: AQHWQMYebVnRI4xswUubEbtplwogO6jZcQgA
Date: Mon, 15 Jun 2020 11:42:33 +0000
Message-ID: <1092B004-655B-4EC0-8380-EBCCE677A1A4@citrix.com>
References: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
In-Reply-To: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC122289E4CE4A4DAB493FE8A24F8A7F@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIEp1biAxMiwgMjAyMCwgYXQgMzozMSBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJvb2tu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBDdXJyZW50bHksIG5vIG1pbmltdW0gZ28gY29tcGls
ZXIgdmVyc2lvbiBpcyByZXF1aXJlZCBieSB0aGUgY29uZmlndXJlDQo+IHNjcmlwdHMuIEhvd2V2
ZXIsIHRoZSBnbyBiaW5kaW5ncyBhY3R1YWxseSB3aWxsIG5vdCBidWlsZCB3aXRoIHNvbWUNCj4g
b2xkZXIgdmVyc2lvbnMgb2YgZ28uIEFkZCBhIGNoZWNrIGZvciBhIG1pbmltdW0gZ28gdmVyc2lv
biBvZiAxLjExLjEgaW4NCj4gYWNjb3JkYW5jZSB3aXRoIHRvb2xzL2dvbGFuZy94ZW5saWdodC9n
by5tb2QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWlu
Zm9zZWMuY29tPg0KDQpUaGVyZeKAmXMgYSBnb29kIGNoYW5jZSBJIHdvbuKAmXQgaGF2ZSB0aW1l
IHRvIHJldmlldyB0aGUgY29kZSBmb3IgdGhpcyBhdCBhbGwgdGhpcyB3ZWVrOyBidXQgcmVnYXJk
aW5nIHRoZSBpbnRlbnRpb24gb2YgaGF2aW5nIDEuMTEuMSBhcyBhIG1pbmltdW0gdmVyc2lvbjoN
Cg0KQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCg0K

