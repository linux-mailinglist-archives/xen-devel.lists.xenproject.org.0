Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEyKJ/Dgu2lXpQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:41:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097782CA7AD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256991.1551444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3BkZ-0001Nn-J2; Thu, 19 Mar 2026 11:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256991.1551444; Thu, 19 Mar 2026 11:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3BkZ-0001LP-GH; Thu, 19 Mar 2026 11:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1256991;
 Thu, 19 Mar 2026 11:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3BkX-0001LH-F0
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 11:41:13 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84777f81-2388-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 12:41:08 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by SA0PR03MB5546.namprd03.prod.outlook.com (2603:10b6:806:bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 11:41:03 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 11:41:03 +0000
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
X-Inumbo-ID: 84777f81-2388-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMqH1yFbebxPmKeZyCQ5nEcH49E+Y5tm2dCHXlXNud4E6gyyGE1oaaJ0bgkLyC4uTMo2j2Bk1qF1ximu6CZsLkqCbB3w7f+O8gSY+2jXX8+xXKJehVUgNM6HhLGJ6BozxJmw/DCqXKTcBp+OddJMMuYwXpjWahjUaMpZ+UcrCH8fKz95dYwKym50SqSNOXODMsmUZmA2/pghWoKQlYNcEM24y6nQD6Ix86VOvyfAhphGeQUQgmIVwmXZwSzelpbgsTPK7hmZAyNtLEWACjAhjw/Kr4RTvQWmHoIli+aftkmop280vGB4ZsFoERb25GLCHnVtWtAayAaTk/c+/4pOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ad/E3aQRMTWonx4vddCbikVgvVJo0XPTtSd/NZmXUx8=;
 b=dlg9xRVth9tAlfshSj9Suchbs+W9SK/sZgoGeCz2cfouxX++RAbLRG67Bbt52e9XXJDwkabuf3OW1sS+WGT3a2FTc9R0IboYJjyV+S+mCsjKpMmifjIHY2xDzeJGnC2D76D2KNgDP7vETmYkpix1BvDWsKfH4+ijAd0pnpacgJvsSek2pIQulmOmhnKfE6/PDJHTg5WggrZGz6XzGVAlxo8WDQeKOTMOdmhaUjiwwTA3+0pzknTa2fOXMlKCIjAYllEfq89WMiZjBqnPKRgEctjYApHiwnvXdvcSaWWncS/TvfaC4oMK23nSWr4HieUhV7w8LqEyyO0fgm3wBRBGFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad/E3aQRMTWonx4vddCbikVgvVJo0XPTtSd/NZmXUx8=;
 b=wrbMU+NplCw+7ultf5UUxB9ItmGpcgmj/6o2lihPSA9O76C+/iH2Sc+949BrkPdzdbCeKLE2nYHPtvwrlCEWBH2/767II06sWFQE7MIFqEgZJ5MlHAfoZAnX4xagZ8REoCHk0D4Ye4YFzxowBLpXCmKD+btD8nGElatMuypS2SI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/hap: Defer NPT P2M TLB flushes
Date: Thu, 19 Mar 2026 11:40:41 +0000
Message-ID: <20260319114041.1455593-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::17) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|SA0PR03MB5546:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6d286d-ea64-4e3e-261d-08de85ac66be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tuTZmh3/WR25QyK/hdvRlTbRuFRa6crokzIIHxibGitjlMWrmfD8RZwMvn1ZW0zCcbQb3ymU0Isig57/z30s8AAWB/a1dd7bmxnvsq4UWvk06hZjIgUd0lnYDUepf8gLJGg9plj7Li0xeV9ymWfAvE69kKkMRFbbbNHPoTlMlnNdhEnawBPKMmTw/Iaykl39C7ifkcTJFbCJJHQhxYSmOw9gdJtdv+SJjUBsK062iL4AUOH7H+Vpl3p3STVBTWbYnZ2m125G2D8bCHzWvPZwLPXeT5z85iGC6J44uFGZQRpwC5CJ83pYE2uhb5ZkwaiegRc4RLKu5aN5R4r/y5MqFMGEujIdoHjJZaQyHNhWi7DYuhRM0hehMCTZuB+cRFyRdgnxUxvrMXkN8UXe/ipBpqB62LMw5l/5QQuTVl3Vb7Dww+2hROGB/Pz7Rch1b5dTvQhod5aKyHQf9gYHanfXRHA75jIQmWSpLx2e+TPJxCCEnHMaIlfoBOkvu0IDUdxyKwfP6S65k4voidmBN4mn9Ym7mp1lfe+oPPMmZhTCn4zpOAxk0bVGEjDYMyACeD0c2JlrJ0uQsRRNT7AnSn5rczb5OfZhixhySyvdq5TmDY78TmAaCMYkwB2VGcpC4s4tdhsjpNReZvB19I6hqaJj5HAPa2Dg3QYULkZJkzOtK78b39lYZhC5sajlUzsPwuq1S5Zjd8ow7mo1KJ/8EspHgZlMb8ks3GqNx/iMO41vfDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vp0MkHSoiLx4ZxwqoXK55bL7MQqqsjPBnIBJ5J5uDSlvck9lt3xT2QJlRvM9?=
 =?us-ascii?Q?0reWQAdMI3JzEsoc/f4yQYmzj+bXTQuu57THw+4xsgUs514DpII9MC3CG6of?=
 =?us-ascii?Q?GI4phg7GjFoXLofOQm9GEJYX0pdbz2SkLbwsurRJu14y99JM5GhItUUDwhe5?=
 =?us-ascii?Q?E4Ph975A6PAHjdTgxasfAgaC2bfzcfnGrH1eH29urDpm/bdUAqJssrVmalTc?=
 =?us-ascii?Q?ZjUwif/PNUabJmFCeR/SGPLGFT8oPpJYgR4JPhxgC7trldUf5Fva9RnebC9T?=
 =?us-ascii?Q?eAXSJ1OxuegmXlzDAl/uOLjBxb+AQR3AeiQvl4E0o4JV0QEshKonArottt+3?=
 =?us-ascii?Q?jSeu6Zyot8VhtDZUVzP5szPVPCJI2SAhtmNE/PostkPJidI23MXOMRRXshOr?=
 =?us-ascii?Q?XBlsfRkD43U4s3iZqaPRI3EPvBQgavDLbH0fnugCnHY4mr9sTy8TsJOJGG2R?=
 =?us-ascii?Q?i9lF1DCg4jjQzpb1saQuiucMwmmNAPed0J4W2H0VboGUiBL0utfNJ+AksAuC?=
 =?us-ascii?Q?BSjTyvd7OrMIbsFXCOVyv82U0L2N8W5A+hM1fSl58sCUfOZlPHLcKof9nksa?=
 =?us-ascii?Q?+yD+8YcSABEaeNQAsXL3uqF0j++dW6rg4nY1Nltm7+ZGaHm0L44nvWmr706i?=
 =?us-ascii?Q?TdKUZgdmb6W7+XEUbatsev+TF0Hz3MjeYvar7uL5sgSTxm6RuWKgullbp09u?=
 =?us-ascii?Q?fytvvJkx/GyLtZMa17RdiXix+v624OhP1+nZx8gAyzYVjFRi6t13wIj6SYNi?=
 =?us-ascii?Q?L7EeWg+OkywfVJhIZeRbxf71igMBTjI/XuJvXfmxolD/ouFx0TAw0pmi/hGY?=
 =?us-ascii?Q?3SibfPJeNxGt2MyWqmtI9w/MnunBw7hR8ZvYH11NfVyBYvymQbVVzoA+R8Vf?=
 =?us-ascii?Q?TRWuxWqGJwO2dpUetw0LR+DBnBlrLhuB8ft99xHoOLq0KWOvEj/LXZqV7cTI?=
 =?us-ascii?Q?kaDaXB/MTyNEmlhH4k0mmkQLWIFUFgruzKSuxtgJ/vc7PQaaW52iZBeXqNfS?=
 =?us-ascii?Q?7ZR/GD1cagn65EUjiZeFeahg2CR7M5BOoSYep4W0nBZYdKijn4NQuArJZLd1?=
 =?us-ascii?Q?vl8ntAx7wwVIuB+mYIuwCoskCdncQ01bQsjhaak4zRelPcE+f2emdCTzcX3S?=
 =?us-ascii?Q?SVJAybQel78KUD77wkQG1feDmBlLiydNK1YcGAH2n22B2pwUl6pnVdcbUHMY?=
 =?us-ascii?Q?Tm/S9ku7pGWgXY+ZloW8WGLHbJx+vy48bJhoJf4XyxGdSfknYP10sRzj82C5?=
 =?us-ascii?Q?iCcbG0fsd39YSzAfMmzDyDSePD+BTJuZKiXpq6dCRv9DdLibtd90zFU4AjvE?=
 =?us-ascii?Q?p1IOUCe4Q0qfHCVt4GY6vil/gtjYRyIP+Ea9UBTgBdKVBzpCr+2rNvPh1fqZ?=
 =?us-ascii?Q?aGvcFd7UhSi1CYgX9rKOD2FkesiPmYVx2Z6H6JeKjA2kZwKmDneFisj5ne2P?=
 =?us-ascii?Q?MnhgN2w9XrU8dE+UCmK45HTT4aOfu9n7Tb33tczbe518SIBygskWg5Secs/n?=
 =?us-ascii?Q?sQsYKq4fgBQxHTiOH0sEkR0BzWCporMVlBQIIw6MUbDGAgQzaFxYbTgc8rIA?=
 =?us-ascii?Q?I80+9xNU8vFf5AFzFIgRJo4KUbTuUyrSV5QA/Wx++YdfuAoqnMiJ43mn7PML?=
 =?us-ascii?Q?gbmf9yyHl8RyCsOX1lpgnE48hVO+4vTRsdasjzXv01T38fnqO+ydKO1STVzI?=
 =?us-ascii?Q?nsd1liiY4j+JQTFVm6emaeenQukgo3v640vZ9/C2zm5uawWnYA2oIKHdE0Ph?=
 =?us-ascii?Q?HbOxbPO/N5hzyZNJJQOcveLVVGat3oA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6d286d-ea64-4e3e-261d-08de85ac66be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 11:41:03.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNYfcgVR1dv8PiIUGHaC1IRRNCReYw9R1Z6X7I0HKnjQBuec+s1A7EOsx0VuSYieNCrBaww6tD18K66UVSdBhtyH06UeHihpQOyR7F6PCEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5546
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 097782CA7AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Like the EPT code, defer TLB flushes for NPT to reduce the number of
flushes and avoid holding the P2M lock while flushing. This can
substantially improve performance in some scenarios.

