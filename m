Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF3510FD8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 06:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314341.532362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njZ3N-00021U-Re; Wed, 27 Apr 2022 04:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314341.532362; Wed, 27 Apr 2022 04:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njZ3N-0001zf-Nb; Wed, 27 Apr 2022 04:13:25 +0000
Received: by outflank-mailman (input) for mailman id 314341;
 Wed, 27 Apr 2022 04:13:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/sE=VF=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1njZ3M-0001k0-De
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 04:13:24 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fda170c-c5e0-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 06:13:23 +0200 (CEST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 21:13:20 -0700
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2022 21:13:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 21:13:20 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 21:13:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 21:13:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 21:13:19 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR11MB1850.namprd11.prod.outlook.com (2603:10b6:3:112::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 04:13:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 04:13:11 +0000
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
X-Inumbo-ID: 5fda170c-c5e0-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651032803; x=1682568803;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TuKrAf6OA0DwT66o2+6ye9e++dhZiNMNwvQGFdNxR/0=;
  b=ZTIyfn20jlYlrj8FyS5e72iVjGavE9VgWfLXGwsgzE/tVv34o5YIIxzE
   nHrfaIaoGFuVx4Z6sabW1iLRiXu0/Gv5szoZv4y4NWPmpDfv8oK0CvmQW
   AiCCvFvSi77zfQdZKS/mvzpxeux+oudau57bYrijsFd0G3yWm3rplCzLv
   RAee4ePDDcEgvgqRdzl7dko7hEe+730w8T7LjIRiA5Ap4CCRm3xE4VNHA
   8al2AFrLCWYZKVvSy0vM4xV4/y4GN28gpLAWgO4i7UiS2gT99gJwW33Vv
   XFU5ISNLxTsVqdhRmbv9lrHzLxsw90CoL+6j5yCGJ6Iym0H+948c9a0dC
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245730240"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="245730240"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="705365061"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/IcKbyMNhFK5MpRzRXPjSmbF3UKmHwWbRFfqtWxB1sf/q5HFeUh/TcIZJbVIAUL5Z9G19SQmhDDssd+a64JFzCsF4SJiF++J/96rPUp0K9EUzwAcCAb+6YidcxKQ1a+AcVeVwwZ6YxcuEbUB+buuS5jfGKRzknAOhBh7DvMbNwmRzUV1JE+II4mt0oyQb5gwf6+I2CX+/HcKypvkLgkTXwiK1sQ1rCc38VfRo5/F11ixDSn2+dTEdmrNZnPU6QG2x0FOOyfDfzhcarl2Zn4PKrK5Ta6qFNSWAaGpm48OYlO7zuZ61BxhfX1VdVuJ9DcRpbWrNDdctgl6HiIPPIAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuKrAf6OA0DwT66o2+6ye9e++dhZiNMNwvQGFdNxR/0=;
 b=d96z/F3vujFvI/poTD5lyOMTNCCOBnaWsKXB/nbcOgteCvqWrVNflHZBrs9UyRiPmN0+sTU1FPT69kW7WrELuLJQzbzmkpKEBg5KuAOUHaxvel4O3kCPsBAupExpiMjp4Is7p8roF+1N3e3ebOzVBN2EykSw0XmXaq5w5JK/yMivp/NtULH647MN6gHKZ02G02oRrNWgvhj9OxIefSN3JN3A7SM2KKodKd6jZ5uBcWRn1SYdGY/m42EpYoFtsIgbtxDJVIo9OD9dXyWMln3AJ0BF8Ksp9caQ8kQHsfqL7oBd869T4GGbBu3UQiGCemt43nYmflgSyytrM+v9Q0wy3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v4 21/21] VT-d: fold dma_pte_clear_one() into its only
 caller
Thread-Topic: [PATCH v4 21/21] VT-d: fold dma_pte_clear_one() into its only
 caller
Thread-Index: AQHYWIDPpY/WdqPWHkWCZK6rwaQRsK0DKRsg
Date: Wed, 27 Apr 2022 04:13:11 +0000
Message-ID: <BN9PR11MB52768648BBD4F64235F717C08CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <4a24a85e-267f-9de5-4009-b32b9ab8aa0d@suse.com>
In-Reply-To: <4a24a85e-267f-9de5-4009-b32b9ab8aa0d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c4c4275-a5f0-4da7-7480-08da28043e41
x-ms-traffictypediagnostic: DM5PR11MB1850:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR11MB185008B70A5CE69538BFBF2F8CFA9@DM5PR11MB1850.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yg1rrKzNKSDvZIrdbJulT4qjFzhj+ITh3ZORLPoF9TaMyyGXT+lDofD7E4GtuFRW0OSTGgM6SOvvh30V7UsuD5AOg13WesZwaXldVowtohL517cW34rxJ8hQGJWq1hSZND8LIHQgH6SEDJL5yZu4P0CuJeQ/FW3yETv398hGIdlXh1ONWfrxz8Ia/Lpq0nZo+63gijOmDjm2q/otWdS/3b42gDZtARBHibwLbHnFdVIRlLaoUX5/HTn7BQVrKILmrNeYJjpxw2KO3PyiH2HWa97OzcR73367ZooBx6s2keFq6Zmr/Xw1VlQn620C/2DGKHumf13B4UdTsPyNscb61v2aLeX1KWsq0wzGEjcZBx/JH2dYEQK8A1O85Lmjw/s9wYfd05xFZQNg4IjN96v6vTOJlOxd6dajpxW9bASBb/MuusMpwc2jFEfFBhN9ggZKDxUkCdtLY4VCmeJlaIHfHyAzpDbS+sNtur2DYmvXtR4ltIjjBt/1IZ9tOjWCr1SxIx/9W09ifrU8mwPJpf0I+2kkYBcdkpgY6zuJA9Z9cCumjPoyu/cNAmf3RfkzKoWs3TSv0vVjq/ZRu0X3niWEn0ZLFU29npAYy5QnpgorplvpAdcQE+Pef3zM7K5KKNdLsPiPgdfAp5EXsnhSAV8coQjpmkMVZb6UI3tgAjjrm1X/S2MeVX4iYARUO+4QApqW0mToVvJrulSKGlNkF2U/YA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(83380400001)(66476007)(66556008)(66946007)(76116006)(64756008)(54906003)(5660300002)(66446008)(316002)(110136005)(4326008)(8676002)(52536014)(122000001)(86362001)(508600001)(186003)(8936002)(55016003)(82960400001)(38100700002)(38070700005)(7696005)(6506007)(26005)(9686003)(33656002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aG1QV2U0Y1pMQ2tSaWJ2Q2t6R3RJRmk0TkhYUWhqUE5uVHg2S2daQlNCZ1Zl?=
 =?utf-8?B?QVByM21HQnViMDA5QThMcjBqVTFBTDVxMmRHYk1nSERKUVNQOEdwbW9WUU1Q?=
 =?utf-8?B?VEZNVjJsMk5tWEZsWnJCaXNtdzJwY2h5MXJ6QjNCOXZ0andyYjR3MlBmcFht?=
 =?utf-8?B?TlYwdUFMVG41T2pFWjQ1V1BrQVFaVENoMnlRd04zUURQQU1QWHBrSWhjUmF2?=
 =?utf-8?B?d240UVNMTnUyUCtGMTB3cVMzbFBYRE92NVRrTmxidFVkTEsvbmowdmdsOVh6?=
 =?utf-8?B?cHd1YTVUZ0VwckVVVVlQekxpd2UzVXVFbnJ4eWFpQmVRSEEzUlBnR3hyVkdU?=
 =?utf-8?B?Rmx6U0Q4STF2UkcrUUZpSzBTTmJOMVdaZm1TTFBQQWw5bGVKSFgyWU11SGgy?=
 =?utf-8?B?V3laMUhxYXBRcFQwbFNoTkdBYlFpUlZXWTFsYks5M3dmaFZhNWNKMUthWVdl?=
 =?utf-8?B?Q1FydTN5eWdvc3lxQzkycGMvekJ1ZmxsQ0dKL2JuMXZkdE43NDhNNmNrWmUv?=
 =?utf-8?B?aTh2RWg1WDlkRSsxTExBMm4zNnc1SVA4SDNwRTR2L29IYjNGRFJXanZFNmFM?=
 =?utf-8?B?Tm5BcXV3VnJneWQ4Qm42cUREWDlQSzlHWU8vRDhBZ21yWFViYjYyUUZ2cUls?=
 =?utf-8?B?ajFCWWEyTCt0OUlsNGtQU2xnYnlvZjhJOWdWN3hIYmdnWFNERmJmU05xVm9U?=
 =?utf-8?B?Z0FFWmtHNm5nM3FPUXpZQ3dPWThaMkJyaXhuTmZZaUcrdXZ0ZGlCTzZCWnE0?=
 =?utf-8?B?REc5V0ZPU1NCdENJdmJFRkoyQ1pZVHRhckRGbEh0YTVrWjdWWVVuVHBIQVVM?=
 =?utf-8?B?VEJaY00wWE90cUhBa2JsMVI1VWtNazRuLzIxNGpiSHh4SzNVaVlkTCswUXhP?=
 =?utf-8?B?djJwYVlOdjIzNmI0ZG5ER3V3N1BVZDl6WU9VZUo1cUliTno5NlZ3dU0zQUZs?=
 =?utf-8?B?bi94N1lUTk90VzVHWWQybUVnNnBxWGtRemlJM3RLWXhHWXdGTVo4enJwZndy?=
 =?utf-8?B?TVVWYVRTcWtwTXVDdnNYSTdPRE4rSkhTZWZHd3VCU29EY2ViZW1aMENYSlZU?=
 =?utf-8?B?aFNDRU1iZW1keXQyRVpJYVBnRENiMERYRmx5UmtOYmQydk5XNmhZejVIY3Fr?=
 =?utf-8?B?N1BTc0lKZjhwdmlER25qR3F1S1R2eFFyN2Yvb2NTTFpRc0ZSZ1cvWWZiUy9p?=
 =?utf-8?B?REQzVG5ESlZKb1V2dVJIZE44aUdjRkhIVzlJeWVxdkgrbWtOb2pRTlVLTDhV?=
 =?utf-8?B?MGRhR2l2aFpJY3JhK3Fva0ZtVFlwMXlxUmkrK2MxaGc0TlN6TnRGdVJ4UVgr?=
 =?utf-8?B?VlJrRzlyamlNaTJQdHR4Y1VQV0hzMzRFUXFncHQ2WHpMR0hMUVVyd0Nra2J0?=
 =?utf-8?B?cTcvZWprRTE0WkFiclgyeVVnZW42TG1YZ1hvd0Y4VkgyMXZhTTkvR3VhbnN0?=
 =?utf-8?B?VFFuNHdjbEZZeG5JTHlEd0NWVFRSN01JNVFtSUM3MWZ6am5PL2hGR1prZDNx?=
 =?utf-8?B?QzJuZmNoZGo2SkVEeGlxT1dtcGtFZ3g3ZkY4dzV4clFibk9Fc3Vhb09QS09s?=
 =?utf-8?B?Szk4UUpubGJBUll4bWlMQ1owL3dmNFh1ZzFlYXFCbUFmSlBrVlN3eGxyYTQr?=
 =?utf-8?B?UlVKSTBFeEtzTm1CR2FDTlVUUXFSK1ZpekY2czdnS3FlaDlnUEN5Mml1WWlu?=
 =?utf-8?B?Yjh6blZrcVFhTTFucEhQaDlMUVJqdElVb0Z3SmVVNWxSUVZ5d2RkenBzQ1hp?=
 =?utf-8?B?SkdlbGNVbE9reXlCbDZQN2t1YUdyMzhCWHoxNmNzOWk2N0YyRWpEWkt3SGsx?=
 =?utf-8?B?eUkrQU9rR2xOMklPbE5MRlExOFAvOXRkTG5SYS9ZNTYyTHRYcEgxckJUVTY4?=
 =?utf-8?B?YytNNzYyOFRNdmtCY2c1aDhZQThwN1BrSS9XZ29lNHZDYlFEYXZIUm03Ni9Y?=
 =?utf-8?B?dWdCY01zdWVqemhwb200cGRMdllPZS9vUS9GZFlEaU51R1NoK0Fvd2U1a090?=
 =?utf-8?B?cTBmVThnTGpCdXVGNzN0TDdPS0RhVGZ6a0JzSWFndTZ6aDY4R1cwZlcrU3dQ?=
 =?utf-8?B?RFgrMThQSFVlVTVRaVlQenJvMWkyS29LZkZyNFQvMUEwNmxWWm9GRU92SzRL?=
 =?utf-8?B?dE5ZUUlLVk1KbE52MjRkUk5xZVdZV04vckozME5pY3BRVG9xclNta1JiQncv?=
 =?utf-8?B?L0Jvb0tzYWt4VDY1V282T29TbkQrYURQM0JpNDdlbEw1aVVnVVhMWEhrekNV?=
 =?utf-8?B?aXJldi8vaUt5dWQzTWdoNTRkZkloSHNkZk55Y2J1WVJpRFNITWhCMFVNMUdV?=
 =?utf-8?B?WE04bkVpM25LN0k3N3g4YmZaVEpWZDBzbm16dk9wY2dmempQNG16Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4c4275-a5f0-4da7-7480-08da28043e41
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 04:13:11.5335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5A99SZwAKnLDPMUlklSltmK8LBKCjpLwp6ozSu1+KJxsJJjIhXh8UQho3gZ6zkXWevmKlZQSe0+P1tzavNi/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1850
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMjUsIDIwMjIgNDo0NSBQTQ0KPiANCj4gVGhpcyB3YXkgaW50ZWxfaW9tbXVfdW5tYXBf
cGFnZSgpIGVuZHMgdXAgcXVpdGUgYSBiaXQgbW9yZSBzaW1pbGFyIHRvDQo+IGludGVsX2lvbW11
X21hcF9wYWdlKCkuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiB2NDog
TmV3Lg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4g
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gQEAgLTgwNiw3NSAr
ODA2LDYgQEAgc3RhdGljIHZvaWQgcXVldWVfZnJlZV9wdChzdHJ1Y3QgZG9tYWluXw0KPiAgICAg
IGlvbW11X3F1ZXVlX2ZyZWVfcGd0YWJsZShoZCwgbWZuX3RvX3BhZ2UobWZuKSk7DQo+ICB9DQo+
IA0KPiAtLyogY2xlYXIgb25lIHBhZ2UncyBwYWdlIHRhYmxlICovDQo+IC1zdGF0aWMgaW50IGRt
YV9wdGVfY2xlYXJfb25lKHN0cnVjdCBkb21haW4gKmRvbWFpbiwgZGFkZHJfdCBhZGRyLA0KPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIsDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZmx1c2hfZmxhZ3MpDQo+IC17
DQo+IC0gICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZG9tYWluKTsNCj4g
LSAgICBzdHJ1Y3QgZG1hX3B0ZSAqcGFnZSA9IE5VTEwsICpwdGUgPSBOVUxMLCBvbGQ7DQo+IC0g
ICAgdTY0IHBnX21hZGRyOw0KPiAtICAgIHVuc2lnbmVkIGludCBsZXZlbCA9IChvcmRlciAvIExF
VkVMX1NUUklERSkgKyAxOw0KPiAtDQo+IC0gICAgc3Bpbl9sb2NrKCZoZC0+YXJjaC5tYXBwaW5n
X2xvY2spOw0KPiAtICAgIC8qIGdldCB0YXJnZXQgbGV2ZWwgcHRlICovDQo+IC0gICAgcGdfbWFk
ZHIgPSBhZGRyX3RvX2RtYV9wYWdlX21hZGRyKGRvbWFpbiwgYWRkciwgbGV2ZWwsIGZsdXNoX2Zs
YWdzLA0KPiBmYWxzZSk7DQo+IC0gICAgaWYgKCBwZ19tYWRkciA8IFBBR0VfU0laRSApDQo+IC0g
ICAgew0KPiAtICAgICAgICBzcGluX3VubG9jaygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsNCj4g
LSAgICAgICAgcmV0dXJuIHBnX21hZGRyID8gLUVOT01FTSA6IDA7DQo+IC0gICAgfQ0KPiAtDQo+
IC0gICAgcGFnZSA9IChzdHJ1Y3QgZG1hX3B0ZSAqKW1hcF92dGRfZG9tYWluX3BhZ2UocGdfbWFk
ZHIpOw0KPiAtICAgIHB0ZSA9ICZwYWdlW2FkZHJlc3NfbGV2ZWxfb2Zmc2V0KGFkZHIsIGxldmVs
KV07DQo+IC0NCj4gLSAgICBpZiAoICFkbWFfcHRlX3ByZXNlbnQoKnB0ZSkgKQ0KPiAtICAgIHsN
Cj4gLSAgICAgICAgc3Bpbl91bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+IC0gICAg
ICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShwYWdlKTsNCj4gLSAgICAgICAgcmV0dXJuIDA7DQo+
IC0gICAgfQ0KPiAtDQo+IC0gICAgb2xkID0gKnB0ZTsNCj4gLSAgICBkbWFfY2xlYXJfcHRlKCpw
dGUpOw0KPiAtICAgIGlvbW11X3N5bmNfY2FjaGUocHRlLCBzaXplb2YoKnB0ZSkpOw0KPiAtDQo+
IC0gICAgd2hpbGUgKCBwdF91cGRhdGVfY29udGlnX21hcmtlcnMoJnBhZ2UtPnZhbCwNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRyZXNzX2xldmVsX29mZnNldChh
ZGRyLCBsZXZlbCksDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGV2
ZWwsIFBURV9raW5kX251bGwpICYmDQo+IC0gICAgICAgICAgICArK2xldmVsIDwgbWluX3B0X2xl
dmVscyApDQo+IC0gICAgew0KPiAtICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZyA9IG1hZGRy
X3RvX3BhZ2UocGdfbWFkZHIpOw0KPiAtDQo+IC0gICAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFn
ZShwYWdlKTsNCj4gLQ0KPiAtICAgICAgICBwZ19tYWRkciA9IGFkZHJfdG9fZG1hX3BhZ2VfbWFk
ZHIoZG9tYWluLCBhZGRyLCBsZXZlbCwNCj4gZmx1c2hfZmxhZ3MsDQo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWxzZSk7DQo+IC0gICAgICAgIEJVR19PTihw
Z19tYWRkciA8IFBBR0VfU0laRSk7DQo+IC0NCj4gLSAgICAgICAgcGFnZSA9IG1hcF92dGRfZG9t
YWluX3BhZ2UocGdfbWFkZHIpOw0KPiAtICAgICAgICBwdGUgPSAmcGFnZVthZGRyZXNzX2xldmVs
X29mZnNldChhZGRyLCBsZXZlbCldOw0KPiAtICAgICAgICBkbWFfY2xlYXJfcHRlKCpwdGUpOw0K
PiAtICAgICAgICBpb21tdV9zeW5jX2NhY2hlKHB0ZSwgc2l6ZW9mKCpwdGUpKTsNCj4gLQ0KPiAt
ICAgICAgICAqZmx1c2hfZmxhZ3MgfD0gSU9NTVVfRkxVU0hGX2FsbDsNCj4gLSAgICAgICAgaW9t
bXVfcXVldWVfZnJlZV9wZ3RhYmxlKGhkLCBwZyk7DQo+IC0gICAgICAgIHBlcmZjX2luY3IoaW9t
bXVfcHRfY29hbGVzY2VzKTsNCj4gLSAgICB9DQo+IC0NCj4gLSAgICBzcGluX3VubG9jaygmaGQt
PmFyY2gubWFwcGluZ19sb2NrKTsNCj4gLQ0KPiAtICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShw
YWdlKTsNCj4gLQ0KPiAtICAgICpmbHVzaF9mbGFncyB8PSBJT01NVV9GTFVTSEZfbW9kaWZpZWQ7
DQo+IC0NCj4gLSAgICBpZiAoIG9yZGVyICYmICFkbWFfcHRlX3N1cGVycGFnZShvbGQpICkNCj4g
LSAgICAgICAgcXVldWVfZnJlZV9wdChoZCwgbWFkZHJfdG9fbWZuKGRtYV9wdGVfYWRkcihvbGQp
KSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICBvcmRlciAvIExFVkVMX1NUUklERSk7DQo+IC0N
Cj4gLSAgICByZXR1cm4gMDsNCj4gLX0NCj4gLQ0KPiAgc3RhdGljIGludCBpb21tdV9zZXRfcm9v
dF9lbnRyeShzdHJ1Y3QgdnRkX2lvbW11ICppb21tdSkNCj4gIHsNCj4gICAgICB1MzIgc3RzOw0K
PiBAQCAtMjI2MSw2ICsyMTkyLDEyIEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGNmX2NoZWNr
IGludGVsX2kNCj4gIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGNmX2NoZWNrIGludGVsX2lvbW11
X3VubWFwX3BhZ2UoDQo+ICAgICAgc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCB1bnNpZ25l
ZCBpbnQgb3JkZXIsIHVuc2lnbmVkIGludCAqZmx1c2hfZmxhZ3MpDQo+ICB7DQo+ICsgICAgc3Ry
dWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7DQo+ICsgICAgZGFkZHJfdCBhZGRy
ID0gZGZuX3RvX2RhZGRyKGRmbik7DQo+ICsgICAgc3RydWN0IGRtYV9wdGUgKnBhZ2UgPSBOVUxM
LCAqcHRlID0gTlVMTCwgb2xkOw0KPiArICAgIHVpbnQ2NF90IHBnX21hZGRyOw0KPiArICAgIHVu
c2lnbmVkIGludCBsZXZlbCA9IChvcmRlciAvIExFVkVMX1NUUklERSkgKyAxOw0KPiArDQo+ICAg
ICAgLyogRG8gbm90aGluZyBpZiBWVC1kIHNoYXJlcyBFUFQgcGFnZSB0YWJsZSAqLw0KPiAgICAg
IGlmICggaW9tbXVfdXNlX2hhcF9wdChkKSApDQo+ICAgICAgICAgIHJldHVybiAwOw0KPiBAQCAt
MjI2OSw3ICsyMjA2LDYyIEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGNmX2NoZWNrIGludGVs
X2kNCj4gICAgICBpZiAoIGlvbW11X2h3ZG9tX3Bhc3N0aHJvdWdoICYmIGlzX2hhcmR3YXJlX2Rv
bWFpbihkKSApDQo+ICAgICAgICAgIHJldHVybiAwOw0KPiANCj4gLSAgICByZXR1cm4gZG1hX3B0
ZV9jbGVhcl9vbmUoZCwgZGZuX3RvX2RhZGRyKGRmbiksIG9yZGVyLCBmbHVzaF9mbGFncyk7DQo+
ICsgICAgc3Bpbl9sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOw0KPiArICAgIC8qIGdldCB0
YXJnZXQgbGV2ZWwgcHRlICovDQo+ICsgICAgcGdfbWFkZHIgPSBhZGRyX3RvX2RtYV9wYWdlX21h
ZGRyKGQsIGFkZHIsIGxldmVsLCBmbHVzaF9mbGFncywgZmFsc2UpOw0KPiArICAgIGlmICggcGdf
bWFkZHIgPCBQQUdFX1NJWkUgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgc3Bpbl91bmxvY2soJmhk
LT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+ICsgICAgICAgIHJldHVybiBwZ19tYWRkciA/IC1FTk9N
RU0gOiAwOw0KPiArICAgIH0NCj4gKw0KPiArICAgIHBhZ2UgPSBtYXBfdnRkX2RvbWFpbl9wYWdl
KHBnX21hZGRyKTsNCj4gKyAgICBwdGUgPSAmcGFnZVthZGRyZXNzX2xldmVsX29mZnNldChhZGRy
LCBsZXZlbCldOw0KPiArDQo+ICsgICAgaWYgKCAhZG1hX3B0ZV9wcmVzZW50KCpwdGUpICkNCj4g
KyAgICB7DQo+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOw0K
PiArICAgICAgICB1bm1hcF92dGRfZG9tYWluX3BhZ2UocGFnZSk7DQo+ICsgICAgICAgIHJldHVy
biAwOw0KPiArICAgIH0NCj4gKw0KPiArICAgIG9sZCA9ICpwdGU7DQo+ICsgICAgZG1hX2NsZWFy
X3B0ZSgqcHRlKTsNCj4gKyAgICBpb21tdV9zeW5jX2NhY2hlKHB0ZSwgc2l6ZW9mKCpwdGUpKTsN
Cj4gKw0KPiArICAgIHdoaWxlICggcHRfdXBkYXRlX2NvbnRpZ19tYXJrZXJzKCZwYWdlLT52YWws
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRkcmVzc19sZXZlbF9v
ZmZzZXQoYWRkciwgbGV2ZWwpLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxldmVsLCBQVEVfa2luZF9udWxsKSAmJg0KPiArICAgICAgICAgICAgKytsZXZlbCA8IG1p
bl9wdF9sZXZlbHMgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcg
PSBtYWRkcl90b19wYWdlKHBnX21hZGRyKTsNCj4gKw0KPiArICAgICAgICB1bm1hcF92dGRfZG9t
YWluX3BhZ2UocGFnZSk7DQo+ICsNCj4gKyAgICAgICAgcGdfbWFkZHIgPSBhZGRyX3RvX2RtYV9w
YWdlX21hZGRyKGQsIGFkZHIsIGxldmVsLCBmbHVzaF9mbGFncywNCj4gZmFsc2UpOw0KPiArICAg
ICAgICBCVUdfT04ocGdfbWFkZHIgPCBQQUdFX1NJWkUpOw0KPiArDQo+ICsgICAgICAgIHBhZ2Ug
PSBtYXBfdnRkX2RvbWFpbl9wYWdlKHBnX21hZGRyKTsNCj4gKyAgICAgICAgcHRlID0gJnBhZ2Vb
YWRkcmVzc19sZXZlbF9vZmZzZXQoYWRkciwgbGV2ZWwpXTsNCj4gKyAgICAgICAgZG1hX2NsZWFy
X3B0ZSgqcHRlKTsNCj4gKyAgICAgICAgaW9tbXVfc3luY19jYWNoZShwdGUsIHNpemVvZigqcHRl
KSk7DQo+ICsNCj4gKyAgICAgICAgKmZsdXNoX2ZsYWdzIHw9IElPTU1VX0ZMVVNIRl9hbGw7DQo+
ICsgICAgICAgIGlvbW11X3F1ZXVlX2ZyZWVfcGd0YWJsZShoZCwgcGcpOw0KPiArICAgICAgICBw
ZXJmY19pbmNyKGlvbW11X3B0X2NvYWxlc2Nlcyk7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgc3Bp
bl91bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+ICsNCj4gKyAgICB1bm1hcF92dGRf
ZG9tYWluX3BhZ2UocGFnZSk7DQo+ICsNCj4gKyAgICAqZmx1c2hfZmxhZ3MgfD0gSU9NTVVfRkxV
U0hGX21vZGlmaWVkOw0KPiArDQo+ICsgICAgaWYgKCBvcmRlciAmJiAhZG1hX3B0ZV9zdXBlcnBh
Z2Uob2xkKSApDQo+ICsgICAgICAgIHF1ZXVlX2ZyZWVfcHQoaGQsIG1hZGRyX3RvX21mbihkbWFf
cHRlX2FkZHIob2xkKSksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgb3JkZXIgLyBMRVZFTF9T
VFJJREUpOw0KPiArDQo+ICsgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBj
Zl9jaGVjayBpbnRlbF9pb21tdV9sb29rdXBfcGFnZSgNCg0K

