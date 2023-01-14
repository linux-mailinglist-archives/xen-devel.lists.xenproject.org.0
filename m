Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A544866A7CD
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 01:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477593.740360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGUlu-0003vk-Fh; Sat, 14 Jan 2023 00:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477593.740360; Sat, 14 Jan 2023 00:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGUlu-0003sd-D4; Sat, 14 Jan 2023 00:51:46 +0000
Received: by outflank-mailman (input) for mailman id 477593;
 Sat, 14 Jan 2023 00:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8OqO=5L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pGUls-0003sX-8j
 for xen-devel@lists.xenproject.org; Sat, 14 Jan 2023 00:51:44 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2041.outbound.protection.outlook.com [40.107.15.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c9ccf20-93a5-11ed-91b6-6bf2151ebd3b;
 Sat, 14 Jan 2023 01:51:42 +0100 (CET)
Received: from DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) by AS8PR08MB8063.eurprd08.prod.outlook.com
 (2603:10a6:20b:54c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Sat, 14 Jan
 2023 00:51:29 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::ca) by DUZPR01CA0009.outlook.office365.com
 (2603:10a6:10:3c3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Sat, 14 Jan 2023 00:51:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Sat, 14 Jan 2023 00:51:28 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Sat, 14 Jan 2023 00:51:28 +0000
Received: from 5ffa8a0298a9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B93D039F-7B67-4F8C-8C97-D30E0F2B5522.1; 
 Sat, 14 Jan 2023 00:51:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5ffa8a0298a9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 14 Jan 2023 00:51:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB8007.eurprd08.prod.outlook.com (2603:10a6:10:38d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sat, 14 Jan
 2023 00:51:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Sat, 14 Jan 2023
 00:51:15 +0000
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
X-Inumbo-ID: 9c9ccf20-93a5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDawBXf0X7erUZK9/UtOPiy/nfqfVb+0dAYYMjOInqA=;
 b=pc+yX76kK0mY0TzIDqO5UKc7v2tGWOZ4Pquma4H6h63Hzgg8GHywPDXw8B4EVMpH5wSNmf6Lk5TJxIlCk6TKx3NQURUyS5W1cxA6SxlMLhFg9Ttt3VbGCewTrAJIeetmAIbdCHsZ6JiGSbson/5ekPTBHlu+cVGHxwooYGdjZv4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7fq17/uoVzhxXfMb7blPTIbhqblIOUuhrus6S2TahRxGFmwWTxryspkVgh3/9aWhct9wRjVOsRXno2fZbbeKVveFhkQgVV+NwNr8fYNNuCPhnKJcj4N5si87nYscg852vZ0UgSt0wcrJZspaFYeRFIMYYYhv7hxeFFqUweDmktjOXPBhn8CPKrBZyluMSYWJ8z1YSrLb9nBpc8iGYp9TlzhobDuoghOTmszTBUm3f5jqTjLW0iXMFLiWll7yfVR6NOLtzlEQdieEx1BkWk6r8jIxpCMKtzLMMr7H28nG+RmNt93uoe8WSviEk1H7035mbOA7BxurK1XOf6DqC4gRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDawBXf0X7erUZK9/UtOPiy/nfqfVb+0dAYYMjOInqA=;
 b=kXA/dHmt7TWt0suLGzcSwsPvf9r24rPhkbtCPHQjv1DkzQOgQxbg06KKlrV7BO2/TDePRl6u3C7Gm5T/WIMd40VyMlkV0hAYH8OY5yNvsHSOazNlCRK6Mg+CMV9UExuSjwe4BjfP/DjHVZYRfERSfS+hBdjZJK/NPt7ya+CqDWxwOfK+5JdbUX0vHLjeD9EB1WR3vlCe5iSN7kOuxX6WR2CwoKkh2UrgpnRcrxQa/RnGGMWChtT/BnBUVFpB67TQl9BZ9LXZ9zHnmvSjdzw4Dak3Okl/eWcYlnt7lTbvYiXdHamgoZJ9MF4rPHdbUbfh47QaCA8zdB5b9obrzvyynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDawBXf0X7erUZK9/UtOPiy/nfqfVb+0dAYYMjOInqA=;
 b=pc+yX76kK0mY0TzIDqO5UKc7v2tGWOZ4Pquma4H6h63Hzgg8GHywPDXw8B4EVMpH5wSNmf6Lk5TJxIlCk6TKx3NQURUyS5W1cxA6SxlMLhFg9Ttt3VbGCewTrAJIeetmAIbdCHsZ6JiGSbson/5ekPTBHlu+cVGHxwooYGdjZv4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v4 06/14] xen/arm32: head: Replace "ldr rX, =<label>" with
 "mov_w rX, <label>"
Thread-Topic: [PATCH v4 06/14] xen/arm32: head: Replace "ldr rX, =<label>"
 with "mov_w rX, <label>"
Thread-Index: AQHZJzeChOboto8YKEqIP7caZFvxO66dC3QQ
Date: Sat, 14 Jan 2023 00:51:15 +0000
Message-ID:
 <AS8PR08MB799188C9E6044BDC202474B392C39@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-7-julien@xen.org>
In-Reply-To: <20230113101136.479-7-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7C10AD5821D67E4C9A6F3E554D69FCD9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB8007:EE_|DBAEUR03FT063:EE_|AS8PR08MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a034420-ba2b-4354-5f7c-08daf5c978a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YerdKXz77lS9w1CxfSA42LD8miDnLUaSB7PscdelBy0xDTxRKvtkcveK+zYBijo7XHmKmn7weG5xY/XpVqP+PeMoenoCFjOhJN+s+G6xy33x4l3/sA0IJ+01w9MhXIi5MglJiN2Ue2mbgrWUsjro93DNm77n2mBKhfqCuivQZNvM4QMJhVQAtQOYGOH8LGRhzDqi4hMzG/hzalNPVIMXJCGNqVFj7R2ttuZ1cz+VYcSTAwMURMxCECGdGel1FTI2B/Al6UAg2egWQ8ZiBzlVjgkDOo4TkVWQyfQg26fQ/72uUxCaz3lGQHxGbpq4E2HM7HhYgHIVByqqz0m5QsBg3IznMwKqsZNfY3IEfcMgSJFIk0UUaG0yqp71tCDL4buS+bZL7h4TxAAejnPb691buRPdfRSs2AdHtT6cT3c3xSi25LQQszLhsh1sKztUAyOyCkhWPraFr5GI9JBnjHPbLi1lBmIkX+vS6vBkEwc4QrHC2pprQt3ymP4npC1fc/xNx7pdNPgt8x3Sm9WcZ6kKwwVm0Zx5pZ+D3+unScdOLg6CP3DDl6rHt/UiX+VDuHWUmEnFTlKHL0zKuMzs8RDWeSA5Y9Fwak3MGTobJSZRHj0BLLns//JWZEeRfq3EdudovRA7iMEcf4rts/M+Pobh0om1eV6Fo5yxVTkIKgDq8Gd88sTMRhvlVbUncwzfmVkAd508FRXCACzp0OT6Q1c/Xw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199015)(4326008)(66946007)(8676002)(54906003)(110136005)(66556008)(41300700001)(76116006)(66476007)(66446008)(64756008)(38100700002)(33656002)(86362001)(38070700005)(122000001)(6506007)(71200400001)(316002)(186003)(9686003)(478600001)(7696005)(26005)(4744005)(55016003)(5660300002)(52536014)(8936002)(83380400001)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8007
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf8012fb-4b48-4c7d-627f-08daf5c9709d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0zKFBC08yZGdH+tyYFt8Jg+3ZSjkweER6DeHgeadms3G6MSzBi8jswMr+ekvZmuvdHVE+8V+n3ABYnqShnUW8hNGv7dYb2q4KhlkAwaplVrjoNnVCIRrfC3xxkTfeO6pNap5qn6uaSnNXVSWoyw16osgm8THmdzNqSRCRRtHL9Khu/Oyan5fxELORQQJ5wXj/mAXMj+22XdD3M0EmbG0GCFV8gKX6XVaHkaweMoJTFJQ8pqaTjNPm4/H7Y5Pjd0tK/EqqagfpQLw7UCPz7gN6ERelC3A0h+DPmv7M0BlEyuN6W1oXiFaakRJdDePgcEahnsaD652jCnMhZ6xMGlIE/Orjh+apRzMa+Gc6F+lcWtBbgRLYeNzyV8KH4ukrNKlFAYmuP7aLpx3wyJhSZo768HMzep1dpIYYUdhpSyyQXXv19Q3pYEbWTYu4YtKb1WRwBmvWBDXVioIvktre/Wfehysn3/y6oejzvCZH+0IuErtCbqictpii7qgCxJJBsmt7T3nndghSQVumybLTYMvR7VZ0lI5aa9C1NHmWL3ip5X+zdvHoj7pEsMmiUj5O/EAXGxoj6t6FYvtY71VGYgtVX25ulRE5eUTZMVc/atc9yp/KSecdbzPWugvbbbU0nE1BeQc+/WZk6aIWCfrvlbjIpYtmMQHBcFkqBb3aHgsL7kowuO7SgwUbS8YvfL0wDTGrEloB76zC30sEc13xJbiCw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(4744005)(40460700003)(5660300002)(33656002)(36860700001)(316002)(82310400005)(54906003)(6506007)(2906002)(47076005)(336012)(40480700001)(82740400003)(478600001)(86362001)(7696005)(55016003)(356005)(81166007)(110136005)(9686003)(186003)(83380400001)(107886003)(70206006)(8936002)(26005)(70586007)(8676002)(52536014)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2023 00:51:28.7787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a034420-ba2b-4354-5f7c-08daf5c978a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8063

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v4 06/14] xen/arm32: head: Replace "ldr rX, =3D<label>" w=
ith
> "mov_w rX, <label>"
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> "ldr rX, =3D<label>" is used to load a value from the literal pool. This
> implies a memory access.
>=20
> This can be avoided by using the macro mov_w which encode the value in
> the immediate of two instructions.
>=20
> So replace all "ldr rX, =3D<label>" with "mov_w rX, <label>".
>=20
> No functional changes intended.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I've tested this patch on FVP in arm32 execution mode, and
this patch is good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

