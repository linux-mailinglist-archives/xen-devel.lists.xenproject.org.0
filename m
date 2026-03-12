Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKl0FbMls2nMSgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2B2797EE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252991.1549399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mso-0006Es-Ju; Thu, 12 Mar 2026 20:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252991.1549399; Thu, 12 Mar 2026 20:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mso-0006CH-GK; Thu, 12 Mar 2026 20:43:50 +0000
Received: by outflank-mailman (input) for mailman id 1252991;
 Thu, 12 Mar 2026 20:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBWs=BM=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w0msm-0006Bj-Tj
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 20:43:49 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ae14ef8-1e54-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 21:43:47 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB6870.namprd03.prod.outlook.com (2603:10b6:510:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 20:43:41 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 20:43:41 +0000
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
X-Inumbo-ID: 2ae14ef8-1e54-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGf/mwDyAxINgSyzaYTGJnGnmixWrLchijbMrgcW/B3ICoAbfxC69f8l400uPpaDqKw1ZxxpYtJ2uD1ItxE3ETX9f11pzHLPqiF2R0zuSe2filfMWX4hZsZeOqkNuzTP1ZAXUm++K4MzutBnLPzHgB8BwJ9Ctk3pKuy7i4IRgAPfd3SiJtMFZZSBW1orsNssI5XU/L8CvsCz5JFAvWbQWMGRgOLqFa6XrqanqcG16AQ63MTgSVpD5V9wRuXSP1XV45zW3amqgO2uhCwxVYhbrA8KP9knnF0AXkJbnWGASC3QBBAkMoS7nnSLQQeoox6VcZ/zW7S2yJsqsmH5hzoBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvFBMjf1ft6LJLJ/hREPupitDQ4FviVQPCRmbRd33PU=;
 b=cpYrdmJYsg6Q50MljJnKapeMimkpjbOh6AMjWdjnFZIOqF+B9Q9/KpUuwfYfLDmYmKwqL2iT6utqjRFGlv/HFUOsPi4NLhLXrll3qgx4ryB09AYKnkVu6vObdp+I8cD4U5eLZIZGh7qJJJ4h1uF7R1ZgoEYve04mIcvZ1N7e9aMPLtnkqcU0Wb0qnRckuWpcSOQv7VKGC9yjnOWUKGUeoTnlokz/a0v24GOFkqoRoY9M0gSyxlZGptDB0Zbzgg9NuWD4GChBoaw5rnfpwTuxIDkZNfXxd0rIaRuA2LHs+n7HyoIO15D0DFTKO91EJSDq756fccgnYHgW+FCIm8/zxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvFBMjf1ft6LJLJ/hREPupitDQ4FviVQPCRmbRd33PU=;
 b=AgSZn4GI0xS5mdvKi/7B4ePqWpAhcakKqSM4rNSDgl+PS3ya5UX+QPP3y5TUfP6nQqZ+LKUCH9IkWPc0oMpsruw/uMPcILxK0m/Wyi7rWqwfhR/djsHmS7sJGtesfFDmn0SG/RxTiAekRv4E6kV7J757uRb3GrhnvPhD7pvhuvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v2 0/7] Remove x86 prefixed names from cpuinfo
