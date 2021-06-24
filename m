Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6569A3B26AE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 07:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146366.269301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHgX-0006UF-ON; Thu, 24 Jun 2021 05:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146366.269301; Thu, 24 Jun 2021 05:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHgX-0006SM-Kb; Thu, 24 Jun 2021 05:13:53 +0000
Received: by outflank-mailman (input) for mailman id 146366;
 Thu, 24 Jun 2021 05:13:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GXyq=LS=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lwHgV-0006SG-EY
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 05:13:51 +0000
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ed8ad76-7e0e-422c-81e7-d97dfaee5401;
 Thu, 24 Jun 2021 05:13:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 22:13:47 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2021 22:13:47 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 22:13:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 23 Jun 2021 22:13:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 23 Jun 2021 22:13:44 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1550.namprd11.prod.outlook.com (2603:10b6:301:b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 05:13:43 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1%12]) with mapi id 15.20.4242.024; Thu, 24 Jun
 2021 05:13:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3ed8ad76-7e0e-422c-81e7-d97dfaee5401
IronPort-SDR: 8mPYyQ74HM+yL5bewgh6f/7e/56jfgWsT9v99+d44cioUwhCXR6cXsgIl0OvBd/mOfNKbhQlyO
 lrCkclBvVhHg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="268530892"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="268530892"
IronPort-SDR: KWHijnh6cYZqVx2vxuZFQ5q020d5iWIQzVBaHUQ8+Cpoz3te9UMh6KaDi68fdN6ETEPBZCc2Kl
 iHEEJyJGH0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="490982049"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knCwhuPgN7S6UEZhbm653ztH7VBit88WdBg04Btsnw7odeEARw6Y14Z5st93bMdDUfMKtpZQvUg6s+xa06ODf9ZcEp11cSShbrNsKDFQhLHSzXVXh4nvVA0oOtil8p13PlRY3hV61U5TAFEgZQIP9jxAd8oFy1HrDys79gipt4NU5WjzsjufoqJqWilMDaJd6HvCjOTKPIJLM4Z11M+UA1DufgMHB1xHCkLOyFyldYPKNDGPRYsj1zocwz5nCmCo6HQvVyctacsnk6JYxXzDTOnkGvQg2m+V79yKu/Wm+xMWKLJcpysVTOR2yFrPKD9KgFlQUHcKAr6hxg5SQ0Ciig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnibFZVDAsaR0mBMP5cYkF7RspspIk3voJFRu8ArpaA=;
 b=TS/aznQ16hVF+S1gRFSjkqut6G7VR4OkaoNX81lDbxzok1y96maYa+uDYTBeCeH1eR9QNLd8yRb4we9qlKxvVflyJy4brheAsWc0S0dtkGWL28xdTWr0+6Bv5DJNqtzkDgChGZPgTovwNy3AzlV+do7mMKNmn8/1MswtPs6KXnZKZto1L62on7wUmDdRFrDI/dAXuDxNFH16d+D5+uMNGlZWnW+Rs5Phh/r+VwPCgt6oOKdRRmTYbxG1VXqizCUPfyv10O46WDTKnqL6i8hppr3ZYWGEWxlhCkOAfQZ5Sl4l11XimxYgb54IaK0/qsHi86QgEUPM5p5CZIVn5ydVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnibFZVDAsaR0mBMP5cYkF7RspspIk3voJFRu8ArpaA=;
 b=EIBRfKvnhAtamhO2m2LUXoLpg+5JCxZUyljn/hWTNtkIt/YW564j3a9npdWX8kXACcJ8jB0DfpgBbx7H5JEBjblru+f9/F+vkrO5cYmvEhzvf+bON13R/Jz51cyiEwHifagWZI5smEaM0y+Atpowbx/umsUyp+T7Vi6DQOo6mTs=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH 3/9] VT-d: undo device mappings upon error
