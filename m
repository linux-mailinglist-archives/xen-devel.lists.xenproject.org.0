Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C28376446
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123969.233989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKN-0005ZL-1H; Fri, 07 May 2021 11:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123969.233989; Fri, 07 May 2021 11:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKM-0005Vp-Sa; Fri, 07 May 2021 11:07:26 +0000
Received: by outflank-mailman (input) for mailman id 123969;
 Fri, 07 May 2021 11:07:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyKK-0004jI-Bh
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:07:24 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0c0e2fe-2e4b-4ac0-add2-deba8a8c49ac;
 Fri, 07 May 2021 11:07:23 +0000 (UTC)
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
X-Inumbo-ID: c0c0e2fe-2e4b-4ac0-add2-deba8a8c49ac
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=t57/ixwUki9bA5ay9uC2e1ZSSlVDTWnCzfy83CT1KWI=;
  b=cjilg0uq7HyTFE6dFoRv90P8m6jP9ib+gBgLeqsJajLt4/wnFj6TV43i
   vXHvuesBiCVhU+b8OE65jtjKKhgCzgjMkhtFqoLpKN272tn7CoVquSP61
   onk+XZ775x4w2V3n5T2sdWtuxUbehr9k7K9+CEuoKawo7tZwxaRN2Wph6
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qGDFAcDFgm/sItkJgbJlWxBnHS8sQh5BU0nuZEXQ2/BK52qUIzURyAA2jR4/J2+a632WmT3oT/
 AesPYv35r1nfyuocTc6BCzYPxjIjPCrhemlJvwBQFpJPiGZSoIk9HaYluHHtBZ/gySXW7azYZh
 ovlQEjSGIETLP8Brr66Z+7orkQng565sQ34Qld7rqeg0k+KnSk4rZQEwIkYVe1Zcfr/7PIEFh3
 ihq7nW3e3vjrpRj7nqlrxUuWFC5nvgXddYgskCtxaR4khERvpNz34OB4MG4EegS2xAOSfB1X5m
 wks=
X-SBRS: 5.1
X-MesageID: 43403575
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LIgl8K140I0oRdy59ZU15AqjBYByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4exoS5PwOk80lKQFqrX5WI3PYOCIghrNEGgP1+rfKnjbalTDH41mpO
 1dmspFebrN5DFB5K6UjjVQUexQpuVvm5rY5ts2uk0dKD2CHJsQjTuRZDz6LmRGAC19QbYpHp
 uV4cRK4xC6f24MU8i9Dn4ZG8DeutzijvvdEFI7Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl55+kr+qwxnbnpiDuBtVt6ZXcI+l4dYyxY/suW3bRY8GTFcZcsoi5zXEISSeUmRMXeZ
 f30lMd1o9ImgnslymO0GbQMk/boXsTAjbZuCOlqGqmrsrjSD0gDc1dwYpfbxvC8kIl+Mpxya
 RRwguixuxq5D777VDADuLzJmZXf4uP0AkfeOUo/jViuEslGcpsRKkkjQto+bs7bVPHAbEcYZ
 tT5ZvnlYhrmHuhHgDkV0dUsaORYkg=
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43403575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxRfu4w3h0ZZrzPVF6oKFTfyGZW4ANJAE8TIFNS9LkOGMZkfqNyba8H5av/kn/aMFqEs/P1KoY36cNlTB0nocuJrGFPx+9CTw1G9PCHsTMdrgUgszSvHZ2LAZN/d2ordhKpzPqjptPXUBmb4G6kvRTAQV5N77UNf75pi7ktXNXt1sfPri7CcR7rYMda9OzyJYlv7NQnn3SRMIzJNUySicwFiRxEW2m68yXPEr2SHmqRqXPNamFrStqiSbP12zyI6INziFN4kYTYShrHB8ZhavVRS+UygGy34nrPYfU3/e+dz0Il5dTPZxdPG+5VQgdtosItySFM4IUa5CTHit6CjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNLcteEg52/2FZe+Swj7NwnygUOC6JFeRCiZi3dQW6s=;
 b=Ua2vYJCR5wOMfeovySQRhKmGZWIbHhNl4k/gfLkavL+T4Yem6FIfP5lqWYuDVX+NX4q1ZSBGFe9BB5vHhogjpwDTmwkWz+OioVatbpZpQIHmrSRO0SfLqRaPespec+O/j7Rbheh4S+Pk8AAMsabk+EalThAKii+U8G8j7EleCU5u+bMJsi9iY2Z91ZjH6gdnkjEPY9lXqoowoWNoARzkqgw4gJC5mPtO/RAeRdFVZVTAWwzlM7L+keZliEvRFfzGvXGoou43V44Z8ru6wU90C2nhAfqob6aUvy7bvKp05Rv6+eEbUuzizhBWcafEW7Aw68eYer5xpjksZP9aLdgZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNLcteEg52/2FZe+Swj7NwnygUOC6JFeRCiZi3dQW6s=;
 b=iqVgg4aDLQd2k51ckx9ReRwlnQvui8oBph0vVoAMW2cgz12gpA5yc2xOwsjwaGwratVgJY4/aBk+fJSaljXlOLbIbKqjEQGIBW118zoqSvtOhm41vIMR83qUAAeqltJkwRs/jaBydb0m+TKd4N7bkNr3twGgxv3PIwcJzmJi9B8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v4 06/10] libs/guest: introduce helper set cpu topology in cpu policy
