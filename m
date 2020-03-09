Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EDE17D957
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 07:35:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBBye-0001pd-9r; Mon, 09 Mar 2020 06:33:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZGpV=42=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jBByc-0001pY-B3
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 06:33:22 +0000
X-Inumbo-ID: dd7c9d5e-61cf-11ea-8eb5-bc764e2007e4
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd7c9d5e-61cf-11ea-8eb5-bc764e2007e4;
 Mon, 09 Mar 2020 06:33:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2020 23:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,532,1574150400"; d="scan'208";a="241872922"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 08 Mar 2020 23:33:12 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 8 Mar 2020 23:33:11 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 8 Mar 2020 23:33:11 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.155]) with mapi id 14.03.0439.000;
 Mon, 9 Mar 2020 14:33:09 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/5] IOMMU: restrict visibility/scope if certain variables
Thread-Index: AQHV7jIOV0h4jE4P2UeLx87tzlLTsag/27/w
Date: Mon, 9 Mar 2020 06:33:08 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7C3C14@SHSMSX104.ccr.corp.intel.com>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
In-Reply-To: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZWEzNzQ0MjctNmQyZC00ZjhjLWJkYjUtNTkzZDY3MDRlODJlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoienZYc2ZUT1dBRHVhQStIUFQ5ZWpRdWtlcHRzZFQ1RDBkOWVhaTJ0TmQ2cGdEZXRGRGtuV2traFJCREhqaHdjeCJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/5] IOMMU: restrict visibility/scope if
 certain variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RmVicnVhcnkgMjgsIDIwMjAgODoyNSBQTQ0KPiANCj4gQSBudW1iZXIgb2YgdGhlIGNvbW1hbmQg
bGluZSBjb250cm9sbGVkIHZhcmlhYmxlcyBhcmUgeDg2LQ0KPiBvciBldmVuIHg4Ni1IVk0tc3Bl
Y2lmaWMuIERvbid0IGhhdmUgdGhvc2UgdmFyaWFibGVzIGVsc2V3aGVyZQ0KPiBpbiB0aGUgZmly
c3QgcGxhY2UgKGluIHNvbWUgY2FzZXMgcmVwbGFjZSB0aGVtIGJ5IGEgI2RlZmluZSksDQo+IGFu
ZCBhcyBhIHJlc3VsdCBhbHNvIGRvbid0IHNpbGVudGx5IGFjY2VwdCBzdWNoICJpb21tdT0iDQo+
IHN1Yi1vcHRpb25zIHdoaWNoIGluIGZhY3QgaGF2ZSBubyBlZmZlY3QuDQo+IA0KPiAxOiBpb21t
dV9pbnRyZW1hcCBpcyB4ODYtb25seQ0KPiAyOiBpb21tdV9pbnRwb3N0IGlzIHg4Ni9IVk0tb25s
eQ0KPiAzOiBpb21tdV9pZ2Z4IGlzIHg4Ni1vbmx5DQo+IDQ6IGlvbW11X3FpbnZhbCBpcyB4ODYt
b25seQ0KPiA1OiBpb21tdV9zbm9vcCBpcyB4ODYvSFZNLW9ubHkNCj4gDQo+IFRoZSBzZXJpZXMg
Y29udGV4dHVhbGx5IGRlcGVuZHMgb24gIkFNRC9JT01NVTogd2l0aG91dCBYVCwNCj4geDJBUElD
IG5lZWRzIHRvIGJlIGZvcmNlZCBpbnRvIHBoeXNpY2FsIG1vZGUiDQo+IA0KDQpJJ20gZ2VuZXJh
bGx5IE9LIHdpdGggdGhpcyBzZXJpZXMsIGJ1dCB3aWxsIGdpdmUgbXkgci1iIGFmdGVyDQphbGwg
b3RoZXIgdmVuZG9ycyBoYXZlIGNvbmZpcm1lZCB0aGUgc2NvcGUgaGVyZS4NCg0KVGhhbmtzDQpL
ZXZpbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
