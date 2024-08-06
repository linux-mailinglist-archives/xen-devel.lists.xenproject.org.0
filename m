Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A121948BE5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772580.1183025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbG72-0000rD-QA; Tue, 06 Aug 2024 09:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772580.1183025; Tue, 06 Aug 2024 09:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbG72-0000pW-N0; Tue, 06 Aug 2024 09:04:12 +0000
Received: by outflank-mailman (input) for mailman id 772580;
 Tue, 06 Aug 2024 09:04:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ctxO=PF=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sbG71-0000pQ-40
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:04:11 +0000
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d57ea750-53d2-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 11:04:08 +0200 (CEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47693qGs106718;
 Tue, 6 Aug 2024 04:03:52 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47693q8b085329
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Aug 2024 04:03:52 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 04:03:51 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 04:03:51 -0500
Received: from [172.24.227.225] (nightbug.dhcp.ti.com [172.24.227.225])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47693nin067213;
 Tue, 6 Aug 2024 04:03:50 -0500
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
X-Inumbo-ID: d57ea750-53d2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722935032;
	bh=UUJl4CgLdyc974YpPpFSOfNDd2DRfUN1ftfKpQ7/rps=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Q4QkQgMbI+Q0hbqaTXIYSeE7LywWP4MubMG/hd1zwcBWSqfCxaYsvsyzEcdz8V4fN
	 DSfxRYprWpMfeaxhN781ljXKbHoubWwYDUHInHhzh+XkEbN1Hx0/tuy3U/WMtiIeOK
	 gCRtZwqNaQ9Z+foNe1DjSZBbUurCymh4Mjvn3nQ4=
Message-ID: <713072f9-5c1f-4958-913c-67c4675de488@ti.com>
Date: Tue, 6 Aug 2024 14:33:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH] drivers: char: omap-uart: add "clock-hz"
 option
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall
	<julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240719113313.145587-1-a-singh21@ti.com>
 <18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com>
Content-Language: en-US
From: Amneesh Singh <a-singh21@ti.com>
Autocrypt: addr=a-singh21@ti.com; keydata=
 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
In-Reply-To: <18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------E3i8BTeoaIEPZrRYex3hAbkE"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--------------E3i8BTeoaIEPZrRYex3hAbkE
Content-Type: multipart/mixed; boundary="------------MphJER2dfXwmOZBc0DPqD0DY";
 protected-headers="v1"
From: Amneesh Singh <a-singh21@ti.com>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <713072f9-5c1f-4958-913c-67c4675de488@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH] drivers: char: omap-uart: add "clock-hz"
 option
References: <20240719113313.145587-1-a-singh21@ti.com>
 <18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com>
In-Reply-To: <18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com>

--------------MphJER2dfXwmOZBc0DPqD0DY
Content-Type: multipart/mixed; boundary="------------EYEIXmxdB57iQTMZahg0UZRd"

--------------EYEIXmxdB57iQTMZahg0UZRd
Content-Type: multipart/alternative;
 boundary="------------mmxO0gR1xX1sskrFwkjJrYu5"

