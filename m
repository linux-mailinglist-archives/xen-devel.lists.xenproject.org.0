Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPNdO6dg12keNQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:17:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2893C7A14
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276822.1562131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkZu-0001ln-BN; Thu, 09 Apr 2026 08:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276822.1562131; Thu, 09 Apr 2026 08:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkZu-0001jV-7v; Thu, 09 Apr 2026 08:17:30 +0000
Received: by outflank-mailman (input) for mailman id 1276822;
 Thu, 09 Apr 2026 08:17:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAkZs-0001jP-HQ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:17:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkZr-007rr4-Po
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:17:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d76089-e002-0a2a0a5209dd-0a2a4508a7f4-46
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:17:27 +0200
Received: from [52.101.52.48]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d76094-fab6-0a2a45080019-34653430755a-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:17:25 +0200
Received: from SJ0PR13CA0101.namprd13.prod.outlook.com (2603:10b6:a03:2c5::16)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 08:17:21 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::80) by SJ0PR13CA0101.outlook.office365.com
 (2603:10b6:a03:2c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 08:17:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 08:17:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 03:17:21 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 03:17:21 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 03:17:19 -0500
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
 b=QxnPSnhkR37RHNNA1aGu1wHRvcrg5p1cqpAUwZKRJSKR0vR9ZnA6k7SF7L7WJHSZ3Z3xg5uRpTwK+U4OTTorctgnHSYqioB8Hi09jLM6H5No5IBil6InPVBt0u380B4WyuvGOq+3mBMnQQX0UtvzZFaaPiLVAAwQXQJhkNvjJCuLm/Sehi6mYaLMOjhwYMui6pSWGWs8a+gMrpcnUiIyz+yY/qYRjEcBWRX/+Bsan5Y2kK1e+imQANDzVMgQ8RiYYIipA+Jz1MQYyo7j+rOMPGoVaHR3VsH5M//9Zy9MjPkieeI2auPvp2uH3UVpo1cqPoKDYgioF1jwVs/lMMa/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNTEazLHomjmOsy3+fEjUeM+cp7EbT1E+n7pHfeiQJc=;
 b=bYhdUrpJk6/NFA3V6oz+J1dR/zj/i3kiOT91gTQ92ifteBP4gx9tTDulE7SOnpg6rK66WvyoQgW1/5WG4fhgtz8NZUOy+qQA8X9E99eQ6I5Ep3hxI/W7bybXDgrvs1ecahcXjNzfdeW3cSznE6le5kEjWHCieF+9O2T9VUZrNUlasBGVZA6cRtewFm/oKWxhg+n8OJMQd+wpwb7SQ67d4nCNmAa3iT/75mmWy45dPg9TjCSSRfcJ1BDVfXTILsM4898zLAUGQLXb3DuwhTRTRXa+Wuy9hWhxxN7p/cwUd/XXw3L/DDPxSZAM5HnS3oBqoLLArqI3iQrkBm6jG8ZxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNTEazLHomjmOsy3+fEjUeM+cp7EbT1E+n7pHfeiQJc=;
 b=HZvrap9iOE1qcxtYUbdEa8JhUq+ILFEs5N8fH4G2Z34u3lcpkO43MoOW8JwEuIQ/6gTifctsdl2v8aTF0iN/TIauzLDAK8FkdZ4CHLz9jCrAuMNQ8CxO4ejsZZL1qJKNnoNxL03RHJ0fnEK0Ucn4mV2PozOZuwB3xx46+AK9UoU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <464adb13-b702-45cd-a28a-71d3278feb4c@amd.com>
Date: Thu, 9 Apr 2026 10:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/drivers/char: fix SCIF IRQ registration failure
 propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <6d1996b3d36e4d21e58c0e60876a1976db9a6208.1775667739.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6d1996b3d36e4d21e58c0e60876a1976db9a6208.1775667739.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|SN7PR12MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 05999b8d-60b4-449f-4a13-08de96106c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EZ6ThkIqQME57bn+QLwJaXqnT2NuHrvJoXsGn7NgkwrbT5RdxjE8lhY3ybjYq6zO1onK2AyW6Htf/QBl3HGSrFUWbm6CQmv7Nfj+AagZo+PgvvAI5EiuB7LjFPk7qS0Um9nSALgzoSLEB7VlsuiGUPOKnly624ysez/FEWMkBzkGlidAvWwybRmHBMUQdASFXes/kgoqeEnaFRmwbH2DrCA1ErJd4CIOjl3iGCyjdUYxEEOnnsMZYJXVatrbGsLH+Ig+m78AMEVJgnAWi2bDZSkUZn/I+17+hReR9/ctBaljVG5ES5Sh2qrbJQmVSReyRJXLc1IhWfRTuRmKH8BObIje2r2Gwhd1kqL4xgsvIyJtKA7Etm46i6bcjfZY5CzWKz/WsjrK/9QdIYtwxYEG1xqCV5t9o5O7GZ/aWUrrXHLIqZsk23uaCtb+VuiHKhkMoq5XZfKQPshkpSpCTLvfXsq0UtnBu2oYlfDO53M53rTVPL5JwxU971MJOStrAMjrBIVzfdsnNp+9tKUT6dMWYBnt22EvOymDYMoN/OYlTAC+bAjeqy3x0v4HjooUh4nKSXdqwOSrF3LDMBitOznuBWA8GdWhHsBqIXq7ab2QKNolQzsw/8DFOy4fBL6ZXPjqR/aUPr2LGegllFf7VlhX7aYW9iF1FBtZn84DmeNUohCdUmAzdS3BmhoWOFtNsx9tc0jht8FALa4oIcrcS6vte5DeY7MHoYRK9UlqED0HEFXbMLLTtv96wtset0PefaftVeMlm1bVTxrZ2XetN3Kmlg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Eh5ppRJtVBNwkbf3VuuB7HReXuSeA+WjyvlLaJNbP8ztE/aYG9vj1V7vcV1JQrHdTu5Psyo8AUYUzpuuKfSQhaFmEL5oHmJFF3xeU0HoZ6VzXjdkrTGOBJsWOBJ9r44s/lKB4qIyb7rGpy/Dh84xJzSZZFZ0YO8dzgFjC1Bb4No3bDVVyc5jIrtz1K5ZSsbqR6kFA0brV1cBUCEUHNIPiowihKMZhFTu3dKSUxqobGJcX+Uzbl0oitSNuIT/hNlg9pjL7JviIZhwm5VcSpklSB5TGB0FTn9uxbrJM4ZNTWMuMAmA4bwg6O3+Vi2XSaS/AVb2J/mNmzguGmvmEZ+4c3WzbudnyGvu1VjZhYs+9fQxeJWjnS98686xx6t6ZDXxvxcFebPougzIvWhq8oin1vqbccnUxzmer/u3Wne9m9VFDdQ9QOY61q6/9mWsU3bg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 08:17:21.5383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05999b8d-60b4-449f-4a13-08de96106c79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-purgate-ID: tlsNG-c1860d/1775722646-F5D53497-18B88478/0/0
X-purgate-type: clean
X-purgate-size: 3499
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email]
X-Rspamd-Queue-Id: 5F2893C7A14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 08/04/2026 19:03, Oleksii Moisieiev wrote:
> In scif_uart_init_postirq(), when setup_irq() returns an error the
> failure was only logged via dprintk() and execution continued,
> unconditionally writing TIE|RIE|REIE into the Serial Control Register
> (SCSCR). This armed all three hardware interrupt lines (TX FIFO empty,
> RX data ready, receive error) with no handler registered to service
> them. On platforms where the GIC receives these asserted lines, the
> result is either repeated spurious-interrupt warnings or an unhandled
> interrupt fault.
> 
> The fix adds an early return inside the error branch. The
> interrupt-enable write to SCSCR is skipped entirely when no handler is
> registered.
> 
> SCIF TX continues to operate correctly after this change. The Xen
> serial framework never calls serial_async_transmit() for SCIF, so
> port->txbuf is always NULL. This causes __serial_putc() to take the
> synchronous finite-capacity path, which polls the SCFSR_TDFE hardware
> flag directly and does not depend on the interrupt mechanism.
NIT: It would be nice to at least mention that there will be no serial RX
without interrupts.

