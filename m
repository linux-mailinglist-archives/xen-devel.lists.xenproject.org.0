Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CEC315D21
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 03:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83475.155459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9f89-0000IP-8C; Wed, 10 Feb 2021 02:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83475.155459; Wed, 10 Feb 2021 02:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9f89-0000Hc-4v; Wed, 10 Feb 2021 02:21:25 +0000
Received: by outflank-mailman (input) for mailman id 83475;
 Wed, 10 Feb 2021 02:21:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sgYq=HM=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1l9f87-0000HX-KS
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 02:21:23 +0000
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1320c047-8902-4955-a191-59492d8e9732;
 Wed, 10 Feb 2021 02:21:20 +0000 (UTC)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 18:21:19 -0800
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 09 Feb 2021 18:21:18 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 18:21:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 18:21:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 9 Feb 2021 18:21:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 9 Feb 2021 18:21:17 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1520.namprd11.prod.outlook.com (2603:10b6:301:b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Wed, 10 Feb
 2021 02:21:14 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 02:21:14 +0000
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
X-Inumbo-ID: 1320c047-8902-4955-a191-59492d8e9732
IronPort-SDR: 5C9QNkzzHmFL6e3crUnt90UwcxxwieWsrD2a4g+Prgp4H2nMLv/qPLE1Z/adcfcV6da+A2tRR4
 httz7bCp00Nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182141502"
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; 
   d="scan'208";a="182141502"
IronPort-SDR: 3xrGCGKGQkU1kNJdBbcmHG6jBUDDK+hHEGnrRz6twJ8pvtAcZc+LORHJi+0pRVC5By78TuxcKF
 Qm4eauq/VaeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; 
   d="scan'208";a="399010233"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbLkjcU28PmEQVTgV2qZNlQT9DIIg0pBTL6r7v5K5W/7jsmjD3LF65U84/Y18UeiG3+fXLb+TIBrZwLx0B5nKZGc8NZHBmQTn7U7BaGR72OfuBOUZtnNEJ9naNHUFaXszCM42insBJobzppqx2U2CADiYBwo2Wfiy80YN+Uo7IdUizv0GDYrwysDCSZWcBx77Pj0hhKXHo3h56sbA3wc4oVOj73aZELjEHwBBtm6xGMzrgwWpk+Mq/oEyRLj8yLDNr7Xr4lzdwi0grd6WrepadnLnGHvXQpJVcX9GQEMVVFdF2ucISh4vbpS5t1CC+4yv0GJBoCUJuYuUrtfjGQAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8QagWhyIYQyHSiPB4aG3zr+NfNXMTJU65g/jXVd69E=;
 b=C0bZGbKl6d2Z6LEEp03q0sCA2JHwRFb0hfcNzqdOCDANCCQ5eEK7xuJ/74KbfZfyCAuem6PsoPnGPaciwDGBp15Oz0MqLa/BQpWAZ8doPBtvtFaHVd9ivTAYfPFEA5Y6tw9Qpl+3nTiHXrLOU67JJb5kp+OsLv9HkLrBU2S+V5vqDGvw+sgFyrp/S1/5OHI1LcBn+o062fOEH27Ru+kxwKMamYIM7shw13rygs9apr+9Lh0HNOiQnNqR5z9CPZBXHQ69fwjEpCNEaLMbC//I6sGO2sX0HF1Fq9xE5R6wpQQ9rL6/CPKHjAVjBmk0XJKdQcq7HQB58f4/GEeIvtpncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8QagWhyIYQyHSiPB4aG3zr+NfNXMTJU65g/jXVd69E=;
 b=MP/Xs1mjOg+JMI1DPZGiJSpA09kCfZNzuCHAp/IBHd6RsTgUmQFd05WC4LeBicmxbnE9SZ92jUnrbFToZ+faESJoaX1dLP8rZVAztlU2Q/vKk4IdbZvpYwLb00BKREhCywQWvnBHcBbpFcrj2Yt9Gnj/TC4802RkUZWRXHqrYOo=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "hongyxia@amazon.co.uk" <hongyxia@amazon.co.uk>, "iwj@xenproject.org"
	<iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>, Jan Beulich
	<jbeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: RE: [for-4.15][PATCH v2 5/5] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
Thread-Topic: [for-4.15][PATCH v2 5/5] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
Thread-Index: AQHW/vg+0ex05nXJyEaHJ1jzoYv6S6pQp57g
Date: Wed, 10 Feb 2021 02:21:14 +0000
Message-ID: <MWHPR11MB18869B3DB550711B3F6F6CA48C8D9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-6-julien@xen.org>
In-Reply-To: <20210209152816.15792-6-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 492c8a48-f4c3-451e-dead-08d8cd6a8a3b
x-ms-traffictypediagnostic: MWHPR11MB1520:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR11MB15209153660919233723E3678C8D9@MWHPR11MB1520.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ac2BYmEKdq2iboVhjW0THdydqdJnELAB5X94YYC0pCW1HQuGQHpDgkljmsaaH1I6RTZMU1jxhQkV4ctpfDs5CwXOU1Lk3BYQPgHcG9/wlHeIkDGr7r/0BGd6IOjAPwidvEFflV2JflEQU3JLLpDPzDOh3AH6mqXySWm0BnK/uBCzX1XTgQ5VVkcMkuVw912nQOpmoyh+gVhCr8mZzd5McneAJZxzT7rYtxkSPe5R018f/N69LfX9Uj9zQzBIYg8E6dkzbU3p4tXjEsQ0PSk0k24d6vlLSq08h+ZbZ33tD3TB+9eDcaWjU55pF5CyzToq1wCHzByvRUayigqPxGz0ILOUcpRmMxtNynhPL+1FcGZ45Qe+6MjY9vALLM9NWHXd1mnDn3xvtchSDPVnMJgYlhEPkVfVHIgm9cr3Uvdbah9u6Io1WkZuCpXWmo4uLlGPd3N/dBKPtKvp55v7eWLR+pmnoIeG+W9fKbvz/RdSh3hoBCe0NLsjFqcvRT1ChD5q43RIF/lhaNx+Ek7nhlu2Jg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(39860400002)(346002)(136003)(76116006)(186003)(71200400001)(64756008)(66556008)(66446008)(7696005)(83380400001)(2906002)(478600001)(316002)(4326008)(6506007)(66476007)(8936002)(9686003)(8676002)(5660300002)(55016002)(86362001)(26005)(54906003)(66946007)(110136005)(33656002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?r3hXZgaBhADlxHjF8hCVzpMi02qRKq3PkJQBj2YC0DwTVItMyh244Tg5hkLK?=
 =?us-ascii?Q?jXXojfoxMS1FhKsmIwlsmYxEQn8R5DT/TDSbrFtXlw4PG7uLB/HKa1U+fQPf?=
 =?us-ascii?Q?WpgBMsqXNrzhq84AhEMV8jgbluoNsekn1rS9l6+i0VIF8aOYQl4bvYnyXypj?=
 =?us-ascii?Q?T4G6Iv/kIzy2aTNnEPELTsme2l3bIdqjUbz2doluAmNL2t2CTpQltSITZKpN?=
 =?us-ascii?Q?kr4XP2VyMIGWpGy+4zFrWCBQkSdSqwVmPUxFxqCWB2aXd3BIYv5eaFr1A1Ap?=
 =?us-ascii?Q?WLJSfBEpfjYqloGokZI+DqBwtPEf6kAPTIEg1e7dCAZpqdEn8SIRKzIM0IXE?=
 =?us-ascii?Q?jINr9uq38s/NZb2rwyfNsR04PpIT14nKIl4c1nEAOeDiai2wNl+rTNQuo1SW?=
 =?us-ascii?Q?TvSNDnVs8rN6SxxZvgJs4u/syyH8r9YN7T0ghOPik9j9pRpOSbERFoqmV1l+?=
 =?us-ascii?Q?1/gFbYY4CWKt/TcUxKJUHbU8YVahOoKWOxZD773XJdUDLTAwxCN7yqA59i0f?=
 =?us-ascii?Q?0/f2CZ1eDH7FPNxzVVPfigxjZRUP2EWo0FLJJ2b12/4gmJaA5Q8clNiXrALl?=
 =?us-ascii?Q?LYM92UGoZFq1TjdQ+/ur08vwsBaKWMD5cNU534nWgIf73rwW4aH9K9HjjMP3?=
 =?us-ascii?Q?SMFgFCRhA47P1MLuVoa6PFGeLIE6hI2AQJN314DGWel6nQzuxTK7z2uRxOMP?=
 =?us-ascii?Q?O9nj2DuobuwSMaS4jBiCdX92Kh0iIGAa59psBU6r0TvqVPmHGX0HXGmoqnWd?=
 =?us-ascii?Q?sbmPpoNzrtjC9GABU9wBy+bCixMhIxCtqzVrjRMFgZTXKvCubd0itR1D1ONP?=
 =?us-ascii?Q?Zd97Zvp42swv3CQzE7M02HEVKzSqG8Gr4UNqg8MMRwySOFPf9orYcca+bqZx?=
 =?us-ascii?Q?VOOi6SvMjaNSElkWSenxj0peeutrDFWAfi194BB81u67ZK8wuofQIIeB5rth?=
 =?us-ascii?Q?lGXL8gf6jyNMvsMYYmMeKp5DkPlx7DksEJ8wSufJpSXLungnxQDUW1PnEYNc?=
 =?us-ascii?Q?uTTiAj14aL+xWZFqJPf8cEAAwEsoj/BKfBLR9ULzDmCXI4A+6x8imB6N4qhW?=
 =?us-ascii?Q?m2vMAy6WmEnOKXveOluLjRz3aLfg6ujF1hvRW4IXyMEKv5FKFtL1XHshUC9Z?=
 =?us-ascii?Q?wF4cbIOv3KhNjXgQ2izAkG0aAiqoag2upJeBYXQEsqJ16cR+t8f3RB8KjZwm?=
 =?us-ascii?Q?AFGlEBo//DZNsumvHh+4Ho1tph0Kl5+sM0tkHvWh/OndY32mgkvOy1QQduUz?=
 =?us-ascii?Q?3xSZFMXFDQQsVjLF+PMIMw944pYRlqpZT4yhsIiLa2wS4LtFn0EGoxD8oPUq?=
 =?us-ascii?Q?5Sm9L7d/z5NujV/k9DsMG47O?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492c8a48-f4c3-451e-dead-08d8cd6a8a3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 02:21:14.0962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8dscKfYiYplBbpAgifrGfSl1WlWi+cTCzXXPeYTbO5H8uAZob/PL1DZJHemiZ+rUD3RNKTbrtQH5GJI7GAfLQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1520
X-OriginatorOrg: intel.com

> From: Julien Grall <julien@xen.org>
> Sent: Tuesday, February 9, 2021 11:28 PM
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The new per-domain IOMMU page-table allocator will now free the
> page-tables when domain's resources are relinquished. However, the root
> page-table (i.e. hd->arch.pg_maddr) will not be cleared.

It's the pointer not the table itself.

>=20
> Xen may access the IOMMU page-tables afterwards at least in the case of
> PV domain:
>=20
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04025b4b2>] R
> iommu.c#addr_to_dma_page_maddr+0x12e/0x1d8
> (XEN)    [<ffff82d04025b695>] F
> iommu.c#intel_iommu_unmap_page+0x5d/0xf8
> (XEN)    [<ffff82d0402695f3>] F iommu_unmap+0x9c/0x129
> (XEN)    [<ffff82d0402696a6>] F iommu_legacy_unmap+0x26/0x63
> (XEN)    [<ffff82d04033c5c7>] F mm.c#cleanup_page_mappings+0x139/0x144
> (XEN)    [<ffff82d04033c61d>] F put_page+0x4b/0xb3
> (XEN)    [<ffff82d04033c87f>] F put_page_from_l1e+0x136/0x13b
> (XEN)    [<ffff82d04033cada>] F devalidate_page+0x256/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
> (XEN)    [<ffff82d04033d8d6>] F mm.c#put_page_from_l2e+0x8a/0xcf
> (XEN)    [<ffff82d04033cc27>] F devalidate_page+0x3a3/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
> (XEN)    [<ffff82d04033d807>] F mm.c#put_page_from_l3e+0x8a/0xcf
> (XEN)    [<ffff82d04033cdf0>] F devalidate_page+0x56c/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
> (XEN)    [<ffff82d04033d6c7>] F mm.c#put_page_from_l4e+0x69/0x6d
> (XEN)    [<ffff82d04033cf24>] F devalidate_page+0x6a0/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d92e>] F put_page_type_preemptible+0x13/0x15
> (XEN)    [<ffff82d04032598a>] F domain.c#relinquish_memory+0x1ff/0x4e9
> (XEN)    [<ffff82d0403295f2>] F domain_relinquish_resources+0x2b6/0x36a
> (XEN)    [<ffff82d040205cdf>] F domain_kill+0xb8/0x141
> (XEN)    [<ffff82d040236cac>] F do_domctl+0xb6f/0x18e5
> (XEN)    [<ffff82d04031d098>] F pv_hypercall+0x2f0/0x55f
> (XEN)    [<ffff82d04039b432>] F lstar_enter+0x112/0x120
>=20
> This will result to a use after-free and possibly an host crash or
> memory corruption.
>=20
> Freeing the page-tables further down in domain_relinquish_resources()
> would not work because pages may not be released until later if another
> domain hold a reference on them.
>=20
> Once all the PCI devices have been de-assigned, it is actually pointless
> to access modify the IOMMU page-tables. So we can simply clear the root
> page-table address.