Date: Thu, 12 Mar 2026 20:43:32 +0000
Message-ID: <20260312204339.740403-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH0PR03MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 620c0013-b602-47d2-df9c-08de80780b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uPp6Q+1NxoTpsjB3cYRrcs21u3ZgHSk8gETDqAl6t82p+H80RX8OqmIKiQcOxA0ygwRYS/YcREp92k9ZxVsMXEO+bkNx5JrpNY4HUsVfiXFK6oxHxFMVim1M0ZGXWwcXzRmkrEUGoBRqIi9ZNM2o1x7hc1cGh32/qVAWkPNtsmHjHqlnwB484NbgzQu4sGT2kdC2UQRjwhicUB1C2P1sTLixWno7fayYGLu3KpGSrZ0Bp4YG+AekWa5G23wiPooF1lFfkPDUzsvJP4TRAWUGXPSG8NJDLkX2SNvqV9OlHVQ0r1JRQxKonsSV8r5EkjF0sEIkPTGNqQKYJ1j+zOGv4C8EPyShR/vzdhyfghJSDkvK2SyaNf+GldeL/OBxPffYzf40Mw2FQ4rtaGfJV8zsP2+zDs3DGUPm6DAaGm3U3WkRRWm6kQ0/df3x5CyQdhGL8TVZX8jDanlOCVWOiETKutdWx+c10QBrIh8nBjHBpWA2iNSMaDLygb2ZsJPVaxSOvClzQtqhqduOSMCtRr+57Yx6bqQA6iVpfWKLt600CAC2oS0hbgHyKInbrNIQAKs9vVPfP2Z5g5tVZbhSGtVgeV6Ipy6ptSnnHCe2hS90gETk3LSuAsouRfK6x2JOpnNmTV8sOa6kPnJk8JT56ULRZeTqF6HTjai2xdKhMlnUQvz2/u3WxXJPLEj1HcKeVz8ZpbfOhf/A9fg/iXME5w55tNrKnBJvpcQ86zxBUbOv7sg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ZQDxZzmp0UBOnfvRs1+TU/75W0Matmm8gt+HjGKPAkt5s1BBA5mwhDT0wp0?=
 =?us-ascii?Q?EuC+Y3CFnK/FhwDn8T5xhvEV3jshxut0B6trAxeemcDsxw4wPjjXGztUf8Kg?=
 =?us-ascii?Q?Hvm9QieOo2zGYxba3vOouQUzAmifYOPpCaY5IX2S47Yp8bB8vop7LtbQhzJ2?=
 =?us-ascii?Q?XYvHnMDSqRGcRD/bQjOe/gzz4kxdSIP8DPeYTbXo0gsSpd+FxL1v4fp9X5fc?=
 =?us-ascii?Q?WE4r+2VQSL4NesVilL4U8w/smog47np25fwn5EYe2fzCJr0RyhuV0gxJzXwL?=
 =?us-ascii?Q?/pyX8ma8h0lKQfHRE/6kKlZiYplK6BneYIYkdRshZpAW5MJk/7gENo/nzH1O?=
 =?us-ascii?Q?2un4NpIYGayWSeyG3WSVr4/jy8AELBXiSl011OkI7wNDmNmlXe2TwbyEad2r?=
 =?us-ascii?Q?gFSbGD5+TYIbuXAvWP4cwe28ZducrdK30N477oejv95WT4iyM0djMcBB0ANn?=
 =?us-ascii?Q?v+JZZl63JoETQA/Ytla84IIJxIiZDYVmvmX3A0mijkLh2XZ30GqqvzSUll2b?=
 =?us-ascii?Q?gDaxnxblIhhabd3/hrY3WgKaIp7WbOaU/VLBSQ7EACooduqILszhngnD0Uji?=
 =?us-ascii?Q?9bsecIgmAqojQcX1Iz6rwIBzvxTF6Rhhh9QdeMgStDmrga4jzCyEKbPh4yzL?=
 =?us-ascii?Q?0hDLT8l4uM1wl85iV9of5bgSTdWFOTDEL8Q3K6okUcbBcoi/CDbx6XgsVTun?=
 =?us-ascii?Q?m5HqHybXpGVFc9Hgh90ZLZ5w+SBIug6Gu5shgInTF4woVSMfspy8Dy8aa6lG?=
 =?us-ascii?Q?D6nLI4aq+fMvx/l30lXgQc4g+hLy0xaeECOpDH5yyBQyUSqu5xb4V9RRlFU/?=
 =?us-ascii?Q?mPyFXJTP02UR18pUUxbzPNLO1WrNsyHy9Mhaupc0d3H7ITFPzIDktCek6oYC?=
 =?us-ascii?Q?F05x6Wr1HktRbz1baoH3S8uvdb/XCkppTl5bzjs9mWjGuaFvpqRRPSkjVoDB?=
 =?us-ascii?Q?D/gMLlYGFbdIqkLqLv+9CQjjf0T60dG3rgTOGic1DdWm6NBTEgLHxtmjs9g/?=
 =?us-ascii?Q?+Op8I/awkKJVJlcUGZSP82vR7sOzMYGrcE0zc747vm95wQKJQ2T0YGfr9JP2?=
 =?us-ascii?Q?g8ES/Co8YjyCTqFveJIgu/dy2c1/iC/pYRII11EKndlvNaZ8cjv0ITJ6Yb45?=
 =?us-ascii?Q?l5uxI9d1aMjdBYnLD2j16jR5ElVjnABFZnqmgkUKhXqCuC7S2Vfn+7LyLTAJ?=
 =?us-ascii?Q?ep9nyar6g4bvlUnTZphWFmpKsd9EiYD5wuF3onbowuSPgoAOeDLUe/hPc+xs?=
 =?us-ascii?Q?qo9Co48yqCIkVZwY9HpPfNtdwJF7Bg4biY4myfoizlHIWPeXIa7W4LBwBTtC?=
 =?us-ascii?Q?Wpomd5c/5T6XiKht21agSkocEJtdQhmDD2OwEn0cTx3WgE95WFCn496aSyOX?=
 =?us-ascii?Q?FKhY4DwJsBLRbt05Rpybxb2uhRS9rdOvKOgQbYcqP/gajrHx/w2OnYOqEB0v?=
 =?us-ascii?Q?bSSsJ5tZnaz47hJe1JER1IWUhG4Xu9Y2fQEZVR19Kvib9TqpAc4Z45fSJplu?=
 =?us-ascii?Q?B5W4KWvn2WewSdyG+CH1AgoWb+s74p6LlpZHh2r/YgJbgZGo6tX4lLcRG3Rn?=
 =?us-ascii?Q?dulbpeoD8XGBnx8fw4A8U14lelW79NYxb+4MWjB3PGAIgPZoVeXjBr2Yjo+x?=
 =?us-ascii?Q?q4mGcpUJXLvhaPtCN13cSdfhDjAeuD+bl7UJGmYSRHNqIw4aDau9vBbTWQDK?=
 =?us-ascii?Q?r0YAiT7m0mmtEAgc2cVAUzEv6xzmK8BeDH77DC65PZ2zbDLQqkowPXmhb/cC?=
 =?us-ascii?Q?PkBMaIuxvg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620c0013-b602-47d2-df9c-08de80780b99
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:43:41.3345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Acj/Nj+WNFDBio4jBi8HFQgFEZuwrLQHYcTmVtFFi+Y7rs5Q1xK34UwuWK/6zw5L9AKgdE+OCGVtbKTmtS+E2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6870
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E0D2B2797EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove x86 prefixed names from cpuinfo and all the places it is used.
This work is part of making Xen safe for Intel family 18/19.

