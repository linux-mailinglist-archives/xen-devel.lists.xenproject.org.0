Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D944FE23
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 06:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225640.389678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUM5-0003G6-Oj; Mon, 15 Nov 2021 05:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225640.389678; Mon, 15 Nov 2021 05:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUM5-0003EI-L7; Mon, 15 Nov 2021 05:16:33 +0000
Received: by outflank-mailman (input) for mailman id 225640;
 Mon, 15 Nov 2021 05:16:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rbjM=QC=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mmUM4-0003EA-2B
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 05:16:32 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fdd5181-45d3-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 06:16:30 +0100 (CET)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 21:16:28 -0800
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 14 Nov 2021 21:16:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:16:27 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:16:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 14 Nov 2021 21:16:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 14 Nov 2021 21:16:26 -0800
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN0PR11MB5759.namprd11.prod.outlook.com (2603:10b6:408:168::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Mon, 15 Nov
 2021 05:16:25 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%9]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 05:16:25 +0000
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
X-Inumbo-ID: 2fdd5181-45d3-11ec-a9d2-d9f7a1cc8784
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220268198"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="220268198"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="734836624"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hh7uO3Y0yVtlzhIZ91/Rz21Iv2MDUR6CcUpYbAY9vQk9vD2C0i/1f9HxJm7p8eeSvCoRSNGF4az8OJ0FuVfzvzaHmgk4fQiqqLQVOhGe37oS5ECocAHcOeqyBaUIXSI5t/94MA/s2jNCyk/rMGWRrB7ZeeHDsvdrg8n29xPm07g0sUzdSr0+k2cNLpmSSH9b6rgAUy0aSqciVhffwUbDSwrC8R4y9JgI0DREsTcvZwyOo/xgfmsMMlyfLCAyrjlG72R5NJKNaTYaJPjiBPXMjqXdeLwyoN+9tC4fbncCVfnqrF4jnXTTdWLk1UGZpy+injEqEDcsQZ6zHa/Z4v8M1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euvWnA5gNksxlJu0iR5E1/h5o+xmrjl96QdNtbzx46Y=;
 b=E3AV/2c4EVHbnU9vAypH+p5G6QqjWIbUqaQzYcmHGAoDhkNN8HE7AM29N3wHKU992FHA22xWdf4hHdEZ4FpwUlpj5YetvV/KLncGHPTDZEwx+6htE2UudQMe5LFcZB/Mi55bpd379yBDzyffWNK/4Hh9OYpkB8lT7liXfKUCy9JeR+qZp96K8qgwPS4ohEGg0JOK7xO5DRuNTJ1DTMu1vcaa710fhE+W76Mui0c6FmQz37c/DnE5FOiK6ydqnScOYz4qkVbzYyZAuch71b7Aqb1gKsWD8QotpyyG0rzoB3PJ6l1RB1sMhQeCFUgupT85z8RaNWyKuFeQ9VUgPuOX5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euvWnA5gNksxlJu0iR5E1/h5o+xmrjl96QdNtbzx46Y=;
 b=RAOBc3pfzhkcIvZL9Pp2RZwOl/Krmq/th5TZfcSVx3Qa7cNr7AMo4za/fpC/TldtoT+k7kA+KIuVKRZfyO5hfMFmvRoCzThgUImT5nqyZlq6YOwMXVnsTsVHQJebKnlauomaRkMteWM23femEB92p5ayribGCfDnb3QjUQfYIUs=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/6] VT-d: split domid map cleanup check into a function
