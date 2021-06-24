Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907F3B26BD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 07:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146377.269323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHsy-0000Bu-CO; Thu, 24 Jun 2021 05:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146377.269323; Thu, 24 Jun 2021 05:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHsy-00009A-8O; Thu, 24 Jun 2021 05:26:44 +0000
Received: by outflank-mailman (input) for mailman id 146377;
 Thu, 24 Jun 2021 05:26:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GXyq=LS=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lwHsw-000094-Lp
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 05:26:42 +0000
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6247a943-3b0e-4157-b73d-9b10f01c7892;
 Thu, 24 Jun 2021 05:26:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 22:26:40 -0700
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 23 Jun 2021 22:26:40 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 22:26:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 22:26:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 23 Jun 2021 22:26:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 23 Jun 2021 22:26:39 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 05:26:36 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1%12]) with mapi id 15.20.4242.024; Thu, 24 Jun
 2021 05:26:36 +0000
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
X-Inumbo-ID: 6247a943-3b0e-4157-b73d-9b10f01c7892
IronPort-SDR: szcB3hnL/FVTFBdCh/BhP9GK0vJ1zZQ6fFitURnykpUzOwM7IGglChAjdGax+7Xk5ZvQlKN/2H
 NeuxJcUZY51g==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207216314"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="207216314"
IronPort-SDR: I43Owi9I8MA/hGYTbm3W8sUPPIcksCmsgDtFkKeA2umb/RHqsDk1MV32VWi1KmMR9HdjiIrost
 bDxmtjDGgSFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="406916552"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuqeXCJ26dDwO9w8fYLtlzYR73+yzpadYsvkGsRdztLHbGJXVUgDAZIJOaTBvdcmPZW04p+r6C6+eQpsd9yIfdrLKJBqyvMv3Mxbjnq1tjnNwsEC4HFWHKm6YG69tSyKaUBc/T6cEoJNltqJ+N0UQYYJlz0GhQJvwutZo1HqZLjcMd83MK1t64UeOtJG/WPHwjqDWsOaxgDYQ/Z2gRVtprFeGB4Aygs4p2lIX5R95026+s8XZUZDMtv6sEA9LLHSA89h8Gm9c7t/0QrAgauihDZeS3Kc+rOvG09TFrIkYRHr1tMbI+Kygj+Pk/tEX4nHEeduLPNHHgraoeyZQ2oLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djNODLt35QTS7t4/ieOj6WwOOJ4gFG8CEHvyfn7Wtwk=;
 b=R17Jc8jviyBSOGeil5OyOY/TaduKjaLW83qR/GDamiNGJlfKgFwIvQJ1npXaSBU4+oBRmxms6YyenS3bbKTyxp7bC2nVFHK4Tqa3Tm9VzxanJDt5eRPz1AXyd8ml5eHh9wgov838G2CMBiNlu0xfdCg4OA1+/AYqE4QoPVLdvQGTlcjCIl12rl8kyc/BnhsdVDIv3wtnrK4F8qBQ3m4yY/ve5LxjX779ej5JAdJsakERQWCYpaCCsaqltwGq6DznEMgbBNqzc10VJIuQG2eD+pLy5H3d1rU9dNyEwvZLsz73M1aOSMz652j63IhFOetE8ql8FvT8UzleyQRbGudgzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djNODLt35QTS7t4/ieOj6WwOOJ4gFG8CEHvyfn7Wtwk=;
 b=oEZoPKIeidS4MYkk5QnZ5lOlsUTW+lK0Wes2zITq4nA8KfYSEcehxGHbJJZZXTxEwNu7/CUUpm9T5pLwdmWekaCR6D5CZpSFxOPQHDzVbLRuXMHUv7zWzA+r6CRBxBJ+1msyXJYjf8wbLf4ppmDO3c5adq6sw5hrfbdaRMIatYs=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH 5/9] VT-d: clear_fault_bits() should clear all fault bits