Kevin Lampis (7):
  x86: Remove x86 prefixed names from mcheck code
  x86: Remove x86 prefixed names from acpi code
  x86: Remove Intel 0x65, 0x6e, 0x5d from VMX code
  x86: Remove x86 prefixed names from hvm code
  x86: Remove x86 prefixed names from x86/cpu/ files
  x86: Remove x86 prefixed names from cpuinfo
  x86: relax some CPU checks for non-64 bit CPUs

 xen/arch/x86/acpi/cpu_idle.c           |  19 +-
 xen/arch/x86/acpi/cpufreq/acpi.c       |   2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c    |   4 +-
 xen/arch/x86/acpi/cpufreq/powernow.c   |   4 +-
 xen/arch/x86/cpu/centaur.c             |   4 +-
 xen/arch/x86/cpu/hygon.c               |   4 +-
 xen/arch/x86/cpu/intel_cacheinfo.c     |   6 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |   2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c     |   2 +-
 xen/arch/x86/cpu/mcheck/mce.c          |  36 ++--
 xen/arch/x86/cpu/mcheck/mce.h          |   2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c      |  16 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c    |   5 +-
 xen/arch/x86/cpu/mcheck/non-fatal.c    |   2 +-
 xen/arch/x86/cpu/mcheck/vmce.c         |   8 +-
 xen/arch/x86/cpu/mtrr/generic.c        |   5 +-
 xen/arch/x86/cpu/mwait-idle.c          |   4 +-
 xen/arch/x86/cpu/vpmu.c                |   4 +-
 xen/arch/x86/cpu/vpmu_amd.c            |   6 +-
 xen/arch/x86/cpu/vpmu_intel.c          |   4 +-
 xen/arch/x86/hvm/hvm.c                 |   2 +-
 xen/arch/x86/hvm/svm/svm.c             |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c            |   4 +-
 xen/arch/x86/hvm/vmx/vmx.c             | 280 ++++++++++++-------------
 xen/arch/x86/include/asm/cpufeature.h  |  21 +-
 25 files changed, 214 insertions(+), 238 deletions(-)

-- 
2.51.1


