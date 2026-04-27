Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cODyGwAE72lz3QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 08:36:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBDA46D9FC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 08:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294657.1571348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHFZ8-0002Ee-3F; Mon, 27 Apr 2026 06:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294657.1571348; Mon, 27 Apr 2026 06:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHFZ7-0002Bf-S8; Mon, 27 Apr 2026 06:35:33 +0000
Received: by outflank-mailman (input) for mailman id 1294657;
 Mon, 27 Apr 2026 06:35:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wHFZ6-0002BZ-Cb
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 06:35:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHFZ3-00Bgnm-Ph
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 08:35:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ef03b2-bab6-0a2a0a5309dd-0a2a450ad29e-8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 08:35:30 +0200
Received: from [40.93.196.71]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ef03b1-56b3-0a2a450a0019-285dc447f065-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 08:35:30 +0200
Received: from CH5P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::8)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.15; Mon, 27 Apr 2026 06:35:26 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::a7) by CH5P220CA0017.outlook.office365.com
 (2603:10b6:610:1ef::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 06:35:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 06:35:26 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 01:35:25 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 01:35:24 -0500
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
 b=nHQJKJRK38bd3GoHzcy7EiudUK3iRKyhdbX06ThD4KWKfoU2buD6FzPtD5zAYCNjrUvJ+Cl50Pf6wjyyRXuBfqnTJ5zAJIw1bTRLsfdaP8YOpPV9XvH4UPW/IwuYb8twZ4XHdkdmuI1XBrRbrOZPcnWMYFMhR61j7x4eDGZoQ+Xwf6rluhRnS7q+qXYwvZPblFq2a8ZPnwqEkTQEA4pW8RpYrpdocKrqkcEQCH2dwPON7FZutZ488vGSMnsOdwZY2yjJ/Wc5l4Mnr0pQs3bVYfE4k0Covbc/LRE9C4HhHNqk+79a1z7CdBtK9o2SAH/C1Y82d5VYv4wfW5oaJ+Tl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlKRmd4uD1saC1ljr9Cov/tFS8Xr3xnG7DKrbyM7Tos=;
 b=ebsDLxygCvCy+nXDIn0gtyyesEFnF8HTZg8q5c/J8V8xg8Cpn841P5smO0xfAu8GUyNEPCyiobBySBTp+nhVwJ8rwDJ9mmzdlDoVmjk/1aGDxtxmwVRnnJxtXaJGlKPD98IxMg+kdXselzw4gpZhNNnkNYEVbsz9zVhGUZst8sx5Qw8/UQ62gkgaolR1zHDJycOXjzrJwryjPgQPEbkzsuEw/oi9ryELrZouIRea4qbsFNWzNSPr7grtw/+BIEz7QT/0W8YB4aud3ZmqaNQ40AXkIO3/bL9pjsDLcudZywP5/10QdSeixhU0oOQrLrZcfLotk2atF+aCe7UC5eCrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlKRmd4uD1saC1ljr9Cov/tFS8Xr3xnG7DKrbyM7Tos=;
 b=d0wiMv0PWtxhKMKxXQFrXhmATJkfUc7xr/nSIqzq7CTU0kXUI7OryTQcHAdfeLGYSh3D84bJ1lAq/ZZ2pXPsmA5xi2USrXIHNItk/Tt494iAEXKJLkk+CkzzwG46E9vuaqGbLn3VhqtTpl0d4TWHg30hPLYhixdQDhUasTS1pyA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <15fb589d-8dca-4aae-98a2-593afe3ea814@amd.com>
Date: Mon, 27 Apr 2026 08:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] xen/drivers/char/cadence-uart: fix IRQ
 registration failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
