Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E434FE29
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103864.198142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYDW-0005XW-9j; Wed, 31 Mar 2021 10:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103864.198142; Wed, 31 Mar 2021 10:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYDW-0005Wm-3j; Wed, 31 Mar 2021 10:36:54 +0000
Received: by outflank-mailman (input) for mailman id 103864;
 Wed, 31 Mar 2021 10:36:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYDU-0004so-Ke
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:36:52 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 848fdff6-3a6a-4e73-975d-5606b01201b4;
 Wed, 31 Mar 2021 10:36:31 +0000 (UTC)
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
X-Inumbo-ID: 848fdff6-3a6a-4e73-975d-5606b01201b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=NZnmw6vdqBrw2HPwEJs9LRsvlJ7YMCZXRIR6F1TNqXQ=;
  b=Y6gnRn3/AlNV9F//I+VVFamzBmulVq3teDNd0llH7sQVs1oON+UxSrSp
   JqswhCSgB7Q7M12Xk6PDs77xH9VYFXglyaFTkUiEnH3DBa/AtyJedvRrr
   FlvZ0PpRcftuZgd5aJAlOSzId4dO3tK+CwV+Uff7lhxpo2jgKx5eloqJ0
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GzYTQ1HxW4/iEHxlp2hC6o+GzQMoG5d0fUIe3/pRAVPJraW/n3TDyEZFC07via+8zjiwpi0wVc
 whzUJTXHFmdgyYsAGF6gSqIc6OBoI1TYrUzOctuhoZb58JZQfia4zBrp4zAl+Xkmzyc+sKWIB2
 XZBKXgmeSu/RPHlPu15yRTo5AhE35ksYLV9w1EutHraI2rIoZN5ShsI4yEkYH7Ct2Ch53aeECO
 de5GAgKBkdtUgmmVdpDM4Wqij899u08/dX7BzYh8qsG4psfO6WzVx36NlhQ0BtDX0d98VFiFO/
 HZs=
X-SBRS: 5.2
X-MesageID: 41994610
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5Z2CPqzAJ2ZG66JsG6yaKrPx9uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr385lp7Y4NeYqzRQWOghrMEKhOz6vHhwfhFSr36/JH2c
 5bGZRWJdXsATFB4vrSzxK/F78bruWv1ICNqaPgw2x2TQdsApsQjTtRLgqACEV5SE1nKPMCdK
 a03cZMqzq+dXl/VK3SakUtZOTfu8bN0KvvfB9uPXUawTOThjCl4qOSKWn64j4iVVp0oIsKwC
 z+vCHSoo6itPy6zRG07R6o071m3OHP5/EGKMiFis0+IijhhACydO1aKsC/lQFwms6DwhIHl8
 TNvgcBMq1Img/sV1DwmzTB8U3B1ysj8HDrw1PwuwqdneXJAAgUJuAEoKAxSGq812MQ+OtS/Y
 gO4kei871QNh/ElDSV3amxazha0nCajFBnrfQelBVkIOwjQY4Ul6Mz1mVPHqwNGSrrgbpXa9
 VGPYXn6PFafUjyVQG+gkBfhNilXnEEFhybWEQ1usuMzzhMnHxipnFovfAiog==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="41994610"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2Ojk7gvmCog++XfKvxRBCX2dedGlbt9kTsPQ3gTWFf1BC/5PNZWST30tG9c+FqLs3xzoaHt8Cznj9Eh9ysrkEQsux89s7V9QBKIjyNlUD+bfgrtRtAF9lcY9T73JIfwm9iDKbokbqdlc1z8kht2f+ynWepRXr65GMgrcFuRXZZ+LvPZ99I7JBDkSX3GZqfk2jyl9YBqUXVJnHOXBVV0GnYLB5M4CrkS6a5WQPxDpMVbm8UvJnyCGu8T3+l68VXW+SMtrszN4F/3DI90UucpdZ1ii5iB4LNhyvAcZ5EmeKLDzkfStVL3KuyFfQJN5BsKJwx+NDfchGVmE4HcZIB2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvejW0nULK+NfwUACCxHzbAooqbar4wdYJPJ8qc6zcg=;
 b=bbT5V746CEPGMTMzqUwWJEzbuPM+hPhw6fOPzFhfuNo95GZr13T0Jgf9zMpGkcqu8oOA+nBXLCT8Jix/PeYgudYrlSUpayheIqFZMHgbSRkA9xzmT11yJdvflMzvQJhdoJwm3/TQbO11bHSttserEeCjCiq3vBRBdX/knllbiFLqMVuF+onVTo7Xz0aiB7u1DGO//fn29XJ4t3Yqcbcjzrc+tTgZhao+3/KN4EEPE0uAS+Wl25L79prXqNkbMG1iduY2VWHZGiilhR4Hmx00Y4YsPMXmKidmKk9sqw3POCQAq6cQZqLVZR6DbC2v1RtHUGKBwnjHaR7uOrnp3l9w1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvejW0nULK+NfwUACCxHzbAooqbar4wdYJPJ8qc6zcg=;
 b=HB2zT/oIfOOy0/9rv2+bWWk4cy+78gf/RNXpLHcP25E6JznNdUb10UKHS2sZel6LLjke4LY41wAXaYB1l6ReT1Z6bVQcI3ib4ens53gvs4vwKEXNrAEBkpey1XWKf4va46sLZGP9ec9igIjKwhBi6GKPm52cTio1m0cPPxi3K4o=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 09/11] x86/vpt: switch interrupt injection model
