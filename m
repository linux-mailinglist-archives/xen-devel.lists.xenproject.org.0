Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OdpIoFJzWn4bQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:36:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF70A37DF96
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270702.1559294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7yXj-0007y2-5t; Wed, 01 Apr 2026 16:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270702.1559294; Wed, 01 Apr 2026 16:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7yXj-0007vl-25; Wed, 01 Apr 2026 16:35:47 +0000
Received: by outflank-mailman (input) for mailman id 1270702;
 Wed, 01 Apr 2026 16:35:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w7yXh-0007iH-8B
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:35:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7yXg-00CBO7-Il
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 18:35:44 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69cd4956-2eae-0a2a0a5409dd-0a2a450c89f0-8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:35:44 +0200
Received: from [52.101.43.11]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69cd495d-f40c-0a2a450c0019-34652b0b80af-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:35:44 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5112.namprd03.prod.outlook.com (2603:10b6:a03:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 16:35:42 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 16:35:42 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyqCSfvsmZ0Xgo/dh4xVIi64fvzWiRWyLOIGH8y2AMkP+fqgE52qPvGpBwzA8isEcfPqY0eADphTaFkVBfUCwW4OVFj9w1BQ7PqAnmCsK2eLgsBygFSIMhRjOD52E46WH0HHmvjUwmQKOr99zdjsqhk3nal4BTB0j6SXXbu90lGGfLVt+r9hZxS+QFtFsXLHb/X0CgOgcpwuCQLAyefwOVWWmrmOfmTCi104FDbOpGqKd6YPLrjmIJFF/A8/N8/ZRCSxgpMB6T0FM+ub4A/v29oedXv54RRENownBDnwriTeCg67Z9oGXzl2OLfHL9UlpPsvgMQvJq3Q5wKdsYZsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lt7N5PLZbSHwckz9JA+IcupceAjDI4eDaGLo9LKGbGU=;
 b=byKQB08mKvQhj7K89rkbdXzUSB2X/Ge7J+nLgmG2NGJd4++tk5YtCfZHM24ulx+qo495Gh1axQKFHAzasSgQuuw6GkoXgd5iZ57chpNGLCozt34NmmJGxCaw9XfmkgXC/QQjQkChDAG8oCuw6z5CXBES26h4iF9t6MVX6je2dfZg56EYUbuL13Nv06mL1V0JS+6kd8THp1FmVALd2vQAOknCPmJSqZ6sWFUMJbjAD/vRZrJ/jdxI21itzee8VTjc2DpqpeogLqAOeBdyBBMPHIq3A4KPUPRedxAK9TjA+56jEGwcW5FWOn6RqqvFHvIef93s3RB8jhZsSQLa7C84Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt7N5PLZbSHwckz9JA+IcupceAjDI4eDaGLo9LKGbGU=;
 b=cL/xWMPJF1vGcsKlZaOZLWAgKpCQ5Is1jtgkcVrMVerbdge+CL3inYIZVfZHJrMvN+tbM56rVP1YG2tVyjpwlxXgQR93UCYF76m82iNPB1MQfU6UgMnWEvy+bBBWasEgNd56Cm6FMCwuVlQuXmgK6EMl2rHAYp1PstXroRr3bcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/3] xen/smp: Rewrite on_selected_cpus() to be lockless
