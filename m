Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F66606D35
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 03:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427256.676126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olhCZ-0003Un-49; Fri, 21 Oct 2022 01:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427256.676126; Fri, 21 Oct 2022 01:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olhCZ-0003S0-0R; Fri, 21 Oct 2022 01:51:59 +0000
Received: by outflank-mailman (input) for mailman id 427256;
 Fri, 21 Oct 2022 01:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gujA=2W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1olhCX-0003Rt-Dw
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 01:51:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0f74f3c-50e2-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 03:51:55 +0200 (CEST)
Received: from AM6P192CA0063.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::40)
 by PA4PR08MB6046.eurprd08.prod.outlook.com (2603:10a6:102:e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 01:51:52 +0000
Received: from AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::29) by AM6P192CA0063.outlook.office365.com
 (2603:10a6:209:82::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Fri, 21 Oct 2022 01:51:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT010.mail.protection.outlook.com (100.127.141.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 21 Oct 2022 01:51:52 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 21 Oct 2022 01:51:52 +0000
Received: from f43e12d8d49c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10E56816-F2E1-4EE2-AFD4-0BE3D38BCFEF.1; 
 Fri, 21 Oct 2022 01:51:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f43e12d8d49c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Oct 2022 01:51:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9745.eurprd08.prod.outlook.com (2603:10a6:102:31c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 01:51:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 01:51:37 +0000
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
X-Inumbo-ID: f0f74f3c-50e2-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hnMuhI++YiRqsJkjr9lX+C7enQSBtPCKB3lRZ9C+i6ietfAOaF8yRuMD4tyqLvaTBWDDn/ukWnL4JOtQBSdr+KVBVIjrtcSPQWq2YtoHyKj+CtqIPefaHtCyuaPQjiGoVrx/MW9rV37CMciWZNyYBrKJadObKzXIO0XhJOW1mWDGfeCgxr8yPWcZqyXBriiIUeLA7ydPLh5vOHwhhomF8pP0Ux/csplepgS6ED8CVKL0fzexAbgFchX1xkeKb5Q0Mru3QLmNfxsOOx1/V+26EryCyyzpU2DZwJQ7JiYCXB3PDzykQnLAVO1m6B3nFcMetS9WpcHhpy67z0FFFLA78g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zguq9kvnBtCiJ0MP0VGOCtOPayaIcJTAyjeljmE1njc=;
 b=B9IwpWYxFqxZXRnbueuS4TLXH0LYq/xBQKOqo5RV+g1v81V+Q1xelEjVdyY2Fke90VpjFpdxQFQNj6KMnxPjTlp9Sg+o+57bDvkT508NTTm8vBaKXEuxZuduVRc5XkaUMJPj3Dxx4+/eHtEgJBVLMzDczCmKKgCXoNRKOK7YC+rmSTieNZwFJjmZQfoL3FXcQfsvSKegeTUESNVDtN24gFPB5BotzMtN+1YVgLBMSwNAlY43o2bor3yw6pKcFaYAeS5EL+DoilYUfTB92cgw+bJmFdCN9dSvqQfyri/KFN4MmpqKbJ6TWx4R80e8wZjmcS7kiliRTnqzn0EOoDRnvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zguq9kvnBtCiJ0MP0VGOCtOPayaIcJTAyjeljmE1njc=;
 b=D7eW1d9/eIyJ8lvv1Tg9GZC8rGdHLmlWFAeYas+Kml1IIYdOut0T9OpqYbkfJmqCMv5KPjynYGu+wpTcLbr6N+u4btuRlcKmYT4xAfkSnFsYknw2zVqWuGNmoiy+NRzKXumEpjZHQxhyN+K3A4ChUT+jR39h0yZwdR5GSTeNwdA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+T8/D7BqN90lgqYtvqMax6nPcnNHsTDtifJeq8U5jFeD7tUwPYrP3giK+xzDMrRFlmSUGz2LlFD7upoFJtZjOA2UeP2eq+b3U4+/ahCIgGrKSU1QRsLrC/4TWTOfnT1+EFnvAqG5ZtERZfEgOKHRWyRjkkWZIOkveRK6S5G7JsYHIeu2yBF8sjaWyAyNRS5i6OoFxW4DqqQAhYK1xYS3ZFhrdYbY6GklLbXhkrXcuGyQS07cHNdxDiygi8pubfFD0i7y5puYg9A+k8sg2uOVSiQJnnoI7cy5Z+oSKVI8INEhtqY7+lvdk5DcG3X3GxbmWlV61W21avFTQKQ8pAvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zguq9kvnBtCiJ0MP0VGOCtOPayaIcJTAyjeljmE1njc=;
 b=a4AIBBNZ42Y+iYFThu+6sAa1wQKvMjlx0c1Yt2dmpFdGPElNNEjEGGo/m8QNrYaKy6CIiX5hdtmtZcvzd88Uadk/aFwBYBmwN5ukr3m/awhASs4NxUNNfpLt89GJZUuWasvDqOvJnFTYJCs2KoPuJ3mjl9ej/7CilzQfsgLEXb3S55BpwYCD+nxk/t/0U24fS7C8FxF9mMw9/+kt3gTbSNyFMLPS6AaJ789f3EFYWhG1uMOzP0LFc2jLsCPhhziDze3o7jbZrPjtbqr9iUFWz9RepWd0EhFCN3/QIRQk0asvi7mIy8H2Nt7ZNezOE4rvmwn2dO0hF9pnUcYzL8k7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zguq9kvnBtCiJ0MP0VGOCtOPayaIcJTAyjeljmE1njc=;
 b=D7eW1d9/eIyJ8lvv1Tg9GZC8rGdHLmlWFAeYas+Kml1IIYdOut0T9OpqYbkfJmqCMv5KPjynYGu+wpTcLbr6N+u4btuRlcKmYT4xAfkSnFsYknw2zVqWuGNmoiy+NRzKXumEpjZHQxhyN+K3A4ChUT+jR39h0yZwdR5GSTeNwdA=
From: Henry Wang <Henry.Wang@arm.com>
To: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Christian
 Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: RE: [PATCH for-4.17] tools/ocaml/xenstored: fix live update exception
Thread-Topic: [PATCH for-4.17] tools/ocaml/xenstored: fix live update
 exception
Thread-Index: AQHY5KTKwWQiC9Lco0elva4YOgIdSa4YFJwg
Date: Fri, 21 Oct 2022 01:51:37 +0000
Message-ID:
 <AS8PR08MB7991F9FFD0D8BDF36084B322922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <12d90632bf881e96e0b6c256df193f00df187dc1.1666284745.git.edvin.torok@citrix.com>
In-Reply-To:
 <12d90632bf881e96e0b6c256df193f00df187dc1.1666284745.git.edvin.torok@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C134CD02F6B28448A303B81D9970DBE4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9745:EE_|AM7EUR03FT010:EE_|PA4PR08MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: eeeaf7d6-bc7b-4976-32d1-08dab306d354
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Sip69zAsE4NwRzxwaZmJdP6ax5dhK3LXJy2l2cGYLvQbsDgSeCMWfYpoISApzMwJHQtaGn8GfVAvCpEhZf1x5Q3LnZVpzRSGp2XhVkJKF0///3Nfj+sBnj8Vcehc5C5YXzzaHcpnTUl10MIPSCBVbvpP5+4xP74Jx2jTbcfkWQnOiSwjR1ODNYib1HPnmFq0Zlno1scQouI0isNelvs0gP223fcM6EO3EwTzllb9ieL5M1EOj8Ev8zqTZcx/naYHRtN34QeARiqgwDpYWrj9ujy7f+xvuyFxaTkgMW4KCdeLggdJKxm0CahVvOvu0yRgPkVtwlRAegnXbgiScx1dGVrrqHpXqe7yI5lMfQJfnd8AHgq07szp5kSaaVwq7iDA/xmIX9WRaosO6M5m1EohGTxl4IwCguWt4CmbOEtxPN962WW1Dhbz8UYa60iZ1E/dLVeg7v++UOxdNZCL4No7Y/sVP48bqhIWu8c3KBzJ1DLEI/uoK4Aarq2ZbuPAI/V1ueLqUz7hdpe8q7+UUs/4WVy87SznXElRTdY6nbdyUvSibx1dOrRb/fAcxW9MXMF6IMOdmhz41RggrhVC4U/7IUwoCDljGOYmrtaJMyB9LLNcQ9lznegrBiG1l+FzYxpOSVg31P8/UpJgpDV6R8YQNqSTR4FSsgryZY8K0cb/QC05CeJpYQHR9cVcMU1dgTc3es1ArQlKNiyEQ2/GkPQFVPLP+CbkMs+86EYtn5/FLqDLvJH1/GqyHCIzyvnm9jeigjUc2phNsFqC4xIY5hoMPNi0GQKfCWg0w5pD16ikcsY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(33656002)(8676002)(66556008)(66476007)(41300700001)(64756008)(122000001)(66446008)(186003)(38100700002)(66946007)(55016003)(9686003)(4326008)(66574015)(2906002)(76116006)(52536014)(8936002)(86362001)(26005)(83380400001)(6506007)(5660300002)(7696005)(966005)(15650500001)(316002)(38070700005)(110136005)(71200400001)(54906003)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9745
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e5590c0a-c123-45df-a8ea-08dab306ca7f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XMkeRq9w/MUTIWOk1ha0EOpFKJJgCgDpSA1gLWBNkSAlDeHIlxq0/5rgABzt1AmcZMC5uEAl6AGLU3KLDfnhUABqvAU1zXMj8EZJNKouXjDQfBW5LfEm9s+tY1qxmjBltHbG8PeAdgctx1uX0BtVTcjMCTT++4nSNaZgt92/gDv/0BVYsTivP5GQNTmzIsbS0R/Ln6x1a/W1OaQfJZIUbrwQwCO38BiJUThIoSESUkohKcpF0x12xMXbn51f8vGgdebYjOCnY6d9r07EFhTT1Lc0Z9aOQBxKX5Qp63AxeW1ENDSSGiAK179yb9/rLptA3B8Hysp471897YQGwc84AA2vOejs61wP8yX2H3qYkWn1JGhUcTiQGPlSAj0tlJM5UROEoYUzNeiSCkN6nvoBI0DN2iYpKGMLG81gIXE73VasKO+Lg0s/FDUyHVVEAH6raW+02p0OFqmVOxR1S/EfPdHFv4AuY1kQURRTR0huQB9fpviFcAILjmBAPhO6pxu/SqjyrZJFrr5JItlfZaPkbkrFU0G5LqQNgwDSTHPDwMqTmXoNk8Xdh7DSRBG/bS5pAiISEy5LPimoxkhfUNtSDc34BiQscZbvYvo6k3IkrcVQRs0a1f+OYe9LeXuabZu6xNYX2wnSd5PSFMr5N5biC+/0gk6Dv+pr327gCPB7a++gfSlSH3ab0j6W4CNdoijdGLJSkoaAFlqKS7myIO/Zxc91pEBEumew8f9uwtWhVmIkKj5UhREVc7CAVPa/bjVHfbCAzzuARjBhheZANVEv8B+FkvPbMVAd2XfyOSQbgUM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(8936002)(52536014)(83380400001)(316002)(40460700003)(33656002)(2906002)(54906003)(110136005)(70586007)(70206006)(8676002)(336012)(40480700001)(5660300002)(186003)(55016003)(66574015)(41300700001)(4326008)(47076005)(86362001)(36860700001)(26005)(107886003)(478600001)(82310400005)(966005)(9686003)(15650500001)(81166007)(6506007)(82740400003)(7696005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 01:51:52.2407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeeaf7d6-bc7b-4976-32d1-08dab306d354
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6046

SGkgRWR3aW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRWR3aW4g
VMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGZvci00
LjE3XSB0b29scy9vY2FtbC94ZW5zdG9yZWQ6IGZpeCBsaXZlIHVwZGF0ZSBleGNlcHRpb24NCj4g
DQo+IER1cmluZyBsaXZlIHVwZGF0ZSB3ZSB3aWxsIGxvYWQgdGhlIC90b29sL3hlbnN0b3JlZCBw
YXRoIGZyb20gdGhlIHByZXZpb3VzDQo+IGJpbmFyeSwNCj4gYW5kIHRoZW4gdHJ5IHRvIG1rZGly
IC90b29sIGFnYWluIHdoaWNoIHdpbGwgZmFpbCB3aXRoIEVFWElTVC4NCj4gQ2hlY2sgZm9yIGV4
aXN0ZW5jZSBvZiB0aGUgcGF0aCBiZWZvcmUgY3JlYXRpbmcgaXQuDQo+IA0KPiBUaGUgd3JpdGUg
Y2FsbCB0byAvdG9vbC94ZW5zdG9yZWQgc2hvdWxkIG5vdCBuZWVkIGFueSBjaGFuZ2VzDQo+IChh
bmQgd2UgZG8gd2FudCB0byBvdmVyd3JpdGUgYW55IHByZXZpb3VzIHBhdGgsIGluIGNhc2UgaXQg
Y2hhbmdlZCkuDQo+IA0KPiBQcmlvciB0byA3MTEwMTkyYjFkZjYgbGl2ZSB1cGRhdGUgd291bGQg
d29yayBvbmx5IGlmIHRoZSBiaW5hcnkgcGF0aCB3YXMNCj4gc3BlY2lmaWVkLCBhbmQgd2l0aCA3
MTEwMTkyYjFkZjYgYW5kIHRoaXMgbGl2ZSB1cGRhdGUgYWxzbyB3b3JrcyB3aGVuDQo+IG5vIGJp
bmFyeSBwYXRoIGlzIHNwZWNpZmllZCBpbiBgeGVuc3RvcmUtY29udHJvbCBsaXZlLXVwZGF0ZWAu
DQo+IA0KPiBGaXhlczogNzExMDE5MmIxZGY2ICgidG9vbHMvb3hlbnN0b3JlZDogRml4IE94ZW5z
dG9yZWQgTGl2ZSBVcGRhdGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZp
bi50b3Jva0BjaXRyaXguY29tPg0KDQpBcyBwZXIgWzFdIGRlc2NyaWJlZCwgSSB0aGluayBpdCBp
cyBxdWl0ZSByZWFzb25hYmxlIHRvIGluY2x1ZGUgdGhpcyBwYXRjaCBmb3INCjQuMTcsIGFzIHRo
aXMgcGF0Y2ggaXMgYSBidWdmaXggYW5kIHRoZSBwYXRjaCBpbiBbMV0gYWxyZWFkeSBoYXZlIHRo
ZSBhY2sgYW5kDQpyZWxlYXNlIGFjay4gQWx0aG91Z2ggSSB3b3VsZCBhbHNvIGxpa2UgdG8gaGVh
ciB0aGUgb3BpbmlvbiBmcm9tDQpDaHJpc3RpYW4gKHRoZSBvY2FtbCBtYWludGFpbmVyKSB0byBq
dXN0IHBsYXkgc2FmZS4NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC9G
NjVDOEU1OC1FRjNELTQ3RDktQTk0RS03QjcwRUI5M0UwNjhAY2l0cml4LmNvbS8NCg0KUmVsZWFz
ZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2Fy
ZHMsDQpIZW5yeQ0KDQo+IC0tLQ0KPiAgdG9vbHMvb2NhbWwveGVuc3RvcmVkL3hlbnN0b3JlZC5t
bCB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC94ZW5zdG9yZWQu
bWwNCj4gYi90b29scy9vY2FtbC94ZW5zdG9yZWQveGVuc3RvcmVkLm1sDQo+IGluZGV4IGZjOTBm
Y2RlYjUuLjMyOTlmZTczZjcgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC94
ZW5zdG9yZWQubWwNCj4gKysrIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3hlbnN0b3JlZC5tbA0K
PiBAQCAtMzUzLDcgKzM1Myw5IEBAIGxldCBfID0NCj4gIAkpIGluDQo+IA0KPiAgCSgqIHJlcXVp
cmVkIGZvciB4ZW5zdG9yZS1jb250cm9sIHRvIGRldGVjdCBhdmFpbGFiaWxpdHkgb2YgbGl2ZS11
cGRhdGUgKikNCj4gLQlTdG9yZS5ta2RpciBzdG9yZSBQZXJtcy5Db25uZWN0aW9uLmZ1bGxfcmln
aHRzIChTdG9yZS5QYXRoLm9mX3N0cmluZw0KPiAiL3Rvb2wiKTsNCj4gKwlsZXQgdG9vbF9wYXRo
ID0gU3RvcmUuUGF0aC5vZl9zdHJpbmcgIi90b29sIiBpbg0KPiArCWlmIG5vdCAoU3RvcmUucGF0
aF9leGlzdHMgc3RvcmUgdG9vbF9wYXRoKSB0aGVuDQo+ICsJCQkJCVN0b3JlLm1rZGlyIHN0b3Jl
DQo+IFBlcm1zLkNvbm5lY3Rpb24uZnVsbF9yaWdodHMgdG9vbF9wYXRoOw0KPiAgCVN0b3JlLndy
aXRlIHN0b3JlIFBlcm1zLkNvbm5lY3Rpb24uZnVsbF9yaWdodHMNCj4gIAkJKFN0b3JlLlBhdGgu
b2Zfc3RyaW5nICIvdG9vbC94ZW5zdG9yZWQiKQ0KPiBTeXMuZXhlY3V0YWJsZV9uYW1lOw0KPiAN
Cj4gDQo+IGJhc2UtY29tbWl0OiAwYzA2NzYwYmUzZGMzZjI4NjAxNWUxOGM0YjFkMTY5NGU1NWRh
MDI2DQo+IC0tDQo+IDIuMzQuMQ0KDQo=

