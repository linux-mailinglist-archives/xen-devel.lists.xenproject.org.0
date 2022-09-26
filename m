Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF765EA579
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411724.654767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmpw-0007sj-M0; Mon, 26 Sep 2022 12:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411724.654767; Mon, 26 Sep 2022 12:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmpw-0007pq-JG; Mon, 26 Sep 2022 12:03:48 +0000
Received: by outflank-mailman (input) for mailman id 411724;
 Mon, 26 Sep 2022 12:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M8J=Z5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ocmpv-0007pc-MA
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:03:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80058.outbound.protection.outlook.com [40.107.8.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4611b49b-3d93-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 14:03:46 +0200 (CEST)
Received: from DB6P193CA0011.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::21) by
 PAVPR08MB9748.eurprd08.prod.outlook.com (2603:10a6:102:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:03:44 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::59) by DB6P193CA0011.outlook.office365.com
 (2603:10a6:6:29::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 12:03:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 12:03:44 +0000
Received: ("Tessian outbound 3c27ae03f5ec:v124");
 Mon, 26 Sep 2022 12:03:44 +0000
Received: from 966f48981c78.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E762EEC-5D88-4DB0-90E9-4613BD3AFFA7.1; 
 Mon, 26 Sep 2022 12:03:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 966f48981c78.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 12:03:38 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS8PR08MB6133.eurprd08.prod.outlook.com (2603:10a6:20b:298::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:03:37 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 12:03:37 +0000
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
X-Inumbo-ID: 4611b49b-3d93-11ed-9648-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=moGg1uJruGLb7ZUfQaETGJljtmskuUjfE1dYwek8xMq3wy0c9qq6YE01KhCmtv56c4NLTP25VKog+MSdEv4Vi5q/n7rKsTVHBcqlrM9xs0ci9k/oAfb2q7BXcQwvYg1rc2aYFZON22ITlryWTHVuxzZx3vv9JjZL4VLyE0GFUTesOBLX5IgzbTUz0tDMHkVvibbBTgeZ4dmSb4ye1WYgGv1bVA5fFuWtIHpHS8n1K1WiFI3fsHPtuEh8aD4ksuPRGyBDuuyzNnUifPHTur5zGGDyQ2H17ALYBzyN6Q+nIHtsX+vM1XJ1+ludXyv8iI/Pt2YCrwBr5Y+JfjywTbnSlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z353RQmBsJZvD+7Y24OQQ3dFENhjfSi0Baxvw3VHwJs=;
 b=C1tAalE/xTV1wtXXehLQncn/p3iUj7zuHUHjFxt0N9QsdWuP74vQO0nMXxxkB80Sc98P9myZDmW1sBY8RrVYzJKtRTj8RjryhIf2Vre2CJr33uBirUpfk9SgU5+mzh+SovmP+bFx5XF2HFUEpq7VEfUyqjEVZgZa8Ee1kM4CbxCJVaQMCPoChI4YD+nlxQhWaCG3TzaZcutXD242lBDCGZXZhaXs+mdNAIksNTN0b8cjm7NTHEIZnFauc12DZjvOzl0zSsrTerdtW5ApckHbiKCBghkwNCOpPSY+7v0RFYP2U+RmopJhImyZBKlg9+XfyVWl3NfCGKVTtiwa6WDePw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z353RQmBsJZvD+7Y24OQQ3dFENhjfSi0Baxvw3VHwJs=;
 b=AnbNLtEcwWsqkOZmuN/DUZMf8UVopzxGcx8M0u9aIrsERuCK/BQ3P/Y9XuLsUuy1zaT92Hauo+nM8n4rip2ntvpKOi2OzIf9npUMxkJy4a7HJDpCBTwXY0pJJ6mqJ6poCLR/x4bjUnvs3C//r6iIRyIYz3Z4ErwPtluPvHMTrSk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7abb6dc3ae3078a4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvg+3NhRFE0ym9jBO2gaRsXuOeR60Wnvp/Jhbnd3h45m2EN/T/tLrD8Koix7FFQI8MPobPDLrndmLLHZckvW7iRF12Lp+FMoWHepdJt8QD7bya83jdpThTc4FrqKQELV9DCKyMHUM6/ow86I42ENEIsBGCRzCqviR13pTV2lsGX1XAr2VYGd0t+ugwRjYlQ+FI/BMybq7QtxJHDGQxLzVyGDr2VOhJfvEHlbM5YB4lobG+EjRiNRxiRTkXXm5sMLjkBYopPJqEjZK0/7rq9Zgzlm7y4e8jdLAvaFLFaV/D2CBNGHu/+8tbQDbvQP35X4wRR4SKI9gZ3d2eyIl4Zhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z353RQmBsJZvD+7Y24OQQ3dFENhjfSi0Baxvw3VHwJs=;
 b=hpPhbGUoEjO26EcCtMgk/7R19yqmmY4FBJBFMpdu1IoS3R0P8T5ymroyGlQAmAkJwAtRf0upsrLEW1LIos9L632K2xwxMhFZh0RbslK1EEpn0r/QKBpw2S9ETIJ6KTewxLVJ3m23Ep1RQWdYZNVtLQKaAew9PZE/q4k0XOyI9tw/x8OlsLAnG9FVEvIwk0GB/+7TvB4K7Q5q0WUN+CYXDXfPL2qemTEqIROJKRvtElNtnL16K/QFRdtFIlpRcZfsWqPavceFkvRbHDEhX8NY7eSaYT2ykYYbLRCz6DEn/XhwqkfNM8iGf+qW68T052niJ1O+WTHqEbN6q+O8YIICqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z353RQmBsJZvD+7Y24OQQ3dFENhjfSi0Baxvw3VHwJs=;
 b=AnbNLtEcwWsqkOZmuN/DUZMf8UVopzxGcx8M0u9aIrsERuCK/BQ3P/Y9XuLsUuy1zaT92Hauo+nM8n4rip2ntvpKOi2OzIf9npUMxkJy4a7HJDpCBTwXY0pJJ6mqJ6poCLR/x4bjUnvs3C//r6iIRyIYz3Z4ErwPtluPvHMTrSk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/10] automation: Use custom build jobs when extra
 config options are needed
Thread-Topic: [PATCH v2 01/10] automation: Use custom build jobs when extra
 config options are needed
Thread-Index: AQHY0ZfkIABcS0GbDEawZdF7FSr8n63xnNMA
Date: Mon, 26 Sep 2022 12:03:37 +0000
Message-ID: <BC56C5AC-83DC-499A-81E0-B8053194B3E9@arm.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
 <20220926110423.26030-2-michal.orzel@amd.com>
In-Reply-To: <20220926110423.26030-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS8PR08MB6133:EE_|DBAEUR03FT021:EE_|PAVPR08MB9748:EE_
X-MS-Office365-Filtering-Correlation-Id: 2125490b-80a2-44ca-a62f-08da9fb72914
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 96WEP3LlZ0QxQDciSGNb2cVDf+l4ntsIyyTLNNQ2qZSOWOMqn6kS8S2HW8/6R+IBmnNiXF2yTUST9+NB0OXCYzBU5lePCaOaWsAs3ASxAJaA/z6Tg+5BOnrQcih97o0NwW6Mk6EMTACV46FJ/qoTfrU0NWtMwMJeDoOlF+UxkqTQzCnBPD2sY7kxvDHjF5fsdzpH7axchRSQ+0FqHENXITdhGUYFbazyG7a8Tr7Er2efybnyW8JbBldhH8j3RH+/txlXT8NwiYP2UgBxm1OTSYPgM7vnqUoH6YbIluIaurnxljM51CmRN4G7rwhEtWrqFQYfOxbHpNATdBVCdNpw74FXdxsqvVm5B50CCMXC+ebReyuD6C8NTsb7Qap2QtgqLpk8+CtM86/3yPzi5U4Qe4Id8ggY6H2qZrFgVZZ0huQshXJuf76yxBrLQrhwfqd8bnK1NdqhXZKhKHhX82bOrIHG5uEl83llqbtIu8gJQzZjMPWVuesSde7kQaCxLDpeSITY44VOehihCsgkHdlP6fFoTkbe+YbxNH2DT+fVqHw7IchM7HIl9G10JOKFTk0H+oiKj4yB5y6FFer5e/rkXV+avi0Geso5axmfib3AQ0lfP72ZADQcCnfVg56PyUJv2nD/ta8JN1znSuGShKHnne8ybuCuv0dkKOaQF6A9Vu6nihzhN9SRvNtaqtg1iFocS3aZiUp+AY+pipzU3Uz+2vkZdNpTtEga6BIOQZFIZySnXYDl21RNAGEmh686lTOBCAvhx0sF5YgIpzKlezx9g1x2tBgz9IWgG+l3TK2d5ak=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(71200400001)(186003)(8676002)(2616005)(316002)(38100700002)(8936002)(26005)(53546011)(6512007)(6506007)(86362001)(91956017)(5660300002)(2906002)(38070700005)(478600001)(66556008)(64756008)(66476007)(66446008)(76116006)(54906003)(66946007)(6916009)(122000001)(4326008)(36756003)(33656002)(41300700001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FEF53103B1CA894C98330DA373A09C61@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6133
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	20b19723-8e92-43dd-cbf8-08da9fb724c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A5pgx8u8D7kMHSO5i1RCim1yGXNURCVEifOgBjwUhlsnrI1/G9AKAEW34JvmwflhyQBsQy5yFv878ECt45AnYwp/kRriIgTkgAXF6x9DAn8y64N4LO/IDXsK1KX8Y4Hz7+KUMKpqKcgz0IGsZsRebpx268KWVQvR77q/NrCJLWnp9RMPYaamb/zRGReJwG2HRoo9fVrVQM0Eghc46sc4Y3MwtfjPvrqZFb7bSl4forHjubCaXbt0OfhRz2QjPJZpK26PDk2LWkP5n/tzavVJ2Ruz4lZHWspipAmPjlwsc4OU9eMkesNDIXQc6z4ymYwA72JHsQT1LgPwWhvPPvVVSAe2CpuyxedYwNJZmQ7darpv3H9sTDhXVU8Q85OMxAcjnYw+jrpoWeGQSJQkuJxrf64JDJT42eGUisxnKiTy0K11FCFIT5DNly5nIK1Fso5/DLZUk3wAvLzgMcX/7B/Fh7CQWanmD+sLjgPJ5+tOHSkXu/wAWZyeQYsEcZfvFMf1eN6oc2/YXIF0KsXEsps8X4ueQU+KxRpC43h5TafM8ZooTBofEie8dVJI3/F6QPd8k/za9BizwZjmFiuhMb/mMNlIjJbsA2WnrqA5xUM5dU32Pd4SKMi93TxMWs1fzOVKqHkot2ZwIqOUjQrN8wHnnBtNFlZrIz7+zzcedPEYQwQS+pJQXbj9JFtok5POWenAXKftSfWe3Rjf29sfFxYhfO4UoJ8V0/rRVPpa3DXVb3U14hQnsxiwRocRdQ0Uht0hHoKcjlZbY6jRQFPSQMV/Bw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(86362001)(81166007)(33656002)(36756003)(356005)(36860700001)(2906002)(336012)(186003)(2616005)(82310400005)(40460700003)(40480700001)(5660300002)(6512007)(478600001)(41300700001)(6486002)(6506007)(53546011)(107886003)(26005)(47076005)(54906003)(316002)(8676002)(4326008)(8936002)(6862004)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:03:44.3240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2125490b-80a2-44ca-a62f-08da9fb72914
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9748



> On 26 Sep 2022, at 12:04, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Currently, all the arm64 defconfig build jobs, regardless of the
> container used, end up building Xen with the extra config options
> specified in the main build script (e.g. CONFIG_EXPERT,
> CONFIG_STATIC_MEMORY). Because these options are only needed for
> specific test jobs, the current behavior of the CI is incorrect
> as we add the extra options to all the defconfig builds. This means
> that on arm64 there is not a single job performing proper defconfig build=
.
>=20
> To fix this issue, add custom build jobs each time there is a need for
> building Xen with additional config options. Introduce EXTRA_XEN_CONFIG
> variable to be used by these jobs to store the required options. This
> variable will be then read by the main build script to modify the .config
> file. This will also help users to understand what is needed to run speci=
fic
> test.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> This patch is supposed to be merged for 4.17. The release manager agreed
> on that.
>=20
> Changes in v2:
> - replace [ with [[ to be consistent with other ifs in build script
> ---

Hi Michal,

This looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




