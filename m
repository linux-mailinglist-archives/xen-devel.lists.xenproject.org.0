Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AawGte6HGp/RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839EA618294
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323459.1589200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxD-0005on-Br; Sun, 31 May 2026 22:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323459.1589200; Sun, 31 May 2026 22:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxD-0005mP-4B; Sun, 31 May 2026 22:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1323459;
 Sun, 31 May 2026 22:48:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxB-0005bG-9p
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxA-00261G-Ma
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba69-2eae-0a2a0a5409dd-0a2a45099642-36
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:20 +0200
Received: from [52.101.229.101]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbab2-2497-0a2a45090019-3465e565b3a6-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:20 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:15 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJncUA6ScRXyGcuA5hcsbN1H4MDTGa0PYkmhjUx9CJKEV3z2z+BnGvIe/GLRjFsFUanXyDwwr5lK/ubhUKnM7R9IUNtksSylw8xgSqB5B+oSHyozscdbWQ82s7s3JZO+K6ZkZR6z75bk8+6+OkWMEth3mNn4A4KW+WFnBN3+9R8Wen1syuT5uK+PpmRX/aSep/Cd8kTxUhFWk24SkjMycoHt6BYeWitqD7VPUlirHrcO3X0mN4yzIl0ihmguUxrSbj2yP19aE5EazJMIoj0EEMAYgXriW8telql8cFHD3timouGCiGX5OMkJlwMWX9i9TYfTgsFQKBCCs/2h0YrSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDDYgiA7UEf0V5xxwFfRaXTUj6xHA+tLO+dwu2CP7mc=;
 b=qSLtyfi5XDFGixU4sF9Nnh4QnNSIFGHRF/dGMWa9EIyOS5UQl9nR0PKZRk5CDUpJXp8OAPEjYhWrVIp17C0uS8o1d6qs1E0HpgzRlwYNPbTUIjo4eM/k89kZwmh+pCoJt4uAHxb788b7NbPS5sEnsVnBWypPLu2YX4j/EhxitbofaH9/DPCy2bhmDTorn7EUdkKe5pjvRA3kiYodTQ3lZZAaFfUn+hK1BcX4mpZOAt7qG54aXvbLA+gDPhMmw+893tSBytc2UOWbYr0eg4bz/p7wUu87uF0e/2f9g01wRIht9VGKO9hiy3zhi/jVpPSGhaNmvaX6NaIIfBY61hECBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDDYgiA7UEf0V5xxwFfRaXTUj6xHA+tLO+dwu2CP7mc=;
 b=j/NULi/ssrV8OdGbsiXTOhHe3VVfrRjSWbxm5k3QFiAmQQLp4zBaknOfVLXd4qHacvrPLl+i8p7VfXaNASsSFFWT9qoI7SunLF33qp9z7eDGyQ4L71jWVHduu/B6f/N4UsAiF8iPV26IDiByxbcZzC3AhwuGpykrDrSQC8I+58w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 08/24] xen/sched: Link CPU topology to scheduler and display via xl info
