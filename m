Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B8A844318
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 16:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674092.1048792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCa8-0007w1-FE; Wed, 31 Jan 2024 15:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674092.1048792; Wed, 31 Jan 2024 15:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCa8-0007sS-CI; Wed, 31 Jan 2024 15:32:56 +0000
Received: by outflank-mailman (input) for mailman id 674092;
 Wed, 31 Jan 2024 15:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aY=JJ=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rVCa6-0007sK-KT
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 15:32:54 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 001876a6-c04e-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 16:32:53 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 31 Jan
 2024 16:32:53 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 31 Jan 2024 16:32:53 +0100
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
X-Inumbo-ID: 001876a6-c04e-11ee-8a43-1f161083a0e0
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Peng Fan <peng.fan@nxp.com>
CC: Jonas Blixt <jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDzxxsAgAA1KwA=
Date: Wed, 31 Jan 2024 15:32:53 +0000
Message-ID: <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
In-Reply-To: <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2921D72955667366
Content-Type: text/plain; charset="utf-8"
Content-ID: <667B3B982CD7E44988611C7E880C82AA@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgSnVsaWVuLA0KDQpPbiAxLzMxLzI0IDEzOjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhp
LA0KPiANCj4gT24gMzEvMDEvMjAyNCAxMTo1MCwgSm9obiBFcm5iZXJnIHdyb3RlOg0KPj4gV2hl
biB1c2luZyBMaW51eCBmb3IgZG9tMCB0aGVyZSBhcmUgYSBidW5jaCBvZiBkcml2ZXJzIHRoYXQg
bmVlZCB0byBkbyANCj4+IFNNQw0KPj4gU0lQIGNhbGxzIGludG8gdGhlIFBTQ0kgcHJvdmlkZXIg
dG8gZW5hYmxlIGNlcnRhaW4gaGFyZHdhcmUgYml0cyBsaWtlIHRoZQ0KPj4gd2F0Y2hkb2cuDQo+
IA0KPiBEbyB5b3Uga25vdyB3aGljaCBwcm90b2NvbCB0aGlzIGlzIHVuZGVyIHRoZSBob29kLiBJ
cyB0aGlzIFNDTUk/DQoNCkkgdGhpbmsgSSBjb25mdXNlZCBteXNlbGYgaGVyZSB3aGVuIEkgd3Jv
dGUgdGhlIGNvbW1pdCBsb2cuDQoNClRoZSBFTDMgY29kZSBpbiBvdXIgY2FzZSBpcyBBVEYsIGFu
ZCBpdCBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgU0NNSSwgbm9yIA0KUFNDSS4gVGhlIHJlZ2lzdGVy
IHVzYWdlIG9mIHRoZXNlIFNNQyBTSVAgY2FsbHMgYXJlIGFzIGZvbGxvd3M6DQphMCAtIHNlcnZp
Y2UNCmExIC0gZnVuY3Rpb24NCmEyLWE3IC0gYXJncw0KDQpJbiBBVEYgdGhlIGhhbmRsZXIgaXMg
ZGVjbGFyZWQgYXMgYSBydW50aW1lIHNlcnZpY2UuDQoNCldvdWxkIHRoZSBhcHByb3ByaWF0ZSBj
b21tbWl0IG1lc3NhZ2UgaGVyZSBiZSBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIA0Kb2YgYmVs
b3c/DQoiIiINCldoZW4gdXNpbmcgTGludXggZm9yIGRvbTAgdGhlcmUgYXJlIGEgYnVuY2ggb2Yg
ZHJpdmVycyB0aGF0IG5lZWQgdG8gZG8gICBTTUMNClNJUCBjYWxscyBpbnRvIHRoZSBmaXJtd2Fy
ZSB0byBlbmFibGUgY2VydGFpbiBoYXJkd2FyZSBiaXRzIGxpa2UgdGhlDQp3YXRjaGRvZy4NCiIi
Ig0KPiANCj4+DQo+PiBQcm92aWRlIGEgYmFzaWMgcGxhdGZvcm0gZ2x1ZSB0aGF0IGltcGxlbWVu
dHMgdGhlIG5lZWRlZCBTTUMgZm9yd2FyZGluZy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IEVybmJlcmcgPGpvaG4uZXJuYmVyZ0BhY3RpYS5zZT4NCj4+IC0tLQ0KPj4gTk9URTogVGhpcyBp
cyBiYXNlZCBvbiBjb2RlIGZvdW5kIGluIE5YUCBYZW4gdHJlZSBsb2NhdGVkIGhlcmU6DQo+PiBo
dHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC9pbXgteGVuL2Jsb2IvbGYtNS4xMC55XzQuMTMveGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPiANCj4gQW55dGhpbmcgYWZ0ZXIgLS0tIHdp
bGwgYmUgcmVtb3ZlZCB3aGlsZSBhcHBsaWVkIHRvIHRoZSB0aHJlZS4gSSB0aGluayANCj4gdGhp
cyBOT1RFIHNob3VsZCBiZSB3cml0dGVuIGRvd24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpB
Y2suDQo+IA0KPiBZb3UgYWxzbyBwb3NzaWJseSB3YW50IGEgc2lnbmVkLW9mZi1ieSBmcm9tIFBl
bmcgYXMgdGhpcyBpcyBoaXMgY29kZS4NCg0KQFBlbmc6IE1heSBJIGFkZCBhIHNpZ24tb2ZmIGZy
b20geW91Pw0KPiANCj4+DQo+PiDCoCB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01ha2VmaWxlIHzC
oCAxICsNCj4+IMKgIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvaW14OHFtLmMgfCA2NSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNjYgaW5z
ZXJ0aW9ucygrKQ0KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9wbGF0Zm9y
bXMvaW14OHFtLmMNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9N
YWtlZmlsZSANCj4+IGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZQ0KPj4gaW5kZXgg
ODYzMmY0MTE1Zi4uYmVjNmU1NWQxZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0
Zm9ybXMvTWFrZWZpbGUNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUN
Cj4+IEBAIC05LDUgKzksNiBAQCBvYmotJChDT05GSUdfQUxMX1BMQVQpwqDCoCArPSBzdW54aS5v
DQo+PiDCoCBvYmotJChDT05GSUdfQUxMNjRfUExBVCkgKz0gdGh1bmRlcngubw0KPj4gwqAgb2Jq
LSQoQ09ORklHX0FMTDY0X1BMQVQpICs9IHhnZW5lLXN0b3JtLm8NCj4+IMKgIG9iai0kKENPTkZJ
R19BTEw2NF9QTEFUKSArPSBicmNtLXJhc3BiZXJyeS1waS5vDQo+PiArb2JqLSQoQ09ORklHX0FM
TDY0X1BMQVQpICs9IGlteDhxbS5vDQo+PiDCoCBvYmotJChDT05GSUdfTVBTT0NfUExBVEZPUk0p
wqAgKz0geGlsaW54LXp5bnFtcC5vDQo+PiDCoCBvYmotJChDT05GSUdfTVBTT0NfUExBVEZPUk0p
wqAgKz0geGlsaW54LXp5bnFtcC1lZW1pLm8NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
cGxhdGZvcm1zL2lteDhxbS5jIA0KPj4gYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2lteDhxbS5j
DQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uYTljZDljMzYx
NQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4
cW0uYw0KPj4gQEAgLTAsMCArMSw2NSBAQA0KPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyICovDQo+PiArLyoNCj4+ICsgKiB4ZW4vYXJjaC9hcm0vcGxhdGZv
cm1zL2lteDhxbS5jDQo+PiArICoNCj4+ICsgKiBpLk1YIDhRTSBzZXR1cA0KPj4gKyAqDQo+PiAr
ICogQ29weXJpZ2h0IChjKSAyMDE2IEZyZWVzY2FsZSBJbmMuDQo+PiArICogQ29weXJpZ2h0IDIw
MTgtMjAxOSBOWFANCj4+ICsgKg0KPj4gKyAqDQo+PiArICogUGVuZyBGYW4gPHBlbmcuZmFuQG54
cC5jb20+DQo+PiArICovDQo+PiArDQo+PiArI2luY2x1ZGUgPGFzbS9wbGF0Zm9ybS5oPg0KPj4g
KyNpbmNsdWRlIDxhc20vc21jY2MuaD4NCj4+ICsNCj4+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNv
bnN0IGlteDhxbV9kdF9jb21wYXRbXSBfX2luaXRjb25zdCA9DQo+PiArew0KPj4gK8KgwqDCoCAi
ZnNsLGlteDhxbSIsDQo+PiArwqDCoMKgICJmc2wsaW14OHF4cCIsDQo+PiArwqDCoMKgIE5VTEwN
Cj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyBib29sIGlteDhxbV9zbWMoc3RydWN0IGNwdV91c2Vy
X3JlZ3MgKnJlZ3MpDQo+PiArew0KPiANCj4gWW91ciBpbXBsZW1lbnRhdGlvbiBiZWxvdyB3aWxs
IG5vdCBvbmx5IGZvcndhcmQgU01DIGZvciBkb20wIGJ1dCBhbHNvIA0KPiBmb3IgYW55IG5vbi10
cnVzdGVkIGRvbWFpbnMuIEhhdmUgeW91IGludmVzdGlnYXRlZCB0aGF0IGFsbCB0aGUgU0lQIA0K
PiBjYWxscyBhcmUgc2FmZSB0byBiZSBjYWxsZWQgYnkgYW55b25lPw0KDQpXZSB1c2UgcHVyZSB2
aXJ0dWFsaXplZCBkb21Vcywgc28gd2UgZG8gbm90IGV4cGVjdCBhbnkgY2FsbHMgdG8gdGhpcyBT
TUMgDQppbnRlcmZhY2UgZnJvbSB0aGUgZ3Vlc3QuIEknbGwgbGltaXQgaXQgdG8gZG9tMC4NCj4g
DQo+IEJ1dCBldmVuIGlmIHdlIHJlc3RyaWN0IHRvIGRvbTAsIGhhdmUgeW91IGNoZWNrZWQgdGhh
dCBub25lIG9mIHRoZSBTTUNzIA0KPiB1c2UgYnVmZmVycz8NCkkgaGF2ZW4ndCBmb3VuZCBhbnkg
c3VjaCBpbnN0YW5jZXMgaW4gdGhlIExpbnV4IGtlcm5lbCB3aGVyZSBhIGJ1ZmZlciBpcyANCnVz
ZWQuIEFkZGluZyBhIGNhbGwgZmlsdGVyaW5nIGxpa2Ugc3VnZ2VzdGVkIGJlbG93IGFkZGl0aW9u
cyBvZiBzdWNoIA0KZnVuY3Rpb25zIGNhbiBiZSBkaXNjb3ZlcmVkIGFuZCBhZGFwdGVkIGZvciBp
ZiB0aGV5IHdvdWxkIHNob3cgdXAgbGF0ZXIuDQo+IA0KPiBSYXRoZXIgdGhhbiBwcm92aWRpbmcg
YSBibGFua2V0IGZvcndhcmQsIHRvIG1lIGl0IHNvdW5kcyBtb3JlIGxpa2UgeW91IA0KPiB3YW50
IHRvIHByb3ZpZGUgYW4gYWxsb3dsaXN0IG9mIHRoZSBTTUNzLiBUaGlzIGlzIG1vcmUgZnV0dXJl
cHJvb2YgYW5kIA0KPiBhdm9pZCB0aGUgcmlzayB0byBleHBvc2UgdW5zYWZlIFNNQ3MgdG8gYW55
IGRvbWFpbi4NCj4gDQo+IEZvciBhbiBleGFtcGxlLCB5b3UgY2FuIGhhdmUgYSBsb29rIGF0IHRo
ZSBFRU1JIG1lZGlhdG9yIGZvciBYaWxpbnguDQoNCkFjay4gRG8geW91IHByZWZlciB0byBzZWUg
b25seSBvbiBTTUNDQyBzZXJ2aWNlIGxldmVsIG9yIGFsc28gb24gDQpmdW5jdGlvbiBsZXZlbD8g
KGExIHJlZ2lzdGVyLCBwZXIgZGVzY3JpcHRpb24gZWFybGllcikNCj4gDQo+IENoZWVycywNCj4g
DQoNClRoYW5rcyEgLy8gSm9obiBFcm5iZXJn

