Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A49D9C4D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 18:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843946.1259524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFzEO-0004um-Nl; Tue, 26 Nov 2024 17:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843946.1259524; Tue, 26 Nov 2024 17:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFzEO-0004t3-Kv; Tue, 26 Nov 2024 17:20:08 +0000
Received: by outflank-mailman (input) for mailman id 843946;
 Tue, 26 Nov 2024 17:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFzEN-0004Pz-7M
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 17:20:07 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2416::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac2105f9-ac1a-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 18:20:04 +0100 (CET)
Received: from DM6PR02CA0165.namprd02.prod.outlook.com (2603:10b6:5:332::32)
 by CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 17:19:59 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::54) by DM6PR02CA0165.outlook.office365.com
 (2603:10b6:5:332::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Tue,
 26 Nov 2024 17:19:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 17:19:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 11:19:57 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 26 Nov 2024 11:19:57 -0600
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
X-Inumbo-ID: ac2105f9-ac1a-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjI4IiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImFjMjEwNWY5LWFjMWEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjQxNjA0LjQ0MDY4Mywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGoTd8PZBTxsibYfTlg5gL9ItuxwWoGfkI7Rqye8kxQH5Il8ID2wwdYDclpZhymDgrjOysyprzHbby8TSm0FCsI62tk9mu6Al3L8Xbm+Ve+dqqTFwRx1gSCuxxnWw3wZES9hzmdzJ2vRoCI1yJ5uO2VHslfG5KkVjXyslYKrdRojPDqYhuoHwOdtGqaIp9EdLeXMwHsT5TaC83rxxwAypKsHSbIzrvAVE1TI0dITsqqAVifS5qDSj44xzaywsu9s0oytTHnl6gkiqHRamak+nAdJXO6pa27W9KqHOvf0DUTCr0axKVflc5WNEjPIv+omKh+L6SJVVwcbNTs1YjL/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhTkzwMxV7eXeFIK7XcXjiaxfIWPWWwchPU8SykcV3U=;
 b=jbO+B0ursgyD7cx4e0NtsOYz3jQHMwD0FYwKItPNTBDpPqDyiQRPq0BCO3aBZQ0ljg0AbYhn9zQsdn43OopohAZFTcofMoupHgwNfZaYvcoTQaBlJ7MtsGmWyBck0kSD/9KABbFotM02GPuW/kPbFE11ZZjgg2lPpxaOXII5pXwk9E0pqgB9RBS6B+c/W33FLOsUumXSG41zLE4RfytqcXyWomQ4P6JiyM8xPmp8Z5uv8arrjVb0b92FJJfHVEZ3b5bPStlDJP9+/ANv3+icGZxbNnwdZmqE8afsstGugdzRYY9aW+nqD+mdaql2EdMdHRwfNKRf9JrjHZIWmzNi3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhTkzwMxV7eXeFIK7XcXjiaxfIWPWWwchPU8SykcV3U=;
 b=hWcLAfsqjNN46rx/RXzHZPIQjHqZekj91PQZB5xhbjnr/CyORc2ZluQ88cq1wdDnUGhtIbbz39J8qMTLsEtQScSVDnejpOOMtyyAskZLXeCYobYm4v4mQvt+RMdQLP/9kpq38PjexuyAd1O/9oM5EItiuceAFcq5f5Cg45wfiHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 2/2] tools/xl: add suspend and resume subcommands
