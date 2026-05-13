Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCtPFSpcBGqiHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:10:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85E531ED6
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307826.1579404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7Tq-0007fY-47; Wed, 13 May 2026 11:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307826.1579404; Wed, 13 May 2026 11:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7Tp-0007dR-Vm; Wed, 13 May 2026 11:10:21 +0000
Received: by outflank-mailman (input) for mailman id 1307826;
 Wed, 13 May 2026 11:10:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wN7To-0007cw-8k
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:10:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN7Tn-004Rn0-LC
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:10:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045c18-2eae-0a2a0a5409dd-0a2a450aa000-10
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:10:19 +0200
Received: from [40.107.209.28]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045c19-56b3-0a2a450a0019-286bd11c133a-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:10:18 +0200
Received: from IA1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::17)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:10:13 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:461:cafe::40) by IA1P220CA0007.outlook.office365.com
 (2603:10b6:208:461::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 11:10:13 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 11:10:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 06:10:12 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 04:10:12 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 06:10:08 -0500
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
 b=nunXxu2LKryhW2fkHoAYaCBjBlk1DozfD7kFUd8pfycfGqpA352vzkN51enuouSvM6Hw1aKA/2VIjlWvzQryrVQkjbMeIQxf46x8zL5eyX27Yo91x9Ptq/jxUXj1WkORLtTrWNKumdGR3hs9YkxLQDCU8sFos02/jRWrx349HjvY/DwzrlKGm3jsNW9bikqxnGLP7ZWTqfrQl2E4xRrgbl2rVgxbFOwVlBHRq9bUZn2if4I5tnO087D671P8GP2nRJRT4z2o0g0xSq7BNA0Iu1EvvyZQuIA3L55NzXmGw3DKxHIWoJ0U+aYv04OL+0an+ofhOLyohbnwzW67DA1PgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vif5HSQCWb0njHbszUUuI4ehkx1leDPgfdyJ93Fb1iI=;
 b=h2VGmk2kj/Yz7hM6qg/pzVLjOenhzv/9dIUFw6Ac7dJ6yOYXyEH2ERo1RyUlXOBHrdQa5EDgv5scvOfjqk9tWWwg284XeuscdBATXfmHfAQvabl1eMrqQIVe8XsjAt/gizAXwqvH6VF4tsRp3lvUHTdlCtP2D/98n1911YDF8QmFFKP2K64EVG2x6ioUI8+9kZuGD4ucfgE08bQcSlVGWVspJlZAp0Jan4GSSzWBqBotpWd8dX0ZXdPLalxgWIA3DPm+IY1d8mJ2Q5XakmLpWMUX473pLMnpajLw8SsL3yU4zj8rfqggwXBIMooHBIOlHxnYSwwLKMOTIr2xheAdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vif5HSQCWb0njHbszUUuI4ehkx1leDPgfdyJ93Fb1iI=;
 b=Lu7+a/sxKtbN4yWfk1PnXtgO//GaqjwCxqPvJe5xu0V69tOqWEujGrXsMG0IXj4Q9QmkL3/w/Nyr/KBORTnKAFyVUYYNVGFiq91kIscgWZRAVC3/7wG5hQjKDCAkrlXDhRs4LTWJoLqP85TDmUB6MWbP6prskOEX1V0XOTTce+0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <bdeac837-9b6e-44a5-9633-031878bbea06@amd.com>
Date: Wed, 13 May 2026 13:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] xen: introduce domain-layout.h with common
 domain_use_host_layout()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Luca
 Fancellu" <luca.fancellu@arm.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
 <a95e0968d4213a07984ac112c178ff72d03eaf96.1778140240.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a95e0968d4213a07984ac112c178ff72d03eaf96.1778140240.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: f66c43cd-806d-4b3f-866d-08deb0e03470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|82310400026|376014|13003099007|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UsWdqCp3NHsEeBxYFcXBRyU06h/FwOsqxtFcyB5EsydfeP1gKh7au+YH0n2xnS++z3990sfOmQR93GYf+zGW53HkKNNWrTdw7tDp8rT4cr9VUUujMoug/4hArJ888eo1afJbL7VCfyghFBDOBMGVhDHmR3lT3pjvevo7PZ6brB/V5WN+okUa7OYhM/LTVb4I6iTGf2RXU1sdKN+9/qs7WkheDvwH00PgfGOoYbqHk+bTeZ7UTL0aDCXDMj4JUR5znDdSIc/VLod+evfNVR9kNkiCY1XUDr9a1YckMl453+D6lKoctWqwGCjlv+YpS0XWRYJmesH0Cfbubjhz8EIvzIdeNFs4VvMjvQQWndA8sGzoHgCZdiKcmoqdoNq0GfppE4I9jEZC6cGT9mfwkSfmLGA6eTXboK3YcDro+/hAzg3Um3EbmnU2jJwiTCvVLTtT/wUcR4Y9NFC5zmphYsEPt2a5EK+zosHI+KwaEY0VyqPYlxq8B0XohD8HZod4Ni8SJPZljO/68HH9rhSe5qDrpV+EvG0v3a+wBm5BkC+1nLEP0nvXVIGLzBVscML9DBvbjd3z/au3a8QHcyaYFQQ6LQ9ITMJNV64vd6IeCK4qLz1S5CpGQK3Y9hyEvxX+K07JnJaYREdpZTgnl7Vb/XARSmANlt0g2RMx73illwdx2AFOcM42UDMaoKCcMMc8NQdFWPkJphY007HhNnLUC1uy77rp6pKRM91I2L31Clblwlw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(82310400026)(376014)(13003099007)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Bvfd86EWJ4/ELp65WHPF7z7z6uqd6y0UDCvUtD1DPIaYtcPhvJCbelPsbzHkCp0KXSxtEKdjTBTh/Y0dmJ5dP9YQJFin33cr1aLSONkzeYC09uxRSyc1Ccr6TmmCVOgkcCC9HjXX+2wF0WxZGCtKTC4n60lIdwLH18dCM77dZmRr21+SfEpk4BDx8T4ExSTnlYAPd6h2+s6C7QV/TerfMgLMhO2izZlabWMc05txAWzwBP+mi0tEzw2OuBwNgWPENw9vT7GExUjg5ov50XorMERP6gx518zzc24jCKjQI3fn2QO/Q6rNQPN9ZzF37GHiOwhhB+e/aUzorvEu6TiihQi5sd8qen3n20aPNPjhbyXqaSn/JzX5Rho+0TopmaxW7oQArasyaPiUQH5E17Ee46PM3DXzdx1DBaObpU4lOgzyevAGbrzHWJ3Hc+wpw6x
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:10:13.1696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f66c43cd-806d-4b3f-866d-08deb0e03470
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350
X-purgate-ID: tlsNG-4011c0/1778670619-71B6F8B7-55EAA6AB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1876
X-Rspamd-Queue-Id: BB85E531ED6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:luca.fancellu@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[microchip.com,kernel.org,xen.org,arm.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 07-May-26 10:58, Oleksii Kurochko wrote:
> domain_use_host_layout() is not architecture-specific and may be needed
> on x86 [1]. Replace the ARM-specific macro in asm/domain.h with a common
> static inline in a new dedicated header, xen/domain-layout.h.
> 
> xen/domain.h would be the natural home, but placing it there would
> require including xen/paging.h (for paging_mode_translate()) and
> xen/sched.h (for is_hardware_domain()), which would introduce circular
> dependencies. A separate header that callers opt into avoids this.
> 
> Adjust the implementation to take paging_mode_translate() into account
> so it works correctly for all architectures, including x86. Some extra
> details about implementation [2] and [3].
> 
> To avoid the following compilation issue:
> 
> In file included from ./include/xen/paging.h:4,
>                  from ./include/xen/domain-layout.h:6,
>                  from common/device-tree/domain-build.c:4:
> ./arch/riscv/include/asm/paging.h:17:48: error: 'struct page_info'
> declared inside parameter list will not be visible outside of this
> definition or declaration [-Werror]
>    17 | void paging_free_page(struct domain *d, struct page_info *pg);
> 
> add the forward declaration of struct page_info to RISC-V's asm/paging.h.
> 
> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop/
> [2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271742400.3148344@ubuntu-linux-20-04-desktop/
> [3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271750190.3148344@ubuntu-linux-20-04-desktop/
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


