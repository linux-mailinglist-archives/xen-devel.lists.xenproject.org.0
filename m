Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FABA5DA56
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 11:19:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910221.1316970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJBH-0003XC-Kb; Wed, 12 Mar 2025 10:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910221.1316970; Wed, 12 Mar 2025 10:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJBH-0003U6-Gp; Wed, 12 Mar 2025 10:19:19 +0000
Received: by outflank-mailman (input) for mailman id 910221;
 Wed, 12 Mar 2025 10:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yV3S=V7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tsJBF-0003U0-Nv
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 10:19:17 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2607::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72a998e1-ff2b-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 11:19:16 +0100 (CET)
Received: from HE1PR05CA0300.eurprd05.prod.outlook.com (2603:10a6:7:93::31) by
 AS4PR08MB8094.eurprd08.prod.outlook.com (2603:10a6:20b:589::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 10:19:09 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:7:93:cafe::42) by HE1PR05CA0300.outlook.office365.com
 (2603:10a6:7:93::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 10:19:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 12 Mar 2025 10:19:07 +0000
Received: ("Tessian outbound ae00a21450c4:v585");
 Wed, 12 Mar 2025 10:19:07 +0000
Received: from L179663aa5c03.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91EA2D5B-1B33-47BE-B47B-4838AD37A228.1; 
 Wed, 12 Mar 2025 10:19:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L179663aa5c03.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Mar 2025 10:19:00 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com (2603:10a6:20b:36a::15)
 by PAWPR08MB10945.eurprd08.prod.outlook.com (2603:10a6:102:46e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 10:18:57 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5]) by AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5%2]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 10:18:57 +0000
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
X-Inumbo-ID: 72a998e1-ff2b-11ef-9ab9-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sty4TCV8207NZJEYcREi0gFalSpGVrsAxM1rDis1xLdYGAAe6GfljfW6ZCM0BzmThV8zKxCmGrLKWgDtCM3yrU636R1WIJE+UTczdfdTNnKQrztwMGNvC4KcgKtqbxAjG0VR5HNDT+IfzOOtacCId8ydO7iqCY9d/lmdxMSNV9cJybfQibu408y29c3aELPPBY0HzGNFsKJIaYigfiYJhSkxDKqHj+uc0pCpTXnXOoc3eKUhqIe1PvO6yVKR+6WScRuGW0NK7wt0CpFdc8kZFZA5v5hNjs2OrCNt7DPbnyVCqOHZ2tzKPRORb76ay12suNp8je2iiCFT2c8D1oJ1nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bn42wP4yoYAoScoQp+R6oxveYDV5SMA6NYFW1P7XDxo=;
 b=Kc6HttqhPiI36J20JyLC7p6SKa6s5ejhYBvzUvp0i6EBhg4ctdfe4jaJRDph6rmDElDKJOh6Agx5kvZsi+chFcTxyvxirB6LCbMrq/kXOP8Lk2ujIDSbWGUKB4A5/ZVQdLfJpFlvDW96G8GxQvRIbdULTG7LyYqVG+Q+Xgy5rbNtSKELaoENqBjTLzgx6fJNmupG63/iLNI/jhvA/nOi2ZtJ1yniWK/hrxs+bmYUs3kK25SAL+c8PYDou+4yBtf76+zF1ORPWmOQVw5O24DJEa9d0znvT/mg1lACp4DXDRiS2mXD+qcZn6jFtdTBsOdlnOCMUA0yJpcIXt9N8z13nw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bn42wP4yoYAoScoQp+R6oxveYDV5SMA6NYFW1P7XDxo=;
 b=RrjBhZtHkxKs6MYftXQfsYxVkHIk7u1kmOlZEreihckxvR8MmnzYC4cOU6okLshcHquY2M8tTUQnogW7cvZdJvKcOVoKt9e+QdfYelhh1QBP14fVKBCGYpwRKcqiKUQ9/DGGLO/xOweBHy8PKbMeyZWWepmBAcvCcnIno+qnoA8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97574fed7f68dc7f
