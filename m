Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNziHvfJ2GmkiAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:59:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE9B3D5515
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278610.1563386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8dS-0004OX-NJ; Fri, 10 Apr 2026 09:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278610.1563386; Fri, 10 Apr 2026 09:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8dS-0004LU-KJ; Fri, 10 Apr 2026 09:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1278610;
 Fri, 10 Apr 2026 09:58:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wB8dQ-0004LO-Mf
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:58:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8dP-00GcVf-9w
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:58:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8c9c3-2eae-0a2a0a5409dd-0a2a4504d448-16
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:58:43 +0200
Received: from [40.107.159.24]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8c9d2-bb33-0a2a45040019-286b9f189212-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:58:43 +0200
Received: from CWLP265CA0291.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::15)
 by DB3PR08MB9134.eurprd08.prod.outlook.com (2603:10a6:10:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.40; Fri, 10 Apr
 2026 09:58:40 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:401:5d:cafe::8e) by CWLP265CA0291.outlook.office365.com
 (2603:10a6:401:5d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 09:58:39 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 10 Apr 2026 09:58:39 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB9PR08MB9585.eurprd08.prod.outlook.com (2603:10a6:10:456::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 09:57:36 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 09:57:36 +0000
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
 b=WQWUIMhl7UY8CZxaPW+/wr/fbsW2shfUhNw2Vhdyp+S4miyt2M8j5yGdc0M+/i9vpBSbracPMjXC9Bbn0XxFwoX5UfHLdl4P+BoK81KmIywhptFFBgziAqq0Ef278SHtyj+ZJmTjq2vVn0ZYTcNXHHk81ivWbWt1IN7bPHqorljHjneonZC/uhO9Bhyxdc0yeyqx70RB9/w0Ej0xpmQDU7SgevbP4oLD+yP1n+1yYYN9s26V7gAvTiJVfBd1t5Y/M3XooE/SyuhTI//HxDvLx+KozAtXhx+IDRQRgLGtkNEmbcJTBUF9Th0ug4v9/i94/jo1Jga7vIwZG2XkBbJ+zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpSYYeQ1lAJURXPb8JMFN3lqCu3VJcMqQc5X2VTgqH0=;
 b=FzykmZbd/UPwQXZTi6AbaZxHLhw0HkbX5DH8yO7dpN+exRz3jzG7ahLqi6rw4oRVGu9RRCpO2a0jLFvumnlJ8LvjSYxLzPZKu8wMnqe4D2UTHtLaMFGDRWDmfirDIezZlHFhzyGjcCdixthZXOcS4zwc4WCCGz8KM0arQhwnrxfpNkIHsRGTNG28kakXDyLEKus/m6mDjUaOYPC1tvNcy6cpaguytvy+lJI9vzOfm5TwJ5FRFCu39w/sbko19+lHIDp+8+C1O5CuqaF9aFe87Xi1Ai8K/k7n5zDemZhzzCbTH0RSkVmWj4QjDRZyXB4svbDDIPhPsgfV0Y9dBQUHdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpSYYeQ1lAJURXPb8JMFN3lqCu3VJcMqQc5X2VTgqH0=;
 b=EE7m2lxICWI0x+Ie6BCuqQmG3zxAzlOp6tUS/XcA68254119zLt9s5KdzVBHJqJIaWfliGG3MYcTFxt0CT2dUTNaOik5PESkK/ekM7y+mKDNnYhKxCEcdAVeJ1vneaWd5xkNrQ6nBU5bT6j3IFl+iPDE5soeq8NRPSCe7CE/Z6g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNlHS9xAAr19u6leJp63dSuJLuX1z33TzsB55pMash5NV7jrVGNx0eh0HduL2st3C7X5yNNNsG71nRADeJbxbWZqmI4Q8k1l9+0RRaRvrX2J1h6AULg1Ir9Fk4eCv3iA0/Z0wDFdsS1Wji6y3qeOgg5hTQkJYeYwOlP2yT9D7+ObOGnKTvHuKi+D+UnjqPMgngaqz9Rk+/IJ+adt4NZX2QAi7/qVDTqtE69Om2iAYDImPlPT1rT4L+jp4fWoY+dCeAKKqpya6Jrk+5J7qciWYU0LrEGnYXUCHqz8wLIaW4QFjVVm9+Q8wUxW77B8/n68i9MJ3u7aW3yGwCUNSKZgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpSYYeQ1lAJURXPb8JMFN3lqCu3VJcMqQc5X2VTgqH0=;
 b=KS8rsmO3JiKKVCtRmWhxxerLRbzlthFxLSoRivrb5A4HM9uooVpHwA0x00Ou1aAb3n3D2cW5UA50hSEE7FnLJUQG6XkY3CHsGnOvPXSeIBV2J8lvEsn7kdzfagBqMhQARkEVRmY135KxdS4SlYR0Pe1jtUjHnUt3yJzxwmim+nIGgMKW5qyLoxErjNcQZuO8AwEiJYRcPinHhOHzSveiHMMknfRfW1CsdcZFStVJF8grDybh/brPkH5i9vf3eNqVhTWENzaggaMjaavI8RQde4wwUg2JpHxFTYnZWc/cJV/y7J16+VaC416xHo8kzCU31qfkLBUBH9Aubhi8vJjQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpSYYeQ1lAJURXPb8JMFN3lqCu3VJcMqQc5X2VTgqH0=;
 b=EE7m2lxICWI0x+Ie6BCuqQmG3zxAzlOp6tUS/XcA68254119zLt9s5KdzVBHJqJIaWfliGG3MYcTFxt0CT2dUTNaOik5PESkK/ekM7y+mKDNnYhKxCEcdAVeJ1vneaWd5xkNrQ6nBU5bT6j3IFl+iPDE5soeq8NRPSCe7CE/Z6g=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 03/23] xen/arm: smmuv3: Alloc io_domain for each device
Thread-Topic: [PATCH v3 03/23] xen/arm: smmuv3: Alloc io_domain for each
 device
Thread-Index: AQHcyNBjSkBVLcbHSUezmfF5qsadhw==
Date: Fri, 10 Apr 2026 09:57:36 +0000
Message-ID: <30F30624-4145-4DBD-BC26-4CD871EE9EB7@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <78e4f2e2c68cdb75aa1c0dd7e8b456c03aa2fe6f.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <78e4f2e2c68cdb75aa1c0dd7e8b456c03aa2fe6f.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB9PR08MB9585:EE_|AM1PEPF000252DD:EE_|DB3PR08MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f488a1-e7b1-47d0-d56b-08de96e7bda0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 CdBa0hRqkfQpQRporERcJnw4N+Hr8T5yccb22GsZBselxzaAWGQwx+yV0spmziwtMBrV4ZHxrxqBssgK/AtzhV7zNE3HXxgqsOvpvZuAuX/N3YXgGOjg5zZoDPPL62GjR4EnCcWA1uzbEzjlkXRJLPCYjgt1fMjJPFenuOAizSSxiLDSSopgEcfrwZkffHJWt1WU3kis3lNlAvLBhyajgQDmiobtQK+GsZ2u2lHd1KeuLr7dTAJUQrpug7E3hRLddjGXvf/wy/ynvlWDniY94w0garIUGFbzVmiNsb7Zd9cu+u4jf3TZUep1n3hGgs47ZiJYEcKehbYYn0XN33/1pFun/rdhseJeInlFznJcoM29MY9G+ipMFq8ZUH5amARh9siIImIpcsmH39i5KItQyuIEG9fWZKgXA0uq+YwUieAo99YjF6FWfBDMT0D9wFx6AatQk5AU+V50w4eAhcB2smwodB+Fve+vsKyN0YOystAZeyUedfHMhzUDZxp207bPfzem0LxQerLRqQD7hs4GjqRvDurUnz/s2jibpR3mIX0mCHjcIsNhN8vaIJM046fc6h9N+5dUMsPMj9kyW3uJ/xYy4bl4F0zmoe5uCGEqS0n9b5aKKIA7LK6dLikK/wGyS1E2431MoZvqAFakdCJyzFj2ghu/05ioLglKAsWlTUucvgSsShuh+iuI0BiGlTNgzlolLK8BCzAzAsOlwjvveLDbnQXsCkRS+xCNJhjd7a8iFA0w9MaKabl8YUsT8XlfaPXaqHE03U/apBhBUvXFZ187p2sXB/SGKdWbVKUZjjY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0C6C2792E7A62744B14B527B84379FAD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ADbpU5A56+HN3pHoy61vp4f5DC2J7qKWlaJ+mKf7UdZWcYLVV3LrvyoN514d30Y+OzCFHuJbHOnFHaJBeUHYO0Y+kOz4xsGZ7kP1Zs8Sbva58Nb1tdAT9T6DQ1c2g1PLiTUOs0Q25Bsi9Elgw6l555Ppyhe8AfV7SjltcBd8DgIUCJiqRLd7vaUM1JkT5C45qWTWeeYZwNq3v0iOgK5wt1rUApOXIKyB8VBQP1tLf5lbmVz9bOF4q4knioKj4WSV0HL8HtOxb3+yK4UIjamonjPGP05XuNON01oAs5MFzV+I3MbFTmmp15iP+fMIPDoDaCDmEqVIEXrjpA73ylzLRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9585
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aca1a194-e08b-43bb-9bbe-08de96e7982a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700016|14060799003|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9PlPibUf8blzGBzzjJh+36STQIpbBeoLXsq7mgU48nSMMMstuRprxd6sns+lrYqVlO9bFUqxQQMEdPqA2Bq1Pf//kMBnV0ej5z1eZBOnephAUy06FE3jAobiNtrAuVoqeMvgrRVIxzjyrdBw30sJJh9gCb1zvhS27Zt9BJT1tKdFj3FLMB2DeQAAsjwC7tHLv48bEcZtXMRYD//n+V5m8gSwcItaJ8I29MGOTsGO5n7QhrU2x3WGT7CW7Wy0cTaCEzpxdTCO/cg99qWCNlhpd2lKoGRexxii1Og1slaKHldOe3SvONrShkPmSqgFCpZjbCs4ijGc+SjOvcbo8UTeJC64+nTaN43rRbWrGtFfbbbqW6cuz9OABLqRNpyTD4Op+9OA1zUgBYb20Ve+YWUeaUFxZnUHfOIM3WZ41EgUhwLzxvbkZVO8H+4A89KdtEiRDUk3SsMmKehebFopKU2y+kTWdxN92mbo/GQ9wx6I4L2iYI/VtyqAEm+mRLc7VbsTICQg8kXqxOIOud6itN1mi+uxo56osZ3xuXg1x62q5SSB3aM875ZFuijEU2VbKUWbNhouu2yqVzSyBZdhrUR1ic+63Gy3nnaYPGxubz7TAxBOTOoLyzWmSBByuy3s3TVWZAzrnQB9iTTR/LM8AAqfKI2RXtudImQbiMVDqqanWojmVGJYm157ZMb0qoAJJVrWtUpHKFdAM/nq9QRu1eGiduP3UUCLVQin/uOSaqhOmsvBdnoFMtiFI633qjJyAjHbTpBWnC5kgjHKBaKpts1Ljw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700016)(14060799003)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wy8qouLRwYJCCgImITvTKZtKmYDNMu85hvaJZJhfhPno1xkNEwumQ6jsJLOgXuQzjUGssMF8WSXZZtCWOYePmJCl+Tx5/dDsYtTZO+IbZKwHDR75dN3VUNJ2da9u9m6/2DL9SjqhgSDOpYcQ2zUV5Ib8kAtR6eJ7rNKMEtf+UNu11OZ7DAVlY1r3hlKGYTnD8Qrw9Eke0pq3KIS4J48FpotIfbvmU7SjOAe84ErUlYQvFog3S8/fkMC+hF8vUBsieBVRee1HVzudDXvCsKQV/NgHYwP4tR4z1qqyWckCi1LWCPPsfsMse+7rk8uucfBGhX1TZVOJZLzsHwBDRC5fNEuLCwu0MVD8kpK+7XTJBYQayiLl0T/oLfTfzdt39nXk3lPMI4xmLZwEYS6yr86Qycpdx861rk+y2vXHamKD9/oHwUI9nmr+DRYxws6K6XV0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:58:39.5331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f488a1-e7b1-47d0-d56b-08de96e7bda0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9134
X-purgate-ID: tlsNG-ebf023/1775815123-B031451B-1C2ECF3B/0/0
X-purgate-type: clean
X-purgate-size: 821
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:Bertrand.Marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: BBE9B3D5515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

> On 31 Mar 2026, at 02:52, Milan Djokic <milan_djokic@epam.com> wrote:
>=20
> From: Rahul Singh <rahul.singh@arm.com>
>=20
> In current implementation io_domain is allocated once for each xen
> domain as Stage2 translation is common for all devices in same xen
> domain.
>=20
> Nested stage supports S1 and S2 configuration at the same time. Stage1
> translation will be different for each device as linux kernel will
> allocate page-table for each device.
>=20
> Alloc io_domain for each device so that each device can have different
> Stage-1 and Stage-2 configuration structure.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---

Looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


