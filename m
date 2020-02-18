Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD116205C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 06:27:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3vN9-0001cQ-Go; Tue, 18 Feb 2020 05:24:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qq7b=4G=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1j3vN8-0001cI-7u
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 05:24:38 +0000
X-Inumbo-ID: f30f5e7a-520e-11ea-bc8e-bc764e2007e4
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f30f5e7a-520e-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 05:24:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 21:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,455,1574150400"; d="scan'208";a="348627051"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2020 21:24:34 -0800
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 21:24:34 -0800
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 21:24:34 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.46]) with mapi id 14.03.0439.000;
 Tue, 18 Feb 2020 13:24:31 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/2] VT-d: adjust logging of RMRRs
Thread-Index: AQHV3PG7fxStKwMUVUCBbgbu2Z2jU6ggfWPQ
Date: Tue, 18 Feb 2020 05:24:31 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D78AD26@SHSMSX104.ccr.corp.intel.com>
References: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
 <e77ce9c5-455a-56c4-32b2-01d73dea33c1@suse.com>
In-Reply-To: <e77ce9c5-455a-56c4-32b2-01d73dea33c1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGQ4YzllNDYtMmMwYS00OTIzLWE3MjItZGVlYzgzNTMzMTE5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQnN0QXBZcVVnbllhSUJxbEo2MWxsZUVOamVUOG5mNjhDVnU4aU1selNIRGVLSlRrNHo2TXgzXC9rT2E3ejVZbG0ifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] VT-d: adjust logging of RMRRs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBGZWJydWFyeSA2LCAyMDIwIDk6MzEgUE0NCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KPiBDYzogVGlhbiwgS2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggMi8yXSBWVC1kOiBhZGp1c3QgbG9nZ2luZyBvZiBSTVJScw0KPiANCj4gQ29u
c2lzdGVudGx5IHVzZSBbLF0gcmFuZ2UgcmVwcmVzZW50YXRpb24sIHNocmluayBsZWFkaW5nIGRv
dWJsZSBibGFua3MNCj4gdG8gYSBzaW5nbGUgb25lLCBhbmQgc2xpZ2h0bHkgYWRqdXN0IHRleHQg
aW4gc29tZSBjYXNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
