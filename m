Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF1jLlqy6GmIOwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:34:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F944571B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290320.1569937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVq9-0005x9-Jf; Wed, 22 Apr 2026 11:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290320.1569937; Wed, 22 Apr 2026 11:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVq9-0005vZ-GO; Wed, 22 Apr 2026 11:33:57 +0000
Received: by outflank-mailman (input) for mailman id 1290320;
 Wed, 22 Apr 2026 11:33:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wFVq8-0005vS-9f
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:33:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFVq7-000LL0-Mg
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:33:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b223-bab6-0a2a0a5309dd-0a2a4509a396-0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:33:55 +0200
Received: from [52.101.53.3]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b222-2497-0a2a45090019-34653503469c-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:33:55 +0200
Received: from BL1P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::15)
 by DM4PR12MB6567.namprd12.prod.outlook.com (2603:10b6:8:8e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 11:33:50 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::66) by BL1P223CA0010.outlook.office365.com
 (2603:10b6:208:2c4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 11:33:49 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 11:33:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 22 Apr
 2026 06:33:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Apr
 2026 06:33:49 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 06:33:45 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2RL/S1vmcawRkyWqF7ltm6ZnTTIPl9a72Bx6UwNC/quOMNYJihJuC4A5zTWSZ/ppfB7aZAsUtUSCHjvzZ/TDBGTt8gmtWUk2XmrxAZX749I29yhtknZ2fxqjjWvN87k/OPy5AkFhCZ6b9VlEUNnVknFQ02U9SWbvXh8+T0H3lCXAARteZnjHE/0fMV7N23L+fbgx+0Alqmllh746cCmjCnF8La0MeEICSm6nSIHRL7655HeZaNLDDkIlZrgi+txTM3Su5mFExkeP2DR0ou+sfbdPSB2qWdvAv/vsK4r6uw/xouSyCesH0NMDMZY0RxnKP1tJBhUIBTYj0+wcNE0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZMZXDDbbPO0GfoVZ0EsLEYY/U/YhZXetgZxk6vOxiM=;
 b=clPq1i/pMQn3DbT4QGg03jmznuNY6RnIcaARNl5UjJ26lfC9mDrC29J0SQTfZMZS3LrbEunh3MtUuMS1UtBq4LR+GLY59G1sK/VtsQACSQrp7pYIS0vCJ3dvG8BAK4LBPmaD4iRpMnnvsN8l6r1VJ/r/uR0VjJ7o5mV8Lmq5j3a85DZmnyz7Ph43rjT9yvwg1IkF5XAJbxzmfY7SCxTMl7+mRR/fpuO9Qk0anRuq2P903k91PQb6Fvj6lE4abGCFzwwLGb+HVs+MmR01eFy0y8YBBIqROiTrCSE1hkfc9ubWVi3rQ60eM5fBSxrai/BWecRwTez6aVZ5RnV+RYooyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZMZXDDbbPO0GfoVZ0EsLEYY/U/YhZXetgZxk6vOxiM=;
 b=JI1YUBVY7cS4TqWueco8m2iL99BX+5zITkv/ZnAcVLR3f//6y+pNAYDnl5tI5q4HxyaMro7Auefze227i61IbHA1aOipu5tHAOeaWHDY8XWRhJzGHXGSmNPxkioyuPHASypcu5iZZ/SH8O7+ZUCnvnX8jUKRCOL+vTBQGZXgkjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <eb609076-bd0d-4a62-a259-fbe0e4b19a26@amd.com>
Date: Wed, 22 Apr 2026 13:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
 <e15f6ef27470724fd987f0c5d248315abb1d2c55.1776850201.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e15f6ef27470724fd987f0c5d248315abb1d2c55.1776850201.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|DM4PR12MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3230aa-e574-4ab3-15e3-08dea063061d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wN7UL2JSiWaKFIBppSRlKmH5usD/3AECyqBkL2Epk+qOH4VqcznrarrqlnvWri05w2EXCpq341cHXA2j3Ha2HemYiOy3M6QlSaO05+957vUuxEXGI7P8R7trq9J9qwFHxB2DWQ5ZlC3vd1lIkowJ7GBL7MNilyFWJiuS9luYLeCgvBM63JLlt49W+tbFx+VpO7RgLQtzCFapaf2M88yG/HE0cM5c/ffLz+Ot8NZ+t8tVrG1fC+cr64ITQZfUjzDIo3G+2VxMVyJqEM4ju/CEaKbkNPjOypnyA27UPBavIq9rfj1ynXjE2NsX3RhisXGIKTKJn2aB5jtgfJ+zrXY5HlULqmLzMy1OG8tDEoeV+bRRyFFkun6VIrGmWAu54iUrNCWKUidqJClPNkmwk76TR2Kj6UJO168VOnxQ1iCfnq11XN0nETS0kqbzn9/iXPnwICT0LzT8uyvEa8Da7U4T5kXvoqU4kjgKeTl8kbt1WhLYoNoq2lkeB4rbavThf8KzmCHnWBYHmmbCSZnl2rz2qbMRWZ2/S8YJsmfIX9aVtGc5bc0kyaOTVa14WecfJQ+subAbHnT+u3tPCNLS/z6KB6WiL327qH2uZaufdrC7odSVwicLxOnZWuOTIs9oGGCWAn2CU3usEB3KM1cJv+siwLFBMeEK1/mf8JI+R/hkRvtFqpS/X7u4AKAaPOjGpwFuiswEUlf+scitxmaBflb8gE7uaUhH7n6lHKhpfd7G/+mRm0Z2W1vIqSQi1ad6Z8QtbKNo22J18xSIOAgtLlqxhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gOY9cAUEhhUubEFeArgXUGNPxoEg0YmSKprzybe4ZRA2cCxzNcwVgAKX6kV5MqQYxrOqBXYUwgGgItoTqCgbzkMwYheQFEQUdLL2gNwVFXyHCZoYrktvyPWk72WAkkegsMKSiYdoDyVhz/0fmgmhnfK3OiRc8ch1pc8UTE9tFyqL9eOsclA+3Zi7sQzTSEeNOSpVdrt7oY+jMEIdvXWpaYSHFirEBxYr6vLe//gFi1tWqg4RgkvtCVrAGtd2V1bJUrrz2pR81HwOxsxXduCj62ERyH0DSf0UxI28V9/jSgLEXa5Bpu9Rd3q06nYGgBCK7iQzk8slpkLHFl1X04S4KHcRN7T9yAPBeMXiXi47BDQgO0v/N/VZb9zQBW3FwWcLXjcmicKKRO/fUGTqP+d8gwQcaKa7CZUcaTeVFZJAvX1zy9/goM67gKAYQGg4s5//
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:33:49.7532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3230aa-e574-4ab3-15e3-08dea063061d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6567
X-purgate-ID: tlsNG-bad1c0/1776857635-43B78A53-EB5491FD/0/0
X-purgate-type: clean
X-purgate-size: 1806
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 2B8F944571B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22/04/2026 11:33, Oleksii Moisieiev wrote:
> In exynos4210_uart_init_postirq(), when setup_irq() returns an error
> the failure was only logged via dprintk() and execution continued,
> unconditionally clearing UINTM and setting UMCON_INT_EN. This enabled
> receive and transmit interrupt lines with no handler registered. On
> platforms where the GIC receives these asserted lines, the result is
> either repeated spurious-interrupt warnings or an unhandled interrupt
> fault.
> 
> Add an early return in the setup_irq() error branch so that the
> interrupt-enable writes to UINTM and UMCON are skipped when IRQ
> registration fails.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Changes in v3:
> - skip clearing pending interrupts if setup_irq was failed because
> according to the 13.4.1.13 of the RM: it must be cleared after
> cleaning interrupt pending in INTC.
> 
>  xen/drivers/char/exynos4210-uart.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
> index 58901df554..2e5860ea2b 100644
> --- a/xen/drivers/char/exynos4210-uart.c
> +++ b/xen/drivers/char/exynos4210-uart.c
> @@ -199,8 +199,12 @@ static void __init exynos4210_uart_init_postirq(struct serial_port *port)
>      uart->irqaction.dev_id  = port;
>  
>      if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
> +    {
>          dprintk(XENLOG_ERR, "Failed to allocated exynos4210_uart IRQ %d\n",
>                  uart->irq);
> +        /* Don't enable interrupts if irq setup was failed */
NIT: Not sure why this comment differs from one patch to another. Preferably
they should all be the same.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


