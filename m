Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM+MJHpWDWr9wAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 08:36:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB0A588375
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 08:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313591.1583721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPaXa-0002vZ-SO; Wed, 20 May 2026 06:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313591.1583721; Wed, 20 May 2026 06:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPaXa-0002tN-Oi; Wed, 20 May 2026 06:36:26 +0000
Received: by outflank-mailman (input) for mailman id 1313591;
 Wed, 20 May 2026 06:36:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wPaXZ-0002tH-56
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 06:36:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPaXY-0090CG-3N
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 08:36:24 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0d5661-bab6-0a2a0a5309dd-0a2a4505b10e-18
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:36:23 +0200
Received: from [40.107.209.3]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0d5665-aaa8-0a2a45050019-286bd10346da-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:36:22 +0200
Received: from SJ0PR05CA0189.namprd05.prod.outlook.com (2603:10b6:a03:330::14)
 by DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 06:36:12 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::a3) by SJ0PR05CA0189.outlook.office365.com
 (2603:10b6:a03:330::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 06:36:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 06:36:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 01:36:11 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 20 May 2026 01:36:09 -0500
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
 b=l758DIyqHJpxDuePf6OCB9uSwhnLmNZXvxA7mldA+NwgMGQBR7SJrp2yRFRS4nuesf+jJfAyqQ0b6bG9fr4dywTpWtpFKNVDqvjJY8xxmb1TSTrv19Obo9mKVP0kRZ9iODJUIxZzK4oNeLtGweGSE8amDvRy8UoqbpmseYVGTq4+sg/tpV8x/BE3tU2R3a4bLi+8kQrbMYwJutg8LxJOF3jIFblJZePJL7Mh71e+udbkb3XuX2I2RKpGMy4hPyjrWzfzcAerWK062Sxl9ncmDYO7OmIZwboePZ9/JgnLfdjsXbrnRbQS8dRiP6jsI+a+B+bmihJgl8Ap5Di5DVJA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvAcfWRUYQFO1jzSlAxMX11eA0rQiDt6l5Sm/FanEY4=;
 b=coTuJOL4GlHIDvafyUnGQHFgeu/959rtPuy2JB1vtLEHQYM7cN8Mt4raFB/3Exs7FZi8CsPzaonX3BkrzhMlavxkhQ7B6CdwCOXyaldN6GskOxbbgNZcAxwjGeTgt5mma2Emzyn7lAl6hwpYBwgQ5TC1Y6Mzzdic5VOORrFfAOfpyhCR4JhKrZgcslZ2lqCyHW76yurJVf38ij0t85sGfWiLau2kxbUOyXUNrjga6Tyj8OAydhhFQiLZDArZxK+hzwPkThCxV3Afyuv/rIAucUCwRDyz/J0l1OJ15zoo8m/H11/dpIYQjnyIUBm14ZM+F0azeb0rTQI6OYeUrh+26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvAcfWRUYQFO1jzSlAxMX11eA0rQiDt6l5Sm/FanEY4=;
 b=bjBFtTPSx/PVMYx/fQFXMR2qrnzo5DjRQpa+glvCVdp0CQi6ydXWWqSZlFgHQ2+WhMhfI1RfFzvjbkNQd/0WEw6dJGU0fZW+8aoDPhmCa620Jr3BmgKwUEI1gQzjWi0EMJLc5znJQ18AnBgDPgL6tZTlc/rou9nycjxC9CSMXZ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <5a74b63a-0312-4992-abca-4ba54110426a@amd.com>
Date: Wed, 20 May 2026 08:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/6] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 support
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Juergen Gross
	<jgross@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1775493499.git.oleksii_moisieiev@epam.com>
 <26f52f4a-a830-4430-b0c1-9ca7f761515e@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <26f52f4a-a830-4430-b0c1-9ca7f761515e@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f528bcb-37b5-40d9-d6af-08deb63a157d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|13003099007|22082099003|56012099003|4143699003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Fs9PEXawg3OAqAe63XiRpCDkECQOe6vtTIs4Y5bZANtxr4RphNqxsIlRSrB9rM2w9N7SpmT1YIB/tWLYnvnv6hp27gzJ7Dh4m+oF3ruUfOJGx8iPmNQ3ojFoBEeh0tdaW45OnNuA4uTxfEwNCEJdch5bb9VagAhfGFq1U+1X4gY9Z++Vqsa9bZHTe4SGv3j6xucHe63/aI/IKDmLZ1JHjZi/xjdyZD+lbZY6XBVDrV4sBSxVODn1pZnyV0CzML6wmZZl8jQvPi0RFrmZoeufRLWzOybXQkqqGyY6y15fu7l7uxiPPwJ+FHcSBWyeVBb/kdsUOzsYFNt0vv4t9fM8S5HQ2LnY4nnjcnDAqz1nC+jNEy7eZ7VytJCfNTgM+PRipMXLp2JAbhD1U63tBoCqWNuL2lw2aELpL8pDGhdxujuic8pQAoiVwrn/wuEBODX2tK+Hm9N+3+JsbCRyx1rI9807XVdkfOLVf+n7ncLHLlk/W6eafQAz9MaMBGFyQI411aXv4Gq4Nxjk9erVUNrW6oLLXWw+yp7fE2CavJWYHrHolzwwBQcUwgicjXnBzjie6unwYb1SnsI2CAyrdIPBGDmeeyLw4sv5LeROQn0eA3xI5r4qowT7J+AIUKX3av4+0Kt79JNaefFvrzAxPuhMFDrnxVkWU5/HSOEHJVhyF44cZg909pVseTw9tsXagl4r/x2MHxXssJiuvz1XDWX79WFH5X5qEMWEfTwX2leS/ps=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(13003099007)(22082099003)(56012099003)(4143699003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z4gSF1VhMCmYzgw6j89VE8jPePDmfCSFSk+EMlw4vmvV2m5OZYGblBz5ZI/t4D80ltYFF7ASiT8w5MLUFzo5l3q33ROiNpQONExsWa5VvUh9PptX2egf1gP/eYOC0xkBCiCyh6A7sG4S0Fe5mv74VTDh0vF5U63NcgU4bPEgjs7ikFRLF+E22rPsZY/twGv4KBAK3rwXZGHiUOKc7fq9JvYAeeGmWF5RElRCOSRqgzHaOaGEpe9nxuP6KBRmxwzrgxmrjCHpzz6aVT4t9ZOt5whgPIyXXpr8FO1feLSp4vsgAH002ooGbWLIau/zK8a0YHlL4udcnKKrnk2IbBi/1ce0Tqj52ggXTGfAZ00k4qAX/9QN/a3lpq1lzvo5HroEr92B27QmJUPMbgwFY8Lo475uQ/0F5zeiTDFEx8qpWdnfc54iUFtiSnullB/nVzVB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:36:11.7297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f528bcb-37b5-40d9-d6af-08deb63a157d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327
X-purgate-ID: tlsNG-c201ff/1779258983-D8F7E443-CAB49AC5/0/0
X-purgate-type: clean
X-purgate-size: 17525
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii_moisieiev@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:mid,amd.com:dkim,support.md:url,arm.com:url]
X-Rspamd-Queue-Id: BFB0A588375
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksii,

