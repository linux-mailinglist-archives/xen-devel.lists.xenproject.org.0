Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPBHOdm6HGp/RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642CF6182D0
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323516.1589323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxc-0002te-QS; Sun, 31 May 2026 22:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323516.1589323; Sun, 31 May 2026 22:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxc-0002mj-BA; Sun, 31 May 2026 22:48:48 +0000
Received: by outflank-mailman (input) for mailman id 1323516;
 Sun, 31 May 2026 22:48:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxZ-0002SZ-Sj
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxZ-00Fm16-9I
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-e002-0a2a0a5209dd-0a2a45059030-38
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:45 +0200
Received: from [40.107.74.72]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbac9-aaa8-0a2a45050019-286b4a488211-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:45 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:42 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:42 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaHkrkXT2EPkX6rRsXwOBNwKqYgTYjkhmcex/SZTsbr5IAoXFHk/iisAVr6RmCHkFCcRzeOWWRsq0PkUuxCDMAVhaZ6kpSzHOn8xTghYaY2fs4JDa6U5hXgKS5YYZfn7d/1kW5jIKi599EXkt0CfrIeR0CV4+ARr+ocDFS3UCBY4Nq+wUSNPP1K2ZpRWBSx1uO9YRDu067chnS8FEAAp/AM3z+NOP0gcQjIPJx/mkXBBxGsR3w2Dzh1RVf+m8DZFJnom/4pIYtU5m6mypxrOFw3OpKIXa6obx+Uf1xbD4SgyBmAwFR1KmB8uVG5bieBd/yh4al0jb6uKx2FSbrxLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAMUs1xUJCNoKg8WlgclnCXqbMXhEf4+WGLaU8dCiJc=;
 b=SihxXPh4L8h2ZrFCRpltH+zifmO+pMaxdH9esm7iW68bzS1xxQULVyoeiTABqO2S07ZUBo/DfF2kCYrUuzJFoGZWrzj0eAC4kv5NTU1iwJVQDFZq4MFg6EU89eI2jzpLY0RfV3NrBmTXmC2qul7c05VbJSEb5kyHlzTeyxSEdDkdIbmnneDlI+xzHUho+M00FUSdPxm1JNq2Y/7pddEcGDraBKxakw+qVXardZRpqiDifmtkwsMeI9B/vc8LK8YqWYy6ohCPGu7Hr4W9lNkhjJZQpN/y4i2WfH9Y0HJ6Y4BGhyzc8gaxy6jmbiKumdZDwxAlwAc2sEmiHtXCcfF6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAMUs1xUJCNoKg8WlgclnCXqbMXhEf4+WGLaU8dCiJc=;
 b=vk+upCfHuUIIykL98reMWGcb2F3cfOpZ29t5xv199AoSXi/x7iSSgU9u260CL39pUI7cDo+7Wxgxx22iSzqU6fNGCeUFnLNEbMfkbl06+10IMoCluYgFFFX8lyj+a5RqTUAT3et2GiQ9qO/RZUi0k5qTRaD9YqF9erAdGesLNBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 22/24] xen/arm: Balance Dom0 memory allocation across allowed NUMA nodes
