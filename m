Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B635E0C2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109770.209545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcX-000542-Lr; Tue, 13 Apr 2021 14:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109770.209545; Tue, 13 Apr 2021 14:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcX-00053L-FM; Tue, 13 Apr 2021 14:02:25 +0000
Received: by outflank-mailman (input) for mailman id 109770;
 Tue, 13 Apr 2021 14:02:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJcW-00052d-0C
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:24 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b7db29d-1084-42cb-b665-9ae2c43f7373;
 Tue, 13 Apr 2021 14:02:23 +0000 (UTC)
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
X-Inumbo-ID: 5b7db29d-1084-42cb-b665-9ae2c43f7373
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ovr7/YsUP39oXdKzt7Kk8fSJbiorDCwX07ke7Osg8Gc=;
  b=fi2J8ld5ELHNbVU27V6f+ln7C3z/kPXjbZiW7nR11irfX1qfgYkSiHfJ
   wvtRsPMvRHn+xoXtkF9myjO/CYnLzR1G0fBjjF2a3WtFovIQmu6LdIQnK
   EdZWsUsQf4xt9sgH2tCv0ZUa4chCwFiCD0WgFOFx0Rtq1AiXhvrUEZqXd
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Zp14r/kNJzYeinSih6yGez5dnzsPOTnNkIKP5E5mMjTg1o5KeUcGHsguFHr3TUpODXu4VG3zg1
 YOkX6ubrhaoW6cOwJIXybBgx34sRXytxxldUhUbrrKzxiIYacJKqgSEUDRyywOWjoe5/yu0mgu
 HG/+3LThxnEJKcZJHoLyscH55xho23jbw0pKtFplc57NQmBE3NVKYhq24Qan6Eth3RkpIclGhy
 ugqF9Oxme2JC9eT5TvEcKx/8q0cIbeO9EJEz8Cl08hSF6Zbw46NHg7XzLs+JNSy62UleUNxfxR
 V+o=
X-SBRS: 5.2
X-MesageID: 41866893
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:F72rGaF+VB3OFmT1pLqFMpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrR3TA+ZlppbQAJLvKZniChEKEDqFHqbHjzTrpBjHk+odmv5
 tIXqBiBLTLYmRSot395GCDfeoI5Pmi3OSWifzFz3FrJDsaCZ1IywtiEA6UHglXaWB9ZaYRL5
 aX6spZqzfIQx1+AviTPXUZQ/PF4+TCiZOOW3U7LiQ64wqDhy7A0s+YLzGk2H4lMg9n8PMZ3k
 Xu1yf44aiitP/T8G6n60bjq654tfGk5t9KBMmngtUYJDP2mm+TFflccozHhh8ZiqWC70srjc
 ntrn4bTrhOwkKURE6Zi1/M3BTtyzkn4XOK8y7mvVLT5fbXaRh/Lugpv/M8TjLpr3AOkfs57Y
 dwm0WejJZTBQOoplWE2/H4EytEu2DxnWAvioco/htieLpbUpB9h6oF8nhYFZ8RdRiKk7wPIa
 1VAMbQ6O0+SyL9U1np+m1mwNmbVn8uBBuxQk8bpsyP0zRN9UoJtncl+A==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41866893"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ4Y8ZA5AMUfBpf6/amurY82kCJ5uJ78eh6wrc8fxBKby1bc3SLKMiAk4a4mctw7yisEKfPoE6Vp7w3wex0cIlhhVIFRZbcuHObaPhEcisaUYgFc1PYleAvnqLNhToP+uSEo/rFWutEPgE5dKvjGIsigVADOgSPtHUkOjXVQWaFK29H87+qW/mEAkzjPxB05M22oAppWAq/vpJtBjBMirIgTuphxMgsaKoTSdNix3wODF0dUyhmVJdKMQI2248MkkEK9kRXxVOxb6EEIBlzmbJroRaBUVTesO6AwudZQQ6K15KeADU52kkYntgSNuQeGp5GLzAWesM/jcNFSKw+zXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P/SnasJN8U82dOcBiB6I/f0U0K1k+7/Q7LtDAffDeY=;
 b=Pj733Uw5RGvl2LpBFwhJaKuG13CVHVXxGAgo1O3ZfG+9TdoRbBVL3xXzXFLnpLNThmk+jlIc4gb/vZBc+nKm8n2xWGMUP6WOGmyr7u0E+wgSDeZ6NB5V1Fl1wUqLu53juWYLTAvM9SYO1HslduTbFCvbFpTmAmcGmyj2U43UFGVsGpNEqOTcofTFQl+3xXDkID+Ja1TrPF1aMJglTOsmbPK2+5VEXKaTFZlSW33gH+TuI2xWznvclexaLII065X9jX8HL371qptqGffOpbu69x2DlqaDXA9BWTu4NY4kvGYXnU+NQiuCWD5g7F1kGhvoAbyfuhmuV2X0sFUZ/AUY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P/SnasJN8U82dOcBiB6I/f0U0K1k+7/Q7LtDAffDeY=;
 b=lX+TpiWF2XNzmwyxsDJpNCw6mqn5NIBWWbxvh15bItXOb39mRp5T8XZd4muaqxuxVha72ULeTQjqqp5tLtHlZ1w3rRsOtDa+17ArRCxIozyFcWgLq7vVXfT3gyw3sGCby8gzuhqrfoAjh6iJfwLWd5V2EwAClfSm0/7jzV5RB/A=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 04/21] libs/guest: introduce helper to fetch a system cpu policy
