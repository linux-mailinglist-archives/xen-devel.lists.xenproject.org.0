Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C628D36FE13
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120598.228095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSf-0000aN-J1; Fri, 30 Apr 2021 15:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120598.228095; Fri, 30 Apr 2021 15:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSf-0000Zw-FY; Fri, 30 Apr 2021 15:53:49 +0000
Received: by outflank-mailman (input) for mailman id 120598;
 Fri, 30 Apr 2021 15:53:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVSd-0000ZU-Qv
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:53:47 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 811015c8-61e6-4789-a1bd-c69fd7925069;
 Fri, 30 Apr 2021 15:53:46 +0000 (UTC)
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
X-Inumbo-ID: 811015c8-61e6-4789-a1bd-c69fd7925069
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hELyE44OjIjzV7+Wdf4YgVbmMqt+ERhOJXbcDBIErKg=;
  b=c83pQE82Zg5WiN92q9eMFTR5ovj7eCfSdGWd7HCj0cUHwhIbAPrRRRhH
   k1849tcdZNSOe/+6wddKU/xvBYngVioLQfFLbndJvxgh5aBbuvfQqfP0S
   sGMTKSMavidQK92hL8XYW4jgdvduaRoMDf+KKTKX3JWsMWhr1mw/2cAAC
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q8NT5IUDhpvBjtZh+pb8MBXK9/TJdmwxRNo+2fz1mnU96RaPnIR2pzn7HTUxjLuBIytJ+hpXsI
 GMVW1rxcqOakF9BEdEBu9oSG6zWhdyxubWdIKHzkAMYg/Js1ToIhbkKXBWlH0uU3djZ5F28SEV
 oJv3QDpfzaDSVoX6X6QjHzEDQMWJa3MsvSgJI6VCUPCjxfxBbwsbJCaqBys7yTi+2ux5jlX3yW
 DIhhCbT74zpoeD8MlZK//GulgnfTm9LqYu/Zkd0+i5BHo/jwlIaqgSnsfxxld5Zmww56VQsLTI
 qw8=
X-SBRS: 5.1
X-MesageID: 42930019
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6mjpAqiS7RJv/QE8O2Enh51B/3BQXiUji2hD6mlwRA09T+Wzkc
 eykPMHkSLlkTp5Yh0dsP2jGI3Fe3PT8pZp/ZIcVI3IYCDKsHalRbsM0aLM2DvlcheRysd42b
 17e6ZzTP3cZGIK7vrSxAm9H5IezMKc8Kau7N2+815XQQtna75t4m5CY27wf3FefhVMBpYyCf
 Onl6h6jgenEE52Uu2LQlUDQujft5nqufvdEHo7Li9i0ifLoROEgYSKdiSl4g==
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="42930019"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkvwYiCWizhVRJhxjAXQcWx10lPZGXM73BL/g6Iu+E9o2Cy26PmXbKkq63W5wWhvb1/x1dg9Ll2MnHkZ51FVN0oB9WjqO25lOiS8zB2GDXj/w8CWR6rud1uG0f5ovJPRATwit7c4mA60jBrj0v/c0VuLPEZFFl/MfFl5Ca3HZu6pMowIspQVJ/1vclJDWl1YKjR1jwmO2kowXYh4BHcDeFDo4vFdrWZf6Bzcv4mL2Swmxbi4N4jEYSbWE+WPHRoMXKgYFiPuTO29teBDJyiObcQPKORdAgdfgrlIe3pSBDDfB5xiTAltphAy+JSveL3EBW87t1LlNavBKj3hqHpm2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyuIaS7BuF4VGyvgnC9lay8BjM2lepDtuERfKu+QpZI=;
 b=Ho9w5l4D05LOQBrKs2JJrJgvOcRfpYogmO7GKcFcmPTkAv7G3SbI9H1YbYozvqDzKVhdAVwq2UMcW0Drsol2YbUywN6vqV4dnSD88a2Wl7Y+sDOSMB8CE5bkJREl4i9qI+D19bfA1VF4o9l9ODr0fnWbKYNVtmUcFx2Di/Sjw3BuHqOcEJat1xloOwv88KI1e9DyL/fOhrLhL1lS5o0wVgZNm1UnGc4+9W/fzHqVu2i4fnAxdV4ZW01Smn7nswFyeGz7WOMdJ+U+05qdRDiZ8Ipq8hK/rfow/e7qIr1Y21lzwCoK3wOhk4kVwVlXFzvG6xT60zEPK8jBE7D+JyIw6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyuIaS7BuF4VGyvgnC9lay8BjM2lepDtuERfKu+QpZI=;
 b=PI/0IynwZFfgoYc8FAMYx3dOqFvBahWj+tEN1Dm8unwYXWbd37ij4iMQZbn9I/phuuGGHcwUc2UnRluNNq7YvxfzQbHiJgQYyZPTCvAiG8XOc21sXIvZfFB1RFXwDRoA1ZHTxeFz6F24/N7+usK4VStmFOaIZOQYYjwoHKPELqE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 02/13] libs/guest: allow fetching a specific CPUID leaf from a cpu policy
