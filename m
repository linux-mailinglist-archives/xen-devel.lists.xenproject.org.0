Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /c9/E9e6HGp7RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B7618292
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323453.1589139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox1-00045I-9W; Sun, 31 May 2026 22:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323453.1589139; Sun, 31 May 2026 22:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox1-0003xL-4y; Sun, 31 May 2026 22:48:11 +0000
Received: by outflank-mailman (input) for mailman id 1323453;
 Sun, 31 May 2026 22:48:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wTowz-0003s7-H5
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTowy-008Rpn-U9
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:08 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-e002-0a2a0a5209dd-0a2a45059030-14
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:08 +0200
Received: from [40.107.74.122]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbaa2-aaa8-0a2a45050019-286b4a7acd57-5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:08 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:03 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:03 +0000
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
 b=dyEmGHMEUk2MVjNbtN7aXApMM4WvF8qE/sSPlldn532zv9LYO8Mz5tR9DsantyqhAb1dy2rApaL0tvF+96gOQdj6OwtdCkO1MpmeC7DHmE8PQKxldlR7LckALp2g0vS4VCKpgYzeNJ+xNifKGYcpHrlcW5Q7TIQ3qnPTQ8SuCVldtcgpxMLESn5IvARi8dfJp9YNXb3DANfaO27eQ5lDNlqzjWZha/hnqApeWD8pRipzeRBduRcVuWH0DXrmoiYLQVYZJCZmwP9o/Ujh3l1FC3A+IY4BvfRKTVQvH5r9dCz23l4MmKf6nCnJiaNAD62p/HPaBK0uNkOJAl5uDNbX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xd9T2blWYyalwo41o8xs7sEzMUIRZ2JS3x1+k5CFPQ=;
 b=FCQIXdeneIxvujDOn28JQTViSU6h/HfBZsGhQAPbbkACasZEvdUU8/SL3VnKuh7PFGdPBgdUy6RPdhdYm/PyPKw+r6Mh2nD8X32jr50EWCy/1zjru5fOPG5vYygDfiz8s3NFoVAj1AMCib/kMcHZ81waFBojO9uWHLPHuANnli2qQd8YCDnkDpQnQrnUMXRFIDK1P0/vJiemxUNmXNhH41m7FrQ7rQZC1TUosoWl6Eus7PMNiY691Y9pA9m1hIhRFosVu092RdmLkrYLiI4k0oamlACCf+WCz47pJWDHSZlgnz1JJH0HyQT9SaQLK3biyLQy/+/n4EC+WgLLYGPIgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xd9T2blWYyalwo41o8xs7sEzMUIRZ2JS3x1+k5CFPQ=;
 b=Q7vYoe1rR2mTao9QtdyEXUdy2joAE8A8slVY0UiGiPKiAWh6LlloX+OG5yNhMJcIBXo9KbhosK5l3ZNVJbbn/cfRHk9J3CS66eex4pJcE/oIrFybWddfsj0/3Kv0sYmBz3AZJiAu07w5a1qdWq+I2jg5gWLpmYVctXg4MLmvEfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 02/24] xen/arm: NUMA helper functions via Device Tree helpers
