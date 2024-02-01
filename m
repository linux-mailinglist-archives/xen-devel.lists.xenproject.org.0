Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D12845CD3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 17:16:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674528.1049522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZjD-0007XZ-QZ; Thu, 01 Feb 2024 16:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674528.1049522; Thu, 01 Feb 2024 16:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZjD-0007VQ-Nw; Thu, 01 Feb 2024 16:15:51 +0000
Received: by outflank-mailman (input) for mailman id 674528;
 Thu, 01 Feb 2024 16:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1rn=JK=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rVZjC-0007VK-71
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 16:15:50 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2942478f-c11d-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 17:15:49 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 1 Feb
 2024 17:15:47 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Thu, 1 Feb 2024 17:15:47 +0100
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
X-Inumbo-ID: 2942478f-c11d-11ee-8a43-1f161083a0e0
From: John Ernberg <john.ernberg@actia.se>
To: Peng Fan <peng.fan@nxp.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
CC: Jonas Blixt <jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDzxxsAgAA1KwCAANPCAIAAypGA
Date: Thu, 1 Feb 2024 16:15:47 +0000
Message-ID: <71234f8d-c6e1-4294-88ca-22682fd222f5@actia.se>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <DU0PR04MB941760D4A8972440B5312B2088432@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB941760D4A8972440B5312B2088432@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72955667264
Content-Type: text/plain; charset="utf-8"
Content-ID: <43B2996CBED84A4DA2BBEE67688887BE@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgUGVuZywNCg0KT24gMi8xLzI0IDA1OjEwLCBQZW5nIEZhbiB3cm90ZToNCj4+IENjOiBKb25h
cyBCbGl4dCA8am9uYXMuYmxpeHRAYWN0aWEuc2U+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSB4ZW4vYXJtOiBBZGQgaW14OHF7bSx4
fSBwbGF0Zm9ybSBnbHVlDQo+Pg0KPj4gSGkgSnVsaWVuLA0KPj4NCj4+IE9uIDEvMzEvMjQgMTM6
MjIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDMxLzAxLzIwMjQg
MTE6NTAsIEpvaG4gRXJuYmVyZyB3cm90ZToNCj4+Pj4gV2hlbiB1c2luZyBMaW51eCBmb3IgZG9t
MCB0aGVyZSBhcmUgYSBidW5jaCBvZiBkcml2ZXJzIHRoYXQgbmVlZCB0bw0KPj4+PiBkbyBTTUMg
U0lQIGNhbGxzIGludG8gdGhlIFBTQ0kgcHJvdmlkZXIgdG8gZW5hYmxlIGNlcnRhaW4gaGFyZHdh
cmUNCj4+Pj4gYml0cyBsaWtlIHRoZSB3YXRjaGRvZy4NCj4+Pg0KPj4+IERvIHlvdSBrbm93IHdo
aWNoIHByb3RvY29sIHRoaXMgaXMgdW5kZXIgdGhlIGhvb2QuIElzIHRoaXMgU0NNST8NCj4+DQo+
PiBJIHRoaW5rIEkgY29uZnVzZWQgbXlzZWxmIGhlcmUgd2hlbiBJIHdyb3RlIHRoZSBjb21taXQg
bG9nLg0KPj4NCj4+IFRoZSBFTDMgY29kZSBpbiBvdXIgY2FzZSBpcyBBVEYsIGFuZCBpdCBkb2Vz
IG5vdCBhcHBlYXIgdG8gYmUgU0NNSSwgbm9yIFBTQ0kuDQo+PiBUaGUgcmVnaXN0ZXIgdXNhZ2Ug
b2YgdGhlc2UgU01DIFNJUCBjYWxscyBhcmUgYXMgZm9sbG93czoNCj4+IGEwIC0gc2VydmljZQ0K
Pj4gYTEgLSBmdW5jdGlvbg0KPj4gYTItYTcgLSBhcmdzDQo+Pg0KPj4gSW4gQVRGIHRoZSBoYW5k
bGVyIGlzIGRlY2xhcmVkIGFzIGEgcnVudGltZSBzZXJ2aWNlLg0KPj4NCj4+IFdvdWxkIHRoZSBh
cHByb3ByaWF0ZSBjb21tbWl0IG1lc3NhZ2UgaGVyZSBiZSBzb21ldGhpbmcgYWxvbmcgdGhlIGxp
bmVzDQo+PiBvZiBiZWxvdz8NCj4+ICIiIg0KPj4gV2hlbiB1c2luZyBMaW51eCBmb3IgZG9tMCB0
aGVyZSBhcmUgYSBidW5jaCBvZiBkcml2ZXJzIHRoYXQgbmVlZCB0byBkbw0KPj4gU01DDQo+PiBT
SVAgY2FsbHMgaW50byB0aGUgZmlybXdhcmUgdG8gZW5hYmxlIGNlcnRhaW4gaGFyZHdhcmUgYml0
cyBsaWtlIHRoZSB3YXRjaGRvZy4NCj4+ICIiIg0KPj4+DQo+Pj4+DQo+Pj4+IFByb3ZpZGUgYSBi
YXNpYyBwbGF0Zm9ybSBnbHVlIHRoYXQgaW1wbGVtZW50cyB0aGUgbmVlZGVkIFNNQyBmb3J3YXJk
aW5nLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEVybmJlcmcgPGpvaG4uZXJuYmVy
Z0BhY3RpYS5zZT4NCj4+Pj4gLS0tDQo+Pj4+IE5PVEU6IFRoaXMgaXMgYmFzZWQgb24gY29kZSBm
b3VuZCBpbiBOWFAgWGVuIHRyZWUgbG9jYXRlZCBoZXJlOg0KPj4+PiBodHRwczovL2V1cjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQNCj4+
Pj4gaHViLmNvbSUyRm54cC1pbXglMkZpbXgteGVuJTJGYmxvYiUyRmxmLQ0KPj4gNS4xMC55XzQu
MTMlMkZ4ZW4lMkZhcmNoJTJGYXINCj4+Pj4NCj4+IG0lMkZwbGF0Zm9ybXMlMkZpbXg4cW0uYyZk
YXRhPTA1JTdDMDIlN0NwZW5nLmZhbiU0MG54cC5jb20lN0MNCj4+IDU3M2I1OTlhDQo+Pj4+DQo+
PiA0YjQxNDNjZWNhMWQwOGRjMjI3MWU1YmUlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMw
MTYzNSU3Qw0KPj4gMCU3QzAlNw0KPj4+Pg0KPj4gQzYzODQyMzExOTc3NzYwMTU0OCU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakENCj4+IHdNREFpTENKUUkNCj4+Pj4NCj4+
IGpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMCU3QyU3QyU3QyZz
ZGF0YT1aTw0KPj4gMFRYakw2DQo+Pj4+IGcwVzdUSVpvOHg4bFROQlhFWlclMkJETmNMUG5kV2xF
ZjVEMkElM0QmcmVzZXJ2ZWQ9MA0KPj4+DQo+Pj4gQW55dGhpbmcgYWZ0ZXIgLS0tIHdpbGwgYmUg
cmVtb3ZlZCB3aGlsZSBhcHBsaWVkIHRvIHRoZSB0aHJlZS4gSSB0aGluaw0KPj4+IHRoaXMgTk9U
RSBzaG91bGQgYmUgd3JpdHRlbiBkb3duIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCj4+DQo+PiBB
Y2suDQo+Pj4NCj4+PiBZb3UgYWxzbyBwb3NzaWJseSB3YW50IGEgc2lnbmVkLW9mZi1ieSBmcm9t
IFBlbmcgYXMgdGhpcyBpcyBoaXMgY29kZS4NCj4+DQo+PiBAUGVuZzogTWF5IEkgYWRkIGEgc2ln
bi1vZmYgZnJvbSB5b3U/DQo+IA0KPiBZZWFoLiBZb3UgY291bGQgYWRkIG15IHNpZ24gb2ZmLg0K
DQpHcmVhdCwgdGhhbmtzIQ0KPiANCj4+Pg0KPj4+Pg0KPj4+PiAgwqAgeGVuL2FyY2gvYXJtL3Bs
YXRmb3Jtcy9NYWtlZmlsZSB8wqAgMSArDQo+Pj4+ICDCoCB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1z
L2lteDhxbS5jIHwgNjUNCj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
Pj4+ICDCoCAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykNCj4+Pj4gIMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2lteDhxbS5jDQo+Pj4+DQo+Pj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01ha2VmaWxlDQo+Pj4+IGIveGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZSBpbmRleCA4NjMyZjQxMTVmLi5iZWM2ZTU1ZDFm
DQo+PiAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZQ0K
Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01ha2VmaWxlDQo+Pj4+IEBAIC05LDUg
KzksNiBAQCBvYmotJChDT05GSUdfQUxMX1BMQVQpwqDCoCArPSBzdW54aS5vDQo+Pj4+ICDCoCBv
YmotJChDT05GSUdfQUxMNjRfUExBVCkgKz0gdGh1bmRlcngubw0KPj4+PiAgwqAgb2JqLSQoQ09O
RklHX0FMTDY0X1BMQVQpICs9IHhnZW5lLXN0b3JtLm8NCj4+Pj4gIMKgIG9iai0kKENPTkZJR19B
TEw2NF9QTEFUKSArPSBicmNtLXJhc3BiZXJyeS1waS5vDQo+Pj4+ICtvYmotJChDT05GSUdfQUxM
NjRfUExBVCkgKz0gaW14OHFtLm8NCj4+Pj4gIMKgIG9iai0kKENPTkZJR19NUFNPQ19QTEFURk9S
TSnCoCArPSB4aWxpbngtenlucW1wLm8NCj4+Pj4gIMKgIG9iai0kKENPTkZJR19NUFNPQ19QTEFU
Rk9STSnCoCArPSB4aWxpbngtenlucW1wLWVlbWkubyBkaWZmIC0tZ2l0DQo+Pj4+IGEveGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPj4gYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2lt
eDhxbS5jDQo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAuLmE5Y2Q5
YzM2MTUNCj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZv
cm1zL2lteDhxbS5jDQo+Pj4+IEBAIC0wLDAgKzEsNjUgQEANCj4+Pj4gKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyICovDQo+Pj4+ICsvKg0KPj4+PiArICogeGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPj4+PiArICoNCj4+Pj4gKyAqIGkuTVggOFFN
IHNldHVwDQo+Pj4+ICsgKg0KPj4+PiArICogQ29weXJpZ2h0IChjKSAyMDE2IEZyZWVzY2FsZSBJ
bmMuDQo+Pj4+ICsgKiBDb3B5cmlnaHQgMjAxOC0yMDE5IE5YUA0KPj4+PiArICoNCj4+Pj4gKyAq
DQo+Pj4+ICsgKiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4+Pj4gKyAqLw0KPj4+PiAr
DQo+Pj4+ICsjaW5jbHVkZSA8YXNtL3BsYXRmb3JtLmg+DQo+Pj4+ICsjaW5jbHVkZSA8YXNtL3Nt
Y2NjLmg+DQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgaW14OHFtX2R0
X2NvbXBhdFtdIF9faW5pdGNvbnN0ID0gew0KPj4+PiArwqDCoMKgICJmc2wsaW14OHFtIiwNCj4+
Pj4gK8KgwqDCoCAiZnNsLGlteDhxeHAiLA0KPj4+PiArwqDCoMKgIE5VTEwNCj4+Pj4gK307DQo+
Pj4+ICsNCj4+Pj4gK3N0YXRpYyBib29sIGlteDhxbV9zbWMoc3RydWN0IGNwdV91c2VyX3JlZ3Mg
KnJlZ3MpIHsNCj4+Pg0KPj4+IFlvdXIgaW1wbGVtZW50YXRpb24gYmVsb3cgd2lsbCBub3Qgb25s
eSBmb3J3YXJkIFNNQyBmb3IgZG9tMCBidXQgYWxzbw0KPj4+IGZvciBhbnkgbm9uLXRydXN0ZWQg
ZG9tYWlucy4gSGF2ZSB5b3UgaW52ZXN0aWdhdGVkIHRoYXQgYWxsIHRoZSBTSVANCj4+PiBjYWxs
cyBhcmUgc2FmZSB0byBiZSBjYWxsZWQgYnkgYW55b25lPw0KPj4NCj4+IFdlIHVzZSBwdXJlIHZp
cnR1YWxpemVkIGRvbVVzLCBzbyB3ZSBkbyBub3QgZXhwZWN0IGFueSBjYWxscyB0byB0aGlzIFNN
Qw0KPj4gaW50ZXJmYWNlIGZyb20gdGhlIGd1ZXN0LiBJJ2xsIGxpbWl0IGl0IHRvIGRvbTAuDQo+
IA0KPiBXb3VsZCB5b3UgbWluZCB0byBzaGFyZSB3aGF0IGZlYXR1cmVzIGFyZSBzdXBwb3J0ZWQg
aW4geW91ciBEb21VPw0KPiANCj4gUHVyZSB2aXJ0dWFsaXplZCwgeW91IHVzaW5nIHhlbiBwdiBv
ciB2aXJ0aW8/DQoNCk5vdCBhdCBhbGwuIFdlJ3JlIGZvcndhcmRpbmcgYmxvY2sgYW5kIG5ldHdv
cmtpbmcgKGFuZCBhZGRpdGlvbmFsbHkgDQp1c2JpcCBvdmVyIG5ldHdvcmtpbmcgZm9yIFVTQiBz
aGFyaW5nKSwgdmlhIHRoZSBYZW4gUFYgZHJpdmVycy4NCj4gDQo+IFRoYW5rcywNCj4gUGVuZy4N
Cj4gDQoNClRoYW5rcyEgLy8gSm9obiBFcm5iZXJn

