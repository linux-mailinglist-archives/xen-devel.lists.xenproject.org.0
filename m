Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPxHNA2dBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36305549237
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309429.1580503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjts-0001Ob-TT; Fri, 15 May 2026 04:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309429.1580503; Fri, 15 May 2026 04:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjts-0001MN-OP; Fri, 15 May 2026 04:11:48 +0000
Received: by outflank-mailman (input) for mailman id 1309429;
 Fri, 15 May 2026 04:11:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjtq-0000ts-Qa
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:11:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjtq-0052Iz-6g
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:11:46 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069cda-e002-0a2a0a5209dd-0a2a4505a2ee-20
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:11:46 +0200
Received: from [52.101.125.85]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c47-aaa8-0a2a45050019-34657d55753b-7
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:45 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3682.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 04:08:38 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:38 +0000
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
 b=KHS27FapKNanGflrIFw/hM2kwNkQX/WePq3xlEM6xUNYPVEYtmx9BWO1Z6lo57SRVOTwKuWv/ZAJVGpMYzH/t45gcDmFMPL1TpT2xoz3DMHu0x4mJ25XYlLDKFkJ2k/pQfa7vfCntNIiyNowixl92fsBWYKmN/RVp5nEVX9ukyEYCxAd6vtJRwOOq2LhVMVcC4+is4oVh7CikZ9lWQMnKq0BINvo4jlkHpm0fg7JFXCeTT/ELG9LUT2CbPQtXyK32qdst02MDTmNjd1lSMdfBxhjdxGAoDxCMDE6HHyVHjLxUlzHs+p7zQnHi81MjMV7GtcnDF1bsUi9BOaLbfAQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5/dP4DpjlJzyHFiGX9Dvr0WUYwSm5khsV8ePzx5S4I=;
 b=nmXuiUvdJ3Flt5/DT6NdKZ+A+dIDNxEmujoQV8WKWtYx4BU9X0SopJBgOr89fzHVPDAntfmSiHlnT5nNK9HD+Wo5R6ApOLUPQgydzW3Pk+PUOJLgFoAg+ql2VKFFV/QiRIE+9exzqW6+o1Amef6g/89ktFiso/zxjbRclDSaWmrp3j3d5Z7+47wE4jB2+xjJzpSfyy9KkwEl6z4piJ+lSnpUgxXV5ZxmSeUEW86aQo/AKW+hqbVmFoSH/tpQDmIlsKZ+sQSa7nWmyirpwD/16aEcN78nFBhjt50hbZxk27oXHF10mSh5ZD3Ll3j5bmFQsoxxOrJ36ZbftXFsESRIJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5/dP4DpjlJzyHFiGX9Dvr0WUYwSm5khsV8ePzx5S4I=;
 b=AlLdhX9vH/fpSFPgkhutEVZ8Y9i1S8sgzNpwya8a17SF/zHYi+guBKZwnQgUpjXj9nV4xtDq0y6W6pZL1alGZ2TY1MCNZk8pYARm2aEG0mTq0yoxcYcq0mtnpvRyWQYHsmwRvWXJHs278ob3NWrPu8CMST2cNsstFRC7qtG3Sx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 23/26] xen/arm/cca: handle Realm RIPAS and GIC sysreg exits