Date: Mon,  1 Jun 2026 07:47:52 +0900
Message-ID: <20260531224755.9481-23-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0117.jpnprd01.prod.outlook.com
 (2603:1096:405:379::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: 065bc7e4-e427-468d-0464-08debf66c3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|5023799004|3023799007|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Cumi8X9iRL6k+aqxPVveSwhKzV/SOUSVl1dOlvK4/TfNkZMYrQKKzK+A1LBNubjbiyX0p7GMUsnx9oGYHzHSqiZQP3GIxmp0z1gnE99BAb1kisAQ4lgi9S6Y2nsZtV+FSmdYmo554Tg9kLl0FtFsq6u+WoJOOZkuSwNfZn7nV1wH9Aqdbv5tESKSbsX88f4qmWLRa0JL3/a8YbTCnlAc7q2iBI5J8H37YMGRKFwk7kLuoqOrhyfCnyRzqlulLFVHjr1hMwbgcuSpDydSSnDdKuMidcEw32yyAL4fGca1xcDSjBlY27xxXJhAqbjEN+51zze5y99hi9a6tZ4oGU9Ij4c/F49m9SR8odFRJOFboktxPVnA5k3SX1Km1pAmB+qtonRyLFSrixy+ibdQkQ3N3Xi3jaHLdps7y4O+eAQsSQEHD94tujDBccEG3DNw7WASEZKJ225NF4a33QRa1hDzwn77Nij/TsDIExpEuJp0xhSCG++qEqNfgcYw8kTNnh1sYWHyeli0qfqHlRNWFf4QqBrvjngTS9dcWTAG22UNkQReTCsm18CEBc72bUwPhpmPIPI/cQzYz7YuDRpskneJbFbf9R+cM0w+lp5M9OElhL23h1s9AAo7hCYYBdMk1+fkOzyc8d0JUeq+NRWnouu4x2YCj10i1u+rHEVyVJs1Tx+Nwb8FRpXHUgBugWTHJcL2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(5023799004)(3023799007)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ATpiAgJaoO7M+i5qVj6HfOw7+1P+83mPbgS6X+erM3zqntFrI8AJ73Lx4SSE?=
 =?us-ascii?Q?VTx+ZX055iryuLI4nTs8hY8dX4IDvrKSVSywbWkEpxrqWyRhZBGJ3ULjKlZy?=
 =?us-ascii?Q?Ukk7SYtDLjgpXxwfZZ0qgQiwGf5yCzqHHF9jkwFBC3x2jZbbMgt3jSoJCRPd?=
 =?us-ascii?Q?0RMjb8JB8+if+4LxWTXekPFIOgSm225STvqOBsPP8CsS+3UKq+v7Y/gjf5YS?=
 =?us-ascii?Q?GYuvUNs2RmdVI5vngq43uSrN/BYdOUOOhgS/xpTnw3eOjx19pwm6VELngOHO?=
 =?us-ascii?Q?m+v34dwxTfXhbIgOQxTGP5Ukwdth0LrwmgyNSMawByHqO+z9tRYzpcxo6xKS?=
 =?us-ascii?Q?hlBY9nayOJyf6MvCvIWbplU2bC+MEEN4H014mEzb40Ohi/ZMxpKAai8NHjPK?=
 =?us-ascii?Q?gz8oXtT0WRPMLe484UWe+lOwIgkk73pRkWBI3Jl3uomZJANqe9ERoEIUfmkd?=
 =?us-ascii?Q?oHdwDpgGpP/y5StFCbDijtll+oKxSZZBqV4BsGUXhVg1n9ikD+7x6E5zhUmZ?=
 =?us-ascii?Q?TPMO8ZHxkzps719AqyQmnYzAFiUSeJpitrEaWHRkbeULuHQQFUx+66UoJJYK?=
 =?us-ascii?Q?v8IP4dnO7AT99RxKMql8LhV30PUfLW/17suKQ2BbCxwuDIGn0E83Qbj9azGB?=
 =?us-ascii?Q?Wklggx2pHYj/DLh1fn2+x1wVKrg8Dcc0bhUrvGkIIqL30XTiDwb7DESZFKbV?=
 =?us-ascii?Q?/nkoa1mcyAEyurOQkppFkjVLHn9M6F0Xg3VqFzO62rRNJKdVtl7fR46XYnLx?=
 =?us-ascii?Q?Fic4QWutSIwx6Bu35eGHJMDK+IhsuUDggZB4dGJb54c4jHf49thELxKOSmbJ?=
 =?us-ascii?Q?IlKzjF7LbLme9esTRtOlRHwHBYLs06E5q0UHL22pgaGJPZC3Cv4JHZpP9j6y?=
 =?us-ascii?Q?Xg4MLDd0I/H+JIwPbdYE6uvrFFQj/c47v+iO9d1OygQ3HqzlOyZuwqjNeO4+?=
 =?us-ascii?Q?cW57EY39iGUBOj68hGKUqIa3uBx+c9uxZ9Z6ckOUwyr0JIQ3+1pjMZ7TCmAm?=
 =?us-ascii?Q?91z3qytsltco8W/uvdgUGhTJHHvFOaByG2oFgENPfaQp44vi0qiuzHzQG2HV?=
 =?us-ascii?Q?uTu0h8gMa/NMdcJWjhY2rIQRhRSAsWHJNmB0NuZ+eKTwtOlDn/Tede3z5EI0?=
 =?us-ascii?Q?WxBou1pjR8HI/OAPmPvuRgDTh8npO0uBf1MaGfVqhlgUjshK7dI3Byt5NM77?=
 =?us-ascii?Q?pCUdDBo26P8ca71IcEVHPT+gy+kIw5x02RSp8h73IhLZ+8Rx/7tR1Ku9sD/1?=
 =?us-ascii?Q?F7g3sXi14vM5q1laRUoilgmyjGs76sGgHy1Sd/OROa+fTKsjN/sDb7bXGhro?=
 =?us-ascii?Q?qZ/B2hpI2xkATcBRqvtAy4ermQD0+k4spNm7sZIVvhKlged7rybBw0OCXefQ?=
 =?us-ascii?Q?2G8N7ZEOJTOyZ0x44xQbz6zqejCjTSx6qtaCxHr2IJYVkrDD+nH+CJzZECqQ?=
 =?us-ascii?Q?2oLLpSyR4Yeh6lv7GGtHSCJmtVbnvMYInu/CsCUI0ogNu859HM/xfdWs9TaZ?=
 =?us-ascii?Q?IGAlYaR3r3Cf9DrfBmDsLZBzctJnqt8ClpweW+1LaUKOz6Y9HdgsEM8QyTH5?=
 =?us-ascii?Q?lZL8eogt21GD0q+YQTyG1qn+w6ZTie5G0KWu25Ne6LblhczureeEEUQN8yH9?=
 =?us-ascii?Q?AXIzJQ7nBq+Y3GXjhZlO7WBxYoBbMMIQrDoLl9aQQcbQPzYR2ZBJpqwU2kvd?=
 =?us-ascii?Q?z86MtmVzf1Rn/1iOIkIaUmHTskR44tcxg4DKMKiphgiipJ7Cgfhn2s6zhjRX?=
 =?us-ascii?Q?3sAstN7Cn5jMb8oLu8/9mMmxb+e3MU3A40/RaggbQq1lZOv0uxftyjXcXHDs?=
X-MS-Exchange-AntiSpam-MessageData-1: /WgulL58IG1V2g==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 065bc7e4-e427-468d-0464-08debf66c3a6
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:42.3762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJmPk1gMiATuwd0GZxcwELsGKZTeUWF+eLzd7KXp4csNnrgOBXH3mjqiAgyzLyh25Gyu2tl0vKv6nOUZTAHn/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c201ff/1780267725-DB563443-A3F10B2F/0/0
X-purgate-type: clean
X-purgate-size: 15121
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 642CF6182D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allocate memory for Domain-0 exclusively from the permitted NUMA nodes.
When multiple NUMA nodes are available, distribute the allocation in a
balanced manner across each of these nodes.
---
 xen/arch/arm/domain_build.c | 276 ++++++++++++++++++++----------------
 1 file changed, 152 insertions(+), 124 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e71d6cb254..29b09e3da6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -180,33 +180,19 @@ unsigned int __init dom0_max_vcpus(void)
 static bool __init insert_11_bank(struct domain *d,
                                   struct kernel_info *kinfo,
                                   struct page_info *pg,
-                                  unsigned int order)
+                                  unsigned int order,
+                                  nodeid_t node)
 {
     struct membanks *mem = kernel_info_get_mem(kinfo);
     unsigned int i;
     int res;
     mfn_t smfn;
     paddr_t start, size;
-    nodeid_t node = 0U;
 
     smfn = page_to_mfn(pg);
     start = mfn_to_maddr(smfn);
     size = pfn_to_paddr(1UL << order);
 
-    /* This code is temporal */
-    {
-        struct membanks *mem = bootinfo_get_mem();
-        for ( i = 0; i < mem->nr_banks; i++ )
-        {
-            if ( start >= mem->bank[i].start &&
-                 start < (mem->bank[i].start + mem->bank[i].size) )
-            {
-                node = get_numa_nodeid(&mem->bank[i]);
-                break;
-            }
-        }
-    }
-
     D11PRINT("Allocated %#"PRIpaddr"-%#"PRIpaddr" (%ldMB/%ldMB, order %d)\n",
              start, start + size,
              1UL << (order + PAGE_SHIFT - 20),
@@ -293,7 +279,13 @@ fail:
 }
 
 /*
- * This is all pretty horrible.
+ * Allocate NUMA-aware memory for Dom0 with 1:1 mapping.
+ *
+ * This function distributes the requested Dom0 memory across the allowed
+ * physical NUMA nodes in a balanced manner. It implements a multi-pass
+ * scavenging loop to allow nodes to dynamically back up each other if a
+ * particular node runs out of memory, maintaining a balanced distribution
+ * while ensuring the maximum amount of requested memory is satisfied.
  *
  * Requirements:
  *
@@ -308,155 +300,190 @@ fail:
  *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-bit).
  * 4. Some devices assigned to dom0 can only do 32-bit DMA access or
  *    even be more restricted. We want to allocate as much of the RAM
- *    as we reasonably can that can be accessed from all the devices..
+ *    as we reasonably can that can be accessed from all the devices.
  * 5. For 32-bit dom0 the kernel must be located below 4GB.
- * 6. We want to have a few largers banks rather than many smaller ones.
+ * 6. We want to have a few larger banks rather than many smaller ones.
  *
  * For the first two requirements we need to make sure that the lowest
- * bank is sufficiently large.
- *
- * For convenience we also sort the banks by physical address.
- *
- * The memory allocator does not really give us the flexibility to
- * meet these requirements directly. So instead of proceed as follows:
- *
- * We first allocate the largest allocation we can as low as we
- * can. This then becomes the first bank. This bank must be at least
- * 128MB (or memory size requested for domain if that is smaller).
+ * bank (Bank 0) is sufficiently large to hold all boot modules.
  *
- * Then we start allocating more memory, trying to allocate the
- * largest possible size and trying smaller sizes until we
- * successfully allocate something.
+ * The memory allocator does not really give us the flexibility to meet
+ * these requirements directly under NUMA topologies. So instead we proceed
+ * as follows:
  *
- * We then try and insert this memory in to the list of banks. If it
- * can be merged into an existing bank then this is trivial.
+ * We first calculate the total size required for the kernel, ramdisk, and
+ * DTB to establish a safe minimum size constraint for the first bank (Bank 0).
  *
- * If the new memory is before the first bank (and cannot be merged into it)
- * and is at least 128M then we allow it, otherwise we give up. Since the
- * allocator prefers to allocate high addresses first and the first bank has
- * already been allocated to be as low as possible this likely means we
- * wouldn't have been able to allocate much more memory anyway.
+ * We then enter a multi-pass outer loop that runs until the full memory
+ * request is met. In each pass, we dynamically calculate the target allocation
+ * amount for each remaining active node to ensure a balanced distribution.
  *
- * Otherwise we insert a new bank. If we've reached MAX_NR_BANKS then
- * we give up.
- *
- * For 32-bit domain we require that the initial allocation for the
- * first bank is part of the low mem. For 64-bit, the first bank is preferred
- * to be allocated in the low mem. Then for subsequent allocation, we
- * initially allocate memory only from low mem. Once that runs out out
- * (as described above) we allow higher allocations and continue until
- * that runs out (or we have allocated sufficient dom0 memory).
+ * For the initial chunk (Bank 0), we try to allocate the largest possible size
+ * as low as possible, honoring the 32-bit lowmem/DMA constraints. If it fails
+ * to find lowmem space and the domain is 64-bit, it falls back to highmem
+ * without violating the minimum size needed for the boot modules.
  */
 static void __init allocate_memory_11(struct domain *d,
                                       struct kernel_info *kinfo)
 {
-    const unsigned int min_low_order =
-        get_order_from_bytes(min_t(paddr_t, kinfo->unassigned_mem, MB(128)));
+    paddr_t todo = kinfo->unassigned_mem;
+    nodeid_t node;
+
+    const unsigned int max_chunk_order = get_order_from_bytes(MB(128));
     const unsigned int min_order = get_order_from_bytes(MB(4));
+    const unsigned int lowmem_bitsize = arch_get_dma_bitsize();
+    unsigned int min_bank0_order;
+    bool is_bank0 = true;
+
+    const struct boot_module *kernel_mod  = boot_module_find_by_kind(BOOTMOD_KERNEL);
+    const struct boot_module *ramdisk_mod = boot_module_find_by_kind(BOOTMOD_RAMDISK);
+    const struct boot_module *dtb_mod     = boot_module_find_by_kind(BOOTMOD_FDT);
+    const struct boot_module *xsm_policy_mod = boot_module_find_by_kind(BOOTMOD_XSM_POLICY);
+    paddr_t required_size = 0;
+
+    nodemask_t exhausted_nodes;
+    nodemask_t valid_nodes;
+
     struct membanks *mem = kernel_info_get_mem(kinfo);
-    struct page_info *pg;
-    unsigned int order = get_allocation_size(kinfo->unassigned_mem);
     unsigned int i;
 
-    bool lowmem = true;
-    unsigned int lowmem_bitsize = min(32U, arch_get_dma_bitsize());
-    unsigned int bits;
-
     /*
      * TODO: Implement memory bank allocation when DOM0 is not direct
      * mapped
      */
     BUG_ON(!is_domain_direct_mapped(d));
 
-    printk("Allocating 1:1 mappings totalling %ldMB for %pd:\n",
+    printk("Allocating 1:1 mappings totalling %ldMB for dom0:\n",
            /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+           (unsigned long)(kinfo->unassigned_mem >> 20));
 
     mem->nr_banks = 0;
 
     /*
-     * First try and allocate the largest thing we can as low as
-     * possible to be bank 0.
+     * Calculate the absolute minimum size required to fit the kernel,
+     * initrd, and DTB inside Bank 0
      */
-    while ( order >= min_low_order )
-    {
-        for ( bits = order ; bits <= lowmem_bitsize; bits++ )
-        {
-            pg = alloc_domheap_pages(d, order, MEMF_bits(bits));
-            if ( pg != NULL )
-            {
-                if ( !insert_11_bank(d, kinfo, pg, order) )
-                    BUG(); /* Cannot fail for first bank */
+    if ( kernel_mod )
+        required_size += kernel_mod->size;
+    if ( ramdisk_mod )
+        required_size += ramdisk_mod->size;
+    if ( dtb_mod )
+        required_size += dtb_mod->size;
+    if ( xsm_policy_mod )
+        required_size += xsm_policy_mod->size;
 
-                goto got_bank0;
-            }
-        }
-        order--;
-    }
-
-    /* Failed to allocate bank0 in the lowmem region. */
-    if ( is_32bit_domain(d) )
-        panic("Unable to allocate first memory bank\n");
+    min_bank0_order = get_order_from_bytes(required_size);
 
-    /* Try to allocate memory from above the lowmem region */
-    printk(XENLOG_INFO "No bank has been allocated below %u-bit.\n",
-           lowmem_bitsize);
-    lowmem = false;
+    nodes_clear(exhausted_nodes);
+    nodes_and(valid_nodes, d->node_affinity, node_online_map);
 
- got_bank0:
+    BUG_ON(nodes_empty(valid_nodes));
 
-    /*
-     * If we failed to allocate bank0 in the lowmem region,
-     * continue allocating from above the lowmem and fill in banks.
-     */
-    order = get_allocation_size(kinfo->unassigned_mem);
-    while ( kinfo->unassigned_mem && mem->nr_banks < mem->max_banks )
+    while ( todo > 0 )
     {
-        pg = alloc_domheap_pages(d, order,
-                                 lowmem ? MEMF_bits(lowmem_bitsize) : 0);
-        if ( !pg )
-        {
-            order --;
+        paddr_t last_todo = todo;
+        nodemask_t active_nodes;
+        unsigned int active_nodes_count;
+        unsigned int nodes_left;
 
-            if ( lowmem && order < min_low_order)
-            {
-                D11PRINT("Failed at min_low_order, allow high allocations\n");
-                order = get_allocation_size(kinfo->unassigned_mem);
-                lowmem = false;
-                continue;
-            }
-            if ( order >= min_order )
-                continue;
+        /* Filter out exhausted nodes to find active candidates */
+        nodes_andnot(active_nodes, valid_nodes, exhausted_nodes);
+        active_nodes_count = nodes_weight(active_nodes);
 
-            /* No more we can do */
+        if ( active_nodes_count == 0 )
+        {
+            printk(XENLOG_WARNING "Dom0 NUMA: All specified nodes are completely exhausted.\n");
             break;
         }
 
-        if ( !insert_11_bank(d, kinfo, pg, order) )
+        nodes_left = active_nodes_count;
+
+        for_each_node_mask(node, active_nodes)
         {
-            if ( mem->nr_banks == mem->max_banks )
-                /* Nothing more we can do. */
-                break;
+            paddr_t target_per_node;
+            paddr_t node_todo;
 
-            if ( lowmem )
-            {
-                D11PRINT("Allocation below bank 0, allow high allocations\n");
-                order = get_allocation_size(kinfo->unassigned_mem);
-                lowmem = false;
-                continue;
-            }
-            else
+            /* Target chunk size per node */
+            target_per_node = DIV_ROUND_UP(todo, nodes_left);
+            target_per_node = DIV_ROUND_UP(target_per_node, MB(128)) * MB(128);
+
+            node_todo = min(todo, target_per_node);
+
+            while ( node_todo > 0 )
             {
-                D11PRINT("Allocation below bank 0\n");
-                break;
+                struct page_info *pg = NULL;
+                unsigned int max_order = get_allocation_size(node_todo);
+                unsigned int order;
+                paddr_t bank_size;
+
+                /*
+                 * Enforce a maximum chunk cap of 128MB for all allocations
+                 * except Bank 0
+                 */
+                if ( !is_bank0 && max_order > max_chunk_order )
+                    max_order = max_chunk_order;
+
+                for ( order = max_order; order >= min_order; order-- )
+                {
+                    unsigned int memflags = MEMF_node(node);
+                    if ( !dom0_affinity_relaxed )
+                        memflags |= MEMF_exact_node;
+
+                    if ( is_bank0 )
+                    {
+                        unsigned int bits;
+                        for ( bits = order; bits <= lowmem_bitsize; bits++ )
+                        {
+                            pg = alloc_domheap_pages(d, order, memflags | MEMF_bits(bits));
+                            if ( pg != NULL )
+                                break;
+                        }
+
+                        if ( !pg && order <= min_bank0_order )
+                        {
+                            if ( is_32bit_domain(d) )
+                                panic("Unable to allocate first memory bank below %u-bit\n", lowmem_bitsize);
+
+                            pg = alloc_domheap_pages(d, order, memflags);
+                        }
+                    }
+                    else
+                    {
+                        pg = alloc_domheap_pages(d, order, memflags);
+                    }
+
+                    if ( pg )
+                        break;
+                }
+
+                if ( !pg )
+                {
+                    node_set(node, exhausted_nodes);
+                    break;
+                }
+
+                is_bank0 = false;
+
+                if ( !insert_11_bank(d, kinfo, pg, order, node) )
+                    break;
+
+                bank_size = 1ULL << (PAGE_SHIFT + order);
+                node_todo -= bank_size;
+                todo -= bank_size;
+
+                if ( todo == 0 ) break;
             }
+
+            nodes_left--;
+            if ( todo == 0 ) break;
         }
 
         /*
-         * Success, next time around try again to get the largest order
-         * allocation possible.
+         * Prevent infinite loop if a full pass across all active nodes
+         * yields zero progress
          */
-        order = get_allocation_size(kinfo->unassigned_mem);
+        if ( todo == last_todo )
+            break;
     }
 
     if ( kinfo->unassigned_mem )
@@ -464,14 +491,15 @@ static void __init allocate_memory_11(struct domain *d,
         panic("Failed to allocate requested dom0 memory. %ldMB unallocated\n",
               (unsigned long)kinfo->unassigned_mem >> 20);
 
-    for( i = 0; i < mem->nr_banks; i++ )
+    for ( i = 0; i < mem->nr_banks; i++ )
     {
-        printk("BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+        printk("BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB) NODE:%u\n",
                i,
                mem->bank[i].start,
                mem->bank[i].start + mem->bank[i].size,
                /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(mem->bank[i].size >> 20));
+               (unsigned long)(mem->bank[i].size >> 20),
+               get_numa_nodeid(&mem->bank[i]));
     }
 }
 
-- 
2.43.0


