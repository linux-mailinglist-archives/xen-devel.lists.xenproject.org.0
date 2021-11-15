Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85244FE27
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 06:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225647.389689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUQv-0004kC-G5; Mon, 15 Nov 2021 05:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225647.389689; Mon, 15 Nov 2021 05:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUQv-0004h6-CF; Mon, 15 Nov 2021 05:21:33 +0000
Received: by outflank-mailman (input) for mailman id 225647;
 Mon, 15 Nov 2021 05:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rbjM=QC=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mmUQu-0004h0-Kp
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 05:21:32 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e30a3cd1-45d3-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 06:21:31 +0100 (CET)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 21:21:28 -0800
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 14 Nov 2021 21:21:28 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:21:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:21:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 14 Nov 2021 21:21:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 14 Nov 2021 21:21:27 -0800
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR11MB1265.namprd11.prod.outlook.com (2603:10b6:404:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 05:21:25 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%9]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 05:21:25 +0000
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
X-Inumbo-ID: e30a3cd1-45d3-11ec-a9d2-d9f7a1cc8784
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="296810091"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="296810091"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="734837294"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np85Ryb9crwgF6SJH5I8xMBVJO6dECZ1K2WKJN5Yv2pn4aFxDKTdPA9ISuaZ/d01jzQfMruX5/4iG/9C8uBG1m15tqtBjHOeFRfER7s6BgK9dVyQGMJpa+sQXHqn37kD6hy+wO1et93mXP/2IQdQZA8sR4rdIL5Q1LLFSpR/1iO9RMVBSP3BPtX0gatp9N5Z8+JwAzRVZ7M8ivwWi2GzGRqIPC5XuP2Qr6fdFw/mi40a0IYySHoUcwl4g+DUwgpqjzwDmpuL+s3ES1m0AoaL4IHWX01w50Pk+BzO+ZEtKaImvqasHVkluAGhNR1CV6sw6R52ti8j1Zqv3qlsmsSGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgcTmuzke/9024I1ZH8oHXqHgnuL2fsWV6++ybbcNOk=;
 b=DkQj4YDZK5B0oVsemPvipxF8xTd9eDeijR88atorcYUiPmquiTYcB7hmFOj5WpvOVN+OcR0EbVp52FqFutryVnDTUdEgACIWmmA8eTqme+tJS/Mf+idW6npaVV8Xl4zfWVsR9I94EMAWMpJhmhkErmD/LTAiNLTED4hbU4x8YnEPr15IaBykGHxgusVZFIqtCilXvBnBqE+WZ6CcDFuSR4Hq/tYOS+rvUBEBHVzaMv9qNJNnSdg+m9XofCGW6Yc7DuaC4GxwTz3x96mJYEOaM6CcP4kPwCXjHFTr7O7kJCkpodSv2985zpsMOrtXDF4MrwBePFcLC6A9BGUngaj2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgcTmuzke/9024I1ZH8oHXqHgnuL2fsWV6++ybbcNOk=;
 b=rJkOAoAbhVx6Fln80+LfXtAi04adodOyuIEdOO9nDHcgP7QEXTsWzxFC/JdGpsYEgqmSAHimCJmZzxiACuv3MHFZ0NlZaXVVMc+5JfUH0VPYPL7etFNcyQN3m7A3FQKNMbjAgy7+9AdcsJlPCm8M3usYdbwdiUnHDmjuc1r9eA8=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 3/6] VT-d: don't leak domid mapping on error path
