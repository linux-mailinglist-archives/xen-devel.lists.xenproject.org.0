Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B3345B83
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100551.191642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpP-0006hf-IS; Tue, 23 Mar 2021 09:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100551.191642; Tue, 23 Mar 2021 09:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpP-0006hF-BC; Tue, 23 Mar 2021 09:59:59 +0000
Received: by outflank-mailman (input) for mailman id 100551;
 Tue, 23 Mar 2021 09:59:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdpM-0006c2-U1
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 09:59:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f4fea88-8a60-46fc-ac7d-1b6ba6b0cbd6;
 Tue, 23 Mar 2021 09:59:51 +0000 (UTC)
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
X-Inumbo-ID: 7f4fea88-8a60-46fc-ac7d-1b6ba6b0cbd6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=4ldnVDCZNMkxZxjsBX20L+XDZ7xhEL53HLTGBDuMf1k=;
  b=f5jEFTNI+SXMXovAZBuNbmLf/YsS5UcGeKb/jKshBjihlzy8VX7/+T83
   GNQxY+xBmqOcQ1WPryn+b/pbNdePHyh8xm5TFPiE8QBY6jD0Qil4PedXZ
   uVY1PZf7KhghYOlYz2mnvc6+VTVg/xuoYY22zhbadSqDFrx1cjlsUOEye
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aAoWUNYFj3lvfJBt0RGzZMLlCo+oHqM3AZczFG+Rp+nxn9QmGqugJFNoHO5bD9OvG/nQXNml8/
 JN2UKRDxFeNv3KJpF880fqjrhn6XlSbV6sjiSFXIdcxXpyXE3q612ChQAdtGkMe1me6t2zuS0R
 uCtN+sU0KREphmk9xB14NUbePi7NU5ORGLNw3biR1Mve87jSTd4KDhaEvRhK77TB9Bpmwtd902
 rSEE+RbiD5lKmXoLonAHgxTBqGrfAckwHG3bhqgzXS+UvKcO2Onj+3fPis6mb8hUaewNTyI/e6
 hYI=
X-SBRS: 5.2
X-MesageID: 40055398
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:P0QzEKmU6dbYfqmFYbTcnQg+ZHjpDfP+imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVybysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CT4FFw0NHBh2AEktwLTM2YKYRMJ
 aH/MJIq36BVB0sH6eGL0IIVeTCuNHH/aiOCXI7LiUq9RWUineQ4KP6eiLy4j4lTzhNzb0+mF
 K18TDR26PLiZCG4y6Z7UD/xdB8mNztytxMbfb89/Q9G3HXpSuDIKhkU72GljgprO+o80ZCqq
 ixnz4Qe/5dxlmUUmapoQb8+wSI6kdQ11bSjWW2rFGmgcvlSCk0A8BM7LgpDCfx2g4bk/xXlI
 dotljp0KZ/PFf7swnWo+XsbVVMkHG5pHIz+NRj9EB3YM8lR5J66bAE8Fg9KuZnIAvKrLoJPc
 NJF8/m6PNfYTqhHgrkl1gq+tCqU3gpdy32O3Qqi4iQ2zhSqnhz01EV8swZhmsB75IwUfB/lp
 z5Dpg=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40055398"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3xj0QHynsjm1a4qlzCCGJSuBXIu8dxHZb2Nn4Py0kT1ecZnS5lHBDPJjn5fn8ZNkFiZfWUX1fEe3ngDypsituZ19gkc+j/e3W0BRyZbXmEqf3/jdhua74qYpR0gzooKpQqkUrZCRaHrOd1sl2AbYXp3+avYSr85w5MBXRboTUwITTnOcEkbail+Y0cYGYoedTcIH74eAtBteeDF8V5gg1c6Pr1jb/Y2G+xLIsqHurxzaX6aq4OsAhBKkx8Geb3aNGSbrLQtuudFeoApKlkvUb4mrNAH87SN1aKmmyGrDnR+cuMRkbGnKKNjYb6hRz4vGYZhgDv2cSVTVFbueFGccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrIo5m2fuMUp8p1rJaMPBWTn479oDj4kTjXRWS9pdDA=;
 b=K4+Dd7MGjGQqKVXDjY99ipJfqA7nBTFbnFG07wptaqW4I2heKdB+OaWMA5MITdO/lX+OM5HtoKdeeL/s4ohyc25ETmolbsJpZHi+MS13sv34p1WLhr0fnFdORf+hFDEtsU2rBUNin/5FIVexIYbyz94tP5MGtpB2BRcGJzfewYEBckO6oLgyaGsMqebWffkBnshQiEeRktr+0SyhfzgNoHWloClGHFvRxcNCz4xEp1fzllxI29kTt7ForvsHeL3NN7eoc21JigDOyV4lW3etGoG0GQ6zfUiQA1n5DlzV2oBHueLdAM+o4sk60uVgo/R8cL5vHmGeuBVpUdWW+uvCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrIo5m2fuMUp8p1rJaMPBWTn479oDj4kTjXRWS9pdDA=;
 b=lPY0yt0Q+xkCpGOh2o4TRrbTLclcdnnyKjVc7tHuBpGUoYmEhYdpqW0IrFP4ORuTslVq+tpdSaY3J/f9gxhzt+f8JGlCAbn48k/7Z2WhyH7RAycfq7BCt81GfVKkh/TTIisBsu6aAOAG630ypCjvMgvOFtbJerdXfcvWDs9AYzM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 04/21] libs/guest: introduce helper to fetch a system cpu policy
