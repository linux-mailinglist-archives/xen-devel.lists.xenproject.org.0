Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E9B365AD7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113740.216748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr3h-0000d9-LU; Tue, 20 Apr 2021 14:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113740.216748; Tue, 20 Apr 2021 14:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr3h-0000cj-I5; Tue, 20 Apr 2021 14:08:57 +0000
Received: by outflank-mailman (input) for mailman id 113740;
 Tue, 20 Apr 2021 14:08:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr3g-0000cR-7s
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:08:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddb82d75-6ff9-43e5-bd6a-4cf67b44f785;
 Tue, 20 Apr 2021 14:08:55 +0000 (UTC)
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
X-Inumbo-ID: ddb82d75-6ff9-43e5-bd6a-4cf67b44f785
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1YjGdwTNtoZj7OvoOgutGPaBGPvE/yQ1k7kXOxMCAs8=;
  b=KkTSZ/OhuLcz+f/23iGHbhmO9+TXhvlgJiXggPhZDd3C4oJtL5CCIWTy
   RHs4TQLOaYtJgflqxHwHmJ9UwbzYzHJL+IEc4yaYLOS//ThhxiNcVRqsN
   kt3/OT43OwltxojbxjMMqQkomuTkHU6KNq46OsMrdKQhao9LEUxVtxYue
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QhJvt58VNhF1drcMyv1Tl7Hk7420yPKTAydDwuBKPh88dCgTsVF/euOWPQsjvm3yWLrR2cYtCz
 nhMOrKQY0D0NskY8uccSvVTxBfqgKGkN+pclRgAYbe8pGqkfLvM/epbPmHlB87GKjveLot0p/D
 ANruQM4waN37/eGXQXsOpI4VNzBnBS63gC05JsyrhzFMYGzwM7m3XvVLL4HbqQVJCN+UPCZP1o
 tYSkLSTCvvIiQLEOx5rT749LVAm3eribLcNlEY3qz/PiDFwGJpmSCtwaXdSrZxgW5uxA2AhNjr
 ECw=
X-SBRS: 5.2
X-MesageID: 42111179
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QLGRPazTso1KVNMovattKrPx9uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr385lp7Y4NeYqzRQWOghrMEKhOz6vHhwfhFSr36/JH2c
 5bGZRWJdXsATFB4vrSzxK/F78bruWv1ICNqaPgw2x2TQdsApsQjTtRLgqACEV5SE1nKPMCdK
 a03cZMqzq+dXl/VK3SakUtZOTfu8bN0KvvfB9uPXUawTOThjCl4qOSKWn64j4iVVp0oIsKwC
 z+vCHSoo6itPy6zRG07R6o071m3OHP5/EGKMiFis0+IijhhACydO1aKsC/lQFwms6DwhIHl8
 TNvgcBMq1Img/sV1DwmzTB8U3B1ysj8HDrw1PwuwqdneXJAAgUJuAEoKAxSGq812MQ+OtS/Y
 gO4kei871QNh/ElDSV3amxazha0nCajFBnrfQelBVkIOwjQY4Ul6Mz1mVPHqwNGSrrgbpXa9
 VGPYXn6PFafUjyVQG+gkBfhNilXnEEFhybWEQ1usuMzzhMnHxipnFovfAiog==
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="42111179"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GT/vE97SZCfSo5ls6UUxgS2n17EjPxDkFKkbEOEvWUmJOHOMHeRhjgfoAVmvOETRxbvkyDFxibAdlJ2cYD5kpc7Q8DXmAdNXjCiRzn3caQUgd5bZ/u8GNFz1eH3sCH61Np0Lx1omOpIAsQIEWcDmvtTOBYpVJUg+8DZiAcRRBnLgNbF/rGWR4KDt7NNRN5h6Q3EsIsZEPUOl7nHV1NI4fCSPJ4q+vFdbSv06d5MgyTRavIrra01Q8w32o5E+DgPzoS4xnWQhuj8g3UCaZC+DRm2wbXnzB2vcxMmpz5DP3z9t7ijEyIL0jAyIdH38d2G74b22ceC9waVXIR3z3ks7Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9VslYPt+uT7gUV9+DwKKs51FNyfg40GHzoCjQgtUVQ=;
 b=khuzIwRn4YpRoN0+OHUe1QF/hmXKyenCzrxlNQ1IdfETa0okZiIEkvHlfrDNTHZHdpjr7b9FCymELs3kYC1iAAN2dyHlWYVRtn2K49j+hdAD9QjG81JpT6vLlKEwntoojfPF7upIFdkx8mSddpwayPp28/sjXRe05dOA7eoZKk0nE9F4NH67Wdiwiz/RCA6LeVuf1pF6Ty8UdMen8TtgNPbC7qzhycVpggEfDuwzTXM11eCAlMhN0BJbBBTZHVg9jZ9pOqKxQlpWah/eUq35B/goqGElfmZ0HUhawomIyXB30e/n+MgVlEwVI39b1pUCk+nmtTEKCg91zHpEGcaDDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9VslYPt+uT7gUV9+DwKKs51FNyfg40GHzoCjQgtUVQ=;
 b=fo4aTdMXXcn6AV8dMtko5WEgUmHAjX5ehzJ2BFJhf5tHx2o3l8ZRyXCs5JHB+zAMPbz37VfQurrfWk2nrK9lptJAOIDYF/o/cwXIotjTGBZ0TrMWRXnvtitz8FGr8momdpRsSR136qeciJrqU04GWNjNa9ugc9wmAyQe+HCBJgo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 01/12] x86/rtc: drop code related to strict mode