Date: Fri, 30 Apr 2021 17:52:00 +0200
Message-ID: <20210430155211.3709-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2f27cf8-99a9-4121-eb94-08d90bf020b8
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29233AA9405A4FE4ACCA4AB98F5E9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AdTT5iY5vkyEqrNEX3amhdcUpI83iaHeq2FIRVkMjEGzgzPI6k577F3APc8Uoy8x9s2BlrWSidZpStscndnfpptSg2OsMNIYpKgws2WY2oDxixGZ74CIKf781CD65hCUkVO6dB0TTK83QrytSWDqcB0KC33ele/d98KLFGha7yYMHTXvKb0xLBJgLOw7lgpgceHzCP2jgy6/+ZIhHn47LkmkGvBAGRb4MadH9/aR8nMnyy+xIjgrqMUxCgYswJ8fSTInbZqF/u/lr2rpU0vMX2hZxWG2PHqTvoIrB6SyColhVUIR45FbOo1bMQmPpPhe9Y+P320a8IyqDlBvegYfKaa465ZbAMAKPcwxMPFM+skqlS63Vb6wGoaZrzeanNaRXBEKTEmpvnjmYcdvkJ7w7f0Pj6WX3/8PcuV4YNQlfjNIPtAa7OLKgRxy9kM5hOubp5rIznsBh1AwwWmU0VFmXLCKanMnK2mswsUkemw0To5hE4Al3jW8+Y322L5N425CTnyut+NLcJK7l+kETe6W3bETmZCi88ErAKdTRQEPXAJUHCEzSX0AbVAh0d12QghGYNUw4OYVKSaOBciLDcr1hRc1DLRKPGIjbyEjn2AVJoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(186003)(16526019)(86362001)(4326008)(8936002)(1076003)(498600001)(6486002)(2906002)(5660300002)(26005)(66946007)(2616005)(38100700002)(66476007)(83380400001)(6496006)(66556008)(6916009)(36756003)(6666004)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z1pxdVcwS1Q1Z2c1MVphWGdTbWx3ZnpnYkRpOWg1L0ppcllZZnpVbjdCVWdu?=
 =?utf-8?B?R3RDMEZoNkhQNkYrOEpGT1pmblJadzAybHpoY0RJR1J6TllPQnpFUXZPOHla?=
 =?utf-8?B?OC9CUlRNQ2htRXg1ZUdVb2VZWEx2RTYyZzNwQTlZY0lWY0p2dnJwRmpwb3hi?=
 =?utf-8?B?L01ZbWVybDg5c3NtazVJUEVtNEhob3Joemc2bmxIVmlWb0lqdjl5dW1qSTB2?=
 =?utf-8?B?WXlmVVdQMDR4a2p2cjNHQUYreEtUWjMydXBLS0kvT29idnJNV0xTc0IwTHFQ?=
 =?utf-8?B?Y0w0VldyVWNFZWdzcEdpZHpZcytvSUUydk1FTndxb2RiZ1MzT1FJZ3k2SEg2?=
 =?utf-8?B?RzdtMkZ0Nlc4ZTdqZzFyRHBRRnY1RWh3MkVWYkxPdUprL2NEVEFJcE5aMXpx?=
 =?utf-8?B?Q3hieWJFa3VkTnBtTTV4N2hFZEYvSTlOekhobUluY2llQXVpYUdGRmFYMUtC?=
 =?utf-8?B?eERZMWVxc1pZaTZCdTJRVVc0VlVkRHpNcGRhMFpiRzI3M2FUbFJxQmwyRHlY?=
 =?utf-8?B?L3RJUzlES0xVTktTWkx1bkZSOENqSHBEdFdkU0gra09WN3VUdTlUZzlmUURy?=
 =?utf-8?B?OVFyRWUxRVVBdTBONU9QTkl4cmFvUGJra25FbFNXWGltQU1BbThDeUFGeWJE?=
 =?utf-8?B?aG9uczVTRmZsVjQyY0Y1WVVqNTQ2N3BPOGkvcm55MTQxbHFvRFZyWmtVaVZx?=
 =?utf-8?B?bTYrVFNDUWZCUklFL0MwZlRBb0VDU05PRDhlSzdibFRhSGVaZEN0bkR3NjFu?=
 =?utf-8?B?Rk02VEk3MXJRczMwMU41cU1pV1N3M3JxRHJ2NFlSMHI0WGFzdFlJTm5MYm5O?=
 =?utf-8?B?aEltZnlzcmhmaW1uakFQN3NjR1c0c1hkR1hFUjNPcnZHTTFxdG5EOFNSUTBv?=
 =?utf-8?B?NWdGdlJEWlVWTGhEc000bEd3SGxud1IzRHNqZE12MVVpdDFaRUtMVkpMODVC?=
 =?utf-8?B?ZGpxNmRDOFBoWEJxZG1NajhXT0tOQjRtUHdQUHEzSnFlWkt0djJvVzhmaXUw?=
 =?utf-8?B?cWoyazBQVTZPRTNvZ3lLQkNGMTdtc1E4Y3ltTHUrVVdNNC9uYldaOGlaZ2pL?=
 =?utf-8?B?Q0hrWTBOT0NyQUlLRWJXaTJRKzh0WjV2SU1Sc0ZNNU1DMlJOMTZMWndBL1py?=
 =?utf-8?B?SjAxNXM2d2Y4R0NyTnFBMWlqbTRROVY3ZHUzOGNneGc2UkMySzY0TVZ3VzFk?=
 =?utf-8?B?L3ZyTXB6S2pMMDF1clB4M1hTTHA4K0ZRbnl5MGNvOE5PeXVBOEVMRGpSZDNm?=
 =?utf-8?B?Y1NITVRwUnpMeFRSWGdxNEtZTXpFREJPRzdBTG1rUDg4Wm9kdzI0VzkybGI3?=
 =?utf-8?B?YmdBQy9tOTN1S3NzLzZUbzd0OHowY1ZZVWMyZzg5NzcxbG5nVk5ob2loSFE4?=
 =?utf-8?B?b1J0eU9BQTBKOURQMFRONmRtNzdEOG93a254V0hGNWJQTU10SU9KNnV3enR3?=
 =?utf-8?B?SXFNTnZYdDNJYW0zMHUxSHNRNTFlaGtoZXFXbUlyNnNWZE5LcVN4QjU5dE83?=
 =?utf-8?B?aVdWR0lJckc3RGZ6eFp4KzhpK0c5Sml2dXAvcm52dzk5UzRjL01GQjFvTEcx?=
 =?utf-8?B?dlZWLzd2RkdDalJndTlxSHdhQ0xzY1dZSHFheHFIRXJrWHhIN3BNYlU5OFh2?=
 =?utf-8?B?cjVock5RcVRhbkU3Q3dnbmpwaWc2eEltbkJkUHl0empUZVIvUG9vYXpwRHVZ?=
 =?utf-8?B?VmU4bmNxZC9ielQ2WVUrZmY2NGlyMi9YQ2laOTdvQjhTQVFjOVlwUmJNNVNu?=
 =?utf-8?Q?mjOMJvvmqzSoVfxEP/PPYLwxwkPNq0WN1MqfAKW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f27cf8-99a9-4121-eb94-08d90bf020b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:53:42.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cBKCSNoHXWq3uKlUGXF5RyvZoT15a7I32uAk4pm8ljYi/ALFtmIMlqh6Xp9+qXHkCxJwF8N14+fEyZ8KQdfVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific leaf/subleaf from a cpu
