Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799858564ED
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 14:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681820.1060789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1racB3-0003GG-V9; Thu, 15 Feb 2024 13:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681820.1060789; Thu, 15 Feb 2024 13:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1racB3-0003Dg-SK; Thu, 15 Feb 2024 13:53:25 +0000
Received: by outflank-mailman (input) for mailman id 681820;
 Thu, 15 Feb 2024 13:53:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xu1W=JY=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1racB2-0003CF-O3
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 13:53:24 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94ab7efc-cc09-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 14:53:21 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 15 Feb
 2024 14:53:37 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Thu, 15 Feb 2024 14:53:21 +0100
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
X-Inumbo-ID: 94ab7efc-cc09-11ee-98f5-efadbce2ee36
From: John Ernberg <john.ernberg@actia.se>
To: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Peng
 Fan" <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v2 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH v2 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaX1/Xeq0xXmpbZkiZsYYSHlNyGLELC+MAgABRRAA=
Date: Thu, 15 Feb 2024 13:53:21 +0000
Message-ID: <00df4ae3-8d14-41c3-95f1-65516c48e01c@actia.se>
References: <20240214160644.3418228-1-john.ernberg@actia.se>
 <20240214160644.3418228-2-john.ernberg@actia.se>
 <3fe044c4-5e60-4e11-a99e-38534610640b@amd.com>