> 
> As a secondary clean-up, the hardware error-flag clearing sequence is
> moved to before the setup_irq() call so that error bits accumulated
> since init_preirq() are cleared unconditionally, regardless of whether
> IRQ registration succeeds.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
That's a good catch. I can see most of our drivers already use that.
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

That said, I can see that we have exactly the same issue for pl011, cadence and
exynos. I can either take your patch as is (no more work for you) and submit the
patch fixing remaining drivers or you can send a v2 fixing all at once. It's up
to you.

~Michal

> ---
> 
>  xen/drivers/char/scif-uart.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index 888821a3b8..673a2d3800 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -187,16 +187,24 @@ static void __init scif_uart_init_postirq(struct serial_port *port)
>      uart->irqaction.name    = "scif_uart";
>      uart->irqaction.dev_id  = port;
>  
> -    if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
> -        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %d\n",
> -                uart->irq);
> -
>      /* Clear all errors */
>      if ( scif_readw(uart, params->status_reg) & params->error_mask )
>          scif_writew(uart, params->status_reg, ~params->error_mask);
>      if ( scif_readw(uart, params->overrun_reg) & params->overrun_mask )
>          scif_writew(uart, params->overrun_reg, ~params->overrun_mask);
>  
> +    if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %d\n",
> +                uart->irq);
> +        /*
> +         * If the IRQ handler could not be installed (setup_irq failed),
> +         * do not enable TX/RX or error interrupts. Serial transmit will
> +         * fall back to polling mode.
> +         */
> +        return;
> +    }
> +
>      /* Enable TX/RX and Error Interrupts  */
>      scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) |
>                  params->irq_flags);