Date: Mon,  1 Jun 2026 07:47:38 +0900
Message-ID: <20260531224755.9481-9-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: fa13f59c-23d3-4972-0502-08debf66b3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BEE4y6XnkQov7u+pTJ8zxreZzo8V/kJ/eG4e7k1iBxu2lW6Xlbl4LR8tC40cbl9C8O6vZPKP88815ygU2O453fD7YC2bJK7bZkZb2YzLART4a++Iy001rVaqsF4ruvNU3bNr5tLx4zxbM2I2wD21K0RAVh81fVR7N72ttXu944XPcAN7ZxAcXZjWtsmUMC+HmqXHDsxR4u8kebw7JispPkrc1xC07GAyVzChQQolEoX1PznBEZ/c5XDzTczIIu7M3vXxQ4elWrZKQeWUTs6apDXqrYLcUh3amEj9k4iub//+3UhLNmhduz2fZbtGmqnK3zNOKdNlV5/C4zwXxddJG7IuHEvPrC+cWUxn63aTSUWQ3+7fQ8g0S64iTwF704TMHCK5j6NGHkHG4nafOsyamF1JZ0JjYa24K6SCsQZaoRcsiBcrmg+Wli347/Ill6yOkhq9PjCAjrnqYuMqYq6Pmu8ocV9CMyQaKwHlezfFGSss5AKy+DZ55umZ6jgaqucf9wwb/ij5Gwl6ILbvBBA9EYW3hENLAYwd7hEc/6fkPQSVEgUCGnRHrqVjYf9hIZj9MRJ7SAmeEOWMFiPUXVq4G1zNdA3GMA0FICWRVP8Piym82AmtznBy38dEUtMeh4MIn9F5IDzjEepMbhKCi33zDGE1kbNkt14U2kCbDm3DQ0eHXqIPjJ2tnhm3oAItL5b7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2M/X7oD+3mEaX5daVtvgRAPg1P0gL4s2XsyXi5tvZ1YwA0X6UlUSCIVdRVK1?=
 =?us-ascii?Q?kwtIZn6GVWEdgXChraF1ktKgSZZLzMZTQerpwRklOqEgOp1agSxSBBnPg8wZ?=
 =?us-ascii?Q?rv+2mDHdx7YZoHa5/yGeJukjJs2BFljEIAI+gyk1Hy2V3qNcc3iSqP+hbZ1c?=
 =?us-ascii?Q?70W8iVbYzeSKRqJ58KrpxqwV2i6kcDP0oYER5dZ7AzQhkhVfw7SJwxuafvyl?=
 =?us-ascii?Q?QwISXG0ic3n0XAg3QJSqohfrN0V90QRgp0fHWZU848Fj3aPNrV2FQ4zBV38L?=
 =?us-ascii?Q?fQM3SlgQ5NC0ZATr6JqRDvlAkViNBZP4PtZyZ5z9h1EKqyIqF8QddEd21SJs?=
 =?us-ascii?Q?U3zIKDxfvpkauyk1uEpa42wSzJ6hczbI9lfLdVuilXHHv/DYBC4vVSiOeDQU?=
 =?us-ascii?Q?hL20Ux0L4kLUhBty/fcmOuttY3OTX9WzMXjWLLc8rvEYQYARS+OcJVeAvPb/?=
 =?us-ascii?Q?3UZzh07IZi1Py1BqR+FjvUe2BrCaO8tSbhyyyzmrafLdBKpCgmcVakeNAXPl?=
 =?us-ascii?Q?nWGpqdhvq1GwK5enWXQoyOqGIBY2r3Izo1IsUdbVI7xHl4G2yg7lNpO8glCa?=
 =?us-ascii?Q?eHsxuW4TBgs2cEP84ZE7JRHvO6qaj3Y1fJow1Xaw6fDF5Mh3JdG1+Ht0w0US?=
 =?us-ascii?Q?FeOpGYwXht5tEABHA8fc3+Nem3//pdoj/HUJs4D2ZMUr9HEd9/ui02KSMX8Z?=
 =?us-ascii?Q?ykOiGrO91O5HtotBmSlE6nBlQ0esT18TWQoRXy/cIOCI7Miinhq8pwQSwvTW?=
 =?us-ascii?Q?McatY7TJ16Te+XuD0UEaeFaVdFolgXrBPMu6EQwPkext/dVoYajpYUiyGIFy?=
 =?us-ascii?Q?tmKLEe2sUAwuCbngArZGWumBIAnbyx2kJ05Qrj8YzR7x3mtZBOSKTYZiXlHr?=
 =?us-ascii?Q?0k//04vXwE6ZCE8CxcaaTb6XyPZDFYSnzGbmCz83HgtmiG86My8U+xNWC+zM?=
 =?us-ascii?Q?Jz6Z6T6sHNRuFBZF+bEFuky4y6au5g62DT2NGAr5cBYXmVyiG+1akzKNoKoK?=
 =?us-ascii?Q?kCsv8/er9vAdNKEjBWg3W4lgEuV951rdEVT2RovJmRQfQASR1DRhCEqRpUlN?=
 =?us-ascii?Q?T/U0c/6MEE289Xrev+sI+lk50A5m1FIHT5e6W+p5vY7WIXWjMfPLwWghrkJM?=
 =?us-ascii?Q?LwQRUrESVNSxfRvNzg7fpA0tyhALvmbS5TMd+d4vF8yqsTUGRFXZqJvrh8ed?=
 =?us-ascii?Q?Tg36htnytIAKoU/do0PdhPwHNgBLIqG/Dcvpm1wfjkI0ppdteWH8/Am5Yfnl?=
 =?us-ascii?Q?EQpfmIjkYhD0uVC7cO8FJ8FbXcOqhyAGO/klr03JhPcoe3Ix8GbaYnU4cGJa?=
 =?us-ascii?Q?bMI8sWClrkXsuT4TT8wqDorzMQkFnnRggOYUBw13lF9sOZeMMeA44ZhqOECq?=
 =?us-ascii?Q?DhTJBiFLGUi+vvYlM7ht5Uaf+dK+ijsr5azNeBhG27G7NuJ3a3fhDvxWMMEE?=
 =?us-ascii?Q?QJqEbSbc7DDvj69W/BzOIiXJ1dX3Ik3geeWs7SEug8NLDB7JYiLtjidPB3jZ?=
 =?us-ascii?Q?RZN7nKKSrNDsTZqi7VGZwq8s4kGGayeDUZrLaFSO2cWZTlEYJKT5pufN+yeM?=
 =?us-ascii?Q?wYLf9BZC2PttEDm9W/ZibYAIvr6ZUUEF2h4ZRpqMtd7ayDD5a7MOXMCnWW8l?=
 =?us-ascii?Q?uTJlwgcWEOnO0Hbc4+dhTMejsVTJ6LVR3ep5XVwJ7zfD2AsWZn+jO7qvJsiX?=
 =?us-ascii?Q?+unbJH6arCnCiaplQHzGlmMHYfnbXXs3tqGCj5LhE+WibOxPrWKByQO3V3oY?=
 =?us-ascii?Q?h98lyNPstJQspv//hMzNNBuqqFAMZZ4bUeJ3tP/NTfpdQ38K6hZE8EknG28D?=
