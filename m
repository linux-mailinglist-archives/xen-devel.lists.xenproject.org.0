Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D12C7F80
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 09:05:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40690.73619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjeBQ-0002Bm-5G; Mon, 30 Nov 2020 08:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40690.73619; Mon, 30 Nov 2020 08:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjeBQ-0002BN-1i; Mon, 30 Nov 2020 08:05:16 +0000
Received: by outflank-mailman (input) for mailman id 40690;
 Mon, 30 Nov 2020 08:05:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+J0=FE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kjeBO-0002BI-7y
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 08:05:14 +0000
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1250057f-bea4-457e-b242-72842bc16dd7;
 Mon, 30 Nov 2020 08:05:11 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 00:05:08 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2020 00:05:07 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 00:05:07 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 00:05:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 00:05:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 00:05:02 -0800
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1725.namprd11.prod.outlook.com (2603:10b6:300:2a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 08:05:00 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 08:05:00 +0000
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
X-Inumbo-ID: 1250057f-bea4-457e-b242-72842bc16dd7
IronPort-SDR: zwIGe8/fX9a0M8tNyoPjkyJEN3yVL1qHl2WTfnXgpiZTINDrg6K0HhX96BNsFGyaDdXspJMVgl
 dLduDVTj6JXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="234202294"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="234202294"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
IronPort-SDR: 0uvb9IOEpBYqk1ojjgpsZLhKIN8ww4jkZrKGXPIZUjrV3KVqtBkvRsrozRLIkgQUobJfj6UhhZ
 MDOQk4VWRKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="548997151"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTMZ1WUCfmm94ovKo5W2Qb3v4lvRYFsDWVWC2d0huDoYhQDEZeawfhCTC2a1qplm0YxroolK8+d40us2kO29NVeTCsHie45Ld8wXsVR/ff/TUBW2iARZNIiB3Y8EPi4iXlQH38LxiS/LjzGRjDjak9vGLaWHHAEWxSsSj0kwTdB6KE4zYrreTIjkePP0NN97aTgo/URjgwItTHRx+CVCIYqbMSbEYxIFIr75G8M0JnAKrsXouzCM5fGtibhK99W0atXk/7D3kLBblpLq+yqoigKIdBHv867/AOYOzGFqfxZRsYGMTUxtnC3sW8u32dAqfo//CcWf9oOsxi97bLuqow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSRI63inD66yhT2lieGsWekufNP7pjGEqdM9WiLQXJM=;
 b=QIVhH9WEOu/fbqytAtIVKc/BIDtu3mh5CQNKu1w/wh5LUZoskOgmE8jovhp7GNhVCpV1+v7EOuQ9ATqNqrppaw/BOGIGJe7kOZ95/ej3etlK/W9iMguPOtj2Dt/llXBxC8bL3gyYeA0NOdgcpsyDisTFqUUWfGzkqNxPY1V/s4ilzcBfRjeSWsAeGiPLCFdFZT8xgTU8uhkXv8jLsRcqAtwzHCoumhVGVb8KZQgLqZhs0wPjgRNjXmmoMvnInqG6Go44F7A4BA6KLqk04oFx++VEON9T1XNy/2JyqzdHIZcruN8lQUENrHqHhEynrjrK8gMp+XgfF4uFegGJsXanbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSRI63inD66yhT2lieGsWekufNP7pjGEqdM9WiLQXJM=;
 b=IqjElNq9+1QiKDsfYjBFiclqaf8719jZbVikcF8Fbxgv1RFWE+MtLXu/YL19pF2CTgktmpml1jxATWyO4gwUYymSYbxcrMyM6zJw5Mg5e5FoSyNIX29D9bS0gZ9Q++hsIO+FxECQoy5NpFvkE2cXhfgKoxJoF/+qiiIIerEDYFc=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4] IOMMU: make DMA containment of quarantined devices
 optional
Thread-Topic: [PATCH v4] IOMMU: make DMA containment of quarantined devices
 optional
