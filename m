Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D146A5B03CC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401474.643325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVu2h-0002i6-82; Wed, 07 Sep 2022 12:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401474.643325; Wed, 07 Sep 2022 12:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVu2h-0002fa-5H; Wed, 07 Sep 2022 12:20:31 +0000
Received: by outflank-mailman (input) for mailman id 401474;
 Wed, 07 Sep 2022 12:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVu2f-0002fR-RK
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:20:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150074.outbound.protection.outlook.com [40.107.15.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 755f2b2c-2ea7-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:20:28 +0200 (CEST)
Received: from DB6PR0201CA0011.eurprd02.prod.outlook.com (2603:10a6:4:3f::21)
 by AM9PR08MB6292.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 12:20:25 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::f0) by DB6PR0201CA0011.outlook.office365.com
 (2603:10a6:4:3f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 12:20:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 12:20:25 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 07 Sep 2022 12:20:25 +0000
Received: from 76e9bb738d14.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70AF4604-A7C6-47DB-84C1-989C7FC1ED43.1; 
 Wed, 07 Sep 2022 12:20:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 76e9bb738d14.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 12:20:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8420.eurprd08.prod.outlook.com (2603:10a6:20b:566::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 12:20:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 12:20:14 +0000
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
X-Inumbo-ID: 755f2b2c-2ea7-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DtItO6PxkskM0UIBZ7zAcAqf2amZ9b8T6F2i8C5vPFpuJeWWz76rIF4jNVU8dgvWbYyP91UWaNCgZQ5zaa9K3XqVkD8Fin/P9HL/YnynK0YpM0B44NLsEJfrksmyzrEP5ZJjtV8KmuDXqqLB6b6S5Gi6v8LfAR2MrwA4fg+UaNqFSGYxUG7AIukuXB/Lcj0TmmPNSSF5zfvIq0tf2OhscfEWPn0pAmkiCQ+hGiLkbh3m8UED0K5H8RO1Ms5C4YY3vn2+8GEZeVtI+jO7+vAKIXOiiUlO8LI+ggPw3THnDagJQT6z2IluGzOKdEQq2QRmKUmR1s/g9LWqYKvlLKWRYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMjq3052Fx6FmowpHIC6oeufP1w0FdLbadls3QqBZ7I=;
 b=LAtibjyD+XgaTwNh3jFEFTfRnVSvd49BzBn0zvBylK6FgLEF7NHTKue04cZJEAYhAshq403d23WMtBPsYvb+2HyosDUJjZKwjRj1jJl2nzj6UNmMenRUYEoC9i4wHMDzRo0VNeSQ6wVywm3fylh0OXZ1kt7rJQ/rWxvw5pEZ6IOSb4Gr83pRGXdkX/YrurFfSTwETkQIfA8dWdVw/l2eZzrsl/LEWWH+CZu9fbTccyKiKg5cd9JVj7aUaCck2hxmYZuEI3p6qdTf3VAPeoDvlSUI5In2In5h1VzoMRpcypOG5C65yPT85gvgewQjzF8mnbBSysIcIdhRldHaXYiCGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMjq3052Fx6FmowpHIC6oeufP1w0FdLbadls3QqBZ7I=;
 b=tnam/hJnEfWSU1smqIIFkGNHQBVqJ31Dl8HcBmPDoL0qV03pBPvuEKQ3RCMDYOJqYnj5yAgFqEZsl9aAF+cOwD6dOxUbJZix8l8o5qYm1qFoIaKyYiNxt1buXBl04xEXJ7hNR0vAGwFSX4M56+0pPX9SdNqUF7Yap7O63CVMUyA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4102184d72d4de51
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e02A7UHxUlIq9096lsDy5ymKHI9wybMMa1VfAHnVfcm2TNav7yNM4tx2lZoJUODTcLbS4LFC9fTwN9bj6l54i60Aj+NRZ6JAE15XLjIbaJ6e6btS6M04cgoBNTNC4Sen3yuoewn/ZvavdAW+bdv9baTYzRmd0mvQ7n41GLNeXtw9N5wQXK0xQ9fO/P6ZpGmAFR+RT9/FXmD9y2NWjSp2W1CI9yls1Obdpn4YhJdiGY9brkUykdZLtaD8APdu1zG9QuWMSisBAUN1hzii7PcpA7qWR/9Cg0kuvUt3iiPT833k8xRjB6mlFyirfrPJAMfgQ5GPYA+s/MknVh1nig+7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMjq3052Fx6FmowpHIC6oeufP1w0FdLbadls3QqBZ7I=;
 b=kHmqlLUE87Z3kwTLuB7gTs1cMFwPJWLIT7jlNtRiE7UyL45BtWepLTiMthBy/6r4eCzFwWzbRFbvVucMBFmQrZE/BsVn93mS1UD/o8QRwlT9BOX8Hz9utXMygFZKbZ5dBc7boTsHwWz2iqFd+Ci5hrdDybrLRzwgvuCbMjp9lOy6xwTDdEC7Lbr4obAu1tXRhEauBIdLsaSms5Qc2CcJSClPebw87O2ygPI+NNoJ4arUyMvRO3d4eUdktE5PdzKY5VpyTXQ1Xcp2QjktpDKQR9NsPEzo9D9Q7ywOn1l9UxkKkQ/MBjsReM/1RDL9xlEJWFtBxJfTyfXUgNlO+SgoYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMjq3052Fx6FmowpHIC6oeufP1w0FdLbadls3QqBZ7I=;
 b=tnam/hJnEfWSU1smqIIFkGNHQBVqJ31Dl8HcBmPDoL0qV03pBPvuEKQ3RCMDYOJqYnj5yAgFqEZsl9aAF+cOwD6dOxUbJZix8l8o5qYm1qFoIaKyYiNxt1buXBl04xEXJ7hNR0vAGwFSX4M56+0pPX9SdNqUF7Yap7O63CVMUyA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Add macro for version number string
Thread-Topic: [PATCH] xen: Add macro for version number string
Thread-Index: AQHYwrIAv1XtejytxUaSGPsSo1mE/K3T4vkA
Date: Wed, 7 Sep 2022 12:20:14 +0000
Message-ID: <4A5E6FC5-1716-4D7E-95EB-83CA6451D88A@arm.com>
References: <20220907120420.387771-1-leo.yan@linaro.org>
In-Reply-To: <20220907120420.387771-1-leo.yan@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 587404be-2eb6-4169-8643-08da90cb57d0
x-ms-traffictypediagnostic:
	AS8PR08MB8420:EE_|DBAEUR03FT065:EE_|AM9PR08MB6292:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PnYOOwZskiVLSkeldrGwTFDMlwWIisK8s6ctzOBAWr9E9Iu/1OQtp8xU2T+Agivm46O5dxWaKMuSEvKQ2IbSyN/Q0FuqKpp2oDTthbEyRV7U87sVX68d7LbUOkt34j+a0Kw8dzfbuVIaMvdBB/mkZL2o65LmPp2YegQ7VpRstn5J60m5Nlj1OFSJi3qaJsKhMXiScbI1c0bJA1BL3nXAJv20Xi5/tRKFb4wceY8N5SLqOf1y+YIRtWP59jG6CY0uupishHsdLRXS6xnAZFy+IY9sojCnVDlRSLf2nAqNH0quLgQYzdt7YBnVHMtwDP8hNXRiZ58QsVmfduLjF2ZeV5Yu/4x+9Mzb+SMU5pYCLsHvL5QUkHeexsrsKvYA1ui44zg79uNha8ZBTYFIfKv+uhBEUDp6emUBugSiNqUtfb3TVHpihJtVwGjVvYYuqI0W6GIKdaqrkJml9T8KA3wxvazltNW8G8bXVrma5FH02LA0BfKkz8vtlajStUXSFft4jOZD/xS0eo3X9vuI3U2clFKGc9j9E9iyBsU1PK1xw2x7kOcLVTLy3ptzRA8hoQzzKmpk/8Fhc7MioN3JxqYyY9QpjCvoj6E+8rGvpPKLsqPu3FHXu9I4CIa5NZ1WgEfm959NNzDJrienC3Cs1KM2CI3otudcCatdGh8cOZfa5n87tPP6vL9uFUFOamnVE7gTVgmjPp5vtRATC0hxoa6vUNYdiC/JvsFEI/A4iJWt11rHOPraQd04M8+yBnD6lqi5AyD4uy8J5nC5hU8eAGAGjh9ncwX+FUygOmJAndOJiT4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(122000001)(71200400001)(76116006)(66476007)(4326008)(8676002)(91956017)(66556008)(64756008)(66446008)(66946007)(2616005)(6486002)(41300700001)(186003)(38070700005)(86362001)(26005)(6512007)(6506007)(54906003)(83380400001)(316002)(33656002)(38100700002)(8936002)(53546011)(6916009)(478600001)(36756003)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <636E6EE1F635274190A4FD35DEDDBA07@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8420
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1bc5e251-f83f-486c-4fd2-08da90cb5181
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fiEJQrX4aJtYOz/RpG6UqQoN5UNdlotnXCWy1jq+1MmlGIT7kNCxLqVad6+NY90ZiD8oUL9OvQv7VBH7ffXj2jvz2P8lcERBbvYqyJEvgXcid+ipiWwksD5Rc6VFCWciS8XhLZxwGVruqRKxefplY52mIEIBkb4kixEmVsvp4f1UKkKjc1rxAmWYul11dW0BDA0VYeKOUwhVixsWUQDJGl/qyqWYKWvfzwMRzmnioyMe8BjPpAAGDlLuJ/Vis9T8zEJVN5F+dYkm0KuDBAo+v18yC6pAoC70FVpMiF9JSUtv2E3LQa+Fg5g5sR5G7bZ7wqvFVWlcHW2SqrO+hiPSRLlz40FwYURgo+MiD5v164MBdKIFVQSTGmT1rQ2lUYohsZWmdBznC+35Qt0W8UZ5pyzjzwJNzmWfw4pNJLlW1mcF7bZzCQtXrOHIwhGVcXED3d6jYS2hZimmMD6FFIBNm/kWwtK5hUfRsaU5qDUouskqj5pv3cMf/E0l0P92R0L4gWx9xwSM+lcKMiEqLkXXHt+FAM7kCgHiaylBlS38nTZhpp8e1ajM71VHrW/4YGoiHM8Ep8Z7RZeEQGzwL92jhKTvIFboIiSjSl30LXHrM/ZecwDguXqRVRFQV0hiYxmeDb/ruuIIIiPBZgrfI2nyg6aFIjr3Fn7C8ymORCffQ+2d0yj6aDFrf4BZwy/Sr8Oy5n2a/eXfFYaPd6U5gjlh6OwPMSDOScy543U5dbbnAOiMjax35gN3imAnc7xIsqEN5ndz1UN/d3bg8aaEwKtKOA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(40470700004)(36840700001)(46966006)(53546011)(70206006)(83380400001)(82310400005)(4326008)(6862004)(70586007)(8676002)(47076005)(336012)(36860700001)(5660300002)(8936002)(33656002)(26005)(6506007)(478600001)(41300700001)(6486002)(6512007)(186003)(2616005)(40480700001)(86362001)(54906003)(316002)(40460700003)(36756003)(356005)(81166007)(82740400003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:20:25.2234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 587404be-2eb6-4169-8643-08da90cb57d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6292

Hi Leo,

Thanks a lot for the quick handling here.

> On 7 Sep 2022, at 13:04, Leo Yan <leo.yan@linaro.org> wrote:
>=20
> On Arm64 Linux kernel prints log for Xen version number:
>=20
>  Xen XEN_VERSION.XEN_SUBVERSION support found
>=20
> The header file "xen/compile.h" is missed so that XEN_VERSION and
> XEN_SUBVERSION are not defined, __stringify() wrongly converts them as
> strings and concatenate to string "XEN_VERSION.XEN_SUBVERSION".
>=20
> This patch introduces a string macro XEN_VERSION_STRING, we can directly
> use it as version number string, as a result it drops to use of
> __stringify() to make the code more readable.
>=20
> The change has been tested on Ampere AVA Arm64 platform.
>=20
> Fixes: 5d797ee199b3 ("xen/arm: split domain_build.c")
> Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Regarding the change suggested by Jan to add spaces, I think it is a
good idea so if the commiter agrees to do on it on commit please do,
otherwise we can keep this as is.

Cheers
Bertrand

> ---
> xen/arch/arm/acpi/domain_build.c | 3 ++-
> xen/arch/arm/domain_build.c      | 2 +-
> xen/common/efi/boot.c            | 4 ++--
> xen/include/xen/compile.h.in     | 1 +
> 4 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_=
build.c
> index bbdc90f92c..b23c7cad7a 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -9,6 +9,7 @@
>  * GNU General Public License for more details.
>  */
>=20
> +#include <xen/compile.h>
> #include <xen/mm.h>
> #include <xen/sched.h>
> #include <xen/acpi.h>
> @@ -91,7 +92,7 @@ static int __init acpi_make_hypervisor_node(const struc=
t kernel_info *kinfo,
>                                             struct membank tbl_add[])
> {
>     const char compat[] =3D
> -        "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)=
"\0"
> +        "xen,xen-"XEN_VERSION_STRING"\0"
>         "xen,xen";
>     int res;
>     /* Convenience alias */
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3fd1186b53..62602d2b86 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1367,7 +1367,7 @@ static int __init make_hypervisor_node(struct domai=
n *d,
>                                        int addrcells, int sizecells)
> {
>     const char compat[] =3D
> -        "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)=
"\0"
> +        "xen,xen-"XEN_VERSION_STRING"\0"
>         "xen,xen";
>     __be32 *reg, *cells;
>     gic_interrupt_t intr;
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index a5b2d6ddb8..db0340c8e2 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1341,8 +1341,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
>             efi_console_set_mode();
>     }
>=20
> -    PrintStr(L"Xen " __stringify(XEN_VERSION) "." __stringify(XEN_SUBVER=
SION)
> -             XEN_EXTRAVERSION " (c/s " XEN_CHANGESET ") EFI loader\r\n")=
;
> +    PrintStr(L"Xen " XEN_VERSION_STRING XEN_EXTRAVERSION
> +	     " (c/s " XEN_CHANGESET ") EFI loader\r\n");
>=20
>     efi_arch_relocate_image(0);
>=20
> diff --git a/xen/include/xen/compile.h.in b/xen/include/xen/compile.h.in
> index 440ecb25c1..3151d1e7d1 100644
> --- a/xen/include/xen/compile.h.in
> +++ b/xen/include/xen/compile.h.in
> @@ -7,6 +7,7 @@
>=20
> #define XEN_VERSION		@@version@@
> #define XEN_SUBVERSION		@@subversion@@
> +#define XEN_VERSION_STRING	"@@version@@.@@subversion@@"
> #define XEN_EXTRAVERSION	"@@extraversion@@"
>=20
> #define XEN_CHANGESET		"@@changeset@@"
> --=20
> 2.34.1
>=20


