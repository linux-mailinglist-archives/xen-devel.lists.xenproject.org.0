Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFSNIE76u2mzqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB1B2CBFF1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257118.1551571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRW-0005Kw-Jf; Thu, 19 Mar 2026 13:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257118.1551571; Thu, 19 Mar 2026 13:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRW-0005Hi-F2; Thu, 19 Mar 2026 13:29:42 +0000
Received: by outflank-mailman (input) for mailman id 1257118;
 Thu, 19 Mar 2026 13:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3DRU-0004oN-TQ
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:29:41 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae87c39f-2397-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:29:40 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by SA5PR03MB989126.namprd03.prod.outlook.com (2603:10b6:806:4d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:29:35 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:29:35 +0000
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
X-Inumbo-ID: ae87c39f-2397-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfYug00C0Q8CpFjiqJvXhD4PuEY5A8DP479OochV43ghXHXCuBkD+GcTTtrf0aUYY9F+mLTDlNsOn3L3+YpiVCGNu8tQxGkvnHX019mlzWUvvjKko6W3M+mNhM4qvEMcyNAVYJ7FXhzuID7BWUjuWdop2/LhQdpzRxb2XbYfFXW2wDB47ADr+8m3owciUkut2qIFT/DJFIabPQD0J9/oxWYQEUqwnLLZ9e0GjwEL4z6+n3mqhfZcWO8N1bP0pItlEo43Brf6FsbObMZPYM2eVwLyMB2HcKGtyZimxGnVozUyC9+7VLMuojHBHHTNOUKg2fmvFjD4xX0lcRfzhkRROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i+towAPeqocTRa3nc54VevaTAJAqB/WA315HCtvc0Q=;
 b=HidHL9Dhvza+l04Z/s52NDB8Na3WbSHfWMve99PLZFBTO5N3McnQPBszYH9CEfzGovjUK5VcS60Xs1VsO4/umhGqeuHGaTdCHeK+DUjiocf9V6FM6O5yHP/jzZYAPvVJXTy7dcR9ZCVSZFt1Gejw+2MSYqDTSiumdkadQsDhM6yrCDBUzARcwiY66q8WIxF54amMC4c4NioBIQseNBNQarXk+1ipdkbY8alGqvutyOD7mx4jeJ825rohS+DxCHIjwDW9ryYAI6PQ/9GUmz69fCKXzhIh6k/ZqhTcLM0eVjlqo7KrmQcze3252+uOmoeyNkOkwVeO5CEEGJiDrvKCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/i+towAPeqocTRa3nc54VevaTAJAqB/WA315HCtvc0Q=;
 b=EUubIL8q8eKTSbRFERfQfrZq7MLSRp/vJs+hfvaJeiA+BP62zyQvZACEzJY2rJSdN6CKkOA9TPyE0jfuasWvobqOzI8TbQLoO3ioaj3fLULheV8xH/YUrdMCeE6klAJdCBGwZfdSSlx2wroGCNwbXsgN7EdshhlJVVuDqCe42CA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v1 2/8] x86/vmx: Remove lazy FPU support
