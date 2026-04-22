Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMAHAGlZ6GkcJgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 07:15:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8D44211C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 07:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289854.1569547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFPvN-0008HF-Jk; Wed, 22 Apr 2026 05:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289854.1569547; Wed, 22 Apr 2026 05:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFPvN-0008Fi-GB; Wed, 22 Apr 2026 05:14:57 +0000
Received: by outflank-mailman (input) for mailman id 1289854;
 Wed, 22 Apr 2026 05:14:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wFPvL-0008Fc-5y
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 05:14:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFPvI-00Dtay-5w
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 07:14:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e8593a-bab6-0a2a0a5309dd-0a2a450be2b8-48
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 07:14:52 +0200
Received: from [52.101.72.2]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e8594b-212f-0a2a450b0019-3465480220e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 07:14:52 +0200
Received: from DUZPR01CA0135.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::6) by GVXPR08MB11610.eurprd08.prod.outlook.com
 (2603:10a6:150:326::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Wed, 22 Apr
 2026 05:14:48 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::c1) by DUZPR01CA0135.outlook.office365.com
 (2603:10a6:10:4bc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 05:14:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Wed, 22 Apr 2026 05:14:48 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB6406.eurprd08.prod.outlook.com (2603:10a6:20b:33c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 22 Apr
 2026 05:13:46 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Wed, 22 Apr 2026
 05:13:46 +0000
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
 b=Whv0coskLLhJNDna+qqc7Z8xzqjo5svPv3mG8J9v8I6Dq0xRFyjnrwhDI4jLJF6sSiWEiAIngKi5e/PcL1Wo+nbgGwMM50A8QZoYw84xVg5XovdADgQ414UeziD5iMWpSpnj82MrGPkLqBH2Ue1uZ4B8EWNBuKW5DkUxV6nArPRga4YgpiHClDRzu+PHf6ZOVy9p710oU0QXaZXD9HAkAGfRpfOLzfLsi2EtSUuRJkfYT+R0kYDNIoyZs1/V+qeWQbJVTYO8P0LNELA4WyN+r4k95rDwsGX7KFXPh5jPkk8QyoPHnSFtW3bwcyYSDDwZ6FF9xZDYxVjIoV43H18Xcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6XhVuBou+QiAULWpIvVnUfhAOkVWr/dDnjBKEQ+IfM=;
 b=mbGltR81MDmAYrYqjOxtjdmoKnsPQouew2ULW8DAGOirc3yitYrSUTYC3uHyCGfjQ8ZQfEZ7n6Ai49RAQHa+Enu0hsWjQgKx5jOdbuLPyP5ol5M4mAVHaD0cS/CNKgiY28KSUyDHWl1W9cwe9mcHG8/PEVmFQIkKr1lqzYX5caJje7/VIoPaLJlROi/8Nt+egM3hX1cZrS4v9kCyYDk7YcWdxWhXmzJoInWPSWcFeNPpnTH3Xx3RCBOJcO1NXbC+GaHRp2rWK1Ig4zJJlB/POJX2aIR+sCVMw7g3VOipGeqCZu4YhpStZIdmpdLAwI86OeJLyZg34/coAbKNPsIlzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6XhVuBou+QiAULWpIvVnUfhAOkVWr/dDnjBKEQ+IfM=;
 b=ocZ5w4kunbxMyHGHoBpbsO8YgyA0L2tTuwGvWu0CxAZgcR5dGRhbpXVTMbr4qAmh8LQU8iKNvwZMoEy/o/QO6kEzslNacz7Kx0qC+L8qTQvBuUpUeVM4BN+8Ws/ThnnEcUlwsNMPnbBAUfbB6js+RPztfMVFtWkWV5uovTI0O4I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dt3tef974xQGthckB5XTgv6t2JuNIXqNEa29FMnLrPt4N8m9o1x6qhd/5uURMZSWifZl5nb9eJfaS2ePCaPrsVwY+UFh5mo/u8jBGkPzYkZ3Hly2HYGykFBbVKoYVISzpQ6u++lnTPja8wReC8YTeNYWgS0cq68JH0AXzlcLRX2dE5j9NUU12nxn+xIROvgap6oZgzgchbLAJ7fdVmLfvZceuPKUzsZV3zy/ivfVvwym075+K6/Nq9QpDugBpmVjOyBcvpN/v+3aKjjlAsF8szLR0dM2Wn/PxhZ01PFefeHTtYe0UdPBRuC7v9DfdKN5XY1P3iFaLmsg9mVWh+8icQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6XhVuBou+QiAULWpIvVnUfhAOkVWr/dDnjBKEQ+IfM=;
 b=qnr7rz9ulHhpHeM7TljytObo3/PIRj9w8tojOf7TcsKiJzJUYcfEN0XodAQL9NRjDJH97sCaJBjohez8Nenwf/WIjrOpqPg4k0y2dDYgQqp09AhLcknEqgH4eTKslWl9V7piW2e0P537J8CaHaCLbCe+zJ2zgmNwOdak4SkJAmuXiu6hfIfdWTT5FckwiEUZHTVVBQQChtwtb6L1QuMaJP/GiLbdYsK+Z+rc4Wt6LxfkO4NaFFt8GlJwDubRhVbDinOsTal3OwsxMvtnkf29cCsP2DUk+4nxs+JfyzywnbCpK0UPbt5N6nW9DDTmfUFjsZOqe00W7k11akacrcy2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6XhVuBou+QiAULWpIvVnUfhAOkVWr/dDnjBKEQ+IfM=;
 b=ocZ5w4kunbxMyHGHoBpbsO8YgyA0L2tTuwGvWu0CxAZgcR5dGRhbpXVTMbr4qAmh8LQU8iKNvwZMoEy/o/QO6kEzslNacz7Kx0qC+L8qTQvBuUpUeVM4BN+8Ws/ThnnEcUlwsNMPnbBAUfbB6js+RPztfMVFtWkWV5uovTI0O4I=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jens Wiklander
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/arm: ffa: fix build with clang/ATfE
Thread-Topic: [PATCH] xen/arm: ffa: fix build with clang/ATfE
Thread-Index: AQHc0WbA/s1rIXoAmU6+7rPJ118Z7bXqiryA
Date: Wed, 22 Apr 2026 05:13:46 +0000
Message-ID: <DBA0BC61-C6AD-45D0-970F-0E8FD557EB11@arm.com>
References:
 <581a0752a1af3775fb676a70c4f42e7fb958dadc.1776758025.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <581a0752a1af3775fb676a70c4f42e7fb958dadc.1776758025.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB6406:EE_|DB1PEPF000509ED:EE_|GVXPR08MB11610:EE_
X-MS-Office365-Filtering-Correlation-Id: b9089b2a-f459-4c45-88e0-08dea02e1359
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 Vc0Hla8rJxSRm0ZxQv+8is6Mo0EWfOE/S9b0eMhLjROBFNPzqfGFIgFXAJmYZTGhvzZRSEILVhYxObIfOVQAFJ5BePLTizyTSn+ZAEqvZQRtgQzQDMFH0si5xwAzUFu7i8a7E+qD5PxftqndiJ7TS/n8EmRhgF8S6hAU8wYdcx/ci7+fwwQV/+t26RO3HSH6oE2obVc7QQhYiDKzqml/DuBoGPHLLHeO2zH8nszQ44HkU2BCB6RuNUsojLCOOZxrLkk71wcPy6S5XeBsNSkL1rQqJX9BEETciozuW8jBbovGf01kAmrR/NbnK+pCcVYsp9QZRsBZcKvxl7tECdPA8x/xh1EzvhmMDefyQhQ69fQhvcmK+LErdOuG/bEZN1lYMxezNkx0B6yO1Yenh4wARXMc/xogEqAazMqKk5v5SOxhM0EXgQuJRJa2eT6mSrMGLCSB2MuugZRgdvNr+ROEN9PN0UdZiCR4A1tcT54Y0IZTomF3k4XbRzvotCs7ttcLpjh60M/8oxqAZXwKhdPtkHH7wK0DhYMxFtWX2dN23jnNElAuqvmlrWMGk3KoymQ/DI3z4t+r4HePkoIKetklyb3t04sODbr8i1m97D75cd/ewIFHtJFRGucAunnEFRdLVPTA6LWJVlssPAJgoMZDiSlGtsTEp0cjktuvZh8E0KyeO/zTCO7GOp5bpDeUOddNczxHYyru4Y6YQtBjQaAGb1kEoYJR6wSnVeUl9+yHuHWhiYkOjCBvUrn/0ofNG5UGeli/WcZ4fRjN3Q34ezsMYwaMQW3i0gDxPqpTQL7E0Tc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5A37061ED94FBB41BDFF648E177BD0BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 DDz0OyuGCdSpaVI2X3NxCzVUs87F18sR0tQbaA11EGXje7KCV7Um77P9KV9LsT53fDEt6W2QSEMg6PYSJ/3dVdXNKtSKQbj4hw9vQ2omBPujRmNcniZ6ySSppuabxTuMtd0KzuhgqdyqtHsiz/BCZv4jyuYX5rzubZ9uOxMYIxVWrdqoyv9zjqa2g/bFpczH+P+YTeIc48KgddxzYtkscmbzyuOKHYT0DhKMzPHjahRF+aJQdl5qNeuJJx4vRych3InAoI+2EBASCgyENOxPdA45upSuikYX0aOxs8SHdgufV6VqPHf9Bm1vePe08XGfczYHvl7BorF4Vdaewl3kxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6406
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2cba873a-f337-4cbf-c662-08dea02dee12
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|35042699022|14060799003|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oCWFauPKwfubFxSU0P5y6RfzfZYrHAAPxO8NHN11DSZAwm2h0j3/AEvz5nbVCmLXFNVMOGmxlNzZHijTG6b24X/xKrtcJFRT83IWUN2LW21xClj4JG415ip5bzPo6NsgMrugvrdTwGHYk3xImw+gyjweag81SpzfBqQflFbul/RypyKgeBHGsD0ZbxAP6oQasa+u1xplY8vTbsAb5CFOw8HuSffTUIulBCfHcUAWUZSsyiLGX+AV5nHidTrfuywHKonrJwWpH8qawUhzyeT/03HSa4OgzNQjrScHC1aAq5SFez2A0AX5fNXTqt9SzoCw84AEf0iXpPMxEH1Q7B1kiEiWq/ktYIlh976siho/3HCoVWCrMLTakcrShDUPkJ3f8PkHtu1k4Jz88ki5zUpRMUdCISE3rEnXwTWZ1l5YE8fZIPu2QGBV1iGHk4xaFBK3dsNFmUzBvCo4lYvacudXCdN1g+vE2Yf8YdHRDAVyMPyAm5IflYi7jSHTXKERaWL5JkOelGJE1a+O/KbrFLMaQMRZpkxITFRI5c37fU+9IGWdG3HSpGGB4fr8yP+l1BNSLdvU41G8QBavwu/dXCmtpHbCRpYbdZLSwroUQqKhKSNmY5FcIVtqPZZLQl/vQzKuDdQfYaXY85Kvj1lmiiVXtt/MCfAjFgqZp/zDsah/JcjXuBJNXsBltbP3oo37H4La9XMej0i8x4yUAP2yKlfM/zb/DIehE71/ZCitaayZFrLQjJlPFCQazrhdGzU47o/WWdCuh1f8EfUpz8MJlk/oOQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(35042699022)(14060799003)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	//L9G6O3g3PCVU1NXKMiMiXuG44D2nbJMk6ZuhLV9romtBIgUPbfwpJMjZkH/FQkJdv3a1ZgYtX5hwpWo56wyXY468LzvUttD2jxjG+CA/X61sP+hgAtZY156qaLA9utgZnLEbj2ma/SdY4gMm7DDaY/uZTa3hQs2cNEE93altOTtBwIGuxKCsS1Wy9CjUUrwxk9iZh7wt40xMaMTYn8CsVzQE7yDszx+FDzx7og333jqpdoLgQVzY72sswbHEexwaTgtGgZwX+l7P3cMa0ZBSCMKn32qTW9toONkoyUMG9UZJAQ/JDBcD0/1PafOqqyCOXmxqrwa5xzqCWn4yNKt2UkalSwpdjSqRP6+Jy0FDcHzfBVrWm/uicR+/tf0FhX+Jc+Mq5IpoN7L9H9PexllU8IAg/Qvu64m1EM8P7sly2cZoyt2vo17gC1DWJDwBLq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 05:14:48.5758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9089b2a-f459-4c45-88e0-08dea02e1359
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11610
X-purgate-ID: tlsNG-42698a/1776834892-7E16DF3B-EE8DED18/0/0
X-purgate-type: clean
X-purgate-size: 1868
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:Volodymyr_Babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url]
X-Rspamd-Queue-Id: 54C8D44211C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmytro,

> On 21 Apr 2026, at 10:13, Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com=
> wrote:
>=20
> Clang 22.x.x or Arm Toolchain for Embedded 22.x.x reports:
>=20
> In file included from arch/arm/tee/ffa.c:75:
> arch/arm/tee/ffa_private.h:439:17: error: 'used' attribute ignored on a n=
on-definition declaration [-Werror,-Wignored-attributes]
>  439 | extern uint32_t __ro_after_init ffa_fw_version;
>      |                 ^
>=20
> There is a fix for clang 16 in the git history:
> a1a1e2b7dc4f ("xen/arm: ffa: fix build with clang")
> which was broken by the following commit:
> a90376c6adbc ("xen/arm: ffa: Add FF-A 1.2 endpoint memory access descript=
ors")
>=20
> Remove __ro_after_init from the extern declaration of ffa_fw_version.
> The attribute is already present on the definition in ffa.c, which is
> sufficient and correct.
>=20
> Fixes: a90376c6adbc ("xen/arm: ffa: Add FF-A 1.2 endpoint memory access d=
escriptors")
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Sounds right to me:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/24674463=
33
> ---
> xen/arch/arm/tee/ffa_private.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index c291f32b56..e16bc0d83d 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -436,7 +436,7 @@ struct ffa_ctx {
> };
>=20
> extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> -extern uint32_t __ro_after_init ffa_fw_version;
> +extern uint32_t ffa_fw_version;
>=20
> extern struct list_head ffa_ctx_head;
> extern rwlock_t ffa_ctx_list_rwlock;
> --=20
> 2.43.0