Date: Tue, 20 Apr 2021 16:07:12 +0200
Message-ID: <20210420140723.65321-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0969d9a7-70b5-4d29-cb40-08d90405d341
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3068601D90687BE2A19EF9498F489@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDoFW7+qTsSKrxxQOL/i6N0pSVOtL0kmXl1Tt0ITTz6qm3XorLU9CiX6Yn4atuSHV3aE1zam6t+04OEgBamLurQvEfjs74wVaQi8LXtKAOl9XjgtCJDrw6cakCbXbbCZUKDiR9lBA0eVSlVIJF17MbmFnouCkF4E1yGxrlWFPdfUbBOZIxivw5u3E+pH9bH+w1u5BodNVZikXwvaHd5rH0miSIM1TsKUT5J00qWbQM7x6HfNPe9vc5NzS23Fu5f9/R5tESQB8TGR3uNQmZCnyFoJd/eaPZrLySRMhdiwBQAjS3FHcSkZh67/OVP/E9/wv94J3K6MpwE+8QzB19qZWFPtQ6PMSCQx9oon69HU84upboRxPGsImfS8+FAdDgyVIE3Y94o3N4OtwSNfurhdwAEzKnw11u7rCAMA5s7j/fWxgMD6UybarFR6mXHwBBodqvx8rD1w01TEQIxzstpkPqQh6L95Ta+c5LMCV94dQRfjXPLdqZ5q+UZD+xKD67rCM+mQxkFY5UILG+8SajZ7Z+RIWKgQeAKc7lVAQCQHp7D2igfMEOLo2EgoMcfMFrdNUE6ZM2tCcO7WmJW2jVUoDrG1BaS9QKEQqvz88ooD+gs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(366004)(136003)(396003)(54906003)(316002)(2906002)(6486002)(956004)(1076003)(38100700002)(36756003)(2616005)(16526019)(5660300002)(6496006)(83380400001)(4326008)(8676002)(26005)(66556008)(66946007)(66476007)(186003)(8936002)(86362001)(6666004)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0k3NEVsc0RVZkxIUTdOa0F2WnZLZVdPbVlMZ1kyQjNFZkdpL05NR0hNVGtR?=
 =?utf-8?B?UVpNaUFUR3pDMk9oaXBUcHhDK3NoTmNwdUttWHdMMkNzdWFuUG1lcXh0cDJB?=
 =?utf-8?B?ZU0vZkdzVjBRamtyWUVYS3BRRSt5NTdsYlJvU01yYjBQNTloUDNIbitEVGdC?=
 =?utf-8?B?TGRYTm9yeGtMMFJrT3BLRnJOM0tadU5YWWpsZHNTUzdVbk1mTnovWWpiV0l0?=
 =?utf-8?B?NmhTQUlPNk1oQlZCSTl0OHNCeWhpdnpDUzc4TndJbEoyWjI0dlg0YWJvcita?=
 =?utf-8?B?UVhEekxZbkFsOUdOdW5tUUxjRDVxb3lldDhsSEhOVVE5SnRQUmFydUZwN1p3?=
 =?utf-8?B?VVdhRXFVNU1Sc3NWZldURUZza2hZQ2tlZGUxc1JnTm9OT0J1UWtITVFBRVF5?=
 =?utf-8?B?ckZlWFdEMk5oR0NmNDFvS0tEbURqK3NJdStrLzlqVGN1MXhvWTZ5TE84U0F6?=
 =?utf-8?B?RVJNcjRwQVRsNVBUYTFJc1hFc05CNDZwV0oyd3dmNVNGK2k4RUVya1VEK2Vi?=
 =?utf-8?B?aWZza2ladmZMeXROQmVod0ZHQjZYbFZQRzZ3cFVmRmtGOEE3L041WGM0Y3RT?=
 =?utf-8?B?OTRzZjVrSXFSR3FXam5qT3ArU3pmVlVhTWlpOUtwRG9VUzdRMzNyTUd0Nk9T?=
 =?utf-8?B?OFI1TEt5aXlOUmo0QUxneElyRjkrK1Ixb0VFclJhRXEvdzJKcERGVGozMjFG?=
 =?utf-8?B?ZU4xMWo5TFIycDRVcmVCTDNHR2ZIdTlEcmQybzI0eDNFbDh1K1d5RDh5Yzg2?=
 =?utf-8?B?dktpRFdkV1Y4b1VrZmViaWhSZWgwV0JOeUdpTkxpaGxjbERKWkJnOVRKSXZP?=
 =?utf-8?B?Q0w5dm41MFNCS0w0cE1IM2VnY0VHVE4veE4zcWJxeUlMZmJkaERsZlgyNlJT?=
 =?utf-8?B?M2srb3p6Z3FiRVMzR0lickl1bi9NVXRZZjRsUEI3Yll6V1h0czhXNlkzTTZr?=
 =?utf-8?B?bytMNGh5RmJzYWFtZVJtejhBZW82ZDB0Y1M3eG9qamtNdW5rdCtyZm4wT3RF?=
 =?utf-8?B?NHo1anJHL2ZrNzJKQkowZm5RZDhYR0FQZTVMVzk1MWpDbGJPMXZ2aXV6RVRl?=
 =?utf-8?B?QjFpWXF0aVM4dDYyYzU2NjNabml6VG4xTk8zcTVZWThTd1dLdEZlbVhQYVZS?=
 =?utf-8?B?c25BbVFWNkpINGxubGZxQ0MrejRqWlFLeXhWRGFOT1NWcVBvb214VzRMRjZq?=
 =?utf-8?B?WThvajNzOEszT3piR0VVZXBtYkxPZVBSUEJQRmpmR2R5WlAya3BtTHVldTlP?=
 =?utf-8?B?TW15R043NHRMTi85L3dKWFhNNW9Dd015c3lrVVRzUzlYd21GZkF6R0FEVGZl?=
 =?utf-8?B?ZXRaQWFCNEgvajcrRFEzbFhicmJaTi8zYXFTa2JwRy9WWm5mTkl0VURnRGlh?=
 =?utf-8?B?RXNYKzk5LzFHQUllRngwKzRHR3BCV3ArQkhINmppRUVubnFxRW44RDZKaFRS?=
 =?utf-8?B?OTEzOVJpMVVwc2hpKzI2NE5zeEgyc2ZtMlhsVDBvWTUrcnFQUzJHMGxFU3gy?=
 =?utf-8?B?U1pWYTlpMTEvcDhPR0ZUY2NlcW1RK1p3OC9kUGpIUDY5NU4xM0dVaitQZjZj?=
 =?utf-8?B?UmlEV0E0RDludExRTWsrSDgwbGpEOFBZQTZhUjBvMi9tU3Btd0hxc2FVU09R?=
 =?utf-8?B?VGZZSEUydkdSRmJQUVVPSWVzbk4xL0owdFlaSXJqeTNJL1dEM3JGRE5TZUxW?=
 =?utf-8?B?TWNkSUpVR1gvSzFlUUVZUEJUdjh3TzJlbUgwa0pQZ2JabWRLWDJvRmVJY1ps?=
 =?utf-8?Q?Yt/G4WVKJctFahBQkj016c3y4Fq2CuemsOKyYPZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0969d9a7-70b5-4d29-cb40-08d90405d341
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:08:51.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hUEwkHVCbS+DN21Owg/yNpVk7aphjulWaIApHxm3brexNiKIOFZZNaNylNufcTnhCuLLYE5+5n5ws5TIE3R8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

