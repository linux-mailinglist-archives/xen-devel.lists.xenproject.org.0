Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIifNz5AEmpExAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618A5C0E8D
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318181.1586569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIi-0002oI-SY; Sun, 24 May 2026 00:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318181.1586569; Sun, 24 May 2026 00:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIi-0002lb-PA; Sun, 24 May 2026 00:02:40 +0000
Received: by outflank-mailman (input) for mailman id 1318181;
 Sun, 24 May 2026 00:02:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIh-0002Vv-48
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIg-005yCJ-Ga
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a123fb2-e002-0a2a0a5209dd-0a2a4502816c-40
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:38 +0200
Received: from [52.101.125.80]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124018-af86-0a2a45020019-34657d50d7f2-5
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:38 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:36 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:36 +0000
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
 b=FSyEgfrXgy6nyhxqC5/XSzGGwr3+ZnahNP3UbIy9wyruLE6HgmX1dzlZEsod5iFgkBDeOJz1pQ6uks5/tHqbW0lfQPt/KL87ZveFYYiAIl4fO34PmAVKSwfPzUdila+BD+NrEMIpdWTvfJTdcCImmgVQefoAcL8sYztEvnaiMPKdhxXoOd6HxRrBheOtjXMvJJTSz7IRJ5Nd9f5PeC1ma+Ac1I4wGs9Ol6lElr1/6HT9Iz6pAow/VuBThHylW/kWF4WXahWLuS1Y54xEkOseGas76WD9efpkExmVq+ZwXsIwEGgJa+bX7CssAHgPOw3x28qpp7u9MntOblAUpuEfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vwA3Er90o7oXhAI2Lat0t7tLEuFxyB9jiPPQO/KILk=;
 b=JeCQ0yowGUOFzIsvsAsGyLR6bvNRKLJUHVScV6TUlYopvJoY17pr3OnEyIfNAOrua3wKeNcP+UPT8UCGnGlHBvSvC/RpN8fdwbsuJ80Db2NyrHwkrQjQiQMwzuoKy8wMr63EjHjPujmwHImqPrOXfwek1gKEoF/PmST1QvCFAXq1PuTWabcVi2to/ZCSaJFJpMYRKtTSU7dol6DserQRWwKBDvgGOabtJS0L65SuyXfcx4DkvwfsdAP0NMhW++JjHLrlhjn/CoXJbye3YVQR2eTGQgURXWqbcSJEpVWUMBmhOBl7gakE3/fVKNOJ2XOgMxY/fQUHXIQ1wFYWW10KaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vwA3Er90o7oXhAI2Lat0t7tLEuFxyB9jiPPQO/KILk=;
 b=e7MgH8/TmCB+UgF8UafU4wmHyk1X2IIJEAMaIuxPHHEY32KRyZZntPwxf3zfD2B0IY2mPpsoWV0sLPk5je4Io3gcBy0zTRV840BJpi8PT9utQO0dVgB+F0ENDk++4D+zRAcpZHOEst79y2xX7qPMDpinY6Nib5cLE5WwaSOgWCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH 05/21] xen/arm: Map populated CPUs to their respective NUMA nodes
