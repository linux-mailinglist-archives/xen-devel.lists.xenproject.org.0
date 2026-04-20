Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wExYGLA+5mlutgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:56:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981FF42DA4B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286182.1567288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEq2h-0005ot-8j; Mon, 20 Apr 2026 14:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286182.1567288; Mon, 20 Apr 2026 14:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEq2h-0005mT-5X; Mon, 20 Apr 2026 14:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1286182;
 Mon, 20 Apr 2026 14:56:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wEq2f-0005mN-SB
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:56:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEq2d-008c5j-Bb
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:56:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e63e7a-2eae-0a2a0a5409dd-0a2a4509e2e0-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:56:04 +0200
Received: from [52.101.69.50]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e63e83-2497-0a2a45090019-346545329da9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:56:04 +0200
Received: from DU2P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::27)
 by VI1PR08MB10146.eurprd08.prod.outlook.com (2603:10a6:800:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 14:55:59 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::4) by DU2P250CA0022.outlook.office365.com
 (2603:10a6:10:231::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 14:55:59 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 14:55:59 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAWPR08MB10995.eurprd08.prod.outlook.com (2603:10a6:102:46f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 14:54:56 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 14:54:56 +0000
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
 b=fSLzaywK1OCM3uxx2F+Zbk9hl1EQHRWSGt4iVUhjROR/oKPfGdBmpJcngHIaXelGP/zKJTyiU17VEKvJHCzX01FtX6jJf8kD+nFeUOE9aJMbrUZbcvjpnU6MmEYv4R6JV3G9yUvKzvnLd8B/YZnYvIbxDGiE4uYWMeN7yiq/BDaWCl2de3Y7Kln5TwI1fcrBJcYm0IdzGyq5QJ6ipydxYcyhA9jL1dRzIhJicwpxfiLAwlC+LZd1yQs0Bq7snxPjWwELhxL0abBD7snWxMmM8bpQFhQYzae/izHRDYDHwLGtfBdlAGOUDJwLeifzroLX87Px1JjmE/eMwCkmoEYL7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWpjB2JvLWoy1kis/0rOO/HjxxEQBOIOH8FqHFE9iio=;
 b=jyhwVRLglBy6Llw6nV7lNps6JAK37I5xz6FFdjLGdOZz8G47a1ewUALdq6znd24vpud5cIIaDbvnmGtdoN93OSbJnKWn14ktCLhi7nvmaC4V9Sc925CqC0hHdN1IXllOxjKFEynf3JCcwev3z9t3hb1ebpnpVcvK+/hdCg57vCDvOdaaUTHaKlG5SCyK56nI68ew7RDCN+yWbyA21WmxKsDpaC3dfY+qRApoW6egpv59kHwt92xKjgU7sUxAxcMfoEPLmxuga24MFOexXBBKPlnL6lavK8SY0yXgyONbK7yxpu0q2Fbmlc6RqkSBNM6YMUgEN3RsikGUxll3jeEVvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWpjB2JvLWoy1kis/0rOO/HjxxEQBOIOH8FqHFE9iio=;
 b=eWh6c90aFFqTAJDCA81cu3HwtX7E3j1y3jlCEkEKLaq1M/Ijtxp3/gfaRpAqlK3CZCi8AJEUzS/NgTLfE/SXOTaIZx7+E8lRwm51UsP4w0Rxg1Us/GfnQC2xMtdUTvAh0YmE1JxGBYL6AkKf4lecTeTrFgK9dCSczRi83SPHriQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7Md+201UA3xKsPClInKmfICDOV+gq8obrVqQ20PzmziXbm09rIrXV3GFH41kLUPL1VLY0+nzONKkIQxmvAOrzES8ddaLjJe2JtWMBA4t6475ivkq1bpw99g0UO5hrrSE/YzWxrP9XhSpRmqHABMJYNsP9Il9YeLFs1qVSY17XSCHt0kNPvDwdRE9C6IzX1M6bHOz0fR6qOOaidRyAiBj5zMJxaf/m7pVfICOM/n8DXGU1i4nUxPjDj+goM7TPeL8lTT6VBTig2LzJeNd35x0dj27qFjcPW8K0kT1W3mBBKJiO9n8Kbhqo5vFkbTWg0Y54JBQZ8hlL3eXDFsJ+Cqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWpjB2JvLWoy1kis/0rOO/HjxxEQBOIOH8FqHFE9iio=;
 b=PJZ7bamJhElGlkqKl3oQ0VMgChZM9VZoHzzqh4UKHdemdsqeEhYE2UkaLL/Gj58eahkyHudgypaHvi7M64EvT+/mpoYz/caxYNsI60JG4bmv9/Jx/yqIiNBeAaIoFtKqGtlmNWsm52mzqDSjtyZX0WaHLvoVh+xqfVx04E7j1Enrrzrzs5Ppk0ByRBkZPSfxWgByFUuZvNwNjZnHzpVKPEJH8aT1VH4qB8uKCH7qFJAA3TMYGm7WcJfKY0JRbRPiZ/ja33cYmLiNsz6qOiFCWqbZYF0JDs//bzBnU03p8gM29g+2SokkHlXZRkAtNk6Od9ZL/IbtGZOShgm32tdXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWpjB2JvLWoy1kis/0rOO/HjxxEQBOIOH8FqHFE9iio=;
 b=eWh6c90aFFqTAJDCA81cu3HwtX7E3j1y3jlCEkEKLaq1M/Ijtxp3/gfaRpAqlK3CZCi8AJEUzS/NgTLfE/SXOTaIZx7+E8lRwm51UsP4w0Rxg1Us/GfnQC2xMtdUTvAh0YmE1JxGBYL6AkKf4lecTeTrFgK9dCSczRi83SPHriQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] device-tree: Improve hwdom memory allocation for DMA
Thread-Topic: [PATCH] device-tree: Improve hwdom memory allocation for DMA
Thread-Index: AQHczkpLp1xSo4q8Z0ODZraWVEzberXoDpSA
Date: Mon, 20 Apr 2026 14:54:56 +0000
Message-ID: <412A9DF8-6F5C-402D-AEBD-88E6DE139E07@arm.com>
References: <20260417091155.39653-1-michal.orzel@amd.com>
In-Reply-To: <20260417091155.39653-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAWPR08MB10995:EE_|DB1PEPF000509FD:EE_|VI1PR08MB10146:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ffecaa-2026-409e-b16f-08de9eecef49
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 u4tYGPZFF5S1TkUnQ2jPn0xHWT9Q8QpuUzG10RowWVt7TuONVETVRM1/JpDDKclI+iHJrPqluzWBp3BJXDjdHcnQ1+J8eWG/binZLazX+AfEKkfQFPv8Cizu5Blqf2KOr3pA7lur2MvlKHrtUj1p/awWl6Ju+xlrY2g2OWTm7HajFmz5ZdX0E6afcliyMeMcWAa2ZKvx7eSv07tLZCZRF1gpKbrqWqksanKM4OC+5ScV9G04wqWAfajTjeiog8yvv9sBxA/w76GPhRRdZoBKRpjr8Z2A2/LZXoeKrVdPpnhyua+vuQP1tapp2BMNJY7wzqjs/e1JIX4ndkKdmmwgFr8wBx6wzQayNpuMQIdvTILAizXEXBU+fPdbDpbG1V6xUOT1tcd6Uz10qbJNhC+BgeMdDq2CsMcfyvywJauF+caAXJYrwqK20U0Q5u2TI8/b7Kv7CzRNnBIJOKw+KVeucmDqsY+km6pRasvIeR9EfCzw8Ynd8nYyk8jVz0R/JMw4sqaAMtpZmCfLB7HCfTDzIR8xfzB6x07T2Fb+G9+2+Szon9QSErULflL5SHC6OD2ylEEf+ef/9dor5t9Y7YQTpn3JndTBc16pJ0zZTgbucMApRYsxdWWA6PSXgpcQWxdJCDi/Yzzv23SEdDwX3hfqAcIEAXqawc+GPJ9sS3FOa3vOC3NAqWsROPK1hmIhq5lh4ciyLFqQ+pmWsteHJKVWW688WdHEpzTNYCqXLgccSQ3QBjRYCSJBggH2C8klSpXIKkv1NsgaReiitoTQYyYX5arFrrT+wjsmCVfIe/nCdS8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <48BA730DDB9B3849A88E3A2172684771@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 d5X8x2czH8N18o3XIBEBG47X8WcuspaEU7K0ofW0Iopvp6yVXPzA+40VY+vs/UNriDGLZ9+rGmeTGm8sL8S1pfsUJHu4JsFWA45Vi/WzI7hxpiM5MQ0DOSpNfXgKmtQGvMae2Ua/5YeNio3ddzb45lzoTYpU7cJStKh1oBhUxQurR+AdyGRT+Ydu9mM48utIVZHm0TXhBbzJ8Z5sLZq/5IPuwkszT64acXSxpwjTXKFqhqr7RY4oW+PT6kP2D3kLAqRkajYg/jFpZ9/IdXzSD2sAIYM5joWM/TNZtEKJm5hKZhKxpSLczoi23dBAX53wu0FmbfVAKxUCFWWRs1vVuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10995
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82ea2d55-03d4-4fc6-8540-08de9eecc96d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+HeV3eStzz8Enlz4XGr52bS6YG+HeteZTlp2HyrDtPbeDT6vhVDlZ6BHdDEeZOmOGmKAzIp4fExvH2OAuw2kx/Lj8Pt2MPTxxkLzMpHV3a5JNBtTan58TMcPQUQH4dp2n2TcvYYcmLV0PQ0AdEo/gEztTf+SpK26AM57b4sRktbxl9ohlri1PzX6ePhbdeH4Vy+M/2bp9Hl6AP+kyrchqmuarqCaz/EEIMKTgZfmm/FtGTbqHGGsyov/DVCyoI1OsHtJB4ArpYNNTvAfV1ww1psWD51RIqt7MzrsfWDkeGFUIwD0eJ5fNPleWIMCU/ra6K8AiJWuaENGrMptBq4FmpleHzhr9jIcDzk5FiNGVPShZQNeKWaUuXFulUZPSYUkakcqOjNo34O4BT60X73vgZJDc8E6icr3tvxBU2VVg7kUJ83QpcUKtj7W9uxg7/l+pZf0ZBop5/JCzR07e4L2bWHkj927sJdBjIPxqbrQhM0WlAsPlaXdDiTOKBwlqnh4ee+TV2YACXZH8dTmxI0nnUhsqqowT5KaaaLaKaK+N8++UbKjHi19FfVp9Ey5BgrCqlBuV2exGI7L0ApKvbxNuAf2ri3ry/HjkmZX5lhianX2DUyDBjo6tgpYN/zEFMPm6iOv1f+YS14MRCqML4gf+w9nVYGERSepYT0wNs9zTKTRmAlDAZuIuFlUEJKOwmsbXVf9VIlob79DVbDWIIAzFMusE/QLcC0yjgbrNYfBpAjkSDUiuVWXMPjwUYjrj/upiwAi8w+UgYlQViYTKftx5w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EwlHVHLdPT+edc/kmrie9zzpuMaFcdZjEZG1pgR4fTQ1Ku/6zk4POqfz0jn6NIoyn1EAp0ba+Dl3PglEym1bVtqIC9aBMpvymsaeQTsr7GzEVw5g4xssS/moStxgtPCd208D0MLfPq3+D1OL+tjXrzNR+lgVBKIwHuGz9lxuPoiJ7L3da2xSzDNGX3X6eZP91lFQZI3GZp9sNjZDRAShom1gbkLjur3HYU9IYaeM16XUzQIjh0m8HxtuwHSyKqBiTskmHSDJX9Iiy1gPKuBJjj3EtdJT1Zl6NTWeok23B67DJT+pWwN6h1Xydaiw69egdZqD0TbrwZD/MEBnbZ4Q0dTNjvKwnX9Rh/Ee63xsc8hZx9Tm2cdPLbhH+pRqPBSKy6cV8OS9MhjCU0PknCBNfti0DJnGMPblBVw9rDISABBFgH+hVAs6yfLhL2kHjk5R
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 14:55:59.6200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ffecaa-2026-409e-b16f-08de9eecef49
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10146
X-purgate-ID: tlsNG-bad1c0/1776696964-42F76A53-E805EB1A/0/0
X-purgate-type: clean
X-purgate-size: 2004
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
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 981FF42DA4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWljaGFsLA0KDQo+IE9uIDE3IEFwciAyMDI2LCBhdCAxMDoxMSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBXaGVuIExMQyBjb2xvcmluZyBpcyBl
bmFibGVkLCB0aGUgaGFyZHdhcmUgZG9tYWluIGdldHMgbWVtb3J5IGZyb20NCj4gaG9zdCBmcmVl
IHJlZ2lvbnMgcmF0aGVyIHRoYW4gdGhlIGZpeGVkIGd1ZXN0IFJBTSBiYW5rcy4gIFRoZSBwcmV2
aW91cw0KPiBjb2RlIHNvcnRlZCB0aGVzZSByZWdpb25zIGJ5IGRlc2NlbmRpbmcgc2l6ZSwgd2hp
Y2ggdXN1YWxseSBjYXVzZXMNCj4gaGlnaC1hZGRyZXNzIG1lbW9yeSB0byBiZSBhbGxvY2F0ZWQg
Zmlyc3QuDQo+IA0KPiBBbGwgYWxsb2NhdGVkIG1lbW9yeSBjb3VsZCByZXNpZGUgYWJvdmUgNCBH
QiBsZWF2aW5nIERNQSBub24tZnVuY3Rpb25hbA0KPiBmb3IgZGV2aWNlcyB3aXRoIGxpbWl0ZWQg
YWRkcmVzc2luZyBjYXBhYmlsaXRpZXMuDQo+IA0KPiBJbXByb3ZlIHRoZSBoYW5kbGluZyBhcyBm
b2xsb3dzOg0KPiAtIFNvcnQgZnJlZSByZWdpb25zIGJ5IGFzY2VuZGluZyBhZGRyZXNzIGluc3Rl
YWQgb2YgZGVzY2VuZGluZyBzaXplLA0KPiAgc28gbG93LW1lbW9yeSBiYW5rcyBhcmUgYWxsb2Nh
dGVkIGZpcnN0LA0KPiAtIFNraXAgYmFua3Mgc21hbGxlciB0aGFuIDEyOCBNQiAob3IgdGhlIHRv
dGFsIHJlbWFpbmluZyBhbGxvY2F0aW9uLA0KPiAgd2hpY2hldmVyIGlzIGxlc3MpIHVudGlsIHRo
ZSBmaXJzdCBiYW5rIGlzIHBsYWNlZCwgZW5zdXJpbmcNCj4gIHBsYWNlX21vZHVsZXMoKSBoYXMg
ZW5vdWdoIGNvbnRpZ3VvdXMgc3BhY2UsDQo+IC0gRXh0cmFjdCB0aGUgaGFyZHdhcmUgZG9tYWlu
IGFsbG9jYXRpb24gcGF0aCBpbnRvIGl0cyBvd24gZnVuY3Rpb24NCj4gIChhbGxvY2F0ZV9od2Rv
bV9tZW1vcnkpIGZvciBjbGFyaXR5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVs
IDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gLS0tDQo+IHhlbi9jb21tb24vZGV2aWNlLXRyZWUv
ZG9tYWluLWJ1aWxkLmMgfCAxNTIgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gMSBmaWxl
IGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQ0KDQpJdCBsb29rcyBv
ayB0byBtZSwgdGhlIG9ubHkgdGhpbmcgaXMgdGhhdCBpZiB3ZSBoYXZlIG1hbnkgc21hbGxlciBi
YW5rcyA8IDEyOCBNYiBiZWZvcmUgcmVhY2hpbmcNCm9uZSB0aGF0IGlzIGF0IGxlYXN0IDEyOCBN
Yiwgd2Ugd29u4oCZdCBhbGxvY2F0ZSB0aGVtIGFuZCBsb29zZSB0aGVtIGZvcmV2ZXIuDQoNCkl0
IGZlZWxzIG9ubHkgYSBjb3JuZXIgY2FzZSBzbyBmb3IgbWUgaXTigJlzIG9rDQoNClJldmlld2Vk
LWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20gPG1haWx0bzpsdWNhLmZh
bmNlbGx1QGFybS5jb20+Pg0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K

