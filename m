Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DFC996A27
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 14:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814453.1228017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syVvQ-0006sh-Kt; Wed, 09 Oct 2024 12:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814453.1228017; Wed, 09 Oct 2024 12:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syVvQ-0006qu-I0; Wed, 09 Oct 2024 12:36:20 +0000
Received: by outflank-mailman (input) for mailman id 814453;
 Wed, 09 Oct 2024 12:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iX4b=RF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1syVvP-0006qo-AO
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 12:36:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2612::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1451333c-863b-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 14:36:17 +0200 (CEST)
Received: from DUZPR01CA0290.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::28) by GV1PR08MB10732.eurprd08.prod.outlook.com
 (2603:10a6:150:160::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 12:36:11 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::33) by DUZPR01CA0290.outlook.office365.com
 (2603:10a6:10:4b7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Wed, 9 Oct 2024 12:36:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13 via
 Frontend Transport; Wed, 9 Oct 2024 12:36:09 +0000
Received: ("Tessian outbound 0362136859cb:v473");
 Wed, 09 Oct 2024 12:36:09 +0000
Received: from L43b53e9024cf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7673F1DB-824B-49DF-9375-C3CA58A21B25.1; 
 Wed, 09 Oct 2024 12:36:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L43b53e9024cf.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Oct 2024 12:36:03 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9745.eurprd08.prod.outlook.com (2603:10a6:102:31c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 12:36:00 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 12:36:00 +0000
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
X-Inumbo-ID: 1451333c-863b-11ef-a0bd-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CQIEG6bInvu4BwSm7atbT/fLf4iKmnb88dhpAwh6kY/Z6CZ4RzFxRby8ibxs/bZf/vfDU3fQtC3pGy3BjcJ7bStK8FJQiPV88OCcZK5E8KGbq2UbQHQXHk0sxZ4MFXR/DtnNcEVMBTM0rl5t/GhZLy/dH4240tUpH+HH6RqBDpxsYcdrRBxzXgXq6SE1i7UOvlIbpqJ2mvEKrPCJXAwu6+Whib8tes29iLZQtCb+ph2UuYAfjQhiyDUiB1bA6zVf66zzWVCTMPbEHIH4JMoAaRWu0B5dwoCeok1p/5vuUjKaK2J8zC5qeRz6gLnpGfW37NVs548AfwBoZ1o68xJHwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9jif4pNIdi+QBQLj42vQG051s4OnrS0s2xQRpjqpN4=;
 b=AudGRB1ambyYlt9oWmBUhYfjAbjxXrEAM+zjIEVKE82+m7RKfjWTaA1mLXlmdDa0LW9KNLO78yBdngAV9strZB8TaBz7hi3OJTTJtZxf4AzTml0DiYQEzMtOf36iCiSvAGtehNi7HmzVZpr9OXgUl1zMhJ2SuJXFQvKn5ws7mZl1wrxsxcV4r3M4i7t8HID6SnK5uYxcy+4t0yBcFxq78d1YBde0tqNywmOMUVi3LQyAUJ5ISL2PO49jx7iGR/ZHM/pQ197cR7XkMgCFj2EbfxxZyfRsWhkzs+lB3KQT0bSazJEQDkEpwANRGqVu0mx0ctHyYjDCOCaX+o0AvsAb+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9jif4pNIdi+QBQLj42vQG051s4OnrS0s2xQRpjqpN4=;
 b=Oqx2u3HuXibH0rbEFQ0fZcYS7kUOZpKL6Ie594Uz2V9gOWNJ1cfDkI1K+rUHup0ysECslcDRyuKD1L/f3bXN/XItbxMFE9ICo6mOYuWxqMRmzYEmP8mhuQZQV0Z0VNcJTSglMJ1IDvE+UcziOdIccQpocj2Hei3G1A1quKhuudQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3a43242215793db
X-TessianGatewayMetadata: JoR2TcAXrgXtXEcHTU9OUmuW3fxuDCMOpQbBgi2kPmMyakrZGCn12yBbT98YIPZ5jbXHGhBdrd37no7NBDegp63Lk7yJ3Hkz5tsUVupxOvaWboXjmQvbCANJP/4Jzhs33uiWfT3/lDO8ASkYWR44BnsK4+4AwDerLbLiPF91p9E=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2Dp8pTY2LHpsWrv47Y3uBoQzaP/P1+QkLkxycLSh/XM5E1v9sCC/EblrgX49sqAQv0Qqtc4WOMb/dbbOHW9rf3vcplFeO4hcnpxu/qyXbsk+t+FgJPsUrNzJi+utLJ6gORMlwlJDpL6cBjfjNCf4R5KHsdH1IyDLwphjt5GKKBYLTFjyMWgfcfmxzMMQh7kikPOXlPNHLZL7ryg8sO0oOBfgshIHxGbP++WheLxJ3jI82nogrTfyYRRPwV0zLO2t25Ys/WyUg3g4x5hCNjWKpGLEFPrAjAzmDxebGzMhjJOp/G00F0IUsXVAqcveK/ZsR1g0AVDxopgYL22TNBo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9jif4pNIdi+QBQLj42vQG051s4OnrS0s2xQRpjqpN4=;
 b=gyGaPr+4R2vrVXveHF9/Ivmu8dVBn8vvkMCKfWa0ICh09eHI/LGKzNQK2use4Pxls3Ju4s31YsXUt/g1Wgx7OawZxSBLTx46RZblVqfvMNF21mecBkn5nukwkpAodIfy3lhc/aRNfOlH5qahzi4xIR3XYsOB9ER2njca1W2vvNqkySpv1QEtvQN4zqjSsjwqo89CCTxOy07X471eqahINfkHLTGXWES7HConWpv9nBzZ/i7oz4+4ScE7dxaZht8PQQp1TiMms8+HMFBnbruTB/51jaWtGwePa+rA6w7F2lNBTQvtgl7jJBkTBxBnc9rbh5urnGzhM6YRsDtEuBY/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9jif4pNIdi+QBQLj42vQG051s4OnrS0s2xQRpjqpN4=;
 b=Oqx2u3HuXibH0rbEFQ0fZcYS7kUOZpKL6Ie594Uz2V9gOWNJ1cfDkI1K+rUHup0ysECslcDRyuKD1L/f3bXN/XItbxMFE9ICo6mOYuWxqMRmzYEmP8mhuQZQV0Z0VNcJTSglMJ1IDvE+UcziOdIccQpocj2Hei3G1A1quKhuudQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Michal Orzel
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Artem
 Mygaiev <artem_mygaiev@epam.com>, Hisao Munakata
	<hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Topic: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Index:
 AQHbGOqFqldnvX8xNEmI4LnFnImSpbJ8YaSAgADTLwCAAEEygIAAgZcAgABSRgCAABPTgA==
Date: Wed, 9 Oct 2024 12:36:00 +0000
Message-ID: <7601808F-C5A6-4F20-A61A-A389252C7C5F@arm.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
 <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
 <alpine.DEB.2.22.394.2410081523292.12382@ubuntu-linux-20-04-desktop>
 <85FF2EB0-474D-4807-8DB3-FC502A5B2DE8@arm.com>
 <451c092a-af4b-40f4-a902-28f6f502d39a@amd.com>
In-Reply-To: <451c092a-af4b-40f4-a902-28f6f502d39a@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9745:EE_|DU2PEPF0001E9C6:EE_|GV1PR08MB10732:EE_
X-MS-Office365-Filtering-Correlation-Id: 853dc5b6-62e1-48fb-9a1e-08dce85ef3ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?+9asx5XroVxgaD6RASi3FGb2WPnn230SYtb+zLL1Vb4cajqHhhk6cPz78uUd?=
 =?us-ascii?Q?Zc6xZ0nUGF7QU/IqyiMYCIg+bZI/se3YorVV8jwh0MSrP2Zqh0dfJVZuWlhQ?=
 =?us-ascii?Q?s9W0PTueCetbOM7U86jQRdl1/5JUPzRUw9hT54ghu/lT+LfZgUsgrleuygz6?=
 =?us-ascii?Q?6PTjKinHjwI98y+0hrSyALvTqxt1RogMlUQTgAO70Hk08bWa5uu4niG6VsEu?=
 =?us-ascii?Q?UKme6ymOH9reKYrbESAwbSQODyNiajBxWL9KERLDbQ+kiiuBYE1XpjNquRXJ?=
 =?us-ascii?Q?vWnJ6BtZoGlDTjCHRqf9KiDx8NjhvIXVzq6lZNWM5qPAhqViMr0RbniY0fdW?=
 =?us-ascii?Q?IEFsiM/apw7MQbzTX0urL9PbjXSU8dvtxSxu3Ksu3VolYE3rLh9ikbm5kGfz?=
 =?us-ascii?Q?sCTeW/Txs7IijmrwM3pBKRVLmoOGJ3gckxjcyfh74/LieXdz5A9JD1MVYh9i?=
 =?us-ascii?Q?vYr+S5SZ+UBcDad7wFNOPOj2o7XJ24vt7zNE89FNcqFwHrD39oMwKOSca+BR?=
 =?us-ascii?Q?3fkOvH9tVqHOm8Ip4rbcgU5Synt1IcYWkfNoEnnGvyBi3bhX/wef2QvbzwE4?=
 =?us-ascii?Q?ArfFHAbGHnVKa3KXZzAhysha201picok9aV+uYUs9YGqdPJTlnB5UTI5ARFy?=
 =?us-ascii?Q?SzPYqf7K/HrrpEiO1wCgYddkzDZrR891zS2BGtHR3kkdyRkVjJXbhSWUxCPM?=
 =?us-ascii?Q?Ck85euLbK6gaKcMbIJwYh9EoS4LBcdA521fpz4sR34CmgOxpKXJAHplpoTEm?=
 =?us-ascii?Q?U/pf20LUnrZMdSRiiqJ6FmWp6xMoSkggq+Ctb2eq662eG8UwyChVlb6Tqz8x?=
 =?us-ascii?Q?YqBsZSfGlFNO560GTLFM0Sok1HsJWTFaUh5rPNajdm/621rZTz198MjEr3Zr?=
 =?us-ascii?Q?4AQ8JqL/Xdiy50C1b8Rs1J5MyYiZlW++YQMPIY4j8NKwJUtpOnTagMk1LUbO?=
 =?us-ascii?Q?356UmkeLyNfD99cxFEoRdbGiBM8JgwkYgUwn/Drknd8WnoUZWkGGzmrkqf+a?=
 =?us-ascii?Q?xqNSddoM6pXhtiJ+OusZfPtu/MaQDnBIUk5HZhgXZbiD4Tc51E00govVIiJr?=
 =?us-ascii?Q?mIgBAo/b3LdB1k0UYe3IQu65btNnoQcR68P0h8sfe0mZ8kGhPVs1S+CPXCiT?=
 =?us-ascii?Q?KJrFfrmzoGz6uQ9MJ/1yo+FGb2jAqDI37qAS0DS8IRuKgKUHWQzwr4vFXxtr?=
 =?us-ascii?Q?BarkU5NTf+vYWB468ntvCpt02Q8og0PUhpDnSSBQokE4mPm1OuBynz5CEq4C?=
 =?us-ascii?Q?+vFl2lVu7MB+NhEs9GEzTiq/N7z5PLjxxMUiZcSwvA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CB57493FC1236747B7AAA1A4391F5780@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9745
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8af19e93-12b6-4866-37ec-08dce85eee96
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eQ/Yw1meqV2tQBuxBKTAqnXnfaP40VSD/8ZlXCsXk+94hP0FZZkRfkJiGpJH?=
 =?us-ascii?Q?TnECAwAQVcP846eJEYIZic5S4Yw2fW7vFy6cEBifvd4wCcwPJZyDE2C/01Y7?=
 =?us-ascii?Q?0MTcPG28apdp3UKvU887R1rNYmHwtZBzpNLcDHgnWNuGKk2jYvcaHrzI6J1z?=
 =?us-ascii?Q?qvG8G9iYtZ1Py5vNs7VP+aeHpvRV8vBnI3FIFKlLYc4FX7B5WS7ZA9+GEevJ?=
 =?us-ascii?Q?eP5DxPf7v+muyrQirIJGjibq51XfVYvo0zqkpoGWNjsgruPuCippuahZ9w/Q?=
 =?us-ascii?Q?1xo7AEn/yACmSMTUz4f/t6HYhJ2MZzXF25a+SrRZ7sw+1cEU/kUvBP2z1uTz?=
 =?us-ascii?Q?LWlcd1TDCT3vnBllXt22QrIYzH2cPNGg+TyOrbat7ciB9dFiw8n0M7QKy1oo?=
 =?us-ascii?Q?f0RuvHDIKbR4ItOh9Hx0ozIMYmFXoogKgL+pKYnVU4HCrJW6GmFPEYXiYjX+?=
 =?us-ascii?Q?j/pKaGWj0EERMFV1xxRZQg3gjfShlj6c3rCXGKZSdZQW8I2/Jzwuk9AgC7np?=
 =?us-ascii?Q?QDCoDYawCv88UYSujqBJ9WIPl7fnWft/W7BxpZHY/x9JvIHjMF0DS9Olm1hw?=
 =?us-ascii?Q?cuurKOADZCTOwvkhoFRFbv7ZLFhXDjUcinQkSDg1yGvQ5zdBO3K3IzsBfoX4?=
 =?us-ascii?Q?Be0OjfFAXvLByyMxoAX3MixHSC9MU7yYLIoxQc/65dTNddKMS8Z8kxeUjbP2?=
 =?us-ascii?Q?o7N0uN3vJmU2xuIpo+k2DsiLx18x7IWrHZSsBeH/7WvkPeCy8dhAFwIyOiGh?=
 =?us-ascii?Q?YfRpS5tCqIoBx7WTj7ABoT2ZMMpPhKDc435JV1iJ0JcLhiHUyH0YrsLj7vAF?=
 =?us-ascii?Q?eROOCCIp8ryc8Mr9n7iYDTMYQVFXTzWo7TsyGtbkGyONrTGTWVYWgdMgjk4d?=
 =?us-ascii?Q?18a33vvZKI2YdIlLesO020csaPpPAseOSRqlT8YfvVTMODpsuIXKLzoGPPhh?=
 =?us-ascii?Q?lO7KSY9+aholSdwz5umZRFYVCMConVxD6GCRY1dwKhgnpE0I8okNtgOLyn/y?=
 =?us-ascii?Q?Iyd+WsiLR3bmjKoGeHkdggC9t/j7yKRFVKbNsjI2H0AdqctAePsiz+gmYlRN?=
 =?us-ascii?Q?mH0a97UI5vy0Mp6bJRXoUHQV19IqfiW5UCUAq8NR4cjpFovFstMMOesc/cs0?=
 =?us-ascii?Q?m8iktkim1NUI3iCMLgVEv7Hl4dbSaGg4hfNw6g8wzhBHpf/2CoFOdIOCPiaG?=
 =?us-ascii?Q?/I4RcTuRvqrl/d0SyOhQ/z+PGBB7ZjbhtgLOZhv/Z6Lxu1YQJZBazxSiqLRL?=
 =?us-ascii?Q?dBiOU+ufNp/h1CpCtLY+eelMZEzyMhwMyPQ2R0ckIqnLahL8vAb3VfL59xwf?=
 =?us-ascii?Q?pmndpm2+3BllYgYs05IReWY1?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 12:36:09.6460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 853dc5b6-62e1-48fb-9a1e-08dce85ef3ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10732

Hi Ayan,

> On 9 Oct 2024, at 13:24, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Bertrand/Stefano/all,
>=20
> Let me know if the explanation makes sense.
>=20
> On 09/10/2024 07:30, Bertrand Marquis wrote:
>> Hi Stefano,
>>=20
>>> On 9 Oct 2024, at 00:46, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> On Tue, 8 Oct 2024, Oleksandr Tyshchenko wrote:
>>>>>> On 7 Oct 2024, at 20:55, Oleksandr Tyshchenko <olekstysh@gmail.com> =
wrote:
>>>>>>=20
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>=20
>>>>>> Add common requirements for a physical device assignment to Arm64
>>>>>> and AMD64 PVH domains.
>>>>>>=20
>>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>> ---
>>>>>> Based on:
>>>>>> [PATCH] docs: fusa: Replace VM with domain
>>>>>> https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@am=
d.com/
>>>>>> ---
>>>>>> ---
>>>>>> .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++=
++
>>>>>> docs/fusa/reqs/index.rst                      |   1 +
>>>>>> docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
>>>>>> docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
>>>>>> 4 files changed, 428 insertions(+)
>>>>>> create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>>> create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
>>>>>>=20
>>>>>> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>>> b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>>> new file mode 100644
>>>>>> index 0000000000..a1d6676f65
>>>>>> --- /dev/null
>>>>>> +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>>> @@ -0,0 +1,365 @@
>>>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>>>> +
>>>>>> +Device Passthrough
>>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> +
>>>>>> +The following are the requirements related to a physical device
>>>>>> assignment
>>>>>> +[1], [2] to Arm64 and AMD64 PVH domains.
>>>>>> +
>>>>>> +Requirements for both Arm64 and AMD64 PVH
>>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> +
>>>>>> +Hide IOMMU from a domain
>>>>>> +------------------------
>>>>>> +
>>>>>> +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
>>>>>> +
>>>>>> +Description:
>>>>>> +Xen shall not expose the IOMMU device to the domain even if I/O
>>>>>> virtualization
>>>>>> +is disabled. The IOMMU shall be under hypervisor control only.
>>>>>> +
>>>>>> +Rationale:
>>>>> I think there should be a rationale here to explain why we do not wan=
t the
>>>>> IOMMU
>>>>> in particular to be assigned to a domain.
>>>>=20
>>>> ok, will add. I propose the following text:
>>>>=20
>>>> Xen having the whole picture of the host resources and device assignme=
nt
>>>> unlike the individual domain makes use of the IOMMU to:
>>>> - perform DMA Remapping on Arm64 and AMD64 platforms, which is also kn=
own as
>>>> stage-2 (or 2nd stage) address translations for DMA devices passed thr=
ough to
>>>> domains and Interrupt Remapping on AMD64 platforms.
>>>> - provide access protection functionalities to prevent malicious or bu=
ggy DMA
>>>> devices from accessing arbitrary memory ranges (e.g. memory allocated =
to other
>>>> domains) or from generating interrupts that could affect other domains=
.
>>>>=20
>>>>=20
>>>>> Added to that, I am not completely sure that there is a clear way to =
test
>>>>> this one
>>>>> as for example one could assign registers not known by Xen.
>>>> I am afraid you are right, valid point. For example, on Arm64, if ther=
e is no
>>>> corresponding driver in use, we will end up exposing IOMMU dt node to =
Dom0.
>>>>=20
>>>>=20
>>>>> Shouldn't this requirement in fact be an assumption of use ?
>>>> Assumption of use on Xen? From my PoV sounds reasonable, will do.
>>> In my view, this does not qualify as an Assumption of Use, as it does
>>> not align with the definition we have used so far. If we were to
>>> categorize this as an Assumption of Use, we would need to change the
>>> definition.
>>>=20
>>> We have defined an Assumption of Use as something Xen expects from the
>>> rest of the system for it to function correctly, such as being loaded a=
t
>>> EL2. On the other hand, 'Requirements' refer to behaviors we expect Xen
>>> to exhibit.
>>>=20
>>> Our goal is for Xen to configure the IOMMU at boot using the stage 2
>>> translation, and to ensure that Xen prevents domains from altering the
>>> IOMMU configuration. These are specific expectations of Xen's behavior,
>>> so I believe they fall under Requirements and should be validated in
>>> some way.
>>>=20
>>> However, we could adjust the wording. For example, we might replace the
>>> negative phrasing with a positive requirement, such as: 'Xen shall
>>> configure the IOMMU at boot according to the stage 2 translation
>>> tables.' There is no need to explicitly state that the IOMMU is not
>>> exposed to guests, as nothing is exposed unless explicitly allowed or
>>> mentioned. We could, however, include a brief note about it for clarity=
.
>> I agree that this is the right way to turn the requirement into somethin=
g
>> that Xen shall do.
>>=20
>> Now i think we will need to have a discussion to clear up what to do wit=
h:
>> - assumption of use
>=20
> Assumption of use is something that other software/hardware components ne=
ed to do to ensure the correct behavior of Xen.
>=20
> For eg 1) AoU on hardware :- The hardware needs to support NS-EL2. The ha=
rdware needs to have GICv3, SMMUv3 as these are in the scope of safety cert=
ification. The hardware needs to have Cortex-A53  r0p4 as these have some e=
rrata fixes which affect Xen.

Ack

>=20
> 2) AoU on bootloader/firmware - 1) Bootloader/Firmware needs to load Xen =
in NS-EL2 mode. 2) Bootloader/Firmware needs to initialize DDR

