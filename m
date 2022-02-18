Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ADB4BB173
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 06:31:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275107.470827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvrI-0007ki-Mb; Fri, 18 Feb 2022 05:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275107.470827; Fri, 18 Feb 2022 05:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvrI-0007hw-JB; Fri, 18 Feb 2022 05:31:08 +0000
Received: by outflank-mailman (input) for mailman id 275107;
 Fri, 18 Feb 2022 05:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkm2=TB=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nKvrH-0007hq-7M
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 05:31:07 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f659242c-907b-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 06:31:05 +0100 (CET)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 21:31:02 -0800
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2022 21:31:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:31:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:31:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 21:31:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 21:31:01 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MWHPR1101MB2143.namprd11.prod.outlook.com (2603:10b6:301:4f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 05:30:55 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 05:30:55 +0000
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
X-Inumbo-ID: f659242c-907b-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645162265; x=1676698265;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=prQ3LGXFbhnMdjGsP9kuryjHEr1tIwPjHHynugB9hNk=;
  b=NYFwOOgRksSCuRm8XhqpFNEoyaEIOp9pSDMoRr+AHu2S6i4ZiaYrfldb
   J7+L8KkC4/FXWbYa2jkjHvWVr7gkcPARXHtwvE7ifmsKiqbW9/vogCnp9
   SegIV7rbT7QurtbsnlmZt0OW6K5a7u6MYiGrR34JKsZ2mZvX8P1k0JiXo
   mYZrRtKV1f8OWnnkORRVwknj02cEU12rlGuYxwqVMmNrKnmYiB6Mof7ou
   gorEIszFWGhUIff/ijVCEr6yMHhT0uzfX8jhUIQSGv/8JLqNpc+8qQqkr
   ByNQcOeW46HpyXZ5uig2Pe/56F0mz59NfvEFzARS6b5Xug6AaHr3JvYQ+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250811985"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="250811985"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="635537628"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hna/nYgwzl93fUrZymab5SNdiOGT/3F7oxn+mlr3Nq6EyWCESJ8NhI/fb+W7y8S1F+bqjMLXbdkWeNfeQEXrKiM0yyIF/NH6kQMcaroYsbkcrMeKOPWaAG8wWYGQxBg/p3//16F+COfZka7emZ7MN30qFbOGJodjKO6Slkg5o8mg4J4reepv026ivZPi1PQK1dDFHLF1200zHZlVIdA+/8KcmuxdCXzBM+oyqejS5XmhtlOGqU5jXPwUahV4BYmiXXzO6LXd9Dy4mshKLWq152F/CKM496cFYriYOsVfUY541JyKfjrxc3K+jL5hqMDm9l2xANilsWwci/Tkk7AhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prQ3LGXFbhnMdjGsP9kuryjHEr1tIwPjHHynugB9hNk=;
 b=T4Y6adpmxJFECw3oJmR+V3kM1MYrsYGLmANBOaxZXZryyhvUaqPa3wOLmVf260L16R1VaouigS5UYFfqT8WQzzJ2uaV7KOeDsI//C/4zh4oOP4DNkPNV1OwZNvsIUu24s2qU5Uyw3TZdtWsNwE1Zjx6Bnkg5NE0B+eCvgUWQm8sixB6EJhk0YeXgJVshMCEOoLzFd7r+rGQgoN8WFX6H7N/CR76B/4HzaPS34g6PXQ1tdlQnBO8kbHzr5WVB+IVqFWKycAdInrr4cidwxJc9senMUeZ5bOKMlu/5Kaxt2GRgzqcUDJt0X4oxJ8/sIH19OzsFyh/YVWLxnK35i+3ECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, "Beulich, Jan"
	<JBeulich@suse.com>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima, Jun"
	<jun.nakajima@intel.com>
Subject: RE: [PATCH] x86/hvm: Drop get_shadow_gs_base() hook and use
 hvm_get_reg()
Thread-Topic: [PATCH] x86/hvm: Drop get_shadow_gs_base() hook and use
 hvm_get_reg()
Thread-Index: AQHYDrlHm/6o22eN0EWvDD5o+20u9KyY89XQ
Date: Fri, 18 Feb 2022 05:30:54 +0000
Message-ID: <BN9PR11MB527615EA292D365A802A42028C379@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220121112241.19277-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220121112241.19277-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 689e0562-ffd7-4f85-45e2-08d9f29fd5d3
x-ms-traffictypediagnostic: MWHPR1101MB2143:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB214322A094404B248223E4BC8C379@MWHPR1101MB2143.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: viADG0ZnI85fSczK+vqu9Bg93l2XAZRX4eI7ucbGntbP55MDU0fFyL6HwEx/Tm/2KE2IAyCWE6yNoxAXru+ZmegLF47QhqSLtt24CZkxJJlgRN7FwRsd+4h/bRPR7gchwaoC68rAvRq95ikhNzP/jreQOKhQS1ZxJjtxE3cCazWslkk21AAcWwafqOCAvTtxPsmE5jx8KHTbKMlV0w+VX+OJOkNldMZcoYRltKI/p+uZI6MGBNIfvOVuMUaXCwUMmgLMEeBl1LcoXW1Iydcl6m282y2MjNlkyaLKXJNA2V454uStyJafzNIhAJ3JNnR3IeTpG8sqWQpsFY3juN2zUWIVIlC2m8AGBYQbrf3txp+c3DEGEMtF77CNtTZYj8n2svKNXBleknCtbK9BNHF+56ntkPJKLGWZ2PiDfNpup6WwMGz5EzqPUDShsBE3cbHI82BEuvjR47MkmdhlLugcnHf/VomrgY5QTGeMgHsxkhxMw3OETatl/m96cOCI1kihY0bei44WbpHBReTifIv9SSchTcfbBaSkMYZtCLcmRY/g84OCnp3kmKOLJgtDqdbgdrv3syPRROFXFq8IoPUYTYEuYFmZhyuRYU2QwjYU5NqvhKaKkVtbPxOnJ3esFRgNMZFgodQvVhuYXZBZZ1s9UIm1LfrMVI9Ltc48lBY7j7jSZP9vYbSjiLqu6SSWQbYuRS5rLGN1G83SMUgwTUtRGg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(107886003)(6506007)(9686003)(54906003)(83380400001)(8936002)(186003)(26005)(71200400001)(316002)(110136005)(66556008)(76116006)(122000001)(4326008)(508600001)(55016003)(66946007)(66476007)(2906002)(8676002)(64756008)(5660300002)(86362001)(52536014)(38100700002)(33656002)(38070700005)(82960400001)(7696005)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmZITUVxWnhSQ1VNbGVJTzRRUm9tZG5sSmxFaXNvV3YzTTduL0l1cjlCVkNV?=
 =?utf-8?B?Yy9HQ0J3NVFFWGQvVHRBcWRaZUo3WE9NUm1nYW9XMUQ1NmgvQTljVC9nR3pS?=
 =?utf-8?B?RG9XMEFEM2crTUZrelVUQmxnaWV4ejlNaytZRW9vREJhWXVNdXpxelRYblZx?=
 =?utf-8?B?TkRnTHlXWThPR1IxUStVazRjZ2lneTd2YVhLYzRsUkt1MXFIeXdTVGhpV2w1?=
 =?utf-8?B?RFVwb05tMHBGNG1jeG5henFERjRlSnh6bDhCWUl5aE1OOWFWMHZZbStjRXV5?=
 =?utf-8?B?UnViNCtpUm55VHlyYytSc3grUUVxSzA0Vk1YY0JnUTJsMVQ2aVFVTytlWGpq?=
 =?utf-8?B?MWYwR1IxaVo5YlQ2RHVPdDdURzdMdlB4M09CeFh2OEhFbWFJWlpNRGFOeHFB?=
 =?utf-8?B?QzltMFNJQVBpVmFwWFlMVjNleHh1VFBoMXlVbGdHSHpUVUdkTHY4T3V0SWc1?=
 =?utf-8?B?WnZHYkc5bitoWGgyQ3lieEo3QkQ3d1FIcmc5TnZLb3NVNkphNEE0dDl6T2Vn?=
 =?utf-8?B?VkZic0JZY3JmZDIwWkVnWFptNWE4VnNTMGZLaFRWdUtkOHJ6VTFjN0VodlYw?=
 =?utf-8?B?UE9HNzJRSGI4ZDJ0S1NOVU1nS0VOYVJQK1hQNm9PS2tyajFrbGd0dVRtazFz?=
 =?utf-8?B?b2dvbVRFSGdTTGJjMzdENksxbGxRVFV1dmxyUmRUZUdzOUdzamttQmdVSFAv?=
 =?utf-8?B?ZEdWbWxLb04ySWZGQUtIMENMK0ZsUnVmdjhHa1pzc0FYUlJMbm10d01KZjJI?=
 =?utf-8?B?MUR6MVJSTGRqME01WjBBdExlZm1nVTNGRzlsRkdhQVV2SjR2MVVIMkh6YTJQ?=
 =?utf-8?B?VUZPbFRDRG1uTC9ucjZWRUhLelY0b0dHaUJvdU94YjFHYVVkUnpoY01Xc3Nl?=
 =?utf-8?B?YVBkaHVRYzl0U1oySlpXTysyRmNsZmhONGc2YkZDMXBLSUpnUldNeDVwU2JR?=
 =?utf-8?B?SldmQWxUbTNNL1MxVkpNREJpY2hPbkh6OHFGWmZqNkZ4Umh3MDNtKzh4cmJP?=
 =?utf-8?B?S3g0NEZQakJqeHUrWE5wZHJaZEZ0RUZJVm51NUFDT0s1VWFjbExjc0JLWUhw?=
 =?utf-8?B?MFhiRnBhY2FjTFRNbFZ2NWk3WW5RejJkRE9hNFRnUnRjMFpnNWh2ekdld0I2?=
 =?utf-8?B?WWZkbFZqd04rUTEra0pSVEhEK1BET3hPTXk5WkVYNldyandqbkNETFVKS2lL?=
 =?utf-8?B?Sy9XNHUwbGp6b3VjN08ya1YzZ0FiOGxGSWhmcFh1cWlHdjJHTFprai9oaEV4?=
 =?utf-8?B?bjVYV2Z3MTYvOFZBMmhBVkdFd1I4cWd5b3IxaGNBQlIyaEFUZlU2L2JWaU91?=
 =?utf-8?B?cjh2clVadnVjQlYxUHVaZkdvbHBlYmlxZHo0Wkk4MG9PSWNrejBFaVg5dkN6?=
 =?utf-8?B?aFdsK3RaVDJlVmVMcHdPTktGTFN0dUdNaDlacXFIU2FxNzlDYnhXdjhqZkVB?=
 =?utf-8?B?a3FPZWZWQVpUSWFZU3VyY0kxMEVHRlFHSmw2RGNVanI5OXlPenM0ZEErTWx3?=
 =?utf-8?B?SXBYcDhLSTFPWGtvZmZZYjZHWVJHWXJXVER2Y0htcThad1dXNUhZOTFuT0V4?=
 =?utf-8?B?NWI0aG1kbXR4ZnN2U1A4UjhkTGw1RmFkZjgvZEJqdWg5b3Q4M3JwWCtUUnNx?=
 =?utf-8?B?eXlMWGNWL0xKU2t3aitnY0VXNk9xcWJTUXBJdGtwM2szNHpSU0RhV0hzcTNt?=
 =?utf-8?B?UEFUdDkzajRRQmlxYXJDdG9pc05waGJTL1pzOTM4VFFLTTVqVnE1YUNGSXkw?=
 =?utf-8?B?YXptQmlDQXFNN3dEUWViK2FHU3hyMmtjK2M0YjFRMnBKcFlkUW1KSHBleW9h?=
 =?utf-8?B?WjA4d09XUXYvUGJGb2lwdXhsdDBmQzdVQk15T0xrVjB2RStDd0xZSVczNWJ5?=
 =?utf-8?B?SGRyVHpQcVU4dENYMktZelZNNDdTMUNCS3VlTk0zT2lFL2FmaG93WFZkNjRq?=
 =?utf-8?B?UkFmeXh5NmJ3UWFJaFZzTS9jS0h0Q0pEM3U4dXV6dXg4SXloRGQ0QUdTNFBl?=
 =?utf-8?B?ekJMeVFiVWtORm5IYlVIMVJiNXZEemZORngwNkJKSm5CZVdVempjN2JHZlI4?=
 =?utf-8?B?eHhWWE04YlQzUERubDRkOGxZeTl4ZVVWRnBhRnU4Wlp3VWpMRkQvRVNmQTBJ?=
 =?utf-8?B?cG9tSzBTMHV0YWhjb0NOUWtiNld1NVhLcnJHdlpUcnY0VXp4NG1pOGQxdHVQ?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689e0562-ffd7-4f85-45e2-08d9f29fd5d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 05:30:54.9344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMlE94oHYUEHxPW0pQ8ooKfVrsSm6Gr/YZZycE89KZV3x5nwJjHgLwBJfzfaknKUkLUjuFjf2gNIhs8ZvlfBOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2143
X-OriginatorOrg: intel.com

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBGcmlkYXksIEphbnVhcnkgMjEsIDIwMjIgNzoyMyBQTQ0KPiANCj4gVGhpcyBpcyBhIHRyaXZp
YWwgYWNjZXNzb3IgZm9yIGFuIE1TUiwgc28gdXNlIGh2bV9nZXRfcmVnKCkgcmF0aGVyIHRoYW4g
YQ0KPiBkZWRpY2F0ZWQgaG9vay4gIEluIGFyY2hfZ2V0X2luZm9fZ3Vlc3QoKSwgcmV3b3JrIHRo
ZSBsb2dpYyB0byByZWFkDQo+IEdTX1NIQURPVw0KPiBvbmx5IG9uY2UuDQo+IA0KPiBnZXRfaHZt
X3JlZ2lzdGVycygpIGlzIGNhbGxlZCBvbiBjdXJyZW50LCBtZWFuaW5nIHRoYXQgZGlhZ25vc3Rp
Y3MgcHJpbnQgYQ0KPiBzdGFsZSBHU19TSEFET1cgZnJvbSB0aGUgcHJldmlvdXMgdmNwdSBjb250
ZXh0IHN3aXRjaC4gIEFkanVzdCBib3RoDQo+IGltcGxlbWVudGF0aW9ucyB0byBvYnRhaW4gdGhl
IGNvcnJlY3QgdmFsdWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+DQo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4g
Q0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IENDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamlt
YUBpbnRlbC5jb20+DQo+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4g
DQo+IElmIHdlIGNhcmUgdG8gYmFja3BvcnQgdGhlIGJ1Z2ZpeCBhc3BlY3QsIGEgZmFyIGxlc3Mg
aW52YXNpdmUgb3B0aW9uIHdvdWxkIGJlDQo+IHRvIHJlYWQgTVNSX1NIQURPV19HU19CQVNFIGRp
cmVjdGx5Lg0KPiANCj4gVGhlIG9ubHkgY2FzZSB3aGVyZSB0aGF0IGdvZXMgd3JvbmcgaXMgd2hl
biB2bWNiLT5rZXJuZ3NiYXNlIGhhcyBiZWVuDQo+IG1vZGlmaWVkDQo+IGFuZCBpcyBwZW5kaW5n
IGEgVk1MT0FELiAgSSdtIGZhaXJseSBzdXJlIHRoaXMgY2FuIG9ubHkgb2NjdXIgd2hlbiB3ZSBu
ZWVkDQo+IHZjcHUgZGlhZ25vc3RpY3MsIGFmdGVyIGFuIGVtdWxhdGVkIHdyaXRlIG9mIE1TUl9T
SEFET1dfR1NfQkFTRS4NCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAg
ICAgIHwgIDggKysrKysrLS0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jICAgICAgICAg
fCAxMiArKysrKystLS0tLS0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICAgICAg
fCAxNiArKysrKysrKysrLS0tLS0tDQo+ICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL2h2
bS5oIHwgIDcgLS0tLS0tLQ0KPiAgeGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jICAgICAgICB8
ICAyICstDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYyBiL3hlbi9hcmNo
L3g4Ni9kb21jdGwuYw0KPiBpbmRleCA3ZDEwMmUwNjQ3ZWMuLmU0OWY5ZTkxYjlmYSAxMDA2NDQN
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWN0bC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21j
dGwuYw0KPiBAQCAtMTQ0Nyw2ICsxNDQ3LDcgQEAgdm9pZCBhcmNoX2dldF9pbmZvX2d1ZXN0KHN0
cnVjdCB2Y3B1ICp2LA0KPiB2Y3B1X2d1ZXN0X2NvbnRleHRfdSBjKQ0KPiAgICAgIGlmICggaXNf
aHZtX2RvbWFpbihkKSApDQo+ICAgICAgew0KPiAgICAgICAgICBzdHJ1Y3Qgc2VnbWVudF9yZWdp
c3RlciBzcmVnOw0KPiArICAgICAgICB1bnNpZ25lZCBsb25nIGdzX3NoYWRvdzsNCj4gDQo+ICAg
ICAgICAgIGMubmF0LT5jdHJscmVnWzBdID0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbMF07DQo+ICAg
ICAgICAgIGMubmF0LT5jdHJscmVnWzJdID0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbMl07DQo+IEBA
IC0xNDY1LDE1ICsxNDY2LDE4IEBAIHZvaWQgYXJjaF9nZXRfaW5mb19ndWVzdChzdHJ1Y3QgdmNw
dSAqdiwNCj4gdmNwdV9ndWVzdF9jb250ZXh0X3UgYykNCj4gICAgICAgICAgYy5uYXQtPmZzX2Jh
c2UgPSBzcmVnLmJhc2U7DQo+ICAgICAgICAgIGh2bV9nZXRfc2VnbWVudF9yZWdpc3Rlcih2LCB4
ODZfc2VnX2dzLCAmc3JlZyk7DQo+ICAgICAgICAgIGMubmF0LT51c2VyX3JlZ3MuZ3MgPSBzcmVn
LnNlbDsNCj4gKw0KPiArICAgICAgICBnc19zaGFkb3cgPSBodm1fZ2V0X3JlZyh2LCBNU1JfU0hB
RE9XX0dTX0JBU0UpOw0KPiArDQo+ICAgICAgICAgIGlmICggcmluZ18wKCZjLm5hdC0+dXNlcl9y
ZWdzKSApDQo+ICAgICAgICAgIHsNCj4gICAgICAgICAgICAgIGMubmF0LT5nc19iYXNlX2tlcm5l
bCA9IHNyZWcuYmFzZTsNCj4gLSAgICAgICAgICAgIGMubmF0LT5nc19iYXNlX3VzZXIgPSBodm1f
Z2V0X3NoYWRvd19nc19iYXNlKHYpOw0KPiArICAgICAgICAgICAgYy5uYXQtPmdzX2Jhc2VfdXNl
ciA9IGdzX3NoYWRvdzsNCj4gICAgICAgICAgfQ0KPiAgICAgICAgICBlbHNlDQo+ICAgICAgICAg
IHsNCj4gICAgICAgICAgICAgIGMubmF0LT5nc19iYXNlX3VzZXIgPSBzcmVnLmJhc2U7DQo+IC0g
ICAgICAgICAgICBjLm5hdC0+Z3NfYmFzZV9rZXJuZWwgPSBodm1fZ2V0X3NoYWRvd19nc19iYXNl
KHYpOw0KPiArICAgICAgICAgICAgYy5uYXQtPmdzX2Jhc2Vfa2VybmVsID0gZ3Nfc2hhZG93Ow0K
PiAgICAgICAgICB9DQo+ICAgICAgfQ0KPiAgICAgIGVsc2UNCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL3N2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4gaW5k
ZXggYmI2YjhlNTYwYTlmLi5lM2JjODhlNzgwNTggMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vc3ZtL3N2bS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jDQo+IEBA
IC03NTIsMTEgKzc1Miw2IEBAIHN0YXRpYyB2b2lkIHN2bV9zZXRfc2VnbWVudF9yZWdpc3Rlcihz
dHJ1Y3QgdmNwdSAqdiwNCj4gZW51bSB4ODZfc2VnbWVudCBzZWcsDQo+ICAgICAgfQ0KPiAgfQ0K
PiANCj4gLXN0YXRpYyB1bnNpZ25lZCBsb25nIHN2bV9nZXRfc2hhZG93X2dzX2Jhc2Uoc3RydWN0
IHZjcHUgKnYpDQo+IC17DQo+IC0gICAgcmV0dXJuIHYtPmFyY2guaHZtLnN2bS52bWNiLT5rZXJu
Z3NiYXNlOw0KPiAtfQ0KPiAtDQo+ICBzdGF0aWMgaW50IHN2bV9zZXRfZ3Vlc3RfcGF0KHN0cnVj
dCB2Y3B1ICp2LCB1NjQgZ3BhdCkNCj4gIHsNCj4gICAgICBzdHJ1Y3Qgdm1jYl9zdHJ1Y3QgKnZt
Y2IgPSB2LT5hcmNoLmh2bS5zdm0udm1jYjsNCj4gQEAgLTI0NzEsMTAgKzI0NjYsMTYgQEAgc3Rh
dGljIGJvb2wgc3ZtX2dldF9wZW5kaW5nX2V2ZW50KHN0cnVjdCB2Y3B1DQo+ICp2LCBzdHJ1Y3Qg
eDg2X2V2ZW50ICppbmZvKQ0KPiANCj4gIHN0YXRpYyB1aW50NjRfdCBzdm1fZ2V0X3JlZyhzdHJ1
Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHJlZykNCj4gIHsNCj4gKyAgICBzdHJ1Y3QgdmNwdSAq
Y3VyciA9IGN1cnJlbnQ7DQo+ICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsNCj4g
DQo+ICAgICAgc3dpdGNoICggcmVnICkNCj4gICAgICB7DQo+ICsgICAgY2FzZSBNU1JfU0hBRE9X
X0dTX0JBU0U6DQo+ICsgICAgICAgIGlmICggdiA9PSBjdXJyICkNCj4gKyAgICAgICAgICAgIHN2
bV9zeW5jX3ZtY2Iodiwgdm1jYl9pbl9zeW5jKTsNCj4gKyAgICAgICAgcmV0dXJuIHYtPmFyY2gu
aHZtLnN2bS52bWNiLT5rZXJuZ3NiYXNlOw0KPiArDQo+ICAgICAgZGVmYXVsdDoNCj4gICAgICAg
ICAgcHJpbnRrKFhFTkxPR19HX0VSUiAiJXMoJXB2LCAweCUwOHgpIEJhZCByZWdpc3RlclxuIiwN
Cj4gICAgICAgICAgICAgICAgIF9fZnVuY19fLCB2LCByZWcpOw0KPiBAQCAtMjUxMyw3ICsyNTE0
LDYgQEAgc3RhdGljIHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgX19pbml0ZGF0YQ0KPiBzdm1f
ZnVuY3Rpb25fdGFibGUgPSB7DQo+ICAgICAgLmdldF9jcGwgICAgICAgICAgICAgID0gc3ZtX2dl
dF9jcGwsDQo+ICAgICAgLmdldF9zZWdtZW50X3JlZ2lzdGVyID0gc3ZtX2dldF9zZWdtZW50X3Jl
Z2lzdGVyLA0KPiAgICAgIC5zZXRfc2VnbWVudF9yZWdpc3RlciA9IHN2bV9zZXRfc2VnbWVudF9y
ZWdpc3RlciwNCj4gLSAgICAuZ2V0X3NoYWRvd19nc19iYXNlICAgPSBzdm1fZ2V0X3NoYWRvd19n
c19iYXNlLA0KPiAgICAgIC51cGRhdGVfZ3Vlc3RfY3IgICAgICA9IHN2bV91cGRhdGVfZ3Vlc3Rf
Y3IsDQo+ICAgICAgLnVwZGF0ZV9ndWVzdF9lZmVyICAgID0gc3ZtX3VwZGF0ZV9ndWVzdF9lZmVy
LA0KPiAgICAgIC5jcHVpZF9wb2xpY3lfY2hhbmdlZCA9IHN2bV9jcHVpZF9wb2xpY3lfY2hhbmdl
ZCwNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIGIveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMNCj4gaW5kZXggYzQ0Y2Y4ZjVkNDI1Li4yN2MzNmFmNjAyN2QgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vdm14L3ZteC5jDQo+IEBAIC0xMTgzLDExICsxMTgzLDYgQEAgc3RhdGljIHZvaWQg
dm14X3NldF9zZWdtZW50X3JlZ2lzdGVyKHN0cnVjdCB2Y3B1DQo+ICp2LCBlbnVtIHg4Nl9zZWdt
ZW50IHNlZywNCj4gICAgICB2bXhfdm1jc19leGl0KHYpOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyB1
bnNpZ25lZCBsb25nIHZteF9nZXRfc2hhZG93X2dzX2Jhc2Uoc3RydWN0IHZjcHUgKnYpDQo+IC17
DQo+IC0gICAgcmV0dXJuIHYtPmFyY2guaHZtLnZteC5zaGFkb3dfZ3M7DQo+IC19DQo+IC0NCj4g
IHN0YXRpYyBpbnQgdm14X3NldF9ndWVzdF9wYXQoc3RydWN0IHZjcHUgKnYsIHU2NCBncGF0KQ0K
PiAgew0KPiAgICAgIGlmICggIXBhZ2luZ19tb2RlX2hhcCh2LT5kb21haW4pIHx8DQo+IEBAIC0y
NDAxLDYgKzIzOTYsNyBAQCBzdGF0aWMgaW50IHZtdHJhY2VfcmVzZXQoc3RydWN0IHZjcHUgKnYp
DQo+IA0KPiAgc3RhdGljIHVpbnQ2NF90IHZteF9nZXRfcmVnKHN0cnVjdCB2Y3B1ICp2LCB1bnNp
Z25lZCBpbnQgcmVnKQ0KPiAgew0KPiArICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0gY3VycmVudDsN
Cj4gICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOw0KPiAgICAgIHVpbnQ2NF90IHZh
bCA9IDA7DQo+ICAgICAgaW50IHJjOw0KPiBAQCAtMjQxNyw2ICsyNDEzLDE1IEBAIHN0YXRpYyB1
aW50NjRfdCB2bXhfZ2V0X3JlZyhzdHJ1Y3QgdmNwdSAqdiwNCj4gdW5zaWduZWQgaW50IHJlZykN
Cj4gICAgICAgICAgICAgIGRvbWFpbl9jcmFzaChkKTsNCj4gICAgICAgICAgfQ0KPiAgICAgICAg
ICByZXR1cm4gdmFsOw0KPiArDQo+ICsgICAgY2FzZSBNU1JfU0hBRE9XX0dTX0JBU0U6DQo+ICsg
ICAgICAgIGlmICggdiA9PSBjdXJyICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgcmRt
c3JsKE1TUl9TSEFET1dfR1NfQkFTRSwgdmFsKTsNCj4gKyAgICAgICAgICAgIHJldHVybiB2YWw7
DQo+ICsgICAgICAgIH0NCj4gKyAgICAgICAgZWxzZQ0KPiArICAgICAgICAgICAgcmV0dXJuIHYt
PmFyY2guaHZtLnZteC5zaGFkb3dfZ3M7DQo+ICAgICAgfQ0KPiANCj4gICAgICAvKiBMb2dpYyB3
aGljaCBtYXliZSByZXF1aXJlcyByZW1vdGUgVk1DUyBhY3F1aXNpdGlvbi4gKi8NCj4gQEAgLTI0
ODksNyArMjQ5NCw2IEBAIHN0YXRpYyBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlIF9faW5pdGRh
dGENCj4gdm14X2Z1bmN0aW9uX3RhYmxlID0gew0KPiAgICAgIC5nZXRfY3BsICAgICAgICAgICAg
ICA9IF92bXhfZ2V0X2NwbCwNCj4gICAgICAuZ2V0X3NlZ21lbnRfcmVnaXN0ZXIgPSB2bXhfZ2V0
X3NlZ21lbnRfcmVnaXN0ZXIsDQo+ICAgICAgLnNldF9zZWdtZW50X3JlZ2lzdGVyID0gdm14X3Nl
dF9zZWdtZW50X3JlZ2lzdGVyLA0KPiAtICAgIC5nZXRfc2hhZG93X2dzX2Jhc2UgICA9IHZteF9n
ZXRfc2hhZG93X2dzX2Jhc2UsDQo+ICAgICAgLnVwZGF0ZV9ob3N0X2NyMyAgICAgID0gdm14X3Vw
ZGF0ZV9ob3N0X2NyMywNCj4gICAgICAudXBkYXRlX2d1ZXN0X2NyICAgICAgPSB2bXhfdXBkYXRl
X2d1ZXN0X2NyLA0KPiAgICAgIC51cGRhdGVfZ3Vlc3RfZWZlciAgICA9IHZteF91cGRhdGVfZ3Vl
c3RfZWZlciwNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vaHZt
LmgNCj4gYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL2h2bS5oDQo+IGluZGV4IDg0MmY5
ODc2M2M0Yi4uZmViOWQyMjFhNmE2IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVk
ZS9hc20vaHZtL2h2bS5oDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vaHZt
LmgNCj4gQEAgLTEyOCw3ICsxMjgsNiBAQCBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlIHsNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzZWdtZW50X3JlZ2lzdGVy
ICpyZWcpOw0KPiAgICAgIHZvaWQgKCpzZXRfc2VnbWVudF9yZWdpc3Rlcikoc3RydWN0IHZjcHUg
KnYsIGVudW0geDg2X3NlZ21lbnQgc2VnLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHNlZ21lbnRfcmVnaXN0ZXIgKnJlZyk7DQo+IC0gICAgdW5zaWduZWQgbG9u
ZyAoKmdldF9zaGFkb3dfZ3NfYmFzZSkoc3RydWN0IHZjcHUgKnYpOw0KPiANCj4gICAgICAvKg0K
PiAgICAgICAqIFJlLXNldCB0aGUgdmFsdWUgb2YgQ1IzIHRoYXQgWGVuIHJ1bnMgb24gd2hlbiBo
YW5kbGluZyBWTSBleGl0cy4NCj4gQEAgLTQ2OSwxMSArNDY4LDYgQEAgaHZtX2dldF9jcGwoc3Ry
dWN0IHZjcHUgKnYpDQo+ICAgICAgcmV0dXJuIGFsdGVybmF0aXZlX2NhbGwoaHZtX2Z1bmNzLmdl
dF9jcGwsIHYpOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBodm1f
Z2V0X3NoYWRvd19nc19iYXNlKHN0cnVjdCB2Y3B1ICp2KQ0KPiAtew0KPiAtICAgIHJldHVybiBh
bHRlcm5hdGl2ZV9jYWxsKGh2bV9mdW5jcy5nZXRfc2hhZG93X2dzX2Jhc2UsIHYpOw0KPiAtfQ0K
PiAtDQo+ICAjZGVmaW5lIGhhc19odm1fcGFyYW1zKGQpIFwNCj4gICAgICAoKGQpLT5hcmNoLmh2
bS5wYXJhbXMgIT0gTlVMTCkNCj4gDQo+IEBAIC03NTMsNyArNzQ3LDYgQEAgdm9pZCBodm1fc2V0
X3JlZyhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHJlZywNCj4gdWludDY0X3QgdmFsKTsN
Cj4gICAqIG5lZWRlZCBiZWNhdXNlIERDRSB3aWxsIGtpY2sgaW4uDQo+ICAgKi8NCj4gIGludCBo
dm1fZ3Vlc3RfeDg2X21vZGUoc3RydWN0IHZjcHUgKnYpOw0KPiAtdW5zaWduZWQgbG9uZyBodm1f
Z2V0X3NoYWRvd19nc19iYXNlKHN0cnVjdCB2Y3B1ICp2KTsNCj4gIHZvaWQgaHZtX2NwdWlkX3Bv
bGljeV9jaGFuZ2VkKHN0cnVjdCB2Y3B1ICp2KTsNCj4gIHZvaWQgaHZtX3NldF90c2Nfb2Zmc2V0
KHN0cnVjdCB2Y3B1ICp2LCB1aW50NjRfdCBvZmZzZXQsIHVpbnQ2NF90IGF0X3RzYyk7DQo+IA0K
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jIGIveGVuL2FyY2gveDg2
L3g4Nl82NC90cmFwcy5jDQo+IGluZGV4IGQ2NjFkN2ZmY2FhZi4uZDk3YmYwN2IyMmJjIDEwMDY0
NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMNCj4gKysrIGIveGVuL2FyY2gv
eDg2L3g4Nl82NC90cmFwcy5jDQo+IEBAIC03OSw3ICs3OSw3IEBAIHN0YXRpYyB2b2lkIGdldF9o
dm1fcmVnaXN0ZXJzKHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QNCj4gY3B1X3VzZXJfcmVncyAqcmVn
cywNCj4gICAgICBodm1fZ2V0X3NlZ21lbnRfcmVnaXN0ZXIodiwgeDg2X3NlZ19zcywgJnNyZWcp
Ow0KPiAgICAgIHJlZ3MtPnNzID0gc3JlZy5zZWw7DQo+IA0KPiAtICAgIGNyc1s3XSA9IGh2bV9n
ZXRfc2hhZG93X2dzX2Jhc2Uodik7DQo+ICsgICAgY3JzWzddID0gaHZtX2dldF9yZWcodiwgTVNS
X1NIQURPV19HU19CQVNFKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBfc2hvd19yZWdpc3Rl
cnMoDQo+IC0tDQo+IDIuMTEuMA0KDQo=

