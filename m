Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EB47430C4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 00:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557191.870321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0Vq-0007ts-MI; Thu, 29 Jun 2023 22:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557191.870321; Thu, 29 Jun 2023 22:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0Vq-0007s9-Ha; Thu, 29 Jun 2023 22:53:18 +0000
Received: by outflank-mailman (input) for mailman id 557191;
 Thu, 29 Jun 2023 22:53:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8DWp=CR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qF0Vo-0007s3-Qu
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 22:53:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba9a6ea8-16cf-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 00:53:14 +0200 (CEST)
Received: from DU2PR04CA0067.eurprd04.prod.outlook.com (2603:10a6:10:232::12)
 by VI1PR08MB10103.eurprd08.prod.outlook.com (2603:10a6:800:1ce::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 22:53:08 +0000
Received: from DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::ab) by DU2PR04CA0067.outlook.office365.com
 (2603:10a6:10:232::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Thu, 29 Jun 2023 22:53:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT056.mail.protection.outlook.com (100.127.142.88) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.22 via Frontend Transport; Thu, 29 Jun 2023 22:53:08 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Thu, 29 Jun 2023 22:53:08 +0000
Received: from bce341d42225.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4BE177FF-CECF-410F-B974-B09797B6802D.1; 
 Thu, 29 Jun 2023 22:53:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bce341d42225.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Jun 2023 22:53:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9040.eurprd08.prod.outlook.com (2603:10a6:102:32d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 22:53:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 22:53:00 +0000
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
X-Inumbo-ID: ba9a6ea8-16cf-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoVB4vG/uM5KKyFoUUtHs7ZFGShlDxHmaf6jJWSY2HE=;
 b=txnnS6qLav1ZlK5Qdr99r8+Gxoafu3/6DGhwpWM7BouwBayWpzrSUkcM99QGo5hw5LqVOivNW4M4QbV5gG2scGyAzTqZyJ8xYsrMLMCzHoy+Vp0GDJrhMqdTPUoqiYn+7n6Cr/svrry5hOytyXGnDQqxnz2yX5MQNQxcUj2plpQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHG32UIlS4sXhtl55BbiYhwvh8ihbD1+0ivyJnPjgv5OIiV99EQWmLk3WaAxoxmUT5hnn/lGOlea4AppAdnFX7TDeG7WspOxWdFYdqQtKyS3b1b1U0cLEJPgSmX1i2kHki5MnHIrbZomPLe4fcYegrPGpzvzE/1yg3hYtwl9lxyILnVCkJ8yO/DFK3U5RlnYi4pxzmHCTa2g3Y7B2uXRRcEx0+9n2GFUu33l0pTZmFGUENBGosa+sP+gjLPFR+u8eG7PuCEBylVhAicWORzLJDK3Nfiy+pTRkWSJF9rrt9HRmMQZv9vscqrJUicFhJ+Bv4H1Tb7IlRE3fiBSXyA9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoVB4vG/uM5KKyFoUUtHs7ZFGShlDxHmaf6jJWSY2HE=;
 b=h4mtR1EHLGTr+B0DlmSPvbaPDi9lr6+937pAirACElBg89kqSTK7tr+zDFA1SpWtj54vSCYVL2VKvng8ok4WedvsBnxisXgSFmnBB/T5Ozj1JyqIbME+Mx0HP2EEoYOLLHeLhSgKBGAh//SA9CjqvoHFpc/Dazux1ej0lbHOD66M6rdWBcQZWM7mnv8HPT3m700RBrhp99t2hEnQZsXXdnkTfD/DblC9SKjAphWexOoIALhRS8Nk/lW0uips9rQRfJ4r57Tr894T8g/JHgbzsyqOkVlIjHJiB/8ZDycgXVLyjh2c7sV1HBwIf896//0P9cVWttEbeQcUvX/iQqqkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoVB4vG/uM5KKyFoUUtHs7ZFGShlDxHmaf6jJWSY2HE=;
 b=txnnS6qLav1ZlK5Qdr99r8+Gxoafu3/6DGhwpWM7BouwBayWpzrSUkcM99QGo5hw5LqVOivNW4M4QbV5gG2scGyAzTqZyJ8xYsrMLMCzHoy+Vp0GDJrhMqdTPUoqiYn+7n6Cr/svrry5hOytyXGnDQqxnz2yX5MQNQxcUj2plpQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [v2 2/4] xen/arm32: head: Don't map too much in boot_third
Thread-Topic: [v2 2/4] xen/arm32: head: Don't map too much in boot_third
Thread-Index: AQHZqsXt6KY/k4F950WYV4UFWmacUq+iYkag
Date: Thu, 29 Jun 2023 22:53:00 +0000
Message-ID:
 <AS8PR08MB7991D84F86676D7DA7863F049225A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-3-julien@xen.org>
In-Reply-To: <20230629201129.12934-3-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D32322EBFD754A47B5D9833AB9F98AAA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9040:EE_|DBAEUR03FT056:EE_|VI1PR08MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: a00a812f-3e67-45fb-bb8a-08db78f39b75
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IusDlfkXfgW9PSRIxwTG20TOJzBzwLWmsk7yPJyAuvy7eZQYtQCjLO+2miMqvnMafl4fY23+9CMVapFEEOY97csTsRDP99XV5m4keIdi0ehwwIYh/zLdjK+zndQaZyaCA/DKcCYvhiCyGmIHlyBSOhrjwtzaj8B0yBKx9thw/wgKknxmgZEqXhYYGYKapG9ZwEt6GxylAEn56zUoYyEEqx+adOHy2Pmn+5xaDuCJQetAFmlvQQDElYAMYNURZJnb556FHOcMRi3/x3u0CqN2ev/zTT1ulGmjlg1zngTan3YSqbDrqVHVm3n7rhXp/0F3hySgTNo4PaUi0bHgm99+eoW/3YXo7HoE+Mr8GSSDw+TsEqUt5RhOM2pMUbQmahfvBT7cuFpHHS3NGy+GuLKAb/22OvfkNzFBDSA01CUc1S7A/oFYTucw9S+X7LdrkxPypdhbgSIA458S7AwuocuCjiRKEaqDmzX0UjhcqqcBx9c7xeWmXHltF9yxebIezA/5yzBTVNiU47k4LV2kPmLX0pBZv1H53rn8r3eyvVg6O611VS3NXmr9m42JAx/Jv13sU098WA7cEc9XKtZqsrizIsdhkerQP38TGuZku6Q75KT2aSQZRdJXgc36EEW3CbEs
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(26005)(186003)(71200400001)(2906002)(4744005)(86362001)(7696005)(55016003)(38070700005)(4326008)(8676002)(8936002)(110136005)(54906003)(316002)(478600001)(122000001)(6506007)(9686003)(38100700002)(5660300002)(33656002)(83380400001)(52536014)(66476007)(66946007)(66556008)(76116006)(64756008)(66446008)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9040
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9d724d1-f89b-42bf-9cc0-08db78f396c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uXeqXrPPTBHB1nMd2cPJgkfPf/NOPljo6HfbEYxCJfBDVQHNmBZL4QyOWLeZDiz8mhxy3kea2Fz6KhiQMt0Q3WwS6SK8AC0nv+C/XW0OdLt62w2QH5zCYB/Byc4sAxwoBl7olganw+zHA0/gV+NO/LHmv02blYXHqboaAcmNUFdXpuSC8BO44CnFuYKjP4eIRivcsaHvyLULtsgUh5lYzGN8/m/c5zsSDh+CMCqogC5UPfJo/OHWPd2pb00wWU4t2qCDnxbIKBATP8BopBZKqReXJNEgN6b8vUhg+gCwgZB/2Nz8YtDL1Qgb6dKDllIq090tN8vxELWDQ/XpmhpXo2l+vQfZqBy5/2ksVr2roCJf1rKhWwVJ/F/KISZV0nh7xxLooUAl7sPvxAr8o+czp+ySUhTrtvunmB20oyHnYQM4y+RP+/Y6I8/vJlNajq+RklNiaOHosnZGlILHt7igQ6+N/1cKRvSeO121UvJ2bpab+Q3dOurP9ydoIaBUH6rdT16+WTDbqTg1rrg76cK810Bj4woVFTTLfJ9wK3bJp0R7i/e8PVJD9ILYwoOMBa1cPIy8hPsn0t69VelkQURcQ3jX2mkuezH7u6/eapGO4P3qO63nUtAasuTKMbdZ6Zz0gIcV3Il+2MOTusVylfCaVeQ6mLR/pR6nmcPt8OER6zNFB32rbK0SXZjrJA/JSACrbhWjUrkZ0vh4fz54VTqr+1NZMwi1kktre1O91+e+xpjWgYlss8JC7J5ewEivtyB5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(70206006)(70586007)(54906003)(110136005)(2906002)(8936002)(316002)(41300700001)(4326008)(478600001)(336012)(83380400001)(47076005)(7696005)(356005)(82740400003)(81166007)(5660300002)(86362001)(36860700001)(52536014)(8676002)(40460700003)(33656002)(107886003)(26005)(186003)(9686003)(40480700001)(6506007)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 22:53:08.3627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a00a812f-3e67-45fb-bb8a-08db78f39b75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10103

Hi Julien,

> -----Original Message-----
> Subject: [v2 2/4] xen/arm32: head: Don't map too much in boot_third
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, we are mapping the size of the reserved area for Xen
> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
> after Xen, so it is not a good idea to map more than necessary for a
> couple of reasons:
>     * We would need to use break-before-make if the extra PTE needs to
>       be updated to point to another region
>     * The extra area mapped may be mapped again by Xen with different
>       memory attribute. This would result to attribute mismatch.
>=20
> Therefore, rework the logic in create_page_tables() to map only what's
> necessary. To simplify the logic, we also want to make sure _end
> is page-aligned. So align the symbol in the linker and add an assert
> to catch any change.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

