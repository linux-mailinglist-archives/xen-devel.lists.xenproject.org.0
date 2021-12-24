Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D6747ECAA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 08:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251239.432545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0f0L-0004ZL-Jo; Fri, 24 Dec 2021 07:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251239.432545; Fri, 24 Dec 2021 07:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0f0L-0004Wx-Fz; Fri, 24 Dec 2021 07:28:41 +0000
Received: by outflank-mailman (input) for mailman id 251239;
 Fri, 24 Dec 2021 07:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P6v+=RJ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1n0f0K-0004Wr-Ey
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 07:28:40 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b78d4e7-648b-11ec-bb0b-79c175774b5d;
 Fri, 24 Dec 2021 08:28:38 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 23:28:36 -0800
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Dec 2021 23:28:35 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 23:28:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 23:28:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 23 Dec 2021 23:28:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 23 Dec 2021 23:28:34 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5483.namprd11.prod.outlook.com (2603:10b6:408:104::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 07:28:33 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 07:28:33 +0000
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
X-Inumbo-ID: 1b78d4e7-648b-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640330918; x=1671866918;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+WIr3QNJxf/g4KZCWpJm34viTRnT1zlWpXoERz4strE=;
  b=OyCH3kFCcIPMLIna6sqKkVCVgcla8a9boTr4XPmFKcGAEWgYqfOWVBZs
   REZH+3G1N4Tse/pjGGXJDbCSW/2Hh3FMg9MP5aceIokSNY9aAxLNmQ4Al
   TRtSWixjWto84Zx3A8MV6kSzZ7uWcqp1fmfaMxUkKIk8KOwVgXB9cAwgg
   vBLCbOioNoNThi7o+C9Zq2OrJnFMAvx6gXtkx1V93/KAza5Slp3aFfqKE
   ozN0wiwiFOyJpAfDMloME+vsAwuJYIU0j+vwyBY/IXK68gj1agL4XsDj/
   rEwVKKcr3svB0JnykTTyqcF9xo3HRuvmJQMBfUsdLKCvgQ+Vv+wpZdPTz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="240897693"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="240897693"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="607989550"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fk4RP9VRftZ7Elo7jn+uUHV8jgaRnkZpmYD9CP28RiR+7JltN9Lv7wd6ANl5Doq7HKI8CJscIuZnO4QEyV4dY0gkxDBhXcVmhqNLMP4PNljBB3aXRf1Wu1/zXFpuerUWJ+T41OUdhsj7S0c7OVcKWTTvareN42F0BidpBdJI61d0M5HeD5UuoX1xd2RggMQZ02gB5a3mrVWXdL8muiXZraBx/MkM3SZROm5PHOlZd5XIOD+jXbNwuq/8xSkuzamuGDHIzhFnlWXOgu4HJSlaWI1h9h07gpGm5e1cuksjbwEjAU7TFgB6t+uyIj/70dZbKleBCXUXY/QioMfqx1pcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WIr3QNJxf/g4KZCWpJm34viTRnT1zlWpXoERz4strE=;
 b=mgzseInYCKq2mrO3b+eAzdMB1owhdh6pIgLAL6yjAmF2EXs4pcvHdQrXLF3NoCWPAM5mh0yvJ5RZZprj/6pgshQ1IV6G40Fv4FcH+i1gxD2od/CIxbIQ9F6mI7MEng7jLFCelbwgD/Zlv/1+fQjR651evWm2Fv0mgGgrrobBxihzVHgBGmxQhy9Lq3vwOo6VI6SX1k3VBRxcCevCL9wP8JlFPLhZrIviKfho1uBpYpG62SE32CCOZBWcpRSRXr2lzClfzqijIf6tjoyTr/VUQCyOy/GxoL3hbnMKRxsFAeAsFG11dmgfRzm1kTmUq7mhomHv0ylGSc7J1OPjjJLXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, Andrew Cooper <amc96@srcf.net>
CC: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 3/4] VT-d: replace flush_all_cache()
Thread-Topic: [PATCH 3/4] VT-d: replace flush_all_cache()
Thread-Index: AQHX5petNZzmre0QvUm2Tee8zq2soawdmhQAgAFLOQCAInz2cA==
Date: Fri, 24 Dec 2021 07:28:33 +0000
Message-ID: <BN9PR11MB527697C864CE7526EA16AA6C8C7F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <8a8dd03a-5447-bc45-1554-50fb5b6c075c@suse.com>
 <a6489b9f-6f93-94d9-549f-07fc761a4830@srcf.net>
 <8a9bf3aa-5f91-a81a-813d-f50ad01ef3de@suse.com>