Thread-Index: AQHWxNzT5+yOOE/aLkyGjNnv/rbw96ngL6OggAAdYYCAAAakUA==
Date: Mon, 30 Nov 2020 08:05:00 +0000
Message-ID: <MWHPR11MB1645ED0ED102DE2903B302878CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <c78e09fa-606c-c6c4-e9db-b57cb50ee5e2@suse.com>
 <MWHPR11MB1645257FCF6DF38A68310ABF8CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
 <9ad2b898-16d8-9f80-b6ef-8f618419d369@suse.com>
In-Reply-To: <9ad2b898-16d8-9f80-b6ef-8f618419d369@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae603bfe-c8d8-43a9-ae00-08d89506a2d2
x-ms-traffictypediagnostic: MWHPR11MB1725:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR11MB1725BB402FF34C72A9DB03C38CF50@MWHPR11MB1725.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4/zGdOGD2vvGjH0gls1Fe8NJiFh/hIWlb/YfBfr2KKRwFYu1eaNIVHgweip6WgIMzG1Z1CgMOAJkABHssbZfLjCK14NDXlRj6++nYPEa9JlPhkd7IVccEEpTDyi2hcJeK5wc5+OtC7xpP84pZxJCwylOcD/7YmuZc7hkCwZsXAZPi93s58MHFZZPq/7oq+vKLXtEjbGoUJxzWnmj430fPMbTCYWhkIDKuZTPhRww/SllAS0xhLZn8z/OG1DUJR9kMhRVn2pxbg04OmrNf8ZeF4ynCzOYzcVsquR5yZQXtm6n9WItC8uPnQ0QyUnu0uW9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1645.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(55016002)(9686003)(76116006)(64756008)(71200400001)(83380400001)(53546011)(478600001)(4326008)(6506007)(7696005)(186003)(26005)(52536014)(6916009)(66476007)(316002)(8676002)(66946007)(66556008)(66446008)(33656002)(5660300002)(54906003)(86362001)(8936002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZkduY2VCQ2w2RkdxcUIxa0FST3ZvVXhqYVBxck1DenBHaGhMMHB1b1RiaW5y?=
 =?utf-8?B?bUVOQXZvWllsbDRCdjRKR2toQi9lb1VhdFJMb3IxOG1rSWZTdlhpanhuUXhY?=
 =?utf-8?B?Ukt3YzI2d2M5VWxBMkhNN29qSkcvYS9GeDR0YzhBRUY2c0hUTjlZUXgwdDJh?=
 =?utf-8?B?bnRpU0ZWOWFzNDEzTEFyUzV1cnJaeXBYS1RuTWlIaXdkTXJXeS9BRGpzK3FB?=
 =?utf-8?B?Tm02clpJTnpBTEZJd3YrdVFmYlVRczFYd0EyemVONWNJbFpHelQ4VG56SW10?=
 =?utf-8?B?MGdUTEovRXBXS25jWkhYK09ZcFpRMzBuMkRXVXF2ZWV0R2lVM1RxcXB2VVlq?=
 =?utf-8?B?bnlsQ3l5cTBSRlJxOGp1N3lmWVlrR3dkc3dvRys2NURDUUVvTi9hdXhwdm55?=
 =?utf-8?B?MGdOYjlXc0dqZ2E5c0FiYU5oSnBuMmFkcUd0dkZsM2cvRzVncldPdUVleGw2?=
 =?utf-8?B?c1Vad2poWWpJUWJ1cVR0NXNOaXEzU1FnM2lucXlCZGhBK1lIY2Q2ODNxVExv?=
 =?utf-8?B?NVFINndZUUowWUJpUFo4elk5UmxjaVhwTzZYb3F3aFEwU3FQK3BhZEZtUURp?=
 =?utf-8?B?V1pPR1pUQ1ZPdGxZWloyRW10bWpTbU10dW1PdmZpVG1lQk5zWlh2U0pUaWdu?=
 =?utf-8?B?M1ZBekl3SHhKOGpEUzgwdjdIZWt0ampKTm5SRmhBdDViVnFUSkZHTElnK1l3?=
 =?utf-8?B?MlI2dzZKYVJvSTBVK0ZUL2t5U0xoSE92Wkh3ODBOc2JUR0pCa0E2SWNQaEYw?=
 =?utf-8?B?cHFReGNzVUJiN0FTL2VhbTQ4Qm1VZjJQOVZ3Zm4xYUlxZHdIV0FxbFpCMEdU?=
 =?utf-8?B?Ry9Ncmh2WE45MkJLV0pvYnl1T2FlWURWRmRrTmlWdlRINDZJSWEvMFJUWUVN?=
 =?utf-8?B?QWs4Kzl6elVPd3g3NTFQb1F5ay94THN0UkVCMHExUldiTitxMVFVYk1OY1hN?=
 =?utf-8?B?VEhFTEpXcVE1bGFRYnNiSVRnaXZXNWpnWG50YWQ0dkpSTm9GSThNc1lVVEtp?=
 =?utf-8?B?Y082L2JaSWxPKzB5NU5Fc3RlQUpUcUUzdU5ZRnpNL05lQXFJeWZBVnhLYi80?=
 =?utf-8?B?M0l5WUMrbHIwSjdFeVRMT0xndUZtS3VSemJoZXNyUG15UWxnVGFIK2hSSURp?=
 =?utf-8?B?VFFzc2o5OGtzV1NEWXJzdkhxbTd4SWV4dTVvc0lJelE3eG5OTGpXVERsanpL?=
 =?utf-8?B?N3B3ZHBac3dlemJ4Q1VEZ0twbGlDZUJCYVdCdmp5ZlhJRVNPT2hIeG9YYzdY?=
 =?utf-8?B?NUdkcjlBM3pDVHNmZ3JWd3NUZHVjMWJlVmRIY0tPS1NtTVI5bCtZUWxsUjVJ?=
 =?utf-8?Q?39VxkwNa2BKfeW9pEU2iL9urOUDSB943Du?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae603bfe-c8d8-43a9-ae00-08d89506a2d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 08:05:00.5734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BowZyX/kkJ43bhe9MEG9fnmQksBiyle50Fehz5LHg526SjleWYkoyXfedudsSt8TAcen7hUABFTWqrH7bElw0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1725
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
Tm92ZW1iZXIgMzAsIDIwMjAgMzozNSBQTQ0KPiANCj4gT24gMzAuMTEuMjAyMCAwNzoxMywgVGlh
biwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4gU2VudDogU2F0dXJkYXksIE5vdmVtYmVyIDI4LCAyMDIwIDEyOjQ2IEFNDQo+ID4+
DQo+ID4+IEBAIC0xMzE2LDExICsxMzE2LDMyIEBAIGJvb2xlYW4gKGUuZy4gYGlvbW11PW5vYCkg
Y2FuIG92ZXJyaWRlIHQNCj4gPj4gICAgICB3aWxsIHByZXZlbnQgWGVuIGZyb20gYm9vdGluZyBp
ZiBJT01NVXMgYXJlbid0IGRpc2NvdmVyZWQgYW5kDQo+IGVuYWJsZWQNCj4gPj4gICAgICBzdWNj
ZXNzZnVsbHkuDQo+ID4+DQo+ID4+IC0qICAgVGhlIGBxdWFyYW50aW5lYCBib29sZWFuIGNhbiBi
ZSB1c2VkIHRvIGNvbnRyb2wgWGVuJ3MgYmVoYXZpb3Igd2hlbg0KPiA+PiAtICAgIGRlLWFzc2ln
bmluZyBkZXZpY2VzIGZyb20gZ3Vlc3RzLiAgSWYgZW5hYmxlZCAodGhlIGRlZmF1bHQpLCBYZW4g
YWx3YXlzDQo+ID4+ICsqICAgVGhlIGBxdWFyYW50aW5lYCBvcHRpb24gY2FuIGJlIHVzZWQgdG8g
Y29udHJvbCBYZW4ncyBiZWhhdmlvciB3aGVuDQo+ID4+ICsgICAgZGUtYXNzaWduaW5nIGRldmlj
ZXMgZnJvbSBndWVzdHMuDQo+ID4+ICsNCj4gPj4gKyAgICBXaGVuIGEgUENJIGRldmljZSBpcyBh
c3NpZ25lZCB0byBhbiB1bnRydXN0ZWQgZG9tYWluLCBpdCBpcyBwb3NzaWJsZQ0KPiA+PiArICAg
IGZvciB0aGF0IGRvbWFpbiB0byBwcm9ncmFtIHRoZSBkZXZpY2UgdG8gRE1BIHRvIGFuIGFyYml0
cmFyeSBhZGRyZXNzLg0KPiA+PiArICAgIFRoZSBJT01NVSBpcyB1c2VkIHRvIHByb3RlY3QgdGhl
IGhvc3QgZnJvbSBtYWxpY2lvdXMgRE1BIGJ5IG1ha2luZw0KPiA+PiArICAgIHN1cmUgdGhhdCB0
aGUgZGV2aWNlIGFkZHJlc3NlcyBjYW4gb25seSB0YXJnZXQgbWVtb3J5IGFzc2lnbmVkIHRvIHRo
ZQ0KPiA+PiArICAgIGd1ZXN0LiAgSG93ZXZlciwgd2hlbiB0aGUgZ3Vlc3QgZG9tYWluIGlzIHRv
cm4gZG93biwgYXNzaWduaW5nIHRoZQ0KPiA+PiArICAgIGRldmljZSBiYWNrIHRvIHRoZSBoYXJk
d2FyZSBkb21haW4gd291bGQgYWxsb3cgYW55IGluLWZsaWdodCBETUEgdG8NCj4gPj4gKyAgICBw
b3RlbnRpYWxseSB0YXJnZXQgY3JpdGljYWwgaG9zdCBkYXRhLiAgVG8gYXZvaWQgdGhpcywgcXVh
cmFudGluaW5nDQo+ID4+ICsgICAgc2hvdWxkIGJlIGVuYWJsZWQuICBRdWFyYW50aW5pbmcgY2Fu
IGJlIGRvbmUgaW4gdHdvIHdheXM6IEluIGl0cyBiYXNpYw0KPiA+PiArICAgIGZvcm0sIGFsbCBp
bi1mbGlnaHQgRE1BIHdpbGwgc2ltcGx5IGJlIGZvcmNlZCB0byBlbmNvdW50ZXIgSU9NTVUNCj4g
Pj4gKyAgICBmYXVsdHMuICBTaW5jZSB0aGVyZSBhcmUgc3lzdGVtcyB3aGVyZSBkb2luZyBzbyBj
YW4gY2F1c2UgaG9zdCBsb2NrdXAsDQo+ID4+ICsgICAgYW4gYWx0ZXJuYXRpdmUgZm9ybSBpcyBh
dmFpbGFibGUgd2hlcmUgd3JpdGVzIHRvIG1lbW9yeSB3aWxsIGJlIG1hZGUNCj4gPj4gKyAgICBm
YXVsdCwgYnV0IHJlYWRzIHdpbGwgYmUgZGlyZWN0ZWQgdG8gYSBkdW1teSBwYWdlLiAgVGhlIGlt
cGxpY2F0aW9uDQo+ID4+ICsgICAgaGVyZSBpcyB0aGF0IHN1Y2ggcmVhZHMgd2lsbCBnbyB1bm5v
dGljZWQsIGkuZS4gYW4gYWRtaW4gbWF5IG5vdA0KPiA+PiArICAgIGJlY29tZSBhd2FyZSBvZiB0
aGUgdW5kZXJseWluZyBwcm9ibGVtLg0KPiA+PiArDQo+ID4+ICsgICAgVGhlcmVmb3JlLCBpZiB0
aGlzIG9wdGlvbiBpcyBzZXQgdG8gdHJ1ZSAodGhlIGRlZmF1bHQpLCBYZW4gYWx3YXlzDQo+ID4+
ICAgICAgcXVhcmFudGluZXMgc3VjaCBkZXZpY2VzOyB0aGV5IG11c3QgYmUgZXhwbGljaXRseSBh
c3NpZ25lZCBiYWNrIHRvDQo+IERvbTANCj4gPj4gLSAgICBiZWZvcmUgdGhleSBjYW4gYmUgdXNl
ZCB0aGVyZSBhZ2Fpbi4gIElmIGRpc2FibGVkLCBYZW4gd2lsbCBvbmx5DQo+ID4+IC0gICAgcXVh
cmFudGluZSBkZXZpY2VzIHRoZSB0b29sc3RhY2sgaGFzcyBhcnJhbmdlZCBmb3IgZ2V0dGluZyBx
dWFyYW50aW5lZC4NCj4gPj4gKyAgICBiZWZvcmUgdGhleSBjYW4gYmUgdXNlZCB0aGVyZSBhZ2Fp
bi4gIElmIHNldCB0byAic2NyYXRjaC1wYWdlIiwgc3RpbGwNCj4gPj4gKyAgICBhY3RpdmUgRE1B
IHJlYWRzIHdpbGwgYWRkaXRpb25hbGx5IGJlIGRpcmVjdGVkIHRvIGEgInNjcmF0Y2giIHBhZ2Uu
ICBJZg0KPiA+PiArICAgIHNldCB0byBmYWxzZSwgWGVuIHdpbGwgb25seSBxdWFyYW50aW5lIGRl
dmljZXMgdGhlIHRvb2xzdGFjayBoYXMNCj4gYXJyYW5nZWQNCj4gPj4gKyAgICBmb3IgZ2V0dGlu
ZyBxdWFyYW50aW5lZC4NCj4gPg0KPiA+IEhlcmUgbGV0J3MgYmUgY2xlYXIgYWJvdXQgdGhlIHF1
YXJhbnRpbmUgcG9saWN5IHdoZW4gdGhlIHF1YXJhbnRpbmUNCj4gPiBkZXZpY2VzIGFyZSBhcnJh
bmdlZCBieSB0b29sc3RhY2suIEJhc2VkIG9uIHRoaXMgcGF0Y2ggaXQgaXMgdGhlICdiYXNpYycN
Cj4gPiBmb3JtIGkuZS4gYWx3YXlzIGdldHRpbmcgSU9NTVUgZmF1bHRzIGZvciBzdWNoIGRldmlj
ZXMuDQo+IA0KPiBXZWxsLCB0aGUgcG9saWN5IGlzIGFsd2F5cyBhcyBjaG9zZW4gdmlhIGNvbW1h
bmQgbGluZS4gVGhlcmVmb3JlIGRvDQo+IHlvdSBwZXJoYXBzIG1lcmVseSBtZWFuIHRoZSBkZWZh
dWx0IG1vZGUgdG8gYmUgc3BlbGxlZCBvdXQ/IFRoaXMgaXMNCj4gYWxyZWFkeSB0aGUgY2FzZSBh
dCB0aGUgYmVnaW5uaW5nIG9mIHRoZSAybmQgcGFyYWdyYXBoLg0KDQpXaGVuIEkgcmVhZCBhYm92
ZSBwYXJhZ3JhcGhzLCBpdCdzIGNsZWFyIGFib3V0IHRoZSBlbmFibGVkIGNhc2Ugd2hlcmUNCnR3
byBxdWFyYW50aW5lIGZvcm1zIGFyZSBhdmFpbGFibGUgKGJhc2ljIHZzLiBzY3JhdGNoLXBhZ2Up
IGFuZCBob3cgdG8NCmNob29zZSB0aGVtLCBidXQgaXQncyBub3QgY3J5c3RhbCBjbGVhciBhYm91
dCB0aGUgZGlzYWJsZWQgY2FzZSB3aGljaCANCmZvcm0gaXMgYXNzdW1lZCBmb3IgdG9vbHN0YWNr
LW1hbmFnZWQgZGV2aWNlcywgZnJvbSBhbiB1c2VyIHAuby52Lg0KDQpUaGFua3MsDQpLZXZpbg0K

