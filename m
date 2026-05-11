Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOH2IqO0AWo2iwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:51:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F243050C3E9
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306016.1578111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMODu-0005PX-32; Mon, 11 May 2026 10:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306016.1578111; Mon, 11 May 2026 10:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMODu-0005Nl-0J; Mon, 11 May 2026 10:50:54 +0000
Received: by outflank-mailman (input) for mailman id 1306016;
 Mon, 11 May 2026 10:50:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMODs-0005Nf-Jx
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:50:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMODr-00ATb8-TR
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:50:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01b489-2eae-0a2a0a5409dd-0a2a450a800e-6
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:50:51 +0200
Received: from [52.101.62.57]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01b489-56b3-0a2a450a0019-34653e3934cc-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:50:51 +0200
Received: from PH7P220CA0160.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::18)
 by MW4PR12MB7144.namprd12.prod.outlook.com (2603:10b6:303:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:50:44 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::28) by PH7P220CA0160.outlook.office365.com
 (2603:10b6:510:33b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:50:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 10:50:43 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 05:50:43 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 05:50:41 -0500
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
 b=GHonaANgBEZMW45qe4mECxeVBbDz2UGXCboUQpnSbNr1LX37kwvzMF+oetjz2FV7BJ7VjT+kW1XB0/cj/Grb6dSQSA1SPZxmkYAW+u0J2jtWSs/Dh8rmmxG2t8Dd1AtOadauqMSnir1q+jL0XvjMUo4Brk60h2HPH57otBEBxcdu9nzavo3CD5EX5ia6vpe1hgjCUvT5VlYWaZhweHPEiJShAKJ0RbUrv+pPt0oz7Rrhf1CpKtHJ3mqHMP0YMzribli+J39Q+sKGW5fbACKcmatdrvClW65Xnfaq+l7EH5X4gfW1XD9rIOphg9CNAS6ZgF1tNjbu3d40Dh7qPmpiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UUBguPlhjyv2WTqU3xP1vMGoLN6aTg6DByEoeNDgSA=;
 b=nWGyu+WwdKBN/UhiXjPYJPZQy+tJD/Te1tO/6eUEwy6bwK4nJPXk4cxLQkO0gaC8FdH0cTi+gbYGOW23Nr8ogc5w7LNB/1+SeWiYQCXuhRE2SLIKyTkzTavGfAIub49RQQ9GMficC/QtXGjhG3FyYHz4APa80njpdKPKRnKCPL05fZBG6faPoBgvEkE/C8uPnjQls4oII8aRCJrHNwz4k5yyfM59DMD66AFg2n867TK+p9wH5IxZlRdNvudrSBjE0Ml60EwOXGg8Pj4v93x6nPTceb1UO7kIbzYtrip73owerb60dsUJDzBQ6M3sg5uh3ZP/Jnqnx5e1PcO1TFrshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UUBguPlhjyv2WTqU3xP1vMGoLN6aTg6DByEoeNDgSA=;
 b=Z2bMSfd/Xl00T7alORmA8x7rij4UFo9SgvZCoaV3SmpgdyXFuHoCYI/+9oVIuIcysNkI1iDUkSsVaZ54H5D8BrnFiBhEVQLpKq1qyqP7yIhHSSxjr665842IWOVa2bGv+w4upb7IZkENAWIVFjnsNLKOFQQwZ8phvc0lv0Un0F4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <ce38f845-42ac-491b-98c2-eb2bd90f00c1@amd.com>
Date: Mon, 11 May 2026 12:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-3-luca.fancellu@arm.com>
 <63c08741-42dd-41c2-9f27-b14f350544c7@amd.com>
 <4372B93E-1AC7-4BF5-93A7-D1AD8FCE42FE@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4372B93E-1AC7-4BF5-93A7-D1AD8FCE42FE@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|MW4PR12MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: ac027343-50cf-422b-747d-08deaf4b2697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2d0xDtZcsx5LM7EnpR4B866R9l7xc8JqsIdFUM/+7oWryuanJQPwJv11WmXGe8zeujvt1WbVUAJemQck5svVEjgyyVpG9jb5IH3ZdpjHEOspQUSg8Bq1zdzgcniq0CpO7PNJmojP+551D63nFs+ceFHE1NevSzYgpBSgHlKJjR7D/Vi1QNCVCPR6YHU7QOMA89mKhk9vQEPGIH+eMYwOFz3pjfLqB9PXUphcjy/QHEh9cd4Pi6bpdDEtNxfZx/6luBYA8dTo6JXK7qj0x/NiUOPyRhqdaRoTjOeXcltnZfBThZ1X38E0Fu75yxd/rLOB0EZwkvgPQw2ql1DjYRSr2MQoyZ4GBWtFPrNXr9GMH6hlYgCugiXxnpi+VHOhzt8/uE6BApLQq/N0BFTtK0nTeAS9JyGIsE9FMMRTEdjdzJhz+istx7nvtGg2NMZPHaRFSktONtdN60ibMRFdplBBcp2ezgczDTI9Gl3QttL2XCLKRCE80rqumr+aIGqaeXOteVrlNrkAc9eAF/d1E+JqjWcYdnGWrrFNSEeIeBWFJvK8WBaiftJA1rjrAtr0uXOQgA12DMWiFC7rYz4LGnJxLPRrZ9ntJ3CjMnOS0xlFlGkQbavxpHzvGj1ssZfxj6MDZd9dQHPar8nSHHUQ9a0VHiw6uG/go2B/+i3xFTQky8zLR9tHPMbBJOVWaXDo3ri5uXvio5n8CI0nvFxibwoTCkP0YJXvYHsg3X/4TGRTHuo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8Kf3/8ImtdbGmAHp+uhJGRveW6ByO4CtqUuSxJlD2wqangZ1SdhpkKcHTuD0rQf5ozDUB8/WOmST6NfaAQX4bhR/3FULdoabLnkOoBpnErIVDWFy+/XowPPE8feeN1Y4h8uN7jVJ1YC6WTSWmg4N5k5hQZOkglnHgvmdtk/+wPHzeuKATY7sEqXFqDg7d6vj3C9EnipmP/MFpXeNi2LZ9CmzNb7F5+TBAk2VLD7BtNihA83hulEL02jsPHQ31lMC8M05eB3k19u8Wg3du8ZLltK3aRhbxyPrD7WC7K+snEGgE2fToB6S1Z9zONksc4DHwyHWzPQoISkilwcuzDlHbs0GNzl8rZsg9vs6Z50As+DObXKy60mgQk2BIBHVdbdEnLjHm3PTuR1jOfTPyepDXhab7BuLjFq4TSOBXZardIafado49aHmdeTbreXP+DdO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:50:43.7696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac027343-50cf-422b-747d-08deaf4b2697
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7144
X-purgate-ID: tlsNG-4011c0/1778496651-709668B7-5DDC8C7B/0/0
X-purgate-type: clean
X-purgate-size: 1689
X-Rspamd-Queue-Id: F243050C3E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action



On 11-May-26 12:44, Luca Fancellu wrote:
> Hi Michal,
> 
>>> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
>>> index 6674dac5e2f8..50ddc0511e7e 100644
>>> --- a/xen/arch/arm/include/asm/domain_build.h
>>> +++ b/xen/arch/arm/include/asm/domain_build.h
>>> @@ -19,6 +19,27 @@ int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
>>>
>>> int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
>>>
>>> +#ifdef CONFIG_MPU
>>> +/* Utility function to determine if an Armv8-R processor supports VMSA. */
>>> +bool has_v8r_vmsa_support(void);
>>> +bool v8r_el1_msa_domain_sanitise_config(
>>> +    const struct xen_domctl_createdomain *config);
>>> +#else
>>> +static inline bool has_v8r_vmsa_support(void)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> +static inline bool v8r_el1_msa_domain_sanitise_config(
>>> +    const struct xen_domctl_createdomain *config)
>> Why can't this function be common? I can see 3 definitions (Arm64 MPU, Arm32
>> MPU, MMU) but they do not have anything that would prevent from generalizing
>> them in a single function.
> 
> I can do a common one I think, just to be aligned, should the common one behaves as the current implementation?
> 
> Arm64/32 MMU: Only v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE allowed
> Arm64: Only v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE,PMSA,VMSA}  allowed
> Arm32: Only v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE,PMSA}  allowed
What's the reason for allowing NONE for MPU here? None denotes property not
specified but at this point it should be set to a default.

~Michal


