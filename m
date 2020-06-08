Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BB01F1BAC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 17:07:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiJMo-0005oC-Tb; Mon, 08 Jun 2020 15:07:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11Lh=7V=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jiJMn-0005o4-Ld
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 15:07:13 +0000
X-Inumbo-ID: bad64dce-a999-11ea-b28d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bad64dce-a999-11ea-b28d-12813bfff9fa;
 Mon, 08 Jun 2020 15:07:12 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0TPijvVH2saqwdi8Wesv0zmlAiKq6hvHLneDATXFeNK8+2NIi77IthaCO5OGpS9KBP6UgI1TsH
 v+Fd6ecEy9joq8vqb6N1Mj1Sbcj5xm095WxdZgr6kB/s+zIiSAJiANd0W+ElLqEF7rxnPy8z2w
 Dob0ivQcHDPxE0jYZR8ZlYBA5Pj67TaBnvtun8UcBkOrb4KsovcVQzdLyAXh+1ottDq8cf6DJI
 TQGe/Qga4ZVuet/GLF8Yo/Tbg2xHxk7SRZIp5nYj3oFMhUKxHurIudwWzZaUHg3IwW0RihNDJZ
 iuA=
X-SBRS: 2.7
X-MesageID: 19505789
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19505789"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: 4.14.0-rc1 blocked on goland build failure - decision needed
Thread-Topic: 4.14.0-rc1 blocked on goland build failure - decision needed
Thread-Index: AQHWPaORQPtYscwMOUSBGUclg/JjvajOqv0AgAAFKQA=
Date: Mon, 8 Jun 2020 15:07:08 +0000
Message-ID: <4DD3680F-7EE6-4C97-B070-DFFE86AE7D4A@citrix.com>
References: <005201d635a9$2b9bbc20$82d33460$@xen.org>
 <2C4D8F6A-1498-4F13-923C-AAF2960D531F@citrix.com>
 <007401d635c2$6b14a150$413de3f0$@xen.org>
 <001201d63b5b$d8ebe7d0$8ac3b770$@xen.org>
 <DC327618-2416-47D9-832E-AE8198060A97@citrix.com>
 <002901d63d7f$2301a6a0$6904f3e0$@xen.org>
 <24286.12984.247498.799575@mariner.uk.xensource.com>
 <003001d63d93$9a4bbcf0$cee336d0$@xen.org>
 <24286.18072.880121.172973@mariner.uk.xensource.com>
 <003301d63d9e$97de3e60$c79abb20$@xen.org>
 <24286.20279.622221.291800@mariner.uk.xensource.com>
 <24286.20424.998938.535648@mariner.uk.xensource.com>
In-Reply-To: <24286.20424.998938.535648@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <8867DBA564D79D4A86700B4E0682CBBE@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDgsIDIwMjAsIGF0IDM6NDggUE0sIElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IElhbiBKYWNrc29uIHdyaXRlcyAoIjQuMTQuMC1y
YzEgYmxvY2tlZCBvbiBnb2xhbmQgYnVpbGQgZmFpbHVyZSAtIGRlY2lzaW9uIG5lZWRlZCIpOg0K
Pj4gSGksIFBhdWwuICBGb3IgdGhvc2Ugb24geGVuLWRldmVsOiBjb250ZXh0IGlzIHRoYXQgUGF1
bCBhc2tlZCBtZSB0bw0KPj4gY3V0IDQuMTQuMC1yYzEuICBUaGUgY2hlY2tsaXN0IGFza3MgbWUg
dG8gcGVyZm9ybSBhIHRlc3QgYnVpbGQuDQo+PiANCj4+IE15IDMyLWJpdCB0b29scyB0ZXN0IGJ1
aWxkIGZhaWxlZC4gIEkgdGhpbmsgdGhlIHByb2JsZW0gaXMgcHJvYmFibHkNCj4+IHNwZWNpZmlj
IHRvIDMyLWJpdCB1c2VybGFuZCBvbiA2NC1iaXQgTGludXgga2VybmVsLiAgSSB3aWxsIHNlbmQg
YQ0KPj4gc2Vjb25kIGZvbGxvd3VwIG1haWwgbm90IENDIFBhdWwgd2l0aCB0ZWNobmljYWwgZGV0
YWlscy4NCj4gDQo+IFRlY2huaWNhbCBkZXRhaWxzQDoNCj4gDQo+IFRoZSBmaXJzdCBlcnJvciBs
b29rcyBsaWtlIHRoaXM6DQo+IA0KPiAuL2hlbHBlcnMuZ2VuLmdvOjkwMVsvdG1wL2dvLWJ1aWxk
NjQzMTU4Njg2L18vdS9pd2ovd29yay94ZW4uZ2l0L3Rvb2xzL2dvbGFuZy94ZW5saWdodC9fb2Jq
L2hlbHBlcnMuZ2VuLmNnbzEuZ286MTE3Ml06DQo+IHR5cGUgWzI2ODQzNTQ1Nl1fQ3R5cGVfc3Ry
dWN0X2xpYnhsX3NjaGVkX3BhcmFtcyBsYXJnZXIgdGhhbiBhZGRyZXNzDQo+IHNwYWNlDQoNCkFj
dHVhbGx5LCBJIGRvbuKAmXQgdGhpbmsgdGhpcyBoYXMgYW55dGhpbmcgdG8gZG8gd2l0aCAzMi1i
aXQgdXNlcnNwYWNlLCBidXQgaW5zdGVhZCBoYXMgdG8gZG8gd2l0aCB0aGUgdmVyc2lvbiBvZiBn
bzogVGhlIHZlcnNpb24gaW4gc3RyZXRjaCBpcyAxLjcgYW5kIGNob2tlcyBvbiB0aGlzIGZvciBz
b21lIHJlYXNvbi4gIEkgaGF2ZW7igJl0IGhhZCB0aW1lIHRvIHRyYWNrIGRvd24gd2h5LiAgSXQg
ZG9lcyB3b3JrIGZvciBnb2xhbmcgMS4xMS4NCg0KT3B0aW9ucyBhcmU6DQoNCjEuIERvY3VtZW50
IHRoYXQgaWYgeW91IGhhdmUgYSB2ZXJzaW9uIG9mIGdvbGFuZyBvbGRlciB0aGFuIDEuMTEsIHlv
dSBuZWVkIHRvIGFkZCBg4oCUZGlzYWJsZS1nb2xhbmdgIA0KDQoyLiBNb2RpZnkgY29uZmlndXJl
IHRvIGNoZWNrIGZvciB0aGUgZ28gdmVyc2lvbiwgYW5kIG9ubHkgZW5hYmxlIGlmIHRoZSB2ZXJz
aW9uIGlzID4gMS4xMQ0KDQozLiBUcnkgdG8gcm9vdC1jYXVzZSB0aGUgaXNzdWUuDQoNCknigJlt
IGluY2xpbmVkIHRvIHNheSB3ZSBzaG91bGQgZ28gd2l0aCAjMSBmb3IgdGhpcyBSQywgdGhlbiBl
aXRoZXIgIzIgb3IgIzMuDQoNCiAtR2VvcmdlDQoNCg==