Thread-Topic: [PATCH 3/6] VT-d: don't leak domid mapping on error path
Thread-Index: AQHX16qEmEl05LhWzEygD9JPD9Hti6wEEdqw
Date: Mon, 15 Nov 2021 05:21:25 +0000
Message-ID: <BN9PR11MB543399A190B26BB465290BF78C989@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <d4ca5274-dbbf-4cde-1a4b-0d7fe294c360@suse.com>
In-Reply-To: <d4ca5274-dbbf-4cde-1a4b-0d7fe294c360@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e60a81b-1bb3-4527-97aa-08d9a7f7c557
x-ms-traffictypediagnostic: BN6PR11MB1265:
x-microsoft-antispam-prvs: <BN6PR11MB126572FB4660A7E7ADA1A1EE8C989@BN6PR11MB1265.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N0bhLysss2BzK1+fRnTIeLcStm0J+RDsN5pyEH9FSpWs5qj9B73cd3CfTA8QGpXY16q1cd/ewn34auUwcHGnbBAAwDKZHQxHpP8ddewGi/L8sKkX/lRNqkSntg+fFaU1tuCfGwU/7QdS8rhPTjhGIpNxmYSH77nQhYU+YTLw40IcNllsqcQqgn10gNVrvirUHklrM0N4bijnSLLNd1vb93AOCAxy3wPhrz9pdhrjkztuHia378uFWJvWmo8eioyCToo8QqltGiibra/OL+/SDNVha2brBNgyUu664XAxEpzqDU29z4MRpofZAfanNTi49iNQZ+HdL3Gtf42mVFU648AktAE9UrWcrqTQCFKPxVtPbncbJdbGoXhVy/dPuZruTqamOJgjVUEzNRLdr0QPhc4S/38ajnfuCB9ufOAKvniqsFfT08uWcDuxznRy32doEAQgps1ZvA9fo2YR7oumtYIaKyi9X86i1CjygkIhXjPTGJF0gq09VadYvlIz3IRsns117oFJOQr3Ym6GtVdrPetGcvyjMPZl/5UzMsznJcB+IZZ0bSEKVlPisTTeUHdRxXLp+Y1AmugJKxqAlmwybZvD+LIWQkpHtWn6LhxMPexkVkQrAOB7d+eJ1f/lumQXvJbIfC09h0hJk+EPzoSjIgvi/n850zlsimgWto0GhVh5/OnuGxmdu/TwUPApPmJxpR/+z4PaN92L/rxdYAXiyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(66556008)(33656002)(2906002)(66946007)(76116006)(8936002)(122000001)(110136005)(186003)(6506007)(38070700005)(66476007)(66446008)(64756008)(26005)(316002)(71200400001)(82960400001)(9686003)(8676002)(86362001)(52536014)(7696005)(38100700002)(5660300002)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3dSdHF4anVUalJiNWtFK2VGT0JBMFMyMWV1LzFvdGcyV2xaR1BoQzlhWlZF?=
 =?utf-8?B?ZnFEbWwydnR2RlVBN0JyOUkvTlVDL1FpTkpsRHRvTzNnS21YUVptSHFKMiti?=
 =?utf-8?B?M0V1YjRnWkNaSFRiUEwzWHpCYlI5MXU0UTlHVlNwdm5zZTd0NjVqNndEYkNJ?=
 =?utf-8?B?NFZxZ2lUeWNZZjYxaXJERDUvVFhNczBPb1l2cFVYL3pzTEEremJUUXI3N1dC?=
 =?utf-8?B?ZFUvTzZKamZ0MWh2QmNDWFBteVVHWDZYM1drY200MVF4MzBwdWs1YitiQitX?=
 =?utf-8?B?MWdGUUNOR1JWeTdWbWhWU1NNQ3kyMFozNG02cmZyMW5zOXRRYXlPTmJJbmpP?=
 =?utf-8?B?dUthdnNlZ0VZalNvTGxVanhzeTJMU2toWEs0QlVXMElSL1g2bTFjVlo2Qytz?=
 =?utf-8?B?d21HRE4wMTh0Vm9CYjZ5YkczMXdEUVRWeFBtRDA1aVk0SjlnNGxMOU9UdCtv?=
 =?utf-8?B?UnBKZ0l2WTFXQnUwV2JaMHAzK1JtZGp2VXZCYnhpdS9TaDAvb1oxWFMyS3FC?=
 =?utf-8?B?UlR3ckhQTk9aL29SRTVUWVZQOUZTVm9YNDI3cUpVaGp3cVJXQWJBa1V1aUhL?=
 =?utf-8?B?N1hRa1pPM3dlYmhoSTNNVmpkVXhOZjc3dUxEZWgzYXNsYXN2aURMQkJIT21W?=
 =?utf-8?B?ak43N1QvNHhZbVJnT0gxWnpWWEpORVNCRVZSMlExRXRHMUgyMnJxMFlsZEJH?=
 =?utf-8?B?Zmw4eCtLdGgwaVBubGxJRlZWcVQxSVJneXBZSlBHU0ZHQUxNN3pvSmpWbnFB?=
 =?utf-8?B?WjdaQlgzamFlRjZJWFVCRElYRnF2K29WSW1WdGZPKzV2SUp4UUppTmRLSzd4?=
 =?utf-8?B?d2ZIVjdYZGZ6SDZaTU14ZnREdnltcUFPc2p6YUtjNWd5d0xMQUlVaDBGMjg5?=
 =?utf-8?B?T0NUZHVGSDRsNHBqNE4ya0FKQzJ2Qmp3aEJlQi85aTgwdWVqUW1HZU4xeGpZ?=
 =?utf-8?B?cGFMT2lxc29TTml3bUVYbnpFaFVYdUE0WWV5QVBuYm05S2lCUmpIUEF3QnBj?=
 =?utf-8?B?cloweXFwNXZVNUFoV0x6cS90S2tVenZ0eStGUDBzZ0Rac2xrRSsxNDJtT0hI?=
 =?utf-8?B?bUxTNmNUUk5qaEc5UWhUcWMvbkkzaVA5MldNVFo0U1RGc1ZKR0RWZ3dEbVF6?=
 =?utf-8?B?WjdpOGhwY2NOUlBvNUtqUDVXTCs3M0tiZVprQlgyT09VYVUrTDIwK281QUxD?=
 =?utf-8?B?bjlyT09RZzVqUlRUdEZNQzVraHZSWnVOWFRuc1BBWEloUHh3cERwckNiNldR?=
 =?utf-8?B?UzVJQ0NmdlRjbDcwQ3V3NDRnQzhxQVJCcVU0VWhWSkVWV3NSdmVTRFRWUk5n?=
 =?utf-8?B?ZVNINUFkK2JNdzFLWmpBMHJqaG14MFJGdGdNdDdBQnZIV1g1Y2t1bFpjVlQz?=
 =?utf-8?B?NzdpOVE3eDZHNjVFbFg2Q3NEVHNlMXJSNkIrazZpMnJYNW5mTWkrVGlKRmZC?=
 =?utf-8?B?a2ZsYjErSkNHdHVPekhGbTZET0R2NDJlNU5XYXF4b2RvaW5hZmljeC91Qncr?=
 =?utf-8?B?bFBoMC9JQ2JKRG9rV1RQdUxIeGw5WFhHZ0hmUVp6RWx4eUE0QldzZThPMzM1?=
 =?utf-8?B?RTBVd0toYUdHaXZ5MHJOU3FwZFZydmd2QW9iK3JVUks5NFAvYU1rdDdQaksy?=
 =?utf-8?B?UnJuTDRaaGpqMG9JSVM4TXhPbUkyT1FON2JqUFdVdHBUZWpUMnBGN2xSWFBO?=
 =?utf-8?B?L3A4MW8wdml5QmFLblg2S0dzcEJiZzhXRjIzaTVFNUlRRitPVTVveTFIcmxO?=
 =?utf-8?B?WDU5R3hQcHFhUW9pbjNDa3FWemZpUjRXeWpITnh4UFU2MWhpNVFrT0hiR1FI?=
 =?utf-8?B?T01FbEtwZ1pyeW5td3BIaXlUemgrODY1ci8ydWZuNDExSnZkMUNxYVBMN1l2?=
 =?utf-8?B?ZUtRQXBtMnl4SG9aQU9FTzNrbjBPbXg1dTJtOWZEcm1pUCtJcTJxV2RsbDB3?=
 =?utf-8?B?WnFkYTJHVVhxb09GNFFIY1FWUzFFbXVtRDZVczdhQjcxaEkwVVB1MGZ6N2xq?=
 =?utf-8?B?TnZrZDY2Mm8xbEZTaThrQmhreGRKYnVzSWp4dTVJbFRlV21CWjRxRGxDVmxw?=
 =?utf-8?B?Smw3ZTdZankzM1hDZHNndzk4NHk3MkpZRjJWZmRBSWZnZnFzYkRPTUovWG5H?=
 =?utf-8?B?T3I5QURKemd4cUF1VVlRWUpQM0hJRTM4VHpLejBKZnVUekpTKzJYQmFFcjRp?=
 =?utf-8?Q?4CEyNabmssy9Wb5EoiSQaLQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e60a81b-1bb3-4527-97aa-08d9a7f7c557
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 05:21:25.8063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76yFM5z/XNMjxgkeV+HWpT/+JCdCTzAF9w0FjpNwtNPd9OwG/swJvW/P01CQqEiET/s+vytOfo/+yc7N+IbIQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1265
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgMTIsIDIwMjEgNTo0OSBQTQ0KPiANCj4gV2hpbGUgZG9tYWluX2NvbnRleHRfbWFw
cGluZygpIGludm9rZXMgZG9tYWluX2NvbnRleHRfdW5tYXAoKSBpbiBhDQo+IHN1Yi0NCj4gY2Fz
ZSBvZiBoYW5kbGluZyBERVZfVFlQRV9QQ0kgd2hlbiBlbmNvdW50ZXJpbmcgYW4gZXJyb3IsIHRo
dXMgYXZvaWRpbmcNCj4gYSBsZWFrLCBpbmRpdmlkdWFsIGNhbGxzIHRvIGRvbWFpbl9jb250ZXh0
X21hcHBpbmdfb25lKCkgYXJlbid0DQo+IHNpbWlsYXJseSBjb3ZlcmVkLiBTdWNoIGEgbGVhayBt
aWdodCBwZXJzaXN0IHVudGlsIGRvbWFpbiBkZXN0cnVjdGlvbi4NCj4gTGV2ZXJhZ2UgdGhhdCB0
aGVzZSBjYXNlcyBjYW4gYmUgcmVjb2duaXplZCBieSBwZGV2IGJlaW5nIG5vbi1OVUxMLg0KPiAN
Cj4gRml4ZXM6IGRlYzQwM2NjNjY4ZiAoIlZULWQ6IGZpeCBpb21tdV9kb21pZCBmb3IgUENJL1BD
SXggZGV2aWNlcw0KPiBhc3NpZ25tZW50IikNCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IFRoZSBGaXhlczogdGFnIGlzbid0IHN0cmljdGx5IGNv
cnJlY3QsIGFzIGVycm9yIGhhbmRsaW5nIGhhZCBtb3JlIHNldmVyZQ0KPiBzaG9ydGNvbWluZ3Mg
YXQgdGhlIHRpbWUuIEJ1dCBJIHdvdWxkbid0IHdhbnQgdG8gYmxhbWUgYSBjb21taXQNCj4gaW1w
cm92aW5nIGVycm9yIGhhbmRsaW5nIHRvIGhhdmUgaW50cm9kdWNlZCB0aGUgbGVhay4NCj4gDQo+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ICsrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC0xNTE4LDcgKzE1MTgsMTIgQEAg
aW50IGRvbWFpbl9jb250ZXh0X21hcHBpbmdfb25lKA0KPiAgICAgICAgICByYyA9IG1lX3dpZmlf
cXVpcmsoZG9tYWluLCBidXMsIGRldmZuLCBNQVBfTUVfUEhBTlRPTV9GVU5DKTsNCj4gDQo+ICAg
ICAgaWYgKCByYyApDQo+IC0gICAgICAgIGRvbWFpbl9jb250ZXh0X3VubWFwX29uZShkb21haW4s
IGlvbW11LCBidXMsIGRldmZuKTsNCj4gKyAgICB7DQo+ICsgICAgICAgIHJldCA9IGRvbWFpbl9j
b250ZXh0X3VubWFwX29uZShkb21haW4sIGlvbW11LCBidXMsIGRldmZuKTsNCj4gKw0KPiArICAg
ICAgICBpZiAoICFyZXQgJiYgcGRldiAmJiBwZGV2LT5kZXZmbiA9PSBkZXZmbiApDQo+ICsgICAg
ICAgICAgICBjaGVja19jbGVhbnVwX2RvbWlkX21hcChkb21haW4sIHBkZXYsIGlvbW11KTsNCj4g
KyAgICB9DQo+IA0KPiAgICAgIHJldHVybiByYzsNCj4gIH0NCg0K

