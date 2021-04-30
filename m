Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4C736FE17
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120615.228146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVT6-0000y6-9Y; Fri, 30 Apr 2021 15:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120615.228146; Fri, 30 Apr 2021 15:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVT6-0000xS-1e; Fri, 30 Apr 2021 15:54:16 +0000
Received: by outflank-mailman (input) for mailman id 120615;
 Fri, 30 Apr 2021 15:54:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVT4-0000wV-7X
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:54:14 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fd02742-d0ab-4975-80cf-ed15e4814c4c;
 Fri, 30 Apr 2021 15:54:13 +0000 (UTC)
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
X-Inumbo-ID: 7fd02742-d0ab-4975-80cf-ed15e4814c4c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=dLIQdWJ/rQq9cDoz+VNpuFqWNGmZaFJFYqKXFPnGBS8=;
  b=cp0G8zCIEYZcxYNrXsZcbu3Q4yqWENgiRsfabbw35MWAhrZX9pnRUW5W
   vKn3D78UTrlAbUS2lIxzhEejWJEBKvKBTrin9esQsuuSMwVhC5+bkily2
   E+rJlLo7meHMZXd80LKELaWvleDmptQX1w8zywke9noSKDEMwRm+N0G0j
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GXDbTmUi5a8h5yVbRaks+E/+qwLElnwWb7+Cnm6AuJvx5JNX8mk3Rqo8KxeBQ5taRBDlAFuP6V
 TOEb+ha2huWJzOGZNwjZQos1ZLq4U6uT6IoyPfFRkwsLm6ACvousNU5X7B9uznU6MtprQ36h0Z
 c3lPLnN6zR2vKUxn5UUpDulMU4C24uCk4nxOjOaHW/6MdKXdWwsZCm8TErNJzGUloVWNLbiy9O
 nRWujPiwxKnV2IhmmoI5MR65uIXJBnHT+35KGmqR54LsKdk8xyu4Ms/5yOYIQxzkCWJ54C+8h+
 k2g=
X-SBRS: 5.1
X-MesageID: 42810466
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Gjb25q3sLNzHGcVMVP0NJgqjBFUkLtp033Aq2lEZdDV+dMuEm8
 ey2MkB3RjvhzoLHF0mk9aMOK6PKEmslqJdy48XILukQU3aqHKlRbsD0aLOyyDtcheRysdzzq
 FlGpITNPTVLXxXyfn3+xO5FdFI+rS62YSln/3XwXsobSwCUdAD0y5DBgyWElJ7SWB9bPJTfq
 a03cZbuyGmPU0ec8XTPAhgY8H4u9bJmJj6CCRmOzcb7mC14g+A2frdCBiX3hAXVhtV2rc8+W
 35kwj0j5/T1s2G9g==
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="42810466"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4jbpHFmQOSJ0EwigzyZ3kF3kYDDV2PF9e7ekH57NEtBB+AYUnNSBQ3J7ikHshLKtP1KWIIABnet19YeP6/X/XC8ynOd9CzJPA4CAzyjid0eZgc4tQ3PrbCi652Ttr+Uk08K7wng5P3rewtpQBzX2lHVqsOjw5lks9rCxsLZ2jPU6XMjjSI4shId1L7TuFPObrdcX28mmMine/cKnGd0tWDuDbc6P8UsSMnj+Yw49AX8KEbr8nXj9JA2WRxMUBG1KxzgIUN58pI3145RVqgt+IQusAnckmoUPLXo/XE9mgNfFvKEcecYGoML2lXkUHN5vvdBM8kZK8ZjlKEhU07uEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3o2QvcoZ6aVqm325GW0WaeCjiv2jnbCGTc6SoBmmbE=;
 b=ZDOhf/CnobaI/sHY4v/HWSFP7AI+quIGyMIPh89cS+ts9KM9kVv+Xnx/OmpVsYkjPpXAkr799q9TbYLZu0b8+yjwdUjJm5yLc086nfObykT/SIenOJ5ZpAAa0QIyiHNP0zzJMM5m5opwnYAjpTEJhr+PZeEvben5RnClvX/3c+ZEkv+1btekXhVKIxw0IqVu62du16Rjpd3qWIVK1aukkJi3wlq3bSvZ22/kNF0pwYNGsupApnm4X2Ob6wH3/oRhcwsCeR1z1ht2ACwQsKy++qzgGy8UUG+wgrwfAtJqDy4MuCLAd8iOJycP6AaY+plFthvJW0hyzRyoFcT3rqosmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3o2QvcoZ6aVqm325GW0WaeCjiv2jnbCGTc6SoBmmbE=;
 b=snApkINHTQZsUTWq6Oz2mccat3V2G4Rf9Tz+b+NKO6j2doa3uulLY4P0WWty+0yJduQMWEjHj2jRRfF0WLsHSs1rRM0JwPJDc1GpZupVVolUat5pxpMyWNfG9zEoT/VnwpED42tqGgQReX+QgSYd/wcnjtpKCAOobEDP8G6DbHM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 06/13] libs/guest: introduce helper to check cpu policy compatibility
