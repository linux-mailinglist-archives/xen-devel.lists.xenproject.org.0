Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE22832FF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2908.8310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPMbl-0005at-1D; Mon, 05 Oct 2020 09:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2908.8310; Mon, 05 Oct 2020 09:16:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPMbk-0005aU-Tm; Mon, 05 Oct 2020 09:16:36 +0000
Received: by outflank-mailman (input) for mailman id 2908;
 Mon, 05 Oct 2020 09:16:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kPMbi-0005aP-OH
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:16:34 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d6939e18-bf19-4f1a-8b94-39cf447491e9;
 Mon, 05 Oct 2020 09:16:34 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 05 Oct 2020 09:16:31 +0000
Received: from EX13D32EUC003.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4A266A22EA; Mon,  5 Oct 2020 09:16:30 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 09:16:29 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 09:16:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kPMbi-0005aP-OH
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:16:34 +0000
X-Inumbo-ID: d6939e18-bf19-4f1a-8b94-39cf447491e9
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id d6939e18-bf19-4f1a-8b94-39cf447491e9;
	Mon, 05 Oct 2020 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1601889394; x=1633425394;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=biWVEUxOxoT7FbQmoUuhVhRixnq6eVg2MHDB9GOycSU=;
  b=SdxzF3uepKUlknvCbLa6H8UdNPCpqvmqgPCDYyygALIFL7pgoIqSMCUN
   hDLTH6FuIfaqinQSS3PLHrDk+QW07TEDTH+3mRciCYD5oiNx2AIV5+Rxy
   JGu9VHOS0PDD7/V7nUN1ku4Ow0/dq1Ec812zgJeZbDhLrNetSvUBtJ1lq
   4=;
X-IronPort-AV: E=Sophos;i="5.77,338,1596499200"; 
   d="scan'208";a="81546000"
Subject: RE: [PATCH v9 3/8] tools/misc: add xen-domctx to present domain context
Thread-Topic: [PATCH v9 3/8] tools/misc: add xen-domctx to present domain context
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 05 Oct 2020 09:16:31 +0000
Received: from EX13D32EUC003.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
	by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS id 4A266A22EA;
	Mon,  5 Oct 2020 09:16:30 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 09:16:29 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 09:16:28 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Thread-Index: AQHMaZuCwoR0ssB24MBKMpsJEDSJHwIbeBJ6AX8UZfCpgEhR8A==
Date: Mon, 5 Oct 2020 09:16:28 +0000
Message-ID: <54c3b27f69314aeeaf9e5e17d1406f06@EX13D32EUC003.ant.amazon.com>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-4-paul@xen.org>
 <241eda02-e7ab-a44c-8f1c-38eb85c2f8dc@citrix.com>
