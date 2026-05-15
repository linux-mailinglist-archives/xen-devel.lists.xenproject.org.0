Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HQ+4OmKcBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07595491B6
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309339.1580378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqh-00023X-SF; Fri, 15 May 2026 04:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309339.1580378; Fri, 15 May 2026 04:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqh-00021R-Ix; Fri, 15 May 2026 04:08:31 +0000
Received: by outflank-mailman (input) for mailman id 1309339;
 Fri, 15 May 2026 04:08:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqf-0001dJ-CY
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqe-00GbfP-P5
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069bea-2eae-0a2a0a5409dd-0a2a4502b15c-44
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:28 +0200
Received: from [40.107.74.73]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c3a-af86-0a2a45020019-286b4a49ea93-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:28 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:18 +0000
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
 b=GbcqENprtW3a5Mwb+8svrbGWTpFCSK2YFMf+uXqkPTwofeR23X4JMeaJ8/ZKgLKbtNMgVL9GkR4j9TKdr4jgeidBr1PXkaS/LidFnh14ufUrhP5vh7raNFGV0hD/yRi9TC9cP2rLeqwxVV2o4WF1J92EIfgOqG7Voq9biWEjHzvJyektwmmrMszI6joQdWOSqodK4Cx963GAbd1p7edI3EaVSoT8rYbKBdq4fUya+V4PXcKEF7IwOX36nTEpc+pLtCP99d/pA9p3AWlqOsEsOzkC8mpWQ1F516YqaAr1LSV8Jk/tyDJ5qtpxYS+TC4HC6aYnXfm8QmmusQurbiuTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s+QH172YUfJAOUDShLUJeRTXERwFlsao3DnYwOTmUo=;
 b=Y3EB0DeXIYQaDPapMVEcNmN7sxJ1UxDhKvZVQ749AnR7YoIPvSbdASR1SW0mbUGQ+ugNjQ3Hgxl4a5LfIkjXcU+t3N6IjPc3efVTPdhHVOIk8KwNCesn0KdG9ncjqaYviXHByKA6wBZMOB+YpuYCC5kJ0PTKg7wdI49UFyLichjbIP557muRgNGI+ckIgCUZKN9UXCy56ARH8TvUGqa9a/cNZSul4ir6vko3qDXjPL3A/eR3Ooix8DZ6meUmIM687W+m5/LT/2OSPhxE6AwQMTEaknSgRNI6jO9aCDmcTtKDXzwA3s1N98lBjHECiCQejWb7EOSiqojvE5Bq5iNvMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s+QH172YUfJAOUDShLUJeRTXERwFlsao3DnYwOTmUo=;
 b=B9YgbavgjC+/gV79d81uQ69TMGG7NYauVJ1zfnIcIWiAmQoh+cuK6q/vOl1BQ4rSFvA6OR8DtWYihJ4iQbjT/D+x5zWACZI1SO53pgS/xUOw0FrGexrNN47nwHD+yLEOndnFwx5oBhCkshiBcrC7vnb9W6NyX9PdJr+R3d8X7BA=
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
Subject: [RFC PATCH v1 00/26] xen/arm: Initial Arm CCA Realm support
Date: Fri, 15 May 2026 13:07:46 +0900
Message-ID: <20260515040812.983626-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f67344c-1488-43a1-073e-08deb2379895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|3023799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KgD8fpFAfPLiKoE7w+9zzFThxEYmoTTy4+TXZ+Z4TzmbWt3/1HRL6rY2pneQinsXyW01adwWkbk/NEDFatdOKnchhSFFxG2JNE7HxM2+AyGmoHBNuRJBCeeXvSSrMGPUXZNv2xK6jdRXftApIV0DZFG6hxe/k00IS30OPYdP3Zu7jQ/RV73TfhCFQXuaLicVcZ425vwNBiGo7w/HM4kUMBom/NjuwhkUZ0jQcdto2PNEe4G8hZqNByZqHJMlEA04UbyL0ek0x14n90UbZqZQr1B4tumFaBMAaSN0AxsLCO4BCAQ18PcefDfF5IqiwBPjz7twPsIq2o2aXOC/V7AStdEzgMHmAfjg8mQo3bqLvbKr2fYHuVK/ZAJKDwSH1LgEOilyr9pPeUJzGgFQ3Ad/h8lMdUjkmjrctWgp2/4ZFambkTjxggcOyA1/bU3zLetOvsUgBQ6vCQLQsrwsNDXkdtJ704L0Z81DzA29bggGVN4AiJUUIVBMiklLjP2oYJR8CwTtxXHkgKoBM5Z3GrVApfHkzhblLr3IbUHij/29+z4WQfPoClW28RG74xLLhctwwBq3l3EXdgAtck8Axpe2Xh/jrMNimf2bhVBbTPc6GB3yftMU+mb+NmyxaC/oPaTq5PuSZqm4JLx4byiGqOXrIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(3023799003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KfcNTKYvViOszZyFCKYmNKVg7uqvSeKTdx6+uNDAvDclFEqvwmVt3xcknAM8?=
 =?us-ascii?Q?+8HMeksR4iA38c1aBgVd5pmysRK607q73lyAVLMCFeh84VDEIz1SEgxCyQDF?=
 =?us-ascii?Q?BkeHPwGrsVlYMGNqA6eVnE2j7wpvKnzvB6Ma6/lfGggsqoXrciVGW3ZK5fAm?=
 =?us-ascii?Q?A5MDPgsksDsDDWblafPFdAmiYLVc6urRc1vG6HIStv/rGka5Nweznr2xkYdW?=
 =?us-ascii?Q?Rzl4qIIytVTmXurlZNatZtpqdRNdLr7MPCoQxlKdwoU2fk+H6kP+eF6xzv7L?=
 =?us-ascii?Q?yEgb/cTty0hzJScAdY1+58VqGeC5VcDR4qqbsPMVcZo5xvyBZw6DcdpJMlSj?=
 =?us-ascii?Q?vsa/wEqN5Belbj51ZLd7ObWkDLFmfUlvVvP6S9YcUJVANbg7Cl1lJrKHBPtF?=
 =?us-ascii?Q?sXN0CATdpsAiOd9e0RQ5FCi8fRDQR/jBcECh5vvszLI+2wMP5JavGErXFfWR?=
 =?us-ascii?Q?IZOk8+MtQn0dkFnnGtXoR77srX4TM4ySgXV5Nj4vmWD4Zhw16S4vXH72zRTy?=
 =?us-ascii?Q?hzCh+U1tPvNEcxqvhiOKHfFYIk8wTfCTI/bHb5pPfwkstbI0zxOGD5v/8WIB?=
 =?us-ascii?Q?hd2pBoQhtqon+f2NZESBbzlXivUw265zDDbKNiI2gHmX4ef+tAUWKnXoYme9?=
 =?us-ascii?Q?vtXmVmoH8/Q8In9Auqx9jSTegkbFdc3I14T4feyuEYvaYSdv0VMnx0uyrroD?=
 =?us-ascii?Q?WcCfPUfRsnevicKh55AAvK7L+yl3iYQFJzDOJL8hWGjYXJcVtTYtg7r7fL1h?=
 =?us-ascii?Q?lT7jdPIgAA4JBImuN40V+WqrqcOZ0Stakn4mayYJbsuni3+v5zgcQ9GkkxA8?=
 =?us-ascii?Q?ez6MO8AzYZXDrAp6y7ehPd7JsyVcVPKXWf71szrNKWmI0QMsbkkWGJxn+r84?=
 =?us-ascii?Q?E4HrIDD8SjEoHyPt3M4J2CMFXhViBlzXi1yJoqLTxo7Q8AYE5Bovrgq8Kuxn?=
 =?us-ascii?Q?5/+GHgr3W5Y7QfCTvywOedTB6SomlSBiIgFoOHEquqftSkHp01rTwmQO7BNY?=
 =?us-ascii?Q?BXPMsoRr92zm7I1fsxJaR8AlukVwyhoiNVAsfLrmQXnt/SLlTpL2wecIgJWJ?=
 =?us-ascii?Q?GnPitzYPDyF4zUmbZ6PUlr/JdDCoX4UqmGVuduc834eMxu8xz0huFzaHzEv0?=
 =?us-ascii?Q?wAe29kfhbn2+s3ChmO6jy9Rt5QOsKOHr5CdnSkSsEYMlMLnRPVtAim5/OC/g?=
 =?us-ascii?Q?YYv4dOEKOFmxTV5XJ7X7xDLTsv3n06srBItoDvwFYhw9GHU7wDHMmm0RpbwB?=
 =?us-ascii?Q?E4cengyXmG4Tsgk+u23J0E8COL9hRNgqZrA2KG4HBujqvnST5wMlCqCY/uTs?=
 =?us-ascii?Q?j8UimqWZi47MGm1NdMgwOfHWJUB1ecLkUSEgAQaD4U8XZ/H4Z5phvbn6jz01?=
 =?us-ascii?Q?KxAUAPIewhVTZ80ZSO7VXL3zlmX3klpRI13CdSof63V29jy4JyCqTuRbcaDM?=
 =?us-ascii?Q?yoXxOBA8mp/SuMn6lhv9tb299EIltSBUZyF7u3oC3GNw2mhzNd94J/XMwQ4D?=
 =?us-ascii?Q?zl80oy/4C5PzMRMCZQ049+zKXZrDdqdMPOiOK1wnY4KxtPVir/36D39I50SY?=
 =?us-ascii?Q?86qJJs8o5L/M6n0nyto8iCxIShJXCXcmMmNMzMNw2uUHJ8Ym2R2ijBFzlZHg?=
 =?us-ascii?Q?ff/Fla12t6fLsvmB4yGl2BvMdNM+HtHzahiAk3IEftTWSuq+Z6DrSGxbDawd?=
 =?us-ascii?Q?1/Pmp5J9qzC2LkuN0VHR/OA6VC70q1J0No1J5kdGIyGrhLPNu00I/WQYqiLM?=
 =?us-ascii?Q?T9khUtkaRwLHzUpOaFw79++DsCnrujIN2AitFGId9qvctxUfZz6w?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f67344c-1488-43a1-073e-08deb2379895
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:18.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9N2GcaYsR36BaVhuaPoWgb8XyOwJvDU01iXLX4lwdqIubxfstn4X7g00zA46rT8ur2IpB/S+3EknnmSavKxP1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-720697/1778818108-82D6F161-C9B3AF81/0/0
X-purgate-type: clean
X-purgate-size: 9641
X-Rspamd-Queue-Id: E07595491B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:mid,valinux.co.jp:dkim,arm.com:url,gitlab.com:url];
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

