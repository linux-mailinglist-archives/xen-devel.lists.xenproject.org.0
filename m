Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOA3DsWv6GldOwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:23:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57A4453C5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290290.1569910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVfq-0002ji-64; Wed, 22 Apr 2026 11:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290290.1569910; Wed, 22 Apr 2026 11:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVfq-0002ho-3K; Wed, 22 Apr 2026 11:23:18 +0000
Received: by outflank-mailman (input) for mailman id 1290290;
 Wed, 22 Apr 2026 11:23:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wFVfo-0002hi-3i
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:23:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFVfn-00AnSm-CS
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:23:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8af90-e002-0a2a0a5209dd-0a2a450893f0-32
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:23:14 +0200
Received: from [52.101.85.20]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8afa0-63b5-0a2a45080019-34655514b8f8-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:23:14 +0200
Received: from IA1P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::13)
 by MW4PR12MB6753.namprd12.prod.outlook.com (2603:10b6:303:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 11:23:03 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:461:cafe::45) by IA1P220CA0005.outlook.office365.com
 (2603:10b6:208:461::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 11:23:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 11:23:01 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 06:22:56 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 06:22:39 -0500
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
 b=DHw/P4yk9anFQZ33L/SMpMZ0m1bC4EflRzRbcrYq2x93PrGykqeJiDNS38ErAzIqUk++gcbRLgLKJKMEyF3RRmYn5k4sgAubff8yG2+fgAalVGwyPoj9/v+JM6S97PeLSMf8TTTLy8/thwilHLUsGUaevjP7xAOL6EYxIeQpCi1buizWQufm9H3PpoOPyhvu5v9xp9E05YMgYW5SrlhdQrNDk98RvX+c2oIzcuzzCGQAdtj1V5qGGVTpnlCJSuLgRQbZsuoqRveAxvGVUq6bE2XluZMt1lBJ7Haak3M7P0mSvpRx6cp3J1dz5Zp8mgwAhCYGnWrzwaZLxMnp0zct0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWXmh2Ux0eSa3Of68oEOgnlsUVp+WgHkf37ef/ws9lU=;
 b=f+wpxPidQ9fd1TATzQ9fDMdsRs6LyOMJQiQijoJn5nL9GUeeoLZpMcxJwlYYF4EZLe8kXDxvSToG4ZYv+MmICpi6XC3+YU0IH5DAHfkOF/4eYVI82pDQv0CAmJttwjxHkWZ9Op2ead2i7j7CJ0MGO08/W8v1XFFmwZudKhe6L2JLyzmUfV+5BbT3D8K5bQ+m8FaWXbM/0R6iU/+ODzACvZdhELyzN+oMhqrhpiMtlxMsdiifoh1AGHAG8BoNiWmP1WnxzYTDpy2GoZIkufZPXNYWBJIal0DUGN5sjXqfuuQ+7bm44URGIiQai8dxEJxlqHr8LTtEBwb1PO+19C/7Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWXmh2Ux0eSa3Of68oEOgnlsUVp+WgHkf37ef/ws9lU=;
 b=iye/9YXLqLqnFwspmeJjE/bl0A39Iht8hoev+jG3+BBDi/8T3nd6dO58FCbMnp6MIKpHEDmuAuZEtZo23WtN7BewL6g4a+wsoZyFeCCYTT01IZh0obRZbkKO7sGtovELJZH/tSRYp/p5zPoIwf7NEndWdf5YjkoskBx7hhcRa7w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <26a29e71-bc47-43ab-ada0-19dc1d2a3f1c@amd.com>
Date: Wed, 22 Apr 2026 13:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/drivers/char/pl011: fix IRQ registration
 failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
 <6945fddd3a6df7ed9d9ca9efa7c126ab210d0420.1776850201.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6945fddd3a6df7ed9d9ca9efa7c126ab210d0420.1776850201.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|MW4PR12MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: ff57c5a4-383c-4bb5-525a-08dea06183a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	g3fidY6LPBtgWPK9evnlSuuCsJ7GKJeU0pb04Xli0wNm98K7/axCwS+5x8t86tQWY0Qm+5bjPtF705B4DG9wOMRhGzvMzVBQhmPT39coCVj2IMXNiQvIjVdwAxpE9xOuOlCuzVTShONgyd8bwajmXjg9okZpUwvzngcyYOyr8yOh8SzHnMszKQv2dgkRAdWSKl3NwtoVKQr62eSKoxQ5QUGwjxN8bN63GF2yPsqGyewJb7GP9h1et7bVXd0NLGv//wbDzShu1p5e5yyzmt2pf5+bq07xKTAdDa6VZ/SxmtbdEa9CA5+cXZzXJ2kzyfSPWDbyxyFUlNvblpAA79TIG7/8eYiNWy/sTdOlZFlsF9E0EPCQOKUbb1T08Q+A8f1n6eHwrqa/L4XZ1GQE57jgqfGO7t74YDPEids2SHlO4b3VHa8B09TdtptWu2ogaCJo3tbOvjezpxVJOglPJo9spxtRuEyQZCUKjWwqkaMZiJZSnq5vF5ZWsWTA5mXn1uR4Wb4f0MwiI2RcSlMk2fBU36nE4DCHfpCRik/80PDvbQNxPXaTW0+PpKAO61gIdpW0PLeZ+TvSdu1bWxpwnXvHWUTWMxLMesDLbNItaHjHDFLvBtbKxi1tQGz5tA0j8/u5zmTQ5dVgozyxUPehJSmy8jvP243oBGJf+WCfS7VRPyXb6Seo80iHbtNZZTqjL2GM35DJGpWfNroDCaQh1dfibekDUz/ra7gx8GBtIf3BTaElGymZ4VHRRnFyBep2T/Ok8FEpgMS3WFh517Yev46mkw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Lf38PclPFbhwnndJt4hEU5mvK5/JY5FXa2Aj7XiGrZrCLXhf02QrWxEumYjRyBGKXM5+sAHS8C1f5kLMwz7XMx5rGcR7yhyNZZc4NzymptmWeul2eMlU0As99b6qA6llzodjcPIQ/+Rz4cYW7kFH6i6VkVnTrxYIGQeNNvsXj2n/oqLvA5QG2Ll/Eqk68KPI3Zr8o9ewCj66PfsmV3SoFmFOiaUUh25h92/DNI7E1FmVe7CSmcOrQLVC5T8xuBFltrta5Um58mTQQO/d1jQjTWO0C2gpgx+RLEnyQ8Uq9gXzli37zHzJUwq+6LNJzPMa953twle4isRfSqzdnuHsmNzt8IaOJEMeqq3KnQPw/87Jf9THbDjgYYrjzOn3hAYzKYBrf/G2OLhefKTPqeuIgrG2eYWZpM7J2Whaav/plJC9urjj2xgCgxyEXkww/CfI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:23:01.3741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff57c5a4-383c-4bb5-525a-08dea06183a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6753
X-purgate-ID: tlsNG-c1860d/1776856994-38567DB1-45CDB93E/0/0
X-purgate-type: clean
X-purgate-size: 2273
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 8E57A4453C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22/04/2026 11:33, Oleksii Moisieiev wrote:
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
> Changes in v3:
> - clear pending error interrupts before setup_irq for pl011
> 
>  xen/drivers/char/pl011.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index 5f9913367d..9e308f4936 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -150,18 +150,24 @@ static void __init pl011_init_postirq(struct serial_port *port)
>      struct pl011 *uart = port->uart;
>      int rc;
>  
> -    if ( uart->irq > 0 )
> -    {
> -        uart->irqaction.handler = pl011_interrupt;
> -        uart->irqaction.name    = "pl011";
> -        uart->irqaction.dev_id  = port;
> -        if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
> -            printk("ERROR: Failed to allocate pl011 IRQ %d\n", uart->irq);
> -    }
> +    /* Don't unmask interrupts if no valid irq was provided */
> +    if ( uart->irq <= 0 )
uart->irq is unsigned, so it should be compared to 0. Can be fixed on commit.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