Date: Tue, 26 Nov 2024 12:19:41 -0500
Message-ID: <20241126171941.170897-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126171941.170897-1-jason.andryuk@amd.com>
References: <20241126171941.170897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c6437b-a83c-43a8-6c5c-08dd0e3e8dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGhKQzlZVXorcTFMdWF5bUhJcEp0c25VK04wQWNuZVlobzlEZHYzWkQ2SU5n?=
 =?utf-8?B?WFl0Wktvb01ZYkR2SnFVa1luU09LNXpqNmhIYnpsNG1zaTMrS3IrN0dDSmdD?=
 =?utf-8?B?bld4OGp2RGlMTURRRUJxU1M3M1Q5eDFhekFnZitmVlBEMmI0K1dwRVdDdDNR?=
 =?utf-8?B?R0p4NFNza0hVcDNyekQ2MXlqRlIwNHFVM2xhL0EvTzJvMW1QN2VaZGxYR2oy?=
 =?utf-8?B?QmZjVFNJSENpSnZWRjh6cWpVb09lM0FzclZHeXBJdldXRHVPMzdsMTE0aTJB?=
 =?utf-8?B?cEdRckZSYng0dU8vZEc0WVJMV2hkN1BjYkdRd2VXS0k4WDJHOUJ4VFdteGZY?=
 =?utf-8?B?RWxFVFFEM1AxendZK2MyakE5SUlubUFRaFFsT2ZkUlZBU1EzaGZ2ZmpSYTNn?=
 =?utf-8?B?Z0V3bzhZOEwwRVZsdGc0Z0drYjlma1FPVG9DdzFwNWU5Sm9hMnlHMVNUcUNn?=
 =?utf-8?B?SWhFSERtNGhUN25kWmM0OGIrMzlzb0JNU2RTYmhWR1NXTXNmNGNLcGIzbFJs?=
 =?utf-8?B?cjFaemJ1cEZTRkwxOERzbUtDTG41azdXTWpIaFplT2dSQWdLVDhENGE2dkNJ?=
 =?utf-8?B?Ny9DaFoxV3pkVHJlYXNrUUNlZ2VrcUlGdi9taDZTWlNVTFFDUjRGUWdkcmdy?=
 =?utf-8?B?a1M0cWlGZUsydTFKaDZIMDVycytCWkxvcmlqd1ZwZ3NyWnh4M0duUjJubDVR?=
 =?utf-8?B?eTM4VnBRbHVhQXpPTE9kcDBjRjdmU3J5c3NBNjA2L00wUm5yYTdNbWtJTEVu?=
 =?utf-8?B?RGsydTI3VGsrL255RzdvRlByckkwMm03Sm9ZeWJ6dkE3THZNckNRd29FWGU3?=
 =?utf-8?B?VTNqOERtK3hLZVU3UGpaaldTSXFMT01uVDJaUkFYL2ZibXRsQ2tPOUtlOUg0?=
 =?utf-8?B?bWY1L2xuYXgyNGRGWUpDdUZoV3dwSmN3Y28vVGNTbnBKdmQwZFNCbzRzekZr?=
 =?utf-8?B?UEdmM21VRVp4NGNhZkNIMHRrMSt6RHNvOVZEcjVEcUpKU1hHT0ZsZklOT09F?=
 =?utf-8?B?S3Q2bWFoV2RHYXgvY0FFNzgrL3FUbW9xdWVwOVNPY25McXh3UmwrM3c4RGRY?=
 =?utf-8?B?Zzk2R1lQN1hCS0dMUmU5NGtQOSswVzF6eFRoejZ4QW9YdXk4NEhQUzk0cWNi?=
 =?utf-8?B?VTlNVUJJN1U1aWRBYXlaeEYxLzNBeXlmVkY3VjNzdVUzN3F3UlVoVG1UK2NL?=
 =?utf-8?B?L0FJQWlNT0xrNExYWVRBUnkvdkVEWndVVkFwYkZRZUdVRm5YYmtUQXBqUXp6?=
 =?utf-8?B?ZVEwS1k3MmNUTXFuWUh1UlhWRW9pUVc2M0JpQXlLd1Jxc2JrNTdzQmdzYytM?=
 =?utf-8?B?bXlaQm02TXBtUXBEcFpuTHh0YmdsM3NkQ3dJejhyV3lndUJJaWxXVlpab0RT?=
 =?utf-8?B?UTB0MXo2NzJUSkM2ODVySGsyV1ZiYVVTd2FxV2h1cCtvLzJ3S2NiNU5JblVD?=
 =?utf-8?B?Z2d2N1VtM2hEVWJqQUFIWW5hYlY1V2sxbUNtd1FRbEE3d2JVRUxScHcxY1Ba?=
 =?utf-8?B?aDVzaWpuaFJVL0k5a1FlcHZnNDkyK2VMeVdTV05CTlN1dDl4UWdsdStMakdJ?=
 =?utf-8?B?UGFqdVBhQ3pFWXdXT1ZlLzUzZFpBN043MnREMkFkclZ6aEl5eGcwblFzdFNl?=
 =?utf-8?B?NHVCdnVRdXNsMDNySnlzSmFMK1ErUWJDb1ZMS1MwaGJqSnBia0F2Q2J3OXM5?=
 =?utf-8?B?WUlUYTVHTEw2bGJpcit4YUJUMHZKV1U0QUo2bjNZK0VESFFMT3RkSGt6UU03?=
 =?utf-8?B?N0JzSzZXbGhDNzJWa0xzRGs3TFNBQVZnakNEZmFUZStQWjdpbmlPcWdWMENB?=
 =?utf-8?B?MS9VbWkxU1hYYkw1MHFJd1ZKNnc5cW0xbXlRVnZVTXVhTS9VbDlWejR6dG1E?=
 =?utf-8?B?VDFvcjlNNUsxSy9PeDhtZXhYQ2d2ME5ZNkxwMGtGOTM5RkNsTGVZTFFmZG43?=
 =?utf-8?Q?sfwjf4oUi5NjbLgu5Ty/QA7icNlNUVGn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 17:19:58.4016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c6437b-a83c-43a8-6c5c-08dd0e3e8dbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411

