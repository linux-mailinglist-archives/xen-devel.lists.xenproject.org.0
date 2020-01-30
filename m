Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C6914D84C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 10:37:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix6E0-0006KX-F6; Thu, 30 Jan 2020 09:35:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ix6Dz-0006KS-2q
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 09:34:59 +0000
X-Inumbo-ID: c7ce19a6-4343-11ea-b211-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7ce19a6-4343-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580376899; x=1611912899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=67LiBYNp7pu2tXAeUjfKRrWxPtxsnC0S/zH/GSYzF3s=;
 b=uA9PJHvpMVL1Dm0rkW6jx1wbV2eysj7T6L/VRqrHb60r73XlmKaoeXki
 CoA5R74c3+f+TCUARLnKYFW+BnMa9kbQApsNu6r+qnkEgKfffDE+EnxqY
 h3RvqvdTMS2AGiVM0XByy900iSD5jctnPOzdCcdrMMoi54fzL4acngPHI U=;
IronPort-SDR: 6hfbT0RpZ1AqzQ7WDvHRYoq7pUhYJnU5kn63VUPNNI4Ek6exnas9/C5GFs5bIJWIs8LJ8862bk
 bxnqV1ixOFrA==
X-IronPort-AV: E=Sophos;i="5.70,381,1574121600"; d="scan'208";a="21989187"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 30 Jan 2020 09:34:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id D9FF1A22F9; Thu, 30 Jan 2020 09:34:53 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 09:34:53 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 09:34:52 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 09:34:51 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v5 01/12] MAINTAINERS: put Hyper-V code under
 Viridian maintainership
Thread-Index: AQHV1uH5AZoST4yV10yRIkQXyrP7cKgC8w6w
Date: Thu, 30 Jan 2020 09:34:51 +0000
Message-ID: <d207860ca80d4bd8860a71d174efec26@EX13D32EUC003.ant.amazon.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-2-liuwe@microsoft.com>
In-Reply-To: <20200129202034.15052-2-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 01/12] MAINTAINERS: put Hyper-V code
 under Viridian maintainership
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <liuwe@microsoft.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpDQo+IExpdQ0K
PiBTZW50OiAyOSBKYW51YXJ5IDIwMjAgMjA6MjANCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0
IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1DQo+IDxsaXV3ZUBtaWNyb3NvZnQu
Y29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0
cml4LmNvbT47DQo+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBE
dXJyYW50LCBQYXVsDQo+IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT47IE1pY2hhZWwNCj4gS2VsbGV5IDxtaWtlbGxleUBtaWNy
b3NvZnQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU3ViamVjdDogW1hl
bi1kZXZlbF0gW1BBVENIIHY1IDAxLzEyXSBNQUlOVEFJTkVSUzogcHV0IEh5cGVyLVYgY29kZSB1
bmRlcg0KPiBWaXJpZGlhbiBtYWludGFpbmVyc2hpcA0KPiANCj4gQW5kIGFkZCBteXNlbGYgYXMg
YSBtYWludGFpbmVyLg0KPiANCj4gU29ydCB0aGUgbGlzdCBhbHBoYWJldGljYWxseSB3aGlsZSBh
dCBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQoNClJldmlld2VkLWJ5OiBQ
YXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQoNCj4gLS0tDQo+ICBNQUlOVEFJTkVS
UyB8IDUgKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGlu
ZGV4IDE5MTVlMDlmOGIuLjA0ZDkxNDgyY2QgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+
ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC01MTQsMTAgKzUxNCwxMyBAQCBGOgl4ZW4vYXJjaC94
ODYvbW0vc2hhZG93Lw0KPiANCj4gIFg4NiBWSVJJRElBTiBFTkxJR0hURU5NRU5UUw0KPiAgTToJ
UGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiArTToJV2VpIExpdSA8d2xAeGVu
Lm9yZz4NCj4gIFM6CVN1cHBvcnRlZA0KPiArRjoJeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi8N
Cj4gIEY6CXhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vDQo+IC1GOgl4ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS92aXJpZGlhbi5oDQo+ICtGOgl4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di5oDQo+ICBGOgl4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmgNCj4gK0Y6
CXhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZpcmlkaWFuLmgNCj4gDQo+ICBYRU5UUkFDRQ0KPiAg
TToJR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPg0KPiAtLQ0KPiAy
LjIwLjENCj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
