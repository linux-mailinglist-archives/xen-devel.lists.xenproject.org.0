Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137EA35D571
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 04:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109486.208981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW98n-00081v-8S; Tue, 13 Apr 2021 02:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109486.208981; Tue, 13 Apr 2021 02:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW98n-00081U-4z; Tue, 13 Apr 2021 02:51:01 +0000
Received: by outflank-mailman (input) for mailman id 109486;
 Tue, 13 Apr 2021 02:50:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fw58=JK=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lW98l-00081P-9i
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 02:50:59 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86646ee9-a042-4f36-9c22-e50692743dfe;
 Tue, 13 Apr 2021 02:50:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:50:56 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2021 19:50:56 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 12 Apr 2021 19:50:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 12 Apr 2021 19:50:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 12 Apr 2021 19:50:54 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2077.namprd11.prod.outlook.com (2603:10b6:301:4d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Tue, 13 Apr
 2021 02:50:53 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 02:50:53 +0000
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
X-Inumbo-ID: 86646ee9-a042-4f36-9c22-e50692743dfe
IronPort-SDR: hMshuSyzHqQroRVH754JHoEH36ooXkVmuZ+4wjq2uorJ6M9e18AdGErqn/FvByb9+eKZ9aPCK6
 Pt3tUxaYvomQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="194356597"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="194356597"
IronPort-SDR: nvepX+Lgg7F1+f+VBzlMSgVQC6r09BQ+6jysYdL1e3elLOih83sF54Dx1iXfqu9IJlRlzGWfGR
 NdByr0yYE6PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="521426483"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqWQhaoCuHQYp9D8VXbTgH+hbYHemEXO57B59QbT0bmTNTEY0YNe3KHRZdFl2thviT0TRss5Yg0//hXYxJ2Tfgp33XrIfM9iOUzNYIu3KxvcGN32yBwxKEjzaAH0BueD3DnxYs2R7rcV3cr9Fb0zD9/wVD+81MFMPxcW9oo6P1AhG46vmP7EdVoShEQh30kiWgn0mrB0L7xxoPK4YqJkjz9N++PM8/NUMp1Qj3R5gz8QmC1vbiRsvLzViL0bmqgna08sO0BuAuP8nlbm5WACGmKrFYmciG9D0NiPolBkJp5bge5+F5brH7dSVREv+C7go8t6JxiIM2zhQr0S/nRWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRiJ643IaEPt1qPQ/o8hyfQctbQCcM5ZudkYQ6CD3NQ=;
 b=F17WOzbZAIujnKoT6axYO+JAmyxTPc8hhkygoQCTIlPGGddHJv9rO5RMxsWEqtzXvCEhppOdCxmfzynzy/WK0L3HpvUXwl2LibHDDJGFb1exKarylgDycNFeNW7CTGsljefzEFvnrtz0V6B0g9FI2G9nmYEUC9phjCk6g+WsyM/0uqhOfVn2i5mJW8dSNBBk2OfYbOvKX7rhOwVkoSGfBCs80dvZy1Ka8a22FNm6laBOB5ZLY2uOtw73wg5BpjtDqu7Gs1dGpEipu0ayd6C7GQth96hXlzXBJwzfCKJ/74gA4mGRa2GggEF9V+z1PNkawuGKmK2a+VJ6y4KpnSw4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRiJ643IaEPt1qPQ/o8hyfQctbQCcM5ZudkYQ6CD3NQ=;
 b=vKEgmQdB+VVKEoLzHsVih5N6/TPFWELNX0FZuTZYlbNN6gbk67Wmql4GlRAKTOTd7hfgKgeSxh83WiyxEWglqWOa+M1ryGJFWAgTJBnTzokyH1jUuDXl1rjcYvK4jMb87ZEkbaQLpg+vg+wPAVQOM0cqFODIW++a5bAQL0B3z6M=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 0/6] VT-d: assorted cleanup
