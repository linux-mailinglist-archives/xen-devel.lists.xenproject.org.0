Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDL7ByU9tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:36:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD0B287220
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253991.1549976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VE-0004CO-Bf; Fri, 13 Mar 2026 16:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253991.1549976; Fri, 13 Mar 2026 16:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VE-00049H-86; Fri, 13 Mar 2026 16:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1253991;
 Fri, 13 Mar 2026 16:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc6w=BN=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w15VC-00040A-RV
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:36:42 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdb9cf81-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:36:37 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH2PR03MB5271.namprd03.prod.outlook.com (2603:10b6:610:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 16:36:27 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 16:36:31 +0000
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
X-Inumbo-ID: cdb9cf81-1efa-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeJzfOhq0v1nD5dAgUpULM6bHwWcVQpKZcfb6Vlb5xFtngcdpadc+PKT/+I05ny4CY2DLE7SfxLodMGxjKnVPEHXMe2fMhnDEeWVXsmrhLZxGefO+tWph+kozuvy0EOg+wPTSbdAOpFHvCYbxhpav/xzad7knkKKfMBdKBboTYYAuNpS81GX+d2ucsp/gDwkTgiQUdHjIi5lWlEBSnfaqBwaRgb+HkJ8Z/1aoCGs6qKwoeuTUPbR0K6f/lwEBiAYd5IhG4hRTMTY8yw3Z4zu/4QenPWC9wo04FGoF8/BRr7NeZqBxnMI3ngTTzbDfjJ5jeVPOPCyDvgqCjv55ctpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAGJbO//KWTn14NI8yrsqMSsRTI1UMXqBSznXwprmUs=;
 b=gJnpytLYCwFBaRQ+YTeQTBmJgYRChXo69pZ7EUs4A3+jzRmiEd5gjTTBHwKyHxC0Uc7zG5WOcHAbmcuAjGMihgNgLFBqCl58I4p/JDcuyNdf6WPihRoHOiTErwQJMyTK2GQWtLm5jxZjicyKWFgzQJP/R+oUKgLiC0zt1LHdg6MGKdp72Qf2jW+IxlLapWOLnwav3TKCbD7FRf3zFlx4qM3YjI6pIqR/q9kQa5mu7PUYfrujoTDxSdVh36TZWJqmkp+TOtouNgpfZtVLXmV3R83jVaIwssihXpYq1eoWDL91uBuM6YgWWA4H2T3m7RIPPYrsXWT1XBdgueFuWOPKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAGJbO//KWTn14NI8yrsqMSsRTI1UMXqBSznXwprmUs=;
 b=sbLnbOn9BXUI2dh9fBIuNfbFBkNDo4q9FEWyIVmARkSDdVweu7J/CH+Y5DAX9wotx6sNukN5ju4leecW5sw076h+WjLtThdPjSdtTO972iQOaKNP0kgJ63B7D6wPbNqIaMqh4ekNS0/L6GARDDjj0wTwlMLA8iuQ70EKqwDCvDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v3 0/7] Remove x86 prefixed names from cpuinfo
