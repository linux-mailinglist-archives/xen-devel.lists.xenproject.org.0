Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FAB07A6F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045412.1415526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4US-0007ci-Ur; Wed, 16 Jul 2025 15:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045412.1415526; Wed, 16 Jul 2025 15:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4US-0007Zw-Qs; Wed, 16 Jul 2025 15:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1045412;
 Wed, 16 Jul 2025 15:56:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPeD=Z5=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uc4UR-0007Zp-MP
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:56:15 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2418::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6351072d-625d-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 17:56:09 +0200 (CEST)
Received: from MW4PR04CA0144.namprd04.prod.outlook.com (2603:10b6:303:84::29)
 by SA1PR12MB8920.namprd12.prod.outlook.com (2603:10b6:806:38e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 16 Jul
 2025 15:56:04 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:303:84:cafe::19) by MW4PR04CA0144.outlook.office365.com
 (2603:10b6:303:84::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Wed,
 16 Jul 2025 15:56:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 15:56:03 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 10:55:59 -0500
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
X-Inumbo-ID: 6351072d-625d-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnIDPAxFCOe/P86z7LqA4NcQifK8H0XAQfgwSFdTqd5vtYQKp188GKDdc/HH9Gpo3DsLbhx0Bqz2sqLWY6WOumolQH3jN4qzF4u3yZOha99R4SHU0L40fojm5vtc1USSdXH/Lk1SsmSUiLlfIfcRNE2xDngLNDc0kg4PLaQ63LXwYKzAPjSuv6hf9S18SFWponwAsuAxquAEFSWFq7qpYCWyuLwqZQ0Xa+mA00RT5R7M/hjIUyhmbhvIWlLYHXybf7N7IF2pQ7+rnpKFA10ZIp2U6w99vqL7X/tNo7otoEYbklKSuwvAP0Gt8Tbq++lpTyOgfZwVZk7gApWGxqddtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgFxd01cvNi2d1ZlBAHMgMKcTuXIn5hT29PHVWAES1g=;
 b=huFVcZKBivYqOrVvW8F946hy1jz7Ot9ckLEvUOTIe2leKNPvHDa3YNfrU1ZlFRnUXMshnm8707Mo9SkaUMXj3Dg999sEx2A5lBcMZxLciW/uVet3AKmd5+LkbzVscDoyOXBE9Rvxs2ub0eGZSm3CdBDVdvvgtJf9+Eoo81roHIZGNUj2k+Uz2nVd7edjexTf14h5rj1Kqaz9UwwaGabk32BxcCzTIVn2HODZcKzeEU4Ct7DE67gIgTK/PTCFOBm1PYYecGxAxEK66cVliJr+UutP3zJKZUrMVJcSJJlJMkq6ZFog2bysLpe1OcT/KE3XUaFZtb5VMvw/Nq3flfbrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgFxd01cvNi2d1ZlBAHMgMKcTuXIn5hT29PHVWAES1g=;
 b=IJMqSi6i3V9mEJzz5klZbexxIYwJnu1SahY4eLSPL9+hgmR/FH3Ol9BaGayAYmp7LYSRbVXzRcAyPNc9K63ulHFGC9vxZN7uPL5DgkZCFmVWJiH8xGxx7JFUdbhQcCpPc5OgdOOnJenrx81RjxNB9qOHdJAG3/Y79LAJFUqImrY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Jul 2025 17:55:57 +0200
Message-ID: <DBDLOSBU234Z.3CGVBWFIW8E1R@amd.com>
Subject: Re: [PATCH v7 11/11] xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to
 include device-tree/
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
X-Mailer: aerc 0.20.1
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
 <20250715161108.141126-12-alejandro.garciavallejo@amd.com>
In-Reply-To: <20250715161108.141126-12-alejandro.garciavallejo@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|SA1PR12MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1bf2ed-b4b8-4659-2b1e-08ddc48144ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnIxYS8vc3Npc01EM2lRUjNReU13eU9NWGlUZEh1VElxaDB6dnZWRTVLdTh3?=
 =?utf-8?B?MGRrNWZlS0RxWEZzTWpzRzJRTjBDZFdWUm13U0o1NTgrdzRnd0F1ZHVaSDAr?=
 =?utf-8?B?UUZKU1FFR0ZlL01IejNrb3YvaWR2VVI2WWhpeWo3ajI0clE4T2tKSzNadjBB?=
 =?utf-8?B?WkUyQ0srUFgwalNxR25QZjUrM3FkcTI3bUJ6STVHTlVReFVuYjVpdFRBRXdj?=
 =?utf-8?B?dlF0djFMSVhnbGwyZFFyODd4azJWMVpYWk1YcmVrWGQ5OWQxSXJac0RySzVW?=
 =?utf-8?B?K0NFSWhYazREOFc0ZEZUZFdZd0VWQ2xWZEIvbDV2Mm5jTE9yQkptdU9iQm9Z?=
 =?utf-8?B?UkNmc3J5QlcxVTRlNmV4SDk3WXFWUmV2cldpeCttSjdXWGdaWnErQ3lJeTlS?=
 =?utf-8?B?N1J4SGx1eFJoZVpER2IyOWUxMmpONGJRdnZ1K0JpZUJNUUJmU0N2MXNCbENW?=
 =?utf-8?B?WEdLamY5VkQ4WUxJeGp3WlE2UlJQUHJ1aHZWaDJlQk9aeU42KzRsTExpb3M0?=
 =?utf-8?B?czBzc09ENmhsTDZ3VnBidkVaQU40c2tINnBsNkNNYWlzQk5aUE1FNG5ZVzZm?=
 =?utf-8?B?LzlLYVJFUEJSbTI2L3owM0c5cjNrSExCTTJzZFcwZUtid2lYNWhGbXh4LzR0?=
 =?utf-8?B?bjZ1RFhnMlA3S0JFUUNvWjIyM1A4elhrcHV1bXhiRzdJK2NQbzVKUTUrVTZ6?=
 =?utf-8?B?L2JLU09ONkVtOUlGeWtJbkJ2Y1BjWUgranpwWm9FNVBOZHhQM3g4TmpSNDBK?=
 =?utf-8?B?Q3hxNWU2TzB0bjhoakdqWVdEMU5kNUZWZ0puaWtmdjZ2cWprYis1ZW9LS25W?=
 =?utf-8?B?anJlSnBaSXRyU1JJTklacVR1SldpWG1abTBQSGZ6TWN3MHhBbUYvRlBMWVZv?=
 =?utf-8?B?RHRobXhodEF4K09mOFBDMFBNSXNSQUszVWpXQ3kzWUVOZW5qamlwQ2lzUS9H?=
 =?utf-8?B?MDdUdFFKdFlNTnpqc3JPNmx3L1hYQmpXODRCeDBVemhRbnAybEpIUG5WYjkw?=
 =?utf-8?B?VVJBb1RQN1lVWldEYUhyUVF4SGFrdFNHZTFWd1VQMGM4dDZid05TZ0hVR2Jy?=
 =?utf-8?B?VFNLUzVtYUdCWlRNUmRIUU9NUFppZ1AxcWh3cUFpeVhpaDZuMVo2Ymg0TVQ4?=
 =?utf-8?B?SG10NDNEcFZ2S3YxZjRkTUNBcUsxdk42NXFvenhJZDFNdEw1ck5NeFVMbm9l?=
 =?utf-8?B?c0hqSlFvM1NINW5KWVZpRVlBM0ZmTVd4K2FhNTRXK25ncFpxYk9IZERUMSt3?=
 =?utf-8?B?U3dNMzdGUWhnb1hzZTRrZ1gxS3lRWHg2dUNrR0FvNDRoUDlFdDFUOVdlcWwy?=
 =?utf-8?B?c3hCT1hWZzQrU0VlYStyNGs4MDJVWFhRTnJoT1ZlZVZreEFLcnNPNTV2WlJN?=
 =?utf-8?B?Uzlxc3VYV3Q0MGRibFlYTXJ5Q25hMnlBSm13dCsxL3NkZmhLdHdZd1hoOHNu?=
 =?utf-8?B?TGg3Z3p1MDcvMnA4SGtOZkdaMnViMTVSaHhXM3FpT1dSamdxbCsvSDZtdWt6?=
 =?utf-8?B?QmJ2eExPUUN3TG9scmdKUXRrZGM4WCtoVWZleXpBMFl2cUsyQTJyZ200S1Z2?=
 =?utf-8?B?ODVHd3N2STlzU25XM1JEelZONUV2SWxqdmJjMHFNeFFPRFJyQkI3VlkyM1Zv?=
 =?utf-8?B?S2RCUVFtSFZCT0ZZSGhYZDk5cGo2WjliaVV0UVdQbnROdUhqejBtbC95TExX?=
 =?utf-8?B?OS9ZVFE5V0NaOVpFdHpxcWRzbzZjNFExTmYyTjVGblZHYTEzZ21VZnVVMjBJ?=
 =?utf-8?B?M2UveUZTNS9INGVjQUxsbUs5ajB2cWZEYzdGUkV3NmU0QTZPeHcrU3dMQWFi?=
 =?utf-8?B?QkJOVC9UeVpuWXdSM2NGeE5KTU55emVOalcwSjlFdWV6OHpidUlsYVVvLzE2?=
 =?utf-8?B?cmIwRDljbzQ3cmEzUTF6OGdjVFJEZmRFVC92L0lnS3JURThpeWxlbEVQa0dP?=
 =?utf-8?B?TkpOUXBWUFVtNUxGNVAwamozUW5nUkNxdkNRTkw5eEE2b0p0Zm4reUx2OVNT?=
 =?utf-8?B?TnNMTkQ1S1BqbkMxSjh6UG9rVGpYaDY2SElKUmMrSU9renNFbkt5amdDR1ZQ?=
 =?utf-8?Q?g37Lv6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 15:56:03.9284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1bf2ed-b4b8-4659-2b1e-08ddc48144ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8920

On Tue Jul 15, 2025 at 6:11 PM CEST, Alejandro Vallejo wrote:
> This allows bootfdt.c and device-tree.c to be usable without
> CONFIG_HAS_DEVICE_TREE_DISCOVERY.
>
> Gate everything else on CONFIG_HAS_DEVICE_TREE_DISCOVERY.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/common/Makefile             | 2 +-
>  xen/common/device-tree/Makefile | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index d541fbcf49..265468d751 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -8,7 +8,7 @@ obj-y +=3D cpu.o
>  obj-$(CONFIG_DEBUG_TRACE) +=3D debugtrace.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) +=3D device.o
>  obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D device.o
> -obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) +=3D device-tree/
> +obj-$(CONFIG_DEVICE_TREE_PARSE) +=3D device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
>  obj-y +=3D domain.o
>  obj-y +=3D event_2l.o
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Mak=
efile
> index 8abc069c4b..1459e63c85 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,11 +1,13 @@
>  obj-y +=3D bootfdt.init.o

Bah. From here...

>  obj-y +=3D bootinfo-fdt.init.o
>  obj-y +=3D bootinfo.init.o

... to here should have been deletions.

> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) +=3D bootinfo-fdt.init.o
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) +=3D bootinfo.init.o
>  obj-y +=3D device-tree.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) +=3D domain-build.init.o
>  obj-$(CONFIG_DOM0LESS_BOOT) +=3D dom0less-build.init.o
>  obj-$(CONFIG_OVERLAY_DTB) +=3D dt-overlay.o
> -obj-y +=3D intc.o
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) +=3D intc.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) +=3D kernel.o
>  obj-$(CONFIG_STATIC_EVTCHN) +=3D static-evtchn.init.o
>  obj-$(CONFIG_STATIC_MEMORY) +=3D static-memory.init.o