Date: Wed,  1 Apr 2026 17:35:20 +0100
Message-ID: <20260401163521.3603665-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::12) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a11c8f-82f4-41be-f416-08de900cb749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	mhh8D7Q7XRRFtIsE2w5ExbasElK80qbf/Rw3M3NI7iCtp9cuMHUhp1k8+c91wV5Sf0QfyTfsAZHF8HjuNsl5Hi/BRw9Dbu86/MAXNEKJoDZ7aQornRGcHQRSYtY636DtjBQJ93PXkauBlGXGgc+iWc5z7Xx+IXsDpNZSOlQK5BwCPxXbcoFKnYnDmlpbEv4HdVXQPCccwjv68MqQRKMBmVshlDGith0yyHrdFIUTmPbURBTk+j32FXTEo5KQoIrP3MwRtUw983z9xe0I0usMgj7bitN8U+XHuR2MZOol+bWsai/4Iew0G3/lt8jpYACpTW056H62vUZqt67vM/SXJmV9QA0s9Cwj1cTCMkQNE9WCqoetNzCTCPZAqznwybhsp1ihczETVTozGxoqeEuALLqdVt8/fAsmUKQRQIQU1s9Vn1Gv674VzJbDd5QCUBdX7XytdY2QI9qlQ1UeLzqJRAyuWo1wqFEzi9d++46iFNRK+rNmk8Hskj4RkNzAM9GGNDV2azQXx96cxVy4XVhpmc3ikaPgH/Ipsj9knr7hebgB93YX2j2D12Jwm3qiy2LXMe6m2z0cJwdZyOkYbGchTimu2jO6r2vsrhCdYvNw5KkxJDL5U2297IGoOXOo7N06DngTorwwvxMgeqRijqpPnoQueXY3/kyIovM6cB6gVsgQtrkL3V54+DM3Qr0G1id/Dd3rZVfE1yaYbligLazzDdFRH+0Al2zq33UPgzvGD18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MsF+4+Zom55Tp3MFMKaI146ZBKSYcMyrVG1enfVb+kn0SvmCHbVF60DTk8Bl?=
 =?us-ascii?Q?8BLUbAqk4HzKMzfsG02zJ4vUar7Ore2Dd+9LT3ivf2qJlb67sFTyl5g+3T5F?=
 =?us-ascii?Q?XaDJbGaNXpKZKJA3V5FhGMnbcUcSv5uDzOzcXO+dxGF8DfEVFVyQi3BJ3X/6?=
 =?us-ascii?Q?mZOUrrzDeQihvxwi1awS0OVsFNUyFgCt8bvpCXzyV+GmXhX44j1NOlbWxaYL?=
 =?us-ascii?Q?ihCxlCwrH73K2MKLz5e5PlhIx5XmYojIylkixV3zNBkz36Wqrx6pvi1huajp?=
 =?us-ascii?Q?b/B3UJvAY8ge55LchKJTjCpmrsPaXvCBXqX/VNrVT9u6WXrj9i5M1BUQ/Pzz?=
 =?us-ascii?Q?GkbRZWfzNw7vDw5yDRZu7XFPPItQIm2hQa3bW30CdOhy58iKawnGnac3PvhZ?=
 =?us-ascii?Q?nC1iiFdQXqtiLS75E4R7oU0hOCp2pQ8E6SEdxaCnq+nfZx2mbiSBg6VFn76h?=
 =?us-ascii?Q?3mmbIewHtBdvKVKWjeKWoiaFpi8heSlpr+oikbPPMgtKoNBLwZB77ShZpuAP?=
 =?us-ascii?Q?TIzsdk7W7aON+TKG2WPjkkj/v4JbPP00WGT/Rnsfpp+0XEHIbRlxh/GLZQAZ?=
 =?us-ascii?Q?Kh4yP/qlh4s8LCCYrWFnRHzLaLkX3S18smP4lvU+mUtXI6/7N45VME3hXcRj?=
 =?us-ascii?Q?5oJEJY5lDWpoPFk4kx8L62avUJ5UbXbdmPyE3CyhZIHk2jfx8rZ4TblBojMF?=
 =?us-ascii?Q?fvmwj7Jc7sNKwnm/licuEhZB8a35DJvFWE9YEsipMeHBuofRrdNMn/Vqcrm0?=
 =?us-ascii?Q?2JN0VbD0h441IsSvgxCoyaR58Mr4dkeEx/XfswTZKaNweSW+nz9amGVQ3jDU?=
 =?us-ascii?Q?MiJIarlXtJ9lvyAmlpqahSI3XgdGUhqhihWhM9JZ3QYfZ+wQu3MwRDB+zjiD?=
 =?us-ascii?Q?UmTQQUzz0C2mrPuhz8KIWZcLMBVC08dRb+bfZ28pqQInFNwpJwszflE8JSrO?=
 =?us-ascii?Q?2hl+nsEfZzKeP4STPNJtrhJPGoD/doFiTEMU1YgiV0kJnlsqm7xfRMTlXSi/?=
 =?us-ascii?Q?6CMhqs81F3I/JvzH9bYFL/Ty/nPTEszduwbwzITaf79fXc9hFO/4XNjH9FDU?=
 =?us-ascii?Q?heEqbtus0YlTsVK4QKIORdAr0Hr0icb0MNJWGbZTf2+1VOI0TuRCdTseUSxk?=
 =?us-ascii?Q?HXHYMZc6vMkwD9m/ZFl+XsUrTR8C/l5rGfvSwh95QQgnW7YM1TbRv+tRDWu+?=
 =?us-ascii?Q?kDoEXhI6rFL/IjojXKE8YJSjF3Ulap1OtxYjh4XtJUxPH31EVYGnpgYNLElA?=
 =?us-ascii?Q?DlTfOPm6b+NkXC5JRGrfMJXG1Ktam7GIaEKBroNMJAqiaEWbGo7swkzJwulh?=
 =?us-ascii?Q?kCEAoTqYW49TM3rTVL5pEc29MR3mGxNEqICUAGJ/x/yfDcucEXYx9ogHJTZD?=
 =?us-ascii?Q?1JWTBYI7ESMRdvZDTKT/UVeBbCT6+NiR8vcPdX08MY5VtkJg1pndx3pQPi+q?=
 =?us-ascii?Q?OthqkSAQf4PmnQcCgsAZgwyrZl+FT36cGpxVe/kaDTjZJCmtAJh8250x9kYh?=
 =?us-ascii?Q?BhOQZj5DeVUcyzj1sjjHOwwCN5ikHaQqttwvZexLOKc9P06SokkBoJTtYx8x?=
 =?us-ascii?Q?zlyDkD+sr3OHqYaETgSdMGrbH2koqQHjmduwInNKBwyzqsnRg0KWEvfsFQrE?=
 =?us-ascii?Q?NKTKMfRLmsJrNKywHXvtb0nIJnUbjrofls1vkT7j8dznobWscpI3NdOhWEwO?=
 =?us-ascii?Q?t3/Rf3XX8EEx/O8v0c/YCoKlqw9UeeBk0gWKd9cVkTtakB/peR5T2AL+602t?=
 =?us-ascii?Q?HahatwnA65eSMZ5YSf0rTWmg8seAjmE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a11c8f-82f4-41be-f416-08de900cb749
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 16:35:42.3955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6E62ek+7GeQcY0iE44JSyWozi/wBFhxABKOnD8vhbxHw7dGRHDpSzFB5cJBwS9PNYxz686GKUGmNGSOfr7Cb09dB8qbWuTeJm28nq2hMRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5112
X-purgate-ID: tlsNG-d25034/1775061344-A49BFA3D-A2293BCB/0/0
X-purgate-type: clean
X-purgate-size: 4313
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF70A37DF96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