Date: Fri, 13 Mar 2026 16:36:23 +0000
Message-ID: <20260313163630.1073019-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::36) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH2PR03MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: b78f5879-0b94-43ea-670a-08de811eae8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	B/+Kdm4iMFsSDcOMpiZ8wF6TnNn+uErPAF5u2lpwuHHg1iqr8ticHRS9Z3HxEgr0GgJlWwuYoXrKREKI79+ubJqeGdlG2yTqZtm4jWhz55CgDjJl9Pog8vXgwahCfpzu5vYWqqr1nAtt4aTuyg722odV3gnmPuzs0QWcVQwQc3xBw91634j5kxoF5V0mZQG4s5SRHmk6MjXX4/qt3Se/EAlaevU0GGwL6MwPAsKIM2s0UUblGUvhce2z2kIYaocJYAgg1V+fCvRbb3ysSs0yXBRSnjGEieJ1rMm3+N1fb3bhm1iHF8dLKZyJsNwjq6+GpAIimGWUuJxZJ/AV/ih1Enn2dO0qyNwLkkkr6hHdX75EqR1Zhp/Ln4f+4lRUvw8XEKaPfRNTie3Fkl6gzAZBp9Cryb9pzMn0xRQbknpB2aj0ZUoLT6+yh70rAMx18JO3t9YFi2qM0cmjc2NHceny5fvao5O0BZKbI47o4r8/1ZX+2GMquAZyhElePOtRBhNZRQdPUNCEih5gy7OpVXUyHctK+/O2RtlgPHDwHoneXpWGHvleZSrU/RIfxFu1a1i6y/uk4sf1pASybiUPYqM7w3rWp9pJs2cRQ9KGvbvQOVXDJj5uTiYPBiEVGcQUhoVziofLfYM3cWA+FoxVYZbKlvxJY2D87OYBDS17AmivFlHi1PM4VnAoHTs2KWuBMWttvX9+le2wyaGmkis6suS1vaF6qjvtD2zV+Q3n8FIdE70=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WoKMJtn2xwQVXrg6jJHdeIltjbyTePlSP4YmR9WF7d7zqRZdi9ln0MatN6pk?=
 =?us-ascii?Q?x8sDHx8uHCbkv9xHXs1KuIfGJdg0yo4lSN7lfv4ZUZG6IgIk/G4rVqbQR2IE?=
 =?us-ascii?Q?EIEpjdtjFu7JlkUcz109/R4trOBXlM7IrtjGxX96+74yy11Bdq9MdqWgN+e0?=
 =?us-ascii?Q?mj7IJkWtCBqFPPUKCkFYJvzo/l3RavL6hFFBnoPXe9pH9PcKbv0Di29PARt1?=
 =?us-ascii?Q?Y5xANCehHs4CiF+oXEl+2WT8Jf7S7AefX8rCbYeZf+zNBj1Toz/AlG7diE3a?=
 =?us-ascii?Q?aUlog6N6PN74310gW+t082Yp+V6ef6tA14GRL0CYCwDOW6rNkMjZS5Sr9XeE?=
 =?us-ascii?Q?CjuMns6GwogGuRbT3xOlx811KnlP4JUVtxgd8w1JjjCZRmaAoBJoSPsA5ztY?=
 =?us-ascii?Q?EuNN/GelHgxwyuDUZrCgYMBfwaHGfdhsAWmyA3pPUTTyUYY4cX2ajzz3OHJm?=
 =?us-ascii?Q?SU28yv554gbzLDnhtZ9GZi/zAKaeUVc2SoKzNxCP68oeYHkXpFdrPPwAAwDb?=
 =?us-ascii?Q?b0J/4MhDD0Lktf06XYzTctQzclkGpJ7xqrfqSl+V9jq86MI0mKwMWe3sXjKw?=
 =?us-ascii?Q?eIeBvqPgaGqYWWFjR//IoggPG8OTKXDye3lF2o0Qs9fX01HCUW2wNWI7DKe8?=
 =?us-ascii?Q?u1ehnThAcYJCcrh66kVjL7GBmvGXw+VX1XSOMfwtkoqaM/1W7ir5VWG+g8NH?=
 =?us-ascii?Q?bxoE2+m2l6k7bIOW+I3LCSZizRlnfxjvpbGCV5gKnciNQ9hn7kJgWONm8BBA?=
 =?us-ascii?Q?xnV4mezBzQ0VBsS2pgQJn+EQ66KQeyRm58L3JvIH5MGb5BxFfcbQJRvSvJZb?=
 =?us-ascii?Q?AUMJIa8QBK8BeNgXIJ21qWoAdLB5Fb4TYnZ52QEp6D2cpP492jA/0K5cXLdR?=
 =?us-ascii?Q?yKkzTGC4JFcG3uN2zph2vQLS31Ui2ehYz6NKJdHQZSjCN0fF82QAQWnS4fYe?=
 =?us-ascii?Q?2JgaBHbPZdXHke06ZRSVrCOJIriIqCZCHCJDLaCXcsxGjjisJ2Al0n6H8owf?=
 =?us-ascii?Q?hCiU0inSCzce46nQR73rM2CBVQy5w80cPvb7c8VrXxsUFAvDLyRIwcByRtHI?=
 =?us-ascii?Q?9fAVvKVGoErZmn9C3SWj1y6fzE28LFDZaSdePfq2zH736wlC7eYtBvkY+Xap?=
 =?us-ascii?Q?wS+K/VaAk0yCsCgT5gJDwG9H1JARtiHdX+K5CTp0A23SZPkbJDklY+ItCbRs?=
 =?us-ascii?Q?9vt4jqmurUwy6RkycG5Lb1gAYzD9hLzrSOkJfTybL3EjvRpJ8w/KCaUeiBfu?=
 =?us-ascii?Q?ycT/0usbvVgc5yoNH2J4oirwjnCtJBdwQJEClN4Hh3xrKL/FG7i+OgcFdilk?=
 =?us-ascii?Q?ihZHugh0BT0ryZHJ4So5BCm2fLfoXHx2gqwQ+YSEXJaMvhb9IEDAZSQwutH3?=
 =?us-ascii?Q?JUbaaxNaF3YJhRgckIor/rUJ4Jr7hfh5ATrI27WJVu6eqd87gUDO4qVs34hO?=
 =?us-ascii?Q?0W44wKq5dQRdxY02oDMfY28s6UasoyG24yxQS2VZRFlD5FUsTrNQdHX86SJe?=
 =?us-ascii?Q?w/BVBJkhjRyQ/3jGQ2Tr4mnlND6y+5M3MlHZtCxxIkxj36IZ19N2X4dyLHz5?=
 =?us-ascii?Q?scwKmC926P4eXD6AKkbvR7SCR24oH8qHsJis53Wcr6wZTf1Yc6s3lzIY7Tr4?=
 =?us-ascii?Q?LFQe696YyOpgc6iUcE1fYfFxh2ff1QOIuxk7YKyGDqMEy7Z4MantnvEBdLZ8?=
 =?us-ascii?Q?YA3I5O0q/Df+BXCUTNH0dM1t7alDR6EBKkEvy7uiXmnOXPMzPqfrYUvIK5W2?=
 =?us-ascii?Q?ysJab7O49g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78f5879-0b94-43ea-670a-08de811eae8c
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:36:31.2222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDipIl9JCTAQhHgaAcMGzf7zJIxtoX6zqQYt1LqBmDg+KqjO8fikSqeCigDU1o/yNCW3y8xsqkPMvNbYzsDx0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5271
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7FD0B287220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove x86 prefixed names from cpuinfo and all the places it is used.
This work is part of making Xen safe for Intel family 18/19.

