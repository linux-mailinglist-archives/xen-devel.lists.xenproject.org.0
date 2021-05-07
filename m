Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A6437644A
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123985.234026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKl-0007b5-85; Fri, 07 May 2021 11:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123985.234026; Fri, 07 May 2021 11:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKl-0007W0-08; Fri, 07 May 2021 11:07:51 +0000
Received: by outflank-mailman (input) for mailman id 123985;
 Fri, 07 May 2021 11:07:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyKi-0004jI-Hm
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:07:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f10407cf-ab0f-401c-b5ea-c8dc30e6d001;
 Fri, 07 May 2021 11:07:38 +0000 (UTC)
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
X-Inumbo-ID: f10407cf-ab0f-401c-b5ea-c8dc30e6d001
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=mKFJUuT1DfiU2bFrYOWaYqhY+twLBUQuutnIPTuVTF8=;
  b=gA896gEShFtF+q+s89g8W2KVIweD4gnwxGXtrxY7Cc337S5Kg0xXMpe2
   cXB4sjryum2xdR47t8PPyX7bO9GHMGUsCFTbwx1FeTUYpgJL2h1rdyIUM
   Zc7oHTFs+14Evr5UaKkxz94d+ER6t3ixN1MiPqqWY/hddBOmpS3bvRnB6
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +TTd36LPnTQFDlpLfZqXMBapv77s17XPSisAPBhf6+6xlWWiuNzaL+ONepsOdr1r+OZNuPDDJu
 6Gy3dt6nC0YfB1suNUcszC/M1ivpnjySCnATvZFojt51VtC9tb/DU7PB4JYXCLik6bBHDVliup
 bZ73tVzXmKo4AiJVzyEHHzr/4ZcZF8b8WbKgEwKDI3JVx/TvotQWWEyxa9GNdp3KRIIOUm1VxV
 SO44ShcFPXerUHQrzKQRrvNkHRNKKSfnRjARnOn7LH07esNPx29Mh1KTdQbxg+zfPFmgWrmxsc
 0lA=
X-SBRS: 5.1
X-MesageID: 43678507
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bCNwlaHiIuwDMPU4pLqF2pHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdoZJhSo6H6BEDgewKWyXcR2+Us1NiZLW3bUQeTTb2KqLGSugEIeBeOvNK1t5
 0QFJSWYeeYZTcVsS+52njfLz9K+qjlzEncv5a6854bd3AJV0gP1WdEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue72K7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhSM0llWjoai+quGRiuerN/b8yfT97Q+cyDpAUb4RGoFqegpF5d1Hpmxa1O
 Uk6C1QRfibo0mhA11d5yGdljUImQxel0PK2BuWh2Durtf+Qy9/A81dhZhBeh+c8EY4uspguZ
 g7qV5xmqAneS8oph6NkOQglisa5XZcqkBS2NL7T0YvJLf2TYUh5bD30HklYavoLRiKmrzPSt
 Mecv00zMwmAW9yQUqpwVVS/A==
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43678507"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbe/vkyg2jmcItUftLykdM1mu/+Ahbj5MvpGPG7FvOeaD3+1S7afgN9+ZdNi4syTrDRMkZQ8S9kxZtZfgMRs8+88AVIoSmM9VfiyfFo689nO6TarcR1BUiMGbCCCR2TncBEazpcufuoUXja3M4vYKfuW17EItNbMcLNzyoO4l13EQa64Lu7SA8qeQTHrTS3MM9K39AKATToq3LGWw1NP7QEBh0TzIZL2RRa/4bPvCnTOP9FPnuJDVvQ0cgp2rMnbcjwwWX5ZH3lH041yNB6D4lnwGRS41aelZJRm44TpECJWfCiAi1jpFdrJOotC+N2pHlOepTbZhsen3LfDNc+a2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X77vzMLRLsKKyts6CxSqYJMt1Y+/JSMerGrc8DZVgSU=;
 b=Ju6vcmGOYHKi0GCwmIGAESRdtK+x4jXPkvNdoy1PJY7O8RZUJ27BSqN/RGkwGkTTKwJsq7gYMiL/3Li15rSiw+ycPzNq96tNzliO9MT1FsUjTwUNtGaYJNNzyX8YAWAd6tuOTKcc92MlJwRKqGRZV5SVf8FI9ndHbORXmY6K6E896zLh1GxMDCBT8c6724X55FC2onU2FDM34TTtTHP/T4wj5QMQloWiNoUwfUboVF2n9ODMlGsWOaajPtp1BxzyeoOdCvKK9HlTGli72S19LtfLPjm4ULq3dapnWLYFU94zbg9f4Sp6M6jr+jhzvNe6pXZVgP3z0UHu3hxiBghV2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X77vzMLRLsKKyts6CxSqYJMt1Y+/JSMerGrc8DZVgSU=;
 b=faYj9ZGzEXYOk+d93DhUiaUipsZlhii/+/LuuuKo39bbWDLGa69lkEj8KR4rn6WDE8/Ic+QK4JYH7ol8jXr1lQbMWPMFwd35bgOFE7rjsrfiojpooBn77TwZJCpe/PzrJ86j28CsS+hTAnPvpzPWDFRtxV854iD5jCwfkskxJcM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 09/10] libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