In-Reply-To: <3fe044c4-5e60-4e11-a99e-38534610640b@amd.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2921D7295560776A
Content-Type: text/plain; charset="utf-8"
Content-ID: <616A798E3110B14EAF3D6B37A4C35BB0@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgTWljaGFsLA0KDQpPbiAyLzE1LzI0IDEwOjAyLCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+IEhp
LA0KPiANCj4gT24gMTQvMDIvMjAyNCAxNzowNiwgSm9obiBFcm5iZXJnIHdyb3RlOg0KPj4NCj4+
DQo+PiBXaGVuIHVzaW5nIExpbnV4IGZvciBkb20wIHRoZXJlIGFyZSBhIGJ1bmNoIG9mIGRyaXZl
cnMgdGhhdCBuZWVkIHRvIGRvIFNNQw0KPj4gU0lQIGNhbGxzIGludG8gdGhlIGZpcm13YXJlIHRv
IGVuYWJsZSBjZXJ0YWluIGhhcmR3YXJlIGJpdHMgbGlrZSB0aGUNCj4+IHdhdGNoZG9nLg0KPj4N
Cj4+IFByb3ZpZGUgYSBiYXNpYyBwbGF0Zm9ybSBnbHVlIHRoYXQgaW1wbGVtZW50cyB0aGUgbmVl
ZGVkIFNNQyBmb3J3YXJkaW5nLg0KPj4NCj4+IFRoZSBmb3JtYXQgb2YgdGhlc2UgY2FsbHMgYXJl
IGFzIGZvbGxvd3M6DQo+PiAgIC0gcmVnIDA6IHNlcnZpY2UgSUQNCj4+ICAgLSByZWcgMTogZnVu
Y3Rpb24gSUQNCj4+ICAgcmVtYWluaW5nIHJlZ3M6IGFyZ3MNCj4+DQo+PiBGb3Igbm93IHdlIG9u
bHkgYWxsb3cgRG9tMCB0byBtYWtlIHRoZXNlIGNhbGxzIGFzIHRoZXkgYXJlIGFsbCBtYW5hZ2lu
Zw0KPj4gaGFyZHdhcmUuIFRoZXJlIGlzIG5vIHNwZWNpZmljYXRpb24gZm9yIHRoZXNlIFNJUCBj
YWxscywgdGhlIElEcyBhbmQgbmFtZXMNCj4+IGhhdmUgYmVlbiBleHRyYWN0ZWQgZnJvbSB0aGUg
dXBzdHJlYW0gbGludXgga2VybmVsIGFuZCB0aGUgdmVuZG9yIGtlcm5lbC4NCj4+DQo+PiBNb3N0
IG9mIHRoZSBTSVAgY2FsbHMgYXJlIG9ubHkgYXZhaWxhYmxlIGZvciB0aGUgaU1YOE0gc2VyaWVz
IG9mIFNvQ3MsIHNvDQo+PiB0aGV5IGFyZSBlYXN5IHRvIHJlamVjdCBhbmQgdGhleSBuZWVkIHRv
IGJlIHJldmlzaXRlZCB3aGVuIGlNWDhNIHNlcmllcw0KPj4gc3VwcG9ydCBpcyBhZGRlZC4NCj4g
R2l2ZW4gdGhhdCB5b3UgbmFtZWQgeW91ciBkcml2ZXIgKnFtIGFuZCB5b3Ugc2VhcmNoIGZvciBk
dCBjb21wYXRpYmxlICpxbSwgKnF4cCwgZG9lcyBpdCByZWFsbHkNCj4gbWFrZSBzZW5zZSB0byBh
ZGQgU0lQIGNhbGxzIGZvciBpTVg4TT8NCg0KVGhlIGlkZWEgd2FzIHRvIGJlIGV4cGxpY2l0IGFi
b3V0IHdoeSBpdCBtYWtlcyBubyBzZW5zZSB0byBzdXBwb3J0IHRob3NlIA0KU0lQcyBvbiBhIHFt
L3F4cCBpbXBsZW1lbnRhdGlvbi4NCg0KSSBjYW4gdGFrZSBpdCBvdXQgaWYgdGhhdCdzIG5vdCBh
cmd1bWVudCBlbm91Z2ggdG8gaGF2ZSB0aGVtLg0KPiANCj4+DQo+PiAgRnJvbSB0aGUgb3RoZXIg
Y2FsbHMgd2UgY2FuIHJlamVjdCBDUFVGUkVRIGJlY2F1c2UgRG9tMCBjYW5ub3QgbWFrZSBhbg0K
Pj4gaW5mb3JtZWQgZGVjaXNpb24gcmVnYXJkaW5nIENQVSBmcmVxdWVuY3kgc2NhbGluZywgV0FL
RVVQX1NSQyBpcyB0byB3YWtlDQo+PiB1cCBmcm9tIHN1c3BlbmQsIHdoaWNoIFhlbiBkb2Vzbid0
IHN1cHBvcnQgYXQgdGhpcyB0aW1lLg0KPj4NCj4+IFRoaXMgbGVhdmVzIHRoZSBUSU1FIFNJUCBh
bmQgdGhlIE9UUF9XUklURSBTSVAsIHdoaWNoIGZvciBub3cgYXJlIGFsbG93ZWQNCj4+IHRvIERv
bTAuDQo+Pg0KPj4gTk9URTogVGhpcyBjb2RlIGlzIGJhc2VkIG9uIGNvZGUgZm91bmQgaW4gTlhQ
IFhlbiB0cmVlIGxvY2F0ZWQgaGVyZToNCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAtaW14L2lt
eC14ZW4vYmxvYi9sZi01LjEwLnlfNC4xMy94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2lteDhxbS5j
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+PiBb
amVybmJlcmc6IEFkZCBTSVAgY2FsbCBmaWx0ZXJpbmddDQo+PiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IEVybmJlcmcgPGpvaG4uZXJuYmVyZ0BhY3RpYS5zZT4NCj4+DQo+PiAtLS0NCj4+DQo+PiB2MjoN
Cj4+ICAgLSBSZXdvcmQgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGJlIGEgYml0IGNsZWFyZXINCj4+
ICAgLSBJbmNsdWRlIHRoZSBsaW5rIHByZXZpb3VzbHkgYWRkZWQgYXMgYSBjb250ZXh0IG5vdGUg
dG8gdGhlIGNvbW1pdCBtZXNzYWdlIChKdWxpZW4gR3JhbGwpDQo+PiAgIC0gQWRkIFBlbmdzIHNp
Z25lZCBvZmYgKEp1bGllbiBHcmFsbCwgUGVuZyBGYW4pDQo+PiAgIC0gQWRkIGJhc2ljIFNJUCBj
YWxsIGZpbHRlciAoSnVsaWVuIEdyYWxsKQ0KPj4gICAtIEV4cGFuZCB0aGUgY29tbWl0IG1lc3Nh
Z2UgYSB3aG9sZSBidW5jaCBiZWNhdXNlIG9mIHRoZSBjaGFuZ2VzIHRvIHRoZSBjb2RlDQo+PiAt
LS0NCj4+ICAgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZSB8ICAgMSArDQo+PiAgIHhl
bi9hcmNoL2FybS9wbGF0Zm9ybXMvaW14OHFtLmMgfCAxNDMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNDQgaW5zZXJ0aW9ucygrKQ0KPj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPj4N
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01ha2VmaWxlIGIveGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZQ0KPj4gaW5kZXggODYzMmY0MTE1Zi4uYmVjNmU1NWQx
ZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUNCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUNCj4+IEBAIC05LDUgKzksNiBAQCBv
YmotJChDT05GSUdfQUxMX1BMQVQpICAgKz0gc3VueGkubw0KPj4gICBvYmotJChDT05GSUdfQUxM
NjRfUExBVCkgKz0gdGh1bmRlcngubw0KPj4gICBvYmotJChDT05GSUdfQUxMNjRfUExBVCkgKz0g
eGdlbmUtc3Rvcm0ubw0KPj4gICBvYmotJChDT05GSUdfQUxMNjRfUExBVCkgKz0gYnJjbS1yYXNw
YmVycnktcGkubw0KPj4gK29iai0kKENPTkZJR19BTEw2NF9QTEFUKSArPSBpbXg4cW0ubw0KPj4g
ICBvYmotJChDT05GSUdfTVBTT0NfUExBVEZPUk0pICArPSB4aWxpbngtenlucW1wLm8NCj4+ICAg
b2JqLSQoQ09ORklHX01QU09DX1BMQVRGT1JNKSAgKz0geGlsaW54LXp5bnFtcC1lZW1pLm8NCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2lteDhxbS5jIGIveGVuL2FyY2gv
YXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4
IDAwMDAwMDAwMDAuLjQ1MTVjNzU5MzUNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9wbGF0Zm9ybXMvaW14OHFtLmMNCj4+IEBAIC0wLDAgKzEsMTQzIEBADQo+PiArLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgKi8NCj4+ICsvKg0KPj4g
KyAqIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvaW14OHFtLmMNCj4+ICsgKg0KPj4gKyAqIGkuTVgg
OFFNIHNldHVwDQo+PiArICoNCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTYgRnJlZXNjYWxlIElu
Yy4NCj4+ICsgKiBDb3B5cmlnaHQgMjAxOC0yMDE5IE5YUA0KPj4gKyAqDQo+PiArICoNCj4+ICsg
KiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4+ICsgKi8NCj4+ICsNCj4+ICsjaW5jbHVk
ZSA8eGVuL3NjaGVkLmg+DQo+PiArI2luY2x1ZGUgPGFzbS9wbGF0Zm9ybS5oPg0KPj4gKyNpbmNs
dWRlIDxhc20vc21jY2MuaD4NCj4+ICsNCj4+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGlt
eDhxbV9kdF9jb21wYXRbXSBfX2luaXRjb25zdCA9DQo+PiArew0KPj4gKyAgICAiZnNsLGlteDhx
bSIsDQo+PiArICAgICJmc2wsaW14OHF4cCIsDQo+PiArICAgIE5VTEwNCj4+ICt9Ow0KPj4gKw0K
Pj4gKyNkZWZpbmUgSU1YX1NJUF9HUEMgICAgICAgICAgMHhDMjAwMDAwMA0KPiBOSVQ6IEEgbWF0
dGVyIG9mIHBlcnNvbmFsIG9waW5pb24gYnV0IGFsbCB0aGUgQXJtNjQgU0lQIHNlcnZpY2VzIHN0
YXJ0cyB3aXRoIDB4YzIwMDAwMDAsDQo+IHNvIHlvdSBjb3VsZCBqdXN0IGRlZmluZSBhIGZ1bmN0
aW9uIGlkIGkuZS4gMSwgMiwgLi4uIGFuZCB1c2UgYSBtYWNybyBzaW1pbGFyIHRvIEVFTUlfRklE
KGZpZCkuDQo+IFRoaXMgaXMganVzdCBhIHN1Z2dlc3Rpb24uDQoNCkFjay4NCj4gDQo+PiArI2Rl
ZmluZSBJTVhfU0lQX0NQVUZSRVEgICAgICAweEMyMDAwMDAxDQo+PiArI2RlZmluZSBJTVhfU0lQ
X1RJTUUgICAgICAgICAweEMyMDAwMDAyDQo+PiArI2RlZmluZSBJTVhfU0lQX0REUl9EVkZTICAg
ICAweEMyMDAwMDA0DQo+PiArI2RlZmluZSBJTVhfU0lQX1NSQyAgICAgICAgICAweEMyMDAwMDA1
DQo+PiArI2RlZmluZSBJTVhfU0lQX0dFVF9TT0NfSU5GTyAweEMyMDAwMDA2DQo+PiArI2RlZmlu
ZSBJTVhfU0lQX05PQyAgICAgICAgICAweEMyMDAwMDA4DQo+PiArI2RlZmluZSBJTVhfU0lQX1dB
S0VVUF9TUkMgICAweEMyMDAwMDA5DQo+PiArI2RlZmluZSBJTVhfU0lQX09UUF9XUklURSAgICAw
eEMyMDAwMDBCDQo+IExvb2tpbmcgYXQgQVRGLCBmb3IgUU0sUVhQIHRoZXJlIGFyZSBhbHNvOg0K
PiBCVUlMRElORk8gMHhDMjAwMDAwMw0KPiBPVFBfUkVBRCAgMHhDMjAwMDAwQQ0KPiBTRVRfVEVN
UCAgMHhDMjAwMDAwQw0KDQpJIGNhbid0IGZpbmQgdGhlbSBpbiB0aGUgY3VycmVudCBMaW51eCBj
b2RlLCBwZXJoYXBzIGRlcHJlY2F0ZWQuDQpJIGNhbiBhZGQgdGhlbSBhbmQgZGVueSB0aGVtIGlm
IGl0IG1ha2VzIHNlbnNlLg0KPiANCj4+ICsNCj4+ICsjZGVmaW5lIElNWF9TSVBfVElNRV9GX1JU
Q19TRVRfVElNRSAgICAgMHgwMA0KPj4gKyNkZWZpbmUgSU1YX1NJUF9USU1FX0ZfV0RPR19TVEFS
VCAgICAgICAweDAxDQo+PiArI2RlZmluZSBJTVhfU0lQX1RJTUVfRl9XRE9HX1NUT1AgICAgICAg
IDB4MDINCj4+ICsjZGVmaW5lIElNWF9TSVBfVElNRV9GX1dET0dfU0VUX0FDVCAgICAgMHgwMw0K
Pj4gKyNkZWZpbmUgSU1YX1NJUF9USU1FX0ZfV0RPR19QSU5HICAgICAgICAweDA0DQo+PiArI2Rl
ZmluZSBJTVhfU0lQX1RJTUVfRl9XRE9HX1NFVF9USU1FT1VUIDB4MDUNCj4+ICsjZGVmaW5lIElN
WF9TSVBfVElNRV9GX1dET0dfR0VUX1NUQVQgICAgMHgwNg0KPj4gKyNkZWZpbmUgSU1YX1NJUF9U
SU1FX0ZfV0RPR19TRVRfUFJFVElNRSAweDA3DQo+PiArDQo+PiArc3RhdGljIGJvb2wgaW14OHFt
X2lzX3NpcF90aW1lX2NhbGxfb2sodWludDMyX3QgZnVuY3Rpb25faWQpDQo+PiArew0KPj4gKyAg
ICBzd2l0Y2ggKCBmdW5jdGlvbl9pZCApDQo+PiArICAgIHsNCj4+ICsgICAgY2FzZSBJTVhfU0lQ
X1RJTUVfRl9SVENfU0VUX1RJTUU6DQo+PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+ICsgICAg
Y2FzZSBJTVhfU0lQX1RJTUVfRl9XRE9HX1NUQVJUOg0KPj4gKyAgICBjYXNlIElNWF9TSVBfVElN
RV9GX1dET0dfU1RPUDoNCj4+ICsgICAgY2FzZSBJTVhfU0lQX1RJTUVfRl9XRE9HX1NFVF9BQ1Q6
DQo+PiArICAgIGNhc2UgSU1YX1NJUF9USU1FX0ZfV0RPR19QSU5HOg0KPj4gKyAgICBjYXNlIElN
WF9TSVBfVElNRV9GX1dET0dfU0VUX1RJTUVPVVQ6DQo+PiArICAgIGNhc2UgSU1YX1NJUF9USU1F
X0ZfV0RPR19HRVRfU1RBVDoNCj4+ICsgICAgY2FzZSBJTVhfU0lQX1RJTUVfRl9XRE9HX1NFVF9Q
UkVUSU1FOg0KPj4gKyAgICAgICAgcmV0dXJuIHRydWU7DQo+PiArICAgIGRlZmF1bHQ6DQo+PiAr
ICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgImlteDhxbTogc21jOiB0aW1lOiBVbmtub3du
IGZ1bmN0aW9uIGlkICV4XG4iLCBmdW5jdGlvbl9pZCk7DQo+IDgwIGNoYXJzIGxpbWl0LCBtb3Zl
IGFyZ3VtZW50IGxpc3QgdG8gdGhlIG5leHQgbGluZQ0KDQpBY2suIEkgZm9yZ290IHRvIGNoZWNr
IHRoZSBjb2Rpbmcgc3RhbmRhcmQgb24gbGluZSBsZW5ndGguDQo+IA0KPj4gKyAgICAgICAgcmV0
dXJuIGZhbHNlOw0KPj4gKyAgICB9DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBib29sIGlteDhx
bV9zbWMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiArew0KPj4gKyAgICB1aW50MzJf
dCBzZXJ2aWNlX2lkID0gZ2V0X3VzZXJfcmVnKHJlZ3MsIDApOw0KPiBJbiBTTUNDQyBuYW1pbmcg
Y29udmVudGlvbiwgVzAgaXMgY2FsbGVkIGZ1bmN0aW9uIGlkZW50aWZpZXIuIEluc3RlYWQgeW91
IGNhbGwgWDEgZnVuY3Rpb25faWQNCj4gd2hpY2ggaXMgYSBiaXQgbWlzbGVhZGluZy4NCg0KQWNr
LiBXaWxsIHVzZSBmdW5jdGlvbl9pZCBhbmQgc3ViZnVuY3Rpb25faWQgaW5zdGVhZC4NCj4gDQo+
PiArICAgIHVpbnQzMl90IGZ1bmN0aW9uX2lkID0gZ2V0X3VzZXJfcmVnKHJlZ3MsIDEpOw0KPj4g
KyAgICBzdHJ1Y3QgYXJtX3NtY2NjX3JlcyByZXM7DQo+PiArDQo+PiArICAgIGlmICggIWNwdXNf
aGF2ZV9jb25zdF9jYXAoQVJNX1NNQ0NDXzFfMSkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBw
cmludGtfb25jZShYRU5MT0dfV0FSTklORyAibm8gU01DQ0MgMS4xIHN1cHBvcnQuIERpc2FibGlu
ZyBmaXJtd2FyZSBjYWxsc1xuIik7DQo+IDgwIGNoYXJzIGxpbWl0LCBtb3ZlIHN0cmluZyB0byB0
aGUgbmV4dCBsaW5lDQpBY2suDQo+IA0KPj4gKw0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0K
Pj4gKyAgICB9DQo+PiArDQo+PiArICAgIC8qIE9ubHkgaGFyZHdhcmUgZG9tYWluIG1heSB1c2Ug
dGhlIFNJUCBjYWxscyAqLw0KPj4gKyAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oY3VycmVu
dC0+ZG9tYWluKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGdwcmludGsoWEVOTE9HX1dBUk5J
TkcsICJpbXg4cW06IHNtYzogTm8gYWNjZXNzXG4iKTsNCj4+ICsgICAgICAgIHJldHVybiBmYWxz
ZTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBzd2l0Y2ggKCBzZXJ2aWNlX2lkICkNCj4+ICsg
ICAgew0KPj4gKyAgICBjYXNlIElNWF9TSVBfR1BDOiAvKiBPbmx5IGF2YWlsYWJsZSBvbiBpbXg4
bSBzZXJpZXMgKi8NCj4gSWYgd2UgZGVjaWRlIHRvIGtlZXAgaU1YOE0gRklEcywgSSB0aGluayBh
ZGRpbmcgY29tbWVudHMgb24gdG9wIG9mIGEgY2FzZSB3b3VsZCByZXN1bHQgaW4gYSBtb3JlIHJl
YWRhYmxlIGNvZGUuDQo+IA0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gKyAgICBjYXNl
IElNWF9TSVBfQ1BVRlJFUTogLyogRG9tMCBjYW4ndCB0YWtlIGFueSBpbmZvcm1lZCBkZXNjaXNp
b24gaGVyZSAqLw0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gKyAgICBjYXNlIElNWF9T
SVBfVElNRToNCj4+ICsgICAgICAgIGlmICggaW14OHFtX2lzX3NpcF90aW1lX2NhbGxfb2soZnVu
Y3Rpb25faWQpICkNCj4+ICsgICAgICAgICAgICBnb3RvIGFsbG93X2NhbGw7DQo+PiArICAgICAg
ICByZXR1cm4gZmFsc2U7DQo+PiArICAgIGNhc2UgSU1YX1NJUF9ERFJfRFZGUzogLyogT25seSBh
dmFpbGFibGUgb24gaW14OG0gc2VyaWVzICovDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+
PiArICAgIGNhc2UgSU1YX1NJUF9TUkM6IC8qIE9ubHkgYXZhaWxhYmxlIG9uIGlteDhtIHNlcmll
cyAqLw0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gKyAgICBjYXNlIElNWF9TSVBfR0VU
X1NPQ19JTkZPOiAvKiBPbmx5IGF2YWlsYWJsZSBvbiBpbXg4bSBzZXJpZXMgKi8NCj4+ICsgICAg
ICAgIHJldHVybiBmYWxzZTsNCj4+ICsgICAgY2FzZSBJTVhfU0lQX05PQzogLyogT25seSBhdmFp
bGFibGUgb24gaW14OG0gc2VyaWVzICovDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiAr
ICAgIGNhc2UgSU1YX1NJUF9XQUtFVVBfU1JDOiAvKiBYZW4gZG9lc24ndCBoYXZlIHN1c3BlbmQg
c3VwcG9ydCAqLw0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gKyAgICBjYXNlIElNWF9T
SVBfT1RQX1dSSVRFOg0KPj4gKyAgICAgICAgLyogZnVuY3Rpb25faWQgaXMgdGhlIGZ1c2UgbnVt
YmVyLCBubyBzZW5zaWJsZSBjaGVjayBwb3NzaWJsZSAqLw0KPj4gKyAgICAgICAgZ290byBhbGxv
d19jYWxsOw0KPj4gKyAgICBkZWZhdWx0Og0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJO
SU5HICJpbXg4cW06IHNtYzogVW5rbm93biBzZXJ2aWNlIGlkICV4XG4iLCBzZXJ2aWNlX2lkKTsN
Cj4gODAgY2hhcnMgbGltaXQsIG1vdmUgYXJndW1lbnQgbGlzdCB0byB0aGUgbmV4dCBsaW5lDQoN
CkFjaw0KPiANCj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4g
K2FsbG93X2NhbGw6DQo+IGxhYmVscyBuZWVkIHRvIGJlIGluZGVudGVkIHdpdGggb25lIHNwYWNl
DQpBY2suIE1pc3NlZCB0aGF0IGNsYXVzZSBpbiB0aGUgaW5kZW50YXRpb24gY2hhcHRlci4NCj4g
DQo+PiArICAgIGFybV9zbWNjY18xXzFfc21jKHNlcnZpY2VfaWQsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgIGZ1bmN0aW9uX2lkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICBnZXRfdXNl
cl9yZWcocmVncywgMiksDQo+PiArICAgICAgICAgICAgICAgICAgICAgIGdldF91c2VyX3JlZyhy
ZWdzLCAzKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgZ2V0X3VzZXJfcmVnKHJlZ3MsIDQp
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICBnZXRfdXNlcl9yZWcocmVncywgNSksDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgIGdldF91c2VyX3JlZyhyZWdzLCA2KSwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgZ2V0X3VzZXJfcmVnKHJlZ3MsIDcpLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAmcmVzKTsNCj4+ICsNCj4+ICsgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDAsIHJlcy5h
MCk7DQo+PiArICAgIHNldF91c2VyX3JlZyhyZWdzLCAxLCByZXMuYTEpOw0KPj4gKyAgICBzZXRf
dXNlcl9yZWcocmVncywgMiwgcmVzLmEyKTsNCj4+ICsgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDMs
IHJlcy5hMyk7DQo+PiArDQo+PiArICAgIHJldHVybiB0cnVlOw0KPj4gK30NCj4+ICsNCj4+ICtQ
TEFURk9STV9TVEFSVChpbXg4cW0sICJpLk1YIDgiKQ0KPiBTaG91bGRuJ3QgaXQgYmUgaS5NWCA4
UXtNLFhQfSA/DQpBY2suDQo+IA0KPiB+TWljaGFsDQoNClRoYW5rcyEgLy8gSm9obiBFcm5iZXJn