Thread-Topic: [PATCH 3/9] VT-d: undo device mappings upon error
Thread-Index: AQHXXRG+XpEHT4VRdkm+LQYGIgowYqsitShQ
Date: Thu, 24 Jun 2021 05:13:43 +0000
Message-ID: <MWHPR11MB18866D57EB9E61A2F43D5A8D8C079@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <d6370703-97e3-2571-5ae3-8a5ec11e9bcd@suse.com>
In-Reply-To: <d6370703-97e3-2571-5ae3-8a5ec11e9bcd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.142.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dad3f66d-37fb-4038-8948-08d936ced611
x-ms-traffictypediagnostic: MWHPR11MB1550:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR11MB1550CE310B4EFDC6461D251E8C079@MWHPR11MB1550.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I0ibXexX4dpMHWo0vhA97SSzhoRoNfvxFTME9UCR6NFWNGt7YbuTexcut+BVvmhLpqauV0C4IzJSy3n/EONEyzwuyqe8in3Ppj9c2iZsR9mO1VVjX2B+y3CYJ9QJj9S/VUycyGSzdHd5Xm5l2ECTG3q7tyLRC8fUDuncGHwGJngu+lHm7zqjMvbJy4T4p8pVgjq6iLWiGKx9f14zSZDRXvspgBP34OBCAchhyjmdQ6RkGqCbjivC//wgaiic4wTOhXsmeMVREm6R8iS0mmOXibMeTBHdlJgohNWCihFo2kIgM+DyVw7W9VSNDw4y8SDtWuldGLW7udCkDl6bcTf070+KVYZYmyh3Ga9hrpy643+zFKepImYpe066dAuIRvc5FyI7PiS2gcvEWDNgkfJrGn26Tiutk7TMRmuLcsVjidpiFeRG10ATbkQbQdkaClqmEz923vuUY+CsSVK9B3HSO93rf0sUvcUnoZSXtgMeEBg030mBh/YaJ3htknbEc1MmfKAB5DljzcMhDKUDkAW6imzrTo7iJKKP7wUKXXp0/CmggSLCerifs80FJEhMmdh973kfqiaKFXP/8VCKgTnDBOyhG6Pc1lJOxsVvx5w1EM7hcp29T8BZ3kT+Hr9rSqnrODIwFNaD0M0IxwOsLVUWlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(136003)(39860400002)(83380400001)(38100700002)(55016002)(71200400001)(54906003)(316002)(86362001)(2906002)(110136005)(122000001)(478600001)(9686003)(26005)(7696005)(8676002)(76116006)(52536014)(186003)(8936002)(6506007)(66946007)(64756008)(5660300002)(66476007)(4326008)(66556008)(33656002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3VpbnhuSjV4RmlHeEtPelJpbDkvdmFSc2U5M095UWNpdHhwT25lNnJxRXJ4?=
 =?utf-8?B?eVRuRk4wYm9XSTN4TVVDQjU3dm83THlpQWhGejBvUmRqaDAxTmx0Yms1Y1VD?=
 =?utf-8?B?K0RFSDN6OUxORGx4VVd4L0pLMHRscGhLdHg0bU9OaTg4MXRieTZ4TG44MGZm?=
 =?utf-8?B?aUU3cjltR3BrMys0eWhFTXUxdjNuWE9YVHN0ZU9SZFNZb2Z5a252cGh6bzZv?=
 =?utf-8?B?UGptVWVKbTJhdU1ubko3YlcwQUVrTzc1eVJMNDdSSmNoN1NuMzB5Z3ZESkVF?=
 =?utf-8?B?ZTl3aW5sM25xUnFHRE1yUGlTYVBvS3l4V2dYN2huMXM1SmF5bnBRT09tNG1q?=
 =?utf-8?B?TmxxS3NoR1I1MVpaMHprRmlSQTNuNUdNdjBobkJzWVU4M0pWVyt0S2ZoVGUr?=
 =?utf-8?B?aXl2N1hSSXdVTmRLWjFvaUdOUlBmVFNiY252UWEwMUxXWHdNMWRwZ2NSNlIy?=
 =?utf-8?B?NFNqenZhSm93NEhSekVseDJhbE1oaThaaUg2WTBycmI2ajVoZVYzTEdKZUdQ?=
 =?utf-8?B?bVJQUTltTHk5eFhFQi9lNHpYUUVreXpzZ2FsbUJZb3ljS0dtNE9JWkxkcWhh?=
 =?utf-8?B?cjhESWU2N1dJVEQwL0RMS2s4aWZYcnRZV1pINklXL2xncTQ2N3pvU1lZNElI?=
 =?utf-8?B?OWMyQTVMNG9TajBSS256ZnpUTUdsUzhrekZkWXV0MnFYKzhXOGl1WGdyaGYz?=
 =?utf-8?B?U09DN3c1TkxQNE5oR3hIelg5UDRNbmRlSkYwdkxpZ1VoSTNUbCtFTDgycXZP?=
 =?utf-8?B?TENpRmFIbWFsbHkxYjU3a1h0SFh4VEFHcHI0NHRNeDhPeUJ4VTRWdnJYblEv?=
 =?utf-8?B?Qk1Xa1RwUnpPaFhkaW5Qc3VDNEZqNHlOOWpWRzhXUnJuRGVtSE9GZ2JYTHY3?=
 =?utf-8?B?YWE4U2dzUEVpNDkrbFNDbVFsSnd5R1JCQ1l5YUd5dzRtVUt6TUV2TXpNUVZ5?=
 =?utf-8?B?N2RhMVRPQnQ2eUtLV3NHQ29uSEpnYTkxK0RJaThxMHNEaHdOREhNWWkxT1pu?=
 =?utf-8?B?a1B4SURuNyttYmpybGQvdWUxdmpIaVExeTcyejdFSUE2eFRoV1g1U0U0U29D?=
 =?utf-8?B?RnJEN0oyamZrMFRyOGVCMFh1K2FCc3JYK2tCdjNicHR5dVJNQlJ2cFBBU2M0?=
 =?utf-8?B?Tjd2MlczQk1NNXJDOG1DZVNCN0pxYlcyeG1EU1F4Zk5iK1pXRHNhTENiQWRh?=
 =?utf-8?B?ZkR0ZEV2cHRXbXA4UzZEbTZRUTZVZDd5YUZnYVA3eFhxKzE4S0hNRHEzWUo2?=
 =?utf-8?B?ZnpTMVZZeUNNcXdPMDJ0WnZ0anRyZ0w2azJjd3N3LzhGaG5MUEt0M2M5UTQw?=
 =?utf-8?B?SG4vSTNrTFNHMjhIdDVRZngreU5vOXk5NXZQclc0VC9uRFplMnZRdm5SN3hm?=
 =?utf-8?B?ZjdFOG5MZE4vZEltdlR5MXJNUTZralYxVjJpWHovd3kyeE03eUVXeWgrSDVz?=
 =?utf-8?B?VCtxQmduRnRlWFlUWi9pU09PS0UydURVcVBHY1R3dGtmT2hEYko2MDFJbXFl?=
 =?utf-8?B?aXlkbTVCTG14RFBCa3pWekVxRGsxeFlHZ3FqemthMXZBU2h2MFlsTWlZbkwx?=
 =?utf-8?B?dER1eWRMY2MrU1d4ZTAwM3pTYXRabUJsRDRPbHo4U2hnejlZU2h5d1FuYVB3?=
 =?utf-8?B?ZUJhTk5mUEdkeDF2ajdqak1RdVk5QVUvM2wveGxuYzlneE5JaktldTBCeTUv?=
 =?utf-8?B?LzhpeWx2MVZneFZFRHd2dzlrcFUxWks5bXBCaC9EcjNYVi9XMW9kTVgwN1BF?=
 =?utf-8?Q?Tn9t9uZxWov6dgIhk1fgIkL/CAzQ4WIbWpLeOSL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad3f66d-37fb-4038-8948-08d936ced611
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 05:13:43.1412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OeKn3JyRawSSdXgDOoq/CtwVYEaqefOCSIju6WHGxWfrL7MyUg5advlprCzd2n2t/TTcYH2nSYTQ3gMWdroa1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1550
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVuZSA5LCAyMDIxIDU6MjggUE0NCj4gDQo+IFdoZW4NCj4gIC0gZmx1c2hlcyAoc3VwcG9z
ZWRseSBub3QgcG9zc2libGUgYW55bW9yZSBhZnRlciBYU0EtMzczKSwNCj4gIC0gc2Vjb25kYXJ5
IG1hcHBpbmdzIGZvciBsZWdhY3kgUENJIGRldmljZXMgYmVoaW5kIGJyaWRnZXMsDQo+ICAtIHNl
Y29uZGFyeSBtYXBwaW5ncyBmb3IgY2hpcHNldCBxdWlya3MsIG9yDQo+ICAtIGZpbmRfdXBzdHJl
YW1fYnJpZGdlKCkgaW52b2NhdGlvbnMNCj4gZmFpbCwgdGhlIHN1Y2Nlc3NmdWxseSBlc3RhYmxp
c2hlZCBkZXZpY2UgbWFwcGluZ3Mgc2hvdWxkIG5vdCBiZSBsZWZ0DQo+IGFyb3VuZC4NCj4gDQo+
IEZ1cnRoZXIsIHdoZW4gKHBhcnRzIG9mKSB1bm1hcHBpbmcgZmFpbCwgc2ltcGx5IHJldHVybmlu
ZyBhbiBlcnJvciBpcw0KPiB0eXBpY2FsbHkgbm90IGVub3VnaC4gQ3Jhc2ggdGhlIGRvbWFpbiBp
bnN0ZWFkIGluIHN1Y2ggY2FzZXMsIGFycmFuZ2luZw0KPiBmb3IgZG9tYWluIGNsZWFudXAgdG8g
Y29udGludWUgaW4gYSBiZXN0IGVmZm9ydCBtYW5uZXIgZGVzcGl0ZSBzdWNoDQo+IGZhaWx1cmVz
Lg0KPiANCj4gRmluYWxseSBtYWtlIGRvbWFpbl9jb250ZXh0X3VubWFwKCkncyBlcnJvciBiZWhh
dmlvciBjb25zaXN0ZW50IGluIHRoZQ0KPiBsZWdhY3kgUENJIGRldmljZSBjYXNlOiBEb24ndCBi
YWlsIGZyb20gdGhlIGZ1bmN0aW9uIGluIG9uZSBzcGVjaWFsDQo+IGNhc2UsIGJ1dCBhbHdheXMg
anVzdCBleGl0IHRoZSBzd2l0Y2ggc3RhdGVtZW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50
IDxwYXVsQHhlbi5vcmc+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11
LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gQEAgLTE0
NDIsOSArMTQ0MiwxNSBAQCBpbnQgZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoDQo+ICAgICAg
aWYgKCAhc2VnICYmICFyYyApDQo+ICAgICAgICAgIHJjID0gbWVfd2lmaV9xdWlyayhkb21haW4s
IGJ1cywgZGV2Zm4sIE1BUF9NRV9QSEFOVE9NX0ZVTkMpOw0KPiANCj4gKyAgICBpZiAoIHJjICkN
Cj4gKyAgICAgICAgZG9tYWluX2NvbnRleHRfdW5tYXBfb25lKGRvbWFpbiwgaW9tbXUsIGJ1cywg
ZGV2Zm4pOw0KPiArDQo+ICAgICAgcmV0dXJuIHJjOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyBpbnQg
ZG9tYWluX2NvbnRleHRfdW5tYXAoc3RydWN0IGRvbWFpbiAqZCwgdWludDhfdCBkZXZmbiwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0K
PiArDQo+ICBzdGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X21hcHBpbmcoc3RydWN0IGRvbWFpbiAq
ZG9tYWluLCB1OCBkZXZmbiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gIHsNCj4gQEAgLTE1MDUsMTYgKzE1MTEsMjEgQEAgc3Rh
dGljIGludCBkb21haW5fY29udGV4dF9tYXBwaW5nKHN0cnVjdA0KPiAgICAgICAgICBpZiAoIHJl
dCApDQo+ICAgICAgICAgICAgICBicmVhazsNCj4gDQo+IC0gICAgICAgIGlmICggZmluZF91cHN0
cmVhbV9icmlkZ2Uoc2VnLCAmYnVzLCAmZGV2Zm4sICZzZWNidXMpIDwgMSApDQo+IC0gICAgICAg
ICAgICBicmVhazsNCj4gKyAgICAgICAgaWYgKCAocmV0ID0gZmluZF91cHN0cmVhbV9icmlkZ2Uo
c2VnLCAmYnVzLCAmZGV2Zm4sICZzZWNidXMpKSA8IDEgKQ0KPiArICAgICAgICB7DQo+ICsgICAg
ICAgICAgICBpZiAoICFyZXQgKQ0KPiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPiArICAgICAg
ICAgICAgcmV0ID0gLUVOWElPOw0KPiArICAgICAgICB9DQo+IA0KPiAgICAgICAgICAvKg0KPiAg
ICAgICAgICAgKiBNYXBwaW5nIGEgYnJpZGdlIHNob3VsZCwgaWYgYW55dGhpbmcsIHBhc3MgdGhl
IHN0cnVjdCBwY2lfZGV2IG9mDQo+ICAgICAgICAgICAqIHRoYXQgYnJpZGdlLiBTaW5jZSBicmlk
Z2VzIGRvbid0IG5vcm1hbGx5IGdldCBhc3NpZ25lZCB0byBndWVzdHMsDQo+ICAgICAgICAgICAq
IHRoZWlyIG93bmVyIHdvdWxkIGJlIHRoZSB3cm9uZyBvbmUuIFBhc3MgTlVMTCBpbnN0ZWFkLg0K
PiAgICAgICAgICAgKi8NCj4gLSAgICAgICAgcmV0ID0gZG9tYWluX2NvbnRleHRfbWFwcGluZ19v
bmUoZG9tYWluLCBkcmhkLT5pb21tdSwgYnVzLCBkZXZmbiwNCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7DQo+ICsgICAgICAgIGlmICggcmV0ID49IDAg
KQ0KPiArICAgICAgICAgICAgcmV0ID0gZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoZG9tYWlu
LCBkcmhkLT5pb21tdSwgYnVzLA0KPiBkZXZmbiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIE5VTEwpOw0KPiANCj4gICAgICAgICAgLyoNCj4gICAgICAg
ICAgICogRGV2aWNlcyBiZWhpbmQgUENJZS10by1QQ0kvUENJeCBicmlkZ2UgbWF5IGdlbmVyYXRl
IGRpZmZlcmVudA0KPiBAQCAtMTUzMSw2ICsxNTQyLDkgQEAgc3RhdGljIGludCBkb21haW5fY29u
dGV4dF9tYXBwaW5nKHN0cnVjdA0KPiAgICAgICAgICAgICAgcmV0ID0gZG9tYWluX2NvbnRleHRf
bWFwcGluZ19vbmUoZG9tYWluLCBkcmhkLT5pb21tdSwgc2VjYnVzLA0KPiAwLA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7DQo+IA0KPiArICAg
ICAgICBpZiAoIHJldCApDQo+ICsgICAgICAgICAgICBkb21haW5fY29udGV4dF91bm1hcChkb21h
aW4sIGRldmZuLCBwZGV2KTsNCj4gKw0KPiAgICAgICAgICBicmVhazsNCj4gDQo+ICAgICAgZGVm
YXVsdDoNCj4gQEAgLTE2MDksNiArMTYyMywxOSBAQCBpbnQgZG9tYWluX2NvbnRleHRfdW5tYXBf
b25lKA0KPiAgICAgIGlmICggIWlvbW11LT5kcmhkLT5zZWdtZW50ICYmICFyYyApDQo+ICAgICAg
ICAgIHJjID0gbWVfd2lmaV9xdWlyayhkb21haW4sIGJ1cywgZGV2Zm4sIFVOTUFQX01FX1BIQU5U
T01fRlVOQyk7DQo+IA0KPiArICAgIGlmICggcmMgJiYgIWlzX2hhcmR3YXJlX2RvbWFpbihkb21h
aW4pICYmIGRvbWFpbiAhPSBkb21faW8gKQ0KPiArICAgIHsNCj4gKyAgICAgICAgaWYgKCBkb21h
aW4tPmlzX2R5aW5nICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlIgIiVwZDogZXJyb3IgJWQNCj4gdW5tYXBwaW5nICUwNHg6JTAyeDolMDJ4LiV1XG4iLA0K
PiArICAgICAgICAgICAgICAgICAgIGRvbWFpbiwgcmMsIGlvbW11LT5kcmhkLT5zZWdtZW50LCBi
dXMsDQo+ICsgICAgICAgICAgICAgICAgICAgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZm
bikpOw0KPiArICAgICAgICAgICAgcmMgPSAwOyAvKiBNYWtlIHVwcGVyIGxheWVycyBjb250aW51
ZSBpbiBhIGJlc3QgZWZmb3J0IG1hbm5lci4gKi8NCj4gKyAgICAgICAgfQ0KPiArICAgICAgICBl
bHNlDQo+ICsgICAgICAgICAgICBkb21haW5fY3Jhc2goZG9tYWluKTsNCj4gKyAgICB9DQo+ICsN
Cj4gICAgICByZXR1cm4gcmM7DQo+ICB9DQo+IA0KPiBAQCAtMTY2MSwxNyArMTY4OCwyOSBAQCBz
dGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X3VubWFwKHN0cnVjdCBkDQo+IA0KPiAgICAgICAgICB0
bXBfYnVzID0gYnVzOw0KPiAgICAgICAgICB0bXBfZGV2Zm4gPSBkZXZmbjsNCj4gLSAgICAgICAg
aWYgKCBmaW5kX3Vwc3RyZWFtX2JyaWRnZShzZWcsICZ0bXBfYnVzLCAmdG1wX2RldmZuLCAmc2Vj
YnVzKSA8IDEgKQ0KPiArICAgICAgICBpZiAoIChyZXQgPSBmaW5kX3Vwc3RyZWFtX2JyaWRnZShz
ZWcsICZ0bXBfYnVzLCAmdG1wX2RldmZuLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmc2VjYnVzKSkgPCAxICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAg
ICAgaWYgKCByZXQgKQ0KPiArICAgICAgICAgICAgew0KPiArICAgICAgICAgICAgICAgIHJldCA9
IC1FTlhJTzsNCj4gKyAgICAgICAgICAgICAgICBpZiAoICFkb21haW4tPmlzX2R5aW5nICYmDQo+
ICsgICAgICAgICAgICAgICAgICAgICAhaXNfaGFyZHdhcmVfZG9tYWluKGRvbWFpbikgJiYgZG9t
YWluICE9IGRvbV9pbyApDQo+ICsgICAgICAgICAgICAgICAgew0KPiArICAgICAgICAgICAgICAg
ICAgICBkb21haW5fY3Jhc2goZG9tYWluKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgLyogTWFr
ZSB1cHBlciBsYXllcnMgY29udGludWUgaW4gYSBiZXN0IGVmZm9ydCBtYW5uZXIuICovDQo+ICsg
ICAgICAgICAgICAgICAgICAgIHJldCA9IDA7DQo+ICsgICAgICAgICAgICAgICAgfQ0KPiArICAg
ICAgICAgICAgfQ0KPiAgICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIH0NCj4gDQo+ICAg
ICAgICAgIC8qIFBDSWUgdG8gUENJL1BDSXggYnJpZGdlICovDQo+ICAgICAgICAgIGlmICggcGRl
dl90eXBlKHNlZywgdG1wX2J1cywgdG1wX2RldmZuKSA9PQ0KPiBERVZfVFlQRV9QQ0llMlBDSV9C
UklER0UgKQ0KPiAgICAgICAgICB7DQo+ICAgICAgICAgICAgICByZXQgPSBkb21haW5fY29udGV4
dF91bm1hcF9vbmUoZG9tYWluLCBpb21tdSwgdG1wX2J1cywNCj4gdG1wX2RldmZuKTsNCj4gLSAg
ICAgICAgICAgIGlmICggcmV0ICkNCj4gLSAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiAt
DQo+IC0gICAgICAgICAgICByZXQgPSBkb21haW5fY29udGV4dF91bm1hcF9vbmUoZG9tYWluLCBp
b21tdSwgc2VjYnVzLCAwKTsNCj4gKyAgICAgICAgICAgIGlmICggIXJldCApDQo+ICsgICAgICAg
ICAgICAgICAgcmV0ID0gZG9tYWluX2NvbnRleHRfdW5tYXBfb25lKGRvbWFpbiwgaW9tbXUsIHNl
Y2J1cywgMCk7DQo+ICAgICAgICAgIH0NCj4gICAgICAgICAgZWxzZSAvKiBMZWdhY3kgUENJIGJy
aWRnZSAqLw0KPiAgICAgICAgICAgICAgcmV0ID0gZG9tYWluX2NvbnRleHRfdW5tYXBfb25lKGRv
bWFpbiwgaW9tbXUsIHRtcF9idXMsDQo+IHRtcF9kZXZmbik7DQoNCg==

