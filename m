Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GUuHdq6HGqVRwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2286182EB
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323456.1589174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox7-00050Y-94; Sun, 31 May 2026 22:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323456.1589174; Sun, 31 May 2026 22:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox7-0004xW-54; Sun, 31 May 2026 22:48:17 +0000
Received: by outflank-mailman (input) for mailman id 1323456;
 Sun, 31 May 2026 22:48:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wTox5-0004ju-TD
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTox5-00261G-9z
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:15 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba69-2eae-0a2a0a5409dd-0a2a45099642-28
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:15 +0200
Received: from [40.107.74.96]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbaaa-2497-0a2a45090019-286b4a60e9a3-5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:15 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:09 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:09 +0000
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
 b=T6d9JGEkyw/BrDUnWuDvXFwBXer/ly2X3iAyIers98Dh6mV8C/bya2PLMZUvu+D7doNgMhMbid6br0NdvQaegMsqBR0lrAM90Ws9mfZVqTMQ7KTJuvKdHbdPJG+n+3XOKjCei+nZBzrGz+PJopQHZc+bAVQyE945drbc3YPYqFVNzEUAzhQNeCdrcWoyiASv8EBSJqnMB4CjRgQ+qhoiOU+XFJpiopnjI+ho+/z8ayh/GoTPLMLaNAFVB7o3Wjn3VMC1QDBkmU8izxu1p+9GzC1rydYPv9OxdGM4RHMqjTjrMV9pQxOVILBB/pGTo+Vt0Q/JmlSpuVCSYJxpEMuNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vwA3Er90o7oXhAI2Lat0t7tLEuFxyB9jiPPQO/KILk=;
 b=RgSqVc/5o0d1geoZc+qYFEc7W4fZ7MbxzmyBttKdgVhbVJ86BFTOTM88AreEhgyn4NANPfO6gMuviDndPXsGU6xFaox/JVyWEhuCegS1catsNBXlo/G2Lse6f8dq6PKDY6NjDOUGelxqXSuG8s+9byuhC7JtvpKIvjSMn/hbxTLFbOFf77PJzPDqGGYA8P7gSfqaP9ELxmAUfi8Cv/XYt8XTCLKBpsj/uTUOpZcIFlpW2Ng0ob/4VJAlAe9iOJjPoup94XBfQkTbpqx1BzxzUCs7mA6PuLxobo5CeUR+SYOOSVhR5vFMzvILr9hqboxxb128ZepyR6GlPZLVvhv5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vwA3Er90o7oXhAI2Lat0t7tLEuFxyB9jiPPQO/KILk=;
 b=e5Q8syky6SFTRBzKgf+EfcoPHCEXrhepXWBOX4wTI96SwHvMJceD4WezKmZ27sEoj6Ic3pzOwOxDdmxeKIbNlSQbwWtp+/l68l1HJOpQnedPfdCs/uSThU1xjLSDLKMa3XtZsLczYwLYwbdZbojqp7cLPfOe4Y3Btv9QR49xfI4=
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
Subject: [PATCH v2 05/24] xen/arm: Map populated CPUs to their respective NUMA nodes
Date: Mon,  1 Jun 2026 07:47:35 +0900
Message-ID: <20260531224755.9481-6-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::13) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: a895a406-e2ca-4721-0e78-08debf66b00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LybIP4KPulTMoUS9xZL7uiv88URmidmsMTSvFMySXk/dUI1MsAzUzEFD6PuU1SMeTTAj3xvJF7LrtM5qHt3zJ+PuuJMfxOBGbwkAMx6t5thJtc4q9NVgeWYRxbggGaxF36j95UEBGvDWYl/GvAoOgfNXS038H8eYLIwn7h29sszz94s0lRnRFbN15Y0T0nqPrQid1J9u9j3HdheOgv2B/aZWVttx7nFbQ/k7DMbpxWtZTeTo9b23cTGxJKTg+ToA0uu+nF/S42LlRXsjpv/wlktAjo6q8WDcZ/xK9sSRnul87F+skY7at+FV4uwFo+Vwgkt+mDLBf4hnJH9nj0mmtIoC6gSW1WBNUf4x9+luhy+OHH20eXyRX+B3EX5JHYqv13zHScizyln0ypinoCojgIn2rzZOA9or4FfWeQbP+LnnV1q2vJy/iYwiHeGB7739uKZbWLl48/HkytiwXVHH0xElj9y+CextyLbaLB1UeIX6SXVFcx269K4NJXa9Z3kL0AzOlxVGnye3JPV/T3TCywkGnEDf16Plkssc6jUtDU/A/ULJaODA11r95EManVwcSS6+Fd//0LZ91q49UTSFAofa49r7wc4nKIjM/OqT+BdnZIKCWTP6dXfHQBJDXfNn1vCmEoFkK/YNqxrZfoYscFJP71n0KWuYvDFyIUXhRxRjqqX/akGg55WDZgJYM3rF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xNUynnJQ1rcU7Lyq6jH/CGRzzZEEoG3mMlplHanuMKoUxzOWFwBCsfHhRzgu?=
 =?us-ascii?Q?A7VgLVYwYAW3a3GSX1Rbj/+13wS+Blym/1eImwdTM4Tt8kQ2egJCaL1jxLsB?=
 =?us-ascii?Q?2aDBJgC5x83pG61JcBR2w0sDqfcn5zTAUeSymzleHKBYTGgmvilPZexg+L7a?=
 =?us-ascii?Q?f9gX9TnTYq/yF+O6KdEc5l9jPoZDAPC1vkNZBUEEKZKRyBmWcMLDFAzFzLpC?=
 =?us-ascii?Q?bUEk0qVDh2bTW9ta4SbCAxBM1fBKw5woMCz0//JNrYmbkRpTaQY/VZNQOMbA?=
 =?us-ascii?Q?mwKWN+y9BkUqQyiSd36BOKk/yIaz4ykfLVYW6UdDzcj7B/CB4pZsCmzjv0/u?=
 =?us-ascii?Q?dsEuMxHnd929yHbcMMrCQs4T1rxUsBZkF6/NrW6RZJF3jB2UK7JuDhJKZw5K?=
 =?us-ascii?Q?KVjNSQSCeV/mFIGwr1SDQgpHKQZ5IJB+75azyoKKuRVZ0tn2ghamLm1h+cWO?=
 =?us-ascii?Q?ufPgzGOWtXDobAAJ5qgsTCi1hFtDSq24GrME5cSjWoTbtG+40DNp1iRvlAjZ?=
 =?us-ascii?Q?GdGkwbOLNPmMdNm0BmTy32mxQQB5QJLQhhd/pSQUVZOZMMsFpxUdtamg6RvV?=
 =?us-ascii?Q?cw3LzFO0e5NJy5jTfaNYSwDKrhxA7RIKVaGU9kSStBqx1AtfqLWG1TN06wMY?=
 =?us-ascii?Q?+faVBi+DCXVvmX5oPML2yUBGY9TQjV9rMnghHjGpHkXT2aHbNpMZa8miRlKI?=
 =?us-ascii?Q?2ryHAzM8f8VJW0prV3Ll4nCUgukgjXmy0wv5PMkGcAVnoUxzF0E16SnFKVDD?=
 =?us-ascii?Q?OqaZxtWm+DWhaSZNwnk8dXCDzno114dB+bxqtlii2lTPGzjPmrhM9Pj4aBhD?=
 =?us-ascii?Q?C3D1/YaQd9UOZ9aaqIPaDB7kG9AypOAHBWNJe+JO2C7wIB6WRPwQyzlSKHvn?=
 =?us-ascii?Q?AKpTenm8mVcgMFTx/ulF/JKU7pBcqC+ZVksrrvBhi6bro+8fT2qdGSOALPGn?=
 =?us-ascii?Q?MQ/av4BSuDFmvG0wTXo01j3+dLdCgqlv8IALlvo7ozDVIRR86w9JMLNe6Jon?=
 =?us-ascii?Q?FkY1iEAoS8fzY2M62zigUcv/TX/m9N2qL7cfW5qkB859cbtwX3tpQzP4pQib?=
 =?us-ascii?Q?KLtFHvYOM59VzSzRWFIjznNQR6BCabGIy48CxCmKco61+XBJ7blCjL4iiCSw?=
 =?us-ascii?Q?bKHlrYwLjhJjM+JByIkvE9/zfv6CFgq9CeuM/gX1xBnHfloYQ76p9qp9qEJD?=
 =?us-ascii?Q?jluFaMNAOigp8Rgghz3+TbswTyrpNjpqGgALmFukFh+3QdhlaqZ4bOfkMdtG?=
 =?us-ascii?Q?rG+4W2dS5bfQ7MOx6mkLGeluQVyfbJlKCQHkqO1+YGAKvRFb6yUwA8O+zdlj?=
 =?us-ascii?Q?c/INw+X4H9MKsD4UDMAerZz1oKHEFMra4osXwGtVcdXa+CwnnmNgeaO+r5R0?=
 =?us-ascii?Q?3h3c52AAPj54CU5JQInsPtstXDCbNh3FRj0nOKQnJz1+b1RzL68fyMHopwS3?=
 =?us-ascii?Q?P5GHRHPzezlH7+UYoDwiTysiKnzLKHgbI4Bh8Gx4M7ArrNLRkJlmD1e99LVi?=
 =?us-ascii?Q?6sLo1B5Li8AFnyMjSoRB9CRju1VdliPl0YcK8GscIgO/A1QNCH0yS0/sLJSC?=
 =?us-ascii?Q?HAYJKTqoQXs+c2TLoN2+VA3jJV7VC9Fq0dKz9qzvaDRfYEr4XYPptrcJtUJE?=
 =?us-ascii?Q?uu3OOog2QfeJSq2+I7/u8BBGSpsbGwStN20RvNx2r9lnGZfpS9vS5dgHjN0o?=
 =?us-ascii?Q?3hIrKcpoGTGVQ91dU2WwjfKj7R60oPdsHJ9HzRjoAC9Y5ZFi/0iEt198ibwm?=
 =?us-ascii?Q?6XFzJSAwAeGm/3NV1hiXMWFyOJ1g0NAMfRRYmN1ZLuTyIuG2yu+fFPuP8uNo?=
