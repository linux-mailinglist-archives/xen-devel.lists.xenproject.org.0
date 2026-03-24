Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDExONzVwmnmmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB0D31AAB5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261245.1554346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MC-0004Nn-8t; Tue, 24 Mar 2026 18:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261245.1554346; Tue, 24 Mar 2026 18:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MC-0004Lh-5V; Tue, 24 Mar 2026 18:20:00 +0000
Received: by outflank-mailman (input) for mailman id 1261245;
 Tue, 24 Mar 2026 18:19:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56MA-0004Jf-1p
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:19:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56M9-00Db9Z-9u
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:19:57 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5ae-bab6-0a2a0a5309dd-0a2a4503b5fc-46
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:19:57 +0100
Received: from [40.93.196.11]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5cb-1947-0a2a45030019-285dc40b1c1a-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:19:56 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:19:54 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:19:54 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGKfpUK4b9Nwc50kQU+h2txy+LktN8gLAgrf5g5yTDw5wDMQGkyE3fQLOSBfuQ1YLOnGnjJkPWuZaVCJz2lLABxmqLMgN3XGpidBHu3p5WOTHjtVY+o1pCmaoUd/Na/+GpLTpt1djgDHIS7dP1M8qwzA38YyM9T1ZTt3AP44zMMlUvaSSceAYxLVO8uQIu19S9clgp+X3ZmLle89uOmA0GevBQ2y/n4M2Z3ncQaVzzpN2FCd1fikWxL1vNYjWB9I8rGLNhaaPlEfK4aXfaljWS8mzKcXDbr//WaNGOHt9gJs8Eh+/wEMounCLgv9BndHi0+/s0KpP54EtR3TP/i8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qI+LNjy72D4wHoOthvYhwfj9bAoz+vROImIxBQ8ISLY=;
 b=L1+/e3wuGBpwZenvlDwS1S5P7PYsuD9aa43gPfig0DQii3UNpQJWQHxI6NnxZTp+U9MRyuj3AgZfWWxIS+YeArn1UZ4cm94US3Pt4ELRSwOFiu/lmniMnVaNZlvX6CG/ofzllBBooB2F0XToFOTrPFPEb7WQDJR6gvm+2echDInFKwfNyN6D4n+hGwpV2jHScYtPEWfMU/fMJ8xQtfuRRAsuNIKw2Ito8/1LJGI1ulFZYtwGoCKGakguEh6lPzl/pxmOUmpdfqFW+TUtcwgS9rOI+HIPnEMag2a4EUoJOgbQ46/gZNDj65FNxESaEpCXZw96Quuxsoq/AQ7TB/TcBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qI+LNjy72D4wHoOthvYhwfj9bAoz+vROImIxBQ8ISLY=;
 b=qLV/5GO3UnvirntbrR4tJg0GccmeS2n5pPIfBzUEjfxTl9hl36rcdI4slCojga5RJAx0AiVKsd6THx1E/d12UlWu7W/uROSluvcxB981nsm0z8q6CqmQe/obpIEQ+3uz9ZhbgnfMpxqiqxKPmFZe/vxzOKO8Ymh8GKbilJMT9hE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 3/9] x86/vmx: Remove lazy FPU support
