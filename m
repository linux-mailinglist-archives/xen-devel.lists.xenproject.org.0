Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F473380AB9
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 15:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127355.239342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYD1-0004I0-Mj; Fri, 14 May 2021 13:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127355.239342; Fri, 14 May 2021 13:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYD1-0004FT-J1; Fri, 14 May 2021 13:50:31 +0000
Received: by outflank-mailman (input) for mailman id 127355;
 Fri, 14 May 2021 13:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6p66=KJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lhYCz-0004FG-LN
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 13:50:29 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d260cf7-2d2a-4e01-91df-7053fb5422b7;
 Fri, 14 May 2021 13:50:27 +0000 (UTC)
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
X-Inumbo-ID: 9d260cf7-2d2a-4e01-91df-7053fb5422b7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621000227;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=AHbYOkcy9kIAQ0eSbuae9Vtd8wItzsZRRWfrgcnuRwM=;
  b=WgjS+mtj7Xn6RIeW+8iH0UkFp7KPvhV2gBgy+ZWMiw7IpSKRJYA6IrMt
   hnk5+eqV78bC4Y6iR0sCDKp7Vxc/uN4bfGqmosmByjxAaBF0GKTj3h31V
   MZgDpYl6n5DM35wmFzyEscZIh4t+bCm1oCFxA2YyVcVwPfT+s1Cf2QVL/
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jSDKHFZxzm0DRZ9o5cjJEYV4IvsDTi41a7Oi0RsbjfnP/iFnPWGq3LGkNsyqFD0S3I20pvaKZ+
 82AHTfwZ7JBsqtZrxk4I9jwe642/X4LUWkdtoGobx0K4oXc8fJjQvVuWucn7/Qk9ZhNFgfLf4Z
 GuDAyI0NoHDVNlrj/VFarLUREHviDXzBDJQ4Ni9sMpTEAC8RMvUollUIwtxltGIKUGNNCK/Dvs
 Hyc3E9RSqE2L+x0UdFcvSPG13O9Ir3Td3DkYuosukE/omIOzutnZWwEfwvG6YHP10k5uurnRqn
 eXA=
X-SBRS: 5.1
X-MesageID: 43804762
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:eDm6r6s8vK+FabW3I5EL2xq/7skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-IronPort-AV: E=Sophos;i="5.82,299,1613451600"; 
   d="scan'208";a="43804762"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuJ1ZiMuYx7HIJoWtb5STZGijngnZhMIhEXNEXorD+dG9gBgKhC6D5mYCvhyhnscaV76cEzwFBbgtnLgZXdSxujAONnlcrBG3dE0IsK93JLByt2TJ+G/WSKaLTvPJgJqTnl68ttXm+H0CIDcgChzPamA/0ZV18+tO/c+iOmdTufFYJjpoCdbPWVkpli4bULILl3k9tQ8W2CXbasGso0R3Morg0sQQj+0hoW/Ph+pBrkccfqrxzAcV/0NsWhfEW0V6fhjVdvI5ielZ4ebfyFmI36SoNykVS8woriSS5IDy9rgNbTXoSdfzv0RzIIXocgsYTykKo/cfVbenWzQLaC5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW6BBD0PtckF53M/0IbS19dxoVxv8BX67XijzZUAxD4=;
 b=f4Il/l3fiXbj9tjj+PFKf5KDoOVU+8NzbKPh/ucmy/OmKqPH66mnEjjc7re1Fjvxv9LMsqbEGUXyoQMtALI4EsDNT3OST6Axgr1JXuJOdoftpdVbuIaY74tAVXnXQe9h7+7QjMGhXHkLdLJlfIYxHIuDYw9syhyggG6hGYruoKvrg12gwBa87YgmQUlVkx957Eu5mh+29WeOTn7z5Vt56Nq8WfleP8EypHklW/MdmNqZmaX819MVeh3vwTHyzok87yBhfIKmcGbJbJsrR4diANdg4Q8NSIq6Q1XO9XPWD9gM8T9Z74u0ct7LR/ElPPDDcUvrtk7F3nh2ThJZ9JA7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW6BBD0PtckF53M/0IbS19dxoVxv8BX67XijzZUAxD4=;
 b=Q3566cpx3neFGaUeelX8hEMwi+b+iLBc3k39ERS5LuVXa8rEqPd1MJNyAG/5dUIYxSlkKdPf9BwHdgYn74NafJ6cs9wTr0UA07UGhngGowKVTkxLqu/rLDlFAWVTZjvZlb6Jfzk8D9Syb6UpS0GtYVxMDtMFbbO81dvFcPTWg88=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] libelf: improve PVH elfnote parsing
Date: Fri, 14 May 2021 15:50:14 +0200
Message-ID: <20210514135014.78389-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e81be80e-3b9b-448c-95a5-08d916df391b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4970ACBDB38679280792F2AB8F509@DM6PR03MB4970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kdCD6ifDwAeQ+kZtJtQervnKYQBKdoM7HNTgc8twV5/1flSO4a6BzsLGhZ87nUGuw2QGq3VtB077VMyFjUGTarwLXYIrM1sEmrT6Q9ySTF8h/BrN+iGqEIc4sptBpvvaa+VPeyf0m0uhiXIeD5S18HmxezClyCnyJgerW8+Q1d/KozRL/H5/LVACTd483QK8+ORdhIWT9TZ0DmRk4xJ0cbx1aXAV8lBjpcRhFLbN4upb8cPIUnfYm6MklhcSwYnjwfdgcwULmLUrX8/7TByuVIwGuUO5HSGRw0f1wbXT7G5yYIDohGBUw97wXBH7+gdJO5V01rvwulXFpibIABKZZjm0Oi1+g8lVIsu6AVAu0NugNA/333O7yqr2gA9gCQ0ULCN9s7T/pXpOGqPZbTThkUOiuH3olPwugkuMzYaXHQa/pCSRX2MAmPmr4KQ0sNWnmSmZnQpeo8Hwq72SYGSuW3loZtnXHHWf4k5jhbnWSTS6vbSUilTss7ELG+CjKJ4DpPnNOqa0vyzc0hjLhFReNzi5P3iXzQTdFkWcB0UDaPGDMqnzhi/wwV/8ePvu4Xd0u4+mJjjCVl4584kzq2QQyPD6UnO7WQho3ETQPlMYSFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(8676002)(5660300002)(6496006)(8936002)(2906002)(956004)(2616005)(83380400001)(478600001)(26005)(16526019)(316002)(36756003)(6916009)(54906003)(66556008)(6486002)(6666004)(186003)(1076003)(66946007)(38100700002)(86362001)(66476007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?amdmYWg1cFRCdTBTMFlJeGZ3a1hhdkRMNmZuTVZtK0tZVHNtQ3ZQL25xQitY?=
 =?utf-8?B?K1VIbVcxUzdaWlNtMVViMUJ2MkhVRm1iUkxPdG5PRzVuRlpOR3pHWGE1VzJl?=
 =?utf-8?B?cWVtZEJEbmJwU09DM2xkK3BOMmV1dXRmdk40dERTZGQvUm9vR0xBTXF6WjFC?=
 =?utf-8?B?Z3p0czN1eHBoTFdPR0tCNDZJR0lDdGIxaGErakg5Qmh6Qmk2cm5GYUNmdUNh?=
 =?utf-8?B?eENrcm5NRFdIbGkzdHJVaWFsM3FWczgyUmxXZjJpVUlMNVArUzhNS2F1cGZZ?=
 =?utf-8?B?UWdUR05tS0V2UFZZYldVNTUxOW94SEVHcWFtWEpHMjVCOG8rcXAxZTdaUkEv?=
 =?utf-8?B?L0hyaHVQbERTay80RlZ3K3RxOGpsTzNyMlM1RjhMMFJucGdkNEd2cnRCMC9S?=
 =?utf-8?B?S1htbmNicld0bTVkeVVVUzk5Ny8xbjlaTU11WGdwSm1pdjZRMWxPeXMxY2Z6?=
 =?utf-8?B?a1BlQWlIcGp6MTRoVmZDdVNLQng3eHh1WWxqSzZSL0w1TnRsdWhzWDVGU1hF?=
 =?utf-8?B?YzVCWEwyd3UxUkZ4Z0hGdnVZYjM3aThYMHdIQjBGd015QXRyMDFrZWZNYlRO?=
 =?utf-8?B?dGVwcVA4WEdRcXdySG9vaEZvZ0NwdDlsdEZqcmY1RVkzQXNIcm4vK043NUZv?=
 =?utf-8?B?ako2T1g5cFRoRWgrVC9EdEpyWW1ZVGlTcG85eWI4M3NlUE5wbmFJbXZsdVhz?=
 =?utf-8?B?ZkVQaEVaMTJVbDJ3R01nckVzcXJJcm9LMys5UEtaTDNvVXVBVlJYa0FYL2d6?=
 =?utf-8?B?dzgzSVJ1cWRlS0p2RTUrVzIvY3crbjNYUEhYbnpZaThZQWt0RHN4SzV1akZn?=
 =?utf-8?B?TzJjOHUzQTVycGtIZ3lrSGs4SGpUeUhRNHZpR3NMOFlkUnAxRTdjbmNyeS9Z?=
 =?utf-8?B?VUZVQXZSSnBuUzdDWm9rSlFmQms0WjN1c0RMYUFJMlB1L1pWODZYREQ1cEQv?=
 =?utf-8?B?cG5KdmhBMUVCd3JUakE2QnNPT0RhRkpWRnIrbUJKVWJFRHplYTV0NTcybTlz?=
 =?utf-8?B?N2NpQnhIa096cjl3MCtMRmZaNW9TcFRzLzJ3K1RFbklxNXROS3pPdkZNcFpm?=
 =?utf-8?B?QkdnZDl3WHVISDIwQWpJQmxxWWNQUlprQkxocFlXTWd5UlROaG1GWndSVDJ0?=
 =?utf-8?B?MTNETEJwKzQ0K0x4YlcxdEpBQlJYNjA1U2J4Zno1WUtsV0VWdTAwOTRhNU1D?=
 =?utf-8?B?SXE3Sk5vVVVaVXprTElWTWsxaHBnQTY3UUZ2SEtrTDRuY240cnFQeXZ0S3Q5?=
 =?utf-8?B?YlVKRzU2RXBOMFI1TXpGdlVzTnJ5ZkVrbnVyRUI3YnhPSk45UFZDKzAvQ3lB?=
 =?utf-8?B?MFJ3ZXV0R2I2dEJUQ2w4UVBwZzQwckU2N0h5Y2xVcHM4K2VseVNwV2ZnWVZC?=
 =?utf-8?B?eUFzU0drUjBBNjdSbE9JSFVvVnZQc3Z2a1I4ZmxPcG5HSGEwYW5xYTgrSFdW?=
 =?utf-8?B?SXpKVzQzZnp3d2p0aStZVFFGaU53WVZ6aTNqTCtVeUdvRlFHbFNsK0ZqYklp?=
 =?utf-8?B?RnVJRWRRbjRIMk1SSFkxRG9DVkFJek1tS2RLVHpia0U2dXhSZ25WYTRKT1or?=
 =?utf-8?B?SnpEdXpxQWVCY3p0bk42R3E3WTVCWm1iRlRDS3FSSlFKSXRTcnVBWlpSQ2ln?=
 =?utf-8?B?eEJPTk43VnVtVTZNdk1WVFZsQSsvNGR2TmRFc3RQU2NTTWJPUXhJRUNhSlJq?=
 =?utf-8?B?SlRpazArS0YvaytDZ1RubFNncnFrOS9SbnJ6MCtLMHlxcE1LYjhjQm5VeDYv?=
 =?utf-8?Q?nzxbQMlwuuuogC2sCp3fqkhACKaY4yjnktTpA/X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e81be80e-3b9b-448c-95a5-08d916df391b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 13:50:24.2487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAH5xKCROraJhvqIxMdCTrFP0YxWV9awRdZ3PCTD4kMBvpoHAVhD2K5TbGNkEs9umh4qIp7iBpYefFaTZTdFOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970
X-OriginatorOrg: citrix.com

Pass an hvm boolean parameter to the elf note parsing and checking
routines, so that better checking can be done in case libelf is
dealing with an hvm container.

elf_xen_note_check shouldn't return early unless PHYS32_ENTRY is set
and the container is of type HVM, or else the loader and version
checks would be avoided for kernels intended to be booted as PV but
that also have PHYS32_ENTRY set.

Adjust elf_xen_addr_calc_check so that the virtual addresses are
actually physical ones (by setting virt_base and elf_paddr_offset to
zero) when the container is of type HVM, as that container is always
started with paging disabled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/fuzz/libelf/libelf-fuzzer.c   |  3 ++-
 tools/libs/guest/xg_dom_elfloader.c |  6 ++++--
 tools/libs/guest/xg_dom_hvmloader.c |  2 +-
 xen/arch/x86/hvm/dom0_build.c       |  2 +-
 xen/arch/x86/pv/dom0_build.c        |  2 +-
 xen/common/libelf/libelf-dominfo.c  | 25 +++++++++++++++----------
 xen/include/xen/libelf.h            |  2 +-
 7 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/tools/fuzz/libelf/libelf-fuzzer.c b/tools/fuzz/libelf/libelf-fuzzer.c
index 1ba85717114..84fb84720fa 100644
--- a/tools/fuzz/libelf/libelf-fuzzer.c
+++ b/tools/fuzz/libelf/libelf-fuzzer.c
@@ -17,7 +17,8 @@ int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size)
         return -1;
 
     elf_parse_binary(elf);
-    elf_xen_parse(elf, &parms);
+    elf_xen_parse(elf, &parms, false);
+    elf_xen_parse(elf, &parms, true);
 
     return 0;
 }
diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
index 06e713fe111..ad71163dd92 100644
--- a/tools/libs/guest/xg_dom_elfloader.c
+++ b/tools/libs/guest/xg_dom_elfloader.c
@@ -135,7 +135,8 @@ static elf_negerrnoval xc_dom_probe_elf_kernel(struct xc_dom_image *dom)
      * or else we might be trying to load a plain ELF.
      */
     elf_parse_binary(&elf);
-    rc = elf_xen_parse(&elf, dom->parms);
+    rc = elf_xen_parse(&elf, dom->parms,
+                       dom->container_type == XC_DOM_HVM_CONTAINER);
     if ( rc != 0 )
         return rc;
 
@@ -166,7 +167,8 @@ static elf_negerrnoval xc_dom_parse_elf_kernel(struct xc_dom_image *dom)
 
     /* parse binary and get xen meta info */
     elf_parse_binary(elf);
-    if ( elf_xen_parse(elf, dom->parms) != 0 )
+    if ( elf_xen_parse(elf, dom->parms,
+                       dom->container_type == XC_DOM_HVM_CONTAINER) != 0 )
     {
         rc = -EINVAL;
         goto out;
diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
index ec6ebad7fd5..3a63b23ba39 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -73,7 +73,7 @@ static elf_negerrnoval xc_dom_probe_hvm_kernel(struct xc_dom_image *dom)
      * else we might be trying to load a PV kernel.
      */
     elf_parse_binary(&elf);
-    rc = elf_xen_parse(&elf, dom->parms);
+    rc = elf_xen_parse(&elf, dom->parms, true);
     if ( rc == 0 )
         return -EINVAL;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 878dc1d808e..c24b9efdb0a 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -561,7 +561,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     elf_set_verbose(&elf);
 #endif
     elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms)) != 0 )
+    if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
     {
         printk("Unable to parse kernel for ELFNOTES\n");
         return rc;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e0801a9e6d1..af47615b226 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -353,7 +353,7 @@ int __init dom0_construct_pv(struct domain *d,
         elf_set_verbose(&elf);
 
     elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms)) != 0 )
+    if ( (rc = elf_xen_parse(&elf, &parms, false)) != 0 )
         goto out;
 
     /* compatibility check */
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 69c94b6f3bb..584be0f6fb2 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -360,7 +360,7 @@ elf_errorstatus elf_xen_parse_guest_info(struct elf_binary *elf,
 /* sanity checks                                                            */
 
 static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
-                              struct elf_dom_parms *parms)
+                              struct elf_dom_parms *parms, bool hvm)
 {
     if ( (ELF_PTRVAL_INVALID(parms->elf_note_start)) &&
          (ELF_PTRVAL_INVALID(parms->guest_info)) )
@@ -382,7 +382,7 @@ static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
     }
 
     /* PVH only requires one ELF note to be set */
-    if ( parms->phys_entry != UNSET_ADDR32 )
+    if ( parms->phys_entry != UNSET_ADDR32 && hvm )
     {
         elf_msg(elf, "ELF: Found PVH image\n");
         return 0;
@@ -414,7 +414,7 @@ static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
 }
 
 static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
-                                   struct elf_dom_parms *parms)
+                                   struct elf_dom_parms *parms, bool hvm)
 {
     uint64_t virt_offset;
 
@@ -426,7 +426,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
     }
 
     /* Initial guess for virt_base is 0 if it is not explicitly defined. */
-    if ( parms->virt_base == UNSET_ADDR )
+    if ( parms->virt_base == UNSET_ADDR || hvm )
     {
         parms->virt_base = 0;
         elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",
@@ -442,7 +442,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
      * If we are using the modern ELF notes interface then the default
      * is 0.
      */
-    if ( parms->elf_paddr_offset == UNSET_ADDR )
+    if ( parms->elf_paddr_offset == UNSET_ADDR || hvm )
     {
         if ( parms->elf_note_start )
             parms->elf_paddr_offset = 0;
@@ -456,8 +456,13 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
     parms->virt_kstart = elf->pstart + virt_offset;
     parms->virt_kend   = elf->pend   + virt_offset;
 
-    if ( parms->virt_entry == UNSET_ADDR )
-        parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
+    if ( parms->virt_entry == UNSET_ADDR || hvm )
+    {
+        if ( parms->phys_entry != UNSET_ADDR32 )
+            parms->virt_entry = parms->phys_entry;
+        else
+            parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
+    }
 
     if ( parms->bsd_symtab )
     {
@@ -499,7 +504,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
 /* glue it all together ...                                                 */
 
 elf_errorstatus elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms)
+                  struct elf_dom_parms *parms, bool hvm)
 {
     ELF_HANDLE_DECL(elf_shdr) shdr;
     ELF_HANDLE_DECL(elf_phdr) phdr;
@@ -594,9 +599,9 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
         }
     }
 
-    if ( elf_xen_note_check(elf, parms) != 0 )
+    if ( elf_xen_note_check(elf, parms, hvm) != 0 )
         return -1;
-    if ( elf_xen_addr_calc_check(elf, parms) != 0 )
+    if ( elf_xen_addr_calc_check(elf, parms, hvm) != 0 )
         return -1;
     return 0;
 }
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index b73998150fc..be47b0cc366 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -454,7 +454,7 @@ int elf_xen_parse_note(struct elf_binary *elf,
 int elf_xen_parse_guest_info(struct elf_binary *elf,
                              struct elf_dom_parms *parms);
 int elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms);
+                  struct elf_dom_parms *parms, bool hvm);
 
 static inline void *elf_memcpy_unchecked(void *dest, const void *src, size_t n)
     { return memcpy(dest, src, n); }
-- 
2.31.1