Date: Tue, 13 Apr 2021 16:01:22 +0200
Message-ID: <20210413140140.73690-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 921b7890-1c3a-4d82-4348-08d8fe84c01c
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB554260DEC25440E4FC50967B8F4F9@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7IIScWxMDQ7+9qfzTz1pxH4VJMhjglcOkYkjJmuYmg+WpE44x8grGJ+OQ2Qs/LHaeZxT6sLIZ94WB10sqOGrFB0x8aV+/dD2dEgZR3j//GcjVupAFE+RvyPZ492mieBBTu6E3Ip70f/HbdbbabJk/0Vzl7tyZdez/B3VCr6NAEIyXLdfzO+9llkgHa8ahwmKc8v8foMXbzbNLMd60DqHmiHqeN7l4eSx2yWCsJacFssB/QHXO+WDAj5JlVENKzFIFOH8B4KYZRVdKeVnZRqKFQ8JXumcW47l/aizvz+DLJboFhzanrc5AgcVlfgpuWSK9u9SnJIACfFIz9DDPF54Hhnc1U5/BMdl0kfRqc0YnaCkj+RlnvgioUx34laLC/XpRF+1uqPL69UBoB9L9qljQe90k8PbQcWwDPm7iEpISKBwCAAX3VRjlyQd22O2c9its4geITHgzxzI2nPPKd6I1fZxFxTxT22E2AOiqywN6wTZvfI50bs9gah8UTPh42xfsmodCnvkEfFNtusMf2uLBqSbnnop8xAhvd6khceX4uRor6BGPkb4fQNqOeQM2RQpMjB7qUNTWLHppgSQmq7/sOSkmqNyIleYvICjkPd6Ew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39850400004)(346002)(376002)(2906002)(6916009)(6486002)(36756003)(66946007)(54906003)(83380400001)(1076003)(6666004)(5660300002)(66476007)(316002)(66556008)(8936002)(478600001)(186003)(2616005)(16526019)(86362001)(6496006)(26005)(38100700002)(8676002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVN3dGpDSXJiTGtKR1p5a3VuRkpkNnk5NmxzUDVid1htZ0IvTzJHMklscENJ?=
 =?utf-8?B?TTdnblV1QUxPQ29lM21mcGhaNjdQUHBPM3NRUU5DVzVNZmRKdUZQZHpJQjJm?=
 =?utf-8?B?MHlJM3NXazhLWW1taHp3dUZIUnlhRmw1SWFrdHQrVjhBbnVMWm5XWXZIdDRN?=
 =?utf-8?B?WkdTTFdnSnk0ZmU5SEYyV0hKeUdpYVlIb1dnYnZ4TFBIc1QyMy94N3dTSll3?=
 =?utf-8?B?TE4yaVgwU1YwNk5CcWJleEo1SkpTbUEwZ2FIVjVET2NHVmFuY2w4K3p0ZEd6?=
 =?utf-8?B?SlNpMWNhSE5UbU5OMUp1clduSm1BT215L1luUmtIemN5eFdST1REN1l1Vk9p?=
 =?utf-8?B?QW9kSTJxbHE3YjBKdTMzeHJXL3YvZCt5Y1R6VVNXS1FsRWp5S0RpOWp4MS9x?=
 =?utf-8?B?YjU0WVpQNnhkUlZya2NOWmJ5dzZZM0JDMDFUM2E5SW9palJDeHhRZFE5eEsr?=
 =?utf-8?B?UWJxL245R1pGN3BILzJtQjFqZkZTZFhzQ1FxRXdCVVVubm5FMTloS2NVQXdK?=
 =?utf-8?B?UG9iTG9NR1VyNjVnRE9nTXNBaVJ0UW5CNE1CM0EwNGhES2JOa2tCeVIzRGdq?=
 =?utf-8?B?K1lhWm1VUVNyY0xIR2FDcEVvbHNzNFBUZVZuTHJEZ2hHbzV4TkF1ZW9YNkJk?=
 =?utf-8?B?ZmdIckJYRjlCWDArbkFnbHFiblBzdytaRnUvMU5FaG5TcElhdnlWa0NIWkZh?=
 =?utf-8?B?Nlg0VGZuaXZ0UzUvY1RMblFYRGVvM0lFMGhUcUFYWm9acCtrZEFhQW8yakVs?=
 =?utf-8?B?Z1UwUTRVRkdZQWZVWUJyK01NamtrWmRUbTVsemJDb1AxdDVnT3NodS9Xb3l1?=
 =?utf-8?B?RU1tQnVyVXhvbTBuWVFOVjFmNUtPOHFsYzFVbGdaaU5vR3JIcmhJS1NTTkY0?=
 =?utf-8?B?Rmo2TThiS05sWGJSbXJ0MUVWU3AwcFFSV2N1bzgzOHZwaFlxNyt6bkFYY3V4?=
 =?utf-8?B?R2lRYXR1dnRXMHdOU1NmalR3dXUzQlVId3djVUFLQVZ3c2VwbkRHT2N3K3l1?=
 =?utf-8?B?eW9VL1FRdU9DMFVhR0JaenUzeEpScDA0cC9obVZEcGovazlIVGNmd0U1VDhL?=
 =?utf-8?B?ZDNBR1ZSdnFzSmF6aktlSjNBcEsyU0ZsOTlnZTlDcUtRaU5iOEt3Yjl1RDJO?=
 =?utf-8?B?b0V3UmNPUHhRZG0zL0VuaGtiMmlTWXh2NGRpY3RaMjdmZ2hjaXdpemZ2dlNG?=
 =?utf-8?B?djJ1MzNkenQwT3N0dXFGT0dJMG9RRU9aUGdQc0w1WEdwNzFWRnAwR0dtL0c2?=
 =?utf-8?B?S2RGNWFqcWtGZS9nRXJvcUdhdHJ0Q1A5a0RCSjVjMWpGN1p6OW5uYWh1WUx6?=
 =?utf-8?B?UXd5ekpOcFBnbVhBSEtHWU9wNVhaeTJNdlA1c1hlR2RUQXRYYlFHd1d2ZHk2?=
 =?utf-8?B?azB4MjRiaytaTzZSaWUwVVVuNFNZYkNYVjhScllnM1NTZGE0OVVqbEhTVys3?=
 =?utf-8?B?QzF4Y1J6dHZhME9nSll2eCtTOFIvODYyYVkzWkRiSTRXRjBEWE90Nk1qZjBE?=
 =?utf-8?B?RnFvcUt1dHV6aWxKN3lmRnRnV3doZHVxZ2RnVlQwZjRCWXRYVkswUk1rWkFu?=
 =?utf-8?B?U0ZSUlV2UUlkZENHR3N0VG1yVk1RdGMyQmdHRTREMkE1d3dzdTY0MTVIN1NX?=
 =?utf-8?B?WUNvWFQ4OGR3THlJelZDdWJIamdYemhqKzRXSEdZK2kyeUpXNzJhSkdWSW1m?=
 =?utf-8?B?aUpDYVBIWVhuVlU5QkxQRGtZK3VHU1N4YTZhSzFYdU9rT3lBTVdnMHQ5OFhC?=
 =?utf-8?Q?tWa9A5Qo8YGm1jpajKo1NhuRTf3Ash3SVOGFl9n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 921b7890-1c3a-4d82-4348-08d8fe84c01c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:18.7221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWytHuSaQZneGV5Bufk4+EMLRnRy4cHiOKQFthuuoWuvQQoHH56B4e8WU8yNenR/Zy2EaNgKXT7t/HZoE/07YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
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
Changes since v1:
 - Always return -1 on error from xc_cpu_policy_get_system.
 - Only print detailed error messages if err_leaf or err_msr is != -1.
 - Rename idx function parameter to policy_idx.
