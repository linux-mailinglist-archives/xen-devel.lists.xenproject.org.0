Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HxjF2WcBmoylQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F75491E3
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309359.1580448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqz-0004lk-Ok; Fri, 15 May 2026 04:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309359.1580448; Fri, 15 May 2026 04:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqz-0004h0-Gg; Fri, 15 May 2026 04:08:49 +0000
Received: by outflank-mailman (input) for mailman id 1309359;
 Fri, 15 May 2026 04:08:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqx-0004Hz-Ic
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqw-0051ua-V3
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c36-bab6-0a2a0a5309dd-0a2a450c90bc-16
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:46 +0200
Received: from [52.101.228.84]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c4b-62f1-0a2a450c0019-3465e45466d0-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:46 +0200
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
 b=CL7k9eAPnqhprtJL9gq5e6Uvy1RbIs0+K4ile2ZQU/gp19XQxVncZNG0Zvaog81fp/26iu51TNwGeWK6WjLPRlkWoq1WeVv7xM0CW27CI2tFEdRi+18Y8C8DKJ1GuKjsaOqoD2+KeVHd0mHl4AUiPr5SPY+cG4PDxIkj3qYgBs/WXYZR2YCOJTRp5Fgt8WMDCb2GQqMH2s+ftUZwOoybquSWEOcnZUwAwjEaqT8gOFK1T227mnLotM9sACIffpaZzaJoDA+GRYZ85NQtTng+r32GpOhRufUGmB34YErV/fbaHRATFG6wCPFy2z7PDnAoWEIiFtSzCeK3MBc9QpogIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+krazXWRn2IuLifiPb7Tk1sDo3QwLMY07VSIfj1R9Q=;
 b=JLf/JE1AvzGG77CrgGrsAcnKvu/5rl5t7Dox0sd3K0A3AGhdJmn8Q4MH6idQDO4uuK1mU2DlPCJmnY4YMzc9euGhVFm4K6C5nchPOd+Ud9wU5J/N0rKmPRws9P6Un+lKcZ8kJiuHCInDEzH7rbEdurk/6xmihINLkcEMBWBgHRCr6VJ33KDh3haqXklaWVm408zfZg39q8rjvnWoC3nteTPO9EWPgen34TpirXfFIvEVYOS+j7LzcIfHE0m/iT05RlX3pIpH67F64QVXDakpjb+YEpuga+Ykk1nySmoM+vz2ReJwJ/ooqmf1J/LbWeiVVRQ3Y92RK0oTB987GV7R/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+krazXWRn2IuLifiPb7Tk1sDo3QwLMY07VSIfj1R9Q=;
 b=MPyNR1bU7ii98HiiopIPDw1iBTNpNIDdn2KSbNyhCczDdz+Pk5z+S/ZNh3pr3iAHJHtmEBuZAqpFHetM2DMeIy4oDeG5d/FXoBoHbyeEHYjICYDrfD9j3tJW/kyIoHJhXSjhs2i4VltMZkF4/XHyARm2iS0UyZHyNxvTWSnbMW4=
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
Subject: [RFC PATCH v1 24/26] xen/arm, tools: add domctl for Realm finalization
Date: Fri, 15 May 2026 13:08:10 +0900
Message-ID: <20260515040812.983626-25-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0208.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3682:EE_
X-MS-Office365-Filtering-Correlation-Id: ca413a0f-f277-485f-1923-08deb237a3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WjI/btMcqFI0QZ2fBdJ37mLXCzdesxaTukRozNf6fW3C7Jv6PWYPrna+RiuwA67yMwdzUOgpklLV0n38DogTCIsEOzoZP1mBguUy4fP/t0A6PoAMLwmRGvVF1MAVb+O0hD1bIFn0pL9/mimfZh/xNWo8DGySx/2VG/needNjvFLFWtHbOEtBa7pYM3CQS/m/Y0ttwFbU8dgz0WJ+xEBo+1osAfYhxEoXXpNp035ISkLjxEAKdH4lFw2cGbAgWIz4lRh4ohVv1v3qrrWnRd29h7vjQidWmsGCP5KOxXix76CC1FDdh/Cfh++PvxmmFkMLFvnLto1OU7nrBMpyBLdNXdPZNAY2Bwh09G7VP+a/WH6rD0xB7aYulIC+R/G5aefRk5lvyZd8K5Xsq6bKjlC81vvSetYGP+25T8RRk/W8ywis/qHQTNLQ/73u0q/M9mCX9Oi1n46u4E35aEtrQ0sXmDP/0Ft8O/NwZci58CufHfGS9g9LBZyD3uOgE86V5Wxjv8MzT0MPWDesKCp/0ip4SVcdIhpB0C+ZcH3p8Le1cz7y0BRLYCPtB6p3cPo9ybxqBSbTDPYHMcGqr3dMxjVkIOCPsoCXkCpDJep0XvwMAHvgz8qTIVd3iNzEn6DYBS9JfDnI2swEGNzOqKcCxrj99aGHbw/43XWaQAXxj88kytlk3fQTFu6+fVBuwNpfYEr+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U+XofrQgZd0H5H47ZXWh21gtZoDVSe0ShuWC+pi9zFAohvZtQYe86iNuWIHi?=
 =?us-ascii?Q?QLiomfJkri71vUMivTAXZNHImCLsySaXkNBDmHhHbF1s0V7CoamaCZjajr7l?=
 =?us-ascii?Q?Q2VYMfTBKXIMuWqX3nHvCfzRAt4bROoS9nEOrWVKkfP/u3+31VJgIR4twOro?=
 =?us-ascii?Q?X0XFtjM1Ld6J+QcEnT8JEZQEb9f+cdv5fCUfKGYLXoXZQzkbBW8hrNr0PvPk?=
 =?us-ascii?Q?GVttty0OEf9O7Agq7TInHgRV7mBBrd71QhgtUYqFheMmuOSzcIdgDLsgwRyF?=
 =?us-ascii?Q?1xbG8JLACQNiq5oPtOXsQzzYQNsuuH83o4aiCTN96+86zqCk2Suz2uivBXdP?=
 =?us-ascii?Q?ZIJ7seVEa5z56CoBC6c53FsQQNlF3q5EU92aCAIl9wcu+VQzPgfakvoF5iwh?=
 =?us-ascii?Q?Nly0gGe/Adh7SAW/Mi3juTsHVfVMUMKqujvT53+9kS+CsrvufChPR4hle7zX?=
 =?us-ascii?Q?MPtxgPQRjcIUVqnEXrwNkpH++LstlKgw6dvjtgHOaH+FoeXTYOYjsW8+BMhH?=
 =?us-ascii?Q?TIPSxRvDrq8RhU0Akp715XlxV29BPdFY+lWwx0HugjSz1rSrC+w2/mg8IzUW?=
 =?us-ascii?Q?gNbgfiQGOwNM7L2v8XMCJcG8w98XJk6wfIRBhb1LdLQo7u0Z2dsKPB7cmTzK?=
 =?us-ascii?Q?aMNMP2K+kOMzzEFYcQEbWke5+rDl8goFJ+zMXm528Ee25lsBZkkPGTIVaJ+6?=
 =?us-ascii?Q?6MGqYIKJWVLhXaM9XJz3JQeh/BHgk9UafSGNP9pTzK66+zR7rSgHrTFrSUdO?=
 =?us-ascii?Q?/WjzkxOhmwQenVDtVy0OnaCmgMjOrXYwvgidDhYdx+dFdvbQhkR/oHfbTG0m?=
 =?us-ascii?Q?kzZdGFWSvSXlcqkzLxfPreUWoSn9FQ3kQyxZo8xb31/4NkmviSBHJn/Vq+T1?=
 =?us-ascii?Q?UuhQOOVD+P6JaMFFOgPvC4vQro3twGQFkaT2i9WYJhu+3VyVfvWmEldlD7nC?=
 =?us-ascii?Q?r4XxALkGiVxPGVpeacLxGBHUPDp2wxjuoGJYBG7Mf3yuK/r6j/aHylUbmqFQ?=
 =?us-ascii?Q?J9sZqUEQW9PN9oM/LqWAgmNxnDjSxg76rqF9IOircVJdnsAuxCjCd6+MVAFK?=
 =?us-ascii?Q?pujxmYdlfHnsBSL0LBRFClkvbbz/zCENYJ+q3fPM6lCs/0AlNVrNTyLneRX7?=
 =?us-ascii?Q?Ld1Mx6T1WQ4ZRh3TAhHe3CzXaTY6DV82R7RJN5sYQ8/FY6M/nfDeONNPc0gX?=
 =?us-ascii?Q?3cZndHYSwEFu79UEZqVTn8gHvCCmKX5wfAanCMS0V5M8Ew1sxdglXVQTufqR?=
 =?us-ascii?Q?Eot9e0GzW60BuNgTgBtW4OMIN2xnqYc/2SJDP9rmK2N46czVfxZezU8GL7nw?=
 =?us-ascii?Q?CA89c31yPhbGjOeUZwRK3r0bDdp2y8z5AoD64IuHBaypSz8ixJZ9wP1Dd07d?=
 =?us-ascii?Q?qWp5NDfe5NJTzkdx0LFJyc0+YBhqLomOZEURK/HYooBWJHdL3BDBDhO9Bj/w?=
 =?us-ascii?Q?8GkTw/bMODv2aCErysakD4U4goG9j50Lo5FDl8DUGk9RS6SWb1Y5R41F1Nzl?=
 =?us-ascii?Q?WkCpBmZYH0X+VscaowAljBzQ3IxmI9kpfsRiznIOZs7we67wIBL9+7gP2AnU?=
 =?us-ascii?Q?bquK087LCw0orDNMYfZSEXSaiN+BP6vwrOsRcri/xL7s8lg23dy/yAZu65T6?=
 =?us-ascii?Q?CLifDfqIwRglVoXPnn/M+gug2hCGrHq3catl39M5p8J/TmCIcMTZX2BZBhnD?=
 =?us-ascii?Q?DdGfgVyjrHZuQFPtM0YQG+bTzwYpeLCPKYtHSe1aVWqr51YpeTJemlBKvsUI?=
 =?us-ascii?Q?5PGtgSt98FdYw2oXemy/TV7AsdGeMZVRiWeUW5wr+oQN+mzNyTVd?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ca413a0f-f277-485f-1923-08deb237a3bd
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:37.3843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkEcoTcGI3uIg/Nj9WvUHfWEoISyR2xVINWWy+kZ2XKXN25J6kT4nA4hykN53YoJG1/+INXPZ3S3BMTACgE3XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3682
X-purgate-ID: tlsNG-d25034/1778818126-F487BCF5-411EC66D/0/0
X-purgate-type: clean
X-purgate-size: 8872
X-Rspamd-Queue-Id: ED1F75491E3
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
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