Thread-Topic: [PATCH 5/9] VT-d: clear_fault_bits() should clear all fault bits
Thread-Index: AQHXXRHg+9thH88smkqcPcG6zIlV0KsiuMOg
Date: Thu, 24 Jun 2021 05:26:36 +0000
Message-ID: <MWHPR11MB18864E1F15A1891D908C9EA98C079@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <fbb7664b-d55c-f3ce-01b2-e4e379e3780b@suse.com>
In-Reply-To: <fbb7664b-d55c-f3ce-01b2-e4e379e3780b@suse.com>
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
x-ms-office365-filtering-correlation-id: fdc1b9ea-c93c-49b3-1ed1-08d936d0a2e1
x-ms-traffictypediagnostic: MW3PR11MB4587:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MW3PR11MB4587E1226882006383ACC7368C079@MW3PR11MB4587.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BrKMyS3uhNcGlwlfpNGu4fWox3qOq0b5ifRxpVNVlbjSFatjCMc7OTCPXQdjCi8/1l+YEKJveDwlY/Luesemb3vftANucx1MGgLUOgz0kg94vI6b0v9kEiLzkR4yWWw0+/n54BH9aEc8dYzx5I76lTMW6DG1ISjK4WnsQzEvzj23BcHcpRnVwksKq91OZsd1hWxaNTO2Bx+YgvMWM+/+CVFEwCJDXsabGbBQgLBJVqsDxvBmZHC01PCLUa8BzN8K7ysNgzHjLnyFrG+Fasjbpt9LnHmlP07qWt/DU+5Wzy0K26A6JwzaTaYxTQnooc/jkgpp/ZhjmxzpCq5tGdmHcAXLIInCEYLJhYTTrEwbpDbjSsfwLjM+pWI4QQfNcD+1mzpPwD9NuJuRTxJhFQQR0bHI2I4i5LXEYYfmcBGH33bW23fGiLZZ8BfE5RBvciIEWebAGtNXJNlC7TEzxFIo39pRW3d2Jek7xiJgrgMcbHweXiXyFv+klxeo4ZAVVM8qavXuEWOyM8FqfanMlZMfNGl2w64678O+Kc1MyxzBvwuZrDVDV8bdtXtVjKWFdWm5wPZMzKwzNdCdxuBnn6p2480Kq96SQfTbEcZroF8v5V0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(136003)(346002)(39860400002)(38100700002)(64756008)(122000001)(66446008)(186003)(7696005)(26005)(478600001)(66476007)(6506007)(71200400001)(66946007)(8676002)(66556008)(55016002)(83380400001)(76116006)(2906002)(110136005)(316002)(86362001)(33656002)(9686003)(4326008)(8936002)(52536014)(54906003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmhqRWxtTDZNVzBsNXdUd0ZsRnJiNEpZWlRjR1hJR2xqR1plRDlzT1J3V1Rj?=
 =?utf-8?B?Wi9na1Z4a05tbmU2ZnJBNzdTYmMwdW12a2h3eThqditaaVNXWXZCM3ExU0Mr?=
 =?utf-8?B?bkd3RDJlQ0NJK3JRUzFRTkFWOERTdXp5S0RIRFJqUWVsdDhhcFhoNXQyWEo3?=
 =?utf-8?B?MFpuL0hUb0pLd09yK2NpTlV4Z2NEL2x6a0dNS0FxSEMwSjF2R1Y1RFMyMHMy?=
 =?utf-8?B?UlZ0NjlvK052aVNnR2JubndEL1hGeE1JeXVGc1hLcEpLNFRyaFdPSWpvaldi?=
 =?utf-8?B?bnphMzR3ZUh0RGs5M0c1U2NpOHFLMzQxL2lOaERJOFFvRmtZMlZJMU1CMnRo?=
 =?utf-8?B?WFZzZEhBUjFDTm83WjJzTVE3RWFjNDJkRVN5LzFZYVRaVmh0KzVMZWI4bDZN?=
 =?utf-8?B?THRiMGs3dmZQcmlMZ2xYTlhVRHB5TG9hTU1VWk0vb3d0eDVGL1pRTS9mZGQv?=
 =?utf-8?B?a3lnSGQ1VEtNUmVvemwwN2R1YkU4MTJqQVFvN2FHa2xKbGsrTTlyTVROejRs?=
 =?utf-8?B?clJRMmxuTkVheVZEVlNOY0ttbS82RnhGMHpOdU8zTnZ3dktRTzJVMzNPSlRu?=
 =?utf-8?B?QjB2TlloeDU2TjBERlVTSVd2bmQ1eE9sRmx2TDRTTGpjcWgwSUt6TURTdy9W?=
 =?utf-8?B?S2pCU0Q1aVo3UTY5cnIydVpvRXlIbHZwM2l3U3c4U0U2bEZwaHZpWUJMeUk0?=
 =?utf-8?B?ODl5NFRBVE92bHZnUWxBZ0tuUUJqcUVBMGhMV0lxOWFrd1hKSHZJeVU4c0c0?=
 =?utf-8?B?Q3FQUDJEcm1UMm5DYmJ6MElISG16dUJ4alJ2WVhiamFjT0ZZcUVXUllOT1hU?=
 =?utf-8?B?K2RwdDhQWExBYkVnbWVMTDArd2YzNWt5d2lBR09CUkVzMHNsRndVNzJvMUpZ?=
 =?utf-8?B?dXVqdytBM2pVV1l4a3ZITWZZdjV0cHp6VldxYlIvUnU4b0J1QmNWRm9FOXVF?=
 =?utf-8?B?NVNXNGYvMjdwS1VJRWNSamR6anV5SWR6ZWkzckZPeVJVSGJsb2pxVG9RVGNN?=
 =?utf-8?B?UlI2RVExODJsS01FdTFRalNUS3pSd2l6VVdZa2xza3lzUnVmQTJPU3pBQjlM?=
 =?utf-8?B?SU1JK3NRYWlRaXNIK3NwTGNTSlZVc2kyelBpNEMvbGdtSmVnU1JzcmJrVm1P?=
 =?utf-8?B?cWZzd2EzaFp0WEt3aWo3Z3VzMDlhbEN3VDNDY3BjaHNxa29nYkRTNmc2R1lU?=
 =?utf-8?B?czlmb2Z5dXkzUFlQSkhCMG9NUTBHUW94L0NucXNDMVFDOHppb3lRNG5RSVZE?=
 =?utf-8?B?Wk9YeFVtTDBSQkgrY245OGZEOVBXQXBHQ1RCZ1dybmc4N25McnlFN3lOL1ow?=
 =?utf-8?B?WXJ1eHFsc3MrWGFYRkdwd282UjRJalk1UUZNSk5iWFpGQWVxOXdzakVpQmpq?=
 =?utf-8?B?ZHIxLzBDWWlOeHJKSldicXRHcC9LM0N3OG9UWTZzMHhLSlJTNUtPeDFNanhC?=
 =?utf-8?B?TnVPS3pXMFpjTEd4TE5jaWVmQ2RMeWVqVDZQYUlmT016TVBlejBuOVhaVmM3?=
 =?utf-8?B?S0tYMEIxalF3aWhOczB4RVZSUlNoMmdXWGFOODZhMzcrMHhpdFFZd3puWXVn?=
 =?utf-8?B?K3NxS2RkdGROSi81K0pIcGZMV2ppMzJWWjZGSHFnbjg3RnppaWorc3l2Q3h1?=
 =?utf-8?B?MDZScU10dE4vYTY3cDRVaUxEZlRXc1FDK3dJL254clM0Wkw0OWVCb3l6czNx?=
 =?utf-8?B?N3d3TDFIMldBWDRLeUlGTFpKTnFRb1RXM0FvMnVkcFpSZTFBNDM1dzhXYnNE?=
 =?utf-8?Q?Tf4GuTavL/3SjSFp6RirhjPXmefKAVsV4DLDV0g?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc1b9ea-c93c-49b3-1ed1-08d936d0a2e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 05:26:36.1546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yT1t1udyINT3qpuBjeRRL1OyMcMEhHpx/URW2B1yf2vVk/CIinNDnppD9jwKP83NdKw6lkFlaoKBYiScVCceUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVuZSA5LCAyMDIxIDU6MjkgUE0NCj4gDQo+IElmIHRoZXJlIGlzIGFueSB3YXkgZm9yIG9u
ZSBmYXVsdCB0byBiZSBsZWZ0IHNldCBpbiB0aGUgcmVjb3JkaW5nDQo+IHJlZ2lzdGVycywgdGhl
cmUncyBubyByZWFzb24gdGhlcmUgY291bGRuJ3QgYWxzbyBiZSBtdWx0aXBsZSBvbmVzLiBJZg0K
PiBQUEYgc2V0IHNldCAoYmVpbmcgdGhlIE9SIG9yIGFsbCBGIGZpZWxkcyksIHNpbXBseSBsb29w
IG92ZXIgdGhlIGVudGlyZQ0KPiByYW5nZSBvZiBmYXVsdCByZWNvcmRpbmcgcmVnaXN0ZXJzLCBj
bGVhcmluZyBGIGV2ZXJ5d2hlcmUuDQo+IA0KPiBTaW5jZSBQUEYgaXMgYSByL28gYml0LCBhbHNv
IHJlbW92ZSBpdCBmcm9tIERNQV9GU1RTX0ZBVUxUUyAoYXJndWFibHkNCj4gdGhlIGNvbnN0YW50
J3MgbmFtZSBpcyBhbWJpZ3VvdXMgYXMgd2VsbCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11
LmMNCj4gQEAgLTIwOTQsMTMgKzIwOTQsMjMgQEAgc3RhdGljIGludCBfX2h3ZG9tX2luaXQgc2V0
dXBfaHdkb21fZGV2aQ0KPiANCj4gIHZvaWQgY2xlYXJfZmF1bHRfYml0cyhzdHJ1Y3QgdnRkX2lv
bW11ICppb21tdSkNCj4gIHsNCj4gLSAgICB1NjQgdmFsOw0KPiAgICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3M7DQo+IA0KPiAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+cmVnaXN0ZXJfbG9j
aywgZmxhZ3MpOw0KPiAtICAgIHZhbCA9IGRtYXJfcmVhZHEoaW9tbXUtPnJlZywgY2FwX2ZhdWx0
X3JlZ19vZmZzZXQoaW9tbXUtPmNhcCkgKyA4KTsNCj4gLSAgICBkbWFyX3dyaXRlcShpb21tdS0+
cmVnLCBjYXBfZmF1bHRfcmVnX29mZnNldChpb21tdS0+Y2FwKSArIDgsIHZhbCk7DQo+ICsNCj4g
KyAgICBpZiAoIGRtYXJfcmVhZGwoaW9tbXUtPnJlZywgRE1BUl9GU1RTX1JFRykgJiBETUFfRlNU
U19QUEYgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgdW5zaWduZWQgaW50IHJlZyA9IGNhcF9mYXVs
dF9yZWdfb2Zmc2V0KGlvbW11LT5jYXApOw0KPiArICAgICAgICB1bnNpZ25lZCBpbnQgZW5kID0g
cmVnICsgY2FwX251bV9mYXVsdF9yZWdzKGlvbW11LT5jYXApOw0KPiArDQo+ICsgICAgICAgIGRv
IHsNCj4gKyAgICAgICAgICAgZG1hcl93cml0ZWwoaW9tbXUtPnJlZywgcmVnICsgMTIsIERNQV9G
UkNEX0YpOw0KPiArICAgICAgICAgICByZWcgKz0gUFJJTUFSWV9GQVVMVF9SRUdfTEVOOw0KPiAr
ICAgICAgICB9IHdoaWxlICggcmVnIDwgZW5kICk7DQo+ICsgICAgfQ0KPiArDQo+ICAgICAgZG1h
cl93cml0ZWwoaW9tbXUtPnJlZywgRE1BUl9GU1RTX1JFRywgRE1BX0ZTVFNfRkFVTFRTKTsNCj4g
Kw0KPiAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvbW11LT5yZWdpc3Rlcl9sb2NrLCBm
bGFncyk7DQo+ICB9DQo+IA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9t
bXUuaA0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuaA0KPiBAQCAt
MTc0LDkgKzE3NCw4IEBADQo+ICAjZGVmaW5lIERNQV9GU1RTX0lRRSAoMXUgPDwgNCkNCj4gICNk
ZWZpbmUgRE1BX0ZTVFNfSUNFICgxdSA8PCA1KQ0KPiAgI2RlZmluZSBETUFfRlNUU19JVEUgKDF1
IDw8IDYpDQo+IC0jZGVmaW5lIERNQV9GU1RTX0ZBVUxUUyAoRE1BX0ZTVFNfUEZPIHwgRE1BX0ZT
VFNfUFBGIHwNCj4gRE1BX0ZTVFNfQUZPIHwgXA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
IERNQV9GU1RTX0FQRiB8IERNQV9GU1RTX0lRRSB8IERNQV9GU1RTX0lDRSB8IFwNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICBETUFfRlNUU19JVEUpDQo+ICsjZGVmaW5lIERNQV9GU1RTX0ZB
VUxUUyAoRE1BX0ZTVFNfUEZPIHwgRE1BX0ZTVFNfQUZPIHwNCj4gRE1BX0ZTVFNfQVBGIHwgXA0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9GU1RTX0lRRSB8IERNQV9GU1RTX0lDRSB8
IERNQV9GU1RTX0lURSkNCj4gICNkZWZpbmUgZG1hX2ZzdHNfZmF1bHRfcmVjb3JkX2luZGV4KHMp
ICgoKHMpID4+IDgpICYgMHhmZikNCj4gDQo+ICAvKiBGUkNEX1JFRywgMzIgYml0cyBhY2Nlc3Mg
Ki8NCg0K