Date: Mon,  1 Jun 2026 07:47:32 +0900
Message-ID: <20260531224755.9481-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: 517cdb47-dfd0-4d8e-eddc-08debf66ac98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JzYFxdIOz6SoQFRiB4gc2TuWE4fkpifal1AX82K7bT82iqlqo8wXBODfffUYnAxlkk3M9cHYF3jY+ce5yEOBW35hNuewlxIpIC7McJeUdgzN9QB8FcDSXff/d86OoNmkYsvYXBYbyTLhB608BDtJIXWoHaNslJkBkRBXmJPnPUKjJHcwYDUcO+J9UWG0f6OMTAvAIVXwBRWz4oBABMMtcfpVRifMTlLObNScyOjDviayy9odLzDGL6wSAUt5uA0dZapr5n6wRKpn+okd9Cc0PesyGPiMC/9Crai0DGPNsVxYrsnc2DeyiaTxYjNgt3Oh3WZ8m1bcebiA4r3qktKwzPTHGz5N2hEMuw0a5tsYhaYVu/uhQ3KzKMX7eB69X/N+VRsbJNmQ4MrLD3FTbNtGQYjd/wNzNeuWfvbX670kkJGjzlpIdTCIxbdoySmHltMzfrW9QRVE7VrsyEUw9R/VcW1ElQArFUHj/LxLHDQNFMfK4enQsVuZYX2i4xGi4nxYzOyAxUoTB0d3xBTK5Lhag8uNiGEJoA6mZSyqq1xCmGchRtnXoVaUQQ6d3HaG0vjL3sE+wPrqed/1pJteW7MS9nOqTYY4+7H60NrJtnbR5CWRaaMdLgiUQw8DIU8B8TnCbV/7iwUseaTiqnIBnFnBX0IMmdrcoIEog7b0TXBEimNHlkjTD+XBWt92khuDIQb7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IK2jVom6XM1tCnVnYOqqlTxRHYPNIKgQqjzKE29lWe5JOIug2fnJBZmJyoR8?=
 =?us-ascii?Q?ZKU9uenXv5vd5CpFbRlm6Ava8Kt3hihU+Cw5C6N6OkfIDU4s59o06VDCij/k?=
 =?us-ascii?Q?ooep4KDk6Sf8uikf/4SY/DxyrsCMhHJP94WgFe25IAuuRieDlIMO0oziLoVT?=
 =?us-ascii?Q?XP00Idl3LhK/CbaZG5bFkIf2wtN93VFJMUhBcS1Hd8VluQWQllEcrLr0Skl7?=
 =?us-ascii?Q?Ak+1vEIBQ5jxT1kyf+06fEQCrxFThAi5x+pxqQmCiDoQK3Me4szot6OFSwVq?=
 =?us-ascii?Q?aJm16l0e30suKj23tLoySNSNP7D3o8/jU/oE5q23aC/wxEE/80yeaB7YE+ik?=
 =?us-ascii?Q?Lzju6ssNWel6JwynAuG+D1BpMRdilasrzEKQbl2q52E3g/m3kMJt7o53o2bp?=
 =?us-ascii?Q?AGpn1PfySRMmidF/APEIkXjjzkDQi4xbWJdITm2qA3UbnovB61i+Xw2I3TNw?=
 =?us-ascii?Q?kswfU+q9BNHiM6lbVGMa7iY5sydErepNX8wSxXAd2VIYYsRSF10X5UjRRDuK?=
 =?us-ascii?Q?9tYQNNBPkZ9ug3ykWU+xVBkY4cSIz5BAOSZlV2sBOgak2Gy6SGE8/WZUvC/L?=
 =?us-ascii?Q?S6vXAGWfOsEpS3sNAOq0BYn1sJ7TMVbokyOvXCFtfbs+MnJ2wPoCvEMQHVit?=
 =?us-ascii?Q?CWYrXWCeE+uZNSKzvV86PTEcB+re35yX534ihZJ9bhy1HCO8W6XQ4wLxERFP?=
 =?us-ascii?Q?ogh5Qc7t2Eh3Z8gMcpFYjR3WjzypZoyj7ExuJBDvqBDfGoa6+/w707kVdsDv?=
 =?us-ascii?Q?kaSz7zY67tQkYbAh1IUfx15yVAn9G/8J2PnhDPdavcP2BYSK6FB8tJzJM+bR?=
 =?us-ascii?Q?Be9necdgEXEGqdrsbthTOrPPDKeTpNhOTvmNWtMBO/knfp33ewxnrqOzxams?=
 =?us-ascii?Q?Zxjg3KKmDTQF8+QFND/QnJbB6gm7tnpKbKyqHQaY046zqnNiSNgAOZhcaIVs?=
 =?us-ascii?Q?xMWJi26xnWEN2L/UGN5V5RKvReSI0RBEY3nEIGhr5t336QtmAvtgtDNiTmXq?=
 =?us-ascii?Q?hJWR9UE6XIxq+2F//kAIMy5IgXiQHlTMfYHiscymaRj7Ie6GtOFsW8PJl1+r?=
 =?us-ascii?Q?XzT40A9MjbrUyANQ/VHiHmG1UTK2bxPue+kMolqiu2xVt0+1h8FwOmVPm0N8?=
 =?us-ascii?Q?pFvd4zfXfTgCFhe2nVTKkhS2WDkdjNqbK+cy0Ls9jREcZBcyRj/Bm5JTAY5G?=
 =?us-ascii?Q?0R6MYGA12KPbCAoglAnQIlS3uxACqslyH0teHRaDDJxnRWO30NcHYzPC6+ES?=
 =?us-ascii?Q?lAZTgfL3jgA3SgTuc7r6+Mne9QrrBmyAB71tqTFizZnn1V97furABH8wq/ZI?=
 =?us-ascii?Q?yk/czd3ktZp6d8YiPyq25tlmwsX+yqDeiyhMmrIWhltsqGDTMm7eC2GKxZLd?=
 =?us-ascii?Q?wVPOmAp8Sx2fMoOty1nxgi2xEMDurI7uYNKYq4sm2UG/BpRVC+BIqjmME6+1?=
 =?us-ascii?Q?4fEbMfGxuWw8vK4YIBRspBcRYFuJwg/tDhRhoYEwoN/OQyU21WT4X0yv4YHp?=
 =?us-ascii?Q?qst7CK73zlc4CUQmHkFj6Mxi7CEk/9DHvwzAXmjlaPI42DeQJ+K9PvQWkqSj?=
 =?us-ascii?Q?f2rqGc61reNdRpclEBeF7aV4wjUwe6hg4sHfrYbkd6J4H8lTCQWu+776CByi?=
 =?us-ascii?Q?47qjln0eNkn9XkHNZRGn17Jw+LOQWq+tgLCQuSwQIfhI4j71cbbtRjxC6vVl?=
 =?us-ascii?Q?Yx5diUhNtK6Zvbapr0Jaht7NCwF/naIJubMFRtspa5u3pfW/TLG3t38GDKwa?=
 =?us-ascii?Q?3LzhHhfYpJmuG4/QFsuxzXDoWN+AhK1/DCPcGtsP8F8djcwl6qm0QM8g2u3B?=
