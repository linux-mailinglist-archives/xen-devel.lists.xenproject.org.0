Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189B345B7F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100548.191618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdp3-0006YC-Rl; Tue, 23 Mar 2021 09:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100548.191618; Tue, 23 Mar 2021 09:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdp3-0006Xj-Nn; Tue, 23 Mar 2021 09:59:37 +0000
Received: by outflank-mailman (input) for mailman id 100548;
 Tue, 23 Mar 2021 09:59:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdp2-0006Vg-Ck
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 09:59:36 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ab031c7-56d0-40b7-beaf-f6a45e2ad81a;
 Tue, 23 Mar 2021 09:59:34 +0000 (UTC)
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
X-Inumbo-ID: 8ab031c7-56d0-40b7-beaf-f6a45e2ad81a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=PijAI5WJCS5+jGvyOmq8HEdjQLOsv2uzbAMVwnz4R4I=;
  b=dE96m4hI+fgdyp5soDR/SODvILKj+/1QYzaY+MiW9L73HUlHa6qdzVgm
   ieD2lvZrZ2IwESOws//fVHIyzuhdFCklRb99gE4iyCUoeDbhimNHn/MbG
   /m36OGSt6cgevSnaXAjzLUWSm105zPO5u8GN81543mF8XPmhnUBLU2SoF
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ugGyEmGTlfRVXvU7KgMXiZsUkATpxf1Mf71f+f1Y9Wh3ALapg6EFF4qrRUluziSIuJankSqkBP
 u++H4XfNDT89ilDg5Xodb6pAHkbIx5gX+Enlt5iQrfQ7TQx9rbuB8amBbR0v2bJ7WvR1aRNVFd
 8I3JVDxxrnI/dmvpG6LMsyABTXufjR7NxYjU7R64f2AAbyBtCPlu3V/rf/EfQldpvBjx3uBpKM
 5jKTxAnejaGNRTI0I5MshCULWx8tlODci6CHFyEqyfj0rCK+3gjaePweUzLvfzuhM20k8AMCQJ
 cnk=
X-SBRS: 5.2
X-MesageID: 40261118
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wvcCTahyKw4yP/z1oeC+eX3h43BQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40261118"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUHFiOvalbjAJ1KRVujnpCGSDnBZx1m22DiTTQd9ad4t/rDrA+TkZIWu0QLPbJdpO91ANPbFXsSxk5fZTYZIkDOwxwk1HMhCMiQRk+kN8w/8fz8sV7ODckIVxyh225CXfHfhy7oa0wVQs2GigFuXwkvGLTpS/fSN/Svwsdq4Ith2ROEsee5K7dMENxQpEJQd82jcCMBPsfT/+OnTOWmvDmEWaFlLZAYJ9BgN3MZR4bXuAZ1wFWFqPspxxL3v3oFsWDRKsmvvWZ7H9T3Mnz5rBP4qyvD50RgJRaW2Cm7TCg+P/bWwgpvtm9jRX2AVRMmgEr3qCgjZCh9j1gxcT4aHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCYKj9xS+9yyRL8nU+5448nJ4c9TjD90m81OST2t//U=;
 b=TznS6BIuduPX0LyNwDULCZXItBI1PsB4mbubcohFIKVC2a6EJvMgi/StrESaEHizLk0GfoH9TsIBpspx9kelivCWeT+ymbhrtg+3GHmweKcSTcKvM9QuQQAjSzwN4a0dvcg7Ag//t2tSh1+aX+5Ur9U91GVvbEDfBtz0m/8jlm10locMeubOq+ggNYvksxRR7r/Rlox60izYslks9YJDH2QG+iwZ8lWEiLaotRMag2CrCI5ppw3GBHUlbSniZtqJBzguMirqVpxKHWbJtiWLHm9HPAvXZM/gwKxG1Tr1HYiprOazjfA3Suc6KrWuXsW4ntwzcEvDB8bPd9edao8yMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCYKj9xS+9yyRL8nU+5448nJ4c9TjD90m81OST2t//U=;
 b=sdpK6Sxa5RWxwmUcpmUL6/H+O7BEyrppgxhFoXeMjfc2enBlJ1whaBqEIq9hSldW2cenbaSO6G06GiqsXL8Lq8S322SH48bYOA2nbLjRHk55f91EFI/rBPRpOn0Og8z9+c6+pXm3ZKAyC0zQo+Nzf5kJyiU062mfSSoSAYSytE8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 01/21] libxl: don't ignore the return value from xc_cpuid_apply_policy
