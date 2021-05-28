Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD85394696
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 19:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134043.249635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgSt-0002Bk-2B; Fri, 28 May 2021 17:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134043.249635; Fri, 28 May 2021 17:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgSs-00027V-TT; Fri, 28 May 2021 17:40:06 +0000
Received: by outflank-mailman (input) for mailman id 134043;
 Fri, 28 May 2021 17:40:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WKFi=KX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmgSr-0001si-9c
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 17:40:05 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76e5c0c5-a728-4b27-b30c-372172b9795a;
 Fri, 28 May 2021 17:40:03 +0000 (UTC)
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
X-Inumbo-ID: 76e5c0c5-a728-4b27-b30c-372172b9795a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622223603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=9nedISlwrSegLGQxOvVojP0HNEh86KYexV0VnKl/dG8=;
  b=FUJX7JZdG9gd2p1alHgC9aB55BfKKsmdyp3vd4zuIIYJHeLVSf0iiE71
   VRThPvCbf/FGle+eL9s7LA55w0RLAQsCVxV/fsBjwwjrGRIDC8eV9/y0H
   dmIm4rYKTVTyYQO+O4Z/+6mu1Gp1ZIRVXEX6F5D3xgn5pudNzrKYYvMct
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +A6iCFZLI6rXnxmFGJOfd3k8JDSXNOVdeDCEXUdwGYwtgSr6OVJ63IB2y9kTZzLm4sktvEoB42
 AbzRV5Wc9bFpVbi/Q9T+s4DlEqC0mcDTy6jhBpnGQ0T1bM4Q0e2vdatMiTT+rPKxE26UF60mVd
 2eaMqOolIxZvLy2rBemlUZi2tyn9PN7LDBWozyj96Ama/jA2FG7MYl+V+02YjAHaVU1fMxqOHP
 clbf0fQ2bDuPSxRQvsQUZYt+qgwCsWjnwq3VT/PMDZ5kYqWAkgKmrOXlc3eB+YxUW95piKyeSH
 mIM=
X-SBRS: 5.1
X-MesageID: 45249119
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fffGramE+8v+XlF6bWGj5YTKDX3pDfMTimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPlICO4qTMiftWjdyReVxeRZjLcKrAeQYhEWmtQtsJ
 uINpIOcuEYbmIK/voSgjPIa+rIqePvmMvD6Ja8vhUdOD2CKZsQkjuRYjzrYnGeLzM2Y6bReq
 Dsgvau8FGbCAUqh4mAdzc4t6+pnayDqHqICiR2RiIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijm+vT8G6f60bjq7Bt3PfxwNpKA8KBzuIPLC/3twqubIN9H5WfoTEOpv214lpCqq
 iOn/4ZBbU215rtRBDznfO0sDOQlgrGqkWSiWNwuEGT5PAQH1kBepN8beszSGqq16Ii1OsMnZ
 6jkVjp76a+oHv77WzADuPzJmZXf3yP0DAfeN4o/ghiuLQlGclsRPQkjTho+bc7bW7HAdMcYa
 ZT5P+13occTbrMVQGmgoAo+q32YkgO
X-IronPort-AV: E=Sophos;i="5.83,230,1616472000"; 
   d="scan'208";a="45249119"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eq0HHQa16ty6I6Sw1KK7gCgNcq4GyIBfkIH7izqrshKu4ASDTD2YlZsrIVPQ6vT1JwdiltXscFW4EoD8B/lBcRhZC+fntCxwHMhmVpqazSNPUTvle66bfoGZFf+PBrSJxV2RsyTR0SNRJ3BaXCIYhjWb9/PLXvgcT9ZS6ahqe0a70/FIo+/aE17uAuamKvqLcsGowbBFdv6y9P+e3DD+9ZHoHTOGY0wZhN98/2K8ZMcHRV4v2wOjPGvS6NtbBdzbHbNxLEoD7HdvZU7IfFjwNP3nMIBkXUKkNZdyjrbVwPNU56/EdFhj8J8Q04uCAIlGCyxcS1W4xO+pMFQN2AW5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtL+Hp/29nuKWkROvVXgdUUpYBKLh+7LK1UvsLfBAnw=;
 b=Ivw8QTXbgd70tuzaa37WLHViUjyfKa6m0Xvdj+Jn427ltUk5cE22rSFbv/khbz0jPgmfZoYPeNfqqzG9HdfeWQ8UXa6CwHGBoBWBeFhUVczmQ/4B6Sx1LCuYdLBHq7JqOstLcA7UXZ+I8mYV0/mQbolTzlR3VXwe7FHa28NUTd9jmfOg9S9HVnmPaojkoARXxz/sHPXcrQOso2ncD31RqhlBgzVB09CsBVgvyAdzImR+zr7iU18avUfKKHpb2WEDuYSfj7szvdolubW7O0d2d4SPDp/wXXVyLGz9M3HlswKtaov04c94q36sXuMFcOYfqfv1gDKRE5UZjtb1vtnDkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtL+Hp/29nuKWkROvVXgdUUpYBKLh+7LK1UvsLfBAnw=;
 b=UJFZGiApEH1vy8jgKaaJZ+4rdKdmjxOjojLnKlEZMMTN8In71yspd7/+zwVhtLdfcZ2azEu+czUq0guRWd/JGC8CdmzQhX6y0/3mzhpf0Ap2oCs/WbuxCTGt8OGTxxxZir6bPFORz5sA222biacpCqU0FzmcE38H+i0VMVn2Pas=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 3/3] x86/ept: force WB cache attributes for grant and foreign maps