Date: Fri, 15 May 2026 13:08:09 +0900
Message-ID: <20260515040812.983626-24-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: b2261427-5b75-45f1-8765-08deb237a34a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|3023799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kKzqrQuiXntSMHlRULX9ohEW5gS0/Yqvl12mkFR5/s5V91S7VGC2Ugpvvm+28UOmz173JNZntmzvE2QrEQ98cFiFcgna7kdSPM6YGUjnM0xqi5R3CJcKFyBtN0dV/Dp4rNQGAyILXwz39mttyy4kRZNRDRl5dPBfuO9ry3oPw2b8vDktHYdrPtrzCO9bQyze7x0fyuOY48fD6gH8IpC/bZ0KYm2lnB6VMGwQw+gYs5Da12RgptpUYVoa+bppGLhDoKRI8FDD4wdL9HFMOf+LfiExyknbCwjI6vOd75gnZd7OAcEVLqItd1aucq9rGQmxYiGtlqtL2r+Y4cGKjTbojMJPfoCoXD1I2ejNvYrq6wajjGcw/OICmMB3/25tCN3pLWnOJHE4SKTAcvXTK5+EGHEhC5xkG2m/l+w6cVEtM6omKR+qxY7pCKmI2GdtIweaq5JQTX8depB5LgP1hAOtFQ1/rKiHIdPc0WCfi6DaRQhdu6X0eCFYt7UxkYZFboWRfloJVpqkJWvsP9+WFtpXHx3+i/TFPHaaGDjqM96It9gkK8IkNkN+22er7pC0MIK07epxjkP3SH/V6XvC8gvnKFlGq6CkaJwNbLvnFKHf32JbXfOZHm9QOEa91x/WzDxYpv1o/mpbtqCFeD/5IicP3A8+mmQViDwgj4SIUJIVQXgWfYs2ixTVA0rvacfxJs8H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(3023799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VbuRPicApTONRsXcvX3RJSw3ENkg2rRzKwgFu1fF4LoJR2fppAUKOM7U7A0r?=
 =?us-ascii?Q?S0AYWytJbMnedlp1I82OgsXd/442UGX1d+XAppmJRviyWefISlyRlO3DE5gE?=
 =?us-ascii?Q?VDmLOL8BVofqAKwM7hgjr8xYA+Oauayh8GGATNOLygs7WdH5AJagpPU9xJyo?=
 =?us-ascii?Q?qhVCnnnYK2sXaxsIjgCzgM9g00rIvsZjxzLKxVdhTBEY/CKVHx1Z7L3gfCNh?=
 =?us-ascii?Q?GPgQGKmLiaEWUr/muYaBJwIVmIX0AmsWub+6n2WfTg1bwvKEhm2evOLowgRo?=
 =?us-ascii?Q?ZXabVQ3gteTRZjUTRLrahwtfjLrRh6aObwlcQQ+4fc2l4u3b3P+Zjy4PQpob?=
 =?us-ascii?Q?ZQeAf2zqBxX1qSjjuiwNaohbl+UEp/17x1QATLQsDWYwHS1s0343y/s5V/E6?=
 =?us-ascii?Q?b+R/AKmikRes3Lp6JPp/hC7dx1DgGwPEOOW3w0E6Eas95jKZO7Q3SO0jAZjy?=
 =?us-ascii?Q?r1AR6KO5XT5s8QBCT+YqZfjVVF7uJ3z9t7MSx+itNd3jkowFE25G+kPoeIum?=
 =?us-ascii?Q?gO/mQh+MShOBJG3zOzpxztCwTc/OOVqZPWzS8Fo++oPAYjPZZCw17Cf1lLz/?=
 =?us-ascii?Q?RZrJ4Wq+09xsJwoFxdC0qXe5gQ/4sz6NfKXdI51CI0NaCUmPRNhNUNu9cp3y?=
 =?us-ascii?Q?bNFGOsvMnsbJER2r8nyf6cYvQaL/T7CG7xHIfxg2vwbcw6TIZY5Hprk6vI3G?=
 =?us-ascii?Q?4/kteMa2wTuNrM1wlpDD0Cr0qyOzEiOPDErMimEoU1TYWZPSB6HIxFdbll+d?=
 =?us-ascii?Q?waHzDEcogydr84G3GFDkh7mi5im+5wu5zg/vZT+7oyC4wwIzDKfdc83UrmRx?=
 =?us-ascii?Q?Txhj73/VEKWkGS9+dXWf0YzFZCyrOZHvPgrC8y2iwMbJN0dC8+hdrk2943jL?=
 =?us-ascii?Q?66r43zkJ2TZnAXzAXVhf0D4tSwy4hXmeTrhCMkKlf4UqXA9vlsXzERhMcuGD?=
 =?us-ascii?Q?/IZxSy5HFAwIakNy+lFY1XsL84vHiL5Uu0siSPFMBBivLKz7I8PIl/Ny1lJf?=
 =?us-ascii?Q?TY5T8f+4Hk/jM5i4sH1jaiutGB+TbpCzYbKL9iZ5MIH+ETXW3TTU2niJfTR8?=
 =?us-ascii?Q?4D8DycSuLq9SFPxoKxb/TwIhkiubjHPHs802jk7UXHLtkP/VlNQ2kMWuAOP9?=
 =?us-ascii?Q?8R+8zlgYEuPFsOSxUPfYlurx5I0O/8yI6VnC3KPYAjjTerBlUG3NjVpr+vWf?=
 =?us-ascii?Q?XqLmfGrg6K9be2YNuIQwQhThHwzR7/dww8B9T0R3ZmX8Xjp+/xCjXGGIKrcY?=
 =?us-ascii?Q?60Q2JdIElYxvwBQJUmSTLRhKqlMyoyl6dS5QgkuyXf28nJeEBkaV1bB2K/wc?=
 =?us-ascii?Q?q6Y+uwr52N8irgjEswNgauOrng1MRSUuwZqMzzWmsu0wkvGvFGY8ZYmWL493?=
 =?us-ascii?Q?vhVK8UtVhgZuGp7a1lbdfX08YQc44mnbxSmF84DsnBKJvfheNI+mF0Pe6Ea4?=
 =?us-ascii?Q?j6OQjoe/wJkKKGpfMe4YDH9xxseXmWjU0bb6KO/kpkHsgExEDiuidguczV/U?=
 =?us-ascii?Q?5NakORDdk53Mse2lrymUuLOv5M2BBhEuizJp9vLHKs73N5T+uZuBPPU0SGw2?=
 =?us-ascii?Q?xBv28DDlWyWdXsMwJkkSwTjZRdnivqh0U9U/Igz5SQvte3yhcqSqH75U33fo?=
 =?us-ascii?Q?w4bNstqzPnMeysI29FMdopxvpIpvYSuPZU65ugq7hwAKNsd8gurInXocvL1u?=
 =?us-ascii?Q?9vHOCNhWsRKcCLjmyAbz+KmqG4LitEgPFYhNu3SzG88s/LCOZyGqbfR+5Ncf?=
 =?us-ascii?Q?9NijOhNZva6Js6YzUepFAdeMcDSUoF5ncLezfuw3TzXxE2q7q+Z5?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b2261427-5b75-45f1-8765-08deb237a34a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:36.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5RGytGlFMehnYhjDNOxuxmCZ5zeP8ruGMsKRE+DMT8JhHp6cziGk1VpWXXPtMO3sNBDKNpJMVQrTEUtxtaAAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3682
X-purgate-ID: tlsNG-c201ff/1778818125-DB961443-325CF7CC/0/0
X-purgate-type: clean
X-purgate-size: 9354
X-Rspamd-Queue-Id: 36305549237
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,hsr.ec:url,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim,sysreg.read:url];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Handle RIPAS changes and selected GICv3 sysreg exits. RIPAS work runs
before the next REC entry, and sysreg transfers use ESR_EL2.ISS.Rt.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/rec.c | 209 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 206 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/cca/rec.c b/xen/arch/arm/cca/rec.c
index efff7fa48745..7959fb767e11 100644
--- a/xen/arch/arm/cca/rec.c
+++ b/xen/arch/arm/cca/rec.c
@@ -399,6 +399,66 @@ static void arm_cca_set_mmio_result(unsigned long *entry_flags,
     entry_gprs[0] = value;
 }
 
