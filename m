Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIJ/AzKu8WmwjgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 09:07:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6275A490367
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 09:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297003.1573130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHybl-0003Jr-Kj; Wed, 29 Apr 2026 06:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297003.1573130; Wed, 29 Apr 2026 06:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHybl-0003HC-Hh; Wed, 29 Apr 2026 06:41:17 +0000
Received: by outflank-mailman (input) for mailman id 1297003;
 Wed, 29 Apr 2026 06:41:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wHybk-0003H4-JP
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 06:41:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHybj-00AXRd-0c
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 08:41:15 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f1a808-5cb7-0a2a0a5109dd-0a2a4509d28a-18
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 08:41:14 +0200
Received: from [40.93.196.36]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f1a808-2497-0a2a45090019-285dc424dee6-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 08:41:14 +0200
Received: from BL1PR13CA0123.namprd13.prod.outlook.com (2603:10b6:208:2bb::8)
 by CY1PR12MB9602.namprd12.prod.outlook.com (2603:10b6:930:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Wed, 29 Apr
 2026 06:41:09 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::91) by BL1PR13CA0123.outlook.office365.com
 (2603:10b6:208:2bb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 06:41:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 06:41:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Apr
 2026 01:41:07 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Apr
 2026 01:41:07 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 01:41:05 -0500
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
 b=BkMX+NSrirQgoAhR1LIJ7kUqxW4w1hUcm7dEd4fFT4InzTusnXmmDAyqj8Zs3E+eDRoeCJuVscyRwXi65W/vwjPHynhLKRtX93Aqy6LtsVU1734xM7la8fGWMblin+vPGa0eOIVJtL7BMip3/cimhhI61hQmQIUaG4kdU35H/huv/Xs+ZmWkthL5yyduBOREJHDVUQJedVXhnfXgWIFlc4sNdnmfJOmkHQWE3u2/ja2LkU/50df5hw0ocBAHbgx8CkoQR+Drtsi3EsEyeJIQ/mvUksY46wpuJzpYyLNHZWgGhtoN7pmoDXdmlPZ9mSwO9rm47wQ+CweijJgNy6n9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svu0MiN1dbFWA9U1YJpZjZAl8F2imVtLTYcZjjBwVFI=;
 b=f4CbxJtlABdmBs0Y41It3TyMlUS3cVcOTmLIQQCJ8pPqCC9jLwZBRQoZvgK+nfvWuvtn26C6Ex6IyANySf4PxwyWzJkDH7CjZQtvMtnMcTrdq6mFY/U7j53GihI8Dq8BowKawYpVbOimtd5MHxIbZkWFHc4uTMm9hJ/Adrp+5EiWB0KDmqN9YEEf99zwn25L6rFk86QJ2tN2yNcR1C872G4nNrTw9C7mIzDvcL0L0XCgCpBkWQCXatOGOOX8PcZ78j+lLkHaEydZuYiWK24rrnC9AahZzwAun2vdqlqIVUDnQhC4lzSF/Ap0IwGdThYTj4p/GkogmlD5OQLcPYaypQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svu0MiN1dbFWA9U1YJpZjZAl8F2imVtLTYcZjjBwVFI=;
 b=VLcsJEPOJY3kn8ZIv+kHOssUotFhVo6zxs3xcA8yU0dPJeofK9jQuDDkimvNwpNr5+eY5K1BCxN7KUSEqKFiuQrfcz8vzpO3GSjjdgFIBXuOE7P1s+DeU64vRrB6SJE/M0jPsTUNXQUWLf1NVT56k2pQLNpK9jyYThq59rOFPaA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <088730ce-a04e-4ddb-9e7c-8015fe7e96bf@amd.com>
Date: Wed, 29 Apr 2026 08:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] dom0less: various updates
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <cover.1777296786.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <cover.1777296786.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|CY1PR12MB9602:EE_
X-MS-Office365-Filtering-Correlation-Id: 854828dd-c9a2-4509-083e-08dea5ba4bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|22082099003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	KDBj/4DPwVUKXq3hTAxVE1+E6hDQbtZxUlIWVMBxV2AH1EM90AV5PpOSY8Sg7mX63r/LFcKrYzWfAQ/ARZpcLYwS0gFNYX0i9i8D1Cpw7SXdDo7oWLuyCcZadbpgxhs50RLXK7MEKcRT6INcqk1+Dnl3jjz5j8+LdCSpOy6uxP6NKm5s0J94yed/I5y6Pr6ffxsoaYP5WLbImhQl+O5RGCFxTbGNRmxA06DIiV/d9rjeWBRDa7CluE3ZPmiL6jCj6aFhOz2XtvDQ5qWqpu8+QdLfsqZR1bSyBParLYUSZMlljYu8OPpNj+RFbSHulm9aLEpAXDEVba0NOLDoLtCrBBJ/9rpbns6vUhROFrRoP5RpZbL/IQExD1HDclx1aLnn5J8vcLD2AQKqIN24fh5C/KzkhItM8G17B+Tix3yvkoRVQAZhWfy7Ify1kWdiov+msFTguvHl3fkDb5XWNtfFJQy28QMR0bhmhyme4rvEYLE+jEo45cWZQRQQ9wYFyEzgjpZX5PmY6WHUnRnb1lBvZbrOkHXa3JtkZK5+g7X2GGTYptw7mOdlJY3dck+SbE7sOWrK1RZD0z9EfhBvQggy2WSw1Tnz3BrwXa9i+yDpLVmFR43mgkKQ95uN63/QXrEcqgj2QdmEkpKWZFIa0HBXO9NIlUzgRdApp8EEA7z/tgY+yZYNrP4Qb/xkmpXdsihdP6KXRbBB/DS8Xshs8/044q4wbWpgPyjVUFqqSbnovYs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HKif+WZoMjrEOXGC4r7IxoNsOlohGQ2iSZoAqjXA21zN+PhRKxbJ/b/hXGl5te5MIsVntKXIf1h6h+nr8dwj4R3ZbtFVEnKWcWfHUGzAPNpCBYnNh/vUUiiNUI3hdA3d0NOBINDMKC6ORe+DkmWOL0wfNDayU892gygEW9G3m2zpYq1xIP9hJrVYAtCX2Iq1Je29/62BLJKhicLvfMYqaSJdWiDhpOb5PbmQ4JBmzEMjKlALAhF+BC4gzTlK0vjBn41ajixRiYGHpa24zh9X1Sfv8YmC6BKeMlbFSC6uvU/wJTaRL4uKzx/AejXnWn0FgPknbUWF4bE95A0+JMJsBw5mMz74B4JQnk352W58CnFqVHBIEfSCbP6XMOyladlyGt+QFx903H36ocXLO3mXkr9009lx9pddUzPpvWOpsQj4OwL5UCWSHUa2DRgbooV6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:41:08.9339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 854828dd-c9a2-4509-083e-08dea5ba4bf1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9602
X-purgate-ID: tlsNG-bad1c0/1777444874-93F7EA53-A22CDC16/0/0
X-purgate-type: clean
X-purgate-size: 4471
X-Rspamd-Queue-Id: 6275A490367
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.81 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[amd.com:s=selector1];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[amd.com,quarantine];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_SPAM(0.00)[0.999];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_ALLOW(0.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.171.63.0:email,amd.com:dkim,amd.com:mid,0.0.0.0:email,d000000:email]

