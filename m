Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAtMNTdpDWquwgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 09:56:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364A25893C8
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 09:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313650.1583766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbn2-0007uX-B7; Wed, 20 May 2026 07:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313650.1583766; Wed, 20 May 2026 07:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbn2-0007sH-8U; Wed, 20 May 2026 07:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1313650;
 Wed, 20 May 2026 07:56:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wPbn1-0007sB-2I
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 07:56:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPbn0-00ERAB-Dr
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 09:56:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0d6925-2eae-0a2a0a5409dd-0a2a4502d10a-24
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 09:56:25 +0200
Received: from [40.107.200.18]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0d6928-af86-0a2a45020019-286bc8120b14-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 09:56:25 +0200
Received: from CH2PR11CA0011.namprd11.prod.outlook.com (2603:10b6:610:54::21)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:56:21 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::53) by CH2PR11CA0011.outlook.office365.com
 (2603:10b6:610:54::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Wed,
 20 May 2026 07:56:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 07:56:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 20 May
 2026 02:56:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 May
 2026 02:56:18 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 20 May 2026 02:56:16 -0500
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
 b=Fgszy4I78oOtQRf254wGTcRQ0oWkElpcQnhmuEUyDzZKVBiE2yaRecwreZoDtzpZ4iqasc4/WTWI8TnsbUU5fPKmjhWAN+rj4boGg7rOYusB5MMZRE/G809H+1n4IW/dI6qybKt+56I/bwiulvFaAoEoe14hSQOOcKpkQwk1Id6L4hKQxmKvvanrAIZQm4lYrKYJLo3KLGc1cw1eVIaXMOwnIWvlprgr07+rZQln/aJa37riy33awg1x1y2GXpPwS/bXcwJCuqxFb/YQryZ9jobuIM20lq354Z5sV0JrGRIF7CN96YxXQREv3TkQdOMpwe1pHzVzxIEgeAPb1FF7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR6+fktXwIXkaRDI+OMF+BgDVBMQl7kRoFmawKgfKDM=;
 b=jIRG9ou8Ly7lFseQjY7fL8RHGDXs4P15O7hjEZwy/a/QxPv6cczWYiKniaNIjzHnS7u3R1g1QwewMn7cgYzly+JXfYeb4OXhHnumy9xk3vjE84f9KiryKC5lNI86lLrboNlBQMihBxtJ9PDNOQA/vQ5xMuFmve7JUt9jtnopPCmFrJ8B0yWeQQmBc1Os5MO5IozVZWf5vq1GU7bYFNTCqJm3t7lFW/3rafxxSlGWo8QswVhqfFFtNa5V56U1Bymk62qwWrUY1jpJvOOZQfV6TR74Vj5MObjLuYh8AoP97oX46G2zOVDbjCcRBaG+zuuG1ElJUmRVLBi7tR6FbxCrFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR6+fktXwIXkaRDI+OMF+BgDVBMQl7kRoFmawKgfKDM=;
 b=jgglXm3N8oJ4cGziJy6d1moH2KJI6jNahQ1W06FvvMC+2Ckl898/N2D/PynsYniMYFgb6hy8yQgcPXgBKuccSCCrvxw5JusA79BIpcHiKBNfU9lbM5dUN0PUcuT0P/0LnmNKMGNH4HXG7SIyYL35Ce1knM/1v5TEw+HcQFxZ0EM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8bbfc208-1fb7-444a-b1cc-b978270f65c5@amd.com>
Date: Wed, 20 May 2026 09:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/libfdt: fix UBSAN null pointer in
 fdt_property()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <0addc679de64cb59b28cf49ba3d39d17443d1ac8.1779179301.git.oleksii.kurochko@gmail.com>
 <ca61a607-2f55-47b6-93f2-c25079dfd88b@amd.com>
 <e943765c-45f6-4802-bef6-e2fffd49149e@gmail.com>
 <8ade5ff1-a702-4a91-b596-a98833716c20@amd.com>
 <bf22c29e-3388-4531-b14d-dc32198500c1@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <bf22c29e-3388-4531-b14d-dc32198500c1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CH3PR12MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4ec057-90f4-4a21-3fe7-08deb6454800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|22082099003|56012099003|4143699003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	JYjXLPS4YvVxYAQiWJYnUzPKMA4KIOT526gfvSZe0Zg2ShfZwCLL3Rdfby8EkZFHJbYNwFbiuIXm6Gu6MzzlbCYGdoZeAff/9C0oeOgnqK7juJzq09JBTYOGgClHZZQGG3vzqDMptzmoIBiKqcTELvpICCqq//SuVpDx0oy+lvy0pifzckSpV7aXnR0nKqv/eIJ9ZFHWruHR0zswNnrrSrs9MBabrxY8baxQqJsbb8t+6T9db4wW72EiyO6nUDzrwnKV8PE8nGdmxd31Uh1Uuj+C3zzta9hGdnM1Z6E2o9vuAk/9LTB8ZO3vWr47NSscpRCTDPTCJARwdd2nskGWHctAohAGpnmX7k34JrxbURo9+JHp6eVeaqW7RWdOqj2WrwOD0uYysrFoi+VfV8Rz9S+/ep6pC8GK8l6yfp+WzBjJZym6wCgVBxkoF1LE1pWow7jB0bvlMSOTcrF6Qu7Xo5A32F8920p+i5+WIktcnbZKkqCuF7TfNP60yJ1XYClRjbvYcZCcO0lNCMgNXZpd2s2SoryIce0wM8B5++zvspj1pLS9jUg8nTjGq7GlzmjIO9mKGaIyessvUJ+a0l1DQoRLPHzLd0rpeL5nR7BkTl5rEWkKGCkc4yj/Xmdp7BwpkIyG5QEFysiGZ2gaeetJ8XNs6S3nBAdbSFoNbbXirMhnaT+yMmMj07JbRvoORc77sZ83/GWQjztKxAELs6943p4dTHu0X2SquDnc4QEZPzk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(22082099003)(56012099003)(4143699003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zTYYu6yq6ZPFJtjxWZCJXl0gb0J3VljyDM/jMUchlsR9CaOHcJsH4yUFsK3+PWegnR/duUVVTieirAIDNjG8ZcO3z4u/bMeYNiApdpj5E7sHy9SWE7y1WMxQQaU+BEAr2g86zXf8n5LA0roexsjBQbx0HvfVJQ2OfhlwtXuQOV4/MUMOW9a4yqXOuX3/I/6RXJ9AZOCzLzZBjIPisiFueqRjxT//8luxKWgu70/0QDBQ3zy1DiQGnqMyMHM082gLY7GQVPkRp3GcGGP3whfJmcmd/dN2tMbJodNAkiQ3oTvhpoCb6Fbsn7fjthiQ86JdhcPLMiYjgEd9j6UK2BZ3g1qHtGHV/cXi0uU2zU04jNFtctnlqCPS5v7gdAgxkZP5s7xko8anKB9i1y/v8f3+AhVKZ788nIINo2G08mCk605CYWQOxQIuiSCDoSvTuW89
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:56:20.9368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4ec057-90f4-4a21-3fe7-08deb6454800
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169
X-purgate-ID: tlsNG-720697/1779263785-AA56B161-A0CB02CD/0/0
X-purgate-type: clean
X-purgate-size: 1415
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,xilinx.com:email]
X-Rspamd-Queue-Id: 364A25893C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20-May-26 09:51, Oleksii Kurochko wrote:
> Hello Michal,
> 
> On 5/19/26 11:37 AM, Orzel, Michal wrote:
>>>> We treat libfdt as external library and we don't accept any edits here prior to
>>>> first sending a fix to libfdt and then cherry-picking a patch (in fact, afacit
>>>> we then do the libfdt version update).
>>>
>>> Thanks for clarifying that.
>>>
>>> Just to be sure I don't confuse something.
>>> According to the commit ...:
>>>
>>> commit ad9cf6bde5b90d4c1e5a79a2803e98d6344c27d7
>>> Author: Vikram Garhwal <fnu.vikram@xilinx.com>
>>> Date:   Thu Nov 11 23:27:20 2021 -0800
>>>
>>>       Update libfdt to v1.6.1
>>>
>>>       Update libfdt to v1.6.1 of libfdt taken from
>>> git://github.com/dgibson/dtc.
>>>       This update is done to support device tree overlays.
>>>
>>> ... I have to send this patch to git://github.com/dgibson/dtc, right?
>> Yes, that's the main DTC/libfdt repository.
> 
> The patch to dtc repo was accepted and merged:
> https://github.com/dgibson/dtc/commit/f57e7df35df4a301961cbbf9433ba4e85c2ee5ed
> 
> But current version of dtc is:
>    $ cat https://github.com/dgibson/dtc/blob/main/VERSION.txt
>      1.7.2
> 
> Does it make sense to backport just one patch to Xen instead of updating 
We can backport this patch only the same way as for example here:
d434dc4ac182 ("libfdt: overlay: change overlay_get_target()")

~Michal


