Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8478E87377B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 14:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689125.1074135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhr57-0008SI-DD; Wed, 06 Mar 2024 13:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689125.1074135; Wed, 06 Mar 2024 13:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhr57-0008Pp-AB; Wed, 06 Mar 2024 13:13:13 +0000
Received: by outflank-mailman (input) for mailman id 689125;
 Wed, 06 Mar 2024 13:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/obO=KM=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rhr56-0008Pj-Ez
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 13:13:12 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4842ffde-dbbb-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 14:13:11 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 14:13:10 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 6 Mar 2024 14:13:10 +0100
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
X-Inumbo-ID: 4842ffde-dbbb-11ee-afda-a90da7624cb6
From: John Ernberg <john.ernberg@actia.se>
To: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Peng
 Fan" <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v2 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH v2 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaX1/Xeq0xXmpbZkiZsYYSHlNyGLELC+MAgABRRACAH2NoAA==
Date: Wed, 6 Mar 2024 13:13:10 +0000
Message-ID: <50a4bbff-e81e-42d2-94b1-c9eb064253b5@actia.se>
References: <20240214160644.3418228-1-john.ernberg@actia.se>
 <20240214160644.3418228-2-john.ernberg@actia.se>
 <3fe044c4-5e60-4e11-a99e-38534610640b@amd.com>
 <00df4ae3-8d14-41c3-95f1-65516c48e01c@actia.se>
