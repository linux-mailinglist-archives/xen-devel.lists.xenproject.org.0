Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1FE4345E2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 09:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213612.371893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md610-0000Bw-9G; Wed, 20 Oct 2021 07:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213612.371893; Wed, 20 Oct 2021 07:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md610-000092-5W; Wed, 20 Oct 2021 07:27:58 +0000
Received: by outflank-mailman (input) for mailman id 213612;
 Wed, 20 Oct 2021 07:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNaw=PI=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1md60y-00008w-Ad
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 07:27:56 +0000
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4396248-8b1e-4c55-abac-e64bf647859d;
 Wed, 20 Oct 2021 07:27:51 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 00:27:38 -0700
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga006.fm.intel.com with ESMTP; 20 Oct 2021 00:27:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 00:27:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 00:27:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 20 Oct 2021 00:27:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 20 Oct 2021 00:27:36 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN7PR11MB2756.namprd11.prod.outlook.com (2603:10b6:406:b4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Wed, 20 Oct
 2021 07:27:35 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 07:27:35 +0000
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
X-Inumbo-ID: e4396248-8b1e-4c55-abac-e64bf647859d
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228589058"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="228589058"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="718789594"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=en3XE2yE/lwtuWPdRf4VawYV9bx9rXiQmnAZrDhnxOEgjySGYMHBOk0ktdNeEmOnLSWHINs0bjH7g50WbZOj2RtEvaCr92ZjmjsA5ar9JE/J23m4sSYkfdILxE63+RAT/ClJQgc6WETI67k436dEHeK/F9qGCEXBTv23aB4MrKjb1JuCM7z2mCiz/+T40xgRPYyXCHeT/Ok5pr3Sm4wHkbIYdtUDK60yKdz+hekYm/NzzKXz3ghhTXlAB78nggsjT+i9FG1dQeHwzK5sesL55yi3obdssv9u9hi9X4RM3B3/AtB20eV39n3ORNAqjxuPfu3Q4rdOA3zcox1IYTUv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iv5yAP3HDQy1yuUjzAtq/fyPUO3Eptuupw47x9gQ9iI=;
 b=W6rMhTfC3OmmVkKHkEoJ+wU1xtBreVj4Rw7T54/Exws56nGFWPO3WlkH45VSJiV4P9BfN8rZil+hEQDl77paTq4QUlK3temZDxHbbfEYr/S6l8jYa04avF63fKavF1+VHn1pS1wjyjRAT9iPQHFA34UHnO+xLL8XJsI9LG8Zmk01+mfa2eySBTxim15ugsYvnUPeUzIHEE/eN/dvHygJb76xF1xsnx4ucwlGBDIrhoZXyYGdyjUCo18p7Wwd0iLJqfyQeFXmY0qaDD2H55GQamlVNhWsZqa5UlkodtZGA2mWu6J4mJVIEn5jMDwmVQrmNYokcpK0x15N0Vb0d3uCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iv5yAP3HDQy1yuUjzAtq/fyPUO3Eptuupw47x9gQ9iI=;
 b=nlmreOCh0eE6Lka/safxLI03mhi+JFZc9BkG4emdxBk64taxg9b4MI2nmsVMDZ3ORwbNaHhvLeh12uiVDRXbOdgcQENfFE+9FUWtvNL019f0D5KkzUGF5R3gx9gjIxIjAUZ+0KBqBQ/sr0Ms+UgMsIib34JWlEmbi68uUwpAFBA=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH v2] x86/PoD: defer nested P2M flushes
