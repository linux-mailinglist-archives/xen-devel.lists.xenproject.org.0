Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rJQDKS/tBmrDowIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 11:53:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94054CCC2
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 11:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309805.1580852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNpEU-000305-TS; Fri, 15 May 2026 09:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309805.1580852; Fri, 15 May 2026 09:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNpEU-0002yZ-Pl; Fri, 15 May 2026 09:53:26 +0000
Received: by outflank-mailman (input) for mailman id 1309805;
 Fri, 15 May 2026 09:53:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNpES-0002yS-H3
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:53:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNpER-005xbT-Pz
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:53:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a06ed09-e002-0a2a0a5209dd-0a2a450b9a4a-26
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 11:53:22 +0200
Received: from [40.107.130.25]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a06ed12-212f-0a2a450b0019-286b82192bb7-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 11:53:22 +0200
Received: from DB3PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:8:1::44) by
 AS4PR08MB7655.eurprd08.prod.outlook.com (2603:10a6:20b:4f1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 09:53:14 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::53) by DB3PR06CA0031.outlook.office365.com
 (2603:10a6:8:1::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 09:53:14 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13 via
 Frontend Transport; Fri, 15 May 2026 09:53:14 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA4PR08MB6045.eurprd08.prod.outlook.com (2603:10a6:102:ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 09:52:11 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 09:52:11 +0000
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
 b=PlsCjB8czbVq04FTY8+1iBakKbDb9N4ZPq+E+Vx5Eh1yx6iVCmZovQvaPBVzTUUzffJOI2pI7ZwEWBY/sYt4fg8ulwtqURExVZcVKIrDvJicWuvGwxOxf4I9BJ6DUxFnwKHwR2iCZpQTKDA0xa29CQZ9MlfIvENFxl6lZpba1oevXAmHSSvThKH8WrVJCtxSSbspRaeO6S3WAJxNlbK/9P8smE8uiPm3yoXRqcdVeZ8rX6Jsy/ENgxeDaGPhS2XMOmCO0Xa28W7TGecP8TRDH/h0wZ++A2FzMgq13pnvd4GInqtXxipof+T1XDWjDh4fAxb2qm7RjJtf3NhH30MiKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8/52lj4JqbrZVaAay0Dp2lTfajKd/OUEFnUGw095J8=;
 b=v5HS03L0gG2AGvjMuM7S1Nx0PwZdrT5IQi9oj1mHm910+5MEcEIuKW451xP6Tdez82tXJTQ1cpv7ezxRbwdsPIp4mf72gdG0fAsHY++ND5xOPAywKz9wFiOm+UdTeTfKfhnf55InQPTaXnavbUX/CYq/ZeNXQnEQWmfiep93CtdvbidLFkC0uV8XYA30p8moVsceo9f3XvvcQYw0flX/dXP7qQcOYuFq0nWYG7PJ4B/gFfymTdJzqG2KvYlWg9Ogd6CVZFVx6w8JbHdsUgXQxYjw2N76BghneEnRiP97Mw/80eGiOR8cbBMETiACkbpv09zlOKQ2ubtwU3zmb8pGGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8/52lj4JqbrZVaAay0Dp2lTfajKd/OUEFnUGw095J8=;
 b=nPN+AVJ2HIL05ffWgVeCHMwiqr4EzuWVe6PYvlCO/NkJJcPDVCk65xuFYd2p2RxS/4TSS1jMKXfPlpyJes1wODRrjOypnfOB52KInhCt6v+AfmP8UOkDAqeOrWmEHdAl1FSRqv06507IQLwnltifZ48uX5q8aQC/OBl/lRuweR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIMmB6zKLKeQsaq/V1EawmR79mm3QR0hbDjE4GQDSjsTWh/3dKNpBSd8BbKXNFpcN8jLXPrgpDD97gGZt6VoOe+zyvVYt4WFjfU7qXwBmgUNqig6TTaKNMQJlvNJLIg1+GxrwfkA2JUC3GGYYlbE9n+T3W5Sbmpih42DxbzkV2qESiRAMvkCabERt61XydNPL593MDi3keVIoQAqkvw9Auk2kZUdooSH9LjwfNEGLKN9uruAPVYDz7AxO+IqbgYu8F5qKbfGi/mxIBb6Ldembl9AAhKm1mOAjnnzgUgPUW9WP5VcbRbzeeHgX8N8q88ikGdAZ/0uanmvB8xjnglfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8/52lj4JqbrZVaAay0Dp2lTfajKd/OUEFnUGw095J8=;
 b=QQEQBgcrOm2NFOUbo0ns8O9YaPSn5ZgXws4wzOAKd0Bomyhu1KnndBCs/IZ6vb0F4Ly/9yCVgvsxHxQYqsbSDbuMkt03SC75EIg/51+qxkRDY6aa3DK/bjRPQFUTlMR6iGeVobFIn8I03Vvf2In62/2vm9JTZOPxxlDZAUcNqcgiejx0ca/xPWMdtOigZqGyG9S9b1buk9SFXMYpuWQkwAGuyBkO1mAm3u0V68Z8XgYktYhE/QxFwXdv+ETp9lronffHbohP/zQ1mNR6z0GJbYNodfYfQ1KtiHKNV2vNlPYm19XeSTgnP9r5E7gkEFCAGOGBq/HufhTezyHCAQJtOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8/52lj4JqbrZVaAay0Dp2lTfajKd/OUEFnUGw095J8=;
 b=nPN+AVJ2HIL05ffWgVeCHMwiqr4EzuWVe6PYvlCO/NkJJcPDVCk65xuFYd2p2RxS/4TSS1jMKXfPlpyJes1wODRrjOypnfOB52KInhCt6v+AfmP8UOkDAqeOrWmEHdAl1FSRqv06507IQLwnltifZ48uX5q8aQC/OBl/lRuweR4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v9 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHc4jIxK7EE6l+HQkWYC60FHhQX47YL/3OAgAK9pQCAAB9fgA==
Date: Fri, 15 May 2026 09:52:11 +0000
Message-ID: <1142B5E5-961F-4CD1-B70F-88630F0DA8F7@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <613c8d67a66924ea62c2436dac14708d939f6784.1778605274.git.mykola_kvach@epam.com>
 <8E531A25-5AB5-41CD-AB61-C426C58C8E1C@arm.com>
 <CAGeoDV8aKWLKVZN1oz4cUoaZbXX39q4gHgOp=w=0zPhhaN311A@mail.gmail.com>
In-Reply-To:
 <CAGeoDV8aKWLKVZN1oz4cUoaZbXX39q4gHgOp=w=0zPhhaN311A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA4PR08MB6045:EE_|DU6PEPF0000A7E1:EE_|AS4PR08MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 2551a3fe-88cc-45d4-aa16-08deb267c850
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|11063799003|4143699003|3023799003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 ww4ysfNKLn6jQ5UpkpMpSwK1J5+LFYOQ3OD2lBCkOaIJJ3gje6gdqZWMeRYW3Trgij8e7fA52lvB5w4psEUtCnigl01cyqC77pQxC0jUvAZYtCZKL4lPoR52J8i08aZCtgExqbeFErEJfcWHiutMuBe7tsZf6ttbUMkLjuw7IUS2KdpD0DILVSRN/zJfsQZqFQBXrza5tpF5ccMzOJSnQasHL/rDRopHepzwjhrGg0kFZMT1cKxnO0FY9bng2YedO9bslkm8RAGacxOfOC2Zxd3YL1+gTfQDBWal4mQsKLzuSM4oIramwxsPnYiiJKJufkHnSS4mvWq4DtJ7zkCDyo45wX3s1gS2+hrDf15dTibBEcQR5y4lYbWBqIYmqsVIPFD8gZ7J9dmogSK7d2HEkC85V7ljKYYjupB96JCoI3Vz3zKApMAan05LDhNcXaEa4IxwZr1ui1kBUxKlL0S3GbfkHq/v9EXw5dT7XtUfNGtRr4dKkRUmR0HADF6fUsjcQymzXEhvFmFgrgiWq+YcRVUkLA0PC6IALefv4P6RMnLNu8krpbhXnYu+zbGbeGnQBqJdMLLyq5uVILErKTL3YhcH7UVS28oXEuHBhSOLp3gyGhfw9MUjFwqDAaw1yc/NAJx7O2+JiWV9xvex8rYsof9qbjab2Jyl/cAACWtdWQLh0JKxfOmdz9dQ4eA4IGmqDifd+AtrnkMEjlzCD6yvTH6amVqN60X/pIq2prUmA/5ONPzNWDWqLLban17QlfVy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799003)(4143699003)(3023799003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCF51BE6C613914082CD4B8DEA29D8B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 KXQqO2wQdEce7VQhDMAMgt4TFz5ERjXG70XIBiSeHjlk7VLq4m78FDS8b6PkeI86eQFUwHE+LJKhQCGnfVQ3BDBuitw4ltKcj3sXYmoTbYDyitl4Ptl93WvvwEnobQDy4F/sWg86PZOwlYOeTLzgGh8h1FUwa4O82dKzt1LnRtcp8uQ2TBJ270y5D89c9M2Y8+zDVJr55zlxIskgHtigSj+qx5nAd8jLMr0xOL9KcJxi8rtOX/KqvzwU7AyFmQnSPfvu0wxeyhZM0+BfHxrqmDN3w9SRYJegUzZcZrxzJBjU9pCg2JILDwVZjrF6RBPNZo82lGZarN3dCVFP0oFe1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6045
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c80a6381-ec89-4465-bdb4-08deb267a2de
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|376014|36860700016|14060799003|13003099007|11063799003|4143699003|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nxN+NlHopwg+RPl4x2KxNlwrnWxa7foPdi/cn0VK5oANqovczrR+TLGbiASaKuMSkABGYPelmvAChzNmMFNNSqr/aMhQWcTNjoQBXZuc3U2AW67tOtlV98RbQv+eZqfXS8fyCwWGPDfQLbF5h1RQxQCzu7//s7PtyZeMczna6uGZWpm8wbov8xLkJgIz1Z7OIf0MR7d5cYtNLN3BYjH2eX65G1xqVcMBgcOF1fEvE1vZwuLEpM0Ixq7EqIYjFO9E/NpTo4F50g+sqJamOZPyzcOcVSiVlRHAgUfz0n54x4+aSHu21JS3XJ5Z98cDE37JaAR8p4fzgcW5GXgGGO0oSlD3StLTSChkTlNb6yXRIlPKo39xyqoHapIQIsEi91n6j7bh2EFRuRRFWZalqWRvx5t2fSE7WEv3zQYj/grSlAfumZMqY1QgykTMCHvfuKWK45UMdDJr721limC6vp4gH1FhqxDFnWH+mQF4SzEcgoa4tWtJE45vHpX7DYz/CQytAL0nczMqAOFCbi97iFlOYO7IkMfXpa9zM2yQs1+0Jq/ckJelQuV4yDF+VdCU0xpWNbctDNkg3Y8XKY1TM8b+zjf1bEu4lilGlZAz9PsagYXzO1LorJpxSVgbxQ+wWfZj++8CoFoN55EtxWck7YPwC2YmKOWU3VEIb1V102xVZyVf1twhn+OYC8YVjO6FtPxI3ryZ6ItFmm+UyfV2TKAJ5fI8xFRyFO8wv0RwXcYu6ZxB5WkNG/m1ToneVNxiDQEx
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(376014)(36860700016)(14060799003)(13003099007)(11063799003)(4143699003)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9XYJiZp1b6uDdoVzkrqpxhOz8jk6CPv66c06ubGeJqgzBTNz6o1hpOIZL/sBtf6jfIdZH7lsBCz6iXmoa5Ak62I3OsslUWOz2d7fVz7FAua+Yx6IRLHde6m6Ff9lXtFb+ZW3jjewteZRoanSuizHmPHshJLYJ+933HvpAUmuCYW6AVo/vEXDUMBJC6JyBIl4Fq/cKStosNxjR3shkRYCKWKK5yvgExH42fhfztgzHYAa/v1cB6KBPMKfWJo4vn+1IO/Jr4w7xcEIxzftfi9kijgIsPhH28yD6UDMeC8kJle2BITbTLfn164iST0h7njoA7qaf/UNQZcZNe39V3Q3MDc2WSmp5G1+jNBzV+JL4ujbYHdBsfwn9xJxqDMe/1svt/Rxs5auD/EZ0N+iIS+S2R33cibEg9sImaLYF0gtQDf9sQ5KCSdUHkgHGprjKtb6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 09:53:14.4204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2551a3fe-88cc-45d4-aa16-08deb267c850
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7655
X-purgate-ID: tlsNG-42698a/1778838802-21D85F3B-4191EA26/0/0
X-purgate-type: clean
X-purgate-size: 7858
X-Rspamd-Queue-Id: CE94054CCC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+IE9uIDE1IE1heSAyMDI2LCBhdCAwODo1OSwgTXlrb2xhIEt2YWNoIDx4
YWtlcC5hbWF0b3BAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBUaGFu
ayB5b3UgZm9yIHRoZSBkZXRhaWxlZCByZXZpZXcuDQo+IA0KPiBPbiBXZWQsIE1heSAxMywgMjAy
NiBhdCA1OjA54oCvUE0gTHVjYSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPiB3cm90
ZToNCj4+IA0KPj4gSGkgTXlrb2xhLA0KPj4gDQo+Pj4gKw0KPj4+ICtzdGF0aWMgdm9pZCBnaWN2
Ml9yZXN1bWUodm9pZCkNCj4+PiArew0KPj4+ICsgICAgdW5zaWduZWQgaW50IGksIGJsb2NrcyA9
IERJVl9ST1VORF9VUChnaWN2Ml9pbmZvLm5yX2xpbmVzLCAzMik7DQo+Pj4gKw0KPj4+ICsgICAg
Z2ljdjJfY3B1X2Rpc2FibGUoKTsNCj4+PiArICAgIC8qIERpc2FibGUgZGlzdHJpYnV0b3IgKi8N
Cj4+PiArICAgIHdyaXRlbF9naWNkKDAsIEdJQ0RfQ1RMUik7DQo+Pj4gKw0KPj4+ICsgICAgZm9y
ICggaSA9IDA7IGkgPCBibG9ja3M7IGkrKyApDQo+Pj4gKyAgICB7DQo+Pj4gKyAgICAgICAgc3Ry
dWN0IGlycV9ibG9jayAqaXJxcyA9IGdpY19jdHguZGlzdC5pcnFzICsgaTsNCj4+PiArICAgICAg
ICBzaXplX3Qgaiwgb2ZmID0gaSAqIHNpemVvZihpcnFzLT5pc2VuYWJsZXIpOw0KPj4+ICsNCj4+
PiArICAgICAgICB3cml0ZWxfZ2ljZChHRU5NQVNLKDMxLCAwKSwgR0lDRF9JQ0VOQUJMRVIgKyBv
ZmYpOw0KPj4+ICsgICAgICAgIHdyaXRlbF9naWNkKGlycXMtPmlzZW5hYmxlciwgR0lDRF9JU0VO
QUJMRVIgKyBvZmYpOw0KPj4+ICsNCj4+PiArICAgICAgICB3cml0ZWxfZ2ljZChHRU5NQVNLKDMx
LCAwKSwgR0lDRF9JQ0FDVElWRVIgKyBvZmYpOw0KPj4+ICsgICAgICAgIHdyaXRlbF9naWNkKGly
cXMtPmlzYWN0aXZlciwgR0lDRF9JU0FDVElWRVIgKyBvZmYpOw0KPj4+ICsNCj4+PiArICAgICAg
ICBvZmYgPSBpICogc2l6ZW9mKGlycXMtPmlwcmlvcml0eXIpOw0KPj4+ICsgICAgICAgIGZvciAo
IGogPSAwOyBqIDwgQVJSQVlfU0laRShpcnFzLT5pcHJpb3JpdHlyKTsgaisrICkNCj4+PiArICAg
ICAgICAgICAgd3JpdGVsX2dpY2QoaXJxcy0+aXByaW9yaXR5cltqXSwgR0lDRF9JUFJJT1JJVFlS
ICsgb2ZmICsgaiAqIDQpOw0KPj4gDQo+PiBhcG9sb2dpZXMgZm9yIHNwb3R0aW5nIHRoZXNlIG9u
bHkgbm93LCBpbiBjYXNlIGdpY3YyX2luZm8ubnJfbGluZXMgaXMgMTAyMCwNCj4+IGhlcmUgYW5k
IGJlbG93IGZvciBHSUNEX0lUQVJHRVRTUiB3ZSBhcmUgZ29pbmcgdG8gc2F2ZSBhbHNvIElEcyAx
MDIwLTEwMjMNCj4+IHdoaWNoIGFyZSByZXNlcnZlZC4NCj4+IA0KPj4gQ291bGQgd2UgYXNzdW1l
IGlycXMtPmlwcmlvcml0eXIgYW5kIGlycXMtPml0YXJnZXRzciBoYXZlIHRoZSBzYW1lIHNpemUg
YW5kIGltcGxlbWVudA0KPj4gc29tZSBjYXAgbG9naWMgd2hpY2ggbWlnaHQgY2FwIHRoZSBsYXN0
IGxvb3AgKGV2ZW50dWFsbHkpOg0KPj4gDQo+PiAgICBmb3IgKCBpID0gMDsgaSA8IGJsb2Nrczsg
aSsrICkNCj4+ICAgIHsNCj4+ICAgICAgICBzdHJ1Y3QgaXJxX2Jsb2NrICppcnFzID0gZ2ljX2N0
eC5kaXN0LmlycXMgKyBpOw0KPj4gICAgICAgIHNpemVfdCBqLCBvZmYgPSBpICogc2l6ZW9mKGly
cXMtPmlzZW5hYmxlcik7DQo+PiAgICAgICAgc2l6ZV90IG5yX3JlZ3MgPSBBUlJBWV9TSVpFKGly
cXMtPmlwcmlvcml0eXIpOw0KPj4gDQo+PiAgICAgICAgaWYgKCBpID09IGJsb2NrcyAtIDEgKQ0K
Pj4gICAgICAgICAgICBucl9yZWdzID0gRElWX1JPVU5EX1VQKGdpY3YyX2luZm8ubnJfbGluZXMg
LSBpICogMzIsIDQpOw0KPj4gDQo+PiAgICAgICAgW+KApl0NCj4+IA0KPj4gICAgICAgIG9mZiA9
IGkgKiBzaXplb2YoaXJxcy0+aXByaW9yaXR5cik7DQo+PiAgICAgICAgZm9yICggaiA9IDA7IGog
PCBucl9yZWdzOyBqKysgKQ0KPj4gICAgICAgICAgICB3cml0ZWxfZ2ljZChpcnFzLT5pcHJpb3Jp
dHlyW2pdLCBHSUNEX0lQUklPUklUWVIgKyBvZmYgKyBqICogNCk7DQo+PiANCj4+ICAgICAgICAv
Kg0KPj4gICAgICAgICAqIEdJQ0RfSVRBUkdFVFNSMC4uNyBjb3ZlciBTR0lzL1BQSXMgYW5kIGhv
bGQgbm8gc3RhdGUgdG8gc2F2ZToNCj4+ICAgICAgICAgKiB0aGV5IGFyZSByZWFkLW9ubHkgb24g
bXVsdGlwcm9jZXNzb3IgaW1wbGVtZW50YXRpb25zIGFuZCBSQVovV0kNCj4+ICAgICAgICAgKiBv
biB1bmlwcm9jZXNzb3IgaW1wbGVtZW50YXRpb25zLg0KPj4gICAgICAgICAqLw0KPj4gICAgICAg
IGlmICggaSApDQo+PiAgICAgICAgew0KPj4gICAgICAgICAgICBvZmYgPSBpICogc2l6ZW9mKGly
cXMtPml0YXJnZXRzcik7DQo+PiAgICAgICAgICAgIGZvciAoIGogPSAwOyBqIDwgbnJfcmVnczsg
aisrICkNCj4+ICAgICAgICAgICAgICAgIHdyaXRlbF9naWNkKGlycXMtPml0YXJnZXRzcltqXSwg
R0lDRF9JVEFSR0VUU1IgKyBvZmYgKyBqICogNCk7DQo+PiAgICAgICAgfQ0KPj4gDQo+PiAgICAg
ICAgW+KApl0NCj4+ICAgIH0NCj4gDQo+IFRoaXMgd2FzIGludGVudGlvbmFsIHRvIGtlZXAgdGhl
IGxvZ2ljIHNpbXBsZXIuDQo+IA0KPiBGb3IgdGhlIDEwMjAtaW50ZXJydXB0IGNhc2UsIHRoZSBl
eHRyYSB3b3JkIHdvdWxkIGNvcnJlc3BvbmQgdG8NCj4gaW50ZXJydXB0IElEcyAxMDIwLTEwMjMu
IE15IHJlYWRpbmcgb2YgQVJNIElISSAwMDQ4Qi5iIGlzIHRoYXQgdGhpcw0KPiBpcyBhcmNoaXRl
Y3R1cmFsbHkgaGFybWxlc3M6IHNlY3Rpb24gNC4xLjIgc2F5cyB0aGF0IHJlc2VydmVkDQo+IERp
c3RyaWJ1dG9yIHJlZ2lzdGVyIGFkZHJlc3NlcyBhcmUgUkFaL1dJLCBhbmQgVGFibGUgNC0xIG1h
cmtzDQo+IEdJQ0RfSVBSSU9SSVRZUiBvZmZzZXQgMHg3ZmMgYW5kIEdJQ0RfSVRBUkdFVFNSIG9m
ZnNldCAweGJmYyBhcw0KPiBSZXNlcnZlZC4NCj4gDQo+IFdvdWxkIHlvdSBiZSBPSyB3aXRoIGtl
ZXBpbmcgdGhpcyBhcy1pcywgb3Igd291bGQgeW91IHByZWZlciBtZSB0byBhZGQNCj4gdGhlIGNh
cCBsb2dpYyBhbnl3YXk/DQoNCkkgdGhpbmsgdGhpcyB3b3VsZCBiZSB0aGUgb25seSBwYXJ0IGlu
IHRoZSBkcml2ZXIgdGhhdCBkb2VzIHRoYXQsIGFsc28gTGludXggaXMgYXZvaWRpbmcNCnRvIHRv
dWNoIHRoZXNlIHJlc2VydmVkIHBhcnRzDQooaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9pcnFjaGlw
L2lycS1naWMuYz9oPXY3LjEtcmMzI241ODIpDQpNeSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIGJl
IGNvbnNpc3RlbnQuDQoNCj4gDQo+PiANCj4+PiArDQo+Pj4gKyAgICAgICAgLyoNCj4+PiArICAg
ICAgICAgKiBHSUNEX0lUQVJHRVRTUjAuLjcgY292ZXIgU0dJcy9QUElzIGFuZCBob2xkIG5vIHN0
YXRlIHRvIHNhdmU6DQo+Pj4gKyAgICAgICAgICogdGhleSBhcmUgcmVhZC1vbmx5IG9uIG11bHRp
cHJvY2Vzc29yIGltcGxlbWVudGF0aW9ucyBhbmQgUkFaL1dJDQo+Pj4gKyAgICAgICAgICogb24g
dW5pcHJvY2Vzc29yIGltcGxlbWVudGF0aW9ucy4NCj4+PiArICAgICAgICAgKi8NCj4+PiArICAg
ICAgICBpZiAoIGkgKQ0KPj4+ICsgICAgICAgIHsNCj4+PiArICAgICAgICAgICAgb2ZmID0gaSAq
IHNpemVvZihpcnFzLT5pdGFyZ2V0c3IpOw0KPj4+ICsgICAgICAgICAgICBmb3IgKCBqID0gMDsg
aiA8IEFSUkFZX1NJWkUoaXJxcy0+aXRhcmdldHNyKTsgaisrICkNCj4+PiArICAgICAgICAgICAg
ICAgIHdyaXRlbF9naWNkKGlycXMtPml0YXJnZXRzcltqXSwgR0lDRF9JVEFSR0VUU1IgKyBvZmYg
KyBqICogNCk7DQo+Pj4gKyAgICAgICAgfQ0KPj4+ICsNCj4+PiArICAgICAgICBvZmYgPSBpICog
c2l6ZW9mKGlycXMtPmljZmdyKTsNCj4+PiArICAgICAgICBmb3IgKCBqID0gMDsgaiA8IEFSUkFZ
X1NJWkUoaXJxcy0+aWNmZ3IpOyBqKysgKQ0KPj4+ICsgICAgICAgICAgICB3cml0ZWxfZ2ljZChp
cnFzLT5pY2ZncltqXSwgR0lDRF9JQ0ZHUiArIG9mZiArIGogKiA0KTsNCj4+IA0KPj4gaW4gdGhl
IEdJQ3YyIHNwZWNzIHRoZSB1c2FnZSBjb25zdHJhaW50cw0KPj4gb2YgR0lDRF9JQ0ZHUiBzYXlz
OiDigJxCZWZvcmUgY2hhbmdpbmcgdGhlIHZhbHVlIG9mIGEgcHJvZ3JhbW1hYmxlIEludF9jb25m
aWcgZmllbGQsDQo+PiBzb2Z0d2FyZSBtdXN0IGRpc2FibGUgdGhlIGNvcnJlc3BvbmRpbmcgaW50
ZXJydXB0LCBvdGhlcndpc2UgR0lDIGJlaGF2aW9yIGlzDQo+PiBVTlBSRURJQ1RBQkxFIg0KPj4g
DQo+PiBBUk0gSUhJIDAwNDhCLmIsIDQuMy4xMy4NCj4+IA0KPj4gSSB0aGluayB3ZSBzaG91bGQg
bW92ZSB0aGlzIHJlc3RvcmUganVzdCBhZnRlciBHSUNEX0lDRU5BQkxFUiB3cml0ZSwgYmVmb3Jl
IHdyaXRpbmcNCj4+IEdJQ0RfSVNFTkFCTEVSLg0KPiANCj4gR29vZCBjYXRjaCwgSSBhZ3JlZS4N
Cj4gDQo+IEkgd2lsbCBtb3ZlIHRoZSBHSUNEX0lDRkdSIHJlc3RvcmUgYWZ0ZXIgdGhlIEdJQ0Rf
SUNFTkFCTEVSIHdyaXRlcw0KPiBhbmQgYmVmb3JlIHJlc3RvcmluZyBHSUNEX0lTRU5BQkxFUiwg
c28gdGhhdCBwcm9ncmFtbWFibGUgSW50X2NvbmZpZw0KPiBmaWVsZHMgYXJlIHJlc3RvcmVkIHdo
aWxlIHRoZSBjb3JyZXNwb25kaW5nIGludGVycnVwdHMgYXJlIGRpc2FibGVkLg0KPiANCj4gSSB3
aWxsIGFsc28gY2hlY2sgd2hldGhlciBpdCBtYWtlcyBzZW5zZSB0byBtb3ZlIHRoZSBvdGhlcg0K
PiBjb25maWd1cmF0aW9uIHJlc3RvcmVzIGJlZm9yZSBHSUNEX0lTRU5BQkxFUiBhcyB3ZWxsLiBU
aGUgc3BlYyBkb2VzDQo+IG5vdCBzZWVtIHRvIGltcG9zZSB0aGUgc2FtZSBzdHJpY3QgcmVxdWly
ZW1lbnQgdGhlcmUsIGJ1dCBrZWVwaW5nIGFsbA0KPiBjb25maWd1cmF0aW9uIHJlc3RvcmVzIGJl
Zm9yZSByZS1lbmFibGluZyB0aGUgaW50ZXJydXB0cyBtaWdodCBtYWtlDQo+IHRoZSBvcmRlcmlu
ZyBjbGVhcmVyLg0KPiANCj4+IA0KPj4gQW5kIGFsc28gdGhlIHNlY3Rpb24gc2F5cyB0aGF0IHRo
ZSBHSUNEX0lDRkdSMCBpcyByZWFkLW9ubHkuDQo+IA0KPiBGb3IgR0lDRF9JQ0ZHUjAsIG15IGlu
dGVudGlvbiB3YXMgdG8ga2VlcCB0aGUgcmVzdG9yZSBsb29wIHVuaWZvcm0uDQo+IFRoZXJlIHNo
b3VsZCBiZSBubyB1c2VmdWwgU0dJIHN0YXRlIHRvIHJlc3RvcmUgaGVyZTogc2VjdGlvbiA0LjMu
MTMNCj4gc2F5cyB0aGF0IFNHSSBJbnRfY29uZmlnWzFdIGlzIG5vdCBwcm9ncmFtbWFibGUgYW5k
IFJBTy9XSSwgd2hpbGUNCj4gSW50X2NvbmZpZ1swXSBpcyByZXNlcnZlZC4gQWxzbywgdGhlIHZh
bHVlIHdyaXR0ZW4gaXMgdGhlIHZhbHVlDQo+IHByZXZpb3VzbHkgcmVhZCBmcm9tIHRoZSBzYW1l
IHJlZ2lzdGVyLg0KPiANCj4gU28gSSBkbyBub3QgZXhwZWN0IHRoaXMgd3JpdGUgdG8gYWZmZWN0
IHRoZSBhcmNoaXRlY3RlZCBTR0kNCj4gY29uZmlndXJhdGlvbi4gSG93ZXZlciwgaWYgeW91IHBy
ZWZlciBhdm9pZGluZyB0aGUgd3JpdGUgdG8NCj4gR0lDRF9JQ0ZHUjAgZXhwbGljaXRseSwgSSB3
aWxsIHNraXAgaXQgaW4gdGhlIG5leHQgdmVyc2lvbiBvZg0KPiB0aGlzIHNlcmllcy4NCg0KSSB0
aGluayBhbHNvIExpbnV4IOKAnHJlc3RvcmVz4oCdIGl0LCBzbyBJ4oCZbSBvayB0byBrZWVwIHRo
ZSBjb2RlIGFzIGl0IGlzLCBpbiBmYWN0IGl04oCZcyByZWFkLW9ubHkNCmFuZCBub3QgbWFya2Vk
IGFzIHJlc2VydmVkLCBteSBiYWQhDQoNCkNoZWVycywNCkx1Y2ENCg0K