Thread-Topic: [PATCH 2/6] VT-d: split domid map cleanup check into a function
Thread-Index: AQHX16p16FVi6A9hH0KPevO89n4c9qwEEHWA
Date: Mon, 15 Nov 2021 05:16:25 +0000
Message-ID: <BN9PR11MB5433ECC3C1DA8902488BA6C28C989@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <57c32156-369c-a92a-ecc0-fc4b890eb05c@suse.com>
In-Reply-To: <57c32156-369c-a92a-ecc0-fc4b890eb05c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bab5d81f-ffc2-4b23-8128-08d9a7f71232
x-ms-traffictypediagnostic: BN0PR11MB5759:
x-microsoft-antispam-prvs: <BN0PR11MB57592E3ED5CF608B38FE45AF8C989@BN0PR11MB5759.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hsqmtvitLr26fJGHMSmCnpps0jEU8ExbUvPPvvICMgVVZiRaXf9dpNFtbfjDasp3oGKiVxlrTLzoPmFjBke/QqfZ22SetT7Nv9qSBSMNEJcJ7iBGreMZVNqeJ5Lvkl/QDLznI7YWKM1XO2yjqH1gC8Mdo2iR0Dx1S2wpMUUpWUp+vmpdtgpEG/JMDXMWtxWVsg/3toe2SEoweFG3GA9R7Rwu/Sp+BWY2bIyjQzTanS7OwwXaxSzv62HeLOHXgtFX5m8phCxm+dKsCxjKumk6Aw1M+5Irt4ovAVujcJwuXajJ63KkCUMwS6pajcju3HXV5bXLj3Gg0LW2Rz02H2fj/TlhafkYQSFzZufIR8lKLocG3vTyR0COoR2USZS3A0VoumUeUtBS7APWWSMfH2pk48hfIBHfP46rT97TKmo4CdVe+NjMQidjbBU8qW9/ZGCDxABMiV1TmqNWy3Ddi0wL5oumJDec3vcwUckjWFlvYCvKc7Mf/qy+rE1QlunCDChBNpVRZWF4m650x1PeJO8z+0BukxG+dUGkrwZd26bahYM8vHCmS9W89ys6iM9LR64KTTcH6dJd6PQErMgCeuitr39Q291zDemgjM+BIM4LWBfHwTue+bJpcQw/NVKU7DKqqTtiozsSufOJmNveeunchMPAvkop+3kOwt9lfvhsUATliUejYMu5ggsZf/N82dxWIyx3QgPVD6rVj+MnOUdc5Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(38100700002)(76116006)(8936002)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(82960400001)(6506007)(110136005)(2906002)(7696005)(5660300002)(508600001)(33656002)(122000001)(52536014)(71200400001)(26005)(9686003)(8676002)(38070700005)(55016002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVNuSS83UThYa09idm5NUlRxWXFYdU9ERVRTSmtKUE1CNCswOSs5a3dsWTFH?=
 =?utf-8?B?eTNiQlpTbUFFVVM0V0VQRmtpSVA1S0NONU8yckFHT1NKeEJ6SEtLZXh6RTJW?=
 =?utf-8?B?dU1COHN2R3h2VEFHQU44RUMrSzY4U3J3YXpjd09QMS9IeWdtanBRckxJRVBS?=
 =?utf-8?B?RDRkaFhHN1dsWU81cllOY3hyV01zT3JldnFVZCtuTTNYc2dKYjgxM3RiTmhT?=
 =?utf-8?B?Z2tNZVpZOWhMYk1vSGlyK3lMSWtmdnlTazZHckY3bFNYUExtVUZNWDZsMGFC?=
 =?utf-8?B?bHZ3ZTFGakx0dmVWYTIvZENLeDV5UVUwY241MHN1Z3YwcFpzdVY0S1V6Z0tj?=
 =?utf-8?B?TXd4RDlNN25OZGtrNkZ2dXdYMVRMNlA1WUIrL2ZFY25IVGthYVBZT1pObUhE?=
 =?utf-8?B?WDBsd05sY0E4OWtUMUhSdzd0dVBIMjQ5eE9MVEVyb0ZUNGhiTW5CWEVCK0E0?=
 =?utf-8?B?dmJJZWlpSS8zdEs0VzFQcHBXY1gxSC9BeElrQ25MS2p6Y2dLRTRDeFlKemlW?=
 =?utf-8?B?Q0Y4cW8zM1JOZE53dDYyL3NkUWxWU3p4ZVd4Q3dHT2NYamJtMGEydVc4RXpO?=
 =?utf-8?B?bllHK1BHRStXUnhVQVdSeWdjbEJjTHJzR21rd0JyaFJNeDVBdmtWV3VCWGN1?=
 =?utf-8?B?STdZa3ZWeGxhV2kxQ1gxVjNwVmhiWkVBV0kzQUJ0aDdqeFdYcGdRcXA0SWtp?=
 =?utf-8?B?OGowMjJiYWZlRVFKWVhLNkRyK3BheTF5aktYZXo3M1FVRzFoS2ZpMkYxY0x4?=
 =?utf-8?B?Y1BIZ0UxQUZpNmorQzF6NlFhaG9pMmVLdlRQRlhDSDhRd1dWUnE3dE9Sd3F3?=
 =?utf-8?B?c3NUOVhHSWs5cXhWbVBwc2ZocXVoTjhIbkgxVk1xQnR4K0R2NU9VSDBpdkxE?=
 =?utf-8?B?dlNJZnFEbXNNSUs4VVlBMDBJcis4K1AvdVpDZ2NseTR3T0NUY202c1NBMll0?=
 =?utf-8?B?L3oxVk4zU2ZYL0RBcFdaOE5xTE9GWWQzamhHVzFCTnpsNmRidU9KUmRvb1dS?=
 =?utf-8?B?SUJMTDgvU1dSZDc1TC9ZRm9MZmFKNVRzU1d6cEl4Uk1rajdaZlNiTUk0dGor?=
 =?utf-8?B?VUdvaHRCSzJ4ekdGV0Q5RTVhT2luMzZ5dGtyVFBWTEJHTUNEMUdzb0ZWN0xr?=
 =?utf-8?B?dFpTamREVm1xZ3NqSkpjcit6cGJ6TU5nQ2tRRHpsNm9RMDVFMUtxOHJFaUtw?=
 =?utf-8?B?TExNZ2IvMTIyanJ4WGVrK0JLOTJNNDV5TWl0eS90WjBLeUZBYU5CelFGVm1W?=
 =?utf-8?B?NW9SeXNBaDdHMVA3SWJRdnJVUExyL3VwUjVwTGJvSUUwU1h3R3ZTSXJrRHoy?=
 =?utf-8?B?ckx0TGtGRXIwRTJpUGVZVDZDd0gvcGJzeEsxUzlSVGxBLzByaENNckJpd0l6?=
 =?utf-8?B?SElzWmVHWDExYjhwVmdwdmh5eGNlRnk3QlBsQlV5d2VBd1hZckU3eXVUVW11?=
 =?utf-8?B?YTM1WUN5dUZYSDU3Rnk3YVN5K1JxL2NnSmk3QkxMNmZHQWJwZGp6SGUwdEty?=
 =?utf-8?B?WTAwUS9kRFBhRDlWUmIxYjZpTUVzdnZQRkNrYjB0SHdFMXhSb1ExZkRzUnRC?=
 =?utf-8?B?TjR6RnhIWUUyUnA0aDVGQ3U1RTEvMjExOTk5a3djTFFDbmt2Vm1VdVkxd3JO?=
 =?utf-8?B?WmZOWmlNdjZkVUNjTytSMXQzbjUyR09kV1FkaWNuZGk3L2FwNFFwWjhMd1h6?=
 =?utf-8?B?MVh6SnNwRVJwODJXdHRIWnN5Szgyd0NKNHk3ajR5eHozbUtGeEhBN0tQVHFI?=
 =?utf-8?B?dnB4d2QyMEhzdUp1TVdlWFlRQ25XZ1ZiSGo3aG8ralZqVWZORlh4bVZjUi83?=
 =?utf-8?B?MlVUbkwzNDlLNzNDNHY0WjNMdklxS2VwN2xFL0ZmTXh5Wmt6R1hZVGxSbUh6?=
 =?utf-8?B?WFk5Y1ZVbHR5SkM0S0gzT1ZkeTdPcW9uWUF0TUF4SUppeHAwRVlocTdER0ds?=
 =?utf-8?B?b1VaNEhDM0p0a3dFYVNxaTBLN05tYmtNcGdKeVZsL1pxK2xodXlRbDlsUnkx?=
 =?utf-8?B?d1IxYnN1RkpJMFdKY09HbzZYc0kyR2NtNWJYU2RwUUFNNXpyWXlra1plaUFY?=
 =?utf-8?B?MU9zMkFkbVdpcGxFRnAxLzYrQ3pyVTU1RUJOZGxjaWk3V0dTZ2I1dTVDUHJp?=
 =?utf-8?B?c1VQTlhseWNQbkJoeUQrSHdXMllmU0ZIc0ZaN2dOWnRhdDJtdWNCVWc0dUEw?=
 =?utf-8?Q?Wg8jukmD5RnSxa5hK+bJGpU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab5d81f-ffc2-4b23-8128-08d9a7f71232
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 05:16:25.3308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VN8Faq36s24Yk2ZCpPLm42SqKBXpgogrz5uIl/vk4krZLatG+TTlJjGzJ710XJEbYWSVP0juYPLzzshdsTVSTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5759
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgMTIsIDIwMjEgNTo0OCBQTQ0KPiANCj4gVGhpcyBsb2dpYyB3aWxsIHdhbnQgaW52
b2tpbmcgZnJvbSBlbHNld2hlcmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lv
bW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gQEAg
LTE1Nyw2ICsxNTcsNTEgQEAgc3RhdGljIHZvaWQgY2xlYW51cF9kb21pZF9tYXAoc3RydWN0IGRv
bQ0KPiAgICAgIH0NCj4gIH0NCj4gDQo+ICtzdGF0aWMgYm9vbCBhbnlfcGRldl9iZWhpbmRfaW9t
bXUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqZXhjbHVkZSwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdnRkX2lvbW11ICppb21tdSkNCj4gK3sN
Cj4gKyAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4gKw0KPiArICAgIGZvcl9lYWNo
X3BkZXYgKCBkLCBwZGV2ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGNvbnN0IHN0cnVjdCBhY3Bp
X2RyaGRfdW5pdCAqZHJoZDsNCj4gKw0KPiArICAgICAgICBpZiAoIHBkZXYgPT0gZXhjbHVkZSAp
DQo+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4gKw0KPiArICAgICAgICBkcmhkID0gYWNwaV9m
aW5kX21hdGNoZWRfZHJoZF91bml0KHBkZXYpOw0KPiArICAgICAgICBpZiAoIGRyaGQgJiYgZHJo
ZC0+aW9tbXUgPT0gaW9tbXUgKQ0KPiArICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+ICsgICAg
fQ0KPiArDQo+ICsgICAgcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiArDQo+ICsvKg0KPiArICogSWYg
bm8gb3RoZXIgZGV2aWNlcyB1bmRlciB0aGUgc2FtZSBpb21tdSBvd25lZCBieSB0aGlzIGRvbWFp
biwNCj4gKyAqIGNsZWFyIGlvbW11IGluIGlvbW11X2JpdG1hcCBhbmQgY2xlYXIgZG9tYWluX2lk
IGluIGRvbWlkX2JpdG1hcC4NCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgY2hlY2tfY2xlYW51cF9k
b21pZF9tYXAoc3RydWN0IGRvbWFpbiAqZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpleGNsdWRlLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUpDQo+ICt7DQo+
ICsgICAgYm9vbCBmb3VuZCA9IGFueV9wZGV2X2JlaGluZF9pb21tdShkLCBleGNsdWRlLCBpb21t
dSk7DQo+ICsNCj4gKyAgICAvKg0KPiArICAgICAqIEhpZGRlbiBkZXZpY2VzIGFyZSBhc3NvY2lh
dGVkIHdpdGggRG9tWEVOIGJ1dCB1c2FibGUgYnkgdGhlDQo+IGhhcmR3YXJlDQo+ICsgICAgICog
ZG9tYWluLiBIZW5jZSB0aGV5IG5lZWQgY29uc2lkZXJpbmcgaGVyZSBhcyB3ZWxsLg0KPiArICAg
ICAqLw0KPiArICAgIGlmICggIWZvdW5kICYmIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApDQo+ICsg
ICAgICAgIGZvdW5kID0gYW55X3BkZXZfYmVoaW5kX2lvbW11KGRvbV94ZW4sIGV4Y2x1ZGUsIGlv
bW11KTsNCj4gKw0KPiArICAgIGlmICggIWZvdW5kICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGNs
ZWFyX2JpdChpb21tdS0+aW5kZXgsIGRvbV9pb21tdShkKS0+YXJjaC52dGQuaW9tbXVfYml0bWFw
KTsNCj4gKyAgICAgICAgY2xlYW51cF9kb21pZF9tYXAoZCwgaW9tbXUpOw0KPiArICAgIH0NCj4g
K30NCj4gKw0KPiAgc3RhdGljIHZvaWQgc3luY19jYWNoZShjb25zdCB2b2lkICphZGRyLCB1bnNp
Z25lZCBpbnQgc2l6ZSkNCj4gIHsNCj4gICAgICBzdGF0aWMgdW5zaWduZWQgbG9uZyBjbGZsdXNo
X3NpemUgPSAwOw0KPiBAQCAtMTY3NSwyNyArMTcyMCw2IEBAIGludCBkb21haW5fY29udGV4dF91
bm1hcF9vbmUoDQo+ICAgICAgcmV0dXJuIHJjOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBib29sIGFu
eV9wZGV2X2JlaGluZF9pb21tdShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLA0KPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpleGNsdWRlLA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2dGRfaW9t
bXUgKmlvbW11KQ0KPiAtew0KPiAtICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPiAt
DQo+IC0gICAgZm9yX2VhY2hfcGRldiAoIGQsIHBkZXYgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAg
Y29uc3Qgc3RydWN0IGFjcGlfZHJoZF91bml0ICpkcmhkOw0KPiAtDQo+IC0gICAgICAgIGlmICgg
cGRldiA9PSBleGNsdWRlICkNCj4gLSAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAtDQo+IC0gICAg
ICAgIGRyaGQgPSBhY3BpX2ZpbmRfbWF0Y2hlZF9kcmhkX3VuaXQocGRldik7DQo+IC0gICAgICAg
IGlmICggZHJoZCAmJiBkcmhkLT5pb21tdSA9PSBpb21tdSApDQo+IC0gICAgICAgICAgICByZXR1
cm4gdHJ1ZTsNCj4gLSAgICB9DQo+IC0NCj4gLSAgICByZXR1cm4gZmFsc2U7DQo+IC19DQo+IC0N
Cj4gIHN0YXRpYyBpbnQgZG9tYWluX2NvbnRleHRfdW5tYXAoc3RydWN0IGRvbWFpbiAqZG9tYWlu
LCB1OCBkZXZmbiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBj
aV9kZXYgKnBkZXYpDQo+ICB7DQo+IEBAIC0xNzA0LDcgKzE3MjgsNiBAQCBzdGF0aWMgaW50IGRv
bWFpbl9jb250ZXh0X3VubWFwKHN0cnVjdCBkDQo+ICAgICAgaW50IHJldDsNCj4gICAgICB1aW50
MTZfdCBzZWcgPSBwZGV2LT5zZWc7DQo+ICAgICAgdWludDhfdCBidXMgPSBwZGV2LT5idXMsIHRt
cF9idXMsIHRtcF9kZXZmbiwgc2VjYnVzOw0KPiAtICAgIGJvb2wgZm91bmQ7DQo+IA0KPiAgICAg
IHN3aXRjaCAoIHBkZXYtPnR5cGUgKQ0KPiAgICAgIHsNCj4gQEAgLTE3ODAsMjggKzE4MDMsMTAg
QEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF91bm1hcChzdHJ1Y3QgZA0KPiAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsNCj4gICAgICB9DQo+IA0KPiAtICAgIGlmICggcmV0IHx8IFFVQVJBTlRJ
TkVfU0tJUChkb21haW4pIHx8IHBkZXYtPmRldmZuICE9IGRldmZuICkNCj4gLSAgICAgICAgcmV0
dXJuIHJldDsNCj4gKyAgICBpZiAoICFyZXQgJiYgIVFVQVJBTlRJTkVfU0tJUChkb21haW4pICYm
IHBkZXYtPmRldmZuID09IGRldmZuICkNCj4gKyAgICAgICAgY2hlY2tfY2xlYW51cF9kb21pZF9t
YXAoZG9tYWluLCBwZGV2LCBpb21tdSk7DQo+IA0KPiAtICAgIC8qDQo+IC0gICAgICogSWYgbm8g
b3RoZXIgZGV2aWNlcyB1bmRlciB0aGUgc2FtZSBpb21tdSBvd25lZCBieSB0aGlzIGRvbWFpbiwN
Cj4gLSAgICAgKiBjbGVhciBpb21tdSBpbiBpb21tdV9iaXRtYXAgYW5kIGNsZWFyIGRvbWFpbl9p
ZCBpbiBkb21pZF9iaXRtYXAuDQo+IC0gICAgICovDQo+IC0gICAgZm91bmQgPSBhbnlfcGRldl9i
ZWhpbmRfaW9tbXUoZG9tYWluLCBwZGV2LCBpb21tdSk7DQo+IC0gICAgLyoNCj4gLSAgICAgKiBI
aWRkZW4gZGV2aWNlcyBhcmUgYXNzb2NpYXRlZCB3aXRoIERvbVhFTiBidXQgdXNhYmxlIGJ5IHRo
ZQ0KPiBoYXJkd2FyZQ0KPiAtICAgICAqIGRvbWFpbi4gSGVuY2UgdGhleSBuZWVkIGNvbnNpZGVy
aW5nIGhlcmUgYXMgd2VsbC4NCj4gLSAgICAgKi8NCj4gLSAgICBpZiAoICFmb3VuZCAmJiBpc19o
YXJkd2FyZV9kb21haW4oZG9tYWluKSApDQo+IC0gICAgICAgIGZvdW5kID0gYW55X3BkZXZfYmVo
aW5kX2lvbW11KGRvbV94ZW4sIHBkZXYsIGlvbW11KTsNCj4gLQ0KPiAtICAgIGlmICggIWZvdW5k
ICkNCj4gLSAgICB7DQo+IC0gICAgICAgIGNsZWFyX2JpdChpb21tdS0+aW5kZXgsIGRvbV9pb21t
dShkb21haW4pLQ0KPiA+YXJjaC52dGQuaW9tbXVfYml0bWFwKTsNCj4gLSAgICAgICAgY2xlYW51
cF9kb21pZF9tYXAoZG9tYWluLCBpb21tdSk7DQo+IC0gICAgfQ0KPiAtDQo+IC0gICAgcmV0dXJu
IDA7DQo+ICsgICAgcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBpb21tdV9j
bGVhcl9yb290X3BndGFibGUoc3RydWN0IGRvbWFpbiAqZCkNCg0K

