Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9372845CE3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 17:17:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674531.1049533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZkT-0008E6-5B; Thu, 01 Feb 2024 16:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674531.1049533; Thu, 01 Feb 2024 16:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZkT-0008Bb-27; Thu, 01 Feb 2024 16:17:09 +0000
Received: by outflank-mailman (input) for mailman id 674531;
 Thu, 01 Feb 2024 16:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1rn=JK=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rVZkR-0008BT-8f
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 16:17:07 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 579aba30-c11d-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 17:17:06 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 1 Feb
 2024 17:17:06 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Thu, 1 Feb 2024 17:17:06 +0100
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
X-Inumbo-ID: 579aba30-c11d-11ee-8a43-1f161083a0e0
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Peng Fan <peng.fan@nxp.com>
CC: Jonas Blixt <jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDzxxsAgAA1KwCAAVx5AIAAQjeA
Date: Thu, 1 Feb 2024 16:17:05 +0000
Message-ID: <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
In-Reply-To: <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72955667264
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6C5E070CDA15F49BC5E8D4D4FFE4477@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

T24gMi8xLzI0IDEzOjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IA0KPiANCj4gT24gMzEvMDEv
MjAyNCAxNTozMiwgSm9obiBFcm5iZXJnIHdyb3RlOg0KPj4gSGkgSnVsaWVuLA0KPiANCj4gSGkg
Sm9obiwNCj4gDQo+PiBPbiAxLzMxLzI0IDEzOjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4g
SGksDQo+Pj4NCj4+PiBPbiAzMS8wMS8yMDI0IDExOjUwLCBKb2huIEVybmJlcmcgd3JvdGU6DQo+
Pj4+IFdoZW4gdXNpbmcgTGludXggZm9yIGRvbTAgdGhlcmUgYXJlIGEgYnVuY2ggb2YgZHJpdmVy
cyB0aGF0IG5lZWQgdG8gZG8NCj4+Pj4gU01DDQo+Pj4+IFNJUCBjYWxscyBpbnRvIHRoZSBQU0NJ
IHByb3ZpZGVyIHRvIGVuYWJsZSBjZXJ0YWluIGhhcmR3YXJlIGJpdHMgDQo+Pj4+IGxpa2UgdGhl
DQo+Pj4+IHdhdGNoZG9nLg0KPj4+DQo+Pj4gRG8geW91IGtub3cgd2hpY2ggcHJvdG9jb2wgdGhp
cyBpcyB1bmRlciB0aGUgaG9vZC4gSXMgdGhpcyBTQ01JPw0KPj4NCj4+IEkgdGhpbmsgSSBjb25m
dXNlZCBteXNlbGYgaGVyZSB3aGVuIEkgd3JvdGUgdGhlIGNvbW1pdCBsb2cuDQo+Pg0KPj4gVGhl
IEVMMyBjb2RlIGluIG91ciBjYXNlIGlzIEFURiwgYW5kIGl0IGRvZXMgbm90IGFwcGVhciB0byBi
ZSBTQ01JLCBub3INCj4+IFBTQ0kuIFRoZSByZWdpc3RlciB1c2FnZSBvZiB0aGVzZSBTTUMgU0lQ
IGNhbGxzIGFyZSBhcyBmb2xsb3dzOg0KPj4gYTAgLSBzZXJ2aWNlDQo+PiBhMSAtIGZ1bmN0aW9u
DQo+PiBhMi1hNyAtIGFyZ3MNCj4+DQo+PiBJbiBBVEYgdGhlIGhhbmRsZXIgaXMgZGVjbGFyZWQg
YXMgYSBydW50aW1lIHNlcnZpY2UuDQo+Pg0KPj4gV291bGQgdGhlIGFwcHJvcHJpYXRlIGNvbW1t
aXQgbWVzc2FnZSBoZXJlIGJlIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMNCj4+IG9mIGJlbG93
Pw0KPj4gIiIiDQo+PiBXaGVuIHVzaW5nIExpbnV4IGZvciBkb20wIHRoZXJlIGFyZSBhIGJ1bmNo
IG9mIGRyaXZlcnMgdGhhdCBuZWVkIHRvIA0KPj4gZG/CoMKgIFNNQw0KPj4gU0lQIGNhbGxzIGlu
dG8gdGhlIGZpcm13YXJlIHRvIGVuYWJsZSBjZXJ0YWluIGhhcmR3YXJlIGJpdHMgbGlrZSB0aGUN
Cj4+IHdhdGNoZG9nLg0KPj4gIiIiDQo+IA0KPiBJdCByZWFkcyBiZXR0ZXIgdGhhbmtzLg0KPiAN
Cj4gWy4uLl0NCj4gDQo+Pj4gQnV0IGV2ZW4gaWYgd2UgcmVzdHJpY3QgdG8gZG9tMCwgaGF2ZSB5
b3UgY2hlY2tlZCB0aGF0IG5vbmUgb2YgdGhlIFNNQ3MNCj4+PiB1c2UgYnVmZmVycz8NCj4+IEkg
aGF2ZW4ndCBmb3VuZCBhbnkgc3VjaCBpbnN0YW5jZXMgaW4gdGhlIExpbnV4IGtlcm5lbCB3aGVy
ZSBhIGJ1ZmZlciBpcw0KPj4gdXNlZC4gQWRkaW5nIGEgY2FsbCBmaWx0ZXJpbmcgbGlrZSBzdWdn
ZXN0ZWQgYmVsb3cgYWRkaXRpb25zIG9mIHN1Y2gNCj4+IGZ1bmN0aW9ucyBjYW4gYmUgZGlzY292
ZXJlZCBhbmQgYWRhcHRlZCBmb3IgaWYgdGhleSB3b3VsZCBzaG93IHVwIGxhdGVyLg0KPj4+DQo+
Pj4gUmF0aGVyIHRoYW4gcHJvdmlkaW5nIGEgYmxhbmtldCBmb3J3YXJkLCB0byBtZSBpdCBzb3Vu
ZHMgbW9yZSBsaWtlIHlvdQ0KPj4+IHdhbnQgdG8gcHJvdmlkZSBhbiBhbGxvd2xpc3Qgb2YgdGhl
IFNNQ3MuIFRoaXMgaXMgbW9yZSBmdXR1cmVwcm9vZiBhbmQNCj4+PiBhdm9pZCB0aGUgcmlzayB0
byBleHBvc2UgdW5zYWZlIFNNQ3MgdG8gYW55IGRvbWFpbi4NCj4+Pg0KPj4+IEZvciBhbiBleGFt
cGxlLCB5b3UgY2FuIGhhdmUgYSBsb29rIGF0IHRoZSBFRU1JIG1lZGlhdG9yIGZvciBYaWxpbngu
DQo+Pg0KPj4gQWNrLiBEbyB5b3UgcHJlZmVyIHRvIHNlZSBvbmx5IG9uIFNNQ0NDIHNlcnZpY2Ug
bGV2ZWwgb3IgYWxzbyBvbg0KPj4gZnVuY3Rpb24gbGV2ZWw/IChhMSByZWdpc3RlciwgcGVyIGRl
c2NyaXB0aW9uIGVhcmxpZXIpDQo+IA0KPiBJIGFtIG5vdCBzdXJlLiBJdCB3aWxsIGRlcGVuZCBv
biB3aGV0aGVyIGl0IGlzIGNvcnJlY3QgdG8gZXhwb3NlICphbGwqIA0KPiB0aGUgZnVuY3Rpb25z
IHdpdGhpbiBhIHNlcnZpY2UgbGV2ZWwgYW5kIHRoZXkgaGF2ZSB0aGUgc2FtZSBmb3JtYXQuDQo+
IA0KPiBJZiB5b3UgY2FuJ3QgZ3VhcmFudGVlIHRoYXQsIHRoZW4geW91IHdpbGwgbW9zdCBsaWtl
bHkgbmVlZCB0byBhbGxvd2xpc3QgDQo+IGF0IHRoZSBmdW5jdGlvbiBsZXZlbC4NCj4gDQo+IEFs
c28sIGRvIHlvdSBoYXZlIGEgc3BlYyBpbiBoYW5kIHRoYXQgd291bGQgaGVscCB0byB1bmRlcnN0
YW5kIHdoaWNoIA0KPiBzZXJ2aWNlL2Z1bmN0aW9uIGlzIGltcGxlbWVudGVkIHZpYSB0aG9zZSBT
TUNzPw0KDQpJIGRvbid0IGhhdmUgdGhlIHNwZWMgdW5mb3J0dW5hdGVseSwgYnV0IEkgd2lsbCBh
ZGQgYSBmaWx0ZXIgb24gYm90aCANCnNlcnZpY2UgYW5kIGZ1bmN0aW9uIGZvciBWMiBhbmQgd2Un
bGwgdGFrZSBpdCBmcm9tIHRoZXJlLg0KPiANCj4gQ2hlZXJzLA0KPiANCg0KVGhhbmtzISAvLyBK
b2huIEVybmJlcmc=

