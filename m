Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903D989EB4C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 08:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702923.1098592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruRpW-0004lj-4y; Wed, 10 Apr 2024 06:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702923.1098592; Wed, 10 Apr 2024 06:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruRpW-0004jD-25; Wed, 10 Apr 2024 06:53:10 +0000
Received: by outflank-mailman (input) for mailman id 702923;
 Wed, 10 Apr 2024 06:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iiiq=LP=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1ruRpU-0004ha-Mq
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 06:53:08 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faf5e9a8-f706-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 08:53:04 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 10 Apr
 2024 08:53:04 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Wed, 10 Apr 2024 08:53:04 +0200
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
X-Inumbo-ID: faf5e9a8-f706-11ee-94a3-07e782e9044d
From: John Ernberg <john.ernberg@actia.se>
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan
	<peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaic9tXQJwwldfJUm8+1aRDWuvfLFfXksAgAGUBwA=
Date: Wed, 10 Apr 2024 06:53:04 +0000
Message-ID: <813e9e0a-9447-4012-822a-843e1f88f254@actia.se>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se>
 <d02b7de4-41bf-4bf9-8b04-e21625449f27@amd.com>
In-Reply-To: <d02b7de4-41bf-4bf9-8b04-e21625449f27@amd.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A2958D7295464746A
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3965DE9A8C3994C98E0C14A9B04749F@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

T24gNC85LzI0IDg6NDcgQU0sIE1pY2hhbCBPcnplbCB3cm90ZToNCj4gSGkgSm9obiwNCj4gDQo+
IE9uIDA4LzA0LzIwMjQgMTg6MTEsIEpvaG4gRXJuYmVyZyB3cm90ZToNCj4+DQo+Pg0KPj4gV2hl
biB1c2luZyBMaW51eCBmb3IgZG9tMCB0aGVyZSBhcmUgYSBidW5jaCBvZiBkcml2ZXJzIHRoYXQg
bmVlZCB0byBkbyBTTUMNCj4+IFNJUCBjYWxscyBpbnRvIHRoZSBmaXJtd2FyZSB0byBlbmFibGUg
Y2VydGFpbiBoYXJkd2FyZSBiaXRzIGxpa2UgdGhlDQo+PiB3YXRjaGRvZy4NCj4+DQo+PiBQcm92
aWRlIGEgYmFzaWMgcGxhdGZvcm0gZ2x1ZSB0aGF0IGltcGxlbWVudHMgdGhlIG5lZWRlZCBTTUMg
Zm9yd2FyZGluZy4NCj4+DQo+PiBUaGUgZm9ybWF0IG9mIHRoZXNlIGNhbGxzIGFyZSBhcyBmb2xs
b3dzOg0KPj4gICAtIHJlZyAwOiBmdW5jdGlvbiBJRA0KPj4gICAtIHJlZyAxOiBzdWJmdW5jdGlv
biBJRCAod2hlbiB0aGVyZSdzIGEgc3ViZnVuY3Rpb24pDQo+PiAgIHJlbWFpbmluZyByZWdzOiBh
cmdzDQo+Pg0KPj4gRm9yIG5vdyB3ZSBvbmx5IGFsbG93IERvbTAgdG8gbWFrZSB0aGVzZSBjYWxs
cyBhcyB0aGV5IGFyZSBhbGwgbWFuYWdpbmcNCj4+IGhhcmR3YXJlLiBUaGVyZSBpcyBubyBzcGVj
aWZpY2F0aW9uIGZvciB0aGVzZSBTSVAgY2FsbHMsIHRoZSBJRHMgYW5kIG5hbWVzDQo+PiBoYXZl
IGJlZW4gZXh0cmFjdGVkIGZyb20gdGhlIHVwc3RyZWFtIGxpbnV4IGtlcm5lbCBhbmQgdGhlIHZl
bmRvciBrZXJuZWwuDQo+Pg0KPj4gTW9zdCBvZiB0aGUgU0lQIGNhbGxzIGFyZSBvbmx5IGF2YWls
YWJsZSBmb3IgdGhlIGlNWDhNIHNlcmllcyBvZiBTb0NzLCBzbw0KPj4gdGhleSBhcmUgZWFzeSB0
byByZWplY3QgYW5kIHRoZXkgbmVlZCB0byBiZSByZXZpc2l0ZWQgd2hlbiBpTVg4TSBzZXJpZXMN
Cj4+IHN1cHBvcnQgaXMgYWRkZWQuDQo+IFN0YWxlIHBhcmFncmFwaC4gU2hvdWxkIGJlIHJlbW92
ZWQgZ2l2ZW4gdGhhdCB0aGUgZHJpdmVyIHRhcmdldHMgb25seSBRe00sWFB9Lg0KPiANCj4+DQo+
PiAgRnJvbSB0aGUgb3RoZXIgY2FsbHMgd2UgY2FuIHJlamVjdCBDUFVGUkVRIGJlY2F1c2UgRG9t
MCBjYW5ub3QgbWFrZSBhbg0KPj4gaW5mb3JtZWQgZGVjaXNpb24gcmVnYXJkaW5nIENQVSBmcmVx
dWVuY3kgc2NhbGluZywgV0FLRVVQX1NSQyBpcyB0byB3YWtlDQo+PiB1cCBmcm9tIHN1c3BlbmQs
IHdoaWNoIFhlbiBkb2Vzbid0IHN1cHBvcnQgYXQgdGhpcyB0aW1lLg0KPj4NCj4+IFRoaXMgbGVh
dmVzIHRoZSBUSU1FIFNJUCwgT1RQIFNJUHMsIEJVSUxESU5GTyBTSVAgYW5kIFRFTVAgQUxBUk0g
U0lQLCB3aGljaA0KPj4gZm9yIG5vdyBhcmUgYWxsb3dlZCB0byBEb20wLg0KPiBCVUlMRElORk8s
IFRFTVAgQUxBUk0gYXJlIGxlZnRvdmVycyBmcm9tIHByZXZpb3VzIHJldmlzaW9uLg0KPiANCj4+
DQo+PiBOT1RFOiBUaGlzIGNvZGUgaXMgYmFzZWQgb24gY29kZSBmb3VuZCBpbiBOWFAgWGVuIHRy
ZWUgbG9jYXRlZCBoZXJlOg0KPj4gaHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvaW14LXhlbi9i
bG9iL2xmLTUuMTAueV80LjEzL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvaW14OHFtLmMNCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4+IFtqZXJuYmVy
ZzogQWRkIFNJUCBjYWxsIGZpbHRlcmluZ10NCj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRXJuYmVy
ZyA8am9obi5lcm5iZXJnQGFjdGlhLnNlPg0KPiBSZXZpZXdlZC1ieTogTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gDQo+IFRoZSBjb21taXQgbXNnIGNhbiBiZSBmaXhlZCBv
biBjb21taXQuDQo+IA0KPiB+TWljaGFsDQoNCg0KQXBvbG9naWVzIGZvciBmb3JnZXR0aW5nIHRv
IGFkanVzdCB0aGF0LiBMZXQgbWUga25vdyBpZiBpdCdzIGVhc2llciBmb3IgDQp5b3UgaWYgSSBk
byBhIHY1IHdpdGggdGhlIGZpeGVkIGNvbW1pdCBtZXNzYWdlLg0KDQpUaGFua3MhIC8vIEpvaG4g
RXJuYmVyZw==