Thread-Topic: [PATCH v2] x86/PoD: defer nested P2M flushes
Thread-Index: AQHXxOg3VYoV4RswS0ul132Ao1qT4KvbffvQ
Date: Wed, 20 Oct 2021 07:27:35 +0000
Message-ID: <BN9PR11MB54330A45289DA8B3C8DFCB5A8CBE9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <c6f2dcd7-81e6-3fb6-0e13-3ffb95e12bc1@suse.com>
In-Reply-To: <c6f2dcd7-81e6-3fb6-0e13-3ffb95e12bc1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1326f056-060f-4ab5-a95b-08d9939b1669
x-ms-traffictypediagnostic: BN7PR11MB2756:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB27563774A307CC0C432F72538CBE9@BN7PR11MB2756.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qM8vj5Hck19/s9s4TQ2ZPVNoOjK8Nbho2+h17BfPE3PvlN1tiCyH30tB6EXeMc8uvJ8McaPJXu8ZLLexozX0r7IlMXnREuaET+ftMqaQSgFyodWxqqraqWKF0FEUmjRQ4grQ4gBCBKz1DLMEFiuDK5BxwrzUmNkNSX0d8NpILNjSsazOlgan1IWgK5ClpC1JlhRuOxka+L0J4KV+XP3nayjIWBpa9So0zYfs0yyqS6ssu1IjqxPEVVcUbxzdhLu6Smv64nNtiL+iAmbRgQwwPpuwZVZ6ipd2drRZ8xkg8wwZycFZFCxTAbJLyMwKh9F0eGf9LiZG+oFMVoZmXCC5hMPPqdCy1cFEFpB7Bafxg47UWl7K5h/Ts53CPD6YR4vE0xFyfqUPIpOX3Zoyyw97lG/MON/FmXwgpa6/5NdcTZX/FPW5el5oWBCdvCu7F1S0J5nElAEKVSa+ptSarmwjN0P9HE6eGYaSMGs+cQWvdIkUmf+VkICnJHdVK4/BV8E5VcE8tR573nk7pQoBI0dyGxxQZlclr7Vd3F6vWYYmcybi+U/jDwQkJOa7cuxKLqedl+X5brwnxPJho3vOdTCneVha6iIB/ufdywuBmV3bXDZdCrmJzW+WmiYv5PJmiIiFSNoatAEdTo9uav79/7fUsIshuDEmC1xTTz+vz9iSv8TBq37xbzYuOE6QmGaXK/iF6ciItobOIs8/cBqWAEPGFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(66446008)(54906003)(508600001)(86362001)(186003)(64756008)(7696005)(5660300002)(122000001)(33656002)(110136005)(52536014)(316002)(83380400001)(6506007)(26005)(8936002)(38070700005)(2906002)(82960400001)(66946007)(76116006)(8676002)(38100700002)(66476007)(55016002)(66556008)(71200400001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDduQ2FUVm5zMVdwbVhqTEN0NUNyejYzMndseVVtVU9Lby8wRUwwZW1IVURr?=
 =?utf-8?B?RTF6dEZCamY1b3ZkRkM5MFhYc3QvbVNKTVJPdjVpQ1F3dDNGd2RZQXE4MC9m?=
 =?utf-8?B?M0JzRHM5WnNiYUtGRG5RbUZhWWhNaFlQNTRtRUhBUzVobkFWNXdacmxRbDBa?=
 =?utf-8?B?VkFPaXJQbnBNWngyZTFkdlhzZ1dvblpzRkhuSUdENW1ORVVnWTdmMExMOVZ5?=
 =?utf-8?B?bCtFcUxPU2FBZmFhM0VVTGdVRmk3Zk00M0krQzQwSnRqak9NUVN3a053bjVt?=
 =?utf-8?B?RlBBTGpSSElEL05QZllKUW0yd3lBdXc0cUV1MmxBZUdBZjlrVkFGbm0yeDA5?=
 =?utf-8?B?NTdwVkd4MWF5NDVHemtldERoTEZ5NXZVaDNPL0xqbmhQcmZEZVRpSllLcGN0?=
 =?utf-8?B?aTVVb3AybENERForMW10bXVxc3NXRHFjL3dHRThhd0ZSY1pkSTYxVlNkUktx?=
 =?utf-8?B?M3BqUWYvdjYvVDc2MUU4dm5Vc2xNQmpGbXRWclhQc0xPU3hseUdDMExhQTla?=
 =?utf-8?B?L000TEJTV0kyQ3A5VnRHaEt5YWFvdzV5S3FQb3JBRVdPWnlHU2p6dHd5Kzd6?=
 =?utf-8?B?VkFUWS8wS2tlRUJaVmoxalFCaWJsbjFUTHYzM2ZjeTZaR2owRm8zVWxMbEE2?=
 =?utf-8?B?dUxIRkJ5NEgzeVJJaDRTcmdFWWJPbWtGTUF3RTgxQkE4bC9OZ09wRS9JejIw?=
 =?utf-8?B?V2IzZnRUWVRPZGpucUNUT3pMMGxFQmhsWHcwbTVFcW1LOWRyaEkzYklvV1ZJ?=
 =?utf-8?B?WHpWckJmYjJ5Q0luSmk4SW9takpxaExHaVFuTDZRUzhhS2t0SDhINXV4a3M2?=
 =?utf-8?B?UUc4dHZNNDBwcG5CZ05rb0hMV0hnYnpsczU0eWs0djRFc1cvZFhZSTBKTlpG?=
 =?utf-8?B?OGhwb2w0WGZ5Mm1KUDZtbmovV1pNc1UzazM5bWFNVUFHMHlUbEphVlVnaVVt?=
 =?utf-8?B?cGFLSytwNS9IRXY1ajFiZVNoRzhHSWFLZ3FCVEs5MlNwcFYyeXlEbmcxYU85?=
 =?utf-8?B?WXJjVHg3endWWnVaRC9Rc1NhNmNUVU9zTEtIemVkdVJFUnZ1RzFXaXFLQmE4?=
 =?utf-8?B?THhLK2x1YjdnOGJnODl2THFpRlU3SDUwT3dndFdJT29rTDh2SmJrcWt5N25i?=
 =?utf-8?B?STF0SE9QNGJZZC9vSWRCZzlhWkFZUDg4L2VWT21INzY4aEE1SlcxSUhhR21R?=
 =?utf-8?B?V1crbjBIalpEWmNvN0t5bnltbnNKWGkxTVpzR3czS25PNHEwL3NOZnUvcndO?=
 =?utf-8?B?bldpeWV6NXFFaDU3dXNDVWNCZjFjU1JtMUdUeHBlTytnQkVSNEtWVHRLbVdk?=
 =?utf-8?B?WHU5VTN6QmNySEJXRjlEQ0RQTjhKUG90VWVOQmZZUkQwZDlKRnE0K0hBZG9o?=
 =?utf-8?B?MmhvWHpFTVVXNkZXTUpyNFBFeGNNZXMzNDNvTmlUaFVGM05VMXYrRjFMdXlZ?=
 =?utf-8?B?MlZxOUFCWXNpenBBNkFtcWNZN2hkV1BlUGxTZ1oyb3pTZVFNUHhiQWJxMjRo?=
 =?utf-8?B?MWZyYmhxVWt4bWtKcDRPOHVTNTBvYit0cmpGREpIdjlieWlXekNHUkFQSWZ2?=
 =?utf-8?B?bEpoOUZPNElKTUlGVkVaZDhjY2xhTHFvNjJEUU0rRGNoOFJHNzJZOTdxVEk4?=
 =?utf-8?B?dS9wTmNTWEE2UjI0Y3RFY1RibWZ3eVJ3d2xlb3A0NHJrbnFSTTZ6MlBUejIw?=
 =?utf-8?B?clpXOENlT0xDRTdDSWVCMk5WRzNZclJjRFpDWmMwQ0J0dk9aREFsU0RSZnRQ?=
 =?utf-8?B?dTc3Z0NnK0ZGOENibkZhbWJBUXFJK21GZ1FhNFJhamtaK0IwOVpwSDBMNEdM?=
 =?utf-8?B?amhIbytXWWFyMjROOEtFMlo2V3pIM3c5RzdMdFE2MHdKT3p0eXdqUUgyYk1K?=
 =?utf-8?B?Mm5nbWNTck1EM01FV0xLbGxYWWhzc3VGLy9WbGZ6OFlnYURTRnlBNXYvQjdL?=
 =?utf-8?B?bE1qeHdEUjFCYk91ekZiaWhFRUZtVHBJcXVpMXlrcWFxSmludDg4VTYzMDg2?=
 =?utf-8?B?U01NTEJ0eTVHRkFPQlZ0RmpPWSt2NVNmOFhodStFaHIyZ1Qwb3VMcnVlZHYv?=
 =?utf-8?B?SlU5MGVONk93c3Zkam9Hd1lCYnp3bWxaRVNrSDVJRHk1a1kvSm5GdDgzYk95?=
 =?utf-8?B?SERCNkZ5dzBsK0NqR2JTZHpzUS9OaXZCOS9OTlFoeTJqQVY0bkcvUnJ0eWh2?=
 =?utf-8?Q?Fmzl+bwOPOo5UiT5uMNE6CU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1326f056-060f-4ab5-a95b-08d9939b1669
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 07:27:35.3807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4XG30eUnoELiBVdeJ9Ny3vBZuFWNDGdBMhC9dztAWrp3y7fYki4oH3PC+odV2sooThssciRpvKJjCcqG8qxEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2756
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE9jdG9iZXIgMTksIDIwMjEgODo1MiBQTQ0KPiANCj4gV2l0aCBOUFQgb3Igc2hhZG93IGluIHVz
ZSwgdGhlIHAybV9zZXRfZW50cnkoKSAtPiBwMm1fcHRfc2V0X2VudHJ5KCkgLT4NCj4gd3JpdGVf
cDJtX2VudHJ5KCkgLT4gcDJtX2ZsdXNoX25lc3RlZHAybSgpIGNhbGwgc2VxdWVuY2UgdHJpZ2dl
cnMgYSBsb2NrDQo+IG9yZGVyIHZpb2xhdGlvbiB3aGVuIHRoZSBQb0QgbG9jayBpcyBoZWxkIGFy
b3VuZCBpdC4gSGVuY2Ugc3VjaCBmbHVzaGluZw0KPiBuZWVkcyB0byBiZSBkZWZlcnJlZC4gU3Rl
YWwgdGhlIGFwcHJvYWNoIGZyb20gcDJtX2NoYW5nZV90eXBlX3JhbmdlKCkuDQo+IChOb3RlIHRo
YXQgc3RyaWN0bHkgc3BlYWtpbmcgdGhlIGNoYW5nZSBhdCB0aGUgb3V0X29mX21lbW9yeSBsYWJl
bCBpcw0KPiBub3QgbmVlZGVkLCBhcyB0aGUgZG9tYWluIGdldHMgY3Jhc2hlZCB0aGVyZSBhbnl3
YXkuIFRoZSBjaGFuZ2UgaXMgYmVpbmcNCj4gbWFkZSBuZXZlcnRoZWxlc3MgdG8gYXZvaWQgc2V0
dGluZyB1cCBhIHRyYXAgZnJvbSBzb21lb25lIG1lYW5pbmcgdG8NCj4gZGVhbCB3aXRoIHRoYXQg
Y2FzZSBiZXR0ZXIgdGhhbiBieSBkb21haW5fY3Jhc2goKS4pDQo+IA0KPiBTaW1pbGFybHkgZm9y
IEVQVCBJIHRoaW5rIGVwdF9zZXRfZW50cnkoKSAtPiBlcHRfc3luY19kb21haW4oKSAtPg0KPiBl
cHRfc3luY19kb21haW5fcHJlcGFyZSgpIC0+IHAybV9mbHVzaF9uZXN0ZWRwMm0oKSBpcyBhZmZl
Y3RlZC4gTWFrZSBpdHMNCj4gcDJtX2ZsdXNoX25lc3RlZHAybSgpIGludm9jYXRpb24gY29uZGl0
aW9uYWwuIE5vdGUgdGhhdCB0aGlzIHRoZW4gYWxzbw0KPiBhbHRlcnMgYmVoYXZpb3Igb2YgcDJt
X2NoYW5nZV90eXBlX3JhbmdlKCkgb24gRVBULCBkZWZlcnJpbmcgdGhlIG5lc3RlZA0KPiBmbHVz
aGVzIHRoZXJlIGFzIHdlbGwuIEkgdGhpbmsgdGhpcyBzaG91bGQgaGF2ZSBiZWVuIHRoYXQgd2F5
IGZyb20gdGhlDQo+IGludHJvZHVjdGlvbiBvZiB0aGUgZmxhZy4NCj4gDQo+IFJlcG9ydGVkLWJ5
OiBFbGxpb3R0IE1pdGNoZWxsIDxlaGVtK3hlbkBtNXAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gdjI6IEFsc28gYWRqdXN0IGVwdF9z
eW5jX2RvbWFpbl9wcmVwYXJlKCkuIEFsc28gY29udmVydCB0aGUgZmx1c2ggYXQgdGhlDQo+ICAg
ICBvdXRfb2ZfbWVtb3J5IGxhYmVsLiBFeHRlbmQgZGVzY3JpcHRpb24gdG8gY292ZXIgdGhlc2Uu
DQo+IA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jDQo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9wMm0tZXB0LmMNCj4gQEAgLTEyNTMsNyArMTI1Myw3IEBAIHN0YXRpYyB2b2lkIGVw
dF9zeW5jX2RvbWFpbl9wcmVwYXJlKHN0cnUNCj4gICAgICB7DQo+ICAgICAgICAgIGlmICggcDJt
X2lzX25lc3RlZHAybShwMm0pICkNCj4gICAgICAgICAgICAgIGVwdCA9ICZwMm1fZ2V0X2hvc3Rw
Mm0oZCktPmVwdDsNCj4gLSAgICAgICAgZWxzZQ0KPiArICAgICAgICBlbHNlIGlmICggIXAybS0+
ZGVmZXJfbmVzdGVkX2ZsdXNoICkNCj4gICAgICAgICAgICAgIHAybV9mbHVzaF9uZXN0ZWRwMm0o
ZCk7DQo+ICAgICAgfQ0KPiANCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1wb2QuYw0KPiAr
KysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLXBvZC5jDQo+IEBAIC0yNCw2ICsyNCw3IEBADQo+ICAj
aW5jbHVkZSA8eGVuL21tLmg+DQo+ICAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+DQo+ICAjaW5jbHVk
ZSA8eGVuL3RyYWNlLmg+DQo+ICsjaW5jbHVkZSA8YXNtL2h2bS9uZXN0ZWRodm0uaD4NCj4gICNp
bmNsdWRlIDxhc20vcGFnZS5oPg0KPiAgI2luY2x1ZGUgPGFzbS9wYWdpbmcuaD4NCj4gICNpbmNs
dWRlIDxhc20vcDJtLmg+DQo+IEBAIC00OTQsNiArNDk1LDEzIEBAIHAybV9wb2Rfb2ZmbGluZV9v
cl9icm9rZW5fcmVwbGFjZShzdHJ1Y3QNCj4gIHN0YXRpYyBpbnQNCj4gIHAybV9wb2RfemVyb19j
aGVja19zdXBlcnBhZ2Uoc3RydWN0IHAybV9kb21haW4gKnAybSwgZ2ZuX3QgZ2ZuKTsNCj4gDQo+
ICtzdGF0aWMgdm9pZCBwb2RfdW5sb2NrX2FuZF9mbHVzaChzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
KQ0KPiArew0KPiArICAgIHBvZF91bmxvY2socDJtKTsNCj4gKyAgICBwMm0tPmRlZmVyX25lc3Rl
ZF9mbHVzaCA9IGZhbHNlOw0KPiArICAgIGlmICggbmVzdGVkaHZtX2VuYWJsZWQocDJtLT5kb21h
aW4pICkNCj4gKyAgICAgICAgcDJtX2ZsdXNoX25lc3RlZHAybShwMm0tPmRvbWFpbik7DQo+ICt9
DQo+IA0KPiAgLyoNCj4gICAqIFRoaXMgZnVuY3Rpb24gaXMgbmVlZGVkIGZvciB0d28gcmVhc29u
czoNCj4gQEAgLTUxNCw2ICs1MjIsNyBAQCBwMm1fcG9kX2RlY3JlYXNlX3Jlc2VydmF0aW9uKHN0
cnVjdCBkb21hDQo+IA0KPiAgICAgIGdmbl9sb2NrKHAybSwgZ2ZuLCBvcmRlcik7DQo+ICAgICAg
cG9kX2xvY2socDJtKTsNCj4gKyAgICBwMm0tPmRlZmVyX25lc3RlZF9mbHVzaCA9IHRydWU7DQo+
IA0KPiAgICAgIC8qDQo+ICAgICAgICogSWYgd2UgZG9uJ3QgaGF2ZSBhbnkgb3V0c3RhbmRpbmcg
UG9EIGVudHJpZXMsIGxldCB0aGluZ3MgdGFrZSB0aGVpcg0KPiBAQCAtNjY1LDcgKzY3NCw3IEBA
IG91dF9lbnRyeV9jaGVjazoNCj4gICAgICB9DQo+IA0KPiAgb3V0X3VubG9jazoNCj4gLSAgICBw
b2RfdW5sb2NrKHAybSk7DQo+ICsgICAgcG9kX3VubG9ja19hbmRfZmx1c2gocDJtKTsNCj4gICAg
ICBnZm5fdW5sb2NrKHAybSwgZ2ZuLCBvcmRlcik7DQo+ICAgICAgcmV0dXJuIHJldDsNCj4gIH0N
Cj4gQEAgLTExNDQsOCArMTE1MywxMCBAQCBwMm1fcG9kX2RlbWFuZF9wb3B1bGF0ZShzdHJ1Y3Qg
cDJtX2RvbWFpDQo+ICAgICAgICogd29uJ3Qgc3RhcnQgdW50aWwgd2UncmUgZG9uZS4NCj4gICAg
ICAgKi8NCj4gICAgICBpZiAoIHVubGlrZWx5KGQtPmlzX2R5aW5nKSApDQo+IC0gICAgICAgIGdv
dG8gb3V0X2ZhaWw7DQo+IC0NCj4gKyAgICB7DQo+ICsgICAgICAgIHBvZF91bmxvY2socDJtKTsN
Cj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArICAgIH0NCj4gDQo+ICAgICAgLyoNCj4gICAg
ICAgKiBCZWNhdXNlIFBvRCBkb2VzIG5vdCBoYXZlIGNhY2hlIGxpc3QgZm9yIDFHQiBwYWdlcywg
aXQgaGFzIHRvIHJlbWFwDQo+IEBAIC0xMTY3LDYgKzExNzgsOCBAQCBwMm1fcG9kX2RlbWFuZF9w
b3B1bGF0ZShzdHJ1Y3QgcDJtX2RvbWFpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwMm1fcG9wdWxhdGVfb25fZGVtYW5kLCBwMm0tPmRlZmF1bHRfYWNjZXNzKTsNCj4gICAgICB9
DQo+IA0KPiArICAgIHAybS0+ZGVmZXJfbmVzdGVkX2ZsdXNoID0gdHJ1ZTsNCj4gKw0KPiAgICAg
IC8qIE9ubHkgcmVjbGFpbSBpZiB3ZSdyZSBpbiBhY3R1YWwgbmVlZCBvZiBtb3JlIGNhY2hlLiAq
Lw0KPiAgICAgIGlmICggcDJtLT5wb2QuZW50cnlfY291bnQgPiBwMm0tPnBvZC5jb3VudCApDQo+
ICAgICAgICAgIHBvZF9lYWdlcl9yZWNsYWltKHAybSk7DQo+IEBAIC0xMjI5LDIyICsxMjQyLDI1
IEBAIHAybV9wb2RfZGVtYW5kX3BvcHVsYXRlKHN0cnVjdCBwMm1fZG9tYWkNCj4gICAgICAgICAg
X190cmFjZV92YXIoVFJDX01FTV9QT0RfUE9QVUxBVEUsIDAsIHNpemVvZih0KSwgJnQpOw0KPiAg
ICAgIH0NCj4gDQo+IC0gICAgcG9kX3VubG9jayhwMm0pOw0KPiArICAgIHBvZF91bmxvY2tfYW5k
X2ZsdXNoKHAybSk7DQo+ICAgICAgcmV0dXJuIHRydWU7DQo+ICsNCj4gIG91dF9vZl9tZW1vcnk6
DQo+IC0gICAgcG9kX3VubG9jayhwMm0pOw0KPiArICAgIHBvZF91bmxvY2tfYW5kX2ZsdXNoKHAy
bSk7DQo+IA0KPiAgICAgIHByaW50aygiJXM6IERvbSVkIG91dCBvZiBQb0QgbWVtb3J5ISAodG90
PSUiUFJJdTMyIiBlbnRzPSVsZA0KPiBkb20lZClcbiIsDQo+ICAgICAgICAgICAgIF9fZnVuY19f
LCBkLT5kb21haW5faWQsIGRvbWFpbl90b3RfcGFnZXMoZCksDQo+ICAgICAgICAgICAgIHAybS0+
cG9kLmVudHJ5X2NvdW50LCBjdXJyZW50LT5kb21haW4tPmRvbWFpbl9pZCk7DQo+ICAgICAgZG9t
YWluX2NyYXNoKGQpOw0KPiAgICAgIHJldHVybiBmYWxzZTsNCj4gKw0KPiAgb3V0X2ZhaWw6DQo+
IC0gICAgcG9kX3VubG9jayhwMm0pOw0KPiArICAgIHBvZF91bmxvY2tfYW5kX2ZsdXNoKHAybSk7
DQo+ICAgICAgcmV0dXJuIGZhbHNlOw0KPiArDQo+ICByZW1hcF9hbmRfcmV0cnk6DQo+ICAgICAg
QlVHX09OKG9yZGVyICE9IFBBR0VfT1JERVJfMk0pOw0KPiAtICAgIHBvZF91bmxvY2socDJtKTsN
Cj4gKyAgICBwb2RfdW5sb2NrX2FuZF9mbHVzaChwMm0pOw0KPiANCj4gICAgICAvKg0KPiAgICAg
ICAqIFJlbWFwIHRoaXMgMi1tZWcgcmVnaW9uIGluIHNpbmdsZXRvbiBjaHVua3MuIFNlZSB0aGUg
Y29tbWVudCBvbiB0aGUNCg0K