Above two paragraphs are confusing to me. I don't know what exact change
is proposed until looking over the whole patch. Isn't it clearer to just sa=
y
"We should clear the root page table pointer in iommu_free_pgtables to
avoid use-after-free after all pgtables are moved to the free list"?

otherwise:

	Reviewed-by: Kevin Tian <kevin.tian@intel.com>

>=20
> Fixes: 3eef6d07d722 ("x86/iommu: convert VT-d code to use new page table
> allocator")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ---
>     Changes in v2:
>         - Introduce clear_root_pgtable()
>         - Move the patch later in the series
> ---
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 +++++++++++-
>  xen/drivers/passthrough/vtd/iommu.c         | 12 +++++++++++-
>  xen/drivers/passthrough/x86/iommu.c         |  6 ++++++
>  xen/include/xen/iommu.h                     |  1 +
>  4 files changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 42b5a5a9bec4..81add0ba26b4 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -381,9 +381,18 @@ static int amd_iommu_assign_device(struct domain
> *d, u8 devfn,
>      return reassign_device(pdev->domain, d, devfn, pdev);
>  }
>=20
> +static void iommu_clear_root_pgtable(struct domain *d)
> +{
> +    struct domain_iommu *hd =3D dom_iommu(d);
> +
> +    spin_lock(&hd->arch.mapping_lock);
> +    hd->arch.amd.root_table =3D NULL;
> +    spin_unlock(&hd->arch.mapping_lock);
> +}
> +
>  static void amd_iommu_domain_destroy(struct domain *d)
>  {
> -    dom_iommu(d)->arch.amd.root_table =3D NULL;
> +    ASSERT(!dom_iommu(d)->arch.amd.root_table);
>  }
>=20
>  static int amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
> @@ -565,6 +574,7 @@ static const struct iommu_ops __initconstrel
> _iommu_ops =3D {
>      .remove_device =3D amd_iommu_remove_device,
>      .assign_device  =3D amd_iommu_assign_device,
>      .teardown =3D amd_iommu_domain_destroy,
> +    .clear_root_pgtable =3D iommu_clear_root_pgtable,
>      .map_page =3D amd_iommu_map_page,
>      .unmap_page =3D amd_iommu_unmap_page,
>      .iotlb_flush =3D amd_iommu_flush_iotlb_pages,
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index d136fe36883b..e1871f6c2bc1 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1726,6 +1726,15 @@ out:
>      return ret;
>  }
>=20
> +static void iommu_clear_root_pgtable(struct domain *d)
> +{
> +    struct domain_iommu *hd =3D dom_iommu(d);
> +
> +    spin_lock(&hd->arch.mapping_lock);
> +    hd->arch.vtd.pgd_maddr =3D 0;
> +    spin_unlock(&hd->arch.mapping_lock);
> +}
> +
>  static void iommu_domain_teardown(struct domain *d)
>  {
>      struct domain_iommu *hd =3D dom_iommu(d);
> @@ -1740,7 +1749,7 @@ static void iommu_domain_teardown(struct
> domain *d)
>          xfree(mrmrr);
>      }
>=20
> -    hd->arch.vtd.pgd_maddr =3D 0;
> +    ASSERT(!hd->arch.vtd.pgd_maddr);
>  }
>=20
>  static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn=
,
> @@ -2719,6 +2728,7 @@ static struct iommu_ops __initdata vtd_ops =3D {
>      .remove_device =3D intel_iommu_remove_device,
>      .assign_device  =3D intel_iommu_assign_device,
>      .teardown =3D iommu_domain_teardown,
> +    .clear_root_pgtable =3D iommu_clear_root_pgtable,
>      .map_page =3D intel_iommu_map_page,
>      .unmap_page =3D intel_iommu_unmap_page,
>      .lookup_page =3D intel_iommu_lookup_page,
> diff --git a/xen/drivers/passthrough/x86/iommu.c
> b/xen/drivers/passthrough/x86/iommu.c
> index 82d770107a47..d3cdec6ee83f 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -280,6 +280,12 @@ int iommu_free_pgtables(struct domain *d)
>      /* After this barrier no new page allocations can occur. */
>      spin_barrier(&hd->arch.pgtables.lock);
>=20
> +    /*
> +     * Pages will be moved to the free list in a bit. So we want to
> +     * clear the root page-table to avoid any potential use after-free.
> +     */
> +    hd->platform_ops->clear_root_pgtable(d);
> +
>      while ( (pg =3D page_list_remove_head(&hd->arch.pgtables.list)) )
>      {
>          free_domheap_page(pg);
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 863a68fe1622..d59ed7cbad43 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -272,6 +272,7 @@ struct iommu_ops {
>=20
>      int (*adjust_irq_affinities)(void);
>      void (*sync_cache)(const void *addr, unsigned int size);
> +    void (*clear_root_pgtable)(struct domain *d);
>  #endif /* CONFIG_X86 */
>=20
>      int __must_check (*suspend)(void);
> --
> 2.17.1