Date: Fri,  7 May 2021 13:04:18 +0200
Message-ID: <20210507110422.24608-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e316ac50-33bc-4c4c-1eb9-08d911484850
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB44752050858E4E31CEB3E8308F579@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5/6rjML9zy/FQ6tNvLhI6DttyGBiloW5xNAAh3EKyT14vOTFjfBZp3G4IvtiO7saAsS1nvQScUhy8HVqPH9R87+evndX1cT2sLIo9nUbVd7ba6EckzeoXV3olRQftS7zfCitKFQThh/STwyrFOL7Nc2tdqoK1jeRcgEWFM5omlTYnui4PkvwL7pN+GXX1z3QqmztsQJnsdTwRo6LiXNMgvLHqzqnf6/aec2pzjArRVdDWFpx6M87g/TriDvQ00bG8AUikcEuj1qU+DRtBCp6AuceKehHlId7n/dORN9WmTe4ui7p9hQmAwcUbl4avURJIfMcpkceuRBtDb4rlCOtAMDU7t5gxcE/lv49YU5D895pDu7KHCBh0Ln4UWzNDdkbyRMNwkL4avxusAn5aPqp6uaBy/aR65Uc7v9ZWP+Gb1YykV0geDqsFSEA2Og3TYyFNK7CKIBTmPOOD8gnxqdrvTxEaolhKXILStB1WlG3lg+5ID4yAvO2P8RPJy4gl5i+SRIaud5FVGlC82IjVOuOpiQog0nPfgOcjBMG9SNi1esVZLPOPTuxH0r9c6k4CbT1o40SlKxdsvjXyWxnQpyUqLOeuTamdO6gp42Kjs80bs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(8676002)(6496006)(26005)(66946007)(5660300002)(66556008)(66476007)(83380400001)(478600001)(956004)(1076003)(6916009)(316002)(38100700002)(54906003)(6486002)(2616005)(86362001)(8936002)(36756003)(4326008)(186003)(16526019)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MmlRL1VZVUdmeHlsU0NzSk9FS1YrM2FXM3lldjg1ZDQ2R24yYlJPbUFOMlZX?=
 =?utf-8?B?UFpUbWY0NVRQRTVWR0tXSUJvSkhISzB1dG53R2doZFdTZVZyNndVNzdndzha?=
 =?utf-8?B?UVZRcVZmWUMyczJXOVNQU1lqdG1qRU1raVpWTFJObjFRRm9GU0VuZ25VS1lI?=
 =?utf-8?B?QU1nYk9MNktFVy9Xdm1laFVic3U0ekYrMVpXRHJWOWRxcTBwR2xUdmsvWG5F?=
 =?utf-8?B?WHRBcGlsOUNST1pINHcxOXJuOXA2QTVNWW51TURiRVVhbWJBMzJnSkpRUkdV?=
 =?utf-8?B?eDlYMzM0a3ZqNStZbW52VlZPVFFLcXNqc3dlcjJJYjNiQTJxWkNTNmU2dm5n?=
 =?utf-8?B?NE10Ky9EclFUMHRSQ2t4cUJmay83NUxKTkJtK2syT2d0UlA1Yjl5MFhkQ0ZF?=
 =?utf-8?B?cXZKZEt5RmY1WGNXdEpXV2JFanNIY1RVMWFMRHJsWVFVTENzY2xMdVRURlNT?=
 =?utf-8?B?OTBhZUpDbkdheUo3QlhBY1hoMkcwZUdNOXZEWkNJbUk0c2ovNXlDUk5meU4x?=
 =?utf-8?B?L1d3dXNzVDIrektwWkxLTE1JNi82VGVhYTN1cUZVWWNEanJYeFNtQkp1OERP?=
 =?utf-8?B?ZS9kakdGRlhjRkF3UVV1UG9vT3lLL1IxeGFjWVM4enJtUVZFZTQvOXA3Y1Jp?=
 =?utf-8?B?d0QvSVdBM3FOdnI3aW1IeTZyY3ZHZEVETmF2OTU0WmNmYTVIYVJxaUFIMDhG?=
 =?utf-8?B?T1djTG1FU25CVnZheEdTVEhQSFArWkpQS0NwS09PSXE1ZllpYUNOVkN1ZWNO?=
 =?utf-8?B?dkh3dWlUUkJJNmErSURBeENhL0NuNzN0VWRmTEFhM3h5MEx3ektiaHBwSHp5?=
 =?utf-8?B?dm1Sc2xvQmNXUzdHVjAwYXJ1M2VLSUxaSkFpNkt0WTNTZm9EaEF0Z0JBWUsz?=
 =?utf-8?B?RFZ1V3RwZVMrcGxPWVpyazJiSmFpR2lNQURYMDMyR0tmZGxjL1BaWmZEYnVY?=
 =?utf-8?B?OXlCQzluVE5oVTI2bkZUSTBZamFxMFdFQjFRVzFoQ25Ub2IwTmRVT2g3akgv?=
 =?utf-8?B?Y2l4Wk04RmdLNkRHcEs4dkNtY3VJRDJFWnJPaUpFOUwrRUl3TkdJRFgxOUNo?=
 =?utf-8?B?Y1pzVi9uZUNXZWI3L2dGWENqSWFoOHhKcFlqRDVHUnhMdGhCdlRrdU1CU2NE?=
 =?utf-8?B?UkJEM3Q4a0QvZFVwWkdGQzNWSTg2Nyt0anh6TTRtVThCSVhKNDZ0Y1JTYnJQ?=
 =?utf-8?B?ZjBLaTNzYjc0TXpIeXFHZWJNWkZPa1NLUnRyKzBHWS84a2MxVXl0b0p2dTZK?=
 =?utf-8?B?RWZnS01VWWNHOEZzTHFrajIwQVMvZEFzZEIwYzYrQXZEYld6ZkgySFNFaTVh?=
 =?utf-8?B?OHFGTXAvQm91aTRKV1ZFZzMyZ3FaN2ZGUTlEcUVuc2oySTJGYUNYQ1UyenFl?=
 =?utf-8?B?WUlpWTdXc05IbFlxT2tzZ1JxdTV3YzFvR2hZeUE0OGpOSEh6ZDBCVGNQSkNs?=
 =?utf-8?B?OWpqVUtNR0RVbWJrZkp6WjJMOG9UTXFzbGJ2NlNQblZERDlrdG5LVUZpZTFr?=
 =?utf-8?B?U0FSeTRhVmdZYzRzYlJRRElUVHN3MHEyUTBLUy9OLzcwdTRuN3JtOE5CZTFv?=
 =?utf-8?B?aVFZTFdFWU9TRTR1Y1ZGNHhEMXdlUW5TUEIyVGVPYzdPRFpTWHpNWmd3Q0lP?=
 =?utf-8?B?dHluVzR1ZDA4Vnc1UGVXSC82dlZjbEx1MUgrUGZlSUNqV2FPKzl2VWtONEJL?=
 =?utf-8?B?dng0TUtmNGJhaTRtbzJJcy9PNVY5ZDV1ZFdUVElkOFN2L3AwMlJYbmdwVHYx?=
 =?utf-8?Q?WulZ533t3M4I8CEPqOAw2Benli9wTfGZMxdmQy5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e316ac50-33bc-4c4c-1eb9-08d911484850
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:07:19.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdGm4fyEJdqKZwxigS956n9Srmfl9QH5ZbtGqZl1Wa+yf7paMNgzavY1+Genjv1hkmPU0EDQouKM2lsATSoDmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

