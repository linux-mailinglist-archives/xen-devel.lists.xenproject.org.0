Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lgSUL8mP12kaPwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:38:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178563C9B80
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277080.1562345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnht-0007Uc-KA; Thu, 09 Apr 2026 11:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277080.1562345; Thu, 09 Apr 2026 11:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnht-0007SO-HM; Thu, 09 Apr 2026 11:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1277080;
 Thu, 09 Apr 2026 11:37:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wAnhr-0007SI-Ee
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:37:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnhq-0019io-Mw
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:37:54 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d78f82-bab6-0a2a0a5309dd-0a2a4508ab4c-36
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:37:54 +0200
Received: from [52.101.72.65]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d78f91-fab6-0a2a45080019-346548413fda-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:37:53 +0200
Received: from AS4P189CA0031.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::11)
 by DB4PR08MB9407.eurprd08.prod.outlook.com (2603:10a6:10:3f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 11:37:50 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::f7) by AS4P189CA0031.outlook.office365.com
 (2603:10a6:20b:5dd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 11:37:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 11:37:49 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GVXPR08MB10449.eurprd08.prod.outlook.com (2603:10a6:150:157::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 11:36:42 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 11:36:42 +0000
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
 b=Za6Ujt5nsOrScavxFlA6ENRC4awM/nnRG8TIRiT4MoJqG1ml2NyyZa2UJwzN/bIoskCIVv1VoiBfsr03y1adCh5YAbnM9Glg9aDyGj9cDEJxzD3j5UucBNGguw76F8bcae21srNzwDgdUQbmtVowwW/XaUaMbezeDoP2Tuuahx4nuzdqt22H+uwsle0baM13iqZLiBkxXQ38f21S/pBDnRbJ8XfrUuBLOv/XFfuVerf5G16T9bZ96GcRHNyRSa8PQ4qNuTkLKBArbstZ3LoybtrfC+RpIMC7MWEtLwmRWf/ps2dynfpD8h7a7KRZsjE0Pq0YqrhbW903Yp2G1xkuKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyxrWZ6deBXUhYY+oTVUQpBNN5cynAEumxvyF2zOWsY=;
 b=kKlZ4c82Ec0Wp6CzB0si56rAxgOL8guNgyvYBV705bSrdjb+LkekgHQxCT3yoiFEdTewFury7RWqoJwi1U+1Jt4xSXKhAeGZsNN8Qjn/l3z0G7T+CAXi3wQBDwX6xD4WkN2k2wr6X0Sf7ZD1kokmdCs0pIcva/8NckBg+jnHPzI7i6C5US8NGP+6zXSW24yuVO78am7FzGUVRFygBeu7u+FLO4cjKI535C66EP7tVduzT1eHzMEA6IECe32ege07eqN1fsu1PRQB1YRRCVxGi6rRRc7MhNafZr8yEHJPzaJMQJ0RHU/V7OOw3tELpvyWxqqIxCD0ndAEj9yXjfQuXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyxrWZ6deBXUhYY+oTVUQpBNN5cynAEumxvyF2zOWsY=;
 b=KiH/UAxSKe4TiJvwpuVEp4WDHSMGbxWEXhi5s/b9ewBZ2wyhH94GGli0MVsoxIs/LlBE9+ORK6YiIaAzVAXg1xDODiko1mTxyjY/xbG7LMyAy27v3ZhSPkGjoTro9Srmua5sfEJ+MNr3VduoI7H/VwTOGgtTFTMMb3lYyp2shfg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcFjjqwLCyxCuezgt9A/sis06Ilg3szl7E9HKPaZc6KTBAnxOUa9vPU4xMc3qFOgHIVOrCxvUVMmngVc3VT5xHx5JmXgat6Ftpidl4mtF7nH1hfjDccgchcJCvzxpONZABdCR+AL5XvOBEmYoh0kzeGGy3Bq39a6F0W4ttDhmNchpk71zx4H3M0fivBd19oEMx4PWZHmGAHU7YCn1ngxSczrRFXPgN0dCqwqNTkCzYKullRXRwq/g8t7fsC53HthDeGTgMlo3SWlCMGyHjEiZDVqKR17r73TD1HMm7gcuFTql/nAmiNNNc8MXpknjZKZPBxyZPnAwQrl2dDZ7tAvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyxrWZ6deBXUhYY+oTVUQpBNN5cynAEumxvyF2zOWsY=;
 b=cNqDOIx4nbQ0y4zZ3+YZP0QOwkb+7B/fsRYHV3ugoiFKRMIpwBC06iFoDMEkwdKteAiWVyl5gShx/ogd6zd2aTPsHiZmexxLFQ+nkbZEsTEEH3f+c67hLEq/RHaFfsztZQAHVc7ngysgDbQzY5h9Fjs4OgaDITBeuHY99p57jM9Xh3opwzx//SG83PuIHDI8DnGBP2MXrN+FrUadgzUkGofJmJ5lDVpUBBpbqgKjKuf/KMxEPICJIhiSgFGDU9+Y1CAJgB/eba1iIFuU8zXHMKn9gRiIhIplsGkOpMPYGitCZLMsYn68lGhtThzMaiWs7AUg7lbTZbdyFpGdHbWN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyxrWZ6deBXUhYY+oTVUQpBNN5cynAEumxvyF2zOWsY=;
 b=KiH/UAxSKe4TiJvwpuVEp4WDHSMGbxWEXhi5s/b9ewBZ2wyhH94GGli0MVsoxIs/LlBE9+ORK6YiIaAzVAXg1xDODiko1mTxyjY/xbG7LMyAy27v3ZhSPkGjoTro9Srmua5sfEJ+MNr3VduoI7H/VwTOGgtTFTMMb3lYyp2shfg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh
	<Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1] xen/arm: smmuv3: Add support for removing devices
Thread-Topic: [PATCH v1] xen/arm: smmuv3: Add support for removing devices
Thread-Index: AQHcxnUZYHa+CmL3S0yWL3bconIhZ7XWnTcA
Date: Thu, 9 Apr 2026 11:36:42 +0000
Message-ID: <AB01C133-7409-44DB-9F4E-7D8AB2566A4E@arm.com>
References:
 <a59c2da0d4c72deb42950e9a8e3982fbdee60668.1775555766.git.mykyta_poturai@epam.com>
In-Reply-To:
 <a59c2da0d4c72deb42950e9a8e3982fbdee60668.1775555766.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GVXPR08MB10449:EE_|AMS0EPF000001AB:EE_|DB4PR08MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2965ab-efc7-4d9b-5d1c-08de962c6dca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 fUTDnjGbfHZZhY0JGM/1Fpi1sDqZZidED9YF4crtEmoB2Q0N4BzRKK4tDMUoXSSD66nOdSnP1zVoYgPUNsFPbyOexDn8PL1UAmmWPPaTcngUHq/uBnOkGZ58AM5LH1kkcunJTj/80dZj0pQ9G0NlttmFTVLBIo+cxp+/7pgOCItp8rSmCgi5QHAY1kgnZNmsfNhawaDw1Fj5tR2vlN/3Dbf6waRLg6UbQz+Rrh1ebczGw8Iherlgvsq5O4zkHhg/73jng7XGnz5JwePUNgZQeWpUoVhdxhlsmADTOHzhaFTJW92MKiw+cdh095psDm382GkefPGA4+lWZKtSzoxkyHl8BlFlMjEvzZuz74EokGk7aoxzh0TAth7myy1EQIvIMNwZIxqjNYv1UD01idrRojEwPLt3eKt4ALWLVVAnkgPJEem3A0B5Rt3q2NqYCycyujKljx2RNfhHBxKlXib849Hq7Ha8cZgdkXFOfNyYXHFbUhbQnAKZ+nz6NJ1U7lrI13zNhq1BySRi/HpjaJYxlMNUibClAtG8WhDspWcnXXT9Erx3rgNGuHmx7syC9XFXh3TygZGIOD9gigQd4FYgbYd5KB4qfjFvbNxQXleTXHkm6sNwtyzwqlpar5myQTpfviWXL/N2IMBRZjYiXqrfQMCFCvKJHp9lORCZzKQOAxFXP9+mALoix26iPKK10JxUJipc6EYn7/LYJC81linndM40e5v9gpaKG5kl4my0qCjpvWOJ9q+cwPMqHFwhZPKt
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AD63C171995D84DA94ED17F0775115B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 fy+AiI3kmYnx8Qr4o+549xDWF9GRslJGpzOLWD0y7LLIKDVIFYDyczQhzqV99XAvD9Bre071a++uG8VIsLLhanr9sFi7ECKYUO98JSMPm9rqNclSfHWXFH3xQxvLY+fem17Dd/i9rHVQZowCLo770l9stRoXJBr0anXAUwtKDFdzRAzTPo09kgBzSaFy8a3MvgJxY7o81GgcGmWtcPhv4Bvgd9lO2Pe+m+jztsUzdWlAxRy0/K/MBTsCJ4bLnhAO6+Js/9TppsR73mkP4PS0UoDb5GlGzPmM2LUvJIhBrQyFUQHHf9jZCsa43ClBMvxKrJFtzn3AlufckDWGV6Ou2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10449
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c7d43aac-8cdd-467e-197d-08de962c45b8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|35042699022|14060799003|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7lf40azM3pSDY1+6bRBtlUgi1+mxI2SaIaFWSJbd+lemuJpY44pfbLrizeHc3QRtKqIEOqqI0ACEcT0aizHBH8aRAtQtZ7x2MV+iEpo/qbFTQ5qQUN3JcO6boJ1hj7yuE/OG/NdIRZ6Rm1p3HtkT9jJUXLDR/WOZLd+8dRu1fg3AoB2chxE9tvEHJbyft9z93p7WfVgHDqbXOoXXuTBuFMScVkD343RNN01Y2ng7ymV/0nYTzYuNjdHrAh94OEMB7ffNyV6rGM15iwhqaYczur6hwBQrYPiL7XI5y0rwuyRGiyxrp8A1S93R+9dbupXrk/NDiKfJEC3ilADImUznn0aDLZxSvifuEURYGxdcg7UHmsZbXLI+RuEA+2WQKOsCHRRqxUMTbfqsm+6x5vQGOJVz4BJQmJYWFFnZI4cAXbyT5N0RK96qxROZ+6jAByHxu0KCk/cEdOZHgW3PoxGMvaugNv1YTYnsz6ktGKmu5yf5opWGNoWX3hvo/gQ/+iPtn3s5OVPtPpiy9fUJq2INMwotYTN+38HNrkBUlgdXVpiHfcnaR7UruLE5E+p15KNz2+gQkku3jK1lA1/KlIzRQj+WNcpgHNpQso3thCJsa2KHOKkFnbN09N5gaaUKQfv7Wd3T+kwsoK/5WzaZQFgFXggPy4EluwCG9q0uJF3r4dT+Zn+YQgZbKOGDaJpgFwqxQ8f55JOc2flcFHHhVOMq/f5slJwbnBbqDQMTo4ID52E=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(35042699022)(14060799003)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h07gzOCo9vFQ/77scJ+Szsh15FtPHDLIOcuCgi6PbgY8rofAF88/2+8IOjSezMG9nhOj6e7pSPmUb1h3uVRHGelEjxOt3ETBbktBGcGDlKbGH85PMxIRI3sIMESMtAqySlC1Nmk1ZYW5DDTfYa2v10uxGJUtML+/tLyEo5AnEwHyHPCwyu6AS3GhQsnYwRLr3X3S2yyqCBP4ZyTv7VEhmfgY6PnD1hoN4671uOq/AsyrR/b7Q7+KUQYZgiytgpLlrTkn3i2gIgFXFFw0jMZ0vYrJFmi31lxb+AUfdu6bsvf8m7Ru34e7X/WbSDgltk8nnRGCNLlOK/PaG9HHMQ5wGUT3bybu8jsJH+ZhXVojnp0yrbKByubwKRhnf/0d30kkvGZUI5IUZq4W2CakyDTCAtscf4pZuRYH4jrnilK6TZKNmobnL3RYWsU6wV2szVMG
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:37:49.6986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2965ab-efc7-4d9b-5d1c-08de962c6dca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9407
X-purgate-ID: tlsNG-c1860d/1775734673-76B4C497-F867282C/0/0
X-purgate-type: clean
X-purgate-size: 2098
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,patchew.org:url]
X-Rspamd-Queue-Id: 178563C9B80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTXlreXRhLA0KDQo+IE9uIDcgQXByIDIwMjYsIGF0IDEwOjU4LCBNeWt5dGEgUG90dXJhaSA8
TXlreXRhX1BvdHVyYWlAZXBhbS5jb20+IHdyb3RlOg0KPiANCj4gQWxsb3cgZm9yIHJlbW92aW5n
IGRldmljZXMgZnJvbSBTTU1VdjMuIGFybV9zbW11X2RlYXNzaWduX2RldiBoYW5kbGVzDQo+IG1v
c3Qgb2YgdGhlIHdvcmsgYnkgZGlzYWJsaW5nIEFUUyBhbmQgemVyb2luZyBTVEVzLiBBZGRpdGlv
bmFsbHksIHVuc2V0DQo+IHRoZSBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkIGZsYWcgYW5kIGZyZWUg
bm8gbG9uZ2VyIG5lZWRlZCBzbW11X21hc3Rlci4NCj4gDQo+IFRlc3RlZCBvbiBRRU1VIHdpdGgg
U1JJT1Ygc2VyaWVzWzFdIGJ5IHJlcGVhdGVkbHkgZW5hYmxpbmcvZGlzYWJsaW5nDQo+IFZGcy4N
Cj4gDQo+IFsxXTogaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vY292ZXIuMTc3MjgwNjAzNi5naXQu
bXlreXRhLl81RnBvdHVyYWlAZXBhbS5jb20vDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNeWt5dGEg
UG90dXJhaSA8bXlreXRhX3BvdHVyYWlAZXBhbS5jb20+DQo+IC0tLQ0KPiB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vc21tdS12My5jIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+IHhlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oICAgICAgICAgfCAgNSArKysNCj4gMiBm
aWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FybS9zbW11LXYzLmMNCj4gaW5kZXggYmYxNTMyMjdkYi4uYjViODM0YTdiNyAxMDA2NDQNCj4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KPiArKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQo+IEBAIC0xNDkzLDYgKzE0OTMsNjQg
QEAgc3RhdGljIGludCBhcm1fc21tdV9hc3NpZ25fZGV2KHN0cnVjdCBkb21haW4gKmQsIHU4IGRl
dmZuLCBzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IHN0YXRpYyBpbnQgYXJtX3NtbXVfZGVhc3NpZ25f
ZGV2KHN0cnVjdCBkb21haW4gKmQsIHVpbnQ4X3QgZGV2Zm4sDQo+IHN0cnVjdCBkZXZpY2UgKmRl
dik7DQo+IA0KPiArc3RhdGljIGludCBhcm1fc21tdV9yZW1vdmVfZGV2aWNlKHU4IGRldmZuLCBz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsgaW50IHJldCA9IDA7DQo+ICsgc3RydWN0IGFy
bV9zbW11X21hc3RlciAqbWFzdGVyOw0KPiArIHN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYzsN
Cj4gKw0KDQpJIHRoaW5rIHdlIG5lZWQgc29tZSBwcm90ZWN0aW9uIGZvciB0aGUgcGhhbnRvbSBm
dW5jdGlvbiBzbyB0aGF0IHdlDQpkb27igJl0IHJlbW92ZSB0aGUgc2hhcmVkIG1hc3RlciBvYmpl
Y3Q/IEnigJltIHF1aXRlIG5ldyB0byB0aGUgc21tdSBjb2RlDQp0aG91Z2ggc28gaWYgSeKAmXZl
IG1pc3NlZCBzb21ldGhpbmcgbGV0IG1lIGtub3cuDQoNCkNoZWVycywNCkx1Y2ENCg0K

