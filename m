Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3CF3694E2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 16:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116437.222246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwwb-0005Tn-L9; Fri, 23 Apr 2021 14:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116437.222246; Fri, 23 Apr 2021 14:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwwb-0005TO-HY; Fri, 23 Apr 2021 14:38:09 +0000
Received: by outflank-mailman (input) for mailman id 116437;
 Fri, 23 Apr 2021 14:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZwwa-0005TJ-9l
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 14:38:08 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc4e6413-1506-4745-a1a7-cda8a16635a5;
 Fri, 23 Apr 2021 14:38:05 +0000 (UTC)
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
X-Inumbo-ID: bc4e6413-1506-4745-a1a7-cda8a16635a5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619188684;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=4VsUgAXkxah1q5I11U+Dwr0tgAI7bZkP5I0L7aGoD0Y=;
  b=DfkTg4yhkSoX0p/kacnoHdntSqF0JxB3byfNpNtJHGvlJZWMPrdeezTN
   TJcyj0E11oiuK6oxzBkccac2iPBcwHFsy9lIrxNtT+gaW83Py3QN1zsrg
   o2fIXf7OKQj7mgDQDy7g/UuMTIKOEaEELDC9Juo2uF3G4186RDgDY6xSB
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KWY7P3Imu+Cvo6UO6nA+Oxdftr2/3m4mDUfqJ95slGE8+emu/O8aHi0t4fxh22ZSjM6qFWk/hI
 SAIGyqsFZp33VxYp9qNSBGIRprhsmW9a0WKlST+sO6+6fecHrhElRHV8V0d0EswePIARDKoiTy
 1RgWJBCYGJ7xNEqcGVfFxnTWauNmgWxPEF2XUshKcjjls+ti2gUkydlWt94iOuBMk/jwFzCeD0
 /cr57CGheoprLZif+0zw5FTm8G5sP4IaoVUgW6U5CjHlQhp3q9m0W46eYZ0L/91HRgimf20CMJ
 LAQ=
X-SBRS: 5.2
X-MesageID: 42106010
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:CI57QaDDqy6tyc3lHekv55DYdL4zR+YMi2QD/UZ3VBBTb4ikh9
 mj9c5rtiPcpRQwfDUbmd6GMLSdWn+0z/VIyKQYILvKZmPbkUSlIIxo5YHhhx3McheOkdJ1+r
 xnd8FFZOHYKFhhkILH5xOlGMwr29mN/MmT9IPj5lNMaS0vVK169Qd+DW+gcnFeYAVdH5I2GN
 69y6N8ygaIQngcYsSlCnRtZYGqm/TxmJ3rehIcbiRXjTWmtj+w7a6/Lh7w5HgjeglSyrQv+3
 WtqW3Ez5ik2svU9jbsk0va75FtlMH6yt1FJOHksLl2FgnR
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42106010"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUxRFm7d5ePcDJgnq8Y9Giej7agqBuzmCMN0Rti3MBXn9XOICHpxV4f3GQG15UgIugRSNScbRwDWUsWIuajWMr/cmmPkL/lKcDs6z16IYMFGN+eY3yD3f7mIbUo3VQuHM54WOd7DovGn+1yVcfatRV5ZShjjop8vlSIQjhy3sEE/QW4ZeIxdoXQhhKkGCopXUZIqYgQHmfKxi0eCC8lydwrHSIQ6djb0MzXg9ESaT8bSpBecwTXwBoCyh4qXmJr24SMuAOX3YKOF0Pg1VHytiPkCMRGA/VfbNI6aQia9HyyBsFmYND1FWOgaupfd0ZFuB6zQkuA5XOYXWJF3UkexGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV2St4kky+YwNOuHc+Xr4vZeI7pvLrjmyZ2S6WWsBF0=;
 b=Arsl8yJqZQDPA/yE/ZIBvu5zZN/1q8SdM4Nk/XnV1IjAbHNFcEph8UKuLYmB2sC2tzYLWQy32FE2hwo93FVaqgfSTcctIEW92jlZ6zLnS6xsDVfdDT6Y4U5U7oMQcXKcBvhfpVqJ0VrdiGlxEstmkaDZermcYPO1Zm9/IVPni3GYXTIXf3ZoGOsM1dJkdvoRkljQH/j/N2VL8UnY3eHQkXBlKRzKI1cY/c5ISKpWDApnHrCqqIsj5OCTmtfX6ZmVMfaPgYYzUnSL81IBfHa4RHqFYF+nfhZF4VrywnkU04rr1SRSZpKCnoz3o3hlxQcMmXXbdz9EXml8m1gKxpM/Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV2St4kky+YwNOuHc+Xr4vZeI7pvLrjmyZ2S6WWsBF0=;
 b=cjQMdvVqozbFS/v9ZI+uSYJQJ4aR5sYr/evqjqFMchsxRC1728sRL8HjnJORdYwtLXpv2pWmpsmfzaOL64IsCC1MIrnH2DJg+CF4aFVTvvCDDr4g2LtlsuO3xMZt6ba+3/Y2xVmtIfjN74YZPNBTkyJg6A1VQ90ehIUhuKJK0bs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/oprofile: remove compat accessors usage from backtrace
