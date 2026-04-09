Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA2FMMS412l0SAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:33:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363E3CC125
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277597.1562756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqRg-00079p-Is; Thu, 09 Apr 2026 14:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277597.1562756; Thu, 09 Apr 2026 14:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqRg-00077E-Fo; Thu, 09 Apr 2026 14:33:24 +0000
Received: by outflank-mailman (input) for mailman id 1277597;
 Thu, 09 Apr 2026 14:33:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAqRe-000774-Ox
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:33:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqRe-0098Ii-4Z
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:33:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d7b8b1-e002-0a2a0a5209dd-0a2a450c9b4c-2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:33:21 +0200
Received: from [40.93.198.16]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d7b8b0-f40c-0a2a450c0019-285dc610e85b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:33:21 +0200
Received: from SJ0PR05CA0076.namprd05.prod.outlook.com (2603:10b6:a03:332::21)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Thu, 9 Apr
 2026 14:33:17 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::d5) by SJ0PR05CA0076.outlook.office365.com
 (2603:10b6:a03:332::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Thu,
 9 Apr 2026 14:33:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 14:33:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 09:33:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 07:33:16 -0700
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 09:33:15 -0500
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
 b=uXUH92Kr4Ul+DBw/Nv7H+Snrs0sc2vfsX1/T7qetgbZqLaLwqwoMv9ngSskk/rTpXDN3Mo2R2KM/4vpAZ8dP7Qculh4kMFqOJFroDdSL36iHOZ9iDsFsDcLwHy12lyqASEV6WqpIQ4mo+XpGxhra7XoyOWb4Th2mnmTmMIboyK4wrKU7ud6a8uLXU6L9SoU6tcGhVHUZ5eQ/MDmVDh5glvV+FsywaGE/gD4o4qRKXXya6YuTbU8WlIk/vmGl/0m9G2inNV5blDP5GqlwN3sZNXKwYaYKsbF4ZZa8VO/7qqPwlJgIXuVLAR4DzWra7tjzqf+RvWo0g3kpI13vOA5vow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJUtP/iDO2spTKYHFNGBHi/9Yu5vL6tP0LS3/Jfd7sY=;
 b=u1LXprYVGIVwXpcJMJzRKF0TI9t3UNNhW901Hkrc0Eu4EJmATUtmtMAsbv7/Ng/avtZXcurfam1i2UfZdq0V7X1b+RAWlFCfiRNKcQpz2rkchwBeSGKXa/Goh+4V0Zw4c6m+AlrY+Gx3dwxYyFB7JaS0B+o4Ho0W0I1Ua+BKkSxwDewIUYWGAPPgc/mhzfj9bV3wm02lmcEwhPsY6L32Sk9vzgj8QHzR1r0xD2+/XuSdu2aj9vbpv4fjvpCCA1mk8qOSS66HO9O+wkKwb5qlbJn/jy2p7xRkAB7RU+zzW7CcbJe9Cp+2yEWIEMsn9D8WxMtk3BOY17eggS2CIyXtSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJUtP/iDO2spTKYHFNGBHi/9Yu5vL6tP0LS3/Jfd7sY=;
 b=ZaAwhM+QvfZGR6MVeDCyb89dOq0izkpjfwJE23qYZECmRnmzWi3KSp6VME5bR5YIlcF47Saq7in6yFreu13cwFnJcJqUI69Xg96c7UQ2aTl6eAEpADHp/Qy3ye+byMVYpFlm6EXGHPJapAPa5NmEKhf12/J/GRlBw2h4BPhy9uc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d4a57649-7d09-4dc4-8843-d20d8a2e88f9@amd.com>
Date: Thu, 9 Apr 2026 16:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1775742562.git.oleksii_moisieiev@epam.com>
 <043b73edeee02b477f210cfd82f0b2940de2ef21.1775742562.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <043b73edeee02b477f210cfd82f0b2940de2ef21.1775742562.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|DS7PR12MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: cc35ecb2-4f0e-4099-8827-08de9644f0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	aw1GpUl97GUNwHvJt+6GON28+Ic0B4CVnaSTTz1j3ueguyoe5Zb6j3s1cw3ox2I3yWdEK0gYluuRlxQ9l3osBYn5zXFDDe+tLNUVGFt7CJGd7diKPfIHmvpsJJRBdRsKfc/yrObDkbrg5GcBqUSUd2DNqup+5PBWP43saMDPrIq+bTKm3qoafGjHzDzQ3zShP27JLDuZX2b8RwsuUj5XZhW9vp0Uyt89SbbAyB0eFdcBaKsnlHrPaUFHAifEsuegEcK4teM+8jc/a6KH2XhV6+hKqMI9iGh+S9PtiO25BjtIJb4VFTYi/s0XfOB2XTZCiNqYDDA7wKvCIi0He0v+sM3QkNdyWZRvW+iT6MffVXm0J/dfgAccCyLF2rQOdU2HKyHQslfhs2MOI8NRr9oEqlGvHhC+n1K2O9X05DCom4gMfriHuE4LOk3+FwnnFxXyEJUmTLIQMch5ecH1jfJ2A+nyjz7rbOmOm/zGfxx9+UdUwc59QSNRae9yohwqaxuZgA4cv5zpBj3ivEPElDh7omEeUkxAlr1Hbx01c/SBTvpa+/g5r0SIiiTa2oCLwn8wfAK/QkyJ+Cj8BfEfJHCdtEbnd03rhkit890tMNMNOp3C0sxvKHenxm4bxJ9pCBd9rnLpgRSM9TdigmtrzFV/rK8sYrRUlct6kzjlFqcuSpj3tomIs0pt79Hzclysvdc9d5kl819pWOSfJ3FZpJ99rPRnM/4Ajch97oZG9g/+/fm8F/1Z23jdWbwPGZNJJDWBqvC5A1TfuItmDb73qYDAag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gd6mJyucktj4eHkDUEAdY/fRlIq7IerTK19DgamhC7u156I+R9z85EpXqr2kYGJszkCxwNL0a9552VlRaUkWez4eOL3OSmZKn2/jW1cCky0+N8+G1AEfBKA0XzRi+TDx5PDIswcLj7qLbI0R6nZ2mns602Yb3hfFojKRb65L+vC2y8XqPF0WRQ41DjpYx7pP932n9F9i45SqD33ruNAJh0esriVgCbASZyd8bnQztuk/vsulqnOJOslxDY8p4qn3C37gAWLYsEqbudYHc5TfrPQxex1UiNeddDJEOzyDlfnSjXKvOfM0vRPv7j+L+7Wv3lIp2XGpNsE1fcoIPpxnbh63f+oBkhPVaD7wpeZ8t+8RdKUFdeuwb9NRz1sRZMfgL1KliyenSR+g1z7GMnId3h1DSTK6SrXa6NyOmzoS0jo8fRCjMA/AXA9A1ijd3Ihh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 14:33:17.4635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc35ecb2-4f0e-4099-8827-08de9644f0da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249
X-purgate-ID: tlsNG-d25034/1775745201-FF547A3D-85C9FB0A/0/0
X-purgate-type: clean
X-purgate-size: 785
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 3363E3CC125
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 09/04/2026 15:50, Oleksii Moisieiev wrote:
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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


