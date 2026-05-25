Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHKzEQX8E2puHwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 09:36:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0095C732A
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 09:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319069.1586821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRPqP-0005lP-FL; Mon, 25 May 2026 07:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319069.1586821; Mon, 25 May 2026 07:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRPqP-0005jX-CZ; Mon, 25 May 2026 07:35:25 +0000
Received: by outflank-mailman (input) for mailman id 1319069;
 Mon, 25 May 2026 07:35:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wRPqN-0005jR-K1
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 07:35:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRPqN-00CqiB-07
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 09:35:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a13fb99-5cb7-0a2a0a5109dd-0a2a450584dc-30
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 09:35:22 +0200
Received: from [40.107.208.60]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a13fbb8-aaa8-0a2a45050019-286bd03c0b3b-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 09:35:22 +0200
Received: from SJ0PR13CA0220.namprd13.prod.outlook.com (2603:10b6:a03:2c1::15)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Mon, 25 May
 2026 07:35:14 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::60) by SJ0PR13CA0220.outlook.office365.com
 (2603:10b6:a03:2c1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Mon, 25
 May 2026 07:35:13 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 07:35:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 02:35:12 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 00:35:12 -0700
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 25 May 2026 02:35:10 -0500
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
 b=HtIBscLcW0QblFW/PCsCd+bY6YAMIvnN1xx08ufn06DmnmuajSZPMeT2EDouZTr4m4WRFAZ1SjMlEQ/wVP7Qp83OdUHGEsQ4ng0XVNkKWcgLoCfyDpbDeZTCaKhLh3OW2YVsh7/gupk+hYVjdaXv67QSSbAA5ujxeXJ1Yyn8rzSpZojzAmLMKLgJLw+mN31oi2mBiIhQAImOEY86vhKe+u7EDZojECM27W0N9VgRHK6mpPEsJeDg8dELOrxejXE1blyeZz9sohuW7YHlgLdStW903b13yNfQ4OBFipKplrlzFSrVyPuos2Mdi5WJknfyxtr36/gBF/GtfxRTk7OhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dttcNPH6bZXUjF0roJGm1BUQZ+bNSQulkSrbgFSYqgE=;
 b=ex8FZsjj9AxiBCng8RA00rBm4RjEpvEvH6hDAziNTHa3Q9psB64yMJtSb3Ih221QyLFnrQZfR9JjMTmy5D53L2ej5am5ccAPSbMpnZf18smSqPQOowo/imGXV9kxwEpSQiGAO1XDAEj5kZBYPahEROTpqscMDYJH3BvG7M7AcT0TaD4NMGYGvM6KxGz/GpG63VAaFiVZ5z4snYVyDz677CPFWNJWyUuO0CkrRGlhNXQJi2e/RB2/dSpa+svOJYrYZty9c23IJji1dwz3AXRsyKt8DhCuKHjHKnRz+KJZUhQtAFN0sp4SmkCYcGm0tnXMjVTKFc2iTS6BGMpIDoUNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dttcNPH6bZXUjF0roJGm1BUQZ+bNSQulkSrbgFSYqgE=;
 b=IISWf3seErDgybuYNVj88hSqFbWSx+QJcmzU/bUUkbaF0GH/UD8EW1pyr8u0SR3VUzR71tib9S/HYh/1DHnrxXH4uIqethxB9idRor26sAVAoiXI2wkvndMzJeMPXrC8EeG/BzEoVXm+OEdZvKMiUDJFcQa06QGpbZftURiVFek=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0db37c10-b920-4d9d-9453-18f820e6d093@amd.com>
Date: Mon, 25 May 2026 09:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] device-tree: size first hwdom bank for boot modules
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|MN0PR12MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: e60f1b6b-f079-41f2-6fe2-08deba30288c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|18002099003|56012099003|22082099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	FYvt/uM4a5MGpAueyFh3Sc7ihFhjRdJWAY1qNXr8jmj2Ap6yYAfuswgfZ/mmnWeHZ3e5RXOtHwhESqRFL6iUyU9adYTHWNr88ZRY2cNds/lSHoP7AOXudojtQVOteQemTMDFDNBL4OlgF+BNMEHW6UWMdrRHB4g2j1RJXVtJVw0gtz5trR869YjHPePNr0fNuw77akYOh07Y1QOuE/m9vXenKjdfk1YONeaJzKTuZFTWQOSGPmMf9uVAFYq0sVUVUcos9LH1M52Fug/sQCeSPdpWJzm9AQw2SlPmk+8Qg6/cngTaKHwIUGZWIJZIjHurdb7liOEQFO8X7BbDjgcXCjhOg+xF+wZg1H17y5FgnMgU6JzoBIT7Bk0zuoEizAphM5bTeOBVaxjpqwLP0/427btoxQ3FkV2oSyQ+HJI5GBk8AwDZClyptJzJ+LzBgzbrom0bBxWA5062IH0+NhJhZSma2aiNdmLWwCxjSvOcj6NaEz686aLgQc7cniIlIMU/npxGabr4LnJqmI2Kp8+NGaJ+M3f/fF9D1SphF72mMyARWhccHtaNEP8azYNfcoD4+VP9qq5I9sUtQpgIjlG5weGXxBUUb0K0UNjzaBlSpvF6SqEII+g2atmVh5MiWj9WTStAPcdLtsdJbJnGnHqBQiH8GUC8am3gZZp/PqxTIGNV6p2yQf+Y1cnu2oZBgBF6bKiSLyzQrJUp5RLH1WfosrWJ0zgNkXlsTiPTfFj8V8c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rCPl0twHbZcKbZ0RwSejhSLsn4mI2Wmu5GEhpDy0aK5FgUot6ONMPl1aJcn8Cmfy76fv+D2oVHIvs0nWadZamUDK/3IaUWowple8ufQmifPtxMAXq3xUL+Tr/FejfvRq/DYD7BuaBbiqMopAxTyo/rQnWw18vpAwEe1CkMG0FLhudjqCan8fFw6Gp9g+V/8jTR8RiTjJ7WVAaLEMGKaYzg6mOc39GoMjT3ItDjbChDxFnuIZdly5YbF/2khhjUFHEyFOuFGVhQmp+TjvIqWO0QLNhwYOke1D+1MiWB160HX9jwW/leK3Rw9/a8F7PDmesF/kdsGD5ofs8Aj1nQchZezR1I/fc5Qc6V6r6qxurCQp9v1wolJpCmj9984fkY7LSUvyl4vRpofXy03SHc6gc+6Y0YPa7PrcBjdphfp9IbHEewLWCc8cZhNuJO70ab02
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 07:35:13.3330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e60f1b6b-f079-41f2-6fe2-08deba30288c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198
X-purgate-ID: tlsNG-c201ff/1779694522-D8D7F443-0C2D15C1/0/0
X-purgate-type: clean
X-purgate-size: 11927
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 7F0095C732A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 17-May-26 22:57, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> With LLC coloring enabled, the hardware domain memory comes from
> allocate_hwdom_memory(), not from the fixed direct-map banks used when
> coloring is off.
> 
> Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
> DMA") made that allocator sort free host regions by ascending address so
> Dom0 gets DMA-capable low memory first. The first bank filter still only
> required 128MB. That can select a low region which is large enough for
> the heuristic, but not large enough for place_modules() to put the Dom0
Don't mention dom0 given that this is purely hwdom path.