Date: Thu, 19 Mar 2026 13:29:18 +0000
Message-ID: <20260319132924.1469809-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::22) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|SA5PR03MB989126:EE_
X-MS-Office365-Filtering-Correlation-Id: 744ed12c-b5e4-4c91-37e2-08de85bb8fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WLl6nY1+Ndg1QZNDbmd2DvPi+ENMpouAPzh0T5WmyrO6P0P3PP+SmI+6wG55Og7Q2dLUWXR+H6nQasU238WM1z9iK0KnAoR+XzFze94xigLCfeyyO6spt8u+Zv06YP15wNX4uJNKphrV3wOJ8UvHOYN/LMrJoGumJHg/JVYCve/ca7Vuz99r1leuRTiKPI8VpSGP56bz/KV/IKLGUpX2M9NWdz1PPxl4dnN0n1qAlHELCfDi1NTI3alWm2a/wWz2VWBHP1wORXvJXECNHHsggCaln/0vMkTsas/rgbhXLY1rQRfg0vW59sSYTeQXUHzTwov0UNS1/5Ov+ED5ROKoF5iX2WfrjIXqW6rxatPVPekky5YSnPB6PCfuZpoXmE3VacfU3NnnYN/InXKmIR23zrMf0Wwh98XSTDWKrASwoG2CSGfRsc5YyeS+pg1u5g2qnXusEXQDJH7nRtyfVTPYFGTIMe+gvikxN0A7W9ESDl9r+ejvbCFKcljuQEAWj3OXE4TL3bOBZws4i+u5ATa8ILaKSLy7xdDB59QOrFVPF6HzFYLt8rhFb2o1/2oFoLLTrNvDjsir9juRkbza/ZpDxHnbYg1fg8RJ71NJovXsDwWHLpIXl3d21K/G5qu9OEzSBA+gbNFn+cCmNasR/3PDHxYsKvV7XfivaU87EBy0nz2/tU2nyXIYNRJugRp5vFgtDbJndCUGvQisvHqIjORmssDm/BU3opikqSVk815K4Kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sLNeTTBIYGINJ+HYWPfCfvGDq0PHF37IZ1A3m6Y5gsnO9ZalLUzioWhFld1i?=
 =?us-ascii?Q?D8WlQ8ZBnHXeQQ4ItRkADrMHshUGAHKZZ+iCha38mI20gngs6zRSqRXpidH1?=
 =?us-ascii?Q?NbAi2jJUJKHOUGLn4TWvJlI2NG+QZwvWkQzqryuN4LTkq72vrInTOfxuX0Ho?=
 =?us-ascii?Q?5eSRN0kjjdEkVn6VgQCMcvCADvV3rSofURunRExSpqVzkNURPILIXyxRelkH?=
 =?us-ascii?Q?MCMIyEXMpZ6v/StwJm7FiI5mwNHbzIZhFECaXCEs9bek3O/RKpAJ+yeXdcLC?=
 =?us-ascii?Q?IcdT4HGh8OIPbsdLKg9yJOCm6XFkDk0wOzNeIPMmYiw8XTJvtFXBIKptrYpA?=
 =?us-ascii?Q?JTcLL4PiwDbwqxg5M9IOC+zTGOj8eWmv80LhG3MrvVbKNkgY7D6UUyhjj9sa?=
 =?us-ascii?Q?kOeAJmpXSDDpwG9jxq4jNNtS1DuGupaWPNqjHcZcvfVL+k9SNGNnPQzRk1SL?=
 =?us-ascii?Q?br82OpIKOauEan/oL94MhMMx6hrnjTOKDz67MOjmQjhQ2Q9vP/M5gVV3xdQY?=
 =?us-ascii?Q?hWNKHPHSE6fkdoF4LZBnQ2tpVr8Ef+DDcDO9Pjt/DugMNq34LHchw5iVHfWr?=
 =?us-ascii?Q?IPjqxx0YcJ1w715+8L/APJ4DOmKVj94h7xjzcB/omQpAPImMU6101qlzWTsk?=
 =?us-ascii?Q?7vWQlrJcvPva3++eWor0Qzc6cIiMRL/pP5qhEKxuRWijbuY/YV7NBTOWVd7T?=
 =?us-ascii?Q?W5tUb9kyi4+Wx3C+FnX3KJj2uC4wcNYsLIIsb+sdJOS9LfOcixsjO/KWrKUV?=
 =?us-ascii?Q?sDmcDpicE7NKjKGTXhwu3TK4+Q6175PiHz6M18MFZ1kfa9SAA36CKBYeRxF2?=
 =?us-ascii?Q?h7oLn3UM5RoHuJ4WF83WXx+LjTn7HYO4N5dUsppXzS7CD6qOX/zj1hcHC9V1?=
 =?us-ascii?Q?D0h6D7GbP1bOp/aD96WZzvnTviYwdbOJN6h+hnPR9gFtOYSwVFRU2yKEdJe1?=
 =?us-ascii?Q?zp+zjEs5B2vqYGNFp3LSm2YPc/pCSngmFVmFfidP+JP32dSFCABcuNwpwFin?=
 =?us-ascii?Q?vtbjVAaZgyMS6VGkLiLoMO1Lkv0svLRLCPNUnwbz0Aejy/5gL7cAZ5J0pD59?=
 =?us-ascii?Q?wUcgDCfJyCidMiYVCs+el/lj78LMrtt5LJ+ld58ISAfuvwMyBoraa2fTEz1I?=
 =?us-ascii?Q?aK4vRxd2ldNykuPQ5u44sXFWGsApZ4GXr8d9lbRbESfwd6wOT/wJnbE0/UcJ?=
 =?us-ascii?Q?CFqmdta4c8CIM9D9unabLddOaKz1nmDc/bOty+ebVO/wiU9zkrKoMoI9Omwu?=
 =?us-ascii?Q?ub+MU3+c/Wl4jVtEyA51hm7frCm9YM1MZ0OpOCKepZy4dSE0MrgLWly92L6A?=
 =?us-ascii?Q?2pi0DNPBEl5i4jflTs+wVTiNQKNKiIsXtHiHYbHaFwUpA3G3BYsGVA5vP6E+?=
 =?us-ascii?Q?qLoIGPEHyXfJfSStTVjI+FRHKH3c98WKjq8ZFRTtLPv7CFHfTdAREGjau8UY?=
 =?us-ascii?Q?x2AxEN2EWkL1F8itZFyri2/ob/4lq3OCnS/DQqq68owknahvWtHtB+juDIea?=
 =?us-ascii?Q?+DapqA78GPKzKmH5kG7dph18P7a3zbMEaAiwBj5ynzSVVtCtk4lXU1HMhRJ5?=
 =?us-ascii?Q?zHP6YB5pEyce36/ADF5zhga0VjnAVisl+5ScPVq03J9NrXk1SmP3uvaU2Upa?=
 =?us-ascii?Q?n+SqWrmMsGxgNMZxxIh7Ko9k4kkoQdYU1hVIon9zy7eDQ/dMNosIdsdTB3Q6?=
 =?us-ascii?Q?3PA4gLvSCMgStBhgmfmVyapFRfQYi52tg+N0kM814DsAztiotGIk5yMIXIxP?=
 =?us-ascii?Q?uQ7491sbCZrbDMlS5fvUWmqn09g0SQI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 744ed12c-b5e4-4c91-37e2-08de85bb8fad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:29:35.2754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOz5oP5S0DjtYyNcMp9k48tc+O4cjnaFhDN2r53/wXGpRIwFWMLkLka3o24FEa6cWqaB13oTX2KCj7kF8G/EZfqe9zztl7qBMib7TeyhlW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989126
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1AB1B2CBFF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove lazy FPU support from the VMX code since fully_eager_fpu is now
always true.

