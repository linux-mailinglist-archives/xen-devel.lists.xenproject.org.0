Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F0376443
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123960.233953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyK3-0003kk-OW; Fri, 07 May 2021 11:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123960.233953; Fri, 07 May 2021 11:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyK3-0003hH-K4; Fri, 07 May 2021 11:07:07 +0000
Received: by outflank-mailman (input) for mailman id 123960;
 Fri, 07 May 2021 11:07:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyK1-0003Kd-EV
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:07:05 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7635f833-24cd-44d3-b015-a594af157653;
 Fri, 07 May 2021 11:07:04 +0000 (UTC)
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
X-Inumbo-ID: 7635f833-24cd-44d3-b015-a594af157653
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=41gCcCU9e+JnlIhloGR5SydFBIlo+duLNASfJYuUK20=;
  b=FNwfgpIMIWdg/roSyxH9L4gGsD4m9TCPP7dEmBCTmyY3x3n3g6E/aPlY
   r10OAEgG/MixRgDJqYYEqi9VWxnWJlpgOlCa9qXuotr3HAg2N1G6NM7gQ
   ov+TGZy9e92HxxcJ+9GzR6xXwuD0zdpyN7E4oRnWoF+YNxA9Ij5gxGv+5
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Jyi1DOdmM5VRxq7JvscwCSqhYN/ret+O7+iU/hNmm2OVbYY3v3y/0mvtDlfukQQYusrMZgqUrP
 2XjsIvzxSeUkV9940qfR/VRuaDiE8Hj8FpJJlm6NTAQ0vC7G8zqobPhtcaf+bkkQ3KvZh0o48i
 AYQGQw4avSd2M+YN6UrDQQZaLF7OGmOn3T05AeSw2xuInuXgHOtYQ1rvuAvFxoqZAjF+CiSP5C
 YedQUhv/kYxaboFsvV3lm6Xdll28Ve3y3XoFBH7V5PgovlhRmd1SuD6GUjCzP5ZhRxj7viC766
 kqg=
X-SBRS: 5.1
X-MesageID: 43678467
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AhWnyKr9vHU6BBSU4iranfwaV5sZL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ki90dq7MAjhHP9OkMIs1NKZMDUO11HYSL2KgbGC/9SkIVyGygc/79
 YrT0EdMqyWMbESt6+Tj2eF+pQbsb+6GcuT9ITjJgJWPGRXgtZbnmVE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29LOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6d030Woqqu9jJwPr3NtiEnEESutu9uXvUiZ1S2hkF1nAho0idurD
 CDmWZlAy050QKqQoj8m2qR5+Cn6kdi15aq8y7lvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjesgMfrsplWI2zHzbWAcqqN0mwtQrQcZtQ0XbWLfUs4lkWU7xjIcLH4tJlOK1GkXKp
 gdMCiH3ocpTbqzVQGogoBA+q3SYkgO
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43678467"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEDFK8KY3HK8vtTwJ82fAQ+Dn3nGKiart75Tto7tuZ4o9cMshnilVbLfFTLeataXxofkdNndJh5HY1iw0TVspcSAhAsr3rfUMFqg19LvnO2wNa2wfd2WfFC1GKhBtjQCyM1OtxR4cO2dNLxoY0MPQ4RMEXzbJFyXmFN27l0fh1qXr3EyvLDgwCCzZvVQ0nQzTa3rM07Q06thw8+SnW3igJ5RNskXzc0lY7ppGvRulfsBzOqbT0CdWtt3+Wpo1413rv1FK5BbprH9YGQi8MawTs1g8k/65Vw98eGEwYJXgii3CC2uGd0NrFV6UoazXrlFepQxEeFEwcrk1l7GWQmN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6y66yUxlQCuDtTKUVE0naL1zKUgsBlYMEUqArZCk+0=;
 b=HJTfbB6QyFwl8v8/ogg6w+rOqd05aSTLbiy0O6gvz7pRtv9gdlYi3+EJMqxSRsbhoyoFp6rUCIL1sx/5SxAMFm5EJjTD0HutakUYYfHCQ7pDUvh/61WZJdp/OJ1ytD38ef6bnH8HCofo1b8rP2VzKZpRUboWNtEfiDYEcIN9gDIdrDD9xXVVh0LzpFrlMo16QeyNMl071OCWMt6ektyIZA31w/OLGFEX28RBuFEkABeXEIS+G0z89b5g74gYDUU+bsQTk7R6aYXkCIUKZ+byQdc0C8LwdsNQN8w7FSiwGKEL4GyNVGCqUHMxKaV8rsMeLE8do3Bo5GVFSkcMhVwdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6y66yUxlQCuDtTKUVE0naL1zKUgsBlYMEUqArZCk+0=;
 b=nN0oeOsZfMEXjzHD5GgXtM0IOGCoHGUAYJfAMNZQoJSSyPxVSnaxvQbBV9z18eY7AqhZqcVpMMrrzob3hpP7607x8JM4m67thuoXloEu9L2xGO1HrFckNItgSaJ3TlZdc+rd7Aom5mU2OQJaSBLewdl8jgUAFhiFNk8QEk7b+H0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v4 03/10] libx86: introduce helper to fetch msr entry