Date: Fri,  7 May 2021 13:04:21 +0200
Message-ID: <20210507110422.24608-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::23)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86790a1e-306c-4b22-25b6-08d91148511e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4683:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4683E53A55BBF6C7B65167358F579@DM6PR03MB4683.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:164;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPR+0u6OaEX0vcfP0V1K/sVKoPitJaP9+sd1YJIE2RDDwTNDp61l39qsviJZ7az3jc0rHVqoeACtEVFZY5PO396iYHmlkDmH8W2O9IUlHG8/NTM7Ss4Yi+FbvENN1jvTA0KLzepIL5PxceNaAk2W4wlyt7JF7tnn65q0tEPJAlcryR4WIngxx0aPboo1qsx4O03QAqyUGHdGjsesth3SxqkdyElY7yxCCwyCopvahb/CwdGFsdS0jAq+OHs+S+draeyCm9CVxiCF0ZFSbzEg84qekI+TphhURkpKTudcG2YwllcVKD1uxoztiZJLsXCoZYx3bFgnvQsao68y2Bbj77Pda9MjUonmHg+4r0ttml3371eBcxFKYe2vLjsRR7E2WmBtNF841bF56rqSREZg0CpNQlisoUbubD9UKRYqIzMhPniUI7saz8pYJEh2LoJ61Rd1ikVUgUNdtnfsdqBTZVCxTryYPlRZWA1AM2Z8V/5I95R8CTaubO/9jworKeUzyP33UH6VRA0hVxgqcrHsIZxByNxvWNt1gAnxq7fmL32D8xmQA0o97D4y4Ywy3Z8QaepMAadYZ95xtUp4mUVjfszpoN25hTD75C8ucKlrP6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(8936002)(478600001)(6666004)(956004)(2616005)(2906002)(6496006)(6486002)(26005)(1076003)(8676002)(16526019)(38100700002)(5660300002)(6916009)(316002)(66476007)(66556008)(83380400001)(66946007)(186003)(54906003)(107886003)(4326008)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S3U5TVNvaTZlbnFEZ1h6S1pWcGcwNmdUc1hYUGp0OEhSUmNSaHEyczdLczNz?=
 =?utf-8?B?MmVJMDRDTEk3enlxNHpkWnA0aURzKzJKZGRQaWNqckF0L1lpVGJPdzRRbk5D?=
 =?utf-8?B?am4xR2hKN3d6cnR3Wi9pOUlqb2FQSThSRFZQUTZwc3dVNFFxdVd2d2tDTS9s?=
 =?utf-8?B?SFNOdUZwQVRDY2g0UnFnV3NCdWhiMEhFb2FoWXoyUk5ZVmF1U0QycXNzQTE2?=
 =?utf-8?B?SSs1NUh2UGlzQU53WGMyZzhrdEI3Nkh1dG5sVjNpdTNpUzBNK3lFaU9PQlI1?=
 =?utf-8?B?TS9qM2NJVDFCU1ZZWEc5KzQ0VUxDNnE1T3gvUVVvUjd2YkJsMUpzTHJEZlZP?=
 =?utf-8?B?Mkk4UlhtQWJYb01RYk9KNkhNWGZFYXdCeDVCbEIySHJIZXVOZVdQOFJvZEFG?=
 =?utf-8?B?UkE0NlloYzhTbDFRa0lBUmVLd0RuNTFaa0VWWFg5b0sySzQ5Unp3bWR3VzJm?=
 =?utf-8?B?bGFMQitFOFg3ME0yVlI3ZzFiWmZsY1dRWFA2OURvYWR0V0wyNWRqWVoxc2dV?=
 =?utf-8?B?eWNvMUpvcHoxQ0ZlMDk5MHE5U3lhMzVaVjJMUjYzNDAyMkRONTYvMkRGaFd1?=
 =?utf-8?B?eU1qbmNIYXBqYlhycDR3OVdvQkgxWDBMYkhkc213am9rWnRRZktTc1NLckxS?=
 =?utf-8?B?NmxpbkJ6aDZjODNwUERuUDRtc2dkY0JLVUhPR1M5WW9ZNWFGOXQwck5md2RM?=
 =?utf-8?B?OENGbFFaR0ZiVE8vRWRRK0dnSXZoZDRBZXhHTC9xZGI3NUVKWjkwOFR4ZkQ0?=
 =?utf-8?B?V213V3VEQjNKQ0N0NTRYemRzWmhqZ1VCWkdqcjVZbVM3ZWN0eU9IQVViaGFp?=
 =?utf-8?B?Y25EY3FBNVROcGlZckRlMGNpMGZDOFR4Rm9uM2dWUWFDQWJ2TUkvV2tYTmNU?=
 =?utf-8?B?bFlhNDJ1M2R3dk13K0V1VlRJNDRuNm83MjIvQld6VEJyUGFmSENRWERMM1Jh?=
 =?utf-8?B?blRPc21XakVNUjhwZjlNOUhlRmFoNmd5b3ZIbngxUCswVHpPZ1lDUHEzU1o4?=
 =?utf-8?B?YzFXNlJsQ0h1L3FGQlZRU2VMd2U0UHZ6YzI4K2ZTMnNQdjBybXFOVkZhNXBY?=
 =?utf-8?B?YUQ2OFUxOTZUR0l4WHFIVVM4SnlUZnFBOGpzVk56VDVsY1ZMSDZ0S2tjZS84?=
 =?utf-8?B?SXF4UXNaSFB5T3o0REY4NktpeGhPNlQ5VVB4SU1Mall6bG92VEdKWVZ1NlJI?=
 =?utf-8?B?RFFKRXEwb09KbXF0NStqWXVFQWpMZ3lreE9Wcm9GRFUybXVmQzRVU3hHSUYv?=
 =?utf-8?B?Ym1EQ1JueVh1TUVVVnFZdTNyNnJKZWtUbGUyWXJYNTJMZEVHcXpCNlM1UTdM?=
 =?utf-8?B?VGVoWGxtTzVYNXhhS1hUS1lhbWM1YmpVeEM4aC9hMVlxTkJ0THQ2RnM5cFZa?=
 =?utf-8?B?bmtFU3RxTzhGNXRsMjJ2dUoyRDNtRTFvL0wwQjFyNjhwc1QzclJZWS8rcG1u?=
 =?utf-8?B?SUlUY1ZNMytMd1E0SEM5b09PdFIvM2s4bGhXQm5JTTd5dkNLZzRZZHkwMFdl?=
 =?utf-8?B?eGRUdTVCNEpTQ0NGM0dnZkgyU1ducFpwODl0M1VyMTh1cUZxWG1oZER4MGtv?=
 =?utf-8?B?ZWtLUHRTcloreERnTlErbjVBa0p6OFY2bXlXQS92ZDV4ZFoxMDU2NWtzWTc5?=
 =?utf-8?B?azFnb2xvT3pHaVk2UitiWlNnaFF5U2lkeEluaXR6ZERoL09RVFl5R1dYclpI?=
 =?utf-8?B?Y1lxTGJFbXBsQmtqZlR5VkczY1ZFeW9RZWhvSzdodWtlYy80MFZMcmpodGEy?=
 =?utf-8?Q?Pev5Gu3aLbABI6Rf3Db+M20/6DGOvuMF7uiszB+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86790a1e-306c-4b22-25b6-08d91148511e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:07:34.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtzKYhA3tJ5qutpjS5y3jGVM69KnKLBsdP8cEznMLkoSIdg+mnExlAyZ9MLlnMR8cQ9GX0uOTl/QqRoGzrFgtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4683