Date: Fri, 28 May 2021 19:39:35 +0200
Message-ID: <20210528173935.29919-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528173935.29919-1-roger.pau@citrix.com>
References: <20210528173935.29919-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4af593d-a375-4a60-cea1-08d921ff9e03
X-MS-TrafficTypeDiagnostic: DM4PR03MB5966:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5966DBCFCA649CB96378924C8F229@DM4PR03MB5966.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0W4ypPRZ+w1jF86gzWKgk6EEFkt5587z3m8IXeFrfv8/pObMpkKfSYnhHc18hM41sAR2pryeQIS1CANCWoLHA7YogZrsGSrjTkw4PSmV2SgPKWvIlu7y44VObq+KXhnLWXFZ/dQIZb6OTHFJhXO17amqd4UzEtdv7PK2FLZzql6RAi7CJGZ0DmJBdbIM5/+HUAOFzWhKLnahWQO22Iub2MCAmtumZbKCABkiv5mxA05+D/uBVTodYCH82b6yGbEm7WLncmQVdXdAz3FS0Evq36Uh5zRDTFvPP0s3Biu/DXjeW52svAQGADP+0LJ0exGO1cl6IaEpBVRzNbCTdHqWJfA2+LO/clUGYAjrNGJYOpfJZDPF0cSE+4mHqbPuh/UDEupfMN8Yp9RedM0k+VcrcE/bdL6Fchr1hx3ej/map4c8v1N63xG9jxuntinHbzPCTwbLH9L8uZKrWrcTxwDmc5UOeica35LaA7gVcSBqPB5yZ7Ei+K6pfG9EU4zP5kHr3bHVUyiLgVEt3IFC3j2a3P+EfG0vfKy4dTWPCfaqQv54yeTPBomMk1zBHapTE58o+w3984i0uVi7qFAnCXePFfRYm7bkHy0DV0tFjibsuK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(6666004)(107886003)(36756003)(2906002)(26005)(2616005)(66476007)(316002)(66556008)(186003)(66946007)(16526019)(54906003)(956004)(4326008)(38100700002)(6486002)(8676002)(83380400001)(478600001)(8936002)(6496006)(86362001)(6916009)(1076003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVMxQnZYM3lmKyt4UmhVN0xBSnA2LzFvc3lUUlRIdnpBdE5mcHBTbmVHbHcw?=
 =?utf-8?B?VlhUWlRjbUk3OEdoWGhGVDRwTVU5aWZTOGZSWmY2TXhDL1NDVFVRZkNocmpQ?=
 =?utf-8?B?Qkl3eUlybm1La0lQdTBsOXVNaXNnSDBxemNRY25jUHhGVTNuU0JSY0pualpM?=
 =?utf-8?B?cGFJMmQ3MXcrT0pkV1ZPK2Yvbkt6VEd4MU16R2Z3THIxVllXdXBSV2ZkWlVl?=
 =?utf-8?B?a09aQ2UrL3pEeEpaNUVZUDZZaGNxVHh1U1V1aW1sWC96RmN6akJQZmthOWor?=
 =?utf-8?B?R05lTUFzQnRMUlRKdW1ydzFFOWpqZnIzNzYybnh5REt2SktyblpJaFZwQlQ1?=
 =?utf-8?B?MHE5NFZMNzJTQm1YVTB4SHJ6YzBEQ3M4VXNPbitRRGp3TlNnNTlTVndkQzdk?=
 =?utf-8?B?STU4bHhqQlpCWWpENE4vMzBteXI0RUFqU2xuRTNNdVU3UzRSSmtMWHg1L3NJ?=
 =?utf-8?B?UkVQTjh5cVAzZDgvMU4yNXUwcEk4Q1BaUGFCd2VocWVjT0h5RFRBRHAyd1VZ?=
 =?utf-8?B?REFvc2R0L09ERm5uNUh4R2tQNDFQd3RVa1VSMmUxTkhhTkQvQm5KYmMrK2Iv?=
 =?utf-8?B?bTlQQ0xRT3JmQ0ZBTjNFTENWUmxBSDdCOGRqTEhNNUUrQnNDcTc2VTJaWXpI?=
 =?utf-8?B?R2d0THExL2x3R0hnbUlKc0w1em5ReEs5VHJyZjRXSUh3L2NYTE5LWW5TV1VN?=
 =?utf-8?B?bWNUWkIzUEp1ZkFxV2FzUFFOQTZjUWZBcHhMQjJ6QWVkT05CbHN1NzVOTlg5?=
 =?utf-8?B?SEpseVJpaGsvdXl6dzlMbGFVOURQTnQzTVBGZi9obzBKWjVYU09EbEk2bkF0?=
 =?utf-8?B?VjJCSXhWVlgxNlZNS0Mvc2xQclJjd2Y1RXlPSnZLMFJNeFQ2U2JpbExzd0kz?=
 =?utf-8?B?THExeDRHR0xoTzMrbjNldFZtM2lhNnRjSVQ0K1FweTg1THRzMVhmYXgyakVr?=
 =?utf-8?B?Q0ZWTXFId0JkaTBRQlN2My96UlZlVkRtNFlobjliVGNLaUoxeVlBOEpFdXZ4?=
 =?utf-8?B?dGVMV1Vmcm1lbTYxajlSU0dxM0pYR2tDMmxiMXlQajZmVTRkMTM5dE4wK3hN?=
 =?utf-8?B?OUYxb0xEK2c0M05iOGEvcTUyYXlyajNueTl5cGs2ZEVCQVlSaVF0d2t4Tkli?=
 =?utf-8?B?cnU4TVJQKy8zMUhzSHhCWmVYYTBZOEhsU1FacXJNSC81VUVjelhqZkkwM1VU?=
 =?utf-8?B?UjlDNXFHZWJMaEZkNUZqQWQ0MTZtL0x5aFBFRFhteVI4ZHB0cVIweEc2N3NR?=
 =?utf-8?B?V2RhYzNKTXpySWxmbkpXWnlIc1RhRkE5Wm04YWlwSTlsaHRBdC80ZDlYSUNt?=
 =?utf-8?B?OTEvRmxiMW9sZ1g1am5Gdkdnb2w0VnAwSTNUUUJiUno3ZFd2dzA1Wmx0Nmg4?=
 =?utf-8?B?eGJPeDFDb014R3gyNHFvVWZZamZhdDBTalpvS3lRdThwRzlhNU13blNiS3FU?=
 =?utf-8?B?bk92YVYwMXJ6NytQK2lzSmFRZ2pOZW14aWU0YUZCNTBYRHRDRlR0RzBCTjZV?=
 =?utf-8?B?SnNNc0cvV3N0SVhVUEhGMGVCYW5GWGpNTisrbFpjWWY0RTBxenpreEkzb2d6?=
 =?utf-8?B?SjNaZ0ZKWW5KRGlYQkxZZTVpMXdSWHlGREI0OTViRzh1WTFuSTNRVjdVRDV5?=
 =?utf-8?B?ZFNMK2puOTB5elc3RzNKSWN1VUFmUnhHYlQ1MXFuOWJacG1LQ3ZYaFFTZHBD?=
 =?utf-8?B?RUpjZEF3cGRxMmpMeEFXWnlpME5tRW5VU21UNk1yb2Nqc3I5V01pS2pjU0xQ?=
 =?utf-8?Q?Rf9k7Hxs1otxM2PBqjylduMC5ldK23bpPoYvn4e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4af593d-a375-4a60-cea1-08d921ff9e03
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:40:00.3203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdcYqbP2mgA9Fh5hUhfZm4Tx+YmL8FNLGFav7GYHvq1HX0EN9wCvr99EbgxiEdgDEz3eAMm6Zh/ETzQEM0XNrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5966
X-OriginatorOrg: citrix.com

Force WB type for grants and foreign pages. Those are usually mapped
over unpopulated physical ranges in the p2m, and those ranges would
usually be UC in the MTRR state, which is unlikely to be the correct
cache attribute. It's also cumbersome (or even impossible) for the
guest to be setting the MTRR type for all those mappings as WB, as
MTRR ranges are finite.

Note that on AMD we cannot force a cache attribute because of the lack
of ignore PAT equivalent, so the behavior here slightly diverges
between AMD and Intel (or EPT vs NPT/shadow).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c        |  2 +-
 xen/arch/x86/mm/p2m-ept.c         | 35 ++++++++++++++++++++++++++-----
 xen/include/asm-x86/hvm/vmx/vmx.h |  2 +-
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0d4b47681b..e09b7e3af9 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -423,7 +423,7 @@ static void domain_creation_finished(struct domain *d)
         return;
 
     ASSERT(epte_get_entry_emt(d, gfn, apic_access_mfn, 0, &ipat,
-                              true) == MTRR_TYPE_WRBACK);
+                              p2m_mmio_direct) == MTRR_TYPE_WRBACK);
     ASSERT(ipat);
 
     if ( set_mmio_p2m_entry(d, gfn, apic_access_mfn, PAGE_ORDER_4K) )
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index f1d1d07e92..59c0325473 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -487,11 +487,12 @@ static int ept_invalidate_emt_range(struct p2m_domain *p2m,
 }
 
 int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