--------------mmxO0gR1xX1sskrFwkjJrYu5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksIHRoYW5rcyBhIGxvdCBmb3IgdGhlIHJldmlldyENCg0KT24gMDYvMDgvMjQgMTM6MjMs
IE1pY2hhbCBPcnplbCB3cm90ZToNCj4gSGksDQo+DQo+IFlvdSBzZW50IHRoaXMgcGF0Y2gg
dG8geGVuLWRldmVsIGJ1dCBmb3Jnb3QgdG8gQ0MgbWFpbnRhaW5lcnMuIEZvciB0aGUgZnV0
dXJlLCBwbGVhc2UgdXNlIHNjcmlwdHMvYWRkX21haW50YWluZXJzLnBsLg0KPiBDQ2luZyB0
aGVtIG5vdy4NCkFwb2xvZ2llcywgd2FzIG5vdCBhd2FyZSBvZiB0aGF0Lg0KPiBPbiAxOS8w
Ny8yMDI0IDEzOjMzLCBBbW5lZXNoIFNpbmdoIHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+IFF1
aXRlIGEgZmV3IFRJIEszIGRldmljZXMgZG8gbm90IGhhdmUgY2xvY2stZnJlcXVlbmN5IHNw
ZWNpZmllZCBpbiB0aGVpcg0KPiA+IHJlc3BlY3RpdmUgVUFSVCBub2Rlcy4gSG93ZXZlciBo
YXJkLWNvZGluZyB0aGUgZnJlcXVlbmN5IGlzIG5vdCBhDQo+IElzIHRoaXMgcHJvcGVydHkg
aXMgcmVxdWlyZWQ/IElmIHNvLCBJJ2QgbWVudGlvbiB0aGF0IHRoaXMgaXMgdG8gb3ZlcmNv
bWUgYW4gaW5jb3JyZWN0IGRldmljZSB0cmVlLg0KVGhlIGNsb2NrIGlucHV0IGlzIHVzdWFs
bHkgc3VwcG9zZWQgdG8gYmUgYXQgNDhNSHosIGJ1dCBjYW4gc3RpbGwgZGlmZmVyIA0KYmV0
d2VlbiBTb0NzLCBhbmQgaWYgSSBhbSBub3Qgd3JvbmcgY2FuIGFsc28gYmUgY2hhbmdlZCBm
cm9tIHRoZSANCmJvb3Rsb2FkZXIuIFRoaXMgbWFrZXMgaXQgaGFyZCB0byBzcGVjaWZ5IHRo
aXMgdmFsdWUgaW4gdGhlIGRldmljZSB0cmVlIA0KaXRzZWxmOyB3aGljaCBpcyBob3dldmVy
IHJlcXVpcmVkIGJ5IHRoZSBjdXJyZW50IG9tYXAtdWFydCBkcml2ZXIgYXMgaXQgDQpuZWl0
aGVyIGhhcyBhIGRlZmF1bHQgbm9yIGEgd2F5IHRvIHBhcnNlIGNvbmZpZyBwYXJhbXMsIGFu
ZCByZWxpZXMgb24gDQpwYXJzaW5nIHRoZSBEVC4NCj4gPiBzb2x1dGlvbiBhcyB0aGUgZnVu
Y3Rpb24gY2xvY2sgaW5wdXQgY2FuIGRpZmZlciBiZXR3ZWVuIFNvQ3MuIFNvLA0KPiA+IHNp
bWlsYXIgdG8gY29tMS9jb20yLCBsZXQgdGhlIHVzZXIgcGFzcyB0aGUgZnJlcXVlbmN5IGFz
IGEgZHR1YXJ0IG9wdGlvbg0KPiA+IHZpYSB0aGUgYm9vdGFyZ3MuIElmIG5vdCBzcGVjaWZp
ZWQgaXQgd2lsbCBmYWxsYmFjayB0byB0aGUgc2FtZSBEVA0KPiA+IHBhcnNpbmcgYXMgYmVm
b3JlLiBGb3IgZXhhbXBsZSwgZHR1YXJ0PXNlcmlhbDI6Y2xvY2staHo9NDgwMDAwMDAgY2Fu
IGJlDQo+ID4gYSB2YWxpZCBib290YXJnLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFt
bmVlc2ggU2luZ2ggPGEtc2luZ2gyMUB0aS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9kcml2
ZXJzL2NoYXIvb21hcC11YXJ0LmMgfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL29t
YXAtdWFydC5jIGIveGVuL2RyaXZlcnMvY2hhci9vbWFwLXVhcnQuYw0KPiA+IGluZGV4IDEw
NzkxOTguLjY2MGM0ODYgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9vbWFw
LXVhcnQuYw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvb21hcC11YXJ0LmMNCj4gPiBA
QCAtMzA1LDMzICszMDUsNzEgQEAgc3RhdGljIHN0cnVjdCB1YXJ0X2RyaXZlciBfX3JlYWRf
bW9zdGx5IG9tYXBfdWFydF9kcml2ZXIgPSB7DQo+ID4gICAgICAudnVhcnRfaW5mbyA9IG9t
YXBfdnVhcnRfaW5mbywNCj4gPiAgfTsNCj4gPiANCj4gPiArc3RhdGljIHZvaWQgX19pbml0
IG9tYXBfdWFydF9wYXJzZV9jb25maWcoc3RydWN0IG9tYXBfdWFydCAqdWFydCwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpj
b25maWcpIHsNCj4gQnJhY2VzIHNob3VsZCBiZSBwbGFjZWQgb24gdGhlaXIgb3duIGxpbmVz
LiBSZWZlciBDT0RJTkdfU1RZTEUuDQpBcG9sb2dpZXMgZm9yIHRoZSBjYXJlbGVzc25lc3Mu
DQo+ID4gKw0KPiA+ICsgICAgY2hhciBvcHRpb25zWzI1Nl07DQo+IDI1NiBpcyBhIG1heCBz
aXplIG9mIGZ1bGwgZHR1YXJ0IHN0cmluZy4gU2luY2Ugd2Ugb25seSBwYXJzZSBmb3IgY2xv
Y2staHosIGRvIHdlIG5lZWQgdGhlIHNhbWUgc2l6ZSBoZXJlPw0KPiBDb3VsZCB3ZSBzYXkg
ZS5nLiA2NCBhbmQgZXh0ZW5kIGl0IGluIHRoZSBmdXR1cmUgaWYgbmV3IG9wdGlvbnMgd2ls
bCBiZSBhZGRlZD8NCkRvbmUsIGRvbid0IHRoaW5rIGl0IG1hdHRlcnMgbXVjaCwgYnV0IHN1
cmUgdGhpbmcuDQo+ID4gKyAgICBjaGFyICp2YWx1ZSwgKnN0YXJ0ID0gb3B0aW9uczsNCj4g
U2NvcGUgb2YgdmFsdWUgY291bGQgYmUgbGltaXRlZCB0byB0aGUgd2hpbGUgbG9vcA0KWWVz
LCB0aGF0J3MgdHJ1ZS4NCj4gPiArDQo+ID4gKyAgICBpZiAoICFzdHJjbXAoY29uZmlnLCAi
IikgKQ0KPiA+ICsgICAgICAgIHJldHVybjsNCj4gPiArDQo+ID4gKyAgICBzdHJsY3B5KG9w
dGlvbnMsIGNvbmZpZywgQVJSQVlfU0laRShvcHRpb25zKSk7DQo+ID4gKw0KPiA+ICsgICAg
d2hpbGUgKHN0YXJ0ICE9IE5VTEwpDQo+IFdoaXRlIHNwYWNlcyBtaXNzaW5nLiBSZWZlciBD
T0RJTkdfU1RZTEUuDQpUaHguDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgY2hhciAqbmFt
ZTsNCj4gPiArDQo+ID4gKyAgICAgICAgLyogUGFyc2UgbmV4dCBuYW1lLXZhbHVlIHBhaXIu
ICovDQo+ID4gKyAgICAgICAgdmFsdWUgPSBzdHJzZXAoJnN0YXJ0LCAiLCIpOw0KPiA+ICsg
ICAgICAgIG5hbWUgPSBzdHJzZXAoJnZhbHVlLCAiPSIpOw0KPiBDYW4gbmFtZSBiZSBOVUxM
IGhlcmU/IFRoaXMgd291bGQgd2FudCBjaGVja2luZyBmb3IgdGhlIGJlbG93IHN0cmNtcC4N
CkluZGVlZCwgYm90aCB0aGUgbmFtZSBhbmQgdmFsdWUgY2FuIGJlIE5VTEwgYXQgdGhpcyBw
b2ludC4gVGh4Lg0KPiA+ICsNCj4gPiArICAgICAgICBpZiAoICFzdHJjbXAobmFtZSwgImNs
b2NrLWh6IikgKQ0KPiA+ICsgICAgICAgICAgICB1YXJ0LT5jbG9ja19oeiA9IHNpbXBsZV9z
dHJ0b3VsKHZhbHVlLCBOVUxMLCAwKTsNCj4gPiArICAgICAgICBlbHNlDQo+ID4gKyAgICAg
ICAgICAgIHByaW50aygiV0FSTklORzogVUFSVCBjb25maWd1cmF0aW9uIG9wdGlvbiAlcyBp
cyBub3Qgc3VwcG9ydGVkXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgbmFtZSk7DQo+
ID4gKw0KPiA+ICsgICAgfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgaW50IF9faW5p
dCBvbWFwX3VhcnRfaW5pdChzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgdm9pZCAqZGF0YSkNCj4gPiAg
ew0KPiA+ICAgICAgY29uc3QgY2hhciAqY29uZmlnID0gZGF0YTsNCj4gPiAgICAgIHN0cnVj
dCBvbWFwX3VhcnQgKnVhcnQ7DQo+ID4gLSAgICB1MzIgY2xrc3BlYzsNCj4gPiAgICAgIGlu
dCByZXM7DQo+ID4gICAgICBwYWRkcl90IGFkZHIsIHNpemU7DQo+ID4gDQo+ID4gLSAgICBp
ZiAoIHN0cmNtcChjb25maWcsICIiKSApDQo+ID4gLSAgICAgICAgcHJpbnRrKCJXQVJOSU5H
OiBVQVJUIGNvbmZpZ3VyYXRpb24gaXMgbm90IHN1cHBvcnRlZFxuIik7DQo+ID4gLQ0KPiA+
ICAgICAgdWFydCA9ICZvbWFwX2NvbTsNCj4gPiANCj4gPiAtICAgIHJlcyA9IGR0X3Byb3Bl
cnR5X3JlYWRfdTMyKGRldiwgImNsb2NrLWZyZXF1ZW5jeSIsICZjbGtzcGVjKTsNCj4gPiAt
ICAgIGlmICggIXJlcyApDQo+ID4gLSAgICB7DQo+ID4gLSAgICAgICAgcHJpbnRrKCJvbWFw
LXVhcnQ6IFVuYWJsZSB0byByZXRyaWV2ZSB0aGUgY2xvY2sgZnJlcXVlbmN5XG4iKTsNCj4g
PiAtICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAtICAgIH0NCj4gPiAtDQo+ID4gLSAg
ICB1YXJ0LT5jbG9ja19oeiA9IGNsa3NwZWM7DQo+ID4gKyAgICAvKiBEZWZhdWx0IGNvbmZp
Z3VyYXRpb24uICovDQo+ID4gKyAgICB1YXJ0LT5jbG9ja19oeiA9IDA7DQo+ID4gICAgICB1
YXJ0LT5iYXVkID0gMTE1MjAwOw0KPiA+ICAgICAgdWFydC0+ZGF0YV9iaXRzID0gODsNCj4g
PiAgICAgIHVhcnQtPnBhcml0eSA9IFVBUlRfUEFSSVRZX05PTkU7DQo+ID4gICAgICB1YXJ0
LT5zdG9wX2JpdHMgPSAxOw0KPiA+IA0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIFBhcnNl
IGR0dWFydCBvcHRpb25zLg0KPiA+ICsgICAgICogVmFsaWQgb3B0aW9uczoNCj4gPiArICAg
ICAqICAgLSBjbG9jay1oeg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBvbWFwX3VhcnRfcGFy
c2VfY29uZmlnKHVhcnQsIGNvbmZpZyk7DQo+ID4gKw0KPiA+ICsgICAgLyogSWYgY2xvY2st
aHogaXMgbWlzc2luZy4gKi8NCj4gQXBhcnQgZnJvbSBtaXNzaW5nLCBjbG9ja19oeiBjYW4g
YmUgMCBhbHNvIGlmIHVzZXIgc3BlY2lmaWVzIDANClRoYXQncyB0cnVlLCB0aHguDQo+ID4g
KyAgICBpZiAoIHVhcnQtPmNsb2NrX2h6ID09IDAgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAg
ICAgIHUzMiBjbGtzcGVjOw0KPiBXZSBhcmUgbW92aW5nIGF3YXkgZnJvbSBMaW51eCBkZXJp
dmVkIHR5cGVzIHNvIHBsZWFzZSB0YWtlIHRoZSBvY2Nhc2lvbiB0byB1c2UgdWludDMyX3Qg
aGVyZS4NCj4gQWxzbywgdGhlcmUgc2hvdWxkIGJlIGEgYmxhbmsgbGluZSBiZXR3ZWVuIGRl
ZmluaXRpb25zL2NvZGUuDQpHb3QgaXQuDQo+ID4gKyAgICAgICAgcmVzID0gZHRfcHJvcGVy
dHlfcmVhZF91MzIoZGV2LCAiY2xvY2stZnJlcXVlbmN5IiwgJmNsa3NwZWMpOw0KPiA+ICsg
ICAgICAgIGlmICggIXJlcyApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBw
cmludGsoIm9tYXAtdWFydDogVW5hYmxlIHRvIHJldHJpZXZlIHRoZSBjbG9jayBmcmVxdWVu
Y3lcbiIpOw0KPiA+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgICAg
ICB9DQo+ID4gKyAgICAgICAgdWFydC0+Y2xvY2tfaHogPSBjbGtzcGVjOw0KPiA+ICsgICAg
fQ0KPiA+ICsNCj4gPiAgICAgIHJlcyA9IGR0X2RldmljZV9nZXRfcGFkZHIoZGV2LCAwLCAm
YWRkciwgJnNpemUpOw0KPiA+ICAgICAgaWYgKCByZXMgKQ0KPiA+ICAgICAgew0KPiA+IC0t
DQo+ID4gMi4zNC4xDQo+ID4gDQo+ID4gDQo+DQo+IH5NaWNoYWwNClJlZ2FyZHMNCkFtbmVl
c2gNCg==
--------------mmxO0gR1xX1sskrFwkjJrYu5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi, thanks a lot for the review!<br>
    </p>
    <div class=3D"moz-cite-prefix">On 06/08/24 13:23, Michal Orzel wrote:=
