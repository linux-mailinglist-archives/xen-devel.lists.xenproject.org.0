Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Bb0MMFbBGqiHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:08:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ECC531E66
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307803.1579376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7S6-0005C8-82; Wed, 13 May 2026 11:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307803.1579376; Wed, 13 May 2026 11:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7S6-0005AL-5M; Wed, 13 May 2026 11:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1307803;
 Wed, 13 May 2026 11:08:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wN7S5-0005AF-D4
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:08:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN7S4-004R9d-MV
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:08:32 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045ba3-2eae-0a2a0a5409dd-0a2a450aacd8-42
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:08:32 +0200
Received: from [40.107.209.14]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045bae-56b3-0a2a450a0019-286bd10e4422-4
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:08:32 +0200
Received: from DM6PR08CA0058.namprd08.prod.outlook.com (2603:10b6:5:1e0::32)
 by SA1PR12MB999251.namprd12.prod.outlook.com (2603:10b6:806:4dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:08:26 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::20) by DM6PR08CA0058.outlook.office365.com
 (2603:10b6:5:1e0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Wed, 13
 May 2026 11:08:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 11:08:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 06:08:22 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 04:07:56 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 06:07:53 -0500
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
 b=fZX5D/NrSECkZH59ya87/UNhl6xvV/QYL9UaLAbn1malzkL+BRDZQbAm4WRk+4HwybygygA+vfCwBNg1W7zubCsArIYagsJJycHgNzmA/5HA/7rBNqOCCrq52WH+D9mWt3bM1YYRmB2HqG7NVucCaYmBGa6TdAw5LW8cUka+UF5ru87exhxNOUbNjdYB10DADDbd6ualiE8JdfFabp8cb7W9MygLGHLW6jpamkWuocKKeiEkjqDO5KP/Sumawa+oWWm7v60UwUzRNtSC1LiC39JSvNYYpwB2fOO/5/ea4xAWA0KI5aFboIfV9c/n6ZkJ4HFOFoHt+8OVoGXXL/gnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeASYNi/s9le+LhlUEurTSp9ik2KbZ34qZ9jed191Pw=;
 b=DUPuhKXxntpPKiKVS9Dor0QJ1NtezpakF5+O8esc1BLbnfZxrsf4UfJgP8qkFjkJRF0kmGkHD07ZgvalaOnROBEHYJVjEKJrTnkyi14hPLh6cAVUsqeVeOXFYfXTRLAuH3b/dWla6jRx5cWJnfP20jX5BQYdatkE+pthFkA7Wc+UE3mGhtzVHC7hWD3ZLvY+vHHrRyQn11IqLnvhmebCmVhXEUjEiih7GCSE0dSjD1R3868Riu1HLnVDLse0cY/gM1tfh34Tyz0MM6dCsYcC/v3keNx8aRrklnAB5qCPqKwX2tVG22nsE+hrG2RKpmywVnALVE2CCAnDmIO6z9byWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeASYNi/s9le+LhlUEurTSp9ik2KbZ34qZ9jed191Pw=;
 b=suwz7iW3KHRtde0mRKtUkt8s29pbjkJModjVrxm/mEbUcMyiHbsyCvP8OOCanhjIQLlQCz29aywbw/2WIze9mZp7HMqpMoNz9A0rZiG0OZRVbozrKmZsSRFOAk3RnRWtxYPzBjME+0MkiLwY6WRzr7CssFaeICz5riBGpmiz/Zo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <56900ab8-0f43-4b85-9866-66d7fdabd39d@amd.com>
Date: Wed, 13 May 2026 13:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] xen/dom0less: rename kernel_zimage_probe() to
 kernel_image_probe()
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
 <ceddcb0daabf3e58b1811e3499265dc6588ea4b4.1778140240.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ceddcb0daabf3e58b1811e3499265dc6588ea4b4.1778140240.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|SA1PR12MB999251:EE_