Add the domctl, libxc wrapper and XSM permission used by libxl to turn a
paused Arm guest into a Realm. RMI failures are reported back as-is.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 tools/flask/policy/modules/xen.if   |  1 +
 tools/include/xenctrl.h             | 12 ++++++
 tools/libs/ctrl/xc_domain.c         | 37 ++++++++++++++++++
 xen/arch/arm/domctl.c               | 60 +++++++++++++++++++++++++++++
 xen/include/public/domctl.h         | 12 ++++++
 xen/xsm/flask/hooks.c               |  3 ++
 xen/xsm/flask/policy/access_vectors |  2 +
 7 files changed, 127 insertions(+)

diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index ef7d8f438c65..5eb2d98341e9 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -98,6 +98,7 @@ define(`create_domain_common', `
 		vuart_op
 		set_llc_colors
 		get_domain_state
+		arm_cca_op
 	};
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c8968..149e15f7c531 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -808,6 +808,18 @@ int xc_dom_vuart_init(xc_interface *xch,
                       xen_pfn_t gfn,
                       evtchn_port_t *evtchn);
 
+/*
+ * Finalize a paused ARM domain as a Realm backed by RMM. The toolstack is
+ * expected to have already built a normal ARM guest image in the domain RAM.
+ *
+ * Returns 0 on success, or -1 with errno set. If Xen receives an RMI error
+ * result from RMM, libxc logs the raw RMI result and reports EPROTO.
+ */
+int xc_arm_cca_init_realm(xc_interface *xch,
+                          uint32_t domid,
+                          xen_pfn_t base_gfn,
+                          uint64_t nr_pages);
+
 /**
  * This function returns information about the XSAVE state of a particular
  * vcpu of a domain. If extstate->size and extstate->xfeature_mask are 0,
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 01c0669c8863..3cb8da9cc07d 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -345,6 +345,43 @@ int xc_dom_vuart_init(xc_interface *xch,
     return rc;
 }
 
+int xc_arm_cca_init_realm(xc_interface *xch,
+                          uint32_t domid,
+                          xen_pfn_t base_gfn,
+                          uint64_t nr_pages)
+{
+    struct xen_domctl domctl = {};
+    int rc;
+
+    memset(&domctl, 0, sizeof(domctl));
+
+    domctl.cmd = XEN_DOMCTL_arm_cca_op;
+    domctl.domain = domid;
+    domctl.u.arm_cca_op.cmd = XEN_DOMCTL_ARM_CCA_OP_INIT_REALM;
+    domctl.u.arm_cca_op.flags = 0;
+    domctl.u.arm_cca_op.base_gfn = base_gfn;
+    domctl.u.arm_cca_op.nr_pages = nr_pages;
+
+    rc = do_domctl(xch, &domctl);
+    if ( rc < 0 )
+    {
+        if ( domctl.u.arm_cca_op.rmi_result )
+        {
+            xc_report_error(xch, XC_INTERNAL_ERROR,
+                            "xc_arm_cca_init_realm failed with raw RMI "
+                            "result 0x%llx",
+                            (unsigned long long)
+                            domctl.u.arm_cca_op.rmi_result);
+            errno = EPROTO;
+            return -1;
+        }
+
+        return rc;
+    }
+
+    return rc;
+}
+
 int xc_domain_getinfo_single(xc_interface *xch,
                              uint32_t domid,
                              xc_domaininfo_t *info)
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f81..36461eeda633 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -16,6 +16,7 @@
 #include <xen/types.h>
 #include <xsm/xsm.h>
 #include <public/domctl.h>
+#include <public/sched.h>
 
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info)
@@ -49,6 +50,42 @@ static int handle_vuart_init(struct domain *d,
     return rc;
 }
 
+static int handle_arm_cca_init_realm(struct domain *d,
+                                     struct xen_domctl_arm_cca_op *cca_op)
+{
+#ifdef CONFIG_ARM_CCA
+    uint64_t rmi_result = 0;
+    int rc;
+#endif
+
+    if ( cca_op->flags )
+        return -EINVAL;
+
+    cca_op->rmi_result = 0;
+
+#ifdef CONFIG_ARM_CCA
+    rc = arm_cca_domain_finalize(d, _gfn(cca_op->base_gfn),
+                                 cca_op->nr_pages, &rmi_result);
+
+    /*
+     * Once Realm data conversion starts, the original guest RAM image can no
+     * longer be trusted after a failed finalization attempt.
+     */
+    if ( rc == -EIO )
+        domain_shutdown(d, SHUTDOWN_crash);
+
+    if ( rc == -EIO && rmi_result )
+    {
+        cca_op->rmi_result = rmi_result;
+        return rc;
+    }
+
+    return rc;
+#else
+    return -EOPNOTSUPP;
+#endif
+}
+
 long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
