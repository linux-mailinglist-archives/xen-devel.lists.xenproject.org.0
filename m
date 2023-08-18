Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11E780387
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 03:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585753.916926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWodn-0001Gz-Pe; Fri, 18 Aug 2023 01:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585753.916926; Fri, 18 Aug 2023 01:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWodn-0001EK-M2; Fri, 18 Aug 2023 01:51:07 +0000
Received: by outflank-mailman (input) for mailman id 585753;
 Fri, 18 Aug 2023 01:51:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpBR=ED=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qWodn-0007kI-1x
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 01:51:07 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe16::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b14a030b-3d69-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 03:51:05 +0200 (CEST)
Received: from DU2P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::25)
 by GV1PR08MB7345.eurprd08.prod.outlook.com (2603:10a6:150:20::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 01:51:01 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::8) by DU2P251CA0010.outlook.office365.com
 (2603:10a6:10:230::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.15 via Frontend
 Transport; Fri, 18 Aug 2023 01:51:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Fri, 18 Aug 2023 01:51:01 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Fri, 18 Aug 2023 01:51:01 +0000
Received: from 30431969dccf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC0C2C6D-6A0C-43B2-BA91-E2659F53CFF7.1; 
 Fri, 18 Aug 2023 01:50:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30431969dccf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Aug 2023 01:50:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9765.eurprd08.prod.outlook.com (2603:10a6:20b:616::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Fri, 18 Aug
 2023 01:50:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 01:50:53 +0000
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
X-Inumbo-ID: b14a030b-3d69-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YChvfSx9KhVfWTAi5US1FcC1sMAsPg6Uh+Mtrbc9uo=;
 b=rKR0g6e7/1HN3zk7H//YPIWzGLgGrwThJb6gq4ENztMA5ygcXQSBr+1fn+TG+o2OANa0IWYDORS9hKGytr/+vB8z8TenVC96phDnpxExz3kp9J57kb6SHHu6qybHak8/sXxNtK1ia3iPPZsReYfsLZm1RHzOtQtiCpUhxDbg6Ks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6e81acd1e10b2743
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCe7mHk/a1IRtq08DwAvkGPFLpKiDSGoyvQ6qcNY1oI0DQ4ZUwPfBnSZyizgyGrVXijQu3K/WqyOVSixUZNXYn1UwPym1kE98kA6wkazyAw9OA4gbErx7qDK/6nxRsvS4ZtYFtMLSkB0U00hqbbSeDf2O9lrfm8R5ptdeWXXQgfM/kmzI/Xm6qcCIP54B/WlaO553D+9uN95SOk4GcEcvKl5m3DrKLll+vQ9wxgKZDlTBJQtqxEx/5jYuLb+Tg8ah6o1t0jsnxtgwTiXHULme0BiUe3s1wPDwucTld+TjOH55jhaYQ7BUU3OoWjEa1cKTa0bXb4AxBiqi4VtULJOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YChvfSx9KhVfWTAi5US1FcC1sMAsPg6Uh+Mtrbc9uo=;
 b=UBUAO7sll+Gob/T1rRwR5v098pbmGO+c6uLnOjSYedQwYOsZ2S7r22QGMyV1kcaOc84irJ29FBZ7P3WxzC6wOMH+XLVj3NgQM52P4sxp2As7aNPEyZO8zju76uFA3oaSbt9+s2g5PLqYU06ua/TIyo7h4zudfE/ajMHoj+anoIfzAaniHRnSD01Dko7zdQwYhc81HdYztd299mVsJ2f8L28ALtfcHRL/Gb6QouYxhZlmGK2wQq3aNYsz94aItVufbzJhelkVYqnAtL1tLsbn0G0VWq33wM6jhSfwcY6x2/r1RPBjjH61oMbqqIKXhG/Ol2dwM9LcHw5fMrnvBpHhUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YChvfSx9KhVfWTAi5US1FcC1sMAsPg6Uh+Mtrbc9uo=;
 b=rKR0g6e7/1HN3zk7H//YPIWzGLgGrwThJb6gq4ENztMA5ygcXQSBr+1fn+TG+o2OANa0IWYDORS9hKGytr/+vB8z8TenVC96phDnpxExz3kp9J57kb6SHHu6qybHak8/sXxNtK1ia3iPPZsReYfsLZm1RHzOtQtiCpUhxDbg6Ks=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
Thread-Topic: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
Thread-Index: AQHZ0VQEE1O1p7F1B0uGo7dZEUbaMq/vSiIA
Date: Fri, 18 Aug 2023 01:50:52 +0000
Message-ID: <0974CEDF-4AD3-4952-9A43-A300EF366F99@arm.com>
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-4-julien@xen.org>
In-Reply-To: <20230817214356.47174-4-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9765:EE_|DBAEUR03FT026:EE_|GV1PR08MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6da7ff-2f63-47cf-4721-08db9f8d934c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VIPzAoOh7Fw4MziW8w8OfbINzF7+ufCCZm61LnrtjXeNCbDx4KEVw3VRsTBUb5I/tDBJzOVuALI8lvFur8H8MwEgKIXoBG1Mr2E2w6s01yPjPHYSXkiLyE3sIKj6iJ8JJIs1efyCdwPbVaXyRrj9G2mq+E7gywoLFCtR7Ba2kakNHVWcs6LNPQFi52Fp0hfiEo9wTjyJPm1CDac7RP9jVmrVIBnhRgBsWYx/Ys4icBb/m8fNYHw1x33O07YlMGy2+hrTX8m9ItAtJ4as3W4Bh2GMrX//j+vDpKvrfjl1OTJpvx/HeCMgaqAKf7vRTGRwWuxbw6JHptAVTLjPVtRcepnAEpLCkx9FbdZUoDezUxVU8IYW9v+8JIttLOx88Ty3m4A7JYYkTH21Do4EoQtF/zsCoXP5wfm3xAKhZ0avZgiuUIk7+F4IVaAxN1JSLLaOvwLfSxLNojVRQlfLm577SWqe+I8emqCL0yl2AmfSHOCbhn7/mvWexFZft88sNKrOtEA6B4aFBpC5rN6zZIBzX2XAjDGFejqH1epqLg8+gWpMCosUVEpqb/59SbJd9tAqCuRiDg/oxOLB48c9aqCw4k7lZ1JSzCEEGF8AhFRp9BfB9qXSW8h8xne0xkdoeSnEQPjEs3DTiztEd4ERwWRMxg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(186009)(451199024)(1800799009)(2906002)(4744005)(26005)(86362001)(478600001)(6506007)(71200400001)(6486002)(2616005)(6512007)(33656002)(53546011)(36756003)(5660300002)(41300700001)(66446008)(122000001)(316002)(54906003)(66476007)(91956017)(76116006)(64756008)(66946007)(66556008)(6916009)(4326008)(8936002)(8676002)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <64A2969DF99113459B66FC9C5956C66C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9765
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f3f398a-2ad4-4e08-e930-08db9f8d8e54
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lB4k4Cy9i1aUBd7X13SxWIRhjHt/5EUzc8ixeJHR4wj9Jfr2jcepUKDPouf1x2vznnUrEH4oNcqz3YV65vlYsp49hkld8YAU3NeJEZMqwlHE274iAnMO6XB1ara9E5TID6Lf6z1wR503UYWVno86zPByoK6kt2TN2EHmFgY4b18+mXpjKG46BIA3r4uK+jbPlNKEAUWyRxR1rdGjFa0Ph5QUWVcIfDjZd5zinuaglPjx/6PHCYyBvuxfuj/n27RSaNAawnd1gE7YwYyZjRfGDDyRe3/JBgcLnb7DzvMudYAXQYi1C1BIQVDKktdfZJCSKOGga2r87htygQp5RfqMhbzoeZ8bm3tYGhKD+C+YFvd004Xsdv0A12ionu8XahDmx3lvXEvHMnqMC+CB+BscF8W3dQ3zMuSxUFjP5fahrrpSqkaVaQuVPgBJ6ymJrLjhBpmKySPyP8FUOiGe+1zBIYUVprQFSVdG6AkCbeIOAvskB7hBRYjSrhtEZpOaI3Gpt0+8nJtPu4tDG5+fkoRUFTco4kLivcoSDjwEv2RDIfAVvGRnwQPDQVMuVkxdqeHyZT0ub++aBfJPxm5ye37D84mVGPMJL/h+a43NbrttQCbLOW+wwf+AjiJZN7SB/LhVS7IMMGy9dtOPV74gR+7J2rRgcTn094FKx59U/tPZuLTkZpDJ2S4L832EeYDTMPjUMlC0nLjsD+hMAQADW+yZRhnC2MyPqlhA0I9KVhGsvvo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199024)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(40460700003)(2616005)(107886003)(336012)(26005)(6486002)(6506007)(53546011)(47076005)(6512007)(36860700001)(5660300002)(4326008)(6862004)(8936002)(8676002)(2906002)(4744005)(478600001)(41300700001)(70586007)(54906003)(316002)(70206006)(82740400003)(356005)(36756003)(40480700001)(33656002)(86362001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 01:51:01.3511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6da7ff-2f63-47cf-4721-08db9f8d934c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7345

Hi Julien,

> On Aug 18, 2023, at 05:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The defines PSR_* are field in registers and always unsigned. So
> add 'U' to clarify.
>=20
> This should help with MISRA Rule 7.2.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