In-Reply-To: <241eda02-e7ab-a44c-8f1c-38eb85c2f8dc@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.78]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAwMiBPY3RvYmVyIDIwMjAgMjM6NDANCj4g
VG86IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFdlaSBMaXUNCj4gPHdsQHhlbi5v
cmc+DQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdIFtQQVRDSCB2OSAzLzhdIHRvb2xzL21pc2M6
IGFkZCB4ZW4tZG9tY3R4IHRvIHByZXNlbnQgZG9tYWluIGNvbnRleHQNCj4gDQo+IENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4g
Y29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiAN
Cj4gDQo+IE9uIDI0LzA5LzIwMjAgMTQ6MTAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUaGlz
IHRvb2wgaXMgYW5hbG9nb3VzIHRvICd4ZW4taHZtY3R4JyB3aGljaCBwcmVzZW50cyBIVk0gY29u
dGV4dC4NCj4gPiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBhZGQgJ2R1bXAnIGZ1bmN0aW9ucyB3
aGVuIG5ldyByZWNvcmRzIGFyZQ0KPiA+IGludHJvZHVjZWQuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4gQWNrZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPg0KPiA+IC0tLQ0KPiA+IENjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiA+IENjOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPg0KPiA+DQo+ID4gTk9URTogSWFuIHJlcXVlc3RlZCBhY2sgZnJvbSBBbmRy
ZXcNCj4gDQo+IEkgbWVhbiAtIGl0cyBhIGZhaXJseSB0aHJvd2F3YXkgcGllY2Ugb2YgbWlzYyB1
c2Vyc3BhY2UsIHNvIGFjay4NCj4gDQo+IEhvd2V2ZXIsIGl0IGlzIGxhcmdlbHkgc3VwZXJzZWRl
ZCBieSB0aGUgY2hhbmdlcyB5b3UgbmVlZCB0byBtYWtlIHRvDQo+IHZlcmlmeS1zdHJlYW0tdjIg
c28geW91IG1pZ2h0IHdhbnQgdG8gYmVhciB0aGF0IGluIG1pbmQuDQo+IA0KPiBBbHNvLCBJIHdv
bmRlciBpZiBpdCBpcyB3aXNlIGluIGdlbmVyYWwgdGhhdCB3ZSdyZSB0aHJvd2luZyBzbyBtYW55
IG1pc2MNCj4gZGVidWdnaW5nIHRvb2xzIGludG8gc2Jpbi4NCj4gDQoNClRoZSBpbnRlbnRpb24g
aXMgdG8gZXZlbnR1YWxseSByZXBsYWNlIGh2bSBjb250ZXh0IHNvIHdlJ2xsIG5lZWQgYSBwYXJh
bGxlbCB0b29sIHRvIHJlcGxhY2UgeGVuLWh2bWN0eCwgdW5sZXNzIHdlIHdhbnQgdG8gcmV0aXJl
IGl0Lg0KDQo+ID4gKyNpbmNsdWRlIDxpbnR0eXBlcy5oPg0KPiA+ICsjaW5jbHVkZSA8c3RkaW8u
aD4NCj4gPiArI2luY2x1ZGUgPHN0ZGxpYi5oPg0KPiA+ICsjaW5jbHVkZSA8c3RyaW5nLmg+DQo+
ID4gKyNpbmNsdWRlIDxlcnJuby5oPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPHhlbmN0cmwuaD4N
Cj4gPiArI2luY2x1ZGUgPHhlbi94ZW4uaD4NCj4gPiArI2luY2x1ZGUgPHhlbi9kb21jdGwuaD4N
Cj4gPiArI2luY2x1ZGUgPHhlbi9zYXZlLmg+DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCAqYnVm
ID0gTlVMTDsNCj4gPiArc3RhdGljIHNpemVfdCBsZW4sIG9mZjsNCj4gPiArDQo+ID4gKyNkZWZp
bmUgR0VUX1BUUihfeCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4gPiArICAgIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICsgICAgICAgIGlm
ICggbGVuIC0gb2ZmIDwgc2l6ZW9mKCooX3gpKSApICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcDQo+ID4gKyAgICAgICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gPiArICAgICAgICAgICAgZnBy
aW50ZihzdGRlcnIsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICJlcnJvcjogbmVlZCBhbm90aGVyICVsdSBi
eXRlcywgb25seSAlbHUgYXZhaWxhYmxlXG4iLCBcDQo+IA0KPiAlenUgaXMgdGhlIGNvcnJlY3Qg
Zm9ybWF0dGVyIGZvciBzaXplX3QuDQo+IA0KDQpUcnVlLCBtaXNzZWQgdGhhdC4NCg0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgIHNpemVvZigqKF94KSksIGxlbiAtIG9mZik7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+ID4gKyAgICAgICAgICAgIGV4aXQoMSk7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gDQo+IFlvdXIg
ZXJyb3IgaGFuZGxpbmcgd2lsbCBiZSBmYXIgbW9yZSBzaW1wbGUgYnkgdXNpbmcgZXJyKCkgaW5z
dGVhZCBvZg0KPiBvcGVuY29kaW5nIGl0Lg0KPiANCg0KT2suDQoNCiAgUGF1bA0KDQo+IH5BbmRy
ZXcNCg==