Date: Fri,  7 May 2021 13:04:15 +0200
Message-ID: <20210507110422.24608-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d63b2104-3c98-4d8d-78f3-08d911483cf3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4475B3AF9D901A90077FD83B8F579@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fLTYR7VAYF6vSGYm6LkCqeim9ofqX/o4hrAOZC5351Bkzd1DFwMvEourJeqWSraE1PHUyAte79lwra51hJFlJtszWHPZvNdkXLcFvlmQHNP5toY2OOgmY/qjNo9/a/Ro5bbO+wp4ie7mlaY+tZLw6kv615vfY3CbxRUExIGAA7FiUVk4prqo9wOHetMJeTy6t/VApNznl0uqAvuUun3yHzUV6WPdHG18PKbj4Ru510uEZmWYuYgiLghxwSasJNwrADDjKdQ8HGsJj8Eka5nJI8TS6k55/wiSi0ARjkQX/+kxcj07LdQ7mAJKhfMR/4aRqMNhpkRjKoYTV47dzdkUftih7/rXxzPTXWvLe2ByJDdy+oOmEyEiQSA2o3S3GYuxx8sThiEOg+G3lbpa1Vmv/NxQAtmoojZRhHmluMcNYuk6mDGkF4U3iV5BJXKExfE5WIJxFa2iv37Z+OuOD9ocY28aP+7rzIfrwQYckftpMJiv3zrHoFl5tHjR26kLhOZotmMnlWTDrO0X3y0d5X9dwYVRvhKo+3uU8+h0laie/KCtlrSSUMgbEm0JJ2r4HE9geuZlZ1XYCgKevCw9to9Ue/ZHf0Id+cYYf0EkqVr4evTXcPdEj9JX7eg/JUKKoh+dgCxEtMmkb3FtGHCIukXy4g4wr5VqyGENzLb/47pbOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(8676002)(6496006)(26005)(66946007)(5660300002)(66556008)(66476007)(83380400001)(478600001)(956004)(1076003)(6916009)(316002)(38100700002)(54906003)(6486002)(2616005)(86362001)(8936002)(36756003)(6666004)(4326008)(186003)(16526019)(2906002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SzZ3Tm41NGViTjA4UUliYzBRV0hScjJ2WWFUTFgzWExOSit4N1dJSjJPc2sy?=
 =?utf-8?B?UXBldWlzNGZHamNqTHBUN2Z1c3JJQlRhczBOWEVjQ3hSMFA0MVl2T3BNMU12?=
 =?utf-8?B?YmpJWXBnWFozY2p2blFPREJHYlRJdU9QWEpXVlRWd2lhM0ptNmJ2UldDWERr?=
 =?utf-8?B?OWNGMmx0bHpPdzZkTlpzbEtvVEdxalhDUGRyVkpGdUZOZ1YyWlp4bEZlcDZV?=
 =?utf-8?B?TzNHNGFESU5yVkRtaWgvZTdtWjlwNjdoR2tYRWZWa084YmxhNUg5Qzc2YU8r?=
 =?utf-8?B?K1RKdG9oZ0dYS1Y2ZTJ0dE84dGxxUlhXaXFidTFFWXJyRS8vZXBXNkZaUUR2?=
 =?utf-8?B?bnVTNkFnTURwUVFwY2UxRjdCV01vR3FvYXFTMkdjU0VlaU1HbCtNM2w3WHEz?=
 =?utf-8?B?Tm5GdUh5NDVsYU9ITmxhaCsvbGxXNjdrS2hjWEVOZnlxcUhUOFRzZjlBckts?=
 =?utf-8?B?WnhSRWdrdC8yRkwvSWZnL0JhWWJ0endCbEplNUJwMHZjUFlMeTlNblpyeVVO?=
 =?utf-8?B?dk45Z0trNFA4a0svSDl6ZmM4Wjdoa1lnSGZqa0F2dHpsWTAraG9UczJDSnhj?=
 =?utf-8?B?UCs2eHlnd2xST09taE1sdzh4RDMxYWhKQ1J0ekM3ZS9LZ0RiZ2cwcGNBR25X?=
 =?utf-8?B?ZnJXZnVlVVk2YWRmeGFaZEhiVTBFS2dzUHBBVWVnazBXY0o4aDdERTBLUHBK?=
 =?utf-8?B?U3UwUk9haWlkb0NDZGFJb0VLcjRuS3U3dlVpL1VLZjc4ckYyVmhuREpLUWNt?=
 =?utf-8?B?QUNvUzFDTEZMNGVSS3pIVjN6U09UcXd1Vm9hMGVJYkVCYkc2Q0NMR1FweE0v?=
 =?utf-8?B?Ylg0bWNwQWRXb3ZnMGlLZnVXUHZ3N2RjZk1Jdlc3L0R5NHQ3OERzazRKRUJM?=
 =?utf-8?B?S2p1SERCL3dtN2w0QWhZV3gvUFRYNjVlN2xHV29UTWpyMFQwR0xpVW5aNXNG?=
 =?utf-8?B?Zk5NQzl0eXZVNzViOWM5RDdZTTZxaHpVRkZod1ByWmdVUS82S05TYzA0V2RQ?=
 =?utf-8?B?SENSSTA0NWZyVmQybERpU3lscU5BY3BBVFlFeG1SRTN4T3J3MmtvZkRhY28x?=
 =?utf-8?B?cXA2TjJNbGJkTWVIRlVYY0czWldPZnRNRDJ5RVcyOXNVdERuRHFJTUJBSS9a?=
 =?utf-8?B?aFZDanFQMEE5Y0lxNi9YUno0UW9qSGZicjUxdEtuTjU0Y2FrVzBLTFZ3YS80?=
 =?utf-8?B?WStmeTZOay8yeHBLZXN6cjN5SXd4RUUvaUdCcW5IU2hobzd3MEdCRkNIcHBY?=
 =?utf-8?B?cHArTmRFUTRYdmlOYmxreUFWbzlHNm9xSXc0aFhMdkpaRHE4NWpSbVQ0MDdE?=
 =?utf-8?B?NW51eWorYzZJZS84Y0pHdnp1Sy9nVXJ6d0F0d1Y0ZktvTERDQ2pUQ0VFdCsw?=
 =?utf-8?B?cXdPNlJlV1VRdlNFcUhGVlNld21FcVZUUFVHN0RHdnE4c3Uvam1aZ0NXazZD?=
 =?utf-8?B?VDFqVXFNSWJLREpuVG0vdDNOMloyL0JUdmVvUlFBZG9mclFNcXByejJXYUlB?=
 =?utf-8?B?M3E4c2RVNWdHY0sxb3dkSVhHM0hncnFSL0NNQWMrWjdVd1hPWVVQRFMwcjhw?=
 =?utf-8?B?bEJjb1RyWWVBVlBRb2tzYXZGbUNyNC9IQ2N0dmdxS2RvakJzck9Hd0p4OWZV?=
 =?utf-8?B?QlZXNDNGdi9jMFFSSkpNbFZJT2I1Sy9NcGo2ck1pL0JjNUZsbWJBbWdqOXFI?=
 =?utf-8?B?M2pkSTF6WmJoRTJCRHVWeHN5bjlSZGlDZmJxckN2VkFRMHFCTXJsalFCTkxs?=
 =?utf-8?Q?0jZpzPDs4one0c+/y5rwuHQBpD2XObrqQKFnZkW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d63b2104-3c98-4d8d-78f3-08d911483cf3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:07:00.9543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9wg+0jwBTtXn9ER+EzgzyXGOOmDjbLhmZEAd8SuDWccrzQoRYEab4i/sTipZVV4Ca4PJjWZbnABxLeZHOUziQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

Use such helper in order to replace the code in
x86_msr_copy_from_buffer. Note the introduced helper should not be
directly called and instead x86_msr_get_entry should be used that will
properly deal with const and non-const inputs.

Note this requires making the raw fields uint64_t so that it can
accommodate the maximum size of MSRs values, and in turn removing the
truncation tests.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - New in this version.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 48 +++++++++++++++++++-----
 xen/include/xen/lib/x86/msr.h            | 19 +++++++++-
 xen/lib/x86/msr.c                        | 41 ++++++++++----------
 3 files changed, 75 insertions(+), 33 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 81de9720c8d..854883fbb39 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -389,16 +389,6 @@ static void test_msr_deserialise_failure(void)
             .msr = { .idx = 0xce, .flags = 1 },
             .rc = -EINVAL,
         },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0xce, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0x10a, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
     };
 
     printf("Testing MSR deserialise failure:\n");
