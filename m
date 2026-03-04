Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HcsOcKNqGmzvgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6224D2073A9
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245951.1545291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHZ-0008Fi-9r; Wed, 04 Mar 2026 19:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245951.1545291; Wed, 04 Mar 2026 19:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHZ-0008Cj-6A; Wed, 04 Mar 2026 19:53:21 +0000
Received: by outflank-mailman (input) for mailman id 1245951;
 Wed, 04 Mar 2026 19:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfWr=BE=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vxsHY-0007ik-3Z
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 19:53:20 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9ac4c69-1803-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 20:53:18 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DM4PR03MB6079.namprd03.prod.outlook.com (2603:10b6:5:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:53:15 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:53:15 +0000
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
X-Inumbo-ID: c9ac4c69-1803-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n38ZjhsGawuyw6lmA6lfhKxwDPGYCWpFChLhtXFi5tLqsRZJ/VYDYcblahoMbqDFmWVXgg1G4DoQdOARRE2UnE/pBxVWfgzYvnbQRa/gHUTw8aGNROMXpRtK0PNeocRs4ePWinS0ZQQ1G2U7/WziYahiLwaRMVD7cckIDri4uTvTQ6cxpObfKmU/hgZhLNWiidns5Vdr/Zu6saRrdjuZ84G560x/0ZeFEkW9y95NlemI1f7XKAk/9DwvoyOdtCL/99tVGEux+11IhIGg6NBNNYvyMev4bGsu6skWn+jfkvsbz79Ps0aB0BsqON7qWpFAhvZ+PSKdkgmRjYpiZhyDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1ZPnGi7r9oYX1eGFu1Ek0cz/C13jvr2b37l7ThSCSs=;
 b=ryYBbkpVxkYsZjxe/da3Lbaw+dxojxCxj7Kjljt8BE9sxCfdopz+1B8lsJk7P8wJKgpOqUu67PR2mf+sncsKc1s48ZovgfrwkKGtopmP/cM43DPLbOaX1tXvwhvwb3Oe5vyeRe7A8w/b/Fe5JrbBqaygi5nGlxWys9qtRSqxi8rGeKWUdJW+VnLuLFq4IBExUGEcid0SU0UMmPxv2Ci1eWwKU1blD8zLaRWolhuSbPZ+U2PwcOSqES9TGqUD7VEHEGcvtKAAKq8ewvLK8syVT2xzKz6pgimd/eQ98hjf3CQrlUO4D0YDypRx993maLUJFN8EjHg32JQnlFXMMO9ZBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1ZPnGi7r9oYX1eGFu1Ek0cz/C13jvr2b37l7ThSCSs=;
 b=N3766J+zXxvQQJcF8UP6ldCK5QfxDPJv8BIFsobkkNzHTitlpKG4Ir6k9NYZed2mVAB1uK763f9lpBDNWammVSfeW/V4a9b5XAeE2OOMoozQnVPz1/uk0LvBEo1SiBJ7XhPYsfevJim7twlcPxvLW0Dlt2o+RaVHEqj/a4sGqkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 2/6] x86: Remove x86 prefixed names from acpi code
