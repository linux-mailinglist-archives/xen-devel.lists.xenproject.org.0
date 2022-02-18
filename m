Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800924BB194
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 06:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275132.470859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKw2W-000287-GE; Fri, 18 Feb 2022 05:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275132.470859; Fri, 18 Feb 2022 05:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKw2W-00025E-DE; Fri, 18 Feb 2022 05:42:44 +0000
Received: by outflank-mailman (input) for mailman id 275132;
 Fri, 18 Feb 2022 05:42:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkm2=TB=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nKw2U-000258-KN
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 05:42:42 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955af088-907d-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 06:42:40 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 21:42:38 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 17 Feb 2022 21:42:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:42:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:42:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 21:42:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 21:42:37 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MWHPR1101MB2143.namprd11.prod.outlook.com (2603:10b6:301:4f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 05:42:35 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 05:42:35 +0000
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
X-Inumbo-ID: 955af088-907d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645162960; x=1676698960;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BcaSNAGT+HCBzd2+gHk1kGFKyHc9ILmmBlGHmNwnId4=;
  b=fswqw28bzkQ8y4GT0O/k5Iz5ISvYRZv1N/Vofk+nfZtkR7py4euhBKQt
   zcQ3t+N666GhWaVedjAdqbtdfympyhqIJneDffhC7+aRpH6tZsHZI0HiE
   RucmgyKyx0yFmD/WCxEtYkQU3VUUiHrZDRQ7H7X0EfOQEizoh8ogfapFy
   hXgqbb3UKU5P6PQFKG4GGj3MabbqmK7Zyz0CKVU1RNCuehyIiOVcKL//Z
   T+ZPf0fmD34gZisTrGiW7m6PIxQgO92QdoLnS0P5ib2pOzqiL17q1NIOe
   obhh+nu9x37s1iIls6WWlleeXh39rlZ59CIBRP8amspWeSDe5gzHd3dB7
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337501223"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="337501223"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="546123095"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qk3yl5nh7U2Rh9aPI+7JR2jCvLPzIHOHHNZh5usCpa42W/n3lrWpvaOKNET2XV3wXzhRw9gM+DVNdWYNoR4kiuiOGupX3/aGmwlaMyjovokaMN5qznzJJaljelrwxVB3fk3EDT3m94aLv9DckB5OgPlx1Py2FLTrJsxug7dZdCNA6F6vz1BMIrTO/0IlW8UcZ8PAl46UqZCtIAnCswu26lv3OIJ7zdeYgiL0ha4cFjFjofAJQyull/TKMjnyRX9X6+Vu5+LR8ohzRRjP+zTpZy/FIIhPwjlksjGWxbA9mAWTRDNHNRtSj/Tzq+PBBV95Trqg5XXGpRJ5xLAtQBkBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcaSNAGT+HCBzd2+gHk1kGFKyHc9ILmmBlGHmNwnId4=;
 b=H0oIuNDhoMZcj1KaxsSD0IpAapyQe4EUVjFZxbC6NwSy+vaSjF3RWEccFT9lKY1wERggmS16fBeCJ+lf6fhKS5kYe25mqjZ5pJewa07K9U+epkFFtjRTVeuQqCjJol8tBv80nC/pCCGCe59/2Xc4NpiCHcKblsv3m5Mp1o6t1dKxKuxg9zVpPDCqpuJm76avXdPH7GDVggj+wxQ2GKFtpzaywCDIR5sS4b6cfQYekxgzvBDeJvbsByo7tiQWyB+LU6nrqPQQEBta2tYsLtUagnirZCKo4Djaaghqk5VSW1bKh7dXzMJUdCGzXy6N2q45pb4YAyWuFvnN3RSe6W65Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 4/4] IOMMU/PCI: propagate get_device_group_id() failure
Thread-Topic: [PATCH v2 4/4] IOMMU/PCI: propagate get_device_group_id()
 failure
Thread-Index: AQHYE40qNspWQzZvQEWmCw0ZHMO91KyY7RMQ
Date: Fri, 18 Feb 2022 05:42:34 +0000
Message-ID: <BN9PR11MB527660ACF4439570E4F5C25E8C379@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
 <998f6587-d64a-7336-a44b-d05ca486b4bc@suse.com>