Ack

>=20
> 3) AoU on compiler - 1) The GCC version used should be 5.1 or later.

Ack

>=20
> 4) AoU on domain - 1) Domains should not use HVC DCC registers as Xen doe=
s not emulate them.

Xen does not depend on that, the domain does so this is only a Xen expected=
 behaviour and we should document that Domains shall not use it.

Xen behaviour if used should be specified.

>=20
> The AoUs can either be tested or need to be stated explicitly in the safe=
ty manual.
>=20
>> - "integrator" (word always problematic in Fusa as usually use to bail o=
ut
>> and give responsibility to someone else) shall and shall not do (for exa=
mple
>> giving access to IOMMU registers to a domain)
>=20
> The responsibility with the integrator lies for things which cannot be te=
sted. For eg Xen has to be built with a particular configuration (eg SMMUv3=
) or a specific CPU errata. Integrator should provide at the most X amount =
of memory for each domain. SMMU (or any specific device) should not be assi=
gned to a domain (which should be under Xen's control).

Ack

>=20
> For some of the AoUs which cannot be tested (eg Bootloader/Firmare needs =
to initialize the DDR, CNTFRQ_EL0 needs to contain the correct system count=
er frequency), the responsibility will lie with the integrator.

This is an AoU on the firmware or the platform not on the integrator.

>=20
>> - interface and what we expect a domain will do with it
>=20
> This should be covered as part of AoU on domain. We can have more example=
s of this in near future.

In my mind interface are for example hypercall numbers and behaviours.
I would not expect to find this kind of stuff as AoU.

Cheers
Bertrand

>=20
> Kind regards,
>=20
> Ayan



