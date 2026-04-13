Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ObtBMO93GliVwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:56:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD0C3EA172
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281010.1564081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCE1M-0001fT-53; Mon, 13 Apr 2026 09:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281010.1564081; Mon, 13 Apr 2026 09:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCE1M-0001cP-1a; Mon, 13 Apr 2026 09:55:56 +0000
Received: by outflank-mailman (input) for mailman id 1281010;
 Mon, 13 Apr 2026 09:55:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCE1K-0001cJ-MC
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 09:55:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCE1K-00G6yx-26
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:55:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcbda6-bab6-0a2a0a5309dd-0a2a4502a9f6-16
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:55:53 +0200
Received: from [52.101.70.13]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcbda9-42fa-0a2a45020019-3465460d370c-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:55:53 +0200
Received: from DU7P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::26)
 by PAVPR08MB10337.eurprd08.prod.outlook.com (2603:10a6:102:30e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 09:55:48 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::c5) by DU7P250CA0011.outlook.office365.com
 (2603:10a6:10:54f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 09:55:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17 via
 Frontend Transport; Mon, 13 Apr 2026 09:55:48 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS4PR08MB8220.eurprd08.prod.outlook.com (2603:10a6:20b:51f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 09:54:43 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 09:54:43 +0000
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
 b=qlq4KxB3s7UUakxXxfMXNuuRvZul1pwvgMBzMS55Au6FTlI0caVdlGsWJpPlG5i7ARDBqQtfWyMkDNWW//IpOkgqdlwS1BKjZHwVQq9EDuVifPPEgelyTmVEjKMORC9vo8gB14tHV6a14XmzJgQyPYH131wKG4wylMi3Z5I6oHNFjOhKUkeBnCQCWNvrSM9mkCErhisCeOwjz+Sni9rFH7a+20Pop+mqZjskILo10e2X6RfKedp18WPeBDBjg2FRRyTrjcBIO5wcMEwVrqJEn+zIO2Z9/moVBHwWHd6k6/E0+w5EbbOOPkkh7j964+Zs5E9v5R/DwbFcQi9BKbrtmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LClfXYli9yVq6/36kS7I9hr8lVxTEBSejniR4OcaQts=;
 b=tMKASntf4+EZYXbe/KZiLFZZV2QUjSjfCyqBAy02pFbv3MDnllKr6vZnZGq3pw9aRG+q2g7TGv+eUiiIBoQ1gPQlIx5Wg557EGXA3xH3nYW2slzLDFziJcCJh/GwtfFSDOaC/QdQjIFWlHsJ42aZy1YBm6/eGwgnxDxOpNjxcLp/xEXrsjN4fcecbLkBJXuaQRDNUB467gARZ3zb5KXD5TW1gbf+D+Nocz4C53c149jIEbgZgeDdmS5hT9cAXsiXfjKZ93/i9wvKjyYNpPh5vpt3keMOUM5vKoqBzhRkoyxDpEeA9dRzBLhKG1W5fUSwdkb8+i6cbXSag04bCPDaLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LClfXYli9yVq6/36kS7I9hr8lVxTEBSejniR4OcaQts=;
 b=knk6pQA7wbwETB4j8cd5FuTBqHKp/DC869mXejQSt/P/xu/Hs/VpeWGV+lZasSfbk9RBYdaO/TOQOoVNMIU6yAdzKk3cv/CGWDQpj1jzM3vWI7FC4DLtDYlq9QpKvZQ8TXWDPHUDtqmEcWXfcqx5PH2jhW4NjqOnq7/CvC440us=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXTlVpcWEVTz4qkr6yIuBTfdW+Opeeh83VG5AZd4g6HZG75GT2p1Nsws/GRWfQ05DMgS5TjLzLlNZtzOW7WdpeGfSZfJI9KzZE8UdxSHWjxtPjum1XoO/zLRXICyvGMrquCbgsSA3Q8DaNoCf38R3/Z2LL614EV0jsuQn3RbGbgV5YAzRizdxpPtTyuRXEY2ujpqnEZ5/CwSGbKq83iHm/XSqxYV75D9JMrOKRSId7JdXk40ez4sNs0jPi++T1aO0vb5ohwbFeJIgU9zYfFo1DD+UeKk817Lio37zmePzKepOtM97fHiOlKuBM8o1sjSN/a/R1fCIxXKXkIQCtfTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LClfXYli9yVq6/36kS7I9hr8lVxTEBSejniR4OcaQts=;
 b=YiahNc0yVnOrZPVcIHaGIb8IQdib8Xiqia8vLHdU+lygIwtNCk2f6CMLSii+M+II9CG0U4vzfZfxuwef5rErsvdhR7fdS5nrCoHT6Kx3lIv18co6DIPWS7eOl+Z1wL0BkRO6te3hStj8DMdduePvAMNrXlHhdp8PTVRjOR81TEa7qJNaMtgrYebnUCz/kaXD55BjJs9ce4FzOZzIKIHOZEtZlh2L6QiDtyF2IgqCNoTGUTcijPza8w6/lvhVulxZs8uWDWt66XeJFhH6IgZjx5QaSTj730iGK+KIexkYwTVngWUqVrurXWS+VilkyaYxlegrF32WEFirc0RuktrTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LClfXYli9yVq6/36kS7I9hr8lVxTEBSejniR4OcaQts=;
 b=knk6pQA7wbwETB4j8cd5FuTBqHKp/DC869mXejQSt/P/xu/Hs/VpeWGV+lZasSfbk9RBYdaO/TOQOoVNMIU6yAdzKk3cv/CGWDQpj1jzM3vWI7FC4DLtDYlq9QpKvZQ8TXWDPHUDtqmEcWXfcqx5PH2jhW4NjqOnq7/CvC440us=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>,
	Hari Limaye <Hari.Limaye@arm.com>, Harry Ramsey <Harry.Ramsey@arm.com>
Subject: Re: [PATCH v3 1/3] arm/mpu: implement setup_virt_paging for MPU
 system
Thread-Topic: [PATCH v3 1/3] arm/mpu: implement setup_virt_paging for MPU
 system
Thread-Index: AQHcx192xSccBJpVr0WTpZ/GMvC6RrXcxNcAgAADXwA=
Date: Mon, 13 Apr 2026 09:54:43 +0000
Message-ID: <92DD0227-9023-4824-BB39-56E7F20F2F27@arm.com>
References: <20260408135531.1744388-1-luca.fancellu@arm.com>
 <20260408135531.1744388-2-luca.fancellu@arm.com>
 <43fd7fd7-43dc-4c17-8ff6-b58800fd5f46@amd.com>
In-Reply-To: <43fd7fd7-43dc-4c17-8ff6-b58800fd5f46@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS4PR08MB8220:EE_|DU6PEPF0000A7DF:EE_|PAVPR08MB10337:EE_
X-MS-Office365-Filtering-Correlation-Id: 60c259d6-b6b5-4349-510a-08de9942d6fd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 OsoH5KCKA51XS+C29GhxOOXduO1i3QHelBza7NXzoXB5C+ZfEsOh3OgUPJJQe3B/ut0eDkjqf+czEmKVxx1m7ELUlOFZIqhLdQa3PBbgifbIyGqjc4opr3Di9ICwLOTdI/8l7KuZM0CiJ+skrYo5/kQBGNvMB/UqiqqsxX7QcnsPv+c6kdJ7xpTO8p+grYVbRdAQPDgP7DMSJgw0utpM+12X2yY9n6y/jzKkQFvlKwFpyFfj3qT7GS/vGXADmc3KmWnVI6jsc7cRh4I5sOk0EKdIn0uyT8MQcmxi9QzothFyt8ipuDfvb60isx47PqeHHKkp3AXmDJYDxoBHvUOclfWw22Gl6W1HpNGDkTauYhyPfZ+Z0X7GEyaCZ+Zr9o8+HoC6vbJ/N/oXowAC1LJ7DAYBW3qaVwSWwYoOQE2uZ2dtqgkAA1rvZWAEf8U8U6fbiPU+uWOB27jF0WJg0kYl9dMIg9Wf+bmVuIY1gbSaMy0ZrBk2zz3BYiQxidDMJBpgLjAvCCbbYzBh0EPDcoSF/w3fOOVOB2//rDSs43762ejKzsJdZETDyior0GhUn2DTRTv/rUW9lf/LwK0JtcmdyZq7v4i41RGivApRx4Mv7klfprG/YNqn7KyCwGWamdObgmBkwdH6t/qldYzvyrriHI6ADl8YNsaEX3eCIJPIUzcID/aXjbFQoeYay4nA1sRaApEGbuD7hjXR2uV2qrI6MvUZ6rUxw09VsPKnPu6nFcCvazelGq4COGgn4q9+D9SY5mA8VQqoQ1hjUZcTQOLa0zi4H2VJdjWgPn4HsYg2CLQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3779978901E5B94D92AA371D3F7FC00E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Z2ppjeAYEOZ2+44Rfp/7d1BC7efH7v29q4/03OXPd9TDpyRLnHXIlRGYMAfLcJLTrjQIMb1aZWC32LnbU98xcUHPUju/FRsa35FnTG8pXRH3DXAex9HDbvY7LxCh/k7Z2ax+aD9yL1v1dq6td/dUwNLWAUSHkHcNPrVRhNkPTM/ecURUEzqvB8zppvUqpEV21YaEfKgj7Gni+a9Yr+V9easP8Myu+NaO3pMO/wVQH7LHRxG677t8+yQLinIc6FTpE8ZQfp9cpE7Wgxl+ecokG7ApMnaR95ZxuriJRB2zwSBRcZvtGAnut51MQ4qeB5E00yn7V+lLHgNd784FoQ+ncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8220
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18283882-79cc-492a-a6af-08de9942afea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7cgfcHh9o1zwikcSBvOWFP+wv3iePr1hlLxQcn7+FR4Zfs80/Ug0o0nrMbGYBbk/+QI3YXCpjk0IUBTMYRS9py7qk927pJ0zz8Jes/pfRpQi2G5snFFfQ45M0YgBwKGSH36veVlUSG4GKGdOt/wE2vYBcg77eA1jNC89VPUj9Js8sOpL5Oy70c34dzefGO27GiuLoZM3tdhzlqs6T5lg4lfwpDqtWdmYVxj0UhNL+4Z4rdLXZ6GeULiL4S6wIPgJiyW7iG8wGuwIXLHbKQPpTjtMWdYKh2Aztfe5tqCiWSBvHlPqU+7Ti5Us4LMijxiOxXKwHUxuOjyfqAkchwdNpg5AVwjc785/3uqE8XGc1KWG0LDBuWih706aDtTKocykenikFCfLje7v7x82ZEJ+8M1lyDJ/OEOTI6aXoumUIaEHu3cTzHfA3a6FKnSHDGTwpibOkQYzuC8xaEWOSb0cNMzMFSMNaofHD5xSpQdBt3viowXvv/9o1sNk4e07IKmpw0FALu3/+X8TPR9EV2DlaxxSMNWTbxVfVGABA8YhWly1JJpTvI+6ZJN+BwLXXLkP8JvsqQY7mO5gIZUQChxZcDjxmzopcRLqaIm+BpvtPVYNSx90WPj2hkkSKaXMGRL/Bc3FbCheHIRTG8awOjyO7jjaOVywB5GBvN9l4+rQiiOpbgRUnei5Sby0ikZMn08P0F2BwkrbaOqDUW9tbicOYSE7ZSPklXs5aoIR7vpEVDZagJlZ3ZqILpOGS+pHr2ND4Lq+pTAYGvNOuiM2j8UliA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m4RmwV7Bi+FvYQpplOi6nLyuDLd9ye4V7YDqYv3xXuxr0MCj5aY2KwVrNBqIpxWB71wFwwdTvDsoptMIyCF7ge4oXMjH3l1Mo8LrkOfilzSCwYN5uHCtomTF/Fo4e4v5LmRt8T82Ev5xDN2lsEy+FMR3kj7PFiGyX3zDFbZ+UMB/D/zgZfnppn/ZJfY4ACj5zPbUk61b/u/sQwyBB2z5j5ivo8Lb4Olmjed1CPp+X7/axKZb4+fuVMK6XA/va/u9ouMwu7HRd3TN35IqfF371kkD1CcgtrQVyesMXHNl1wSRa/pV3czMF0DHbaJwzUspQTFLeOE6GAAWPQ9HPwUFicm9kEcQIWQh/fYYj0S4RGFgfQYhLV2Jscr/UloN+HNLkuPx2qaP27yD2M0LB/1atgiiRUm525yZn2J1oU5JKldq12q5Wi+9IAWJp6uKNOlp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 09:55:48.5921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c259d6-b6b5-4349-510a-08de9942d6fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10337
X-purgate-ID: tlsNG-720697/1776074153-46B27CD1-4725C3EA/0/0
X-purgate-type: clean
X-purgate-size: 3518
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
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Wei.Chen@arm.com,m:Hari.Limaye@arm.com,m:Harry.Ramsey@arm.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vstcr_el2.sa:url,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: 4BD0C3EA172
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

>>=20
>> void __init setup_virt_paging(void)
>> {
>> -    BUG_ON("unimplemented");
>> +    register_t vtcr_el2 =3D READ_SYSREG(VTCR_EL2);
>> +    register_t vstcr_el2 =3D READ_SYSREG(VSTCR_EL2);
>> +
>> +    /* PA size */
>> +    const unsigned int pa_range_info[] =3D {32, 36, 40, 42, 44, 48, 52,=
 0,
>> +                                          /* Invalid */};
>> +
>> +    /*
>> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always config=
ured
>> +     * with IPA bits =3D=3D PA bits, compare against "pabits".
>> +     */
>> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
>> +        p2m_ipa_bits =3D pa_range_info[system_cpuinfo.mm64.pa_range];
>> +
>> +    /*
>> +     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register ide=
ntify the
>> +     * memory system configurations supported. In Armv8-R AArch64, the
>> +     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
>> +     */
>> +    if ( system_cpuinfo.mm64.msa !=3D MM64_MSA_PMSA_SUPPORT )
>> +        goto fault;
>> +
>> +    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b=
0010. */
>> +    if ( (system_cpuinfo.mm64.msa_frac !=3D MM64_MSA_FRAC_PMSA_SUPPORT)=
 &&
>> +         (system_cpuinfo.mm64.msa_frac !=3D MM64_MSA_FRAC_VMSA_SUPPORT)=
 )
>> +        goto fault;
>> +
>> +    /* Stage 1 EL1&0 translation regime uses PMSAv8 by default */
>> +    vtcr_el2 &=3D ~VTCR_MSA;
>> +
>> +    /*
>> +     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translati=
on output
>> +     * address space to access the Secure PA space as Armv8r only imple=
ments
>> +     * secure state.
>> +     */
>> +    vtcr_el2 &=3D ~VTCR_NSA;
>> +
>> +    /*
>> +     * cpuinfo sanitization makes sure we support 16bits VMID only if a=
ll cores
>> +     * are supporting it.
>> +     *
>> +     * Set the VS bit only if 16 bit VIMD is supported.
>> +     */
>> +    if ( system_cpuinfo.mm64.vmid_bits =3D=3D MM64_VMID_16_BITS_SUPPORT=
 )
>> +    {
>> +        vtcr_el2 |=3D VTCR_VS;
>> +        max_vmid =3D MAX_VMID_16_BIT;
>> +    }
>> +    else
>> +        vtcr_el2 &=3D ~VTCR_VS;
> This is the last change to vtcr_el2. Why do you put p2m_vmid_allocator_in=
it()
> in-between this and write to vtcr_el2 register? It looks odd.

ok I can have the write to the register before calling p2m_vmid_allocator_i=
nit, in the
end what matters is only to call p2m_vmid_allocator_init() after setting ma=
x_vmid.

>=20
>> +
>> +    p2m_vmid_allocator_init();
>> +
>> +    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
>> +
>> +    /*
>> +     * VSTCR_EL2.SA defines secure stage 2 translation output address s=
pace.
>> +     * To make sure that all stage 2 translations for the Secure PA spa=
ce access
>> +     * the Secure PA space, we keep SA bit as 0.
>> +     *
>> +     * VSTCR_EL2.SC is NS check enable bit. To make sure that Stage 2 N=
S
>> +     * configuration is checked against stage 1 NS configuration in EL1=
&0
>> +     * translation regime for the given address, and generates a fault =
if they
>> +     * are different, we set SC bit 1.
>> +     */
>> +    vstcr_el2 &=3D ~VSTCR_EL2_SA;
>> +    vstcr_el2 |=3D VSTCR_EL2_SC;
>> +    WRITE_SYSREG(vstcr_el2, VSTCR_EL2);
>> +
>> +    printk("P2M: %d-bit IPA with %d-bit PA and %d-bit VMID\n",
> All these are unsigned, so %u.

Oops, blindly copying from MMU code, I realise we have the issue also there

Cheers,
Luca


