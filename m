Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II+kEDi612l0SAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:39:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3E3CC1E1
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277621.1562774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqXe-0000cS-Hz; Thu, 09 Apr 2026 14:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277621.1562774; Thu, 09 Apr 2026 14:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqXe-0000af-F1; Thu, 09 Apr 2026 14:39:34 +0000
Received: by outflank-mailman (input) for mailman id 1277621;
 Thu, 09 Apr 2026 14:39:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAqXd-0000aZ-1b
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:39:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqXc-009xtw-Ck
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:39:32 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d7ba1d-2eae-0a2a0a5409dd-0a2a45059bf0-14
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:39:31 +0200
Received: from [52.101.57.0]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d7ba22-3760-0a2a45050019-34653900f18f-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:39:31 +0200
Received: from BL1P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::20)
 by LVUPR12MB999162.namprd12.prod.outlook.com (2603:10b6:408:3a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 9 Apr
 2026 14:39:29 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::dd) by BL1P222CA0015.outlook.office365.com
 (2603:10b6:208:2c7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 14:39:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 14:39:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 09:39:28 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 09:39:27 -0500
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
 b=JqR/XddnOhOFE94YO8IbhZr2xXVHWa8kpTjr0tDbM0g16hBImc93GiQBm7kw0XOsya0GTovRdt5uuolxmwuyLiYCUmM7X2KNBUgv7LcqHuxImPBVi/KqlUzmFS8j0TuZPJMGyAOjSv8ly2Yf+cUQvIIrLGXNGEL3Wbr9frT3Q46Hzk1Rjx9+bK6/2PqIyWCXGpmy0/toXBJVeRHlrI+0CmhRqUq+XMosVFZ+ki9wsNSFK7JDH2Sm+ClIRWEI2H9PVJaWE7YjANXRuijT1cOOjJK6jaDyVhbOqVynFWy7HhJqSRiFOr48npoL/UFg09cf8jx1YpOLrKEUnsH/oFSWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqm/d4wMbEQ/ud4emWG3Tsk3IJS83pXyHnPaPmPqBJQ=;
 b=G2rFIaTrdPLRafayCHvvgjw8lCJNkK7ssy+0LECA+bzgaCt7sfnwtVbuKsDEm3FBIsYaLDA7vHI28IfJEk/g7+MCi04mi5OSGvFroJgSZFe6SxZdUXAnFbTVBJ6At/rm8H7RZPIGs6MvA6eoxBfY5D/b0xiSXd9AVR38l78S0HIY/HPpWWiFkFBzTURWd4JzIJUXpOGyRYZSCxgfWnI7/5+wCYpYFoVZRKS9MnonvKvMmxrxCWVYJhCnzXtObA7owS023/wtxMO0whwSKDzz4L4NwNzkVbVR35jiFv5FMGjf3+rEhIsnMFmiPr6WoPwMFgUK4NW48DINpLqq8xikDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqm/d4wMbEQ/ud4emWG3Tsk3IJS83pXyHnPaPmPqBJQ=;
 b=S7Sjz39yOU/xOMy8OeOT+lHoCF06UP6mvdFgmZpr3TusnQ+eVrAKu/tnipfODaiCBWXWf5l7cZ2O4cJjZci18Nbati55tuu+BtZaazf+GRuQP+bq1zsosxpR00S6jZ8lxpBoUAzIkObdZ4RUbfgFs5wYfHU27PPgy7KdKePP0AY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <31be1ea4-ac65-43b1-80c0-7e1a8a8723ab@amd.com>
Date: Thu, 9 Apr 2026 16:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/drivers/char/pl011: fix IRQ registration
 failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1775742562.git.oleksii_moisieiev@epam.com>
 <9148b1721adfacf20c5621eb583f6fe87dead767.1775742562.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9148b1721adfacf20c5621eb583f6fe87dead767.1775742562.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|LVUPR12MB999162:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e302cc-b0b1-4729-f312-08de9645ce44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RtwQpTCt9AjrnNedVGIoRMnxy3X+LiaJpFdT5CZcE4trV8si58sH7HJr26mtJyBUIPkgNekrjfgSYUbnLVJFiduyQGBPyya/ohYEKHXQ1SKcWiFtYexs/IxInigOoK0wYaMw9eHePxnR69DDqV5GNhGajB+GJWIBU43rF1AGq6evqmoLMmiGaaVyDLGKKU42OwCwnReWG9hlgiVPN1Tk9M/3rDm9z/S51hJQrfoUTMoXPfXAvloFa82W0KrnfXLFh9EQo7eLvE58aImhv0lp5d9bb52RrUj9ULnHVl6DVlwQ2VOQkd/SwbXcODiM8c5ThlR32YT2beQcTucJqyicQbXkW5SfwHsoYYPC07ff9PflQR+3UT7VDkFRJZVPnMlogFvvdLZ2v1yYzq2O7xZxRMKoiVifWLmdDdVzfpANY+Bcj+e+C8iPtkwuZYxNjbUd20xl/iTrOvnZhCtC0d4bUmA5e4pJmg4oZbmQSW8ysjQ9dJe+e5f5FmIXGOz8qWjxa2MZlxPnCzHM1jQxwUIeuQ9hApG4phA+J34yHR5FkX1j6gQAz7ceJHYD0n8We3TekLtT05MX1hO69GZLi5yJHtLjpPtXZXA6QYNLYR/Q4K3de66Q7wpuPXTMTosz4Kybsi6bCig2GYROdugeESYGg1zKwBKlgKVlm5/6NdZwT8dZMGDzjw7ngkbRclCyW85mD2wAOswFajsiGoguZ1ALFr1dJcWBTkLC2ZvN2NnyS3vz9leagS00TtsHE14lTZhL2ZkBiCwtNQXm6+dEJRTLTw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O4zuGNPe09SEC9toV+cmxJQlHUGsDvtOPvimo7y8E+iQvPuHr8wAnCEfYlkOTFDOHQXpJyPfwVTwvTcRySdedoyywfB9M/UTC3dJAhxMQ4kJ8oriFm6mlTQEuBV/quKC+7FsveYZMZKq9+vyNGBghatz1W2R4oif2aTHvnC5X7qbCuVtFFsvSZYakikzN27xregLMr9GLeZe9eoy1ANVMDStRffxkfMYXM3W+aA8KbKsko3JfEx0uNXyt0cgDG/ePrKxfXkqPCTzgwwfdSo6ltD2Do6zdK0gqTwfRx0bKVdV0CxwUDhrXIKluQ0i1dOKi3z01SCr/eF1LhhuNe5L5zz2N+y2syom8ykCMoqLsVnylo7zjiYHUbgQ5K4oeM07xsE2h79umaEwL4D989hAFIlhe+ftLMmjTIoOzSEk6m3irIFkYBUlcolqPUIvXbWq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 14:39:29.0273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e302cc-b0b1-4729-f312-08de9645ce44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999162
X-purgate-ID: tlsNG-c201ff/1775745571-3252396F-7C0479B2/0/0
X-purgate-type: clean
X-purgate-size: 2675
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
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
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 93D3E3CC1E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 09/04/2026 15:50, Oleksii Moisieiev wrote:
> In pl011_init_postirq(), two code paths could reach the
> interrupt-unmask write to IMSC without a handler being registered:
> 
> - When no valid IRQ number was provided (uart->irq <= 0), the original
>   positive-condition guard (if uart->irq > 0) skipped the irqaction
>   setup but still fell through to the IMSC write, unmasking
>   RTI|OEI|BEI|PEI|FEI|TXI|RXI with no handler installed.
> 
> - When setup_irq() returned an error, only an error message was
>   printed and execution continued to the IMSC write, arming all
>   hardware interrupt lines with no handler to service them. On
>   platforms where the GIC receives these asserted lines, the result
>   is either repeated spurious-interrupt warnings or an unhandled
>   interrupt fault.
> 
> Restructure pl011_init_postirq() to use early returns: return
> immediately when no valid IRQ is provided, and return after logging
> the error when setup_irq() fails. The interrupt-enable write to IMSC
> is only reached when IRQ registration succeeds.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> 
> 
>  xen/drivers/char/pl011.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index 5f9913367d..918b9d4d4a 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -150,13 +150,18 @@ static void __init pl011_init_postirq(struct serial_port *port)
>      struct pl011 *uart = port->uart;
>      int rc;
>  
> -    if ( uart->irq > 0 )
> +    /* Don't unmask interrupts if no valid irq was provided */
> +    if ( uart->irq <= 0 )
> +        return;
> +
> +    uart->irqaction.handler = pl011_interrupt;
> +    uart->irqaction.name    = "pl011";
> +    uart->irqaction.dev_id  = port;
> +    if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
>      {
> -        uart->irqaction.handler = pl011_interrupt;
> -        uart->irqaction.name    = "pl011";
> -        uart->irqaction.dev_id  = port;
> -        if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
> -            printk("ERROR: Failed to allocate pl011 IRQ %d\n", uart->irq);
> +        printk("ERROR: Failed to allocate pl011 IRQ %d\n", uart->irq);
> +        /* Do not unmask interrupts if irq handler wasn't set */
> +        return;
>      }
>  
>      /* Clear pending error interrupts */
I think we should clear pending errors every time. Other than that, the patch is
ok. Provided the remark is addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



