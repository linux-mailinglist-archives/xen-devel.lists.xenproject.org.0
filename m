Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2713FAFE47F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 11:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037996.1410534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZRMC-0000j3-LW; Wed, 09 Jul 2025 09:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037996.1410534; Wed, 09 Jul 2025 09:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZRMC-0000hW-IK; Wed, 09 Jul 2025 09:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1037996;
 Wed, 09 Jul 2025 09:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eg2B=ZW=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZRMB-0000hQ-4f
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 09:44:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2417::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5815fd12-5ca9-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 11:44:45 +0200 (CEST)
Received: from BN9PR03CA0668.namprd03.prod.outlook.com (2603:10b6:408:10e::13)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 09:44:42 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::3f) by BN9PR03CA0668.outlook.office365.com
 (2603:10b6:408:10e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 09:44:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 09:44:41 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 04:44:39 -0500
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
X-Inumbo-ID: 5815fd12-5ca9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DryhbWmWnCqgBdUP2mCBX4yzIIEe0GeQGi0+bV8k4THoVq7svh7B/2jrqrFm4G7qdfsQtoteVK2PuoxU8ppSozQGpubt6DrsAwjYQB14KRsba6pkrS3SCOdEslrRK7jxsF39TdGsMw+QhnafVCZ9dscSOZzjO28fbVkNHny5TNPWOYQGr71oTXqGN3ojaXS/8rkanu4qCjDwgUhI0EaZ53uEGDfaejoB1woXJQe1u/re0Oxn+sL14IPxxaGBEXH30g27nbgazaDMJGcVXE1tLMmBi65y3A/N9QNot9XUcBjuO9O4XN1CJrtYRgqtxW8Hy6enZ+lfo4HooUILwSwt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLdhdSRqr4ds7QWEI04Rz6nogbT2BOCixOAhIDszOg8=;
 b=vKG0RMztl0cYXlv3LTcXV4MEsuMuuayAHEh1PRawp/93zaGld6Z4Jrmh54xOMvrUyfOIaXZ+hhXdMpOlYQ8i2xzYYQknVrYjMWpqq5ilK6gon7rfzk4vPK3cd/lBOT3+3LvBM6uEbYDZhygOGwQfCxvpR6dzKobI72z+z4gQpcOWdPLcjXuQKIsTVt0vwpclXRx4AHQHgISck/NE/N5kQrBnxFOiAowjIt1yQEJEPnpUSpYuPOVCPVmRyUJw1ExnTLxdJpepUpXhR4nLNxMQi2RfdXnez3AFAqa6uYrr1u6+uc7OSULQNr2R9oSqlqEElQp5Zee6+17oAnUjsypDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLdhdSRqr4ds7QWEI04Rz6nogbT2BOCixOAhIDszOg8=;
 b=5n0jZjcvcAx8OHzgIId9CVLx9YueAM180xQQ4/F7XjvOSTNRQwXRnBtCSJrZASUmIPJDuspe/n8honrAjOG3JzXG+tYx6dXYI7w0QeRZ1DYZGTdkhcAFvCEKWubrmNCVXpUiA9cyY0x55/oNiWsCKoTK+5YufqL/6smpODAxAFM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 9 Jul 2025 11:44:38 +0200
Message-ID: <DB7FEO3ZP9BD.NN32WOHZTU4O@amd.com>
Subject: Re: [PATCH v2 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop> <20250708183238.3104638-1-stefano.stabellini@amd.com>
In-Reply-To: <20250708183238.3104638-1-stefano.stabellini@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 22343639-1bb0-4853-9f45-08ddbecd3a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2RzS05XL0ljcXNoUE1DaE5HQmxta1lySUJZRExhRnBKbmN1U2UrNHRYYzd3?=
 =?utf-8?B?UG9sbGg2Vy85UjBEeVM1aE8zdmtaN2NINVpQaC9DYmpLdEo0QVBOTEdTTGUw?=
 =?utf-8?B?MEpvY0YzaUhyNjJzZVg0RER3SUpSYWNGbTREaGFzOEI0TFcxNWUrL1JDUTFP?=
 =?utf-8?B?NnY4K2xmVGxvM2g5M1dObFRkOU9nY1JZMklSeGtWalRiOWltMHZadWhaWHlj?=
 =?utf-8?B?MDJYdVJXakZaTTZZcGdGZk5WVFlBWHlTejJKMTBQcW55QUdkakorMWRQWVdj?=
 =?utf-8?B?WlNQUHprSGs4VUdwOTREaHlpeVM1NlE1bmRXRXMxcmlQWTc3VlFrRFZZblJl?=
 =?utf-8?B?ZFJrUnpnaHlTM2FxNE5Qbzc1bENXVERKTmtwNzlEOFh1d0RLNVRIK3VCZFY0?=
 =?utf-8?B?NUpmRFV1ZjhpQXdUSnQ1TUE5M2t4M0NJOFgrNGppWnhzOGhMNkxqMFFIZXlw?=
 =?utf-8?B?VE5ZMmc4SXhpcFpoY09aWno2c3hZZldtSUNYUndUQUZiVHlhYWsyMnNzTVcz?=
 =?utf-8?B?SGxVSGgxcUNmWTcyOGhRclQrWUY4Z2lpQklEajlrVVp1M0JKaFRnL2liNnVK?=
 =?utf-8?B?RCtrMFhwemhGaFVWc2wraGNBTCsxUGxZeDh1Z3EzcDdCcWJmT1NnZnBRWlg1?=
 =?utf-8?B?eHFkVEYxeU9TUXU2Q0N4OWFoTFppTGxwcWpIYzF2VkxZREtISWdQU3Rkb1o2?=
 =?utf-8?B?YmZ3Tk9QWjVsVHRuU3IrZjNKSjl6S2dIajJTbFRBbDZMSWxva0w2aXFPSHVY?=
 =?utf-8?B?S3JYajUwT3lvYWdXYnRwWkZtTndCZ0RhaE9pOTZoM2hjRFhPNHJxR09iNmVs?=
 =?utf-8?B?TXhaTk5vVFBzMm9iK1pnVU8ya282UVBVb29FWDZXSWRzc3h3ZTRzemtwb1RD?=
 =?utf-8?B?MzdVbGRmTUNMQXdXeEtuRmtNUW5pZ01iKzBRd1lBbUdLc0lYU3ZRb2RTR3pJ?=
 =?utf-8?B?dG9WL29NY2tYU21NWXJXU245NGs1VDR3YTFLOUV3OUZwa3hiSHBQaXQzaTBr?=
 =?utf-8?B?MVgyaVZWWDNqeUxMd2F5M0Zwc2Y3c21kSklnT0F0Ujk2UmlEZGtOSjF5WmQ0?=
 =?utf-8?B?TitpWjBqSUVqUVlPVjJDUGNrS1o1Wlp6UTJmbndZc0FVUzRqa0RIWHpkU1li?=
 =?utf-8?B?dkZzWGhMbkltWW5QekdTZjhRSUdpcndETFJLeUZiSTdBYmw2OHRGazI3YkI0?=
 =?utf-8?B?c3FLU2tvb1Z3eDJTRWlZRmRaSzRxaCs3bUxFUE9nZUFnTHpoWWg4Vk1jT01o?=
 =?utf-8?B?ajlQdmRqN0x0ZUgvQlZTam9GQlg3aEY5WE1ocktWOXRQMHRnd3lObDVIei9P?=
 =?utf-8?B?OG1MZkdaOEY2M2Vvd1F2R0VzRmpjQ2RoenZrWFVIM0w3eUk5MGRuVFcweFZq?=
 =?utf-8?B?a0RBVWcxalNQLy9WVElLUk1HMitLdkdmandWdXNacS8zcTRaaytVZEVmLzFs?=
 =?utf-8?B?aXM4TmJFY2RYUUVOR0h3Mi90VncwT0MyRUxQQzZyZTlvNk9QcEJFQmpJUmYy?=
 =?utf-8?B?UlZTVHlFWHZvblFHSEw4dVUzcGlxWDJtQWFINmh5VSszVmE1VnRHcGt3RDlV?=
 =?utf-8?B?dFBFTVRzeEJ2VS9DWGJ1ZzJ3b1J3Mks4Y3pCUW5IclgvRVJCZjZxS01CN3Nt?=
 =?utf-8?B?eEllS2ZpTUpmbkRwWXpOYlNVUW1FOWltNkJqemlWOXNNZkV3QTZDeEdXdS9H?=
 =?utf-8?B?SUp0dDFTYkR4eXdDVzAxN2NHeDJQMGw3ODMyUlVyTzRKUkFtWkhrS1BqSFo4?=
 =?utf-8?B?T0xRNnQ4eU80RW5vdEs4REdZQ0dlN3J5MFB0a1I2eDlMczJpK2M4L3c5Z2ZX?=
 =?utf-8?B?dmN2RWlKaGwzS3ZSZm9tMlFnNmVGOXFaQXhpdURyeVh0eWFOdUpUcGM0bmg4?=
 =?utf-8?B?TXh1V0NONjQwSlRPQThyekF6UHFDT0IwWnYxbjd2QWh1SEtobyswbHArMGtM?=
 =?utf-8?B?Nk1JbXFaOTNLWmZ2Y3RIalBWZHBaYTV6QzQ5VURkWUhvbnRjZjE4R29uOEpX?=
 =?utf-8?B?aWllOUl3UmZmc0t4cU5CcmNqb2NHRWNWSU9ISFhDa3R2bkxzVXFZTlA0Tm16?=
 =?utf-8?Q?3pkdYz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 09:44:41.5187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22343639-1bb0-4853-9f45-08ddbecd3a81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739

On Tue Jul 8, 2025 at 8:32 PM CEST, Stefano Stabellini wrote:
> On real time configuration with the null scheduler, we shouldn't
> interrupt the guest execution unless strictly necessary: the guest could
> be a real time guest (e.g. FreeRTOS) and interrupting its execution
> could lead to a missed deadline. The principal source of interruptions
> is IPIs.
>
> When TSC is the chosen clocksource, we know it is reliable and
> synchronized across cpus and clusters. Thus, we can return early
> time_calibration because the calibration is not needed, removing the
> related Xen timer and IPIs.
>
> Also remove the master_stime write as it is unnecessary.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - simplify the patch simply by returning early if clocksource_is_tsc()
> - also remove setting r.master_stime as it is not needed
> ---
>  xen/arch/x86/time.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index 59129f419d..d72e640f72 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2297,11 +2297,7 @@ static void cf_check time_calibration(void *unused=
)
>      };
> =20
>      if ( clocksource_is_tsc() )
> -    {
> -        local_irq_disable();
> -        r.master_stime =3D read_platform_stime(&r.master_tsc_stamp);
> -        local_irq_enable();
> -    }
> +        return;
> =20
>      cpumask_copy(&r.cpu_calibration_map, &cpu_online_map);
> =20

As far as I can tell, this shouldn't cause problems. But I'd prefer if some=
one
knowledgeable in the calibration code (Jan?) pitches in as to the effects o=
f
master_stime in the absence of calibration. Otherwise:

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

