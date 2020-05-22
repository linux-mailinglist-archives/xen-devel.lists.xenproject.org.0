Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718EC1DE484
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:33:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4z4-0004X2-Hv; Fri, 22 May 2020 10:32:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jc4z2-0004Wx-Hu
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:32:56 +0000
X-Inumbo-ID: 98cabdf8-9c17-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98cabdf8-9c17-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 10:32:55 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HrmzpA6NjPjOkeGyoU3BOKkESjZ0TNVahvFc58wj+wYdNDwMYiACcby+7Y/9nRpCdhwBE5H/xr
 2hrb4V6yB9eV3KNvkor47TQ1PWnErVMguvEbPdKhGVxC4zJaHinZ0OPJQs6xCRxgBjYS9tBSNd
 863NXC0BGqJyBESYDtLquq+4U6wpG3shhzxTuvO3xucCdIZCOWwn3XcfHJi+uTPnhQfrHSdCIm
 jwCyiXpoxgIymt1Qg4Oe3wG4JmujaGr/96XTmLaOhOs/vDfvjK6nJe0qwWoSUOIP3Gb4hrwNU0
 nT0=
X-SBRS: 2.7
X-MesageID: 18161851
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18161851"
From: George Dunlap <George.Dunlap@citrix.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH] golang: Update generated files after libxl_types.idl
 change
Thread-Topic: [PATCH] golang: Update generated files after libxl_types.idl
 change
Thread-Index: AQHWMB5jZYuungko1U2ePr9Wy7HjSqizvjyAgAAIsIA=
Date: Fri, 22 May 2020 10:32:51 +0000
Message-ID: <3FE58AF4-3C20-4615-A28C-31273C4BF301@citrix.com>
References: <20200522094956.3611661-1-george.dunlap@citrix.com>
 <20200522100145.w6xd5v7ioubzkni5@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20200522100145.w6xd5v7ioubzkni5@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0E7A2754202414C8E5DAB1A16B7DE86@citrix.com>
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDIyLCAyMDIwLCBhdCAxMTowMSBBTSwgV2VpIExpdSA8d2xAeGVuLm9yZz4g
d3JvdGU6DQo+IA0KPiBPbiBGcmksIE1heSAyMiwgMjAyMCBhdCAxMDo0OTo1NkFNICswMTAwLCBH
ZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4gYy9zIDdlZmQ5ZjNkNDUgKCJsaWJ4bDogSGFuZGxlIExp
bnV4IHN0dWJkb21haW4gc3BlY2lmaWMgUUVNVQ0KPj4gb3B0aW9ucy4iKSBtb2RpZmllZCBsaWJs
X3R5cGVzLmlkbC4gIFJ1biBnZW5nb3R5cGVzLnB5IGFnYWluIHRvIHVwZGF0ZQ0KPiANCj4gbGli
eGxfdHlwZXMuaWRsLg0KPiANCj4+IHRoZSBnZW5lYXRlZCBnb2xhbmcgYmluZGluZ3MuDQo+PiAN
Cj4gDQo+IENhbiB3ZSBwZXJoYXBzIGFkZCBhIGRlcGVuZGVuY3kgb24gZ29sYW5nJ3Mgc2lkZSBz
dWNoIHRoYXQgaXQgY2FuIGJlDQo+IGF1dG8tZ2VuZXJhdGVkIGluIHRoZSBmdXR1cmU/DQoNCklu
ZGVlZCwgSeKAmW0gdHJ5aW5nIHRvIHRoaW5rIG9mIGEgZ29vZCBzb2x1dGlvbiB0byB0aGlzLg0K
DQogLUdlb3JnZQ0KDQo=

