Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJx4LXLV5WnWoQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:27:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D0427BCC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 09:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285417.1566455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEj1e-00052u-Bc; Mon, 20 Apr 2026 07:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285417.1566455; Mon, 20 Apr 2026 07:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEj1e-00051R-8i; Mon, 20 Apr 2026 07:26:34 +0000
Received: by outflank-mailman (input) for mailman id 1285417;
 Mon, 20 Apr 2026 07:26:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wEj1b-00051L-UK
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 07:26:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEj1b-002bLx-76
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:26:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e5d51e-e002-0a2a0a5209dd-0a2a4502db92-42
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:26:30 +0200
Received: from [52.101.62.61]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e5d524-af86-0a2a45020019-34653e3dc652-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:26:29 +0200
Received: from PH8PR07CA0019.namprd07.prod.outlook.com (2603:10b6:510:2cd::18)
 by SA1PR12MB999086.namprd12.prod.outlook.com (2603:10b6:806:49f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 20 Apr
 2026 07:26:26 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::11) by PH8PR07CA0019.outlook.office365.com
 (2603:10b6:510:2cd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 07:26:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 07:26:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 02:26:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 00:26:25 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 02:26:23 -0500
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
 b=Tik8JBeUG8YbQS/ClNrKXNYYrp+nV4hSFmO5qm70FctqPryP7CRnhXCsrc0p9Y2GD3JTpbh3Ju9iedvrkgyMLIFx50fmL8L3NYFRwbK6vLeak94TIKjCuk4zuEkVJIyn/J6EyI8UCQ9XHV20rhTYFB2ru4stIQMJVhBf99TbuvGb9acA33B0OEwHtQNhcxTZasiOVKPFwbDQA9aM0isDQ6AeA4/Awga8L4F3v7lg3C8rfqOexFF4Qwnjl5dhdIFizqiCxXL56w/+Op2d4Mha8SnSbNV08L63of5dbSnoZe3MkmGkb+lu7oahPRPWE4XvpF4ODVq2SNC3+nrZvxdqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB6k0kOtErN3VP+hR2720UAh2VmSDTlX3y1KH48oS/8=;
 b=fDkZkH+7HQiChxe7yGEmD52YQlTLH6iyIhRs/nzRcvYCGKaQP9QEQA+nhxh/OLLofzuj/KjpLnyhYGzJQk71whwXNTPqz3rUZRsR8M5xb4qMo5urpNWj4EMv0AzDHOax4bdUhs4Lb5e7OWj0EEtpN+2VkiQ3QL4btJcO3CNXYbuRuebUkQ/7GS21mEfFmmn3ufBZQleDkF+ju5vIRO7Z7iqVuz94VSyie46HjcOatfuw0PfRrR3mtk35mfzC1lKEdeqqBHMKMi/IU3mg0TOLG2xjaDlNaNfQeWLCbvhy3dp1EzS6pdTTRHom0xUOi8cPNONv6bbd0eaLqhRhCSqB7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB6k0kOtErN3VP+hR2720UAh2VmSDTlX3y1KH48oS/8=;
 b=VtdM4A8sGo+0TW5J98po2Ld8wQ0IxhESd9FBpfgzZGPHn7Ji67JgmKGNYnpnnR4R/0cggLynAEkm7X412+cs1YUo74jcVMSTCaAqgKG/A1Zlqnx5EHtQtL2aVoeYHB2W3wfZ12/djsuhxtyjLpgw9SC9ZvzPvuL3VnyQWU5AJMM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <6188df37-47f1-4b46-8b4a-56316221b86c@amd.com>
Date: Mon, 20 Apr 2026 09:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/dom0less: introduce free_phandle in struct
 kernel_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <58f59a071f6329acac610688a6c25b67b30e5b92.1776340422.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <58f59a071f6329acac610688a6c25b67b30e5b92.1776340422.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|SA1PR12MB999086:EE_
X-MS-Office365-Filtering-Correlation-Id: 872c1d12-84d8-4cf1-9f02-08de9eae21a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vWrSEU3j4uijyKIwU/yxkEzAsrVIZdasKikpq57DtPa9596QTw7zzycAUJxJwdvre6ein57ditRmmofvpXUjQgyKfQFUTRgt7Ar5oCmXK9IsM5FHPyWC+09snz7pyUgwMCTzd2FL4ea3HX3wGhRLiSqF8KDFzPt/Sft1kdfrNmzYvEKQrUQpDg4A83zKs0f75e4iEsn7TDXBB8nYSaJjS4ZR93bxJJZg1FVa71siF6zG0keJE4ifT6whDI3fZ7QHHHqZrIQ3tlRBMukQ14NDmY58nT5hOqN8hKoyw2IefP8otYlHU+ts6mDV90M1Q6eI343oR7TlQSL8yAR+PmM61iwf+looiF8vOnUkuo5wZPPFud4RzOSX9e80zptyzt+jhSkqchTcUFO2Q/OGi7z5ZFdJvjuF8PGGcOxj02YsZELT7EU4jB6ztKrFp1JYbNqtX//MnPqVRSck66GIhj5J84lds0/mgvgLHFFvU4K/TT/ijLRgOvLtziXOJcQ7Vz6A5cEq4ypT7V+fofa8/5zMHmHo1KM/N9kNTXMut3lTznuOVuDK0YiO/c6PG2RKlLBSILlEt7UN9WPPiUP9eLdYmA6g40wwSvSRX0rMM3cBlbeYtxPLS4gu7F6FVm9Q0Co0O+x7kK14T9dDpBbI3xDN2INtr9YQqI9VW3idR0pl0NjswthdkhLvrRY8+96+v18EgGmUto79efqBsnRZYAwM+Yfnygm+RSY8hCnajWge+nKCjBPuU78gxHDELS3KxWoIeEyzMbo4lfhsFnwppixBdQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4SGbQQfUlrx86HlcGTKQmrQ1huBt5CPltNXYCP3HOdKqqWin0zLB9spXWSoNcAWygACiUkxi5PTaQg4zMQ/AqxrKBYSz1Y2zstR0/m9Rz34UBbZjcKPtLjIlm9gdSEM4j1o3lhUzGtbosDgMScIoEe2z0/BtTS8kq7nkqB8acMQ7vST/IjbVpL2+fl9mo1ZmeOnfQCPzUKt9L9f0jLfDjcUZenSaHdCyRVmxj7ei8fxhT7ktyKQNt0uzse3quHCjqBRNiR/J8sBS0MxiLA3YFxfG06tnMtJsEpTKjb956BAg4fgDVylDIvRoHytwa3BDi+qBl82gkJhMqNYCYQHyZKcAwlTprZ3Dz46SXNSRSxuzIr9rX6z7wwI5HmKSSgrgvB4htAAHlZ9ibYH7vl5A1zPYocPcbz04WiX2Vl+dynVp0OOD7CChjJTSW5pJcY+A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 07:26:25.8592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 872c1d12-84d8-4cf1-9f02-08de9eae21a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999086
X-purgate-ID: tlsNG-720697/1776669990-880D7161-8A467684/0/0
X-purgate-type: clean
X-purgate-size: 1440
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
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
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 196D0427BCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 16/04/2026 16:20, Oleksii Kurochko wrote:
> There are cases where it is necessary to know the next available phandle
> number in order to generate phandles for guest device nodes.
> 
> When a partial FDT (pfdt) is provided, special care is needed during
> initialization of free_phandle, as the pfdt may already contain a dummy
> interrupt controller node with a phandle assigned to it.  free_phandle
> must therefore be initialized to one past the highest phandle already
> present in the pfdt, to avoid collisions.
> 
> Since free_phandle may be needed for the very first guest node generated,
I would prefer next_phandle rather than free_phandle given that it always holds
the *next* phandle to be allocated. Free is implied.

> domain_handle_dtb_boot_module() is moved earlier in prepare_dtb_domU().
> The new call site also aligns better with the existing comment stating
> that domain_handle_dtb_boot_module() must be called before the rest of
> the device tree is generated.
> 
> Introduce get_next_free_phandle() to ensure that phandles allocated for
The name is a bit confusing. It reads as "get the next one after the current
free phandle" but it actually returns the current value of free_phandle and post
increments it. Let's call it alloc_phandle(). This will also make it clear to
use the return value of this function instead of directly kinfo value.

Other than that, all good.

~Michal