The cases where the TLB needs to be flushed without deferring are
already handled by the call to p2m_tlb_flush_sync() in p2m_free_ptp().

Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
In v2:
* Tweak commit message.
* Call guest_flush_tlb_mask() if the assertion fails.

 xen/arch/x86/mm/hap/hap.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index a337752bf488..67137611d9db 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -814,15 +814,33 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
 static void cf_check
 hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
 {
-    struct domain *d = p2m->domain;
+    if ( !(oflags & _PAGE_PRESENT) )
+        return;
+
+    if ( unlikely(!p2m->defer_flush) )
+    {
+        struct domain *d = p2m->domain;
 
-    if ( oflags & _PAGE_PRESENT )
+        ASSERT_UNREACHABLE();
         guest_flush_tlb_mask(d, d->dirty_cpumask);
+        return;
+    }
+
+    p2m->need_flush = true;
+}
+
+static void cf_check
+hap_p2m_tlb_flush(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m->domain;
+
+    guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 void hap_p2m_init(struct p2m_domain *p2m)
 {
     p2m->write_p2m_entry_post = hap_write_p2m_entry_post;
+    p2m->tlb_flush = hap_p2m_tlb_flush;
 }
 
 static unsigned long cf_check hap_gva_to_gfn_real_mode(
-- 
2.53.0


