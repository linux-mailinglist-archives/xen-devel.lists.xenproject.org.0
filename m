Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21D815BB02
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 09:47:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2A6O-0007H9-Ri; Thu, 13 Feb 2020 08:44:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3q6q=4B=amazon.co.uk=prvs=305d558ea=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j2A6N-0007H4-I2
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 08:44:03 +0000
X-Inumbo-ID: fc4a9156-4e3c-11ea-ade5-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc4a9156-4e3c-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581583444; x=1613119444;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ctdS9xAMnIB46NIluaMbJfe5S32B3pqwHtRoM6oyWFY=;
 b=lPFdkhSlDeQAO1zfsuDlhmri9HA9IcwgykeeCQawlr/0dbXKLONPCmP1
 qt5As+rmTJKAO2B56fbbrHEA8Js+CvH1fnAEI5SlgyoJLKm+6Bxy+GKbH
 bEketNk8hbcbaqe6g3X3NTFHocUFR915Xv+e8nEzac6YShoopwzUn5p2S Q=;
IronPort-SDR: Q6uzSsQ7OWG7+yfXAolITUeXOxfFUnlhpXRwf89+rzHcLoOJM2cMItUPB7l5lLG1oCrKzmJYj2
 cGD6gOb+3/YA==
X-IronPort-AV: E=Sophos;i="5.70,436,1574121600"; d="scan'208";a="24799044"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 13 Feb 2020 08:44:01 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 14F82A20BA; Thu, 13 Feb 2020 08:44:00 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 13 Feb 2020 08:43:59 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 13 Feb 2020 08:43:58 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 13 Feb 2020 08:43:58 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/4] x86/hyperv: misc cleanup
Thread-Index: AQHV4b8xKDfzazcnkEe4yyIm76orvqgYz40Q
Date: Thu, 13 Feb 2020 08:43:58 +0000
Message-ID: <9970f4308ff0408a9ba5fbfc7a9cf10e@EX13D32EUC003.ant.amazon.com>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-2-liuwe@microsoft.com>
In-Reply-To: <20200212160918.18470-2-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.77]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 1/4] x86/hyperv: misc cleanup
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAxMiBGZWJydWFyeSAyMDIw
IDE3OjA5Cj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IE1p
Y2hhZWwgS2VsbGV5Cj4gPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBXZWkgTGl1IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPjsgV2VpIExpdQo+IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogW1BB
VENIIDEvNF0geDg2L2h5cGVydjogbWlzYyBjbGVhbnVwCj4gCj4gQ2hhbmdlIGh2X3ZwX2luZGV4
IHRvIHVzZSB1aW50MzJfdCBiZWNhdXNlIHRoYXQgaXMgd2hhdCBpcyBkZWZpbmVkIGluCj4gVExG
Uy4KPiAKPiBBZGQgIl9hZGRyIiBzdWZmaXggdG8gaHZfZG9fcmVwX2h5cGVyY2FsbCdzIHBhcmFt
ZXRlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4K
ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cgo+IC0tLQo+
ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgIHwgMiArLQo+ICB4ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCAgICAgIHwgMiArLQo+ICB4ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L2h5cGVydi1oY2FsbC5oIHwgNSArKystLQo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9oeXBlcnYuYwo+IGluZGV4IDcwZjRjZDVhZTAuLmI3MDQ0ZjcxOTMgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBAQCAtMzEsNyArMzEsNyBAQAo+ICBzdHJ1Y3QgbXNf
aHlwZXJ2X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7Cj4gIERFRklORV9QRVJfQ1BVX1JF
QURfTU9TVExZKHZvaWQgKiwgaHZfaW5wdXRfcGFnZSk7Cj4gIERFRklORV9QRVJfQ1BVX1JFQURf
TU9TVExZKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKPiAtREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NU
TFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gK0RFRklORV9QRVJfQ1BVX1JFQURfTU9T
VExZKHVpbnQzMl90LCBodl92cF9pbmRleCk7Cj4gCj4gIHN0YXRpYyB1aW50NjRfdCBnZW5lcmF0
ZV9ndWVzdF9pZCh2b2lkKQo+ICB7Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvcHJpdmF0ZS5oCj4gYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAo+
IGluZGV4IDk1NmVmZjgzMWYuLmViMTRlYTQzZTUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L3ByaXZhdGUuaAo+IEBAIC0yNiw2ICsyNiw2IEBACj4gCj4gIERFQ0xBUkVfUEVSX0NQVSh2b2lk
ICosIGh2X2lucHV0X3BhZ2UpOwo+ICBERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl92cF9hc3Np
c3QpOwo+IC1ERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gK0RF
Q0xBUkVfUEVSX0NQVSh1aW50MzJfdCwgaHZfdnBfaW5kZXgpOwo+IAo+ICAjZW5kaWYgLyogX19Y
RU5fSFlQRVJWX1BSSVZJQVRFX0hfXyAgKi8KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC9oeXBlcnYtaGNhbGwuaCBiL3hlbi9pbmNsdWRlL2FzbS0KPiB4ODYvZ3Vlc3Qv
aHlwZXJ2LWhjYWxsLmgKPiBpbmRleCA0ZDNiMTMxYjNhLi4zMzk2Y2FjY2RkIDEwMDY0NAo+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxsLmgKPiArKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi1oY2FsbC5oCj4gQEAgLTYxLDcgKzYxLDggQEAg
c3RhdGljIGlubGluZSB1aW50NjRfdCBodl9kb19mYXN0X2h5cGVyY2FsbCh1aW50MTZfdAo+IGNv
ZGUsCj4gCj4gIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgaHZfZG9fcmVwX2h5cGVyY2FsbCh1aW50
MTZfdCBjb2RlLCB1aW50MTZfdAo+IHJlcF9jb3VudCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZhcmhlYWRfc2l6ZSwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgaW5wdXQsIHBhZGRyX3Qg
b3V0cHV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFk
ZHJfdCBpbnB1dF9hZGRyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFkZHJfdCBvdXRwdXRfYWRkcikKPiAgewo+ICAgICAgdWludDY0X3QgY29udHJvbCA9
IGNvZGU7Cj4gICAgICB1aW50NjRfdCBzdGF0dXM7Cj4gQEAgLTcxLDcgKzcyLDcgQEAgc3RhdGlj
IGlubGluZSB1aW50NjRfdCBodl9kb19yZXBfaHlwZXJjYWxsKHVpbnQxNl90Cj4gY29kZSwgdWlu
dDE2X3QgcmVwX2NvdW50LAo+ICAgICAgY29udHJvbCB8PSAodWludDY0X3QpcmVwX2NvdW50IDw8
IEhWX0hZUEVSQ0FMTF9SRVBfQ09NUF9PRkZTRVQ7Cj4gCj4gICAgICBkbyB7Cj4gLSAgICAgICAg
c3RhdHVzID0gaHZfZG9faHlwZXJjYWxsKGNvbnRyb2wsIGlucHV0LCBvdXRwdXQpOwo+ICsgICAg
ICAgIHN0YXR1cyA9IGh2X2RvX2h5cGVyY2FsbChjb250cm9sLCBpbnB1dF9hZGRyLCBvdXRwdXRf
YWRkcik7Cj4gICAgICAgICAgaWYgKCAoc3RhdHVzICYgSFZfSFlQRVJDQUxMX1JFU1VMVF9NQVNL
KSAhPSBIVl9TVEFUVVNfU1VDQ0VTUyApCj4gICAgICAgICAgICAgIGJyZWFrOwo+IAo+IC0tCj4g
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
