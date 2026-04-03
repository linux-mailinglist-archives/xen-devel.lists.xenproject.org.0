Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN5TDGcM0Gkp2wYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 20:52:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E9F397628
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 20:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1273254.1560195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8jbr-00033X-2U; Fri, 03 Apr 2026 18:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1273254.1560195; Fri, 03 Apr 2026 18:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8jbq-000334-VS; Fri, 03 Apr 2026 18:51:10 +0000
Received: by outflank-mailman (input) for mailman id 1273254;
 Fri, 03 Apr 2026 18:51:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w8jbp-00032y-Gf
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 18:51:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8jbo-00E4cm-PZ
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 20:51:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d00bae-5cb7-0a2a0a5109dd-0a2a450ba402-46
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 20:51:08 +0200
Received: from [40.107.209.50]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d00c1a-bca8-0a2a450b0019-286bd132ab92-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 20:51:08 +0200
Received: from SJ0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:a03:331::12)
 by SAVPR12MB999143.namprd12.prod.outlook.com (2603:10b6:806:4e5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Fri, 3 Apr
 2026 18:51:03 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::b6) by SJ0PR03CA0067.outlook.office365.com
 (2603:10b6:a03:331::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Fri,
 3 Apr 2026 18:51:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 18:51:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 3 Apr
 2026 13:51:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 3 Apr
 2026 13:51:02 -0500
Received: from [172.17.186.79] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 3 Apr 2026 13:51:01 -0500
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
 b=B3hbgRxyaBq5CBnIW9dhbEvXJkU5l5GsdUmWJu6RCpfkRC+RPHLFH7k9XytesAnK1WcsQwsfTgovCEQzBXLNqOV1baY5OEpK3EW9b4+lOMGBid4DEe1nYl9kdNeeZMYiATq4a2Q6+cfizHy0hc9rbIs0bk2neUeWc+i0Iu/6mcZ8loldBUwdv2u5VffsQ8CYZ+rrT1yv9W02CeRAS8/iga5T0SKvE73kjVfKOy5iv28Pcu2jJZYrpR1aV306qVf1kw2JpFu6wdP5VzOeOs4rONCYvlTp5yESh9VVVcx+JudHAvnG01qLCzotaLP18+CgUZsdgI/JZO4KAo5H7jS07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC6lf+/IxzAXK7sLui9otpPRDv6pzf0mVrn8HUpJay0=;
 b=MIuMkyK0iSB6Z9njTlCsapLIwQTvSfGLwFrkbA5jcsCONNahr6ivmjkoz6IRzK8rl/jzp7q3LJ1wNutJn/kz0qeX4Uu2YW3GEMR7U1+4d4JhrcxS60hXKoSmpQ/jkwCouKOpczKka7XLNWxcD1ynCMECqr1q15BE2YYha8E/EpU2qTfCqwjOFyoT2sSb3hSsNHz3B3YfbK686Iqqn2jQzuYk8rvEV9N5v7S+jSK3kEfY9i/A+lQM3tVbsc3dIDi8Ue+RG7Oruhj433seNnegC+HI2clkTcMl+gDnflvQmawz+COSIZ+QCyzpjzMt3SRsUZzpQ2zbIOhQIKKIYKExDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC6lf+/IxzAXK7sLui9otpPRDv6pzf0mVrn8HUpJay0=;
 b=LMtb+BfHy8fYtlAjtrewy4NeIPKQ8O9Ha3TAbBP0gvwvsAWcJuA2I/+OlI/dPMWPdo6HZGqGdDuX3wLtGSwxi6PsohGN9wDSSCHOSyBQHhO/+qlepziXKF2vrYt8WpKxPiCxyqFwDtISBrYhY3KGDK2oAAkyVK0XcV8PXYsBwiY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <746e808c-6219-4f84-bb53-a49a95ed4085@amd.com>
Date: Fri, 3 Apr 2026 14:51:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] vpci: allow queueing of mapping operations
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260324030513.700217-1-stewart.hildebrand@amd.com>
 <20260324030513.700217-3-stewart.hildebrand@amd.com>
 <d792d3dc-a99c-4dc6-a3d0-13b9c2762299@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <d792d3dc-a99c-4dc6-a3d0-13b9c2762299@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|SAVPR12MB999143:EE_