In-Reply-To: <998f6587-d64a-7336-a44b-d05ca486b4bc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c302d991-5ad8-4e68-7c1c-08d9f2a1770d
x-ms-traffictypediagnostic: MWHPR1101MB2143:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB2143DCFB090DBDE4793C4AD18C379@MWHPR1101MB2143.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nUY1Pwpx/Bf1G6Wt0RjeMjc5ndw5jr2znKgXYXHKOXsFXyYUPu5i2JAYT3lKvcv6mZ+RtQVavrO4zHp823yo0qHyJwtN4twrbLj/iVSrRaQStRYFL3dDQCkczgJwNmGzcAN6HpJ0RJChlfpgYN6de+X3JZ0dgt2+cHhStMz2SvHP0KugP4Cc8/sjY+22f9i0VH+h3SXd2XLiibMEV1s3FJgU/HT+Adyc62wbIf9M5tlL77eJUxnaUiTfIeLq34+7UgQJjBVJmxNYZ0TMWzDY22Cp1XzEZz5+QqibGMXDMWgdqZU2cA4bLgZaYVzApO4z6xHBmnsRjErDEyzZD/2Y57hhiiuKOH2IoAhrC7/qbeynlwT+qxLAWTeJp0PBMDgGSIyw8LV1dkFfDO4KAwuVjfFdsUh8WYFhrXh04GWrw2iAX1qf7nFz5K5CfM7Vf10oBow+jOTHBNx9IKAEpAy/JH7bqHezx5baala8tcTWsu8G3KhEuuQpEuk99lxcLs47QmAYgJawYCZ9Y+EOiihDVUaAcluJYwUe/4t9fV6Lz1iCXx42oYae8gCprrH2BQpADmDXe4JUkzqBaeC1FyhHJTpniI6IlthakAgrowO+rpTlIhLuJkMrK3DHF1dyJxSdrQLrmwtSQ1ab+4rR0r3UVD8tfRrhPbtHAG6ogU1Q7L6IYrs1dqU2qP9rtq8EO1RO1tdfnt7FQSkHcqYzpiEGwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66476007)(8676002)(55016003)(66946007)(64756008)(122000001)(316002)(110136005)(76116006)(66556008)(508600001)(4326008)(38070700005)(7696005)(66446008)(82960400001)(52536014)(86362001)(5660300002)(38100700002)(33656002)(9686003)(83380400001)(54906003)(6506007)(186003)(71200400001)(26005)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1dxZzMxeWtLWGNXNVpHNk1qbDMxcldLcWd5Y2QrMno3d1laM2VOSHhkZ0Vu?=
 =?utf-8?B?eEJlMHBHOWZZRkNuWmg0dUh0NzRyTTdFdjB4NlNTMERvb05UZWNackNoMS9k?=
 =?utf-8?B?MEF0b2t5WHlvS2lTVnVadnpBNW4rNXYwc0FqNEVxbXRIenRlK01DS210a0Rr?=
 =?utf-8?B?eVYzRTlPclIrNGJ3blROS1pUYUhGcmRBeWpYVkt1TUZZSGtQZFVoV1BrWEEy?=
 =?utf-8?B?VzVvTzdUbWhIdk85SmZ3UGZoSTVmbFpDYk8xU0hsY1lGL0ZGQ1dCMjFEZUF0?=
 =?utf-8?B?S0tjZkhTT1hLblptY1BhUWZ6MG1PUnFqTUNXWm5oSEFVSVROdXVzeFVXMEwx?=
 =?utf-8?B?YUc3U3RPQ1YzZEJuWVBhMzdjVXRKTDB3bUlHOUh6Q2h6THBRUDh3QW1jZUx3?=
 =?utf-8?B?MWlHaUk2TkYvSW8rMTZJSlAwNHJSMEhISWwwcnlpemZMSmxzTmhCdHlVVlcv?=
 =?utf-8?B?NXBkbURqd0ZxRUozOTU0V0pZYjZ3QkhTR3Z3UFh1Z24xRzZUK2VOSTFYaFhX?=
 =?utf-8?B?Z1Q4RDR4dUxQOGNKSEpOZEVxNzZJSXp2cFJlN3ZYcHdnN01jNVV3OXkyZitv?=
 =?utf-8?B?VTYwZTRJVnZLM1piYXhLZ0ZiZVppQXpwYTlXajZuSkVLRE5KbWdZUEdpcHor?=
 =?utf-8?B?RWpmazRRKzdHZDRBcEFuS2hnZ0paYmdYbWtmZFBONU13dTRYMnBTNEt6UUFp?=
 =?utf-8?B?b01VbU9WUlJ4MTVmUXFoMTFIK2laZ08yemtydTFoOUdqNjhQVWEyY1FXajE4?=
 =?utf-8?B?YTlkQVdnRW5VSk92YnJlUnVPYW92MlQ5ZUxuWWU1RGNxU0cyRys3SWFzdkJS?=
 =?utf-8?B?NGdlVi9DbHZVeFJDVFNLMm9DYmZJZXVKbG1xamRvTy9QMjNqTFc3b3A4VFhG?=
 =?utf-8?B?dmpmTGFOaERtWjFzMmN6emx4U2NHc1c4eXFVQXdrRlNHY2VZR2hrZmFRTm5s?=
 =?utf-8?B?VUlNejRKeDJtVW42MFJVSDVydmFSOXlIWGNzYW5Db2hxa3ZjNm1ZQmxSeEFD?=
 =?utf-8?B?dk1PZmgwYVpybHNoaTZiOUl3cVRaOVk5ZUJyVVhROVppOGFPOTd6bVhOc2tC?=
 =?utf-8?B?SVc2Ry9hUWRZbWc0NEViN0pZSm9kVDZJbGxNdVRnK3dIYWR6dGZsUmlweDA4?=
 =?utf-8?B?NXFVeUFtL2pybHRzbSs3NWZjNzNhc2NDVlNtSjNjUjhQT09VVUx1bzgzVksy?=
 =?utf-8?B?NDhMYWREVytFNGVFWjZzUVcvNWpsZE96YTliT1NyTzdQcWxYNlVnVm02MVQw?=
 =?utf-8?B?d21McnhaUGNLa3pCK1lxaE9YN3ozb3dTSC9qenA4S1lDUU5RVnp3dytJTTFD?=
 =?utf-8?B?MzZ3ZDZVNDAzWTZoM0F1QitVWTRUbmtUTTI1MnB2cVZTaUVGdi9OTkMwQ2s2?=
 =?utf-8?B?cVJxZWdKSHp0cXBJaDFJSDBKWTF6aTNqVWFHNFcwYVZVNHU4NHp0bDRyd2cz?=
 =?utf-8?B?WnlsQkNEeEpwcmlSQ2FnRkVtMDFoekVkcTVHNmxZd21idlZQWTc1cWJGdUtk?=
 =?utf-8?B?bXNnTkhKb3piZnBXWW1GWlI4ZERJeTFqbkpzcFZZZGIzS1JFdEtYcGdxUWU1?=
 =?utf-8?B?cTlaTjcvN1FmVStEUkR6QkFTWU1ZUldab0NnNm5iaE13cldlTE9FVDdoVnRK?=
 =?utf-8?B?YldvOTRVQTlPTVBiZUFhczduTmc5VHFXZFc5N2I5d0lvOVRXRGlJS0Fiam9p?=
 =?utf-8?B?dVphY1ZpNkFVcUowMGpQUjFGdmFHQWtFcWQ1b1ZlSG53MFVpUS9KQ2dJRVpu?=
 =?utf-8?B?Wkl2RW1uaGhTUTdBblN0KzQycUo1bzRkN09XRzRUeExhTEhtNXVBVXJvQ1Fv?=
 =?utf-8?B?aWYvWkpzRlFRc1FzQUIwcUJtUUJvK3NOVWtWWTFMeHlYdUxuNTBZbWR1OU5u?=
 =?utf-8?B?ZUp5WVBnNFJmMWVaR3llbkhpbm9BUmlpd2tmTlJZQUtQd2JhRGhYVGtDa1pj?=
 =?utf-8?B?RVBjZUtEL3VKWTNPQVFqSGFEcnJPN0lFQ2J0eXZYaXRtSXViNGtFV0NuNVRK?=
 =?utf-8?B?cjZHYmdpY0gyN2xNM24rZWVpTmdHK3c1Z2M3RE5jb2kwZ3pINC9RUFo3M290?=
 =?utf-8?B?WXVNQk9xUG5mOWpPU3FJOTdxZjNwcTlqMGJPRWcrRnBFTUh5Qk14YTlpSVR1?=
 =?utf-8?B?NnBGYXhZMDJ3UmdxeVVqY1FKMndoS1pIMlJGSzRCT3hkMVNleXR4dzdxTnBn?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c302d991-5ad8-4e68-7c1c-08d9f2a1770d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 05:42:34.9883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ptc7EahkQWsddEPXol/KCDqe+RDV60h5iNXQPWkT5XUZq0M7ztCZOV3erfn/C6VEGBzgeukspqRvNxkmrQXIYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2143
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBKYW51YXJ5IDI3LCAyMDIyIDEwOjUwIFBNDQo+IA0KPiBUaGUgVlQtZCBob29rIGNhbiBpbmRp
Y2F0ZSBhbiBlcnJvciwgd2hpY2ggc2hvdWxkbid0IGJlIGlnbm9yZWQuIENvbnZlcnQNCj4gdGhl
IGhvb2sncyByZXR1cm4gdmFsdWUgdG8gYSBwcm9wZXIgZXJyb3IgY29kZSwgYW5kIGxldCB0aGF0
IGJ1YmJsZSB1cC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4gLS0tDQo+IEknbSBub3QgY29udmluY2VkIG9mIHRoZSBYU00gcmVsYXRlZCBi
ZWhhdmlvciBoZXJlOiBJdCdzIG5laXRoZXIgY2xlYXINCj4gd2h5IHRoZSBjaGVjayBnZXRzIHBl
cmZvcm1lZCBvbiB0aGUgcG9zc2libGUgZnVydGhlciBncm91cCBtZW1iZXJzDQo+IGluc3RlYWQg
b2Ygb24gdGhlIHBhc3NlZCBpbiBkZXZpY2UsIG5vciAtIGlmIHRoZSBmb3JtZXIgaXMgaW5kZWVk
DQo+IGludGVuZGVkIGJlaGF2aW9yIC0gd2h5IHRoZSBsb29wIHRoZW4gc2ltcGx5IGdldHMgY29u
dGludWVkIGluc3RlYWQgb2YNCj4gcmV0dXJuaW5nIGFuIGVycm9yLiBBZnRlciBhbGwgaW4gc3Vj
aCBhIGNhc2UgdGhlIHJlcG9ydGVkICJncm91cCIgaXMNCj4gYWN0dWFsbHkgaW5jb21wbGV0ZSwg
d2hpY2ggY2FuJ3QgcmVzdWx0IGluIGFueXRoaW5nIGdvb2QuDQo+IA0KPiBJJ20gZnVydGhlciB1
bmNvbnZpbmNlZCB0aGF0IGl0IGlzIGNvcnJlY3QgZm9yIHRoZSBBTUQgaG9vayB0byBuZXZlcg0K
PiByZXR1cm4gYW4gZXJyb3IuDQoNCkkgYWxzbyBoYXZlIHRoaXMgcXVlc3Rpb24gb24gdGhlIEFN
RCBzaWRlLiBJbiBjb25jZXB0IHRoYXQgY2hlY2sgc2hvdWxkDQpiZSB4ODYgdmVuZG9yIGFnbm9z
dGljLg0KDQpidXQgdGhpcyBjaGFuZ2UgaXMgZ29vZCBpbiBpdHMgY29udGV4dDoNCg0KCVJldmll
d2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gdjI6
IE5ldy4NCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+IEBAIC0xNDYzLDYgKzE0NjMsOCBAQCBz
dGF0aWMgaW50IGlvbW11X2dldF9kZXZpY2VfZ3JvdXAoDQo+ICAgICAgICAgIHJldHVybiAwOw0K
PiANCj4gICAgICBncm91cF9pZCA9IGlvbW11X2NhbGwob3BzLCBnZXRfZGV2aWNlX2dyb3VwX2lk
LCBzZWcsIGJ1cywgZGV2Zm4pOw0KPiArICAgIGlmICggZ3JvdXBfaWQgPCAwICkNCj4gKyAgICAg
ICAgcmV0dXJuIGdyb3VwX2lkOw0KPiANCj4gICAgICBwY2lkZXZzX2xvY2soKTsNCj4gICAgICBm
b3JfZWFjaF9wZGV2KCBkLCBwZGV2ICkNCj4gQEAgLTE0NzcsNiArMTQ3OSwxMiBAQCBzdGF0aWMg
aW50IGlvbW11X2dldF9kZXZpY2VfZ3JvdXAoDQo+ICAgICAgICAgICAgICBjb250aW51ZTsNCj4g
DQo+ICAgICAgICAgIHNkZXZfaWQgPSBpb21tdV9jYWxsKG9wcywgZ2V0X2RldmljZV9ncm91cF9p
ZCwgc2VnLCBiLCBkZik7DQo+ICsgICAgICAgIGlmICggc2Rldl9pZCA8IDAgKQ0KPiArICAgICAg
ICB7DQo+ICsgICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPiArICAgICAgICAgICAgcmV0
dXJuIHNkZXZfaWQ7DQo+ICsgICAgICAgIH0NCj4gKw0KPiAgICAgICAgICBpZiAoIChzZGV2X2lk
ID09IGdyb3VwX2lkKSAmJiAoaSA8IG1heF9zZGV2cykgKQ0KPiAgICAgICAgICB7DQo+ICAgICAg
ICAgICAgICBiZGYgPSAoYiA8PCAxNikgfCAoZGYgPDwgOCk7DQo+IEBAIC0xNDg0LDcgKzE0OTIs
NyBAQCBzdGF0aWMgaW50IGlvbW11X2dldF9kZXZpY2VfZ3JvdXAoDQo+ICAgICAgICAgICAgICBp
ZiAoIHVubGlrZWx5KGNvcHlfdG9fZ3Vlc3Rfb2Zmc2V0KGJ1ZiwgaSwgJmJkZiwgMSkpICkNCj4g
ICAgICAgICAgICAgIHsNCj4gICAgICAgICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPiAt
ICAgICAgICAgICAgICAgIHJldHVybiAtMTsNCj4gKyAgICAgICAgICAgICAgICByZXR1cm4gLUVG
QVVMVDsNCj4gICAgICAgICAgICAgIH0NCj4gICAgICAgICAgICAgIGkrKzsNCj4gICAgICAgICAg
fQ0KPiBAQCAtMTU1Miw4ICsxNTYwLDcgQEAgaW50IGlvbW11X2RvX3BjaV9kb21jdGwoDQo+ICAg
ICAgICAgIHJldCA9IGlvbW11X2dldF9kZXZpY2VfZ3JvdXAoZCwgc2VnLCBidXMsIGRldmZuLCBz
ZGV2cywgbWF4X3NkZXZzKTsNCj4gICAgICAgICAgaWYgKCByZXQgPCAwICkNCj4gICAgICAgICAg
ew0KPiAtICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCAiaW9tbXVfZ2V0X2RldmljZV9n
cm91cCgpIGZhaWxlZCFcbiIpOw0KPiAtICAgICAgICAgICAgcmV0ID0gLUVGQVVMVDsNCj4gKyAg
ICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgImlvbW11X2dldF9kZXZpY2VfZ3JvdXAoKSBm
YWlsZWQ6ICVkXG4iLCByZXQpOw0KPiAgICAgICAgICAgICAgZG9tY3RsLT51LmdldF9kZXZpY2Vf
Z3JvdXAubnVtX3NkZXZzID0gMDsNCj4gICAgICAgICAgfQ0KPiAgICAgICAgICBlbHNlDQo+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC0yNTY0LDEwICsyNTY0LDExIEBAIHN0
YXRpYyBpbnQgaW50ZWxfaW9tbXVfYXNzaWduX2RldmljZSgNCj4gIHN0YXRpYyBpbnQgaW50ZWxf
aW9tbXVfZ3JvdXBfaWQodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4gIHsNCj4gICAgICB1
OCBzZWNidXM7DQo+ICsNCj4gICAgICBpZiAoIGZpbmRfdXBzdHJlYW1fYnJpZGdlKHNlZywgJmJ1
cywgJmRldmZuLCAmc2VjYnVzKSA8IDAgKQ0KPiAtICAgICAgICByZXR1cm4gLTE7DQo+IC0gICAg
ZWxzZQ0KPiAtICAgICAgICByZXR1cm4gUENJX0JERjIoYnVzLCBkZXZmbik7DQo+ICsgICAgICAg
IHJldHVybiAtRU5PREVWOw0KPiArDQo+ICsgICAgcmV0dXJuIFBDSV9CREYyKGJ1cywgZGV2Zm4p
Ow0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIHZ0ZF9zdXNwZW5kKHZvaWQp
DQoNCg==