Xen has been for a long time setting the WAET ACPI table "RTC good"
flag, which implies there's no need to perform a read of the RTC REG_C
register in order to get further interrupts after having received one.
This is hardcoded in the static ACPI tables, and in the RTC emulation
in Xen.

Drop the support for the alternative (strict) mode, it's been unused
for a long (since Xen 4.3) time without any complains.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Further changes in the series will require that no registering or
unregistering of callback is done inside of the handlers themselves,
like it was done in rtc_pf_callback when in strict_mode.
---
Changes since v3:
 - New in this version.
---
 xen/arch/x86/hvm/rtc.c | 27 +--------------------------
 xen/arch/x86/hvm/vpt.c |  4 +---
 2 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 3150f5f1479..9992595c45a 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -46,15 +46,6 @@
 #define epoch_year     1900
 #define get_year(x)    (x + epoch_year)
 
-enum rtc_mode {
-   rtc_mode_no_ack,
-   rtc_mode_strict
-};
-
-/* This must be in sync with how hvmloader sets the ACPI WAET flags. */
-#define mode_is(d, m) ((void)(d), rtc_mode_##m == rtc_mode_no_ack)
-#define rtc_mode_is(s, m) mode_is(vrtc_domain(s), m)
-
 static void rtc_copy_date(RTCState *s);
 static void rtc_set_time(RTCState *s);
 static inline int from_bcd(RTCState *s, int a);