I committed the first two patches. I decided to wait with the third patch for
Jan as he was the one with the most remarks.

~Michal

On 27-Apr-26 17:34, Oleksii Kurochko wrote:
> This patch series introduces a new field to track not-yet-used phandles as there
> are some use cases where RISC-V needs to know which phandle number could
> be used for generating a device tree node.
> 
> For example, on the RISC-V side in make_cpus_node() [1] it is necessary to know
> which phandle number is unused to use it for device tree node generation.
> 
> Here is an example of generated guest DTB:
>     cpus {
>     ...
>       cpu@0 {
>     ...
>         interrupt-controller {
>           compatible = "riscv,cpu-intc";
>           #interrupt-cells = <0x1>;
>           interrupt-controller;
>           phandle = <0xfdea>;
>         };
>       };
>     };
> 
>     /soc/imsics@28000000 {
> 
>       interrupts-extended = <0xfdea 0x9 >;
> 
>       phandle = <0xfdeb>;
>     };
> 
>     /soc/aplic@d000000 {
>     ...
>       msi-parent = <0xfdeb>;
>       phandle = <0x1>;
>     };
> 
> Note that phandles for imsic and riscv,cpu-intc are generated in this example
> not by get_next_free_phandle(), that is why they have such big numbers.
> 
> For non-RISC-V people, APLIC is an interrupt controller (something like GIC in
> Arm), IMSIC is an interrupt controller that provides MSI and connects to
> each CPU.
> 
> So (based on the DTS above) for APLIC, kinfo->phandle_intc is reused, which
> will also be re-used for the device node's interrupt property. For all others, I
> just introduced GUEST_PHANDLE_LAST [2] and used it for generation [3]. But I expect
> that it could be useful for other architectures too so I just moved it to common
> and re-use pfdt to understand what the maximum used phandle is.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/riscv%2Ccpu-intc.txt
> [2] https://lore.kernel.org/xen-devel/ccd6d21b224b478c88ca5f2fdd2d1dd507671510.1773157782.git.oleksii.kurochko@gmail.com/
> [3] https://lore.kernel.org/xen-devel/fd64b8526a23e9d7775b9b48c5a933b0673c4fba.1773157782.git.oleksii.kurochko@gmail.com/
>            *************************************
> 
> Another thing introduced in this patch series is moving domain type to common
> code as several architectures (ARM and RISC-V for now) use them and it
> looks pretty architecture-independent. Also, is_64bit_domain() is used by
> dom0less common code, so I found it useful also to move is_{32,64}bit_domain
> macros to common code.
> 
>            *************************************
> 
> And the last thing is changing the prototype of make_cpus_node() to be aligned
> with other make_*_node() and since RISC-V will need access to the free_phandle field
> (even if it will be moved to kinfo->arch.free_phandle) and for the reason that
> this ->free_phandle is updated in make_*_node(), the kinfo argument is passed as
> non-const.
> 
> CI: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2482499536
> 
> ---
> Changes in v4:
>  - Rebase on top of staging.
>  - Add Review-by for patch 1 and 3.
>  - Address the comments.
> ---
> Changes in v3:
>  - Rebase on top of staging.
>  - Address the comments.
> ---
> Changes in v2:
>  - Address the comments from ML.
> ---
> 
> Oleksii Kurochko (3):
>   xen/dom0less: introduce next_phandle in struct kernel_info
>   xen/dom0less: pass kernel_info struct instead of fdt to
>     make_cpus_node()
>   xen: introduce CONFIG_HAS_DOMAIN_TYPE
> 
>  xen/arch/arm/Kconfig                    |  1 +
>  xen/arch/arm/arm64/domctl.c             |  4 +--
>  xen/arch/arm/dom0less-build.c           | 14 --------
>  xen/arch/arm/domain_build.c             | 17 +++++-----
>  xen/arch/arm/include/asm/domain.h       | 16 ---------
>  xen/arch/arm/include/asm/kernel.h       |  4 ---
>  xen/arch/arm/kernel.c                   | 16 ++++-----
>  xen/common/Kconfig                      |  3 ++
>  xen/common/device-tree/dom0less-build.c | 45 ++++++++++++++++++-------
>  xen/include/xen/dom0less-build.h        |  2 --
>  xen/include/xen/domain.h                | 13 +++++++
>  xen/include/xen/fdt-domain-build.h      | 17 +++++++++-
>  xen/include/xen/fdt-kernel.h            | 11 ++++++
>  xen/include/xen/sched.h                 |  4 +++
>  14 files changed, 98 insertions(+), 69 deletions(-)
> 


