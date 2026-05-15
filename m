Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMFuAmOcBmoHlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1045F5491B9
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309337.1580356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqe-0001Tu-Ud; Fri, 15 May 2026 04:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309337.1580356; Fri, 15 May 2026 04:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqe-0001QW-QF; Fri, 15 May 2026 04:08:28 +0000
Received: by outflank-mailman (input) for mailman id 1309337;
 Fri, 15 May 2026 04:08:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqd-0001NR-SY
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqd-00GbfP-8j
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c0b-2eae-0a2a0a5409dd-0a2a4504bda6-36
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:26 +0200
Received: from [52.101.125.129]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c35-1dec-0a2a45040019-34657d8136d2-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:26 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:20 +0000
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
 b=fsBNMxPdzUGbCqyDTUfE0JdM1ndGTEDEJAhNShKaXKWqiWyEzkRN4HarF6XjiFzuv0mDoKty6Aarw8jAdG5HBO76Y+Pow+qBUTzno0yE7JraKuXG/mre4VCu7VpzuIeOejIqFFeS40K8prRER3ha+j3TuSspJ+UQ6YIu85T3YtfZ3NwM0vpJD//oHdtO7qN73lOsUStGtnvEAvMsYV27/JjzNAlKlWfm0KUQrCzLtUFophM2CyhsbeWiz8vdelx4ulIy5ymZaq7V5P4oqPt+zfXcbRfafnqxKBQjitKgwIiW46VYrzVDNHIRpauUphHloZm3xerewlv0K7zD5/SjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+LWGLET1pPPxjg9pYTqsoCrj/kofsydU9ywUKvFgV0=;
 b=WzF2LBA7mlelkQLIqFzGBJkUXWmw0FoRCrijYvapMbsZ5tsY37dBrs0GI7TYZLIaslVib9DO3McvX7UWv8JbFfGKr9I18Uziy/pqIN02iF73pFWbFPCOQGs5rE03ClgQlrII0CUkiD4UM0GrSPHz/PsPEGNWikjG+Dq36ZLD6oXt3kyy5Sp1F/g3Qotb/iigvA8yOmIsB4abBFxfJOqPukGzM/Vd0j1pYyKMbUxUvTYayEomoeEtKBObveIFg4AUCJ8kkHiuGsLwYpr7nboNOCSm7tfwEmLKoLxV7A/9MJREAWsqPss1Q6uTsQVB55hr6tLiWEha9j0cwyBAyTE1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+LWGLET1pPPxjg9pYTqsoCrj/kofsydU9ywUKvFgV0=;
 b=t6ey0ZgpEWUB3nPmyfpP5JY1U8zRruXCdTftNX9JtSUEEuRUgMD0qYo/X9RhyArS0JWevAt4c5R4GY/Se8CuHoSVxeCeDdMwx9LPTo3KHGe0XKMIW+QZJjoJBZXVzl4IEpRg3FOpIpsRw5G+ZvTjObttwTglIm8H29T8kSjY2Jc=
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
Subject: [RFC PATCH v1 02/26] xen/arm/cca: add RMI v2.0 SMCCC core wrappers
Date: Fri, 15 May 2026 13:07:48 +0900
Message-ID: <20260515040812.983626-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: eccc8f08-adf6-4905-2cc4-08deb2379985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ktjp5SOA5ZmootcF7MkvC1UkSmJ08GXJujPkRQYVUI1UBOP9WMgrywzdgvKLd/d+BrhBmjkFxL8Gm0/9JTqotZDl/qmp5MDbMqWvfZaBirRo6llDO4epD8aNn7q9EijdJWA+yqoxvdFUfGmbNVHw4eZICxdPO1sM3sQ841+oIjXqw72w1ZCl2z7527aZOE/E69LAKdCHqbeif5zVl72atu1IA0VWWJUWjAzD263ONkkpkj/B5RiI5N+zJRX6G0l6j0CZD7006r00mSZHpWOaKyCvrxGTUrk3Gt0wKnZI7mLIK/fzw8VzUXHyqI147rgWVbNsW4lGjzQbecZOAqlkvf0MA1fVegYJ1jJKPWMZ5FbQboVcfpIWKVEi9o7Z3ndDvo895T8W6ehL9kc2pEKvD70lawXPMG59o3Dt0CApb3gqHmQwfLP8ffxkr4wnN2EsyhrXpmkUskMUXULGyL5aGggxYiRjIpiPkcoxGkGY//WF3zGkx1oY8jWfaAJhvxDj+I1UYhbRq1eSkPUUT878awVSFUT/hs0U7CfkxvhrQezE+QHqcxE3ikArk19iY6aUbPVSLs4itVn7eigqVNDpHakNRqjo2i7AYxUFZWqClektid5FP/y8Gj2rgKbwIKqu3nVGRXukaagpaqnAZD5s9/M7TURi12LssV4YxiDM5I5kejEsijA2eOOtMukIhWeE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MzikmfylkyWYuwHXBbTVJI3zBFFxCQiuyDHl6jfx5mY6QdNm8JxMaTe5GtPV?=
 =?us-ascii?Q?0/5Km5GhbfJtfHv8PlvMFa9aGiDxO6FlXWQ9SL+lc+kvVWe7GfdbI3Np/jUz?=
 =?us-ascii?Q?EqExI0r0Xi+3MJ2TTtddCI3WrWnQZrFb20FXJIF8dGPN6Xo2j0dFyJaQnNLW?=
 =?us-ascii?Q?4hNwGZX4DUi4uRhZUu2+kkKWo22C+QMlESNNxZD4mzduyJ6Uot8KavOCN6QJ?=
 =?us-ascii?Q?7S77umBjN3ENMDtAVqmH8pO3R7JzqiYp+D6lCBtxxS6itvLTYEMQuPDDgIcb?=
 =?us-ascii?Q?6ldMJZodV8CoS3xQejR8sy30K1f2r9WcSXtDdNrd5oT0CtPcJkDrNanBcrEM?=
 =?us-ascii?Q?PGLv8DjmTbydRA68MIEhghfKm+w2Dq179v/OLHGKxpc/mqnNYHN5bbvx3X4e?=
 =?us-ascii?Q?A7C4wFWrql/J/PltxIrh1VuvjNE0MQXMDH6Gv33SpeUefxsLx359zLxoCZsb?=
 =?us-ascii?Q?Ks9LuvJFAZiSjGzOPMMdQrs3g4p/d3kFdJRlcmZAE7wOUkanQXwh5TYKixkE?=
 =?us-ascii?Q?mMeWEkKdA2cTDUO3RS34N4dT8uVz6+VJTdS+OZIMvbhpQY60Jmz9TaJLOWtv?=
 =?us-ascii?Q?muZqyqbjQRuLzEgQQYfnZ/vAndNXFMvk4AWI+iRXjl+AXnDRe74zKlhUl4cv?=
 =?us-ascii?Q?UR1r4tK4IMuUKlwoqgAvB4KxxxBmWdcCVnAyYYhbn2NOAtGt1tQNmQ3zN0kD?=
 =?us-ascii?Q?Hae0yHFsBUoJcfvonRFLOvPYnW5rRP5mx39yW6LdXmFmCQKBX51wINgaxmfv?=
 =?us-ascii?Q?2hDdIuS6/a4Wxg+T4xHYiNb6TQnk000cJJL4L5hNu1IV1af9IE1/0PsLdMGF?=
 =?us-ascii?Q?gOg4HFhkizlJH2UNlnJKv+T6egZBdy954GLHoUGxfz1Bf/oFc1o8Hn+ztIKR?=
 =?us-ascii?Q?lQ2j1btZ7FRF3mmzaxW874WpyZEr/nDh6+bNfUA1yWtJ6nQtBCnaSJVkV0Th?=
 =?us-ascii?Q?/bSldMXnjv9JU3VFpp2gPrRe6JeaFEDRH0VTZfnu5QpsnpM2x6oOpb+Rc900?=
 =?us-ascii?Q?KjL6VXjEF/4/Xn8d3BR7QXKNYFFHVlSuLYFjV+Jox58QJUUjEKPyTaFkVxDj?=
 =?us-ascii?Q?ysIlCABiciryRG6SVLawAcAjyaFPQwd+pA1zW4lBcnmov5khZZMH0sqqyh9U?=
 =?us-ascii?Q?qC9qJS3J8KcKiMKExwFLbwag3cIC3t0/jUfbTxBK2Mi+w5XP+RKjdXOXNqMs?=
 =?us-ascii?Q?cBd/9Xco3CYnU0s0diXNIMIIXnOHYWLU5TNAWC8LBBrplKDgSGBiCXX1rrUG?=
 =?us-ascii?Q?zoSbg5iDrKUEewuZzViVNN3qRPnwQ6QY7siJIEIFeD0kgleISzqZzqw4M54h?=
 =?us-ascii?Q?DqexADQ8WA78jpbT0jGAvyP45UVDgUFlxGrFlJ3pPSyNdiSAq4NFZH4sQ72e?=
 =?us-ascii?Q?YKKe+z5FLzw5QfLtZenO6nLHw7eIoMzPDvZoVhFdmCCUnYTulf/hckYSzhpw?=
 =?us-ascii?Q?nPevvTS/sbhhww2aFNZoGQEEqWAp2zGgP5mI1ia4UsQBh8AvBAVg+09p2LAo?=
 =?us-ascii?Q?tUaQ/bBRSvAWIs5xaID+Tto3ZxvrCSo+G2J1EexXvwrcw60FJPnGpAoW+5Tc?=
 =?us-ascii?Q?RH64qsJAVl0x0aP4owrOMIgrzMaFDv3fPo+sY3ugKNCV2U8YF+HL6DwBtyYa?=
 =?us-ascii?Q?tD0H3kZ9NufytGRTVJ8MgWhoVlKvDYak52MK30V1KIriracyAbnOywAYEZ49?=
 =?us-ascii?Q?FxotZkWI50eakz2xQHwpwpHoz0gxYJsL4gQheRs4S6I7HYCIwkBuYDAwEpjx?=
 =?us-ascii?Q?5JnsR1tDV1/2xD34hqgUgaUeURL+CUUgxDNBAclAX6DFxjF81Xpn?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: eccc8f08-adf6-4905-2cc4-08deb2379985
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:20.2334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgc96NLvs5dmVvzHBBLcachmHOSpTKY63oMlbxaSG+/TUpR3Xjt+16jFuykAC9Axj3rcjcL9U3X034acG73OSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818106-2A5603FF-DB93292C/0/0
X-purgate-type: clean
X-purgate-size: 11679
X-Rspamd-Queue-Id: 1045F5491B9
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