Date: Wed, 31 Mar 2021 12:33:01 +0200
Message-ID: <20210331103303.79705-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fc51022-c600-476c-0387-08d8f430d76e
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5968D3EAC0EC909F6D10141F8F7C9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CWBMoWg50CVpYeXzJCIsg0l+OuXpEzcGG372ZehWBqSgPv1O7ABsq8iDAAFXIQplDQasHG+/3k6YMBSF5bfLr3E8k186JD9GWC5J68R7NFXaQmObx292vfV09bZj3NDGLV7WqyFO4NgbZtS2pxUtLnefJD1b9tLMl51LJx7vZ06HO7Ye9WmaoPCOg0Sf+IHKiPj530PiTQPa2XbBn5GtxcctxHnc24nvHSOvS8giAdVFlw5QxutGXAgSxNSqTQCGDocIJ2no3xlpc2O0mtPd/zUSLqclcvWBpNorR8watRgSEOsC+hu7CPUVL/iUs5K9j72GsWbIgX1eNSOZitoSnAHIprFTqST/2VwBu7oG5RqWGEu8JvCp2tblICP91h5zogNBXTMyTQJDYodjq/JPq8/jnYB8OvTud1MeZoBiLMViw2oWcd6xHcWZL1w+kZ8YQ+Ww2kYCYPZ/GozkJ7YLHZajsc3rvuhmlLK6N+osK+hGg4+8KPTNFrwOgqRKlN8h6+8YUWX7SwLrftFKUroqtwKWTWfzqT69IAFe4YT+F57ZPPY+pu3kcNlJjo1WEcS3i7sBAPNlo3coMGsfDcgT2dGkOkeB+iwC+VSuq3U+/Q06y8n4nVvSI4zBsjflojqeITHQr7Fj3iCdIxb5XGeeiDvbgaulDk/rooetDc5aHwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(2906002)(6486002)(30864003)(8676002)(1076003)(36756003)(38100700001)(8936002)(83380400001)(16526019)(86362001)(186003)(6916009)(6496006)(66556008)(66946007)(478600001)(66476007)(5660300002)(316002)(4326008)(2616005)(6666004)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cHpEMEh1VUpHb29HWkJrSlNWbHlvZVdZY1owaU1qajFUWVZkVVRaOXp4cERT?=
 =?utf-8?B?TTRqbjA3UVBrdXI5RU9PWWxrZzZtU0hNMkFVcUoxVkZ2bGpRK0Vrc05jMk1I?=
 =?utf-8?B?a0lyNGlnd0hRMDl2NXhsTHBJYnNDZndtR0tyMXpoa0ZRZm8zTVJKVkl4VXcr?=
 =?utf-8?B?UzZOZ3dhd3JoRE14UUJoMDZHS2lDbXNOZXIrZ3Q1WHFGQ0cyVlh1dnlhNm1z?=
 =?utf-8?B?ZkZPOFZveXN1R2U1OWdSS1lhSVlSNW16aFA1Z2FKMVRMSHUyV0dwSEJVQUlJ?=
 =?utf-8?B?SGtlS2dSTFlWWDlSVEJwTDYzNUhCMlNUL2h1YlZSQzhTbUp4c1hOL3lOcTFD?=
 =?utf-8?B?bHEzSEgwWkdQOEpxTVdWR1RDZmZQbTZ2UUx1SDJiaWVvZ3BUeGxKN2hSUzd3?=
 =?utf-8?B?cVdLcmxaNjRRbmgvSTlVV2hic2kxQjBja29Udyt6c3J1U3VHdVhFQkdQRXNL?=
 =?utf-8?B?WXhIWlh4QS9kd3VjanNjM0NQU2hRUHZYY2NPaUNMaGlrYzhNUlQrbTRpaFhY?=
 =?utf-8?B?QjlkZC91cXg0M2FZbzErMU02cTVINjc2aVJFYWZiTW95ZC9JbmlCSlJRcnZ2?=
 =?utf-8?B?SmdETk40YVMrR1luWmpVQ0FsNE5UWXFEa2liS1Q1MHpsNzJ1UkVyMVUya1VZ?=
 =?utf-8?B?WGg1dmRoZTV3aGpHZ0xuSUNkUFMyY04zNlZIcFdidmhGUmtmdnI4K2lYTGdM?=
 =?utf-8?B?QWJ3NEdtVUxjZ3ozVGpGa3JZd0dUdTY2U3NQTnBUbnJjSXp2U0ZpNTNUVFV5?=
 =?utf-8?B?Yy9rNG8ybWRFUDlRYzBRcElXZWpCbXNERTRWZkt2VDF3alM4UkRLVGZDWU8w?=
 =?utf-8?B?aHBGekxZNFhZNHR4U01yK3V2WndTMC9aVjhZNk1pMGM1OEUrcGt1L25HYVQ4?=
 =?utf-8?B?RjAxb0JpeEVQd2xlVTNZRUhBNlVocWZQT2tZSVZVSHpWRGw0VURNYndLcmZN?=
 =?utf-8?B?a1RFZFhoRDFqazhWeS9CcWoxZmdBQng5MEdONU1UY2N3T2prRkdBK0U4Kzkv?=
 =?utf-8?B?Mi9hTnlISzdGc3c4WWRZbHZMbmdGdFhVLzA1dmtSNXNYL1VTbnRnWWY4bFl6?=
 =?utf-8?B?cUtGNnFVTFN3L2VFUnBOUHcwN2djcXVMZUE1ODJ6ZXk2WGE5Ti9NMzNMQW5n?=
 =?utf-8?B?VFR4V2czZjRXTUcwMWthS3Q1dXZIYXMyODRlSGlsV1pxZk1xVWhhNnBFMkx5?=
 =?utf-8?B?M1VHMVJVVEsyc29SckNHTG5yc1NuVVBOQzhqYStvMUhqV0IwalhnUFJrRDA5?=
 =?utf-8?B?OTdIcll1Qy9FdDhwK21UL29kdHA3aFg4TGRxQjl0RnZ0ZmpkU0FjcEU2RXZX?=
 =?utf-8?B?eEhaZ3U5MXozU0pkYUlMY2ZVV3NqaGF2dktqNXhRNDMvaDRyN0oyOVhtRUpP?=
 =?utf-8?B?ODhZMUg5YWZobGZ4YzFldmNvWFVvV20wQmlZTWlZdE1VODFoNkZ3QldBeWQ3?=
 =?utf-8?B?U25zdzE0VkFpY2lKUXprekhnbTJJNUh2TldnYitocExPajRQcENEV21yYUYv?=
 =?utf-8?B?VHh4UVlWaDlvWkRRTjBEQVNBMFJrK3BBejFxNXFBNG1mWUlMSEJHVXMwY0Iv?=
 =?utf-8?B?NUsyRmZZeGg2c2t5VGRMZVQ1SWlEY1JCekdRcDhoL1Q0azREaHlYVUhXcm5t?=
 =?utf-8?B?eDdnWWQ5M3I1SlZ5bHkreTdTYTJiTVhTdzBXeXNqRnRLM3dFc1VsSFA3UkI1?=
 =?utf-8?B?WnlEdzRzaG9iaE0vUldEcTRrQlptR3A3SFFJS1BEQVVzdExhU0dpRCtSTVcz?=
 =?utf-8?Q?K3ZmGWP+WVjZXG9BpaNAKvp3zd4zXNIpBC0xO6T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc51022-c600-476c-0387-08d8f430d76e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:36:28.4815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oq/D4JsxTXKPEZp8VZR+pp4Y3uzK1S8PJFomABCQlqW83us1hS5UlrK8jntNbYwpauZUGra09OU4prD9zD7dSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