Date: Tue, 23 Mar 2021 10:58:29 +0100
Message-ID: <20210323095849.37858-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8566e7d-f617-4e26-e009-08d8ede25a99
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633182B0803EC8AE97C70A18F649@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Euvyp0dSa54nH95+HqYgiwNPuJMGbrFJLCG7pl/O2XAVKLqFEQH2LbiTF8joHYXiarrIKFFpkPEuWPjxKBEhCdXF6fnH2QVhXYsWqUAadTTH0A5wnS48kRlqwup//fUDu19kCnywo8sOARwLhPKGiaSIFQPivK0l7XNWUZAwmf6FcJQU05vbQYLfi41m6zkalLSyAdet9thD4TWPi4zlzQsbs/CjhvJynb8cZEe/pk/M4AEetUwvP/vaFLSm5W2G4MpTJNwveWGpPbev08hP6DgeZN8lc4Ogg6rt5YR4aO0wMoZTiBsj59JSAODcrco1pZ6oixyoo2Y9B+K5jwOMXVggI4f9e9Jmrau5RLUaLB6rwrlhbL51ccu6tQSSNGNKyzwkHtDLX7j/PnpxnEJiIIf2VlWlu/BEPNzetja+QOXn9hT67k+vhgEAMgIboL2KykLwiv8pVp9u7CVMokH8Gbh30ParHdn6J+ftsyBJUFqbjvAFHlPLgTKyWnMmTe1hDKRkBRqWHetHi7oiNaHEAn5LpudbpBbk/p7fY9fb/6esJUle4UoRX2izYam9akHmmr9FUK0UQPDZKrnN9YQ9b29FhTuDQiIyegQ3fgPTULMMw+VuedBC84O9c+sw1r9+4EWV5O0UAgdygdvcRDYeoeNLl3bjvlJ1NGVSs6uIX0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6486002)(6916009)(36756003)(6496006)(2906002)(8676002)(66476007)(5660300002)(186003)(66556008)(66946007)(8936002)(86362001)(4326008)(54906003)(83380400001)(1076003)(16526019)(316002)(2616005)(107886003)(38100700001)(956004)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bkQrWXJ5RWZNTzZqbnkvblY1NEdiejE1ckN6ZUhNWDJ5NytYY3ptMU9SS2pV?=
 =?utf-8?B?dlRJekt4ZVZaOUY0dnBnNFNDeTZaL2c0UDVkTG1BUHJ2dS9KbFdnZDVXNS8y?=
 =?utf-8?B?cjNjMFhwc2ZKanVCQS9nK0liNnY3cU14V3NycU4xZUR2d1l1ZWZnN2pyQmdO?=
 =?utf-8?B?OEZGc2o0Um9zRDRIVHV5cDYvUXBYQUNvRDdPOEtpTWxhbUxWUVlvTzQydXBa?=
 =?utf-8?B?a1JiZ1JDdGpYT2lOQTBnUFVnd3ZLZ2gwZ0JRMVV4YzBhRXgyUi9Hb2pzV3BZ?=
 =?utf-8?B?RGhlNGR6YzM4NWFrellTcnZ6L3hMUE12TjN4Z3NpckNBNjM5VjBhbnY5Y1hU?=
 =?utf-8?B?L21VaGJhV2NaTXpiOGhNUlg2RFJKdlJ5SmZ6VFBFUUxJOVZFWHM1OW8xSzFU?=
 =?utf-8?B?bEFrQzJrTWVmblVZVlRBSFNoZWxwb3hSREViUHFQSW9XQkhCK1g5SS9QMDNN?=
 =?utf-8?B?MFZuVkpqM3VvTDNhVCt2amN2YVMra1RHSmUzYkx2Qk5KaHowMkgza0FiUWt6?=
 =?utf-8?B?a2RwUFNDTnBnY0ZIeUZGak9GdFIxUTBUeG53cEtNQkUxSmdTR2c5NENtNTB6?=
 =?utf-8?B?eFlzS0FkeHVYeisvL3FtblB0dDkvS1VXbVVxUlpkeGtQRVo2YnVnMURmc0Ny?=
 =?utf-8?B?NGlRejEyK0ticmZyNkZwUEw1NnBJeTVmTEs3RnM2OS9IUXlZaHN3SitnYWpJ?=
 =?utf-8?B?bFgyZmR2V1hVQTRsdWdTdERBaGM4b3JBK09jdWF6Q2J6SmZ1Z3FERllwd3N6?=
 =?utf-8?B?b1QxNVd6WGNGOGFuUFYrZERqTGQ1WmF1TTJtUmJWMnlybWdkc1psdndpcHlY?=
 =?utf-8?B?YWlUSTR2NFEyRW8xZlRzc0w5TmNmcmkzTmk2N09pWVE1bjE5cElXQ2hpSTY5?=
 =?utf-8?B?amNpejFXSHdLNFlTcTFuOHd6eHdOM0NqZElNZGlkYkV0Z2w0UXkrdnVwbkxJ?=
 =?utf-8?B?UTFCYzEyREhVUVYrekUvdUJGVDFha0MwbEJubklpNCtqdUdUK3VXUmEyNlla?=
 =?utf-8?B?S2VxUW1rZTFQOEJad01wNVE1Ly96SE5QOEN1VUgwOFIveVBMUk1nbXZpdGhs?=
 =?utf-8?B?elRqdzkrbnFWVVR6dXZjT1hEV1VWS2ZWNDV1bkZvT2dLTlEyYkxHbnJWcDlu?=
 =?utf-8?B?RXFtV1Mwb1YxVFFyazJaanNkaHZmOXY3d0Rsa3BBcWpuN3lYQ0dVOUo1ZFJO?=
 =?utf-8?B?K3M3VFFGcS9sUTRaOVlRdE4rNmM1T3J0YTJzVVZJMXQ2a0NjbWNTT3JtTUFD?=
 =?utf-8?B?dHFTVFJBOVRzTFF3bHJwRitsSUxoVnBkaGVqMmZDTGVsVUY1QW5lbC9lWEk3?=
 =?utf-8?B?ampySHBZNStHbGVCTkQwYWRBUGlCTHVMTnBNSXVROFU1QjJJZ044SnRPY1ZB?=
 =?utf-8?B?QjhGcTVQSjBMZG5yWlB2bGM5Z0Y2dlMzT0ViWUlaa0Q3bEYzQ0xOcXZndlo4?=
 =?utf-8?B?NHpQTTRySXF4RlNUTTUwYlo2ZWR0V0pWblU4dTNsYlBEWVVZT1hGN0tKYmlZ?=
 =?utf-8?B?d0JkYld6NDVEOUNNK0kwRXA5T1k4NC9oWitrVFhoSDRsRkxnZVNadVVNbUlM?=
 =?utf-8?B?M1ErbDZ3aGpIcXZLZG1ZMUVnNDdLRGZrL0hOdm5JUlNHSW5RVjRZbWpVeWtk?=
 =?utf-8?B?ZkZvVEtVNHFERkxFMEtzQWNyb2h6MTkvbi9uTVFWVXM4alAzbFEyMVRFbi84?=
 =?utf-8?B?RjZYK29XQjJCVlFpem5KRGEveGdpUk5JelB0R1c4ZVZpd0VJcEMxbUh1c0U5?=
 =?utf-8?Q?vygnJRu00xybhGc+ex+MNbJK9IPhF5ZrNQi31ek?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8566e7d-f617-4e26-e009-08d8ede25a99
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 09:59:31.3461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31M2cxtKkcMMBQwSRy1Z0j4Je1T0gzth5uwK/LT37pkvCrRU6YPwUsrXWePjqmYRAIu/otOX/tqsC5TQ0WD3bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

