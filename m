Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB291E5E59
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 13:33:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeGle-00070v-7J; Thu, 28 May 2020 11:32:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oNcS=7K=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jeGlc-00070q-8H
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 11:32:08 +0000
X-Inumbo-ID: dbe773a6-a0d6-11ea-a7b0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbe773a6-a0d6-11ea-a7b0-12813bfff9fa;
 Thu, 28 May 2020 11:32:06 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YDMVmpaopbqOp2DZITwIx9RAzo4FFGonV6hwe07867BKdayL0WwFDqi4WK4SBEwAVfsTCJI1Az
 RGUHkO7ywIQo79iL/ExC6Q0IMS3AQOX4K/zjOd5+jrXS+0TUIQbsGkmfKSqXD8C0hgT/e/VP9Q
 Us5C6wYgGJhbPcIlSVhyyRfFLqUEqEldShK3fh8h6gC6b7kKpMVPODKR8a0EBlB/UaNXTYUVBN
 JDmcKkiTmENC9vOxTTtnY+5kCMt8e5roGK40iwS0NBwPxA9vwzEWuS51RZWUa5WWSx1/mbT/vi
 LPQ=
X-SBRS: 2.7
X-MesageID: 18940914
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,444,1583211600"; d="scan'208";a="18940914"
From: George Dunlap <George.Dunlap@citrix.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/5] automation/archlinux: Add 32-bit glibc headers
Thread-Topic: [PATCH v2 3/5] automation/archlinux: Add 32-bit glibc headers
Thread-Index: AQHWM6tSHP0e+i+tl0C42vBSo8ubOai7nmMAgAAM6QCAAZMLgA==
Date: Thu, 28 May 2020 11:32:02 +0000
Message-ID: <CF50B50F-BDC0-4290-A606-33927CE86FE9@citrix.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-4-george.dunlap@citrix.com>
 <20200527104316.GH2105@perard.uk.xensource.com>
 <20200527112928.72amqcojenrz2a46@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20200527112928.72amqcojenrz2a46@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <06163BBAE935194791B452966CCC8E22@citrix.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI3LCAyMDIwLCBhdCAxMjoyOSBQTSwgV2VpIExpdSA8d2xAeGVuLm9yZz4g
d3JvdGU6DQo+IA0KPiBPbiBXZWQsIE1heSAyNywgMjAyMCBhdCAxMTo0MzoxNkFNICswMTAwLCBB
bnRob255IFBFUkFSRCB3cm90ZToNCj4+IE9uIFR1ZSwgTWF5IDI2LCAyMDIwIGF0IDExOjE2OjEw
UE0gKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+Pj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93
aW5nIGJ1aWxkIGVycm9yIGluIGh2bWxvYWRlcjoNCj4+PiANCj4+PiB1c3IvaW5jbHVkZS9nbnUv
c3R1YnMuaDo3OjExOiBmYXRhbCBlcnJvcjogZ251L3N0dWJzLTMyLmg6IE5vIHN1Y2ggZmlsZSBv
ciBkaXJlY3RvcnkNCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+DQo+Pj4gLS0tDQo+Pj4gYXV0b21hdGlvbi9idWlsZC9hcmNo
bGludXgvY3VycmVudC5kb2NrZXJmaWxlIHwgMSArDQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vYnVpbGQvYXJjaGxp
bnV4L2N1cnJlbnQuZG9ja2VyZmlsZSBiL2F1dG9tYXRpb24vYnVpbGQvYXJjaGxpbnV4L2N1cnJl
bnQuZG9ja2VyZmlsZQ0KPj4+IGluZGV4IDlhZjVkNjZhZmMuLjUwOTVkZTY1YjggMTAwNjQ0DQo+
Pj4gLS0tIGEvYXV0b21hdGlvbi9idWlsZC9hcmNobGludXgvY3VycmVudC5kb2NrZXJmaWxlDQo+
Pj4gKysrIGIvYXV0b21hdGlvbi9idWlsZC9hcmNobGludXgvY3VycmVudC5kb2NrZXJmaWxlDQo+
Pj4gQEAgLTE5LDYgKzE5LDcgQEAgUlVOIHBhY21hbiAtUyAtLXJlZnJlc2ggLS1zeXN1cGdyYWRl
IC0tbm9jb25maXJtIC0tbm9wcm9ncmVzc2JhciAtLW5lZWRlZCBcDQo+Pj4gICAgICAgICBpYXNs
IFwNCj4+PiAgICAgICAgIGluZXR1dGlscyBcDQo+Pj4gICAgICAgICBpcHJvdXRlIFwNCj4+PiAr
ICAgICAgICBsaWIzMi1nbGliYyBcDQo+Pj4gICAgICAgICBsaWJhaW8gXA0KPj4+ICAgICAgICAg
bGliY2FjYXJkIFwNCj4+PiAgICAgICAgIGxpYmdsIFwNCj4+IA0KPj4gQWNrZWQtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPiANCj4gQWxsIGF1dG9tYXRp
b24gcGF0Y2hlczoNCj4gDQo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiANCj4g
QW50aG9ueSwgY2FuIHlvdSBnZW5lcmF0ZSBhbmQgcHVzaCB0aGUgbmV3IGltYWdlcz8gVGhhbmtz
Lg0KDQpUaGVzZSBhcmUgY2hlY2tlZCBpbiBub3cuDQoNCkJUVyBpdCBsb29rcyBsaWtlIHRoZXJl
IG1heSBiZSBzb21lIG90aGVyIGNvbXBpbGF0aW9uIGlzc3VlcyB1cGRhdGluZyB0aGUgYXJjaGxp
bnV4IGltYWdlLiAgSSB0ZXN0ZWQgdGhlIG1pbmltdW0gY29uZmlndXJhdGlvbiByZXF1aXJlZCB0
byBnZXQgdGhlIGdvbGFuZyBiaW5kaW5ncyB0byBidWlsZDsgYnV0IGEgZnVsbCBidWlsZCBmYWls
cyB3aXRoIG90aGVyIGVycm9ycyBJIGhhdmVu4oCZdCBoYWQgdGltZSB0byBkaWFnbm9zZSB5ZXQu
DQoNCiAtR2Vvcmdl