Hi,

This RFC adds the first Xen pieces needed to run an Arm PVH DomU as a CCA
Realm guest on Arm RME systems. It targets the RMI v2.0 ABI described by
DEN0137 2.0-bet1 (https://developer.arm.com/documentation/den0137/2-0bet1).

The scope is intentionally narrow. The series boots a small Realm guest and
exercises the Realm lifecycle, REC entry, basic MMIO exits, PSCI, RIPAS
changes and a local attestation smoke test. It is not complete Arm CCA
support.


Preface
=======

This work was prepared independently, using public Arm CCA material as the
reference point: the RMM architecture specification, the public TF-RMM v2.0
PoC branch, and the public Arm/KVM CCA series.

I expect this series to need further respins while TF-RMM v2.0 and the KVM
CCA support, v14 at the time of writing, continue to settle. Some choices
here follow the current public PoC code rather than a tagged TF-RMM v2.0
release.

Review from people familiar with Arm CCA, RMM and the KVM CCA work would be
much appreciated. I would be especially grateful if someone from Arm could
help sanity-check the RMI/RMM assumptions, even informally.

Developed and tested with the following component revisions:
  * TF-RMM:
    commit 3340667a291a
    topics/rmm-v2.0-poc_2 branch tip as of 2026-05-14
    https://git.trustedfirmware.org/plugins/gitiles/TF-RMM/tf-rmm.git/+/3340667a291acd5722cb45d05135d7aa15174b25
  * TF-A [1]:
    commit 7ad4b5ed31e3
    https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/7ad4b5ed31e33dca21dd4d2f4a9f64f9b7d4db85
  * Arm FVP:
    FVP_Base_RevC-2xAEMvA 11.30_27
  * vanilla Linux v7.0 for both Dom0 and the Realm guest.

A runnable demo workspace is here:
https://gitlab.com/cca-for-xen-demo/cca-stack-xen-demo

The tested path is:
  * boot Xen and Dom0 on the Arm FVP Base RevC AEMvA RME model
  * create a Realm guest through toolstack
  * boot a Linux Realm guest
  * attach to the current debug vUART
  * run a local Realm attestation smoke test
  * shut the Realm guest down and relinquish the Realm resources

[1] https://lists.trustedfirmware.org/archives/list/tf-a@lists.trustedfirmware.org/message/NL63OIIDQVFGQ4TFXY7TNZS43TLLIKXD/

Overview
========

The series contains:

  * RMI v2.0 ABI definitions and SMCCC wrappers.
  * Realm domain and vCPU state.
  * Realm-owned granule tracking for RD, RTT, DATA and REC pages, plus REC
    auxiliary pages donated through SRO.
  * Host RAM tracking checks and GPT L1 setup before Xen creates Realms.
  * Stateful RMI Operation helpers for RMM, Realm and REC lifecycle commands.
  * Realm construction:
      - RMI_REALM_CREATE
      - RTT creation
      - DATA mapping with measured initial contents
      - REC creation
      - RMI_REALM_ACTIVATE
  * Realm relinquish and teardown:
      - RMI_REALM_TERMINATE
      - DATA unmap
      - RTT destroy
      - REC destroy and SRO reclaim of auxiliary pages
      - RMI_REALM_DESTROY
  * A dedicated REC execution path based on RMI_REC_ENTER.
  * Minimal REC exit handling for:
      - interrupt exits returning control to Xen
      - PSCI
      - WFI/WFE
      - RIPAS change
      - emulatable Data Abort MMIO
      - selected GICv3 sysreg exits
      - simple timer state handoff around Realm entry and exit.
  * A domctl used by libxl to finalize Realm construction.
  * A libxl/xl option, realm=true, for Arm PVH guests.


Current scope and limitations
=============================

The initial support is intentionally minimally-scoped:

  * No Dom0less Realm launch at Xen boot
  * No Xen PV interfaces for Realm guests
  * No device assignment or VDEV/VSMMU handling
  * No Multi-Plane Realms
  * No Realm LPA2, so the Realm IPA size is limited to 48 bits
  * No Realm SVE or Realm PMU
  * No selectable Live Firmware Activation policy
  * Shared MEC policy only
  * Fixed zero Realm Personalization Value
  * No guest RAM outside the first Arm guest RAM bank
  * No S2AP change handling through RMI_RTT_SET_S2AP
  * No Host call exits
  * No frontend/backend devices, virtio, or Xen grant mappings for Realm guests
  * No ACPI Realm guests
  * No non-4KB RMI granule or non-1GB tracking-region configurations
  * No shared-memory mappings through RMI_RTT_UNPROT_MAP and
    RMI_RTT_UNPROT_UNMAP
  * No hardware-backed vIRQ deactivation in the ICC_DIR_EL1 emulation path
  * No production-safe replacement for the current clear-text debug VUART.

The debug VUART is Kconfig-gated and host-visible. It is only a debug path,
not a confidential Realm I/O path.

Realm creation is intended to be libxl-driven in this RFC. libxl rejects
Realm guests whose RAM does not fit in the first Arm guest RAM bank, and
passes that single first-bank RAM range to Xen for Realm conversion.

The current Linux v7.0 Realm guest code used for testing does not issue
RSI_MEM_SET_PERM_INDEX, so the missing S2AP change flow is not exercised by
the tested boot and attestation path.

Two implementation details are worth mentioning. Initial Realm RAM
population measures every populated DATA granule. There is no
measured-range interface yet. Xen also tracks up to 64 accepted donation
pages for one memory-transferring SRO. That is a Xen implementation cap,
not an RMI limit.

Device assignment is separate work. The tested TF-RMM revision already has
some PDEV, VDEV and PSMMU code. Xen simply does not create those objects,
enable Realm DA in RmiRealmParams, or handle the related REC exits yet.


Best regards,
Koichiro


Koichiro Den (26):
  xen/arm/cca: add RMI v2.0 ABI definitions
  xen/arm/cca: add RMI v2.0 SMCCC core wrappers
  xen/arm/cca: add RMI v2.0 lifecycle wrappers
  xen/arm/cca: add Realm domain and vCPU state
  xen/arm/cca: track Realm-owned granules
  xen/arm/cca: add Realm granule helpers
  xen/arm/cca: initialize the RMM and Realm parameters
  xen/arm/cca: add shared SRO helpers
  xen/arm: vpl011: expose VPL011 presence to Arm code
  xen/arm/cca: add Realm relinquish entry point
  xen/arm/cca: terminate and destroy Realms on relinquish
  xen/arm/cca: tear down Realm DATA and RTT granules
  xen/arm/cca: destroy RECs during Realm relinquish
  xen/arm/cca: validate Realm construction inputs
  xen/arm/cca: create Realm descriptors
  xen/arm/cca: build Realm RTTs
  xen/arm/cca: populate Realm DATA granules
  xen/arm/cca: create RECs and activate Realms
  xen/arm: io: add register-backed MMIO emulation helpers
  xen/arm: vgic-v3: expose SGI emulation for Realm exits
  xen/arm/cca: add Realm vCPU timer state
  xen/arm/cca: add Realm REC enter path
  xen/arm/cca: handle Realm RIPAS and GIC sysreg exits
  xen/arm, tools: add domctl for Realm finalization
  libxl/arm: add and validate Realm guest support
  docs: arm: add an Arm CCA Realm guest guide

 docs/hypervisor-guide/arm/cca-realm.rst |   83 ++
 docs/hypervisor-guide/arm/index.rst     |    1 +
 docs/man/xl.cfg.5.pod.in                |   46 +-
 tools/flask/policy/modules/xen.if       |    1 +
 tools/include/libxl.h                   |    5 +
 tools/include/xenctrl.h                 |   12 +
 tools/libs/ctrl/xc_domain.c             |   37 +
 tools/libs/light/libxl_arm.c            |  140 ++-
 tools/libs/light/libxl_create.c         |    2 +
 tools/libs/light/libxl_types.idl        |    1 +
 tools/xl/xl_parse.c                     |    2 +
 xen/arch/arm/Kconfig                    |   25 +
 xen/arch/arm/Makefile                   |    1 +
 xen/arch/arm/cca/Makefile               |    7 +
 xen/arch/arm/cca/build.c                | 1131 +++++++++++++++++++++++
 xen/arch/arm/cca/granule.c              |  150 +++
 xen/arch/arm/cca/realm.c                |  191 ++++
 xen/arch/arm/cca/rec.c                  |  965 +++++++++++++++++++
 xen/arch/arm/cca/rmi-abi.h              |  433 +++++++++
 xen/arch/arm/cca/rmi.c                  |  441 +++++++++
 xen/arch/arm/cca/rmi.h                  |  214 +++++
 xen/arch/arm/cca/sro.c                  |  485 ++++++++++
 xen/arch/arm/cca/sro.h                  |   25 +
 xen/arch/arm/cca/state.c                |  470 ++++++++++
 xen/arch/arm/domain.c                   |   32 +-
 xen/arch/arm/domctl.c                   |   60 ++
 xen/arch/arm/include/asm/arm64/hsr.h    |    1 +
 xen/arch/arm/include/asm/cca.h          |  137 +++
 xen/arch/arm/include/asm/domain.h       |   16 +
 xen/arch/arm/include/asm/hsr.h          |    4 +
 xen/arch/arm/include/asm/mmio.h         |   11 +
 xen/arch/arm/include/asm/vgic.h         |   10 +
 xen/arch/arm/include/asm/vpl011.h       |    5 +
 xen/arch/arm/io.c                       |   99 +-
 xen/arch/arm/vgic-v3.c                  |    4 +-
 xen/arch/arm/vpl011.c                   |    5 +
 xen/include/public/domctl.h             |   12 +
 xen/xsm/flask/hooks.c                   |    3 +
 xen/xsm/flask/policy/access_vectors     |    2 +
 39 files changed, 5221 insertions(+), 48 deletions(-)
 create mode 100644 docs/hypervisor-guide/arm/cca-realm.rst
 create mode 100644 xen/arch/arm/cca/Makefile
 create mode 100644 xen/arch/arm/cca/build.c
 create mode 100644 xen/arch/arm/cca/granule.c
 create mode 100644 xen/arch/arm/cca/realm.c
 create mode 100644 xen/arch/arm/cca/rec.c
 create mode 100644 xen/arch/arm/cca/rmi-abi.h
 create mode 100644 xen/arch/arm/cca/rmi.c
 create mode 100644 xen/arch/arm/cca/rmi.h
 create mode 100644 xen/arch/arm/cca/sro.c
 create mode 100644 xen/arch/arm/cca/sro.h
 create mode 100644 xen/arch/arm/cca/state.c
 create mode 100644 xen/arch/arm/include/asm/cca.h

-- 
2.51.0