In-Reply-To: <00df4ae3-8d14-41c3-95f1-65516c48e01c@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72955627162
Content-Type: text/plain; charset="utf-8"
Content-ID: <97C7EE6BECA1E1438BC59A58EC3A6B37@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgTWljaGFsLA0KDQpPbiAyLzE1LzI0IDE0OjUzLCBKb2huIEVybmJlcmcgd3JvdGU6DQo+IEhp
IE1pY2hhbCwNCj4gDQo+IE9uIDIvMTUvMjQgMTA6MDIsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+
IEhpLA0KPj4NCj4+IE9uIDE0LzAyLzIwMjQgMTc6MDYsIEpvaG4gRXJuYmVyZyB3cm90ZToNCj4+
Pg0KPj4+DQo+Pj4gV2hlbiB1c2luZyBMaW51eCBmb3IgZG9tMCB0aGVyZSBhcmUgYSBidW5jaCBv
ZiBkcml2ZXJzIHRoYXQgbmVlZCB0byANCj4+PiBkbyBTTUMNCj4+PiBTSVAgY2FsbHMgaW50byB0
aGUgZmlybXdhcmUgdG8gZW5hYmxlIGNlcnRhaW4gaGFyZHdhcmUgYml0cyBsaWtlIHRoZQ0KPj4+
IHdhdGNoZG9nLg0KPj4+DQo+Pj4gUHJvdmlkZSBhIGJhc2ljIHBsYXRmb3JtIGdsdWUgdGhhdCBp
bXBsZW1lbnRzIHRoZSBuZWVkZWQgU01DIGZvcndhcmRpbmcuDQo+Pj4NCj4+PiBUaGUgZm9ybWF0
IG9mIHRoZXNlIGNhbGxzIGFyZSBhcyBmb2xsb3dzOg0KPj4+IMKgIC0gcmVnIDA6IHNlcnZpY2Ug
SUQNCj4+PiDCoCAtIHJlZyAxOiBmdW5jdGlvbiBJRA0KPj4+IMKgIHJlbWFpbmluZyByZWdzOiBh
cmdzDQo+Pj4NCj4+PiBGb3Igbm93IHdlIG9ubHkgYWxsb3cgRG9tMCB0byBtYWtlIHRoZXNlIGNh
bGxzIGFzIHRoZXkgYXJlIGFsbCBtYW5hZ2luZw0KPj4+IGhhcmR3YXJlLiBUaGVyZSBpcyBubyBz
cGVjaWZpY2F0aW9uIGZvciB0aGVzZSBTSVAgY2FsbHMsIHRoZSBJRHMgYW5kIA0KPj4+IG5hbWVz
DQo+Pj4gaGF2ZSBiZWVuIGV4dHJhY3RlZCBmcm9tIHRoZSB1cHN0cmVhbSBsaW51eCBrZXJuZWwg
YW5kIHRoZSB2ZW5kb3IgDQo+Pj4ga2VybmVsLg0KPj4+DQo+Pj4gTW9zdCBvZiB0aGUgU0lQIGNh
bGxzIGFyZSBvbmx5IGF2YWlsYWJsZSBmb3IgdGhlIGlNWDhNIHNlcmllcyBvZiANCj4+PiBTb0Nz
LCBzbw0KPj4+IHRoZXkgYXJlIGVhc3kgdG8gcmVqZWN0IGFuZCB0aGV5IG5lZWQgdG8gYmUgcmV2
aXNpdGVkIHdoZW4gaU1YOE0gc2VyaWVzDQo+Pj4gc3VwcG9ydCBpcyBhZGRlZC4NCj4+IEdpdmVu
IHRoYXQgeW91IG5hbWVkIHlvdXIgZHJpdmVyICpxbSBhbmQgeW91IHNlYXJjaCBmb3IgZHQgY29t
cGF0aWJsZSANCj4+ICpxbSwgKnF4cCwgZG9lcyBpdCByZWFsbHkNCj4+IG1ha2Ugc2Vuc2UgdG8g
YWRkIFNJUCBjYWxscyBmb3IgaU1YOE0/DQo+IA0KPiBUaGUgaWRlYSB3YXMgdG8gYmUgZXhwbGlj
aXQgYWJvdXQgd2h5IGl0IG1ha2VzIG5vIHNlbnNlIHRvIHN1cHBvcnQgdGhvc2UgDQo+IFNJUHMg
b24gYSBxbS9xeHAgaW1wbGVtZW50YXRpb24uDQo+IA0KPiBJIGNhbiB0YWtlIGl0IG91dCBpZiB0
aGF0J3Mgbm90IGFyZ3VtZW50IGVub3VnaCB0byBoYXZlIHRoZW0uDQoNClsgLi4uIF0NCg0KPj4+
ICsjZGVmaW5lIElNWF9TSVBfR0VUX1NPQ19JTkZPIDB4QzIwMDAwMDYNCj4+PiArI2RlZmluZSBJ
TVhfU0lQX05PQ8KgwqDCoMKgwqDCoMKgwqDCoCAweEMyMDAwMDA4DQo+Pj4gKyNkZWZpbmUgSU1Y
X1NJUF9XQUtFVVBfU1JDwqDCoCAweEMyMDAwMDA5DQo+Pj4gKyNkZWZpbmUgSU1YX1NJUF9PVFBf
V1JJVEXCoMKgwqAgMHhDMjAwMDAwQg0KPj4gTG9va2luZyBhdCBBVEYsIGZvciBRTSxRWFAgdGhl
cmUgYXJlIGFsc286DQo+PiBCVUlMRElORk8gMHhDMjAwMDAwMw0KPj4gT1RQX1JFQUTCoCAweEMy
MDAwMDBBDQo+PiBTRVRfVEVNUMKgIDB4QzIwMDAwMEMNCj4gDQo+IEkgY2FuJ3QgZmluZCB0aGVt
IGluIHRoZSBjdXJyZW50IExpbnV4IGNvZGUsIHBlcmhhcHMgZGVwcmVjYXRlZC4NCj4gSSBjYW4g
YWRkIHRoZW0gYW5kIGRlbnkgdGhlbSBpZiBpdCBtYWtlcyBzZW5zZS4NCj4+DQo+Pj4gKw0KPj4+
ICsjZGVmaW5lIElNWF9TSVBfVElNRV9GX1JUQ19TRVRfVElNRcKgwqDCoMKgIDB4MDANCj4+PiAr
I2RlZmluZSBJTVhfU0lQX1RJTUVfRl9XRE9HX1NUQVJUwqDCoMKgwqDCoMKgIDB4MDENCj4+PiAr
I2RlZmluZSBJTVhfU0lQX1RJTUVfRl9XRE9HX1NUT1DCoMKgwqDCoMKgwqDCoCAweDAyDQo+Pj4g
KyNkZWZpbmUgSU1YX1NJUF9USU1FX0ZfV0RPR19TRVRfQUNUwqDCoMKgwqAgMHgwMw0KPj4+ICsj
ZGVmaW5lIElNWF9TSVBfVElNRV9GX1dET0dfUElOR8KgwqDCoMKgwqDCoMKgIDB4MDQNCj4+PiAr
I2RlZmluZSBJTVhfU0lQX1RJTUVfRl9XRE9HX1NFVF9USU1FT1VUIDB4MDUNCj4+PiArI2RlZmlu
ZSBJTVhfU0lQX1RJTUVfRl9XRE9HX0dFVF9TVEFUwqDCoMKgIDB4MDYNCj4+PiArI2RlZmluZSBJ
TVhfU0lQX1RJTUVfRl9XRE9HX1NFVF9QUkVUSU1FIDB4MDcNCj4+PiArDQoNClBpbmcuDQoNClRo
YW5rcyEgLy8gSm9obiBFcm5iZXJnDQo=

