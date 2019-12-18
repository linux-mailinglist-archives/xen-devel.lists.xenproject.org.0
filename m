Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FA4124A68
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:55:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihadz-0005MN-1Z; Wed, 18 Dec 2019 14:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNHo=2I=amazon.com=prvs=24851c453=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihadx-0005MI-Ra
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:49:41 +0000
X-Inumbo-ID: 9efc55c0-21a5-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9efc55c0-21a5-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576680582; x=1608216582;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bKox2Q6wcKkmS8WJWj4bTJjAtC35vXx2G3BepEYHaRY=;
 b=aLoieWS7pZBjSDOJmZrTyba8ukkPx+AEwQdz6ds8k7czh2/FT2HUDnE1
 fNN2f1Y30Iaj0LjY0n7CerizDI5B3OaS8UIWsfu8++L40EIpyfj+eZ1q5
 gQrZ0+fxxonY2FpYBzdt4cUJMq8MExw5X5A0dvJB2lrnogdmby1WFNGAd o=;
IronPort-SDR: s7YnQ0FIPPD2rWRgjl4jI+L2lzkErUYrAGzwOP0CkInbRYRMbU6Oo68Uelr6mU+EK3ppEvePPT
 a4NmD/owgoOw==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; 
   d="scan'208";a="5861180"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 18 Dec 2019 14:49:41 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1E68FA1235; Wed, 18 Dec 2019 14:49:37 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 14:49:37 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 14:49:36 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 18 Dec 2019 14:49:36 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/6] x86/viridian: drop duplicate defines from
 private.h and viridian.c
Thread-Index: AQHVtbF0dZxDa/GTyk6+Dg6boRA8Oqe/+GQQ
Date: Wed, 18 Dec 2019 14:49:36 +0000
Message-ID: <34f3644d7d7a4b8398977c89b544c89d@EX13D32EUC003.ant.amazon.com>
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-3-liuwe@microsoft.com>
In-Reply-To: <20191218144233.15372-3-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/6] x86/viridian: drop duplicate defines
 from private.h and viridian.c
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAxOCBEZWNlbWJlciAyMDE5
IDE0OjQyCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY29tPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IFBhdWwgRHVycmFudAo+IDxwYXVsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi82XSB4ODYvdmlyaWRpYW46IGRy
b3AgZHVwbGljYXRlIGRlZmluZXMgZnJvbQo+IHByaXZhdGUuaCBhbmQgdmlyaWRpYW4uYwo+IAo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cgpbc25pcF0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jCj4gYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFu
L3ZpcmlkaWFuLmMKPiBpbmRleCA0YjA2Yjc4YTI3Li43NmY2YjY1MTBiIDEwMDY0NAo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYwo+IEBAIC0xMCw2ICsxMCw3IEBACj4gICNpbmNsdWRl
IDx4ZW4vaHlwZXJjYWxsLmg+Cj4gICNpbmNsdWRlIDx4ZW4vZG9tYWluX3BhZ2UuaD4KPiAgI2lu
Y2x1ZGUgPGFzbS9ndWVzdF9hY2Nlc3MuaD4KPiArI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYt
dGxmcy5oPgo+ICAjaW5jbHVkZSA8YXNtL3BhZ2luZy5oPgo+ICAjaW5jbHVkZSA8YXNtL3AybS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL2FwaWMuaD4KPiBAQCAtMTksMjIgKzIwLDEwIEBACj4gCj4gICNp
bmNsdWRlICJwcml2YXRlLmgiCj4gCj4gLS8qIFZpcmlkaWFuIEh5cGVyY2FsbCBTdGF0dXMgQ29k
ZXMuICovCj4gLSNkZWZpbmUgSFZfU1RBVFVTX1NVQ0NFU1MgICAgICAgICAgICAgICAgICAgICAg
IDB4MDAwMAo+IC0jZGVmaW5lIEhWX1NUQVRVU19JTlZBTElEX0hZUEVSQ0FMTF9DT0RFICAgICAg
ICAweDAwMDIKPiAtI2RlZmluZSBIVl9TVEFUVVNfSU5WQUxJRF9QQVJBTUVURVIgICAgICAgICAg
ICAgMHgwMDA1Cj4gLQo+ICAvKiBWaXJpZGlhbiBIeXBlcmNhbGwgQ29kZXMuICovCj4gLSNkZWZp
bmUgSHZGbHVzaFZpcnR1YWxBZGRyZXNzU3BhY2UgMHgwMDAyCj4gLSNkZWZpbmUgSHZGbHVzaFZp
cnR1YWxBZGRyZXNzTGlzdCAgMHgwMDAzCj4gLSNkZWZpbmUgSHZOb3RpZnlMb25nU3BpbldhaXQg
ICAgICAgMHgwMDA4Cj4gLSNkZWZpbmUgSHZTZW5kU3ludGhldGljQ2x1c3RlcklwaSAgMHgwMDBi
Cgo+ICAjZGVmaW5lIEh2R2V0UGFydGl0aW9uSWQgICAgICAgICAgIDB4MDA0Ngo+ICAjZGVmaW5l
IEh2RXh0Q2FsbFF1ZXJ5Q2FwYWJpbGl0aWVzIDB4ODAwMQoKVGhlc2Ugb3VnaHQgdG8gYmUgYWRk
ZWQgdG8gaHlwZXJ2LXRsZnMuaC4gQWZ0ZXIgYWxsIHRoZXkgYXJlIHNwZWNpZmllZCBpbiB0aGUg
VExGUy4KCiAgUGF1bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