Date: Tue, 23 Mar 2021 10:58:32 +0100
Message-ID: <20210323095849.37858-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0142.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9271642f-2c8d-49cd-cf0c-08d8ede26566
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633EE7F143C29383A596F0A8F649@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wpun/9Czamem8RV4146BZzJCpvOWa5XqCrnXdW580T+QrK0Aw0aAcsen4SDIBIFluO6q5WnfDoqXyFDiJ9GoZZh0hlM33CD0+Cd+olV+C80KUeU+Jc+nBgDX8OUumAKP++oosgc0K6N3KcF2E9PEh6Z3liHnBOwDydmY1mKOwjfgbwtP4AoOTwR4vYevzmjWSnmRKlbGKO3+/y4xpOEIU2Iml8krY2Xs3PvUwNiCJ05ShuTfut8PAv0TrjhnVWrEJF92R+Jm5BWrOl4ZIid6VISlKLApEGWHI+8uMwA4TAyvGLn0tJToVJmleJsXEYh4Yy4YE6t4KBcJyIRidx+f4VxXgagLQx/el4YNoi69RtlpXufUDP2aUC7Cp0BYLeHa4U75hz3VO+nHrrH1qFQPWLs5mxK6uRt0I5rf6BaMshQYbCf9CjIJ3Cc9F2Vq9oqIXRxrH+vC+yWyGajY0XuixkpctTaOCE7HFCVKoKE2GWeWTCHDkFDecBxT0PiIzhiVAuWN8mLIiWHzxX795zOaDnoFgoROR2JGJ3V9RsQhhEJoEJkSDJyms6ShT/W/5A/Qs2DJPRkg1GF387ZcuVP9jgAhTiayAQOVY2ynU9bLaYDuRJ15UWN7EfMR1Jk+3+PNx3FlS1nfNCLT1VCTjqUrT6s8X2Zkrev3BT6cadmQgf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6486002)(6916009)(36756003)(6496006)(2906002)(8676002)(66476007)(5660300002)(186003)(66556008)(66946007)(8936002)(86362001)(4326008)(54906003)(1076003)(16526019)(316002)(2616005)(38100700001)(956004)(6666004)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0ZtK2tCVXBNd2Z6Z1ZBZmRBakFmb0RMWUJOWG1qZGlYb1hZWWQzWDk3ZEtJ?=
 =?utf-8?B?dlJYTXJ4djNQdituejhDeURoTDJmZkptRHVBZ3RsYU95OFVZNHl4QzRGRFFI?=
 =?utf-8?B?NisyUWdaYVdnU2Jva2hlenYvYURmTUpkQVBERWRFYUozZ0g4UWYxekxKV0RH?=
 =?utf-8?B?YlI2aU54TjZwSGlqWXRsUlh0NHpnZkc4WGFHdjJIOHBDbDNydE9QWThESUZN?=
 =?utf-8?B?SmoyTTR2QkhnSWFKK2t2NTFPT2huYi9vR0ppb0ZoNjNiL1ZPZ0o5QWhTSzh1?=
 =?utf-8?B?UkppMEZVMzRXWXlqZG1ZVVV4OXVwcXhnWTFyT2llSWtFWCtySDhqM1NQSnlr?=
 =?utf-8?B?aENUNjA3NnRHaWc2N0RjTkhZN25lbkEyN3Q3bitSVzJ1aks0c3JQcVhENEtN?=
 =?utf-8?B?M0o4VHBxT3VuMjI4RmFtbS9jaW9EcDNpUWl1ZkhaVlUxd2lEa0pqeEdTWi9K?=
 =?utf-8?B?c0dSZ3l5bS9pbWlhdDU1WVZvL09JZjA4bDFZZWx5cDFlVWV5dHFuWEZLMlV5?=
 =?utf-8?B?SVduTkxsWlY4aXpka0NHRC8rNy8vTEdXbXEyZG9IVXpjY0xJRGpUQTlzR2FW?=
 =?utf-8?B?dnVjMkdOVlkwTlNiZnRzaHJuK1dGY0srOHpLR2tIZkpweXZiOVhXcnBLZXNy?=
 =?utf-8?B?VkJlS1FUUEczYUthcitIanJsUVQ3dmJ5NVovc0NyazJHU1Q5TDMvTnJxT0hX?=
 =?utf-8?B?cFh2Ky9EQnNPdzg0cS94NEFKVWdpanF4Nml5WVV4eUdsRG5hUDAvd0p3YjUy?=
 =?utf-8?B?RmVVdG9XMmY3aG4rTFQ2MEZSckNFbk0xUENtSGQzNEdRWHBIREVTMlJrZFdB?=
 =?utf-8?B?Q09EYTR0ajBNV0pVa29VQUFUR0RGRlJqekhZYU5KTS9wM3VESmYyR01YREg5?=
 =?utf-8?B?am9maGRqNStzSmFxUGwvRGNTME8wbHRWbXA4cWdoRlJGb0dzZVIwWlNwVFQx?=
 =?utf-8?B?VGw2bkdIbG5TenpOZTROWTMzV3l3aUkzQjZiYUZtOHpyWHY0a0J2THhqcXB4?=
 =?utf-8?B?T1RvMnJLeC81dW85VlFqdXphMC9lNG1FSE1mUDUydlo5WGZqNVlhTDZ6d3l0?=
 =?utf-8?B?WkNBeEVGNmNwZFgzWkVFOHJjTVZoWEd1cVBYbnlQL0RuRXNoQXk4bytLT0Zo?=
 =?utf-8?B?dkkwdFBaMXhUb3o4Q2pwVGJLeXA5a0JhZngvSFZDRDg5bG1EVWxreWxoU1py?=
 =?utf-8?B?ZlpVZ0JMOFRqOFRqQ3ZwNnl3U0tXK3NGVDJoN3dMaHNmQlVudy9DcjhJNE9F?=
 =?utf-8?B?S0NDMTR1cmFqa2xSd1p2eUNDMGd4S1ZYUUJFRUpHNVp1aUtJSGo5RkoxeWho?=
 =?utf-8?B?T05nRzdsNFRCWm1Ja0t4czBORmkxVHVwSlJ2QktZemJlS1hneWhPV2FCaGFU?=
 =?utf-8?B?ZEl6SHkraFpZcFZjQnZwUk5JUnZnTlh4VS9JUi9RdlV0eVNSY1BvbEdsSGli?=
 =?utf-8?B?YlJQL1lETk1jUmh5dGI1Y0tTYTNsQ2xkaFlLTm1LcHZyNVdlODJBeGx6RXZm?=
 =?utf-8?B?czdETk5jUDFCUmduZjlhWmFPVnFaUE5vUkZBcVArWlhyTkc1anJrOWxhMjA5?=
 =?utf-8?B?OWp2dDFxaVZPc2pVU2VwMG90aWw0cFF0c0g4aWM5YzVVNm5XZTVsKzdyaCtZ?=
 =?utf-8?B?Q3JORlFDaUpOV3F6Q0V0Ykdwb29DMG1KVTlvTjBmYit4eWZZUXQ1Zmk3NUFh?=
 =?utf-8?B?d0R4MDl3bGIzQWpLalBKUXBUNzFxWFpsY3ZKNjl2aU84WUNlSWhvWG1FN0ZU?=
 =?utf-8?Q?v4I6MsGWfSoySxQSznH87YOLqRlclJTieBis9v+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9271642f-2c8d-49cd-cf0c-08d8ede26566
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 09:59:49.3569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7h13i4YLjc0tvNUR5Nd1PVCJ5TFWX1RGMfxC1bl7mN9BwktRXPwtXSIy2TkhmVNm/hvAXg7QkEGwe/gvC9boA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

