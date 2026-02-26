Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RfWuGjW1n2mKdQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 03:51:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0BC1A034B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 03:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241185.1542338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvRSS-000676-KG; Thu, 26 Feb 2026 02:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241185.1542338; Thu, 26 Feb 2026 02:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvRSS-00065y-Gm; Thu, 26 Feb 2026 02:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1241185;
 Thu, 26 Feb 2026 02:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUpi=A6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vvRSR-00065s-84
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 02:50:31 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8739260-12bd-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 03:50:28 +0100 (CET)
Received: from DS7PR03CA0328.namprd03.prod.outlook.com (2603:10b6:8:2b::30) by
 BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Thu, 26 Feb 2026 02:50:21 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::5b) by DS7PR03CA0328.outlook.office365.com
 (2603:10b6:8:2b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 02:50:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 02:50:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 20:50:18 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 20:50:18 -0600
Received: from [172.24.237.99] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Feb 2026 20:50:17 -0600
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
X-Inumbo-ID: e8739260-12bd-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf0VQq8lsgUdD8RvNZfGg9rG0xt7uVKZVsX0XBdhLGEcpuaE1qnp7kzJPHadlVruK0RIZ+9tdCPjshW1RJuFwO6V0lwZm+nij/N2o38ItprS/Eb4CPOUPKfwpgMMhsjHi7sjtbGZZucEDKa3yNAHYtZb1dSfP0159QBXcV1UtWtbBGtkOdXH1KtqFEO1LKWBX08PkJN5OPy3H4xueNR71SJjMkdn53eU0ub64/H9/zlz6LSfMgOJQqC9pdRL5YePVWdIhDhuBUBELg9DyCkUQnSLjhmpHUGAt2cQGgslCSDwo9MOphL2xiGQa0RgK/38pd5dSyMKNpLuKZuphxYIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOhfFcZ1Kl2mwEYxFjm/DvBdB6OvJHKuNoWGZ+Z69lc=;
 b=gjqpRP8GGH+ojsnpE6xDeAKgbI80Q6qDsccaT/q3E0RfJ1mXlHqcpVh8z6BzVdvCzuahFwiX0VtrVdAyHDW25xmbx/hTXD5fX0lAj4Q1HVrir5HcpOfU0nhRtUuLHjDay+6PY5AXKHaEHIsbcIVCz3DX5RQXyWU1f3SSRqBhOGThq416Byp8qRt4IrAMsuQIn04xM2nzS9Cj1PkwXPbFYYo6hDMjXb5SZaKL0fpyCLjHvOVsRhBA9c+Q6AvafbXbM2+3QtvWrswXJ43yJwS7zrWquD9B85cCpn9aexAKQtiqSZAJiXXCbW0uH8I9FplXaEsU/f6HvZpF8rSl/tAHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOhfFcZ1Kl2mwEYxFjm/DvBdB6OvJHKuNoWGZ+Z69lc=;
 b=cT8OqFwtcbWXsUHyYC05mMg35yKan+6bvZ1QnlcVyv32NvPzOnhFPcydRgAfkU9rrNIvsHTadzlQK8/eL1v6+DMn3vhM2IdHIcFw8HykkTvqOtp9ytWpcPqZCXbOB4Djsy42q7CGMc1qdlD8gW03ayvr47mU2JYkMjB0HgVdLz0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b4a839bd-78f0-4fb5-a7db-dfc2f4ab037f@amd.com>
Date: Wed, 25 Feb 2026 21:50:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: zero guest-visible BAR addresses to ensure domU
 asssigns its own
To: Jan Beulich <jbeulich@suse.com>, Ariadne Conill <ariadne@ariadne.space>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Steven Noonan
	<steven@edera.dev>, <xen-devel@lists.xenproject.org>
References: <20260224231216.6203-1-ariadne@ariadne.space>
 <2aef1aab-f1f4-4063-8c61-d26ae335d06f@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <2aef1aab-f1f4-4063-8c61-d26ae335d06f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: c28d5ab9-bd53-45c6-915d-08de74e1c7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	njrkWHIbwLxG+iaS0Ft7ZbcalMnBMRpC/f3jF0wrMyLYkYkbel+NWWB8wG/VYyeJT02Ej90QIc1MCJuT9nm+nyljgo7uzyDpAF3NIaLBbVaG9FWQALQeZJgoeR70TVAUoPwyABIiRO6+onRvcqAaJjVd0gLdxbK1z/k8g8UPdMzfeFwvjIFuPy2XK1KR+jCs2XqB2h7buOl4AOjCmY/7g1cHNGjQSFIrESyKbPGw83BFKnR/A5MnGNoF834SQT0GzanZdpHODbGs5vqK/6BDFp31TwaAn1gATUwfuqARfos3L0v7Ccwr80rQLj1jrg0lUSjN7h9t+S89rNIXE1kZsLnNoKZL2fBHa02uwZjn3aU5GeAyIFs7ZdO+aKq8phTxoWPwIfq93i4J8DF1U5G3lkvsz0aMpz0J1nwHv5R+Wr4EMf9er4ZGapSDvz3GU24x90Kvc6quBl5MwFXYPpr0K0ssyViV33WTyyAjJhHx7Z1IyZwzmja+2HsDELLrQpMYbKBuMw1Elu/7TD+3bAwl7bVolbJ7bZSuG6vQu39SihYD3+mB/7qm7VQ76ahNagKwxc9HbYBVWMjq5K42kp6O5iDxx0BgVpDKqlKqdaaooi7N/6WrTC1IdnIlAFs6780PlqxXtv316+Ei5L9/g4n4glVrR2XhIBdlS4u2qnKLLZ1m+l5j2VRZ1OV2+7qWxwPBjTBMhcQMU1JK/ljRk92Uw8Qj4N3iKQcajsVO81Hhl2fxJO5bUblWPQlJbsqJ77d74+1T0fzIGJK8YibWCVnE2JqLLKDTBovACcTrLkXxmhLRS/odt9/H92QQshtB0duZaI2tg2ogqnKcmbTswclcMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1i1E+HVzQNyYnUm1/zGMSKeuE1G/9fQZK/j8puz7+b2bnay4Usoi4eFRysokVOKlVmYVLXHn76h1eJ06IkXml1d/nnpe3hAqQJCoC5miB3xmde+7kcyRbwcIYDRZTcRTT6nowetWABxC5NSvKUK6olxE2J3mZLb4/4YeNa2N3SfPuLWijtIr2GN1rdAVpeU6/p2HZP0j+3OEPUvpCdIil66OrYQ7PFXiKye+ErvbdpVtSgpXaLfMeosPvgzoxvV8KR+yGXQ8STEH9DMMRUXq4rcQTTSoZSggawe94hAxjuu5e1QdqTMol6PmNx06FgMk51mjn8xPSDhamsM0qLjffWVhn79I4eng5GjQbgub4XT+esQN164Wpvk9v4syyQqhnAL+wWH+IvUtVs3Tmiw4Kqcyhzj5rHTlyjfyDT4Ebf4ANo4b7x4BQM6Ixfekphoa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 02:50:20.1887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c28d5ab9-bd53-45c6-915d-08de74e1c7dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:ariadne@ariadne.space,m:roger.pau@citrix.com,m:steven@edera.dev,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[edera.dev:email]
X-Rspamd-Queue-Id: 7A0BC1A034B
X-Rspamd-Action: no action

On 2/25/26 10:37, Jan Beulich wrote:
> On 25.02.2026 00:12, Ariadne Conill wrote:
>> From: Steven Noonan <steven@edera.dev>
>>
>> If we just use the host's BAR addresses, the domU might not attempt to
>> reconfigure the BAR ranges and may never try to map them with the IOMMU.
>> Zeroing them ensures the guest kernel knows the BARs are not configured
>> and needs to make its own choices about where to map the BARs.
> 
> Yet for this, don't we first need to expose a full topology to the guest,
> i.e. at least a host bridge, and maybe further bridges?
While we eventually do want to expose (a) virtual bridge(s) to vPCI domUs (this
work is currently in development), I don't think it's pre-requisite for the code
change herein: clearly, leaking host BAR addresses to domUs isn't right, and
there's no need to wait to address that.

With that said, the commit title/description don't align well with the code
change. Assuming we want to move the code change forward, for v2 of the patch I
suggest dropping the 2nd half of the title, and reworking the commit description
to focus on describing the code change at hand and less on what the domU might
do.