Date: Fri, 30 Apr 2021 17:52:04 +0200
Message-ID: <20210430155211.3709-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 857750d9-21da-4aaa-d6cd-08d90bf03154
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4218D7E60D7F26D4E1DDE3B88F5E9@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85htbtuOZalFc37kbvL2rPXTedPrHMsTtSlWO4jWSruLnycgBuQUc1YOuOjlvHknMehxyhwY40xCyKbDecZzwNUBBJmDU6+71d4GpDuNyDXvyYwxAr4OJegb0nIlhCKR/zNtesOsj4NAhJXuDtJvHwS96q57cCnvPsaF9K34r2NrYmM41uJXZZm3wQrMe6kkPqPrdU4IHdc4A1x+KASnd+tPZQWI5znj07/UTJWCp4JPSrIkKnq0S37QETNnkG07Oy50E2uTgsi+WfMRFEnwzEvNmb+WnPVM/D87s1AjZVx+88itz1ThDcLpdn5JfhdW0U3UsBJflxMJWMRxrmxnRkWmjQU1WViKbibuZrWTTVQBAZWX0vtm/q//6yS2W9PQn2K3XZdtRIzpF/rEO6r0Nm49g7kkCg1NPsPqKxKLmRTh9nyWmxs7fhljhsrBIKJvsS9F7rQJhk2aR744s/jb9O8X2n/VOgbm9g/RftBCOv58MIcHZNVxADdZHULqnMVRpjQbKIaAk5t3+9OqoWBczCe/YxmdHJKpDg/R3JEGoRLTLNMDBAG51W4tEBFORaDgC8QZpK2NaMnzM96laQJeI/qYIxrSkAxNcdT+08azFCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(478600001)(54906003)(36756003)(316002)(186003)(26005)(66476007)(6666004)(6496006)(4326008)(83380400001)(1076003)(2616005)(66556008)(2906002)(8936002)(66946007)(38100700002)(6916009)(6486002)(956004)(5660300002)(16526019)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YTQ5U0hoSkJ4dGFudGJQOE1Cc1EwYUJUZDM0VUhieU1KNTBxN25wajBscEh5?=
 =?utf-8?B?Wm9MSWcrVkswbHRzNnZYY2pwOHBWTU9kbFZrOUxpdytwN25TeFVUcW9BM3VF?=
 =?utf-8?B?K3ZvYXRvVS9YbEtXVHN1T2w3SEg3RG5XNjdKZVBaKzk2QXI2dVNBN1oxSnRU?=
 =?utf-8?B?VFdacjNhbUZGd3NOZGluckdkNDQyWERheG5US0lCUjNqci9TRDEwUzV6bUZs?=
 =?utf-8?B?SkUwTXlvNnJmdHFrZ0NIWTFlQTdJRXFKaGVNdSsyZkZKb0RFR0l0SEdjZkNn?=
 =?utf-8?B?dHZEQVlVY04rTCs0eGJhdzlOQXNlZVg0VVlLVi9pR0h4NHBCcmdCeXhpM3dQ?=
 =?utf-8?B?eFRJejZmMlQvcWJDRzFkK1RHYVFGY1QrN0tSQWl0WXFwWFNUSWZ6MHd0N1Jn?=
 =?utf-8?B?TjJmc1JwczlYYXhFd3dESG9jc3ZpRDZtUk9iaXdKbmhWb3VEZkVBUnY3NnVS?=
 =?utf-8?B?SG96WHo0TlZHekRxYUVsZlZhN0ZJSElLbVYwenM2VUpLWG9mZnM3V21pQi9u?=
 =?utf-8?B?RUpUMS9tRURNaGlMSExPeEh6Vk43SXBKa2xKV2x2UWI0VnNzSitGeGF5TUwx?=
 =?utf-8?B?cFAvTGlxeDNFcE0zZkZhWmlRaHRuUzEzVmd4Q08zQXgzUmxTODVFcXlsTERu?=
 =?utf-8?B?U2pIMUJ2THU5clV2UHNOMXV6UDdMRHJLbUt3MHhRNGoraFFjdjZBcUdGbW5O?=
 =?utf-8?B?MDhGT0syQUN1a0cyZ3ZJZWd0K1A3TFZEZDJxSTIxNDRFVEtBYStoOWZKLzll?=
 =?utf-8?B?cnd0Um9zdHh6VThOYmhjQktXVVNDNkdCWDVDMUpweGFXa3Y5U2hHZzExY2ky?=
 =?utf-8?B?Um9QcnBBcGJyYzZCMWlrdlVZWUM5c0ZjNlF5Z1hmZ2dRek5HOC84bUNZelVk?=
 =?utf-8?B?Z01wc2FJZlpnWmExT0xiRjhhUThmakowNjRRRE5hNnF5YmFBbE44MGUyNHZC?=
 =?utf-8?B?TWNjNm1YZGs4OFI4ZFNheUJsY1RGeUxyQ0Iwc2hLeWlXRTNucnNRUXVQMDlW?=
 =?utf-8?B?cWI0R1pDTVl2NmpoQTFCWjhKVzhYbXJLT2Mzd0ZjODV5NkE1WlhzbEVsbG80?=
 =?utf-8?B?dWoxRHdsak9pZXFoOTY5Q3F3T0EvTWYxRGZ5YW9YWWlwN1doL0RjdURRTWtz?=
 =?utf-8?B?eXUrdVhZa3NjdW1GcDBabE5vRDYreDhrRDZzMDZwWkpsbTdvcVM0M2xVTDVS?=
 =?utf-8?B?TDdiaXVNUjNhenFDTkY1TXhUKzlodExjWXdXUS9YcFpidExiTEtVREdwcHV6?=
 =?utf-8?B?NWNXeGRFL2NoaXNlZEdSS01HOE1mSXdqSUc1dFQ0UnB3dUZKQnFJc3kwVyti?=
 =?utf-8?B?KzJ2QTdBd0J5RWxuY3hmNGExSy9YS0k3UGY3L2g2azZyeVVEbklVM09iblhR?=
 =?utf-8?B?YWt3eEpiWW9NcWV2SkNVODRUdEZ6U29YbVRHZHFhOTJEcG9QbkxRVURUcml0?=
 =?utf-8?B?Y3NFNEtxTU9vdmcrZU9pZWZzZXJFQWtQMXNSZlpoM09CNEsvL3E4c25WeVE4?=
 =?utf-8?B?bit4djJ1cFVoQURiWUZWMDNtcjJGY2ZBMlNBTXFOSDd2QzlWNnMwdld1b2N6?=
 =?utf-8?B?RG1uV0RONCtMMHJZM0V5WVdKV0YrMTdWOFE3Q08rZXYwL3d2YWRxNUFWcGtB?=
 =?utf-8?B?bS92SmdLVGRwUUZ6NmJzMFdMWEpCTS94d3hiL3F4TzdYVzNSVUNpc3I1amJs?=
 =?utf-8?B?akV3UTJZbXFTTmxpeGtuRGNwVTBOOUpPKzVQWlR5MU5ONXlkd0Uwa3gzNDFW?=
 =?utf-8?Q?oftVUJt2PJQU3GSlDkepJrjTr0LytIyZl2Qnid5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 857750d9-21da-4aaa-d6cd-08d90bf03154
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:54:09.9277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3IJ6of9v+s+6DZ0YbqhjWmA+ua7V7glEQbpOOcbdcjP3dHnWyk/BJFpDH9+BeB6losb1ke7BAVE9N91Hy09hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