X-OriginatorOrg: citrix.com

With the addition of the xc_cpu_policy_* now libxl can have better
control over the cpu policy, this allows removing the
xc_cpuid_apply_policy function and instead coding the required bits by
libxl in libxl__cpuid_legacy directly.

Remove xc_cpuid_apply_policy.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Use 'r' for libxc return values.
 - Fix comment about making a cpu policy compatible.
 - Use LOG*D macros.
---
 tools/include/xenctrl.h         |  18 -----
 tools/libs/guest/xg_cpuid_x86.c | 122 --------------------------------
 tools/libs/light/libxl_cpuid.c  |  94 ++++++++++++++++++++++--
 3 files changed, 87 insertions(+), 147 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index e894c5c392d..17fa3734800 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1890,24 +1890,6 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
-/*
- * Make adjustments to the CPUID settings for a domain.
- *
- * This path is used in two cases.  First, for fresh boots of the domain, and
- * secondly for migrate-in/restore of pre-4.14 guests (where CPUID data was
- * missing from the stream).  The @restore parameter distinguishes these
- * cases, and the generated policy must be compatible with a 4.13.
- *
- * Either pass a full new @featureset (and @nr_features), or adjust individual
- * features (@pae, @itsc, @nested_virt).
- *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
- */
-int xc_cpuid_apply_policy(xc_interface *xch,
-                          uint32_t domid, bool restore,
-                          const uint32_t *featureset,
-                          unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 778bc2130ea..8c62c3ac360 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -388,128 +388,6 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
-int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
-                          const uint32_t *featureset, unsigned int nr_features,
-                          bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *cpuid)
-{
-    int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpuid_policy *p = NULL;
-    struct xc_cpu_policy policy = { };
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto out;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL )
-        goto out;
-
-    /* Get the domain's default policy. */
-    nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
-        goto out;
-    }
-
-    if ( restore )
-    {
-        policy.cpuid = *p;
-        xc_cpu_policy_make_compat_4_12(xch, &policy, di.hvm);
-        *p = policy.cpuid;
-    }
-
-    if ( featureset )
-    {
-        policy.cpuid = *p;
-        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
-                                            nr_features);
-        if ( rc )
-        {
-            ERROR("Failed to apply featureset to policy");
-            goto out;
-        }
-        *p = policy.cpuid;
-    }
-    else
-    {
-        p->extd.itsc = itsc;
-
-        if ( di.hvm )
-        {
-            p->basic.pae = pae;
-            p->basic.vmx = nested_virt;
-            p->extd.svm = nested_virt;
-        }
-    }
-
-    policy.cpuid = *p;
-    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
-    if ( rc )
-        goto out;
-    *p = policy.cpuid;
-
-    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
-    if ( rc )
-        goto out;
-
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
-    if ( rc )
-    {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
-    }
-
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto out;
-    }
-
-    rc = 0;
-
-out:
-    free(p);
-    free(leaves);
-
-    return rc;
-}
-
 xc_cpu_policy_t *xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index eb6feaa96d1..6d17e89191f 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -430,9 +430,11 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
     GC_INIT(ctx);