Thread-Topic: [PATCH 0/6] VT-d: assorted cleanup
Thread-Index: AQHXJtMI1W91eEd5aU6xoazbzHndx6qx0dlA
Date: Tue, 13 Apr 2021 02:50:53 +0000
Message-ID: <MWHPR11MB1886EAB303D0B63ADE2156498C4F9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
In-Reply-To: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d2fba6a-fe69-4f8c-0e31-08d8fe26f465
x-ms-traffictypediagnostic: MWHPR1101MB2077:
x-microsoft-antispam-prvs: <MWHPR1101MB2077D7DF08093E36FDC30BFA8C4F9@MWHPR1101MB2077.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Iq3fA/3GbFTpvnUV8FkhHVr7KjhswYlNwDMjbhTGwslYgl/GGxXKTyhwpZl99AAroFAo6y+gfEcQmDz9eMY4Fk0L/h0MCx4/GmgHceISO0Qt17g9fxIoKdHugApAgsJaFM0n7IbxV1v2HwK5sgARZrbYlc4a+3MQ38Az9gAJtfpn2fYw1BSsjuwBLgVyZUZmValSMb1aW0SnSVNEEDTYux0l0BXNQCiX9bXBt5FWaL1ZYAvP/L88YI8MPe+uvkO3Ske7jJtxl9p66+ZX/7Kk1QGezdIyN0abR1CZqHz0GTd1aiOVQA6vmsBW0bY6Iknlf7qYGDmL7zmU5Z+fZoU2EyCC27m+cm7WWRDe1xXZToBqFqER8dvk6r4OQSBVDBtYUA7aNRTm35mgvzOx8tbIsicdvMzNalZOgLsBoGuBcCpzhw0tVxQ7uz6DUSJs3K1aD4MmH+xDAkRjwrPH5NvcSjDJhrIXzKYlvxJ8IEzitqqTgWkLiwdJWbCZX7XusNYJoXd11/tgInqc/XN8YIIGeBwjscdcSxHS8RW/vkmfxVq+jKX0yKF7lyjvKfVBMkFklScJ9JJ2vYSu86IFOn86qGCs/yUuJhZboLBYmJZcqs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(396003)(39860400002)(110136005)(316002)(76116006)(71200400001)(83380400001)(122000001)(66946007)(2906002)(186003)(26005)(4744005)(8676002)(6506007)(52536014)(66446008)(66476007)(86362001)(66556008)(8936002)(38100700002)(7696005)(9686003)(5660300002)(55016002)(33656002)(478600001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?S213eU9TZENFTE5tbmJRZ0l0ZnZVWFdUcDZ4QXhKRGZkYmtyWmlIb0F6a0FT?=
 =?utf-8?B?Q0IySkd1TENCOGQyUkpVSHN4TE5jbjhGeUJKOERtNjE4ajlBS2lXVUtlOUNz?=
 =?utf-8?B?SGl3TVNtNjVpM090TzdSeFFiSVI1Mm5YY2REbURIRkRoVWpvRFdwdzhDbGNK?=
 =?utf-8?B?ejJuakZ1bHdTYjA4VDIxeHU0MjlKWjh1b1dweEt5VzdhT1krOG15SEw1L05X?=
 =?utf-8?B?QUhZUTh0SUhMNks3cE9XODlzQ3RmejB3NnM4L2dGVllTOExMQ3pNVUI2M250?=
 =?utf-8?B?eEVRQnJSRUhKZDI3UWQwOVlMdEp1RzNESWVNQURxOXMrOFA0YWZTTlplMGJo?=
 =?utf-8?B?NmhDY1E0Rk81cW44NzI1T3NmTWFib05YZm0wZ2ptV3dkZVFYVlR0eGZTMXMz?=
 =?utf-8?B?d1BaMlY4K2xVblprZ1hzSE5IdTZOWHBvS2pVa0VWSzlMSjdhK3hwYWpCeXJZ?=
 =?utf-8?B?dzUxM3RNTzZZa0tBczBKSjVBK0VsZzNPenhpdkdCOWpGUzNhbnY2SGxYU3lk?=
 =?utf-8?B?UkM0WUdNb2NXcXI0YTV5RndYRlA1TGRuMWN1T2RmR21wMURWRHZqRlN3TE44?=
 =?utf-8?B?ZGhoOXlpbVdEa3hmK0l1ZGo4YlFQajY5NStDZ1RwNjZWb2l4T0lXVGtxTFps?=
 =?utf-8?B?OW1GczVBeDVzRHhDWjBaMzVUME5oK3ZtNnhXUk13aW5KT0VjbkpUZGtFQTJj?=
 =?utf-8?B?ejFOVVB6NDQ1YjZ4VWcrWEpoNTFiWjVWZi80cTFRK3ZUS01UdWpta3FITXF5?=
 =?utf-8?B?N3J6aVJpbXZZOFZyRkZVaUVpK0txZ25pQmRMWkNjSUFFclJCeiswNTFPMnU0?=
 =?utf-8?B?Vjh0RXp5NUNXaWkrM2dUYXhsb0JJK3dWZWl0bmtUaEg0WW1aZlg4NjlmbXdL?=
 =?utf-8?B?RkhHeVg3MCtGZk05Rk15S0RCWEp6aWU1UDRwcXUzNWUyck9pMm1sc3RnN20v?=
 =?utf-8?B?YXlJWjFnYnMrdmhPYmIwRE5ncnBFVjlmakozbWx1MnZoUDJKSlpVSlEwcFZn?=
 =?utf-8?B?N2pRSEx0WWRZa3FCZGFyNUFKOTV2bGk4MnptOHM2V1Z6UGdGbHQvTUdNbkhh?=
 =?utf-8?B?TVAzYzgwUFVucXRkSUFpYXdQMCtZQXlCQ1NLNktza3Z6SjJudE1HSVZNNG5X?=
 =?utf-8?B?cXR0ZmcyOGRxRm9WZ2w3b1dkUXdxbE9aSy84cUo2dUdSTVJEaDIvNG02ZnZF?=
 =?utf-8?B?R0M2OXZGQ21TK2NETUs0ZVBaYThnRlZqT1BpNTNrUTEwM056TzRaVlJ2elVJ?=
 =?utf-8?B?S21acDBaUVRhV2laZHRlNzZ1NDRrL0YwaVp1TUMxSSt2VzdpTS93bmg0NUhX?=
 =?utf-8?B?UFo4VjFxQnI3VVJwNGlqbXJGMUNjb3BDZVZtaWpIVmdxeHU1S0o0UjE0Wkpw?=
 =?utf-8?B?M0NxR1RiZEZkK0c0ZFpST0dyRi90NldMT29ZaTZxSytPRnJzQVFIN1VpcW1Y?=
 =?utf-8?B?S2U5N1Q3ZkZhRDZuVVJFRHRWM1I1S1BRN2kzT2N6MTBUZDRXbXF6SDM3cEVt?=
 =?utf-8?B?bnQ3cm0yejNjY3grSkdJd0QxVmhwMUlOdjhOQ3RIZnNPRlRoVUNNV1BPMElE?=
 =?utf-8?B?OGpFWFNaR01sYlRLMkR6S1dYK2w3VW9YMEQzUm9PUjAyRVNLOXRoOVYxdDdG?=
 =?utf-8?B?QW9kbWxGcDYzdGRXcDlsVnRzS0NXcGxvT2djS0sxOEcvOWFIVlU3QzZNQm9M?=
 =?utf-8?B?TFo0L2NXSENGYVROdHN2Tytvak51NGZDREx2azlYR1lzdmJYY2dkeEZWYkNR?=
 =?utf-8?Q?uD+dF06I0GRn+4Mz7LbPM/TN5txvoiCXt0N7wQJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2fba6a-fe69-4f8c-0e31-08d8fe26f465
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 02:50:53.4891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CRmNPwbwSWQbq/fiKDwQH4hxFG4Fd0/i2oKcURDL/KF/LXTMPLXUyOd7el9ojo6xnozhC4dL5IdpMpezftVnaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2077
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBBcHJpbCAxLCAyMDIxIDQ6NDMgUE0NCj4gDQo+IFRoaXMgaXMgZWZmZWN0aXZlbHkgdGhlIG90
aGVyICJoYWxmIiBvZiB3aGF0IHdhcyBzdWJtaXR0ZWQgYXMgNC4xNQ0KPiBjYW5kaWRhdGVzIGlu
ICJbUEFUQ0ggMC80XVs0LjE1P10gVlQtZDogbW9zdGx5IFMzIHJlbGF0ZWQgY29ycmVjdGlvbnMi
Lg0KPiANCj4gMTogaW1wcm92ZSBzYXZlL3Jlc3RvcmUgb2YgcmVnaXN0ZXJzIGFjcm9zcyBTMw0K
PiAyOiBkb24ndCBvcGVuLWNvZGUgZG1hcl9yZWFkbCgpDQo+IDM6IGJyaW5nIHByaW50X3FpX3Jl
Z3MoKSBpbiBsaW5lIHdpdGggcHJpbnRfaW9tbXVfcmVncygpDQo+IDQ6IHFpbnZhbCBpbmRleGVz
IGFyZSBvbmx5IHVwIHRvIDE5IGJpdHMgd2lkZQ0KPiA1OiBhdm9pZCBwb2ludGxlc3MgdXNlIG9m
IDY0LWJpdCBjb25zdGFudHMNCj4gNjogZHJvcCB1bnVzZWQgI2RlZmluZS1zDQo+IA0KPiBKYW4N
Cg0KRm9yIHRoZSB3aG9sZSBzZXJpZXM6DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4NCg==

