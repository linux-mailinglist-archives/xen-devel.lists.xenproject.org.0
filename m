Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AEF8D6444
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 16:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733735.1140060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD33v-0005D6-EJ; Fri, 31 May 2024 14:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733735.1140060; Fri, 31 May 2024 14:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD33v-0005Aj-Aq; Fri, 31 May 2024 14:16:55 +0000
Received: by outflank-mailman (input) for mailman id 733735;
 Fri, 31 May 2024 14:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tx2a=NC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sD33t-0005Ad-QD
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 14:16:53 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2607::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d80d3e2-1f58-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 16:16:53 +0200 (CEST)
Received: from AM8P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::28)
 by AS8PR08MB7791.eurprd08.prod.outlook.com (2603:10a6:20b:52d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 14:16:47 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::98) by AM8P251CA0023.outlook.office365.com
 (2603:10a6:20b:21b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Fri, 31 May 2024 14:16:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Fri, 31 May 2024 14:16:47 +0000
Received: ("Tessian outbound 53b276c4c668:v327");
 Fri, 31 May 2024 14:16:46 +0000
Received: from 12d92602d80b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 328B485C-F748-4017-BF46-D1A0EDE65C66.1; 
 Fri, 31 May 2024 14:16:40 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12d92602d80b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 May 2024 14:16:40 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB9749.eurprd08.prod.outlook.com (2603:10a6:10:447::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 14:16:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7611.030; Fri, 31 May 2024
 14:16:37 +0000
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
X-Inumbo-ID: 6d80d3e2-1f58-11ef-90a1-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aJ2WSLqrUUc9Ao0RmsVmWk3yFf31t+QvP7lYy/02PxJ1cyF+BEwbs09QfyHmUVI9UABJp6hW4sdc45vLJzEHSrhx72E6yWtvDuRxLQQ8IyfzRxujIpl4OWOmXiI1iLuBpOkUI+xtL61MISrKhduK9aSXZM5fJ5kcU9DOB0/kcJVodz//AZbtBcHrTMLJAUc2/XjD1WFHXaKtaBg8Fp+o7LSySppANH4dyLH3p7kmjrNEGPKikMSbD5CvkfCbTLhvBPjR5LsfFN7vZVxZmAw/+eb5F0NJM58IBERwP2XMDHT4/7XFx4bSBkQJNPBO6EsdP4NepkpYalXBbed3WgIlTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6qopxekm9rB9IanXP9gFZ9QrXGNKkARbXTOYOzxXa8=;
 b=LkE3ZF8EdvATkLRKzaxRk1e29EFBGfwpAEnOoJMks3hbsOR2DFVbHdAvBlG6uUaKSyHgQYKFdgXJF8dc9DTm63C1G99h80n5QSEiUXoBwV3zZ3t9g9/eLVAiwnKGrVdq9HBLViBs1ZfHzn294ETQYadPLImpk8E2RMbEToWrs63qFAUI92Sd8Swt5/8HMOj9yHYdGlGR/XYuJMLyN7bnPyg+9vYvWi4GsXa1Q/eTTQDILzrHcyF7nCBttA6DqCCFtnUxCqLJLVY/aEDxhZSdOTqt0/gpVNkFoiQ56BdBRAPKAasIaLd4WFO17rm6eZqzuesw6nZUXlzlxfFhKm3NtQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6qopxekm9rB9IanXP9gFZ9QrXGNKkARbXTOYOzxXa8=;
 b=NFOyWP5JMH3wWta0uZWytfrz03p6cH7uNqb1HOkumDa9Lfvtp8zniU/KlvpO2GAQAv+XOijSsKj0sHjj1Fw56ndqahcW5uOQ62vKUzmoZcPy9HrRMdqY6LzMobKF+5if2koWkJNvN4Az9AqOOUoDGk5FuLX9xQaPd0F2OPfNcDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3fe3f95b2d0976a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUk1RMImh6HyOtKAEiUneZs02SbgF4WgdGlp8kxRlh5SAa1iqbLYgk2i7bSIUOLG08wOUvHHqAok+bUm3wE6xP6T7wLc4ydIc2Z6GRKALi63JyVVR+HvnzTjXx4V/4sqYeBCFBSEmqTzjgN8Ex8qV97YLYkTDMhGBZVAYKDVJMDOPY3vvJeIjU3JTV/EJXMZ8LzKpizkHTKrxg1uVVAbU4iqOWqWFY3kGC9kkdjOrzr/RGv26J62emLm9nKqr2rSd7JeMkYcYGmFKrcH2tpvaRWtW4DxncFz8miCwlCCE1WJacq70CIplVcyabLl6pKAqPKQhjrTRirLhPtPyig+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6qopxekm9rB9IanXP9gFZ9QrXGNKkARbXTOYOzxXa8=;
 b=mEUOxyzuhZxhFPbrWsh4A+UDBHXXe7KjpOyFyffgSn90Pdf2WwrYQxrXY7kVdJMJipT8cT/80UaHPkai8f9tChEii20AZH020Vqwaji+dPpbhA7FU/LZx0bVQ/T/BPnGPk7lyOg00KTfpHvHQuelwSblgHpzG1phmGzInLJ7OKqgcTYH0jBNH7JES3qv0LDvLNWbqEsCAJvg6Bx1RouqAfCVtYeeBAlI6Qic2mza5DSMmt6hLperWnkjOv5KhvSLhma2YPIUIt0eegAMJTy15R5gNCXW9KCVErcdbTuAah6Ld4STg2KHgRm6fEm+4I8vUP0jtVKGLGo19mCWglwTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6qopxekm9rB9IanXP9gFZ9QrXGNKkARbXTOYOzxXa8=;
 b=NFOyWP5JMH3wWta0uZWytfrz03p6cH7uNqb1HOkumDa9Lfvtp8zniU/KlvpO2GAQAv+XOijSsKj0sHjj1Fw56ndqahcW5uOQ62vKUzmoZcPy9HrRMdqY6LzMobKF+5if2koWkJNvN4Az9AqOOUoDGk5FuLX9xQaPd0F2OPfNcDs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v5 5/7] xen/arm: add and call init_tee_interrupt()
Thread-Topic: [XEN PATCH v5 5/7] xen/arm: add and call init_tee_interrupt()
Thread-Index: AQHasZmEe4CnQsBnEUWYbv68lN21P7GxZwyA
Date: Fri, 31 May 2024 14:16:37 +0000
Message-ID: <C69A15E1-AD34-4F4F-AE30-B90C861AB77C@arm.com>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
 <20240529072559.2486986-6-jens.wiklander@linaro.org>
In-Reply-To: <20240529072559.2486986-6-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB9749:EE_|AM3PEPF00009BA2:EE_|AS8PR08MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f88842-0eb7-4c0e-aad5-08dc817c4e63
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?hpL6UHXUHPH5xo1FGFS5Gbct2r/FpwaZ18Vi++K/v2YztysViwk1hhvZR3+q?=
 =?us-ascii?Q?x8tG59MAXpB0xR7U/KLNytRcGKg22FVtlc5eSSEpPW6fUsiDjvBJlK++7IGP?=
 =?us-ascii?Q?v9GspOYkhvpAB7DUJFP4sKAI79Bbu8pVtBUa6Ge1SDBC8YyfvP4WSq2/70CK?=
 =?us-ascii?Q?Sj1fTEXG1+QneEgGKKnqMmPSfPs5+PN3AUdi9uS3OMO8bN6eYrmqMcdMEbUY?=
 =?us-ascii?Q?lbwdQH+tTQOKDAkQ56GWenz8gSUh/SHnngzGlSy3/lUzHx6zemDzx0kGqDCB?=
 =?us-ascii?Q?dqe1L+Ux914rp/KqL+UO0jL1aqD3T6rbesWR1fjZ9IOL2x6ZF8dYBcv5Km2c?=
 =?us-ascii?Q?Xonfz1H2dyzqZVlfam4dbJNkZRi+bnctcgaoxm2PJFHZK5Bq6QAkR9mgRG7h?=
 =?us-ascii?Q?tpVMIKuFut6nrX8NrXMS0aVoz+/MDBJOzZS2TI1OZbPWFuTvIxrrNCeFvVpi?=
 =?us-ascii?Q?Hjo3dgUq3X+uhBapnY+ZMUeivapzGQu0MxeduDU4G09QFqIRL6OyW6Uio0xq?=
 =?us-ascii?Q?4rtL7G/3bRvC1h3bf0fSVeluQn4zqWDwNyHOLRUj7oFrO7+ABfUp91aCGmYl?=
 =?us-ascii?Q?rn+BHFCKFd8kUiOGqAmePw8WXhONjjhpHccR4vy54/PruJ6anqyzTpOUPagW?=
 =?us-ascii?Q?4E0vdpyMJfoEUG69KtAOquQ13b/gx/K3L0dTKpvl5u8ISiqfWXLdp9itiKRW?=
 =?us-ascii?Q?NLxX/hw9Gof4HQRf6oKLskjObzncdUCTgdzfUujqj5WiCECs+dlyBij3lJOn?=
 =?us-ascii?Q?EnZ5dAzWy9njcQSh/rXSc5qR2VXpQ+6lkUocoGMlRqHqOA1m0WJ0Q0s1/H8f?=
 =?us-ascii?Q?Z/PyV4R/5DWUEKCxf6JIgwvznAJWSXrvfHOn12o/WNt01v3GzjxnfZg5Y3aL?=
 =?us-ascii?Q?qlv+a9Cb1uZhDb4SOR7Gr0RouvtethvgA7/9W52EYOBinRMUJL2Bi6TZzBq6?=
 =?us-ascii?Q?js/3heEZpsQAXnMMGlcr9nmo3L7rt1WBmQ6LtTTfO3608sX+V0V8Drte7849?=
 =?us-ascii?Q?d4tDVi0lBqXSOxuEL6PoKCVyXHbtyzv8Kv7IwT/D2g0emCoyapNFYrKr9/Mp?=
 =?us-ascii?Q?EpQwLNFd8Qv3uLgmFI5KLDcHHBY4BgBiPikmW86wH/IOR+3DXHpcFSngqaZE?=
 =?us-ascii?Q?hTJ2/c9CRoLkVMOhYpExgnrb+nYvp/MlCQhr3lHnKpZiRwpY3sV8vXfV4E1p?=
 =?us-ascii?Q?L01RNQqacfcCSIyxhyn0+CCLskKwn0Yjb6vNFgG6+kNH7zvI5jMd86yVxMye?=
 =?us-ascii?Q?zGW+sP/kIm0QtZNcFmSh/9j7D3knbtWurXnWwA3/xCllqG6e2X+uDxOcGzur?=
 =?us-ascii?Q?ok6Ok3ghLk1j7ilYnzz5hSQZnf8VyUDj3qb8khaTCYdr+w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7C9CA1BF09453847B5CEA9E0754F365B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9749
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eef1ddfe-ea9c-4139-25b3-08dc817c48db
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|35042699013|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oIVb5+KjWvNPjTQllYU258pq6R8veSaf6iqAuAiK6vvA4+lIoryM57mQxV3k?=
 =?us-ascii?Q?oDUxSchqgMqVPxdAYQIwzjDdv9RODscMyDUJtxxgHHbrdPdXWRMoihuUmJDL?=
 =?us-ascii?Q?kWijJ8NVdgfpZQ29peu8yWSoOFNJYcGyPFzQ7el/zCiIQmw6Ltga1vE2zVKB?=
 =?us-ascii?Q?wM/cFrqHiKSBJLNV2f4Na/O+H1lr2dD6vWVu8TgWjxfHMrV0JXWdBgZc5OwE?=
 =?us-ascii?Q?OBw7oA9/QsKHkHYUVM14mltglwJ3Q7EjiBfHTb1jTFov8qb2/N+ttzHuCRsR?=
 =?us-ascii?Q?wMpyrzkuH8TouX4W2UXKaufwYQucr4Z1tSvpJfZZFZNSdPdT3OiIDNRuyNGU?=
 =?us-ascii?Q?nY0z7y9Fjdg/afTIELPm5Cb2HHRQ630jAW2f4ohqIZTtNxMEZieMoUuSDHdT?=
 =?us-ascii?Q?J1FpELSsOmITlJVaWfB5CLkaNEvO/vJcSwHuBi0WBqfULm35+8DoZnpwk+tu?=
 =?us-ascii?Q?n/pL8lRAwtlN9oa+X4eBgSmp/CSgP1GxxZBtSJTRVf2cZmomwPQyyjn26vPk?=
 =?us-ascii?Q?ymMBDReQ0Qww/It4ROJH4djzJmbB5owQOwlUsKiXjC6si68WA2YGTt1gsIta?=
 =?us-ascii?Q?fB+cLTj+Lv0Uj1ulUDUi99sZkNNi1Imq8xC+YWK7FfynmZD4yMakAFhcRPDd?=
 =?us-ascii?Q?JIUfn63i6A+nis3kDUS5H306ZgyK5wblXJ8grcmJrkrFbPRlw/aWj3oirTUv?=
 =?us-ascii?Q?vO6kQvZyU9LR/h3V652cJTOJBY97qfKLUR3Lfr+zHdy5TfUUjwUmjQXUp2J6?=
 =?us-ascii?Q?DBzQ8S9HuwZRttIIRZxaojmlNm9vut1yQwf8PTJkAQqD7aAg32x8vzTqfcXq?=
 =?us-ascii?Q?GlagOGWWotGtnmam0Hg1JrT6iUBOc6NYB4jwYR35/fThk24qiI+VBMX71xzC?=
 =?us-ascii?Q?gZU2n9wmTU5NF/YqfzRGczXzw3WVhrwqsE1cEfq28Us7C+8Tjo7PBy5OsnRK?=
 =?us-ascii?Q?uUjnoKcKN7PXTGBahVt9u0z3iiDH+QF1jIhrEmI3WQvlQQMoHJVtuXjXoA8Q?=
 =?us-ascii?Q?3GyS5sHsimDIyRmRHg+r/CMHNgpqdPVDzh+9b2rpIS6OeAexYkTt72G/8t/4?=
 =?us-ascii?Q?8HyBBkcH3A5O9TRkhJyo7AAOwd75CIpfC6BEwBPAKCN+I8NFfgvozZXp28pK?=
 =?us-ascii?Q?87q3go3LVsK3AeWv5gJNh7eJApUXScILXUe626fR57FpdoFdCPXdaup+OHU5?=
 =?us-ascii?Q?RH/bF3MH3RX+0wOufsStV0RtcoafmaxgfkldKE4qmchXFTZIvErWY3XKwBCL?=
 =?us-ascii?Q?zZENt0mwALI/BHUoLdohcJb2Rq8O2+PLqaxiG6LFEvP6uQDZynyuwcDfCmT+?=
 =?us-ascii?Q?pSC+365RRYhYUPJlnleISGag9P9Ix1m8MzYTHBxtNkqmByx9HinhY0INffzP?=
 =?us-ascii?Q?WiTpVeJpKOMFRxAzm+6vM9aSAG9i?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(35042699013)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 14:16:47.0068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f88842-0eb7-4c0e-aad5-08dc817c4e63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7791

Hi Jens,

> On 29 May 2024, at 09:25, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Add init_tee_interrupt() to the TEE mediator framework and call it from
> start_secondary() late enough that per-cpu interrupts can be configured
> on CPUs as they are initialized. This is needed in later patches.

Just a NIT:
The function you are adding is in fact just an init on secondary cores and
wether you are using to initialise interrupts or something does not really
matter so I would suggest to rename it to "init_secondary" instead to allow
future use cases that are possible.

With that done, feel free to add my R-b on the next version.

Cheers
Bertrand

>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/include/asm/tee/tee.h | 8 ++++++++
> xen/arch/arm/smpboot.c             | 2 ++
> xen/arch/arm/tee/tee.c             | 6 ++++++
> 3 files changed, 16 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/as=
m/tee/tee.h
> index da324467e130..eda8a8aa38f2 100644
> --- a/xen/arch/arm/include/asm/tee/tee.h
> +++ b/xen/arch/arm/include/asm/tee/tee.h
> @@ -28,6 +28,9 @@ struct tee_mediator_ops {
>      */
>     bool (*probe)(void);
>=20
> +    /* Initialize eventual interrupt handlers on the secondary CPUs */
> +    void (*init_interrupt)(void);
> +
>     /*
>      * Called during domain construction if toolstack requests to enable
>      * TEE support so mediator can inform TEE about new
> @@ -66,6 +69,7 @@ int tee_domain_init(struct domain *d, uint16_t tee_type=
);
> int tee_domain_teardown(struct domain *d);
> int tee_relinquish_resources(struct domain *d);
> uint16_t tee_get_type(void);
> +void init_tee_interrupt(void);
>=20
> #define REGISTER_TEE_MEDIATOR(_name, _namestr, _type, _ops)         \
> static const struct tee_mediator_desc __tee_desc_##_name __used     \
> @@ -105,6 +109,10 @@ static inline uint16_t tee_get_type(void)
>     return XEN_DOMCTL_CONFIG_TEE_NONE;
> }
>=20
> +static inline void init_tee_interrupt(void)
> +{
> +}
> +
> #endif  /* CONFIG_TEE */
>=20
> #endif /* __ARCH_ARM_TEE_TEE_H__ */
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 93a10d7721b4..e1c1e20efd98 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -29,6 +29,7 @@
> #include <asm/procinfo.h>
> #include <asm/psci.h>
> #include <asm/acpi.h>
> +#include <asm/tee/tee.h>
>=20
> /* Override macros from asm/page.h to make them work with mfn_t */
> #undef virt_to_mfn
> @@ -401,6 +402,7 @@ void asmlinkage start_secondary(void)
>      */
>     init_maintenance_interrupt();
>     init_timer_interrupt();
> +    init_tee_interrupt();
>=20
>     local_abort_enable();
>=20
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index ddd17506a9ff..8117fd55123e 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -96,6 +96,12 @@ static int __init tee_init(void)
>=20
> __initcall(tee_init);
>=20
> +void __init init_tee_interrupt(void)
> +{
> +    if ( cur_mediator && cur_mediator->ops->init_interrupt)
> +        cur_mediator->ops->init_interrupt();
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> --=20
> 2.34.1
>=20