Such helper is based on the existing functions to fetch a CPUID and
MSR policies, but uses the xc_cpu_policy_t type to return the data to
the caller.

Note some helper functions are introduced, those are split from
xc_cpu_policy_get_system because they will be used by other functions
also.

No user of the interface introduced on the patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  4 ++
 tools/libs/guest/xg_cpuid_x86.c | 90 +++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index ffb3024bfeb..fc8e4b28781 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2596,6 +2596,10 @@ typedef struct cpu_policy *xc_cpu_policy_t;
 xc_cpu_policy_t xc_cpu_policy_init(void);
 void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
 
+/* Retrieve a system policy, or get/set a domains policy. */
+int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
+                             xc_cpu_policy_t policy);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index ade5281c178..3710fb63839 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -687,3 +687,93 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t policy)
     free(policy->msr);
     free(policy);
 }
+
+static int allocate_buffers(xc_interface *xch,
+                            unsigned int *nr_leaves, xen_cpuid_leaf_t **leaves,
+                            unsigned int *nr_msrs, xen_msr_entry_t **msrs)
+{
+    int rc;
+
+    *leaves = NULL;
+    *msrs = NULL;
+
+    rc = xc_cpu_policy_get_size(xch, nr_leaves, nr_msrs);
+    if ( rc )
+    {
+        PERROR("Failed to obtain policy info size");
+        return -errno;
+    }
+
+    *leaves = calloc(*nr_leaves, sizeof(**leaves));
+    *msrs = calloc(*nr_msrs, sizeof(**msrs));
+    if ( !*leaves || !*msrs )
+    {
+        PERROR("Failed to allocate resources");
+        free(*leaves);
+        free(*msrs);
+        return -ENOMEM;
+    }
+
+    return 0;
+}
+
+static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t policy,
+                              unsigned int nr_leaves,
+                              const xen_cpuid_leaf_t *leaves,
+                              unsigned int nr_msrs, const xen_msr_entry_t *msrs)
+{
+    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    int rc;
+
+    rc = x86_cpuid_copy_from_buffer(policy->cpuid, leaves, nr_leaves,
+                                    &err_leaf, &err_subleaf);
+    if ( rc )
+    {
+        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
+              err_leaf, err_subleaf, -rc, strerror(-rc));
+        return rc;
+    }
+
+    rc = x86_msr_copy_from_buffer(policy->msr, msrs, nr_msrs, &err_msr);
+    if ( rc )
+    {
+        ERROR("Failed to deserialise MSR (err MSR %#x) (%d = %s)",
+              err_msr, -rc, strerror(-rc));
+        return rc;
+    }
+
+    return 0;
+}
+
+int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
+                             xc_cpu_policy_t policy)
+{
+    unsigned int nr_leaves, nr_msrs;
+    xen_cpuid_leaf_t *leaves = NULL;
+    xen_msr_entry_t *msrs = NULL;
+    int rc;
+
+    rc = allocate_buffers(xch, &nr_leaves, &leaves, &nr_msrs, &msrs);
+    if ( rc )
+    {
+        errno = -rc;
+        return -1;
+    }
+
+    rc = xc_get_system_cpu_policy(xch, idx, &nr_leaves, leaves, &nr_msrs, msrs);
+    if ( rc )
+    {
+        PERROR("Failed to obtain %u policy", idx);
+        rc = -1;
+        goto out;
+    }
+
+    rc = deserialize_policy(xch, policy, nr_leaves, leaves, nr_msrs, msrs);
+    if ( rc )
+        errno = -rc;
+
+ out:
+    free(leaves);
+    free(msrs);
+    return rc;
+}
-- 
2.30.1