Date: Fri, 23 Apr 2021 16:37:55 +0200
Message-ID: <20210423143755.12189-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ec0d9c1-ee75-491e-9052-08d9066565a2
X-MS-TrafficTypeDiagnostic: DM6PR03MB3675:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB36756679C8FEC16C68605F838F459@DM6PR03MB3675.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3v6kc9D137Vk8vZHBHxP8iZCa95uqmpCyl+TisI5R7r69UgHXqcGknR2cZ26LtGut77hq2ZXD/gn0Vgz8eEtiZPr7D+npmjV8GTyecl0Qp7ZfKayZ1eQiCXC4AgwJvAZmZT6kEWAwnpTsOaS+oAJG9IEGyu2EwNQNNiuDKEoRfba/ASh8uCepElMxE3zl7c+BNQ+eyzZb3zpSqa2Bann+1VWFC0Fv5jLu9VoUl40nGscbolS3ukrIof7crnpPivV7tgnOAWF0zsjuBzYTtpJ/6p6qqUlEqjQMuU8FSBzC4SGQXrkc5l/+vUVwQqX/MVYYZupwI2mGW8LFtKPjEs2zHJ0z9DlmRLS3wctaYc0BT4g4kkYwQMb5L/2689Hwj7xPah3Huyx5qrtfFaAz7MCdt1uOcROTKnEiNYaX4vrzTXCTCrVSpwP80MIztWuFkCu/frHJrfBQEmVjfdT/jXlCJ9L0eI5cJF6VEv6KirVleoODR55/yhH1jJEoN2k+Pod0pvLrRblnhZ1uqV5gJI7Qvxx8ccFCcemzVHS1evKVBVgZI78ANrJT2vMqj85Mj99FR/iNpsTm2Fsk2q5T5pCL28bvNCa9v/9psQO5C6Imr0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(4326008)(86362001)(66556008)(186003)(6916009)(5660300002)(8936002)(38100700002)(36756003)(66946007)(26005)(8676002)(54906003)(16526019)(83380400001)(6496006)(956004)(2906002)(1076003)(478600001)(316002)(6666004)(2616005)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUhycTVXMFhsNlloSy8vRmMrWDR6UmlrVmZWbXZucEUxNDV6QTIxSXI0cVU0?=
 =?utf-8?B?VnlrZ1NaaWlqQk9qRFdOYzlrREg3RW9mRWZCZTVSL2dJUldJckJHMEs1QW03?=
 =?utf-8?B?Qmlrek1Kei9CS3QvR3FPckVBaFVGNGFKcjQ1VXVjUEJEUDlwd245WHRVc3N3?=
 =?utf-8?B?NXI1N1JBd3ZJNHhNQmM5QjlKaWNQMnZwTVIvbmVFU1JQTHNYd3pQR2VERjhU?=
 =?utf-8?B?cUgreXdyUTRXY1Q2aDl5Sng3V2FkV2M5bzlieGl0RzhSMVVrYXE3YmdwODhE?=
 =?utf-8?B?M2ZkTmFxTitRQUUwYnhHQjN1aHlCZmZJdHFrRUdqNkNxb0JrdWJWb2dNL3ZM?=
 =?utf-8?B?cUdwbGhRTFcrQVQ1MjQzQXB3T3JBeFdWTWU3RkxpNmgvakJScEVkYUFwSFB3?=
 =?utf-8?B?SjMrSVVPbFJpd05JNFBFY01KWVRleURrSkF1RzcvOHplNnVnZmRQVEpEalgr?=
 =?utf-8?B?WEVYcVBnTHA4a3F2RnBQaTZ4ZWNDNE0yVUtpYjNFbGZmcDVLdm53VDRnajIv?=
 =?utf-8?B?NUk5WEJmWVIveXBTOSthR053d0t1QUh2UHB1ajJYNWV3QlJPV2pJTVl3SlJR?=
 =?utf-8?B?cjdwWGp5VVdvZTFvaFFDMitIeDdnY2Z5SWVHeERLV0oxZXpTL01SZE1PZTlq?=
 =?utf-8?B?aTNBNERkekMvenNGYkFaaDNQbHpGRHl0Qjg0MGNlc1I3dit5L2Z4cEtJbFJq?=
 =?utf-8?B?TStjdWdGT24waGZycUs1QStQVVJEaWJRTDdTT2xpT0NmaDlHYlRRYnVMUE9a?=
 =?utf-8?B?N2diZEsrRGtVbW0yUGk5Lzg2ZmF3MmMzcmNZelBHYWRPVDJDbmdXdWxvbkJJ?=
 =?utf-8?B?TkRQTlVoRXBabmhFV213UnM4UGE4ZkNacDNJM3NmVUN3bjArS0h3QlhOek1o?=
 =?utf-8?B?R2lTVlE1T0lzQmJGOFNSTkx0VHlsSWtKMExOdXRLWTJPTDNCTlhDS0t4WHZH?=
 =?utf-8?B?amFxUXB2TnliK1pOYTgvRW93TjN0NE5OanIvWUgrTU54bnV1cEFnY01wbVhk?=
 =?utf-8?B?Z3BlS000YTRzTktVNThhU3U3aDZXNjJLUlVvbWNwbGJZU3lWMXYyZStFaEk5?=
 =?utf-8?B?SFBDR1gycWh1a05mMXpWL0d5S1FuVzRWU0IrSHdBdUlUQ1AzQ2NCSFZ5c3Yx?=
 =?utf-8?B?VXplb0xLdTYvVG92SVRpWjhabkJYTUdOdXIrcWxseXJIYUdqa2JuN2Vpd0V6?=
 =?utf-8?B?aVFEOWxpYTRndnJXNHB2bW1WSEVlMzRNWXVZN2x3YXRJNW9ITEFsMU9Uenl4?=
 =?utf-8?B?MjgzcDBicXdzTnFlOU05K1BRN2Zlc3lKT1d4TmZSZGNvVVpuRXFYMlhBeU00?=
 =?utf-8?B?UVBUREdtOEU3S0djOVIwWnB4VHVwRE4zb0xoNzNHcGVWRm5KTHdvQWtNYmox?=
 =?utf-8?B?U1Vsb0hka3JjN3N4SEUxS0JzeUZqQkRxVjFJVWw1WmdubVFMQW45bVBHb1hl?=
 =?utf-8?B?VmdLVUpHVmFPb2FnVXhMREUyYTJWVFp5YzIrMnl0ZjhLaFJpbXdGUTYvdXBB?=
 =?utf-8?B?cER0UHoxV2ZiUlBnOEZvTG92c3ppZkliWWIvcU5UeEhxZHNISmNYMXZrU3Vy?=
 =?utf-8?B?cWVEZStNL3VYVStPWFljRWt0TnExYWtTNUI5ak5xV1ZEQVdKQWtsbjZCcnJ1?=
 =?utf-8?B?QlVWU0dhT3JSSDYvR1R0Q3ZuOFRWOXZoMS9pbjVKYVkyWnN4SWc3a01ycUZq?=
 =?utf-8?B?TkhrUWViazFIQStpWXpXVXpjblNITnZhYU80Q2RTM0FmdG5NRnl5V3BibE55?=
 =?utf-8?Q?XK+LUaLSInDPimtBj2bCBuj/ekky8/VesapUlhh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec0d9c1-ee75-491e-9052-08d9066565a2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 14:38:01.8143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsBDftCT/vOeyCSrNQHHNp6FQ/ers18s50lc1jOET0yicIkqrnqY7a+M7ZAT5B6w0OdSuem2J8s5JcCgRuP/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3675
