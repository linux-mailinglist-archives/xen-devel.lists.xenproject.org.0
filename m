Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3B40D3F9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 09:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188183.337267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQm1t-0004cE-It; Thu, 16 Sep 2021 07:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188183.337267; Thu, 16 Sep 2021 07:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQm1t-0004a8-FJ; Thu, 16 Sep 2021 07:41:57 +0000
Received: by outflank-mailman (input) for mailman id 188183;
 Thu, 16 Sep 2021 07:41:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URfn=OG=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mQm1s-0004a2-Cx
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 07:41:56 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e09f6b9f-ade9-43cb-9c5a-5693cc740b39;
 Thu, 16 Sep 2021 07:41:53 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 00:41:32 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 16 Sep 2021 00:41:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:41:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:41:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 00:41:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 00:41:31 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN8PR11MB3761.namprd11.prod.outlook.com (2603:10b6:408:85::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 07:41:30 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 07:41:30 +0000
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
X-Inumbo-ID: e09f6b9f-ade9-43cb-9c5a-5693cc740b39
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="219322339"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="219322339"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="651471933"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsUYmrZ51q0rq5yHv0cnBlqPOUChdB6ZQrpUVjsYjJK0PoLeCBM6sGOa+h8/zIztWmwDVJlvxR3bRLRGYMOcJtOQLR3td6pmESJrw4F9COC9Cwvjq1oul1GHNiQUfsvVby2h6/B4gurdlm76BYvZtRokRWwy/TZh8z3AbFFmiGhwIEQ2kUDsbvuP3LWhho/NuL4/NyHYkxet/Z3B4hNSwymxTmjFg9Rak1PC38NXWIvNTZSYQnef/iSSxktW7ysxWPCoPAjnomqzIY0aRBLzwFzzsqUC7n1P5lSsLrzSmvioQ01he7wtapeSFILuh0DnTfdIuE0q88/mai+ORJKTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=c63MBIo3cLyHu1UTNeKivtlwAo2vTocRwbfVZ3sosrs=;
 b=e3P35Z3AuQfBWyw2N0y2I5ItOo2sU75Vrd9GPQDWUGCQReRclsyhEX8MWdfRiV/yFg19s6912WYjLV3HHBghbtxBZe66R6z33jvW1KAenTwIagglpukj8GDokkbumunkZCFtY5BfK/WKOyusEMo7A0pvn54eugs1Fx78Vjzi/SAQklJAKjDNoP2HTcmbHAdL0z30QeBHyQbbj4Yex/+z9eVwVgAwfQTehef7pp4jr8u0i01oAuiqouDPdDN6g95ByIWR3Uu4kWSBxre+PS4wLR40uLm2BbSGxHSE5rNhlxbvND2jjO0LjCzKItG/MYl5X2m6QkS32vMQIcogmqvbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c63MBIo3cLyHu1UTNeKivtlwAo2vTocRwbfVZ3sosrs=;
 b=uyxwGl5PjSpigJQxNTGAeRIsXVEmpBr4Fm2dOUZ9YgFdxsIFP1L13uMw5L3PP50bh+B5w65vg9LQF+XEdiwlRnvVKFX/av05GdKK8gXiVgCsDQOlEba7LI8rNhvJQmBpjEBjPRlEEHzoOCrpWQ6DcIijuXWFQSl+QAwZEOIqSPU=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH 05/17] IOMMU: add order parameter to ->{,un}map_page()
 hooks
Thread-Topic: [PATCH 05/17] IOMMU: add order parameter to ->{,un}map_page()
 hooks
