Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF982D9FF1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 20:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52629.91918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kotDm-0008Uh-D9; Mon, 14 Dec 2020 19:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52629.91918; Mon, 14 Dec 2020 19:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kotDm-0008UH-8h; Mon, 14 Dec 2020 19:09:22 +0000
Received: by outflank-mailman (input) for mailman id 52629;
 Mon, 14 Dec 2020 19:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PveR=FS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kotDk-0008UC-EY
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 19:09:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5f9ab2e-5f81-495c-ad74-1d5281a5bc69;
 Mon, 14 Dec 2020 19:09:17 +0000 (UTC)
Received: from AM6P192CA0002.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::15)
 by DB6PR0801MB1911.eurprd08.prod.outlook.com (2603:10a6:4:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.21; Mon, 14 Dec
 2020 19:09:14 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::a5) by AM6P192CA0002.outlook.office365.com
 (2603:10a6:209:83::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Mon, 14 Dec 2020 19:09:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 19:09:13 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Mon, 14 Dec 2020 19:09:13 +0000
Received: from 64f83b45dbc7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D23F0E5-2F07-4FF7-848C-703C6BD5EC3F.1; 
 Mon, 14 Dec 2020 19:08:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64f83b45dbc7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Dec 2020 19:08:58 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3611.eurprd08.prod.outlook.com (2603:10a6:10:4d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Mon, 14 Dec
 2020 19:08:55 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125%5]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 19:08:55 +0000
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
X-Inumbo-ID: a5f9ab2e-5f81-495c-ad74-1d5281a5bc69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSGFIJzYlh9dzy54T2HBNgmjSVHU+KuivH0e2qBhJxQ=;
 b=9FZj5GpyEoV4zpkgwwrAJOPfR5KXRoCoFxk7f3xnEcFI0eAMswXHGyAujnUp6dt2gVzw5GtErPnRdq2d8x1pzIYR6tiCh8/PRl+7HWF8r1MqIfgExTP76/haiKZdzIYOWigJ04gk8qLspFwiGmj9Q2Q7/j101At3C5VqB23v2sA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 50d3ff5db2d9c6d4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GozBHyOnQMYnJt74974pwseYItNf4GTTbHH0o8LkHJKA/cIbPHiL8Ex+glvmSqpp+yA70znOBiOgudu3Z6gWAxsUJWqNzos0KbvMMcsHhLTZaDU9/dG300jvw3selVn0m0amJM7slMl4xcyHGQz8lvtuREciMRZGMxwNPE8gBxw+TtJ/BqtJ+FnqJvcSt4hLSguqUISoAXRHl4Us7o2qxgZjFlk57B6TkyIkJ8R+Zrza9KGPl/m+n8tHootNZYTHUzK1KB1TFz+Kt2l4w/My821dB6iqDlqJbnbKQW4T7EwyuFt8WjiqAQWigQkcs7IRVbTocKUs2xb+jwYmrtzREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSGFIJzYlh9dzy54T2HBNgmjSVHU+KuivH0e2qBhJxQ=;
 b=HeCWn+KIK2r1O9vpAVkVKs/OUXYJ1Az4yKUX/7XsF5VZmjeMmSxxxKQbL+RR7FxlT4zHU+i1apd0c3QGQRCnvYxFgGz7Uenn5g9V84MnyTt1FLB4XOX8Zc6gldFvV/v//IpCpa7BdpRcEgE7q2wY/roGoQjYrNEpjo8WCloy3nb/pY5/+Dc/GBEhDaj0j7VfR9rNHEd4J3bK0cr1arkL2IaFGRTDXMh5By9lXZ4Xh1+vQC9GNvu9j2sj3tI+idQeyoa6MTVK0lwk8FW2n9blnKDidE4A+JVdfqqGD6usPSVUABZaqWMkA55XuS26DP/n/wwJ84QZuuzuzkaucu6lCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSGFIJzYlh9dzy54T2HBNgmjSVHU+KuivH0e2qBhJxQ=;
 b=9FZj5GpyEoV4zpkgwwrAJOPfR5KXRoCoFxk7f3xnEcFI0eAMswXHGyAujnUp6dt2gVzw5GtErPnRdq2d8x1pzIYR6tiCh8/PRl+7HWF8r1MqIfgExTP76/haiKZdzIYOWigJ04gk8qLspFwiGmj9Q2Q7/j101At3C5VqB23v2sA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
Thread-Topic: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
Thread-Index: AQHWzxYvTK5u+0PVw0yI12PrfGSPTKnx9LwAgAUFtoA=
Date: Mon, 14 Dec 2020 19:08:55 +0000
Message-ID: <1660236F-7BB0-4F3E-8CDD-10AE9282E2A3@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
 <e26c96cb-245b-6927-c4a7-224c2114df42@xen.org>
In-Reply-To: <e26c96cb-245b-6927-c4a7-224c2114df42@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c10d454-3622-467d-7ca1-08d8a063bf07
x-ms-traffictypediagnostic: DB7PR08MB3611:|DB6PR0801MB1911:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB19116558D21E0C843EE5511CFCC70@DB6PR0801MB1911.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1417;OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Et0Vyj5gKWmf4a87tZURc6bpp2vht4WAJx1XCXz5gloBVqrASERCwFySOPRHBKUlMHL/VUaQpMwA+0BR1AoLbDCiN6g0LnbCgkeON39b9bDo6iwMxdJDLdcecso6gXy6U1DiEzmlFqNadqUC6/d3X4nSi+TKMCK40ZXE/dwoON+kC8+b0o0dyvH9L25tz2yIuMS+ndqnvS7XBhdnJtao5svbIBSidC0EbHBzmlzYG77YTSzeC5iA9Muc6UrFqxpktVgx203wgNIkOBuM2bIyo082AJJxjfiGMzSwbV4ipxdBnapmH03Wzv4udNNXW79dQNB3CME3JRhsYsiXobql1UlhdSxTXP95J4EPURCiRxeG2XynDU9qP1cPs8Tg2V2V
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(6506007)(478600001)(26005)(76116006)(8936002)(83380400001)(33656002)(91956017)(66556008)(36756003)(71200400001)(2906002)(4326008)(66946007)(64756008)(66446008)(6512007)(316002)(8676002)(54906003)(186003)(66476007)(5660300002)(6486002)(86362001)(6916009)(2616005)(53546011)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?i2PQqvb/AJogUH3hB8EcveekGPxIzgIVKcB97iTnggp90wKWA9VxKH2sq5oI?=
 =?us-ascii?Q?YILsrlDx48ui/C4VcT1DhR0WmNqz65+8OXYQqx/gu0FpzfyueIayaFHx0c2l?=
 =?us-ascii?Q?izqTiEahhywGTBtyfdU41sCxTahSRStQpJPfSWqfhkUOzyaUbIE40+aWfL0U?=
 =?us-ascii?Q?kVKt9+vA1imJmHQoSHiwavu1jJvZE68U3z22FPL65bC5ke9iMxl6a5FWBCem?=
 =?us-ascii?Q?i9klCPu2QVGwlQ9srwzfurLeXBHMt0msRXoVF264LU6gdFuM0BVl/h0RU5Iu?=
 =?us-ascii?Q?C0Kwklizt2K4oKZTQreRUg3V4K1NZ+yK94er0VrdLixZSD0vPaBjfwwDoT1V?=
 =?us-ascii?Q?VVd6Hcg7suJDOcPJYh6WqalhVEUuZoz3rtuvbihyApbTrytk/fRRJzXWRJ/5?=
 =?us-ascii?Q?zF5K+XdI3hgbAhupBjKd7mJsnCw2Hx8qDocMDmaYy7MqcevCVOE7GQATemAS?=
 =?us-ascii?Q?AcqE80rTlMcP6+9t4VMF765ho0QsCxFuKHp2zoEKM3//ZlZDsOQPO4+GrzUf?=
 =?us-ascii?Q?MhvUJWjsezxuGpbPS5u94jnesIIskHjOUDhQQ6tp0nG4yq3DGQhEKK/74b+0?=
 =?us-ascii?Q?T9Ed3kEgka0laU2W1z8eukvoVPUuwXbMs1kNNo2hOg8Q6t0/04efnnLVWWUm?=
 =?us-ascii?Q?+awIHx9dWUNLWRK0Dh0hEYRBNy2nJK2H+QZxrmjQvtMlB2hX3I7thn2IXq7V?=
 =?us-ascii?Q?WDbZEXMfB1n6RpVPleTJ9Ye5RPNQX6uNxsmWPqt/dPJmQUtIU4u2EiSQ1dxv?=
 =?us-ascii?Q?OtjIHveIP/IIGtfpwgNz9e95LhcYL3Zcxwkh823m/rCiPQAJ6NbBY16ktGLw?=
 =?us-ascii?Q?mWsBy71eH9v0/Odx/kXOW5MCyuz5220zxRfeNeHDtmZWKO6hUbgoER6ThZgE?=
 =?us-ascii?Q?NSi/HcgDKnfntztB61cc5nYVTxi0gYWuGKuW9ZvXVah6MlKJJs0oTuISRGEB?=
 =?us-ascii?Q?LSVWWWUSTUdTUyNufDRSEhhzXRewg/WwHD1NpW2uvwqUi5npzaIAeHvmwyb0?=
 =?us-ascii?Q?ZFz+?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F2FD3B9CA8B76B458CCB44B11CE14D4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3611
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba525c9d-106c-4e13-4808-08d8a063b3e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dtuh7BaycAifF/Gzd4RXhOePUM4WbkqHqUoG4+iGMeiYPOUzbwIfeTbyBDFDCNX/uvYJLEV9eoil13aKJ2mPjh39UP8n59aOa1x4GCx6uMK0AQQYynB6x0p4Pd6+SxLO0T+mG5ILyn0rgLSkT1pELeJ0VZ3ElMdYqIpW/Fyilkm6BLOO8YHjqwa7rY+izm+0a43/8gXCr1/9HUH5OWBVKNqwtR2KIqKSFu5WYpINOmm2uF+pjNlXEXGKzWWzPPT6gxPBYYXNmr9xpjqoye1X801vJRyjMwhV6J9D5F7ZcqjnH0I/0qStXK6PaYOYvP3VRDeB11ycsKxsymlyyumMQisRBvPtcsaKJoIEzGbu9INGr/1bDU/Vr7SU9ph4hPBS+racryilj/a5m7NE28Kb1w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39850400004)(136003)(46966005)(2906002)(54906003)(356005)(53546011)(70586007)(82310400003)(186003)(2616005)(81166007)(83380400001)(6506007)(107886003)(478600001)(6512007)(70206006)(86362001)(6862004)(8936002)(336012)(6486002)(4326008)(82740400003)(47076004)(33656002)(316002)(36756003)(5660300002)(8676002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 19:09:13.8681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c10d454-3622-467d-7ca1-08d8a063bf07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1911

Hello Julien,

> On 11 Dec 2020, at 2:25 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 10/12/2020 16:57, Rahul Singh wrote:
>>  struct arm_smmu_strtab_cfg {
>> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>>  		u64			padding;
>>  	};
>>  -	/* IOMMU core code handle */
>> -	struct iommu_device		iommu;
>> +	/* Need to keep a list of SMMU devices */
>> +	struct list_head		devices;
>> +
>> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
>> +	struct tasklet		evtq_irq_tasklet;
>> +	struct tasklet		priq_irq_tasklet;
>> +	struct tasklet		combined_irq_tasklet;
>>  };
>>    /* SMMU private data for each master */
>> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>>    struct arm_smmu_domain {
>>  	struct arm_smmu_device		*smmu;
>> -	struct mutex			init_mutex; /* Protects smmu pointer */
>=20
> Hmmm... Your commit message says the mutex would be replaced by a spinloc=
k. However, you are dropping the lock. What I did miss?

Linux code using the mutex in the function arm_smmu_attach_dev() but in XEN=
 this function is called from arm_smmu_assign_dev() which already has the s=
pin_lock when arm_smmu_attach_dev() function I called so I drop the mutex t=
o avoid nested spinlock.=20
Timing analysis of using spin lock in place of mutex as compared to linux  =
when attaching a  device to SMMU is still valid.

>=20
> [...]
>=20
>> @@ -1578,6 +1841,17 @@ static int arm_smmu_domain_finalise_s2(struct arm=
_smmu_domain *smmu_domain,
>>  	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>>  	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
>>  	typeof(&arm_lpae_s2_cfg.vtcr) vtcr =3D &arm_lpae_s2_cfg.vtcr;
>> +	uint64_t reg =3D READ_SYSREG64(VTCR_EL2);
>=20
> Please don't use VTCR_EL2 here. You should be able to infer the parameter=
 from the p2m_ipa_bits.

Ok.

>=20
> Also, I still don't see code that will restrict the IPA bits because on t=
he support for the SMMU.

Ok I will add the code to restrict the IPA bits in next version.
>=20
>> +
>> +	vtcr->tsz	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2T0SZ, reg);
>> +	vtcr->sl	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2SL0, reg);
>> +	vtcr->irgn	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2IR0, reg);
>> +	vtcr->orgn	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2OR0, reg);
>> +	vtcr->sh	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2SH0, reg);
>> +	vtcr->tg	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2TG, reg);
>> +	vtcr->ps	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2PS, reg);
>> +
>> +	arm_lpae_s2_cfg.vttbr  =3D page_to_maddr(cfg->domain->arch.p2m.root);
>>    	vmid =3D arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>>  	if (vmid < 0)
>> @@ -1592,6 +1866,11 @@ static int arm_smmu_domain_finalise_s2(struct arm=
_smmu_domain *smmu_domain,
>>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, vtcr->sh) |
>>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
>>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
>> +
>> +	printk(XENLOG_DEBUG
>> +		   "SMMUv3: d%u: vmid 0x%x vtcr 0x%"PRIpaddr" p2maddr 0x%"PRIpaddr"\n=
",
>> +		   cfg->domain->domain_id, cfg->vmid, cfg->vtcr, cfg->vttbr);
>> +
>>  	return 0;
>>  }
>=20
> [...]
>=20
>> @@ -1923,8 +2239,8 @@ static int arm_smmu_init_one_queue(struct arm_smmu=
_device *smmu,
>>  		return -ENOMEM;
>>  	}
>>  -	if (!WARN_ON(q->base_dma & (qsz - 1))) { > -		dev_info(smmu->dev, "al=
located %u entries for %s\n",
>> +	if (unlikely(q->base_dma & (qsz - 1))) {
>> +		dev_warn(smmu->dev, "allocated %u entries for %s\n",
> dev_warn() is not the same as WARN_ON(). But really, the first step is fo=
r you to try to change behavior of WARN_ON() in Xen.

Ok. I will make sure we have the same behaviour as linux by modifying the c=
ode as below.

WARN_ON(q->base_dma & (qsz - 1));
if (!unlikely(q->base_dma & (qsz - 1))) {
	dev_info(smmu->dev, "allocated %u entries for %s\n",
		1 << q->llq.max_n_shift, name);
}

Regards,
Rahul

>=20
> If this doesn't go through then we can discuss about approach to mitigate=
 it.
>=20
> Cheers,
>=20
> --=20
> Julien Grall