X-TessianGatewayMetadata: r7V/5MBBmCDiUqRVott4wIw/wqvrdDRgoX2DwRS1ASuxPeuLP4+vOTwzthVwNrELRSK0D5K4cIvWykGAdiwL/TjPJDo5iSjWmJREs1un+jPuNrjNf7d0NOl4NdOBz8lcoykuGc+EX8gRKuRDHaTFQpqdh3RPZhkgtG/TWKa6VVg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siMhGNWUELr37buG8181jVHnV/nHf6BXIVt5O2ZvQXHLZSjXBxHXCrWnbOlXY9Pob9B1chsM8DiUVi2ZdG8ku/w2QV7vgJ7Zce0cwo7dcDJIIih1MTz6JINcVl11UeHp3TT1IPANtB2s/AOLAoByyE7tSoUXOU2g5mnb34d/E6vw7pEeNa8ee3nZawHjLh51Yr+qOWTPmtDC1YFLFghG2ObSrCOoKRWM3Pc6508aJdOsrmrBCDZzCjThcY2DbGOunbakQIbANaK42BpC2GgQi+UFYoGQeJslwe33GIiTCusPDVB0tzDqvoos4VuuUMLVVhOC6mLHO9ZP0pGtnIIcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bn42wP4yoYAoScoQp+R6oxveYDV5SMA6NYFW1P7XDxo=;
 b=n7EVIx31AQqSpxiQD4QG99kSkU0FOzxN8PJJ1IQR1EfDkn+6BSTR6oTrWF8Gdvpub3/sSvq1Ar1o/dtPvqhkzomY/xJ1qR878WaZaiXFbA7WuzWrEo07jEv7UwWRzO6Up09s1vPWB9GdnrtXaVwdCJ3bEP7VcX2zq5Z3BxzZGlJW59xujW5OUPAakLhKE4bXSoKX1NJdufclJg4djUpDnfulpvslk4i3JyMPaIU1yNow6d3lMrdHVIu4GIYUKd+xKjLPTUiHAOawglYYvcAiFasUUhpzpRgl7U0of0RDzodw3SxGU4rwNRRhCuAsf+v9euhGz+1SWfV2u36JvzplUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bn42wP4yoYAoScoQp+R6oxveYDV5SMA6NYFW1P7XDxo=;
 b=RrjBhZtHkxKs6MYftXQfsYxVkHIk7u1kmOlZEreihckxvR8MmnzYC4cOU6okLshcHquY2M8tTUQnogW7cvZdJvKcOVoKt9e+QdfYelhh1QBP14fVKBCGYpwRKcqiKUQ9/DGGLO/xOweBHy8PKbMeyZWWepmBAcvCcnIno+qnoA8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/arm: Improve handling of nr_spis
Thread-Topic: [PATCH v2 1/2] xen/arm: Improve handling of nr_spis
Thread-Index: AQHbkzfe3FkZaWCwR0OEX8fvH5KRoLNvSdiA
Date: Wed, 12 Mar 2025 10:18:57 +0000
Message-ID: <89F3F51F-F643-4217-B115-A558249CB45D@arm.com>
References: <20250312101619.327391-1-michal.orzel@amd.com>
 <20250312101619.327391-2-michal.orzel@amd.com>
