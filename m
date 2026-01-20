Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2A7D3C634
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 11:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208682.1520820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9Mr-0002F7-O8; Tue, 20 Jan 2026 10:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208682.1520820; Tue, 20 Jan 2026 10:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9Mr-0002Cf-KQ; Tue, 20 Jan 2026 10:53:49 +0000
Received: by outflank-mailman (input) for mailman id 1208682;
 Tue, 20 Jan 2026 10:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi9Mq-0001rI-6s
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 10:53:48 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a8943ab-f5ee-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 11:53:46 +0100 (CET)
Received: from BYAPR07CA0042.namprd07.prod.outlook.com (2603:10b6:a03:60::19)
 by CH8PR12MB9766.namprd12.prod.outlook.com (2603:10b6:610:2b6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 10:53:41 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:60:cafe::ac) by BYAPR07CA0042.outlook.office365.com
 (2603:10b6:a03:60::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 10:53:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 10:53:40 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 04:53:38 -0600
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
X-Inumbo-ID: 4a8943ab-f5ee-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Il0sgbMWSnLGa7M7GA3KPFvrh9FISFUPo2JQ5wIzRz8OZN8lWEiZMbst9HmuG9x5/+IOH7q9PCQDsTIP0iXWK4ODFjtFOJyiZUemA8Xx0bHpiCUxlQcsQbHXuHOXb4GGFMjlwN9c2yNalFYTWKFkdy53HFijBeo6lGC+fl7PsSrEUQhGVB0ZKmhH4EC0x7kqUzX5sezUdfOEx7We1snqQAP3IkTEY3tHeFv53VcyjwdU6dVXyhyyFRoQU8T/s0tPodfJqECA7zRLL8z8AjbCKpVIq9mAAJ1MP5gYmDqwCUI3OUdqStXbC4vBrKHxR9+iYidZ6BeQ8vdw3/Y8Jh7YDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4LweEFXP9E3ooK1+olyeoE1/jdmNczE+NROlQ0WhAw=;
 b=jtdfLsXnUHYLb26Vkf/NQzLHWUHTT/WshJ2uFa+pL7JzlDoihmh4WV+reSZM/tjQNFgZfD3aRIRfZsuF2rSVmRzbDq+AM32WyCvQ8I02lL1jxUrUE9ZmPmqXtzrtpNjv1+bvYKdLKWhYRwLUoogJdY1QMTU79UVtrfrbVDTFPDSG8/6EtUh1Wa8W8377pk01C1C+OeailST9aK8EQ+uZPEFT1vXt+2i5wgPbaEkZOWhvfP3JwzccAoW1ivHc2o1DyBsBqypy8jNhe0euca9Rnne+32TAkbez2CSRhrULEpC2ia09hsFEMwdU+VS1sjyda11SA+JTVsDJivrl8SjJbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4LweEFXP9E3ooK1+olyeoE1/jdmNczE+NROlQ0WhAw=;
 b=vJkCJYVubRLycHIwFzO7NTFtol4pA4j0PdiN3KnJjxNwx81B1dKScovBS+1t2BkZ5JU+I7huoaZXpzyE3ivEkRQMnlDIIi8MMAbrfNiKj8cPuZWQjwg4WrbBQXC+d6GcNERoUes1byDzXcQMXTorXUkKtTX6KfJbAhsQmzPLwzE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 11:53:36 +0100
Message-ID: <DFTCZP7N87A6.3B4T87XDK1AEI@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v4 5/5] automation: Disable ucode loading on AMD's
 analysis run
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-6-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260120093852.2380-6-alejandro.garciavallejo@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|CH8PR12MB9766:EE_
X-MS-Office365-Filtering-Correlation-Id: 345686a1-c2aa-4322-40e4-08de58122c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0dtcDczOFNGbS9ZcURETVl4MGFNNFFoa2NldUhLVTFVVkZJWHdEc2FBRFlS?=
 =?utf-8?B?ZmFUM3pTNzB4ampVdmJLY1EzZmh6ZkdBU01VZG11OUI4aDEzR01URVREbXBI?=
 =?utf-8?B?YkNEaEZXcWVUNmQzcW4wQWhWSVc0cEdXTUNBQ3FjWUNoTWhVR0NFYlRhN0V2?=
 =?utf-8?B?cVNMcStRMDdhcXFDVzNRTDVHQnVEMDhscENkQmp1SGN2eWNqMjRxOXpwRUdO?=
 =?utf-8?B?NytCYk9OaUVmVE1yZWsrQ1RKRjVwYWJoejVOSktYazVLQVJsUHp4UFJmZWk2?=
 =?utf-8?B?dm12dENTWm1yME96a0NxOTRvZU02ZHg4QldkMmdmb3JzM2krenhoSWVxZjVQ?=
 =?utf-8?B?UEVKZzU2T3lFTWZHODRqZzVuNjVYQXpLdnkxU3lsbzlMMVhhUW1oZWhTOW9z?=
 =?utf-8?B?ZE0xZ2ZjajB0OW5PcUtycm8zQkM2cFFLWnR2V2RqOVl1QUo5RU1HUnM2OTFR?=
 =?utf-8?B?M2hiNC9CWGw5WkpqQ1ZkTzM1L3BMeUZwNkFEcHlnOUIybGpDTDhHYkMvL2hl?=
 =?utf-8?B?NU5ac2FSTDFnekNuVWt6bXdaakFUL3dkTlVNRFl2Qll6SlRKUmhNQ3ozQkcv?=
 =?utf-8?B?S1h3WXJSdVF2ZFVma2x1V3FmdmVhckdrMmlpNFJ0Q3I4VUlaT3Y5SEhxaXBG?=
 =?utf-8?B?aVhyejArbkFiMm5zbUJGY2VFeUhQQS92aExTQ0Rxc2IvMWFubGlJd1l2R2JU?=
 =?utf-8?B?aHk3N1RtM2w5cElmTlNpcm1vaVlZSXM5d3RiMWVFeVE4elhmdjdGQzZ3YVRI?=
 =?utf-8?B?MndDS3BqMTBjTmdSK1BqYyt5WXpWQzdMSnNCM2F0NElOYWtRVVc2RUczSXkr?=
 =?utf-8?B?STIrYmcvS3BLR1BjM2gzZndVUE5pbW82M09mQ1ZCNmRzclVwT2ZHV0tzTE5O?=
 =?utf-8?B?NEF0TnE5V3BvSUR1dS9DZlFMdVBIQUdHcExEejZ6bWVGK1oxdHpTZW1sSFBZ?=
 =?utf-8?B?cEVYeEluT2lwcG9YWFJjaWxzandrbmJxVU5YSytQeXIrcTJHcW5JWWEySzUw?=
 =?utf-8?B?YXg1N0N2ZnVDL2xYYnBEMjdKYmlZT0ZJUmZsaTZ6TExPZDNkVW1PQ1YzeTFG?=
 =?utf-8?B?V2hGQzBDQi82WmkzWmZtVEw2c1hHV0ZFZDdGbXB4RFdoTHNSU3JsaHBkUUUw?=
 =?utf-8?B?VDZici9EMVlVOWhTVi8vblE4RGRSams2MFhreXNNSTJ3YW1wL0Y3RFUrQnJX?=
 =?utf-8?B?c0JlMzhoNlRpRFoyM3hpcVJTWEdyMnFXVktYbzlET2Rmd2JFRHlQSHdYd0V6?=
 =?utf-8?B?d3hDVWJtUGlNbU4xZ1hHSmxJUGtNZ3htcWpiOFZzMU55Vnl6WDNSZk9xZE11?=
 =?utf-8?B?WU1qbWpXZHhQTExwMU9JQTc3c0NTSFVRTHUwTE1menhiS3JnSmVoOThrUHhq?=
 =?utf-8?B?RVc1SkhHNUIwcEFQZ1VSR2lPK2tTejV2Y1RZVmpWTStFT3owRFQxdmlPZGF4?=
 =?utf-8?B?RUxaZFhzVzBHT2cwNnVIZm1aaUVZNHpyak14bDFtMmNJWVJlODg5U24vdkwx?=
 =?utf-8?B?emdqQ291MkFBdGQxM1hNZzU5OHArWVEvT3pMeDRCR2NJdVlNd1BrWURpaGxw?=
 =?utf-8?B?WU1RRTl3WERZbVpRUlBqZmYrRHVwendueVdyeWtyckZjRWY0OUdmZnNVUnJy?=
 =?utf-8?B?NHBmNG94YmNqOWJRT1ZDcGNEaXlWdExUdWRpcVdoZStmSTZJZXZKRkVOblAv?=
 =?utf-8?B?N21ab2hNaXJqeTFnWU9zUU1lK0dTSGpDREM2OVZ1eWttSnZkcUxMbDArdWE4?=
 =?utf-8?B?cXloTjJLNGJRRTJ3bXIrK0JtQ2RjTnFJNWFwWjJ4bVdHR3gwLytyb1ZNbytU?=
 =?utf-8?B?bHB6K2ZrQ1hPZDVmN2RWcXhsZ29KTS8wbUlvZnFaZ0UxaU91S1FKV2NJSmx6?=
 =?utf-8?B?VTBEVlJyMXV6eUkzVUpnMXo1SmNNcHJkbGc0WmJqN3I5Y1FCUk8xSDRCL3o1?=
 =?utf-8?B?SUlIUjI2Z09IakJRdTRoS3Bid1VtRkErcnF0SGxDZk5CVjYxcDhraTZlVkZn?=
 =?utf-8?B?cHN4YTdaVDJDdzNuQzFWbEkyYnVZNGpuSll5WVJWcWwzUk5JUHpaN2VVdmFa?=
 =?utf-8?B?ekdNUXZRblNiU2NhbUlzMGI1UUFENU11cmwzOEllNitnM0tkbWdHLzNYZDk5?=
 =?utf-8?B?VEU0VThYTHdJekk5Z1Z1ZEdmbC9SNjBpTVpQOEQyWHJmVW5YNW9oNEJpT3Zt?=
 =?utf-8?B?TnU4L25XK0pkZVczL1pGZnhGVVZQcVJpa3hNb0dIS1FYbmhORFU4WE9BQ29i?=
 =?utf-8?B?ZjZLcUNMUnVhVU1CSFA5dFQ3YXBBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:53:40.9796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 345686a1-c2aa-4322-40e4-08de58122c64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9766

+Victor

On Tue Jan 20, 2026 at 10:38 AM CET, Alejandro Vallejo wrote:
> Explicitly set CONFIG_MICROCODE_LOADING=3Dn
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  automation/gitlab-ci/analyze.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/ana=
lyze.yaml
> index a472692fcb..b3395e2da7 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -93,6 +93,7 @@ eclair-x86_64-amd:
>        CONFIG_DEBUG_LOCKS=3Dn
>        CONFIG_SCRUB_DEBUG=3Dn
>        CONFIG_XMEM_POOL_POISON=3Dn
> +      CONFIG_MICROCODE_LOADING=3Dn
>    rules:
>      - if: $ECLAIR_SAFETY
>        when: always


