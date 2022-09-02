Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9A75AADF3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 14:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397573.638192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU5LT-00007X-9z; Fri, 02 Sep 2022 12:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397573.638192; Fri, 02 Sep 2022 12:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU5LT-0008WG-6b; Fri, 02 Sep 2022 12:00:23 +0000
Received: by outflank-mailman (input) for mailman id 397573;
 Fri, 02 Sep 2022 12:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCtF=ZF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oU5LR-0008Vz-WF
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 12:00:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d15b41fb-2ab6-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 14:00:20 +0200 (CEST)
Received: from DB8PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:10:100::42)
 by GV1PR08MB8743.eurprd08.prod.outlook.com (2603:10a6:150:87::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 12:00:18 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::a8) by DB8PR06CA0029.outlook.office365.com
 (2603:10a6:10:100::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 12:00:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 12:00:17 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Fri, 02 Sep 2022 12:00:17 +0000
Received: from b43e6b5262ed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48123793-C528-4E99-9395-1593896ECE82.1; 
 Fri, 02 Sep 2022 12:00:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b43e6b5262ed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 12:00:10 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM9PR08MB6083.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 12:00:09 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::d889:1b83:c030:8d71]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::d889:1b83:c030:8d71%7]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 12:00:09 +0000
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
X-Inumbo-ID: d15b41fb-2ab6-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RuL+4TzngMrpGmqN7Hjca+ylRzhzprrnizVrWxcXqyipoevpFo92vpYpcsf5nEd1zq+L1gISeSwfvc73W7/k9c3vv7ngOg2EPXG2zfEsfirJZh+CjEErtZSurpAs75BB9xvLZ3EbSO6RiLJ74Zza6NPaQGOPkml+QvoQI5EdcDpMdZjBuJGMyeBLWZ2LimEbhfCQD7y/EyLCCHqGgjdjru4J8a+Dwdhi07ZbUu1bCfsT8C2qOPl0LiDIQwovAo4QOxXMaQqn6bntCO1rAKarkfwwlZNf8fA2dHENiJEKRJ4t6RpDEmFjnVlUG5hJZ3kF1yKZzAgj5Xll/4PlVFiW6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6XSZSDOsHH+WjS4nsg3J7OqWXunkYzF5U+k+pgINco=;
 b=lh7W721qTxzznaZhtR6fsa//RiWEHFklTMQIGfZ+SFmldOxMRquLPuDeUsDMbAZJUjOT3KIHLCQ8HuYknb7ORYY+9NYVgV9YDdG6WqAi/C3OWERmpI6pKNIDyVLDcFvu5UamcN1HfSf1YHAqsefVd104K5VRVPaFEoCgIHwvGvio+Oofp4WPMNh3JABGe5cQo9q5SAfr9Tiw1VsIwQUHO6GGGQGlqm0sZE9PuObV+yJmVIqGeB0zBjddSZtt8DLSEmD7r8wu5nd6Ser1kFvvBqHC2+eEL7+HR8iHBHrfwDbYVdExvomRGGy1zaME/5gKtmGU5i0ofKxbJ8vOkDwAWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6XSZSDOsHH+WjS4nsg3J7OqWXunkYzF5U+k+pgINco=;
 b=t2KLDK8J51PaUi7DTmVYJT7PRNVZPulPmZLS1zuH9jDdZYuIu2ml25Qbx5Dj4JHJzoo7gUGeabB5jPxi1aKMG/JOOQwlzyQ2OGFhTo2xSldcM7+Z/cHk5dizM3xEk5cKgRov6RD4kSrvcxYbn69zqPskealh68BzXxh1Ae2qXaM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a708caac89c1cd7d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR0SRMC2PR2CmShgPAl78gDRQl1IqQci6udS0yCq74xRHNMkSmewvQNEiaFH7227/AFWxil9Os6E75mOsemRmD3OY4TLcU1ETN3MeAhY6wVgYgYeNP0bmHhRClgz5iyWsTd7fQ6TOFo+lVL0d+doMR6ydgzKJrl/5Am6F5U+3Q3rikyBJZMW1nelWRpQXKCNyIYbobPdd8MSEXcD4XQVSKeXE04MOj+uE1HDc5L/j6Nm74bWbNbuWQ+uaMTefpIT1+94gdzTmszCZgSHVHqiMFHDWdqg+JreH2WcbB+UvOleyrAlWIlEU+8B3Lf8YJglIXkwGXwkjKu5j9b06aYs9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6XSZSDOsHH+WjS4nsg3J7OqWXunkYzF5U+k+pgINco=;
 b=cbGpCUUn+s/CBVvFPwpyxmVlgf6EKMlog6Wmw9m0P4Ic6DWZ2b7nyYtLUEGS6Cilat3EOHrffo4deYBmuSdBQ25o0G6+Uaps/fmwhQxeuq5gUZ8/SSdld5Z5uNipA7pyurOn2M5NLc7lGu5pP53Zjs000Jtc6Q5gWI424AuGKHpq6kF30tnwOueqRTCg4Edf060mRm9OrlNBjifP7rtmThcm4p0C3XXV1c5Kp9jftDl6sB2Io7hLkXjmMHL+JgiRnWFwSY3ijhgs77QFP65flQSLnbMTmlEav1TLh8bWB1R9PEuapEope5z/I0tYMfJTSIzRNKQU+4LwLJSsF2LSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6XSZSDOsHH+WjS4nsg3J7OqWXunkYzF5U+k+pgINco=;
 b=t2KLDK8J51PaUi7DTmVYJT7PRNVZPulPmZLS1zuH9jDdZYuIu2ml25Qbx5Dj4JHJzoo7gUGeabB5jPxi1aKMG/JOOQwlzyQ2OGFhTo2xSldcM7+Z/cHk5dizM3xEk5cKgRov6RD4kSrvcxYbn69zqPskealh68BzXxh1Ae2qXaM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [for-4.17 3/3] automation: Add a new job for testing boot time
 cpupools on arm64
