Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFTJDMFbBGqiHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:08:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96008531E5F
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307804.1579386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7S8-0005Pd-Hc; Wed, 13 May 2026 11:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307804.1579386; Wed, 13 May 2026 11:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7S8-0005Nj-E2; Wed, 13 May 2026 11:08:36 +0000
Received: by outflank-mailman (input) for mailman id 1307804;
 Wed, 13 May 2026 11:08:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wN7S6-0005HN-NH
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:08:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN7S6-002TdR-3y
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:08:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045b9b-bab6-0a2a0a5309dd-0a2a4502805c-38
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:08:33 +0200
Received: from [52.101.193.58]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045bb0-af86-0a2a45020019-3465c13a49aa-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:08:33 +0200
Received: from SJ0PR03CA0083.namprd03.prod.outlook.com (2603:10b6:a03:331::28)
 by MW6PR12MB8915.namprd12.prod.outlook.com (2603:10b6:303:23e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:08:28 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::ed) by SJ0PR03CA0083.outlook.office365.com
 (2603:10b6:a03:331::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.24 via Frontend Transport; Wed,
 13 May 2026 11:08:27 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 11:08:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 06:07:56 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 06:07:41 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 06:07:38 -0500
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
 b=EOW24Ny5izJi+G6QtZBj1xLgiBX6Fm1OHFKxp5X2EnZw+bkxH62jLmVARCItv6mUC/5iEfdjc/6iv3Jbkb+fIQszjP1PD1TfXWFAfJnE4GtCykxT9oknrPPcLwymS2I//kfTfpj5nLLXYFnFP56Km4lb066tEQttd8AkRZvDK4YR682DavJt9sZhVTkWyQC4FitBI33Zuu7zsdCp6mW9yzc9vGkMph3qjFQ0LbkyGpdVqkcvBYncOu/gf8o3KJBP0Mz6fBlHcnPZssNtwIZEEGDg0/3Q8n8AmwX1NIgvYIhBzYDvcWL5rsjmi8TACZRR9Z17me3Ok604uOc0b0hn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81Lcg54rbVRNgI+d80x3GYaeOkzYglYsyvUwhW+O5gc=;
 b=R88YKNpYFCPr0tVHEKwrN8q05zI3uUSs1OtvrU/V2v3v7kwziq1acdW4UBAgso1pHc4myTjdWCl33hTTkDczYn/TAEWibxXBD5gsy1Zpnf6cLrvunivgVAs0am324RaqLIw+ghk4ZzC1hQ6IsPYGe8mabbqbh7i0dxR+cRKXk3K8t+DalxB3sUvD9ee6R0fLAzQcIoIdIc9VQpyajAM/nEXpJKXBw4LZOFYouBCzt1DLPyUDAo+MouLZA0nW3plg8XkQl7OAPTmP4zvZNMjhRhhUpk6GJYVudIj/wqFIdIePDYESHaxhXgiLlyl7yhBE+NE6eIx5VVdvPbxG+rzFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81Lcg54rbVRNgI+d80x3GYaeOkzYglYsyvUwhW+O5gc=;
 b=sCXrmN1zJcFKxwJ6HmG7nekUIADtrM6jRszdu7Tf401fYaAuiy5KqpTZDK4+1d6VZozn1xvYW9g1Mio+UGbAVlvNHGJ5htqCLFLNKaL5GAougAerhaSLSiqD1SPkZYfacWk8aGJbHgmOE+ksTLVMxykSs2ocCq+lWSsok4yDNi4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <117c626c-c8e5-4e4c-9d2a-280e56fc88d9@amd.com>
Date: Wed, 13 May 2026 13:07:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/11] xen: arm: fix len type for guest copy functions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
 <6f629fe2e194382534d3b1e2400b753c43ccb04b.1778140240.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6f629fe2e194382534d3b1e2400b753c43ccb04b.1778140240.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|MW6PR12MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 15750208-db1e-4cff-0330-08deb0dff589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	kiAyx8ecvGMyDySaK5sVEPD042v4tS0WL9RcJlbVQl+crVvqQxYf2HKOUjiHDoQcnLFt11dwcmC4suNS1WcYRB9V5pTBAGq0vieQxfCfBINtj57+zEUgf5l4FfylGPUdkr0aeXBujP8wTP+FjdOWnbJORWQ87CkEVqqiaDhICIEfNFoZpwosW9rhOLMX1jzLIR9aik2HpI5npPr3mi32X3lQmtk0xbY5+bUQ2B9xSsPQylI8Tvy9QxDKk6Jd7pPKuRi1JrFlp7F8WTzlIhQ5Jo46immRO/wqQN31mIL7KJvrRNqhr/dwxmhTKkbCuSvGAGvZoOUhXgjBSPpVYRDmD0R3aRz/9eybFIZS2hjMkclt03XfnUhVvYNARwZzoNkndLNrHgI53hbLW6TY0t0fZxTGV2dPhvV6F5O9o56v7eu2OM8moCbITz9IuW8RmenbZN1Y0NTeUvGQXAB/w8KU3jFid2AVqeSa3A0J0ixW47m+LpiwfQtTyWbfHhonqtdFbCcTivDhdgJWhpkYmiCSZGvXCjoG3ShVpGJIYs6mr+exDXxPIE7FsQV35/yC8OWPG4ELRbbABMNA3pS3rfY8SzIxxisTF50N9KoQvqb160sYZSnZ4GVx7Ue+jw/f5Yn2zaAFTETfp698JOe/ltAV7jQLrUKhn6NiG91iMTdOxr3ynPAXQpI7ZkJbW8kn2oM4XiS9FlNRZddpWUHigDwBB0ec7NhTPjliFTFB6nGI/dI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aUR/NhzCj1Tb3I+X2rv3ZqNxVcoq6sItyi9qaHP54cSYcDO4vLD/3gbDtuSf/V2U9YCMa2Er8sCxVo/NdbFZzQGnwGG6KCMVeTT28JZH7wX+WzAWig+z2hT/3FUzK3kTNCds1InoiWgE6Dev/ElLR3TRx62PpnzwMPhVtsm9uswUkrPKeqNRzMeBwVnbA+XZSCuz6M5xqkb00+rodHSNKwPepDq3yBX1are/7lCV2RBsA9uTKl076+ZBUt6oLdNuT7jZjczDT/9XRFB1qY4KanFNVrBFpMHPCO6bRvwJUG6e+xq5ptX6zHwhVK1fTmBDa81Y0qzqbhFTj20HhkiDbNQTVcPVvBtTSAq/uVZv3zQmh/a9unnpG9s9tsXc3U7+a0pcTPRhRGckd/sYLopc2+NZS5cr6GGR7Lfn4yC1d0XJS8s4uhhX3KttBXg9HuC8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:08:27.5617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15750208-db1e-4cff-0330-08deb0dff589
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8915
X-purgate-ID: tlsNG-720697/1778670513-A877A161-37050CF0/10/73395122804
X-purgate-type: spam
X-purgate-size: 1357
X-Rspamd-Queue-Id: 96008531E5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:luca.fancellu@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 07-May-26 10:58, Oleksii Kurochko wrote:
> Widen the len argument of copy_to_guest_phys_flush_dcache() and the
> copy_to_guest_phys_cb typedef from unsigned int to unsigned long, as
> the function can be used to copy large blobs such as the initrd which
> may exceed 4GB. Update the internal copy_guest() len argument to
> unsigned long accordingly.
> 
> Change the type for local variable size in copy_guest() to avoid
> compilation error because of type mismatch.
> 
> raw_* wrappers above copy_guest() keep returning unsigned long to
> avoid type narrowing; it is not an issue for raw_*'s len argument
> to remain 'unsigned int' since the assignment to copy_guest()'s wider
> unsigned long parameter is safe and there is no raw_* users who
> are using a value bigger than what can fit into 'unsigned int'.
> 
> Fixes: 2986481b3d9e6 ("xen/arm: guest_copy: Extend the prototype to pass the vCPU")
> Fixes: 5302bd490bea7 ("xen/arm: Introduce copy_to_guest_phys_flush_dcache")
> Fixes: d07b7369aa65b ("xen/common: dom0less: introduce common domain-build.c")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


