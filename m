Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBqKIpzK6WnAkAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:30:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9B44DFC7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291634.1570495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFoVo-0003KW-Uw; Thu, 23 Apr 2026 07:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291634.1570495; Thu, 23 Apr 2026 07:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFoVo-0003Ir-S8; Thu, 23 Apr 2026 07:30:12 +0000
Received: by outflank-mailman (input) for mailman id 1291634;
 Thu, 23 Apr 2026 07:30:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wFoVn-0003Ij-Me
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 07:30:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFoVn-00352B-35
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 09:30:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9ca82-bab6-0a2a0a5309dd-0a2a4506bc70-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:30:10 +0200
Received: from [52.101.69.22]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9ca82-7371-0a2a45060019-346545166e50-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:30:10 +0200
Received: from DU7P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::30)
 by AS2PR08MB9714.eurprd08.prod.outlook.com (2603:10a6:20b:606::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Thu, 23 Apr
 2026 07:30:02 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::7e) by DU7P191CA0020.outlook.office365.com
 (2603:10a6:10:54e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 07:30:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Thu, 23 Apr 2026 07:30:00 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAVPR08MB9137.eurprd08.prod.outlook.com (2603:10a6:102:30e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 07:28:57 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Thu, 23 Apr 2026
 07:28:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eXenImqPe/JdeeS9zF7uudVmvIVD7nADY/aY3mdi/KmPEJbLEQ7aJuHK9cijFQZLq886Vs9iQ0Zqr2lWnGxVxDJGmGyG9Yqr2mLX36qbDNFKu+sNmPWJz3+/AlzjjgPUuYeMp6XltbJzpqIQXiJ0e/5lbqf5I8YnEqikw0CgVk9QKpNm4qC18OJoazpZQjAEv/yAIu3tcyOwimsUoLZ+S3cPjwWWg9kVFKEVz7wuaqnQTMgG84cKueRdP8nJ18fTrLT2TyRo//fLROFKF06mXOPx43HWvNZP76Q4ZvqM8wWMZoOgTbU9+IuzdMNlDG1dzLAFuUBXvMts5DkRaQy51w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLyiN/FAFpwQ0RQ2aScfSoW1m4aPkH9o72AQn/JfGhU=;
 b=lwLRS64qz+G4gca4onkUkFAVFPXl3FUgcztFsdnl7xlAJyjj3gJKs5N0zQik/mTh9Jz/2FxHiVxjkXYRi+jbATl2WXneEoAyBwgG76COoHEvSegHXQTBaFzXE6gGdeQDtu8RntP8B5EdTjZX0eJ2gSpdNwLRz9c/thI3dfx3v6zkc8rOZ3Mg2yjGKJY68WfKS82h03nyAYmiYivjw/1RtQ/idZZbPs9/N5o05gMXZLbt+na6MjmwM5yWXWbLPGIB5k2dRqKSz5X7g16mBIi4a1FnD6juK5xS3bSdNZF3S8oHmg5ghTRvXqYGP/6l1BfRLU0bLZ8T7PX3hkjQZNrYvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLyiN/FAFpwQ0RQ2aScfSoW1m4aPkH9o72AQn/JfGhU=;
 b=OZm0eRC8yoT1IbEx0l9MS6yK7z2cfnhYnmD1+ppw3xGUsCG76bqAZqCsctvqHSEqEEf2aBL+gpb1DDsB7n048pXm56b/MxBaf60wSvlGRT2rKIzq0XsBrFg7HLbH6W9QxfVpWg3WkUcuXTwI67bM2ckflo2eHHOc+yJQMx8z4BI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHZznqnNRfHAvL9J1fnQPkPSXgS+vX2CO0qpy3F6Etv2OgBongeX+tj5JGzKJ6mIdS9xgmFvBKTEWgXAMn2ZFUn8c2IgYl3HW1rF2SQMcogxwk7NX8gv1rIN55O845JETodY3JDNntiZO13nwM3Nr2xiMVeGEjOO+q7imR0s+xvHX+PFPIaiI8BCC+CLGmTd3vQf/a3WB4i6VBwTXhOg39MB85eM2R7TdiMZysueIQE6x/E3LXOw9UaQDpsAl/BAOFy3vVmRfxWHd/2fhpop5O943RGaaVCKDlgDksXk+zaCeet69tTu6lfuG1Iwhb6k6L4IrgVfcCrSbrv1OJ7Ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLyiN/FAFpwQ0RQ2aScfSoW1m4aPkH9o72AQn/JfGhU=;
 b=VdmBMa1GqUJ8J9vnCl8Zf6XDvlBStmGZ77ZoMM77nUjUXBVzigczYuLJUfw3Esnh/oWWKKtM0yuynOX5NXSAIu8qfrRXQQuSDHGoWdbqr+6bBUL+OZaOiUtjiHfUZqBH1BpOxAm00gtrbygypsuC3Lsqqz1oq7rMV5sUAAXersJly13POL04FHNy3pYBnf+TmnCtuk348kwvh8vEUAMlxvBNg+zjOLMvE08+C58EL0JZqU67LtSLBbAPezooqV8Q6ueynwkpUsdxJQKrUA+c1vNf/2/eSvXS1iAGmgTz10ZkXDSFhCbc39I5mWpjQ2fREZcMx5eQUhrbc9VgiwrBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLyiN/FAFpwQ0RQ2aScfSoW1m4aPkH9o72AQn/JfGhU=;
 b=OZm0eRC8yoT1IbEx0l9MS6yK7z2cfnhYnmD1+ppw3xGUsCG76bqAZqCsctvqHSEqEEf2aBL+gpb1DDsB7n048pXm56b/MxBaf60wSvlGRT2rKIzq0XsBrFg7HLbH6W9QxfVpWg3WkUcuXTwI67bM2ckflo2eHHOc+yJQMx8z4BI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 2/6] xen/arm: ffa: Track hypervisor notifications in a
 bitmap
Thread-Topic: [PATCH 2/6] xen/arm: ffa: Track hypervisor notifications in a
 bitmap
Thread-Index: AQHcznAWfT9UE3mepUCzg5x2vENfULXq2YyAgAFvNoA=
Date: Thu, 23 Apr 2026 07:28:56 +0000
Message-ID: <6D745E55-2BBB-49CC-AE8D-D75E9704ED8D@arm.com>
References: <cover.1776266307.git.bertrand.marquis@arm.com>
 <7053b8c14bbe50cc855dad0a82cde2bb10153d2b.1776266307.git.bertrand.marquis@arm.com>
 <CAHUa44HaFjLf9CcSJMDD5O-R24_Kq_7zabw2Op2X=P1gj+85Sw@mail.gmail.com>
In-Reply-To:
 <CAHUa44HaFjLf9CcSJMDD5O-R24_Kq_7zabw2Op2X=P1gj+85Sw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAVPR08MB9137:EE_|DB1PEPF000509EB:EE_|AS2PR08MB9714:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7d3db1-1d8c-4fc2-7ee0-08dea10a20c0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|38070700021|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 ytzhvA24rTVg4W+pjMnpkbeKgCLOzGg4/Ye9iblNMrcH6JMTCiRLhsKM4tiZvU/fZuycXMz+HRwm5x2jX1WfKQaVYLIUakrLNAxgyi9gKxwLl4OaHOxT9Atz8jcODB0PlIbbWWetFfer48Ufy/QkFo1ami6Lst5ZXpfaX33X0Tan0kLlGtnle4fezS0V3givYus1UCVZ+3nLuyezYaaL3xfeqT/xr7KFc70qsfWCUeZ/DV7ffmTnLDlNgH0IWqchBSEN7X9Bon66/1+eqtXBTwx9sIxtfO212yzugUgFMJeDnTzHEDGxv8jOonFpJW8mU2gCf773vJC7vIoW/ErE4BkZXW/W/3SeonjXqpPMBl8PxL+7vDbAIB0g000JMCYCkrrhBHZAgsHjgQU1AqTnD10O37MuxIR7bns/CqE3HaxcCvMmNVe94aJ19QD/2oRj9543GGos16g10GNEYuPYNA9esaf0FI7s9wDuT3MFnRMBsXwp/fYj5Fo7kMzJ02ruECsl7uZb2TXxDXXCN+ZOW3MN+xLNEM0YaumtbNzyWMpsGN3y/lQOCCrhQiLgbWbmWrR3Oe/tFWpGOHzN+Ju1QvLhkeYJpZLMX/JwcC5NyqJ7eo2Nxh7TCeKxl80j3kO2udpsuVGzxjoK6AIj1KMHLO8OTefsd+y/511VmCrsPH5/ii4tElemttt/ICBkp3ZV/jFTzJcPQVj/7ZETW9MdB6msPV0rxxCEhw8jLM73eNc4Xu95pxilpEDsubnwV+5bFQ7m/y/s0P6/Q+UHdjNqaeQfsMei14bd+BIlUFMjTWM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6E12F763E8F3543B484161C1E602AEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 bTrjupX//8orI2TTi6gSkOeyHtCk+PEQZO+kM0Y0mSYFftAfLx7VxuaG1NxP6K2FR1Wa9w4kK2rtNqiML90Jh3M0O6Ib8Fp0G2nVafSLiqHWfSMY4o5dwUjiD9kI5uAqJ0mQrq7AwdPYkQg1yTlgZScUtA30udjdJtKiNh14KgM2DbFlSpt1tllNhEO1g3e2U+SpsHMep2HnTrgzH3Cruhk+4nysoSybAXTjt+EL0DTHmlaikmHn60vL8tibEog5csBj+WBgKWfj0K4x70lzDbn6GDiNz8qDXM/woRa1Fq3EdRvgZMUVP2Ah869UaV/VQ8X58Vt9mAaqcEuFa9bF3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9137
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3da666a-45c3-4b9e-e971-08dea109fa99
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|35042699022|82310400026|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OgUKfHzD14SaJtmoE9FOjNuPkSLJO9td03CThBrtpRBPVEoyIXbWdIQ3pDcEAyz/X7SntvJzero8A6WW98DVFp5x5Xl5Vj7wEP08gHkSuvtwUiJpt+KELtpdlyWvW1EFnWKi2GWUlAdWfba2SlkDTTjQFMGsvNvIg93IjMGOzt6Sk6d4eR9N5x914DEhU9gt4tz6rwtl8V6Eq7PKl092iR4CG79IRFoC0+/P/g0gPhwpZ4OmtwqkKM5w8oL+49qkPHDKt2HGP1cReozIMorn0E9sOvheW8cOGpe967eRLA+qAXppiWjRI0Cr2y29UeQOYYZLBW7jeca2rXEEc9jjEg5q2ut6OQaaBUdEGjx1L6kjn21jx9scvr619WgxJqJSzff7vu+hvudXRgmejTj+ORpdLJefhEFsqVsECpp2plRoH+1pXANcl8X1xCRsAbpolcu8WkYYC2O8DTPoXv/GcY2Eifo+GyfsLcUPmDgTsj27yK5EAZ4PxXX/VFaYA1jNo95HN0e8fC43gMkEuMMwYwMMHdWFxz7T+DDvOFdLzyFmcWcApnohRDgJS8up5GWXXQ3plp01eAE0bL3zc8H+gxxy2tDMBCyP/mPoGb8Psk4rYIpCUsq8VI4JwgF0JZV0x5GZDC88AB5qHQnanNnLE2h22voliwjTSOSKXkCE00TTVDmJ58w687ozxAZMoF98al5FpRN38XHdF+rDjcPd5+rZoqQFiwl80t3JP/bt4aZYjPkfRsSzVJ90GoncJwb/+/r8XLRTT2/FHDbXEvQPMA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7SMN+XioucG4QQxfFNTvozxnCONWuYALv2j12bfEsLpapVEsJ2zik8RB8GbwlAZaJrSJVBS5OAf8lx8M319Ni4rQxvQ8Pgo50O4aiicygr4Vf87ECafUe3/bytzR9sLX36fBt+RoF8oUToN10c4eXuWTsvJGEh1UsrsBPQuVTQ9pW9HaBdPOPoW4YYYNoSS9YC5842yfLNmuSgPC0WxKQZQ41Ws/hj8l1nXng1LBjUHqBp2Qmimuc+iQ/1ESv75/KdFDEClku2vE0+/Tzogym/dz/+UfoQDebd84BEjivzdPB1OLeIqva9+wCg+KWWRgVcZxSneXr4JDt+OCPHmDhR4uRY3TLQcrId0tR+jVkgQlZGa9buyiChgPIf3R7bHfAhZe01pMWtQSzOXvWh1f6eRljYbAksvDKTvzJbOngN5ANPbGwAFiy+0/Agv6s6um
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:30:00.3251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7d3db1-1d8c-4fc2-7ee0-08dea10a20c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9714
X-purgate-ID: tlsNG-16d1c6/1776929410-53B7DD75-AAF9A100/0/0
X-purgate-type: clean
X-purgate-size: 6844
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: BEC9B44DFC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmVucywNCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3Lg0KDQo+IE9uIDIyIEFwciAy
MDI2LCBhdCAxMTozNCwgSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+
IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0KPiBPbiBGcmksIEFwciAxNywgMjAyNiBh
dCAzOjQx4oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29t
PiB3cm90ZToNCj4+IA0KPj4gSHlwZXJ2aXNvciBub3RpZmljYXRpb25zIGFyZSBjdXJyZW50bHkg
dHJhY2tlZCB3aXRoIGEgZGVkaWNhdGVkDQo+PiBidWZmX2Z1bGxfcGVuZGluZyBib29sZWFuLiBU
aGF0IHN0YXRlIG9ubHkgcmVwcmVzZW50cyBhIHNpbmdsZSBIWVANCj4+IG5vdGlmaWNhdGlvbiBi
aXQgYW5kIGtlZXBzIEhZUCBiaXRtYXAgaGFuZGxpbmcgdGllZCB0byBzaW5nbGUtcHVycG9zZQ0K
Pj4gYm9va2tlZXBpbmcuDQo+PiANCj4+IFJlcGxhY2UgdGhlIGJvb2xlYW4gd2l0aCBhIGh5cGVy
dmlzb3Igbm90aWZpY2F0aW9uIGJpdG1hcCBwcm90ZWN0ZWQgYnkNCj4+IG5vdGlmX2xvY2suIElO
Rk9fR0VUIHJlcG9ydHMgcGVuZGluZyB3aGVuIHRoZSBiaXRtYXAgaXMgbm9uLXplcm8sIEdFVA0K
Pj4gcmV0dXJucyBhbmQgY2xlYXJzIHRoZSBIWVAgYml0bWFwIHVuZGVyIHRoZSBsb2NrLCBhbmQg
UlgtYnVmZmVyLWZ1bGwNCj4+IHNldHMgRkZBX05PVElGX1JYX0JVRkZFUl9GVUxMIGluIHRoZSBi
aXRtYXAgaW5zdGVhZCBvZiB1cGRhdGluZw0KPj4gc2VwYXJhdGUgc3RhdGUuDQo+PiANCj4+IElu
aXRpYWxpemUgYW5kIGNsZWFyIHRoZSBiaXRtYXAgZHVyaW5nIGRvbWFpbiBsaWZlY3ljbGUgaGFu
ZGxpbmcsIGFuZA0KPj4gdXNlIGN0eC0+ZmZhX2lkIGZvciBiaXRtYXAgY3JlYXRlIGFuZCBkZXN0
cm95IHNvIHRoZSBub3RpZmljYXRpb24gc3RhdGUNCj4+IHN0YXlzIHRpZWQgdG8gdGhlIGNhY2hl
ZCBGRi1BIGVuZHBvaW50IElELg0KPj4gDQo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+PiAN
Cj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJt
LmNvbT4NCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90aWYuYyAgIHwgNDYgKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFf
cHJpdmF0ZS5oIHwgIDkgKysrKystLQ0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90
ZWUvZmZhX25vdGlmLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+PiBpbmRleCAw
N2JjNWNiM2E0MzAuLmQxNTExOTQwOWEyNSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90
ZWUvZmZhX25vdGlmLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMNCj4+
IEBAIC05NCw4ICs5NCwxNSBAQCB2b2lkIGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX2luZm9fZ2V0
KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gDQo+PiAgICAgbm90aWZfcGVuZGluZyA9
IHRlc3RfYW5kX2NsZWFyX2Jvb2woY3R4LT5ub3RpZi5zZWN1cmVfcGVuZGluZyk7DQo+PiAgICAg
aWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkNCj4+ICsgICAgew0KPj4gICAg
ICAgICBub3RpZl9wZW5kaW5nIHw9IHRlc3RfYW5kX2NsZWFyX2Jvb2woY3R4LT5ub3RpZi52bV9w
ZW5kaW5nKTsNCj4+IA0KPj4gKyAgICAgICAgc3Bpbl9sb2NrKCZjdHgtPm5vdGlmLm5vdGlmX2xv
Y2spOw0KPj4gKyAgICAgICAgaWYgKCBjdHgtPm5vdGlmLmh5cF9wZW5kaW5nICkNCj4+ICsgICAg
ICAgICAgICBub3RpZl9wZW5kaW5nID0gdHJ1ZTsNCj4+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZj
dHgtPm5vdGlmLm5vdGlmX2xvY2spOw0KPiANCj4gSXNuJ3QgdGhpcyBhIGZ1bmN0aW9uYWwgY2hh
bmdlPyBCZWZvcmUgdGhpcyBwYXRjaCwgd2UgZGlkbid0IGNvbnNpZGVyDQo+IGN0eC0+bm90aWYu
YnVmZl9mdWxsX3BlbmRpbmcgaGVyZS4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCg0KV2UgZGlk
IGNvbnNpZGVyIGl0IGltcGxpY2l0bHkgdGhyb3VnaCB2bV9wZW5kaW5nLg0KDQpUaGlzIHBhdGNo
IG1ha2VzIHRoYXQgY2xlYW5lciBieSB1c2luZyBoeXBfcGVuZGluZyBmb3IgdGhlIEh5cGVydmlz
b3INCmZyYW1ld29yayBub3RpZmljYXRpb24gaXRzZWxmLiBQcmV2aW91c2x5LCBSWC1idWZmZXIt
ZnVsbCB3YXMgbWFkZSB2aXNpYmxlDQppbmRpcmVjdGx5IHZpYSB2bV9wZW5kaW5nLCBhbmQgRkZB
X05PVElGSUNBVElPTl9JTkZPX0dFVCANCmNsZWFyZWQgdGhhdCBzdW1tYXJ5IHN0YXRlLg0KDQpB
cyBhIHJlc3VsdCwgdGhlIGd1ZXN0LXZpc2libGUgcGVuZGluZyBpbmRpY2F0aW9uIGNvdWxkIGJl
IGxvc3QgYmVmb3JlDQp0aGUgSHlwZXJ2aXNvciBub3RpZmljYXRpb24gd2FzIGFjdHVhbGx5IHJl
dHJpZXZlZCB3aXRoDQpGRkFfTk9USUZJQ0FUSU9OX0dFVC4NCg0KV2l0aCB0aGlzIGNoYW5nZSwg
dGhlIHBlbmRpbmcgc3RhdGUgaXMgdHJhY2tlZCBpbiBoeXBfcGVuZGluZyBhbmQgaXMgb25seQ0K
Y2xlYXJlZCB3aGVuIHRoZSBIeXBlcnZpc29yIG5vdGlmaWNhdGlvbnMgYXJlIHJldHJpZXZlZCB0
aHJvdWdoDQpGRkFfTk9USUZJQ0FUSU9OX0dFVC4NCg0KSSB3aWxsIHJld29yZCB0aGUgY29tbWl0
IG1lc3NhZ2UgdG8gbWFrZSB0aGF0IGNsZWFyZXIuDQoNCj4gDQo+PiArICAgIH0NCj4+ICsNCj4+
ICAgICBpZiAoIG5vdGlmX3BlbmRpbmcgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgLyogQSBwZW5k
aW5nIGdsb2JhbCBub3RpZmljYXRpb24gZm9yIHRoZSBndWVzdCAqLw0KPj4gQEAgLTE3NCwxMiAr
MTgxLDE3IEBAIHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fZ2V0KHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzKQ0KPj4gICAgICAgICAgICAgdzYgPSByZXNwLmE2Ow0KPj4gICAgIH0NCj4+
IA0KPj4gLSAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgJiYNCj4+IC0g
ICAgICAgICAgZmxhZ3MgJiBGRkFfTk9USUZfRkxBR19CSVRNQVBfSFlQICYmDQo+PiAtICAgICAg
ICAgIHRlc3RfYW5kX2NsZWFyX2Jvb2woY3R4LT5ub3RpZi5idWZmX2Z1bGxfcGVuZGluZykgKQ0K
Pj4gKyAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgKQ0KPj4gICAgIHsN
Cj4+IC0gICAgICAgIEFDQ0VTU19PTkNFKGN0eC0+bm90aWYudm1fcGVuZGluZykgPSBmYWxzZTsN
Cj4+IC0gICAgICAgIHc3ID0gRkZBX05PVElGX1JYX0JVRkZFUl9GVUxMOw0KPj4gKyAgICAgICAg
c3Bpbl9sb2NrKCZjdHgtPm5vdGlmLm5vdGlmX2xvY2spOw0KPj4gKw0KPj4gKyAgICAgICAgaWYg
KCAoZmxhZ3MgJiBGRkFfTk9USUZfRkxBR19CSVRNQVBfSFlQKSAmJiBjdHgtPm5vdGlmLmh5cF9w
ZW5kaW5nICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICB3NyA9IGN0eC0+bm90aWYu
aHlwX3BlbmRpbmc7DQo+PiArICAgICAgICAgICAgY3R4LT5ub3RpZi5oeXBfcGVuZGluZyA9IDA7
DQo+PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICBzcGluX3VubG9jaygmY3R4LT5ub3Rp
Zi5ub3RpZl9sb2NrKTsNCj4+ICAgICB9DQo+PiANCj4+ICAgICBmZmFfc2V0X3JlZ3MocmVncywg
RkZBX1NVQ0NFU1NfMzIsIDAsIHcyLCB3MywgdzQsIHc1LCB3NiwgdzcpOw0KPj4gQEAgLTIwNywx
MiArMjE5LDE3IEBAIGludDMyX3QgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fc2V0KHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gdm9pZCBmZmFfcmFpc2VfcnhfYnVmZmVyX2Z1bGwoc3Ry
dWN0IGRvbWFpbiAqZCkNCj4+IHsNCj4+ICAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJj
aC50ZWU7DQo+PiArICAgIHVpbnQzMl90IHByZXZfYml0bWFwOw0KPj4gDQo+PiAgICAgaWYgKCAh
Y3R4ICkNCj4+ICAgICAgICAgcmV0dXJuOw0KPj4gDQo+PiAtICAgIEFDQ0VTU19PTkNFKGN0eC0+
bm90aWYuYnVmZl9mdWxsX3BlbmRpbmcpID0gdHJ1ZTsNCj4+IC0gICAgaWYgKCAhdGVzdF9hbmRf
c2V0X2Jvb2woY3R4LT5ub3RpZi52bV9wZW5kaW5nKSApDQo+PiArICAgIHNwaW5fbG9jaygmY3R4
LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+ICsgICAgcHJldl9iaXRtYXAgPSBjdHgtPm5vdGlmLmh5
cF9wZW5kaW5nOw0KPj4gKyAgICBjdHgtPm5vdGlmLmh5cF9wZW5kaW5nIHw9IEZGQV9OT1RJRl9S
WF9CVUZGRVJfRlVMTDsNCj4+ICsgICAgc3Bpbl91bmxvY2soJmN0eC0+bm90aWYubm90aWZfbG9j
ayk7DQo+PiArDQo+PiArICAgIGlmICggIShwcmV2X2JpdG1hcCAmIEZGQV9OT1RJRl9SWF9CVUZG
RVJfRlVMTCkgKQ0KPiANCj4gRG8gd2UgbmVlZCB0byBjaGVjayBmb3IgRkZBX05PVElGX1JYX0JV
RkZFUl9GVUxMPyBJc24ndCAhcHJldl9iaXRtYXANCj4gbW9yZSBhY2N1cmF0ZSwgaWYgYW55IG90
aGVyIGJpdCB3b3VsZCBldmVyIGJlIHVzZWQgaW4gdGhlIGJpdG1hcD8NCg0KICBJIHdvdWxkIGtl
ZXAgdGhlIGJpdC1zcGVjaWZpYyBjaGVjayBoZXJlLCBpZiB0aGF0IGlzIE9LIHdpdGggeW91Lg0K
DQogVGhpcyBmdW5jdGlvbiBpcyBhYm91dCByYWlzaW5nIHRoZSBSWCBidWZmZXIgZnVsbCBub3Rp
ZmljYXRpb24sDQogc28gSSB0aGluayBpdCBpcyBjbGVhcmVyIHRvIGNoZWNrIHdoZXRoZXIgdGhh
dCBiaXQgd2FzIG5ld2x5DQogcGVuZGVkIHJhdGhlciB0aGFuIHdoZXRoZXIgdGhlIHdob2xlIEh5
cGVydmlzb3IgYml0bWFwDQogd2FzIHByZXZpb3VzbHkgZW1wdHkuDQoNClVzaW5nICFwcmV2X2Jp
dG1hcCB3b3VsZCBhbHNvIG1ha2UgdGhlIGNvbmRpdGlvbiBkZXBlbmQgb24NCnVucmVsYXRlZCBI
eXBlcnZpc29yIG5vdGlmaWNhdGlvbnMgYmVpbmcgcGVuZGluZy4NCg0KVGVsbCBtZSBpZiB5b3Ug
YXJlIG9rIHdpdGggdGhhdC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

