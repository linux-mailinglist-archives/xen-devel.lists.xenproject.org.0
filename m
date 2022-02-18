Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B884BB140
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 06:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275091.470804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvjH-0005cq-Gp; Fri, 18 Feb 2022 05:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275091.470804; Fri, 18 Feb 2022 05:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvjH-0005ah-DU; Fri, 18 Feb 2022 05:22:51 +0000
Received: by outflank-mailman (input) for mailman id 275091;
 Fri, 18 Feb 2022 05:22:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkm2=TB=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nKvjG-0005aZ-EC
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 05:22:50 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ced1b8c2-907a-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 06:22:48 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 21:22:46 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 17 Feb 2022 21:22:46 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:22:46 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:22:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 21:22:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 21:22:45 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BL0PR11MB3393.namprd11.prod.outlook.com (2603:10b6:208:62::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 18 Feb
 2022 05:22:44 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 05:22:43 +0000
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
X-Inumbo-ID: ced1b8c2-907a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645161768; x=1676697768;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YoMAvBlYNKl7S5cif6ZmpyZbVrslo/8FlvOzVArIXRw=;
  b=K4/XZUHcHgAiNAoM5VBemcs0HfEiDKxONZqvhEtfw/RShTfqsMKMuDoQ
   L3/rnfUnnT+ZnsQPtn2NDqnptpIfKGb8z//K5bGHVWDGraRfc/kXABkR2
   6MSKMzm1RRghd6DMvO9vrcPqHehF8QgngOIt5/w1synsrenYttso7NNsx
   ucDc47Hs7sva+C5fS+YxsKqNVfgzXkjqelyzCO5hhfe8m0hQ9N4PSrtvZ
   70i7NtPQkx50Tc90HdKf9AZ6HScBFVsYtcBnydrS7q9jLLEvn3KGRCQH+
   4lez0kKtTcPqNZEqJdJFtKFOy3RGGsMadFDIjRVq0kbf4RqzNHxWBOk1o
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="248649582"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="248649582"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="705231989"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDA+dWJdB383jnQmqlgBxmiibIVx4vycxVwFRQZD/edwLCVdJTrwnM7S/uz6dUUsCGXQwbzRPQMARRyXTTAvxFc2WgXr88KbvxInR1GomJ5rgHk3C7hrUyausEZJ1IZv93+2Ftm6OQDPNs1IjVyp/qk/7dgQ7g1gcHely8XA1vTqZIC7wu7yQXNm4TLlvDhRTXYh+eW0cxQKyedoRindusZ//oSvC3slgz0pmQphlbL0sil265uond1/YdWjTEjp4Fmwlsu86ygdWr+CUjSZemP4/iLB4BFeyg2p4GALUnu06+PNh7evdmUDv/3pwQHqFh694etKx5hwPYOej8hm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoMAvBlYNKl7S5cif6ZmpyZbVrslo/8FlvOzVArIXRw=;
 b=RMFAL/g/G6fXKFdeo2+kdSKoMR65P2jCMNw3yXEI/ghApa+dW64tP5zaej5zogyTVoRrQSOTZSJmyW+X30ShBKG57pdDsZReKO1v6fBb0/17JcHBTk7ly3WoXvjVdSp6h5wpI2bcQlDM/BEbHpqhsswcEML98OC/wi6aB+V1WTMaJ+ULE4tzh1Rnr2sF5NoQEcLPoXvVG1n8b74i4A5myJfriA1OwfwpCXbvOvhCQ2Dxkagiimnr/1AgSF4SryRggC23KK5RkxBb7zM7Xr+GEhJ9H8t3sTQutPZGtBwQVcLMcxyd8ZpHoNpSLgNEBPryf2bCcZzBf6VsZs8eYkK3RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v3 22/23] VT-d: replace all-contiguous page tables by
 superpage mappings
Thread-Topic: [PATCH v3 22/23] VT-d: replace all-contiguous page tables by
 superpage mappings
