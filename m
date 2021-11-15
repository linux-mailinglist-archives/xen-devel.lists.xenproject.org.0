Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757ED44FE1B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 06:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225631.389656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUJN-00025J-0w; Mon, 15 Nov 2021 05:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225631.389656; Mon, 15 Nov 2021 05:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmUJM-00023H-UA; Mon, 15 Nov 2021 05:13:44 +0000
Received: by outflank-mailman (input) for mailman id 225631;
 Mon, 15 Nov 2021 05:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rbjM=QC=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mmUJL-00023B-90
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 05:13:43 +0000
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca47cce8-45d2-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 06:13:40 +0100 (CET)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 21:13:37 -0800
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 14 Nov 2021 21:13:37 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:13:37 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Nov 2021 21:13:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 14 Nov 2021 21:13:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 14 Nov 2021 21:13:35 -0800
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN7PR11MB2691.namprd11.prod.outlook.com (2603:10b6:406:b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 05:13:34 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ecad:62e1:bab9:ac81%9]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 05:13:34 +0000
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
X-Inumbo-ID: ca47cce8-45d2-11ec-9787-a32c541c8605
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="294200252"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="294200252"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="535380614"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiP1p6IBJX/aP+cTN/KkEzGfymNSXLb5ZE3X/t/in3+rAexyqj9TECLMkRkoH8Ecpv5fp1DDJsbvJ/nopCJ94QihXmKmfL97pHWbRLocqZ+dHcTBqrI0312F0sfmNiJQ9BJxP8AKeC+adPrCH3qXIKAhVGfCuZrmHUwmPG6bqv3/ecO7TbVyGr5VQa5voVSBK9azrvdVmeVDhnFwQVqNaQFlU8MWRCLAQnaaPCiq41IYvf7ep6vh6Iv0Tk6BpDghlkjciyfSYWL8KZtY/VwYmMRcvvkBgjTqcpykAHGWmEr2CSmPhDX7Y7OvTSCYdbgE8xxv88hRc9QeC3Dbs0m18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IlupBnn5xbXSaGAV5CSvSuE8JlVgR3wVykdA/YCIKA=;
 b=QWiYSGFPjGoO/19KYuBpMk/yGRTmmLHImPOF9PMEni7H7znAmCTcnmZR7pqOct6Dyoqjp7mirDpDkHEWGy817yPAcrtCPwtFEX76t0JMB2u2ELveDV9WgSAfmJn1O+gHZEAXgDDbp3b5jB3tngTZFB7NzK2ValSTw0iVAXdgT/PN4rFtGD1mQ8VG3fqOKVacKyMOHz6bLW3GhR/aDbSB1dpl8lVSfxVbVt4QFu6RlwfW86YfNZdKhl8o49zQxNRV7bYCGUQqzLwAs+n2wgy8uRn9TNUixZd36hpGcrX9gUiGZvRFJlS72NAhfcYMn+pFwUhf2GJwHDuKIQrG1MScvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IlupBnn5xbXSaGAV5CSvSuE8JlVgR3wVykdA/YCIKA=;
 b=dTw6h5k3TD/8RjpaOnYIgx6btTWwxAcOGj2WnFKQhd5YY63CYjtEnuUZjXC63Ns3RpHTQQfW4IFjB3vNkI6bxGlR82aRSKYxdVUUnshN7ZN4kvTLEG7losvYyjsZf4JkrLEy03UdCNNwiIp9nBCePYeqUxdIQTADRJxMiRlnkN8=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/6] VT-d: properly reserve DID 0 for caching mode IOMMUs
Thread-Topic: [PATCH 1/6] VT-d: properly reserve DID 0 for caching mode IOMMUs
Thread-Index: AQHX16ptxP2kemn3HkOptj6NHfmn+qv/wDwAgAAMLoCAAAMzAIAEP/6g
Date: Mon, 15 Nov 2021 05:13:34 +0000
Message-ID: <BN9PR11MB5433DB7D9C5DB1B5A8993A418C989@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
 <YY5OztQdQMXJSG+u@Air-de-Roger>
 <6c142f50-84f2-b499-d486-61690cdc2629@suse.com>
 <YY5btAKqy85VDDT+@Air-de-Roger>