Date: Wed,  4 Mar 2026 19:53:46 +0000
Message-ID: <20260304195350.837593-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260304195350.837593-1-kevin.lampis@citrix.com>
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0260.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::11) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DM4PR03MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f33329-3dc6-405c-21b9-08de7a27ac76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	tWAmq6oYFRGC8VMicIQjPiqNWnle07+z7MYU2IxDJ7Igv4MZiZg7LrNPYXP65gCWWrA0SfTEdAck0mDoH9Kvxq761EeJwamKXLlcJmC5/BcvS5QyU6wENk+fTwnbKjBJTS3K2WxJTOSrjtEl/yOQWHsrdbSHeW1YT3W7Pwh2rndh4rf9qn5yiYsYhiZpcQWQA9dzz3iCCHrG75HX9aenPsQLmiCDtUKpCca/SV9mnduUySrIfmztf2JLBHnoxzbwfqHHEgjgA1Fuk6cEgPjSp+p9nSA6CYKhqR2gAT44fTGEpwUvijUh9n1uZCxZk8tywJmZbWGYLXYe1sd5YuEAVDs1jNu6hNqgZfWsJJWg9ahPDNclE+yEKSE2tpeRuPOq5TjQUjCQoZPRFS1Ju6z7PMbgIlluPplh7kL0M4iCdap2/CIVg+h80XXVhkr40cOp8QBVdnleXjnj9uMDCKiWwotWm2V1O7SYQmJnnO7llzOhiTBdF7C67azsjBXE1HwndhbDccGkkbTfKr9vI44X3bfu8SoRceizQrZNQUYkgqqG+nj480aZnt9KDjL3y9rI155E5rjlZNnqc5/xrVxCH/libj0M0GgO2vkf9pqq8pwOoG7/0JabjcVlHeNWLZhznD6yVkW6sMy241SqyrcA5VKu0dwjuoWHAGzshzeqnljpW/M//wzGP5hfF5JLh9aLBKcpKdarxRYk5pC+RMKHJB9BUYDYVDoC93zobw1vzrE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?05/fWnlVTEMNLaJRrjjWFa7eWJLt4vHDiFf51EBvwEk8Fc0av1kAlByywjDs?=
 =?us-ascii?Q?kDi5RpvuR8I7g31y0EbYXo3nEsKl0HFNkZiZh/OPr54myVAfRNAi8/uFx++E?=
 =?us-ascii?Q?K9RjeQFWF43AqkFHUm9wVDQ3Y0x5K7JPwrmYfa6BaCo05cPTDSabLU1Lp7tf?=
 =?us-ascii?Q?AYyB+wvTVfmMxJHNGvwJ7dr2Gqs2iAIYg3VrCGguFXSSSF5jR0VHu0bIwxB0?=
 =?us-ascii?Q?SIWvHrQGjhOaV88JledSfcjiIy/z4TUpGj3g2n4PX1W8cpJDAjnE1t2VpirX?=
 =?us-ascii?Q?iE3jcPEKZFlt/8naCaoviaOAZRfurISz72rhTiWMMvSFNQ/3r6LnqRhIThDN?=
 =?us-ascii?Q?u+tbLENKqXOwUAsqpmim+dhYsnigABhfanJ+3nMBzhoQ+rk6LBmo+WtGGE35?=
 =?us-ascii?Q?ckVcK8a1etFv2a3+kyQ0qiLEUXHEiPY97g636RAMv1EanHzGGRPwBPZTweA5?=
 =?us-ascii?Q?mlucEAoFHhhGbo4vHplHdry+heFNugJBVnKXpRyXauNUm5tSUmad6Jr5nDgA?=
 =?us-ascii?Q?A2NrZ9wJHrVq/AZ3DH61sAOeULyM9gMItVvOkrQRt7uFxCMqsN2aWpr+Amfw?=
 =?us-ascii?Q?ykSe1fbIU/NhwGknMEO67z39IPmYM6Cv9/QgK/6yCXTamKn8KB9IuO/Qm1ks?=
 =?us-ascii?Q?g6Ao+Q1cPNoKLlSF1Uh0ftCn1eC+VNL7X632fbCFaujpRB1snx2eEq3KoATK?=
 =?us-ascii?Q?OdoOBR/hnORYDDPRyd/fT0v4Ck88mOQuJpH2mxgu3EgYycNxRf2aEw70iUUN?=
 =?us-ascii?Q?odxREy0eaWUbjr75rTywBIHXnPtKElZUyxVMO+JZwReqcTZjOB/6D+7PuBiD?=
 =?us-ascii?Q?a0HsKjJmmtH0W4r8YoJKKTt7s9JpbMjzgB68pXJmy3H3SBgVOTTiJRQdDGzq?=
 =?us-ascii?Q?WofzJHYwGhcpWihlbqWoWaZ8vZMN/qFa1UXlsoO3ChSyU/FgegxzAdkR/pPr?=
 =?us-ascii?Q?LkEFvhtRO4rL7Gk3eTjwkiJTXSifzZp48H8zUgd2ZMF0r8v/OktumHxgeAwO?=
 =?us-ascii?Q?IaHsr7Ck4zEsp1G0i3M/4r1nV6Y8T0HckkXkcdIDA/yn6PxQmEJiu4vh4Nfr?=
 =?us-ascii?Q?Yy+RUKa/wJNOq2meBZIL+UpOi/dXd+4R3YZDK0x1EgH90A2GqFLApcD4OrlR?=
 =?us-ascii?Q?25Llm+pkdXZBIqycujxvRfTceadlWaeNW+WHa0BNrPiooU1R/x6fweelK0OU?=
 =?us-ascii?Q?PkCJyV8KZYLAxdrmio+pIqS3XC84GpcHiLXJmZcUpreNpFs+KUKlmdF7dkCO?=
 =?us-ascii?Q?ILHMZH/76bY6zkG0ByWNdoyOmfC1ItLStDKH0FF2eOAOSL6/P2yOHIYPw4UB?=
 =?us-ascii?Q?YhTnsKTsG5/iSFH3JMn9w2e+VT/tkxQHNCmTbTGkJYl46PC3+VFrP9T5U2gm?=
 =?us-ascii?Q?ul+V40R9E5KX66oHzDIIY3MshV+3YQ1aAcenWiis0zEWIWmZaQPz249ojiPo?=
 =?us-ascii?Q?y4UUXWIfkNP9+ADrtExq2HnY218vW3AmnCHr2RjQWQXou8Zp2kvTa9P+tBdw?=
 =?us-ascii?Q?KXZehPxks8aZyORJ26XdUkwHpHUoRYtZV83OkZlAr2DbD2WDUvESm2gY0MxN?=
 =?us-ascii?Q?+RVzpTGSsAbKRnp+zhcuss/Ccuf/8h1pM+HoTGS3mXa34uwo2gODrRXMqans?=
 =?us-ascii?Q?qsBjqY5aJutG/2i9dpgVbEvuH/QRDDHQfj+sbdb1bVnYW+9ctC2d+FDKFdzF?=
 =?us-ascii?Q?r6rkqF+6l/Pa7Ltfvanom0TyCejmnAJupO9xkXkzD5yz7VoGSORj+MybMEAW?=
 =?us-ascii?Q?EB99WmICKg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f33329-3dc6-405c-21b9-08de7a27ac76
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:53:14.9687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdOXM5OepvSdeokTNldoEk4ABtZ0Pj2ZF7RY5a+m2Qoz+e3SSBgBX6uxqs2kd++pteHU1LCF+178C8klR+Y8dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6079
X-Rspamd-Queue-Id: 6224D2073A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
X-Rspamd-Action: no action

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Inside do_get_hw_residencies()
there is an explicit check for `c->family != 6`
Do we need to add family 18/19 support here?
---
 xen/arch/x86/acpi/cpu_idle.c         | 20 ++++++++++----------
 xen/arch/x86/acpi/cpufreq/acpi.c     |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |  4 ++--
 xen/arch/x86/acpi/cpufreq/powernow.c |  4 ++--
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 0b3d0631dd..1d2ef776fe 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -178,10 +178,11 @@ static void cf_check do_get_hw_residencies(void *arg)
     struct cpuinfo_x86 *c = &current_cpu_data;
     struct hw_residencies *hw_res = arg;
 
