Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC3MBSc9tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:36:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39C28722F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253992.1549985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VF-0004PV-Ix; Fri, 13 Mar 2026 16:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253992.1549985; Fri, 13 Mar 2026 16:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VF-0004Ms-Eo; Fri, 13 Mar 2026 16:36:45 +0000
Received: by outflank-mailman (input) for mailman id 1253992;
 Fri, 13 Mar 2026 16:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc6w=BN=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w15VE-00040A-MH
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:36:44 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1618e46-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:36:43 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH2PR03MB5271.namprd03.prod.outlook.com (2603:10b6:610:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 16:36:32 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 16:36:35 +0000
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
X-Inumbo-ID: d1618e46-1efa-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQJlUQS8ehx+pUCBIsVHP8+mSpFc0HTohzg6FKiiI1O0O+WzppWQVrfiF/wSSksRHp7TbqcEAlJ6YPveNf535aqPI6356GflNiAv1ymMI8x8Pb6fsFhQ9hEV5ln9r0MN+2khA55wu7O9w6rjpkr/IfvKGMwY5Vnf7GpBfMw6Rd3hr/XBPSwh2a/ltn+27mdvKlKgWE4zhfFp8XdfT20aXH0EqAH/6QriI+J7UTBaegJ5GNDUj/JsjBxatsnZQ//RHQJc/hHNBVBv+jizM6sJYBPAASRnuDOOsrrOjYiRigWu0+opj6I6uUuEgCjQ7nYVt138VYnV8SfxAq4Ag963FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBGZdbGxyCmYWqSQzp9nF0WnQDqrWAjMlDpiE89Jvo8=;
 b=v2GlEE+Gm77nSt812oCUToHLhXxqd3Rbs+JHr9xBaNHVS5IcOR/ezDRTF/MMedRl7sLbIjVzNAHoxir1hnIxuPl7VEjqt+oyBuhLvF90QVeOJpWsTeWDLp/LZCzwcWDn8FEb/gI08p4P2wCtX9sHumD9gTGA/9JYctfZ5NM+8BCcHZ5mZnOi3JNT9eleinM5gsiGI8Rkgb8Oozrm/Eue+gptuzr56F9RDcDoBKSPM6DwOJmxB8iqLFSulbXPR10vHRV+MQ8l3uHCodP/r0CP3p9zi8IzBEFC6K4GwzK1Nar5wP4Zs7eh1f99mGnqRhq8bfh+lzz4iDeYYazlEhJMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBGZdbGxyCmYWqSQzp9nF0WnQDqrWAjMlDpiE89Jvo8=;
 b=y9gjQGcP/Ha/V2CS9KydQH5HNgG7Zvj5jLK0T2bZtUIm9+o2tShnkK6JdQ9pm48hlPzRbMt0kgwzQdgbknGwaMaLpdbDw6EfFfSFapw3Awc4moZ0d5AeOtw4B4gegV+splRrFgA5YF+Vzof/rjv5LuWOVz04PPfXMEMuIbSDogo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v3 1/7] x86: relax some CPU checks for non-64 bit CPUs