X-MS-Office365-Filtering-Correlation-Id: d44835ee-67ec-4494-7524-08de91b1f4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003|13003099007|22082099003;
X-Microsoft-Antispam-Message-Info:
	nzFG7FXLlxhowY6zb47tzay+J8pKAicys6bzWy/5QFJo9gxN94btv6xsNInedP/wsVi1nF8nznwcnOuifJEQ/jPq7AAEU8UhO9EmacQWAQEpO6ONFUAzH363M5/wFPgR4cs9Y3HYHEOgR1eJrx0xfyWw9x6247c9xebkvJfvxS/oL9mk8/9Cf76RICy78xBZYax60CyKyBlPwXnuY7tNMZ5FjglAg75yk1V/CTNmh1+WeaIbrAb60fmUeb/frsngSqdtouffV0yOjb19owBWOg0bcXZsrHJWZtQ19d830lW5z3hX0KTXCQ3EGKU1rZSAyvXyalB95MFXOLv4Wrd/sm78oK8FDYz+9+SAvVJVyMU3y+kyTFsG1wzb3O1ibbx4uWnrjegE1lRKy9yFsY7elHUuZ2xhQW9xOAXbVUQflclu1db/0uIIEYtwHDWH/RUxKwSUaLeJGZmTZW9P9iY399ygmqzP5oTbQolV7rsupUJ/X7Ra959PPnKBk0fQU4pVkeOHONDaKu5G3iFZuwo83D7FmUWnatAXcfVjMoDO6CJDDykon/KDe229x+0lYsWu6KO//mAbPPSffJ5YTnhjEYPrnpdSkxW9SkrCCSRpY6EwK0kGdawP9C00V1vbcDRfURbFO9Ky7UpLsMo1xMtz5so5zWwPVhZTdfLu6FEyrCU12Cwn6TT7SPoHxXrw8lFHCxVuoBxjc+N+dT0z8NG6AVq9rxJ0HR9hdvzcTZMTQjE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(13003099007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4yau+5MtKFQewfJYaYqbUIutXYgHCHzAUlHA12LYYEgNmBlvpMNc6lZx3qIJH5Fh8LBc9+dJKHb4hkliAhp7Kn6t/Bbb327cbv7/CTpda9+Us7N0EGeUxzX8QEDIrcAta8PUBMFsZPcBDsfzSAFv03MJmXFqtohvxD4gMN0KSmgzeviDKEhJMWjg7AFSmQxwt2mqJoSxkL671hzrdeLhGNK8uUioy+glS7OhEeRjBIg6RalzVnAa6MiMUoA1O91QvFtnN7XZa1c6gCMHAhfiNHaie9iZ/9Bl+/IeCL8s1oZNevSL4rk1tk92V2Zwf9PfDpblwdXplCOvoS31zC+bEfJyIFyUH+ndek4463+PbuyhAuEggJE1PbzIWdzI7/2NePfvFgWwaTNDYY0xbF4TitChod9heRGuMxTNIQ6mNtAIJn/lcgYI0CvSyIS7SryE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 18:51:03.4617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d44835ee-67ec-4494-7524-08de91b1f4ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999143
X-purgate-ID: tlsNG-42698a/1775242268-F53CE2A1-837B41EB/0/0
X-purgate-type: clean
X-purgate-size: 2015
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 81E9F397628
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 11:52, Mykyta Poturai wrote:
> On 3/24/26 05:04, Stewart Hildebrand wrote:
>> Introduce vPCI BAR mapping task queue. Store information necessary in an
>> array in struct vpci_vcpu to perform multiple p2m operations associated
>> with single device.
>>
>> This is preparatory work for further changes that need to perform
>> multiple unmap/map operations before returning to guest.
>>
>> At the moment, only a single slot is needed in the array. However, when
>> multiple operations are queued and pending, there is a check in
>> modify_bars() to skip BARs already in the requested state that is not
>> accurate. Remove this check.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> apply_map() and vpci_process_map_task() are very similar. Should we try
>> to combine them into a single function?
>>
>> v2->v3:
>> * base on ("vpci: Use pervcpu ranges for BAR mapping") from [1]
>> * rework with fixed array of map/unmap slots
>>
>> [1] https://lore.kernel.org/xen-devel/cover.1772806036.git.mykyta_poturai@epam.com/T/#t
>>
>> v1->v2:
>> * new patch
> 
> Hi everyone,
> 
> 
> Would it be possible to move back to a dynamically allocated number of 
> tasks? This would help with mapping SR-IOV virtual functions a lot. 
> @Stewart @Roger, what are your thoughts?

Yes, assuming each VF will need another queued map operation, and there could be
a lot of VFs, statically pre-allocating that much seems wasteful. Only the
control and/or hardware domains will queue a lot of operations, and only when
enabling SR-IOV. DomUs will only queue 1 operation (possibly 2 if we will allow
domU BAR writes with memory decoding enabled).

So I'll plan to switch back to dynamically allocated map tasks for v4.

> Alternatively, I can continue with an approach described in SR-IOV 
> series, where VFs are handled separately. I figured out how to return to 
> do_softirq after mapping each VF, so it should not block the CPU for too 
> long.
> 