On 19-May-26 18:31, Oleksii Moisieiev wrote:
> Gentle ping for this patch series.
We are past the feature freeze, so we now focus mostly on bug fixes that can
still go in. Other series need to wait for a new dev cycle unless someone finds
free time.

~Michal

> 
> On 06/04/2026 19:39, Oleksii Moisieiev wrote:
>> Inroducing patch series which includes implementation of the SCI SCMI
>> SMC multi-agent support.
>> This patch series follows RFC v5 [3] series which was introducing both
>> SCMI single-agent and multi-agent support. After the discussion it was
>> decided to split features and upstream singe-agent support first. This
>> feature is merged for now to v4.21-rc2.
>> I'm starting this patch series from v6 to save the discussion history
>> and don't break changes log.
>>
>> Patch - xen/domctl: extend XEN_DOMCTL_assign_device to handle not
>> only iommu
>> - add chainged handling of assigned DT devices to support
>> access-controller functionality through SCI framework.
>> Change was done in two parts:
>>   - call to sci_do_domctl() to do_domctl()
>>   - update iommu_do_dt_domctl() to check for dt_device_is_protected()
>>   and not fail if DT device is not protected by IOMMU
>>
>> Patch - xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
>> - add Xen-specific SCMI container compatible `xen,sci`
>>    under `/chosen/xen`; Xen binds only to the `arm,scmi-smc` inside it and
>>    ignores other SCMI nodes (e.g. under `/firmware`).
>> - add `scmi-secondary-agents` and `#scmi-secondary-agents-cells` to describe
>>    func_id/shmem/(optional agent_id) tuples for secondary agents.
>> - each guest using SCMI supplies its agent_id (dom0 via
>>    `xem,dom0-sci-agent-id=` parameter in xen,sci compatible node,
>>    toolstack via `arm_sci = "type=scmi_smc_multiagent,agent_id=..."`, dom0less
>>    via `xen,sci_type` + `xen,sci-agent-id` in `xen,domain`).
>> - factor out SCMI generic definitions and shmem code.
>> - passthrough configuration for SCMI guests mirrors other HW passthrough.
>>
>> Patch - docs: arm: add SCI SCMI SMC multi-agent driver docs
>> - document the Xen SCMI container under `/chosen/xen/xen_scmi_config` and the
>>    mediator’s binding rules; update examples accordingly.
>>
>> All Xen-specific SCMI configuration now lives under `/chosen/`
>> to keep host DT changes isolated while leaving the host `/firmware/scmi`
>> untouched for Dom0 consumption.
>>
>> Code can be found at:
>> https://github.com/oleksiimoisieiev/xen/tree/scmi_ma_upstrv6
>>
>> [1] RFC v2:
>> http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/
>> [2] RFC v3:
>> https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com
>> [3] RFC v5:
>> https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
>> [4] SCMI single-agent:
>> https://lore.kernel.org/xen-devel/cover.1756995595.git.oleksii_moisieiev@epam.com/
>> SCMI spec:
>> https://developer.arm.com/documentation/den0056/e/?lang=en
>>
>> SCMI bindings:
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
>>
>> Reference EL3 FW:
>> RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
>> Renesas v4h:
>> https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/
>>
>> base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)
>>
>> Changes in v11:
>> - Fix agent_id documentation: clarify it applies to SCMI SMC
>> multi-agent support only, not plain SCMI SMC (reviewer feedback)
>> - Remove "non-zero" from agent_id description to match accepted
>> range [0..254]
>> - Remove "UINT8_MAX (255) is treated as invalid" from user
>> documentation as unnecessary implementation detail
>> - Add LIBXL_HAVE_SCMI_SMC_MULTIAGENT feature macro in libxl.h to
>> advertise the new scmi_smc_multiagent type and agent_id field
>> - Add agent_id validation in
>> libxl__arch_domain_build_info_setdefault() to reject invalid values at
>> the libxl level, not only in xl
>>
>> Changes in v10:
>> - remove unused sci_do_domctl stub from sci.h
>> - removed extra include in memcpy-{to/from}io.c files
>> - Fix tabs in MAINTAINERS file
>> - remove duplicate SPDX tag from scmi-shmem.c
>> - add cast to ARM_SMCCC_INVALID_PARAMETER to settle the sign since
>> ARM_SMCCC_INVALID_PARAMETER is -3 which is part of the spec and resp
>> is the default smccc call structure.
>> - update free_channel_list. Add spinlock to avoid race condition and
>> a comment with a description of the function work
>> - preserve error of smc_create_channel in scmi_probe
>> - check scmi shmem address alignment as wel as it is done for size
>> - check for d->arch.sci_data != NULL in scmi_handle_call
>> - use SCMI_SHMEM_MAPPED size for iomem_permit_access
>> - change len type to unsigned in shmem_{get|put}_message
>> - rename shmem_channel_is_free to shmem_channel_status
>> - add comment about skipping message status when getting message response
>> - Set correct agent_id ranges for dom0less and a toolstack. Agent_id 0
>> is not binded for dom0 so can be reused. Also mentioned that
>> UINT8_MAX (255) is treated as invalid agent_id.
>> - Split hypervisor and toolstack changes into separate commits
>> - move init list and spin init after initial checks in probe call
>> - fix typo in comments
>> - clean resources when sci_register returns an error.
>> - Split hypervisor and toolstack changes into separate commits
>> - rephrase section about /firmware/scmi. Mentioned that this node is
>> taken from Host DT and copied unmodified.
>> - fix xen,reg address for secondary domains for Dom0less configuration
>>
>> Changes in v9:
>> - treat SCI as a gate for XEN_DOMCTL_*assign_device: abort before
>> IOMMU if sci_do_domctl() returns an error other than -ENXIO, instead
>> of trying to propagate SCI errors after a successful IOMMU
>> operation. This avoids partial success and the need for IOMMU rollback.
>> - remove early return from do_domctl() in the assign_device
>> path to keep RCU handling intact.
>> - change IS_ENABLED(*) to #ifdef in sci_do_domctl quard
>> - reword commit description to refer to memcpy_fromio and memcpy_toio
>> - ordering obj-y in Makefile
>> - rename ALL_LIBS to ARCH_LIBS
>> - drop io.h and move definitions to the common header, fix comments to
>> be arch neutral
>> - update comments for memcpy_{from/to}io implementation
>> - sort and refactor MAINTAINERS enties
>> - remove Spurious changes
>> - add extra check to avoid ASSERT when calling unmap_channel_memory
>> from assign device method
>> - set correct tx flag to SCMI_BASE_AGENT_PERMISSIONS_RESET when
>> freeing resources. Flag should be set to 1 according to the
>> section 4.2.2.12 [0].
>> - fix dt node copmaring
>> - moved channel->shmem check from ASSERT in unmap_memory_channel to
>> "if" statement. This will prevent firing ASSERT if
>> unmap_channel_memory was called twice on the same channel.
>>
>> Changes in v8:
>> - check for CONFIG_ARM_SCI to be ebabled instead of COMFIG_ARM before
>> calling sci_do_domctl
>> - rework sci_do_domctl call to avoid extra checks, improved error
>> handling.
>> - do not propagate ret1 if sci_do_domctl returned positive ret
>> - updated comment in domctl.c code
>> - switched to ordered accessors to address the ordering and barrier
>> concerns.
>> - updated the documentation to match the implementation and explicitly
>> state the supported access sizes and granularity.
>> - rename memcpy_* implementation files to memcpu-* to follow naming
>> convension
>> - fix indentation to match Xen style
>> - fix intendation to match Xen style
>> - move memcpy-{from/to}io to more convenient library place
>> - update xen_scmi func_id in commit description
>> - updated documentation with the new DT format
>> - updated opt_dom0_scmi_agent_id setting to avoid it to be equal
>> SCMI_AGENT_ID_INVALID.
>> - changed SCMI_AGENT_ID_INVALID from 0xff to UINT8_MAX which makes
>> code more clear showing that UINT8_MAX is theated like invalid
>> agent_id and couldn't be used. Also excluded SCMI_AGENT_ID_INVALID
>> from acceptable value range
>> - remove outdated xen,config property ignore, added xen,sci compatible
>> to skip_matches in handle_node
>> - add documentation for pre-existing scmi-smc-passthrough command line
>> option in alphabetically correct location (in 's' section)
>> - add note to commit description about documentation for previously
>> undocumented scmi-smc-passthrough
>> - Fix SMC IDs in DT examples (Xen management uses 0x82000003, Dom0 uses 0x82000002)
>> - Add explicit note explaining why Dom0 and Xen channels do not conflict
>> - Document dom0less multi-agent configuration example (xen,sci_type / xen,sci-agent-id)
>> - Add scmi_xen node to agent-discovery example with #scmi-secondary-agents-cells = 2
>> - Drop dom0=sci-agent-id command line handling; Dom0 SCMI is now enabled via
>>    xen,dom0-sci-agent-id in the xen,sci DT container
>> - Refresh docs and examples to mention the DT property instead of the cmdline option
>> - update documentation to match the last DT format
>> - fixed RST: "... code-block:: dts" -> ".. code-block:: dts"
>> - update documentation with dom0less configuration example
>> - update documentation with new param xen,dom0-sci-agent-id
>> instead of the command line parameter
>>
>> Changes in v7:
>> - update domctl to build on both Arm and x86 platforms
>> - move ret1 declaration to the top of the function as required by code
>> style
>> - x86 guidance: removed the speculative note; header now just says
>>    each arch supplies its own implementation or macro.
>> - name spacing: dropped the double-underscore; the helpers are now
>>    memcpy_fromio / memcpy_toio. The header also explicitly allows an
>>    arch to define these as macros before including it.
>> - updated io.c to keep 32-bit transfers safe on arm32
>> - moved to __raw_read*/__raw_write* accessors to avoid endianness conversion.
>> - split the helpers into separate compilation units
>> - rework scmi nodes for xen to match on compatible string instead of
>> the direct path
>> - update documentation in section of the xen_scmi configuration which
>> is matched by "xen,sci" compatible instead of the direct path.
>>
>> Changes in v6:
>> - change iommu_do_domctl and sci_do_domctl command order and
>> call sci_do_domctl first which will produce cleaner code path.
>> Also dropped changing return code when iommu was disabled in
>> iommu_do_domctl.
>> - sorted objs in Makefile alhabetically
>> - added newline at the end of Makefile
>> - used uint{N}_t intead of u{N}
>> - add comment about why 32 bit IO operations were used
>> - updated cast opertaions to avoid dropping constness which is wrong
>> - move function definitions to generic place so the could be reused by
>> other arch
>> - add SPDX tag to io.c
>> - updated scmi-shmem to use io.h from generic location
>> - update scmi_agent_id parameter to be provided inside dom0= parameter
>> list and have the following format "dom0=sci-agent-id=0"
>> This change was done as a response for Stefano comment and
>> requires a lot of code changes, but produces much cleaner solution
>> that's why I've added it to the code.
>> - fix file comments and return codes
>> - fix lenght checks in shmem_{get,put}_message to use offsetof
>> - remove len member from scmi_channel structure as it is not used
>> - set scmi-secondary-agents property to be mandatory since if no
>> secondary agents were provided then there is no sence to enable scmi
>> when no secondary agents are populated to the Domains
>> - update documentation in booting.txt, added xen_scmi node to the
>> example
>> - adjust d->arch.sci_enabled value in scmi_domain_destroy
>> - fix lock management in smc_create_channel call
>> - avoid extra map_channel_memory command for Xen management channel
>> because collect_agent_id call unmaps memory if DOMID_XEN is not
>> set. So for Xen management channel we can init domain_id ad DOMID_XEN
>> before calling collect_agent_id so memory shouldn't be unmapped.
>> - remove all HVC mentions from the multi-agent doc
>> - update sci-agent-id parameter description in the documentation
>> - add missing Sign-of
>> - minor fixes across the document
>>
>> Changes in v5:
>> - return -EINVAL if mediator without assign_dt_device was provided
>> - invert return code check for iommu_do_domctl in
>> XEN_DOMCTL_assign_device domctl processing to make cleaner code
>> - change -ENOTSUPP error code to -ENXIO in sci_do_domctl
>> - handle -ENXIO return comde of iommu_do_domctl
>> - leave !dt_device_is_protected check in iommu_do_dt_domctl to make
>> code work the same way it's done in "handle_device" call while
>> creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
>> creation
>> - drop return check from sci_assign_dt_device call as not needed
>> - do not return EINVAL when addign_dt_device is not set. That is
>> because this callback is optional and not implemented in single-agent driver
>> - move memcpy_toio/fromio to the generic place
>> - fix device-tree example format in booting.txt, added ";" after "}".
>> - update define in scmi-proto.h
>> - update define in scmi-shmem.h file
>> - scmi_assign_device - do not ignore -EOPNOTSUPP return
>> code of the do_smc_xfer
>> - remove overwriting agent_channel->agent_id after
>> SCMI_BASE_DISCOVER_AGENT call
>> - add multi-agent files to the MAINTAINERS
>> - add SCMI multi-agent description to the SUPPORT.md
>> - handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
>> for smc call
>> - updated collect_agents function. Set agent_id parameter as optional
>> in scmi-secondary-agents device-tree property
>> - introduce "#scmi-secondary-agents-cells" parameter to set if
>> agent_id was provided
>> - reanme xen,scmi-secondary-agents property to scmi-secondary-agents
>> - move memcpu_toio/fromio for the generic place
>> - update Xen to get management channel from /chosen/xen,config node
>> - get hypervisor channnel from node instead of using hardcoded
>> - update handling scmi and shmem nodes for the domain
>> - Set multi-agent driver to support only Arm64
>> - rework multi-agent driver to leave Host Device-tree unmodified
>>
>> Changes in v4:
>> - toolstack comments from Anthony PERARD
>> - added dom0less support
>> - added doc for "xen,scmi-secondary-agents"
>>
>> Grygorii Strashko (2):
>>    xen/domctl: chain SCI handling before IOMMU in assign_device domctl
>>    docs: arm: add SCI SCMI SMC multi-agent driver docs
>>
>> Oleksii Moisieiev (4):
>>    xen: arm: smccc: add INVALID_PARAMETER error code
>>    lib/arm: Add I/O memory copy helpers
>>    xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
>>    tools/xl/libxl: wire up SCMI SMC multi-agent configuration
>>
>>   MAINTAINERS                                   |   1 +
>>   SUPPORT.md                                    |  11 +
>>   .../arm/firmware/arm-scmi.rst                 | 422 +++++++++
>>   docs/man/xl.cfg.5.pod.in                      |  13 +
>>   docs/misc/arm/device-tree/booting.txt         | 197 +++++
>>   tools/include/libxl.h                         |   8 +
>>   tools/libs/light/libxl_arm.c                  |  13 +
>>   tools/libs/light/libxl_types.idl              |   4 +-
>>   tools/xl/xl_parse.c                           |  12 +
>>   xen/arch/arm/Makefile                         |   1 +
>>   xen/arch/arm/arch.mk                          |   1 +
>>   xen/arch/arm/dom0less-build.c                 |  11 +
>>   xen/arch/arm/domain_build.c                   |  39 +
>>   xen/arch/arm/firmware/Kconfig                 |  12 +
>>   xen/arch/arm/firmware/Makefile                |   1 +
>>   xen/arch/arm/firmware/sci.c                   |  36 +
>>   xen/arch/arm/firmware/scmi-proto.h            | 164 ++++
>>   xen/arch/arm/firmware/scmi-shmem.c            | 118 +++
>>   xen/arch/arm/firmware/scmi-shmem.h            |  45 +
>>   xen/arch/arm/firmware/scmi-smc-multiagent.c   | 830 ++++++++++++++++++
>>   xen/arch/arm/include/asm/firmware/sci.h       |   8 +
>>   xen/arch/arm/include/asm/smccc.h              |   1 +
>>   xen/arch/arm/lib/Makefile                     |   2 +
>>   xen/arch/arm/lib/memcpy-fromio.c              |  55 ++
>>   xen/arch/arm/lib/memcpy-toio.c                |  55 ++
>>   xen/common/domctl.c                           |  15 +
>>   xen/drivers/passthrough/device_tree.c         |   6 +
>>   xen/include/public/arch-arm.h                 |   3 +
>>   xen/include/xen/io.h                          |  10 +
>>   29 files changed, 2093 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/arm/firmware/scmi-proto.h
>>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
>>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
>>   create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
>>   create mode 100644 xen/arch/arm/lib/Makefile
>>   create mode 100644 xen/arch/arm/lib/memcpy-fromio.c
>>   create mode 100644 xen/arch/arm/lib/memcpy-toio.c
>>