In-Reply-To: <20250312101619.327391-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM8PR08MB6578:EE_|PAWPR08MB10945:EE_|AMS0EPF000001B3:EE_|AS4PR08MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be98d15-1233-4241-8b85-08dd614f5303
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?lOkhGmm55CT4o/fP7gxyMhGEL6HaoRlcO+9BlNwbeeMvhQSwtkjS0f8Tvtsl?=
 =?us-ascii?Q?2F725/05FX6BpCWpo47jKHdjYn9YC5gEBqBAF0O9h2Jti8U7pScBlGtkPPs5?=
 =?us-ascii?Q?u6nYpVWjT6Pzz3ycNr0ZaAr2Db+fFfjeRMC3OsZDPxtedjwyEaxyufIaKQU8?=
 =?us-ascii?Q?9k6OjAr6Xn+CcbTc4J0NDU4qpSZMDmGKbYgtpAmgMhR/V/QZ1+5AJrH46Fr8?=
 =?us-ascii?Q?+MFAw9y3gn+QdpIcDQdn0uK22FLjLfxers7ClzF9Dr38sbuT54ESY5fgqMo6?=
 =?us-ascii?Q?og5FiWDDxmM0vhhtIP7IotVpQ260UsR01RxwmjW7eFXTcfnQQqP0Pry4DYug?=
 =?us-ascii?Q?xNtZaI3MXmVEwwZhJRWeBXcm7OGKvyQaDiOUfso790lFWbuz9dVNILYqPybE?=
 =?us-ascii?Q?uvKQJcXlCW6gDbUkWWGjGR8BGVimG059Re6MN8GcI/RJIaBL9D2GFfnrSmXe?=
 =?us-ascii?Q?jBjfg+2yH691szRmjyRzPaQQ6TLIy2ygP10XLarQg4wYgmZXGcAACGBCVmeM?=
 =?us-ascii?Q?3AX5//KJmPyGdzi9SKugja7PbIxukOU0Df36a4+tk+MVWnByzssLXOGYCKdj?=
 =?us-ascii?Q?MOBAtaNQUoVBwWctB8rq2TvFttLgy0l2O8ONQOJoR6YN4QewX1VJvs8EACWC?=
 =?us-ascii?Q?rveQ+MgFzPh3vbkhLalp5ck/XTEMIwvpRjnELNJd9OkNqktW+0fhNqTJD+1L?=
 =?us-ascii?Q?0UB+08jwoKVAtj6wEXtzSMvXIEq+zdIFitmnrcS8skYERTPers6x8S3AdS1G?=
 =?us-ascii?Q?uj3rOKaDlqdtr2iCdbe/o6nYPnhPuCITDfSXfmOhj3DQ602cCncw1pFkDgMY?=
 =?us-ascii?Q?D0E7y5ZYUD0PR6NGEGoNVsEKC+vQ5ld1SfmkcBqpuYCIigMWcHD7v9xaw0v2?=
 =?us-ascii?Q?6rqI/04XCHmzcIpip9vYwH414jt+KfG5PItkbxTlnhiZJHH1TcH0IAO4qy6e?=
 =?us-ascii?Q?voRneoZbGnwpgPv0OUbJ//fMFnN6N6bdbGodvY10piU25GDOOFIwlSyXXjtk?=
 =?us-ascii?Q?JzOWrYSNNNxqs67fDYW/KB3m+wfbyEU665y5PlKMMgZqiVACtXFsOq0IUhTA?=
 =?us-ascii?Q?tlz0XXE7SQPDI99/Z5PNOsPUbhMvWh7mvawesncmKOnM90MGhmqYPVHf3pXO?=
 =?us-ascii?Q?HDwIkXOWJlTDGMWwqTg8fjvqDeCqVULcNUnv1G7/mMG9XzLlPGNUVeo0H0yV?=
 =?us-ascii?Q?LvSy3ryfd9MFU/geBb9aPPOKVzSmknENIEgB9BEygvnIClmtAvtLLip4jq7k?=
 =?us-ascii?Q?kAm+ntSP8AhO6AUqRWLCsu2M/t5gjzmrnRSY2agFAhT8ZaTsk2nna2cSNKuW?=
 =?us-ascii?Q?HiM5RJK863WefOG+2thjzywnRG54lAfaSIhM0PPWnGThF4hATIyhTQRRjetJ?=
 =?us-ascii?Q?kpi08K4s6N8v+i1+nVqGSlejdxncrBs+9PE3JYLooNbw31e/a3l/nGE028DT?=
 =?us-ascii?Q?78pRpXNhl/ifZSqIBJ+uGrW0GW81Pnho?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <176950BA82448A459F8E5356D7847EDB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10945
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:20b:36a::15];domain=AM8PR08MB6578.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31b26e33-48fd-4871-5d7b-08dd614f4caa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aQv4wrjgr+W/wwTVzoAPgXaJtKcS5d0O2cvCQ3sRzZbWYI0DXrYDZ1WTR1CI?=
 =?us-ascii?Q?n/Ly+YxACwZx2v0ng1MVY0hoR03024Fg58rq+vi5HZckFdf7SIadsdrv3cNn?=
 =?us-ascii?Q?IE98fPXrB8rRDtAix6M6MVzakKCmwHbFq4uNItL3epODLp7hbxyHD6RRfZEn?=
 =?us-ascii?Q?OSIRLoZnFbDpSHxlY8EtGueaqsE/MlrLdhn14FAxR7A8R6gvX8wZdguP4rd4?=
 =?us-ascii?Q?dvAIHr7aYbnxTOIAXGF61g4Ix5TkxWsRVShYuXe9NluxCUAR96LRWNmoZ9Zp?=
 =?us-ascii?Q?CgfwZ6U7WzN8+MfMXvJuO9NqN+xofUW4sn6gc4v/ffTJjJ6t9tDEBWbV/Klf?=
 =?us-ascii?Q?LzyOAXk5z0FzL7GYkqhXalb4BJlQ3h1usP1brOg66/c+NpC4wJ3X5aq1slUx?=
 =?us-ascii?Q?gzO6/Jbm+0cZAIE6jOXpsWV3eGPVorucU4/XN5vKXR/492/A+o1Lhu4SVBE2?=
 =?us-ascii?Q?6VO7wluBejtjZ1jeWwIcxOx0kIe5Pfuf/7oTW+ihmPcV1C1xo+PKWWThnN7o?=
 =?us-ascii?Q?RN6nH6mQnQYQoSBs9jDbVRqZe/aG8I86gD75Z2+a08C6wUWbZ7RXUAKXLMs8?=
 =?us-ascii?Q?USapw+7UHLuXljigkO7GpjFlq9Zi7jXpC4VcR0+TCQJUL5A9rs8HlsVzwnNJ?=
 =?us-ascii?Q?I5dLuIusXgr03YMl3gzJBpHe6Q7ySTk1TdKWCG/zIRsJhDsrn8AdHfoqmkdj?=
 =?us-ascii?Q?y78vjTBvHDs/WrYIYbSifQWY9Z2QrBcpMCvfBOcrcrBsmq3pbv5bZx6iLJrs?=
 =?us-ascii?Q?DUF0gOgwwsQtmVvA7G8DGljBMewNxga39XCURfe5+iRX9kcD1DkF1x+xXNC5?=
 =?us-ascii?Q?dfC/ddGpLSvfz/bJ8tByvDMJ1ERmr70GSZF+R+COB1I7qhhIE3WZE7NolJ4I?=
 =?us-ascii?Q?EFPPWINrjw9trD/F/P8A1XNaZsx4F6IeYx4asg9Pnyk5Bsh4JwXIdBsGgGJP?=
 =?us-ascii?Q?c+hHa+F/tBXMM/cdw4HwjR6uXTuYzx69n0iklw+/wyrhk0GDuUnoLGdQS0gb?=
 =?us-ascii?Q?oWM6Os9ZtrIZ4u5SgypAoVaL2k7EVwIPiCVGopCzaVfeoBqOx3TuiBYtBGu2?=
 =?us-ascii?Q?b+tkDT+raRQow68vx2hnhaW+wSSVhSvHN1o3aclifgy3dam7th7lVppkUZL7?=
 =?us-ascii?Q?tWKBycblq37lOVcOcr1wBk1+MDJbqKD5mmV6vR50K/JWdPpwli5aLiHeynKk?=
 =?us-ascii?Q?+qaLYhs36numkF74vyfDN6ObT3cj8biXsrGAYIR+nK/YV862h4uK665ZLY/8?=
 =?us-ascii?Q?7+gqKDKwklmUaUAl6uMJptHWM980lu4b7GDk+Wq4KY8OgcALDRAb+aTufEXS?=
 =?us-ascii?Q?JeSNNqbhuEKdBwblGR/2aKPnJ0kkXxNPS909HeLFiQ5+HqJAHlrKZbVQxr8k?=
 =?us-ascii?Q?+0E6S6S/FgEKYys+5k6iNKXO1068eJ0lPzn54y0zoUH28c1oQPRmN9qu/XZg?=
 =?us-ascii?Q?IRtxVS3WlFwrbZ2XmJMRxWHZ/Kq3t29+7YdYSvLNYeCXSX01L4ErOb+T/8iU?=
 =?us-ascii?Q?j7uMPvW+1v/yac8=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 10:19:07.8905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be98d15-1233-4241-8b85-08dd614f5303
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8094