+    xc_cpu_policy_t *policy = NULL;
+    bool hvm = info->type == LIBXL_DOMAIN_TYPE_HVM;
     bool pae = true;
     bool itsc;
-    int r;
+    int r, rc = 0;
 
     /*
      * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
@@ -443,6 +445,41 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     bool nested_virt = info->nested_hvm.val > 0;
 
+    policy = xc_cpu_policy_init();
+    if (!policy) {
+        LOGED(ERROR, domid, "Failed to init CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to fetch domain CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    if (restore) {
+        /*
+         * Make sure the policy is compatible with pre Xen 4.13. Note that
+         * newer Xen versions will pass policy data on the restore stream, so
+         * any adjustments done here will be superseded.
+         */
+        r = xc_cpu_policy_make_compat_4_12(ctx->xch, policy, hvm);
+        if (r) {
+            LOGED(ERROR, domid, "Failed to setup compatible CPU policy");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    r = xc_cpu_policy_legacy_topology(ctx->xch, policy, hvm);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to setup CPU policy topology");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
      * the xen-3.0-x86_32 and xen-3.0-x86_32p ABIs).  It is mandatory as Xen
@@ -453,8 +490,15 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      *
      * HVM guests get a top-level choice of whether PAE is available.
      */
-    if (info->type == LIBXL_DOMAIN_TYPE_HVM)
+    if (hvm)
         pae = libxl_defbool_val(info->u.hvm.pae);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("pae=%d", pae));
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to set PAE CPUID flag");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
 
     /*
      * Advertising Invariant TSC to a guest means that the TSC frequency won't
@@ -470,14 +514,50 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("invtsc=%d", itsc));
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to set Invariant TSC CPUID flag");
+        rc = ERROR_FAIL;
+        goto out;
+    }
 
-    r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid);
-    if (r)
-        LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
+    /* Set Nested virt CPUID bits for HVM. */
+    if (hvm) {
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("vmx=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOGD(ERROR, domid, "Failed to set VMX CPUID flag");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("svm=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOGD(ERROR, domid, "Failed to set SVM CPUID flag");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    /* Apply the bits from info->cpuid if any. */
+    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
+    if (r) {
+        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to set domain CPUID policy");
+        rc = ERROR_FAIL;
+    }
 
+ out:
+    xc_cpu_policy_destroy(policy);
     GC_FREE;
-    return r ? ERROR_FAIL : 0;
+    return rc;
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.31.1


