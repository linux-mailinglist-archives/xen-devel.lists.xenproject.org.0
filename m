Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB152ADD360
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 17:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018309.1395199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYg2-0004q9-AP; Tue, 17 Jun 2025 15:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018309.1395199; Tue, 17 Jun 2025 15:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYg2-0004o7-7k; Tue, 17 Jun 2025 15:56:46 +0000
Received: by outflank-mailman (input) for mailman id 1018309;
 Tue, 17 Jun 2025 15:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wDO=ZA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRYg0-0004mx-7J
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 15:56:44 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2009::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8a0b3c4-4b93-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 17:56:42 +0200 (CEST)
Received: from DS7PR05CA0096.namprd05.prod.outlook.com (2603:10b6:8:56::28) by
 MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 15:56:38 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:8:56:cafe::7) by DS7PR05CA0096.outlook.office365.com
 (2603:10b6:8:56::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 15:56:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 15:56:37 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 10:56:36 -0500
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
X-Inumbo-ID: a8a0b3c4-4b93-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RX9GKksfxiyHmHkHg56KJiwXTvixRMfjrpfY/QRgDL1m5Q9RnTA8J4+8Isv0tyKhRd9wtMlSkMGUAlOKB7pIksUVivQ8ubJLsxK1WveHHAHmTVNWlU5em7gR9haFYk4fmrPJ815Fzor9VP8MK+nXwG9oEoAqxO7O5mDV+hCw0b2Mj0bFa0aDh+hP88hufFYr1VrAztwcURYnAXk92a0flif+1m4I6tdHQqbMOvG7x+JroaieTrSn/S3ThKEwVhorr7JYWP9G84JOziRscWr03q+idepCX88gOvrhlNlh2km1m8nHNgAYwdbkLXllgZ6P9wXV08uo2ZO5b1rBPODLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gdMmFUb8Iy758QKJQLE75KpucuoGbFVvBD/T257d/A=;
 b=Uh5E21LPIcKhpqSr+qKwa9qQGzRI0j01/Fa6isPT1YWKjnynoZzRV6X5HykAn8w6UDYXh9duHTppiGVC7Wb7wc3yzUK4ScVDCBLx0W2GOI1Ga7UWykJS4b85D0cNl7TyhPCURqmEwCgFtjMpcGT2c0B8TdaHoxTfn7rWFiiRvRlIc1Bki+3Qr90qCCUUEYHoFKeSiiYv8zxi8JFcgscMHs3CcSrtBpVsIu25tKKRQ7c9cMWYICwioKZ+vwyaI1o6unqGZlG4IJMSrXD1eJAosPK3zPOwpXdeva64v1dRLcAWr5tXEA3jEnbWksWOmDipQ34WpgBRtRTltG+gFn1cjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gdMmFUb8Iy758QKJQLE75KpucuoGbFVvBD/T257d/A=;
 b=fxrW0eZDbGi/WV6fG1MAZT0S/U00sPSi7WAHUs0YbxCVw2SDun23mL46qMaWba09qjR7AyzBzkej+OsADkG3QSUxTMH0zB2BPjVlEjWBZ6nGPT5hIAbxWZtzlL1oGTm4Pu4PdUE5xper8KvoXa/csLvR6ZsjupSwazQt6JVyos8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Jun 2025 17:56:34 +0200
Message-ID: <DAOXJGGA5VQZ.2INQG1PCW8YU7@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "Daniel P . Smith " <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xen/dt: Remove loop in dt_read_number()
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250617110741.34648-1-agarciav@amd.com>
In-Reply-To: <20250617110741.34648-1-agarciav@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|MN2PR12MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 9213c7a1-dae6-4bc1-7614-08ddadb78b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnUxZno0dVpYL1FjZlZtQXdIanRib0ZKUkFMK2Nmd0FHeVQxaUI2VTBIcG1Q?=
 =?utf-8?B?dnpvUkJ2MHNGL3JrejNaTURKWmIxbmY4aHFOUjA3VjUzK3NDK0VZQ2hKcGYz?=
 =?utf-8?B?K0J3ZFU3UDB5c2o4eXV1S0RFdTBRVjcrWDE4RyswOThLMUpPSUh3bFRwdkNm?=
 =?utf-8?B?TnV0YmQwWXZhMDlQdTZXdVFra3BWUWs5ZjEwQm90SXYwMi9TZ0hDa1ZCL2dp?=
 =?utf-8?B?ZFpoRXhUQ3p0RGJXNGgwMUQvMEJkRkxVdnQ3bVhMSHhTd2JOTmlva09pd3Ni?=
 =?utf-8?B?emI3cFA1dzhNanVmeHE1YitzUVNvVHJDc1d0OGYxaTFsTFVkQjV2NXJ0K0Nj?=
 =?utf-8?B?VExKS04wa3h3T25rZjREKzRyL2VEdmt6TnlWR2dXWU15TnlmcS92L1RWdkF2?=
 =?utf-8?B?YmU4Y1RjZlJuSFlRYkZ2WmhlTGwrYlE0b1J6S05DQkp0bGdPMUZ3ZmdjK1RF?=
 =?utf-8?B?eFBMSFB0UElxaWFRVFk3ODJwWHZMWVY2YlYvczlqR0hlVndVOGNHWHA0aXFM?=
 =?utf-8?B?VUtRWjkrdDJ4d2VWNUU2RHY5dnhLSlhGTXI5dkFxci9jWGVmZFpyT3NheUtq?=
 =?utf-8?B?Qk05R3dsM2VFRFdiUkl1c0pRM1l4ZkpnOGRBN0dyYXdjOGRZMzlXbmwvSy9F?=
 =?utf-8?B?MTl1Sy9QODdLdnFjL0E2UUpnbHJRTjJST1FXb3lOU0pwYnNKMXdCbGZvcUcx?=
 =?utf-8?B?UmN2VXZoYm1ITVY2R01qYkN3bG80SEJKcXVoaUMzTUcxaGlIUGVpZzdQOTEz?=
 =?utf-8?B?TkVEV2VIYTQxQzdEK2FEdHYzdnIxZHBYZnNTaUQ3WWl5T0dvWkNjTytKaDJj?=
 =?utf-8?B?cTIxbVhVeUt6WHdnNDZseTU5ajVNNjVsc0xFQTBYUUM2Ui9xcVpiQ0l3THFH?=
 =?utf-8?B?U21vbWJnNkJnWGJ6VmxtdTlmV3JmdUlsa25nWXZxMkpFem91aUUzQlVOMUhl?=
 =?utf-8?B?YjlpZ3hvS2FCR29XL3NJQnZwc2tHTHZEUW9aNHVYOFJtaHpWZTFSTjhKVzVi?=
 =?utf-8?B?QlpreVRWUHVQN20xWTFUa29WSS9vQkxRRk16a2V2T2ttMzNobThwdmJHckgx?=
 =?utf-8?B?ZVlHSml5TkxkbU1kRWVHRWlWZ05EcXZJWGxoSk1TWkhMd3M3b1ZIOHhyK1ZC?=
 =?utf-8?B?K2UvVXBPS3VLdEZkNTI0T2cxK0d1TjBlcFE0ZjZKQkE1a25yazg4U2lDSTlp?=
 =?utf-8?B?MUNrRlhKbEZyakdYakhpQ0ZIUVNUZnZ5SCt4RUhFUlFCWjRxY3ZyTjJWeFNI?=
 =?utf-8?B?ellQbUtuNERoYnBDYzJWcXRBbnNVM3B2WG94c0RZdTI0Nkg4L3FHcVVISVph?=
 =?utf-8?B?NVIxeHJDSFRQSm9Ldk5FTU5QWXZBWmN4U1d6OTVNSUMvVXhiSWp1MjJ6NnYx?=
 =?utf-8?B?bWpGR2FmS2Q0UFMzQ0hBTGcza1JFendUOEJZTmwwSlJETGR6REZ3RWRtejdX?=
 =?utf-8?B?UHVGekc1ejN5Y0w1Tld3MEg3UkpnZkJlWFJJWFdYei9ZTHE4bE1TdmZNajRj?=
 =?utf-8?B?ejNCcUJiMlBBMzlrK0RKakJOWjRtQ3V1dHQ1TldZUmpJcmRQNHlCZWlualVn?=
 =?utf-8?B?RitFOVl4YnRvcDZwWjVKMVFGTWlLTG0yTHhiTTFNZmR4RmdRbXIzL1NZbFU5?=
 =?utf-8?B?RVc2Tnk0WHpFS25RckpoNXJWa1JCM2IxenY3TUlsc2pGSHdpOU9paXlINW5r?=
 =?utf-8?B?NjMvaHBiYVVqQ1YxOEc2TnU1Vk5pL0xlZDMwazZjZ1NCYkV5aE93dXZpOGE5?=
 =?utf-8?B?NGFNTnZqTVQvSC85TVdTdVFZNDZ6S2pkTDJlNExFWEtwQ1BqK1lTVUN6cmMy?=
 =?utf-8?B?dzBKSC9zdlFYbFdqQmFvOHRxRnk1Wk9IVmpUMEgxMEJHMXZFdW5iUGZ4MFZT?=
 =?utf-8?B?MTVsTjdkWEdDTGYyaWhiZmlpaGNtTi83MnJsWGNxYnowWWQrMmxyOFprR2tm?=
 =?utf-8?B?THlvTk9vSVc0MDNvanpzR0thV29EVnRESk5EcjJvT2haNERwNWo4V3N0OEpy?=
 =?utf-8?B?bEo4Y1hLWDV6L2t3UTBUSldKbEh6dW1jNG9nN1ZQU0lXVitOZEJwa1Q4c2ls?=
 =?utf-8?Q?r/jWdQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:56:37.8625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9213c7a1-dae6-4bc1-7614-08ddadb78b00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064

On Tue Jun 17, 2025 at 1:07 PM CEST, Alejandro Vallejo wrote:
> The DT spec declares only two number types for a property: u32 and u64,
> as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
> with a switch statement. Default to a size of 1 cell in the nonsensical
> size case, with a warning printed on the Xen console.
>
> Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> Based on this suggestion by Daniel:
>
>     https://lore.kernel.org/xen-devel/a66c11c4-cfac-4934-b1f5-e07c728db8d=
e@apertussolutions.com/
>
> I'd be happier panicking there, seeing how DTs are by their very nature
> trusted blobs. But I suspect defaulting to something will find less
> resistance in review. I don't care much either way.
> ---
>  xen/include/xen/device_tree.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index 75017e4266..2daef8659e 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -261,10 +261,19 @@ void intc_dt_preinit(void);
>  /* Helper to read a big number; size is in cells (not bytes) */
>  static inline u64 dt_read_number(const __be32 *cell, int size)
>  {
> -    u64 r =3D 0;
> +    u64 r =3D be32_to_cpu(*cell);
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        break;
> +    case 2:
> +        r =3D (r << 32) | be32_to_cpu(cell[1]);

Bah, missing break. And with a printk rather than a panic CI stayed green w=
hen
it shouldn't have been.

> +    default:
> +        // Nonsensical size. default to 1.
> +        printk(XENLOG_WARNING "dt_read_number(%d) bad size", size);

I'll add an ASSERT_UNREACHABLE() here for good measure.

> +    };
> =20
> -    while ( size-- )
> -        r =3D (r << 32) | be32_to_cpu(*(cell++));
>      return r;
>  }
> =20
>
> base-commit: 14c57887f36937c1deb9eeca852c3a7595d2d0b8

