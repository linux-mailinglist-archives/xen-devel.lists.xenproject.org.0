Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE0UC2mK8GloUgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:22:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A93248281E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295551.1572216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfa8-0003ex-OQ; Tue, 28 Apr 2026 10:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295551.1572216; Tue, 28 Apr 2026 10:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfa8-0003bw-LK; Tue, 28 Apr 2026 10:22:20 +0000
Received: by outflank-mailman (input) for mailman id 1295551;
 Tue, 28 Apr 2026 10:22:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wHfa6-0003bq-Ol
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:22:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHfa6-00Bkm2-21
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:22:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f08a43-bab6-0a2a0a5309dd-0a2a4501cd6e-32
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:22:17 +0200
Received: from [52.101.52.10]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f08a57-c1f2-0a2a45010019-3465340a435a-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:22:17 +0200
Received: from MN0P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::28)
 by MW4PR12MB6705.namprd12.prod.outlook.com (2603:10b6:303:1e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 10:22:10 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::55) by MN0P221CA0017.outlook.office365.com
 (2603:10b6:208:52a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 10:22:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 10:22:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Apr
 2026 05:22:09 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Apr
 2026 05:22:09 -0500
Received: from [10.71.195.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 05:22:08 -0500
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
 b=BAWoDlqXGQXKRHwlK4JMZn29cFi5cwRt+yh8joO2Rzs9Pm2ER7kkuYaHGAeWdD6UbpO5JUjWjAnLtCW4GK//GrHURKQqoNislXR0xTJT/AuslUGpZmawmxBshUcmE1Xqjjzkr2L+Iko6K7nt4wjXuHPxS4t7gfarThIcUXnyTwnfW0WblFXxa+R1Bbo5mRu4ZhZ6m4GRmQPiFiY0HdtIU+BBnGE3E3LJgLpQFM2hm3as3F/xSfc1tj01BTfhPAVvxwSdLysztD5gzh8G5Yg4Bou5jKlXebTDQa0F6kCigw2bMCISB9TKKM/hm+7HAXDgidskpEpbLjcZrt2GqDpFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyR7PutCQL5LGH1gsjDsAyMJf9cdoMsIdLhIXecj38Y=;
 b=OysW7VcVUniKM06XG5r/85l+hEhf1p00VWFtCLYg4JmMe2U2i9NpQsqn/ZWhTJvCIJTGRKiYL/kYZneY+ep0FcV/12iZBu/yNHSflUvzGiBfdXEbVH/xEtLP8fyH3xYzot20tKU6n9/UxkIaOIw5dYqamiM1LjMCohn2zEFGhCqfqpxci1udICBgqvMrI/9Jmbm8lx8GvRCkEuWsdFu6eWr82DOylIaAsO4jZ39KwCTfmnGkpt5ZBsCnbtCT9lIJCCjPGhXW3ObMExpnf2PBgBtBGU4/fLiyErOAOyjqLbakWInwfejjOtJIIm/LfoVAoL1PfXFUUabLEc7cLauWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyR7PutCQL5LGH1gsjDsAyMJf9cdoMsIdLhIXecj38Y=;
 b=jQGMCeVwEeiji4ADoDdktWcWCmC+ctLdhd7Q1vNx5KdqIeMO4GzhWh8MYj7uuKCOTUGzy4nCAED3g9UUqf8PLciH2xr6oTGSioyr90Xu0xAcupmZ7ic051+9UpAEPh/dYoHq1EbciTWXJd7HQ9+LLPQZj24g3gwHAWGORrNPKdY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d43959bd-6812-4241-b425-861d6020339b@amd.com>
Date: Tue, 28 Apr 2026 12:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu
	<luca.fancellu@arm.com>
References: <20260428080218.19371-1-michal.orzel@amd.com>
 <2f9875a8a1f4d85ddceccb2d093a4951@bugseng.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <2f9875a8a1f4d85ddceccb2d093a4951@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|MW4PR12MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 951c3eb8-d989-4d26-7a8c-08dea51001b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tl8qn9wEQ34bZ3RmD4m1G2LmzImhHDKkvSxnt83YsU+tt7uQ24bYa4PMY4p5oVEnWD2WAbbDHceZbr/oHcuHFvqabt71GbyYq6/jWd/zxxwHw8lD95ha9L0jwpidY61Kv2LNb4Xq7ujj7NeAzlldSljgrgCbiEAL25ILIccTYQ2Hr5AE6J0QQC9qUiAY+JCHO87/gZOsvp+R7VJccn71458xVxA95vbscT/tbE5e0BjCgISk1/BPDZd/zjd4YrsgnH56WnDINOJ6Ihq1T4/oTtooeWkjtPDnva2kVxEnuFL1wKG54Z59+8V0BIGFzsqdNANbg5LCV4npKp/52qBoVx88rYmpOd+h/CT/E0Lh5oj78z83WEtHv5rE34rL4t+XX8bBMCwExICpmJMnm997eZr7TJLQRFKgdVObM34s/JAU3PHiJlCbc9wed+pBbuXMdfqVg12HuhJo77oTJyVn+2amKL1rnAinDS6qGa6C4vhnU1UEpTDsN04a93+or83vGusG+bkAWoajGtFcNc9orWfY35SSbZBO+7Hqwh2E78X5TudlyN08fYMgJPfoBaqvNICq0L4MayDrtRvQnAytls5RzvyhbaiomaDxRVwTc4YHSXHMrRxCEK743YDLkZyK8RzvDsXlax9UaMpfVGlH93AA2y14DieIwXyxRByGtRVKMMtBqqHbIQj1GtSQxBrF/6O4ILs/NQonaRi4mU6Uyb34Ruk1+zpaE92dZasDTIM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zxCxn9KcpZLXzFhPFguHSDNoqd77NodQsEbqD0dv43MUZEem1P/z8bquExs5Rg+ig5YB3HhGszUL4pe0YEU2qAwVC1qi9VweO1rd/Qx72hSkJ0O9N12wI7G2S5s7Vwgv+fXAW/5T+toLY/j4smYZ/GibbT3JuB3BqnNzmQCIp86vEhvB7mW6c28k2+JXQsbCOvLfUQ2uGaSoPsDPRaozTXoJz7SpASbXbQPknCdaVr227hOzsENu9+rYQk54d0kRK+eAs5JDuaQb1IEv7aJx+NKhACFV1Y88UOpAnlMVHugZ5MWyW1J1omeEto55hBMW8EZJXUSEn3xNVrg+tjc19iohV0bFqsba7HW/thM2gZRPSJ5utTve/slE48VUx1he0FEc4gYKqwP8WWut+2HmixSC9AVu2kiteB2Xxxh0i5hJVln8t6AW//3bxuE49NhJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 10:22:09.9663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 951c3eb8-d989-4d26-7a8c-08dea51001b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6705
X-purgate-ID: tlsNG-d62444/1777371737-BEE63FF4-3AC72EEB/0/0
X-purgate-type: clean
X-purgate-size: 3063
X-Rspamd-Queue-Id: 8A93248281E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:luca.fancellu@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,gitlab.com:url]



On 28-Apr-26 10:20, Nicola Vetrini wrote:
> On 2026-04-28 10:02, Michal Orzel wrote:
>> overlay_get_nodes_info() is called before fdt_overlay_apply() to 
>> extract
>> target paths from the overlay. This fails for overlays using 
>> phandle-based
>> targeting (target = <&label>) because DTC compiles these as unresolved
>> fixups (target = <0xffffffff>), causing fdt_overlay_target_offset() to
>> return -FDT_ERR_BADPHANDLE. Prior to this change users were forced to
>> manually modify the dtbo (even for hwdom) to switch from target to
>> target-phandle by manually inspecting also the host DTB.
>>
>> Introduce overlay_get_target_path() which directly handles the two
>> targeting cases that occur before fixup resolution:
>>  - target-path: the string property is returned directly.
>>  - target = <&label>: the label is found in the overlay's __fixups__
>>    node, then resolved to a path via the base DTB's __symbols__ node.
>>
>> Libfdt fdt_for_each_property_offset() violates MISRA R20.7. Despite
>> libfdt being excluded from the analysis, this causes ECLAIR scan to
>> report a regression because the violation introduced by a macro is
>> reported at the call site. Deviate R20.7 for libfdt.h.
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> In my pre-push testing I realized ECLAIR allcode reported a violation 
>> related to
>> the use of fdt_for_each_property_offset. Libfdt is excluded from 
>> analysis but
>> this does not apply to e.g. macros used in other places.
>>
>> Changes in v2:
>>  - strip out from series that is ready to be committed
>>  - deviate 20.7 for libfdt.h. Discussed with Nicole.
>>
>> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2484326830
>> ---
>>  .../eclair_analysis/ECLAIR/deviations.ecl     |  1 +
>>  xen/common/device-tree/dt-overlay.c           | 65 +++++++++++++++++--
>>  2 files changed, 60 insertions(+), 6 deletions(-)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 30c323906924..5f0b73062474 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -631,6 +631,7 @@ not in scope for compliance are allowed, as that is 
>> imported code."
>>  -file_tag+={acpi_cpu_idle, "^xen/arch/x86/acpi/cpu_idle\\.c$"}
>>  -config=MC3A2.R20.7,reports+={safe, 
>> "any_area(any_loc(file(gnu_efi_include)||any_exp(macro(^NextMemoryDescriptor$))))"}
>>  -config=MC3A2.R20.7,reports+={safe, 
>> "any_area(any_loc(file(acpi_cpu_idle)))"}
>> +-config=MC3A2.R20.7,reports+={safe, 
>> "any_area(any_loc(any_exp(file(^xen/include/xen/libfdt/libfdt.h$))))"}
>>  -doc_end
>>
> 
> Nit: I think using a file_tag as above is better, but in any case use 
> libfdt\\.h in the regex
Ok. Provided I will do this on commit, may I convert this as your Rb/Ab?

~Michal


