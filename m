Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCyWCo+s12kMRQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:41:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A743CB6BA
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277392.1562603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApdK-0006ZD-Iy; Thu, 09 Apr 2026 13:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277392.1562603; Thu, 09 Apr 2026 13:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApdK-0006Wb-F5; Thu, 09 Apr 2026 13:41:22 +0000
Received: by outflank-mailman (input) for mailman id 1277392;
 Thu, 09 Apr 2026 13:41:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wApdI-0006WV-RJ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:41:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApdI-00Dx4A-3X
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:41:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7ac7d-bab6-0a2a0a5309dd-0a2a450ce794-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:41:20 +0200
Received: from [40.107.162.65]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7ac7f-f40c-0a2a450c0019-286ba2417192-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:41:19 +0200
Received: from AS9P194CA0021.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::11)
 by DB9PR08MB7495.eurprd08.prod.outlook.com (2603:10a6:10:36c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 13:41:18 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:46d:cafe::ea) by AS9P194CA0021.outlook.office365.com
 (2603:10a6:20b:46d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 13:41:18 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 13:41:18 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB9PR08MB9540.eurprd08.prod.outlook.com (2603:10a6:10:451::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.40; Thu, 9 Apr
 2026 13:40:14 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 13:40:14 +0000
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
 b=k8p+D3QeExGNbTCv5laL31nU1BlC+7vWiqoZUHUO4dFtdkR08HpfOd/Q73SCuRrYJTMnL3GajaG9sLWUg7azG/KP/uUAOFgRqVFtheRMarD/ZRWZR2DfXq3wKc11c3zaQN1vGqvma5pebSmrqm6dXjkXN8AdSBYjgNGmihxJfEKb1G1NTSGOj/PY+BAyLsWpE7szIJtVrACfIDDZ9DikDt0BW4W2KUUj3RyV5cncrX8XMAJdfEQDNwRulWn3MJIQCpfLaxx6N0X5w5Bgi1pvegpqtly+bPnmxz5wr0HhsjMW0uF66YFyFitLK4jQtX/uN+elJKi4d0JKLjrLgJwTAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnK9+icjjmEU8ioJbRHnplkpD1kgQsX7F/gQKt3NLcU=;
 b=UpyNtck8b+FWZBkIt+VQSlA/FpV5XzmrZlENiAt5avAWSRoM0XDOIa7/FYy3g0w/+tHqMdEAB8qJmjU5tkA3pPX0W1SsY47lKHFfu56caRlCn0u6A/yguJBukmt368XsKkOjvMK6GntovH2MpJi7ja8EfTyapfX8SZl2fWMIGeW+e8t2krSR0Vi9qG6aRT53gk2cBP4+U0TykhBf6Ht/0ocIo5kijjeK+L2ZQQhe/I7hyUCbSLpAntle6PpztvVbll+9TU6Wg6bHWo+xn0KvynepQAxXOo5gAIH07zGCn5CM4VPg1ZDtcALsMBuZakwKAVxQ6W/2i3oV+/RDSdQA4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnK9+icjjmEU8ioJbRHnplkpD1kgQsX7F/gQKt3NLcU=;
 b=rZOx/edPAlEpC3zrJElLY18WKDQilSb0De9Ggp3q8v6dCJZtk5Jc+Br2ZOsjqQ/el/onZvbkORgh1zaL/XQRxzAw6sQr9Y/ehu5aLaNbyVyB10Jjzaz8AB31l+xYzgra9hfDeOYOPNUdLMTSLz6pOlT4PPC3ML/zFHEG8XKPQu0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jo8yuJmWez+PshCpkD0kW0cyG1buAmJ6mlnLB/93vmd/t5zisgPH7pXXNozxmEoPODjdJSHSoPDIsrM1pPdkoIJgH1dIPcAo174uqdNilemC1TKt2LEkS/AKwjF+4c+/i14P+P0EZdTr6mB+Wz3qR7FSOVWyOxmolQGKzm20E21gMrigYH4xywesfUB9l+bzgZx8ljpP/GMwKceLlQKVFCEB3pbFbkgo4hvkIANmkHqDjVNsJBAQ/oex2gxVfNoMdS8baBPFP6hY7srXA2ifKMdmdty/BAbv5UjLt4aBlWd+QqprxQILg09q8bvUyBNRrNvSjHMd6e8olM5zDHqNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnK9+icjjmEU8ioJbRHnplkpD1kgQsX7F/gQKt3NLcU=;
 b=C/Vgc18ohQZvjJqAx6DMH9q5VQLoePq7UDDbRCoZwPJEKniG5rxicOUq3j8RbSylUoQnNR/BMUmZDnCR5P09DhkpXlj1v6HRcQvau63mPWrNukoPCKDR9A99pN3hi0L3R9qAWW6RrcnzS+g2hvPjtfprq8Oj9j16dMSjIlVIZtaPgqP3Xzn5vyRsviUKtU1J9ll7Wzx96Pu1TjkOt1FbX7CRpTIVJOfMoc/YMlzyXI6EXtOz7ZvP+ADiKlWJFrg/Ex8kdgKX0nZhmvPz0wYdF5Ykau1U7et71rLeqw5kEHuZhrqxewd2i7y0jgN007kj51i1WnFxzy7ma22fBDyIMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnK9+icjjmEU8ioJbRHnplkpD1kgQsX7F/gQKt3NLcU=;
 b=rZOx/edPAlEpC3zrJElLY18WKDQilSb0De9Ggp3q8v6dCJZtk5Jc+Br2ZOsjqQ/el/onZvbkORgh1zaL/XQRxzAw6sQr9Y/ehu5aLaNbyVyB10Jjzaz8AB31l+xYzgra9hfDeOYOPNUdLMTSLz6pOlT4PPC3ML/zFHEG8XKPQu0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: gic-v3: Use vsize instead of csize for
 virtual CPU interface
Thread-Topic: [PATCH 3/3] xen/arm: gic-v3: Use vsize instead of csize for
 virtual CPU interface
Thread-Index: AQHcyCZky/J45q2EJES1oyx3k2d1qg==
Date: Thu, 9 Apr 2026 13:40:14 +0000
Message-ID: <995B8A68-0DE0-4FE8-AC80-21E5DE498170@arm.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-4-michal.orzel@amd.com>
In-Reply-To: <20260409113934.197619-4-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB9PR08MB9540:EE_|AMS0EPF000001A8:EE_|DB9PR08MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: db59580a-faa4-4fae-a548-08de963dad8d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 w4w5E/sw1go0hbMscFKfBed8GH1m/sCmnYaQc8btzbxmetJk8n7OcJd/qeZsGPT9hLdT1g10LPFQfu/jKr4+M/AiYcMZkF1LZbzno91q1hDbKSbTlHnC5+oGBNJCXxAf2bJFkWH3V3hoUViBuHca0fwo63eVEhmLBuJhlZDHK9r+L8y7FWwJXPElmFmYYGr5o4/TYkj2Hb0h2hkwUjK1fxG/bA6U7EotabUdtD9E3dRcSCWSToC3+0tBsDMsNSKuw99TNn3BUWC3ee20R94ODcArHIeKpbL4t9EMlSl1dY2C+x0o1Jc2fmqHHCoJlJzviAgOnmGdQRbpMP6oFyZl6JRX7yrBbY1CiTKxEV6QCwhwdOD0wBRJMjXPf0qnTTAFapY6ZJY+BSB2d1lszMAfN+IKCQJhV3OB2Nlo+ccUivSgzmMGcngYCjjK95MIEGlG6UWUTYwYK7OAvtmBBMr8H/61l2UeITOZkhjHn08BEeLeaOya3x7CmD2wm/peKEln90M7t7ssspf1zN8kRnnSxS8O8rnCHr4Lkna+DiP+6N3/otMY480PqtvEYGDkwaWc6FlZrho+SZeyG4yzln35bYTAA5RTLSFhGOfFPlBjXEAJVxMAc3KvUgkC1nP74K5m3SQxX0MUPA7jmB5jd4Ej5N/1CspTarCiE8mNdwu421Zwy/9h/NHGKIvBWv5pU82Ey7ekJru+M1ZabIVqF307E9rBp+UivLYOroKcXk2FaQ/jJdrvXBFpAu8+Q4lzGTxLFCTRJZPkLRO0rn0IyWNDQ2P0bjQQ7xmIhATxc04f8yI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3D52AB8F0873524B81AE20D9F8E3A4C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 SQs+hUwNmHSun19KznISSWCl0G5Ziuo8JJUukgtUZ1UO+BK3Pso+FudWkRUbu4jeCeTXrpsg0UZRUpA7ajCq95eTP0TEFE3MwmTmyer35CsdkZQwrTiYiJRlbsl13hzHzStBxXa4MLDw0wcn/t1WL5+wG6V8OyIX6m+3ql7EEsl7CEmoXtSa+i459iasJ5OFQWDreIDFiymeDH8WcVA3R86+SvYvJLxOyNY6MAqPjUd3SoppNmANjnBUDXI5pukbIAiK8DQiTMPDye4di8sQv4m2efbV6PI/eI0OAI7jMGXTjLKzatilw7OLAuup5f9+7bBkfOKHLms6u6msOSjskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9540
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c344d282-48c4-4b2e-57fc-08de963d877a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|35042699022|82310400026|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0KwnwOXKu2clgwdLIgSTJD7u0+7IwIGOffI6Wgb/pdRpHKIW0ySBxxXsLeBCwRx/u/bl2SFfUHM2b1ZMiKuOJ+Yi3Uy8o/LddSpDliiAkCxs65SFqaF0P9+JHEDN90LsR4VphTQOACn3IR4mn0vARHDxI/DvwM89Aob5d1ySNwp3GFfrxuuTGyeqxJoVrDgnZ23JLbc4svbRPYk4ThOd+CDDfkv+2QcX1DqNdmJ5TPy/lkIdbhf2zFQiVO1gGRIPta1YYelwS3oW9rBTHCBi8pMdZS/68yoDD1+gmmMPdkbdyt6pJrP/m4tzCbr3GXhHLWhUqO//z/0E6CR9JeM/iMVYRTVRCpwCN/jTqrAQMK2MXE4zxN1fUsCCN8wc8gVQVoaa5SswUsYz+XhhaD1vTfekMHHbAEuo3g3c96hOlDjMaID16AMRHu58quijqm6qDxeguPaPEd3SvDeR2dsylKN6IOkgn8WWZBTT0ycIDSJFHrdyIykaBEB2tA6SII/NYHh5enmoWI3hVUcPTvzBsOksS3vbnlnhnA0NU/RLb1d4g1A4c+jeA+WJ3A1ObQU8di1aqkDOTxD42svDLHFltAnXfGYqJHMv9XSVs2UldMSpv9aPiySjeXMp6+teD9zRw+HhUBN6chuSSsSr2YhJga6t077xYS7KxrpIlWC19+Hvyu89jvbCZSJT13V2O54k23UwpxrJpsSP7QcFlcIWI4LNtmPbZ2hb9jecyein0AkLYKRrVdt1z6wvt3thS9Aewf/GVUnujs4kjhixfGNgYg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(35042699022)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BzEDDCjvi0zMKVMYNZFxPvEb7DskmU0pyqv3hVpES8LMUS99fzloTpNt6qzmNT9/wT7gFJa88AUYZ7kLqBYdMJWDV8B8gaIGvyhxym91KA+xcFw4hXTpCxlPEoAFBAkPZpuJF/N1CfBjEgV5jIft593xTv3QVkxJEc+LZlB3aMx1KTug+na8iuoR2+am1m0XlgpKbRIhaEx/l3fdC1dgrNYXzE4EI93Fk63JOKJyPoHwhN1jmA5c+mk7E0raeIL5yyfnm0M+4MxpmNeDJ6PiojJm/RW0kxRrS2HACpOgdqIBBl8STNGVAl59fGIVe4/QhjNff+pWWFODMy69ucgguKrDcm37+aWSFOTmbQeKhvzHu3vwQLSgAVtySoIA0YHpFmHpkXkWvW5gfrPGD6gtTorNCMomJO9xfAyT0H4AaEr2ecm0vCJjcXJOQmv1Bohu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:41:18.0867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db59580a-faa4-4fae-a548-08de963dad8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7495
X-purgate-ID: tlsNG-d25034/1775742080-8095DA3D-789EA28E/0/0
X-purgate-type: clean
X-purgate-size: 553
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: 82A743CB6BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 9 Apr 2026, at 12:39, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> gicv3_iomem_deny_access() incorrectly uses csize (physical CPU
> interface size) instead of vsize (virtual CPU interface size) when
> calculating the number of pages to deny for the virtual CPU interface
> region at vbase.
>=20
> Fixes: 8300b3377e ("arm/gic: Add a new callback to deny Dom0 access to GI=
C regions")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca



