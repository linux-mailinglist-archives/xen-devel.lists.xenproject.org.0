Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJJSEW6Ly2kuIwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:53:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E036679A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268756.1557969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Upx-0007ZS-1p; Tue, 31 Mar 2026 08:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268756.1557969; Tue, 31 Mar 2026 08:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Upw-0007X4-Ti; Tue, 31 Mar 2026 08:52:36 +0000
Received: by outflank-mailman (input) for mailman id 1268756;
 Tue, 31 Mar 2026 08:52:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7Upv-0007Wy-Vh
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:52:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Upu-00HHKr-To
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:52:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cb8b4b-2eae-0a2a0a5409dd-0a2a450c8a90-30
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:52:34 +0200
Received: from [40.107.208.9]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cb8b4e-f93d-0a2a450c0019-286bd0094d84-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:52:33 +0200
Received: from SA0PR11CA0174.namprd11.prod.outlook.com (2603:10b6:806:1bb::29)
 by BN7PPFB3F5C406F.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 08:52:27 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:1bb:cafe::d1) by SA0PR11CA0174.outlook.office365.com
 (2603:10b6:806:1bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 08:52:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 08:52:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 03:52:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 03:52:27 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 31 Mar 2026 03:52:25 -0500
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
 b=bZFo1QlH51koLeYxeq1SYGk9slF7fiOw7TtM4ie3WYwK/6MKf1jZyuOu1SzX9It7M5UI8j/mRNoe86ZV3rM8IqIHtjDQFQqitBAx6roBg6WfZr5DQxzF50En/djNHdwIYjnWLYzcDY9gvSOaFPs9Qu55IEbB1TXyGDNvakoRq+tZ8W8DoPexGTQ7qjjP3PzRQn9L4Q62IBK1BtfpOAxEhevZwgTN6+qAXGhlgQ0EwobHWrAjXccfstyzpj61dnjNFfRfrK9KL8wUIkBZ2wJcJSOy4YIPBkSm7y3xSc8bi4ItVct85wPUYxxKimmsQIz9Au24BEf/Tmf+rN/ImxGdxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aH6Vs/gC+BRkmRErpIFki4xHhEkEDlyWbKkqon5hdOw=;
 b=jigxZDxGyF8sHFFP2ACpgfBW9b1ChTXMLiMKpqv+5opAuCcdAxjJySr+eiH8PD9uy9nddv/ZHIThM70Bt9tV2eZtLNdFS7yEVEY0KMkKNdk0w6nHO/5Lw9SuHLeVWVGdsiOBZo+hbBeRjpObjfOvDihy+KnSo5rsbem24YSSyTDusHJBGGOnVz6I/89zTp/IUNI+BysP/vJGkYcn5xvpTzmq2cKtScgQ26RBPxhA9x8EjawDHhzuUwvqovypQqtQ/pJbreKKB3Y7tguI8VIhijLb4moR+zP+hmATGu6j0rlZ+nO87wT7PX7e+rX4v1zWdiQgUytVhOtyZG2xADeCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aH6Vs/gC+BRkmRErpIFki4xHhEkEDlyWbKkqon5hdOw=;
 b=MMQK6x6vjw72tr7PbA5TOuGnyauhiB1Br+S61skT7oYa57aSb5uGVyWCiuOUO9+Tz4pN0Jie3cIb4/I/+EP+aZqKmESXzfeDOP5cY2dzduJMwzzZXk3SqMJSdBmu1NZ6WYBe9M17kniJB9QH9SRobuWB/nDR5M/L8lkkDfVltko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <759c3ebb-4282-489d-a18d-0f808853a03b@amd.com>
Date: Tue, 31 Mar 2026 10:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1774353053.git.mykola_kvach@epam.com>
 <581179709977ce4cebb22597411048dc93b11167.1774353053.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <581179709977ce4cebb22597411048dc93b11167.1774353053.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|BN7PPFB3F5C406F:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e4223c-05c0-4b80-6429-08de8f02d5f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x0cqvHziHsYa0r9qMBdPfQjq4AtZOucIbmTy2TRBMwm1CvGXLv/7/XYFa8SCilQ5+aDLzRkPpXaBgm8qEHdVqIE/pxU7nxfsSO6tg9crMs5Y20viIlsbCkImSz4vxiGZawE3WKbXElatzvrunUhQifNJNaGWUTr9NWRZraziQYMeR712lZNqSVglZA+6/TWYNP/9AnzSTeQUhjW3Z+8dGGdSesSFGm8sdrCD5rB35uzDcTULYaFATAWvAqq3MVdjFwGvA7SCm/d6fPjAK7togl0NfPxLYJ0V0uIwNYYtqQyLzqxxcAoZOiX5STX3aJxCe+9AyWQgXzK+zh8DGOIS2B6Q7pbzMOcyhpfO6aj1JG5r8u8JOhos6RQKtqWxgqnpM77FVz4HzoKygLepRv96BGaDEU+uuJ6vwy6y/9PAV5UV9UMWqDJuDDaswjLGh8M082HFxN8PhZ9ae52Z47YkPm6s6nBYiGdy1H3nwDqkZBLPUEq9TwjKuXUnmxyQZxH2szdMptVfG6DEe5SbWo2JQiir7mNN8r3StPCRRB0v6J3Fz429BcJVN8yJQnWUJO2YWIO8WQzIVEFJd+iq8oEUZMA1ld5fIHwt4CCPuAurdV2Pw767csGMV5GBzeqieS/y6848O1DkW7TC4vUktpzoPlOZKDrg7n5JJWbeBw3NWajSvj+1qbdfhEkv4JY6kwUq72D18esNADnZXrFEJRs+wxreTXWEPb6Wakrcp3t+JzMjGfQd9Wb9mvYfFApTB8RMXLtKP8i8EuVzsjat8LJK0Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3bqOZz6++FuT5tyJWTUB112M+BQGUPDNomG5ftdEjGeaEyu6jvBiMnbVgajoLdPGwQfxFIgULHox/MQ4M31sWQ50/atVsFBZS4ztYut79yX4XIz67Hg/p5lTZEdUKOnj9LTM/KCrFaBh7xRJnDzFWmHosEUhxskWay6xLkQ6/kW15dgVBgmL9N1erQQmTHUa1HLIbJv8gsv54FsGdHvNgPqA9chLQGqpE9TIGtV+byU04ZV+GnQfE5tZZuD2nlGxeaZLDIbA/yZ3yHS1h84bO91nk4eGCqMejs78wqsms5H6/b3S6XsfXPLOmOZLZiYOyUQvBUErPETsk6IdCj0K/FcmZjiO/uCSS73MB6WGQvddiRcBsMAs92Pt1eL0HLWb3cdWjoUQb6R6eD12OesqB7EqOa+5kCQ9SY3FRMFfcN5TOH6gV4g2yU0ztoeQASOy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 08:52:27.4962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e4223c-05c0-4b80-6429-08de8f02d5f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFB3F5C406F
X-purgate-ID: tlsNG-d25034/1774947154-F56B7734-589197D8/0/0
X-purgate-type: clean
X-purgate-size: 1391
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
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,epam.com:email]
X-Rspamd-Queue-Id: 990E036679A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 24/03/2026 13:26, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
> allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
> (both 32-bit and 64-bit variants).
> 
> Implementation details:
> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> - Trap and handle SYSTEM_SUSPEND in vPSCI
> - Reject SYSTEM_SUSPEND for the hardware domain to avoid host shutdown
> - Require all secondary VCPUs to be offline before suspend
> - Split arch_set_info_guest() into arch_vcpu_validate_guest_context() and
>   arch_vcpu_apply_guest_context() for reuse by vPSCI
> - Add vpsci_build_guest_context() helper and store prevalidated context in
>   resume_ctx; resume applies it and frees it
> - Add arch_domain_resume() function is an architecture-specific hook that
>   is invoked during domain resume to perform any necessary setup or
>   restoration steps required by the platform.
> 
> Usage:
> 
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
> 
> Resume from control domain:
>       xl resume <domain>
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I'll do the change Jan mentioned on commit.

~Michal