Thread-Topic: [for-4.17 3/3] automation: Add a new job for testing boot time
 cpupools on arm64
Thread-Index: AQHYvpsQ9QXsCVWjO0+hBzXJHV+QVa3MCeCA
Date: Fri, 2 Sep 2022 12:00:09 +0000
Message-ID: <3E3B0825-5547-47B1-B417-98B8A54B6CBE@arm.com>
References: <20220902070905.1262-1-michal.orzel@amd.com>
 <20220902070905.1262-4-michal.orzel@amd.com>
In-Reply-To: <20220902070905.1262-4-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3b857ceb-83d1-4e76-5c8b-08da8cdab3f6
x-ms-traffictypediagnostic:
	AM9PR08MB6083:EE_|DBAEUR03FT003:EE_|GV1PR08MB8743:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LTCbXJ80oBMjm8phfbjWF6Ncqa2YWLvXQeQKsek9/FHPOHVIIOmYsOknVKNx1pUOUxDpJzRDrE1wkvhAs4K8s3Qh7axJmnGUWMX68jc8eSJToXvGLJZGwDUw9j1djcUVbhGcL5RuzfWA0mNu9rB5fr6lq6WgjmeLIvLm13kmcuSLyS73vaGKl5OuzYrDuN7exKe+0WV2eUSRFqNKzhcaMYZdPbMDv4KuLeF7d7PJXHdMhghwDnKTsPwqGWvpXD+fLshS6LhWKWmjiXaWWyzttBFk7GWl4xUCAMDe+rkQyl3ORiaWKKTk4CFOoGWdNQKXT2VWW8mUNtud4t06V4CbXlCTN/yU9uN7/P8c3uNiFnDjHOqnNN20V+9lseCFDPERLZ/5ywWdJcmO7NKDQ21TSs7NDf5yvrQGV4PCqaQZbaShl43mqZ7kJSZvmFWuiUNiNs1hr8+TzHjskn6D04P4J7lcF3W6qvZQjuyku+XOcSHBhruxnZMkZC7Ffg1rsi9pg28rnE+wSOamA+9uGpQ4XnaKcIYx8F1YWu5QVZ2akx9aHU8Fwx9PeFSqfDkyHndLcArljnlj/1zFEI7w0X7bzXsUkE+ECMpRjgf0ExPXeRo1N+UaZOxYeK74Dbn8Ra5jvfrVrYioCpJ+4vnpGf0IcTGJW7BL0E5O2gSYMlStMXvo2NBOoSX1qtlr64DqqNDPpWkzUR2BXLTh7nDqCa4QcarF1tsx1uZlbvFweWH724/qDDI9ZkZUfVWPAbVovV9HpfavW7Cg11R3lepKCN5i7x3z6vW6Wua8eSQly0CKLdsofBGZvxfS1ZE4e7td+LlQLGAMDCe9i2j5O2YcZB12DQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(66556008)(122000001)(83380400001)(38070700005)(38100700002)(66476007)(64756008)(316002)(71200400001)(8676002)(66446008)(4326008)(478600001)(91956017)(54906003)(36756003)(76116006)(6916009)(66946007)(6486002)(41300700001)(8936002)(5660300002)(86362001)(186003)(4744005)(2616005)(6506007)(33656002)(2906002)(53546011)(6512007)(26005)(157313001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7B7644E311296044999DDF62974834BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6083
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e06e02f-4bb2-40a9-3b31-08da8cdaaf0b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/CKq8+HF7pulucn024K+ciF+sFuHr+z7aOm/UUrsJPXm2X7zkcyqpksL/cQG4Wku2EnrV2mlLimpDntZMn2a6c30t6kCAKb1L1Fai3I/1+fLakhkIAgVPvPoN4jJsXrc8T4Z/CWDcGxj4l/17rAIsRwO/xkDrxQnycG+I74BV1BWkKtmTYKCoqLapOG/FTPTyrkmPf++rnWXKXYO18MDXhnSw3H8hLOn2+sdN2j1TCPDQHe2oJLJt6k0qYeLr9fc/sRc6/XAV8RmYjB15qmcZTtUBiAlPZskVj4bx5l1tHy9j/K1hunmMsgIIm5cPhVTGC5Ta+hhs5/er+IuTQTafl0iwg3h2Al8Uf3LRcxLM283m0v2ZlAL0MX1Wf7WB1mi0Vi+4ll8Gvw1XNd3VCrijRzbDnc+hU7mQsjKjOURaloQlUiSctsWB4UqgIwXj5Ak2bDRV4Rx4kOtDdDYouDen/a7YIQ+X1fGu8pc0cj0x9ty/bPwqiAUcID57/DT2QbS/Ex8TiuAPDlh2Ye1YXNtzDBnqnhocDhsI9cnQDQXs+Cwir6X9OEEeSKGtMoJn7lf8ULQXznN9keNTNN3aGWGCzoV/SlPUB/gN3k3XwfxI4Aq8Q+EH6BsS4XuMQAu9LNr57Iif+Iq/R4RVc5CRZPvn7Gmv4coRQoPaMPwqI8nSRR+4mM6PHpBf/eKAx2AOc/k6D8Z6UbzlM6eOf+JSMhMsu8UShnqQcZb8bGM3tcVXROLkvjNL7QeBRp5tZQw8vSzWyApt5mCQwT1Bu6x7UR4VD6GHroKEALTvFRmEBcAq9k=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(40470700004)(36840700001)(46966006)(70586007)(70206006)(47076005)(4326008)(41300700001)(8676002)(2616005)(336012)(83380400001)(186003)(54906003)(478600001)(316002)(6512007)(36756003)(26005)(40480700001)(33656002)(107886003)(53546011)(6506007)(356005)(40460700003)(86362001)(36860700001)(2906002)(82310400005)(8936002)(6862004)(5660300002)(6486002)(82740400003)(81166007)(157313001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 12:00:17.6372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b857ceb-83d1-4e76-5c8b-08da8cdab3f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8743



> On 2 Sep 2022, at 08:09, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Add a new test job qemu-smoke-arm64-gcc-boot-cpupools that will execute
> script qemu-smoke-arm64.sh to test boot time cpupools feature.
> Enable CONFIG_BOOT_TIME_CPUPOOLS for the arm64 build and add a new test
> case in qemu-smoke-arm64.sh that if selected will:
> - create a device tree cpupool node with cpu@1
> - assign created cpupool to domU0
> - add a check in dom0 xen.start to see if domU is assigned a Pool-1
>=20
> Take the opportunity to refactor the qemu-smoke-arm64.sh script as
> follows:
> - use domU_check to store the test's commands to be run from domU
> - use dom0_check to store the test's commands to be run from dom0
> - use fdtput instead of sed to perform dtb modifications
> - use more meaningful messages for "passed" variable. This way we can
>   grep for messages reported either by domU or dom0 and get rid of
>   assumption that tests can only be run from domU
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



