Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5160C4D79D0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 05:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289878.491538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTbtZ-0003OZ-KA; Mon, 14 Mar 2022 04:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289878.491538; Mon, 14 Mar 2022 04:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTbtZ-0003Mk-Gf; Mon, 14 Mar 2022 04:01:21 +0000
Received: by outflank-mailman (input) for mailman id 289878;
 Mon, 14 Mar 2022 04:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMf=TZ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nTbtX-0003Me-GG
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 04:01:19 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64ab61d2-a34b-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 05:01:17 +0100 (CET)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 21:01:14 -0700
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga003.jf.intel.com with ESMTP; 13 Mar 2022 21:01:14 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 21:01:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 21:01:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 13 Mar 2022 21:01:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 13 Mar 2022 21:01:12 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 04:01:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 04:01:11 +0000
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
X-Inumbo-ID: 64ab61d2-a34b-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647230477; x=1678766477;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ie85Mj/g5KeuT8Nxnk7L5VDB//4wcRDAhiKjOiS51Xc=;
  b=Ip6EYvMYVj6M5COCXGrP7Ydu3+0ij79Amun0SHult5M7iNKob7XmV3YY
   Q4X8p+1ylUR6Fm3ud+rIRwRJbFmHYFh5shiZ0dKBDEoTi0W/VJ5LBPDpY
   d9lQL9pDwnDcdLV6fr6T1T643qJccpTpXtkA38qYOM1HNdp9w2lecoQpZ
   lbJlVcfm+uDrWaBz8w5MVscR0etk/ZnypgcPdcXhYRnEmgRxz1svdAFXy
   0U8bVjXV2GymAeax/bwxf8g320OmkiOu4p0Flk6yvZbZ3a2+rJT7vLedc
   pbMpnU8pdYoFgSm38UG6TvF9H25AcsGCG6nDImswQiMG7ouM2wvocwUHB
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="254757931"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="254757931"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="497452736"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHb67Xrk8qaptf6O2VJUrz6HKJDBkQnFniIE2GoW85UwAlFdOPdf2FIU5RcW1D1d5fYw0ETD5QyRfvxxKjjUm/OejjNm2m+fqpv1glL0F6KT5zs8n6lngvoXqzbStdm6WFoy5zPwN90jx/Qfm07U0/hE5IAOKm5mgbktM/EY3pU0TjeoCRrb85f80Fn6GXL93u/8w+3agl/ySOeD+gKp/wpy+8cb4AlPD/FAZ6RWwZ2mmffgw+odlBTB3OHDD1gGBdBYceT3EJcrX2QMfHXdHjRJ0fX3qkqYGBDwcS9u3Jhh9d+jeZEhG5vPbEqi0jZIyaR4N+Ta496ktvGmKsKyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ie85Mj/g5KeuT8Nxnk7L5VDB//4wcRDAhiKjOiS51Xc=;
 b=Q2p+UqMKQTnCuRVkgyeqePgiXhf4Iks7362HWTcjAtNTbwnnYtL6PE38d9qvs0gBT04YYEP0mscAM2Z2nNTnUTl+LoR+q7BfYShvkzU8HeFxwB4cEOuFXon5gBBSJVS0BstGudnpo8DfzB8PfwWv0+zIGcmXcAj8QN9gj+z1NXF1i3h94Y/LtSkls35K6brlPVWcHg8HiJax1wHHJjh4cJyIlZ3M82RubCb946SO97CCqeC/aQUUgMllQJIsCxntrqdJAAS8D1/KCyreE/Ir37xVCW7TLkOKT07+jD4F4qk1nuW+ReWIn3TF7cDQGydlbHIYblxB3N2SGImMtFmk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 20/23] VT-d: free all-empty page tables
Thread-Topic: [PATCH v3 20/23] VT-d: free all-empty page tables
Thread-Index: AQHYBkBAHcUqxDPFCEWIL9jRoPTFzayZAFJQgAA29ICAJWrDAA==
Date: Mon, 14 Mar 2022 04:01:11 +0000
Message-ID: <BN9PR11MB5276930B2AFE79C4961E66548C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <807a48fe-3829-d976-75dc-1767d32fb0f4@suse.com>
 <BN9PR11MB527622E58C2E4EF90CF29EF88C379@BN9PR11MB5276.namprd11.prod.outlook.com>
 <9432990c-6de4-ad12-e9fa-12792200748a@suse.com>
