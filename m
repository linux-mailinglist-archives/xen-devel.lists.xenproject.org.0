Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHgzLiSiuGlygwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 01:36:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1BF2A24B9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 01:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255844.1550645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2IQ2-0003D0-9X; Tue, 17 Mar 2026 00:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255844.1550645; Tue, 17 Mar 2026 00:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2IQ2-0003AC-6j; Tue, 17 Mar 2026 00:36:22 +0000
Received: by outflank-mailman (input) for mailman id 1255844;
 Tue, 17 Mar 2026 00:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wERr=BR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1w2IQ0-0003A6-Gc
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 00:36:20 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bbe2e9b-2199-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Mar 2026 01:36:11 +0100 (CET)
Received: from CH2PR14CA0038.namprd14.prod.outlook.com (2603:10b6:610:56::18)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Tue, 17 Mar
 2026 00:36:04 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:56:cafe::a3) by CH2PR14CA0038.outlook.office365.com
 (2603:10b6:610:56::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend
 Transport; Tue, 17 Mar 2026 00:35:58 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Tue, 17 Mar 2026 00:36:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 19:35:59 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 17:35:59 -0700
Received: from [172.24.66.250] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Mar 2026 19:35:58 -0500
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
X-Inumbo-ID: 4bbe2e9b-2199-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRHwIB+4hj+ZDL+mf5Aew1jKIJSSi7mTSYqGvBzMd66ZAG3VnoB+Z/tOVhd4K1IPhFpPCfE7hKtRTqlE9xqXFe9altCU4aoBf8wm5jHCp8T3uS+uUmKwmgMEzP5ZYifH6Se7VxC7V7mK/zsrpSc22mJgHAcDhENPOtlHcGqMas/2pv0DBeS1q1MmXK/5nMHYa6ppV0szYL2TSI2A7+DGZ2Vmk9StX1/rEIIYRO6L3Q+uGLIsmpP5rCUbxQOMMD2bk7jusEq55Va4oUUhmuDX+LpkC+lCl/JaqL67tk3Qe0sbTLUZ9Wh5Wp7C8BULCSZVqUVaxLdAYx/AZiyhW1zaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUMtEea3a+YnlF3/9rKfmZaz3dVFSAle/v99I03LFEc=;
 b=lcU7d16XZdkj0Jl1ERGegzK8+JxPjul3q7Y36rjK3odRtFqaXXVtMEyVXbZUODwCKGHbpwMrCU79CwCEnjHOP0dmCfSdyb7TnVEF12vkUA1QJ0EZZAg9LfP+udG7DrgcEwYDT49U8yP18KdSEWkhiie9vSp05FjmuDngEzfkj1NGwmiTpTMtceDO/hldZ4o6KBSy0pkPe2QdIl7vhBIa+W7MszeSpVvy3Ev0t+28URk8Y1Z4oHU0uSelUiABpxMIpTbQNf7yNLJEzFpvWJxr9z0hLau6G0yoTicIFf3KLMzHH6xpzdV22x6VA3nISxFJH4U9EK/5zNJw4X1wcH/tbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUMtEea3a+YnlF3/9rKfmZaz3dVFSAle/v99I03LFEc=;
 b=tr8UK26MwJf4KxExy+TWxI6N6ajQ9ISj2Na9euKHE1P+A9sVjC5Tl3Imjh0UxYKDXgg33KqdPa05iDgD9QfKRZLYGSm/p37U40iWqrwOSQ7iKRYL4+JKI2MpGHKnTg+ZzI7V8dP5gXZ28xAN0HzO83CvY5nvoAQtTGj+J559Hbo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d4e9f2dd-803e-41b6-8093-6f3b67e941e3@amd.com>
Date: Mon, 16 Mar 2026 20:36:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] vpci: Use pervcpu ranges for BAR mapping
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <43ce584a124f0bd07e641934e15e5ab56548e1ba.1772806036.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <43ce584a124f0bd07e641934e15e5ab56548e1ba.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 9015ab85-1ceb-4865-2983-08de83bd299a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	krD3Os5vdt5gCyFxMagTVVHEjH61s2TvZvEPSIhn1Q4cZNJ0V4PFPPbIukpM8lgRRM1SHXdpJPUvu5DyOLeXtAqOk6lCV55skgN25N2Vw09xykxkSaFtCMV4UUZONWAC179yRTQtqY7J1n4MjU5/UuW9bhp2fqSrMz1Rk/XLuSZjTIu+9FjG7IBrhd3bxfUFrnoTgBvKASP3CjRAUYOPykadjzXpEIN3sCtUB5WxsHCwF/MPWIGgeIx/ZqMD2HyCqiNPYv2YSHTZldgGJ0ssIz3NLx0IGA5I5F14cbK9fVVJcAh1IWWktw2Os9wpZXy3oD4Co16ulYzmgUnxyoIzd4x6P/ceDD/Zk6ZcmxO3GPB62PdTAnytvSu9n3S7Wvh31CTFxCUroLXNkg/wEvWoX+cDStjXsHcZ5Kc7fln2jBlmTrUArPzXOGAx8xzL4GNOuThST1oJW20QYtuIuOSuRE39B4i5EniaJviS92rUguXPBmrMV416rrY2jdUZjlurTK81pQWfwFegqTkooOxvvosIVjbozeGe5G77AHESezviQrmk7NnbbohWjgW6OC9M5v8nWx5zRn4+Hqx50wOz5ILFNQDOZNLxfXNNOUhpfjUkbQWcaZ5tjs/aia0RwAro140XgInMokEdQ4K9QYbypuzvbVswoRr4a/Kc0C7fpUUkl1X3M7YdJc7fKOrtRHuDvfwOWWBDTfqaPwzgVFWFfONSaSdtnyYhZ4nCI4AlMR/PRKGg2NRdvsF9EaFC/lvG9Q/ju8d718W0eUfVXlQ9Pg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/pGHk/JJSZLeoUK5N/jOVK9r4arkXDszJHcXyymcjBaCmhkfwqRWEQCdURtHuZD0ibLL8rbxQhG8xnkRZCvNd6LqNBVTTWSiOQ+KBNARFUVq4+1OSMX2Xqp99wXzDiJTwrLw/nU7Nk3yEZNNFqS5EEa9JvKIEIcv1WytQd0bv5K3VMBBls2SriPGbVb/vtFEeZK+jfcfZnBC1FeIIkA+ZN9QYIGoPChWbv2K3Mx7IJI2BUScgapT1bOij2hbXS7IXnrp60SYx3phJ9QlBId4EC+buwtfEe2T+p9bp0thnL/8vDSwbvdpfYjZlXQELldcZSG/fxkvkZFPyBMaWXS58G7V+8qxyzr+CkIGmJXeKMuP9ax/THVO8wAfZ+aC9GQy53FNDBDDoBihov5hyR7oRapPrFC05LcZlsvhuObi2X2Vyqqn238pniMcR6kolxOW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 00:36:00.2684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9015ab85-1ceb-4865-2983-08de83bd299a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 1D1BF2A24B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/9/26 07:08, Mykyta Poturai wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 07ec991a12..cb64d9b9fc 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c

... snip ...

> @@ -330,12 +332,13 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct rangeset *mem = current->vpci.bar_mem[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>          unsigned long start_guest = PFN_DOWN(bar->guest_addr);
>          unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
>  
> -        if ( !bar->mem )
> +        if ( !mem )

Since all the members of the bar_mem array are allocated unconditionally in
vcpu_create, is the check here still necessary?

