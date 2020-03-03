Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5FD1775C2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 13:16:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j96Pt-000384-O3; Tue, 03 Mar 2020 12:12:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x433=4U=amazon.co.uk=prvs=32428865a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j96Ps-00037z-2m
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 12:12:52 +0000
X-Inumbo-ID: 4dcbf046-5d48-11ea-a142-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dcbf046-5d48-11ea-a142-12813bfff9fa;
 Tue, 03 Mar 2020 12:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583237571; x=1614773571;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=ZSKkjW7EvlwyEut2hAk0bYz4V/ls4JrQe4TFKSUH0eA=;
 b=kQtsZOICS31YozGo13qm2meIzIRMyKmOL5FY7UKd6EaKRxln9BWpwdNP
 yJVB1HPeD0p7hKMWmr2cmvryplutrDrW2x0zp6t/8luK00XQLFFB5TXE7
 EALq7mxiIO/l7apog+a0sJo3mh90ctfn+ob/pGPuH0kfwm9agPRPlB1Q8 w=;
IronPort-SDR: D+NcGicJY2RKx52DkIaIfUVZ2tZNgWZEE47vIEuBd9uwoeI7dYllBIFed9wtqOl7+C5HLEJTaI
 lFdlPTC/IGWA==
X-IronPort-AV: E=Sophos;i="5.70,511,1574121600"; d="scan'208";a="19534409"
Thread-Topic: [Xen-devel] [PATCH] MAINTAINERS: Paul to co-maintain
 vendor-independent IOMMU code
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 03 Mar 2020 12:12:38 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id CEC66A339C; Tue,  3 Mar 2020 12:12:34 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 3 Mar 2020 12:12:34 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Mar 2020 12:12:33 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Mar 2020 12:12:33 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHV8U0eip66ciSTqEOA20h8DOWPEqg2xx+Q
Date: Tue, 3 Mar 2020 12:12:32 +0000
Message-ID: <c181faf860cd412dae3de589c9c1bfd1@EX13D32EUC003.ant.amazon.com>
References: <9731ee51-33ac-d916-3ae4-3126756a76c9@suse.com>
In-Reply-To: <9731ee51-33ac-d916-3ae4-3126756a76c9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.151]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Paul to co-maintain
 vendor-independent IOMMU code
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+IA0KPiBIYXZpbmcganVzdCBh
IHNpbmdsZSBtYWludGFpbmVyIGlzIG5vdCBoZWxwZnVsIGFueXdoZXJlLCBhbmQgY2FuIGJlDQo+
IGF2b2lkZWQgaGVyZSBxdWl0ZSBlYXNpbHksIHNlZWluZyB0aGF0IFBhdWwgaGFzIGJlZW4gZG9p
bmcgcXVpdGUgYSBiaXQNCj4gb2YgSU9NTVUgd29yayBsYXRlbHkuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBQYXVs
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQoNCj4gDQo+IC0tLSBhL01BSU5UQUlORVJT
DQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC0zMjMsNiArMzIzLDcgQEAgRjogIHhlbi9hcmNo
L3g4Ni9jcHUvdnBtdV9pbnRlbC5jDQo+IA0KPiAgSU9NTVUgVkVORE9SIElOREVQRU5ERU5UIENP
REUNCj4gIE06ICAgICBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ICtNOiAgICAg
UGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiAgUzogICAgIFN1cHBvcnRlZA0K
PiAgRjogICAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoLw0KPiAgWDogICAgIHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC8NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
