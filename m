Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIA2HTrF3Gn5VwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 12:28:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D023EAA23
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 12:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281031.1564093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCEVy-0006Aj-JZ; Mon, 13 Apr 2026 10:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281031.1564093; Mon, 13 Apr 2026 10:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCEVy-00068Q-Gj; Mon, 13 Apr 2026 10:27:34 +0000
Received: by outflank-mailman (input) for mailman id 1281031;
 Mon, 13 Apr 2026 10:27:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCEVx-000673-4F
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 10:27:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCEVw-002gp1-GH
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 12:27:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcc509-e002-0a2a0a5209dd-0a2a450881be-24
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 12:27:32 +0200
Received: from [52.101.70.2]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcc513-fab6-0a2a45080019-346546027e76-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 12:27:32 +0200
Received: from AS9PR05CA0336.eurprd05.prod.outlook.com (2603:10a6:20b:490::28)
 by DBBPR08MB6106.eurprd08.prod.outlook.com (2603:10a6:10:202::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 10:27:24 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:490:cafe::a) by AS9PR05CA0336.outlook.office365.com
 (2603:10a6:20b:490::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 10:27:24 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 10:27:24 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM0PR08MB5378.eurprd08.prod.outlook.com (2603:10a6:208:18a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 10:26:22 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 10:26:22 +0000
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
 b=xjXmu7MXM/Ai+pxaEtVgztm0ru+7/MdTGYAAfDI+gFzbz1uRjnnOBsIsoUxdurR2VBWbRgqqXbrP4cc/H8Yy84HWxwy8yndMwxcCavlVBcUCtjpSHO+th+m23UxpeDJn6jRaEcycbDGYJgp6ZYQK8M/X5Q9EJwd9jeyFA47ksyce2Lb+5vbyfJ1I3YqVadOhykV4KWwVEggvSgwaPIR85N/eRhmVfz6FxvP3ZcyWia6OEi1Gr72+CVRXJAxArrJZC+KRAuuAEnL7gXlzHCO6cDkBPqxzxtBSD1BVlgOrMqJux4VP3lisONahp9ruJ/n7fB/EZc1x/CRevP+ewRTYZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4I4HNdN/6g9nZ6PILjXBmmgsJbnxoZP8aFuINqNCio=;
 b=qOyi/jiqM4M5UfDdGwijwa2MDUbZ7zAlbXdglbLdHIJnMgzIxET+17yPiPBsJAsFGQiG5FOVqbJlw06IvwA+EfoDjDT/pAg5gWnYBRKQfLeV+TRY9KAr2wnePYZEAOALyxo5Xs5fxcjZL1KfPLuBkbK9p+yu4EWjGQmjNrBm6nKf4i8v1km91v5CBTKG2gO4gITqpf7z9+PJvjOxu6yvHXkwrAMbLZ6qUFxy/3MjHBAdWjdKNpeFcKwt/oftjsCAno2uKCj/tSvQGsYA0KyCOSWqc/8U1tHpIlgg+tv1QgJHhS0Vp26039yImBzm27AM9c/Cf/LNMuHLAR6nWWBX6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4I4HNdN/6g9nZ6PILjXBmmgsJbnxoZP8aFuINqNCio=;
 b=IdMadFs+4k/g+rUWFqSTMMPTsFWF5DvY+ssaWXD40wOKnC3vaCNY2o7OwJwkMWnMqMrpFHA3daG+xg1IXlp/6BcQ5MtqvKxn6KyIeQdRIgTymtvTeVYNBDChFGeAtiq30zJIcJsiUwfgwdi3o6BOhr1W5SlfMikR8QCGCel5qWI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5WvKGyfV35skksy/8/cDEpNLabKsMGqEsGpmHPmE3peLaxTs4u6BbEGO/9JzmfAhp/s7Z2zjaWdvDyTDbyg2P3wVMhoxsIGkyJihriTQiWdbiLqwhPGPHsOzDYMtTZ/ZJ0HG0xp/Ht3pgUdrqZ+RGIfe4MEP0JI2IDDbeaP1xkU/Vz0j0FucqB0yTHDIndkvLwXUywEqNTSTBB3LjtVOrv7HnXf/vs6hWEuWa3MnNVT+ihH21HezZd4/DPLw1E+/M3f073bLDrEfiuFr4Ux6yU9EayHxPVch/nNP6dBjFN7LShtMIjbJ4m46o9rqFTMjUWmhOuTH3NXYXRlkEJ0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4I4HNdN/6g9nZ6PILjXBmmgsJbnxoZP8aFuINqNCio=;
 b=EI3toym1kT/IFgVa3P7XRkgGhLdHjQ9QaO/LUlHs8Thc7RvZN376Q8KuNKGuXIF4GZX9n4pRmJ3nQLbOxRvwesr0PXJ7GCB8e5QoSUuD/VICMgSYnO0WxONY4Mur9srNtZjIuWcaQYs5cUKittmTmGq1n4DuH4WoPGY4BIyO9zOWTXu8gSHwyIgoJfspk25bob8NkjzVkiwWQ6LHZrJdoD7diAr94RqBhIojDLNig2oqBwYR/RnQ9AL3YbvICW9PT7TKLvx4Z8DEUCZbYbLLAuV5OPKbUo9nnwHN4zZUTrZysgCmVlHkkGy9mG/drtJWAOqZJryoAkvZpAK2uDfiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4I4HNdN/6g9nZ6PILjXBmmgsJbnxoZP8aFuINqNCio=;
 b=IdMadFs+4k/g+rUWFqSTMMPTsFWF5DvY+ssaWXD40wOKnC3vaCNY2o7OwJwkMWnMqMrpFHA3daG+xg1IXlp/6BcQ5MtqvKxn6KyIeQdRIgTymtvTeVYNBDChFGeAtiq30zJIcJsiUwfgwdi3o6BOhr1W5SlfMikR8QCGCel5qWI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
Thread-Topic: [PATCH v3 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
Thread-Index: AQHcyy/51+T36BIjnkSypQJ5KiHeEw==
Date: Mon, 13 Apr 2026 10:26:21 +0000
Message-ID: <B22B467B-C747-4070-B40F-A8297AB9A3BB@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <059c718f5407b845b84ec53cdc3ff021296d8bf9.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <059c718f5407b845b84ec53cdc3ff021296d8bf9.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM0PR08MB5378:EE_|AMS0EPF000001A6:EE_|DBBPR08MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e29222-62e6-4b75-4fcb-08de994740fd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 2ofFCddXYY4otPYFlk1QoTqa0UAxh0FoxDnMjyJSfpwojZ96aaDsipHDwFyFWoAyl7V+CHWRJytp3yHNS22zW4jQo0OR/KKxGgvrOPn8n68aM7yXDKVDZX3FenL+i8MULodIonCRp7OhmRO05yUgq0HFppy8gquHT9+8XrtDyM0W+58oly9A0rv/nnX6Ir9kjNdSGvNACnM8nH9P8F6eISASsQ98QOiFeh0cIqBgd4DlIlNY4RyhEvvHTZSG3LuHA255Y31m8js1VpQcalJo3AiF2UqMCWklRnNUlGAJ7a4PG5cnPFg+wu5j4zapkjfKLPmZbmvWQmKwLSqDUDrbrCrpUlO0FJUmgdFeqTmqum1XjpnW3nTE9Rwy3I0nfaKSjTZyoDn7q5YiY7F4zK4ocVXHRAmHpcR3p2uf8rjnBd5iEBV7QHzTRfEZAnWL/c5HB94wzA8wSONAPNIC1s4IhUam6+zAaAfURJLDhN0Awhmv14Ai/ti6+FO4HylwTX3ocXDgbUxkhTUL34q8pXGnFCjkHv2djOxMun+K3Y3zHsbVEkPADneqzQ4KhqL2fPWTjmDoqCEj9yt2koHZpwGar7Ij6tFOZWVHPz1i0h23jJ0wP/spWUVhCVnKjIDdBtQuOwgUHrM8xITTKegACC3UIr9mEXG2pV2N2sBTqqHCdrdbfynWEVXT5w87Jl0IYChMHK0W0cSZudoScPwFCyMqR+7eTAIz60EClR3QEw5u6OJCyaRxld4iAZHksfu5UWYQNGKY6nv/d+6ExzK2PKq7STqdX3THVqmT3zvjKE7UYLg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E18FD225A71C774F8A9459111CB585A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 rk0zU4OBz73hVaoybMKuSOL0YH2gjMZ6GNjrjn1Q00Id0gCJdGZFRvjPYF1TXpg2KWQYDMmNHl5Td4aEWiKm4zPhAbiYLQkL3tN/4L+jc0za2qnKW2Mi8zVbX48W4pHGlyfc1CzQiVTee/MKO9Ya/0x9BzuYzuPGQM0bvfTg5QxVwvMEPyJ/nBGBXw8lU+VJ8gtowUwUTIuG8tug3K5GcrFAPTnc2EGQOhEeEtIecCnxrUiNI0mS/xa7WljY761f69hdqCQXFcJpwBurcL3LpGgnBXKL0OcF1JI6ce/LpmDGS9qGDfXOPw0DQb+tD61m+8ypB4/BJyqazSXzTwgCpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5378
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3369cfe9-96b8-4057-81ce-08de99471bb7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700016|35042699022|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TVwk8ekQFjb2EntsJzKk/tWkaMomKewMOPJYHNCpCIwDT/TS/3T5gGa+FfvOl+Yhu+XpJ/lCR38vpxAyTDjxkvlqJaakdEsuGrtuk/F8/M2k1RkFr2t0LZiHEAf8XKhghs71QVPzFrVl+y+2K4AviX0LwAOzkdstIHty1k3YCHOuCsDsbuyoJQWuFL4eXNQwnS9E8Aci1cfPhMK/TSRiE4DUNUDBMQspjj1Pz+ZGoO+rUxpPbkkEXYaIo1tSqzEfHFT3poAhRHvfbOb88iAceY1tuxidwBx9F+nW1dMUj/VWJGtlO2er9Tfpf57dPoI9Ddrr219R0vNlHJIs6h7WMviIvo9Vu/6lCXumngGdKvK/57RBpmDLfeK08XMvFmm5o0wyujjE2qmFIQvL70Wf951rn+q++Q/Z5TJ1rbl6kFa+036QlyDUGh43FnAYI8Iqs09ZF5j+Qv3rON/kTAQBIjuhOp7lrqoXHwNBOj0/Emd2DeghY6hlIp8VrqKaTeRd1eMw4zxAkwYXUymUV/zBvA8SZ+PQZ1X6t29GYisjV1ccE+KsENpoGgwCQGnS5JqXocWely9gSfqm04/tbfx8XSoiaP8BrNLasLDdx6vWIlM2xcxeMwHOxxc/b/LG8CdPbcstRxrJW9Jz/D/LOncmCDmJa6k8nCZCHPbXC4KlUkMA2qC4ZNzN/BQpfwXxvYSyr5FP3pTmUPI4q+kAyxf3BWJTBBWZqkU+Kntj+SVjiw7IM/oldzwN5nuXbkduH5/vjl3UpU5u9enJsxrvO1K90w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700016)(35042699022)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N1CxGByKa1Z8/q3JjoBaBRJ8w0YvEkXJTrP3qrxdYfbgO7i4S/YXtoC11FPSwrqiBH6clbtOlWePDi4k//uZIyOnTRnaiJUCgYagrF0fwotLVYZLfeVFO4GEzVeAzVQ3wk13Py/c8BByJKoMxg5gA3Vtnwc5dOh1I1KfiNgRbnz0orLdKezPOKxYQ7iYBmvAwxZAUaXzAsNZFw0mkf1sGWrmTwxaS6WFfPWLR21KELoPV7BKh3dUKFP+Mva9SdF6jmkNH5qXN08nKg3Qtoh7IxuQuGO6w36A+IrFlz0YVJWyDRsOrczhBXyTcuTLKxiM+9n93HT/w8rkDKMfzeoIAjpq1K3rv6A06v344JLa/ovyLVg3XzrR68WPqm4gwK/joT0bWcOZivY8jppIFgQT2K6VW7j7iju1FAPB/jwL5URoEs2kvbUEwd/jSKpIDWru
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 10:27:24.4187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e29222-62e6-4b75-4fcb-08de994740fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6106
X-purgate-ID: tlsNG-c1860d/1776076052-75557497-BF3F65D6/0/0
X-purgate-type: clean
X-purgate-size: 5116
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
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email]
X-Rspamd-Queue-Id: 98D023EAA23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,


> On 31 Mar 2026, at 02:52, Milan Djokic <milan_djokic@epam.com> wrote:
>=20
> From: Rahul Singh <rahul.singh@arm.com>
>=20
> Attach the Stage-1 configuration to device STE to support nested
> translation for the guests.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
> xen/arch/arm/include/asm/iommu.h       |  7 +++
> xen/drivers/passthrough/arm/smmu-v3.c  | 79 ++++++++++++++++++++++++++
> xen/drivers/passthrough/arm/smmu-v3.h  |  1 +
> xen/drivers/passthrough/arm/vsmmu-v3.c | 18 ++++++
> xen/include/xen/iommu.h                |  6 ++
> 5 files changed, 111 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/=
iommu.h
> index ad15477e24..56bc9314a7 100644
> --- a/xen/arch/arm/include/asm/iommu.h
> +++ b/xen/arch/arm/include/asm/iommu.h
> @@ -20,6 +20,13 @@ struct arch_iommu
>     void *priv;
> };
>=20
> +struct iommu_guest_config {
> +    paddr_t     s1ctxptr;
> +    uint8_t     config;
> +    uint8_t     s1fmt;
> +    uint8_t     s1cdmax;
> +};
> +
> const struct iommu_ops *iommu_get_ops(void);
> void iommu_set_ops(const struct iommu_ops *ops);
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 87612df21d..cf8f638a49 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2810,6 +2810,37 @@ static struct arm_smmu_device *arm_smmu_get_by_dev=
(const struct device *dev)
> return NULL;
> }
>=20
> +static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
> + u32 sid)

I think this might be wrong, a system can have multiple SMMU and the SID is=
 unique only
on each SMMU, not on the overall platform, I think arm_smmu_attach_guest_co=
nfig should
pass also the smmu for the selected sid.

> +{
> + int i;
> + unsigned long flags;
> + struct iommu_domain *io_domain;
> + struct arm_smmu_domain *smmu_domain;
> + struct arm_smmu_master *master;
> + struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> +
> + /*
> + * Loop through the &xen_domain->contexts to locate a context
> + * assigned to this SMMU
> + */
> + list_for_each_entry(io_domain, &xen_domain->contexts, list) {
> + smmu_domain =3D to_smmu_domain(io_domain);
> +
> + spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> + list_for_each_entry(master, &smmu_domain->devices, domain_head) {
> + for (i =3D 0; i < master->num_streams; i++) {
> + if (sid !=3D master->streams[i].id)
> + continue;
> + spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> + return io_domain;
> + }
> + }
> + spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> + }
> + return NULL;
> +}
> +
> static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
> struct device *dev)
> {
> @@ -3022,6 +3053,53 @@ static void arm_smmu_iommu_xen_domain_teardown(str=
uct domain *d)
> xfree(xen_domain);
> }
>=20
> +static int arm_smmu_attach_guest_config(struct domain *d, u32 sid,
> + struct iommu_guest_config *cfg)
> +{
> + int ret =3D -EINVAL;
> + unsigned long flags;
> + struct arm_smmu_master *master;
> + struct arm_smmu_domain *smmu_domain;
> + struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> + struct iommu_domain *io_domain =3D arm_smmu_get_domain_by_sid(d, sid);
> +
> + if (!io_domain)
> + return -ENODEV;
> +
> + smmu_domain =3D to_smmu_domain(io_domain);
> +
> + spin_lock(&xen_domain->lock);
> +
> + switch (cfg->config) {
> + case ARM_SMMU_DOMAIN_ABORT:
> + smmu_domain->abort =3D true;

Shold we change also smmu_domain->stage here and ...

> + break;
> + case ARM_SMMU_DOMAIN_BYPASS:
> + smmu_domain->abort =3D false;

Here? I see arm_smmu_write_strtab_ent() uses it to select
s1_cfg or s2_cfg configuration

> + break;
> + case ARM_SMMU_DOMAIN_NESTED:
> + /* Enable Nested stage translation. */
> + smmu_domain->stage =3D ARM_SMMU_DOMAIN_NESTED;
> + smmu_domain->s1_cfg.s1ctxptr =3D cfg->s1ctxptr;
> + smmu_domain->s1_cfg.s1fmt =3D cfg->s1fmt;
> + smmu_domain->s1_cfg.s1cdmax =3D cfg->s1cdmax;
> + smmu_domain->abort =3D false;
> + break;
> + default:
> + goto out;
> + }
> +
> + spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> + list_for_each_entry(master, &smmu_domain->devices, domain_head)
> + arm_smmu_install_ste_for_dev(master);
> + spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> +
> + ret =3D 0;
> +out:
> + spin_unlock(&xen_domain->lock);
> + return ret;
> +}
> +
> static const struct iommu_ops arm_smmu_iommu_ops =3D {
> .page_sizes =3D PAGE_SIZE_4K,
> .init =3D arm_smmu_iommu_xen_domain_init,
> @@ -3034,6 +3112,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
> .unmap_page =3D arm_iommu_unmap_page,
> .dt_xlate =3D arm_smmu_dt_xlate,
> .add_device =3D arm_smmu_add_device,
> + .attach_guest_config =3D arm_smmu_attach_guest_config
> };
>=20
> static __init int arm_smmu_dt_init(struct dt_device_node *dev,

Cheers,
Luca