Date: Fri, 13 Mar 2026 16:36:24 +0000
Message-ID: <20260313163630.1073019-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260313163630.1073019-1-kevin.lampis@citrix.com>
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0495.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::20) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH2PR03MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: f46e3f2c-a352-4378-27fe-08de811eb16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ED95+5zo9HncVDuRw4JCrjo3FvRpDBwJTHkWplIpE6pd+RhVupf6Pp7cqxgDRPh1uVe0F6j9kWCu73tVYhFhSVlVLLQloL6DU8hGRnns6Yu1l7xODfo/7pk5Ccuc7gji2tXaSIG0lvFFEcJmixnlP6T91GOofDuhkOmrNwIHKiFNqxmsklL06C81lT+EWE+7/XIsftHffWhxHstajzh5VlYk9nSuY1Mcmsa9R3LWO+no/i4MjmF/T2ASLyn2t/nCscebcDirEa1wlJLL3Y869a/5p7tO7+JLXjeP15FfBwGPhagkOinNybK4cPwY33Bs+1J5t5nngbw3SNhb84Bohu05HPAdq3QCRXX+RsYJLkPqOjAnU7aOdIHT29wjnvVP9TnpaqDyZsofufgguhBDOwqQwd3H+jt2NX9hZDerLxCXGBaY8i2aDmmu6g44YWklsdaXS6svQ10tiTRfCekho4ywFHdT52xmSjbKqNSnBwB3n/PYjZAL6qQrU/I334komVSgic3r6p0ly1+PuJ9YfJbRRmOIcghJ0+TdiPbjcYz8eCZ42QmLmRdFgcg0KPHOE0P6u+hnM76BLbIFkT5i5tDrrWvGmcFSe6boJi+GYNWiiU2i6+wF6qTAcXiLFPn6fyqDvnBxPmrfLP+rBnt5BvlNTHr7j3Zbs1URpPQrZI7lZE3lSxxzKc1rThFeKPfPSj8a8Xvgd22Y8MS/faoEFa8vkEXhf+RNva6XaTVHi5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W7TdgVj5FCobwCD+AA7jQ38YlCkxN7fs/5wpoXU0o6NWUpt/ihRo+yFrRlaf?=
 =?us-ascii?Q?o34XpKkZ5S6kCTG/r3NUfL4MBgRsKJflfktey3fGZkLiH0B0ewvvdnxXUCai?=
 =?us-ascii?Q?Vd+aFDk8JaeHSbanPiFpgFeqUzOgYEI8SkUt+HHYL4BzFVuQcZ5yZK2y34Ig?=
 =?us-ascii?Q?FeJDI0xwc3ePwkVMj5u+NbtSYyrxSSIx8qeZtjxazLkXO7tm/zW+4czWE8WP?=
 =?us-ascii?Q?72vS7Iy/vCU8YlOC49cLiFAl7iUoLrC08De/0iG4LWY1tdynmKrui4atXuOk?=
 =?us-ascii?Q?3ssB26s8n0EjCbcGyQ1OmE0SON25QazzB441DnaJBkv86s9xbabJFHNemehL?=
 =?us-ascii?Q?8xUg5qr7VEz0NPwv+EVzpXWAzXtYjS/7le1eoHnQ1bFf8psEgURKPIcSMlVB?=
 =?us-ascii?Q?MWj9QJundG3xK+MuQbwucIUyPwygPutx9A8ZK4M6J+jX33pf/D8niVEbOXVH?=
 =?us-ascii?Q?ZPG5In6J/sEyle6vAhSmPskxihYT37SIQZnh9gCM09rk6rRL22lUx/w3LvKA?=
 =?us-ascii?Q?kD+zdXWAmFdCc5fiz745JCiPwO4qbdwiPdR7UfEazWmPN54HJgnMhDeBnM5S?=
 =?us-ascii?Q?PHgjaSLe9j0FfQYs5MpDZkixb3/mf3640D9BOqDy5B1Jrd0AZeZPGfT2o140?=
 =?us-ascii?Q?1plEZH4PehviFLPO6edSdU5MTfDqZA8dwO3S1wJKTNw9gnOwP4Z4pDNFNntL?=
 =?us-ascii?Q?mgAJUEJrg2cFaFS2p4yozAih5xOEeW2xdsP9dYxAfoFB7hZm2xMt1Bl170Lw?=
 =?us-ascii?Q?Jl6zWaUzM9qSw5N/xt1LGQFMurNxzf29EjciUQeDSLvPpBReXUiPmIr0aeW1?=
 =?us-ascii?Q?kVzE+963SsYgoIuW220KwDbOfLE3bH9nv9PDryI8r+dJnEGtYX/LRgnwu6rz?=
 =?us-ascii?Q?hxpLz5xrRr02PP86r90CwbLdk2P9OBsI/og6vDU48kAgdE/0CIfj8rs8+nbZ?=
 =?us-ascii?Q?7N9z7pGIQmmo4E20KP2RFxry8JmFJL9sOUii/FXStSGjukJZiFsZ9yVXKXXf?=
 =?us-ascii?Q?Bqhs2CWLRuX20wPL3aLpvGEKsAtsFH4irD3mdwsBSyAbaRS3yGZyOe01SppE?=
 =?us-ascii?Q?WK+w3qqK8rd9KXArl21ODX0ZMcOOOH85QLsIElYFCJb9W6RZORC+KAyUeyXO?=
 =?us-ascii?Q?MzP7J0e8SHuh9M2nFc1SXl2Bk4+7vjcR7n/hh7TfvCHx48Z0xewseKKhMFTt?=
 =?us-ascii?Q?eLdyqvb3VtRE67sXIaCUVhmcL4E7gN1avnKb38ATiUjqmeLhjhBMLj5jRyaB?=
 =?us-ascii?Q?r81bgLs8uMBHlm0eGppB8wCPn/OUtGlWp6q35GcfcM0rp+dBvX3FebFGPlNf?=
 =?us-ascii?Q?W9uoPweBwR7r0Mw4G9G2YT6miFMZD1V0GTvZxTgQAxp1k7ZL2uPVa/EYnv46?=
 =?us-ascii?Q?CgzBZSFMyh1fDbnEhBTZ2q147eK3rjILotKLWbAniEuP/95eVYYWurvEvCKV?=
 =?us-ascii?Q?vHSTgh4W1ERRG45oN1Mny7wv8MJqfpHkCZaCpU2gQ6RfIa7yyGGcWeAqqDzl?=
 =?us-ascii?Q?KmPq0eFqKmB5tglmwC0r8uvQscU227sXjo0jY5w+HR8Tc4eOOnLApAAWUJfU?=
 =?us-ascii?Q?gA/c6CK0jzOP5cnRJ5K6sI/LZTLR12/uFPrf0T+Ltq+pf7JB6M/idKbsGUj7?=
 =?us-ascii?Q?GkHsoePgjBIozkVC0BXn2jw34btjTs+v77D7LjtBhTF+95R7IT/0ed+jaRco?=
 =?us-ascii?Q?3UnjD+A78S5FagZnSaQbDZ5FCrVdq2LHEKtk+4nJXPxoVsIOA0VrPPPQ9MSp?=
 =?us-ascii?Q?1dy03SEavg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46e3f2c-a352-4378-27fe-08de811eb16b
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:36:35.9530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZ0gVouyWtItMtOIzQxFTABxo+PrDUjfXCvM0NcMjFEUADFVppUmTziO/pSFmiLlxJ7G3gR/LsHHIKtkCR9PDA==
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
X-Rspamd-Queue-Id: BE39C28722F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These checks were guarding against non-64 bit CPU models but they are
not supported by Xen anymore so the checks are no longer needed.