Currently vPT relies on timers being assigned to a vCPU and performing
checks on every return to HVM guest in order to check if an interrupt
from a vPT timer assigned to the vCPU is currently being injected.

This model doesn't work properly since the interrupt destination vCPU
of a vPT timer can be different from the vCPU where the timer is
currently assigned, in which case the timer would get stuck because it
never sees the interrupt as being injected.

Knowing when a vPT interrupt is injected is relevant for the guest
timer modes where missed vPT interrupts are not discarded and instead
are accumulated and injected when possible.

This change aims to modify the logic described above, so that vPT
doesn't need to check on every return to HVM guest if a vPT interrupt
is being injected. In order to achieve this the vPT code is modified
to make use of the new EOI callbacks, so that virtual timers can
detect when a interrupt has been serviced by the guest by waiting for
the EOI callback to execute.

This model also simplifies some of the logic, as when executing the
timer EOI callback Xen can try to inject another interrupt if the
timer has interrupts pending for delivery.

Note that timers are still bound to a vCPU for the time being, this
relation however doesn't limit the interrupt destination anymore, and
will be removed by further patches.

This model has been tested with Windows 7 guests without showing any
timer delay, even when the guest was limited to have very little CPU
capacity and pending virtual timer interrupts accumulate.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Avoid and explicit != NULL check.
 - Use a switch in inject_interrupt to evaluate the timer mode.
 - Print the pt->source field on error in create_periodic_time.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/svm/intr.c   |   3 -
 xen/arch/x86/hvm/vmx/intr.c   |  59 ------
 xen/arch/x86/hvm/vpt.c        | 334 ++++++++++++++--------------------
 xen/include/asm-x86/hvm/vpt.h |   5 +-
 4 files changed, 143 insertions(+), 258 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 7f815d23078..2ee2332253b 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -146,8 +146,6 @@ void svm_intr_assist(void)
         return;
 
     /* Crank the handle on interrupt state. */