From: zithro / Cyril Rébert <slack@rabbit.lu>

The xl command doesn't provide suspend/resume, so add them :
  xl suspend <Domain>
  xl resume <Domain>

This patch follows a discussion on XenDevel: when you want the
virtualized equivalent of "sleep"-ing a host, it's better to
suspend/resume than to pause/unpause a domain.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---

Rename command to just "suspend"
Move inside the HAVE_NO_SUSPEND_RESUME
---
 docs/man/xl.1.pod.in    | 12 ++++++++++++
 tools/xl/xl.h           |  2 ++
 tools/xl/xl_cmdtable.c  | 10 ++++++++++
 tools/xl/xl_vmcontrol.c | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index bed8393473..fe38724b2b 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -682,6 +682,10 @@ Pass the VNC password to vncviewer via stdin.
 
 =back
 
+=item B<resume> I<domain-id>
+
+Resume a domain, after having been suspended.
+
 =item B<save> [I<OPTIONS>] I<domain-id> I<checkpointfile> [I<configfile>]
 
 Saves a running domain to a state file so that it can be restored
@@ -760,6 +764,14 @@ in response to this event.
 
 =back
 
+=item B<suspend> I<domain-id>
+
+Suspend a domain.  This is a cooperative operation where the domain must
+respond to the xenstore trigger.  When in a suspended state the domain
+still consumes allocated resources (such as memory), but is not eligible
+for scheduling by the Xen hypervisor.  It is in a shutdown state, but
+not dying.
+
 =item B<sysrq> I<domain-id> I<letter>
 
 Send a <Magic System Request> to the domain, each type of request is
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 967d034cfe..45745f0dbb 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -129,6 +129,8 @@ int main_restore(int argc, char **argv);
 int main_migrate_receive(int argc, char **argv);
 int main_save(int argc, char **argv);
 int main_migrate(int argc, char **argv);
+int main_suspend(int argc, char **argv);
+int main_resume(int argc, char **argv);
 #endif
 int main_dump_core(int argc, char **argv);
 int main_pause(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 53fc22d344..06a0039718 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -193,6 +193,16 @@ const struct cmd_spec cmd_table[] = {
       "Restore a domain from a saved state",
       "- for internal use only",
     },
+    { "suspend",
+      &main_suspend, 0, 1,
+      "Suspend a domain to RAM",
+      "<Domain>",
+    },
+    { "resume",
+      &main_resume, 0, 1,
+      "Resume a domain from RAM",
+      "<Domain>",
+    },
 #endif
     { "dump-core",
       &main_dump_core, 0, 1,
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index c45d497c28..3160966972 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -42,6 +42,16 @@ static void unpause_domain(uint32_t domid)
     libxl_domain_unpause(ctx, domid, NULL);
 }
 
+static void suspend_domain(uint32_t domid)
+{
+    libxl_domain_suspend_only(ctx, domid, NULL);
+}
+
+static void resume_domain(uint32_t domid)
+{
+    libxl_domain_resume(ctx, domid, 1, NULL);
+}
+
 static void destroy_domain(uint32_t domid, int force)
 {
     int rc;
@@ -82,6 +92,32 @@ int main_unpause(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
+int main_suspend(int argc, char **argv)
+{
+    int opt;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "suspend", 1) {
+        /* No options */
+    }
+
+    suspend_domain(find_domain(argv[optind]));
+
+    return EXIT_SUCCESS;
+}
+
+int main_resume(int argc, char **argv)
+{
+    int opt;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "resume", 1) {
+        /* No options */
+    }
+
+    resume_domain(find_domain(argv[optind]));
+
+    return EXIT_SUCCESS;
+}
+
 int main_destroy(int argc, char **argv)
 {
     int opt;
-- 
2.34.1


