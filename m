Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D2C4DC0E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 13:36:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159037.1487409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vInbj-0007hm-2m; Tue, 11 Nov 2025 12:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159037.1487409; Tue, 11 Nov 2025 12:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vInbi-0007f2-Vn; Tue, 11 Nov 2025 12:36:22 +0000
Received: by outflank-mailman (input) for mailman id 1159037;
 Tue, 11 Nov 2025 12:36:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1Vt=5T=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vInbi-0007ew-D4
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 12:36:22 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06390190-befb-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 13:36:21 +0100 (CET)
Received: from BN9PR03CA0144.namprd03.prod.outlook.com (2603:10b6:408:fe::29)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 12:36:16 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::18) by BN9PR03CA0144.outlook.office365.com
 (2603:10b6:408:fe::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 12:36:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 12:36:16 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 04:36:13 -0800
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
X-Inumbo-ID: 06390190-befb-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svA9MudBrAETWZFIoYZy7r8X32fSETE/CkxaKkZILBqHiawJW8KNrFFx3y8TWkdtGbHHenmhONt3NiRcaDitsDxV/SVZJs1HaY2CRLxJofdT04JyO/ytnze7alwBtCrE0gcPBtWgvggF0fMwel6nQy7XfvwIZOqz5lW+35bhHslvMtwq7QF1LfmPVw3ydAui67C7k6qI4ubbfHK21rkZIV9AArrcmAyxMzCccQpWsqU2YwlyC67GaL6Vd4f5jk5RQPGpDnS0RACYF/giQdO2aKGcTD8qtRVIe3YTN98a6qZKIQ5TN+S2cRfsOtNGyJ4KJE0BOStFW2hRaw+YJmaFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/th7md/mSVFlOCeAT4rakNbxkj07LGvOhqct4OOUx9s=;
 b=cCTjl8HcokEkeaVLVesp7nJ071XbrJRxJGXHlH7zWQE39cWDn99XPnglMd6itHaVsM7wCvPAFHWlaQqkooymqqTbqyWviucgiofEy0hw1C/e7ln7WKKHnFmTdpbNuaImnaSIL5TIZtRtEukvbiYha+JeY7vYRhNzpNC+bYUp5bETYPbuGBYGmU5oD1vljj/DYnSu/8rjHGsSCGsOXJJTdpojnO5YN4tJGc/TNe6MjDf68JAEIzDM4fQEI2pUZsI7+cEpm+CDxntbA6SnNGOuY/2Z0DUwoRkbJfR//2IFaaQdM99zOabXD+2LYanDsOEY4+aoSUh4Lu/nkHSQ9d7tmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/th7md/mSVFlOCeAT4rakNbxkj07LGvOhqct4OOUx9s=;
 b=T51hp98Uvh5oINB5C0CJg83ErVVbOPkc6oDfn0IB0Ljqk0/iaJaPq/cJBP+VNqPfdlZAAUvIkRIX4KTv3V19X3GJMYHo6aGLttRWqT43+Sc6M3BlQO1m+zdmz8Uv1g9Z3O8W07rsgLpsahPN6zm5sLjHAEJ8eyJeQ44R9o8LZvg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 11 Nov 2025 13:36:07 +0100
Message-ID: <DE5VC2FANSAP.1K7VQ62XM33JQ@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "Alejandro.GarciaVallejo@amd.com"
	<Alejandro.GarciaVallejo@amd.com>, Jason Andryuk <Jason.Andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
X-Mailer: aerc 0.20.1
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech> <ee234574-384f-438a-8bf2-e250b61bc75b@epam.com> <1d1170cb-debc-4063-b98c-263c7b9e62d8@suse.com>
In-Reply-To: <1d1170cb-debc-4063-b98c-263c7b9e62d8@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca7e65d-8e2d-48c3-bf57-08de211ee87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajVnck1oQVd0c0hjOXpCMkJPUTBUSDBLOS8yNm1xd0RieEFVb2dkSytpUXZo?=
 =?utf-8?B?T1Bpa3JUSTBoY0FIaHI0cFJrbzYyeTdiQlA5MUhBQ0lyQko3aVB0akZLOVhv?=
 =?utf-8?B?eEk2V2lZRDFtTHpGSnE1OGlVL0pqZ0NWMzJIMXhmRDBIdmdPMXlLT29HNU10?=
 =?utf-8?B?SllsUWFKU2V2S2RyWE5FOXViTzA4d2RGbmRCZENBckdzUFBhZXV3WmwyOEYw?=
 =?utf-8?B?SEQ0YTNpS01qTTFtL01WZFZ2RmgvQ1llQk9UOXRiSk04eWxMZURKRlR3eVB6?=
 =?utf-8?B?eFRob2IxT0UwalovTEYxUjE5eFdINmF0MHBhMVhsWmNVTEtMQjdJNTNaS051?=
 =?utf-8?B?eCtXazdZa255b3A1TjZCckV0dnpUellrWTg0dzFPT2RZYkxtalZCTzhCRk5Y?=
 =?utf-8?B?ZitvcHRyWmdUN2ZGYzFUV205VGx5SVFCZXdWQlRpRmpqczhrSjEvNm9QY1k1?=
 =?utf-8?B?SGhKYm9NR2VKM0xMODNabnJ5b012MTFkdEQ4RytaZGljTExlbVJ1RlpMNmhV?=
 =?utf-8?B?dVQ5NEtsZDcxZ0ZsQ1A5Ui9scTB3djBxcjNQclEwU1dmSlFSczNFaHd3RnR0?=
 =?utf-8?B?R29RTi9MOStLOTlRYTRXU0ZpVFRvRC9BaDRGZ0ZuZWYwY1N4T1lnWUlsUUU1?=
 =?utf-8?B?QjF4SytxM2dZeUJ4dFViV09MMzg4NExHR2FUWnhiY3JueEMvY3d4bEtaZFN6?=
 =?utf-8?B?YnJucVBSREdHQWw1R1FHdDEwVWhvd0RsdUtESE9ZQ3h1MTJDT1JnQkwxSEZU?=
 =?utf-8?B?WFBGRlB6RFM4Z2pGZDJPYTYycU5xMWw0Wmo5MmVMWlZDS3NoVyt0SEFYZlEz?=
 =?utf-8?B?SHpZRG5CU0pLRlNrMC9aOE1NZ3FJMlE5TXBTQURrTWdNZzhDcklaRDNsNUE1?=
 =?utf-8?B?WVFsdFdwZzJXSmtOVTZLeFlmYzhpRzhnSkV1ZnJOWTVESFEyd3U4ZXVZWTMw?=
 =?utf-8?B?dXhBVThtakRUK2VZUE11WmsrTEJWR3ptU0J6RmYvbHZreEhSb0lNYjFuZ3ll?=
 =?utf-8?B?R3dVNWJwMmFEWWhCOHhSMFRlS2oxYkNLa0JJVFo4MXhnbC83WS9YRUQ1ME85?=
 =?utf-8?B?c1NMRVpWVllXVHU0UFpoRHRyUExMMnBxeWxHa3M5RytoaG9NV251QTc2Zyt6?=
 =?utf-8?B?cG96SDB6MzdjcXJzQ0taUmFYYTFoaWJ0aVZFUTRRVXlZekxDajlvSzJtTXhP?=
 =?utf-8?B?Ni90a05qM1lVVDgrMHFEOTNycHIwT0tzSWU5TWZpd2FCVHc4c0txeG53YjUw?=
 =?utf-8?B?TE5uRnhUV0czc0tzTHJPbGdSN1NaVDFFWVNnMyt3bzlySExmdW0yazVmQkdX?=
 =?utf-8?B?NVdJNWRQVTdBSWx4bFpRSlJtWUdjOG5VSHdCa3N2TyswbER0aFVJNHpCT2Fw?=
 =?utf-8?B?SXAwQmIyMUF0Sk9iVWZSWjVBY0xiNmlRZVZnMWNKc25BbFNtSjJ1K2RuMmY5?=
 =?utf-8?B?OFh2MFN0YUJycTJrbUFjUTFDRHV2QVNxQlptTERUbE94RzV4cDV2R3pvUTkr?=
 =?utf-8?B?dGVKK0ZBTzdxMWZHeDE2QUNxTHNqLzFCS0lzTHBIMHVRRWdQTExwNlF3WDho?=
 =?utf-8?B?N1JTTXBOcmVhYjFRT0ttTmc0NzZIU09VOGgwYWozNmx0aDhlVEV6ZklMelhH?=
 =?utf-8?B?Nkw0cEJnU09WK3A1WjJDa0hMZ09uSHJXUkVURlFpc0l0U0F6ZDhCRUd0TXAr?=
 =?utf-8?B?MU1zOGNOT3RjVExEeEFabjYxTUZMZDZoK1FQR1BiL2s0Q2JRSzdvUFVEMWRm?=
 =?utf-8?B?QmN1Uy9EWi9US3gvOHdIN2M5UlI1ZTR0Ui9aWENkUThyZlJyRzZUa2tkS09K?=
 =?utf-8?B?ZVhEcnZKd3JZUXNuUUtESVNPMU1MOWZKakNRUUNTb3JBUTEyTWJ3K3UrTDZq?=
 =?utf-8?B?MklRWVZIcU9aZ3ozTUVYNmx5QVF1amhtUTZ2REpiM2VZU2tzeEw1UFk2RjAv?=
 =?utf-8?B?bDdkTE5iOHlYUG5YMEtMNW1HUlA2c1N6WWY3L25tTThvdC8weVVZcUtaYnVh?=
 =?utf-8?B?UHRsdWg1Z0tiK0E5U2IrTG5Xd1U1Y1k3MEkrQnJySHpaWmdSbk5XdnVUU2JX?=
 =?utf-8?B?dVlNck9jdU95MHdkTnJ3dndjZmgwTUhOZzhLS3hBb3NvSUJxTTdtcUtjVlZ1?=
 =?utf-8?Q?H5Jo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 12:36:16.6058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca7e65d-8e2d-48c3-bf57-08de211ee87d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203

On Thu Oct 30, 2025 at 8:46 AM CET, Jan Beulich wrote:
> On 30.10.2025 00:08, Grygorii Strashko wrote:
>> On 29.10.25 20:26, Teddy Astie wrote:
>>> --- a/xen/arch/x86/include/asm/domain.h
>>> +++ b/xen/arch/x86/include/asm/domain.h
>>> @@ -509,6 +509,8 @@ struct arch_domain
>>>   #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_US=
E_PIRQ))
>>>   #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VP=
CI))
>>>  =20
>>> +#define has_force_x2apic(d) ((d)->arch.hvm.force_x2apic)
>>=20
>> Would it be possible for you to consider having Kconfig option to make
>> such configuration global, static?
>
> Especially considering the post-commit-message remarks I don't think this=
 can be
> other than a per-guest setting.
>
> Jan

It'd certainly be of use to us to compile out the entirety of xAPIC emulati=
on
in favour of x2APIC.

Granted, it imposes restrictions on what guests are able to run and how, bu=
t
that might be acceptable in the interest of a leaner hypervisor.

It is fairly annoying there's no architectural means to signal it.

Cheers,
Alejandro