X-MS-Office365-Filtering-Correlation-Id: 647944f2-af09-49f9-9941-08deb0dff4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y/NCGv4b5FixGnE4bQMf9CKuds9PQm2LBfTIJLHbBmqAB4NGEdAgu21myeJCIyY9s0A1MOHCdatJqpc/k/BLes0+SCAjfM8/ZcR0KB8kCgdIVWYv5F+ZnHBuTqcixfa9qVxpyprs/6w9mVwFlqXR+9QuHJtHSC6dOZe5/X4SrqjKLrVHNf9wS5ZaGc2MN/5FUsHaLxOiAzHhyC91ZproaHEIJge52oQZVFwYVk8FztpGcmH7BsdSA6pAiQO4YJrp6wGUMM14ImPTIijGiO1BhNPSwL+piHJtnMwdWHPfiqesbJV/nAlQuw+ziLr4TjIKM8qFKDgShBiphLeXWPwnhQMAIIjmh8zwzuk6C4QnsKl6OYOBbfi6qkdC3G3tVpMQ4D2wEgnVW5Z1Z0AKlT+E1b+LYWVFfzj8DPPNRPWQVpoHbNO+uGtX6VuBYRywDjGFFfuf6O6P5X8VpoTwbx8fQsKDd0XiCabL4yAKr2YnWn/psY7yqSVYDQE4Ar8jO2nCEkfG43scEJmp7Aso/KJ5i0UsIYictD+hIJoMDhg7+8mKrkfjlsB2PYL0Priz6QqCbl6Ck6IstQOfP39W7OxQ8Rr62Rf52dtf7uB5FhLuulfwWpQCHMyo2k1MtX7LJCmvuAX0GPfsKxL6Wd3ghup/4B9t+eBu7L9I0nKrjFsaR1FYiFNLuac5F2UaYvj6WUygeJK0DtGZzqZBjONC4QO01GzJjcRlrdPwD2WSwFDi5CM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SPB5r0oZV7053Dw68q6q1gsxb6T4RpSSmY/t9DX1p17j+uNlAMcrt06MJfmmBilZXPDXNcJAuhSL+80KWzx0kAoCbdGs4jwAfpgfZj6dBPlzohbYKY0h1G8HzGdqD99R4lPntdIPypKKVHv1f3Gv0efKE9jpM+aD7xJXZN4Rz12rDCizHqedqvMsx0YGtiOkenEUIxB/vWDKKwts4mfambAWd5NHKcHg1rN23KLPSIaYyL455rf8pS9NLa9CphjDB+jU7A4m5Ssxm4ZVCgom2chvxRc+F0zSZaKxcr7AdV2dRM9NWGrqvRJP21kbzYjRDcYt4fLn7d0C0x64PGQvlzPlJFr38r3IivyyeqLxWNUy4AjEH+FAuhWu2C67jUnA/zAio4yebQWdxbBIRPWRTV6XUXNuDy5J8aUTavgpfzMsDf9bbHjMtuIngNuYa4Hu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:08:26.4814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647944f2-af09-49f9-9941-08deb0dff4db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999251
X-purgate-ID: tlsNG-4011c0/1778670512-711628B7-8A966658/10/73395122804
X-purgate-type: spam
X-purgate-size: 999
X-Rspamd-Queue-Id: 78ECC531E66
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 07-May-26 10:58, Oleksii Kurochko wrote:
> The helper kernel_zimage_probe() is referenced from common code
> (xen/common/device-tree/kernel.c), but its name is tied to the zImage
> format which is specific to Arm (from architectures supported by Xen).
> 
> Other architectures supported by Xen, such as RISC-V, do not use the
> zImage format and instead rely on other kernel image types (e.g. Image
> or compressed Image variants: Image.gz, etc). Using "zimage" in the
> name is therefore misleading in architecture-independent code.
> 
> Rename kernel_zimage_probe() to kernel_image_probe() and update the
> associated structure field from "zimage" to "image" to reflect that the
> code handles generic kernel images rather than the zImage format
> specifically.
> 
> No functional change intended.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