@@ -177,6 +214,29 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return rc;
     }
+    case XEN_DOMCTL_arm_cca_op:
+    {
+        struct xen_domctl_arm_cca_op *cca_op = &domctl->u.arm_cca_op;
+
+        switch ( cca_op->cmd )
+        {
+        case XEN_DOMCTL_ARM_CCA_OP_INIT_REALM:
+        {
+            long rc = handle_arm_cca_init_realm(d, cca_op);
+
+            if ( rc == -ERESTART )
+                rc = hypercall_create_continuation(__HYPERVISOR_domctl,
+                                                   "h", u_domctl);
+            else if ( rc == -EIO && cca_op->rmi_result &&
+                      copy_to_guest(u_domctl, domctl, 1) )
+                rc = -EFAULT;
+
+            return rc;
+        }
+        default:
+            return -EINVAL;
+        }
+    }
     case XEN_DOMCTL_dt_overlay:
         return dt_overlay_domctl(d, &domctl->u.dt_overlay);
     default:
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7cd..2562647d93d3 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1201,6 +1201,16 @@ struct xen_domctl_vuart_op {
                                  */
 };
 
+/* XEN_DOMCTL_arm_cca_op */
+struct xen_domctl_arm_cca_op {
+#define XEN_DOMCTL_ARM_CCA_OP_INIT_REALM  0
+        uint32_t cmd;              /* IN - XEN_DOMCTL_ARM_CCA_OP_* */
+        uint32_t flags;            /* IN - reserved, must be zero */
+        uint64_aligned_t base_gfn;   /* IN - first guest RAM gfn to protect */
+        uint64_aligned_t nr_pages;   /* IN - number of 4K pages to protect */
+        uint64_aligned_t rmi_result; /* OUT - raw RMI result on -EIO */
+};
+
 /* XEN_DOMCTL_vmtrace_op: Perform VM tracing operations. */
 struct xen_domctl_vmtrace_op {
     uint32_t cmd;           /* IN */
@@ -1368,6 +1378,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
 #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
+#define XEN_DOMCTL_arm_cca_op                    91
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1429,6 +1440,7 @@ struct xen_domctl {
         struct xen_domctl_monitor_op        monitor_op;
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
+        struct xen_domctl_arm_cca_op        arm_cca_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
         struct xen_domctl_paging_mempool    paging_mempool;
 #if defined(__arm__) || defined(__aarch64__)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 28522dcbd271..f95552992a26 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -805,6 +805,9 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     case XEN_DOMCTL_vuart_op:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VUART_OP);
 
+    case XEN_DOMCTL_arm_cca_op:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__ARM_CCA_OP);
+
     case XEN_DOMCTL_get_cpu_policy:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_CPU_POLICY);
 
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index bbb9c117ec4a..dee895bef673 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -253,6 +253,8 @@ class domain2
     set_llc_colors
 # XEN_DOMCTL_get_domain_state
     get_domain_state
+# XEN_DOMCTL_arm_cca_op
+    arm_cca_op
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.51.0