X-MS-Exchange-AntiSpam-MessageData-1: 3qcAQ8+XGoRbmQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: fa13f59c-23d3-4972-0502-08debf66b3cb
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:15.7844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7N80449TkdYafWnGayan8gDVG729LkZ0i/V10N3mKF7FFlD6i61lN9htgxvYAZOk1VfyEz8OyQkGV3XLT16L+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-bad1c0/1780267700-42772A53-9DCDAF62/0/0
X-purgate-type: clean
X-purgate-size: 6400
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 839EA618294
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.
---
 xen/arch/arm/include/asm/processor.h  |  4 --
 xen/arch/arm/smpboot.c                | 10 +++--
 xen/common/device-tree/cpu-topology.c | 54 +++++++++++++++++++++++++++
 xen/common/sched/credit2.c            |  3 ++
 xen/common/sysctl.c                   |  1 +
 xen/include/xen/cpu-topology.h        | 11 ++++++
 6 files changed, 76 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 895d7cd502..b968a1605e 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -591,10 +591,6 @@ void show_stack(const struct cpu_user_regs *regs);
 
 #define cpu_relax() barrier() /* Could yield? */
 
-/* All a bit UP for the moment */
-#define cpu_to_core(_cpu)   (0)
-#define cpu_to_socket(_cpu) (0)
-
 struct vcpu;
 void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
                            struct vcpu_guest_core_regs *regs);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 6bcf7e7f53..a8e914523d 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -93,13 +93,17 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+    cpumask_copy(per_cpu(cpu_sibling_mask, cpu), &cpu_topology[cpu].thread_sibling);