Also change libxl__cpuid_legacy to propagate the error from
xc_cpuid_apply_policy into callers.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_cpuid.c    | 15 +++++++++++----
 tools/libs/light/libxl_create.c   |  5 +++--
 tools/libs/light/libxl_dom.c      |  2 +-
 tools/libs/light/libxl_internal.h |  4 ++--
 tools/libs/light/libxl_nocpuid.c  |  5 +++--
 5 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 289c59c7420..a7b33bbcd06 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -419,11 +419,13 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
-void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
-                         libxl_domain_build_info *info)
+int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
+                        libxl_domain_build_info *info)
 {
+    GC_INIT(ctx);
     bool pae = true;
     bool itsc;
+    int rc;
 
     /*
      * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
@@ -462,8 +464,13 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
-    xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                          pae, itsc, nested_virt, info->cpuid);
+    rc = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
+                               pae, itsc, nested_virt, info->cpuid);
+    if (rc)
+        LOGE(ERROR, "Failed to apply CPUID policy");
+
+    GC_FREE;
+    return rc;
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 1131b2a733e..3b7474979de 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1443,6 +1443,7 @@ int libxl__srm_callout_callback_static_data_done(unsigned int missing,
 
     libxl_domain_config *d_config = dcs->guest_config;
     libxl_domain_build_info *info = &d_config->b_info;
+    int rc = 0;
 
     /*
      * CPUID/MSR information is not present in pre Xen-4.14 streams.
@@ -1452,9 +1453,9 @@ int libxl__srm_callout_callback_static_data_done(unsigned int missing,
      * stream doesn't contain any CPUID data.
      */
     if (missing & XGR_SDD_MISSING_CPUID)
-        libxl__cpuid_legacy(ctx, dcs->guest_domid, true, info);
+        rc = libxl__cpuid_legacy(ctx, dcs->guest_domid, true, info);
 
-    return 0;
+    return rc;
 }
 
 void libxl__srm_callout_callback_restore_results(xen_pfn_t store_mfn,
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 842a51c86cb..e9f58ee4b2b 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -384,7 +384,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
      * being migrated-in/restored have CPUID handled during the
      * static_data_done() callback. */
     if (!state->restore)
-        libxl__cpuid_legacy(ctx, domid, false, info);
+        rc = libxl__cpuid_legacy(ctx, domid, false, info);
 
     return rc;
 }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 028bc013d9c..22b1775b752 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2052,8 +2052,8 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
-_hidden void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
-                                 libxl_domain_build_info *info);
+_hidden int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
+                                libxl_domain_build_info *info);
 
 /* Calls poll() again - useful to check whether a signaled condition
  * is still true.  Cannot fail.  Returns currently-true revents. */
diff --git a/tools/libs/light/libxl_nocpuid.c b/tools/libs/light/libxl_nocpuid.c
index f47336565b9..0630959e760 100644
--- a/tools/libs/light/libxl_nocpuid.c
+++ b/tools/libs/light/libxl_nocpuid.c
@@ -34,9 +34,10 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
-void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
-                         libxl_domain_build_info *info)
+int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
+                        libxl_domain_build_info *info)
 {
+    return 0;
 }
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-- 
2.30.1