In-Reply-To: <8a9bf3aa-5f91-a81a-813d-f50ad01ef3de@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6376849a-a519-4c45-b909-08d9c6aefddb
x-ms-traffictypediagnostic: BN9PR11MB5483:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB548345942E1599BF805F77368C7F9@BN9PR11MB5483.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y8a5rEC/Z6qYXLiHk1IJf7QxyA2MUR778kUbqO6sjqy3oc0PqSRHGwDPZ++E0rb/7Nr0rUrQifIHZtnhOO4+8ag8tLxv+9YZU2iNOk8hyiTXPDGwBdH/c1vZ2cLFan9xHZAbeV0yoko0GRC29Fxvyy5PhPtZ0d721+ae7NqTJS7lXGm5Hu47fIYXXpDggL415WDLUYKPOUul8EaOF3MKxS1eYPKMAWSLoYRtrscjU8YH8qRzf2IZN3sAJtMI8XojX3pogPFadIY/OJYsIf/Jt0j5L7tl8h3xkuvmfn15FOIxhpxiVc3ZkmOP9Cbpysn/ijyzWUdCImvvPoZKGxoNyU1YcsnQpCvqiUC/hB7WXzbNnCCfvqegv4Sc+SQCJg9NMtRww2ExgQLWJJoJ4IeC8SR1Y2rs7CW2chytEkjHBYDD9CZZLdBj6VL7KhFsG7/U5ewO+RrozyJOIPeMdMWp4XgDpai8g3SYOuhsZtFNqV6jt2f83/RfpzWhqfrPRd3gA+NyfRyhCf6ofrRgFU7Hyt8v7cHyndJ9M8Xsucw04Qt6/r5XtSz6BQD4OcVR23+WebXH0PH/M1RtnhC6ENJhl/FFHvhGsar8NOZw99EUahkm6Dc+2CqvjK2FrM56dXFYOlOLOsC/VAclk4rOmMNtk2pFkpE9GGmVq7KCx4dIoB9/648vzlsT3NbHVjOKULTZ44e+osBVmV/7l7vZVuXxoQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(38070700005)(66946007)(7696005)(316002)(54906003)(38100700002)(122000001)(2906002)(5660300002)(6506007)(508600001)(110136005)(53546011)(4326008)(82960400001)(71200400001)(86362001)(52536014)(66556008)(8936002)(66446008)(76116006)(8676002)(66476007)(9686003)(33656002)(55016003)(26005)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmNaRFRoY2s4aGhiLzI0OU4rckhZMDZ6ZU95YWY0NGwxWmNETGt6TGJ3NXhj?=
 =?utf-8?B?RXcxeDFlREhQcnZHQ09naGlReUxVTEFWU0J4OCtjbGpSc2ZFV1R6aExnSGg2?=
 =?utf-8?B?MzFHeGF3RTB6K3drNUlVM1U2YklLN3cxcnZSMHJNVzdRSVpoa2N4NmlnWjBu?=
 =?utf-8?B?UDZta2diMFJKV0JUWEplV1Q5RlM3d2JGMFdWOXpDTS9EQk02WTdCWmtTcHZ3?=
 =?utf-8?B?NHZXT0o2YjFwRXEycVAySzh0eEtoRTJyaVJudXFHcVl6ZkRad09TQjdNN2FJ?=
 =?utf-8?B?WmdsMFhEbDIzeUJnU2g1RFIzUWc3Q0lCWEgybG80bm5NY3JXZFFnQzhEeVV4?=
 =?utf-8?B?d3VqaXQ3eE5KZkwzenE4SzJLUU1JcCs4S1A0ZUJqNU8xMkhNVUdBZWNkVGVa?=
 =?utf-8?B?Um1kT0hpcVVkZTZGbXdCZ2pWWi82eW1xelVVSm1DWlZ4SVZJT1dHQ2VIUHU1?=
 =?utf-8?B?cVRaSFJwY05uNGZoWGdHUDBHbDBTTVFGM3VvMWlJZjNtK3hGK01tWTQrTlcv?=
 =?utf-8?B?U0R0YS9sUlRkMkx4Vi9oRzQxRWMxRi9pQTV4c2FWbGdUcmd4RTZwK05EcXNx?=
 =?utf-8?B?OG04aGhDU2tVUXZ1ck05ZkxRMG1KUkFjWFBPaTM5SlVQUzZBYk1mQytrMDE4?=
 =?utf-8?B?WGttMGhYckpoMDVzU3ZsWVhseFNqNm8zUVhyNTNTVzh6b0pPeFhoQjE0OVRs?=
 =?utf-8?B?eWFuMnpRb1hoeUVyeTd0SE90V0dPRmRXb09DZUpUZXdtZWVRZytINUNQQnYw?=
 =?utf-8?B?N3NXSTllYmNKck5pR1B5R2hNaXlCT2FWNlNKSGZ2YUxZZXRweVJUa0ZuODhn?=
 =?utf-8?B?cDBlenpZNlJFZzdNOElKNEpmZ09VUkZXK2pYdmFSM3RVMXNqNzhKazZhOEx1?=
 =?utf-8?B?NXFKZHNZeHdyZnZSZGFMQ1lDM0YrTXVlaE9ZSnRrb25IeWRBQk5rcHlVK3A3?=
 =?utf-8?B?QThvQUo4L2g5MWVMeXFEUWlBNkY5R0dHeWxnek9RQjFFTzlFRzZ6WDZORW5X?=
 =?utf-8?B?dEFaWWNNRmI3dmxWU08rU1pxdkVHalMwRVloSHozY0VPenVIdG92SUhDMDA3?=
 =?utf-8?B?cjJtcUVUbGtLSllkb3MyOXhnY0lmZ2dTeXV4OEg3K1RVNXo0VTNORlM0WFVp?=
 =?utf-8?B?VHZ3RzhGQXBIb3gyNmpzTDcxYlVSU21ENzh0K1gwNXVWcVVLenZKMkZiM24w?=
 =?utf-8?B?N0dJSFpmaGpUU0cvTVFoQmx0ekFIZUdDUjk2TmozTzR6dDc3NDE1V1VwRk9z?=
 =?utf-8?B?ZU9pQ2RpMHRIQTNvS0JaNUhzRUswUlUrdlRPYVI2VjY2bk1zK3FqQVlITWpm?=
 =?utf-8?B?K2dPVWxCcVM0N3VEM3MyaHN1bkJOZEtCTUpQWHY5c3lLQVhyTVFVVnQzNDlv?=
 =?utf-8?B?REV0bE83NEZjdTR5Rkt0QTlSdEQzTEJhcEd6UTdJTWV0WWV3WXVvaERYUzJS?=
 =?utf-8?B?cG5NTm40Y0pYd0JHV0tDSkdpR1VMVkF4YjZ6V3M5aFpxajc5bjB6allGWmt3?=
 =?utf-8?B?amQzb2pOYi9Yb2dtemFkWTJmdm1nV09UQmU0MTJjYnY0YWt3MUtlR0d2NGtJ?=
 =?utf-8?B?UjFMaWprYkRTcE5aVVZGbnJPV2xLSmlSb2hydGI0clhySzlaQ053UVpodEtY?=
 =?utf-8?B?aDdCRGZ3Z1M0RHZnMWgyTDVkbHMvR1Z3Q1k0OE85QWJTdXpDM2d5bDRFMkxz?=
 =?utf-8?B?UytxeVdCMmlKYU1rZHJ1ZlkrTXRqQmZYOEpSZVRhUGJ4YTM1Tld0Qm9rVjhr?=
 =?utf-8?B?SnNWUDZVbDBiL1lDUnBmSHFvV1poelRxcnY5RUxCd2o2SWFsUmhoWkx3ZTdl?=
 =?utf-8?B?R2x0cnZISDljV0d2ZE5zeUJDZGpXOFFIVUhYY2hrakFNVnI1OUlvZUZSSHJW?=
 =?utf-8?B?NjZLT3Bmd0M4VFpjVGpZRVQ1WVJwblZkdk45VzhWTUE0Vkc5VzNycC9rNW1v?=
 =?utf-8?B?ZmI4NFA3bm1Ld1FYWnRCQ0IzcFc2VFZUV1g1QjdGR21UWkYwdUhVZXNDRkVp?=
 =?utf-8?B?VmhjYjk4S3Z5SSs5cUk0SHZSWDBhSUZmOW9EekthUldQV09MbGtWa2RWamFq?=
 =?utf-8?B?T1RscytuRTcxUXBBVEQ0OWw4UVF4VTZZUWZ5Tngya1lQNlhrb0dqNy82M3NG?=
 =?utf-8?B?OGIvRmd6WVkvU3FDNUlJZU54QTlyaldkcXNBd2NxWXVDZTVwdSt0b2t3OXdk?=
 =?utf-8?Q?RbyeTOCswAhE1epnpjI80eg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6376849a-a519-4c45-b909-08d9c6aefddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 07:28:33.4135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ry1wnbyM/F0u6o+eZAbAySyNe7jg4VwfLwQwTAOIC9p3P/21jcEmQ56tg6PjYnio25lUbe3RK2AVS5Wz28iwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5483
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBEZWNlbWJlciAyLCAyMDIxIDQ6NDggUE0NCj4gDQo+IE9uIDAxLjEyLjIwMjEgMTQ6MDIsIEFu
ZHJldyBDb29wZXIgd3JvdGU6DQo+ID4gT24gMDEvMTIvMjAyMSAwOTo0MSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+ID4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+
ID4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ID4+IEBAIC01
OTEsNyArNTkxLDggQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW9tbXVfZmx1c2hfYWxsKA0K
PiA+PiAgICAgIGJvb2xfdCBmbHVzaF9kZXZfaW90bGI7DQo+ID4+ICAgICAgaW50IHJjID0gMDsN
Cj4gPj4NCj4gPj4gLSAgICBmbHVzaF9hbGxfY2FjaGUoKTsNCj4gPj4gKyAgICBmbHVzaF9sb2Nh
bChGTFVTSF9DQUNIRSk7DQo+ID4NCj4gPiBXaGlsZSBJIGFncmVlIHRoYXQgdGhlIGNvbnZlcnNp
b24gaXMgYW4gaW1wcm92ZW1lbnQsIHRoZSBsb2dpYyBzdGlsbA0KPiA+IGxvb2tzIHRvdGFsbHkg
Ym9ndXMuDQo+ID4NCj4gPiBJIGNhbiBiZWxpZXZlIHRoYXQgaXQgbWlnaHQgaGF2ZSBiZWVuIGEg
c3RvcGdhcCB0byBmaXggcHJvYmxlbXMgYmVmb3JlDQo+ID4gd2UgaWRlbnRpZmllZCB0aGUgbmVl
ZCBmb3Igc3luY19jYWNoZSgpIGZvciBub24tY29oZXJlbnQgSU9NTVVzLCBidXQNCj4gPiB0aGVy
ZSdzIG5vIG5lZWQgSSBjYW4gc3BvdCBmb3IgYW55IFdCSU5WRHMgb24gYW55IG9mIHRoZXNlIHBh
dGhzLg0KPiA+DQo+ID4gSSdtIGZhaXJseSBzdXJlIHRoaXMgc2hvdWxkIGp1c3QgYmUgZHJvcHBl
ZCwgYW5kIFhlbiB3aWxsIGdldCBmYXN0ZXIgYXMNCj4gPiBhIHJlc3VsdC4NCj4gDQo+IEtldmlu
LCB0aG91Z2h0cz8gSSBoYXZlIHRvIGFkbWl0IEknbSBoZXNpdGFudCB0byByZW1vdmUgc3VjaCBj
b2RlLCB3aGVuDQo+IHRoZXJlJ3Mgbm8gY2xlYXIgaW5kaWNhdGlvbiB3aHkgaXQncyB0aGVyZS4g
SSdtIGFsc28gbm90IHN1cmUgaG93IG11Y2gNCj4gb2YgYSB3aW4gdGhlIGRyb3BwaW5nIHdvdWxk
IGJlLCBjb25zaWRlcmluZyB0aGUgcGxhY2VzIHdoZXJlIHRoaXMNCj4gZnVuY3Rpb24gZ2V0cyBj
YWxsZWQgZnJvbS4NCj4gDQoNCm1lIHRvby4gQ291bGQgQW5kcmV3IGVsYWJvcmF0ZSBmdXJ0aGVy
IG9uICJmYWlybHkgc3VyZSIgcGFydD8NCg0KVGhhbmtzDQpLZXZpbg0K