The switch statement was removed from mcheck_init()
to support Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- New patch based on review comments

Changes in v3:
- Moved patch to front of the series
---
 xen/arch/x86/acpi/cpu_idle.c    | 5 ++---
 xen/arch/x86/cpu/mcheck/mce.c   | 8 +-------
 xen/arch/x86/cpu/mtrr/generic.c | 3 +--
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 0b3d0631dd..46749ca337 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1059,9 +1059,8 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
      * is not required while entering C3 type state on
      * P4, Core and beyond CPUs
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL &&
-        (c->x86 > 0x6 || (c->x86 == 6 && c->x86_model >= 14)) )
-            flags->bm_control = 0;
+    if ( c->x86_vendor == X86_VENDOR_INTEL )
+        flags->bm_control = 0;
 }
 
 #define VENDOR_INTEL                   (1)
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 9a91807cfb..c4b3b687a2 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -777,13 +777,7 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
 
 #ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
-        switch ( c->x86 )
-        {
-        case 6:
-        case 15:
-            inited = intel_mcheck_init(c, bsp);
-            break;
-        }
+        inited = intel_mcheck_init(c, bsp);
         break;
 #endif
 
diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index c587e9140e..0ca6a2083f 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -218,8 +218,7 @@ static void __init print_mtrr_state(const char *level)
 			printk("%s  %u disabled\n", level, i);
 	}
 
-	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-	     boot_cpu_data.x86 >= 0xf) ||
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
 	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
 		uint64_t syscfg, tom2;
 
-- 
2.51.1


