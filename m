Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD6B14E004
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 18:38:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixDih-00067Z-Vd; Thu, 30 Jan 2020 17:35:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixDig-00067R-QY
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 17:35:10 +0000
X-Inumbo-ID: dd19a13e-4386-11ea-b211-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd19a13e-4386-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580405710; x=1611941710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kPvohoLNQUOsAKcE/PlkpqRnG3lrzP17EkK9H8/9jRs=;
 b=caU54I/NbphylSsujnlT3V48/s8nNRhRmEmxbNHLnm+z5jYiqyni4wJi
 YyIOuFTRxu4hAMS/1eCK9lmoGbEwSI7HfwLwq8z4j1Qmt5ay9Dx6WZS7i
 R51rETxDK2XdNouYBhfUqHub5ElV6Pvu6aYobCTnc0U5emrdGiftIKAaz 0=;
IronPort-SDR: +GtuA9wvl1UkyggTjFC+p1LQ3XBumH6Q74elqYjWPIKpOFpDVxTNJ0mV26Y5+mqxbgoGshGQMw
 fLHZieO1G2vw==
X-IronPort-AV: E=Sophos;i="5.70,382,1574121600"; d="scan'208";a="14060020"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Jan 2020 17:35:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 69FCDA20FC; Thu, 30 Jan 2020 17:35:08 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 17:35:07 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 17:35:07 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 17:35:06 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
Thread-Index: AQHV0TKAfSuQBKGYT06LZ4VCzz55PqgDg9QAgAAAZMA=
Date: Thu, 30 Jan 2020 17:35:06 +0000
Message-ID: <8046f9a470344b87b9c5e21d17506085@EX13D32EUC003.ant.amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-2-pdurrant@amazon.com>
 <24115.4852.346085.817614@mariner.uk.xensource.com>
In-Reply-To: <24115.4852.346085.817614@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSWFuDQo+IEphY2tz
b24NCj4gU2VudDogMzAgSmFudWFyeSAyMDIwIDE3OjMyDQo+IFRvOiBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY28udWs+DQo+IENjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFdlaSBM
aXUgPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjQgMS83
XSBsaWJ4bDogYWRkIGRlZmluaXRpb24gb2YNCj4gSU5WQUxJRF9ET01JRCB0byB0aGUgQVBJDQo+
IA0KPiBQYXVsIER1cnJhbnQgd3JpdGVzICgiW1BBVENIIHY0IDEvN10gbGlieGw6IGFkZCBkZWZp
bml0aW9uIG9mDQo+IElOVkFMSURfRE9NSUQgdG8gdGhlIEFQSSIpOg0KPiA+IEN1cnJlbnRseSBi
b3RoIHhsIGFuZCBsaWJ4bCBoYXZlIGludGVybmFsIGRlZmluaXRpb25zIG9mIElOVkFMSURfRE9N
SUQNCj4gPiB3aGljaCBoYXBwZW4gdG8gYmUgaWRlbnRpY2FsLiBIb3dldmVyLCBmb3IgdGhlIHB1
cnBvc2VzIG9mIGRlc2NyaWJpbmcNCj4gdGhlDQo+ID4gYmVoYXZpb3VyIG9mIGxpYnhsX2RvbWFp
bl9jcmVhdGVfbmV3L3Jlc3RvcmUoKSBpdCBpcyB1c2VmdWwgdG8gaGF2ZSBhDQo+ID4gc3BlY2lm
aWVkIGludmFsaWQgdmFsdWUgZm9yIGEgZG9tYWluIGlkLg0KPiANCj4gSGkuICAoSSdtIHJlcGx5
aW5nIHRvIHRoZSAxLyBoZXJlIGJlY2F1c2UgSSBkb24ndCBzZWVtIHRvIGhhdmUgYW55IDAvDQo+
IGluIG15IGluYm94Li4uKQ0KPiANCg0KT2gsIEkgbXVzdCBoYXZlIGZvcmdvdCB0byBjb3B5IHRo
ZSBjb21iaW5lZCBjYyBsaXN0IG9udG8gdGhlIGNvdmVyIGxldHRlci4gU29ycnkgYWJvdXQgdGhh
dC4NCg0KPiBUaGFua3MgZm9yIGFsbCB0aGlzLiAgQXMgd2VsbCBhcyB5b3VyIHVzZSBjYXNlLCB3
aGljaCBpcyBpbiBpdHNlbGYNCj4gdmFsdWFibGUsIEkgdGhpbmsgdGhpcyBjaGFuZ2UgaXMgaW1w
b3J0YW50IGZvciBvdGhlciByZWFzb25zLg0KPiBTbyBJIHdhbnQgdG8gc2VlIGl0IGdvIGluLg0K
PiANCj4gWW91J2xsIHNlZSBJIGhhdmUgcmVwbGllZCB3aXRoIHNvbWUgY29tbWVudHMgYWJvdXQg
dGhlIGltcGxlbWVudGF0aW9uLg0KPiBJIGhvcGUgeW91IHdvbid0IGJlIGRpc2NvdXJhZ2VkLiAg
SWYgeW91IGZlZWwgSSBhbSBhc2tpbmcgZm9yIHRvbyBtdWNoDQo+IHdvcmsgSSBtaWdodCBiZSBp
bmNsaW5lZCB0byBwaWNrIHVwIHNvbWUgb2YgdGhpcyBteXNlbGY7IGlmIHNvLCBwbGVhc2UNCj4g
bGV0IG1lIGtub3cuICBJIGRlZmluaXRlbHkgZG9uJ3Qgd2FudCB0aGlzIHRvIGJlIGRyb3BwZWQu
DQoNCkRvbid0IHdvcnJ5LCB5b3VyIGZlZWRiYWNrIGlzIGZpbmUuLi4gY2VydGFpbmx5IG5vdCBh
c2tpbmcgdG9vIG11Y2guDQoNCiAgQ2hlZXJzLA0KDQogICAgUGF1bA0KDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
