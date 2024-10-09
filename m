Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB603995FD2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 08:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813730.1226736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQDm-0006P1-MC; Wed, 09 Oct 2024 06:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813730.1226736; Wed, 09 Oct 2024 06:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQDm-0006Mr-IT; Wed, 09 Oct 2024 06:30:54 +0000
Received: by outflank-mailman (input) for mailman id 813730;
 Wed, 09 Oct 2024 06:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iX4b=RF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1syQDl-0006Mk-8K
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 06:30:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f403:2612::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06daf71d-8608-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 08:30:50 +0200 (CEST)
Received: from DU7P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::19)
 by PAVPR08MB8966.eurprd08.prod.outlook.com (2603:10a6:102:320::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 06:30:45 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::dd) by DU7P191CA0028.outlook.office365.com
 (2603:10a6:10:54e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Wed, 9 Oct 2024 06:30:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13 via
 Frontend Transport; Wed, 9 Oct 2024 06:30:44 +0000
Received: ("Tessian outbound 5b65fbeb7e07:v473");
 Wed, 09 Oct 2024 06:30:44 +0000
Received: from L7f3acd0c8531.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A43E45A7-599B-4752-AA24-6ED8D3969550.1; 
 Wed, 09 Oct 2024 06:30:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7f3acd0c8531.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Oct 2024 06:30:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9650.eurprd08.prod.outlook.com (2603:10a6:102:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 06:30:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 06:30:34 +0000
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
X-Inumbo-ID: 06daf71d-8608-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DUJ21tVeEKY66hehC6BAMt91K/ivQybZmNno1Y+KiYAJyEy0UcMKTEhJmw18Y19GyIzTYHD5YwRnVjcBFIi4DYM5oCE9C+dp9V7DXdqpZc/es4Czh75ef88GzVZZIAMSbqmJsq7X3oL+z2Djh3gethmltY70R6/m9E2oD0//qg7u3SlmCTgzZp1FkwWqFtvYw1dgrnI3K7oJj7o154qmskPoCtCwdi+3dfn3pBYTNVKSznFajWfHCtJRf6YOZ/5br/LLu6kGscZDMnKbB7jB6qD3ZXf9MWr2IRvjIxHbCS8jYZjoYfr+iyPUXJFkJk3Q0Bga/+YzBmbtZYwLotNmiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jjOBoe08g172RTOq8qQzl8U3fRLENgwbGpi1qIk4A8=;
 b=N/UUcdJIHKl9GayXng3l2neaKNFoBthei0plS15ZRAMpFrJB/OTcx6vf5c3yzcp98qMgfiqxoMx4NzFYLbdqDmqfW7ORsdoaWHr1PLJFjc3nlmBt2GF6gTYhkt9b6LiOK9/3UEAlyfyOx0q7K4GPZ2XKnm/PG32vlw0nzb6RWQeeCrvHwoien5ctAzRcFu1kt+qKBUmbtkXHj0s4+DZobDJ9BqQzXw7vy9Fvw+VEPM23KWYRQjbgTm+FvnaJAHWHHo7oQ1gGEM+VtyPkXg/pyQZEpKLT6y4C4iYjY8RGR/XToAC9R2tvdZRleOJHJWQu9UPI7bNLdIFIn99rske/Eg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jjOBoe08g172RTOq8qQzl8U3fRLENgwbGpi1qIk4A8=;
 b=M8YqcQgcwznz5lUGL+WSp+oXmHUAZtOfkDOKe44J9YxtlxM0fW0ZdERQUjoveVUMksaWeg4L3x6Wo++h0QYRPftvP/AdPoCZQrMKNc8JmRm5MbqpBzSDsyods+KEjmcHxQzpir/ajfBW1ww6PY17nLi3TgMhy3PaalAjc5FECVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88f0bf80d3a1099e
X-TessianGatewayMetadata: p4oC3JcSi9KxnzWhc65Z9EE2fFzx9e2m82b6RX2qPc9I2M/zbg9KaplT0i4l7aeNrL6Urdhb7EyzuVbjXZ8S2hMB6obvglCwVAN37OqGO8eUHvmW4J/vpkRrBUBlf1eLId0qurXdz5PboJ//T8K1Uv0rNlC1+fEEv4yWI8/UE/M=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quk/ppwHa5JcgqkB79Wf8v9JnQUSbyN4tbqEBnoDddK1vIroz8I9vww9hf5nxFeLKejwxTLY1GVBh/OiKHSO0WUflg2gCmwGh9L5b74brKTmwbhOlsKWVFK5Q2riX8cLeTe3zmDO33tbpKMPFEpRYLao0G7N0xJO1K7N09CpWQ1w3mW6E5zfMZhalYIqSmVjZglHRiqmY62cnDteWs6u50bk3U8A0OF/UDYpb4w0aekTAW3SIH591yCWJ6IJDk/Zgw4CwVPtIilM1U1/2+zFBfVrHBgzP6Eh+vsgjv1/bWViUBKF4SzOoP3RX5zDU6CMpMbGgoPRUY4OFpIotFlyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jjOBoe08g172RTOq8qQzl8U3fRLENgwbGpi1qIk4A8=;
 b=UlSdVtBr2NqjykKypdonYf6ohXpnV3gx1pvNuLHm4Vjfs0oLVhFWdXHUjhBbyvqo5MfFG6B/lvgW5rgkRMbqtp2eRJMuilDbW7xpizAAEcZGNXrxAI/y8sX0pmjIF+pD9yKpdlr37/OvpC6yFEq4qWPBucTW2gHApHckOF9muDZtu/90R35u3Nld1fdd9jwYlYP4W0R6XIb0R7i0hXdniPYDAGFuIOIqFotSzB4V+kIEjI8ksktHcQnV+h7ANJFj7bfdhQ6+ofcvu7aMqeFMpwlHeprhydLKAFYAu3jN8aoDpuE/oRwRQz8Try/2v9hUOYzlEfKxFfcV9m7SiWSjpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jjOBoe08g172RTOq8qQzl8U3fRLENgwbGpi1qIk4A8=;
 b=M8YqcQgcwznz5lUGL+WSp+oXmHUAZtOfkDOKe44J9YxtlxM0fW0ZdERQUjoveVUMksaWeg4L3x6Wo++h0QYRPftvP/AdPoCZQrMKNc8JmRm5MbqpBzSDsyods+KEjmcHxQzpir/ajfBW1ww6PY17nLi3TgMhy3PaalAjc5FECVw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Michal Orzel <michal.orzel@amd.com>, Ayan
 Kumar Halder <ayan.kumar.halder@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Hisao Munakata <hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Topic: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Index: AQHbGOqFqldnvX8xNEmI4LnFnImSpbJ8YaSAgADTLwCAAEEygIAAgZcA
Date: Wed, 9 Oct 2024 06:30:34 +0000
Message-ID: <85FF2EB0-474D-4807-8DB3-FC502A5B2DE8@arm.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
 <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
 <alpine.DEB.2.22.394.2410081523292.12382@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2410081523292.12382@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9650:EE_|DU2PEPF0001E9C3:EE_|PAVPR08MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: f68991fa-276b-4fb2-37fb-08dce82be793
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?o8TnxBKRbH2UUUMOgHQ6pj1yh8RK834ZXWy20Cjvy6TWCwkjkpdACw0IPg12?=
 =?us-ascii?Q?E8Az1z1t1HP8Tp3V+L0TQujwBmZQta5jz2IKxP1Q+DzSZNu5JgSGB8wtv+41?=
 =?us-ascii?Q?BADdeKUSD/gEUQ86zI1b98HcZlZEKcLOwxc4JxNrAfHwFk23b0XMdJmuYxHX?=
 =?us-ascii?Q?YBPke6wNJkU1FOVIpdtBO8mF1CNAUvEopGtJOg7rVgZLR1tzwge/AzvD7gWN?=
 =?us-ascii?Q?1lWzGb4alOXNncLYxAtGfS3kxRUdheDItw007uUqaAEog7jUCq6eocLKdsjK?=
 =?us-ascii?Q?MY0wGd+7970Hf/XPrwkh4m5MPwhZDEX0ax2FxHmyrugXCc7pYEgP8/LK/ZIG?=
 =?us-ascii?Q?Vrwani5X6zReBbuPfY5BLHh3pBL+OUCf/qhKZV2KXXrECKebHFg/D65uGLt4?=
 =?us-ascii?Q?vCrkhFqXCngthJQTe1z0F6R7YxIeLgHpfdcxMWE80pYwhqOoKdv4c9w1wbzd?=
 =?us-ascii?Q?f9k1i/2Nh7uD6AjUhjtrH4T8uvKnxet/FKQixbyHTMDW3pu8Yu+r6hDE91Rg?=
 =?us-ascii?Q?1fKhaQ0dZi5F8H7kh8v2vLDvkyejzttgs930ncCE9eTcShSK6fSiOUhLKIKh?=
 =?us-ascii?Q?KDxjh4OXZetb47RIZGnXpYa3err4xwXqAUzbhDoG32btcacefmZ5ouzQQVY/?=
 =?us-ascii?Q?cy0jFBYLTPXOTsyf+N+P9zvImPaTs+HkRidnDh4RbBI43JwxDXo2BXJGhTHa?=
 =?us-ascii?Q?eTOfhDICxMopnejMr79P5mw0Xa4K1LkD/3vxE3vMAyz9RxBEvvmCQnKK7qhj?=
 =?us-ascii?Q?FR0SsovIH+t2g0/j2CqqJAfKFx1qIFGSjw+q4t2H9bNgUcuaGt8XuRIn8hGq?=
 =?us-ascii?Q?37abOZYpibpy6fZo2mAF3e0RqZY85HYiMMy6Gqw6DNz8bI/2RkQFcaT2xUNR?=
 =?us-ascii?Q?lvytj58oak+jRZjaCSCIzZ+R61lEEsO4gxA41vN9y+KkcFk0aS2KuGMa/wyI?=
 =?us-ascii?Q?NdLLATd6ZO4CQKk238RFy7wFLHhTLHdDXrNVXOytxvDBVeFhps3vssuA8e3H?=
 =?us-ascii?Q?BuZfx4MHq/Pc5JcVOiN9niNgfPSCSWOGTbNg/4XsQDUolX+Jhi7VxHTGz6/r?=
 =?us-ascii?Q?v2+LbVYe5vFQPayg9kky/JBji//PKqcqlF6oRPjT0cebUsincIRiHtO9+Gvo?=
 =?us-ascii?Q?suJdi5n62oz3PBHZ+N3yxL08K7SmXyQiJFOeI/eSanpjr5aZNq22eqsS3bDe?=
 =?us-ascii?Q?le7zYtiJQlNNMqireg5B4PF0iTEGsQqwUtPQR88JxgiRXTAB7S5Lf1fXmcdh?=
 =?us-ascii?Q?zeU/mJqp7zG831msUNXlZWR3soMoCfavs4x2wcmaGA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0DF0C4549BD677469C1AC23680E02BE3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c7b43425-ae9a-4fda-626d-08dce82be1bc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4ldqqS6q8k2A9ebrwVPoPsusIc/B/UA5cJNC5Nqf4oa4BBdg5ht+eQBbGGV/?=
 =?us-ascii?Q?k4om1NWF9WoGAF3Dpo9HSjsnASHLv1FoXtw3cSTq4khvv0YQsThauhNgA/5u?=
 =?us-ascii?Q?7Eu/+sTkNkUFpqFB24Kro3EADwqQfyD5V4sD74A94ik2fdPROgF/iSZaQkK4?=
 =?us-ascii?Q?ycJE0yiL2mZRZcgsQwXgtyOBun69m6WV7bXKzI8fDFEbKC8SG3iQ4lVl2KkJ?=
 =?us-ascii?Q?GLrux5ko/nKD3twEoWomnl2L7k0L5SYcRBs9tfi94QCUcDvbExjHi232de8r?=
 =?us-ascii?Q?ttPwLjG7DRMbbNw2wa9Ymgr8agyEsULa74M51uQfOR1GNyUHPdgfVADdgAp/?=
 =?us-ascii?Q?GtUQ9xWWzo/5JCC1jc8kUmH8zG42473CwVnL+Ox5eC4rYdPx09nm5xZAhkEL?=
 =?us-ascii?Q?QK0sdrJXsOk2prvh4UEv1sQ8HJvs1DAaeZAa5lniiRvW/BU1oPl0IEvEmDZ3?=
 =?us-ascii?Q?MKaJRSsw2NUnMwkMfBZ5JnDIdXsXOxXQ0pyU/2v2GQWBR+lP0XaYrLAy0Edy?=
 =?us-ascii?Q?wZ3R0t+mDVVvZgRuPfwLcfuWRl6zW3rKQAgwc1Ngb1x3GljdBrWzLt9TszOm?=
 =?us-ascii?Q?mnFqUcwLaFajMnEb5KhR6cM+aDNw95sYsqr6ns+lIwGwmnbx2sbsHpwwzh2F?=
 =?us-ascii?Q?TgeTncx0oTAcwdgi7gEAiohaOTWhDn+BU5KZvIJALOPl+4Pm3j/s78jnTbxd?=
 =?us-ascii?Q?x19wTCwZyBs6PVcLHtAEuIrZ/vKJxmz5W6jxaNauifzro1c8WhxMRuhhPzuJ?=
 =?us-ascii?Q?3SRAmL2HNGCO9jhqBvf3VpzOQowstSO0GdgswUCKIC1Rgws0YPKsl5JAZWrQ?=
 =?us-ascii?Q?vnRrkAlATwaQ2/VJydElhLMFHsRD3zzNlxttzf3AEK8aO/iE5F/C3GAPJVeY?=
 =?us-ascii?Q?PJ2OMpyHq7GmBcm8+GTOUsdbsIsU45hiYlG2sXTYTz9Af01KSV0mWuMv2gBc?=
 =?us-ascii?Q?EaIvWRJ5wGXPchaYcNZibWipSLuW4wKGEfFXtW6NJCvF4lPPIeYIS+8IEr/Q?=
 =?us-ascii?Q?J1GdztHEGxnPNqE5S0X7hfdSkxQDq3Pcvs2SD2K0Ge8CITgoVJk5rpvaI1HB?=
 =?us-ascii?Q?VYwf0nDpupUs2b1/DlhaXNQUDx3iZjAtUB1FbuIxbzq5zGrfucH2XtBalwnN?=
 =?us-ascii?Q?sXjj80oXbCIAQXPuDsGYQpmViNuEUoraPEhgr1sDB/6CjnCBO4B7T0RxgeSL?=
 =?us-ascii?Q?6EyJmHYmBRAOGbN67zrk3q2gEEb5EPMoZBwC5NwWFMjPDyr3b3UQnq15lzFT?=
 =?us-ascii?Q?kdtK6PsuUnuw+D4nM0fasC3bIqWZpvOWrVi54I0oN/EzAxm5s/ux0ouEoY3a?=
 =?us-ascii?Q?NVnXRaMAoBVbkLj+M4b0Y7wU?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 06:30:44.6034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f68991fa-276b-4fb2-37fb-08dce82be793
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8966

Hi Stefano,

> On 9 Oct 2024, at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 8 Oct 2024, Oleksandr Tyshchenko wrote:
>>>> On 7 Oct 2024, at 20:55, Oleksandr Tyshchenko <olekstysh@gmail.com> wr=
ote:
>>>>=20
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>=20
>>>> Add common requirements for a physical device assignment to Arm64
>>>> and AMD64 PVH domains.
>>>>=20
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> Based on:
>>>> [PATCH] docs: fusa: Replace VM with domain
>>>> https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd.=
com/
>>>> ---
>>>> ---
>>>> .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++++
>>>> docs/fusa/reqs/index.rst                      |   1 +
>>>> docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
>>>> docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
>>>> 4 files changed, 428 insertions(+)
>>>> create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>> create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
>>>>=20
>>>> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>> b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>> new file mode 100644
>>>> index 0000000000..a1d6676f65
>>>> --- /dev/null
>>>> +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>> @@ -0,0 +1,365 @@
>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>> +
>>>> +Device Passthrough
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +The following are the requirements related to a physical device
>>>> assignment
>>>> +[1], [2] to Arm64 and AMD64 PVH domains.
>>>> +
>>>> +Requirements for both Arm64 and AMD64 PVH
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +Hide IOMMU from a domain
>>>> +------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
>>>> +
>>>> +Description:
>>>> +Xen shall not expose the IOMMU device to the domain even if I/O
>>>> virtualization
>>>> +is disabled. The IOMMU shall be under hypervisor control only.
>>>> +
>>>> +Rationale:
>>>=20
>>> I think there should be a rationale here to explain why we do not want =
the
>>> IOMMU
>>> in particular to be assigned to a domain.
>>=20
>>=20
>> ok, will add. I propose the following text:
>>=20
>> Xen having the whole picture of the host resources and device assignment
>> unlike the individual domain makes use of the IOMMU to:
>> - perform DMA Remapping on Arm64 and AMD64 platforms, which is also know=
n as
>> stage-2 (or 2nd stage) address translations for DMA devices passed throu=
gh to
>> domains and Interrupt Remapping on AMD64 platforms.
>> - provide access protection functionalities to prevent malicious or bugg=
y DMA
>> devices from accessing arbitrary memory ranges (e.g. memory allocated to=
 other
>> domains) or from generating interrupts that could affect other domains.
>>=20
>>=20
>>>=20
>>> Added to that, I am not completely sure that there is a clear way to te=
st
>>> this one
>>> as for example one could assign registers not known by Xen.
>>=20
>> I am afraid you are right, valid point. For example, on Arm64, if there =
is no
>> corresponding driver in use, we will end up exposing IOMMU dt node to Do=
m0.
>>=20
>>=20
>>>=20
>>> Shouldn't this requirement in fact be an assumption of use ?
>>=20
>> Assumption of use on Xen? From my PoV sounds reasonable, will do.
>=20
> In my view, this does not qualify as an Assumption of Use, as it does
> not align with the definition we have used so far. If we were to
> categorize this as an Assumption of Use, we would need to change the
> definition.
>=20
> We have defined an Assumption of Use as something Xen expects from the
> rest of the system for it to function correctly, such as being loaded at
> EL2. On the other hand, 'Requirements' refer to behaviors we expect Xen
> to exhibit.
>=20
> Our goal is for Xen to configure the IOMMU at boot using the stage 2
> translation, and to ensure that Xen prevents domains from altering the
> IOMMU configuration. These are specific expectations of Xen's behavior,
> so I believe they fall under Requirements and should be validated in
> some way.
>=20
> However, we could adjust the wording. For example, we might replace the
> negative phrasing with a positive requirement, such as: 'Xen shall
> configure the IOMMU at boot according to the stage 2 translation
> tables.' There is no need to explicitly state that the IOMMU is not
> exposed to guests, as nothing is exposed unless explicitly allowed or
> mentioned. We could, however, include a brief note about it for clarity.

I agree that this is the right way to turn the requirement into something
that Xen shall do.

Now i think we will need to have a discussion to clear up what to do with:
- assumption of use
- "integrator" (word always problematic in Fusa as usually use to bail out
and give responsibility to someone else) shall and shall not do (for exampl=
e
giving access to IOMMU registers to a domain)
- interface and what we expect a domain will do with it

>=20
>=20
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~device_passthrough~1`
>>>> +
>>>> +Discover PCI devices from hardware domain
>>>> +-----------------------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_discover_pci_devices_from_hwdom~1`
>>>> +
>>>> +Description:
>>>> +The hardware domain shall enumerate and discover PCI devices and info=
rm
>>>> Xen
>>>> +about their appearance and disappearance.
>>>=20
>>> Again this is a design requirement telling what should be done by a dom=
ain.
>>> This is an interface or an assumption of use but not a Xen design req.
>>=20
>> I agree, will convert to Assumption of use on domain.
>=20
> This example better aligns with our definition of Assumption of Use so
> far: we expect the hardware domain to enumerate and discover PCI
> devices, then notify Xen about their appearance or removal. This is an
> expectation placed on the hardware domain, not on Xen itself. I agree
> with Bertrand that, as written, it is more of an Assumption of Use than
> a Requirement.
>=20
> However, rather than converting it into an Assumption of Use, I think we
> should rewrite it as a requirement focused on Xen's interfaces for
> enumeration. For instance:
>=20
> "Xen shall provide hypercalls to allow the hardware domain to inform Xen
> about the presence of PCI devices."
>=20
>=20
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~device_passthrough~1`
>>>> +
>>>> +Discover PCI devices from Xen
>>>> +-----------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_discover_pci_devices_from_xen~1`
>>>> +
>>>> +Description:
>>>> +Xen shall discover PCI devices (enumerated by the firmware beforehand=
)
>>>> during
>>>> +boot if the hardware domain is not present.
>>>=20
>>> I am a bit wondering here why we would not want Xen to always do it if =
we
>>> have
>>> the code to do it in Xen anyway.
>>=20
>> Makes sense, will drop "if the hardware domain is not present".
>=20
> +1
>=20
>=20
>>>=20
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~device_passthrough~1`
>>>> +
>>>> +Assign PCI device to domain (with IOMMU)
>>>> +----------------------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign a specified PCI device (always implied as DMA-capabl=
e)
>>>> to
>>>> +a domain during its creation using passthrough (partial) device tree =
on
>>>> Arm64
>>>> +and Hyperlaunch device tree on AMD-x86. The physical device to be
>>>> assigned is
>>>> +protected by the IOMMU.
>>>=20
>>> This is a very long and complex requirement.
>>> I would suggest to split it in 3:
>>> - generic: Xen shall support assign PCI devices to domains.
>>> - arm64 one: Xen shall assign PCI devices based on device tree (explain=
 how
>>> this is configured in dts)
>>> - amd: xxxx based on hyperlaunch
>>=20
>> I agree, will split, but ...
>>=20
>>> - Xen shall use the IOMMU to enforce DMA operations done by a PCI devic=
e
>>> assigned to a domain to be restricted to the memory of the given domain=
.
>>=20
>>=20
>> ... does this need to be a separate 4th requirement here (and for the si=
milar
>> requirement for the platform device down the document) or this sentence =
is
>> meant to be added to all resulting generic/arm64/amd requirements?
>=20
> This is not specific to PCI, though? The generic requirement is "Xen
> shall use the IOMMU to enforce DMA operations done by a DMA-capable
> device assigned to a domain to be restricted to the memory of the given
> domain".
>=20
> I think it is also OK to both have a PCI-specific and a
> non-PCI-specific requirement for that, I just wanted to mention that it
> doesn't look like something to PCI-specific.

I think we should completely abstract out the DMA engine problem as it
is not specific to a PCI or not device but to any DMA capable stuff.

Maybe the same also goes for interrupts and how those are assigned or
forwarded or not to a domain (attached or not to a device).

Cheers
Bertrand