> kernel, generated DTB and initrd contiguously in bank 0.
> 
> Ask arch code for any additional first-bank size requirement. On Arm,
> compute it from the actual Dom0 kernel placement, rounded initrd size and
> generated DTB size hint. For 64-bit Image kernels, include the text offset
> from the candidate bank start, because the returned requirement is compared
> with a bank size measured from that start. The hint covers both the normal
> Device Tree path and the minimal DTB created for ACPI boot.
> 
> Check the first-bank threshold against the size which will actually be
> assigned to Dom0, after capping the host region by the remaining unassigned
> Dom0 memory. Otherwise a large host region could pass the test but still
> produce a first guest bank too small for place_modules().
> 
> Use the typed min()/max() helpers for this normal allocation arithmetic;
> MIN()/MAX() are intended for preprocessor-style contexts and skip the type
> checking provided by the lowercase helpers.
> 
> This keeps the DMA-oriented allocation policy from de99f3263555 while
> preventing a too-small bank 0 from reaching place_modules().
> 
> Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for DMA")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Test/setup notes:
> 
> The failure was reproduced on a Renesas H3ULCB/R-Car H3 (r8a7795)
> arm64 board booted through U-Boot/TFTP and using huge initrd.
> 
> Relevant Xen command line excerpt:
>   dom0_mem=2048M llc-coloring=on
> 
> Boot module layout from Xen:
>   MODULE[2]: 0x0000000084000040-0x000000008e75d92f Ramdisk
>   MODULE[3]: 0x00000000a0000000-0x00000000a3ffffff Kernel
>   MODULE[4]: 0x00000000a4000000-0x00000000a400ffff XSM Policy
> 
> The initrd is about 168MB. With LLC coloring enabled and the low-address
> allocation policy from de99f3263555, Dom0 can receive a 192MB first bank:
>   d0 BANK[0] 0x00000048000000-0x00000054000000 (192MB)
> 
> That bank satisfies the old 128MB minimum but is too small for the
> rounded Dom0 kernel, generated DTB and initrd placement. The observed
> failure before this patch was:
>   Panic on CPU 0:
>   Not enough memory in the first bank for the kernel+dtb+initrd
> 
> With this patch, the same boot skips the too-small low region for bank 0
> and reaches Dom0:
>   d0 BANK[0] 0x00000057000000-0x00000084000000 (720MB)
>   d0 BANK[1] 0x0000008e800000-0x000000c0000000 (792MB)
>   d0 BANK[2] 0x00000500000000-0x00000521800000 (536MB)
>   d0: extended region 0: 0x48000000->0x54000000
>   Loading zImage from 0x00000000a0000000 to 0x57000000-0x5b000000
>   Loading d0 initrd from 0x0000000084000040 to 0x5f200000-0x6995d8f0
>   Loading d0 DTB to 0x5f000000-0x5f011c80
>   Linux version 5.10.194-yocto-standard
> ---
>  xen/arch/arm/acpi/domain_build.c        |  2 --
>  xen/arch/arm/domain_build.c             |  8 ++++++
>  xen/arch/arm/include/asm/domain_build.h |  4 +++
>  xen/arch/arm/include/asm/kernel.h       |  8 ++++++
>  xen/arch/arm/kernel.c                   | 35 +++++++++++++++++++++++++
>  xen/common/device-tree/domain-build.c   | 27 ++++++++++++++-----
>  xen/include/xen/fdt-kernel.h            |  8 ++++++
>  7 files changed, 83 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index 249d899c33..db16f7fa94 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -26,8 +26,6 @@
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>  
> -#define ACPI_DOM0_FDT_MIN_SIZE 4096
> -
>  static int __init acpi_iomem_deny_access(struct domain *d)
>  {
>      acpi_status status;
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1efddc60ef..226e053c68 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -115,6 +115,14 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>                               (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
>                                (NR_SHMEM_BANKS * (160 + 16)) : 0))
>  
> +paddr_t __init dom0_get_fdt_size_hint(void)
> +{
> +    if ( !acpi_disabled )
> +        return ACPI_DOM0_FDT_MIN_SIZE;
> +
> +    return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;
> +}
> +
>  unsigned int __init dom0_max_vcpus(void)
>  {
>      if ( opt_dom0_max_vcpus == 0 )
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index df8b361b3d..45687c5d6f 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -19,6 +19,10 @@ int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
>  
>  int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
>  
> +#define ACPI_DOM0_FDT_MIN_SIZE 4096
> +
> +paddr_t dom0_get_fdt_size_hint(void);
> +
>  #if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
>  /* Utility function to determine if an Armv8-R processor supports VMSA. */
>  bool has_v8r_vmsa_support(void);
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 21f4273fa1..17c5b9bce4 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -8,12 +8,20 @@
>  
>  #include <asm/domain.h>
>  
> +#include <xen/types.h>
> +
> +struct kernel_info;
> +
>  struct arch_kernel_info
>  {
>      /* Enable pl011 emulation */
>      bool vpl011;
>  };
>  
> +#define arch_get_min_first_bank_size arch_get_min_first_bank_size
> +paddr_t arch_get_min_first_bank_size(struct kernel_info *info,
> +                                     paddr_t bank_start);
> +
>  #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index b72585b7fe..3644663e2f 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -128,6 +128,41 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>      return load_addr;
>  }
>  
> +static paddr_t __init kernel_placement_size(paddr_t load_addr, paddr_t len)
> +{
> +    return ROUNDUP(load_addr + len, MB(2)) - load_addr;
Used from one site. place_modules() open-codes the same
expression; the CONFIG_HAS_DOMAIN_TYPE branch below is
kernel_placement_size(load_addr, len) + text_offset. Either drop the helper or
use it consistently.

> +}
> +
> +paddr_t __init arch_get_min_first_bank_size(struct kernel_info *info,
info is RO, so const please.

> +                                            paddr_t bank_start)
> +{
> +    const struct boot_module *mod = info->bd.initrd;
Why mod instead of initrd? - choose more meaningful names

> +    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
It would be nice to explain why 2MB, at least to say that it mirrors
place_modules rounding.

> +    const paddr_t dtb_len = ROUNDUP(dom0_get_fdt_size_hint(), MB(2));
> +    paddr_t kernsize;
> +
> +#ifdef CONFIG_HAS_DOMAIN_TYPE
> +    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
> +    {
> +        paddr_t load_addr = bank_start + info->image.text_offset;
> +
> +        /*
> +         * The caller compares this value with a size measured from
> +         * bank_start, so include the text offset before the kernel.
The comment belongs above the load_addr line above.

> +         */
> +        kernsize = ROUNDUP(load_addr + info->image.len, MB(2)) - bank_start;
> +        return kernsize + initrd_len + dtb_len;
Could it be written as:
info->image.text_offset + kernel_placement_size(load_addr, info->image.len)

> +    }
> +#endif
> +
> +    if ( info->image.start == 0 )
> +        kernsize = ROUNDUP(info->image.len, MB(2));
> +    else
> +        kernsize = kernel_placement_size(info->image.start, info->image.len);
This could be written as a single expression, no need for if/else:
kernsize = kernel_placement_size(info->image.start, info->image.len);

> +
> +    return kernsize + initrd_len + dtb_len;
> +}
> +
>  static void __init kernel_zimage_load(struct kernel_info *info)
>  {
>      paddr_t load_addr = kernel_zimage_place(info);
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index 2a760b007b..d8865db259 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -299,20 +299,33 @@ static bool __init allocate_hwdom_memory(struct kernel_info *kinfo)
>  
>      for ( i = 0; (kinfo->unassigned_mem > 0) && (i < nr_banks); i++ )
>      {
> -        paddr_t bank_size;
> +        const paddr_t bank_start = hwdom_free_mem->bank[i].start;
> +        paddr_t bank_size = hwdom_free_mem->bank[i].size;
> +
> +        /*
> +         * Check the size that would actually be assigned, not just the size
> +         * of the host region.
> +         */
> +        bank_size = min(bank_size, kinfo->unassigned_mem);
>  
>          /*
>           * The first bank must be large enough for place_modules() to
>           * fit the kernel, DTB and initrd.  Skip small regions to avoid
>           * ending up with a tiny first bank.
>           */
> -        if ( !mem->nr_banks && (hwdom_free_mem->bank[i].size < min_bank_size) )
> -            continue;
> +        if ( !mem->nr_banks )
> +        {
> +            paddr_t arch_min_size;
> +            paddr_t required_first_bank_size;
> +
> +            arch_min_size = arch_get_min_first_bank_size(kinfo, bank_start);
> +            required_first_bank_size = max(min_bank_size, arch_min_size);
> +
> +            if ( bank_size < required_first_bank_size )
> +                continue;
> +        }
>  
> -        bank_size = MIN(hwdom_free_mem->bank[i].size, kinfo->unassigned_mem);
> -        if ( !allocate_bank_memory(kinfo,
> -                                   gaddr_to_gfn(hwdom_free_mem->bank[i].start),
> -                                   bank_size) )
> +        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
>          {
>              xfree(hwdom_free_mem);
>              return false;
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index 8cd1670c2c..931b3e1686 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -86,6 +86,14 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
>      return container_of(&kinfo->mem.common, const struct membanks, common);
>  }
>  
> +#ifndef arch_get_min_first_bank_size
> +static inline paddr_t arch_get_min_first_bank_size(struct kernel_info *info,
> +                                                   paddr_t bank_start)
> +{
> +    return 0;
> +}
> +#endif
> +
>  #ifndef KERNEL_INFO_SHM_MEM_INIT
>  
>  #ifdef CONFIG_STATIC_SHM

As for the upstream CI test, we should start with more generic tests that we are
missing (like regular LLC boot) before thinking of covering more granular
scenarios. Also, in the past we agreed on first covering the supported features
before adding tests for unsupported ones.

~Michal



