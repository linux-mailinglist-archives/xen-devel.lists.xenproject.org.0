Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69884844313
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 16:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674089.1048782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCYo-0007QS-5C; Wed, 31 Jan 2024 15:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674089.1048782; Wed, 31 Jan 2024 15:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCYo-0007Nl-1p; Wed, 31 Jan 2024 15:31:34 +0000
Received: by outflank-mailman (input) for mailman id 674089;
 Wed, 31 Jan 2024 15:31:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aY=JJ=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rVCYm-0007NU-Vi
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 15:31:32 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf98e0e2-c04d-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 16:31:32 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 31 Jan
 2024 16:31:31 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 31 Jan 2024 16:31:31 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cf98e0e2-c04d-11ee-8a43-1f161083a0e0
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/drivers: imx-lpuart: Add iMX8QXP compatible
Thread-Topic: [PATCH 2/2] xen/drivers: imx-lpuart: Add iMX8QXP compatible
Thread-Index: AQHaVDuqVZ6MA3Rd4EaFO4eTM5QUa7DzySMAgAAyuAA=
Date: Wed, 31 Jan 2024 15:31:31 +0000
Message-ID: <9ad6f8ff-8db4-4132-99a4-bfa3bf82f587@actia.se>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-3-john.ernberg@actia.se>
 <04bd90d9-4cfd-4f76-a2fc-26a432b4c1c9@xen.org>
In-Reply-To: <04bd90d9-4cfd-4f76-a2fc-26a432b4c1c9@xen.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2921D72955667366
Content-Type: text/plain; charset="utf-8"
Content-ID: <E259449C1CBF814887ABFE623E9FCA74@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgSnVsaWVuLA0KDQpPbiAxLzMxLzI0IDEzOjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhp
IEpvaG4sDQo+IA0KPiBPbiAzMS8wMS8yMDI0IDExOjUwLCBKb2huIEVybmJlcmcgd3JvdGU6DQo+
PiBBbGxvdyB0aGUgdWFydCB0byBwcm9iZSBhbHNvIHdpdGggaU1YOFFYUC4gVGhlIGlwLWJsb2Nr
IGlzIHRoZSBzYW1lIGFzIA0KPj4gaW4gdGhlIFFNLA0KPj4gb25seSB0aGUgY29tcGF0aWJsZSBp
cyBuZWVkZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBFcm5iZXJnIDxqb2huLmVybmJl
cmdAYWN0aWEuc2U+DQo+IA0KPiBXaXRoIG9uZSByZW1hcmsgYmVsb3c6DQo+IA0KPiBBY2tlZC1i
eTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+PiAtLS0NCj4+IMKgIHhl
bi9kcml2ZXJzL2NoYXIvaW14LWxwdWFydC5jIHwgMSArDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9pbXgt
bHB1YXJ0LmMgDQo+PiBiL3hlbi9kcml2ZXJzL2NoYXIvaW14LWxwdWFydC5jDQo+PiBpbmRleCA3
N2Y3MGMyNzE5Li5jODVlODExMDlhIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9p
bXgtbHB1YXJ0LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvaW14LWxwdWFydC5jDQo+PiBA
QCAtMjU3LDYgKzI1Nyw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGlteF9scHVhcnRfaW5pdChzdHJ1
Y3QgDQo+PiBkdF9kZXZpY2Vfbm9kZSAqZGV2LA0KPj4gwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
dF9kZXZpY2VfbWF0Y2ggaW14X2xwdWFydF9kdF9jb21wYXRbXSANCj4+IF9faW5pdGNvbnN0ID0N
Cj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgiZnNsLGlteDhxbS1s
cHVhcnQiKSwNCj4+ICvCoMKgwqAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgiZnNsLGlteDhxeHAtbHB1
YXJ0IiksDQo+IA0KPiBJSVVDIHRoZSBiaW5kaW5nLCB0aGUgRGV2aWNlLVRyZWUgbm9kZSBjb21w
YXRpYmxlIHNob3VsZCBoYXZlIGJvdGggDQo+IGZzbCxpbXg4cW0tbHB1YXJ0IGFuZCBmc2wsaW14
OHF4cC1scHVhcnQuIEluIGZhY3QsIHRoZSBMaW51eCBkcml2ZXIgDQo+IGRvZXNuJ3QgcmVjb2du
aXplIHRoZSBmaXJzdCBjb21wYXRpYmxlLg0KPiANCj4gU28gbWF5YmUgd2UgY2FuIHJlbW92ZSB0
aGUgZmlyc3Qgb25lLg0KDQpJdCdzIGxpc3RlZCBpbiB0aGUgYmluZGluZ3MgYnV0IHRoZSBMaW51
eCBkcml2ZXIgaW5kZWVkIG5ldmVyIGxvb2tzIGZvciANCnFtLCBpdCBzaG91bGQgYmUgc2FmZSB0
byBkcm9wLiBJJ2xsIGRyb3AgdGhpcyBpbiBWMi4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCg0KVGhh
bmtzISAvLyBKb2huIEVybmJlcmc=