X-MS-Exchange-AntiSpam-MessageData-1: ZErMP6iOjxd/5Q==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a895a406-e2ca-4721-0e78-08debf66b00c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:09.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hBphmo/iXEE+Xc/+WD06P5Y4F+tCYXN02wbD50GmZs4B6jQ7fDF4VFfVY9l64inOkH48AUoygYxSokrT7Jevg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-bad1c0/1780267695-8A18BA53-526B891F/0/0
X-purgate-type: clean
X-purgate-size: 1552
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2D2286182EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Map the populated CPUs to their respective NUMA nodes. The NUMA
node ID for each CPU is retrieved from the Device Tree.
---
 xen/arch/arm/smpboot.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index d1651fe7dd..eafa195504 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -133,6 +133,9 @@ static void __init dt_smp_init_cpus(void)
     };
     bool bootcpu_valid = false;
     int rc;
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    nodeid_t cpu_to_numa[NR_CPUS];
+#endif /* CONFIG_DEVICE_TREE_NUMA */
 
     mpidr = system_cpuinfo.mpidr.bits & MPIDR_HWID_MASK;
 
@@ -244,6 +247,16 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+#ifdef CONFIG_DEVICE_TREE_NUMA
+        if ( tmp_map[i] != MPIDR_INVALID )
+        {
+            uint32_t nid;
+            if ( numa_disabled() || !dt_property_read_u32(cpu, "numa-node-id", &nid) )
+                nid = 0U; /* default node */
+            cpu_to_numa[i] = nid >= MAX_NUMNODES ? 0U : nid;
+        }
+#endif /* CONFIG_DEVICE_TREE_NUMA */
     }
 
     if ( !bootcpu_valid )
@@ -259,6 +272,10 @@ static void __init dt_smp_init_cpus(void)
             continue;
         cpumask_set_cpu(i, &cpu_possible_map);
         cpu_logical_map(i) = tmp_map[i];
+#ifdef CONFIG_DEVICE_TREE_NUMA
+        numa_set_node(i, cpu_to_numa[i]);
+        numa_add_cpu(i);
+#endif /* CONFIG_DEVICE_TREE_NUMA */
     }
 }
 
-- 
2.43.0


