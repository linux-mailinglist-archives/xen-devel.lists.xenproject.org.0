Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KHjN82y6GmIOwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:36:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA3445791
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290332.1569945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVsi-0006Td-Uw; Wed, 22 Apr 2026 11:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290332.1569945; Wed, 22 Apr 2026 11:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVsi-0006RU-SE; Wed, 22 Apr 2026 11:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1290332;
 Wed, 22 Apr 2026 11:36:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wFVsh-0006RM-JF
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:36:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFVsf-00F6II-EV
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:36:35 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b2ba-5cb7-0a2a0a5109dd-0a2a4503ab06-38
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:36:34 +0200
Received: from [40.93.194.2]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b2c1-672d-0a2a45030019-285dc2028aa8-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:36:34 +0200
Received: from BL0PR02CA0048.namprd02.prod.outlook.com (2603:10b6:207:3d::25)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 11:36:27 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::4e) by BL0PR02CA0048.outlook.office365.com
 (2603:10b6:207:3d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 11:36:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 11:36:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 06:36:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 06:36:25 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 06:36:17 -0500
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
 b=fZAU6ujdx7WePrTZnw0XAwgM4EwGyBAq8h4eGyAYGaOGOMVcUutASuAHdQyH8MLjVrS99wj2I0dg+T/fZ5BLEcFWI4/lL7EMZuAJrashEkuK7KrbzUOSA/G8sQPnCXKYmVKJseUdQpE1QwrQn6WfFb+Co6Y5EtA0HtHWhaI5nzjdSifWF4PVRDkRuY7RPahyzEn2/2CduPLmEg0caK88ddpnM5ITp+eps5HLiTYBfz+n1FNbae8s6p2PXuYAJ4TDU/lrw4tqeYqQssc6iYxZ9x0L19k7l4ASBiY20zotLGFqruBLMnPQvubrlB3gvy67fkQf/LlsELR8KvCcPsicKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtZknnB3j+p6kCpU06Y2tA1kcaZqJJozcwn/O4Q4q+E=;
 b=UZ18axeAOE7oYBceYrVYS6vumZrcST9XYpn+3mCjJLkb6LpYDv8m3WcRPMD9q8czO9M4+gCOo7aq0GVLhhjV/v1EQ9ZepFAGk3dwdatcoB09m2iiDA1be1OXvjfsG3xkovp5ldq4SzmbC18OkncDveFk5Tsg/NSRyM+W7NNg1xBUkmVEmxAKGLNXy2JUu+xM16rOI/xH0UCZTom5o3BvRK1z10oG/Sv/4W+nccKCcbVGZdhqixi9KV3JY4JVhT9a0lsYcNOOJkI/BGYQfKZaqfe0OCkZja7wS85Tk6s0/aShbV2KurzE1GYgNsY2OnSoKTWeYdMS9VEkdMg6i80ztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtZknnB3j+p6kCpU06Y2tA1kcaZqJJozcwn/O4Q4q+E=;
 b=JE3KFdRpe0Va+Ni0bRC6honaHysKzmJRG5ONRikxb7WHZgyn5KYp3U6/+f7GzF/MtXMJh82/KOh4gLt8Uzl4fytCPXf6sHbs/XSohFVS/Y8OPKxXeyzHg/9TUpvOywuGRKQwcLr/yUiu0D8w0UfrqWJb8HCCiJiUa3IoUPmxAp8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c6f48ecd-df34-46fb-9ec2-31adc9a13db1@amd.com>
Date: Wed, 22 Apr 2026 13:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/drivers/char: fix SCIF IRQ registration
 failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
 <519488a3f63d3bb6af9a6fb794b85e9960710b23.1776850201.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <519488a3f63d3bb6af9a6fb794b85e9960710b23.1776850201.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e47876f-1a7d-4f8c-6c12-08dea063632d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zS4sf/XiNRP9aB6eQ5Sl9W+hZhQMhWCkbYS8v3DwSIWHdvQgU5+enQCVngSPR671O8DJFYaaQ2plcC8xM9tdrJ+7kWttbX6ikrDLfPXbgEGNEc99nXcsi7PcOhSSxbdK8gHl1eUlerq++X8jL+wHJaVlC/bR9jimhgef4rbiZ28X38jU1anQq8j1MnitXPY3FIULHNlJAm3VCFeAC3FJm6Qxl1+OBUKDXBrQTBYix3pO3V0xacWivLqKicvlfD0RKW/dYELFLOh3L595Zq/SwChk4nSpfYK7UtYC9n+HeXhzL7kpnoXQkAI1S4f2F0dfIxUOWgBLxwj4FYcAJnDBOYqX9MqeURd6or7f8U88GBXIC5y/TU74DNfLchYnceZsw2Xhcx9cPosnCCVl/2G72FhVh3nC+cJy7vAgImCSmq+gpYMup5QJuGaZNhauMxn8QCHQNXWOjRSf5FTMuKPHOewYJO/h7KlTvfaNLdRANx7ef2d4DE5AO4K2o4qGu0O4LDleiqXxKkRY/mNb166dPhvRtp15eue0Y+HmsO4nFYtpVoHQX3ACjqooGhwIDWcgyzH28K+EQCYKrHUiQFk0jlZcqVCEWbHGES+hmWXis0gd1KlA/RVouGkFivB13S2cqoLyNlTq5TJ3adA4weOG+ipDJQd1u5GPd/bZO6sUZ0e9yaJ+UqfJpL+Ve0wr5EuvB60394naLhzlvHYrDL3O2a9SXyPq/FtbdZJfrjw7hKLy8IaZQUkyiFHCLzFJBpLdFH8rFXngCDL/K7DUWszp7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R3Z6fM0n1XGPDtJbsur+sVkuh9siU2QWDJXYKFOB/zugbRPtVV3u5WQeweXex0aIkNtb75jATxqL/DW3oMCUReCaAw+feZ4F6+xXhV3ObDXh68qQ/IoXRkenvRYpUkwcnTlUQRYEeU0r30LoW3WEk+WaYMtrJqHEUYeXMdneHZB0W+9Xcd23Dyh5Pf9te6K20gUKexrO5CsTbcjmXCLaT8ykeFMW/Ni9wL6R+/g+00VgkELzDEwZgs3qi/q4YuyXrX8xsKICKtEmfXityqBiFsXFpHFvbcZfVv+/6KaKLSUuVXQ6pv6lli0Wb9VgClCIjmmnp6vRGOG2T5er031tyJO/A+4rdnwZImcNUnRJMDZbLdSIWk0cLtyGwTo8lOzEAYB2Ww69+VX6Nsce48iByX8jWjUAPekhOLHmXQoTz3b1Er7h493PMo6k79HkDQ9T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:36:25.8873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e47876f-1a7d-4f8c-6c12-08dea063632d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116
X-purgate-ID: tlsNG-33051d/1776857794-A1B7C938-E11713F6/0/0
X-purgate-type: clean
X-purgate-size: 3274
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email]
X-Rspamd-Queue-Id: 4DEA3445791
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22/04/2026 11:33, Oleksii Moisieiev wrote:
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
> flag directly and does not depend on the interrupt mechanism. RX
> wouldn't work if irq wasn't registered.
> 
> As a secondary clean-up, the hardware error-flag clearing sequence is
> moved to before the setup_irq() call so that error bits accumulated
> since init_preirq() are cleared unconditionally, regardless of whether
> IRQ registration succeeds.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Extend fix to pl011, cadence-uart and exynos4210
> - fix typo in patch 1 description
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
As mentioned before, why do these comments differ depending on the patch. I
would suggest to just add:
/* Don't enable interrupts if irq handler was not set. Fall back to polling */

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