on_selected_cpus() holds a global lock even if the function is to be
called on non-overlapping CPUs. This is a scalability bottleneck so to
avoid that:

1. Remove the global lock.
2. Make call_data_struct per-CPU.
3. Track which CPUs are currently running on_selected_cpus() using a
   global CPU mask. This tells CPUs running the interrupt which per-CPU
   call_data_structs to look at.

Since the call data is now per-CPU, skip waiting for CPUs to "check in"
for async calls. Instead, delay it until the next time
on_selected_cpus() is called by which point there should be nothing to
wait for.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/common/smp.c | 101 +++++++++++++++++++++++++++++++----------------
 1 file changed, 66 insertions(+), 35 deletions(-)

diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1ea..e592e8453fb3 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -24,13 +24,15 @@
 /*
  * Structure and data for smp_call_function()/on_selected_cpus().
  */
-static DEFINE_SPINLOCK(call_lock);
-static struct call_data_struct {
+struct call_data_struct {
     void (*func) (void *info);
     void *info;
     int wait;
-    cpumask_t selected;
-} call_data;
+    cpumask_t selected __cacheline_aligned;
+};
+
+DEFINE_PER_CPU(struct call_data_struct, call_data);
+static cpumask_t tasks;
 
 void smp_call_function(
     void (*func) (void *info),
@@ -50,55 +52,84 @@ void on_selected_cpus(
     void *info,
     int wait)
 {
+    struct call_data_struct *data;
+    unsigned int cpu = smp_processor_id();
+
     ASSERT(local_irq_is_enabled());
     ASSERT(cpumask_subset(selected, &cpu_online_map));
 
-    spin_lock(&call_lock);
+    if ( cpumask_empty(selected) )
+        return;
+
+    data = &this_cpu(call_data);
 
-    cpumask_copy(&call_data.selected, selected);
+    if ( !data->wait )
+    {
+        /* Wait for any previous async call to complete */
+        while ( !cpumask_empty(&data->selected) )
+            cpu_relax();
+
+        cpumask_clear_cpu(cpu, &tasks);
+    }
 
-    if ( cpumask_empty(&call_data.selected) )
-        goto out;
+    data->func = func;
+    data->info = info;
+    data->wait = wait;
 
-    call_data.func = func;
-    call_data.info = info;
-    call_data.wait = wait;
+    smp_wmb();
 
-    smp_send_call_function_mask(&call_data.selected);
+    cpumask_copy(&data->selected, selected);
 
-    while ( !cpumask_empty(&call_data.selected) )
-        cpu_relax();
+    cpumask_set_cpu(cpu, &tasks);
 
-out:
-    spin_unlock(&call_lock);
+    smp_send_call_function_mask(&data->selected);
+
+    if ( wait )
+    {
+        while ( !cpumask_empty(&data->selected) )
+            cpu_relax();
+
+        cpumask_clear_cpu(cpu, &tasks);
+    }
 }
 
 void smp_call_function_interrupt(void)
 {
-    void (*func)(void *info) = call_data.func;
-    void *info = call_data.info;
     unsigned int cpu = smp_processor_id();
-
-    if ( !cpumask_test_cpu(cpu, &call_data.selected) )
-        return;
+    unsigned int i;
+    struct call_data_struct *data;
+    void (*func)(void *info);
+    void *info;
 
     irq_enter();
 
-    if ( unlikely(!func) )
-    {
-        cpumask_clear_cpu(cpu, &call_data.selected);
-    }
-    else if ( call_data.wait )
-    {
-        (*func)(info);
-        smp_mb();
-        cpumask_clear_cpu(cpu, &call_data.selected);
-    }
-    else
+    for_each_cpu ( i, &tasks )
     {
-        smp_mb();
-        cpumask_clear_cpu(cpu, &call_data.selected);
-        (*func)(info);
+        data = &per_cpu(call_data, i);
+
+        if ( !cpumask_test_cpu(cpu, &data->selected) )
+            continue;
+
+        smp_rmb();
+        func = data->func;
+        info = data->info;
+
+        if ( unlikely(!func) )
+        {
+            cpumask_clear_cpu(cpu, &data->selected);
+        }
+        else if ( data->wait )
+        {
+            (*func)(info);
+            smp_mb();
+            cpumask_clear_cpu(cpu, &data->selected);
+        }
+        else
+        {
+            smp_mb();
+            cpumask_clear_cpu(cpu, &data->selected);
+            (*func)(info);
+        }
     }
 
     irq_exit();
-- 
2.53.0