Thread-Index: AQHYBkB8/KmB2TX4WUKM/AnbwIUwVKyZAm9Q
Date: Fri, 18 Feb 2022 05:22:43 +0000
Message-ID: <BN9PR11MB5276D586FA7B825D4A3009608C379@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <58e8871c-0d5e-ec32-74ac-9137e8f2ce41@suse.com>
In-Reply-To: <58e8871c-0d5e-ec32-74ac-9137e8f2ce41@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bd5c84e-1a07-4574-07fa-08d9f29eb11a
x-ms-traffictypediagnostic: BL0PR11MB3393:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB339360C787D597876101965C8C379@BL0PR11MB3393.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p5c4HodQS1nJlOO7Usj4Y9A4Rek8lUz1KnH5WthCTnsy5ubUQP59Qj4OHAYvGMCcBZm3KDBQp7u9KRhgraIdcYhR75mJ/090y23Sy50GUuvn7KewBlQHQ7sx8Pa5SoS6VY1tKyPR8T4ix627Mnxkoy51ZFKj76QE/TB3CQxgPiLUwar1D80bVG0LonvkJggs/xT4cwTG2cMtWauFuTwX/3ffLoh7fUBI1QRDvzFDK6iVWLVRs8UgFZ7tNh6q1MryZL7HiVacc9Cr176LUX9Vzyk7EqjkvgESHDJRVTTLjma96xjnufha+1f1r27UvVcF7mDJPoodXovMe/vD32eXgeejAgpmvkEhZfkE/Yd33a9N6ZKORwJTeCWM2navtd87cwIUIv5MgFb2T69DzMXda0ITsbR4AxrAvGXRjW59/DNXJeVR9pY/UADc/wcFJ6phsNls35dlG92M+6qN4MY84AxQJT5DSRXYnHYm+HPQxSV06Xz44zrgyVOYif/09jilOP6I0fQFv4XwCUbA991YTu8T9gTQcc6+lvLLZbUYgaPczYeMqjIGWz+1R5uFt7o5g4vS3mv1z9qpbayVuLi7PChxD91qcFF6CYxeds7iA+nT3WDWP01vgDF7PeTXrFRvP7mp9YeLNomsepjVrQSxQYX24THOfNm3Rx7+7r4XmiyJFVdnsFcO+pgAvkE97smvGGtRTUCSeBO26vclyDBsbw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(2906002)(76116006)(5660300002)(64756008)(122000001)(26005)(38100700002)(54906003)(8676002)(83380400001)(186003)(66946007)(52536014)(66476007)(316002)(66556008)(110136005)(8936002)(66446008)(33656002)(71200400001)(7696005)(82960400001)(6506007)(38070700005)(55016003)(86362001)(508600001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vy9uRGhlMWVhRklqckh5RTVXUTN2K2tkUUhTVmg4eVk4bWhLWTRrdXRQQ0cy?=
 =?utf-8?B?QzUzVllWWFByc0ROWXZjbG1OZlBnT3kyNE5CVitUSUNUMVJxOHJyR2JZN245?=
 =?utf-8?B?Vi9nZUYxa3hpR25GMG5GSDdudHdxU0JRcWM0MVBMMUZrd09kTnZsWHNsNXds?=
 =?utf-8?B?TUZ4elllSE1PcHFMdEh2ZzJhdklRYkNIa1pwQ2wwZ3NLREdFbU4wVmkrVWhj?=
 =?utf-8?B?NGxQMmpjNHlmb05QQWdNOFRENUk0NGQzaUJ5UnlWTXh3Q0c4bFVjNU5YanBO?=
 =?utf-8?B?QXpvVStYdGFkZkN5cUluYUtHZGl0RWhzV2xPUThtS2MyNmtuMW96RVpuNDhF?=
 =?utf-8?B?ZWRWemV4TVNtOXdENlIzM0J2QWNIR0RXTnVJOUVQdDBEek1SN2VIMExmdUhr?=
 =?utf-8?B?OFJLSW52Zk5XeGpub1BiYVA1clRuZ2M4VWVUWjQ1ZGtQVWI3eWFJdXQvTXdG?=
 =?utf-8?B?ME40TG54a01Ed1dvYWEzeVQ2Q3ZPZnpHWHBYSWNyaitlUjRxOSs3N3ozMVJY?=
 =?utf-8?B?Vng4WHNPMHRZMXhqeHJhYkVSdjZ0SmVoK0lLcHRRVmJPcFRPaFNDTU5NcGJr?=
 =?utf-8?B?YW55TEhtOWhDaXFNSXlvOFNBWXl4WUJjam1ja2IwWjJ2Zk44dHM5TVhSSXNy?=
 =?utf-8?B?dWM4T2Y5ZzkxS3M1dFFETzJaT25BaVAzb0VDSlhiMjYrZDJCMmxXSjdnY2Y2?=
 =?utf-8?B?L3FzNE5jT0ZZWW5ZWEFBQSs2V1ZralBPbm5vVDRJRENJK0NIU3lrb2VIRXF4?=
 =?utf-8?B?TkJoR0dleE8xdlptQnNib1g4MElQQ1Q4blFrY20vbHh6WXVhMjFyOTgxSnUw?=
 =?utf-8?B?VTR0ZjkzaXRMNis2K1dKZS9RNDJnajBpdVpNaEVCK2w0bTg3RXRlYzNZQkdz?=
 =?utf-8?B?Mkg0YUtuSFVlMDRJUlFBSEFJbzNmaXdTbUxpRk1iaUNueTRaV0FZeFk5WS8y?=
 =?utf-8?B?K05KYUdTQ3VzQ2xLTmw1UU03WjJBOGIveVNzMkQ3cGp5d0tGVTZnVUVLbVd0?=
 =?utf-8?B?SHJKdE9hUjYrN2x5c0FjWkQwOVlMcHhna2tJekpWSmhYOWJxcTZtU2UzU200?=
 =?utf-8?B?TUhuaDFldVNmS3VqTE9IRzR0Y1RtYm93cmx3dkN2c0czdDBJZ2JQb05DbGpp?=
 =?utf-8?B?T252MlZYUFpaV3ZxbzRmdFhyZkRWRUVrbFhvYmtYVFl3bURNdjFoOWJzOG1w?=
 =?utf-8?B?a3hRbU1GcGFURlg5TXNCT2dTalRxeXRlQXVDcjdQbkdsWEJsREFVSE1KZjd4?=
 =?utf-8?B?UXVpMUlFMHBONXFhclNLdWxoSUxzUmtJMCtRRm5WRnBsNlR2MnNrTEV5VVJN?=
 =?utf-8?B?UXBmL0M2cC9uUWs1K2pneUswa21CdmhHTTJHVXNOMjVzam9WdGV4MlhnZm5n?=
 =?utf-8?B?d3N1NWlqbS9LcHVUVmFvNzY5cTI3Yk1udThTbnB1djczVzJiVzBpdDVFU09x?=
 =?utf-8?B?N3Bua1dBeFVGQ0xTK3JuTmF4VFRBRzRZVzVkUDY5YXkxbG5vaktmemg2cDNy?=
 =?utf-8?B?Vk9rQXVnRWpqNS84MllpRHJkZmtybWJsck5oZ0FEZmJDV2pld2cyS1BOa0Rz?=
 =?utf-8?B?cExBaXA0NHB4cFBwMGNSYVEzRHRveWNRTG53K3lzOUcyU01ocE5oYlpIc1ps?=
 =?utf-8?B?ZXR0K3E1ZTgrU2RlNUJKck5rOGU2bTlsL3VNdzFPTHo5ejN6MTkwbG1taE5m?=
 =?utf-8?B?b0M4ZllkOGU0WHhkTldpbEZQRXFZQzgxdHpMcGp3dVRIR2RBR0kvcUszMno5?=
 =?utf-8?B?b1d3K2s2ajR5VXByTFptc0lOY3dhZGlpRUhEei9IOHozSjFIN2hRdmUxUUc0?=
 =?utf-8?B?Y25BYzJEanJGME42K3kxTSt4eFR2dFB5b1JCbkZOOTROb0dmYWxYYzUxSUli?=
 =?utf-8?B?NmpNbUFpUEc2YzNWdTh4Wk5aQjMxMUhqajRSSjhjRGd6ZDI1SEtVdXFxdnR3?=
 =?utf-8?B?a2cyVXBQT0FDMGpiY0xHbHVXV2R1ckVSYmQ3a0ZsZzlMWEJtbTMxRVV3Z3NZ?=
 =?utf-8?B?am50dWNHZTV5UXdPbW9lTU56S2ErREtuMmZoNHNqV1F3dGRpeXdQKzF5QXI4?=
 =?utf-8?B?R0hjdWw0N2Q1WlJVYVVRSzd0TUhXRDFBN2JjTzFpd2pZcXo2TnVIUEFiTU9q?=
 =?utf-8?B?OXZHdEdMc2xUTFptMkJGaC96S2ZrUHJ0ZmFCNmFBRlc3cis4c2d4aVcyRDBU?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd5c84e-1a07-4574-07fa-08d9f29eb11a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 05:22:43.8726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rfsCgjQOKAzuEVQleVLLdB0buDsynH5efE4qRQKe2X3tA/EbbUVYhzmJmSPvMRLC9EQBUgY2G38QSUhEHVYZuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3393
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgMTEsIDIwMjIgMTI6MzggQU0NCj4gDQo+IFdoZW4gYSBwYWdlIHRhYmxlIGVuZHMg
dXAgd2l0aCBhbGwgY29udGlndW91cyBlbnRyaWVzIChpbmNsdWRpbmcgYWxsDQo+IGlkZW50aWNh
bCBhdHRyaWJ1dGVzKSwgaXQgY2FuIGJlIHJlcGxhY2VkIGJ5IGEgc3VwZXJwYWdlIGVudHJ5IGF0
IHRoZQ0KPiBuZXh0IGhpZ2hlciBsZXZlbC4gVGhlIHBhZ2UgdGFibGUgaXRzZWxmIGNhbiB0aGVu
IGJlIHNjaGVkdWxlZCBmb3INCj4gZnJlZWluZy4NCj4gDQo+IFRoZSBhZGp1c3RtZW50IHRvIExF
VkVMX01BU0sgaXMgbWVyZWx5IHRvIGF2b2lkIGxlYXZpbmcgYSBsYXRlbnQgdHJhcA0KPiBmb3Ig
d2hlbmV2ZXIgd2UgKGFuZCBvYnZpb3VzbHkgaGFyZHdhcmUpIHN0YXJ0IHN1cHBvcnRpbmcgNTEy
RyBtYXBwaW5ncy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4gLS0tDQo+IFVubGlrZSB0aGUgZnJlZWluZyBvZiBhbGwtZW1wdHkgcGFnZSB0
YWJsZXMsIHRoaXMgY2F1c2VzIHF1aXRlIGEgYml0IG9mDQo+IGJhY2sgYW5kIGZvcnRoIGZvciBQ
ViBkb21haW5zLCBkdWUgdG8gdGhlaXIgbWFwcGluZy91bm1hcHBpbmcgb2YgcGFnZXMNCj4gd2hl
biB0aGV5IGdldCBjb252ZXJ0ZWQgdG8vZnJvbSBiZWluZyBwYWdlIHRhYmxlcy4gSXQgbWF5IHRo
ZXJlZm9yZSBiZQ0KPiB3b3J0aCBjb25zaWRlcmluZyB0byBkZWxheSByZS1jb2FsZXNjaW5nIGEg
bGl0dGxlLCB0byBhdm9pZCBkb2luZyBzbw0KPiB3aGVuIHRoZSBzdXBlcnBhZ2Ugd291bGQgb3Ro
ZXJ3aXNlIGdldCBzcGxpdCBhZ2FpbiBwcmV0dHkgc29vbi4gQnV0IEkNCj4gdGhpbmsgdGhpcyB3
b3VsZCBiZXR0ZXIgYmUgdGhlIHN1YmplY3Qgb2YgYSBzZXBhcmF0ZSBjaGFuZ2UgYW55d2F5Lg0K
PiANCg0KQWdyZWUuIHRodXM6DQoNCglSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+DQoNCj4gT2YgY291cnNlIHRoaXMgY291bGQgYWxzbyBiZSBoZWxwZWQgYnkg
bW9yZSAiYXdhcmUiIGtlcm5lbCBzaWRlDQo+IGJlaGF2aW9yOiBUaGV5IGNvdWxkIGF2b2lkIGlt
bWVkaWF0ZWx5IG1hcHBpbmcgZnJlZWQgcGFnZSB0YWJsZXMNCj4gd3JpdGFibGUgYWdhaW4sIGlu
IGFudGljaXBhdGlvbiBvZiByZS11c2luZyB0aGF0IHNhbWUgcGFnZSBmb3IgYW5vdGhlcg0KPiBw
YWdlIHRhYmxlIGVsc2V3aGVyZS4NCj4gLS0tDQo+IHYzOiBOZXcuDQo+IA0KPiAtLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtMjA3MSwxNCArMjA3MSwzNSBAQCBzdGF0aWMgaW50
IF9fbXVzdF9jaGVjayBpbnRlbF9pb21tdV9tYXBfDQo+ICAgICAgICogV2hpbGUgdGhlIChhYil1
c2Ugb2YgUFRFX2tpbmRfdGFibGUgaGVyZSBhbGxvd3MgdG8gc2F2ZSBzb21lIHdvcmsgaW4NCj4g
ICAgICAgKiB0aGUgZnVuY3Rpb24sIHRoZSBtYWluIG1vdGl2YXRpb24gZm9yIGl0IGlzIHRoYXQg
aXQgYXZvaWRzIGEgc28gZmFyDQo+ICAgICAgICogdW5leHBsYWluZWQgaGFuZyBkdXJpbmcgYm9v
dCAod2hpbGUgcHJlcGFyaW5nIERvbTApIG9uIGEgV2VzdG1lcmUNCj4gLSAgICAgKiBiYXNlZCBs
YXB0b3AuDQo+ICsgICAgICogYmFzZWQgbGFwdG9wLiAgVGhpcyBhbHNvIGhhcyB0aGUgaW50ZW5k
ZWQgZWZmZWN0IG9mIHRlcm1pbmF0aW5nIHRoZQ0KPiArICAgICAqIGxvb3Agd2hlbiBzdXBlciBw
YWdlcyBhcmVuJ3Qgc3VwcG9ydGVkIGFueW1vcmUgYXQgdGhlIG5leHQgbGV2ZWwuDQo+ICAgICAg
ICovDQo+IC0gICAgcHRfdXBkYXRlX2NvbnRpZ19tYXJrZXJzKCZwYWdlLT52YWwsDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGFkZHJlc3NfbGV2ZWxfb2Zmc2V0KGRmbl90b19kYWRk
cihkZm4pLCBsZXZlbCksDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxldmVsLA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoaGQtPnBsYXRmb3JtX29wcy0+cGFnZV9z
aXplcyAmDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMVVMIDw8IGxldmVsX3Rv
X29mZnNldF9iaXRzKGxldmVsICsgMSkpDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA/IFBURV9raW5kX2xlYWYgOiBQVEVfa2luZF90YWJsZSkpOw0KPiArICAgIHdoaWxlICggcHRf
dXBkYXRlX2NvbnRpZ19tYXJrZXJzKCZwYWdlLT52YWwsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYWRkcmVzc19sZXZlbF9vZmZzZXQoZGZuX3RvX2RhZGRyKGRmbiks
IGxldmVsKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZXZlbCwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoaGQtPnBsYXRmb3JtX29w
cy0+cGFnZV9zaXplcyAmDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICgxVUwgPDwgbGV2ZWxfdG9fb2Zmc2V0X2JpdHMobGV2ZWwgKyAxKSkNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gUFRFX2tpbmRfbGVhZiA6IFBURV9raW5kX3Rh
YmxlKSkgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcgPSBtYWRk
cl90b19wYWdlKHBnX21hZGRyKTsNCj4gKw0KPiArICAgICAgICB1bm1hcF92dGRfZG9tYWluX3Bh
Z2UocGFnZSk7DQo+ICsNCj4gKyAgICAgICAgbmV3LnZhbCAmPSB+KExFVkVMX01BU0sgPDwgbGV2
ZWxfdG9fb2Zmc2V0X2JpdHMobGV2ZWwpKTsNCj4gKyAgICAgICAgZG1hX3NldF9wdGVfc3VwZXJw
YWdlKG5ldyk7DQo+ICsNCj4gKyAgICAgICAgcGdfbWFkZHIgPSBhZGRyX3RvX2RtYV9wYWdlX21h
ZGRyKGQsIGRmbl90b19kYWRkcihkZm4pLCArK2xldmVsLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZmx1c2hfZmxhZ3MsIGZhbHNlKTsNCj4gKyAgICAgICAg
QlVHX09OKHBnX21hZGRyIDwgUEFHRV9TSVpFKTsNCj4gKw0KPiArICAgICAgICBwYWdlID0gbWFw
X3Z0ZF9kb21haW5fcGFnZShwZ19tYWRkcik7DQo+ICsgICAgICAgIHB0ZSA9ICZwYWdlW2FkZHJl
c3NfbGV2ZWxfb2Zmc2V0KGRmbl90b19kYWRkcihkZm4pLCBsZXZlbCldOw0KPiArICAgICAgICAq
cHRlID0gbmV3Ow0KPiArICAgICAgICBpb21tdV9zeW5jX2NhY2hlKHB0ZSwgc2l6ZW9mKCpwdGUp
KTsNCj4gKw0KPiArICAgICAgICAqZmx1c2hfZmxhZ3MgfD0gSU9NTVVfRkxVU0hGX21vZGlmaWVk
IHwgSU9NTVVfRkxVU0hGX2FsbDsNCj4gKyAgICAgICAgaW9tbXVfcXVldWVfZnJlZV9wZ3RhYmxl
KGQsIHBnKTsNCj4gKyAgICB9DQo+IA0KPiAgICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJjaC5tYXBw
aW5nX2xvY2spOw0KPiAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShwYWdlKTsNCj4gLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmgNCj4gKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvdnRkL2lvbW11LmgNCj4gQEAgLTIyOSw3ICsyMjksNyBAQCBzdHJ1Y3QgY29u
dGV4dF9lbnRyeSB7DQo+IA0KPiAgLyogcGFnZSB0YWJsZSBoYW5kbGluZyAqLw0KPiAgI2RlZmlu
ZSBMRVZFTF9TVFJJREUgICAgICAgKDkpDQo+IC0jZGVmaW5lIExFVkVMX01BU0sgICAgICAgICAo
KDEgPDwgTEVWRUxfU1RSSURFKSAtIDEpDQo+ICsjZGVmaW5lIExFVkVMX01BU0sgICAgICAgICAo
UFRFX05VTSAtIDFVTCkNCj4gICNkZWZpbmUgUFRFX05VTSAgICAgICAgICAgICgxIDw8IExFVkVM
X1NUUklERSkNCj4gICNkZWZpbmUgbGV2ZWxfdG9fYWdhdyh2YWwpICgodmFsKSAtIDIpDQo+ICAj
ZGVmaW5lIGFnYXdfdG9fbGV2ZWwodmFsKSAoKHZhbCkgKyAyKQ0KDQo=

