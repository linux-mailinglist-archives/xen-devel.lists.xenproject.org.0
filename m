Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L4HGXic4GnokAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:23:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A832D40B7A2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283092.1565390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDI0B-0000Ko-8v; Thu, 16 Apr 2026 08:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283092.1565390; Thu, 16 Apr 2026 08:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDI0B-0000JD-50; Thu, 16 Apr 2026 08:23:07 +0000
Received: by outflank-mailman (input) for mailman id 1283092;
 Thu, 16 Apr 2026 08:23:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wDI09-0000Hf-Cx
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:23:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDI08-00FS4J-Pc
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:23:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e09c60-5cb7-0a2a0a5109dd-0a2a4503df4e-30
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:23:03 +0200
Received: from [52.101.72.51]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e09c66-672d-0a2a45030019-34654833f43b-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:23:03 +0200
Received: from DU7P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::33)
 by DB9PR08MB6410.eurprd08.prod.outlook.com (2603:10a6:10:262::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 08:22:58 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::75) by DU7P189CA0028.outlook.office365.com
 (2603:10a6:10:552::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 08:22:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17 via
 Frontend Transport; Thu, 16 Apr 2026 08:22:57 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB10100.eurprd08.prod.outlook.com (2603:10a6:20b:63e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 08:21:55 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 08:21:55 +0000
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
 b=t7cLBJZe/SO6m8+Dlpeisa7x1CaigaZuLm4L+6/vh6xYEkIKz9CnGL1nHheKUSKW6mvYWVsRGcJdzOPqUM1TErl6VefLimZ2AkUNvSLIGtMwvebbTFS6OHSBj+M9zfyHXuAS1lWLcZIARL4gfZJYy3bpPu/ce58f/+WDmm3zr97DLtKg4Mm6TZdjwUnYsfCWMX92l6egxTVx9fNLb6MV5Qf9Zz+hteTFzfpo/zXmZVruiUN4u+owvMoKW38RrotEF6+2XRcp2daeVbpOyYWyD+o9kqkxIAo0vl1iFOu0hjlcJ0wMISdR15bkBORri9YOg1UL4YZhTV114vQDdLGBLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfok6GtyZbB92DO23LCWQJIQ0G1lbsbdtCxjgOCANBI=;
 b=BQ3I9ooFbaaFXE3pyu66mIW0OQ8GZJmRMlZ4dYB8k0hJu/Qo3MOlgXcBWukkTY5hTqb7hpWwE+iWX3FR1AIGisfmqFS7zBDcatLN+uMG/nL2k7wfh+TtXpXLsDHSCQmncv/Py4jH0Rr3hnCba6guzXXRuX1PPJWIgGhx2zIDgu90BzPcGnFWtorIlIplaBbLiMdc3ucTNaDXjU6nlXY/eCyN5MarunrsKMymH4Azpy9GuLV/xS3QJEzGvg+4OMyAvzA/q6wh1eUtZIvJGnE9EPZOiZCkrwo7tVwF0yAeg1KGhcoxqRdu6UQvkRzNo1XF+zOul3a3AjqduMa0rSNF5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfok6GtyZbB92DO23LCWQJIQ0G1lbsbdtCxjgOCANBI=;
 b=TC4HqGeB6Zdib09QwW0Qxpc4/df0QU2RMhJWFZp0GIOQP4LiDIDG3sZ1ck2LG3yUsDr/A7hmxo4NLwr9ZsrzRRMAAtwg/Dqn7fpQrLfxNmjHaNmTizd8PVNHG9XVHUgS30/BHbV+CqeKK1/eIZqt2UrQyUJWda1s/REJIBGe32A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkqC7rOkQRZXaAZDZPFUOYNK99VPVdq7Vw4WVnyLz05f1OeA7vARWwssW08h8vn1Fa3jUl0SUhTjdw07cGHbU+0jiSKWv0rymxJrNiMAtzDuvfZkB5tAvS3fDJo92pf8MSn5X43hB/QbHpckL/bluEU5XH/xrihmAWWHC+cCK6+2LCEq6Mo1wQnlgDO8HNRnaHSlm/F0n/Ne24cGQkOrAWaYj+O2W94yI3rJEE4VhnVa9M+c9eAQo04OlbSVIOx4ZwTJ8RART0vUg9DaeCeQ9ycQ6wtUrIvej0rk5SN9Rv/VtwWZvqstRmepsArptBL32bpacvY1mAYH0sk/lc0v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfok6GtyZbB92DO23LCWQJIQ0G1lbsbdtCxjgOCANBI=;
 b=fd8RI6JAjbtFrCtnD9vX3bpgPuXZapa9+g/dfsDiF23LoKlDXJAhMYbvQDJcddQk/ozjTe55InOFs74Ktk1iMZomKVFooqMvgq1/keDWuSGOlzPVqMZHX9MaVAWVmuYMwBvpL1bB4huPNH4+padKMIzsun7FYvyhyHm+KJZ7aELi7cMB94PQzpgt4P7HLrte1Iryh3O2kbJFkQIO+WYkfJI2xn/Y1TKOvTl5RjVwNwCUb4F2KxFF2/xPc+aRq8GRRFHGDtj0ghnYHWCw1sQYmvwZOtlp2ltrdMdnfSxmmrCJXcjMMCAzHNovQMegH9nUZCuhWNg55lZ0VuNGAJa4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfok6GtyZbB92DO23LCWQJIQ0G1lbsbdtCxjgOCANBI=;
 b=TC4HqGeB6Zdib09QwW0Qxpc4/df0QU2RMhJWFZp0GIOQP4LiDIDG3sZ1ck2LG3yUsDr/A7hmxo4NLwr9ZsrzRRMAAtwg/Dqn7fpQrLfxNmjHaNmTizd8PVNHG9XVHUgS30/BHbV+CqeKK1/eIZqt2UrQyUJWda1s/REJIBGe32A=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
Thread-Topic: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
Thread-Index: AQHczMxJn1pwTu5+sUmN2MgYtFAQK7XgQWaAgAELlQCAAA1zAA==
Date: Thu, 16 Apr 2026 08:21:55 +0000
Message-ID: <6E811F82-6F9F-4894-B2A3-03AA166E78F4@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-6-michal.orzel@amd.com>
 <519E2133-12B9-4E51-A7A5-FDBADF82159E@arm.com>
 <1ab0c888-e890-490e-adad-938222f31a62@amd.com>
In-Reply-To: <1ab0c888-e890-490e-adad-938222f31a62@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB10100:EE_|DU6PEPF00009523:EE_|DB9PR08MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a04a5c4-4d6f-4677-766b-08de9b915dd9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 ESRg0aQYHlDuOvQN+ex7kU7EY6IrjnwDpDDzgT3RktUvcP2Cc749+D8BIodlvXHOk3v/fAFvh1JuwR3YQgcdfjyWjC2Sv4+pPf3bq3dd/dVmWQk6raCJewxuaVr6ghdgu6gTY4enQiRMzwTN/hJiRgPPg3kRHNAWSNhTdH/OqcOgJW9+bMEuZSGOr7RhI0owWToDrHDXTEPUYPbICzBg+0shOoq5h9TzQTR0P9SGyOQSk2dLgb50VWbSGHc0wSLyDCHCydxDfBQf1w6zl8C4TSciRCQ8ZMVfRykPde58O7ZgybqIxQqRWEZrDTmkBH/OKa6fBfs2hDaCLDK95NO9iMjrgLtYUf820wAalWh7b2ee5luG/pqaIaQj4wHCASpJ5KkJX0arKd6pW8q+yfGkeipC698mJfYOs6C1NszNoRavMH0PvuvnQAdYi3chp+Qjz8PEhLTJ3xsV9EqhlpRrwbMhzPdx65lEddSaZa9aCAQCsoF1mikqRulNrO9AZ4EWRErBavNLL+POiMyGK+CdUX3nt0BDZQD/naSCLO3NLqXEnc/dVMzvILEcJbZwtL+KjbFeN4LqcD8lgre4SkoPNGZwX3uvWsaQ4EhKMMYSyFz4eBLAkp8eM/hFlMgmudQc2Z/UyEsnqSXVMjVBIE4OW/ylWaumPtrZAwYt6y5p8Hjg7KEDfySOcl+Q0TNm47KSatgengSDaxegEBQujNLZQxw2pXfBRu4qRiIGyc/fU+yei1Rjynjjk6llkePSDEH9Dyh0bF0dq6AiVgBU85dU9cgqAH2iJ4NzvRY1ebFE2go=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FBAA3E282303E54C8223F90B5A943A88@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 I0a19+tP9RlLYPaejhJULUFtZBhN+3eJ6qpqGh1eC470h2LpEBMNq3k6pkq/hHjiNwNJfuImxHSGOKfg/CzYcPF2M1Fiw7p4E6eHpZ3kXCHiX0WpCZas+UYHyXM3Y89A+mKqtpv4xwKlLXjb4b2MgoZrmHf2/TEkUa5z/sONZOmXwOazxSDFl8ghWexr6Gr4/OHJ3vOAh1vS1pS7fSTZ0YYcSBqXtph3GbzFsO1ls4vXkuY6gJDyVn8zFXivEmtccYLSoVXvaL3JyHdWSdGdkvsDhUU7IO+Ur1ErnXem5Y6JjI2AUHB3V0KBinT8U7mrXZ7n/iGukma3lqg9MmGhOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10100
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b8b6a28-156a-46dd-65d0-08de9b91386f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zBBTcpBLwSKR2F/x0qsTp0e+j0vjwep+tYRT7fn8/BUi52Hc/qSdhG7vOhl9xo+SMRIBOmc1t5uN6O9NInMbPRiPUMLAHEjYIXHrnecCbqUwm7HmafX7Bplz/dHqobb66bTw6B3JvfFWLQcXU47a7dzj79CVAmo4Twpus+AOvx6E1MpH7DzlSa3+GgFQhwpcjrhNDrKGU+fF5zW7+3K7Susjq/bt4M6qWU2gjaDsVDRwoNzwxqioqO+NrLGksYtHwszb9BdMP4vVnUVArpKGRS81bRUXXwGkRBUcxUaqJuCSybaJnCERy2sMFpBkvc2jrvoOVEpkBT6P69lrlsl4NwGaLhIad83RLgmkFZt1bbz9N7sx2Dflx3VBHUvUUrFUZoUOvGfkDs0Rv3B6qnVWqlNrihGILWMStKV9fUjRGM61DywJiLngYncTb3R3QGHHDkCnKUp3gdJgOwGAPp5zO3LO7JZ+VYZWzW3rFKm4FE9H4YldLiiZTIPHXySjEv4jDI3NLNw4HFf4W2wZV/pZSu2hHBWITiSkQfmQgXsDV3NLhFdt+S2xYnOEd9C/K3GS9hbRZ019e/9DH3i1INvV7lRPBQy4PbvWKLXymNUeyJ7be7um0tCjjsl9Mo7Li/k4vfUv6mBh1q4lYXpac8BK3RiiYI3vUdU0H7DM7pe8OyEyOnph7TWfTHTMBhBKMYMAe0QhcEaF0Pbm6LY5wkz52/ecrs3EOTZrUs43AvRec3nMWfIqV2H9TA/USfGKf0kmV5Sm03FvQWjZwXhrlFSlBg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8XijxgAVspez7RIgw+T4LkDnxLqFQcXOHEC+c2yPrhROo0blS6tygElomQVaLvkAoDRLmVti7yohDxiqyi0f2Kh088YJlxQYs5uTP2fxuFz3WOEdCLzMAPnxCrom/GC0U/4UWFWjnORylAN9Coiqaw1f48MWqmSmuasBgfYZKMbeCtKFX7McWmkSmsCtPBh/UD7rC63WqmLiYC6KKnX/OwS56pN3pOpy3Ilqhal7BXLGfwAg4e3wNuWv3q1zBBhUPyXrrzkkiI8U/U2oqKBNdR0rtLHGrjzXEVLN/yJ78/lZLCjViegLIgl19oqmkuhnLyJTdcTKm9ISATWbbY7WQ0xqJacxuTa1v5rSGRvqH4jQerGYd/IG/zWuMp7Ia1wneeKLsrw5LEKWDHzKwgTHRyl4VN2kuU5M3JktIfGdNswAleK+IAyc0hSutjUrXDBt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 08:22:57.9303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a04a5c4-4d6f-4677-766b-08de9b915dd9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6410
X-purgate-ID: tlsNG-33051d/1776327783-2BB6C938-85F40542/0/0
X-purgate-type: clean
X-purgate-size: 3223
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: A832D40B7A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>>>=20
>>> diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tr=
ee/dt-overlay.c
>>> index d3d4669718ac..a0dee7edb7e5 100644
>>> --- a/xen/common/device-tree/dt-overlay.c
>>> +++ b/xen/common/device-tree/dt-overlay.c
>>> @@ -286,6 +286,63 @@ static unsigned int overlay_node_count(const void =
*overlay_fdt)
>>>    return num_overlay_nodes;
>>> }
>>>=20
>>> +/*
>>> + * Resolve the target path for an overlay fragment.
>>> + *
>>> + * This is called before fdt_overlay_apply(), so phandle-based targets
>>> + * (target =3D <&label>) are still unresolved (compiled as 0xffffffff =
by DTC).
>>> + * Handle the two cases that actually occur:
>>> + *  - target-path property: the path string is used directly,
>>> + *  - target =3D <&label>: the label is looked up in the overlay's __f=
ixups__
>>> + *    node, then resolved to a path via the base DTB's __symbols__ nod=
e.
>>> + *
>>> + * Returns a pointer into the FDT on success, NULL on failure.
>>> + */
>>> +static const char *overlay_get_target_path(const void *fdt, const void=
 *fdto,
>>> +                                           int fragment)
>>> +{
>>> +    const char *path, *fragment_name;
>>> +    int fixups_off, symbols_off, property;
>>> +    int fragment_name_len;
>>> +
>>> +    /* Try target-path first (string-based targeting) */
>>> +    path =3D fdt_getprop(fdto, fragment, "target-path", NULL);
>>> +    if ( path )
>>> +        return path;
>>> +
>>> +    /* Phandle-based target: resolve via __fixups__ and __symbols__ */
>>> +    fixups_off =3D fdt_path_offset(fdto, "/__fixups__");
>>> +    if ( fixups_off < 0 )
>>> +        return NULL;
>>> +
>>> +    symbols_off =3D fdt_path_offset(fdt, "/__symbols__");
>>> +    if ( symbols_off < 0 )
>>> +        return NULL;
>>> +
>>> +    fragment_name =3D fdt_get_name(fdto, fragment, &fragment_name_len)=
;
>>> +    if ( !fragment_name )
>>> +        return NULL;
>>> +
>>> +    fdt_for_each_property_offset(property, fdto, fixups_off)
>>> +    {
>>> +        const char *val, *label, *p;
>>> +        int val_len;
>>> +
>>> +        val =3D fdt_getprop_by_offset(fdto, property, &label, &val_len=
);
>>> +        if ( !val )
>>> +            continue;
>>> +
>>> +        /* Match entries of the form "/<fragment_name>:target:0" */
>>> +        for ( p =3D val; p < (val + val_len); p +=3D (strlen(p) + 1) )
>>=20
>> what guarantees us that p will be null terminated, if a malformed overla=
y
>> is passed this strlen can read past the string, we can use strnlen havin=
g as
>> upper bound a counter=3Dval_len? decreasing counter each iteration.
>>=20
>> Or do you think it can never happen?
> In theory it can happen, in practice this is something not usually taken =
into
> account. But we can surely stay on the defensive side and do a single che=
ck
> right after fdt_getprop_by_offset to catch not-NUL terminated stringlist:
> if ( !val || !val_len || val[val_len - 1] !=3D '\0' )

Ok, do we also want to print a warning in case of malformed properties inst=
ead
of ignoring and continue?

>=20
> In case of no other remarks, I'd do that on commit.
>=20
> ~Michal
>=20

Cheers,
Luca


