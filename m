Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DRCBaIf8mkboQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 17:11:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6F54969DF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 17:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297486.1573495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI6ZD-0007fy-NU; Wed, 29 Apr 2026 15:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297486.1573495; Wed, 29 Apr 2026 15:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI6ZD-0007eE-KM; Wed, 29 Apr 2026 15:11:11 +0000
Received: by outflank-mailman (input) for mailman id 1297486;
 Wed, 29 Apr 2026 15:11:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wI6ZC-0007e8-Bu
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 15:11:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI6ZB-009I0r-KI
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 17:11:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f21f77-e002-0a2a0a5209dd-0a2a4505d79c-42
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 17:11:09 +0200
Received: from [40.107.159.12]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f21f8c-aaa8-0a2a45050019-286b9f0ce12f-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 17:11:08 +0200
Received: from CWLP265CA0396.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::15)
 by AS4PR08MB7854.eurprd08.prod.outlook.com (2603:10a6:20b:51d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:11:04 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:400:1d6:cafe::57) by CWLP265CA0396.outlook.office365.com
 (2603:10a6:400:1d6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 15:11:04 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 15:11:03 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by VI0PR08MB10655.eurprd08.prod.outlook.com (2603:10a6:800:209::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:10:01 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 15:10:01 +0000
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
 b=o/fI/MjOpiGUnvDvUkdrdENM6g+hHK23iXtuwMYvtB6P5FKuoeeSnThj/gioPpNkqmfnO2HqnchNfzHnzOT+Xdxyrymguk/+kHtyQztzQM4MWKfG0drSigxuKheT8ZnsDVQFwLEXu08bEeCHNCDA/mQlMrwcjiSJFu2aTn6dz34Wm9xx+eNAhheIB4vxPi3wV7bqKaPK0sfet+RMavrDteNA3zyxO3tRijpj8bfTdF+ZBpuE0vAby6V2xm8lR8zTfS27N6M7LqgvqwnZoMSLSdI8yEmJhMd5zGGBDRkUo3EEw2WfiUlnphLIiRpuJhtx3ly2nAe0IIpFS1lhX5o1Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4Ex3UZkLa2Pgcw/NNe2Z+f1uHNJD/DrDdCKvrTi8wQ=;
 b=v6VN/IWyU2iFNYuqIoGlnHs/lA9i9Ps73BamKzTaItgSKoY/FNtcGTc9V7T1ocaq330RXaTHYz3JLHTGcrGSZ4jKTOcTpi3Bik+SnSoFwCqkU8LVd4Xw+Dpk1WZ0+dIxZivbrJ4M6mQpcyB5ohZzS7vGRp68E8f2crSInFszbk6GMKom85Lyk+HwwOxb2ApMFuvmqNgBwJYxqMXsUZVxKD2VTt9KzN4LXi1Nexrp5mxxNy/UqxScHh9W+kDX0Dpk8W/OgsR+Ig7AI0wXr8AD3d9ebf6aTeC7C46m+pi+I3rJcpef1mhHtUosmMQ2DKsaTXuM2FMGIXYBrmpmjWxfhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4Ex3UZkLa2Pgcw/NNe2Z+f1uHNJD/DrDdCKvrTi8wQ=;
 b=CLxPejXUZC0W0GBkw72zdQU4bUBecZ+S7H5lilBj3G/Kkp+ogjiF2LgHk20z+VJJkgsrGqDFFDeGYoKNqTdvkA4clJ0uhMXcvqzZNbdiPvoTwVgqIYrc2Nr3myHqLhGyfd1EmkZep2vn3iWZYS6IsQIbdOV4jksLS29v9MXVFzA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY8X/ZRBnLJbCPtKCRHp5tXw+LwCvS9srhjZxM4+h4zwWsc2z124kayBc3tt3Jk0MDui0ccIY/t6HacBGrYBGcP+07HKy7u9CsDM+xDOrArToIwd7AsHH8HBQITh7jwhW83oFx1Wz+cywMZQmr+dzGkkzMNOgjkeZyeNlgx9Om4RqxobGTh0qcxuS+WKV2UwmVHyVyPTu388MTTo5Sn7QSKjlMGuexSqmf7Bl+3QA/cDk4GtgXJeSoSgOQ6GqE4MS/Ca3GcrymVTPtwf1L55AHf5jC34y98KmXjAPnmbqdf/dYqzkHpuaENfbCVOw/FsxC9rhTBKw5rhbxuKPNyeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4Ex3UZkLa2Pgcw/NNe2Z+f1uHNJD/DrDdCKvrTi8wQ=;
 b=yfpRsHDzCl5ffMjD3FqlclqiIFuuC9CX/MgtF6upxfzbm6/kmKj2FPxQB9oVz5QTJZtnsNYb9PXx1hePZE4jesJ2IRAIQKXTULXBAasl7MfkSZ5hi09UJxhDkj1JDxl6AXsk4OpXNLQDLlCcoQftYImDuFxqR/CBOAcYzIv+uwQH/T6uGwhP6EAJT8VLpfhwaxvsrNNb/WMvaGrABn4HDLrYjnvCK+cZtN+gCZ5Suorni81/s4G2Pe1pVLaSZdpkPIEnx+lMK88GjJHRc0EU0r/E7ZF63RlQwkw08a12pROOnLNyNuFPZzXIOknaADq97TfYV77qoea0/IU5Aq8V8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4Ex3UZkLa2Pgcw/NNe2Z+f1uHNJD/DrDdCKvrTi8wQ=;
 b=CLxPejXUZC0W0GBkw72zdQU4bUBecZ+S7H5lilBj3G/Kkp+ogjiF2LgHk20z+VJJkgsrGqDFFDeGYoKNqTdvkA4clJ0uhMXcvqzZNbdiPvoTwVgqIYrc2Nr3myHqLhGyfd1EmkZep2vn3iWZYS6IsQIbdOV4jksLS29v9MXVFzA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v4 04/11] xen: introduce domain-layout.h with common
 domain_use_host_layout()
Thread-Topic: [PATCH v4 04/11] xen: introduce domain-layout.h with common
 domain_use_host_layout()
Thread-Index: AQHc1xwZfAADhd7YaUmWKHHFpjlmD7X2JiIA
Date: Wed, 29 Apr 2026 15:10:00 +0000
Message-ID: <D2F797B5-CB47-4883-BC0D-1F60056688CC@arm.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <2577e757d32f85fb8b3308863e6d7a53d70636dc.1777303844.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <2577e757d32f85fb8b3308863e6d7a53d70636dc.1777303844.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|VI0PR08MB10655:EE_|AM1PEPF000252DE:EE_|AS4PR08MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c59615a-687f-4d73-41d5-08dea60187db
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 JCEGg5fNdkhwGmamTQigFsrvmcTX84W+9+fmiNlND81KB2HRhQgUHcbnyt5WuoM5Qa2oQ1mdQeADaejaa/9baFv3+BqT0dNVZu4zvNXYXWG75rfwkDd4W+h989kCPZjRDzIl2dXgolX5HCLUUWuDolf++WjzNKzUJqgkjN0IhOQMaCbceqlkc0cGVkyXn7xkQalOBc0mozfbeytenuSpucbTrffyqmwMca6RfTA2JagV/xy1LhC5PN6bN81eG5PbrC5xZAK7yhXBbsQCHBo28S1Qbq1RI5i+TjLylOwcijpm22/eqo8kNLQbqnLN6+b6i0v+3hSZSeGr/NhxOGVYy8/GY0dRb2zg7oqD24/LCxepS35gooipBQXkpqxnX4ZGlK5QBEu1lIkeV/r1vAGdb37UEV7jpCTGkt1Jjg+XpHXnU3SbrMYZAu2KhxgGQzEM61RQoMTRWNEeINllE5PGbjA/VJBe1g/rYGnUCaAo7mO9IAYSXlLRkueOZ02A0rKMwtbDVnXLkEFhw41iXbA3FQh/iWtVVdbqCQM8eVsLCqy+K0sExejSzIsiriMjnagJQDCOwqKLs+JvdOruDYg4UM9rwSprRo887LStRYk7EKNaiiz1GhqHhD9NPkzOYKZXLu0na8nx33ZbojBpVUosZYKIwSa8SiMFah5KocnyaTQ0RG3DHIEEM30KEyu/ZGxa+FosIdvYjJ49jU0ITK34VlTWIHC1fncj1wt+a1Eywld6/81v68CWEU+oMi9WxN4tacAoOwc1F0KXzKfBefvqNdtUabvSorWvA7fl6Ct4l48qKRFSoVdC9x+gKwJXXWCG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8CD3BEDEA224F428BBF566BAE2DDF3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 uaBzrQj30MTMr0clCEQjFe9Ts1xkJo5zvq2jSUwy2I5FHaq3mJi58nI1iZ/TNPsaklIwnuJjwkkH+jwOrRU/dk0DkF2a/AdcwjdVgUrbx5P71XgPl9lkia/o3aug137vGMJT39yDxgmYC+wdYW8Bqim93TS851eflXfQO1yGNODlM54v0Z+wAzK1LMNN0FGW3vc3oXcxKoNjVp806ekMmQpJntUuaHiOM0E2+JgBfKzgIcBL26pKO5118FDWz/vDoMh4BL9tmyV/RYuEXHF/6AKdyuNuI8OfHmw+KFP94moI9hv9a48IJVxQGGdypSWOT9FDyttJwjRTlDUC34Y0NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10655
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e469486e-92e8-4017-8944-08dea6016278
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|7416014|36860700016|14060799003|1800799024|22082099003|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	9jSgcIDc5/GR37l60Jyx9MLw5H+yfxlVxbP4LUx7SdYpcgxY8R+Hzdntvv2Mj9XrS5qctDUnFrKUnM+JF6agIqvlSuPo4js1rnWLeq0apgZ7l+QMLrDdUaDraaN7SA+CGe9AjDU7/++LTcsOBFCiSdPz5wbiV09fDX8GhQMNA9t6oMFy2Pob9xCmVyMQuWNA0AmyI/RBH2swYJyLzdeLT2SrQ0AZFbFw/whO8pBllMx1vZXKmdCCQYjYwq4WiYVREPVVSyCLDTi/Jnya6fiKpjRLSH9Guzu8IAAuVw4i2d3eghuadYigK1B8KVC7C8QjfThD3rAdcvkOxQ0QqAQBUDG+wyKT6YJAeycIwryNGNBZEw+kCAqvtyAqoCOKIKmk3f24hUmGKqxPK+/D1PkR2lLFZUt/sJBliLCOddU8SpvJIT3koRG72xQJu853pcb+N85xg8cCVAxM9+kaIgBXdWsQIvnhP4znHSy91cQkxvjgl+zE+GuP9UpW1SguzVrpRWdG9HtLuDf7xJJe0XaQuiVox6dTLTxNv9CzutAh7kLeq3bDMd5Mg5zW3j0wgmd8R8OATta3EwYGTXWjRzuBofBU2YkQ1s5lN7xncr2stX45J7ppdjUywxy+UqnENNBO5k4/8OMGpxwmMrR22YBflIAUf2Wg2boDiwf0/in4U1HwqEinyQd/7PZhU3uBhEcZ/HR8P8NRQEmOsLUi1/coqGnvpbHtvKUilF/5FVOdCZc=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(7416014)(36860700016)(14060799003)(1800799024)(22082099003)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8pucQkJ0M8Hpwhb6domDveRQIAjT2/qP5Z/XR4QpYQmbDwevQxAYritrHRCEAkqHmxr1SJHCP/+ggU6924yy5E2NRcBjIrxmM3gHfO6pgYCyGpBcFliRfsRVOD2WTtvorGeSMLZVh4gVaqTrASpKPWxwnHvM6tUuG0+BGqthCHVUwr9EDiV0Q8MYLk4m7Plbtkj1MR67hGdHiR35lG2FlsLY7Xxgb19Aaj07kdmUMsgEC2x4XdlgE8TwSIuP7P6rax62tAl8x/v7BzJmeixZjlAaRqK8ktr33P5XDimiNbSQtJh80JbwVPbtTNjnXILgvYydqfLR0D15gH/3ezV7VFNf8ayKCQmE4+oysLvlQxNi6FH+6J3Khft6hUFqKZi5RlVWE3nM5hSeyjTqT6Uv6N8FBe+LLzv8mcjauT8QsjkWaH29GLTi1U69cxmV5gCp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:11:03.6642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c59615a-687f-4d73-41d5-08dea60187db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7854
X-purgate-ID: tlsNG-c201ff/1777475469-E97A6443-84E15BF5/10/73395122804
X-purgate-type: spam
X-purgate-size: 7214
X-Rspamd-Queue-Id: 8C6F54969DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

SGkgT2xla3NpaSwNCg0KPiBPbiAyOCBBcHIgMjAyNiwgYXQgMTU6MzMsIE9sZWtzaWkgS3Vyb2No
a28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IGRvbWFpbl91c2Vf
aG9zdF9sYXlvdXQoKSBpcyBub3QgYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGFuZCBtYXkgYmUgbmVl
ZGVkDQo+IG9uIHg4NiBbMV0uIFJlcGxhY2UgdGhlIEFSTS1zcGVjaWZpYyBtYWNybyBpbiBhc20v
ZG9tYWluLmggd2l0aCBhIGNvbW1vbg0KPiBzdGF0aWMgaW5saW5lIGluIGEgbmV3IGRlZGljYXRl
ZCBoZWFkZXIsIHhlbi9kb21haW4tbGF5b3V0LmguDQo+IA0KPiB4ZW4vZG9tYWluLmggd291bGQg
YmUgdGhlIG5hdHVyYWwgaG9tZSwgYnV0IHBsYWNpbmcgaXQgdGhlcmUgd291bGQNCj4gcmVxdWly
ZSBpbmNsdWRpbmcgeGVuL3BhZ2luZy5oIChmb3IgcGFnaW5nX21vZGVfdHJhbnNsYXRlKCkpIGFu
ZA0KPiB4ZW4vc2NoZWQuaCAoZm9yIGlzX2hhcmR3YXJlX2RvbWFpbigpKSwgd2hpY2ggd291bGQg
aW50cm9kdWNlIGNpcmN1bGFyDQo+IGRlcGVuZGVuY2llcy4gQSBzZXBhcmF0ZSBoZWFkZXIgdGhh
dCBjYWxsZXJzIG9wdCBpbnRvIGF2b2lkcyB0aGlzLg0KPiANCj4gQWRqdXN0IHRoZSBpbXBsZW1l
bnRhdGlvbiB0byB0YWtlIHBhZ2luZ19tb2RlX3RyYW5zbGF0ZSgpIGludG8gYWNjb3VudA0KPiBz
byBpdCB3b3JrcyBjb3JyZWN0bHkgZm9yIGFsbCBhcmNoaXRlY3R1cmVzLCBpbmNsdWRpbmcgeDg2
LiBTb21lIGV4dHJhDQo+IGRldGFpbHMgYWJvdXQgaW1wbGVtZW50YXRpb24gWzJdIGFuZCBbM10u
DQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsL2FscGluZS5ERUIu
Mi4yMi4zOTQuMjYwMjE2MTAzODEyMC4zNTkwOTdAdWJ1bnR1LWxpbnV4LTIwLTA0LWRlc2t0b3Av
DQo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvYWxwaW5lLkRFQi4yLjIy
LjM5NC4yNjAyMjcxNzQyNDAwLjMxNDgzNDRAdWJ1bnR1LWxpbnV4LTIwLTA0LWRlc2t0b3AvDQo+
IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvYWxwaW5lLkRFQi4yLjIyLjM5
NC4yNjAyMjcxNzUwMTkwLjMxNDgzNDRAdWJ1bnR1LWxpbnV4LTIwLTA0LWRlc2t0b3AvDQo+IA0K
PiBTdWdnZXN0ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4NCj4gU2lnbmVkLW9mZi1ieTogT2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0Bn
bWFpbC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIFVwZGF0ZSB0aGUgY29tbWVu
dCBhYm92ZSBkb21haW5fdXNlX2hvc3RfbGF5b3V0KCkuDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYz
Og0KPiAtIE1ha2UgYXJndW1lbnQgb2YgZG9tYWluX3VzZV9ob3N0X2xheW91dCgpIGNvbnN0Lg0K
PiAtIENyZWF0ZSBhIHNlcGFyYXRlIGhlYWRlciB0byBhdm9pZCBjaXJjdWxhciBoZWRlciBkZXBl
bmRlY3kgYW5kIG1ha2luZw0KPiAgIGRvbWFpbl91c2VfaG9zdF9sYXlvdXIoKSBhcyBzdGF0aWMg
aW5saW5lLg0KPiAtIFJld29yayBkb21haW5fdXNlX2hvc3RfbGF5b3V0KCkgdG8gYmUgcHJvdGVj
dGVkIGJ5IHBhZ2luZ19tb2RlX3RyYW5zbGF0ZSgpLg0KPiAtIFVwZGF0ZSB0aGUgY29tbWl0IG1l
c3NhZ2UuDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIERyb3AgaWZkZWYgYXJvdW5kIGRl
ZmludGlvbiBvZiBkb21haW5fdXNlX2hvc3RfbGF5b3V0KCkgYXMgaXQNCj4gICB3YXMgc3VnZ2Vz
dGVkIGdlbmVyaWMgdmVyc2lvbi4gSXQgY291bGQgYmUgcmV0dXJuZWQgYmFjayB3aGVuDQo+ICAg
dGhlIHJlYWwgdXNlIGNhc2UgZm9yIGl0IHdpbGwgYXBwZWFyLg0KPiAtIEFkZCBTdWdnZXN0ZWQt
Ynk6IGFuZCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiAtIE1ha2UgZG9tYWluX3VzZV9o
b3N0X2xheW91dCgpIGZ1bmN0aW9uIGluc3RlYWQgb2YgbWFjcm9zIHRvDQo+ICAgYXZvaWQgY2lj
bHVsYXIgaGVhZGVyIGRlcGVuZGVjaWVzLiBMb29rIGF0IG1vcmUgZGV0YWlscyBpbg0KPiAgIHRo
ZSBjb21taXQgbWVzc2FnZS4NCj4gLS0tDQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgICAgICAgICAgIHwgIDEgKw0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWlu
LmggICAgIHwgMTQgLS0tLS0tLS0tLS0tLS0NCj4geGVuL2FyY2gvYXJtL3ZnaWMtdjMuYyAgICAg
ICAgICAgICAgICB8ICAxICsNCj4geGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb21haW4tYnVpbGQu
YyB8ICAxICsNCj4geGVuL2luY2x1ZGUveGVuL2RvbWFpbi1sYXlvdXQuaCAgICAgICB8IDI3ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA1IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlv
bnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUv
eGVuL2RvbWFpbi1sYXlvdXQuaA0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiBpbmRleCBhZDY2NWNk
M2MwNDUuLjFlZmRkYzYwZWYwYSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiBAQCAtMiw2ICsy
LDcgQEANCj4gI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+ICNpbmNsdWRlIDx4ZW4vYm9vdGluZm8u
aD4NCj4gI2luY2x1ZGUgPHhlbi9jb21waWxlLmg+DQo+ICsjaW5jbHVkZSA8eGVuL2RvbWFpbi1s
YXlvdXQuaD4NCj4gI2luY2x1ZGUgPHhlbi9kb20wbGVzcy1idWlsZC5oPg0KPiAjaW5jbHVkZSA8
eGVuL2ZkdC1kb21haW4tYnVpbGQuaD4NCj4gI2luY2x1ZGUgPHhlbi9mZHQta2VybmVsLmg+DQo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmggYi94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmgNCj4gaW5kZXggYjI0ZjAyZDI2OWJlLi40NmE1Y2Rj
MGM4MDAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaA0K
PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmgNCj4gQEAgLTE4LDIwICsx
OCw2IEBAIHN0cnVjdCBodm1fZG9tYWluDQo+ICAgICB1aW50NjRfdCAgICAgICAgICAgICAgcGFy
YW1zW0hWTV9OUl9QQVJBTVNdOw0KPiB9Ow0KPiANCj4gLS8qDQo+IC0gKiBJcyB0aGUgZG9tYWlu
IHVzaW5nIHRoZSBob3N0IG1lbW9yeSBsYXlvdXQ/DQo+IC0gKg0KPiAtICogRGlyZWN0LW1hcHBl
ZCBkb21haW4gd2lsbCBhbHdheXMgaGF2ZSB0aGUgUkFNIG1hcHBlZCB3aXRoIEdGTiA9PSBNRk4u
DQo+IC0gKiBUbyBhdm9pZCBhbnkgdHJvdWJsZSBmaW5kaW5nIHNwYWNlLCBpdCBpcyBlYXNpZXIg
dG8gZm9yY2UgdXNpbmcgdGhlDQo+IC0gKiBob3N0IG1lbW9yeSBsYXlvdXQuDQo+IC0gKg0KPiAt
ICogVGhlIGhhcmR3YXJlIGRvbWFpbiB3aWxsIHVzZSB0aGUgaG9zdCBsYXlvdXQgcmVnYXJkbGVz
cyBvZg0KPiAtICogZGlyZWN0LW1hcHBlZCBiZWNhdXNlIHNvbWUgT1MgbWF5IHJlbHkgb24gYSBz
cGVjaWZpYyBhZGRyZXNzIHJhbmdlcw0KPiAtICogZm9yIHRoZSBkZXZpY2VzLg0KPiAtICovDQo+
IC0jZGVmaW5lIGRvbWFpbl91c2VfaG9zdF9sYXlvdXQoZCkgKGlzX2RvbWFpbl9kaXJlY3RfbWFw
cGVkKGQpIHx8IFwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXNfaGFy
ZHdhcmVfZG9tYWluKGQpKQ0KPiAtDQo+IHN0cnVjdCB2dGltZXIgew0KPiAgICAgc3RydWN0IHZj
cHUgKnY7DQo+ICAgICBpbnQgaXJxOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMt
djMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMNCj4gaW5kZXggNzdhYWI1YzNjMjkzLi43NzUx
N2MzMDMwNjEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMNCj4gKysrIGIv
eGVuL2FyY2gvYXJtL3ZnaWMtdjMuYw0KPiBAQCAtMTAsNiArMTAsNyBAQA0KPiAgKi8NCj4gDQo+
ICNpbmNsdWRlIDx4ZW4vYml0b3BzLmg+DQo+ICsjaW5jbHVkZSA8eGVuL2RvbWFpbi1sYXlvdXQu
aD4NCj4gI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+ICNpbmNsdWRlIDx4ZW4vaXJxLmg+DQo+ICNp
bmNsdWRlIDx4ZW4vbGliLmg+DQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RldmljZS10cmVl
L2RvbWFpbi1idWlsZC5jIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb21haW4tYnVpbGQuYw0K
PiBpbmRleCBjNTE1MjBlYmFkZjkuLjY5NDkyMDNkYWNkYyAxMDA2NDQNCj4gLS0tIGEveGVuL2Nv
bW1vbi9kZXZpY2UtdHJlZS9kb21haW4tYnVpbGQuYw0KPiArKysgYi94ZW4vY29tbW9uL2Rldmlj
ZS10cmVlL2RvbWFpbi1idWlsZC5jDQo+IEBAIC0xLDYgKzEsNyBAQA0KPiAvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovDQo+IA0KPiAjaW5jbHVkZSA8eGVuL2Jvb3Rp
bmZvLmg+DQo+ICsjaW5jbHVkZSA8eGVuL2RvbWFpbi1sYXlvdXQuaD4NCj4gI2luY2x1ZGUgPHhl
bi9mZHQtZG9tYWluLWJ1aWxkLmg+DQo+ICNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiAjaW5jbHVk
ZSA8eGVuL2xpYi5oPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2RvbWFpbi1sYXlv
dXQuaCBiL3hlbi9pbmNsdWRlL3hlbi9kb21haW4tbGF5b3V0LmgNCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wNTMyYTI3YjQ0Y2UNCj4gLS0tIC9kZXYvbnVs
bA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLWxheW91dC5oDQoNCk5ldyBmaWxlcyBz
aG91bGQgaGF2ZSBTUERYIHRhZw0KDQo+IEBAIC0wLDAgKzEsMjcgQEANCj4gKyNpZm5kZWYgX19Y
RU5fRE9NQUlOX0xBWU9VVF9IX18NCj4gKyNkZWZpbmUgX19YRU5fRE9NQUlOX0xBWU9VVF9IX18N
Cg0KSSB0aGluayB0aGlzIGluY2x1ZGUgZ3VhcmQgZG9lc27igJl0IHNhdGlzZnkgdGhlIGNvZGlu
ZyBzdHlsZToNCmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Ymxv
YjtmPUNPRElOR19TVFlMRTtoPWFhZTVhNDdhYzIwMzQ1OTc4YjNjNDY1YjlkODVmMWQ1ZjY3NzQ3
MzE7aGI9cmVmcy9oZWFkcy9zdGFnaW5nI2wxNjcNCg0KQXBhcnQgZnJvbSB0aGlzLCB0aGUgcmVz
dCBsb29rcyBvayB0byBtZSwgYWZ0ZXIgZml4aW5nIHRoZSBhYm92ZSBJIHdpbGwgbGVhdmUgbXkg
Ui1ieQ0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

