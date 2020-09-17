Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACCC26D3CB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 08:39:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kInZQ-0001k0-8y; Thu, 17 Sep 2020 06:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6zL=C2=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kInZP-0001jv-0g
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 06:39:03 +0000
X-Inumbo-ID: 860e9515-45ee-4f4e-90b5-1822a57a6995
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 860e9515-45ee-4f4e-90b5-1822a57a6995;
 Thu, 17 Sep 2020 06:39:00 +0000 (UTC)
IronPort-SDR: VW7R6iKH7+rW+KOzyE79k6CnBmrHUvs99PQb+y3ah0lM3aqCMNOifxiAv0U1q9Ng7qjKGxDhuD
 4oQMNKja3XwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="177722288"
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; d="scan'208";a="177722288"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 23:38:59 -0700
IronPort-SDR: 1klpFRb93gzjtAePgS2/JQmv2DMczF33OZXV8bagvBIUVDGAlCN603l1Yd9AYl6x4GHWFlcjPF
 IZTmkCPypNKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; d="scan'208";a="452175974"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 16 Sep 2020 23:38:58 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Sep 2020 23:38:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Sep 2020 23:38:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 16 Sep 2020 23:38:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 16 Sep 2020 23:38:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FV5LqSTjzZaPaTLIE8euWzBowumrjx7rUtD19qAprIEFJ4BXznBDzFcuv0kI6ny0NLt4NR5mA3h5reYf3LBCMo2AantWL26ZoBLhpUvYWxnRXIwUtaYZCjWbTobPFPqNDw6YyCIgHxvt2wV7heFtSd5Q7wjBuUsveq1+/phhqQJ1+WJj8UkoJaER69jVXGs2vnH8i9x3ABBpzm2QzAIM8aet8LMsGCJrMvpWYzwqgsZBf1fgUYidprnw6DColIQdsSRjxhv0yqk9lg3O8geeORiXsp782E/O9vs+c8dS5nVscsps2l8LlUwwDidprNxr3D2oOluRdSNe0ncMxfrQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enV8Crh3BdotEevrv+bj8v2CtJOgHc0jXRd7CyBjd4A=;
 b=U2ERuf301PigAjnkcaVLfcMKVgXuGBDDZYB1j+TEJcmNjET+SWA4I/HDz+dZboAGRLuC5CEO8JuUdOda5MFmS5JaWzLQdUHQyiPfBXFJOATvmpvm1SaccuEPwcM+i+EN6v56M+yMRfmOX4D3/wKWmNnGPLQskXrtiZPNF8dNQmqbaCocX038Qfa909f3eGxMxbhW7uW3W1/3P/53XlbrAFx4MIA1wv8NetJKs4G8bituc+CViI66xTMfjRbfvsQ3TAN7C/J1skCuvZczyJgq9XRpSTvoUe62WD0rFmpkk6RsgRzN/WZnhP6tozDshmK1WN/G55FVBowMOUhQ0+KqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enV8Crh3BdotEevrv+bj8v2CtJOgHc0jXRd7CyBjd4A=;
 b=m+Qj8/VG7Ta5Co81Fw2AIqcOBxsSgYyghKj1/kKk3hAKIDIQk5m7sC67miq9Yum6yBBa0TKcnyXt+sw69KfXM+Sfrh5ZLtPERyDJC9lCJhE/tRjm+OIHSS+eGKUgCmOQH6FERIRsw4ITwiKbTf2jNjZS+pABvEvAYXaO8rgCj54=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1965.namprd11.prod.outlook.com (2603:10b6:300:110::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 06:38:37 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 06:38:37 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "Wei Liu" <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: RE: [PATCH v9 4/8] iommu: make map and unmap take a page count,
 similar to flush
Thread-Topic: [PATCH v9 4/8] iommu: make map and unmap take a page count,
 similar to flush
Thread-Index: AQHWizpu2HFhoXKThUmBn3OEbnxAq6lsYmmw
Date: Thu, 17 Sep 2020 06:38:37 +0000
Message-ID: <MWHPR11MB16450432DAADC58D508DC1848C3E0@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200915082936.23663-1-paul@xen.org>
 <20200915082936.23663-5-paul@xen.org>
In-Reply-To: <20200915082936.23663-5-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5357aec-2b30-427f-0b81-08d85ad44ed1
x-ms-traffictypediagnostic: MWHPR11MB1965:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB19654A6580B64E62799D9AFD8C3E0@MWHPR11MB1965.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bUr76oED5Cd2mW53fEFljKnF0IgBk63oKsyO0nevZ66yt8HHYzjPS08aWqw5AOqM4LKdkXqDNe8gRaN+0PfeLI3DWfexosgPXZS3cIKzCLT6bVTrOksOISdCGq3g7bsY6SUp24OSlMP7SwlFsBTNi4IOTTpXjQU4QGEIsg18c91KIgPA93cEs8CMrcj4+GJeee4IWf7wX+G4OTPTUGjELW/Nh7R+cAZ9HyPylNHr9q7Dc/WgpTDnniYD81XHnkbiF8h2ap27Z/r7v7+k9VzNu6X+GmflR0krooXvK2cSDDQeOWASxukfMNo9Iao95iSv0aNAlGICpqK/IbYoO28ie5lfKE0ZX5GBBVIwQTq3sY1ANebT/jQjbDngzz6xIWpQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(66446008)(54906003)(8676002)(6506007)(2906002)(83380400001)(33656002)(5660300002)(186003)(66476007)(8936002)(7696005)(66946007)(66556008)(64756008)(76116006)(7416002)(478600001)(55016002)(4744005)(86362001)(110136005)(52536014)(4326008)(316002)(71200400001)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 1RrDk7h6ItMjqWZVoFv11VowEcp/CkueyX75MkEzqHj/QTPvhqRoRPkhZEs5pazrttq4WNJxUVsPzH9cwk3w9N7TjXechaKqjOIwSsnnguE7h3TN15tKJ4GCEO7YEnht9vNChB0BLjFK/0tVgIM/T7bnHKtktVpdL64pPgTammmYKT4eR6jeHdzThsSRW2EKk5UOx2XQijOz6JNCcM/cKExXfCf1nVpzBhKN6g4GWn1Ttx+gDXTi2H5Hylnr4/2CKWlyJnuWP6xyi5ZJk0WxBgUomYRJ5e/YnVtmj5f9LGX4SXUOPZDKkB1kspaTB8m8Z/l/+N/2U+m8Gpr5Jns3X/XhNjleWdHUPvIv/5U3yyeo/0dvGdrSKcaTzy/I6gVgsAqAAhxwMxP4AG29reRB17iuDIVzQArr1qb++oLn1cwxu0BrmQwrZglD804uFB3yTazDAF0YeVZW8oXA70fOxzCDzo2bKA4uMPMJXZ++IT7ABr/gU8PTwmvqrVl+PpKLcVLBkiNdxOeM727b5wjOyxsWZqMtQoC6oYmI3EZ7RDfvbeyvqp3+x0MnqjeqhQZNEKGdy/DN3CenjfzuKnR/O4tTIMQx848GmPuffheuqV4GMijH6MgjHeIr5LidnhJ6wGhpTSnpzwpFKbkiBTPTtg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5357aec-2b30-427f-0b81-08d85ad44ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 06:38:37.3815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTSaBcNniDoClN8AAQRJlo89u1NLQULLEh97uWL4ZnvNd1NEiCliqhUQ0ehfBfaVgz5t0bU4iEjdMuRHgmcYeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1965
X-OriginatorOrg: intel.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgU2Vw
dGVtYmVyIDE1LCAyMDIwIDQ6MzAgUE0NCj4gDQo+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4NCj4gDQo+IEF0IHRoZSBtb21lbnQgaW9tbXVfbWFwKCkgYW5kIGlvbW11
X3VubWFwKCkgdGFrZSBhIHBhZ2Ugb3JkZXIgcmF0aGVyDQo+IHRoYW4gYQ0KPiBjb3VudCwgd2hl
cmVhcyBpb21tdV9pb3RsYl9mbHVzaCgpIHRha2VzIGEgcGFnZSBjb3VudCByYXRoZXIgdGhhbiBh
biBvcmRlci4NCj4gVGhpcyBwYXRjaCBtYWtlcyB0aGVtIGNvbnNpc3RlbnQgd2l0aCBlYWNoIG90
aGVyLCBvcHRpbmcgZm9yIGEgcGFnZSBjb3VudA0KPiBzaW5jZQ0KPiBDUFUgcGFnZSBvcmRlcnMg
YXJlIG5vdCBuZWNlc3NhcmlseSB0aGUgc2FtZSBhcyB0aG9zZSBvZiBhbiBJT01NVS4NCj4gDQo+
IE5PVEU6IFRoZSAncGFnZV9jb3VudCcgcGFyYW1ldGVyIGlzIGFsc28gbWFkZSBhbiB1bnNpZ25l
ZCBsb25nIGluIGFsbCB0aGUNCj4gICAgICAgYWZvcmVtZW50aW9uZWQgZnVuY3Rpb25zLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiBS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBSZXZpZXdlZC1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo=