+static register_t
+arm_cca_rec_exit_gpr(const struct arm_cca_rmi_rec_exit *exit,
+                     unsigned int reg)
+{
+    return reg < ARM_CCA_RMI_REC_NR_GPRS ? exit->gprs[reg] : 0;
+}
+
+static void arm_cca_rec_enter_set_gpr(register_t *entry_gprs,
+                                      unsigned int reg,
+                                      register_t value)
+{
+    if ( reg < ARM_CCA_RMI_REC_NR_GPRS )
+        entry_gprs[reg] = value;
+}
+
+static bool arm_cca_vgic_emulate_sgi1r(struct vcpu *v, register_t sgir)
+{
+    return vgic_v3_to_sgi(v, sgir);
+}
+
+static bool arm_cca_vgic_emulate_dir(struct vcpu *v, register_t dir)
+{
+    unsigned int virq = dir & GICC_IAR_INTID_MASK;
+    struct gic_lr lr;
+    unsigned int i;
+
+    /*
+     * RMM may exit to Xen for Realm ICC_DIR_EL1 accesses.  Handle the
+     * deactivation locally when Xen can find a matching software LR.
+     * DEN0137 2.0-bet1 - A6.1 Realm interrupts.
+     */
+    if ( virq >= vgic_num_irqs(v->domain) )
+        return true;
+
+    for ( i = 0; i < gic_get_nr_lrs(); i++ )
+    {
+        gic_hw_ops->read_lr(i, &lr);
+
+        if ( lr.virq != virq || !lr.active )
+            continue;
+
+        if ( lr.hw_status )
+        {
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: ICC_DIR_EL1 on hw-backed vIRQ %u is unsupported\n",
+                    virq);
+            return false;
+        }
+
+        lr.active = false;
+        gic_hw_ops->write_lr(i, &lr);
+        isb();
+        vgic_sync_from_lrs(v);
+
+        return true;
+    }
+
+    return true;
+}
+
 static void arm_cca_request_sea(unsigned long *entry_flags,
                                 register_t *entry_gprs)
 {
@@ -560,6 +620,87 @@ static void arm_cca_handle_psci_exit(struct vcpu *v,
     }
 }
 
