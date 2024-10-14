Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731399D6F3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 21:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818854.1232141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0QLt-0000Pb-4G; Mon, 14 Oct 2024 19:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818854.1232141; Mon, 14 Oct 2024 19:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0QLt-0000MQ-0c; Mon, 14 Oct 2024 19:03:33 +0000
Received: by outflank-mailman (input) for mailman id 818854;
 Mon, 14 Oct 2024 19:03:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7KN=RK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t0QLs-0000MK-G2
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 19:03:32 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00d4a7ed-8a5f-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 21:03:31 +0200 (CEST)
Received: from AS4P190CA0063.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::14)
 by AS4PR08MB7902.eurprd08.prod.outlook.com (2603:10a6:20b:51d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 19:03:27 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::70) by AS4P190CA0063.outlook.office365.com
 (2603:10a6:20b:656::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Mon, 14 Oct 2024 19:03:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Mon, 14 Oct 2024 19:03:26 +0000
Received: ("Tessian outbound 5c9bb61b4476:v473");
 Mon, 14 Oct 2024 19:03:26 +0000
Received: from Lb198c0581f9f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B0151C4D-5477-4E96-8FF8-D3B191F23C8A.1; 
 Mon, 14 Oct 2024 19:03:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb198c0581f9f.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2024 19:03:20 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB4PR08MB8078.eurprd08.prod.outlook.com (2603:10a6:10:386::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 19:03:17 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 19:03:17 +0000
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
X-Inumbo-ID: 00d4a7ed-8a5f-11ef-a0be-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U+QbWb5T9Q9rWP89I63a6tZwc9YNQ1UJhZM5ewm7AhEvUD/4tTBMyPdsTtIxUzUMvO4E0A7pH7bs6901xzzizZXEJ75yV4SSpCByttY/cEoSGLHXHK0f3v+zHqnbhb0LXx/w8oxVYOVeUohsTaYTyjEraOXnBZI28klJBkdAF6dzz3k+oA9iR73w/Ll4LofsrcBmr52bzUX2dc1891DAYcxPHQxIgceutg4FGbt1OlFaNSuFmyIhUHVMrwOYjh7Wkn4ojCztBa4vR5p0dmLsUKUzZknriojArNvjnepwbnULlOufWm/vk+zEKWWfg4N4Sj4Ir3NptPt1dxk+sf0usw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY6loj9QoGNXCfU/Ew1xShneuszgigDEgY8qLYPOvpk=;
 b=rt8s4ePeZjyn/fwiKyUWhwX82/KD6xooxkm7533bPVrTZvHS5uI7Y342qzMH/ED/l77Gu9szPSiE+/k51RCZX3nq6/Emk5HQhlDqx0cnymMBfR05T2PWQlyB5H5YFDzSyDju0t1dEwxRVObt+4h2U+FCscvNsS2DbYFSJkBnywedmQaV5B9bBhqga7EVeyRHF62N3djs0Yc2rCHnNNK+XJXT1a/OzV8LmZlmLLQ+Xibg7hGxNrU2y9ac8E3gvYiSWBCmIfK1CZQKWG52+dp1hSyMh6+5Albg+QTf5EsvOxceIYogqNTxTlekEVn2Bs67vxvpJ5xI9Kl8KKx4cophDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qY6loj9QoGNXCfU/Ew1xShneuszgigDEgY8qLYPOvpk=;
 b=cB6s02j89BBN0ug+rTcE3ZBZIzJN3TpgJh+aHI1Fj+VOvua0qQx29m+DP843hMHVsHXzL3lEOu/vfPQeFonpJYwLSVWcqEBKYrOB2pWo9/1e/ug+g4Hp2LBNF8LgmAZfkbt6aSzlnaN70tn6gb187HnelTQamZVrRBXhEWjlnR8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6f826a6774411ac
X-TessianGatewayMetadata: CoZP5+gxg8xI6WlXlStrwAyphlv2qDF9ae6MvAWs+vQ+QJqrRaRFqqsZe69h+YLNFmum2dh9311umdY55M71T06j0p3MGCJDKjpZbduNgrt9d0D2eg+SJs34Ko6tUd5gWp/tvO0FxtnJDIg1SEtx3+TclAEOQSRZQ9ALIJgmPgc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IT9qjn5yAbsQN6b5Vj0nEb7VNgHALy6HjQLIzzi1lMEhjOCDvF1qtQvlT96Go38WFgTDKqM6K5IcXeEYSvwJTTspLPwZnP/QZzpy3WIo0NGR9VALuILrj57y0pzmRIKSbUtHL3D3jeK+sk9XCR0TrPJ438Rsj3NukaDxSxtkOP42jSLIE4aB06YV6CmwebFB9MixPBLjrevy8ugo5ferCdtYZxwhj4sUH5oU06o3GGRiv8bLdP4bH7WGvIDrODrfuhzDai/YnSFNKufqyIw/BkkGRGHXW7ZGesQETShbn9LbjqsptLeK7WgZQTcYHTu+WQ0qmX9mmhSK79aYLH6rxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY6loj9QoGNXCfU/Ew1xShneuszgigDEgY8qLYPOvpk=;
 b=tNSrW6eBg2FY4m07ib/EnJjp+M1TPDkaplJf9e9XgfH9DimO7djKA4UhM/jDwLQxKD/0l4BfhYcYc5nSZYsmq1BV9SMgZ4x7rie/KInP0RX8a3f42gtTf1WkZfmAy9NNp5WB2BepkaQo+kART7Vu1h3/jdhpzuI4uWT/LLTcrpi5pvWS6meuqOmEZuGrTh29OkvMkzdpzCalGuMy75n32nPX1DqDVOKz4mKPmvHLo513ADUaKXEZmQNGIBRNhN7KfjSZdWnDEdydIdAdAAj2yynvBidJUb9qP2tD9yKvoOvFGJJN8G26xo1VPFOFHjUIwpw2aqNnUZc2y/AHtIdasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qY6loj9QoGNXCfU/Ew1xShneuszgigDEgY8qLYPOvpk=;
 b=cB6s02j89BBN0ug+rTcE3ZBZIzJN3TpgJh+aHI1Fj+VOvua0qQx29m+DP843hMHVsHXzL3lEOu/vfPQeFonpJYwLSVWcqEBKYrOB2pWo9/1e/ug+g4Hp2LBNF8LgmAZfkbt6aSzlnaN70tn6gb187HnelTQamZVrRBXhEWjlnR8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Topic: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Index: AQHbGx1+kMX1zXLp+0awtOclj3x4RLKGoSwA
Date: Mon, 14 Oct 2024 19:03:17 +0000
Message-ID: <4BFB5897-2C7A-4A44-B9E9-01BB7940BFF7@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-5-ayan.kumar.halder@amd.com>
In-Reply-To: <20241010140351.309922-5-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB4PR08MB8078:EE_|AM2PEPF0001C715:EE_|AS4PR08MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: a17c4458-f725-4e1b-ab5e-08dcec82e26a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?zTzr1W5jt5JSwSTnoBebJyGbWhkxz0XFMDJTe0Rr0hmRiMrbJDOJy8jEifhy?=
 =?us-ascii?Q?FVjt+mMT8hcPyicRvwJLM0kms5cLFAAMwuysx8353kG6HOmipBDfPQlGIbzq?=
 =?us-ascii?Q?zl+XzAg2pQehsmAjKGK5wBqnxqB6y2t+zTQSjze1hShJf6ODXFsYUfcZrAKU?=
 =?us-ascii?Q?SHLoZzz3BZabgHR02iRQrMyK1o79HGhL8xBFr1qzVaMXG0lzdkB4tnfjMf9v?=
 =?us-ascii?Q?IsuV8eCnbewkBCIj5+00eKZMS9Bns/dcHMhvv3m2dTIVZDLdj2rR4SBLG6dX?=
 =?us-ascii?Q?eA0wSXuXmCckkk6Kq1M2fJY6TgcVvIL/e1bxsTPpPKc41+zIJ1cVtttAdNee?=
 =?us-ascii?Q?RzWhTqLxKI/OCirR21u8Tbmh2GBxRWIgU4kXOW0l4Wm8W1FrP6bPhjoospzP?=
 =?us-ascii?Q?pnVd9UBmPum9icp1OHhuQNJJ9NN+3x8RQeE75lsCfUniUmJ0tDYc1GV5xat4?=
 =?us-ascii?Q?WWvWhw67LM4zlIpHp8vb0hdJ4EzWXpdBp3pIbvICd30J01fD51QIjKvvCAu2?=
 =?us-ascii?Q?lqp58NbuRQkqFt2KFqOC+Yts+76pqH96Wv5mIgUTSzTLtRBLEfHAp5AQtKcR?=
 =?us-ascii?Q?bPoaaqCFArvLID3ur+Ih5wdq60YCkD8BBQuKSMoLgtmPq+FIY5uUgqNLOXTq?=
 =?us-ascii?Q?H3SR/snFwuyyOwi2pe5goEVVwL0s1liwHe9E17jmnQQkHK9QD40d116M/8KE?=
 =?us-ascii?Q?f6ibTdlNjWq9z3oJ2C9R95AgrOuCNdlhb0KHjAKpyu7fuJnCqNv70G9XnXQV?=
 =?us-ascii?Q?hE7sFRWuXJvcj51ChQv76mygGbq3vLdT08xJnVF3y1yz7nXyuYcG8vUcGkOw?=
 =?us-ascii?Q?x9lIHULJgUNFg2akq3sbDiW0iBiON6pp1S04Q6sm/wqaLCpxfA4Wvum+tx89?=
 =?us-ascii?Q?JkyR5tiT9nSBTFRm1LTK0exnUdqWiOLXHsV40GYjpZfNsZxkn7uZ3JbUGELU?=
 =?us-ascii?Q?M3o+DAbuo+hH3urRdKrBH8EtHI18fkh4itTjBkrnwt9E4C2YcHgwBWvlEQ4j?=
 =?us-ascii?Q?ZBuBYr12o+4o5vs54cH/s4j7ROee2bA3ZvktN2T3RM5y3Ox+RJLLfhQrtdmE?=
 =?us-ascii?Q?UiTJnzJohrbGspMOSvlNBl6YMOjfaCrepzDYf/D96If31CxKhbsGS9aFiMyb?=
 =?us-ascii?Q?2DLQUr21zSy2fvYPP9sEVr0EVe6LHF1U65LZjG0ObrK5qoBt/8d/Az9JFq5F?=
 =?us-ascii?Q?X8mzMSAENHyVArkkH6Q+ZH8vVOOo7FvBEi0DqtouQ3Hqo8/GHCbjMrcAk31v?=
 =?us-ascii?Q?jPxlFgdKjZmalWzttqgIcNPhYqsmHrbhF1u37fbfCx96o8LKazE2relovXSs?=
 =?us-ascii?Q?lgBBsZRRw/b5qCxotutH164ONMQqNsfvQqv3E2q7UOpR7g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E57C18E0785E3246B8DB30F241A638E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8078
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d67e74ba-9280-4ddf-7949-08dcec82dca8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VnMnqyqvEJWFD9KLnEUdYEKJ/tj7Tr6f4ax1pjXMrNZ2y0TwOmGzZu3PE+hH?=
 =?us-ascii?Q?JUiPa8A+mH2k/+DLrSsbFb617obvDEqn8rPC+mMp/vhLs4cNaC7l8SFiFusR?=
 =?us-ascii?Q?dg4N5adNbyJrd+FRUg9hXtYvPub8Sdn1AhGhKJzHuT2xzkZUQzu48xd9GjXl?=
 =?us-ascii?Q?zbxp5UwUSlyV3tGImKtBPzFov71b8I8Lz34hrEiC5x3HG70FAUjBnCroX/px?=
 =?us-ascii?Q?K5Own7Wvsa1hedXwqGyIWyoOxcYP//jefkimOa+M+hfLQJknwl5YwCillgT3?=
 =?us-ascii?Q?+pXf/w61ywmM9LD5GHih3fqnqlHl9f1JPPTM5Eq06G6Rty1HkRvxILQ5WLjw?=
 =?us-ascii?Q?C/fNFeGHC9XhHsXIxI7fuRGRwWlpWE+YvpADKUrzJWEQEEyxNpgLJtZR1piv?=
 =?us-ascii?Q?9CVcIltpP2IY6hPO58JKSd/79d2MvBSnJMaP5p0r/mpAKP3ZANgT4PLKdfEF?=
 =?us-ascii?Q?Jzu8GTKWRBOSF2VF0J7xXXygVnYWDsnikAS+yTam0TjawtJmQEkyes5cPZUQ?=
 =?us-ascii?Q?WZuDj3juQnc6yEuW281lNqjXk6pC6Of6S/jL0SSastjYMAIPmUlnGt88p3Ru?=
 =?us-ascii?Q?qsJV1yt/NZme61KvfIdsPEa7yP6uad6pCt6Kbx//HCeW5+Yofsu9K1+IQyAW?=
 =?us-ascii?Q?iJ7bby1RoT+CJbNpZiqBAwDRIoayesv8Yfhoba8Gkf26e7sdx8XVcq7Vskaq?=
 =?us-ascii?Q?oUwOxXmsFXOvwoIZN9xsAuwqOQKOAXpzah6sjqiBQnOTbG2gJ6hj4UiUJeTV?=
 =?us-ascii?Q?7gl66Hq2O6tobRytveJzjuPPZ2gqC/A2WRwg5KYB8bJ3kevQKDTrbEBhKN3H?=
 =?us-ascii?Q?MibLxGJR/xNdzz6FJ2EnUQJ2hPuNQ8FAfpqG+zcjkstFxPdOIn8YbRdsrtHN?=
 =?us-ascii?Q?wabSPft5ce2yMPRn9OVT3xFY7Pt6+EBw0Hx+BlJP7NKMVsC/ZecWikI6D/PT?=
 =?us-ascii?Q?XcgViXzcit5fJbvNQT9q8GPb5oJXRAiIHaVDkf7Vu92SNqXA4LdHEf72PXyM?=
 =?us-ascii?Q?oSB9H/2XGEuWMAAmSgJOJqVUoDrcBY3kn+b0Y6xBG0pKcCvlCNPuA92pkgVi?=
 =?us-ascii?Q?TxSMH9w6MI3Kren65/RNPFD32c2CsLvi5fFPF+y93yM3d9GozEbglzNwwVz2?=
 =?us-ascii?Q?E+/RXuwVu+MZQCthU7yf1M0WW2SyWoIVKCO91i8CDkZvyY7m6/OlJ8j6mSkf?=
 =?us-ascii?Q?nJdBo8ZcWxODUoE7jZ/qHU+FidGXsRE55HSFf3pN/W135Wmy0jfgL1nhzw4j?=
 =?us-ascii?Q?9vCEtU/gor4X0SCJmxGHR7iLuomaWe3GlOollPtvbc8NjX/FlRkKUZnl2q0e?=
 =?us-ascii?Q?4rIe8JxUkh6dcoLd7yFe21zmJ/tPMLB7lIPVyRTHMMmBF3cYOcFP2lp5vE5+?=
 =?us-ascii?Q?/HSkf8nxiwblRO7FWNVc1kexf2NO?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 19:03:26.7687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17c4458-f725-4e1b-ab5e-08dcec82e26a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7902

Hi Ayan,


> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.=
S
> new file mode 100644
> index 0000000000..4a21bc815c
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Start-of-day code for an Armv8-R MPU system.
> + */
> +
> +#include <asm/mm.h>
> +#include <asm/arm64/mpu/sysregs.h>
> +
> +#define REGION_TEXT_PRBAR       0x38    /* SH=3D11 AP=3D10 XN=3D00 */
> +#define REGION_RO_PRBAR         0x3A    /* SH=3D11 AP=3D10 XN=3D10 */

NIT alignment

> +#define REGION_DATA_PRBAR       0x32    /* SH=3D11 AP=3D00 XN=3D10 */
> +
> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=3D0 ATTR=3D111 EN=3D1 */
> +
> +/*
> + * Macro to prepare and set a EL2 MPU memory region.
> + * We will also create an according MPU memory region entry, which
> + * is a structure of pr_t,  in table \prmap.
> + *
> + * Inputs:
> + * sel:         region selector
> + * base:        reg storing base address (should be page-aligned)
> + * limit:       reg storing limit address
> + * prbar:       store computed PRBAR_EL2 value
> + * prlar:       store computed PRLAR_EL2 value
> + * maxcount:    maximum number of EL2 regions supported
> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it=
 will be
> + *              REGION_DATA_PRBAR
> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it=
 will be
> + *              REGION_NORMAL_PRLAR
> + */
> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, att=
r_prbar=3DREGION_DATA_PRBAR, attr_prlar=3DREGION_NORMAL_PRLAR
> +
> +    /* Check if the number of regions exceeded the count specified in MP=
UIR_EL2 */
> +    add   \sel, \sel, #1

I think there is an issue adding 1 here, because the very first region we a=
re going to fill will be the 1st even if we intended the 0th.
Probably moving this one at the end will fix the issue

> +    cmp   \sel, \maxcount
> +    bgt   fail
> +
> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> +    and   \base, \base, #MPU_REGION_MASK
> +    mov   \prbar, #\attr_prbar
> +    orr   \prbar, \prbar, \base
> +
> +    /* Limit address should be inclusive */
> +    sub   \limit, \limit, #1
> +    and   \limit, \limit, #MPU_REGION_MASK
> +    mov   \prlar, #\attr_prlar
> +    orr   \prlar, \prlar, \limit
> +
> +    msr   PRSELR_EL2, \sel
> +    isb
> +    msr   PRBAR_EL2, \prbar
> +    msr   PRLAR_EL2, \prlar
> +    dsb   sy
> +    isb
> +.endm
> +
> +/* Load the physical address of a symbol into xb */
> +.macro load_paddr xb, sym
> +    ldr \xb, =3D\sym
> +    add \xb, \xb, x20       /* x20 - Phys offset */
> +.endm
> +
> +/*
> + * Maps the various sections of Xen (described in xen.lds.S) as differen=
t MPU
> + * regions.
> + *
> + * Inputs:
> + *   lr : Address to return to.
> + *
> + * Clobbers x0 - x5
> + *
> + */
> +FUNC(enable_boot_cpu_mm)
> +
> +    /* Check if the number of regions exceeded the count specified in MP=
UIR_EL2 */
> +    mrs   x5, MPUIR_EL2
> +
> +    /* x0: region sel */
> +    mov   x0, xzr
> +    /* Xen text section. */
> +    load_paddr x1, _stext
> +    load_paddr x2, _etext
> +    cmp x1, x2
> +    beq 1f
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=3DREGION_TEXT_=
PRBAR
> +
> +1:  /* Xen read-only data section. */
> +    load_paddr x1, _srodata
> +    load_paddr x2, _erodata
> +    cmp x1, x2
> +    beq 2f
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=3DREGION_RO_PR=
BAR
> +
> +2:  /* Xen read-only after init and data section. (RW data) */
> +    load_paddr x1, __ro_after_init_start
> +    load_paddr x2, __init_begin
> +    cmp x1, x2
> +    beq 3f
> +    prepare_xen_region x0, x1, x2, x3, x4, x5
> +
> +3:  /* Xen code section. */
> +    load_paddr x1, __init_begin
> +    load_paddr x2, __init_data_begin
> +    cmp x1, x2
> +    beq 4f
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=3DREGION_TEXT_=
PRBAR
> +
> +4:  /* Xen data and BSS section. */
> +    load_paddr x1, __init_data_begin
> +    load_paddr x2, __bss_end
> +    cmp x1, x2
> +    beq 5f
> +    prepare_xen_region x0, x1, x2, x3, x4, x5
> +
> +5:
> +    ret
> +
> +fail:
> +    PRINT("- Number of MPU regions set in MPUIR_EL2 is too less -\r\n")
> +    wfe
> +    b   1b
> +END(enable_boot_cpu_mm)
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h b/xen/arch/arm/=
include/asm/arm64/mpu/sysregs.h
> new file mode 100644
> index 0000000000..b0c31a58ec
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_ARM_ARM64_MPU_SYSREGS_H
> +#define __ASM_ARM_ARM64_MPU_SYSREGS_H

Same comment about define name as in patch 3, here and in every
new file of this patch

Cheers,
Luca=