X-OriginatorOrg: citrix.com

Remove the unneeded usage of the compat layer to copy frame pointers
from guest address space. Instead just use raw_copy_from_guest.

While there drop the checks for the accessibility of one struct
frame_head beyond the current one: it's not clear why it's needed and
all the hypnoses point to dropping such check being harmless. The
worse that could happen is that a failure happens later if data past
frame_head is attempted to be fetched, albeit I'm not able to spot any
such access.

Also drop the explicit truncation of the head pointer in the 32bit
case as all callers already pass a zero extended value. The first
value being rsp from the guest registers, and further calls will use
ebp from frame_head_32bit struct.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v2:
 - Expand commit message.
---
 xen/arch/x86/oprofile/backtrace.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/oprofile/backtrace.c b/xen/arch/x86/oprofile/backtrace.c
index bd5d1b0f6ce..45f7fb65fa2 100644
--- a/xen/arch/x86/oprofile/backtrace.c
+++ b/xen/arch/x86/oprofile/backtrace.c
@@ -20,7 +20,6 @@ struct __packed frame_head {
     unsigned long ret;
 };
 typedef struct frame_head frame_head_t;
-DEFINE_XEN_GUEST_HANDLE(frame_head_t);
 
 struct __packed frame_head_32bit {
     uint32_t ebp;
@@ -43,7 +42,6 @@ dump_hypervisor_backtrace(struct vcpu *vcpu, const struct frame_head *head,
     return head->ebp;
 }
 
-#ifdef CONFIG_COMPAT
 static inline int is_32bit_vcpu(struct vcpu *vcpu)
 {
     if (is_hvm_vcpu(vcpu))
@@ -51,7 +49,6 @@ static inline int is_32bit_vcpu(struct vcpu *vcpu)
     else
         return is_pv_32bit_vcpu(vcpu);
 }
-#endif
 
 static struct frame_head *
 dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
@@ -59,34 +56,17 @@ dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
 {
     frame_head_t bufhead;
 
-#ifdef CONFIG_COMPAT
     if ( is_32bit_vcpu(vcpu) )
     {
-        DEFINE_COMPAT_HANDLE(frame_head32_t);
-        __compat_handle_const_frame_head32_t guest_head =
-            { .c = (unsigned long)head };
         frame_head32_t bufhead32;
 
-        /* Also check accessibility of one struct frame_head beyond */
-        if (!compat_handle_okay(guest_head, 2))
-            return 0;
-        if (__copy_from_compat(&bufhead32, guest_head, 1))
+        if (raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)))
             return 0;
         bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
         bufhead.ret = bufhead32.ret;
     }
-    else
-#endif
-    {
-        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
-            const_guest_handle_from_ptr(head, frame_head_t);
-
-        /* Also check accessibility of one struct frame_head beyond */
-        if (!guest_handle_okay(guest_head, 2))
-            return 0;
-        if (__copy_from_guest(&bufhead, guest_head, 1))
-            return 0;
-    }
+    else if (raw_copy_from_guest(&bufhead, head, sizeof(bufhead)))
+        return 0;
     
     if (!xenoprof_add_trace(vcpu, bufhead.ret, mode))
         return 0;
-- 
2.30.1