-    pt_update_irq(v);
-
     do {
         intack = hvm_vcpu_has_pending_irq(v);
         if ( likely(intack.source == hvm_intsrc_none) )
@@ -219,7 +217,6 @@ void svm_intr_assist(void)
     {
         HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
         svm_inject_extint(v, intack.vector);
-        pt_intr_post(v, intack);
     }
 
     /* Is there another IRQ to queue up behind this one? */
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 80bfbb47878..3fcc7073db2 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -203,7 +203,6 @@ static int nvmx_intr_intercept(struct vcpu *v, struct hvm_intack intack)
             {
                 /* for now, duplicate the ack path in vmx_intr_assist */
                 hvm_vcpu_ack_pending_irq(v, intack);
-                pt_intr_post(v, intack);
 
                 intack = hvm_vcpu_has_pending_irq(v);
                 if ( unlikely(intack.source != hvm_intsrc_none) )
@@ -242,7 +241,6 @@ void vmx_intr_assist(void)
     struct vcpu *v = current;
     unsigned int tpr_threshold = 0;
     enum hvm_intblk intblk;
-    int pt_vector;
 
     /* Block event injection when single step with MTF. */
     if ( unlikely(v->arch.hvm.single_step) )
@@ -263,8 +261,6 @@ void vmx_intr_assist(void)
 #endif
 
     /* Crank the handle on interrupt state. */
-    pt_vector = pt_update_irq(v);
-
     do {
         unsigned long intr_info;
 
@@ -337,58 +333,6 @@ void vmx_intr_assist(void)
     {
         unsigned long status;
 
-       /*
-        * intack.vector is the highest priority vector. So we set eoi_exit_bitmap
-        * for intack.vector - give a chance to post periodic time interrupts when
-        * periodic time interrupts become the highest one
-        */
-        if ( pt_vector != -1 )
-        {
-#ifndef NDEBUG
-            /*
-             * We assert that intack.vector is the highest priority vector for
-             * only an interrupt from vlapic can reach this point and the
-             * highest vector is chosen in hvm_vcpu_has_pending_irq().
-             * But, in fact, the assertion failed sometimes. It is suspected
-             * that PIR is not synced to vIRR which makes pt_vector is left in
-             * PIR. In order to verify this suspicion, dump some information
-             * when the assertion fails.
-             */
-            if ( unlikely(intack.vector < pt_vector) )
-            {
-                const struct vlapic *vlapic;
-                const struct pi_desc *pi_desc;
-                const uint32_t *word;
-                unsigned int i;
-
-                printk(XENLOG_ERR "%pv: intack: %u:%02x pt: %02x\n",
-                       current, intack.source, intack.vector, pt_vector);
-
-                vlapic = vcpu_vlapic(v);
-                if ( vlapic && vlapic->regs )
-                {
-                    word = (const void *)&vlapic->regs->data[APIC_IRR];
-                    printk(XENLOG_ERR "vIRR:");
-                    for ( i = X86_NR_VECTORS / 32; i-- ; )
-                        printk(" %08x", word[i*4]);
-                    printk("\n");
-                }
-
-                pi_desc = &v->arch.hvm.vmx.pi_desc;
-                if ( pi_desc )
-                {
-                    word = (const void *)&pi_desc->pir;
-                    printk(XENLOG_ERR " PIR:");
-                    for ( i = X86_NR_VECTORS / 32; i-- ; )
-                        printk(" %08x", word[i]);
-                    printk("\n");
-                }
-            }
-#endif
-            ASSERT(intack.vector >= pt_vector);
-            vmx_set_eoi_exit_bitmap(v, intack.vector);
-        }
-
         /* we need update the RVI field */
         __vmread(GUEST_INTR_STATUS, &status);
         status &= ~VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
@@ -397,14 +341,11 @@ void vmx_intr_assist(void)
         __vmwrite(GUEST_INTR_STATUS, status);
 
         vmx_sync_exit_bitmap(v);
-
-        pt_intr_post(v, intack);
     }
     else
     {
         HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
         vmx_inject_extint(intack.vector, intack.source);
-        pt_intr_post(v, intack);
     }
 
     /* Is there another IRQ to queue up behind this one? */
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 4c2afe2e915..f951cd95bcf 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -27,6 +27,8 @@
 #define mode_is(d, name) \
     ((d)->arch.hvm.params[HVM_PARAM_TIMER_MODE] == HVMPTM_##name)
 
+static bool inject_interrupt(struct periodic_time *pt);
+
 void hvm_init_guest_time(struct domain *d)
 {
     struct pl_time *pl = d->arch.hvm.pl_time;
@@ -76,35 +78,6 @@ void hvm_set_guest_time(struct vcpu *v, u64 guest_time)
     }
 }
 
-static int pt_irq_vector(struct periodic_time *pt, enum hvm_intsrc src)
-{
-    struct vcpu *v = pt->vcpu;
-    unsigned int gsi, isa_irq;
-    int vector;
-
-    if ( pt->source == PTSRC_lapic )
-        return pt->irq;
-
-    isa_irq = pt->irq;
-
-    if ( src == hvm_intsrc_pic )
-        return (v->domain->arch.hvm.vpic[isa_irq >> 3].irq_base
-                + (isa_irq & 7));
-
-    ASSERT(src == hvm_intsrc_lapic);
-    gsi = pt->source == PTSRC_isa ? hvm_isa_irq_to_gsi(isa_irq) : pt->irq;
-    vector = vioapic_get_vector(v->domain, gsi);
-    if ( vector < 0 )
-    {
-        dprintk(XENLOG_WARNING, "d%u: invalid GSI (%u) for platform timer\n",
-                v->domain->domain_id, gsi);
-        domain_crash(v->domain);
-        return -1;
-    }
-
-    return vector;
-}
-
 static int pt_irq_masked(struct periodic_time *pt)
 {
     struct vcpu *v = pt->vcpu;
@@ -247,34 +220,14 @@ void pt_restore_timer(struct vcpu *v)
     pt_vcpu_lock(v);
 
     list_for_each_entry ( pt, head, list )
-    {
         if ( pt->pending_intr_nr == 0 )
-        {
-            pt_process_missed_ticks(pt);
             set_timer(&pt->timer, pt->scheduled);
-        }
-    }
 
     pt_thaw_time(v);
 
     pt_vcpu_unlock(v);
 }
 
-static void pt_timer_fn(void *data)
-{
-    struct periodic_time *pt = data;
-
-    pt_lock(pt);
-
-    pt->pending_intr_nr++;
-    pt->scheduled += pt->period;
-    pt->do_not_freeze = 0;
-
-    vcpu_kick(pt->vcpu);
-
-    pt_unlock(pt);
-}
-
 static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
 {
     pt->irq_issued = false;
@@ -285,189 +238,144 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
             list_del(&pt->list);
         pt->on_list = false;
         pt->pending_intr_nr = 0;
+
+        return;
     }
-    else if ( mode_is(v->domain, one_missed_tick_pending) ||
-              mode_is(v->domain, no_missed_ticks_pending) )
+
+    if ( mode_is(v->domain, one_missed_tick_pending) ||
+         mode_is(v->domain, no_missed_ticks_pending) )
     {
-        pt->last_plt_gtime = hvm_get_guest_time(v);
         pt_process_missed_ticks(pt);
         pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */
+    }
+    else if ( !pt->pending_intr_nr )
+        pt_process_missed_ticks(pt);
+
+    if ( !pt->pending_intr_nr )
         set_timer(&pt->timer, pt->scheduled);
+}
+
+static void pt_timer_fn(void *data)
+{
+    struct periodic_time *pt = data;
+    struct vcpu *v;
+    time_cb *cb = NULL;
+    void *cb_priv;
+    unsigned int irq;
+
+    pt_lock(pt);
+
+    v = pt->vcpu;
+    irq = pt->irq;
+
+    if ( inject_interrupt(pt) )
+    {
+        pt->scheduled += pt->period;
+        pt->do_not_freeze = 0;
+        cb = pt->cb;
+        cb_priv = pt->priv;
     }
     else
     {
-        pt->last_plt_gtime += pt->period;
-        if ( --pt->pending_intr_nr == 0 )
-        {
-            pt_process_missed_ticks(pt);
-            if ( pt->pending_intr_nr == 0 )
-                set_timer(&pt->timer, pt->scheduled);
-        }
+        /* Masked. */
+        if ( pt->on_list )
+            list_del(&pt->list);
+        pt->on_list = false;
+        pt->pending_intr_nr++;
     }
 
-    if ( mode_is(v->domain, delay_for_missed_ticks) &&
-         (hvm_get_guest_time(v) < pt->last_plt_gtime) )
-        hvm_set_guest_time(v, pt->last_plt_gtime);
+    pt_unlock(pt);
+
+    if ( cb )
+        cb(v, cb_priv);
 }
 
-int pt_update_irq(struct vcpu *v)
+/*
+ * The same callback is shared between LAPIC and PIC/IO-APIC based timers, as
+ * we ignore the first parameter that's different between them.
+ */
+static void eoi_callback(unsigned int unused, void *data)
 {
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt, *temp, *earliest_pt;
-    uint64_t max_lag;
-    int irq, pt_vector = -1;
-    bool level;
+    struct periodic_time *pt = data;
+    struct vcpu *v;
+    time_cb *cb = NULL;
+    void *cb_priv;
 
-    pt_vcpu_lock(v);
+    pt_lock(pt);
 
-    earliest_pt = NULL;
-    max_lag = -1ULL;
-    list_for_each_entry_safe ( pt, temp, head, list )
+    pt_irq_fired(pt->vcpu, pt);
+    if ( pt->pending_intr_nr )
     {
-        if ( pt->pending_intr_nr )
+        if ( inject_interrupt(pt) )
+        {
+            pt->pending_intr_nr--;
+            cb = pt->cb;
+            cb_priv = pt->priv;
+            v = pt->vcpu;
+        }
+        else
         {
-            /* RTC code takes care of disabling the timer itself. */
-            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
-                 /* Level interrupts should be asserted even if masked. */
-                 !pt->level )
-            {
-                /* suspend timer emulation */
+            /* Masked. */
+            if ( pt->on_list )
                 list_del(&pt->list);
-                pt->on_list = 0;
-            }
-            else
-            {
-                if ( (pt->last_plt_gtime + pt->period) < max_lag )
-                {
-                    max_lag = pt->last_plt_gtime + pt->period;
-                    earliest_pt = pt;
-                }
-            }
+            pt->on_list = false;
         }
     }
 
-    if ( earliest_pt == NULL )
-    {
-        pt_vcpu_unlock(v);
-        return -1;
-    }
+    pt_unlock(pt);
 
-    earliest_pt->irq_issued = 1;
-    irq = earliest_pt->irq;
-    level = earliest_pt->level;
+    if ( cb )
+        cb(v, cb_priv);
+}
 
-    pt_vcpu_unlock(v);
+static bool inject_interrupt(struct periodic_time *pt)
+{
+    struct vcpu *v = pt->vcpu;
+    struct domain *d = v->domain;
+    unsigned int irq = pt->irq;
 
-    switch ( earliest_pt->source )
+    if ( pt_irq_masked(pt) )
+        return false;
+
+    switch ( pt->source )
     {
     case PTSRC_lapic:
-        /*
-         * If periodic timer interrupt is handled by lapic, its vector in
-         * IRR is returned and used to set eoi_exit_bitmap for virtual
-         * interrupt delivery case. Otherwise return -1 to do nothing.
-         */
-        vlapic_set_irq(vcpu_vlapic(v), irq, 0);
-        pt_vector = irq;
+        vlapic_set_irq_callback(vcpu_vlapic(v), pt->irq, 0, eoi_callback, pt);
         break;
 
     case PTSRC_isa:
-        hvm_isa_irq_deassert(v->domain, irq);
+        hvm_isa_irq_deassert(d, irq);
         if ( platform_legacy_irq(irq) && vlapic_accept_pic_intr(v) &&
-             v->domain->arch.hvm.vpic[irq >> 3].int_output )
-            hvm_isa_irq_assert(v->domain, irq, NULL);
+             d->arch.hvm.vpic[irq >> 3].int_output )
+            hvm_isa_irq_assert(d, irq, NULL);
         else
-        {
-            pt_vector = hvm_isa_irq_assert(v->domain, irq, vioapic_get_vector);
-            /*
-             * hvm_isa_irq_assert may not set the corresponding bit in vIRR
-             * when mask field of IOAPIC RTE is set. Check it again.
-             */
-            if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
-                pt_vector = -1;
-        }
+            hvm_isa_irq_assert(d, irq, vioapic_get_vector);
         break;
 
     case PTSRC_ioapic:
-        pt_vector = hvm_ioapic_assert(v->domain, irq, level);
-        if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
-        {
-            pt_vector = -1;
-            if ( level )
-            {
-                /*
-                 * Level interrupts are always asserted because the pin assert
-                 * count is incremented regardless of whether the pin is masked
-                 * or the vector latched in IRR, so also execute the callback
-                 * associated with the timer.
-                 */
-                time_cb *cb = NULL;
-                void *cb_priv = NULL;
-
-                pt_vcpu_lock(v);
-                /* Make sure the timer is still on the list. */
-                list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
-                    if ( pt == earliest_pt )
-                    {
-                        pt_irq_fired(v, pt);
-                        cb = pt->cb;
-                        cb_priv = pt->priv;
-                        break;
-                    }
-                pt_vcpu_unlock(v);
-
-                if ( cb != NULL )
-                    cb(v, cb_priv);
-            }
-        }
+        hvm_ioapic_assert(d, irq, pt->level);
         break;
     }
 
-    return pt_vector;
-}
-
-static struct periodic_time *is_pt_irq(
-    struct vcpu *v, struct hvm_intack intack)
-{
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    list_for_each_entry ( pt, head, list )
+    switch ( d->arch.hvm.params[HVM_PARAM_TIMER_MODE] )
     {
-        if ( pt->pending_intr_nr && pt->irq_issued &&
-             (intack.vector == pt_irq_vector(pt, intack.source)) )
-            return pt;
-    }
-
-    return NULL;
-}
-
-void pt_intr_post(struct vcpu *v, struct hvm_intack intack)
-{
-    struct periodic_time *pt;
-    time_cb *cb;
-    void *cb_priv;
-
-    if ( intack.source == hvm_intsrc_vector )
-        return;
+    case HVMPTM_one_missed_tick_pending:
+    case HVMPTM_no_missed_ticks_pending:
+        pt->last_plt_gtime = hvm_get_guest_time(v);
+        break;
 
-    pt_vcpu_lock(v);
+    case HVMPTM_delay_for_missed_ticks:
+        pt->last_plt_gtime += pt->period;
+        if ( hvm_get_guest_time(v) < pt->last_plt_gtime )
+            hvm_set_guest_time(v, pt->last_plt_gtime);
+        break;
 
-    pt = is_pt_irq(v, intack);
-    if ( pt == NULL )
-    {
-        pt_vcpu_unlock(v);
-        return;
+    default:
+        pt->last_plt_gtime += pt->period;
+        break;
     }
 
-    pt_irq_fired(v, pt);
-
-    cb = pt->cb;
-    cb_priv = pt->priv;
-
-    pt_vcpu_unlock(v);
-
-    if ( cb != NULL )
-        cb(v, cb_priv);
+    return true;
 }
 
 void pt_migrate(struct vcpu *v)