No functional change intended.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c             |  8 +--
 xen/arch/x86/hvm/vmx/vmx.c              | 70 +------------------------
 xen/arch/x86/hvm/vmx/vvmx.c             | 15 +-----
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 -
 4 files changed, 5 insertions(+), 90 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index c2e7f9aed39f..8e52ef4d497a 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1247,10 +1247,7 @@ static int construct_vmcs(struct vcpu *v)
     __vmwrite(HOST_TR_SELECTOR, TSS_SELECTOR);
 
     /* Host control registers. */
-    v->arch.hvm.vmx.host_cr0 = read_cr0() & ~X86_CR0_TS;
-    if ( !v->arch.fully_eager_fpu )
-        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
-    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
+    __vmwrite(HOST_CR0, read_cr0());
     __vmwrite(HOST_CR4, mmu_cr4_features);
     if ( cpu_has_vmx_efer )
         __vmwrite(HOST_EFER, read_efer());
@@ -1330,8 +1327,7 @@ static int construct_vmcs(struct vcpu *v)
     __vmwrite(VMCS_LINK_POINTER, ~0UL);
 
     v->arch.hvm.vmx.exception_bitmap = HVM_TRAP_MASK
-              | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF))
-              | (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
+              | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF));
 
     if ( cpu_has_vmx_notify_vm_exiting )
         __vmwrite(NOTIFY_WINDOW, vm_notify_window);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49aea9..03daf2f52bf2 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -68,7 +68,6 @@ static void cf_check vmx_update_guest_cr(
     struct vcpu *v, unsigned int cr, unsigned int flags);
 static void cf_check vmx_update_guest_efer(struct vcpu *v);
 static void cf_check vmx_wbinvd_intercept(void);