This logic is pulled out from xc_cpuid_apply_policy and placed into a
separate helper. Note the legacy part of the introduced function, as
long term Xen will require a proper topology setter function capable
of expressing a more diverse set of topologies.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 - s/xc_cpu_policy_topology/xc_cpu_policy_legacy_topology/
---
 tools/include/xenguest.h        |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 182 +++++++++++++++++---------------
 2 files changed, 103 insertions(+), 83 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 576e976d069..6fe01ae292b 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -758,6 +758,10 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
                                    bool hvm);
 
+/* Setup the legacy policy topology. */
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
+                                  bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index fccbc54a400..2c89c59cccb 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -438,13 +438,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 {
     int rc;
     xc_dominfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
+    unsigned int nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
     struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -467,22 +465,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          (p = calloc(1, sizeof(*p))) == NULL )
         goto out;
 
-    /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
-    if ( rc )
-    {
-        /* Tolerate "buffer too small", as we've got the bits we need. */
-        if ( errno == ENOBUFS )
-            rc = 0;
-        else
-        {
-            PERROR("Failed to obtain host featureset");
-            rc = -errno;
-            goto out;
-        }
-    }
-
     /* Get the domain's default policy. */
     nr_msrs = 0;
     rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
@@ -566,70 +548,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    if ( !di.hvm )
-    {
-        /*
-         * On hardware without CPUID Faulting, PV guests see real topology.
-         * As a consequence, they also need to see the host htt/cmp fields.
-         */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
-    }
-    else
-    {
-        /*
-         * Topology for HVM guests is entirely controlled by Xen.  For now, we
-         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
-         */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
-
-        /*
-         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
-         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
-         * overflow.
-         */
-        if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
-
-        switch ( p->x86_vendor )
-        {
-        case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
-            {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
-            }
-            break;
-
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-            /*
-             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
-             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
-             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
-             * - overflow,
-             * - going out of sync with leaf 1 EBX[23:16],
-             * - incrementing ApicIdCoreSize when it's zero (which changes the
-             *   meaning of bits 7:0).
-             *
-             * UPDATE: I addition to avoiding overflow, some
-             * proprietary operating systems have trouble with
-             * apic_id_size values greater than 7.  Limit the value to
-             * 7 for now.
-             */
-            if ( p->extd.nc < 0x7f )
-            {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size < 0x7 )
-                    p->extd.apic_id_size++;
-
-                p->extd.nc = (p->extd.nc << 1) | 1;
-            }
-            break;
-        }
-    }
+    policy.cpuid = *p;
+    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
+    if ( rc )
+        goto out;
+    *p = policy.cpuid;
 
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
@@ -949,3 +872,96 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
     xc_cpu_policy_destroy(host);
     return rc;
 }