-                       unsigned int order, bool *ipat, bool direct_mmio)
+                       unsigned int order, bool *ipat, p2m_type_t type)
 {
     int gmtrr_mtype, hmtrr_mtype;
     struct vcpu *v = current;
     unsigned long i;
+    bool direct_mmio = type == p2m_mmio_direct;
 
     *ipat = false;
 
@@ -535,9 +536,33 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
         }
     }
 
-    if ( direct_mmio )
+    switch ( type )
+    {
+    case p2m_mmio_direct:
         return MTRR_TYPE_UNCACHABLE;
 
+    case p2m_grant_map_ro:
+    case p2m_grant_map_rw:
+    case p2m_map_foreign:
+        /*
+         * Force WB type for grants and foreign pages. Those are usually mapped
+         * over unpopulated physical ranges in the p2m, and those would usually
+         * be UC in the MTRR state, which is unlikely to be the correct cache
+         * attribute. It's also cumbersome (or even impossible) for the guest
+         * to be setting the MTRR type for all those mappings as WB, as MTRR
+         * ranges are finite.
+         *
+         * Note that on AMD we cannot force a cache attribute because of the
+         * lack of ignore PAT equivalent, so the behavior here slightly
+         * diverges. See p2m_type_to_flags for the AMD attributes.
+         */
+        *ipat = true;
+        return MTRR_TYPE_WRBACK;
+
+    default:
+        break;
+    }
+
     gmtrr_mtype = hvm_get_mem_pinned_cacheattr(d, gfn, order);
     if ( gmtrr_mtype >= 0 )
     {
@@ -640,7 +665,7 @@ static int resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
                         continue;
                     e.emt = epte_get_entry_emt(p2m->domain, _gfn(gfn + i),
                                                _mfn(e.mfn), 0, &ipat,
-                                               e.sa_p2mt == p2m_mmio_direct);
+                                               e.sa_p2mt);
                     e.ipat = ipat;
 
                     nt = p2m_recalc_type(e.recalc, e.sa_p2mt, p2m, gfn + i);
@@ -659,7 +684,7 @@ static int resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
                 int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn),
                                              _mfn(e.mfn),
                                              level * EPT_TABLE_ORDER, &ipat,
-                                             e.sa_p2mt == p2m_mmio_direct);
+                                             e.sa_p2mt);
                 bool_t recalc = e.recalc;
 
                 if ( recalc && p2m_is_changeable(e.sa_p2mt) )
@@ -895,7 +920,7 @@ ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
         bool ipat;
         int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn), mfn,
                                      i * EPT_TABLE_ORDER, &ipat,
-                                     p2mt == p2m_mmio_direct);
+                                     p2mt);
 
         if ( emt >= 0 )
             new_entry.emt = emt;
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index f668ee1f09..0deb507490 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -600,7 +600,7 @@ void ept_p2m_uninit(struct p2m_domain *p2m);
 void ept_walk_table(struct domain *d, unsigned long gfn);
 bool_t ept_handle_misconfig(uint64_t gpa);
 int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
-                       unsigned int order, bool *ipat, bool direct_mmio);
+                       unsigned int order, bool *ipat, p2m_type_t type);
 void setup_ept_dump(void);
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
 /* Locate an alternate p2m by its EPTP */
-- 
2.31.1


