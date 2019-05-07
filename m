Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48661164CE
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 15:39:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO0HW-0006D3-DY; Tue, 07 May 2019 13:37:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PNGO=TH=citrix.com=prvs=023f6069a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hO0HU-0006Cv-QD
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:37:16 +0000
X-Inumbo-ID: 39271908-70cd-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 39271908-70cd-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 13:37:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="89679620"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] libxl: don't enable synthetic timer by default
Thread-Index: AQHVBNnftOXzmnlw+kyXiZljRBOaFKZfqiKw
Date: Tue, 7 May 2019 13:37:13 +0000
Message-ID: <5ee6b8de44c64201a554d85b282cf975@AMSPEX02CL03.citrite.net>
References: <20190507133625.11502-1-wei.liu2@citrix.com>
In-Reply-To: <20190507133625.11502-1-wei.liu2@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] libxl: don't enable synthetic timer by
 default
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgW21haWx0bzp3ZWku
bGl1MkBjaXRyaXguY29tXQo+IFNlbnQ6IDA3IE1heSAyMDE5IDE0OjM2Cj4gVG86IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQKPiA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gU3ViamVjdDogW1BBVENIXSBsaWJ4bDogZG9uJ3QgZW5hYmxlIHN5bnRoZXRpYyB0aW1lciBi
eSBkZWZhdWx0Cj4gCj4gSXQgYnJva2UgV2luZG93cyBpbnN0YWxsYXRpb24uIE1vcmUgaW52ZXN0
aWdhdGlvbiBpcyBuZWVkZWQuIERvbid0Cj4gZW5hYmxlIGl0IGJ5IGRlZmF1bHQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKPiAtLS0KPiBDYzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiAtLS0KPiAgdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG9t
LmMgYi90b29scy9saWJ4bC9saWJ4bF9kb20uYwo+IGluZGV4IDg3OWM4MDYxMzkuLmM1Njg1YjA2
MWMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKPiArKysgYi90b29scy9s
aWJ4bC9saWJ4bF9kb20uYwo+IEBAIC0yNjksNyArMjY5LDYgQEAgc3RhdGljIGludCBodm1fc2V0
X3ZpcmlkaWFuX2ZlYXR1cmVzKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAo+ICAgICAg
ICAgIGxpYnhsX2JpdG1hcF9zZXQoJmVubGlnaHRlbm1lbnRzLCBMSUJYTF9WSVJJRElBTl9FTkxJ
R0hURU5NRU5UX1RJTUVfUkVGX0NPVU5UKTsKPiAgICAgICAgICBsaWJ4bF9iaXRtYXBfc2V0KCZl
bmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9BUElDX0FTU0lTVCk7
Cj4gICAgICAgICAgbGlieGxfYml0bWFwX3NldCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklE
SUFOX0VOTElHSFRFTk1FTlRfQ1JBU0hfQ1RMKTsKPiAtICAgICAgICBsaWJ4bF9iaXRtYXBfc2V0
KCZlbmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9TVElNRVIpOwo+
ICAgICAgfQo+IAo+ICAgICAgbGlieGxfZm9yX2VhY2hfc2V0X2JpdCh2LCBpbmZvLT51Lmh2bS52
aXJpZGlhbl9lbmFibGUpIHsKPiAtLQo+IDIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