@@ -543,6 +451,24 @@ void create_periodic_time(
     pt->cb = cb;
     pt->priv = data;
 
+    switch ( pt->source )
+    {
+        int rc;
+
+    case PTSRC_isa:
+        irq = hvm_isa_irq_to_gsi(irq);
+        /* fallthrough */
+    case PTSRC_ioapic:
+        pt->eoi_cb.callback = eoi_callback;
+        pt->eoi_cb.data = pt;
+        rc = hvm_gsi_register_callback(v->domain, irq, &pt->eoi_cb);
+        if ( rc )
+            gdprintk(XENLOG_WARNING,
+                     "unable to register callback for timer GSI %u source %u: %d\n",
+                     irq, pt->source, rc);
+        break;
+    }
+
     pt->on_list = 1;
     list_add(&pt->list, &v->arch.hvm.tm_list);
 
@@ -554,6 +480,8 @@ void create_periodic_time(
 
 void destroy_periodic_time(struct periodic_time *pt)
 {
+    unsigned int gsi;
+
     /* Was this structure previously initialised by create_periodic_time()? */
     if ( pt->vcpu == NULL )
         return;
@@ -563,6 +491,17 @@ void destroy_periodic_time(struct periodic_time *pt)
         list_del(&pt->list);
     pt->on_list = 0;
     pt->pending_intr_nr = 0;
+
+    gsi = pt->irq;
+    switch ( pt->source )
+    {
+    case PTSRC_isa:
+        gsi = hvm_isa_irq_to_gsi(pt->irq);
+        /* fallthrough */
+    case PTSRC_ioapic:
+        hvm_gsi_unregister_callback(pt->vcpu->domain, gsi, &pt->eoi_cb);
+        break;
+    }
     pt_unlock(pt);
 
     /*
@@ -617,20 +556,29 @@ void pt_adjust_global_vcpu_target(struct vcpu *v)
     write_unlock(&pl_time->vhpet.lock);
 }
 
-
 static void pt_resume(struct periodic_time *pt)
 {
+    struct vcpu *v;
+    time_cb *cb = NULL;
+    void *cb_priv;
+
     if ( pt->vcpu == NULL )
         return;
 
     pt_lock(pt);
-    if ( pt->pending_intr_nr && !pt->on_list )
+    if ( pt->pending_intr_nr && !pt->on_list && inject_interrupt(pt) )
     {
+        pt->pending_intr_nr--;
+        cb = pt->cb;
+        cb_priv = pt->priv;
+        v = pt->vcpu;
         pt->on_list = 1;
         list_add(&pt->list, &pt->vcpu->arch.hvm.tm_list);
-        vcpu_kick(pt->vcpu);
     }
     pt_unlock(pt);
+
+    if ( cb )
+        cb(v, cb_priv);
 }
 
 void pt_may_unmask_irq(struct domain *d, struct periodic_time *vlapic_pt)
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 39d26cbda49..9440fe4ac7d 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -23,6 +23,7 @@
 #include <xen/list.h>
 #include <xen/rwlock.h>
 #include <asm/hvm/hvm.h>
+#include <asm/hvm/irq.h>
 
 /*
  * Abstract layer of periodic time, one short time.
@@ -50,6 +51,7 @@ struct periodic_time {
     struct timer timer;         /* ac_timer */
     time_cb *cb;
     void *priv;                 /* point back to platform time source */
+    struct hvm_gsi_eoi_callback eoi_cb; /* EOI callback registration data */
 };
 
 
@@ -145,9 +147,6 @@ struct pl_time {    /* platform time */
 
 void pt_save_timer(struct vcpu *v);
 void pt_restore_timer(struct vcpu *v);
-int pt_update_irq(struct vcpu *v);
-struct hvm_intack;
-void pt_intr_post(struct vcpu *v, struct hvm_intack intack);
 void pt_migrate(struct vcpu *v);
 
 void pt_adjust_global_vcpu_target(struct vcpu *v);
-- 
2.30.1