Thread-Index: AQHXmPMIXmb1MBaKjE+gIPEf1eDFcquman2A
Date: Thu, 16 Sep 2021 07:41:30 +0000
Message-ID: <BN9PR11MB54333609C5A10043B142A5C48CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <3141710b-2369-6e12-2ba2-4c01888f7ee1@suse.com>
In-Reply-To: <3141710b-2369-6e12-2ba2-4c01888f7ee1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c4eda42-5de3-4c6b-7e2b-08d978e56609
x-ms-traffictypediagnostic: BN8PR11MB3761:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN8PR11MB37617757C8A6CCFE705A1F308CDC9@BN8PR11MB3761.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5TkfU3MgwLruqnoKHVgF8aFJYJX6J+GqGihhp3yiZcyuWk2+dco1OIye1H40KD8LcvGLYtqwX1AO3NuCglJBEyFznk+gluQDKrzywF/crW9S9q6bhz2NmQ5ZHjMRCVxXbxwZt8L7sK375bwCrUIGxXe83j7FJS5eBTXS/K4k0OU1/W+kwEN0VQC4CQ+VeywbSv0aK+jsN8ILxPmlf/+r2CVssFM5og6lN/2hcQlAwiVSt5iAr9DzrE1PuFB1RFm/o5yRMxDl2VUV+4pfizhw+Gdo6+my/YZLaeOphIDC3Ml9KaXTDzYawYzBgQCNaYlmRPWydtbkR+b98wYd9v7ICS+0lntio4iyg4AdnwVpbZsW0oa8nZyPDLpSLS+mPB+ysjaxqiagLFQDu0lCiPNZmmj2iNmQp+vMxXeYku/1miMjUolCBBNdBFe5GCupFFb3SOqKssLLDcrB5uD8pjy/UAmwEVjwTKY4DX6pYg7TH8CFrrUojH+tgWKdLVSTjPI1zlpN2nPsaqQsWkCd9NBDLWxW1dF9b/FYQEing72EW7YnTyn6Fq9d/ID1myEaIc3LukVikbPGGGErrjQ6otOGguy23BgGVYXYZlhzK4nRxtk4Dewa0y6REWhdiSx8WYha//DE6EcZGdij2cYnOKQh1N/btfGSlXW6P599L9SUmqtdeFyF2K8UrhkiR54xzqxPFpi0SIze6/K4HBsTxcrO2Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(26005)(64756008)(66446008)(66556008)(186003)(71200400001)(6506007)(7696005)(76116006)(66946007)(66476007)(86362001)(5660300002)(52536014)(122000001)(33656002)(9686003)(54906003)(55016002)(316002)(110136005)(38070700005)(8936002)(8676002)(4326008)(38100700002)(478600001)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlNYSXN6bW8ybUVOdGx5T3FER1I2cU1ZWHIzeWVoTjUyNk9rUnNabzFLVGpj?=
 =?utf-8?B?WkRxeHh4OE1MTGNMaFNDOGhnMzNZb0VKQ1dkeGpJYlpwMmh2bndkaWxaSWNN?=
 =?utf-8?B?Q2xNM0RjMWhEVFd5VWszU25rUDVYUDl4UXBUWE1wZ1VVaFoyYVd5SGNpdDdT?=
 =?utf-8?B?VXBQSzB5UnJMdy9LL0kvK0dHMTFqVjFobnE0TDFEY1g1NnZZdVJUYXQwc0R2?=
 =?utf-8?B?ZVUzbStGaWpJUE9SWEh0TnRoSTVVZlllMkVrUWV3M29YQ3FCdWRLdTBCZ3FZ?=
 =?utf-8?B?MXliSnRFOGNKQkZVN2haWk5ET2NGM3NncmhKMzRLRFhEeGdOU3cwb3hpRVZt?=
 =?utf-8?B?US9uall0dkU3cXFML3l1Z25Wc01zb25SZWNFM09icWhRbXBPZHM4Y3RVRFZY?=
 =?utf-8?B?cjZienF2ZWx5NUVwYk1TU3RrMUFwZEc4UG5ZQjdpcVhSLzIrSXNtekY1TnBq?=
 =?utf-8?B?VnN5TzNFMTdkU1BkQ3hzL1grbnQwVlpXb3hwYU1NVWxtbUpiY2FZUitsK1Vi?=
 =?utf-8?B?SlF6eXBJb3hqekdSdTdrZ25KQnJGTkxyeVRuWXVqUkFXOFQvU3R1RGswdXlz?=
 =?utf-8?B?aUhWNkVLYmdGSGRJQnN4V2RTcnJndGlQamtDdjNCODRROGFKOUM4QTd1cFdz?=
 =?utf-8?B?MnpMRHFDM3NTWkxlemxZM2VVSDh0WHFjMDlKeGJpYmZjQ1lta3pML2oxT3dB?=
 =?utf-8?B?SWRxWmFqZkNOYlRnaG9yRUVwbTZQd1VxTHpWMUFPVVlhZjdyYzd5eGRDRjZM?=
 =?utf-8?B?WlJWUXU3T29NZlZuMnJJc0FSK0c4VnZaT2NrQUh0Uko4KzhhSEE5ZUpDK1hM?=
 =?utf-8?B?anhOOXl5SHJJRlQ3U0hYc2V3M05WYlRUN295N0ROQ25lc1RCbnc5M2c3eks2?=
 =?utf-8?B?TEdZdGN0djJLNlY5Vm11N0t4RDVPMmpzc2NrU09renU0bzhDM3E0cXBCWHU2?=
 =?utf-8?B?bGx2ditMZ0h5TWIyeTh2UVRhVkpSYllxQ2dnSmxReHFkaThFUXd5dm5vT1g4?=
 =?utf-8?B?Yk9VTE1oRUluSEQ2QThqQU5KdzkwUkM5YTJES2pBcXAzTm1pQkFpc0VnVGVj?=
 =?utf-8?B?S3pGVDdSdWFoZjNFOUZjV29ZY1FaQ28vaXptZHE1OFpmdGRMRXM5TmIxSWhs?=
 =?utf-8?B?RERsbTZwUkwzeS9vaDlaam40aUt4MHR4ZkZzUXFrallsOEJoM1NEcmoxMnFs?=
 =?utf-8?B?Z3JxM1QvU2E3MXh1VStJeFp6QjRCbEd4VG56TWlWQ2trTnZOMTRKN2JCN21U?=
 =?utf-8?B?cUt5TmRlM3dqWW1ETER6M0NId000ODBxZ3pESEgycWdpclY5OTZmbmpHUUky?=
 =?utf-8?B?b09kVzFVM2lXVVFBejMwT1Q1ZzZEem5sRGcxM1ByVVRpWGd1QjFaY0NZVXEy?=
 =?utf-8?B?VDhxUzdDSE00SGV2ODVVdW9qNHRFUzJuM29rSVBaVFdUTlo5bk1DM2VLZzZ3?=
 =?utf-8?B?ZWJaMlk0SngzWTdxZnVxMTUzVzkrQ3YzT1cwemJpVlZ0bklUcTRNTjF6QVZN?=
 =?utf-8?B?SS96dkZCWFFRTVoyRUVWSTZRTnZoeGRjbFpubzdON2tVRk1GVzdPdkxXc1BD?=
 =?utf-8?B?K2hFMFZNc3RoSDlyTW5wRnZOTjlpdFM2VTY1TEQvdlZQTGpZdExVMGRMYnpv?=
 =?utf-8?B?TllsdnJqY01IZmw3bGN1cXhVL1NDVFhBTnZTYjh5NW1lb21iWnlnaUdwZyt2?=
 =?utf-8?B?OCszUXBhRkFOc1RLV3dKNHh1WGFZTGg4bXd1MUFnUlJ0UGdwUE5rWnlVS013?=
 =?utf-8?Q?uWvlqkJfcKWhdnvoZ1G2t82hBn7I8ZcLP5XFcaT?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4eda42-5de3-4c6b-7e2b-08d978e56609
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 07:41:30.3611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYZXcZ7IVrLrAmz4jeQH4zfaCUfvjkP+O0OMkG5jiMVgiOhD9v6Z030GK4+lbamswhM4sRqyQFwsohmqsVnHKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3761
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEF1Z3VzdCAyNCwgMjAyMSAxMDoxOSBQTQ0KPiANCj4gT3IgcmVhbGx5LCBpbiB0aGUgY2FzZSBv
ZiAtPm1hcF9wYWdlKCksIGFjY29tbW9kYXRlIGl0IGluIHRoIGV4aXN0aW5nDQo+ICJmbGFncyIg
cGFyYW1ldGVyLiBBbGwgY2FsbCBzaXRlcyB3aWxsIHBhc3MgMCBmb3Igbm93Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1i
eTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gDQo+IC0tLSBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS5oDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FtZC9pb21tdS5oDQo+IEBAIC0yMjUsNiArMjI1LDcgQEAgaW50IF9fbXVzdF9jaGVj
ayBhbWRfaW9tbXVfbWFwX3BhZ2Uoc3RydQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmZsdXNoX2ZsYWdzKTsNCj4gIGlu
dCBfX211c3RfY2hlY2sgYW1kX2lvbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZGZu
X3QgZGZuLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgb3JkZXIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCAqZmx1c2hfZmxhZ3MpOw0KPiAgaW50IF9fbXVzdF9jaGVjayBhbWRfaW9tbXVf
YWxsb2Nfcm9vdChzdHJ1Y3QgZG9tYWluICpkKTsNCj4gIGludCBhbWRfaW9tbXVfcmVzZXJ2ZV9k
b21haW5fdW5pdHlfbWFwKHN0cnVjdCBkb21haW4gKmRvbWFpbiwNCj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FtZC9pb21tdV9tYXAuYw0KPiBAQCAtMzI4LDcgKzMyOCw3IEBAIGludCBhbWRfaW9t
bXVfbWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwNCj4gICAgICByZXR1cm4gMDsNCj4gIH0NCj4g
DQo+IC1pbnQgYW1kX2lvbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZu
LA0KPiAraW50IGFtZF9pb21tdV91bm1hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRm
biwgdW5zaWduZWQgaW50DQo+IG9yZGVyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCAqZmx1c2hfZmxhZ3MpDQo+ICB7DQo+ICAgICAgdW5zaWduZWQgbG9uZyBwdF9t
Zm4gPSAwOw0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXVfaGVscGVy
cy5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdV9oZWxwZXJzLmMN
Cj4gQEAgLTU3LDExICs1NywxMyBAQCBpbnQgX19tdXN0X2NoZWNrIGFybV9pb21tdV9tYXBfcGFn
ZShzdHJ1DQo+ICAgICAgICogVGhlIGZ1bmN0aW9uIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5IHJl
cGxhY2VzIHRoZSBjdXJyZW50IG1hcHBpbmcNCj4gICAgICAgKiBpZiB0aGVyZSBpcyBhbHJlYWR5
IG9uZS4uLg0KPiAgICAgICAqLw0KPiAtICAgIHJldHVybiBndWVzdF9waHlzbWFwX2FkZF9lbnRy
eShkLCBfZ2ZuKGRmbl94KGRmbikpLCBfbWZuKGRmbl94KGRmbikpLA0KPiAwLCB0KTsNCj4gKyAg
ICByZXR1cm4gZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoZCwgX2dmbihkZm5feChkZm4pKSwgX21m
bihkZm5feChkZm4pKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9N
TVVGX29yZGVyKGZsYWdzKSwgdCk7DQo+ICB9DQo+IA0KPiAgLyogU2hvdWxkIG9ubHkgYmUgdXNl
ZCBpZiBQMk0gVGFibGUgaXMgc2hhcmVkIGJldHdlZW4gdGhlIENQVSBhbmQgdGhlDQo+IElPTU1V
LiAqLw0KPiAgaW50IF9fbXVzdF9jaGVjayBhcm1faW9tbXVfdW5tYXBfcGFnZShzdHJ1Y3QgZG9t
YWluICpkLCBkZm5fdCBkZm4sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBvcmRlciwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50ICpmbHVzaF9mbGFncykNCj4gIHsNCj4gICAgICAvKg0KPiBA
QCAtNzEsNyArNzMsOCBAQCBpbnQgX19tdXN0X2NoZWNrIGFybV9pb21tdV91bm1hcF9wYWdlKHN0
DQo+ICAgICAgaWYgKCAhaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgKQ0KPiAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsNCj4gDQo+IC0gICAgcmV0dXJuIGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3Bh
Z2UoZCwgX2dmbihkZm5feChkZm4pKSwNCj4gX21mbihkZm5feChkZm4pKSwgMCk7DQo+ICsgICAg
cmV0dXJuIGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoZCwgX2dmbihkZm5feChkZm4pKSwNCj4g
X21mbihkZm5feChkZm4pKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBvcmRlcik7DQo+ICB9DQo+IA0KPiAgLyoNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+IEBA
IC0yNzEsNiArMjcxLDggQEAgaW50IGlvbW11X21hcChzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBk
Zg0KPiAgICAgIGlmICggIWlzX2lvbW11X2VuYWJsZWQoZCkgKQ0KPiAgICAgICAgICByZXR1cm4g
MDsNCj4gDQo+ICsgICAgQVNTRVJUKCFJT01NVUZfb3JkZXIoZmxhZ3MpKTsNCj4gKw0KPiAgICAg
IGZvciAoIGkgPSAwOyBpIDwgcGFnZV9jb3VudDsgaSsrICkNCj4gICAgICB7DQo+ICAgICAgICAg
IHJjID0gaW9tbXVfY2FsbChoZC0+cGxhdGZvcm1fb3BzLCBtYXBfcGFnZSwgZCwgZGZuX2FkZChk
Zm4sIGkpLA0KPiBAQCAtMjg4LDcgKzI5MCw3IEBAIGludCBpb21tdV9tYXAoc3RydWN0IGRvbWFp
biAqZCwgZGZuX3QgZGYNCj4gICAgICAgICAgd2hpbGUgKCBpLS0gKQ0KPiAgICAgICAgICAgICAg
LyogaWYgc3RhdGVtZW50IHRvIHNhdGlzZnkgX19tdXN0X2NoZWNrICovDQo+ICAgICAgICAgICAg
ICBpZiAoIGlvbW11X2NhbGwoaGQtPnBsYXRmb3JtX29wcywgdW5tYXBfcGFnZSwgZCwgZGZuX2Fk
ZChkZm4sIGkpLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsdXNoX2ZsYWdzKSAp
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgZmx1c2hfZmxhZ3MpICkNCj4gICAg
ICAgICAgICAgICAgICBjb250aW51ZTsNCj4gDQo+ICAgICAgICAgIGlmICggIWlzX2hhcmR3YXJl
X2RvbWFpbihkKSApDQo+IEBAIC0zMzMsNyArMzM1LDcgQEAgaW50IGlvbW11X3VubWFwKHN0cnVj
dCBkb21haW4gKmQsIGRmbl90DQo+ICAgICAgZm9yICggaSA9IDA7IGkgPCBwYWdlX2NvdW50OyBp
KysgKQ0KPiAgICAgIHsNCj4gICAgICAgICAgaW50IGVyciA9IGlvbW11X2NhbGwoaGQtPnBsYXRm
b3JtX29wcywgdW5tYXBfcGFnZSwgZCwgZGZuX2FkZChkZm4sIGkpLA0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmbHVzaF9mbGFncyk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDAsIGZsdXNoX2ZsYWdzKTsNCj4gDQo+ICAgICAgICAgIGlmICggbGlrZWx5KCFlcnIp
ICkNCj4gICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9t
bXUuYw0KPiBAQCAtMTkzMiw2ICsxOTMyLDcgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW50
ZWxfaW9tbXVfbWFwXw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGludGVs
X2lvbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QNCj4gZGZuLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
b3JkZXIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCAqZmx1c2hfZmxhZ3MpDQo+ICB7DQo+ICAgICAgLyogRG8gbm90aGluZyBp
ZiBWVC1kIHNoYXJlcyBFUFQgcGFnZSB0YWJsZSAqLw0KPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20t
YXJtL2lvbW11LmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oDQo+IEBAIC0z
MSw2ICszMSw3IEBAIGludCBfX211c3RfY2hlY2sgYXJtX2lvbW11X21hcF9wYWdlKHN0cnUNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncywN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZmx1
c2hfZmxhZ3MpOw0KPiAgaW50IF9fbXVzdF9jaGVjayBhcm1faW9tbXVfdW5tYXBfcGFnZShzdHJ1
Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBvcmRlciwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpmbHVzaF9mbGFncyk7DQo+IA0KPiAgI2VuZGlm
IC8qIF9fQVJDSF9BUk1fSU9NTVVfSF9fICovDQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21t
dS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+IEBAIC0xMjcsOSArMTI3LDEw
IEBAIHZvaWQgYXJjaF9pb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4NCj4gICAqIFRoZSBm
b2xsb3dpbmcgZmxhZ3MgYXJlIHBhc3NlZCB0byBtYXAgb3BlcmF0aW9ucyBhbmQgcGFzc2VkIGJ5
IGxvb2t1cA0KPiAgICogb3BlcmF0aW9ucy4NCj4gICAqLw0KPiAtI2RlZmluZSBfSU9NTVVGX3Jl
YWRhYmxlIDANCj4gKyNkZWZpbmUgSU9NTVVGX29yZGVyKG4pICAoKG4pICYgMHgzZikNCj4gKyNk
ZWZpbmUgX0lPTU1VRl9yZWFkYWJsZSA2DQo+ICAjZGVmaW5lIElPTU1VRl9yZWFkYWJsZSAgKDF1
PDxfSU9NTVVGX3JlYWRhYmxlKQ0KPiAtI2RlZmluZSBfSU9NTVVGX3dyaXRhYmxlIDENCj4gKyNk
ZWZpbmUgX0lPTU1VRl93cml0YWJsZSA3DQo+ICAjZGVmaW5lIElPTU1VRl93cml0YWJsZSAgKDF1
PDxfSU9NTVVGX3dyaXRhYmxlKQ0KPiANCj4gIC8qDQo+IEBAIC0yNTUsNiArMjU2LDcgQEAgc3Ry
dWN0IGlvbW11X29wcyB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgZmxhZ3MsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgKmZsdXNoX2ZsYWdzKTsNCj4gICAgICBpbnQgX19tdXN0X2NoZWNrICgqdW5tYXBf
cGFnZSkoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZmx1c2hfZmxhZ3MpOw0KPiAgICAgIGlu
dCBfX211c3RfY2hlY2sgKCpsb29rdXBfcGFnZSkoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZu
LCBtZm5fdA0KPiAqbWZuLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50ICpmbGFncyk7DQoNCg==