+
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
+                                  bool hvm)
+{
+    if ( !hvm )
+    {
+        xc_cpu_policy_t *host;
+        int rc;
+
+        host = xc_cpu_policy_init();
+        if ( !host )
+        {
+            errno = ENOMEM;
+            return -1;
+        }
+
+        rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy");
+            xc_cpu_policy_destroy(host);
+            return rc;
+        }
+
+
+        /*
+         * On hardware without CPUID Faulting, PV guests see real topology.
+         * As a consequence, they also need to see the host htt/cmp fields.
+         */
+        policy->cpuid.basic.htt = host->cpuid.basic.htt;
+        policy->cpuid.extd.cmp_legacy = host->cpuid.extd.cmp_legacy;
+    }
+    else
+    {
+        unsigned int i;
+
+        /*
+         * Topology for HVM guests is entirely controlled by Xen.  For now, we
+         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
+         */
+        policy->cpuid.basic.htt = true;
+        policy->cpuid.extd.cmp_legacy = false;
+
+        /*
+         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
+         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
+         * overflow.
+         */
+        if ( !(policy->cpuid.basic.lppp & 0x80) )
+            policy->cpuid.basic.lppp *= 2;
+
+        switch ( policy->cpuid.x86_vendor )
+        {
+        case X86_VENDOR_INTEL:
+            for ( i = 0; (policy->cpuid.cache.subleaf[i].type &&
+                          i < ARRAY_SIZE(policy->cpuid.cache.raw)); ++i )
+            {
+                policy->cpuid.cache.subleaf[i].cores_per_package =
+                  (policy->cpuid.cache.subleaf[i].cores_per_package << 1) | 1;
+                policy->cpuid.cache.subleaf[i].threads_per_cache = 0;
+            }
+            break;
+
+        case X86_VENDOR_AMD:
+        case X86_VENDOR_HYGON:
+            /*
+             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
+             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
+             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
+             * - overflow,
+             * - going out of sync with leaf 1 EBX[23:16],
+             * - incrementing ApicIdCoreSize when it's zero (which changes the
+             *   meaning of bits 7:0).
+             *
+             * UPDATE: I addition to avoiding overflow, some
+             * proprietary operating systems have trouble with
+             * apic_id_size values greater than 7.  Limit the value to
+             * 7 for now.
+             */
+            if ( policy->cpuid.extd.nc < 0x7f )
+            {
+                if ( policy->cpuid.extd.apic_id_size != 0 &&
+                     policy->cpuid.extd.apic_id_size < 0x7 )
+                    policy->cpuid.extd.apic_id_size++;
+
+                policy->cpuid.extd.nc = (policy->cpuid.extd.nc << 1) | 1;
+            }
+            break;
+        }
+    }
+
+    return 0;
+}
-- 
2.31.1