In-Reply-To: <YY5btAKqy85VDDT+@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07fae5ac-8d9a-4041-06b6-08d9a7f6ac78
x-ms-traffictypediagnostic: BN7PR11MB2691:
x-microsoft-antispam-prvs: <BN7PR11MB269156F7991F6DE513A170AB8C989@BN7PR11MB2691.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3btACxdXDuSnzukbXMsBEaD6xZmnolrp0yN8NHGksFcP1updfvDYzdXGDR+e38+Z4IvyGA3/gZ8PUByA542Evoye4HOy24AW4G2Uc/slg9FLRQWqprcxgheNRP5xfFfoMtiRftipWv36hv7YdGgfRcHOiLbqCfZ9vMGA6VvKFK5CxMtGBf692ZbBywjszthSjgv2kC0ERaefahLHI3FHtO2pb1sRW5AodPvjKe+S83lXfAEFkCkRj841nd8bFjDpHKkhs0Ppevqk+AlWbs8bGDw0oLiT/3E6LB/8Q9yNYlPofag/Vk0doXmj3LHrogpx75RACsB3OfNucOGHbK9ISkf1qBRS9XfL5tYeeWawb+ufFT7x9HpZmviqGzS+nLbFxT+PW4vsnbXAOxpxw24AtmWBnS0DUPP7LTsgA/SVRIKlmTsWyf8ClxbvogSwrkCwsIDbqNi+vkxH3+tJVu6DHGKjqty9JxK7RkA4f9hepK+IWJwnH7A3MlsCqZ4Iwgh5dS5/nIz8h2F0nC1C/F2HCxF7+TKCwYuNhyJbyh8vE8ox4ujRoXdS/h/q5qw73F4a7wYHlq04WaDyj6bPFGW3+RXlmUWWx0wEj637djQ+0QLlMm/ezolUPnYrn1333yNTgwnizjQVytLPLSsPl+osGOemhftPRRnhxRY/xv4bjivIYBHZuvYnyDGwGRnOkbWL2wiRbj/ZlH0aGmSUEUyK5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8676002)(66946007)(9686003)(66446008)(8936002)(52536014)(71200400001)(82960400001)(2906002)(55016002)(66556008)(76116006)(66476007)(5660300002)(64756008)(38100700002)(122000001)(186003)(26005)(33656002)(86362001)(38070700005)(4326008)(7696005)(110136005)(316002)(6506007)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXZFT1gvYU92cUZvOElzL0JrZCtsT0RjSlp3eHpudm9pK0JaQjBmMXFXczRh?=
 =?utf-8?B?cGM0SEMrOVlEU1huTjUvaHpLTU1TV0o1VDZuZCtJV0drVmNwUUllcVJPdUlh?=
 =?utf-8?B?bnV2eklYZ21HOE9UTWxrUlBPZkZlbVA0UGRuMFBKM3RVakh1SnJxc0Z1aEYz?=
 =?utf-8?B?a1RtMEgwMnFRQVBJQWhsbDVsKzFWemkyRGU3eG1Rci94eHltZlU1V3dhNVZ1?=
 =?utf-8?B?QS9yN3FyZnIrMlJocFF5Y1gwR2pIa25FRXBpQnVDQ0lsWFp5bDMyV2dZd2JG?=
 =?utf-8?B?aVRaODd2V3pqSmFwVjVoTEp4aXVGeE1CL0lHWk5xbEpFTWpCa2JqdmJwM2tT?=
 =?utf-8?B?Y3BqV2E0eW9pMmV0bzlkQW54R0FVb2hGbW11YmIrMXJBNGRRLzAxYUNFSFZq?=
 =?utf-8?B?aEkyV0dXSTNnTEZHNkwvWVRuT2ttOUhkR1hjWHU4Ykl6dnM0djdONmNLTlI1?=
 =?utf-8?B?cEd5ZkhLN2wwK21Rb0xmeWhSTGVIdy9xY1c3NWNtVGU4VFpxalNVcUk4UEdN?=
 =?utf-8?B?MTdrempISmNkZUFkeXRHbkhQMEpYMHRobzBqT0JITGVicTBsK1UzbHZjbVUr?=
 =?utf-8?B?TFFWOTFOcDUxQy9jV1pFZnhXMDZScjdFUHRsTWFjdkoxdElYWVJaTnBwQnVi?=
 =?utf-8?B?ejczSVJBdnA1WjZLb3NDb2EwTVVQWDY2Y3kwZThPbmE1REdzOTVKSzJMNG0v?=
 =?utf-8?B?cEJ2TVJlcTE2VGl2eURSaFBOM2N4amZneGhMVzFTdGs5eFpyaFVDZmJmYXY3?=
 =?utf-8?B?STdVRU5FSkhQdzl4N3J4d250ajVHN3hMUkNqZVh6c1B5eFpad3kzL1M1Yi9y?=
 =?utf-8?B?MkdiSFVjWGVHTlVUanM1TGh5Q0VYTnE3QnZYRUJEMmRMbjh4UTJyWk9jUWcx?=
 =?utf-8?B?RTNDaWRxTzlWRGs3VmZ5elV0WGpkMHZON0NpYlNac0pNTm9yN21IeDBia1U0?=
 =?utf-8?B?UGFqWTN3WnloRys2K3Q5d3RwNjQyaXp3YUdRUnZmVWxoWnpOd2NSQTNpSnBB?=
 =?utf-8?B?aVFjWElkSDNUWEZmYnArV0t3U3orbWdSOHBuV3BiUGptVGZ2OUhIMzhJUTZV?=
 =?utf-8?B?Umt4V0FFcFl6OU1udjM4dFk3ZkZvSDBPV2xScklsNDc0NWRHK04vczY0MnJl?=
 =?utf-8?B?YlU5aE80bE1ibitNMkcvSUNPNGVPV2xNUWJFQTlINXlCcFFaYTUxeThDYjhS?=
 =?utf-8?B?Z2FVVUtmSFh6NnZ1ZWVEN2k2cE9jdHBXNFRUL3hPSGlqS3F3Q3A5STRDUEdW?=
 =?utf-8?B?MHJPbko4UzFmMVNGSVVnOFIxdGpWOEZwRURxbm9oa1ZkM0RjNUxEV0NBUitM?=
 =?utf-8?B?aFFlSE5iaDhwSzBCN1Y0N3F4Y09vYjA0SlNac1gvOWI2dTVjb3VtbkRpRm43?=
 =?utf-8?B?VGNZdzRhS1M0VEVJVkZrQllhYWhHUml2ZnoyN0FpbGpxOEJvWlpDRTlXQXcr?=
 =?utf-8?B?RjdQdW84Tmp4YVR0R081UzZTSCt3RVdORzRYT0pNNTgxakplT2xMNXY5aG85?=
 =?utf-8?B?dnJDeUF0TVdrWXhJQW9zUXpGVzlhT3lwblFKS3l3QytvV1BNNDlJYld2anJ6?=
 =?utf-8?B?elN4TmREKzg5R2h6UVJNT2phUlAvL0g3V1l5ODdVaVpqUW41YzNubENTNjVm?=
 =?utf-8?B?WUNJQTRXZk1LZHNFb09NL2ZNWlN3dDFGRCticDhQZldyei9UQjVKNHZxYi9U?=
 =?utf-8?B?VS9zU3VWa2lSZFZSQy82UEZFZGxYVG0yNWUyQWRhRGlqd1BvY2ZuUGdUb3dR?=
 =?utf-8?B?OThXQStKb1hqZnZENTlxQjcxMDdNR0RPWHpyMUZWRm9YQVRHcWZUNDRra0g5?=
 =?utf-8?B?NGtFSmQvZzVuQldLY2trb3JSNVo4MXBjWXNVSlMybDB2emFMRDVJdy9RRlhI?=
 =?utf-8?B?TGo5RkZHdTRLQjVIajdkY2hyNFV4cDZzdjNFR0E5dGZtZTVOZWZLWlZmbWpr?=
 =?utf-8?B?SzlqaDV3MnNYUzdUakovbmgrRlNVTk11UFozbjJhNzhObDFzZ1RPOGhBdS9V?=
 =?utf-8?B?TmxyU2tyZytZMytlOUhVakp4ZHBSRjNmYkRJbDdzODB1dm5nSjhTWlo3TzUz?=
 =?utf-8?B?RVdScXNPOFBteEsvWTVhcm10OVRvelhGT2VKR0hTeVdublZmZHJPN1NCMHNV?=
 =?utf-8?B?aDRkT25sTUJJZnJ0UE5SS3BNbGxHQ1NobGhQdklpbk1zMG12YTFPWTlVTHpZ?=
 =?utf-8?Q?Gt50ievHTv72SKnS9ibYU0M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fae5ac-8d9a-4041-06b6-08d9a7f6ac78
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 05:13:34.6508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vs/MtYBQOhIGznfjB5l8KxhAk3uwPvlVYQwdJIlvgOEqQ0EnWlTdCeKBRk+I+6Tf6nVNc0wZl/kKFEQIkMdn2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2691
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
RnJpZGF5LCBOb3ZlbWJlciAxMiwgMjAyMSA4OjE5IFBNDQo+IA0KPiBPbiBGcmksIE5vdiAxMiwg
MjAyMSBhdCAwMTowNzozM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAxMi4x
MS4yMDIxIDEyOjIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBOb3Yg
MTIsIDIwMjEgYXQgMTA6NDc6NTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gPj4g
TWVyZWx5IHNldHRpbmcgYml0IDAgaW4gdGhlIGJpdG1hcCBpcyBpbnN1ZmZpY2llbnQsIGFzIHRo
ZW4gRG9tMCB3aWxsDQo+ID4gPj4gc3RpbGwgaGF2ZSBESUQgMCBhbGxvY2F0ZWQgdG8gaXQsIGJl
Y2F1c2Ugb2YgdGhlIHplcm8tZmlsbGluZyBvZg0KPiA+ID4+IGRvbWlkX21hcFtdLiBTZXQgc2xv
dCAwIHRvIERPTUlEX0lOVkFMSUQgdG8ga2VlcCBESUQgMCBmcm9tIGdldHRpbmcNCj4gPiA+PiB1
c2VkLg0KPiA+ID4NCj4gPiA+IFNob3VsZG4ndCB0aGUgd2hvbGUgZG9taWRfbWFwIGJlIGluaXRp
YWxpemVkIHRvIERPTUlEX0lOVkFMSUQgdG8NCj4gPiA+IHByZXZlbnQgZG9tMCBtYXRjaGluZyBh
Z2FpbnN0IGFueSB1bnVzZWQgc2xvdD8NCj4gPiA+DQo+ID4gPiBTaW1pbGFybHkgY2xlYW51cF9k
b21pZF9tYXAgc2hvdWxkIHNldCB0aGUgc2xvdCB0byBET01JRF9JTlZBTElELg0KPiA+DQo+ID4g
SSBkb24ndCB0aGluayBzbywgdGhhdCdzIHRoZSBwdXJwb3NlIG9mIHNldHRpbmcgdGhlIGJpdCBp
biBkb21pZF9iaXRtYXAuDQo+ID4gVGhlIHByb2JsZW0gcmVhbGx5IHdhcyBvbmx5IHdpdGggc2V0
dGluZyBhIGJpdCBpbiB0aGF0IGJpdG1hcCB3aXRob3V0DQo+ID4gaW52YWxpZGF0aW5nIHRoZSBj
b3JyZXNwb25kaW5nIHNsb3QuDQo+ID4NCj4gPiBUaGlzIHNhaWQsIEkgY2FuIHN0aWxsIHNlZSB2
YWx1ZSBpbiBkb2luZyBhcyB5b3Ugc3VnZ2VzdCwgYnV0IGFzIGENCj4gPiBzZXBhcmF0ZSBjaGFu
Z2Ugd2l0aCBhIGRpZmZlcmVudCBqdXN0aWZpY2F0aW9uLiBJbiBmYWN0IGRvbWlkX2JpdG1hcCBp
cw0KPiA+IGtpbmQgb2YgcmVkdW5kYW50IG5vdyBhbnl3YXk7IGFpdWkgaXQgd2FzIHRoZSB0aGlu
ZyB0aGF0IGV4aXN0ZWQgZmlyc3QuDQo+ID4gVGhlbiBkb21pZF9tYXBbXSB3YXMgc2ltcGx5IGFk
ZGVkLCByYXRoZXIgdGhhbiBmdWxseSByZXBsYWNpbmcgdGhlDQo+ID4gb3JpZ2luYWwgYml0bWFw
Lg0KPiANCj4gSSBndWVzcyB1c2luZyBkb21pZF9iaXRtYXAgdG8gZmluZCBhIGZyZWUgc2xvdCBp
cyBmYXN0ZXIgdGhhbiBzY2FubmluZw0KPiB0aGUgYXJyYXkgb2YgaW9tbXUgSURzIHRvIGRvbWlk
cy4gTm90IHN1cmUgaG93IHBlcmZvcm1hbmNlIGNyaXRpY2FsDQo+IHRoYXQgc2VhcmNoIGlzLCBz
byBtYXliZSBpdCdzIGZpbmUgdG8ganVzdCBkcm9wIGRvbWlkX2JpdG1hcCBhbmQgcmVseQ0KPiBl
eGNsdXNpdmVseSBvbiB0aGUgYXJyYXkuDQo+IA0KDQpJJ20gZmluZSB0byBkcm9wIGRvbWlkX2Jp
dG1hcC4gSSBkb24ndCB0aGluayBkb21haW4gY3JlYXRpb24NCmlzIGluIGhvdCBwYXRoLi4uDQo=

