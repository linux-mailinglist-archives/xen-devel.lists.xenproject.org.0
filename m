Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB4XKTKr12lKRQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:35:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D835D3CB514
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277357.1562574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApXV-0003ZX-BV; Thu, 09 Apr 2026 13:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277357.1562574; Thu, 09 Apr 2026 13:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApXV-0003XT-8F; Thu, 09 Apr 2026 13:35:21 +0000
Received: by outflank-mailman (input) for mailman id 1277357;
 Thu, 09 Apr 2026 13:35:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wApXT-0003XN-Ju
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:35:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApXS-009job-Vv
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:35:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7ab13-5cb7-0a2a0a5109dd-0a2a450b94a4-22
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:35:18 +0200
Received: from [40.107.159.14]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7ab15-bca8-0a2a450b0019-286b9f0e14ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:35:18 +0200
Received: from AM9P250CA0009.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::14)
 by AM0PR08MB11778.eurprd08.prod.outlook.com (2603:10a6:20b:747::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 13:35:15 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21c:cafe::e0) by AM9P250CA0009.outlook.office365.com
 (2603:10a6:20b:21c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 13:35:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9818.0
 via Frontend Transport; Thu, 9 Apr 2026 13:35:14 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GVXPR08MB7727.eurprd08.prod.outlook.com (2603:10a6:150:6b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 13:34:11 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 13:34:10 +0000
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
 b=eqSdQRW3FEYMCkcKXecsqWiqsBdbMmrh7ItJn98Ni90ClIhateJysjCr6MKcX1fKnbDBtHc5xVVwhrBJaIZkS+FtXD0M9sJwLMUFGXzadlBRbXXFgbggzzO74glNnp1Z+NGHurOP0wEtxAaY7Ra3YE2wYzVvL+igmrOkLTADyS169piKKLYZn9aqJcfxDt5TClv33fqffwxNVmz33IfN5dNLccirvxnkHMHt6VBEXDfhseZYbmwbCxoDIyEDu6CIm47jZQDuvNyizPppgX5bTYaj6jb8YQeGvkGk2udRKrH6PQdKjFJjKucyMyfBmF3CSzsB/M9YX4IElW6OD2eIug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJxmIbH/V5ihvYVlfBvtw2jG2B22mOAIxpJuH2Ozr3A=;
 b=xaUvSV7BN9t/hSsNu94sqaUzEv5z3d35mpTcu8yu6JqVD/hUXQE1IbMXfzSpV2BLuo39ob1/2YduykU4nn2CcNfrHyjBTxVdWumJR42WrrUzQji7JCthti4NxZK6BoKtOu1itj52b2yLe8tKfVWys8VAn1Q0Zi6gNXWHPP0RwCkQ97HM0HAiF6VhD+Xzv3hPO+Hdp2Bk+c3Ogv9exTjBhAczRD4qxVs7vDcRAR18QKHBNWPDujFTrTh2qXor9MDwTZOoeUyml+pfxBxWLscoVTuC00TfeoNPGrccVn+w+4CC1kTmUTzcY63R9pMGWlIvpcfNDn1MlZrioihhdCAZeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJxmIbH/V5ihvYVlfBvtw2jG2B22mOAIxpJuH2Ozr3A=;
 b=joqHEDqSADPqkVUuMdm4k2oH/ailkZ1JeMipTKN1gJpigZsMCPLmNWruGSrM3kqnXohBpHKS6lVVaHzqkSx+oGaL1P+zDfnNgyB7rFMwZ53iKLVfcRxB9vlfF5Cz6FU/bbJZNc9RZdt1ZCxez1NB6MxgXsDo689MXXvgUDOo9v4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cji2P5R/aCruvdtJzmPeOLmtSsnbtv52FOo/0pwwnmyq7DJraUtWng8dfeZi1x1hZs0XrDbIG0f2RFosHdK/F3xM4Zb/TcUdlLjFjIEhDvOXgmP+qa5I+9pcinqxLCx8QHwF9qw2wzz5SY2nlv1GoXV1apTIkLheYLtR/rZL4GF/9i66VV5NxFAwtpMux6OtfLyJTWSPyRGEBs1Iq7rtE06uPz5GXJ2DvQV+lq1zthVqD5WjwyOi5BnehlyHPexaBLOpBVd8Llqxoe+zFRt+NZ9xHZ3ClHWQeoykoy5D/hGjRfmpDQ+w5C3NtVhJBnGHwk2MQx1vcpXPuCLOpB/jxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJxmIbH/V5ihvYVlfBvtw2jG2B22mOAIxpJuH2Ozr3A=;
 b=UxRXpsp+/kSZw65le+lekwzUx8U78wImsNkxGiRKrMm1YFYJXgggrFjgl8wcIa2J5/LCyyiqiM7eChZsA/pfmt50sJid3z8vSg8v8royEkIqHKENECzosRBfnl1EokG4n+J+OZz888tgtU3GsolvY/UaETk2suErMi4N51R4T9inzIRgvjLs8IKlh2JKdyxwreYn4zFg1D21WsJruNaIkgWaTm9sHCq8YWCFD+BFfjsYhKgyzagJ0/QuS2fl7+TliBj15G4/2VOSMigAQbeLfWJHhsRGO9CjZmz0fqyhByYrJlSViWvI9nAtAL9UQCzn8dTXuLn0EDkUqO+xRaDbQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJxmIbH/V5ihvYVlfBvtw2jG2B22mOAIxpJuH2Ozr3A=;
 b=joqHEDqSADPqkVUuMdm4k2oH/ailkZ1JeMipTKN1gJpigZsMCPLmNWruGSrM3kqnXohBpHKS6lVVaHzqkSx+oGaL1P+zDfnNgyB7rFMwZ53iKLVfcRxB9vlfF5Cz6FU/bbJZNc9RZdt1ZCxez1NB6MxgXsDo689MXXvgUDOo9v4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
Thread-Topic: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
Thread-Index: AQHcyBWdW2bjkWPifku6XWocvaXOWrXWpuWAgAAHZ4CAAADggIAAC5wA
Date: Thu, 9 Apr 2026 13:34:10 +0000
Message-ID: <6093D2A3-1823-4587-BB81-4593AD060D71@arm.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
 <EEF7C308-F25C-46BA-9663-BA789B49429C@arm.com>
 <db87a55a-5bd2-44ab-8814-1ffec91d1b40@suse.com>
 <9A42538E-AB13-488E-9AEF-39CD7E8D3131@arm.com>
In-Reply-To: <9A42538E-AB13-488E-9AEF-39CD7E8D3131@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GVXPR08MB7727:EE_|AM4PEPF00025F9B:EE_|AM0PR08MB11778:EE_
X-MS-Office365-Filtering-Correlation-Id: f0970ea4-8e4f-4934-de23-08de963cd515
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 wZd2knFOB+4HSlI0GoZoaO43b0w3YHncuJEecPc0wF+/XmpWBrajYERTffaCxcX3hiYCPOmz/QrQCcKDmGjz7JL/0r2sLugdEbf9Ce29b7nVYD4BXJFjygoravyh7t4No+OnPgDfm5wxjdQacZt3KxDpGCmQgH1h2UIlG8rQDDbRZIdNzISDZ05AsJEhLBSnlz9Hhb+8gxZWqpSfV6IPQGxfOLqvwFTbKYHSL5I8+WZx2g9PmZbJoVgl2t7sZNv8QLvqqifIHjoi72QP448ldx2vYD/nR1IFCmHw+cNCEMvrP4ZmxxHOxP85YTmRUTbIjkPcdEd1PI6EQWAqqoCf2JX3hikVZknaQRXCtNml4Wfi8qYpIGHsymvQyPqFPpMY3asdi0yitiuCF2AVTS88WVW7qobC+A8b1hi1xg1Vofl/ERu1NylKZDFurwTazySFcK12tjJpV/PGkhV444YCjSRl+6+rYLUx1wUHN01BPL1/txuHyP0ESOvhv71VlJPyuN0TTQR8TRN/sewPMy3gu++MQo3Q2ixUggZfEUfX8qGfT5vY5GYafk3HUv1u2CxOqS4DXvkxyx+jCv7PWTKOKhnkYq20T8DWppcvkpQZ0LzEmaMO4GiLhYf1nbByPSIv7efsEPJL5e9VwjqLOQ0QWAPcGuuUKigcEZVLR3C+43KLbHVBH6E06gvBLAmKfZaALUa62TwS5WgY2bcnQkcdP/dQltlGt8gg17ROtYik8lKbhRdEF+OxAHUvzkrBny8tkLmDQd5J67lRMMNieL6cpz8S7+s23HSDSbJ7+bfjK/0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2CAA43EA3F77B4D8941600E36EFE40E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 kEP1z0S4+U2AeRAe7vhZGcirmQ3RCoYrhicyvemFAEdHQ/F56CxzjPj3FVjK9SLI/vBVywJve9E2neT86OV/kfBZf3CrkKtF1t4eoyiUY522iGGcDK05Khn0yrhRzKickp6nN4qt9YFdbEwws4WU98WzBi+iV2WZSUpXRp3RnOdXHAfFzzuneuPT9ENZZkwT1KXJi61gcYmFp4aHY9II6DZbNEi7KnguUVh6cpXLtknjZE76qThXSVvAsb/k05JF+cJUxq4u4PPlLV5D5fV5jPZInrHdpSxgvU014ddbQyk5ea4ghhkt/vhe85pef6Kp5Wwn1w4P4Ro9Sn20FLUhhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7727
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f689ce1d-002c-4b6d-2b96-08de963caecb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700016|82310400026|35042699022|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TThqCY7vab7CBad8gbzkmG8gOiRo1PAD7JKjtgNHtjSFyud/5b9oEn0y7Ffa5FrQzdMnhZy/gcUNRmQyr2avS/bPFTp8bPTgwCorh6JWTizTM9BK5hDK53n2Kgn5iQnSv5mni0XizluNRVQPjRR4ulg512Tn+gjefGmXffB+rTW6dr0VRV68cV+UAOUncY9FvL/yDGQPdZuEHSC5e3FeV0vdghpDxEm4UeFHmOOlJKfaH3uhABZyGYDWooEwvuPCll2ZnYk4R1SN9wmFTvSgkEeGkSrHEhWsC5E16eysxies3n398np+YlmY4a2DbS774SAXUes+a5kXj3egl2Vb8sjOgVwg476rWYBgompBf8tPqQ3YwCD+3DigE3HFyk1FgdtUWYmzIDlurp/+Qem5FbYWP53XpvC3aSuZODRDxHrj4NRIDZQP5f4dHhY7FMzV9Bl84S7pQ1G3OUob/xPW626kbeqff2o97Gb3iS2E4VFfSxwiBt12RZwAha+IGoALeIJukjiqA7IsUwyx3z16J0mK7TtPhu8Ykp4VQ8OFQHlz4GCZTntmP2UDsOFVXBUWheRTFhM0GJPkMSS7Hlovk5GtEkDJl8BlrTLGylWRcgpa80m5mL9NRA0zwI1vz9sHB67wHJrZdyMNIBy7rYln+tW2s71AjT5DRKy/ecleapMyJEg7mFURSZP/wTqlqGCPR7rYbYfLBFfGPHTV7RD14kGOvJG26MpibcATFh4Bgwo/xCVwuCBx86QQnFyxJHd9gCrz4DkJ6yAx9wJ0gRKKIg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700016)(82310400026)(35042699022)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ru8Z85f1xn9hGsADkr8w2HbrhZLSTgGqmFxz5rmbmUiWAl+cObcYt9dEfAQAeSp/ktiiOIGprnkLe2AtkXTUSW5HCTihx2KXQnhGzQ7+zrsZ1jN9U+LZbH129MUCFX1UxHgSkg7rP/WK0tXd0sU6CM+QX6LCEIkUvM6OFdVDtZWj4WOBtXDHJIKxJ/rJxLfqpBBZWKxr6zMeipy3A8Yd/hoW49jmVyh9NTpol2cVory8L8FBG3DinIYDAy9whHgOgBqqhL7+YMLclI5Mo7hm1T6URnGaKcFl2xGfgiKgLXkOcE7+YEsbYp/VVAiiVkdvmeG0Nro5dP9VAIUANAuyT4AbAdQAU9t7GLoa/zjG21sq2clL6/iElkWyODQ9CDIpKNd2K0Rxkq4W2atMyXNyLdk+pS+QyVt7GhP0LTSip6I9ImPml92Dbp0xIQnmotYE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:35:14.9433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0970ea4-8e4f-4934-de23-08de963cd515
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11778
X-purgate-ID: tlsNG-42698a/1775741718-EC9592A1-E9D41949/0/0
X-purgate-type: clean
X-purgate-size: 2596
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:email,arm.com:mid,amd.com:email]
X-Rspamd-Queue-Id: D835D3CB514
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmFuLA0KDQo+IE9uIDkgQXByIDIwMjYsIGF0IDEzOjUyLCBMdWNhIEZhbmNlbGx1IDxMdWNh
LkZhbmNlbGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gOSBBcHIgMjAyNiwg
YXQgMTM6NDgsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+PiANCj4+
IE9uIDA5LjA0LjIwMjYgMTQ6MjIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IE9uIDkgQXBy
IDIwMjYsIGF0IDEyOjM5LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPiB3cm90
ZToNCj4+Pj4gDQo+Pj4+IFRoZSBjaGVjayB1c2VzID49IHRvIGNvbXBhcmUgdGhlIHRvdGFsIG51
bWJlciBvZiBjb2xvcnMgYWdhaW5zdA0KPj4+PiBtYXhfbnVtX2NvbG9ycyAod2hpY2ggaXMgQVJS
QVlfU0laRSBvZiB0aGUgY29sb3JzIGFycmF5KS4gIFRoaXMNCj4+Pj4gaW5jb3JyZWN0bHkgcmVq
ZWN0cyBpbnB1dCB0aGF0IHdvdWxkIGV4YWN0bHkgZmlsbCB0aGUgYXJyYXkuDQo+Pj4+IA0KPj4+
PiBGb3IgZXhhbXBsZSwgd2l0aCBOUl9MTENfQ09MT1JTPTE2LCBzcGVjaWZ5aW5nIDEgY29sb3Ig
Zm9yIFhlbiBhbmQgMTUNCj4+Pj4gZm9yIGRvbTAgd291bGQgZmFpbC4NCj4+Pj4gDQo+Pj4+IENo
YW5nZSA+PSB0byA+IHNvIHRoYXQgZXhhY3RseSBmaWxsaW5nIHRoZSBhcnJheSBpcyBwZXJtaXR0
ZWQuDQo+Pj4+IA0KPj4+PiBGaXhlczogOTVlZjVkZGY4YSAoInhlbi9hcm06IGFkZCBEb20wIGNh
Y2hlIGNvbG9yaW5nIHN1cHBvcnQiKQ0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgT3J6ZWwg
PG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPj4+PiAtLS0NCj4+PiANCj4+PiBSZXZpZXdlZC1ieTog
THVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gDQo+PiBEaWQgeW91IHNl
ZSBBbmRyZXcncyByZXBseT8gSWYgdGhhdCBlYXJsaWVyIChyZWNlbnQpIGNvbW1pdCB3YXMgd3Jv
bmcsIEkNCj4+IHRoaW5rIGEgMm5kIEZpeGVzOiB0YWcgbWF5IGJlIG5lZWRlZCBoZXJlLiBGb3Ig
bm93IEkgY2FuJ3QgaGVscCB0aGUNCj4+IGltcHJlc3Npb24gdGhvdWdoIHRoYXQgdGhlcmUgbWln
aHQgaGF2ZSBiZWVuIGEgcmUtYmFzaW5nIG1pc3Rha2UsIHdoZXJlDQo+PiB0aGF0IHJlLWJhc2Ug
bWF5IGhhdmUgd2FudGVkIHRvIHJlc3VsdCBpbiB0aGlzIHBhdGNoIGRpc3NvbHZpbmcgaW50bw0K
Pj4gbm90aGluZy4gWWV0IG9mIGNvdXJzZSBJJ20gYWxsIGVhcnMgdG8gbGVhcm4gb3RoZXJ3aXNl
Lg0KPj4gDQo+PiBKYW4NCj4gDQo+IE9oLCBubyBJIGRpZG7igJl0IHNlZSB0aGF0ISBUaGFua3Mg
Zm9yIHBvaW50aW5nIHRoYXQgb3V0LCBJIHdpbGwgaGF2ZSBhIGNsb3NlciBsb29rLg0KDQoNCkkg
aGFkIGEgY2xvc2VyIGxvb2ssIEkgZmVlbCB0aGF0IHRoZSBwYXRjaCBpcyBvayBhbmQgY29tbWl0
IGNiYThhNTg0ZGUxNzFjOGM0NTEwNzA5YzJlZGM5ZjFjZjg2YjIxYWINCndhcyBtaXNzaW5nIHRo
aXMgY29ybmVyIGNhc2UuDQoNCkxldOKAmXMgc2F5IG1heF9udW1fY29sb3JzID0gOCAoYXJyYXkg
Y2FwYWNpdHkpLCAqbnVtX2NvbG9ycyA9IDQgc28gd2Ugc3RvcmVkIGFscmVhZHkgNCBlbnRyaWVz
IGFuZCB0aGUNCm5leHQgcGFyc2VkIHJhbmdlIGdpdmVzIHN0YXJ0ID0gNCwgZW5kID0gNzogDQoN
CigqbnVtX2NvbG9ycyArIChlbmQgLSBzdGFydCArIDEpKSA+PSBtYXhfbnVtX2NvbG9ycyB3aWxs
IGNvbXB1dGUgYXMNCig0ICsgKDcgLSA0ICsgMSkpID49IDggd2hpY2ggd2lsbCBiZQ0KOCA+PSA4
IHRoYXQgd2lsbCBiZSB0cnVlIGFuZCB0aGUgaW5wdXQgd2lsbCBiZSByZWplY3RlZCwgaW5zdGVh
ZCBvZiBiZWluZyBhIHZhbGlkIGVudHJ5Lg0KDQpEaWQgSSBtaXNzIGFueXRoaW5nPw0KDQpDaGVl
cnMsDQpMdWNhDQoNCg==

