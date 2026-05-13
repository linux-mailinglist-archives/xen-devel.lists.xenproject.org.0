Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFZMDx2jBGogMQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 18:13:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F276536D6A
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 18:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308277.1579799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNCCP-00057y-SD; Wed, 13 May 2026 16:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308277.1579799; Wed, 13 May 2026 16:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNCCP-00056Z-PE; Wed, 13 May 2026 16:12:41 +0000
Received: by outflank-mailman (input) for mailman id 1308277;
 Wed, 13 May 2026 16:12:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNCCO-00056T-Fz
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:12:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNCCN-003Rzp-Sz
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 18:12:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a04a2e0-bab6-0a2a0a5309dd-0a2a4503b9e4-40
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 18:12:38 +0200
Received: from [52.101.66.24]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a04a2f6-672d-0a2a45030019-346542181a1b-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 18:12:38 +0200
Received: from PR3P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::26)
 by DU0PR08MB8447.eurprd08.prod.outlook.com (2603:10a6:10:405::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 16:12:33 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:102:b5:cafe::e3) by PR3P251CA0018.outlook.office365.com
 (2603:10a6:102:b5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 16:12:33 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Wed, 13 May 2026 16:12:32 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GVXPR08MB10476.eurprd08.prod.outlook.com (2603:10a6:150:155::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 16:11:27 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 16:11:27 +0000
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
 b=T4ENshZ7CzRp+o2By8wnrT/JfaADS+4YnRFISTsJOuE+Woo+XcDjIbQyAoAMGgfJPoimQeSTbgnAAH09qQk2h2TpfDPQeC6yRp3RaJt2GK2HD3LcutTQi/DL4oVTAs3zOEEXzqsm06Ncqr/+9YzxM+8Ctl3MKFEALV+bGutDmprg/nYIVnV4vemU9zyoO67QmacH7jrB7ZlzpYgP+MiX98aCNsYiTw654uhrwwBdeoT/K87+J1UL4fpYCZ6axPeU6iiQwQfR8x69M6qJhqdc0BGdGAXeYZbAcN6qAh3B0nCYHJVprvxRnMEgIB+B0pwgCibNNz1+LzZJoUvual5e9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4Y94ojXJyOMFRiSC2FcNd1G6ixpJrmC7toPGQRbPGs=;
 b=DrLvd5v4U0Tb/q2gW5bP4HOdzRewQfpIiok3JM0enWxeY0Kb8RxBSC2JQamQjHvJgc1IXBjA/6aPocwRzjQle68fOc7qwBkT88m+9/YQ+B9JuGWpa7g8yLY1Wbph52Z+JI5X0Krst2CrrnTfZLufZ9Zvpz/AinHBhLG8V0JDghglRoJWBGkDtqpS6Ya+VngoavW524p3inYWtYpQB6a15YPPLQST0OV7xgvvmZm8MprB/lRRUKlygtahlR4RlXstmpyGq31x37T0d4Pd6al6nHNMFaM51wr3mizx+E0SPf+LC1X42YnOUADkfHyPvR6aUihjSfxAeXcr9CgVEyrILA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4Y94ojXJyOMFRiSC2FcNd1G6ixpJrmC7toPGQRbPGs=;
 b=d58o2qnP2O8WzaY8CaE7Qj0a8K/odaOYxwt3D7y0kmZhuSp5QJxwt4KTe8tQGNABwL+DMzZaa6/VX+XDkx1m4FsFK/01QNrvHFVs4l9c0jaKy7aIJD/hbZGUaM1503IHXNYEhxYMc4y8uL8RTm6A3fprAKCYKuG+Am+nvqJqnEE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqw51gl8+IGaPsPVTP/+AYof4HCGt+DgTe5YG2LRbY6bPYYrnzyKrp2qIzCh+fkRc3x/jIZjFq8RvDXCVzBXh4dAIQNKEGMjOe5TDWs3FrmM7kSp1n7kokrugMxwgyGDN6soDMWvFPK3bO30rY6HVaJ0SsvsYYso7xhrBRR6bXs0kZqHGbyY77bapq4kz4NnojzvAvRBzWuqvGs6WviXWwPgbUkJxVYg7YmbTOamsBrQuy8znPjP2dblBRai0U2USEeqbMKm0OaJbu7gyQQZOEyxX5jM3Ignoszk3QAazL37myflPyeABj+3inBepBeSbfdKXITMjyQ8MUyQGcA8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4Y94ojXJyOMFRiSC2FcNd1G6ixpJrmC7toPGQRbPGs=;
 b=pHPEZRcUdxVAbcksZuyUutRKcg/fqSdqt0C58kZhnuPbshe2qx4GgvLRJT1eqEs2HjbnruDum9GAgHLDb6UQM1jQT1peG7BShOS5M/DaTPxmG6lZNTvFZyNv7zgt07Z7POluYz5r6gm9LAM5IaduzWgCyQ0FYi7x1TGeqHTT+OIKgQYU/P8Yjp3O+Pv2+LLuRwOtfhNBCkIsJmMtvZNgsYw9yWFOH7yKqTk1S2DGKHd3c54lIVPNIxIDw4hk8F7GYSgY9IyAnz/h8J+4BfzCBHL49sahhMy8dB8N/bIDWg97vcG1N/8BDRZYSflJXQN8yy+88UnJ5+Wc0n837QTvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4Y94ojXJyOMFRiSC2FcNd1G6ixpJrmC7toPGQRbPGs=;
 b=d58o2qnP2O8WzaY8CaE7Qj0a8K/odaOYxwt3D7y0kmZhuSp5QJxwt4KTe8tQGNABwL+DMzZaa6/VX+XDkx1m4FsFK/01QNrvHFVs4l9c0jaKy7aIJD/hbZGUaM1503IHXNYEhxYMc4y8uL8RTm6A3fprAKCYKuG+Am+nvqJqnEE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
Thread-Topic: [PATCH v9 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
Thread-Index: AQHc4jIxvmGdqMgSz02bPpb5zv+LMLYMIcWA
Date: Wed, 13 May 2026 16:11:27 +0000
Message-ID: <BA33B390-3ECC-4EBF-8305-5E91C8451398@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <8973fc6bf69d8b20cebb61289c1b8596b1a09900.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <8973fc6bf69d8b20cebb61289c1b8596b1a09900.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GVXPR08MB10476:EE_|AM4PEPF00025F9A:EE_|DU0PR08MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: fe38be0b-9c3a-4971-be68-08deb10a708b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|11063799003|56012099003|18002099003|38070700021|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 KlADLaOM774OqJCN2Ao+oxn7rwdgOkpAR7A6biEWX3Bp2sSCf9J5mMsFqtK39lkEwouMWcEQArTygX0nUtt0BVYZQboL/UOercD33W0rd9FcE80KDxCJsu1JOWBra7ZOaXSSBrQoP5PYS5B18ZqMWED6SIVV5Z34A4Cy0eR/XaTMUIbD2lktmrZuhcBcBAEJmFKkWcUIXt8YmARyvSbUDi5+vulc+6Zcf8XBTqXk8CPALIMUTBa9+e4MH7ZGQWiiKmzL0BcWEcJqHpUFOasdSqlOE1TEwEDSJtKWLIom3z1VQ9ayBmyXfaJ7lwh4x9WVWnKFxL1/1kqaCbD/fzMC6/OLbFaeBax1xfsJUQ6por2QpCzEpymKI2CyTcDhDUEbhGxa/6jh8LC4eiVw5g04gbh2TvEcVx2lLZ9RBegpXmd9b7MjOVeNcUC4PImHECF6wsRjMsl01HAHfuUqc2+Tr21CM1MWuSMgeljtB0SgviG3KlO/NDmkvUKCSLaXo++GHt2XVmcHd6OouG9w/yEXOofgIB8WUatmYKh/atQvtsB7jjtc6kzSfFm8yFOzFtYtjajO/hsDiAOUcAAvVt6h+UDfcl3JVQPRTRv6+IsoDIl63mID+GquulhQ3L6r8xlseX+Wi8G9Eaui5c3TaGDIp+MnkvohFuN0AijKEkFwxkSAKGoB922ulJmb8Ogr1oFmJL/JbSNG0K4NlKHuVgFslSN8hu9wqsMIEu7CHXtez7L37nYdsdaAEF0G/VBLkCqa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799003)(56012099003)(18002099003)(38070700021)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E456145B9C4B484AA915D1375170E49D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 F+Fq53W8is/i48FYUfD7/bWJKjs1fNR+N/wK3MznbCxTRjaX7WG85Wp8STR3dHthrRQbr2YFlqQGU5eW2TbM1WbaypaW4KvMuuWeBAwlTW0bkDBtsqvqGbLk8ucVTN7G6K+7EituO2ltbibtd9i6LkVTG7u4fT8l8tR/vG8AuuwL11qlwXWFYLvnDOg00XG3paY1dtoTRpW1w4CeIc5qzFvEuaZIizTQNDy7Eh3fVE00IoGbeuLq+Ehv7IhAVTRJwqm/sBL/VUOtf6P5KWEyOrT0it/gh3zdPfvzxa5FrjNrgAaFgLJmaEECSeCrqETkrWiKnY31lCXUZhozYbsjGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10476
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f906974-dc82-4706-7da2-08deb10a4977
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|1800799024|82310400026|35042699022|376014|56012099003|4143699003|11063799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sXds8DhtW58IH8S+SNou5EUDWF+LU8Kq9yRbUQ18z93iOz8+D9xVUaHTJQUsJ963W9yY2EHIucnMvZHtzEkjYBreYP88Tor/KY4dxFnaI6PsjKb4ne7o3hL541nhLDwBOOfrNalNdOEtFn3udQ2q5TaAfePEWqbjK0u7GKii61cUSinL4Kg9fyJBMUc2pf2PB8PQaV4U5r94Gi4oAcfiwV0K/MXz9AVR0O/4fVkmYpp3LkLMa4iXXlTFIJa+yGUQXTP6WaeyYfDaapups+z857r8USi10JceQ1yTx3+pn44DUSDcf158eUP8NGWR1hLxTFqUMnMTojYwnx8vyEndM+Y56UG0/LUdh0n2bPEFiaj4m2hT5pF6A6fRqL00218yT4fuzmFd+r9l4m454c82pODOcc25pKHC5MgXyv9gHn6zlfV+jjOlCPKS62/Il/7Yv7VHEMVG3gm1Tj7z7h6FRpZYYS/8gpAjxLdSAGtjqq6wX3e7JiiePU2H1b5EeLh4DIof5yQ1ADtqAZEDXQnsw/qmQa0UngyqX3F4K/4nejzkzrgfDfMlvHhJM43qZparscigHeAMjSXy8YhV1X+b1T1WhudeMY0PyUrHruYGSoyrh5/Aoydo2UMFA5J0xvIIIH4ZUX5GxYatv5D2Rn6RNZgkeGThVEDdi681FXUvn5eVSNAMd2F8dFHvASNfoijnhKwLvt5cBBceU+xvZ19A4veKx/1+2vWFAXVhhXvzan8=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(1800799024)(82310400026)(35042699022)(376014)(56012099003)(4143699003)(11063799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lKKU4VFUqChy8WkoXju5WfGXE50H+xwehfy+BEaHmyMQT4lTOpoXSYoledulavvP1ja7kvBPz0UWrmt76Rxz5lavHfpT7/CW61f5aOagMqyMtYNY/LzR1ZInj2F56yL5+nc82OdHu2c8fpo8ZwT1r7eeuZJlWq0cJbBV6Iwk5oH2u7378SCg8Qvo3hu6R/tWVOicB6gldYmfO6QfuF/HNxFed0QO/Gmw5+7hBL/EZdaBTSWuueef3H+DY92RHY73Ehc6rSGBxQYF5Kz+mDHB73r0AJtqfejEZHkjqJxlLpPpxPEmYQob5AcVeGb4f6A7cKeKTNiMlI5OFuy9OBXzZ5Bz0Xq5YJYSc2dvpdbhW8vELA3d3hFxFZSnKedYXItz5/YSHiRAh3m5LMnJlRxA334CiugWqPdQGRo8pZnvQrWsxOEglOfSuLMz9p2fefJP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 16:12:32.8217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe38be0b-9c3a-4971-be68-08deb10a708b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8447
X-purgate-ID: tlsNG-33051d/1778688758-3A766938-7FD8364D/0/0
X-purgate-type: clean
X-purgate-size: 11504
X-Rspamd-Queue-Id: 7F276536D6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgZ2ljdjNfZGlzYWJsZV9yZWRp
c3Qodm9pZCkNCj4gK3sNCj4gKyAgICB2b2lkIF9faW9tZW0gKndha2VyID0gR0lDRF9SRElTVF9C
QVNFICsgR0lDUl9XQUtFUjsNCj4gKyAgICBzX3RpbWVfdCBkZWFkbGluZTsNCj4gKw0KPiArICAg
IC8qDQo+ICsgICAgICogQXZvaWQgaW5maW5pdGUgbG9vcCBpZiBOb24tc2VjdXJlIGRvZXMgbm90
IGhhdmUgYWNjZXNzIHRvIEdJQ1JfV0FLRVIuDQo+ICsgICAgICogU2VlIEFybSBJSEkgMDA2OUgu
YiwgMTIuMTEuNDIgR0lDUl9XQUtFUjoNCj4gKyAgICAgKiAgICAgV2hlbiBHSUNEX0NUTFIuRFMg
PT0gMCBhbmQgYW4gYWNjZXNzIGlzIE5vbi1zZWN1cmUgYWNjZXNzZXMgdG8gdGhpcw0KPiArICAg
ICAqICAgICByZWdpc3RlciBhcmUgUkFaL1dJLg0KPiArICAgICAqLw0KPiArICAgIGlmICggIShy
ZWFkbF9yZWxheGVkKEdJQ0QgKyBHSUNEX0NUTFIpICYgR0lDRF9DVExSX0RTKSApDQo+ICsgICAg
ICAgIHJldHVybiAwOw0KPiArDQo+ICsgICAgZGVhZGxpbmUgPSBOT1coKSArIE1JTExJU0VDUygx
MDAwKTsNCj4gKw0KPiArICAgIHdyaXRlbF9yZWxheGVkKHJlYWRsX3JlbGF4ZWQod2FrZXIpIHwg
R0lDUl9XQUtFUl9Qcm9jZXNzb3JTbGVlcCwgd2FrZXIpOw0KPiArICAgIHdoaWxlICggKHJlYWRs
X3JlbGF4ZWQod2FrZXIpICYgR0lDUl9XQUtFUl9DaGlsZHJlbkFzbGVlcCkgPT0gMCApDQo+ICsg
ICAgew0KPiArICAgICAgICBpZiAoIE5PVygpID4gZGVhZGxpbmUgKQ0KPiArICAgICAgICB7DQo+
ICsgICAgICAgICAgICBwcmludGsoIkdJQ3YzOiBUaW1lb3V0IHdhaXRpbmcgZm9yIHJlZGlzdHJp
YnV0b3IgdG8gc2xlZXBcbiIpOw0KDQpJIHRoaW5rIGhlcmUgd2Ugc2hvdWxkIGNsZWFyIEdJQ1Jf
V0FLRVJfUHJvY2Vzc29yU2xlZXAsIHRoZSBBcm0gSUhJIDAwNjlILmIsIHNlY3Rpb24NCjExLjEg
c2F5cyB0aGF0DQoNCuKAnOKAnSINCldoZW4gR0lDUl9XQUtFUi5Qcm9jZXNzb3JTbGVlcCA9PSAx
IG9yIEdJQ1JfV0FLRVIuQ2hpbGRyZW5Bc2xlZXAgPT0gMSB0aGVuIGEgd3JpdGUgdG8gYW55IEdJ
Q0NfKiwNCkdJQ1ZfKiwgR0lDSF8qLCBJQ0NfKiwgSUNWXyosIG9yIElDSF8qIHJlZ2lzdGVycywg
b3RoZXIgdGhhbiB0aG9zZSBpbiB0aGUgZm9sbG93aW5nIGxpc3QsIGlzIHVucHJlZGljdGFibGU6
DQrigKIgSUNDX1NSRV9FTDEuDQrigKIgSUNDX1NSRV9FTDIuDQrigKIgSUNDX1NSRV9FTDMNCuKA
nCIiDQpCdXQgaW4gdGhlIGVycm9yIHBhdGggdXNlZCBpbiBnaWN2M19zdXNwZW5kKCkgd2UgYXJl
IHdyaXRpbmcgSUNIX0hDUl9FTDIgYW5kIElDQ19JR1JQRU4xX0VMMS4NCg0KPiArICAgICAgICAg
ICAgcmV0dXJuIC1FVElNRURPVVQ7DQo+ICsgICAgICAgIH0NCj4gKyAgICAgICAgY3B1X3JlbGF4
KCk7DQo+ICsgICAgICAgIHVkZWxheSgxMCk7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgcmV0dXJu
IDA7DQo+ICt9DQo+ICsNCj4gKyNkZWZpbmUgR0VUX1NQSV9SRUdfT0ZGU0VUKG5hbWUsIGlzX2Vz
cGkpIFwNCj4gKyAgICAoKGlzX2VzcGkpID8gR0lDRF8jI25hbWUjI25FIDogR0lDRF8jI25hbWUp
DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGdpY3YzX3N0b3JlX3NwaV9pcnFfYmxvY2soc3RydWN0IGRp
c3RfaXJxX2Jsb2NrICppcnFzLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgaSwgYm9vbCBpc19lc3BpKQ0KPiArew0KPiArICAgIHZvaWQgX19p
b21lbSAqYmFzZTsNCj4gKyAgICB1bnNpZ25lZCBpbnQgaXJxOw0KPiArDQo+ICsgICAgYmFzZSA9
IEdJQ0QgKyBHRVRfU1BJX1JFR19PRkZTRVQoSUNGR1IsIGlzX2VzcGkpICsgaSAqIHNpemVvZihp
cnFzLT5pY2Zncik7DQo+ICsgICAgaXJxcy0+aWNmZ3JbMF0gPSByZWFkbF9yZWxheGVkKGJhc2Up
Ow0KPiArICAgIGlycXMtPmljZmdyWzFdID0gcmVhZGxfcmVsYXhlZChiYXNlICsgNCk7DQo+ICsN
Cj4gKyAgICBiYXNlID0gR0lDRCArIEdFVF9TUElfUkVHX09GRlNFVChJUFJJT1JJVFlSLCBpc19l
c3BpKTsNCj4gKyAgICBiYXNlICs9IGkgKiBzaXplb2YoaXJxcy0+aXByaW9yaXR5cik7DQo+ICsg
ICAgZm9yICggaXJxID0gMDsgaXJxIDwgQVJSQVlfU0laRShpcnFzLT5pcHJpb3JpdHlyKTsgaXJx
KysgKQ0KPiArICAgICAgICBpcnFzLT5pcHJpb3JpdHlyW2lycV0gPSByZWFkbF9yZWxheGVkKGJh
c2UgKyA0ICogaXJxKTsNCj4gKw0KPiArICAgIGJhc2UgPSBHSUNEICsgR0VUX1NQSV9SRUdfT0ZG
U0VUKElST1VURVIsIGlzX2VzcGkpOw0KPiArICAgIGJhc2UgKz0gaSAqIHNpemVvZihpcnFzLT5p
cm91dGVyKTsNCj4gKyAgICBmb3IgKCBpcnEgPSAwOyBpcnEgPCBBUlJBWV9TSVpFKGlycXMtPmly
b3V0ZXIpOyBpcnErKyApDQo+ICsgICAgICAgIGlycXMtPmlyb3V0ZXJbaXJxXSA9IHJlYWRxX3Jl
bGF4ZWRfbm9uX2F0b21pYyhiYXNlICsgOCAqIGlycSk7DQo+ICsNCj4gKyAgICBiYXNlID0gR0lD
RCArIEdFVF9TUElfUkVHX09GRlNFVChJU0FDVElWRVIsIGlzX2VzcGkpOw0KPiArICAgIGJhc2Ug
Kz0gaSAqIHNpemVvZihpcnFzLT5pc2FjdGl2ZXIpOw0KPiArICAgIGlycXMtPmlzYWN0aXZlciA9
IHJlYWRsX3JlbGF4ZWQoYmFzZSk7DQo+ICsNCj4gKyAgICBiYXNlID0gR0lDRCArIEdFVF9TUElf
UkVHX09GRlNFVChJU0VOQUJMRVIsIGlzX2VzcGkpOw0KPiArICAgIGJhc2UgKz0gaSAqIHNpemVv
ZihpcnFzLT5pc2VuYWJsZXIpOw0KPiArICAgIGlycXMtPmlzZW5hYmxlciA9IHJlYWRsX3JlbGF4
ZWQoYmFzZSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGdpY3YzX3Jlc3RvcmVfc3BpX2ly
cV9jb25maWcoc3RydWN0IGRpc3RfaXJxX2Jsb2NrICppcnFzLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaSwgYm9vbCBpc19lc3BpKQ0K
PiArew0KPiArICAgIHZvaWQgX19pb21lbSAqYmFzZTsNCj4gKyAgICB1bnNpZ25lZCBpbnQgaXJx
Ow0KPiArDQo+ICsgICAgYmFzZSA9IEdJQ0QgKyBHRVRfU1BJX1JFR19PRkZTRVQoSUNGR1IsIGlz
X2VzcGkpICsgaSAqIHNpemVvZihpcnFzLT5pY2Zncik7DQo+ICsgICAgd3JpdGVsX3JlbGF4ZWQo
aXJxcy0+aWNmZ3JbMF0sIGJhc2UpOw0KPiArICAgIHdyaXRlbF9yZWxheGVkKGlycXMtPmljZmdy
WzFdLCBiYXNlICsgNCk7DQo+ICsNCj4gKyAgICBiYXNlID0gR0lDRCArIEdFVF9TUElfUkVHX09G
RlNFVChJUFJJT1JJVFlSLCBpc19lc3BpKTsNCj4gKyAgICBiYXNlICs9IGkgKiBzaXplb2YoaXJx
cy0+aXByaW9yaXR5cik7DQo+ICsgICAgZm9yICggaXJxID0gMDsgaXJxIDwgQVJSQVlfU0laRShp
cnFzLT5pcHJpb3JpdHlyKTsgaXJxKysgKQ0KPiArICAgICAgICB3cml0ZWxfcmVsYXhlZChpcnFz
LT5pcHJpb3JpdHlyW2lycV0sIGJhc2UgKyA0ICogaXJxKTsNCj4gK30NCj4gKw0KPiArc3RhdGlj
IHZvaWQgZ2ljdjNfcmVzdG9yZV9zcGlfaXJxX3JvdXRpbmcoc3RydWN0IGRpc3RfaXJxX2Jsb2Nr
ICppcnFzLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGksIGJvb2wgaXNfZXNwaSkNCj4gK3sNCj4gKyAgICB2b2lkIF9faW9tZW0gKmJh
c2U7DQo+ICsgICAgdW5zaWduZWQgaW50IGlycTsNCj4gKw0KPiArICAgIGJhc2UgPSBHSUNEICsg
R0VUX1NQSV9SRUdfT0ZGU0VUKElST1VURVIsIGlzX2VzcGkpOw0KPiArICAgIGJhc2UgKz0gaSAq
IHNpemVvZihpcnFzLT5pcm91dGVyKTsNCj4gKyAgICBmb3IgKCBpcnEgPSAwOyBpcnEgPCBBUlJB
WV9TSVpFKGlycXMtPmlyb3V0ZXIpOyBpcnErKyApDQo+ICsgICAgICAgIHdyaXRlcV9yZWxheGVk
X25vbl9hdG9taWMoaXJxcy0+aXJvdXRlcltpcnFdLCBiYXNlICsgOCAqIGlycSk7DQo+ICt9DQo+
ICsNCj4gK3N0YXRpYyB2b2lkIGdpY3YzX3Jlc3RvcmVfc3BpX2lycV9zdGF0ZShzdHJ1Y3QgZGlz
dF9pcnFfYmxvY2sgKmlycXMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGksIGJvb2wgaXNfZXNwaSkNCj4gK3sNCj4gKyAgICB2b2lkIF9f
aW9tZW0gKmJhc2U7DQo+ICsNCj4gKyAgICBiYXNlID0gR0lDRCArIEdFVF9TUElfUkVHX09GRlNF
VChJQ0VOQUJMRVIsIGlzX2VzcGkpICsgaSAqIDQ7DQo+ICsgICAgd3JpdGVsX3JlbGF4ZWQoR0VO
TUFTSygzMSwgMCksIGJhc2UpOw0KPiArDQo+ICsgICAgYmFzZSA9IEdJQ0QgKyBHRVRfU1BJX1JF
R19PRkZTRVQoSVNFTkFCTEVSLCBpc19lc3BpKTsNCj4gKyAgICBiYXNlICs9IGkgKiBzaXplb2Yo
aXJxcy0+aXNlbmFibGVyKTsNCj4gKyAgICB3cml0ZWxfcmVsYXhlZChpcnFzLT5pc2VuYWJsZXIs
IGJhc2UpOw0KPiArDQo+ICsgICAgYmFzZSA9IEdJQ0QgKyBHRVRfU1BJX1JFR19PRkZTRVQoSUNB
Q1RJVkVSLCBpc19lc3BpKSArIGkgKiA0Ow0KPiArICAgIHdyaXRlbF9yZWxheGVkKEdFTk1BU0so
MzEsIDApLCBiYXNlKTsNCj4gKw0KPiArICAgIGJhc2UgPSBHSUNEICsgR0VUX1NQSV9SRUdfT0ZG
U0VUKElTQUNUSVZFUiwgaXNfZXNwaSk7DQo+ICsgICAgYmFzZSArPSBpICogc2l6ZW9mKGlycXMt
PmlzYWN0aXZlcik7DQo+ICsgICAgd3JpdGVsX3JlbGF4ZWQoaXJxcy0+aXNhY3RpdmVyLCBiYXNl
KTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBnaWN2M19zdXNwZW5kKHZvaWQpDQo+ICt7DQo+
ICsgICAgdW5zaWduZWQgaW50IGk7DQo+ICsgICAgdm9pZCBfX2lvbWVtICpiYXNlOw0KPiArICAg
IGludCByZXQ7DQo+ICsgICAgc3RydWN0IHJlZGlzdF9jdHggKnJkaXN0ID0gJmdpY3YzX2N0eC5y
ZGlzdDsNCj4gKw0KPiArICAgIC8qIFNhdmUgR0lDQyBjb25maWd1cmF0aW9uICovDQo+ICsgICAg
Z2ljdjNfY3R4LmNwdS5jdGxyICAgICA9IFJFQURfU1lTUkVHKElDQ19DVExSX0VMMSk7DQo+ICsg
ICAgZ2ljdjNfY3R4LmNwdS5wbXIgICAgICA9IFJFQURfU1lTUkVHKElDQ19QTVJfRUwxKTsNCj4g
KyAgICBnaWN2M19jdHguY3B1LmJwciAgICAgID0gUkVBRF9TWVNSRUcoSUNDX0JQUjFfRUwxKTsN
Cj4gKyAgICBnaWN2M19jdHguY3B1LnNyZV9lbDIgID0gUkVBRF9TWVNSRUcoSUNDX1NSRV9FTDIp
Ow0KPiArICAgIGdpY3YzX2N0eC5jcHUuZ3JwZW4gICAgPSBSRUFEX1NZU1JFRyhJQ0NfSUdSUEVO
MV9FTDEpOw0KPiArDQo+ICsgICAgZ2ljdjNfZGlzYWJsZV9pbnRlcmZhY2UoKTsNCg0KU2hvdWxk
IHdlIGNoZWNrIHRoYXQgSUNDX0FQMVI8bj5fRUwxID09IDAgYmVmb3JlIGNvbnRpbnVpbmcgb3Vy
DQpzdXNwZW5kPyBMaWtlIHdlIGRvIGluIHRoZSBHSUN2Mj8NCg0KPiArDQo+ICsgICAgcmV0ID0g
Z2ljdjNfZGlzYWJsZV9yZWRpc3QoKTsNCj4gKyAgICBpZiAoIHJldCApDQo+ICsgICAgICAgIGdv
dG8gb3V0X2VuYWJsZV9pZmFjZTsNCj4gKw0KPiArICAgIC8qIFNhdmUgR0lDUiBjb25maWd1cmF0
aW9uICovDQo+ICsgICAgZ2ljdjNfcmVkaXN0X3dhaXRfZm9yX3J3cCgpOw0KPiArDQo+ICsgICAg
YmFzZSA9IEdJQ0RfUkRJU1RfQkFTRTsNCj4gKw0KPiArICAgIHJkaXN0LT5jdGxyID0gcmVhZGxf
cmVsYXhlZChiYXNlICsgR0lDUl9DVExSKTsNCj4gKw0KPiArICAgIHJkaXN0LT5wcm9wYmFzZSA9
IHJlYWRxX3JlbGF4ZWQoYmFzZSArIEdJQ1JfUFJPUEJBU0VSKTsNCj4gKyAgICByZGlzdC0+cGVu
ZGJhc2UgPSByZWFkcV9yZWxheGVkKGJhc2UgKyBHSUNSX1BFTkRCQVNFUik7DQo+ICsNCj4gKyAg
ICBiYXNlID0gR0lDRF9SRElTVF9TR0lfQkFTRTsNCj4gKw0KPiArICAgIC8qIFNhdmUgcHJpb3Jp
dHkgb24gUFBJIGFuZCBTR0kgaW50ZXJydXB0cyAqLw0KPiArICAgIGZvciAoIGkgPSAwOyBpIDwg
TlJfR0lDX0xPQ0FMX0lSUVMgLyA0OyBpKysgKQ0KPiArICAgICAgICByZGlzdC0+aXByaW9yaXR5
cltpXSA9IHJlYWRsX3JlbGF4ZWQoYmFzZSArIEdJQ1JfSVBSSU9SSVRZUjAgKyA0ICogaSk7DQo+
ICsNCj4gKyAgICByZGlzdC0+aXNhY3RpdmVyID0gcmVhZGxfcmVsYXhlZChiYXNlICsgR0lDUl9J
U0FDVElWRVIwKTsNCj4gKyAgICByZGlzdC0+aXNlbmFibGVyID0gcmVhZGxfcmVsYXhlZChiYXNl
ICsgR0lDUl9JU0VOQUJMRVIwKTsNCj4gKyAgICByZGlzdC0+aWdyb3VwciAgID0gcmVhZGxfcmVs
YXhlZChiYXNlICsgR0lDUl9JR1JPVVBSMCk7DQo+ICsgICAgcmRpc3QtPmljZmdyICAgICA9IHJl
YWRsX3JlbGF4ZWQoYmFzZSArIEdJQ1JfSUNGR1IxKTsNCj4gKw0KPiArICAgIC8qIFNhdmUgR0lD
RCBjb25maWd1cmF0aW9uICovDQo+ICsgICAgZ2ljdjNfZGlzdF93YWl0X2Zvcl9yd3AoKTsNCj4g
KyAgICBnaWN2M19jdHguZGlzdC5jdGxyID0gcmVhZGxfcmVsYXhlZChHSUNEICsgR0lDRF9DVExS
KTsNCj4gKw0KPiArICAgIGZvciAoIGkgPSAxOyBpIDwgRElWX1JPVU5EX1VQKGdpY3YzX2luZm8u
bnJfbGluZXMsIDMyKTsgaSsrICkNCj4gKyAgICAgICAgZ2ljdjNfc3RvcmVfc3BpX2lycV9ibG9j
ayhnaWN2M19jdHguZGlzdC5pcnFzICsgaSAtIDEsIGksIGZhbHNlKTsNCj4gKw0KPiArI2lmZGVm
IENPTkZJR19HSUNWM19FU1BJDQo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBnaWNfbnVtYmVyX2Vz
cGlzKCkgLyAzMjsgaSsrICkNCj4gKyAgICAgICAgZ2ljdjNfc3RvcmVfc3BpX2lycV9ibG9jayhn
aWN2M19jdHguZGlzdC5lc3BpX2lycXMgKyBpLCBpLCB0cnVlKTsNCj4gKyNlbmRpZg0KPiArDQo+
ICsgICAgcmV0dXJuIDA7DQo+ICsNCj4gKyBvdXRfZW5hYmxlX2lmYWNlOg0KPiArICAgIGdpY3Yz
X2h5cF9lbmFibGUodHJ1ZSk7DQo+ICsgICAgV1JJVEVfU1lTUkVHKGdpY3YzX2N0eC5jcHUuZ3Jw
ZW4sIElDQ19JR1JQRU4xX0VMMSk7DQo+ICsgICAgaXNiKCk7DQo+ICsNCj4gKyAgICByZXR1cm4g
cmV0Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBnaWN2M19yZXN1bWUodm9pZCkNCj4gK3sN
Cj4gKyAgICBpbnQgcmV0Ow0KPiArICAgIHVuc2lnbmVkIGludCBpOw0KPiArICAgIHVpbnQzMl90
IGRpc3RfY3RscjsNCj4gKyAgICB2b2lkIF9faW9tZW0gKmJhc2U7DQo+ICsgICAgc3RydWN0IHJl
ZGlzdF9jdHggKnJkaXN0ID0gJmdpY3YzX2N0eC5yZGlzdDsNCj4gKw0KPiArICAgIHdyaXRlbF9y
ZWxheGVkKDAsIEdJQ0QgKyBHSUNEX0NUTFIpOw0KPiArDQo+ICsgICAgZm9yICggaSA9IE5SX0dJ
Q19MT0NBTF9JUlFTOyBpIDwgZ2ljdjNfaW5mby5ucl9saW5lczsgaSArPSAzMiApDQo+ICsgICAg
ICAgIHdyaXRlbF9yZWxheGVkKEdFTk1BU0soMzEsIDApLCBHSUNEICsgR0lDRF9JR1JPVVBSICsg
KGkgLyAzMikgKiA0KTsNCj4gKw0KPiArICAgIGZvciAoIGkgPSAxOyBpIDwgRElWX1JPVU5EX1VQ
KGdpY3YzX2luZm8ubnJfbGluZXMsIDMyKTsgaSsrICkNCj4gKyAgICAgICAgZ2ljdjNfcmVzdG9y
ZV9zcGlfaXJxX2NvbmZpZyhnaWN2M19jdHguZGlzdC5pcnFzICsgaSAtIDEsIGksIGZhbHNlKTsN
Cj4gKw0KPiArI2lmZGVmIENPTkZJR19HSUNWM19FU1BJDQo+ICsgICAgZm9yICggaSA9IDA7IGkg
PCBnaWNfbnVtYmVyX2VzcGlzKCkgLyAzMjsgaSsrICkNCj4gKyAgICB7DQo+ICsgICAgICAgIHdy
aXRlbF9yZWxheGVkKEdFTk1BU0soMzEsIDApLCBHSUNEICsgR0lDRF9JR1JPVVBSbkUgKyBpICog
NCk7DQo+ICsgICAgICAgIGdpY3YzX3Jlc3RvcmVfc3BpX2lycV9jb25maWcoZ2ljdjNfY3R4LmRp
c3QuZXNwaV9pcnFzICsgaSwgaSwgdHJ1ZSk7DQo+ICsgICAgfQ0KPiArI2VuZGlmDQo+ICsNCj4g
KyAgICBkaXN0X2N0bHIgPSBnaWN2M19jdHguZGlzdC5jdGxyICYgR0lDRF9DVExSX0FSRV9OUzsN
Cj4gKyAgICBpZiAoIGRpc3RfY3RsciApDQo+ICsgICAgew0KPiArICAgICAgICB3cml0ZWxfcmVs
YXhlZChkaXN0X2N0bHIsIEdJQ0QgKyBHSUNEX0NUTFIpOw0KPiArICAgICAgICBnaWN2M19kaXN0
X3dhaXRfZm9yX3J3cCgpOw0KPiArDQo+ICsgICAgICAgIGZvciAoIGkgPSAxOyBpIDwgRElWX1JP
VU5EX1VQKGdpY3YzX2luZm8ubnJfbGluZXMsIDMyKTsgaSsrICkNCj4gKyAgICAgICAgICAgIGdp
Y3YzX3Jlc3RvcmVfc3BpX2lycV9yb3V0aW5nKGdpY3YzX2N0eC5kaXN0LmlycXMgKyBpIC0gMSwg
aSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhbHNlKTsN
Cg0KSSB0aGluayB3ZSBoYXZlIGFuIGlzc3VlIGluIHRoaXMgbG9vcCBhcyB3ZSBhcmUgYWNjZXNz
aW5nIEdJQ0RfSVJPVVRFUjwxMDIw4oCmMTAyMz4NCmFuZCBHSUNEX0lQUklPUklUWVIyNTUsIHdo
aWxlIHRoZSBzcGVjcyBzYXlzIDEwMjDigKYxMDIzIGFyZSByZXNlcnZlZCBhbmQNCkdJQ0RfSVBS
SU9SSVRZUjxuPiBnb2VzIGZyb20gMCB0byAyNTQuIGhlcmUgYW5kIGluIHRoZSBnaWN2M19zdXNw
ZW5kKCkNCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

