Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOIPDttb/GndOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 11:31:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F364E5EE6
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 11:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302465.1576397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKv3z-0006Pq-A9; Thu, 07 May 2026 09:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302465.1576397; Thu, 07 May 2026 09:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKv3z-0006Mp-6x; Thu, 07 May 2026 09:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1302465;
 Thu, 07 May 2026 09:30:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKv3w-0006Mj-U8
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 09:30:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKv3v-001SeF-SF
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 11:30:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fc5bad-e002-0a2a0a5209dd-0a2a4508b39e-26
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 11:30:31 +0200
Received: from [40.107.159.63]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fc5bb7-63b5-0a2a45080019-286b9f3f7fec-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 11:30:31 +0200
Received: from DB9PR06CA0023.eurprd06.prod.outlook.com (2603:10a6:10:1db::28)
 by AM8PR08MB6371.eurprd08.prod.outlook.com (2603:10a6:20b:363::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:30:28 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::17) by DB9PR06CA0023.outlook.office365.com
 (2603:10a6:10:1db::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 09:30:27 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 09:30:27 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV1PR08MB7705.eurprd08.prod.outlook.com (2603:10a6:150:50::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 09:29:22 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 09:29:21 +0000
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
 b=ywItyRWs8mLjednOxDgi+S9opn5CJZW0rib3Lny9fRJj+sO48qJFw2B2Sja6KrGeIi1l/CzVDDNmyGWvSF5pBzMRh0HIPbur1JXbAE3lycL8VX64To0ffvoBIQV4rzAHL9yMWGqBJQLqH8MT88+7pSfHaitvQV+ld1cnYwIkQ7REEcOm6qJDcGTUN2YINnNwGb7y5oFVRYHRyhoO5oTqJnWLV9cxPn+swAE5WnCbqW601ntO1AVf1PAyCjLWGEsK1dNBznvTPhbmBDvEAMnngEptMkorUfdmHf42SiJ0DdKZF8H7FdfJfzk4mcxa91thcC1lSx3DqScq7LFwsly93A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kuVMe6Rh+0uG0YF+9e1lDO+8hhhS1LiWXvuS+5qEQc=;
 b=n1eTg7N6OS+8kaK4Btfj2KjCY7VO71UHI56R/We6iQVocTqcA5V+3wT1H2WJVMBG0dywCsrSaghXyUpDoSLlttmYZshKqlN5kqTj3Q9FeT0BMTbMAmYod3zC/LLx1ZzlOdqdoOR9pwCc5E5AXVA0ZPIxq4p68C2IrWcKKLe15PxhpJSS+N1porwKmnxOUXN6AqjmleBBLts7hYuMuCX1vgFrOcX0n4OAar+SH2KTtwHcsOijS3ePnCB3QtI9aHT/agqpJlMqKaRpj4pEbp7THVLDViSYSJ5I43avA/WQAAlczeVdXZNTZRDIu/UqcuxbWg1GGPfR4o6KIfHNmW2ouw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kuVMe6Rh+0uG0YF+9e1lDO+8hhhS1LiWXvuS+5qEQc=;
 b=SaidHqtxVj24z8sxorNKnyJD8yUB6x+ySc6svvanENJpNG9YOxO0h9kyf9DmxO8gwaOXHzExdhUA7iVAIbWJG7stj8NiEn5K7ggAphkqXr5gqqxBZ4FkDrHqnZqGLNYWEQfVbIiXsmnjblVzVOG+KP53Lk0cEOEtY4Sg/2WTWeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMPLd0S0KLVM1tvW1Gh3IXB4iSp2dck9RnHwforfq7RmBqV14BwXba6HvZJbUdAweKpoTDDZEp6Z7FKZMnq9VC0SFykD1m3zAk+y1zp/+AnNnSVmekm2HQb3VktSus9TTiGXsU7lOOoH5qX7+jhd3mKqyE9A2EMdZaXkS2cFcdfaVp9wZnot8NCFHbudjls3xlNXqs7mGv1yfhPjqTGhKAgeTZtDn3085d87DmiASlwpoXQ4R5KrLFrCZlvq5n5tMzqikZ/LxWrIFP6NK9xa8RjRsAIfjuS/pEqnS7cS0B5j6p5OSu0RQ9ZiQ42WthTLh9mXnvADhvEJd08IOar0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kuVMe6Rh+0uG0YF+9e1lDO+8hhhS1LiWXvuS+5qEQc=;
 b=moirN43yw8zBB8DXZmDU2PMWcdvMxDXDddGs5GEeYkbz13Xz4eT6HbkKbBah1JDURxB5/Fo+1RSCYYztWzXsggFqPfacW+XjtLEKf6tLpI3WcUoz8ncK6fSV5GYrsNiSQ6qUyR9gkWC0XeEC9ZCdkWfSJjetstmduQxFxPVtmJ83g2+H4ITlhz1ayGyLXggc9wSpw4JMcqzpHlCzzPheqhDCSmdqbP9yFArmRv5y4T/hqg9GGLstEnpKYGeLmjrix5Z3D+T4Mxic8+FZUyGNYETuBmnxoO/FujY/HqmrXVf2YwXFzi2ByzZEIHjc015FpMwFmRmhHde+UzQ+ke2gfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kuVMe6Rh+0uG0YF+9e1lDO+8hhhS1LiWXvuS+5qEQc=;
 b=SaidHqtxVj24z8sxorNKnyJD8yUB6x+ySc6svvanENJpNG9YOxO0h9kyf9DmxO8gwaOXHzExdhUA7iVAIbWJG7stj8NiEn5K7ggAphkqXr5gqqxBZ4FkDrHqnZqGLNYWEQfVbIiXsmnjblVzVOG+KP53Lk0cEOEtY4Sg/2WTWeA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Connor
 Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v5 04/11] xen: introduce domain-layout.h with common
 domain_use_host_layout()
Thread-Topic: [PATCH v5 04/11] xen: introduce domain-layout.h with common
 domain_use_host_layout()
Thread-Index: AQHc3f/IrjCU4ATePUuKxl1rqHU0O7YCS9SA
Date: Thu, 7 May 2026 09:29:21 +0000
Message-ID: <361DED84-DEDD-4915-9939-FD5A0544A52E@arm.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
 <a95e0968d4213a07984ac112c178ff72d03eaf96.1778140240.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <a95e0968d4213a07984ac112c178ff72d03eaf96.1778140240.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV1PR08MB7705:EE_|DB5PEPF00014B9F:EE_|AM8PR08MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e288167-6570-4db3-fe81-08deac1b4669
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 MauVQBOazPv6FjPmFQ57YINQjt5kCj4UWK2pLxPd6CddarwtwO49I4OQSfxjg2kuf2VrRyezjJy9B7GMLSvexhWZxZGhPL2xs10C0IaOyLKpatYRhcFlzQiGaJRA4fVU2raMraJOdEn9Iz3gg9F0961xp/vk8Dh/NIYDqyZo937HLOWWmWeFinA7oi1RD8Lmu6LA/0wC3poN4xn8ZQUJ6K18NEnL2O/ftoA0XJoJLRRQ4nexiREf/I1l/90Uy01shw4O5R0rpp20lmcWPVv3D+l1YsN//oHI1qmE3cpNAayPMQpdCGfgtG5phuxE6ZzU/q/QFMzFYLjX4UuVGFNr6ZPeSZdaGVEjy7RCsFmHocSra4K13+rRU133CtfgwJH1hDulzST+h8QJ4SVLgvuzGlfNtF+aUBWTf5MwbCnWrQgMlD3DnN9WYHH7qGsiPtgE2vqHReQMZHa/HjFUaKgI+NxEa9FtYsa6tryjqeLZ31EV9haR/tLMXsXkL13PcJnFj/zMNqqyvFo9XKwpdCBu6MvEErJfvTb9jvwpuelL86+RxexNy5NdJJ462UUHk3jimMkYuuuYZzjPLTOS9stKiTrjaoP1FtoN+iIiLAHzPxrlBAAe0gGgp+1EowO2LVy8Axk2A1p5ZaV34aazNN8VUiu4PegXPwlCve0Emz3gnQ0hP/wY9NtB+nFCWQcDXRjeX6gzbBWKD9oZLv+LKrqKE8UCuz5C5BhfQ5TKOX0dXZpTonL9kisWCm1xT4dPexxl
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A976E52C2A4D4B4FB0A8EBCB1D3E7B82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 tgKVebhK/cKXHqQAFLTUYhJTnYFAb6d/VTh90IeIydP01lMoYkyCpEmqLMZrWwOK/1CUyIhw4CqkqlqEFPcS+j+4hcjz2CRtaGmTD+FGVTlO/Xu3wp8tYvPuD/jDuDcGAv34p9T/sNsOKv3Roh6RLFbwhDiTQCWmXNP6NPuxf2ig3oRYDMPBqibyFDCVbzhExk0slN284qYpSiy8mSLhVhzgJIBm0nH59nmb+nK/LXlQOkl64SdakQGy4r5P2b9RBluMbIpcV8Sv24+/AYQYYNY/sCb5Ez7eNpLXxQf8I/tjBOH4SObRs6htxY2CxLySFluSAvuY503nV6Tzifu1eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7705
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	728216a1-10ad-46ba-e826-08deac1b1f16
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|7416014|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BQUxNDoZTntav8SY0O7pFiXugiMbuAbVthVtPKWbcbCoO5gpPEnqQJt89XPRkW/KMPnt55ATZguibDPTY4hEod7vAyLYmPR3F/DpdjbkCI11wr2iU5qR9Ivv3LqIRtqa55U/hXRJ/m8JJkdogEEbNIS9dmu7TlWuhpwg/QSc31fGgx/c3mW2dS+5AOGP3FwGz5qSvsdYmi3wgwJY4+QH638iWKkUr6nnEaphxXNUlZeehO62iSZAXkipU45gQiHacpZLoRi/z4qYEWvww9vRWaCf7rf5SPfFcFP48s7UxsdCXWA0q3Bnw16ckdAurI8YNC+AQPZGO4gNp3qaIGqiOZ8PT5QnSebeRyc0aHQjL9xiiA0Mrdc/sKJjzsdeqsiFcXl4btRhImPfcRPZcM8wiGoc6AI5iZP8/cibzioKF3J46vH3mN/Jfb8q7rU7YAva7G+08DKaQlb29ELdV7WxAA27vOnOadea4DBSNIwZI0475Ypu/CbJ1BCi5nHtmuMdxMuQk9ZsKcnmeS9cjUf5AvKDZIimnj/B+7j5kHgowauaY1DvDV7Ym1ErjHD8TrbaO705d5Ot06bE3LY57M9Eb1eWJTQYPgrqqZCR8OGV5Wr9oe/2aash7Q0ZVlLR0OT5Vg9VJlMiJz3BGHaiD2e4HzvaM2+eLxiD9JjqCtxJYK5/KcJdUpDtDv67U+YIxFRipVxV3nbQHwyf/so1GG4YZUVwcVxKcgtQutuht5ZIAcBA3oyF/tkUlShipylQG5QK
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(7416014)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3mP58v/x9/4otTsX7GEm8aO6Qaubcs5BG9GagnzkvROPmu0cOfTgpTmjtQkAMwlraIHJArUdtmz7VNGAqklq3YF8o+hpyScUTPvjKw2Q/wfejzGVjjPEP64XcRipezQ6SGbUtQseB/RBeoZTl3F0r1h4HHy3yDhV8FqmufOor2ITm0h6ocSk+AD8Q+Q4wCTcb605wijhqHatI6Qa8mu4yfFSJrbIdD+0rym0pb8qSPDWk9rLRRUCwYanNy5ZgVGi1QNUygUrlmGavB1RqI1fKDrFmxqzvKWxe/Ii8VflIUBbGwMcyHZJGXx322tK/CkxSYT2o0gYviG2vdVSAz2yv7ccM6DEOGqRQVVgJiY66IeoOFx9EdYsUujDd2QrVedc7az/Xq52sHDHdzsPeWaBAq87PCUpOrw9fwBK3n0j9Mat9c+0zGJCEx+k0otIROA4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:30:27.7630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e288167-6570-4db3-fe81-08deac1b4669
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6371
X-purgate-ID: tlsNG-c1860d/1778146231-C5784DB1-EBDD28A6/10/73395122804
X-purgate-type: spam
X-purgate-size: 1972
X-Rspamd-Queue-Id: 72F364E5EE6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lists.xenproject.org,microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com,gmail.com];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi Oleksii,

> On 7 May 2026, at 09:58, Oleksii Kurochko <oleksii.kurochko@gmail.com> wr=
ote:
>=20
> domain_use_host_layout() is not architecture-specific and may be needed
> on x86 [1]. Replace the ARM-specific macro in asm/domain.h with a common
> static inline in a new dedicated header, xen/domain-layout.h.
>=20
> xen/domain.h would be the natural home, but placing it there would
> require including xen/paging.h (for paging_mode_translate()) and
> xen/sched.h (for is_hardware_domain()), which would introduce circular
> dependencies. A separate header that callers opt into avoids this.
>=20
> Adjust the implementation to take paging_mode_translate() into account
> so it works correctly for all architectures, including x86. Some extra
> details about implementation [2] and [3].
>=20
> To avoid the following compilation issue:
>=20
> In file included from ./include/xen/paging.h:4,
>                 from ./include/xen/domain-layout.h:6,
>                 from common/device-tree/domain-build.c:4:
> ./arch/riscv/include/asm/paging.h:17:48: error: 'struct page_info'
> declared inside parameter list will not be visible outside of this
> definition or declaration [-Werror]
>   17 | void paging_free_page(struct domain *d, struct page_info *pg);
>=20
> add the forward declaration of struct page_info to RISC-V's asm/paging.h.
>=20
> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602161038120.3=
59097@ubuntu-linux-20-04-desktop/
> [2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271742400.3=
148344@ubuntu-linux-20-04-desktop/
> [3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271750190.3=
148344@ubuntu-linux-20-04-desktop/
>=20
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