@@ -64,9 +55,6 @@ static void rtc_update_irq(RTCState *s)
 {
     ASSERT(spin_is_locked(&s->lock));
 
-    if ( rtc_mode_is(s, strict) && (s->hw.cmos_data[RTC_REG_C] & RTC_IRQF) )
-        return;
-
     /* IRQ is raised if any source is both raised & enabled */
     if ( !(s->hw.cmos_data[RTC_REG_B] &
            s->hw.cmos_data[RTC_REG_C] &
@@ -74,8 +62,7 @@ static void rtc_update_irq(RTCState *s)
         return;
 
     s->hw.cmos_data[RTC_REG_C] |= RTC_IRQF;
-    if ( rtc_mode_is(s, no_ack) )
-        hvm_isa_irq_deassert(vrtc_domain(s), RTC_IRQ);
+    hvm_isa_irq_deassert(vrtc_domain(s), RTC_IRQ);
     hvm_isa_irq_assert(vrtc_domain(s), RTC_IRQ, NULL);
 }
 
@@ -86,19 +73,7 @@ static void rtc_pf_callback(struct vcpu *v, void *opaque)
     RTCState *s = opaque;
 
     spin_lock(&s->lock);
-
-    if ( !rtc_mode_is(s, no_ack)
-         && (s->hw.cmos_data[RTC_REG_C] & RTC_IRQF)
-         && ++(s->pt_dead_ticks) >= 10 )
-    {
-        /* VM is ignoring its RTC; no point in running the timer */
-        TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
-        destroy_periodic_time(&s->pt);
-        s->period = 0;
-    }
-
     s->hw.cmos_data[RTC_REG_C] |= RTC_PF|RTC_IRQF;
-
     spin_unlock(&s->lock);
 }
 
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 4cc0a0848bd..24d90c0a186 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -21,7 +21,6 @@
 #include <asm/hvm/vpt.h>
 #include <asm/event.h>
 #include <asm/apic.h>
-#include <asm/mc146818rtc.h>
 #include <public/hvm/params.h>
 
 #define mode_is(d, name) \
@@ -337,8 +336,7 @@ int pt_update_irq(struct vcpu *v)
     {
         if ( pt->pending_intr_nr )
         {
-            /* RTC code takes care of disabling the timer itself. */
-            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
+            if ( pt_irq_masked(pt) &&
                  /* Level interrupts should be asserted even if masked. */
                  !pt->level )
             {
-- 
2.30.1