In-Reply-To: <9432990c-6de4-ad12-e9fa-12792200748a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb2dca33-a20a-46a0-dad1-08da056f46d8
x-ms-traffictypediagnostic: PH0PR11MB5190:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB51902E46F5347F3A26B13B408C0F9@PH0PR11MB5190.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GDMlG4+qBY6KwSrutXNHsUvWh+W6UqUqN85oY/Lg3Xdcs7GSZ+uQEiyp/25q2pCvNvxwUMhKiPna+c4I+iMj+p7mY7flE5d+dXTTMayLCTz++nzMxlru5n68XTAf4MdH/LfVBK13/EnPpE62pGPmJhAvntMvGqOA2VYv3u2q2fZC8721/3QtiIhMLWandLaGL5vVHZu7//VQtvfMKA4wCv4RnecgowGst6zxBly7sY1aEC6nkyJqWsq94ZwTSUk3McBp68M2HQ6Om6ut5a0sms8Yo2VSE8n/eFJmvfo4hTSik91T0bit3l63AIekOxkMy/PoumNoNAfuHNDDUv/5iTJ8Kxub+NzB3u0voeifUyMkH85tNhPT1Kqyiaj0IIkguRKeDdSmMCir/d1+rfEBUXC/8/UNrXGgyZNNtboaUY4tmtsnupCIlXd1ogT13oogk9SnzzxJcLMdRoYrNNRGRINSMdIW0RhziJxk86veT524gwNfMRWuUa7sHAVEv1FZl7TYjUaoB1grTgol8uH8ti8Uzan6GvyEe//UVJbcBkIZaN8EGLY2M/gndztQzk7oEnl3K5fNmNkWA2oJW7jW2APMWK2oZrCfXhtBR0lsk2MG83nz/KqPHFfOx2K9aom4cOVgftV2sNT3naWlGWHQrclusvTr1otF43D/inGIKgCl/cs2nSOoHJCcbmavfBkX6pCd0vQ7YuYD4XUM36k5+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(4326008)(122000001)(26005)(186003)(6916009)(316002)(38100700002)(6506007)(38070700005)(53546011)(33656002)(66446008)(64756008)(66946007)(66556008)(76116006)(66476007)(508600001)(7696005)(9686003)(55016003)(54906003)(52536014)(71200400001)(5660300002)(83380400001)(2906002)(8936002)(86362001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cURjQ2U1WEpRalJ3MVh3RitJSWdEbTVDcHptcEJZd3c5MGMzQ3hyR1l1dmhN?=
 =?utf-8?B?U3NpMFVIbm4vNWRpbk50ZERmamN6WVZyYm5kTE9FNitOTTNDVXF2TWpKS25I?=
 =?utf-8?B?UWoyc001eUhaSjl0dElFbEFUSS9QTjVtZGU3R254TTBwWW5tQUdsK01MK2I1?=
 =?utf-8?B?TWVSUS9CVnZpVDdTZWpZa1FTMTdKbTdod0VzMFhpcCtUbXEwREJidE03Z3ZU?=
 =?utf-8?B?djA5OXByaHpyVXRRd1lRMjRmY216a0hCYVZUYXZNRFJjaG4wTjV0Z2VDQ0l0?=
 =?utf-8?B?cG1tc2FpWVoxQWdQdldaY0JmTnpKS2s3RUNMdGlqL3gvMmR5OHBZTnp6Mldh?=
 =?utf-8?B?WXVsbXRnZTYxZ2RGRlhlUlBYckRrb0MzZkt3U2hkSys5cElULzhFRWQ0eWRz?=
 =?utf-8?B?UnBpUkNXMkNEVFVBMlJuTHNmNXl3WEtUOXRDTER4TlMzSnJHMXJ2bHo4bENL?=
 =?utf-8?B?T04wdTdyUlNrMUx4dGpHOGV5QlJabXZYNFBoRmRtNGlaT2RqNUJaaGZzSGg0?=
 =?utf-8?B?aDV0bENSR29tUkxYTkE3dHdrdVVCVlk1ZlZ4Q0MxVEpvZDJXOXE5cUNONU9R?=
 =?utf-8?B?QkpGajNGTE9oRitPUDVmTi9RQ1hFQmY2ZnBndDhMVkpEelViWHJUUStrWFox?=
 =?utf-8?B?dW5aamlRUlNQWEhHQTU3N2RjZzRYN3loUEw3V3pxMm1HMG1vREdCSTNUUThm?=
 =?utf-8?B?K2Z5YnhidFJrQmJqVU9ZM0JnbjZUMm9rNEdyOGRENGxTZzFWd1hyWG5TQ1Qw?=
 =?utf-8?B?TzdkZERaMmdiRFpHQXU5byszejVSSGFkVHRLVmlHdEJaVHRXQSszcVlRZEg3?=
 =?utf-8?B?UmQ5ZUErOVFuUXgwRy9PYmtZck1QYS9BY2pQUjBtYkg3d3BrTDNuS0ZFeVd2?=
 =?utf-8?B?SVpqaDhqV1MvbGx5d2s3aFpkSnRBWHo4dzY1SWczZ3BvSlBJWGpFaUJ3WXBC?=
 =?utf-8?B?UnM0MVlZSG9WRW8xODhXcThkU1dQWEIxTGFGVmJKNjU5VWJ4NHFOM0phK3N5?=
 =?utf-8?B?eE5oS1NibU1aUFc2MWtuRXRic0gxUEE5WHViRzJWclV6SG9lMTdrUHRBL0dm?=
 =?utf-8?B?aWxBalB1UVg0clRQMTBuVnBySHp2S0s5SFZwM1RYL3NQTXl2YWt4MVhJMWM1?=
 =?utf-8?B?VGN2TEZTS0lSaE1sZ1h4VjBVUFZudmhFKzZVN0ZBWVliYnZ0RnpYRis2RFRU?=
 =?utf-8?B?SElwZkkwMndaZk80ZERtTVNpSjBvU3hsamV4clBvWjFIYlc2cDJQR2VQYjVE?=
 =?utf-8?B?S21SU2ZOZEF0ZTMyZHNKVVJ2RFZZYXlBc3hLMEtYdzdZSWduQXNlZDNsZGpK?=
 =?utf-8?B?ZW5NZGM0cjR0WGR3YUd1d0dqOUo5dERYS3p2OHBuYVZOV2ZBRmYyeVpIaTZr?=
 =?utf-8?B?a2gzSWtBbE9pU2g1dnRWUlAwdEZ6TklVRG1sSFJoM21xWk9xR3ZkcEVCN3Va?=
 =?utf-8?B?US9SWmNmOGFrYjU5U09ibzNsemE2T3NhSWNzOXM5b0RpV256OUhwd21nZ2xa?=
 =?utf-8?B?RUs1eTZGdFFiUEw2dW1BRStSeVUvcnUrTGdXaUhZbkZQWHVTbGwzOWQvL3Ax?=
 =?utf-8?B?emdYUE02L0pWSk5uUHErc0M2YkFhejZNQXlBZkVmK2hIL21NNm0yeEZiVVlL?=
 =?utf-8?B?eEd6RkdMWXkxUFNRczBRb1lSY3gyZTlPVURkVjhya1VVaGdrSy9CVWFZVHpz?=
 =?utf-8?B?eXZBR05ZSmhDWWMxT0NQWktkdXhvczhISlhSeFJNOGN5K3FmUEUzaTZxamdE?=
 =?utf-8?B?c0FUVzhCZzg0blNURHoxOTNXeTNYNmpkQzcxKzRESVhUaGdqWGdOT2N4VEVn?=
 =?utf-8?B?SnFnQmFUWDVKY1RBV0h2WWgwdERKR3lxR3ZvWXhGeW02bWEwY2U0UFlaaWxE?=
 =?utf-8?B?WDdDMnBTamUzcXA4M1JOLzV3Nm5lbFlsQmp0V2x0bXhacHlTT1JHdnY2MUo4?=
 =?utf-8?Q?Y8uIvndMjcapfVhQa+eapEGhfJLfKveR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2dca33-a20a-46a0-dad1-08da056f46d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 04:01:11.3066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ZGr6ng2xGAkgmRwdSlIwJVfKngjgafkPCwJWn6zbqfT3CFdEMhfgVBc+rMij5vMep5COLKox7iypho85NZVgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RmVicnVhcnkgMTgsIDIwMjIgNDozMSBQTQ0KPiANCj4gT24gMTguMDIuMjAyMiAwNjoyMCwgVGlh
biwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxMSwgMjAyMiAxMjozNiBBTQ0KPiA+Pg0K
PiA+PiBXaGVuIGEgcGFnZSB0YWJsZSBlbmRzIHVwIHdpdGggbm8gcHJlc2VudCBlbnRyaWVzIGxl
ZnQsIGl0IGNhbiBiZQ0KPiA+PiByZXBsYWNlZCBieSBhIG5vbi1wcmVzZW50IGVudHJ5IGF0IHRo
ZSBuZXh0IGhpZ2hlciBsZXZlbC4gVGhlIHBhZ2UgdGFibGUNCj4gPj4gaXRzZWxmIGNhbiB0aGVu
IGJlIHNjaGVkdWxlZCBmb3IgZnJlZWluZy4NCj4gPj4NCj4gPj4gTm90ZSB0aGF0IHdoaWxlIGl0
cyBvdXRwdXQgaXNuJ3QgdXNlZCB0aGVyZSB5ZXQsDQo+ID4+IHB0X3VwZGF0ZV9jb250aWdfbWFy
a2VycygpIHJpZ2h0IGF3YXkgbmVlZHMgdG8gYmUgY2FsbGVkIGluIGFsbCBwbGFjZXMNCj4gPj4g
d2hlcmUgZW50cmllcyBnZXQgdXBkYXRlZCwgbm90IGp1c3QgdGhlIG9uZSB3aGVyZSBlbnRyaWVz
IGdldCBjbGVhcmVkLg0KPiA+Pg0KPiA+PiBOb3RlIGZ1cnRoZXIgdGhhdCB3aGlsZSBwdF91cGRh
dGVfY29udGlnX21hcmtlcnMoKSB1cGRhdGVzIHBlcmhhcHMNCj4gPj4gc2V2ZXJhbCBQVEVzIHdp
dGhpbiB0aGUgdGFibGUsIHNpbmNlIHRoZXNlIGFyZSBjaGFuZ2VzIHRvICJhdmFpbCIgYml0cw0K
PiA+PiBvbmx5IEkgZG8gbm90IHRoaW5rIHRoYXQgY2FjaGUgZmx1c2hpbmcgd291bGQgYmUgbmVl
ZGVkIGFmdGVyd2FyZHMuIFN1Y2gNCj4gPj4gY2FjaGUgZmx1c2hpbmcgKG9mIGVudGlyZSBwYWdl
cywgdW5sZXNzIGFkZGluZyB5ZXQgbW9yZSBsb2dpYyB0byBtZSBtb3JlDQo+ID4+IHNlbGVjdGl2
ZSkgd291bGQgYmUgcXVpdGUgbm90aWNhYmxlIHBlcmZvcm1hbmNlLXdpc2UgKHZlcnkgcHJvbWlu
ZW50DQo+ID4+IGR1cmluZyBEb20wIGJvb3QpLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IC0tLQ0KPiA+PiB2MzogUHJvcGVy
bHkgYm91bmQgbG9vcC4gUmUtYmFzZSBvdmVyIGNoYW5nZXMgZWFybGllciBpbiB0aGUgc2VyaWVz
Lg0KPiA+PiB2MjogTmV3Lg0KPiA+PiAtLS0NCj4gPj4gVGhlIGhhbmcgZHVyaW5nIGJvb3Qgb24g
bXkgTGF0aXR1ZGUgRTY0MTAgKHNlZSB0aGUgcmVzcGVjdGl2ZSBjb2RlDQo+ID4+IGNvbW1lbnQp
IHdhcyBwcmV0dHkgY2xvc2UgYWZ0ZXIgaW9tbXVfZW5hYmxlX3RyYW5zbGF0aW9uKCkuIE5vIGVy
cm9ycywNCj4gPj4gbm8gd2F0Y2hkb2cgd291bGQga2ljayBpbiwganVzdCBzb21ldGltZXMgdGhl
IGZpcnN0IGZldyBwaXhlbCBsaW5lcyBvZg0KPiA+PiB0aGUgbmV4dCBsb2cgbWVzc2FnZSdzIChY
RU4pIHByZWZpeCB3b3VsZCBoYXZlIG1hZGUgaXQgb3V0IHRvIHRoZSBzY3JlZW4NCj4gPj4gKGFu
ZCB0aGVyZSdzIG5vIHNlcmlhbCB0aGVyZSkuIEl0J3MgYmVlbiBhIGxvdCBvZiBleHBlcmltZW50
aW5nIHVudGlsIEkNCj4gPj4gZmlndXJlZCB0aGUgd29ya2Fyb3VuZCAod2hpY2ggSSBjb25zaWRl
ciB1Z2x5LCBidXQgaGFsZndheSBhY2NlcHRhYmxlKS4NCj4gPj4gSSd2ZSBiZWVuIHRyeWluZyBo
YXJkIHRvIG1ha2Ugc3VyZSB0aGUgd29ya2Fyb3VuZCB3b3VsZG4ndCBiZSBtYXNraW5nIGENCj4g
Pj4gcmVhbCBpc3N1ZSwgeWV0IEknbSBzdGlsbCB3YXJ5IG9mIGl0IHBvc3NpYmx5IGRvaW5nIHNv
IC4uLiBNeSBiZXN0IGd1ZXNzDQo+ID4+IGF0IHRoaXMgcG9pbnQgaXMgdGhhdCBvbiB0aGVzZSBv
bGQgSU9NTVVzIHRoZSBpZ25vcmVkIGJpdHMgNTIuLi42MQ0KPiA+PiBhcmVuJ3QgcmVhbGx5IGln
bm9yZWQgZm9yIHByZXNlbnQgZW50cmllcywgYnV0IGFsc28gYXJlbid0ICJyZXNlcnZlZCINCj4g
Pj4gZW5vdWdoIHRvIHRyaWdnZXIgZmF1bHRzLiBUaGlzIGd1ZXNzIGlzIGZyb20gaGF2aW5nIHRy
aWVkIHRvIHNldCBvdGhlcg0KPiA+DQo+ID4gSXMgdGhpcyBtYWNoaW5lIGFibGUgdG8gY2FwdHVy
ZSBhbnkgVlQtZCBmYXVsdHMgYmVmb3JlPw0KPiANCj4gTm90IHN1cmUgd2hhdCB5b3UgbWVhbiBo
ZXJlLiBJIGRvbid0IHRoaW5rIEkgY2FuIHRyaWdnZXIgYW55IEkvTyBhdCB0aGlzDQo+IHBvaW50
IGluIHRpbWUsIGFuZCBoZW5jZSBJIGFsc28gY291bGRuJ3QgdHJ5IHRvIHRyaWdnZXIgYSBmYXVs
dC4gQnV0IGlmDQo+IHRoZSBxdWVzdGlvbiBpcyB3aGV0aGVyIGZhdWx0IHJlcG9ydGluZyBhdCB0
aGlzIHRpbWUgYWN0dWFsbHkgd29ya3MsDQo+IHRoZW4geWVzLCBJIHRoaW5rIHNvOiBUaGlzIGlz
IGR1cmluZyBEb20wIGNvbnN0cnVjdGlvbiwgaS5lLiBsYXRlIGVub3VnaA0KPiBmb3IgZmF1bHQg
cmVwb3J0aW5nIHRvIGJlIGZ1bGx5IHNldCB1cCBhbmQgZW5hYmxlZC4NCj4gDQoNCk15IHBvaW50
IHdhcyB0aGF0IHdpdGggeW91ciBndWVzcyB0aGF0IHRoZSBpZ25vcmVkIGJpdHMgYXJlIG5vdA0K
aWdub3JlZCBzb21lIFZULWQgZmF1bHRzIHNob3VsZCBiZSB0cmlnZ2VyZWQuIElmIHRoZSByZWFz
b24gd2h5DQp5b3UgY2Fubm90IG9ic2VydmUgc3VjaCBmYXVsdHMgaXMgYmVjYXVzZSB0aGV5IGhh
cHBlbmVkIHRvbw0KZWFybHkgc28gbm8gbXVjaCBjYW4gYmUgc2hvd24gb24gdGhlIHNjcmVlbiB0
aGVuIHRyeWluZyB0bw0Kc2V0dGluZyB0aG9zZSBiaXRzIGF0IG11Y2ggbGF0ZXIgcG9pbnQgbWln
aHQgZ2V0IG1vcmUgc2hvd24gdG8NCnZlcmlmeSB5b3VyIGd1ZXNzLiANCg0KYnR3IGFueSBwcm9n
cmVzcyBzaW5jZSBsYXN0IHBvc3Q/IEhvdyB1cmdlbnQgZG8geW91IHdhbnQgdGhpcw0KZmVhdHVy
ZSBpbiAoY29tcGFyZWQgdG8gdGhlIGlzc3VlIHRoYXQgaXQgbWF5IHBhcGVyIG92ZXIpPyANCg0K
VGhhbmtzDQpLZXZpbg0K