---
 tools/include/xenctrl.h         |  4 +++
 tools/libs/guest/xg_cpuid_x86.c | 54 +++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 1aba814f01c..187df5c5d2d 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2596,6 +2596,10 @@ typedef struct xc_cpu_policy *xc_cpu_policy_t;
 xc_cpu_policy_t xc_cpu_policy_init(void);
 void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
 
+/* Retrieve a system policy, or get/set a domains policy. */
+int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
+                             xc_cpu_policy_t policy);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 8e3a1a8cbf2..78fbc7db9d3 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -678,3 +678,57 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t policy)
     if ( policy )
         free(policy);
 }
+
+static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t policy,
+                              unsigned int nr_leaves, unsigned int nr_entries)
+{
+    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    int rc;
+
+    rc = x86_cpuid_copy_from_buffer(&policy->cpuid, policy->leaves,
+                                    nr_leaves, &err_leaf, &err_subleaf);
+    if ( rc )
+    {
+        if ( err_leaf != -1 )
+            ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
+                  err_leaf, err_subleaf, -rc, strerror(-rc));
+        return rc;
+    }
+
+    rc = x86_msr_copy_from_buffer(&policy->msr, policy->entries,
+                                  nr_entries, &err_msr);
+    if ( rc )
+    {
+        if ( err_msr != -1 )
+            ERROR("Failed to deserialise MSR (err MSR %#x) (%d = %s)",
+                  err_msr, -rc, strerror(-rc));
+        return rc;
+    }
+
+    return 0;
+}
+
+int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
+                             xc_cpu_policy_t policy)
+{
+    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
+    unsigned int nr_entries = ARRAY_SIZE(policy->entries);
+    int rc;
+
+    rc = xc_get_system_cpu_policy(xch, policy_idx, &nr_leaves, policy->leaves,
+                                  &nr_entries, policy->entries);
+    if ( rc )
+    {
+        PERROR("Failed to obtain %u policy", policy_idx);
+        return rc;
+    }
+
+    rc = deserialize_policy(xch, policy, nr_leaves, nr_entries);
+    if ( rc )
+    {
+        errno = -rc;
+        rc = -1;
+    }
+
+    return rc;
+}
-- 
2.30.1


