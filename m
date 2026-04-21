Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFeCBFkm52nV4QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:25:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E52A437829
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288371.1568649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5Tk-0005YG-3B; Tue, 21 Apr 2026 07:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288371.1568649; Tue, 21 Apr 2026 07:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5Tj-0005Vm-W9; Tue, 21 Apr 2026 07:25:03 +0000
Received: by outflank-mailman (input) for mailman id 1288371;
 Tue, 21 Apr 2026 07:25:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wF5Ti-0005UF-2Z
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:25:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5Th-00B0HG-FZ
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:25:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e72644-bab6-0a2a0a5309dd-0a2a4508c36c-36
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:25:00 +0200
Received: from [52.101.83.45]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e7264c-63b5-0a2a45080019-3465532d8b1e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:25:00 +0200
Received: from DB9PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:10:1da::23)
 by AS2PR08MB8951.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 07:24:54 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::88) by DB9PR05CA0018.outlook.office365.com
 (2603:10a6:10:1da::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 07:24:54 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Tue, 21 Apr 2026 07:24:54 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU4PR08MB11030.eurprd08.prod.outlook.com (2603:10a6:10:576::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 07:23:49 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.032; Tue, 21 Apr 2026
 07:23:49 +0000
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
 b=GrsERuT1DICDdZN4mLqW67u2PYBzJ6gxeEVnsaYURNphPfsF4s3XNSDNDWMH/0B94dm4r0R0puInTeV82tv0cCcSJixU2p+z5rCVRt2ENwX9PjZYszIH7rVI/cVv4DtfA5YJ0dPouplMJRKv0sEGnUz7IyLlpGebv9ga+LjIGlrWswwS7hhFSqwtQ9B9j4rUbcx4/J2F9Fda/7FCCFnVfoLdS20Ttoe3CaTjsLWpgNxhoxtSwJ+FwOWHIccfFaiJ877T2sgKUnbp39h5lTla3Qkaq6rQTt9uRlGGNu2y2ffNNzbgSo4bsaLUOd8+AtvjvVrWKhLIOowN+FPTS3UqAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WznTD4DkIBu+ED4RhujjRzxuunyYzur6jIy2pbyo3Dw=;
 b=jFVXVunUttggirkWqrF/dx4zHTGo06eNXTInZk/HNddNIUQMDRHy7x4Z8Yxz2ZnS1aaA+XCRddBl8S3AEvHIwU79gUWp4u/8qTMw6iJqIxshbDcUcCGRjQKl4gtYX8at0cLSJ1rgMuaxJBfvIoDpRbhW5rVqfOveNEvvV7Oeny04eCCoi20RJzqe0KA2bUxVxcQIdqexJVs/t+TqmEKMYcPq0pjWlD9oxdCoJaWylt5pduxLf+HiDfkFDEF2OwbwsY/VQ6PWf7md8YcEXiqVrRvb/lwIdySskjkmOpzL+SpeSgprnJ4aEgBEFcCGld1xAMzRknsaypEHgI0TpUYPUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WznTD4DkIBu+ED4RhujjRzxuunyYzur6jIy2pbyo3Dw=;
 b=ipUAwh6JJIjaMB6dQlYUhg+O/vkA2Gmj+rDjXokQ4NKvo3gcTxnmrG5fLe2i2YpxQHjmnD8HqbaqpTq9EGKp7skf2KYb6kNWvyTle/6s4qsl4mnEYyPAX1JKnUa0KNF7XhuxXq3kCC/HN04WrQPMqvHScjFkSftUytiSBje5b4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNiKEPFUji8wyoNxJmVF30Vna93Px/QaLhgVXH3gTx9iJy0gUWnQ7gHGpSS8u7zhlPRW5Xtx62jXV9UVchSmPxg5Qi40KANUKm5TX0GAQ/6jtLtmDfdMNbD3Vjpvec2QHsf7ld1lGmu0hGagYYvOPKV4siMg1794p9oG9pp6NBHH81uh3671pUu6qZz+vrL3paAdDZAdznuOKM3ROn/mjydaCaWkbm3A4dMZNKbAknAitXpFVgMZhIwgs9PSHKvERpOufgq4uGeZO4KIF100FCrPBA8Mir/xBqLJwtzuyLg+DOFv4WS8tvgC3tMZ2lezb//8O7g20AFS8XXeH/naMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WznTD4DkIBu+ED4RhujjRzxuunyYzur6jIy2pbyo3Dw=;
 b=km5WEJ5ZU2k5biN0q2RqmNZrYPxwBEkKX3l9ZXdHuG9laBGRQX7X63F1QkBu1dAlArV7OYlk4j1rwc9G6OTV8OwRFJm1fe1E8IebRnpFIKVWgTv7P0h1r1N+BEGmQMAUqXt/KPwzEMcH4QDdVE6IKb5sr5bknmfT71mWY4JMNvv6NkSJLG0J19IVqzo0RfTOMo1c/VVf9TwTnr6s7UsYcYVqHS7BixcBHuv6PEUG0XqqCjBPyGUh8XshxRruBM4q+S9MMf6+wJmgj4uSUqXvyAKFlksHSQ/0PAfJZGaoNiPepll2mh9tvTzV3Bwakn/lPd0zIcCDAdPojieRWfW5sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WznTD4DkIBu+ED4RhujjRzxuunyYzur6jIy2pbyo3Dw=;
 b=ipUAwh6JJIjaMB6dQlYUhg+O/vkA2Gmj+rDjXokQ4NKvo3gcTxnmrG5fLe2i2YpxQHjmnD8HqbaqpTq9EGKp7skf2KYb6kNWvyTle/6s4qsl4mnEYyPAX1JKnUa0KNF7XhuxXq3kCC/HN04WrQPMqvHScjFkSftUytiSBje5b4U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] device-tree: Improve hwdom memory allocation for DMA
Thread-Topic: [PATCH] device-tree: Improve hwdom memory allocation for DMA
Thread-Index: AQHczkpLp1xSo4q8Z0ODZraWVEzberXoDpSAgAEIrwCAAAubAA==
Date: Tue, 21 Apr 2026 07:23:49 +0000
Message-ID: <78440FF6-499A-4997-AA60-AB7EEC6AF67E@arm.com>
References: <20260417091155.39653-1-michal.orzel@amd.com>
 <412A9DF8-6F5C-402D-AEBD-88E6DE139E07@arm.com>
 <137bd391-926d-4047-a760-638f2e58b99f@amd.com>
In-Reply-To: <137bd391-926d-4047-a760-638f2e58b99f@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU4PR08MB11030:EE_|DB5PEPF00014B97:EE_|AS2PR08MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0e0988-6f5f-4834-5939-08de9f77156c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 E/9rLs2vD3OBvIW2wjMlo4IkILfW9YZf1YZ3ATVpzKW3QBVvq+E8B9nOFf9iR2g4Sj9vlX1JIrO/jIC6G64WDOSXYBW+NOKaalZC1JkputWoEnhtip1m/7AYuGrLfxEtRoDg2cbwFtpifJnsFrUw93MkXAUDK7DUJjSjLmswNo+AOjIq9f9ic4aptlQHQlrUxM7BVABMStCZDJJNnO9K3W7bLk8fStWbT+uCrctqVELPEF1aFx5MB7wI1emXN5h44toWPmpBo7r8/3bkpzU6y+qtK00jG9qqKRBEJagSY2i7csf5CaxuRxCyBHsepeRPxV65Ou1tsxt6FWMbp94GK1kte3FNIC1hQ+DT7MObxvXK/E/R2IetI5ukEHTYpdNqEsXv+BfoHiLfo7nt3nFmzApi/puyFpoRlwnVqihUPXFLJ1wwV9r/gt6QdcZhcN8qZvmIO+1GYo/7eOQUB9/xH58AifFyfT6iQN+oV9vQZI9ycnQlDf5wmjg+71b9+ekyx6ufyXmQkHwiOmDpMaXbZ+pUKxWXhFb2fYB78YGQ3RjA1DkdI3URv9aO2tPbkUxIg3gxzAADyn3aP8hWv8hu5iWvu9KiCnIeMrAmuRP/ixN0P6ofNGN2tMuTkzvff99M3ldKf4qv1QAhjKUn/4EPsB9ypF+swlOa7oLwqka5hNZ1TW5ZULYlZ5RzeiavBLQFdsgJEfr82zU6aOsL1TAcDuHrO60nzJWYWJWkYM6Z2xvFLLgRLgx0IjKZ0xdnYcA/VsY6wNi+N2fiofdf94R8UnRhcUyoCR3eYAVDTJIJS4Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E461CA9970BAA4F9D670FEACFD40997@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 jyDyOeDccvdZCoJUrTQkjgr9mbn1ESJkRku3mtbrmH/yLIRdLPKHiXMdBZolhaA2KT5QrUHtVMLXeyDfkwQvCvgyKsak7/HjNm5irIGAsdHXZ+EjQYcwzhh17mj8XrGDGEhall2rwiM5OZ0c/+M+jd507c6XwQy9G6f3aTyFHf5HyT23EHzVsSf6OpI97hM5XGu0RsBWfW+IJxnlGof1mNdXbVFSUu3H2Azw4ZBBWG1W92+kZ8LBIH+GFX6v4J+T39NUr+dXM1+DJNNeM1GZHEiity+AaYzOsE9twZpMhnZ/zf0tqVlBQ+Vy5BUPapyFXMt3h/olD/2ubJMUNA0nCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11030
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3680ad37-7821-429e-9464-08de9f76eeab
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	w7CzkafintQ05kclDJSpKUwHfW2YGGQ6Y2ML6UWH4C7UU6MUijthck/o3hO+x1vunaZCRuRZctQ2kJt5zBupdW1g1dV+A71mTTMYFqG+nWFosOlBETFzFLwrKKSeSjU2cawn+vqnG/d7CiEb+JmTHv8y7eP32WffSGkPNwxbvWvy6Kx4aiiJ8xcOG6/Lfon1OrqlNSWRsbc3fh8aQdBH4AN4OsPIJkHZ3d4tXKunRRaW3IRixARufUYXjRQu8y+O4wW22jHrwmufG0Y23fJBmSS0l3imIK80JJCqqI/qQTsL3KkZZ8ocdWH2PtHlvYJmx7d3OtiKgE78pS3zs5xhQEe/mBusa5bcWEA1yOw9AZR1dH7FkxaMFhO3dKqVmQORLQIMLos0kBOGstJqr57H8l2Fp1G5UZHVhDNVu4W6SIGANIa3xViUCvW7xsRRMzSuB4TWVfhlG2mgCnWizViTa8luFrJtQqTXZ62eVgMAHISAp+u2J8HpyoTFk5ZHCrVhrtUO8KKlt+vZF/jnsqr2UqxJFodNDaYl0i7KCoxkV1GLoEAPh5ppD8o76rdnfTjkYrEk+FVoSPQw6oaxWv2OLlX8Krhofa7Q05cclQGbJtB+REK9aRZ8w1FIMzPFnOJK1zsBcgREFknOD89mygpJBxb1TvhoIMeMiaxqKVtRqkZdWzI9rV1XCvMUgWKQWtnoZvdDGHe6iGZp1SuFpU97Yyzg0tUdpiigEPHUM7KhJFVUk5c++zFqVDVJYE3oNmJr/jMgI8Z2P9C8oWI23j5wIA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wAMYzxRO0VeFwlpFmIkhsPnCu9olLqzeELLGW5YQ44gu+nV2aRxY03oEPvzbYyYjrrC/7CCoemPdrJBQqPxl/mVrd+IJKYJXo32K8qqe0Lk5ksvqMqD7m+/joPVQpq3/UdYkCJoUfAl6MhcpLydJBx0HvKZAgnnoE+UWxRwMoVT3GCiwVD2XjZ/0OXTLslSk6QJnfLct1wlSv0rc5vBe8E+sUrWQX61J5U6EsOe9i9P0VKtpyJCrMn8KRAGk3E+sUeI+dCEyCVQpZaNmjVvP0lMRT1huobFRKwhYDyM7xSSKcEDBGeSoOhDjOUS/wP3ZGj8nToVf9VdbXEQZT2qiUbZdFrWD/2FakIh0vB5WaVhY5uZBIR1/LWqqNehcl6mJStbJmt1Clrr8xlu1hcM/F5H8WI0puKMs7Y9Jz2stO89HjwC96Qt+DfQ/3bQPol4v
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 07:24:54.1443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0e0988-6f5f-4834-5939-08de9f77156c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8951
X-purgate-ID: tlsNG-c1860d/1776756300-3AF72DB1-9E23FF3F/0/0
X-purgate-type: clean
X-purgate-size: 904
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 7E52A437829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQo+PiANCj4+IEl0IGxvb2tzIG9rIHRvIG1lLCB0aGUgb25seSB0aGluZyBpcyB0aGF0IGlmIHdl
IGhhdmUgbWFueSBzbWFsbGVyIGJhbmtzIDwgMTI4IE1iIGJlZm9yZSByZWFjaGluZw0KPj4gb25l
IHRoYXQgaXMgYXQgbGVhc3QgMTI4IE1iLCB3ZSB3b27igJl0IGFsbG9jYXRlIHRoZW0gYW5kIGxv
b3NlIHRoZW0gZm9yZXZlci4NCj4+IA0KPj4gSXQgZmVlbHMgb25seSBhIGNvcm5lciBjYXNlIHNv
IGZvciBtZSBpdOKAmXMgb2sNCj4gWWVzLCB0aGF0J3Mgc29tZXRoaW5nIGRvY3VtZW50ZWQgaW4g
dGhlIGNvbW1pdCBtc2csIHNvIGlmIHdlIGV2ZXIgZmFjZSB1cG9uIHRoZQ0KPiBpc3N1ZSBkdWUg
dG8gdGhhdCB3ZSBjb3VsZCByZXZpc2l0IHRoZSBpbXBsZW1lbnRhdGlvbi4gRm9yIG5vdywgd2Ug
aGF2ZW4ndA0KPiBvYnNlcnZlZCBhbnkgaXNzdWVzLg0KPiANCj4+IA0KPj4gUmV2aWV3ZWQtYnk6
IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbSA8bWFpbHRvOmx1Y2EuZmFuY2Vs
bHVAYXJtLmNvbT4+DQo+IFRoYW5rcy4NCg0KSSByZWFsaXNlZCBteSBtYWlsIGNsaWVudCBtZXNz
ZWQgdXAgdGhlIHRhZzoNCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2Vs
bHVAYXJtLmNvbT4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