<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">Hi,

You sent this patch to xen-devel but forgot to CC maintainers. For the fu=
ture, please use scripts/add_maintainers.pl.
CCing them now.</pre>
    </blockquote>
    Apologies, was not aware of that.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">
On 19/07/2024 13:33, Amneesh Singh wrote:
&gt;=20
&gt;=20
&gt; Quite a few TI K3 devices do not have clock-frequency specified in t=
heir
&gt; respective UART nodes. However hard-coding the frequency is not a
Is this property is required? If so, I'd mention that this is to overcome=
 an incorrect device tree.</pre>
    </blockquote>
    <span style=3D"white-space: pre-wrap">The clock input is usually supp=
osed to be at 48MHz, but can still
differ between SoCs, and if I am not wrong can also be changed from
the bootloader. This makes it hard to specify this value in the device
tree itself; which is however required by the current omap-uart driver
as it neither has a default nor a way to parse config params, and relies
on parsing the DT.

</span>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">&gt; solution as the function clock input can dif=
fer between SoCs. So,
&gt; similar to com1/com2, let the user pass the frequency as a dtuart op=
tion
&gt; via the bootargs. If not specified it will fallback to the same DT
&gt; parsing as before. For example, dtuart=3Dserial2:clock-hz=3D48000000=
 can be