Hi Michal,

> On 12 Mar 2025, at 11:16, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> At the moment, we print a warning about max number of IRQs supported by
> GIC bigger than vGIC only for hardware domain. This check is not hwdom
> special, and should be made common. Also, in case of user not specifying
> nr_spis for dom0less domUs, we should take into account max number of
> IRQs supported by vGIC if it's smaller than for GIC.
>=20
> Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 value.
> Introduce VGIC_DEF_NR_SPIS macro to store the default number of vGIC SPIs=
.
> Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC max
> IRQs comparison common.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v2:
> - add macro for: min(gic_number_lines(), VGIC_MAX_IRQS) - 32
> ---
> xen/arch/arm/dom0less-build.c   | 2 +-
> xen/arch/arm/domain_build.c     | 8 +-------
> xen/arch/arm/gic.c              | 3 +++
> xen/arch/arm/include/asm/vgic.h | 6 ++++++
> 4 files changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.=
c
> index 31f31c38da3f..573b0d25ae41 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -1018,7 +1018,7 @@ void __init create_domUs(void)
>         {
>             int vpl011_virq =3D GUEST_VPL011_SPI;
>=20
> -            d_cfg.arch.nr_spis =3D gic_number_lines() - 32;
> +            d_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
>=20
>             /*
>              * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7cc141ef75e9..2b5b4331834f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2371,13 +2371,7 @@ void __init create_dom0(void)
>=20
>     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> -    /*
> -     * Xen vGIC supports a maximum of 992 interrupt lines.
> -     * 32 are substracted to cover local IRQs.
> -     */
> -    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 992=
) - 32;
> -    if ( gic_number_lines() > 992 )
> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n")=
;
> +    dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
>     dom0_cfg.arch.tee_type =3D tee_get_type();
>     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>=20
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index acf61a4de373..e80fe0ca2421 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -251,6 +251,9 @@ void __init gic_init(void)
>         panic("Failed to initialize the GIC drivers\n");
>     /* Clear LR mask for cpu0 */
>     clear_cpu_lr_mask();
> +
> +    if ( gic_number_lines() > VGIC_MAX_IRQS )
> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\n");
> }
>=20
> void send_SGI_mask(const cpumask_t *cpumask, enum gic_sgi sgi)
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index e309dca1ad01..35c0c6a8b0b0 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -329,6 +329,12 @@ extern void vgic_check_inflight_irqs_pending(struct =
vcpu *v,
>  */
> #define vgic_num_irqs(d)        ((d)->arch.vgic.nr_spis + 32)
>=20
> +/* Maximum number of IRQs supported by vGIC */
> +#define VGIC_MAX_IRQS 992U
> +
> +/* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. =
*/
> +#define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
> +
> /*
>  * Allocate a guest VIRQ
>  *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every vCPU
> --=20
> 2.25.1
>=20