Add the common SMC path and the early RMI calls used to probe and
configure the RMM. The rest of the series can build on typed helpers
rather than spelling out registers each time.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/Kconfig      |  14 ++++
 xen/arch/arm/Makefile     |   1 +
 xen/arch/arm/cca/Makefile |   1 +
 xen/arch/arm/cca/rmi.c    | 170 ++++++++++++++++++++++++++++++++++++++
 xen/arch/arm/cca/rmi.h    | 126 ++++++++++++++++++++++++++++
 5 files changed, 312 insertions(+)
 create mode 100644 xen/arch/arm/cca/Makefile
 create mode 100644 xen/arch/arm/cca/rmi.c
 create mode 100644 xen/arch/arm/cca/rmi.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 79622b46a10d..dc99020c96de 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -118,6 +118,20 @@ config ARM_EFI
 	  UEFI firmware. A UEFI stub is provided to allow Xen to
 	  be booted as an EFI application.
 
+config ARM_CCA
+	bool "Arm Confidential Compute Architecture support (UNSUPPORTED)" if UNSUPPORTED
+	depends on ARM_64 && MMU
+	default n
+	help
+	  Build Xen's Arm CCA / RMM support for Arm Realm guests on
+	  Armv9 platforms.
+
+	  This enables the NS hypervisor-side Realm creation and execution
+	  paths, including the RMI ABI wrappers, Realm build/finalize
+	  flows and REC run loop.
+
+	  This support is experimental. If unsure, say N.
+
 config GICV2
 	bool "GICv2 driver"
 	default y
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 982c6c396a05..953dcbbe6626 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -8,6 +8,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
 obj-y += platforms/
 endif
 obj-y += firmware/