Such helpers is just a wrapper to the existing
x86_cpu_policies_are_compatible function. This requires building
policy.c from libx86 on user land also.

No user of the interface introduced.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Initialize err.
 - Explicitly name parameters as host and guest.
---
 tools/include/xenctrl.h         |  4 ++++
 tools/libs/guest/Makefile       |  2 +-
 tools/libs/guest/xg_cpuid_x86.c | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9a6d1b126d8..5f699c09509 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2619,6 +2619,10 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
 
+/* Compatibility calculations. */
+bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
+                                 const xc_cpu_policy_t guest);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 604e1695d6a..6d2a1d5bbc0 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -40,7 +40,7 @@ $(patsubst %.c,%.opic,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
 vpath %.c ../../../xen/lib/x86
 
-SRCS-y                 += cpuid.c msr.c
+SRCS-y                 += cpuid.c msr.c policy.c
 endif
 
 # new domain builder
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 37e55279ffe..6b8bae00334 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -930,3 +930,22 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
 
     return rc;
 }
+
+bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
+                                 const xc_cpu_policy_t guest)
+{
+    struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
+    struct cpu_policy h = { &host->cpuid, &host->msr };
+    struct cpu_policy g = { &guest->cpuid, &guest->msr };
+    int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
+
+    if ( !rc )
+        return true;
+
+    if ( err.leaf != -1 )
+        ERROR("Leaf %#x subleaf %#x is not compatible", err.leaf, err.subleaf);
+    if ( err.msr != -1 )
+        ERROR("MSR index %#x is not compatible", err.msr);
+
+    return false;
+}
-- 
2.31.1