-static void cf_check vmx_fpu_dirty_intercept(void);
 static int cf_check vmx_msr_read_intercept(
     unsigned int msr, uint64_t *msr_content);
 static int cf_check vmx_msr_write_intercept(
@@ -1130,41 +1129,6 @@ static int cf_check vmx_load_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
     return 0;
 }
 
-static void vmx_fpu_enter(struct vcpu *v)
-{
-    vcpu_restore_fpu_lazy(v);
-    v->arch.hvm.vmx.exception_bitmap &= ~(1u << X86_EXC_NM);
-    vmx_update_exception_bitmap(v);
-    v->arch.hvm.vmx.host_cr0 &= ~X86_CR0_TS;
-    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-}
-
-static void cf_check vmx_fpu_leave(struct vcpu *v)
-{
-    ASSERT(!v->fpu_dirtied);
-    ASSERT(read_cr0() & X86_CR0_TS);
-
-    if ( !(v->arch.hvm.vmx.host_cr0 & X86_CR0_TS) )
-    {
-        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
-        __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-    }
-
-    /*
-     * If the guest does not have TS enabled then we must cause and handle an
-     * exception on first use of the FPU. If the guest *does* have TS enabled
-     * then this is not necessary: no FPU activity can occur until the guest
-     * clears CR0.TS, and we will initialise the FPU when that happens.
-     */
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-    {
-        v->arch.hvm.hw_cr[0] |= X86_CR0_TS;
-        __vmwrite(GUEST_CR0, v->arch.hvm.hw_cr[0]);
-        v->arch.hvm.vmx.exception_bitmap |= (1u << X86_EXC_NM);
-        vmx_update_exception_bitmap(v);
-    }
-}
-
 static void cf_check vmx_ctxt_switch_from(struct vcpu *v)
 {
     /*
@@ -1187,8 +1151,6 @@ static void cf_check vmx_ctxt_switch_from(struct vcpu *v)
         vmx_vmcs_reload(v);
     }
 
-    if ( !v->arch.fully_eager_fpu )
-        vmx_fpu_leave(v);
     vmx_save_guest_msrs(v);
     vmx_restore_host_msrs();
     vmx_save_dr(v);
@@ -1771,17 +1733,6 @@ static void cf_check vmx_update_guest_cr(
         else
             nvmx_set_cr_read_shadow(v, 0);
 
-        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        {
-            if ( v != current )
-            {
-                if ( !v->arch.fully_eager_fpu )
-                    hw_cr0_mask |= X86_CR0_TS;
-            }
-            else if ( v->arch.hvm.hw_cr[0] & X86_CR0_TS )
-                vmx_fpu_enter(v);
-        }
-
         realmode = !(v->arch.hvm.guest_cr[0] & X86_CR0_PE);
 
         if ( !vmx_unrestricted_guest(v) &&
@@ -2915,7 +2866,6 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .update_guest_cr      = vmx_update_guest_cr,
     .update_guest_efer    = vmx_update_guest_efer,
     .cpuid_policy_changed = vmx_cpuid_policy_changed,
-    .fpu_leave            = vmx_fpu_leave,
     .set_guest_pat        = vmx_set_guest_pat,
     .get_guest_pat        = vmx_get_guest_pat,
     .set_tsc_offset       = vmx_set_tsc_offset,
@@ -2927,7 +2877,6 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .cpu_up               = vmx_cpu_up,
     .cpu_down             = vmx_cpu_down,
     .wbinvd_intercept     = vmx_wbinvd_intercept,
-    .fpu_dirty_intercept  = vmx_fpu_dirty_intercept,
     .msr_read_intercept   = vmx_msr_read_intercept,
     .msr_write_intercept  = vmx_msr_write_intercept,
     .handle_cd            = vmx_handle_cd,
@@ -3281,20 +3230,6 @@ void update_guest_eip(void)
         hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 }
 
-static void cf_check vmx_fpu_dirty_intercept(void)
-{
-    struct vcpu *curr = current;
-
-    vmx_fpu_enter(curr);
-
-    /* Disable TS in guest CR0 unless the guest wants the exception too. */
-    if ( !(curr->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-    {
-        curr->arch.hvm.hw_cr[0] &= ~X86_CR0_TS;
-        __vmwrite(GUEST_CR0, curr->arch.hvm.hw_cr[0]);
-    }
-}
-
 static void vmx_dr_access(unsigned long exit_qualification,
                           struct cpu_user_regs *regs)
 {
@@ -4543,10 +4478,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
                 domain_pause_for_debugger();
             }
             break;
-        case X86_EXC_NM:
-            TRACE(TRC_HVM_TRAP, vector);
-            vmx_fpu_dirty_intercept();
-            break;
+
         case X86_EXC_PF:
             __vmread(EXIT_QUALIFICATION, &exit_qualification);
             __vmread(VM_EXIT_INTR_ERROR_CODE, &ecode);
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 38952f06961e..e4cdfe55c18e 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1238,9 +1238,6 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
     regs->rsp = get_vvmcs(v, GUEST_RSP);
     regs->rflags = get_vvmcs(v, GUEST_RFLAGS);
 
-    /* updating host cr0 to sync TS bit */
-    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-
     /* Setup virtual ETP for L2 guest*/
     if ( nestedhvm_paging_mode_hap(v) )
         /* This will setup the initial np2m for the nested vCPU */
@@ -1468,9 +1465,6 @@ static void virtual_vmexit(struct cpu_user_regs *regs)
     /* VM exit clears all bits except bit 1 */
     regs->rflags = X86_EFLAGS_MBS;
 
-    /* updating host cr0 to sync TS bit */
-    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-
     if ( cpu_has_vmx_virtual_intr_delivery )
         nvmx_update_apicv(v);
 
@@ -2458,19 +2452,14 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
         __vmread(VM_EXIT_INTR_INFO, &intr_info);
         vector = intr_info & INTR_INFO_VECTOR_MASK;
         /*
-         * decided by L0 and L1 exception bitmap, if the vetor is set by
-         * both, L0 has priority on #PF and #NM, L1 has priority on others
+         * decided by L0 and L1 exception bitmap, if the vector is set by
+         * both, L0 has priority on #PF, L1 has priority on others
          */
         if ( vector == X86_EXC_PF )
         {
             if ( paging_mode_hap(v->domain) )
                 nvcpu->nv_vmexit_pending = 1;
         }
-        else if ( vector == X86_EXC_NM )
-        {
-            if ( v->fpu_dirtied )
-                nvcpu->nv_vmexit_pending = 1;
-        }
         else if ( (intr_info & valid_mask) == valid_mask )
         {
             exec_bitmap = get_vvmcs(v, EXCEPTION_BITMAP);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 879ec10cefd0..88bded5190c9 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -149,8 +149,6 @@ struct vmx_vcpu {
     DECLARE_BITMAP(eoi_exit_bitmap, X86_IDT_VECTORS);
     struct pi_desc       pi_desc;
 
-    unsigned long        host_cr0;
-
     /* Do we need to tolerate a spurious EPT_MISCONFIG VM exit? */
     bool                 ept_spurious_misconfig;
 
-- 
2.53.0