+/*
+ * DEN0137 2.0-bet1 - D1.5.3 RIPAS change flow.
+ * RIPAS_EMPTY and RIPAS_RAM changes are applied with RMI_RTT_SET_RIPAS.
+ * RIPAS_DEV requires VDEV mapping validation support, while RIPAS_DESTROYED
+ * is not a Realm-requested target state.
+ */
+static void
+arm_cca_handle_ripas_change(struct vcpu *v,
+                            const struct arm_cca_rmi_rec_exit *exit,
+                            unsigned long *entry_flags)
+{
+    struct arm_smccc_res res;
+    paddr_t base = exit->ripas_base;
+    paddr_t top = exit->ripas_top;
+    int rc;
+
+    if ( v->domain->arch.cca.rd == INVALID_PADDR )
+    {
+        gprintk(XENLOG_ERR,
+                "ARM CCA: missing RD for RIPAS completion\n");
+        arm_cca_domain_crash(v);
+    }
+
+    switch ( exit->ripas_value )
+    {
+    case ARM_CCA_RMI_RIPAS_EMPTY:
+    case ARM_CCA_RMI_RIPAS_RAM:
+        break;
+
+    default:
+        gprintk(XENLOG_ERR,
+                "ARM CCA: unsupported RIPAS change value=%u "
+                "range=%#lx-%#lx\n",
+                (unsigned int)exit->ripas_value,
+                (unsigned long)base, (unsigned long)top);
+        arm_cca_domain_crash(v);
+    }
+
+    /*
+     * Note that RMI_RTT_SET_RIPAS uses the pending request recorded in the
+     * REC, so the Host does not pass the target RIPAS value explicitly here.
+     *
+     * Xen accepts the request while progress is possible. If a RIPAS_RAM
+     * request reaches a point the RMM cannot change, report Host rejection on
+     * the next REC_ENTER so the Realm sees the normal RSI response.
+     */
+    while ( base < top )
+    {
+        rc = arm_cca_rmi_rtt_set_ripas(v->domain->arch.cca.rd,
+                                       v->arch.cca.rec,
+                                       base, top, &res);
+        if ( rc != 0 )
+        {
+            if ( exit->ripas_value == ARM_CCA_RMI_RIPAS_RAM &&
+                 arm_cca_rmi_status_is(arm_cca_rmi_result(&res),
+                                       ARM_CCA_RMI_ERROR_RTT) )
+            {
+                /* The RIPAS response flag value 1 means Host reject. */
+                *entry_flags |= ARM_CCA_RMI_REC_ENTER_FLAG_RIPAS_RESPONSE;
+                return;
+            }
+
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: RMI_RTT_SET_RIPAS failed status=%#x data=%#lx\n",
+                    arm_cca_rmi_status_code(arm_cca_rmi_result(&res)),
+                    (unsigned long)arm_cca_rmi_result_data(
+                        arm_cca_rmi_result(&res)));
+            arm_cca_domain_crash(v);
+        }
+
+        if ( res.a1 <= base || res.a1 > top )
+        {
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: invalid RIPAS progress %#lx -> %#lx (top %#lx)\n",
+                    (unsigned long)base, res.a1, (unsigned long)top);
+            arm_cca_domain_crash(v);
+        }
+
+        base = res.a1;
+    }
+}
 
 /*
  * DEN0137 2.0-bet1 - D1.3.3 REC exit due to Data Abort fault flow.
@@ -573,6 +714,55 @@ static void arm_cca_handle_sync_exit(struct vcpu *v,
 
     switch ( hsr.ec )
     {
+    case HSR_EC_SYSREG:
+    {
+        unsigned int rt = hsr.sysreg.reg;
+        register_t val = arm_cca_rec_exit_gpr(exit, rt);
+
+        /*
+         * Realm guests use the GICv3 sysreg CPU interface:
+         * - Linux expects ICC_SRE_EL1.SRE to read as enabled.
+         * - SGI generation and explicit deactivate stay in Xen's vGIC path.
+         *
+         * DEN0137 2.0-bet1 A6.1 makes ICC_* traps System register exits,
+         * but A4.3.4.4 only guarantees ESR.  Use the Rt encoded in ESR_EL2.ISS
+         * for the transfer GPR.  Current TF-RMM clears Rt for these exits,
+         * making this equivalent to its gprs[0] convention.
+         */
+        switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
+        {
+        case HSR_SYSREG_ICC_SRE_EL1:
+            arm_cca_rec_enter_set_gpr(entry_gprs, rt,
+                                      ARM_CCA_ICC_SRE_EL1_VALUE);
+            break;
+        case HSR_SYSREG_ICC_DIR_EL1:
+            if ( hsr.sysreg.read ||
+                 !arm_cca_vgic_emulate_dir(v, val) )
+            {
+                gprintk(XENLOG_ERR,
+                        "ARM CCA: unsupported ICC_DIR_EL1 access read=%u val=%#lx\n",
+                        hsr.sysreg.read, val);
+                arm_cca_domain_crash(v);
+            }
+            break;
+        case HSR_SYSREG_ICC_SGI1R_EL1:
+            if ( hsr.sysreg.read ||
+                 !arm_cca_vgic_emulate_sgi1r(v, val) )
+            {
+                gprintk(XENLOG_ERR,
+                        "ARM CCA: unsupported ICC_SGI1R_EL1 access read=%u val=%#lx\n",
+                        hsr.sysreg.read, val);
+                arm_cca_domain_crash(v);
+            }
+            break;
+        default:
+            gprintk(XENLOG_ERR,
+                    "ARM CCA: unsupported SYSREG ec=%#x sysreg=%#lx\n",
+                    hsr.ec, (unsigned long)(hsr.bits & HSR_SYSREG_REGS_MASK));
+            arm_cca_domain_crash(v);
+        }
+        break;
+    }
     case HSR_EC_WFI_WFE:
         /*
          * DEN0137 2.0-bet1 - A4.3.4.1 REC exit due to WFI or WFE.
@@ -619,6 +809,7 @@ void noreturn arm_cca_vcpu_run(struct vcpu *v)
     struct arm_smccc_res res;
     unsigned long entry_flags;
     register_t entry_gprs[ARM_CCA_RMI_REC_NR_GPRS];
+    bool pending_ripas = false;
     int rc;
 
     ASSERT(v == current);
@@ -663,6 +854,19 @@ void noreturn arm_cca_vcpu_run(struct vcpu *v)
         arm_cca_check_for_vcpu_work(v);
         arm_cca_service_host_events();
 
+        /*
+         * RMI_RTT_SET_RIPAS can cover a large range.  The REC exit buffer
+         * remains valid until the next REC_ENTER, so complete the request
+         * here with IRQs enabled rather than in the exit dispatch path.
+         */
+        if ( pending_ripas )
+        {
+            local_irq_enable();
+            arm_cca_handle_ripas_change(v, &run->exit, &entry_flags);
+            local_irq_disable();
+            pending_ripas = false;
+        }
+
         arm_cca_prepare_rec_enter(run, entry_flags, entry_gprs);
         entry_flags = ARM_CCA_RMI_REC_ENTER_FLAG_TRAP_WFI |
                       ARM_CCA_RMI_REC_ENTER_FLAG_TRAP_WFE;
@@ -700,9 +904,8 @@ void noreturn arm_cca_vcpu_run(struct vcpu *v)
             break;
 
         case ARM_CCA_RMI_EXIT_RIPAS_CHANGE:
-            gprintk(XENLOG_ERR,
-                    "ARM CCA: RIPAS change exits are unsupported\n");
-            arm_cca_domain_crash(v);
+            pending_ripas = true;
+            break;
 
         case ARM_CCA_RMI_EXIT_SYNC:
             arm_cca_handle_sync_exit(v, &run->exit, &entry_flags,
-- 
2.51.0