Kevin Lampis (7):
  x86: relax some CPU checks for non-64 bit CPUs
  x86: Remove x86 prefixed names from mcheck code
  x86: Remove x86 prefixed names from acpi code
  x86: Remove Intel 0x65, 0x6e, 0x5d from VMX code
  x86: Remove x86 prefixed names from hvm code
  x86: Remove x86 prefixed names from x86/cpu/ files
  x86: Remove x86 prefixed names from cpuinfo

 xen/arch/x86/acpi/cpu_idle.c           |  21 +-
 xen/arch/x86/acpi/cpufreq/acpi.c       |   2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c    |   4 +-
 xen/arch/x86/acpi/cpufreq/powernow.c   |   4 +-
 xen/arch/x86/cpu/centaur.c             |   4 +-
 xen/arch/x86/cpu/hygon.c               |   4 +-
 xen/arch/x86/cpu/intel_cacheinfo.c     |   6 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |   2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c     |   2 +-
 xen/arch/x86/cpu/mcheck/mce.c          |  36 ++--
 xen/arch/x86/cpu/mcheck/mce.h          |   2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c      |  16 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c    |   5 +-
 xen/arch/x86/cpu/mcheck/non-fatal.c    |   2 +-
 xen/arch/x86/cpu/mcheck/vmce.c         |   8 +-
 xen/arch/x86/cpu/mtrr/generic.c        |   5 +-
 xen/arch/x86/cpu/mwait-idle.c          |   4 +-
 xen/arch/x86/cpu/vpmu.c                |   4 +-
 xen/arch/x86/cpu/vpmu_amd.c            |   6 +-
 xen/arch/x86/cpu/vpmu_intel.c          |   4 +-
 xen/arch/x86/hvm/hvm.c                 |   2 +-
 xen/arch/x86/hvm/svm/svm.c             |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c            |   4 +-
 xen/arch/x86/hvm/vmx/vmx.c             | 280 ++++++++++++-------------
 xen/arch/x86/include/asm/cpufeature.h  |  21 +-
 25 files changed, 215 insertions(+), 239 deletions(-)

-- 
2.51.1