&gt; a valid bootarg.
&gt;=20
&gt; Signed-off-by: Amneesh Singh <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:a-singh21@ti.com">&lt;a-singh21@ti.com&gt;</a>
&gt; ---
&gt;  xen/drivers/char/omap-uart.c | 62 +++++++++++++++++++++++++++++----=
---
&gt;  1 file changed, 50 insertions(+), 12 deletions(-)
&gt;=20
&gt; diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-ua=
rt.c
&gt; index 1079198..660c486 100644
&gt; --- a/xen/drivers/char/omap-uart.c
&gt; +++ b/xen/drivers/char/omap-uart.c
&gt; @@ -305,33 +305,71 @@ static struct uart_driver __read_mostly omap_u=
art_driver =3D {
&gt;      .vuart_info =3D omap_vuart_info,
&gt;  };
&gt;=20
&gt; +static void __init omap_uart_parse_config(struct omap_uart *uart,
&gt; +                                         const char *config) {
Braces should be placed on their own lines. Refer CODING_STYLE.
</pre>
    </blockquote>
    Apologies for the carelessness.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">&gt; +
&gt; +    char options[256];
256 is a max size of full dtuart string. Since we only parse for clock-hz=
, do we need the same size here?
Could we say e.g. 64 and extend it in the future if new options will be a=
dded?</pre>
    </blockquote>
    Done, don't think it matters much, but sure thing.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">
&gt; +    char *value, *start =3D options;
Scope of value could be limited to the while loop</pre>
    </blockquote>
    Yes, that's true.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">
&gt; +
&gt; +    if ( !strcmp(config, "") )
&gt; +        return;
&gt; +
&gt; +    strlcpy(options, config, ARRAY_SIZE(options));
&gt; +
&gt; +    while (start !=3D NULL)
White spaces missing. Refer CODING_STYLE.
</pre>
    </blockquote>
    Thx.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">&gt; +    {
&gt; +        char *name;
&gt; +
&gt; +        /* Parse next name-value pair. */
&gt; +        value =3D strsep(&amp;start, ",");
&gt; +        name =3D strsep(&amp;value, "=3D");
Can name be NULL here? This would want checking for the below strcmp.</pr=
e>
    </blockquote>
    <span style=3D"white-space: pre-wrap">Indeed, both the name and value=
 can be NULL at this point. Thx.
</span>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">&gt; +
&gt; +        if ( !strcmp(name, "clock-hz") )
&gt; +            uart-&gt;clock_hz =3D simple_strtoul(value, NULL, 0);
&gt; +        else
&gt; +            printk("WARNING: UART configuration option %s is not su=
pported\n",
&gt; +                   name);
&gt; +
&gt; +    }
&gt; +}
&gt; +
&gt;  static int __init omap_uart_init(struct dt_device_node *dev,
&gt;                                   const void *data)
&gt;  {
&gt;      const char *config =3D data;
&gt;      struct omap_uart *uart;
&gt; -    u32 clkspec;
&gt;      int res;
&gt;      paddr_t addr, size;
&gt;=20
&gt; -    if ( strcmp(config, "") )
&gt; -        printk("WARNING: UART configuration is not supported\n");
&gt; -
&gt;      uart =3D &amp;omap_com;
&gt;=20
&gt; -    res =3D dt_property_read_u32(dev, "clock-frequency", &amp;clksp=
ec);
&gt; -    if ( !res )
&gt; -    {
&gt; -        printk("omap-uart: Unable to retrieve the clock frequency\n=
");
&gt; -        return -EINVAL;
&gt; -    }
&gt; -
&gt; -    uart-&gt;clock_hz =3D clkspec;
&gt; +    /* Default configuration. */
&gt; +    uart-&gt;clock_hz =3D 0;
&gt;      uart-&gt;baud =3D 115200;
&gt;      uart-&gt;data_bits =3D 8;
&gt;      uart-&gt;parity =3D UART_PARITY_NONE;
&gt;      uart-&gt;stop_bits =3D 1;
&gt;=20
&gt; +    /*
&gt; +     * Parse dtuart options.
&gt; +     * Valid options:
&gt; +     *   - clock-hz
&gt; +     */
&gt; +    omap_uart_parse_config(uart, config);
&gt; +
&gt; +    /* If clock-hz is missing. */
Apart from missing, clock_hz can be 0 also if user specifies 0</pre>
    </blockquote>
    That's true, thx.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">
&gt; +    if ( uart-&gt;clock_hz =3D=3D 0 )
&gt; +    {
&gt; +        u32 clkspec;
We are moving away from Linux derived types so please take the occasion t=
o use uint32_t here.
Also, there should be a blank line between definitions/code.</pre>
    </blockquote>
    Got it.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">
&gt; +        res =3D dt_property_read_u32(dev, "clock-frequency", &amp;c=
lkspec);
&gt; +        if ( !res )
&gt; +        {
&gt; +            printk("omap-uart: Unable to retrieve the clock frequen=
cy\n");
&gt; +            return -EINVAL;
&gt; +        }
&gt; +        uart-&gt;clock_hz =3D clkspec;
&gt; +    }
&gt; +
&gt;      res =3D dt_device_get_paddr(dev, 0, &amp;addr, &amp;size);
&gt;      if ( res )
&gt;      {
&gt; --
&gt; 2.34.1
&gt;=20
&gt;=20

~Michal
</pre>
    </blockquote>
    Regards<br>
    Amneesh<br>
  </body>
</html>

--------------mmxO0gR1xX1sskrFwkjJrYu5--

--------------EYEIXmxdB57iQTMZahg0UZRd
Content-Type: application/pgp-keys; name="OpenPGP_0x104493B4D46917EC.asc"
Content-Disposition: attachment; filename="OpenPGP_0x104493B4D46917EC.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGaGX/kBEACu0GIGVFYkfov56fJf9bWJxMv0RmXATnRVRAGIpXUYRnNVE+ra
A8U4ehT9N5FAnJqru6cQyW/hLpynZ2wE6iRmY43F3xFQ51c/luYh8OWkC4Boc59H
uGhQe79pXi7/P2WCiT6tbOXW2CcBzpAhIK+WjwLu/IbNVMyk/n/mGOKdGi1B/n9/
zHX79GXG39k5p/7ttaePCUEVSZXn8idiOrdGcOe/2B+xQen3nJmraEb5U2ZXe6Ne
veehKtJRk/15ePhHzxGWhFpwVKSETkvFMWfZUEncdN/zunsu/ExWUY4IhnxQyKSs
SR8QFV8oyyplV480XF6gJ98e2I6mNNLpI1qrEvSyzt0zz6qXyAxqZQippad8PJR7
PRp9II2IoHNDQZ6+tt3rP36owYF9AaaNi+t5cBUHmiWZ8P7N9iGZv1Orvv2fpD1w
DpvwcjkC6VGUVYm9ZbZOtSMuePsVQX9nrDW2FNTbT5tp5/hg/wTo5kt6/DeG1lW8
0SnWhlF7h4OYT4XOADgVflCNdQNPwWODbtMei7UbSEQTlfFM3a1vLZFBQ21hMPjv
J+0+8wGY6fivbcso4Agb1QQ3TVr07eYcekF2kvm9h1o6obsEUgkd+OgRtKW7Ukqr
BsDKU1sUVpPMsudkfhCfMkpUeMhGm9xCmnwJ7rCZi9bOK68jUwt3IfvI5QARAQAB
zSBBbW5lZXNoIFNpbmdoIDxhLXNpbmdoMjFAdGkuY29tPsLBlAQTAQoAPhYhBCsW
73h+3Cjcfr2IgxBEk7TUaRfsBQJmhl/5AhsDBQkAdqcABQsJCAcCBhUKCQgLAgQW
AgMBAh4BAheAAAoJEBBEk7TUaRfsfjkP/jjewYjXKEUQnk+B7BFrTc468G1PRspg
Kny+DAQ2R8J9zmnfYCbfFSD6tMowMIBuobC3FuHWZ3vYXgdzAkz1MRYmzVOrG4Xl
/h0XkqvGjOVTAJoKS0AunFjnT1VAUtYjyUw46/CiF1Iwfig52YEA+6DKBNtqhHLI
D1W1JQHGSdFvnzjvQBke75pAp6QkmLpiQzKcAvNHpMQaZ5VXv+Ls1Ek3CcJ2BRX3
KjaUEBrYBUR0CZdHkAuKEwzDSFtqXtIfVgAuG1S9U9juhUxoany0u3xXQCWAkJZC
TunjRNKl64hYw2jpzEJXZa8OvO0En39ZaiqaOQIPdudhj8idEYXOWseEIt9oDrRK
T5mBmiksQtAYJ0P6/+GOpriQGFeaq9AUkxd62X6JXBPYfFbpYHStDzlkZHLqGukz
uBKrjYbV6aVkLRpPOgjN/0a35Tpam1HHEqOsfe4HTK4UCJyQg8xMiqM9qpB2MZNJ
RnPz6hOrKKX+isXCiKKpSwJ02rmnEjPhAqSrSijd1PxZzrbju5+AeOBn/XTuqliu
soX+O3WYNN71w7brNamW4KmGa1isBX6uH5mvM8LrNPVvljZQM0QIA1yPAoZoqtR8
yRB1z3oI7R7+qoirnts/dRjadUP29qKBdSWwjAR7KuxuYAABHacAIl31LHWf5QJf
DZmTHV0pTiUazsFNBGaGX/kBEADRw7/VxiIwzQNRHhx/r1v6GB3six1CjXthn/ER
LzVq8ytejbp7gecKef0T8FYjo1s/12Ifdqmq7UrPU606kKljvf3c0oL/uS02AHaA
T/XI49nB2/LXK3pUkUqkNEapzZZNleN42ve1a0PeCwde57F6ZjfzcGtbN7XJ4pg4
elpzRa3bFfFhBMOFBTNUpy26nYXub/Xp3Yl+5hZxrVUV0w96+q/P1VcSXlN7YrCw
9Ke5V3tTO7KAuckTDddECju5CTSPrAORiP5wJoS25WJ86a8dQdFifiMdtAR2GEq8
c4bX047CwdYwNqepxrTLpiAz7Pk7mCb3ZJLR8DpN7HXRcs4Aonu3BZnex5Q2iLjY
ZYFnCdCX01j+SPhXSSIBNefqSo+0NpapPxrHKFjV9VYB0jgrlXemiP2iGznlt3if
w+gzDIKvrS6MH/qXaDT0p5VwYTuOb3beO186l7PxgWWYZsOLwFp7QtsHB54IdUXK
OzC3iRumsVef0mLmQ9/hVkFHZk4sdQeAEF+7iclJLJE0mioE1daNIPFGVI4V+6ok
y3IO1tNXHP2OD/CjmFLpPBe7IpSjSlFvq6loPGELNMvd7fOE3SDvqM6KxAD0ET00
SubzZwTPIEuyw0KUhyN3bIOx2C3PmSz/BkdVhOZkJGPa3nVhQdX0dKF5N4wkUgCH
1EKgIwARAQABwsF8BBgBCgAmFiEEKxbveH7cKNx+vYiDEESTtNRpF+wFAmaGX/kC
GwwFCQB2pwAACgkQEESTtNRpF+x20g//QLFUN32HUyh14stjpo7NkuOvcJL5AsgY
Q5wrBI5K0UMFhyNMpY8ZkRAiEBBhyiEgWHQiI8Zu4pu1DN2KJ3TmVglY0hhCB8lk
/fGAOpHGdIISdBCEGrJ2Xnn0U51WvRJBBR8aeCz8dG0N41qrcDW8tKd9+SDge9V2
FI1/ZrQ8sb8rL2Gvir9kYbOuvq4M3HUlN1rdxc2Dt6Nc+/ziLV0RB2011PuLC3yE
Pf6sB83U2NHgB0VvEWsVumPXxHq+irYLVNzFgYPhkw2Hcg5SnKczDUI6zNE6MXmJ
qzz2hbu8w5pmTK3W50EghZPnSYlkwFt/cCxu5ws84D7z5QjT6ZdrZ8Jg5RVyKe27
x+L/idKj9Xhko9K9M3N7KMCrJvYsCLRPxNiRQh3DMuv9zGrwkRxAI0TpB7n28BjQ
IWcf3T8fhOWPNZEnB4RZDnoPhKnFRZcki1CgspD94Q5/wV4S0bM9DdIgZ0GycFkh
8SCmFU56rJHDHa09bCFzTWZG7ruHNay5nXVQToFuSA3NAgWa5ZR9DUsFw/uL+Uv5
53mv9SUh3jXHUrhLEf576UJxiA2VVealrOOJDl6w6z97w5fokOZpZpLlNl20g88Y
6iJV/isSZmH1yib9zv0XsolJAX6Gk446MqGbVmfk0zyx+lmNQ+B98L939ZhqnROQ
8zIlNC+fabI=3D
=3D3mR5
-----END PGP PUBLIC KEY BLOCK-----

--------------EYEIXmxdB57iQTMZahg0UZRd--

--------------MphJER2dfXwmOZBc0DPqD0DY--

--------------E3i8BTeoaIEPZrRYex3hAbkE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEKxbveH7cKNx+vYiDEESTtNRpF+wFAmax5vQFAwAAAAAACgkQEESTtNRpF+yl
Eg/+L2cj5YVIcHOK8NGuKGl7gs1HzN9gGFzYEFI6bfwgxqFXGB1WlhJ31Y1heHnLwe0QbWPVGdFb
Wyanhd1/8PEKxezlPdukItylvujw8AkLfyL88f96tEdiQkC1GKZhy5scBXKSdETQOTwnpAz4J999
dt39X0x6d5uezBe69CDMrofjAiul1cvDZstbyy13yi8sfRfocnDOH5ew9uD9lPyNCqblouGmNmqh
hdBr7jsUG0ZeQCSqFxMKiy7d1oooLnkY8NFpnOvlFW4U34cdT73tS6LJqZ7GhWCg/uuAmGBAgwdn
1EW2JAPgSOpoQireBiwmYQ43xWVchg+MK+4usz5kOdCLYqU09wtRXP/Mi+ZzhvAfrP+O9ykhB3HV
XcZUGLbXPiXVFfYJQXBqm8s8dewRW6XgoYBeGBKVJQ8zcEr2hvjxBN5IjYssIPw1zQ5muAkYGNbG
9lEYhfCnINAF3iSKHA3Fea+DetKmveQSM7FXxdSV6xqqocRnfsvdtSxHIOHWmfOaRDGirs9RUnsx
nZ9d1nV5KtLvLAE2U2oe/KQf5aa3Y+/0KwnRJyN3EVqe+eA/pIpgzZPUyuFFisqo7Ohsghu9j3yA
OCh1br6zvOSQV8cwQ1C8ATShodx1lt02pMSmuJpfD+KQCEenaE9QzcU7CuJ2Sb5Iuv4wfNfalOCG
LH0=
=L/ss
-----END PGP SIGNATURE-----

--------------E3i8BTeoaIEPZrRYex3hAbkE--