Date: Tue, 24 Mar 2026 18:19:31 +0000
Message-ID: <20260324181937.2465574-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0318.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::17) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9fc831-f0c5-49ed-f3d7-08de89d1ecef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GuE5X3Iom0ad4IIm0+J47VrN2502B9OHbqnJzaOm18a0eqm0TT0HQGdV31iDIK0CaSKJWA+u2iY2l5CxoDLQdxd5u+Y5EWKD2YMqGc6xONEkv5qdeYO3/6pz50EPtu+LZ18vw/gXa70xYWca6lJeyyQKeoWcqv0CaZ+oY0tBxeKwVZ+rtKP+teGs2c42gNAYLKzpCK60LduoiXKydbpqfWAZ2shIC9oUMeF33dBUzHegJBBDnIDZ1U1CvSaO0T37IVsx1rUOyfJxQBahhQIdNcb/LY5kkvRx0vi/xAZtfMmYweIrllrYcW57/+sw/tFJF7jrIVAQOEWASFihTuWw/JoG/PQ4XzmGLGPuOYz2T9ae+2Sb/donAgoFCbLIGCGbFFyN1SoZLoq9DPb206HIrCpdDT6vn+7dS6i9TQ5TzSrL0sIWJ4gNNVjXkWGz5zXSZZDG6snGCM2yNispj/hWaWHNXZ5l+frcMXgEVB4oorUr4atmNX9krXI+g8F6DCjCvKkwyWnShw2vQUxG4xSVTKisqo4E8ZrnKiWT+Ejw6YtQo7B/7g7UGx2rr3RvDpZGq7G+1jx/q46NNKqgr+LDYWRv+lhmURbLWOyD8Q9+n1bG9JfV57gwigaMmmvRRfMM0xIqtKUTpHS81yYZp+Oza6nK7Ei2NPVmgXWMZ2GZTLBPKNDjt2YysIy/E1zUTXur//x2OOpDvihVGJBY55GUe3Va4OBAcRcntSGsZGjdU74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q3+ZZatHTrwZ2voEB46PZjkMGiqapB2A+EwLpPmmSjuy9bLPSZgwuPxaydRr?=
 =?us-ascii?Q?19jbHneiL+YBsJgM6LKn4tSKyGiEIaY2TGG4vwSQ+4lgmP7lvAMBqIT+LpP8?=
 =?us-ascii?Q?jC5Ik92doIs3SgMh2gYukE88EJ+LuVpiSJ0tjbwbs07LpPfEFMwAIalZgHgy?=
 =?us-ascii?Q?eYmAkkZDkfN6u6CM4I+WBDKCRrmIrWFxXn1k4xy5CrF5RkVuoi/47P6pxFeA?=
 =?us-ascii?Q?BsjEgM/wt9XY8KuPK7jw7nb8zDPGl2sptdCUIi0mF/HUYCcs8/QenBwl4PW6?=
 =?us-ascii?Q?Bz3lCcik67tTuhgTXcmS5z6fcQxVu1NzTCxbIDslmAG9lfs713Ktjlcp5mAd?=
 =?us-ascii?Q?SRf5shWph3/TdIxichcIuJeGstDOwZPiNJC5eIG14TDX9ZqXWRFWoiMYdQ4j?=
 =?us-ascii?Q?in2rsWcjtyztg9dXbpXGeAsZwmMGM2C1MyZ/4K/62ggwFtGdgJjmFSo3ZLwn?=
 =?us-ascii?Q?bBwi41COhknQJkiwiuEmlJtTEj2rbuDoMvmJPh/eD74GQtZOhgp+cZbPmeYm?=
 =?us-ascii?Q?M16ah65sy6f71Rx4YGxXPk1WdqzvPgAX248/63YJknODtb+ljJyAuvWCERKk?=
 =?us-ascii?Q?yyJDdoM6+LYVofHLqrR4iMDt3XYoH/mP10g5C/o9WJ8zAcZ03VDv7yaVyOwS?=
 =?us-ascii?Q?jY8v8Z9KH1SYt5cce2gP7CehhHtpe1xe+ZpYhAwCEpu5Sn93yxkZx8QhVWtX?=
 =?us-ascii?Q?z0AhNas150GkayWIOWeZE+mP+UJmZ4DlqvqbedFzyjGzvwErjAY0B+nXgSUY?=
 =?us-ascii?Q?UO8Nbqd7TqXPKMFcAOeug5MeIFTtouu711wK3AnJrcgyT+emHbG0Q6qHS6vY?=
 =?us-ascii?Q?sOoQKVpUwyWl8ZIUXsMAlXYcguwkb5VmZYNWdkKorN4ae3JeSoyE8PmXJanD?=
 =?us-ascii?Q?NZ2js1LU0ALK0hs275620GJlRIES/vgOld83RUgu8PU1I6H7XQnpq6KT2925?=
 =?us-ascii?Q?iGcsDlbsqkpe57DWyGRP0LzXr2rZHhjuIkUNjCflXTssIPUHynf0K1jUTQE1?=
 =?us-ascii?Q?hlLzTdc9bpbYPBGUVYaTxtdG1Il6enEh+6Yb21iNU0KGCvSZdSgsSxR0S3yA?=
 =?us-ascii?Q?kjHd1pj2psnZH1hPTejll5BEdQZEZxAuR5yWdCAfucLmchJeU+Zp18bS9QdV?=
 =?us-ascii?Q?WwA7mak4oW+0fEZRWgSD4vnJw07fqj6YfKXLj3q2oPU/NqjVnBcMlFMK3Kei?=
 =?us-ascii?Q?7ynHviPWEkUbhNf0xq/6cSqL0JCFwgqoUzwDxx2ExSLoBfdqDzKKYTiokFIq?=
 =?us-ascii?Q?RrB8oDRvxG0ZN6NPubUQ6+2Pp2l7cHk8TK8eXj1+qgPpmglSfSIe2uXASny/?=
 =?us-ascii?Q?uDShIY/xnf0tlOwlwTzW0k6yVgJ4TInUTbRkzCqaTTqKTGfQ5QsdzCSPUjiA?=
 =?us-ascii?Q?W5za/cFFO76+dPpEpZkRzgA+zmxpH/wjLuiEo/cNvnTrJbOi6ZQwG27/f74z?=
 =?us-ascii?Q?JHXBTTSPQHJ5t3e93V1i+cmhsp5zO72EgOcpgP9h/VbOA7VuIZ1llVZHFIpp?=
 =?us-ascii?Q?wW8etSOY+FeI+49cFHcMxn7XbuCNJqH7YtZqcSRd0PzS27hcawWouZvdYi4u?=
 =?us-ascii?Q?OYhKfNEo0j1I4LP/+gnVq8adqVemqfXNU1Z68//EJGQeclW7l6b2WBr7Tax6?=
 =?us-ascii?Q?XGYEAK1WpC6t5Ho9wVgtlOWS4b3sJ9s8496nDI0lg3p8/LNTHcQYn35aELr2?=
 =?us-ascii?Q?ivpFPveElnz3+Yj7+hM5yaUM46EiggfYB75nGGyXaUrPSX54x4gI+DJhOCNn?=
 =?us-ascii?Q?Vh5dcMtMcC85ITZkkNu+nY2ApG4cmRA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9fc831-f0c5-49ed-f3d7-08de89d1ecef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:19:54.4400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuWAKn8HaD7Dsk7OK67C79xbh7YyXkmW2a9cK8x78QmVY5fRcFbiab/IJa6jvfHIT5X2gs7+1TKRVMl4pc/pc0aWbFx2HdQqZCK2pyPnF74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-33051d/1774376397-4866F72C-7F8B867D/0/0
X-purgate-type: clean
X-purgate-size: 9025
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7BB0D31AAB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove lazy FPU support from the VMX code since fully_eager_fpu is now
always true.

No functional change intended.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Unchanged in v2

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


