Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9771F71F824
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 03:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542891.847300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4tpr-0003Hq-7V; Fri, 02 Jun 2023 01:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542891.847300; Fri, 02 Jun 2023 01:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4tpr-0003FI-0p; Fri, 02 Jun 2023 01:44:11 +0000
Received: by outflank-mailman (input) for mailman id 542891;
 Fri, 02 Jun 2023 01:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIO5=BW=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q4tpp-0003FC-T2
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 01:44:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6deed55-00e6-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 03:44:08 +0200 (CEST)
Received: from DUZPR01CA0297.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::8) by AS8PR08MB9742.eurprd08.prod.outlook.com
 (2603:10a6:20b:616::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 01:43:55 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b7:cafe::16) by DUZPR01CA0297.outlook.office365.com
 (2603:10a6:10:4b7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 01:43:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.22 via Frontend Transport; Fri, 2 Jun 2023 01:43:55 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Fri, 02 Jun 2023 01:43:55 +0000
Received: from e23f732a91cd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E64B3481-BCE8-4968-8D44-4259F3D7B628.1; 
 Fri, 02 Jun 2023 01:43:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e23f732a91cd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Jun 2023 01:43:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9045.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 01:43:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 01:43:41 +0000
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
X-Inumbo-ID: f6deed55-00e6-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqLQc7+XJQ+lNNW2giUUezIhMcr0SUd5NLayZ3mcbpM=;
 b=HXE9fxTGiXtF0mcKzk6of9zkjidZR3XCJ71dAjRXQa94ZoSZAj0X32CHjdREWRiobHkyCnVzCwtWjD9m4+pKJqFq6qeFzv4jSh4PINyavc7g/2kCBgMp7zAVaQpU0hqd1ORIpgWTXx6gZEJJoBPPnYx/Y+1mVzC6OZkHYJZf7Jk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etDFiuZ2mVTU3mZhDfxWYUpbf7AF7KLeYqsllKvpT00IMTvO615rlkRnKqxukqKDBJaLMY+eIBJlTNqNhmnGaUsH01nP9BNa5OoYBevtMDG9TL4qudpiZjzqyBX8U9vk8ixCFEVrsrcUkAdmd++NJxKN4bW9dJQUj0w4d3VZ7qyo5vmrImFkQgG3jXMdO8xFNjacULh3xLY+BXUX5Gg8Wb/Rt5lHojuM0g/rWu/KiDrCTZoiwLmjBSdqkhf4IgRzfWqNF1CrU//iAZambZ8KXxj0IolBFXFgInLzjPpJgcnk8LKIPJoJ2gIJdpdVZyCMMTabBoteI9NAohtYjdzvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqLQc7+XJQ+lNNW2giUUezIhMcr0SUd5NLayZ3mcbpM=;
 b=JE8DeHxAB15QMmLQ8o/2i2dZ8wpMWHvA89l/NkktUaDGKuAzMiKk/SkZ64Fr0P2jnsC8pGoqdPzYX1cyzHVkEoYVWp3DABiuVFGl3ihjLVVhj+x/Q6ho0CO8JQLlgBMSF7mHFvOgJUYWoidGJkdy7BqIZNePF0UWDJky2EzO6kPnWVllh0TepcisuRloTao2pxb9Jl2+Hsi6oZjtBkwUkhoWTKeq3b0FPjRpo81Pnb0re8VV/TdwH3JPX+qVYnLShIe+NhxjctxEl84xtWz/F6Ywam0XxmWhohvHaAOvpjrwiI9o3TAbYFZn6zxgUqjQx0vuiqiegNK/VIi/5u+qUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqLQc7+XJQ+lNNW2giUUezIhMcr0SUd5NLayZ3mcbpM=;
 b=HXE9fxTGiXtF0mcKzk6of9zkjidZR3XCJ71dAjRXQa94ZoSZAj0X32CHjdREWRiobHkyCnVzCwtWjD9m4+pKJqFq6qeFzv4jSh4PINyavc7g/2kCBgMp7zAVaQpU0hqd1ORIpgWTXx6gZEJJoBPPnYx/Y+1mVzC6OZkHYJZf7Jk=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "michal.orzel@amd.com" <michal.orzel@amd.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>, Community
 Manager <community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Thread-Topic: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Thread-Index: AQHZlOwO5+EbGXwbJkOX7UD3KKfC8q92vT8g
Date: Fri, 2 Jun 2023 01:43:41 +0000
Message-ID:
 <AS8PR08MB79918E6EA4E218F44B3AF6C5924EA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-6-vikram.garhwal@amd.com>
In-Reply-To: <20230602004824.20731-6-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F96DBBDA2093174E80BAC3FD285AA10F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9045:EE_|DBAEUR03FT047:EE_|AS8PR08MB9742:EE_
X-MS-Office365-Filtering-Correlation-Id: d207650b-fb31-417c-bf55-08db630ad380
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 V26nZYCdV89sh5RjjQTwLrvN9X+OrZHecqMcK4gqw4dyVz3sqyFtx1QoIOKnPkOUtHuxK6igFX6C51VXkq1JeVguHrB/Ai4XUfl3I//zsZRFSrwacaWq2ZtDyCi2OoBxOTU+W9MuMuTR1qcBst3WRlbhwSmR1oK+UuTa5Sht1Plrot08xc66LrSImeiNf5NSApsr6UMnb7Bd6wnK2TsGgVGsVnhcmE+gZfhTdDUeigqPZfZPnoaFOOFhlS5wkWdksilOCKU7OsTSU4zAJUmZbUCAQzl+A5VSn/9SzgGdcdmubUbUJ+yB71RGVt5UQIlIR7shuHCNusmEVWk1F8bCBDA2UFYj7Pd1HlKCmt2N1C8J56AZa44AVehdmlMK3jcUjb/f8cv7xhVRe+3up+x5x0lkVukB1FAQpmapK/WjPldNAE8KPBj4N4341pdARBuk2JDig/kqV1rRjbAlmh4wr4eykX58jQiSK1/TLDJForFKbLJ1dRbpooJFHDNHrZ0pbmL9gBcV9htvd208qVY2tF05ac4vDWanNR0pcsbwrkn5mAVV6O8aDBa8VAlQd+F23OTiuf6ZNKh9QpT/POZmnhJSdchOvaHnEnNkIkucoqF7MDg1MpKMywu5rP84qeXc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(122000001)(38100700002)(86362001)(38070700005)(33656002)(8936002)(76116006)(52536014)(8676002)(7416002)(26005)(6506007)(5660300002)(9686003)(55016003)(41300700001)(2906002)(186003)(4744005)(83380400001)(66556008)(7696005)(66446008)(66946007)(71200400001)(66476007)(316002)(110136005)(54906003)(478600001)(64756008)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9045
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dcdb2ae2-c570-4f39-7759-08db630acb5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o2fnD3fcjhmQSwff0WpuNjMPt4zkAJGHa9o8wvAMJwJ54Q/pxRmzmLqlBcrxncEj8OUJWurnuiCLGQwpZmM3K0T8cufsOY5ZrpDwKcDN5dXiUHn1TFvzMl18D5XuGyjLB+ZfJXUz9M56zblVrZKAXxPqIkC4Ca0xXBYR/GV0R91hjTpVhB4hk2b4Mntz9gJPYUcYBonKYjKWXvbmiN//OoleVkGxD20EmBop5CdIL9hcx6EelkV41+t2iIYVKTdTn5tA35HFLcOZsX3TGmIKpTAf97PLEul9ABrsdVnuCsX4kAEiDVSxgaR5XLm/fR8crxIiE8pTzJDXRjKhPN9QlRB0gTgL8HmexaAmFp8VO7w9AoWZaUJiAV2jsG/sOebXNbCqvyO3jb/GYX95hRnrI41XnfQYI79ISYjpAF3KDH4LH80K7xf9BlU0sibF6/q9ndlo1UEwaP4qzMiLhG2ScMZ/L+w024tf8GzVH3BsCtzE768TUEs39kzRiCGAEIxKxnl5FnsyBd346qLmv3ZPzCYlcw8hd2uSfU18LZKASCsRZiqmI0GQ2rga6+CNDJj4V0lCpCGpVQDBc8Vpl5Rlzx9aoPCO8vAVQVeNel6h8oW4/FgiPVEoWcim26DXsKqAMGagJKfAGHVsip+c7V9JJhT5j05awploOnBB2RsLDCahpwqOQ6c2McT1aqRZBi5n4cukqePzsagKGyW1M/ZRdELCcqDc8FHspH8U5xpGUklilKidrgp5kGnV0/TlL+9M
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(6506007)(186003)(26005)(107886003)(9686003)(47076005)(36860700001)(41300700001)(83380400001)(4744005)(336012)(52536014)(316002)(2906002)(5660300002)(8936002)(8676002)(7696005)(54906003)(478600001)(70586007)(70206006)(110136005)(86362001)(55016003)(40480700001)(33656002)(4326008)(356005)(82740400003)(81166007)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 01:43:55.2153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d207650b-fb31-417c-bf55-08db630ad380
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9742

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
>=20
> Introduce a config option where the user can enable support for
> adding/removing
> device tree nodes using a device tree binary overlay.
>=20
> Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays
> support for
> Arm.
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG

Kind regards,
Henry

