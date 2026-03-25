Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Pt/Aq1UxGljyAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 22:33:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F232C821
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 22:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263073.1555270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5VqW-00082u-LO; Wed, 25 Mar 2026 21:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263073.1555270; Wed, 25 Mar 2026 21:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5VqW-000800-Hn; Wed, 25 Mar 2026 21:33:00 +0000
Received: by outflank-mailman (input) for mailman id 1263073;
 Wed, 25 Mar 2026 21:32:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w5VqU-0007zu-Te
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 21:32:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5VqT-007F7O-R3
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 22:32:57 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c45475-5cb7-0a2a0a5109dd-0a2a4502c61e-28
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 22:32:57 +0100
Received: from [52.101.85.13]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c45487-63bb-0a2a45020019-3465550d5888-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 22:32:56 +0100
Received: from SA1PR05CA0015.namprd05.prod.outlook.com (2603:10b6:806:2d2::24)
 by DS2PR12MB9797.namprd12.prod.outlook.com (2603:10b6:8:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Wed, 25 Mar
 2026 21:32:49 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:2d2:cafe::27) by SA1PR05CA0015.outlook.office365.com
 (2603:10b6:806:2d2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via Frontend Transport; Wed,
 25 Mar 2026 21:32:49 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 21:32:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Mar
 2026 16:32:49 -0500
Received: from [172.24.66.250] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Mar 2026 16:32:48 -0500
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
 b=DZqaAnW4aro8WAugMLHX6zk7MTSGHH/oSPovMUREmcFaj8fKtLJEUKuSc+zpov++7mbZTe2eNpISHXSBzU8ISP477HJbTPHS6tAQCGJmrGiz0BP3rXXqdwqIc3vY1QvtgkDp8L3JRqOqTf16PAOiGRXLJj1kU9leBhTRBi9CpZ5OO/lPjnpT6nhj1qz7pKMwUpVZCf/LCTiTQc2EzGGbW++HHuV05AA2LKV3DQUbjsV3fWpCQAct3AXgM1nHGGqc/IkraMAv8Dcd5ENFy0zAMX92mI896xI6Zi8pQ+YcZpnPgUf2rFg0ssFI6YMXGQ+fSWvz0JXoQy3Ts4KmSDlQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ARDBad1bfc+Ep20ji2Krz8i0VzFmUeOG2n5LLiFqs0=;
 b=T1mfq8iYxLPhPaBML9X/Uk6lhKs9QNyI53i8U4JOJfzPjmsJuIEKeVs4WPTOYeE52sd7qb0Y9f6BcdtnemkpFfm64GcTLZPbbU7ecIQSyb3Mh9+7IdbsYKvV/iZt3UDr6farlykSP1UY5yFlDXGgD265SuiQo/YjTsJW2cZq3d+VXfyywxq3W0rCz2PZV0Ww3EJtd2WplLDZ/PONr3phILZbCQ74Ei5e70MtFIKJU1jF/TSNANFecmXN8Nrk4OSNdmYPes3MOJbX2FUpXrR/F9DHh8ZzP30RYmbZdHDAd2zUTa3olV48cNpmVxz22lAV3BxFOdlfue93dO/aVsTcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ARDBad1bfc+Ep20ji2Krz8i0VzFmUeOG2n5LLiFqs0=;
 b=fHNW4Vvt+mhJSB1x7we9Y7bR1nIWjixQsTOYqHiWwOv93qQ74FqG44zl1UPlekGJkXHbToECi4ukpFHz4ex/zaGsaSMQks+oLilQXasYNyGrYgi9HLSzzWBx2osFrWrvP0LvWvSGHAciYzZKak1oHNSrOTcCUK+K8pM96YoNkgA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <552ba562-e948-475e-a235-89663b9ff648@amd.com>
Date: Wed, 25 Mar 2026 17:32:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arinc653: don't assume Dom0 is the control domain
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|DS2PR12MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: c511f6f8-9614-42be-96ae-08de8ab61056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ubiuIdbMFVMeUC3TUvfENeV5uhPGJPV8RuM+Vmul8TuRJmzHSomzxM0McMBPf8dXFvtxychFuYexUyYN2FCl7EJPwHE7h6yFmJekpKUtokAlCj+inoW5pSuWOFudAQfuRI1QQvAigttSVetOi2BqmebO03L1/v8m5MVOvtzwn+dzRgxe9VVrSTBnp8+RKygosv3Ol2WkGMyspyy+4rjEIiDUFXJnBIrjoQcWilojRQOVYLAbKBgRGXH9JetnDqJysP8JWcaACALhcf5R3bEmySj/vnxVB55lfK2xdlWwpRq0oGn1RIo8JRqLpUtAPuu0TqlcKyt0J4uoQDTKUdLnMyqJZEkHf5EfYgmdsVQ74u0nTZo/yq8cdOg4YZYsC1bU6+URZsvxbmcnNLGw3MgOowuhgs0Xp+gxTAm+M2Y30MK++WQOxFsdcm5d9N4H4ZjaiOqUXwsn6TnXmAmeyh87C19W6hq+UtDJh/HxnyOER/sfNIKmeXkFZaO2NU7ABxtg/QbeveQtP+cKNEWA6RFrdAKENqRv+dIYLtUfjbm7bcnReyJVaAvadBcrlivanAYpPmhJm5eAOrpTn+djrFDt6pUpleOXxm8mFdAV1F6XN8nLjGxrhym8w/dSZ1cxuJ88R6AJbomYFYTcd3ELWQ4sHSYKSqY6e2bNXZSezvroNP8innJnyW9hfCCyLhkUOFUiunepInFuK1bTVtQxKde7PZ7RGKwyJPHHnm44ap4YJTda3ilyEmcP2dxw6duRVipyg2ePlkIk1+EmCzRHSZezWA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VGn9Qc6qQcU9sL5LcTD+HgTWZa+cUNuzXpUC3ZELihTciiGcNCtgpKFx/r3a7AAgEUpWwCKjp6rg0RcayI9moBROXJXakyraS38FKOzOBoopiKRaV+0zvxvAbfTIzMGmqOUrs/Mn5/vQK9OW6uv5LInPhP+j9T9Cna71DxQR5rsxptRl+aEBKhjRzTPZT329369xl7Wc6VDTgIFQSOZT/qJIrWNrKcUyn2XAjhKvroy6s6ci/OpyhhhCcqEKTTIISypvSrjMjWd29BVt3gEAIFMs8Q9pX4IpvEzCLLJeGzra8j9m6qf1v8RXGEIUpaA+VVl9El1OOCfCn/rWXFTc+ZvgBeZL6kxtweUo4mOZdJqHMyPt2HAmQsSrCSJNEmIGa6vrPzgy4NEV/qeSEMTdZX5yNFTIA4Cxo7xU2stMdMdNwp8CxD1azQR1EQi9KyXB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:32:49.5547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c511f6f8-9614-42be-96ae-08de8ab61056
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9797
X-purgate-ID: tlsNG-720697/1774474377-BE487DB8-7A7B3852/0/0
X-purgate-type: clean
X-purgate-size: 1543
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,suse.com:email]
X-Rspamd-Queue-Id: 641F232C821
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 08:54, Jan Beulich wrote:
> Leaving aside highly disaggregated environments, the control domain is
> what will invoke XEN_SYSCTL_SCHEDOP_putinfo. Its vCPU-s therefore need to
> be able to run unconditionally, not those of the domain with ID 0 (which
> may not exist at all).
> 
> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> There being no "else" to the if(), what about other control domain vCPU-s?

I wonder if a panic() is appropriate in the else case. If not, at least a
warning or error message should be logged.

> And why are they added to all scheduler instances?
> ---
> v2: New.
> 
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -411,10 +411,10 @@ a653sched_alloc_udata(const struct sched
>      spin_lock_irqsave(&sched_priv->lock, flags);
>  
>      /*
> -     * Add every one of dom0's units to the schedule, as long as there are
> -     * slots available.
> +     * Add every one of the control domain's units to the schedule, as long as
> +     * there are slots available.
>       */
> -    if ( unit->domain->domain_id == 0 )
> +    if ( is_control_domain(unit->domain) )

Sorry, I didn't realize before that is_control_domain() includes the idle
domain. We don't want to include the idle domain in the default schedule here.

I suggest adding '&& !is_idle_domain(unit->domain)' or similar.

>      {
>          entry = sched_priv->num_schedule_entries;
>  
> 
> 