+    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_topology[cpu].core_sibling);
+#else /* CONFIG_DT_CPU_TOPOLOGY */
     /*
-     * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
+     * If CONFIG_DT_CPU_TOPOLOGY is disabled, it is assumed that
+     * all CPUs reside in the same socket and that SMT is not used.
      */
     cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
     cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+#endif /* CONFIG_DT_CPU_TOPOLOGY */
 
     return 0;
 }
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
index 82a366f3f6..8821ea94f1 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -294,6 +294,58 @@ int __init parse_dt_topology(void)
     return parse_socket(map);
 }
 
+static void __init setup_topology_for_sched(void)
+{
+    int prev_socketid = 0;
+    int prev_clusterid = 0;
+    int prev_coreid = 0;
+    int prev_threadid = 0;
+    unsigned int coreid = 0U;
+    unsigned int socketid = 0U;
+    unsigned int clusterid = 0U;
+    unsigned int threadid = 0U;
+    int cpu;
+
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+
+        if (cpu_topo->package_id != prev_socketid)
+        {
+            prev_socketid = cpu_topo->package_id;
+            prev_clusterid = cpu_topo->cluster_id;
+            prev_coreid = cpu_topo->core_id;
+            socketid++;
+            clusterid++;
+            coreid++;
+            threadid++;
+        }
+        else if (cpu_topo->cluster_id != prev_clusterid)
+        {
+            prev_clusterid = cpu_topo->cluster_id;
+            prev_coreid = cpu_topo->core_id;
+            clusterid++;
+            coreid++;
+            threadid++;
+        }
+        else if (cpu_topo->core_id != prev_coreid)
+        {
+            prev_coreid = cpu_topo->core_id;
+            coreid++;
+            threadid++;
+        }
+        else if (cpu_topo->thread_id != prev_threadid)
+        {
+            threadid++;
+        }
+
+        cpu_topo->phys_socket_id = socketid;
+        cpu_topo->phys_core_id = coreid;
+        cpu_topo->num_siblings = cpumask_weight(&cpu_topo->thread_sibling);
+    }
+
+}
+
 void __init dt_init_cpu_topology(void)
 {
     int cpu;
@@ -303,4 +355,6 @@ void __init dt_init_cpu_topology(void)
 
     for_each_possible_cpu(cpu)
         setup_siblings_masks(cpu);
+
+    setup_topology_for_sched();
 }
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 77475ee363..dcce1e361f 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -19,6 +19,7 @@
 #include <xen/softirq.h>
 #include <xen/time.h>
 #include <xen/trace.h>
+#include <xen/cpu-topology.h>
 
 #include <asm/div64.h>
 
@@ -37,6 +38,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
 {
 #ifdef CONFIG_X86
     return cpu_data[cpu].x86_num_siblings;
+#elif CONFIG_DT_CPU_TOPOLOGY
+    return cpu_topology[cpu].num_siblings;
 #else
     return 1;
 #endif
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..81a68fe24c 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -28,6 +28,7 @@
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
+#include <xen/cpu-topology.h>
 
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 8445f5786d..828c31f7ee 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -14,6 +14,9 @@ struct cpu_topology {
     cpumask_t thread_sibling;
     cpumask_t core_sibling;
     cpumask_t cluster_sibling;
+    unsigned int phys_core_id;
+    unsigned int phys_socket_id;
+    unsigned int num_siblings;
 };
 
 
@@ -23,11 +26,19 @@ extern struct cpu_topology cpu_topology[NR_CPUS];
 void map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node);
 void dt_init_cpu_topology(void);
 
+#define cpu_to_core(_cpu)   (cpu_topology[_cpu].phys_core_id)
+#define cpu_to_socket(_cpu)   (cpu_topology[_cpu].phys_socket_id)
+#define cpu_nr_siblings(_cpu) (cpu_topology[_cpu].num_siblings)
+
 #elif CONFIG_DEVICE_TREE_PARSE
 
 static inline void map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node) {}
 static inline void dt_init_cpu_topology(void) {}
 
+#define cpu_to_core(_cpu)   (0)
+#define cpu_to_socket(_cpu) (0)
+#define cpu_nr_siblings(_cpu) (1)
+
 #endif /* CONFIG_DEVICE_TREE_PARSE */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


