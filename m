Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A1124A87
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 16:00:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihakr-0006Ag-Pt; Wed, 18 Dec 2019 14:56:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNHo=2I=amazon.com=prvs=24851c453=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihakq-0006Ab-3v
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:56:48 +0000
X-Inumbo-ID: 9d56a012-21a6-11ea-90a2-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d56a012-21a6-11ea-90a2-12813bfff9fa;
 Wed, 18 Dec 2019 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576681008; x=1608217008;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RznYqrwhjMJsVEehhpdAjNsUFFG7TML9k6vqp8NBS8g=;
 b=a+g5+SSl+sF4Fe4Y+/cBXWDFsB6UHx8rAbYauQbvkj6Xh7QRapKQVc48
 ZW0ZHRaDU0DhR6Q9AyWIhicQZ9t1sqjidtM4WYR0Ir7oREqcSd+EzG9zw
 YKfigPeUArJQPTxdzS4fzzJcnHaf+S1gI8O6hQVhafm2vVrAFAbrSnkP4 M=;
IronPort-SDR: 0T3sbp1WwNEzRtsxSH6oWdAmQTP0QBSxArcjeNnGvy52Ipewl7EN7+d/+LwrWeDsvRCErLGKgf
 utWnNOWXpjvg==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; 
   d="scan'208";a="9118580"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 18 Dec 2019 14:56:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id A8838242D2E; Wed, 18 Dec 2019 14:56:43 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 14:56:43 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 14:56:42 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 18 Dec 2019 14:56:41 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/6] x86: import hyperv-tlfs.h from Linux
Thread-Index: AQHVtbFxlRD4Ayv+akSptne0IdOdKae/+o1g
Date: Wed, 18 Dec 2019 14:56:41 +0000
Message-ID: <1c83b46322c74f2ba4c3e38b0da8d433@EX13D32EUC003.ant.amazon.com>
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-2-liuwe@microsoft.com>
In-Reply-To: <20191218144233.15372-2-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/6] x86: import hyperv-tlfs.h from Linux
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
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAxOCBEZWNlbWJlciAyMDE5
IDE0OjQyCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY29tPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IEphbiBCZXVsaWNoCj4gPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUKPiA8d2xAeGVuLm9yZz47
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFtQQVRD
SCB2MiAxLzZdIHg4NjogaW1wb3J0IGh5cGVydi10bGZzLmggZnJvbSBMaW51eAo+IAo+IFRha2Ug
YSBwcmlzdGluZSBjb3B5IGZyb20gTGludXggY29tbWl0Cj4gYjJkOGIxNjdlMTViYjVlYzI2OTFk
MTExOWMwMjU2MzBhMjQ3ZjY0OS4KPiAKPiBEbyB0aGUgZm9sbG93aW5nIHRvIGZpeCBpdCB1cCBm
b3IgWGVuOgo+IAo+IDEuIGluY2x1ZGUgeGVuL3R5cGVzLmggYW5kIHhlbi9iaXRvcHMuaAo+IDIu
IGZpeCB1cCBpbnZvY2F0aW9ucyBvZiBCSVQgbWFjcm8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CltzbmlwXQo+ICsvKgo+ICsgKiBUaGUgZ3Vlc3QgT1MgbmVlZHMgdG8gcmVn
aXN0ZXIgdGhlIGd1ZXN0IElEIHdpdGggdGhlIGh5cGVydmlzb3IuCj4gKyAqIFRoZSBndWVzdCBJ
RCBpcyBhIDY0IGJpdCBlbnRpdHkgYW5kIHRoZSBzdHJ1Y3R1cmUgb2YgdGhpcyBJRCBpcwo+ICsg
KiBzcGVjaWZpZWQgaW4gdGhlIEh5cGVyLVYgc3BlY2lmaWNhdGlvbjoKPiArICoKPiArICogbXNk
bi5taWNyb3NvZnQuY29tL2VuLQo+IHVzL2xpYnJhcnkvd2luZG93cy9oYXJkd2FyZS9mZjU0MjY1
MyUyOHY9dnMuODUlMjkuYXNweAo+ICsgKgo+ICsgKiBXaGlsZSB0aGUgY3VycmVudCBndWlkZWxp
bmUgZG9lcyBub3Qgc3BlY2lmeSBob3cgTGludXggZ3Vlc3QgSUQocykKPiArICogbmVlZCB0byBi
ZSBnZW5lcmF0ZWQsIG91ciBwbGFuIGlzIHRvIHB1Ymxpc2ggdGhlIGd1aWRlbGluZXMgZm9yCj4g
KyAqIExpbnV4IGFuZCBvdGhlciBndWVzdCBvcGVyYXRpbmcgc3lzdGVtcyB0aGF0IGN1cnJlbnRs
eSBhcmUgaG9zdGVkCj4gKyAqIG9uIEh5cGVyLVYuIFRoZSBpbXBsZW1lbnRhdGlvbiBoZXJlIGNv
bmZvcm1zIHRvIHRoaXMgeWV0Cj4gKyAqIHVucHVibGlzaGVkIGd1aWRlbGluZXMuCj4gKyAqCj4g
KyAqCj4gKyAqIEJpdChzKQo+ICsgKiA2MyAtIEluZGljYXRlcyBpZiB0aGUgT1MgaXMgT3BlbiBT
b3VyY2Ugb3Igbm90OyAxIGlzIE9wZW4gU291cmNlCj4gKyAqIDYyOjU2IC0gT3MgVHlwZTsgTGlu
dXggaXMgMHgxMDAKPiArICogNTU6NDggLSBEaXN0cm8gc3BlY2lmaWMgaWRlbnRpZmljYXRpb24K
PiArICogNDc6MTYgLSBMaW51eCBrZXJuZWwgdmVyc2lvbiBudW1iZXIKPiArICogMTU6MCAgLSBE
aXN0cm8gc3BlY2lmaWMgaWRlbnRpZmljYXRpb24KPiArICoKPiArICoKCkl0IG1pZ2h0IGJlIHVz
ZWZ1bCB0byBwdWxsIHRoZSBkZWNsYXJhdGlvbiBvZiB1bmlvbiB2aXJpZGlhbl9ndWVzdF9vc19p
ZF9tc3IgaW4gaGVyZSBzaW5jZSB0aGUgY29tbWVudCBpcyBleHBsYWluaW5nIHRoZSBmb3JtYXQu
CgogIFBhdWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