References: <cover.1776960679.git.oleksii_moisieiev@epam.com>
 <da5af37c01b39495aac11da15325236904c77a5c.1776960679.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <da5af37c01b39495aac11da15325236904c77a5c.1776960679.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: e06fd66f-694b-4d0e-a2e3-08dea4272ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FuuWCOjfNVoO1V1eaOjyC0qmkd5oKjQDMaLA0oUJua2RmERN8d7ETFOUAJCvIAlCbCaHJUYb1KyN2asKPkJwgrmJKiFVuIVvT26L+UrlBZG2kXWmxPGCThnUqJ/HKoLzy8jO7+sJhXflM4VByvLV8JU1+EAKfxabOg7jLDJUwK1i/tsdVKApM9z7r5zDz2BuRp0bDvJykz1k3Yx5Egnb7q+GTxH4BYhQbAFu1AO8z1Q9w+4SwaJGpzCSPQuV0zvYGahUo2iyeirpIA660q86KfrnhuLRdlnBTuT8znJTKlpz5NwbPaQZ7Rynp9XkgSt6IXcZUdKXEx7kLsoulwpaecjU7xCtTBVH3iOlWTLW4iXhUsPAS8FTDcnsoo5hLcVt1FUB9fP4t2aCHzAvUDPhfgDeo3/jaTryy3YuTVu0rD6sFLOLtX8ciY21t7l0wLxd2Np7MTnWNIOp9TXM+iYr/55C1vRQPdw5sPHvJ2qSPkZfHFcHR8D0Mn7Y1JAz6qjy/eYDAHPg3XMjHJHq/eD1WxYkriBqajjLGWxchjlwj3ObkybGTcp4N8bhSDeGjgZZNnd/FvDZQf3a5sD7Hg435Ks6dmDYzEYi+jyyKIGX7gN2gXLRIl3+/NRc89MMdlfSkgnq/KwW5TL8QMnNRhkLygpGCgP3TnoTEMNeuMCQB4VYryZQnhy5c4Mxya4C2m2qvICY7p9bvUeYE+bkOwrcyN0HH5cS027zqUtHb50/oG1rrDQ+OyT5tDaYoFl/LvCzlHoGrUaMEJd1bOAURCXp3Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MZ5rVMV+DAOWUNb31miCAUBSn15zEWqT5Vy6bHRP0qaJWtBTAoiBPdmHD6YVlBACwABOJ7ZneESj3dD9stVIgLAY4fGRS54MVCwKF+jK5FEqsNdDkB6J3W/YLm9Pnd31N52nLdg/IrFF1ryX0rL3xvTTJ3oo4hounG0QFKqPm/vQ5hQB92piSehh2AzLDo9t3IKDPgdBUpxzUx7nSAz5CVK6Ap8Z/Mu+Q+O4X+9z4VNjsLw/w8spSIumUqfv2hfpa5kreSwzsyBblrx0h9eWFlgNJ0avbYuZSQQ88A7b2Kzv3zlYOCpqEHRhr17liCs6ptDCUT8tMMgM8af+wWfrIl1QTg3Mdzo1mJmwdZsGDGzf9jyhBWTtWs8j3YLjtMu1L8sftGYxJvLo++2Eb7RaZ3MKuhq3dpj8IrLVodCdOehGC1RAVJP2Ax1Wz2wSmJM0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 06:35:26.0914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e06fd66f-694b-4d0e-a2e3-08dea4272ac5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
X-purgate-ID: tlsNG-4011c0/1777271730-473738B7-F5ACFF84/0/0
X-purgate-type: clean
X-purgate-size: 1102
X-Rspamd-Queue-Id: EDBDA46D9FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:Oleksandr_Tyshchenko@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 23-Apr-26 6:11 PM, Oleksii Moisieiev wrote:
> In cuart_init_postirq(), two code paths could reach the
> interrupt-enable write to IER without a handler being registered:
> 
> - When no valid IRQ number was provided (uart->irq <= 0), the original
>   positive-condition guard (if uart->irq > 0) skipped the irqaction
>   setup but still fell through to the IER write, enabling the receive
>   data interrupt with no handler installed.
> 
> - When setup_irq() returned an error, only an error message was
>   printed and execution continued to the IER write, arming the
>   receive hardware interrupt line with no handler to service it. On
>   platforms where the GIC receives this asserted line, the result is
>   either repeated spurious-interrupt warnings or an unhandled
>   interrupt fault.
> 
> Restructure cuart_init_postirq() to use early returns in both error
> paths.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


