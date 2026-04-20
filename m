Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNyEMoIo5mnesgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:22:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E142B97F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285794.1567036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEoYw-0004C1-9e; Mon, 20 Apr 2026 13:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285794.1567036; Mon, 20 Apr 2026 13:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEoYw-00049T-6S; Mon, 20 Apr 2026 13:21:18 +0000
Received: by outflank-mailman (input) for mailman id 1285794;
 Mon, 20 Apr 2026 13:21:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1wEoYt-00049N-VY
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:21:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEoYs-008aU7-QI
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:21:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69e62846-5cb7-0a2a0a5109dd-0a2a450cc074-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:21:14 +0200
Received: from [52.101.52.18]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69e62848-62f1-0a2a450c0019-3465341299a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:21:14 +0200
Received: from MN2PR18CA0027.namprd18.prod.outlook.com (2603:10b6:208:23c::32)
 by SN7PR12MB6960.namprd12.prod.outlook.com (2603:10b6:806:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 20 Apr
 2026 13:21:07 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:23c:cafe::5c) by MN2PR18CA0027.outlook.office365.com
 (2603:10b6:208:23c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 13:21:07 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.4 via Frontend Transport; Mon, 20 Apr 2026 13:21:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 08:21:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 08:21:05 -0500
Received: from [172.26.2.83] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 08:21:04 -0500
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
 b=crj+gKooDR868SYz/S1oCTzLnhBRpO2qmwCDbS3MqHFwZg7RyqICkPUwhvzt7FuANN/w71+mXRaSc1Yk2QnqF0CPzLxCShnibJFqyueqUg38soH/ReWODqoJ6nY1wI7yiZU5udkUhqhm4h2odYnFZaaFaSqDdZeVIOGeJDMBsMIs8HCYEYYjm8ITn3uLmiVk19vGx79QUoAyN7XRtuqVJefutIi8NL3HzrMfFBNsaVX4w1QxMvUpnEuXX7+G/RV8WV6J5T3slezacxH5z2JOYs0tFnd3OgSkW+1kVS+mPl1VyssDluMW9/gg0Ot6gPafskcDGzhnzhA/DUdLgPGvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DT3efmmIrSseZIrFeBGpFfMlgM2s0QUseUAc5mkpCM=;
 b=WPwIZAms2sN9cJcUHZKDvMnSQcEGnqcffpQPcfZ2AuVkNS+L8EgDoSrIGjhvrmE7eACqn75XyBgOrNdXTlZwyKcah3Sqma3QgzsjDjYcoimnKIt8EK2EraXJGP5W+PVqnY+3LdLCZwqttfrvaKBxe2AIKvk2Vv7+CB+CrNXuj514KsMo9xPe+tY192fAMXebl6Rljlhx00RxP6meG059SBbQs173WrMGMTSkFDC3PbpBxj6rVQI9SzBQkietvzw8n596YnP+deVfn0JGNrOPX/7dzlSCojm5rEF4DFm+5xaxtS1gZsJHvqZuqsPjJre/LuLZiPPN69q0IdIcR5qM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DT3efmmIrSseZIrFeBGpFfMlgM2s0QUseUAc5mkpCM=;
 b=JMED3bl2VSRWwDzxIq9CAGtOASzV6WBrLam5ZhcwAHDgfnhp7SNx6inyVcBtjqUafuv2cl6amaCfbbc2RFCnihHM9+9jQTgc1Qda0NJDVC6DSmRj4upduKa5lSJCruGm0YyqTjCZL7KBAqJ8D8yDY0W5Mu5cM1b3n5KsQbfMPkM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8ae3567b-712f-4f0e-9d5c-82a949651b74@amd.com>
Date: Mon, 20 Apr 2026 09:21:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arinc653: don't assume Dom0 is the control domain
To: Jan Beulich <jbeulich@suse.com>
CC: Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
 <73e51afc-ae7c-4d08-9054-75dab660bf42@suse.com>
 <ca934061-f3e2-4511-bdad-465c4f2d0de1@suse.com>
 <fa04f9e1-bc9e-4b34-84f4-dc7ca8999eb3@amd.com>
 <4dfd48a9-37c1-4f28-87f3-19646a339b08@suse.com>
 <7ea3a5d8-f9ff-4296-9b3e-07b9ba184e6f@amd.com>
 <ef1e2846-2f75-4358-a6ed-a7d45e617fea@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ef1e2846-2f75-4358-a6ed-a7d45e617fea@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SN7PR12MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: a31a10ab-5449-4a3e-edff-08de9edfae4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|30052699003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UJQ0KszG44o7CTvkGJkpZyuABt5mgmxqJc/nNEkubELfABTWwN2dh1AIpgY7Hhl+d1owi4bG8njaMWGPdUg4yf3S8Pfj7GI21fwRMGpqaYc9nfgf/Dz6Cs8F2oMCr0sxWiOy9NeoawJgpZF8eyghP2jgzXMnaKJENCdrbz4vrW3hr+Ix3R7QnYe49ZSoffHlErzmT5emRtYHc0Grk+eR9kWrp+2PoI5195GCxkKOKyQ3WZgjMVTA5i08K3mQh+/m8l8UtEnqaRNHgnF6SK6zENlYokuCWHArbsoC6IuYnvZ02hzoVYKyjVIEIzwSECquqtFvfXni/VfA7bVxQsynTRIcHXI+Fy7GDHq9rqe8HgfF0cYN6E3BLXEuI9seMp4WGioVSU/PM9KRc175kceDpdd6Q9paR8PSFEYAuZGLdSMXSA47GQf0mFur7gQ74p5cz791gjnDPfw1/A0FwGXiqUghCibwFrEp5Hgg1coI3jQWrwVv0VoCCtYeGwlg3dPBDyNoUpjrVc4KIJd6EV3vQh2PC0Bi08ypg8oXPJpmCjqkBPc0JyjTJthrcmLNJeLntIax/sw2t1eyBnQF5Aq3WFL9/BuVfdwkX7JSxwRHw/iv/go9fvu11O2J5ZrjMWjXSzq+obyRPi/BLLHWsDNJ17Tvq5/HR7qQS2EX2j2RV3gv+2UQ7UXdQXyL3VAW29mlv2LPTkYgn0rbMO8vTPAkrw6hcnYDvoE8NQwr4k2TFG1m+gPEFSSxHob3g55mvc1OS/xOFnymTwzlLP6wCkcf7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(30052699003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0P0OfftKNXzcyB8koImd72FNLc/NL52a3QCanlakIPJm5dr5hfk4oMyUbbG+zmWzaIFeJ5R17vOPY+kSUB7aFywrvcnHc6+wSe6c07DlZ1gh4iYcExtd5157F3nRGCjmtO/87TGGVnzxRXUj1yM+/PoiM0PO+liS6KKmBIBkSSiOZn+YLSIeNNp35Lnioy+tNQyzx6/mL3LVS1LZKYLRzZEyLFO5Hx3olmJRg/zQWBEoTHf9EbhdZMThTyfEqpel8/WGu7dAqPxXhbKNacZkMUigf3JpCK3iVONZvkkVAGhduBo2Eu9hrWqlQvF99cMhPlAn0ehswCgtmfcGSwTv/iw5z8SCQs0qppzXEdy3trAngsaZQG+ikz+A7Uvumo6oigxg/VRMG08LAmNrXy5jtVoq97WapHtCJm4XdCyYOnaO6bomcCrZokFE4Gs8msiK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 13:21:07.1903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a31a10ab-5449-4a3e-edff-08de9edfae4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6960
X-purgate-ID: tlsNG-d25034/1776691274-6CD63CF5-7AAFDEE1/0/0
X-purgate-type: clean
X-purgate-size: 407
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: E40E142B97F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 08:28, Jan Beulich wrote:
> On 07.04.2026 13:27, Stewart Hildebrand wrote:
>> I think the patch is good as is, but I just want to give it a few more days to
>> give Nate or others a chance to chime in. I'll follow up next week if there's no
>> further discussion.
> 
> Ping.

Thanks.

With the patch in its current form:

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

