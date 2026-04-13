Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IvrNNTR3GmcWQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:21:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279073EB344
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281088.1564138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCFMO-0006mA-H1; Mon, 13 Apr 2026 11:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281088.1564138; Mon, 13 Apr 2026 11:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCFMO-0006j6-Dk; Mon, 13 Apr 2026 11:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1281088;
 Mon, 13 Apr 2026 11:21:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCFMN-0006j0-2F
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:21:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCFMM-002rJC-AN
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 13:21:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcd1bf-e002-0a2a0a5209dd-0a2a4506a7dc-20
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:21:41 +0200
Received: from [40.107.162.15]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcd1c5-0df0-0a2a45060019-286ba20f891f-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:21:41 +0200
Received: from CWLP123CA0208.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::13)
 by DU4PR08MB11810.eurprd08.prod.outlook.com (2603:10a6:10:63f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:21:39 +0000
Received: from AMS1EPF0000008D.eurprd05.prod.outlook.com
 (2603:10a6:400:19d:cafe::9a) by CWLP123CA0208.outlook.office365.com
 (2603:10a6:400:19d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 11:21:39 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008D.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 11:21:38 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DBBPR08MB6217.eurprd08.prod.outlook.com (2603:10a6:10:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:20:36 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 11:20:36 +0000
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
 b=hP6AjWR4xgXEeQ/DH1Kj/llpFK/rydiRBOvuoBc1qjuq7Dsi5J2Hy8U2o/FqLQOUJIfnHNzzXkuuXoSNkh0jVWjZTYw0fPzvnx+MczSO31gI7TqXSY9BkdkbwQKDhOJiCRwZv+ZiBsXc4DKw0msCyR0C/4WUG528uPcgWfA7ABhTXfP+lM1OD2tenQxE+wFLcm2259Z6KXincJCT4HHpAQMVKPDA0QEGwAiDw906QsuGBuFWODyMU3/PsLwjJFqJAyyMrUVRCngvBrlgxW0b83Tj1idabDGyeEqukwMQvdwRDVfPFTRKqW7uPV4/nY5PezGwAxmH+313rwguunsG3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aExhZ8RsEchHwcCN4tdC2mc8T2FKPcQ1CUXHmeGfEZ4=;
 b=ljAdb8iP4uCXWWIYQMpVpKBvceFAXaMNh1AWe0MM0N4BaHu03m419DRZHkQUb5pD9STUClXdspyzG0OKJ6uCdr8fh8aLmL654b6x2C9pkxJlr0KpyuytOeWstt6whUOnfnMyv4RNgVtLGxp4smEDPxmu2Xhbk4JtfxI8FxnsL2hRW66m+GFMaCsFRNG0/0DmN9GcJ42mC3D2DN5ONLOaof1/AfM0X3yhNEG6mb+O+KDCHFonU9t9TfvS/hzQSiZJ1qnC52b/WTXqXT34UL8ldvlSTwyP749AxZI1n17oUq8FwD493MsQFT3VG32qhoPkhe2CES+jH6KbTxgWO13tcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aExhZ8RsEchHwcCN4tdC2mc8T2FKPcQ1CUXHmeGfEZ4=;
 b=Basbhp3J6WFJbZcEDmT7/vOjqAqPQ2SB0WIwCQVK5AzIxqF+OiatZl3QHnzozBHw0SPSyt4g7kZ4+gVvQ7PQLSs/k19R9AwxAMSr1H2ptbI60NUNzQmwJcorkqP7rCFhL34lv6rIZeP0/FubT55tqr2pm0eSOHGse0nsWnxCn6A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DypZybjwUtMiir69GrqXy/+Xjp441LsV9X6xa0dTD9drilw+3GUVbrM0ru2kKOcy3cjG6rwIh43B9/qkcjTQhaZDNBMV9WLhnwabNc1up4EzPRD+SGoF/PQyjyod7k6BQHSl4gmQrv83idEumFQEWwh2tiw413Q1e+e1HqprkIoKHBb2tsFNKuc0Y8Y/RXcCnxfR3f4GHWYlYXUZ7c0zslWbG2+2CrgXtKPFdlIQxMMkzMm2hPClhJhm5oE8pF3LomxxbJc0IdImwg/o3bLubJKqkNUTTyWmoSsQPSeByFXOtHFGgqDOJjxucimlX9nf7j9zR/uEOfdXQRu63P/EqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aExhZ8RsEchHwcCN4tdC2mc8T2FKPcQ1CUXHmeGfEZ4=;
 b=pA3b1KCvndII1mbJ9mkwpXpUmBRaZL7qEWfd9Ks54pRJ8mOS+hvXlSn/+ys8GXK2c0PkHLsSk32LY4CtwyI+SGZzFIkTDnwbpTKzAHbY396x6iMgV6lHXL1A2fkw/Ri1IYJD8op6l5SA70EJicVj3mqQ2C7zq2qMfifREYYXzaUS7/wkCq29TFrBpjBTaEVkjuaQ85Nv2YAevpKpj3M9j8fsJtk4GA3XXdPv0SGG5Rx2JTTMrcN7Ka8dBIbeZNPCMK7JncTmCqP9agrKFHmSxcPnVlvPd3MWzj0/ss+6mJzGQ0uIpkw2F60Q0qVjXdwPaNJXcy5GmtBJCKQI+aGa/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aExhZ8RsEchHwcCN4tdC2mc8T2FKPcQ1CUXHmeGfEZ4=;
 b=Basbhp3J6WFJbZcEDmT7/vOjqAqPQ2SB0WIwCQVK5AzIxqF+OiatZl3QHnzozBHw0SPSyt4g7kZ4+gVvQ7PQLSs/k19R9AwxAMSr1H2ptbI60NUNzQmwJcorkqP7rCFhL34lv6rIZeP0/FubT55tqr2pm0eSOHGse0nsWnxCn6A=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
Thread-Topic: [PATCH v3 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
Thread-Index: AQHcyy/u1+T36BIjnkSypQJ5KiHeE7Xc2JCA
Date: Mon, 13 Apr 2026 11:20:36 +0000
Message-ID: <3E901035-1A91-4BF9-97CF-B3C9D3326DB2@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <059c718f5407b845b84ec53cdc3ff021296d8bf9.1774918270.git.milan_djokic@epam.com>
 <B22B467B-C747-4070-B40F-A8297AB9A3BB@arm.com>
In-Reply-To: <B22B467B-C747-4070-B40F-A8297AB9A3BB@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DBBPR08MB6217:EE_|AMS1EPF0000008D:EE_|DU4PR08MB11810:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7ff1a2-f6aa-4eb9-84c9-08de994ed4d3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 GoxLSdsj2+EUs4GOQF2p1HDiJ3LwVUqEvJpTGVVoBOYx6SGde4Y3wQ27c8A8JN2Ae4AL9AcYS0Abg3AlCwX3N9T57Na1KI9Mqvd4c6J30btqk+/wJyFLTSbC6JOfNjYv2peEbzmz5Rk/y7zNk36/uEtnZ/FBnt9Vu8L+iHJg4C6e1w2be32cJStiJRDQGJwylcR/UdrdzdoDaCAwaI375xbSeAb6qiy2a4Rz1tEdkCHFqUdeqCEzpMUYBHFOsutFszQc0Fk6+5T6tCXTmhZpup4i342gldBnKxqNq7b5yYnn3zRtyqZ85P2JD3hczXCbo8MGLhCdUTouccJWqLCWR5PjOdzV4JIuMty05g6CJikkpsq6v9uwv2YCQn6nuF1ybqL6jvsemtburQqrgd0JNx4gfxJ5POEC0MQVGEaqsxEJKQXChIZd9oXFkHhos4rr9whDPm6jPrrtq982x+/Gj24IdsrS5gwBVVkZMBxD50GAwnY1IbOP0FW7lQBaXKVb47xw+s0zglQigiWSMQC7pUaurdfzan20my0N7eeBzS2kYdbpI8iPb3y4Q8milEiA8xMdsdaNd6apGCnuzjpSVaGnJGahbMAj7svYS3Mp6G+OtZdHKUFydnenYTqTaP5/w2qtym0iOWobQ6qDcVFwz6ce1pApS34lxeWw7i+FMZ9MWXNisoAjYza0LIoRKf4gu0eEa7f2f/ZSrLDJM6vFk3DygtkxiqXUelfxjif6roBHREOmCGR3tVX0Jxc8j7pGJiztAnFYhF92WRwfICwM9w9WcMy4EULpoT4ehmsvLHE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B53ECA575C1E040ACFA8DFBA3937C3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 nOY3wdiRavVRjG4maoIbWDK/Tkh75o3gi26sMijUZTNVVhaSg2jUfrzDbmvbVLIABpfu18/sDUChM6LvoTbLG9SHQMdZgZ+XGZ+6ke97ZZG0+oWYW+lIkiYvpdGAs48mXvzctvAakac2QqqifNxt0DVgA+uWRwYjTqty7cM3YW3ncy3JjSh9Biewm/io6VRx5OBIofmma5oWsQtDRm1PM4XJ36mRiTbEF4Qra6ckWECTutl6aRtorOvQGBC5qfPeiVemauI+IpEBI6phEr8KgxoPu0TE1D5VBVLRr2kfIXnA0+QrL8CPKJqE7UQrym4o6DPiw7QG6cdxGlWC7MAa9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6217
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2131174-8fca-4fc0-ecb1-08de994eaf5d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700016|82310400026|35042699022|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Mt4q61xD6hHWeMWJqr4Ltw5t0SJBTz4V5wEniNUVnE4w/IUDW4M/E3N4VMLhOAgVHxUQWIDDGvoie0mp/KiHI4xvaMFugaSbPwbRwcePsRQNZRgvLYNWRMESU5pGEPfbOVXdU26B8bG4Y74XqkuE75ALwL7w+Lwfa2q+fX/Js/cXuuvh6NzKZpkViQAuvmX2o67fgIaaJqbW8k43cxfVWjNlhTmW0bnFyGjdoe7it/YoFoRC4TUrduY41SXM207BLGg3L84U86d03DcLSMPVtfbDUIfSoSmJfU3F8r0br/vXkZZBiX1eHEzxcDgj0fiUXtWOV9ABWAaP7CSK68LJPUzA5Yd0pEwvLtp/0ZfN8S9JjU51yE7GTwETIPEqbhyIbuNJpsR8Z63+FpCnsawELmWmkqNYl42xx0TC8Ug74scPUhJzXTknC/LpfhlMUSDL8WzOefihrbN56JLeOTenwuq0RAOtGa0BProfsvitBBot/RWHB0vqNY/mgC9u2xD3hYQrIlr0EMplw6lLjLQrhH5+cXLX+m4S+25TWS0B/PDccg+FWhNSMGUZc2PwoQdwhGlGknhIRAyR9X4ngOmVMX1Q+9CvVfMXgbdpiXpBhanLzXP421RAC3fDuGfqq2mDfjCmnLS1rAHyu7BYmuGSg0gAz2r5jI1wL9Vh0sq26uW3FhVJ2WpaEL7XNIqmKtJJUlN7B/fU+Ft2S/Dwngboc4sRdcKEfbFVfoYeFulqg6N+uop6NkILPXnnPqESaPoImYxlgoIOIwx6NlYm1U7X3g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700016)(82310400026)(35042699022)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PGzvUGftqJNZUc9YM9MbUo0FQ7jF6hVnu+5FQqkTNNDs2KH8LS5bzSbFzCWgT6evYC3PwB3pz4Gqgxjnp5f7wjBNozxjQJ7SoEGOm6HNlKIHWGPMTVJvkmZyH76ikCN0TtSxjEMMt9kxk69nDM7GOw9OI7EWCqOsxJCoAGsQjpH5qK3m1CCIHXTuuZlI8vlJvjdgqBGtMnfxAt6aYlTuD68mIIgQMlESe1zqZ0TKO5BSkbglYDdk5pP6rJGdsK8utvu/3NDOVWr5fP5u+PHRZgv9uHv4TsjFYKjqxaodp4ctw1p2B0Viip4sREcPU98ARpv3YiUHREiLIhOxZT8+cBJycMJALsOjBqTBTpKahjBTHk5fyrfaUBqFxe7+rA5pKEuc61FT7xer0hLhm9Fp2lWTkC3Av0LcPScl+MA1Q+0FFztQo8VXibdq8AxFFlA4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 11:21:38.9419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7ff1a2-f6aa-4eb9-84c9-08de994ed4d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11810
X-purgate-ID: tlsNG-16d1c6/1776079301-AEF353D8-FF568B9E/0/0
X-purgate-type: clean
X-purgate-size: 2936
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,arm.com:dkim,arm.com:email,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 279073EB344
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SEkgTWlsYW4sDQoNCj4gT24gMTMgQXByIDIwMjYsIGF0IDExOjI2LCBMdWNhIEZhbmNlbGx1IDxM
dWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgTWlsYW4sDQo+IA0KPiANCj4+
IE9uIDMxIE1hciAyMDI2LCBhdCAwMjo1MiwgTWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBh
bS5jb20+IHdyb3RlOg0KPj4gDQo+PiBGcm9tOiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJt
LmNvbT4NCj4+IA0KPj4gQXR0YWNoIHRoZSBTdGFnZS0xIGNvbmZpZ3VyYXRpb24gdG8gZGV2aWNl
IFNURSB0byBzdXBwb3J0IG5lc3RlZA0KPj4gdHJhbnNsYXRpb24gZm9yIHRoZSBndWVzdHMuDQo+
PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogTWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+DQo+
PiAtLS0NCj4+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pb21tdS5oICAgICAgIHwgIDcgKysr
DQo+PiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jICB8IDc5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+PiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12
My5oICB8ICAxICsNCj4+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92c21tdS12My5jIHwg
MTggKysrKysrDQo+PiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICAgICAgICB8ICA2
ICsrDQo+PiA1IGZpbGVzIGNoYW5nZWQsIDExMSBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaW9tbXUuaCBiL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9pb21tdS5oDQo+PiBpbmRleCBhZDE1NDc3ZTI0Li41NmJjOTMxNGE3IDEwMDY0
NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lvbW11LmgNCj4+ICsrKyBiL3hl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pb21tdS5oDQo+PiBAQCAtMjAsNiArMjAsMTMgQEAgc3Ry
dWN0IGFyY2hfaW9tbXUNCj4+ICAgIHZvaWQgKnByaXY7DQo+PiB9Ow0KPj4gDQo+PiArc3RydWN0
IGlvbW11X2d1ZXN0X2NvbmZpZyB7DQo+PiArICAgIHBhZGRyX3QgICAgIHMxY3R4cHRyOw0KPj4g
KyAgICB1aW50OF90ICAgICBjb25maWc7DQo+PiArICAgIHVpbnQ4X3QgICAgIHMxZm10Ow0KPj4g
KyAgICB1aW50OF90ICAgICBzMWNkbWF4Ow0KPj4gK307DQo+PiArDQo+PiBjb25zdCBzdHJ1Y3Qg
aW9tbXVfb3BzICppb21tdV9nZXRfb3BzKHZvaWQpOw0KPj4gdm9pZCBpb21tdV9zZXRfb3BzKGNv
bnN0IHN0cnVjdCBpb21tdV9vcHMgKm9wcyk7DQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL3NtbXUtdjMuYw0KPj4gaW5kZXggODc2MTJkZjIxZC4uY2Y4ZjYzOGE0OSAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4+IEBAIC0yODEwLDYgKzI4MTAs
MzcgQEAgc3RhdGljIHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKmFybV9zbW11X2dldF9ieV9kZXYo
Y29uc3Qgc3RydWN0IGRldmljZSAqZGV2KQ0KPj4gcmV0dXJuIE5VTEw7DQo+PiB9DQo+PiANCj4+
ICtzdGF0aWMgc3RydWN0IGlvbW11X2RvbWFpbiAqYXJtX3NtbXVfZ2V0X2RvbWFpbl9ieV9zaWQo
c3RydWN0IGRvbWFpbiAqZCwNCj4+ICsgdTMyIHNpZCkNCj4gDQo+IEkgdGhpbmsgdGhpcyBtaWdo
dCBiZSB3cm9uZywgYSBzeXN0ZW0gY2FuIGhhdmUgbXVsdGlwbGUgU01NVSBhbmQgdGhlIFNJRCBp
cyB1bmlxdWUgb25seQ0KPiBvbiBlYWNoIFNNTVUsIG5vdCBvbiB0aGUgb3ZlcmFsbCBwbGF0Zm9y
bSwgSSB0aGluayBhcm1fc21tdV9hdHRhY2hfZ3Vlc3RfY29uZmlnIHNob3VsZA0KPiBwYXNzIGFs
c28gdGhlIHNtbXUgZm9yIHRoZSBzZWxlY3RlZCBzaWQuDQoNCkFwb2xvZ2llcywgSeKAmXZlIHJl
YWQgdGhlIGRlc2lnbiwgSSB0aGluayB0aGlzIGlzIGludGVudGlvbmFsLiBJIHdpdGhkcmF3IHRo
aXMgY29tbWVudC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg==