policy in xen_cpuid_leaf_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Note that callers of find_leaf need to be slightly adjusted to use the
new helper parameters.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use find leaf.
---
 tools/include/xenctrl.h         |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 38 ++++++++++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 27cec1b93ff..cbca7209e34 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2608,6 +2608,9 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
 int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
                             xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
                             xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 0c9b3a960f0..de27826f415 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -280,9 +280,9 @@ static int compare_leaves(const void *l, const void *r)
 
 static xen_cpuid_leaf_t *find_leaf(
     xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
-    const struct xc_xend_cpuid *xend)
+    unsigned int leaf, unsigned int subleaf)
 {
-    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
+    const xen_cpuid_leaf_t key = { leaf, subleaf };
 
     return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
 }
@@ -365,9 +365,12 @@ static int xc_cpuid_xend_policy(
     rc = -EINVAL;
     for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur,
+                                               xend->leaf, xend->subleaf);
+        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def,
+                                                     xend->leaf, xend->subleaf);
+        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend->leaf,
+                                                      xend->subleaf);
 
         if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
         {
@@ -822,3 +825,28 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
     errno = 0;
     return 0;
 }
+
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out)
+{
+    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
+    xen_cpuid_leaf_t *tmp;
+    int rc;
+
+    rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
+                                 NULL, 0);
+    if ( rc )
+        return rc;
+
+    tmp = find_leaf(policy->leaves, nr_leaves, leaf, subleaf);
+    if ( !tmp )
+    {
+        /* Unable to find a matching leaf. */
+        errno = ENOENT;
+        return -1;
+    }
+
+    *out = *tmp;
+    return 0;
+}
-- 
2.31.1