-    if ( c->x86_vendor != X86_VENDOR_INTEL || c->x86 != 6 )
+    /* XXX Does this need to be extented to include fam 18/19? */
+    if ( c->vendor != X86_VENDOR_INTEL || c->family != 6 )
         return;
 
-    switch ( c->x86_model )
+    switch ( c->model )
     {
     /* 4th generation Intel Core (Haswell) */
     case 0x45:
@@ -915,7 +916,7 @@ void cf_check acpi_dead_idle(void)
             mwait(cx->address, 0);
         }
     }
-    else if ( (current_cpu_data.x86_vendor &
+    else if ( (current_cpu_data.vendor &
                (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
               cx->entry_method == ACPI_CSTATE_EM_SYSIO )
     {
@@ -1042,8 +1043,8 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
     flags->bm_check = 0;
     if ( num_online_cpus() == 1 )
         flags->bm_check = 1;
-    else if ( (c->x86_vendor == X86_VENDOR_INTEL) ||
-              ((c->x86_vendor == X86_VENDOR_AMD) && (c->x86 == 0x15)) )
+    else if ( (c->vendor == X86_VENDOR_INTEL) ||
+              ((c->vendor == X86_VENDOR_AMD) && (c->family == 0x15)) )
     {
         /*
          * Today all MP CPUs that support C3 share cache.
@@ -1059,8 +1060,7 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
      * is not required while entering C3 type state on
      * P4, Core and beyond CPUs
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL &&
-        (c->x86 > 0x6 || (c->x86 == 6 && c->x86_model >= 14)) )
+    if ( c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH )
             flags->bm_control = 0;
 }
 
@@ -1416,12 +1416,12 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
     if ( vendor_override < 0 )
         return;
 
-    switch ( c->x86 )
+    switch ( c->family )
     {
     case 0x1a:
     case 0x19:
     case 0x18:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_HYGON )
+        if ( boot_cpu_data.vendor != X86_VENDOR_HYGON )
         {
     default:
             vendor_override = -1;
@@ -1648,7 +1648,7 @@ static int cf_check cpu_callback(
         break;
 
     case CPU_ONLINE:
-        if ( (boot_cpu_data.x86_vendor &
+        if ( (boot_cpu_data.vendor &
               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
              processor_powers[cpu] )
             amd_cpuidle_init(processor_powers[cpu]);
diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index d0ca660db1..de67f1aee2 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -454,7 +454,7 @@ static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     /* Check for APERF/MPERF support in hardware
      * also check for boost support */
-    if (c->x86_vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6)
+    if (c->vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6)
         on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
 
     /*
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 5740c0d438..9ef62b3538 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -133,7 +133,7 @@ static int __init cf_check cpufreq_driver_init(void)
 
         ret = -ENOENT;
 
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( boot_cpu_data.vendor )
         {
         case X86_VENDOR_INTEL:
             for ( i = 0; i < cpufreq_xen_cnt; i++ )
@@ -252,7 +252,7 @@ __initcall(cpufreq_driver_late_init);
 int cpufreq_cpu_init(unsigned int cpu)
 {
     /* Currently we only handle Intel, AMD and Hygon processor */
-    if ( boot_cpu_data.x86_vendor &
+    if ( boot_cpu_data.vendor &
          (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return cpufreq_add_cpu(cpu);
 
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index beab6cac36..55166eac72 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -143,7 +143,7 @@ static void amd_fixup_frequency(struct xen_processor_px *px)
     int index = px->control & 0x00000007;
     const struct cpuinfo_x86 *c = &current_cpu_data;
 
-    if ((c->x86 != 0x10 || c->x86_model >= 10) && c->x86 != 0x11)
+    if ((c->family != 0x10 || c->model >= 10) && c->family != 0x11)
         return;
 
     val = rdmsr(MSR_PSTATE_DEF_BASE + index);
@@ -157,7 +157,7 @@ static void amd_fixup_frequency(struct xen_processor_px *px)
 
     fid = val & 0x3f;
     did = (val >> 6) & 7;
-    if (c->x86 == 0x10)
+    if (c->family == 0x10)
         px->core_frequency = (100 * (fid + 16)) >> did;
     else
         px->core_frequency = (100 * (fid + 8)) >> did;
-- 
2.51.1