+obj-$(CONFIG_ARM_CCA) += cca/
 obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o
 
diff --git a/xen/arch/arm/cca/Makefile b/xen/arch/arm/cca/Makefile
new file mode 100644
index 000000000000..9c351f901dfd
--- /dev/null
+++ b/xen/arch/arm/cca/Makefile
@@ -0,0 +1 @@
+obj-y += rmi.o
diff --git a/xen/arch/arm/cca/rmi.c b/xen/arch/arm/cca/rmi.c
new file mode 100644
index 000000000000..d37f1226f834
--- /dev/null
+++ b/xen/arch/arm/cca/rmi.c
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Internal Xen RMI command wrappers for DEN0137 2.0-bet1 / RMI v2.0.
+ */
+
+#include <xen/errno.h>
+
+#include <asm/processor.h>
+#include <asm/smccc.h>
+
+#include "rmi.h"
+
+#define ARM_CCA_RMI_INITIATE_SRO_BUSY_RETRIES 1000000U
+
+static void arm_cca_rmi_invoke(unsigned long fid,
+                               unsigned long arg0,
+                               unsigned long arg1,
+                               unsigned long arg2,
+                               unsigned long arg3,
+                               unsigned long arg4,
+                               struct arm_smccc_res *res)
+{
+    arm_smccc_1_0_smc(fid, arg0, arg1, arg2, arg3, arg4, 0, 0, res);
+}
+
+static int arm_cca_rmi_initiate_sro(unsigned long fid,
+                                    unsigned long arg0,
+                                    unsigned long arg1,
+                                    unsigned long arg2,
+                                    unsigned long arg3,
+                                    unsigned long arg4,
+                                    struct arm_smccc_res *res)
+{
+    unsigned int retries = 0;
+
+    /*
+     * Conform to DEN0137 2.0-bet1 B4.3.2.5 Programming model for an SRO:
+     * retry the initiating command while it returns RMI_BUSY.  Once a handle
+     * is returned, progress is driven through RMI_OP_CONTINUE.
+     *
+     * Initial RMI_BUSY is expected to be transient.  Keep the retry loop
+     * finite so a broken RMM cannot spin Xen forever.
+     */
+    while ( true )
+    {
+        arm_cca_rmi_invoke(fid, arg0, arg1, arg2, arg3, arg4, res);
+
+        if ( !arm_cca_rmi_status_is(arm_cca_rmi_result(res),
+                                    ARM_CCA_RMI_BUSY) )
+            return 0;
+
+        if ( retries == ARM_CCA_RMI_INITIATE_SRO_BUSY_RETRIES )
+            return -EBUSY;
+        retries++;
+
+        cpu_relax();
+    }
+}
+int arm_cca_rmi_version(unsigned long requested_revision,
+                        unsigned long *revision_lower,
+                        unsigned long *revision_higher)
+{
+    struct arm_smccc_res res;
+    int rc;
+
+    arm_cca_rmi_invoke(ARM_CCA_RMI_VERSION_FID,
+                       requested_revision, 0, 0, 0, 0, &res);
+
+    rc = arm_cca_rmi_res_to_errno(&res);
+
+    if ( revision_lower != NULL )
+        *revision_lower = res.a1;
+
+    if ( revision_higher != NULL )
+        *revision_higher = res.a2;
+
+    return rc;
+}
+
+unsigned long arm_cca_rmi_features(unsigned long index)
+{
+    struct arm_smccc_res res;
+
+    arm_cca_rmi_invoke(ARM_CCA_RMI_FEATURES_FID, index, 0, 0, 0, 0, &res);
+
+    return arm_cca_rmi_res_to_errno(&res) ? 0 : res.a1;
+}
+
+int arm_cca_rmi_rmm_config_get(paddr_t cfg_ptr, struct arm_smccc_res *res)
+{
+    arm_cca_rmi_invoke(ARM_CCA_RMI_RMM_CONFIG_GET_FID,
+                       cfg_ptr, 0, 0, 0, 0, res);
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_rmm_config_set(paddr_t cfg_ptr)
+{
+    struct arm_smccc_res res;
+
+    arm_cca_rmi_invoke(ARM_CCA_RMI_RMM_CONFIG_SET_FID,
+                       cfg_ptr, 0, 0, 0, 0, &res);
+
+    return arm_cca_rmi_res_to_errno(&res);
+}
+
+int arm_cca_rmi_rmm_activate(struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_RMM_ACTIVATE_FID,
+                                  0, 0, 0, 0, 0, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_granule_tracking_get(paddr_t base, paddr_t top,
+                                     unsigned long *category,
+                                     unsigned long *state, paddr_t *out_top)
+{
+    struct arm_smccc_res res;
+    int rc;
+
+    arm_cca_rmi_invoke(ARM_CCA_RMI_GRANULE_TRACKING_GET_FID,
+                       base, top, 0, 0, 0, &res);
+
+    rc = arm_cca_rmi_res_to_errno(&res);
+    if ( rc != 0 )
+        return rc;
+
+    /*
+     * Note that X3 is not defined by DEN0137 2.0-bet1 B4.5.10.1.3.  The
+     * tested TF-RMM v2.0 PoC branch, also followed by the KVM host series,
+     * returns range progress there.
+     */
+    *category = res.a1;
+    *state = res.a2;
+    *out_top = res.a3;
+
+    return 0;
+}
+
+int arm_cca_rmi_gpt_l1_create(paddr_t base)
+{
+    struct arm_smccc_res res;
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_GPT_L1_CREATE_FID,
+                                  base, 0, 0, 0, 0, &res);
+    if ( rc != 0 )
+        return rc;
+
+    if ( arm_cca_rmi_is_success(&res) ||
+         arm_cca_rmi_status_is(arm_cca_rmi_result(&res),
+                               ARM_CCA_RMI_ERROR_GPT) )
+        return 0;
+
+    /*
+     * Xen CCA supports immediate GPT L1 creation, or an existing GPT L1
+     * reported as RMI_ERROR_GPT.  If creation needs a memory-transferring
+     * SRO, leave CCA unavailable for now.
+     */
+    if ( arm_cca_rmi_status_is(arm_cca_rmi_result(&res),
+                               ARM_CCA_RMI_INCOMPLETE) )
+        return -EOPNOTSUPP;
+
+    return arm_cca_rmi_res_to_errno(&res);
+}
diff --git a/xen/arch/arm/cca/rmi.h b/xen/arch/arm/cca/rmi.h
new file mode 100644
index 000000000000..4cd0bc64ccf5
--- /dev/null
+++ b/xen/arch/arm/cca/rmi.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Internal Xen RMI command API.
+ *
+ * This header exposes typed wrappers and helpers for the subset of RMI
+ * commands used by Xen. Raw ABI constants live in rmi-abi.h.
+ */
+#ifndef ARM_CCA_RMI_H
+#define ARM_CCA_RMI_H
+
+#include <xen/bitops.h>
+#include <xen/bug.h>
+#include <xen/errno.h>
+#include <xen/page-size.h>
+
+#include <asm/smccc.h>
+
+#include "rmi-abi.h"
+
+static inline uint64_t arm_cca_rmi_field_get(uint64_t value,
+                                             unsigned int shift,
+                                             unsigned int width)
+{
+    ASSERT(width != 0 && shift < 64U && width <= 64U - shift);
+
+    return (value & GENMASK_ULL(shift + width - 1, shift)) >> shift;
+}
+
+static inline uint64_t arm_cca_rmi_result(const struct arm_smccc_res *res)
+{
+    return res->a0;
+}
+
+static inline bool arm_cca_rmi_is_success(const struct arm_smccc_res *res)
+{
+    return arm_cca_rmi_result(res) == ARM_CCA_RMI_SUCCESS;
+}
+
+static inline bool arm_cca_rmi_result_is_smccc_unknown(uint64_t result)
+{
+    return result == (uint64_t)ARM_SMCCC_ERR_UNKNOWN_FUNCTION;
+}
+
+static inline unsigned int arm_cca_rmi_status_code(uint64_t result)
+{
+    return arm_cca_rmi_field_get(result, ARM_CCA_RMI_RESULT_STATUS_SHIFT,
+                                 ARM_CCA_RMI_RESULT_STATUS_WIDTH);
+}
+
+static inline uint64_t arm_cca_rmi_result_data(uint64_t result)
+{
+    return result >> ARM_CCA_RMI_RESULT_DATA_SHIFT;
+}
+
+static inline bool arm_cca_rmi_status_is(uint64_t result, unsigned int status)
+{
+    return arm_cca_rmi_status_code(result) == status;
+}
+
+static inline bool arm_cca_rmi_status_is_error(uint64_t result)
+{
+    unsigned int status;
+
+    if ( arm_cca_rmi_result_is_smccc_unknown(result) )
+        return false;
+
+    status = arm_cca_rmi_status_code(result);
+
+    switch ( status )
+    {
+    case ARM_CCA_RMI_ERROR_INPUT:
+    case ARM_CCA_RMI_ERROR_REALM:
+    case ARM_CCA_RMI_ERROR_REC:
+    case ARM_CCA_RMI_ERROR_RTT:
+    case ARM_CCA_RMI_ERROR_NOT_SUPPORTED:
+    case ARM_CCA_RMI_ERROR_DEVICE:
+    case ARM_CCA_RMI_ERROR_RTT_AUX:
+    case ARM_CCA_RMI_ERROR_PSMMU_ST:
+    case ARM_CCA_RMI_ERROR_DPT:
+    case ARM_CCA_RMI_ERROR_GLOBAL:
+    case ARM_CCA_RMI_ERROR_TRACKING:
+    case ARM_CCA_RMI_ERROR_GPT:
+    case ARM_CCA_RMI_ERROR_GRANULE:
+        return true;
+
+    default:
+        return false;
+    }
+}
+
+static inline int arm_cca_rmi_result_to_errno(uint64_t result)
+{
+    /*
+     * SRO progress states are not errno failures.  The SRO helpers keep
+     * inspecting the raw result in X0 through struct arm_smccc_res.
+     */
+    if ( result == ARM_CCA_RMI_SUCCESS ||
+         arm_cca_rmi_status_is(result, ARM_CCA_RMI_INCOMPLETE) ||
+         arm_cca_rmi_status_is(result, ARM_CCA_RMI_BUSY) )
+        return 0;
+
+    if ( arm_cca_rmi_result_is_smccc_unknown(result) ||
+         arm_cca_rmi_status_is(result, ARM_CCA_RMI_ERROR_NOT_SUPPORTED) )
+        return -EOPNOTSUPP;
+
+    return -EIO;
+}
+
+static inline int arm_cca_rmi_res_to_errno(const struct arm_smccc_res *res)
+{
+    return arm_cca_rmi_result_to_errno(arm_cca_rmi_result(res));
+}
+int arm_cca_rmi_version(unsigned long requested_revision,
+                        unsigned long *revision_lower,
+                        unsigned long *revision_higher);
+unsigned long arm_cca_rmi_features(unsigned long index);
+int arm_cca_rmi_rmm_config_get(paddr_t cfg_ptr, struct arm_smccc_res *res);
+int arm_cca_rmi_rmm_config_set(paddr_t cfg_ptr);
+int arm_cca_rmi_rmm_activate(struct arm_smccc_res *res);
+
+int arm_cca_rmi_granule_tracking_get(paddr_t base, paddr_t top,
+                                     unsigned long *category,
+                                     unsigned long *state, paddr_t *out_top);
+int arm_cca_rmi_gpt_l1_create(paddr_t base);
+
+#endif /* ARM_CCA_RMI_H */
-- 
2.51.0


