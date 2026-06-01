Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBRLB5m9HWpidQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 19:12:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D762317F
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 19:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324029.1589700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU6Bs-0007H5-Cc; Mon, 01 Jun 2026 17:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324029.1589700; Mon, 01 Jun 2026 17:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU6Bs-0007EP-9Z; Mon, 01 Jun 2026 17:12:40 +0000
Received: by outflank-mailman (input) for mailman id 1324029;
 Mon, 01 Jun 2026 17:12:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wU6Bq-0007EI-D1
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:12:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU6Bp-009Gdw-9S
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 19:12:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1dbd7d-bab6-0a2a0a5309dd-0a2a4507a4ec-14
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:12:36 +0200
Received: from [40.107.159.67]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1dbd83-229c-0a2a45070019-286b9f4327f7-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:12:36 +0200
Received: from AM8P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::12)
 by DB9PR08MB11309.eurprd08.prod.outlook.com (2603:10a6:10:607::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 17:12:32 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::38) by AM8P190CA0007.outlook.office365.com
 (2603:10a6:20b:219::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 17:12:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Mon, 1 Jun 2026 17:12:32 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAWPR08MB9854.eurprd08.prod.outlook.com (2603:10a6:102:2e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 17:11:28 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 17:11:28 +0000
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
 b=lUqEoMA1N5i2EnZVWb15zdtrhLkbkBeDK7tdJ7Va8tI0Y1ijbYuHEukIpeRL1AmKE9vq8Iv+TlLFDwyoeqI8UkHeY0yAJPy7HMf9X5E7BwElp/s+hSDi58hIMlxkmFwFw+Nyz/+zsfQ5MwOHPIjEWUXX30n4JxgHuT5YLAL5Q7cy54+wffEGyZD94wamc7mgFdvDDnsJ//wmCMrmFFI1LGlgmkeronPaAz1NbDZgjtC49jCieX8GSD/8yYqn+5A3wXoTVmu7zSu01hf0/QCFQcgjrxeKb/FtXlvqhwITyHEkJxkjs67UshxCm2tkLrTI2e1EMm4HvCXeVkOLnD2AJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHCpt9R0MscnHP5iI7n/QSTLX/es9SLtyi98WJMGoyw=;
 b=R8dh9vReJNglgVwBVpOZ+MgRwz2IjlckXwY9lNW1aPorqSOqrrq1yqmrF0/gHroIj4lz+9IVhZbjKOiqKLB289elzJKd6LZBAsHgtCrF36U/PEUniQzZq8rlvi5r7z7IfhweN3ua+aOTHbPCmhkF1CPLaCJZg8Qkosj6lMbRx0iRrWJn0rt18th8xJ4Yvei8HoSQFl7OGxMoUFZAaTAnQOE3MKaoZOaR8R3JdPGAW5hJ8Wb6HZC3qozpOdRaKZbf4Q0tuFCDm637Sdum/To0ysRea7gJRyPfDT62x5hANlwJoE3T1TQURkb2ukdVumHByJsqutYJuTSaz4FwXpTu+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHCpt9R0MscnHP5iI7n/QSTLX/es9SLtyi98WJMGoyw=;
 b=eAVdnz/oGs4uI76S/8MJIDq2zRShhZ+0MUiQ6mLwWUg3qlrAc118o40284+WB4nnt8gOOoXZeXN1UNeHeKitFRzPHk6DlRVEyvfFanhF0DRY3hwF06ZC3q2hlWEIof742H+Jk5ZMlabSUoG2P1lE7JZ25H6od1n7sryGmssgamA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGUyXIm9j4VamV337XwHDwK4o9hhXh1p8gaNeD/d3Xko9bVwgoNPgbnFW+GsQwXe9PqLVl+2vJWIgjJPIUNAfSSfyd9KV3D+ZQl4YwEsGyEfnkmeOZi37HFV7FoGuKJhCbOjlK0fFDUHuVcLdorvqUHcMIUcpLAGmM3Q9XwLvAukF0Tqt0duyh8MNfrs/wSkxgGN2EYzC2dVQS87UvcobqYKgBcYljbR53m2CIpttIOaN6Xshk1EaKeByedx2X/USYYo4WMOdyUspLilDBEGQq9lcyXvW8a21eVR1/HuSq0daz8UOHdYVvYFqDEMm6/xEPkBEac6LT0plmYR9CsiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHCpt9R0MscnHP5iI7n/QSTLX/es9SLtyi98WJMGoyw=;
 b=pIBbttdoWIgkR/QrqbL0pj3nHKASOyWiGs0oIBb2KPsUa65OYiVeauiGqeGmozwu03cG8mzitBkmxGOPVTrcSM8Ol/bTDhrYEasZniuWeEv7czx7qOakdI/JnNVKMxmxHz55hL1AIG+eAUHmsH90uH9zXFFkV6XDrqswMYi3LBv8hRdEamz3ZiecHqtmF78rvDASWeTdjVGQaDXQWcaEh30Buz0G0AZFiAWsVAbeOHOgM3jomDfR93/9qaD44mmeNGCUWJqO7rkigRDjoFixj5oS9YIrATLD0nLT1E4btOyw/C+L8HHO3otOn6ZtVD3vjqIRaBumMV5PFdzbDRbbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHCpt9R0MscnHP5iI7n/QSTLX/es9SLtyi98WJMGoyw=;
 b=eAVdnz/oGs4uI76S/8MJIDq2zRShhZ+0MUiQ6mLwWUg3qlrAc118o40284+WB4nnt8gOOoXZeXN1UNeHeKitFRzPHk6DlRVEyvfFanhF0DRY3hwF06ZC3q2hlWEIof742H+Jk5ZMlabSUoG2P1lE7JZ25H6od1n7sryGmssgamA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v10 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v10 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Index: AQHc6UoJ2/A9TKf5Mki5mcNZE+ke7LYqAKSA
Date: Mon, 1 Jun 2026 17:11:28 +0000
Message-ID: <349E0857-AB61-48C1-BB91-ABE1422142C9@arm.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
 <279cd20f49be956fc8493aace906a1adfaf473ee.1779385072.git.mykola_kvach@epam.com>
In-Reply-To:
 <279cd20f49be956fc8493aace906a1adfaf473ee.1779385072.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAWPR08MB9854:EE_|AM3PEPF0000A793:EE_|DB9PR08MB11309:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae944e6-2e67-46ca-43ba-08dec000f801
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|4143699003|11063799006|3023799007|6133799003|38070700021|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 bBNs/99yeekOfvCT/SRR4PtFLFy8US/YO4CCV7+0fyS3BHLYiXWFnirPX6v3iIfcjzCvVCq/mUMuFkHWsT/Gms6t/a2s/lij/rmmPe0BH5waTWNkUqpr44VrBSW1DIPORcNZsg05useLgEZMuV2NxrOJIXbo/CBBKXxQ81tJJRoBl6/ukeM3v2YG+zOpoCk+0XGQgQB9odITGserwz8iRrVS3w+UWRepBtdeZNXQE9CKXqBrd8Ceo9ztNKZubdgUwZntDJuVcPHwnBkq7pnWAWjPskAS8yJ0qt9g5AWJWLv+yO7g2GKe6K5DrW1/xsoU0f8qDQt1vWMYFkiRKm3GdxZe3BapHuUOL1HUCDeFkw8IGP/CXRHrJEwKIK+j8rdDnIl3Fe5z3JkbNT21XkaAKdUxwoefdEDmj3ck/lpmobAkXUQfViyX/o41QvvdZ68CznVycMnKi22DxTVzRMXlEgL5u2EimGYvI6jeigmXGM9tcz5l2P76+LBb2H6yd/D4WlY6xmsI6Ghu3PjdOYO7zWR4j8DUWM3TZNCGDPxjNKekK5+2YmQ4AlDuvbo736YHz/J4s1QE+/VI0W1Yol3uE/lqziZ+tmlFFy9jipjNLXliUxRbPHHmOvgBBfLsMBqObuwmwz7Yf9qTTbPzYVxF416lHUZVJluWwaahQuoalq/BLm7Lw00SnsWoW8Ctvu+eqHFxQb8Nex68I1Xxnuo/EpJNWiIr/NAUT57zXrTohN/cvDM1tDwWp1uQoFnRghC0
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(3023799007)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EE6CBE67610E14DBBD45DF835ACBB88@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 gvTHPcCAnxlUU9wnmkQIh2eZaAdI/JX98CzRCIr7MG5/Ckk2PgBdr91MdvlCE4OwxyciuN4zyAwCprqrPzNYxnPKZstjNJ4fiHBQk6kT++PcoYg+77BzKgFDyI68tcq3idvS2nBltkWPSLXEUQKI5DEctRJjoF5GUumWTU4LIoX505FVMsXlp6S/KTdb/RTxrdnRL7JPYbI9Zr9gI5wazxH2RFRhc9j+gmk3RCDClM2SwEgbjddQclyexo8Dc0Oannv/oYJRchWS3ahTyNX5eB67rGTwqakPzU66+bMA59T2xguMDGNE80Kqi3JQf06xYSztPg7Juzn98tVrdoiAgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9854
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	949d7498-bc9a-4378-31e4-08dec000d18c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|35042699022|36860700016|376014|18002099003|22082099003|4143699003|56012099006|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	PKzC4zVgIUyM1js6c2FOE/fwn1R6kpTJrHuuUdR180dcuH0IE5hlw+b1AxTmpj/3e+NaKKM4IL9cGUzIec5SudMJq2fEu+uZ4YoPv09j7x2rFDJgM11rLQlogoCc/WooVeb/rlezmP4ZR5km+FO+ETXxFM6OQLBBBF4hgtxA3mE28azOHFs++1kUywfTM78XL1c7ahsOQHEZxPNc9qElXS/Or3GwxfpLJOQkzlEQAnT9qOPc6EA3DrE57EECQACvG6nRarF7u7iYCFbkbxtr9jTSqgo5md0tejh3Op+pShc9pAR8ZdfBkfLdBrWYupH4hLfvpJsInc3BC1Nf7zRs+z0WxxXldwMK/pB1fWxPm1XGj6KyHzop+Z+hNUmkfhARprQwAwIUxR9FH9qvkDZ10tdVJwEJRU2nEUFcIi3mDV4IYgwr7d52zJqizghQ+Wy7w5ujzox162NDvSwfR8+7Q1VS484k1inm5BjFIXYzd+3NR8kD7DRheTRqjmqqI7sRH/dvNvKAXIaLxDY7iQCdrQ5nmNxQJabDo6FFx/RgmgBP6OlQBiPnP1LvqcyTPvvQfp9PAwAKmKrtYW3/MPyFSdAjlEhVOXQRJ+bMxTgRWaxy60CWc7BK8SIsW3t3fpzz6GH1yBqrImPx4TRTbs2weGzUOdeNDLgGzYexWZ+9kE6/AZejd5/q2djHkUiAkzYQ+St4i5Q7mqYxTMFwev0tScbMVt36CLBlJosT3yW3QZY=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(35042699022)(36860700016)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zosL0DbpqWgZBW2u7Ain9D29+qEtn43Ps/vEawOEe7p7V7zsdMwJ2NPUV9i2nJDya4nHPYs3MsXqA9HacVC49+XPt/7mMBH5PKDdXxyOw6zkFQSoPS5bGPqmtVqlFNmy9Mp/2T2PdJ5v93LSI6t9u5JyRKCvUUen2yoOQiB3hnjlXPcG8FG2R4ktezcb5VQGKAbJOcBjY+wAuKcw4aF1676EZgtdEYZXEICoyPtYrHQD44PQpxNwGFQcCTRLcG2dCCq7acjghRy8GoUtsiJ8uKZhmluTmQhczoLpQJcJPkRs4/xv4Er8VlMcnltDOXGqWV7LLCZ2b7nKs3VZCUeODeQI9E0jtzFaMfD68OhJKB0FiuG5ZUH+hjb/KGcIw5TGSEEzWMNTrwfI4Rx9dd7Z3r5WHpPugrKElbZANgYSOHjJx48E81JuCz3edKxWDCkA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:12:32.5530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae944e6-2e67-46ca-43ba-08dec000f801
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11309
X-purgate-ID: tlsNG-ef75cf/1780333956-0AF76C48-465AE4B3/0/0
X-purgate-type: clean
X-purgate-size: 5002
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:praan@google.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.952];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 684D762317F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTXlrb2xhLA0KDQo+IE9uIDIxIE1heSAyMDI2LCBhdCAxODo0NSwgTXlrb2xhIEt2YWNoIDx4
YWtlcC5hbWF0b3BAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEZyb206IE15a29sYSBLdmFjaCA8
bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0KPiANCj4gQWRkIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZSBj
YWxsYmFja3MgZm9yIHRoZSBBcm0gU01NVXYzIGRyaXZlci4NCj4gDQo+IER1cmluZyBzdXNwZW5k
LCBjb25maWd1cmUgR0JQQSB0byBhYm9ydCBpbmNvbWluZyB0cmFuc2FjdGlvbnMsIGRpc2FibGUg
dGhlDQo+IHRyYW5zbGF0aW9uIGludGVyZmFjZSB3aGlsZSBrZWVwaW5nIENNRFEgZW5hYmxlZCwg
aXNzdWUgQ01EX1NZTkMgdG8gZW5zdXJlDQo+IGFsbCBwcmV2aW91c2x5IGlzc3VlZCBjb21tYW5k
cyBoYXZlIGNvbXBsZXRlZCwgdGhlbiBkaXNhYmxlIHRoZSBTTU1VIElSUXMNCj4gYW5kIFNNTVUu
DQo+IA0KPiBSZXN1bWUgdXNlcyBhcm1fc21tdV9kZXZpY2VfcmVzZXQoKSB0byByZXByb2dyYW0g
dGhlIFNNTVUgYW5kIHJlLWVuYWJsZQ0KPiB0cmFuc2xhdGlvbiBhbmQgaW50ZXJydXB0IGdlbmVy
YXRpb24uDQo+IA0KPiBUaGUgSVJRIHNldHVwIHNwbGl0IGZvbGxvd3MgdGhlIGFwcHJvYWNoIGZy
b20gUHJhbmphbCBTaHJpdmFzdGF2YSdzIExpbnV4DQo+IGFybS1zbW11LXYzIHJ1bnRpbWUvc3lz
dGVtIHNsZWVwIHNlcmllczogSVJRIGhhbmRsZXJzIGFyZSByZXF1ZXN0ZWQgb25jZQ0KPiBkdXJp
bmcgcHJvYmUsIHdoaWxlIHJlc2V0L3Jlc3VtZSBvbmx5IHJlc3RvcmVzIFNNTVUgaGFyZHdhcmUg
c3RhdGUgYW5kDQo+IHJlLWVuYWJsZXMgSVJRX0NUUkwuDQo+IA0KPiBPbmx5IHRoZSBwaWVjZXMg
cmVsZXZhbnQgdG8gWGVuJ3MgY3VycmVudGx5IHN1cHBvcnRlZCBTTU1VdjMgcGF0aCBhcmUNCj4g
cG9ydGVkIGhlcmUuIFhlbiBkb2N1bWVudHMgU01NVXYzIE1TSSBhbmQgUENJIEFUUyBhcyB1bnN1
cHBvcnRlZCBhbmQgbm90DQo+IGNvbXBpbGVkL3Rlc3RlZCwgc28gdGhpcyBwYXRjaCBkb2VzIG5v
dCByZXN0b3JlIFNNTVUgTVNJIElSUV9DRkduIHJlZ2lzdGVycw0KPiBub3IgcmVpbml0aWFsaXpl
IEFUUy9QUkkgZW5kcG9pbnRzLiBJZiB0aG9zZSBwYXRocyBiZWNvbWUgdXNhYmxlLA0KPiBzdXNw
ZW5kL3Jlc3VtZSB3aWxsIG5lZWQgY29ycmVzcG9uZGluZyBNU0kgcmVzdG9yZSBhbmQgQVRTL1BS
SQ0KPiBxdWllc2NlL3JlaW5pdCBzdGVwcy4NCj4gDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNjA0MTQxOTQ3MDIuMTIyOTA5NC0xLXByYWFuQGdvb2dsZS5jb20vDQo+IEJh
c2VkLW9uLXBhdGNoLWJ5OiBQcmFuamFsIFNocml2YXN0YXZhIDxwcmFhbkBnb29nbGUuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBNeWtvbGEgS3ZhY2ggPG15a29sYV9rdmFjaEBlcGFtLmNvbT4NCj4g
LS0tDQo+IENoYW5nZXMgaW4gVjEwOg0KPiAtIERpc2FibGUgU01NVSBpbnRlcnJ1cHQgZ2VuZXJh
dGlvbiBkdXJpbmcgc3VzcGVuZCBiZWZvcmUgZGlzYWJsaW5nIHRoZQ0KPiAgU01NVSBpbnRlcmZh
Y2UsIG1hdGNoaW5nIHRoZSByZXN1bWUvcmVzZXQgcGF0aCB3aGljaCByZS1lbmFibGVzIElSUV9D
VFJMLg0KPiANCj4gQ2hhbmdlcyBpbiBWOToNCj4gLSBVc2UgQ01EX1NZTkMgaW4gc3VzcGVuZCBp
bnN0ZWFkIG9mIHBvbGxpbmcgQ01EUV9DT05TLCBzbyB0aGUgc3VzcGVuZA0KPiAgcGF0aCB3YWl0
cyBmb3IgY29tbWFuZCBjb21wbGV0aW9uIHJhdGhlciB0aGFuIG9ubHkgY29tbWFuZCBjb25zdW1w
dGlvbi4NCj4gLSBEb2N1bWVudCB0aGF0IGFybV9zbW11X3NldHVwX2lycXMoKSBpcyBwcm9iZS1v
bmx5IGFuZCB0aGF0IGZ1dHVyZSBYZW4NCj4gIFNNTVV2MyBNU0kgc3VwcG9ydCB3aWxsIG5lZWQg
dG8gcmVzdG9yZSBTTU1VIElSUV9DRkduIHJlZ2lzdGVycyBvbg0KPiAgcmVzdW1lLg0KPiAtIFJl
c3RvcmUgdGhlIHJlZmVyZW5jZSB0byBQcmFuamFsJ3MgTGludXggcnVudGltZS9zeXN0ZW0gc2xl
ZXAgc2VyaWVzIGFuZA0KPiAgY2xhcmlmeSB0aGF0IE1TSS9BVFMvUFJJIHJlc3VtZSBoYW5kbGlu
ZyBpcyBvdXRzaWRlIHRoZSBzdXBwb3J0ZWQgWGVuDQo+ICBwYXRoLg0KPiAtIFByZWZpeCB0aGUg
c3ViamVjdCB3aXRoIHhlbi9hcm0gZm9yIGNvbnNpc3RlbmN5IHdpdGggdGhlIHJlc3Qgb2YgdGhl
DQo+ICBBcm0gc3VzcGVuZC9yZXN1bWUgc2VyaWVzLg0KPiANCj4gQ2hhbmdlcyBpbiBWODoNCj4g
LSBIb25vciBBUk1fU01NVV9GRUFUX1NFViB3aGVuIGRyYWluaW5nIHRoZSBDTURRIGR1cmluZyBz
dXNwZW5kLCBtYXRjaGluZw0KPiAgdGhlIGV4aXN0aW5nIHJ1bnRpbWUgQ01EX1NZTkMgcGF0aC4N
Cj4gLSBGb2xkIHRoZSBzdXNwZW5kIHJvbGxiYWNrIHJlc2V0IHBhdGggaW50byBhIGhlbHBlciBh
bmQgcmVuYW1lIHRoZSBlcnJvcg0KPiAgcmVwb3J0aW5nIHRvIGRlc2NyaWJlIHN1c3BlbmQgcm9s
bGJhY2sgcmF0aGVyIHRoYW4gcmVzdW1lLg0KPiAtIFRyZWF0IFNNTVUgcmVzZXQgZmFpbHVyZSBk
dXJpbmcgcmVzdW1lIGFzIGZhdGFsIGluc3RlYWQgb2YgbG9nZ2luZyBhbmQNCj4gIGNvbnRpbnVp
bmcgd2l0aCBhIHBvdGVudGlhbGx5IHVudXNhYmxlIElPTU1VLg0KPiAtIGNvc21ldGljIGNoYW5n
ZXMNCj4gLS0tDQo+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMgfCAxODYg
KysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDE1MCBpbnNlcnRp
b25zKCspLCAzNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vc21tdS12My5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3Nt
bXUtdjMuYw0KPiBpbmRleCBiZjE1MzIyN2RiLi5iZTgwMjhjMDM2IDEwMDY0NA0KPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQo+ICsrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4gQEAgLTE4MTQsOCArMTgxNCw3IEBAIHN0YXRp
YyBpbnQgYXJtX3NtbXVfd3JpdGVfcmVnX3N5bmMoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21t
dSwgdTMyIHZhbCwNCj4gfQ0KPiANCj4gLyogR0JQQSBpcyAic3BlY2lhbCIgKi8NCj4gLXN0YXRp
YyBpbnQgX19pbml0IGFybV9zbW11X3VwZGF0ZV9nYnBhKHN0cnVjdCBhcm1fc21tdV9kZXZpY2Ug
KnNtbXUsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgc2V0
LCB1MzIgY2xyKQ0KPiArc3RhdGljIGludCBhcm1fc21tdV91cGRhdGVfZ2JwYShzdHJ1Y3QgYXJt
X3NtbXVfZGV2aWNlICpzbW11LCB1MzIgc2V0LCB1MzIgY2xyKQ0KDQpOb3cgdGhpcyBvbmUgYW5k
IGFybV9zbW11X2RldmljZV9yZXNldCBsb29zZSBfX2luaXQgYWxzbyBmb3IgIUNPTkZJR19TWVNU
RU1fU1VTUEVORCwNCmJ1dCBJ4oCZbSBub3Qgc3VyZSBpZiBpbiB0aGUgY29kZWJhc2Ugd2UgYXJl
IGRlYWxpbmcgd2l0aCB0aGVzZSBraW5kIG9mIGNhc2VzIGFscmVhZHkgb3IgaWYgaXTigJlzIHN0
aWxsIG9rDQp0byBsZXQgaXQgYmUgd2l0aG91dCBfX2luaXQgYW55d2F5Lg0KDQpSZXZpZXdlZC1i
eTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQpDaGVlcnMsDQpMdWNh
DQoNCg==

