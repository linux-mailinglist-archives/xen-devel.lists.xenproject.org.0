Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGdyC3e412l0SAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:32:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962803CC0E6
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277589.1562746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqQU-0006fl-8n; Thu, 09 Apr 2026 14:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277589.1562746; Thu, 09 Apr 2026 14:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqQU-0006dE-69; Thu, 09 Apr 2026 14:32:10 +0000
Received: by outflank-mailman (input) for mailman id 1277589;
 Thu, 09 Apr 2026 14:32:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAqQT-0006d8-4B
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:32:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqQS-00E6rf-Fs
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:32:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d7b85b-5cb7-0a2a0a5109dd-0a2a450b9280-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:32:08 +0200
Received: from [52.101.193.48]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d7b866-bca8-0a2a450b0019-3465c13094a3-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:32:07 +0200
Received: from SA1P222CA0120.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::16)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 14:32:02 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::5d) by SA1P222CA0120.outlook.office365.com
 (2603:10b6:806:3c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 14:32:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 14:32:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 09:32:02 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 07:31:59 -0700
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 09:31:58 -0500
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
 b=VoaTDaHmcM92dZpdk/ecgbOPijyaVDbHT2AGA4gkJWsQ5BUiJfpq0Uz4aJM05HMIqIdTSEXc2Y7tVRfDxkbDDQBx1Q+RdqBQYY0GdODLhFLDZTSKW/nyFVv0XIJQqHM/PRALqAXdd9FZs29u7GvSj2MnWXbLo+BYPL4AXVijmJ12vS5Iomn+u9CMm6cev7LeabTMFPGaaFTp/YfRpSM+dXEP+qaso4L8yp5mrrEmruSGpzMbuDdmyIj6HVj3AzB451anUS5rej/7aHN1YsBv7oyGS7Pon+2ZARCHoplmQSfLrhyiTGCCQvRDb5zQuGl0yz3JRcnrhShqUBEBXgzCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVT6ms/4/5B1430m35U1YpiaxU3qA1qtSjiP14nFtLw=;
 b=KdGCz/C9w1oR2CtnuTD3uCN4E6i1uXiqWJyuNYHjxmgV4ZRCkz7U2vYYIr73+g/wZ7/56ceMbUWbrW0D1Vrx9XdRIZIfLJn6v78DfYwIb+U2dSPnd35yrBteoqKb6HBD/aN9Td4VspYkzjeXuKXQ3lSqitV+Z28CgxBngRdiXonRqY4xttAx0mGxZQEaIhqHWmJBZNFL3V+qJuR61oV16rvAb4Xovjb0ZklRJ8s0JV1cRcBTzhF50w7VzTRsTBFWjRR7U9koqKNkv6nzpZ8P1fHGzyQkyz13z4IaHUzwYxBxLUqZOc7dyOZBBjFISeOsKFKoqsWBUKrtLeE3msvyPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVT6ms/4/5B1430m35U1YpiaxU3qA1qtSjiP14nFtLw=;
 b=e9iUgk+vkVxifKOlO4GAk2ddLHLjsVK9u1PxQpdRiqx4Rh9DzfbMMYG3VOPLJ97OcH05py1JnK0mRQyaJbodAxArYd6T8/e8TIvjG8/blEHPscSTJ2YM4w2gcpnzie1dU4Uv8qwe87mEtZWzy5cealUwVz9Fs/ZEfR2iol1Ng6M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <685f565a-ca8f-4a76-8b66-6f09614d1ee5@amd.com>
Date: Thu, 9 Apr 2026 16:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/drivers/char: fix SCIF IRQ registration
 failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1775742562.git.oleksii_moisieiev@epam.com>
 <276f353ec36258dc545bef581389e60a162988b6.1775742562.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <276f353ec36258dc545bef581389e60a162988b6.1775742562.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a120a0c-3da7-40ce-bde9-08de9644c42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1tbSHkTc056lED1qJ9KOxM9Ki1Gmwk+2xzOK+xSR884zQy34T/+t+/EaBRjTO0mpMCdh0HzvnuSNYfszFbGSBvpi3tmxvjcg7y1cQKoZvqoBvezmNi0BNZzqIhYs2u1ov+sL2kn+RSjqqDUd149C4wovzWs1lb+sox8xKUQaXTuK89PHFDqJ6Fy8j/RhQHwuR/6ITlBZFU5j7NpRXSGj8GoY9/7nIV0nX7zZ3FES54SQ/uNLsjjk4pQld/gR1WwyxCF4z9V17VzfLDJRoh1GZ2MiTLDcwmsTPwVXk9HGtIPfurz0webgI9Vwscd0i9aDpvIbbciEdxyYHCLadU5zChzZcl7tEvvCiPPWWSm9FejnE39oy4kKcSkAVlMHUZKDhIPd9+saLGktr+qU6xqUK7aQCHHsgyl2pfC+875esxUxa1zrcrGx7xLzePRPPat5blrV70ExbD4G/O+Yw7szt2p6FY1X3hjiFhf1Bf1/v9GomuaUBHnvwnLOsrvo0Klms31emD8G3laCh9P4C3FpdbipJcr22EGj4f+wOYCqymaPTCq1Cmb+onfPxa4vCAxnIHOjzG5Gc0/n2GFJ7cqT91ba1Q5YUADBiqjOd2wHURKL3aRr9egwLGgoRXPdimEBVZDx2q6aY7RNE1Zg2pyGYAaCK6SfVjsIIEthRS/bS0HG+8vmu6Gwyg7Agb85pzzw3lLtSc4REgsgKK4VUHdczDt2GTHH1jJU+LfKJvZVsGtaHG5bRwo2g7R4CEgcE5JBBxmusyBLVAP6ud8YnJz5bg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xl6p+XHCk/WR/vGnVU5MF/4RiRnVFbQgsvgCOm9wtx1Ovp+Yf6EfrLnEnWUizepRf5p96SAZbUt8SY8U+56rmSoq7QMWQhpy7BuOU5sVpRMagI7149qJqtAfq/jAYIiGgzGPqlGRNaDfqgkbIRDkLNROq+v0S3bHf8bKBa2C2Sm3Dajpp8TFGWy3aON2llN35QKJKgolRm0lil3+BdsKex1+F5dz6YuPLv7Lc30xPI/l18Yv/8iuAjqigjPipiElSgnBe4mHEMAkarWc5LcjUhZpv1YtpOcvEK4KoY+wAfL0e+IIJmO9OozHELLHaSmfx8aaxaqiVGj/ojGFuWQkROPkNj/LQklkgi97n8430G0kGNpeHiKmRYGVomjvZYc5MtBGO3vz+NJLJcHN7ShieBQaK78oKg8IxJ8vdZaWuFD2+iaIjZB5HnTlvY9w5IFc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 14:32:02.6061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a120a0c-3da7-40ce-bde9-08de9644c42d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927
X-purgate-ID: tlsNG-42698a/1775745127-EF9412A1-32AA93AE/0/0
X-purgate-type: clean
X-purgate-size: 1504
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email]
X-Rspamd-Queue-Id: 962803CC0E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 09/04/2026 15:50, Oleksii Moisieiev wrote:
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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