@@ -744,6 +734,43 @@ static void test_cpuid_get_leaf_failure(void)
     }
 }
 
+static void test_msr_get_entry(void)
+{
+    static const struct test {
+        const char *name;
+        unsigned int idx;
+        bool success;
+    } tests[] = {
+        {
+            .name = "bad msr index",
+            .idx = -1,
+        },
+        {
+            .name = "good msr index",
+            .idx = 0xce,
+            .success = true,
+        },
+    };
+    const struct msr_policy pc;
+    const uint64_t *ec;
+    struct msr_policy p;
+    uint64_t *e;
+
+    /* Constness build test. */
+    ec = x86_msr_get_entry(&pc, 0);
+    e = x86_msr_get_entry(&p, 0);
+
+    printf("Testing MSR get leaf:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+
+        if ( !!x86_msr_get_entry(&pc, t->idx) != t->success )
+            fail("  Test %s failed\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -864,6 +891,7 @@ int main(int argc, char **argv)
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
+    test_msr_get_entry();
 
     test_is_compatible_success();
     test_is_compatible_failure();
diff --git a/xen/include/xen/lib/x86/msr.h b/xen/include/xen/lib/x86/msr.h
index 48ba4a59c03..9d5bcfad886 100644
--- a/xen/include/xen/lib/x86/msr.h
+++ b/xen/include/xen/lib/x86/msr.h
@@ -17,7 +17,7 @@ struct msr_policy
      * is dependent on real hardware support.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
         struct {
             uint32_t :31;
             bool cpuid_faulting:1;
@@ -32,7 +32,7 @@ struct msr_policy
      * fixed in hardware.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
         struct {
             bool rdcl_no:1;
             bool ibrs_all:1;
@@ -91,6 +91,21 @@ int x86_msr_copy_from_buffer(struct msr_policy *policy,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr);
 
+/**
+ * Get a MSR entry from a policy object.
+ *
+ * @param policy      The msr_policy object.
+ * @param idx         The index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * Do not call this function directly and instead use x86_msr_get_entry that
+ * will deal with both const and non-const policies returning a pointer with
+ * constness matching that of the input.
+ */
+const uint64_t *_x86_msr_get_entry(const struct msr_policy *policy,
+                                   uint32_t idx);
+#define x86_msr_get_entry(p, i) \
+    ((__typeof__(&(p)->platform_info.raw))_x86_msr_get_entry(p, i))
 #endif /* !XEN_LIB_X86_MSR_H */
 
 /*
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index 7d71e92a380..4b5e3553e34 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -74,6 +74,8 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
 
     for ( i = 0; i < nr_entries; i++ )
     {
+        uint64_t *val;
+
         if ( copy_from_buffer_offset(&data, msrs, i, 1) )
             return -EFAULT;
 
@@ -83,31 +85,13 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
             goto err;
         }
 
-        switch ( data.idx )
+        val = x86_msr_get_entry(p, data.idx);
+        if ( !val )
         {
-            /*
-             * Assign data.val to p->field, checking for truncation if the
-             * backing storage for field is smaller than uint64_t
-             */
-#define ASSIGN(field)                             \
-({                                                \
-    if ( (typeof(p->field))data.val != data.val ) \
-    {                                             \
-        rc = -EOVERFLOW;                          \
-        goto err;                                 \
-    }                                             \
-    p->field = data.val;                          \
-})
-
-        case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
-        case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
-
-#undef ASSIGN
-
-        default:
             rc = -ERANGE;
             goto err;
         }
+        *val = data.val;
     }
 
     return 0;
@@ -119,6 +103,21 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
     return rc;
 }
 
+const uint64_t *_x86_msr_get_entry(const struct msr_policy *policy,
+                                   uint32_t idx)
+{
+    switch ( idx )
+    {
+    case MSR_INTEL_PLATFORM_INFO:
+        return &policy->platform_info.raw;
+
+    case MSR_ARCH_CAPABILITIES:
+        return &policy->arch_caps.raw;
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.31.1