Date: Sun, 24 May 2026 09:01:53 +0900
Message-ID: <20260524000209.292370-6-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::15) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fd9a07-7498-43b5-c6af-08deb927c31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XYq3obG3oln4LH9nuT3gv8PXIp3KsGUuSpdVhjivF927SzYm1ehqnkVSzLJquXCwrG92YfQV3ONJ15cXSaAoI2oCOarDJiY91hPx3UZiJGjwQ6lVzPlj7z4CN3SoxowX9nCdPW8IYVB5G/W8VB8csHOWw2gERU8MO0EtwEvGZKBylVj6fE6g2oghtFPqIfK85WGPO44gja+0XH7q+opGmDKCFHv852KZWYjD9waXDtNYQlLrp8drQKS5tmDIOD++qnqqcNwUIiZ2MkdISXvk/Bsye7KE4uRCgt1T6VeobwwrrSRZbgaikinGYXEs1C+U+APlRifotXCvTiKvigZQv7YnumyJBWwjL0HGj5dnFXvydBy5FGr4cVlm1jqpm6QZjIb5D41MVx8gkC4BhjXZh9dzJJzKhKWZhXnNWQUwlV0Ri4RQhb6lhRc4eSYIUaCcfotcFf01iLO6jyvsd1M4PgOZhRMFjam5fozOZSnarIHGVHP7qoeMv1YrnB1Jsz7hUuE8KTDbjy2mZOThz5solfeZCfgKqqD68YEJS7onvxfhqNOky/AmvhPxvnq1l9GxB8jb7dC71qPmnATL8KaThJBmno8bqytjZ6Cxeusvz+4LIc1EbNfbPGbHZRk1sagZZGflyAYyBKlef8n5CnZ5KEj/uU/ioxofqKh0YT9y53TDrm+pIoLE3UQF+J4Q/Jyh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZwfUpWzVnFYM883+0oYu0ecdYO8vbdnaIbpma2BhAGLVoONwWkhLSzfPS48I?=
 =?us-ascii?Q?Z8cXb2mvFC6U0fR1MjqeLe7Hbs4yPL6SpcJGKX+uL3q2fuYIgmgRpZMtb+gp?=
 =?us-ascii?Q?iGn0khPXywfIz/SXnsQLDntN6ACvU9ZJqcwwfjWIAQpI892cMkXbAs2xtIxw?=
 =?us-ascii?Q?cpIO+Y71srRGwAqepP9mgihABulvRToHglM6APqWlQoWoHNstxjvuNLFNbPu?=
 =?us-ascii?Q?jiaoJXvyiM9fJNS8HumrSRn33+KQ4dGwG1y+5LaWVt1H1J6TDX2Zd1jD97/9?=
 =?us-ascii?Q?TVSdxhsT0eAoGd9DeyzJXX6pheYQgGwW1fFxKmod9niqUej7JaTC0gscd6KE?=
 =?us-ascii?Q?rrrUuLgbH8wQZLWiHYyHB/O9X5PK6z0hwQk3FYOm7jTimZ5xJEpqxakkZmE0?=
 =?us-ascii?Q?UlMY8MEWOgIYUDOY8u9tgKj2tp5uAjcVWxF3iy+b7gd10tkuCoWEBqEakCYO?=
 =?us-ascii?Q?eGUE46MYeF3/IrKGtU1+IlyQaljgVPI+XJCMrj2UPh5D0Hhtp4La+YtPPV/6?=
 =?us-ascii?Q?ovrPeahz77PFOJeUNGPmEL9hL3ZDmhQLCMwkKLaNvJ/4RuomcbJxfRJjPMDV?=
 =?us-ascii?Q?DEbCgOrk3WsmpML4vlfPGm0o3HybYeX+Gx+XfshtBDZVKIg8xdn5bWXAUGG9?=
 =?us-ascii?Q?3CIAY7cvDkqbT3XBIxwtISNxAOZZbq0B+j8PpLQM6/S6tqAfxNO3CrjuteAD?=
 =?us-ascii?Q?HPy+txPeAUXcT9Oxby9GK5iOpJ+a6K//HZGwxphkn/oqY1v42NNamf5fzI97?=
 =?us-ascii?Q?Oizy5T0c4UZqDqjWwDgeHe344BCDFW9oKs1QApQswlv2x0YiUACQQRb65P0G?=
 =?us-ascii?Q?NDRcwy1Qwo9m5N30/J6o7oiUQ0RQcI/81Chl0ohYjxcI328Wa2bG+1ku5Qx1?=
 =?us-ascii?Q?SE96TZsCtJ6YryBvvpDN+KhXs+wS9CL8jI2B5yja99y+KrmgH2SdDYvbMhZr?=
 =?us-ascii?Q?zRNjG6CuLHgjNdWM+Yz0eyWGphUqKHe0T4rO8B6p/7FfM1vMEkoWsP2X4BLg?=
 =?us-ascii?Q?cLrSVXGrJ/z3tKEuTBoNRHGnVLvH6GbKU0VoooVQe1mCnZ2YUvCU//hC1iCb?=
 =?us-ascii?Q?zyyyTAOrYza9azCYZp2I0J0VzPMHdnD81Fslb5t2gwl0OasRRJRocx8mBI4K?=
 =?us-ascii?Q?19uppVknqHbW9D19qGbK62/mSxMK/Hoe16MKB6DyAQ19UdjKNopQygjDpank?=
 =?us-ascii?Q?Vs9FhY6fN/tfbRBmhK2dRQjOCM6K6KaSV5vGptRYw9p9uD/Fd29S55SjgYwN?=
 =?us-ascii?Q?RaBia86D+vSZ9ASOAe4beZZ+w4gbNHI/6E4E0L/slW8Lj3YC/yGAvEKWHz6I?=
 =?us-ascii?Q?dIZAy4QHZtKIP8Hi9GiFUWGjc9gtY+Q6YsA4U5KlHlDpHd1PZFznUHUBUZdp?=
 =?us-ascii?Q?+qd4FfGBl68GB4X1WjB2nn0CEs/srw7uhhn7w3e+VQ2+UbOeEXcuv7HAMotQ?=
 =?us-ascii?Q?uSzcSc2swxgLBS0mQ5a1dLbOxR6agq87dUOeEjRlwOYKkWRp1II0kL6LnG7k?=
 =?us-ascii?Q?o308bvEhWJ+VQWQ/9uxA3VV1nlCe8J7wRvSAF9jHqrLO7nNcP3FET7lLYkMD?=
 =?us-ascii?Q?nwBg3C27Ab+Awb7yiIxO7CzGoEu150/oosObGQUrVHvSJjV6tw+EOme0fM8U?=
 =?us-ascii?Q?jXTQ4dU1SQZ22wl75w4aXdnYSa8AGgxZq9Zdtybpm2fEHP+kyCdcv0HohPPn?=
 =?us-ascii?Q?5TVmYq9M+/ay5Sw0XcgQl3zepdATm1onXBjH6vNqcEanjXV7qT3H33xla2WZ?=
 =?us-ascii?Q?tTMugnKRM/u28+ede7MLRIk1R/1cTwRq7FNVF+dGKatd1yIIVeLCq+lVgCJx?=
X-MS-Exchange-AntiSpam-MessageData-1: kURJZ8/P5eGpsA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fd9a07-7498-43b5-c6af-08deb927c31f
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:36.2715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: envWJmdu/Kv7JwhNwwMIyg9kHa2MbKHINa1Ohuzc9N3TyEkpw8UX3sKVbZftpnQyCRlBBocFi2bkRECUK2nAAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-720697/1779580958-AB36C161-2101BA10/0/0
X-purgate-type: clean
X-purgate-size: 1552
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9618A5C0E8D
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


