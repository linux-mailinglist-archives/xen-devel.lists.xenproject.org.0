Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIgMDHn1c2ny0AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 23:26:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565227B24B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 23:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212585.1523627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjPaC-0002lI-D3; Fri, 23 Jan 2026 22:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212585.1523627; Fri, 23 Jan 2026 22:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjPaC-0002it-9b; Fri, 23 Jan 2026 22:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1212585;
 Fri, 23 Jan 2026 22:24:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tn6=74=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vjPaA-0002in-T9
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 22:24:47 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ffb92af-f8aa-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 23:24:42 +0100 (CET)
Received: from MW4PR03CA0291.namprd03.prod.outlook.com (2603:10b6:303:b5::26)
 by CH3PR12MB8878.namprd12.prod.outlook.com (2603:10b6:610:17e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 22:24:35 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:303:b5:cafe::12) by MW4PR03CA0291.outlook.office365.com
 (2603:10b6:303:b5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 22:24:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 22:24:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 16:24:34 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 14:24:33 -0800
Received: from [172.29.134.248] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 23 Jan 2026 14:24:32 -0800
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
X-Inumbo-ID: 4ffb92af-f8aa-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpqGgvEzl3sjIy1DxzOMYiAt6cg3peEnlss+v/zyvI1knSs2NNM6VQyKJh0u8GTtnJJd03bsfK2LLfdmwyJAe6dYxhHH6rUh0FsetQlx6VryHoVWqlUan3g54J7grPzIXWLSvWfNZrcIUpgFiAKBqWvP9iQcwwE9+BBXJdPv2XK3NwcL1g+W6JvKoKupBbgYfvgvIBhdtI5UZgCW0sxbrn1Tf+JHbqsrWv8k0H4sjyfEdjbeP1sw1G+ZXmwdBCkVyhHz9RnSInQqQWM/nItJkZM5emuz9jz87MCjQh6TSrjxttTm1cpFNj0kfAPClJIVrq65RGmmJV/hQl5IhkgUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylhPBn0aGTmRvTfH0JHtAIj7AzMi3dvEcsyCPPWGOwk=;
 b=O5Lkv7WM7ddamwJgqfqKc/xaTFyDCwc9LZAtVbu2Bpo8cls3coo/wJ7G7pFAGqbXVG6+tOD3j4Bb8hCcWlIrXnnflYafREL7bKIEM5XeGfh1GlOeQMi465Vu2BL1KRleUwwK2Cppwesi2Wp2P8vldGatC8CPuQpr/Cyb/oD3llUgRFpTZtI2lHEAaXwq9otnppu7SqxQ952s9x7JoylmOyNouW9cdNTZSJ8XyJk3D/80RKRMv2O9R2/h2fzBQfAQfgDODs6vxz3Myt4QlqYPIR+GO3HSVBIs5X4aq85vGAVG19d5fuwV63F9tL7XR/zrvNBdoWm2f8VsLLID0CA3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylhPBn0aGTmRvTfH0JHtAIj7AzMi3dvEcsyCPPWGOwk=;
 b=Fx6VnuKxiHq3VI1Jpc/tWG5Dkh5991EiJWYJXEnHtAjOY68BzOdb0kQA/F07FzRK6N6LQWmFcAxBo6vRwPY6aS2V5oDKd7CItcv79ZmTJLC/Tp9Kby52oO/nMOThYv3yh7xUsHQH1iX06pR/8NlHlpiqoncVC2CFaxQpnrml0sE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fd509fbb-9dc4-4619-847f-6edd2a1bdb7f@amd.com>
Date: Fri, 23 Jan 2026 17:24:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI: determine whether a device has extended
 config space
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|CH3PR12MB8878:EE_
X-MS-Office365-Filtering-Correlation-Id: 48694834-d758-4c61-747c-08de5ace3018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHJRemZtSW9XMkQ1ZWVtdThVY1BIdHRvWVJEU2NZaEdQWEFvRSsxK1h4R2x0?=
 =?utf-8?B?bnpoR0dpUWhmVkpVNWhzRFJNZ0RzanlvNUdJa3JWWU0zWnJkMEtlN3loTTl4?=
 =?utf-8?B?U1FDY053NzlNUldoYXY3dFJJT0FuVVREbGh2ZHZ2UE9jamNvelBQenk4dUZq?=
 =?utf-8?B?L01BVTErY2R1ZC9aeVRybnVOWmF2OHJkM0pCQjcyaTVzbjduQU9tQmZtbEFQ?=
 =?utf-8?B?Y3M5U0ZTZ0QrbVl5WnlnSktJcjF4YTVjc1pxbysxeWhkS1ZWMlFSYTFDSTBv?=
 =?utf-8?B?WndSemJSVXFqYzBHcXVZbGQrT05LRTZMK1crY2JMRjJzMVBYL0I1cXFIbXdr?=
 =?utf-8?B?VldMUG0yTzZqbjVHYTNidGtJalpGV1R6TVdLcVNLMWFoNnIxVGxVNUlMTnB3?=
 =?utf-8?B?MlhycnI2UHJDNmVhUFhqSWxsZWsxVkZ4UnpnaERsWWFBRDJTaytGWXVyK0VU?=
 =?utf-8?B?Y1dvS21SNnplazZIZHdKaVF0RkZDSTlDNDQ0QmpVRTd6aWg2ZFprL3kxSUNO?=
 =?utf-8?B?bGhiMzZlbW9NS0c0cjdTUlFwbXJaWW1KYlBsdmx2RjhhVEdNdm9TeDRKQko3?=
 =?utf-8?B?dUJDL1J2bitoRm1tN1ZjSC9XRy9RVlRpVWxuaERTRFdRbmxhK3F0QWZ5SzF1?=
 =?utf-8?B?S0xYUjZlaENyc0xSdzczTHRrM2M5Wm1Qc25ocmV1MDMxNERiaExsTzBVRVJR?=
 =?utf-8?B?VHI2aUExc0RGeWVZMWk1dEo2SzFSWTB2d1VwOVFWcTBSRE5TUFgvQ1hkR2ll?=
 =?utf-8?B?amlGWTdhLzZKd1JhcDVoUVNMa1IxSXJMTjc5SHliejI1YWNPVjkxTm1aNExh?=
 =?utf-8?B?YVZiZkgxYStFYzdGaHNJNnVWSmdGdC9UR1BueXRsZVFxMm9YSE5oQ1hYZEJm?=
 =?utf-8?B?aTFXcEhxVFNIK05JY2t0eWNXc2FxdEVPa2pCRHhnKzZJbjhZaTlVa2UxWnAr?=
 =?utf-8?B?OUVHY3RDdHBER25NMG1POGR6TVgwOVhDa3FtS3VYQVY3cnc1V1pZQUkrZmpB?=
 =?utf-8?B?K1lSL2RBREZxWHZORXRNYzlpbUhvOTZqRkY3NnpsTTdEcmRFNUdDSVozeVFY?=
 =?utf-8?B?WXRIVkQzWUpIQ25FT0Y4ZGtKalJyaTBJeHFlZzVINmgvdHNERnVUTHRZelox?=
 =?utf-8?B?VU40TGtkd0Z2ZFRuaTdLRmQ1QUJQaGwrditiUkFPVldac1piSUFaK0pJdUU1?=
 =?utf-8?B?RUJibTMvcngxSjBGZlVqQ3VjUnhtNWZlRkFXUTBkenhRMVg5cDdGMnNvQVV1?=
 =?utf-8?B?OG1vUDhmYlF0V0thUUFLbktmZFpiM09Pc1JvaExMQVhHSGg4bCszUFV3clVS?=
 =?utf-8?B?enpEVVhQMHhnRTljNnB1cGVxZjd4d09DMU1UUnloT3Axdmg1SDJ4b0xnQXQ4?=
 =?utf-8?B?L1pmaFB5elkwMmxhYmZLYyt0OWd2bXZKUS80VGhqdTcyN3Qxall4V2VRTTJy?=
 =?utf-8?B?M09hbVVKQUVJRmsxWXozZmtGbXRNQjdJTHJwOHRSanR6eHFmcUoyY1M0NldQ?=
 =?utf-8?B?VWxnOTUxRko4VnNEanhvVVliSGFoTGFWZDlQL2UwQzMydmRJSmp6SGZQd0Zl?=
 =?utf-8?B?eDNxQkM3dndoWnJkcE9sUTF4NEtsSWdFT0dtMGUwbXNjMWVNWDRKb3BEdDBH?=
 =?utf-8?B?Q05xc1B4TFAycjExRmg2QVNCaXZrdVVpQUUvT2g3d3RGeERMbzMrNjY3aFgx?=
 =?utf-8?B?aVpXOE1KUHQyc3FqWnJZenI3RVRXZkNrUUtQV25IbEtHSEgzMzNZZktOQmdl?=
 =?utf-8?B?VVg5OVI0Z245QU85akhiVkZRYnRVM1JJSXp0emVzVWNkQk1lN21yZm5mMkp0?=
 =?utf-8?B?U1hlNzJMMmxnOFBCMi9IMkM2SEQrZlZHOE9OTk0wN1JFU0tnSUhvZ1M0emc3?=
 =?utf-8?B?R1lCSzhWNlNCVHozZ1JBQy9namNZaXhyZG1YSDNEQk1ybEpPM2ZFZGUzeWdU?=
 =?utf-8?B?S0lUeUhlcXFxTHJxdWlwTG1SVm16UEdGRkEzbGkxMlVScDg5ZkdRWEFmczdO?=
 =?utf-8?B?WXdJT25IR1kvOW9sT0IwZjFNQlcrd2lOS295TzRQOEg5bTBTL0tEY0xMUTFo?=
 =?utf-8?B?bkw3aHIzZXJQSmEzSTk5T05KZXFrZU9tZGpScldnQ1JxY3RsVTloWnZTYW50?=
 =?utf-8?B?WjYwZG9jcXNaSjNlNkdBM2x4QzRnS2xDWmxMVHVjMys2RDg1REgrSGlEa0dw?=
 =?utf-8?B?RG5NRGszSjBSNG9qU21qSlFDN2tLZFRuOFJzZ3haYW5LeVRTemRhK3VEN00v?=
 =?utf-8?B?Z1lacThGZjRWOVNxcWk2ZmcrQmdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:24:34.8530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48694834-d758-4c61-747c-08de5ace3018
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8878
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.800];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 565227B24B
X-Rspamd-Action: no action

On 1/19/26 09:46, Jan Beulich wrote:
> Legacy PCI devices don't have any extended config space. Reading any part
> thereof may return all ones or other arbitrary data, e.g. in some cases
> base config space contents repeatedly.
> 
> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
> determination of device type; in particular some comments are taken
> verbatim from there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

> ---
> Should we skip re-evaluation when pci_mmcfg_arch_enable() takes its early
> exit path?

I don't have a strong opinion here, though I'm leaning toward it's OK as is.

> 
> The warning near the bottom of pci_check_extcfg() may be issued multiple
> times for a single device now. Should we try to avoid that?

If I'm reading Linux drivers/xen/pci.c correctly, my understanding is that dom0
will only invoke PHYSDEVOP_pci_mmcfg_reserved once per mmcfg segment, so in
practice it's unlikely to spam. In other words, I think it's OK as is.

> 
> Note that no vPCI adjustments are done here, but they're going to be
> needed: Whatever requires extended capabilities will need re-
> evaluating / newly establishing / tearing down in case an invocation of
> PHYSDEVOP_pci_mmcfg_reserved alters global state.

Agreed. The current patch is prerequisite for this work. Hm, perhaps we could
create a gitlab ticket for it?