X-MS-Exchange-AntiSpam-MessageData-1: Kck3eGiOMAsSRw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 517cdb47-dfd0-4d8e-eddc-08debf66ac98
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:03.7098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1V0yIfh/+rSJ6w0VHQzqY2mqn70YVBDW7HgW8QBc6zce9/XtbZSdv0jx3e6SjuVZv1SUy5BXbNZDgQZAYM4GRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-c201ff/1780267688-E1F9C443-2986B28D/0/0
X-purgate-type: clean
X-purgate-size: 2693
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7A8B7618292
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement the NUMA helper functions for ARM Xen by invoking
the Device Tree-based NUMA helper functions.
---
 xen/arch/arm/Makefile           |  1 +
 xen/arch/arm/include/asm/numa.h | 18 +++++++++++
 xen/arch/arm/numa.c             | 53 +++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/numa.h
 create mode 100644 xen/arch/arm/numa.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 84c4062b30..10d20e3a84 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
new file mode 100644
index 0000000000..a1fa54f2e7
--- /dev/null
+++ b/xen/arch/arm/include/asm/numa.h
@@ -0,0 +1,18 @@
+#ifndef _ASM_ARM_NUMA_H
+#define _ASM_ARM_NUMA_H 1
+
+#include <xen/cpumask.h>
+#include <xen/vmap.h>
+#include <xen/dt-numa.h>
+
+typedef u8 nodeid_t;
+
+#define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
+
+extern bool numa_disabled(void);
+extern unsigned int numa_node_to_arch_nid(nodeid_t n);
+extern u8 __node_distance(nodeid_t a, nodeid_t b);
+
+#define arch_want_default_dmazone() (num_online_nodes() > 1)
+
+#endif /* _ASM_ARM_NUMA_H */
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
new file mode 100644
index 0000000000..080d7892ae
--- /dev/null
+++ b/xen/arch/arm/numa.c
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Helper functions for ARM NUMA.
+ *
+ * Copyright (c) 2026 VA Linux Systems Japan K.K.
+ * Author: Hirokazu Takahashi <taka@valinux.co.jp>
+ */
+
+#include <xen/bootinfo.h>
+#include <xen/init.h>
+#include <xen/numa.h>
+
+#if CONFIG_ACPI_NUMA
+#error "ACPI NUMA isn't supported yet."
+#endif /* CONFIG_ACPI_NUMA */
+
+
+bool arch_numa_disabled(void)
+{
+    return false;
+}
+
+unsigned int numa_node_to_arch_nid(nodeid_t n)
+{
+    return numa_node_to_dt_nid(n);
+}
+
+u8 __node_distance(nodeid_t a, nodeid_t b)
+{
+    return dt_node_distance(a, b);
+}
+
+int __init arch_numa_setup(const char *opt)
+{
+    /* parse "numa=" option */
+    return 0;
+}
+
+int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    return bootinfo_get_ram_range(idx, start, end);
+}
+
+bool __init arch_numa_unavailable(void)
+{
+    return false;
+}
+
+void __init numa_fw_bad(void)
+{
+    printk(KERN_ERR "%s NUMA info is broken.\n", numa_fw_nid_name);
+}
+
-- 
2.43.0


