Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNGgNnG132lCXwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:57:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C2D406282
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282653.1565201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD2c4-0002nD-0t; Wed, 15 Apr 2026 15:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282653.1565201; Wed, 15 Apr 2026 15:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD2c3-0002lG-UM; Wed, 15 Apr 2026 15:57:11 +0000
Received: by outflank-mailman (input) for mailman id 1282653;
 Wed, 15 Apr 2026 15:57:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wD2c2-0002lA-9G
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:57:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD2c1-002rJ6-M5
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:57:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfb519-2eae-0a2a0a5409dd-0a2a450ca7fe-48
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:57:09 +0200
Received: from [40.107.162.30]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfb555-f40c-0a2a450c0019-286ba21e8eb8-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:57:09 +0200
Received: from AS4P192CA0037.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::28)
 by AS8PR08MB10152.eurprd08.prod.outlook.com (2603:10a6:20b:63e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:57:00 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::3f) by AS4P192CA0037.outlook.office365.com
 (2603:10a6:20b:658::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 15:57:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 15:57:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by VE1PR08MB5712.eurprd08.prod.outlook.com (2603:10a6:800:1a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:55:57 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:55:57 +0000
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
 b=AYGZUILptsh0Gvz5JnsO0EFQ0rLkJDpL0tEceSOIivTLSkbxZ6ViGTC553iIUkdnwysMDVO/oMd/P+Lmgmol2FKTH4Ndql2fsKfUIyU4Tfki6pshr0OFW8cMGFUuY/FpQHzBwKdL6M5GndgcFQj9E5WDw1h7Wk9vLGoT82L80PxE1Rl5F+jO2WEf/dUq4j2B2jcG8S4rmAqbbgct52WPf7lHluNUtkdgsGLN/tcXtPOGdS1/OCM0Q0zJR/FkieLsW3xsLq8KxfZFuNnyMcf99T6ZqvSYXrrMEH9ICOM8KmR2rgMaHZbAVCHp59NEOuXR7qwDjzwAv5HVL/3ZxOXGhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk7/cHl0rzOfWaoLWd/gpPXNecC2vp6Jp0xxxlMwimQ=;
 b=RFdtADAeZMDJQeiFOcMw0J2w4YaNqQ1v7/jrN8+uUo01KdqEBNIxYfemR5kT36B6BadwpZ/7euq6GItpiJJguZirbtyscMRz5LFlaKVHmVFEH5O/O8AVyurcAsgV7eIRGOvmKDdd8AEJxF264EVhi6oDzSnqQOOcx86kDiE0vCugF2QMII/sioaaOIlsm/au/dtFbd6CRgH7h073xP95LQZcLa9vjrJp3fcqbqg619rDkM2EAvw+GbGNHo+N35Dv8QjeM4ODcgBssVRrbaNGS45Dt4+mM/M9qm0/Kve4o1ydB2PpUAZo7rG/H0jiI3Sf1uWCib3BPsrFg3Qb3BJCpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk7/cHl0rzOfWaoLWd/gpPXNecC2vp6Jp0xxxlMwimQ=;
 b=nWQmR2qk+G0ttxj4W/gUsWAxkMUUtVFM2BKW1PIIH/CDLz6NLmq3HEmHy5tMfGMYOxcbNEi3cF7h57B2kLfQce6iRo29bFj3fyXn8EB0AEuwCHv55mQOoQJuyAM/2GSWI4b8JOfaFHB2dikrjXd4MToX0MoO1qI9aXcuC9nXqck=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOKs2OBkkZBXMWjChgm+XymeKLZhbAotL3WY0qd5gaoMYAQbPzBGzuj2E4XHZ7H/6Qbfy/xR/anuJgUYUVtXrhqK96EKPSLRjS6mBykhpB7sHfLcEKZ3svibhgc038d2JkfmbA25QMn9j05QNeMoEfQNCy3iXgIPNZMPrgb1/MtGQ75TsuZUZfWVvTNmSESSMrTQXPdp2VdI9uMO42jiou4eadmlZWbEmxCa+m99oiUYJZVQyUb7F0yweN6qDMwr1m387DA1Gg+n0FYo2lyfF7tVAqK4U/BDsbFAdERvRsLjjHoyKamR1pOES4xuuTeBP0lUCs192Epc4IwZCScyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk7/cHl0rzOfWaoLWd/gpPXNecC2vp6Jp0xxxlMwimQ=;
 b=DcrrVk5bjxE/A+NYIeC/KG26rOUGymlbYdPySNYGeSPtgzlOeg332ysJdE/fKPtZTGOyThc8ZPuCSVm1G2hihdJn3TIGHKpD74/fV8PRxbdYY+U6xbOhhe+ztfJOwHXDH0frinWq7PcOupM9l2ordjqCaiua8U1jwVG2+5WK+F2UCapZSzZrH3ey25sD0TDRnj2+zg63W7wJSJDaCVmG+omMD44FNSUhn4grUhtqtGkyT7Wut1+cOqkQLOU8tMvc20k92eY3EBBcDvmqCOgd2uLzy70dmsvZJ2CyfRtAMf1LdtbRssSAtSuxzLdaM9odld6HtnQpbJJES+xdAim4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk7/cHl0rzOfWaoLWd/gpPXNecC2vp6Jp0xxxlMwimQ=;
 b=nWQmR2qk+G0ttxj4W/gUsWAxkMUUtVFM2BKW1PIIH/CDLz6NLmq3HEmHy5tMfGMYOxcbNEi3cF7h57B2kLfQce6iRo29bFj3fyXn8EB0AEuwCHv55mQOoQJuyAM/2GSWI4b8JOfaFHB2dikrjXd4MToX0MoO1qI9aXcuC9nXqck=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 6/6] xen/dt-overlay: attach resources for child nodes in
 overlay
Thread-Topic: [PATCH 6/6] xen/dt-overlay: attach resources for child nodes in
 overlay
Thread-Index: AQHczMxJagU60W5wKEqy3Z9xj7be5LXgRvWA
Date: Wed, 15 Apr 2026 15:55:57 +0000
Message-ID: <399078B8-E138-4689-AF98-8BDC6052C080@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-7-michal.orzel@amd.com>
In-Reply-To: <20260415113700.107915-7-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|VE1PR08MB5712:EE_|AMS1EPF0000004A:EE_|AS8PR08MB10152:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e0988e-fe14-42d7-3609-08de9b07a14d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 bmSe0QuNQfzIthojUNU2KI3otg5PIckTwoCBnxbCj1yc/mjO2FuHiM0wOneYVOagC9R5xVpjcmRUIo+U6lq8TsQaaKCx9eTkMtqbPLys+A4sOJ/u+Bv3IaLJVZzsIVcVcKdQPYKJr8dUsRrFBbSYONbwK2MoVbm+P8M9DrbLyFd87DjKg6qht9kw5RNra0tS+JrHplbZ/O2fyWiFXcakJaL6z/k9EbMyPCuAMwy6kxUTmYwmmRSgYlS6WgF2vHm99k+Dh/BESfYLnptOZ1zVqhDpCyWiSGzx87laYWNaOkptuRgQB+2FSMmEQ4FJo2jzS21W2uVEOkkxi198U5Svqe3+OX+V87504ClVw5YjZVN4fax+oSKYtn9t8matj3XMmUPDizQOUXdywzb2A0c4VzjO1Bg9xxTeH+f+bzaq0j9kjQyuPCh77XhAVnRFQF5GPLPJW8EZK4q+FYr332Gc3RwOejGbA7cluVsElsLp+PQwzu/nUDFAjPFFU0rAL//7hFwYAyvkBnnyOF+Kz4eUKfc7bCPvLE6JYlEXRoCC66xwLUG8CMfDvXu3UCnwVca/y712UZ8qUm4Xmr7JCU4X/ipmCYZMAyR4qnG9N/TZVS72r7g1wAIlyuLgR6FS13ItZqRu10ZZSsDGCyBZViWYzpmTRKghmwx46JYoLDhSmTph2GX7VQrtyifJeIlVB6sY7th2CZ0SwhhIpLv5WIw9zGlSFX5ywWJ7QxhyKEaxrp/FHl1lhvQmKoJsgqEa178obhDN3VedAQ8NDo24hzwmqBx/8vZHrwJlu/8LBmtH9l0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F18E0BC272FBBF4D93291239101961C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 nXyjJEx3nXw9bX09HsynZrd4b3GflUn6iJpge+TMdOE4ueu7UzZuAWtt8oTd701idgQ3FoD+obcO3mBfa3kotIt60SWTWb4f7CazdbHBvk3zsh4uBZW6LBXn9GUSi0ZOgWyWvX3EP+RVuS67XKZtn7auyNIprVzwAsOjZ720PVb+oreR5yWWJFxcz5pxfr5q3mPtTGHWl3VfGODFSawpW1axQVWkUjUgqRiDpMny/Pe+lVUoBv77UrdjBojiT82ebDHCLZUXz05bdfK5oEWIV0O/HSZBLqa0XMdAgGodOaiHZvuySdU+eWLYuEbamLmKN5tKtDZyDPm8bmn45kzjAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5712
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48e2393a-4008-4253-a9a9-08de9b077bdd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700016|82310400026|35042699022|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r+hNDKmw4opRUz3qtGUNKWFVqB3obVr8bF/xkmENjX4KM+BPVqX9ywccAgYSvtB06ODOjLT96k+Sexx3Datshw1QrBtAHioVHZJnYWp79xbtk5Z8YqQB1ozfbLiVHpdMWRsG8bUPsUAX6HG/MSs+mf5ymCIIIxRsKsaMPRZZSxKNTn79MI4HVkTGlYacRhvxeh6hG+FMfE4dvOcbFMuABKZCFMpucsuKgCUvKKar/jPBo2ULm4MryQ8hPb5LsM6Sn0Khk0h5jhXdCP52mdPrRu4gUeJOCZaPHtLHr4N/eiPaVqLQjqM8a3//CAVELND1H62VMuebUSXUCOGKGuHSA6uatXX7sxgrNbGqgjKVZtsAmOKATJMBJfZkiZd7qzd9ix+PKLlzVavu2JIf/fEC5jeXB5urO6FV8g1nBQoxs0Tn44viu79nZb1ejuy4eEqb+sqXU/rx4w9qEYnzohjuGPOSn55pQXBO98PZ+oybdNbcyIm2D6ERlBlAAImzQS3JgYt17ZzaTH57UIMBt3yUz14zckTUW8DRAhb6Fvxe14ZBAoo62us3qgOsp4Js0a7wujwpKC0MSc52dMEUh1R4+UuVJhbs4Q5awt8jcpFrW61m0GO3H810bHVcKg+Vasg/EP0ps+y1w1lISwP963aAYmsweAI+cMyDkpaHc9lM8BkYhS37W4kjaEwTYr530aYvFS7wYovYKIxKACR1YCkNT0UXLmKfiDWe5nVj8vWjhxhP2MrrYi2uL1NDZPHzDQv82rAOxBZ7evYRUdYkg6/R2g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700016)(82310400026)(35042699022)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	crVFjz3jy1+BY9v6wqWUaqUqOV19YFVKz2IxTZLI5DaSM75n7w394A1bpfKdbO6NwFZxd0FyON2KwhGHvhAw9dAbd415LSJ9RQab+t5aEObhBe4MIllg7josHLj2aK48JtJ01FQ/jxMphu74n2zLg95au+BFuf2NUQwLHCdU4NQ4IVkWanrJGlboS+cH8gQLK01eVdUp7/bfwm2Oi1cCOzgqCYxrIDk5IveHrftmGAjlxawOVhkxIXLKtwlkTpYL2cg2DCtNa1dhZF/1CtcA9HlX+DcWfQ6dhr/l6raErG4mKYUxTy6Yrv7sVI9S0dW4lsqbCwpJPDvND5BVNf6ZRQmXhmjTd+ScD9bhW/k85Uj4X2nqR7WRxNaqrXyMck3lR7Duw4z0dvcx/TZ65jG2m2D4OTa6iPpSVVvriCTf1BHkxZsL0Ms8y/pipmxbHTZN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:57:00.5559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e0988e-fe14-42d7-3609-08de9b07a14d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10152
X-purgate-ID: tlsNG-d25034/1776268629-80D5BA3D-FDB42907/0/0
X-purgate-type: clean
X-purgate-size: 1105
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 43C2D406282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 15 Apr 2026, at 12:37, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> handle_attach_overlay_nodes() only calls handle_device() on the
> top-level overlay nodes tracked in entry->nodes_address[].  Child nodes
> that have their own reg, interrupts, or iommus properties are never
> processed, so their IRQs are not routed, MMIO regions are not mapped,
> and IOMMU setup is skipped.
>=20
> Introduce handle_device_and_children() which recursively walks the
> subtree rooted at each overlay node and calls handle_device() on every
> descendant, ensuring all resources in the overlay are properly attached.
>=20
> Note that the attach error path has a pre-existing bug: on partial
> failure, the tracking rangesets are destroyed without first revoking the
> IRQ/MMIO permissions and IOMMU assignments that were already granted by
> the successful handle_device() calls.  Add a TODO comment to flag this.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>=20

Looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca




