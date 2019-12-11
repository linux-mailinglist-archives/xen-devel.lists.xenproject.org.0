Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E0611A9D0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:26:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if051-0000OV-0t; Wed, 11 Dec 2019 11:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9l2=2B=amazon.com=prvs=241e421da=pdurrant@srs-us1.protection.inumbo.net>)
 id 1if04z-0000OQ-8K
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:22:53 +0000
X-Inumbo-ID: 926ac456-1c08-11ea-a914-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 926ac456-1c08-11ea-a914-bc764e2007e4;
 Wed, 11 Dec 2019 11:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576063373; x=1607599373;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5g8uCyNG2AneVkprfHYXI94GkexVAvDYxBcxOqaRcmk=;
 b=VPOZ83TXR0zibLwUbMd2Rlqe4BBasUIJVVMit3EZwgyJBb5XOhoEGCTH
 8MlnbbkWA18sozcIUzSGYCasxaFdieNZq3hCg41hr6Zb5FOKkvvhUM9AI
 Acacq1TAkbfNpRcRBMCZBK81rK7KzOMxKx+TCTQKEE2R2mFCc/0SjW/Cs s=;
IronPort-SDR: ygiyvwPypult5+MARvCS+L0yifCBXTLCAiUfPSk0ShVKk3WslMukjz3Yik46OyYBKfHcgxRw5m
 EWWmDDFCtV0A==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="8078941"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 11 Dec 2019 11:22:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 005B2A07C5; Wed, 11 Dec 2019 11:22:50 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:22:50 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:22:49 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 11:22:49 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH for-next 1/7] x86: import hyperv-tlfs.h from Linux
Thread-Index: AQHVr3CYQ0FxAli6REOMvRTTm0tKeae0yY4AgAABMqA=
Date: Wed, 11 Dec 2019 11:22:49 +0000
Message-ID: <7e82b4ce7784450aaa15f615e11bf949@EX13D32EUC003.ant.amazon.com>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-2-liuwe@microsoft.com>
 <97016273-46d8-423d-8eef-f448f2d04845@suse.com>
 <cbb42ea2e12a4731873ae74ed0668a3c@EX13D32EUC003.ant.amazon.com>
 <66f2460e-8cb5-1866-32f1-6538092cb866@suse.com>
 <20191211111456.6jfbvp3llw6y43dp@debian>
In-Reply-To: <20191211111456.6jfbvp3llw6y43dp@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.120]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH for-next 1/7] x86: import hyperv-tlfs.h from
 Linux
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Xen
 Development List <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gU2VudDogMTEgRGVjZW1iZXIgMjAxOSAxMToxNQo+IFRvOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPjsgV2VpIExpdQo+IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgUGF1
bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+OyBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFhl
bgo+IERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFJv
Z2VyIFBhdSBNb25uw6kKPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQ
QVRDSCBmb3ItbmV4dCAxLzddIHg4NjogaW1wb3J0IGh5cGVydi10bGZzLmggZnJvbSBMaW51eAo+
IAo+IE9uIFR1ZSwgRGVjIDEwLCAyMDE5IGF0IDA0OjQzOjMwUE0gKzAxMDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+ID4gT24gMTAuMTIuMjAxOSAxNjozNywgRHVycmFudCwgUGF1bCB3cm90ZToKPiA+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhl
bi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YKPiBKYW4K
PiA+ID4+IEJldWxpY2gKPiA+ID4+IFNlbnQ6IDEwIERlY2VtYmVyIDIwMTkgMTU6MzQKPiA+ID4+
IFRvOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gPj4gQ2M6IFdlaSBMaXUgPGxpdXdlQG1pY3Jv
c29mdC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47Cj4gQW5kcmV3Cj4gPiA+PiBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBNaWNoYWVsIEtlbGxleQo+ID4gPj4g
PG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLQo+ID4g
Pj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiA+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggZm9y
LW5leHQgMS83XSB4ODY6IGltcG9ydCBoeXBlcnYtCj4gdGxmcy5oCj4gPiA+PiBmcm9tIExpbnV4
Cj4gPiA+Pgo+ID4gPj4gT24gMjUuMTAuMjAxOSAxMToxNiwgV2VpIExpdSB3cm90ZToKPiA+ID4+
PiBUYWtlbiBmcm9tIExpbnV4IGNvbW1pdCBiMmQ4YjE2N2UxNWJiNWVjMjY5MWQxMTE5YzAyNTYz
MGEyNDdmNjQ5Lgo+ID4gPj4+Cj4gPiA+Pj4gVGhpcyBpcyBhIHByaXN0aW5lIGNvcHkgZnJvbSBM
aW51eC4gSXQgaXMgbm90IHVzZWQgeWV0IGFuZCBwcm9iYWJseQo+ID4gPj4+IGRvZXNuJ3QgY29t
cGlsZS4gQ2hhbmdlcyB0byBtYWtlIGl0IHdvcmsgd2lsbCBjb21lIGxhdGVyLgo+ID4gPj4+Cj4g
PiA+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiA+ID4+
Cj4gPiA+PiBUaGlzIGNvbWluZyBmcm9tIExpbnV4IGFuZCBhc3N1bWluZyBhdCBsZWFzdCBhIGZh
aXIgcGFydCBvZiBpdCBpcwo+ID4gPj4gZ29pbmcgdG8gYmUgdXNlZCwgaW4gcHJpbmNpcGxlCj4g
PiA+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gPj4KPiA+
ID4+IEhvd2V2ZXIsIHRoZXJlIGFyZSBtYW55IHNlZW1pbmdseSB1bm5lY2Vzc2FyeSB1c2VzIG9m
IF9fcGFja2VkCj4gPiA+PiBoZXJlLCB3aGljaCBJJ2QgcmF0aGVyIG5vdCBzZWUgZ28gaW4gYXQg
YWxsIChpLmUuIG5vdCBiZSBkcm9wcGVkCj4gPiA+PiBsYXRlciBvbiwgYW5kIHRoZW4gcG90ZW50
aWFsbHkgbWlzc2luZyBzb21lKS4gSSBmaW5kIC4uLgo+ID4gPj4KPiA+ID4+PiArdHlwZWRlZiBz
dHJ1Y3QgX0hWX1JFRkVSRU5DRV9UU0NfUEFHRSB7Cj4gPiA+Pj4gKwlfX3UzMiB0c2Nfc2VxdWVu
Y2U7Cj4gPiA+Pj4gKwlfX3UzMiByZXMxOwo+ID4gPj4+ICsJX191NjQgdHNjX3NjYWxlOwo+ID4g
Pj4+ICsJX19zNjQgdHNjX29mZnNldDsKPiA+ID4+PiArfSAgX19wYWNrZWQgSFZfUkVGRVJFTkNF
X1RTQ19QQUdFLCAqUEhWX1JFRkVSRU5DRV9UU0NfUEFHRTsKPiA+ID4+Cj4gPiA+Cj4gPiA+IFlv
dSByZWFsaXNlIHRoZXJlJ3MgYSBkZWZpbml0aW9uIG9mIHRoaXMgaW4gdGhlIHZpcmlkaWFuIGNv
ZGUgYWxyZWFkeSwKPiByaWdodD8KPiA+Cj4gPiBJdCBsb29rZWQgZmFtaWxpYXIsIGJ1dCBpdCBk
aWRuJ3Qgb2NjdXIgdG8gbWUgdG8gcG9pbnQgdGhpcyBvdXQuCj4gPiBZZXMsIHRoZXJlIGxvb2tz
IHRvIGJlIHJvb20gZm9yIGRlZHVwbGljYXRpb24uLi4KPiA+Cj4gCj4gSSBoYWQgYSBwbGFuIHRv
IG1ha2UgdmlyaWRpYW4gY29kZSB1c2UgdGhpcyBjb3B5IGRpcmVjdGx5Lgo+IAoKSSBoYXZlIG5v
IG9iamVjdGlvbiB0byB0aGF0LCBidXQgSSB0aGluayBpdCBvdWdodCB0byBiZSBkb25lIGFzIHBh
cnQgb2YgdGhpcyBzZXJpZXMgc28gdGhhdCB3ZSBkb24ndCBlbmQgdXAgd2l0aCBsb25nLXRlcm0g
ZHVwbGljYXRpb24uCgogIFBhdWwKCj4gCj4gPiBBY3R1YWxseSwgV2VpLCBvbmUgbW9yZSB0aGlu
ZyBJIHdhcyBjdXJpb3VzIGFib3V0IC0gd2hhdCBpcyAidGxmcyIKPiA+IGFuIGFjcm9ueW0gb2Y/
Cj4gCj4gSXQgbWVhbnMgIlRvcC1MZXZlbCBGdW5jdGlvbiBTcGVjaWZpY2F0aW9uIi4KPiAKPiAo
SSB3aXNoIFhlbiBoYWQgc29tZXRoaW5nIHNpbWlsYXIpCj4gCj4gV2VpLgo+IAo+ID4KPiA+IEph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
