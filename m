Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AE66602A0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472699.733025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7i-0008H2-4p; Fri, 06 Jan 2023 14:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472699.733025; Fri, 06 Jan 2023 14:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7i-0008F3-1S; Fri, 06 Jan 2023 14:55:10 +0000
Received: by outflank-mailman (input) for mailman id 472699;
 Fri, 06 Jan 2023 14:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fu4g=5D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pDo7f-0008Ex-P6
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:55:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2058.outbound.protection.outlook.com [40.107.8.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ab1b88d-8dd2-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 15:55:05 +0100 (CET)
Received: from DB6PR1001CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::16)
 by AM0PR08MB5331.eurprd08.prod.outlook.com (2603:10a6:208:187::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Fri, 6 Jan
 2023 14:55:00 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::72) by DB6PR1001CA0006.outlook.office365.com
 (2603:10a6:4:b7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 14:55:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.17 via Frontend Transport; Fri, 6 Jan 2023 14:55:00 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Fri, 06 Jan 2023 14:55:00 +0000
Received: from a14c970605c6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6CA9B0E-D381-4961-BF1E-972E26964A33.1; 
 Fri, 06 Jan 2023 14:54:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a14c970605c6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Jan 2023 14:54:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8639.eurprd08.prod.outlook.com (2603:10a6:10:401::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 14:54:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%4]) with mapi id 15.20.5986.007; Fri, 6 Jan 2023
 14:54:51 +0000
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
X-Inumbo-ID: 1ab1b88d-8dd2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iefGtseeR8T4bINEtwsgEEg3NVUu/gPqbj6/DDnjGLo=;
 b=WYxe4ReimclZiI1EH30OaHnHnsxWQlvxToFxLNK5vpWzlS1IzA1yzv+UOa1kqJWrmzfp0VoZvKZv4TucwbjMC6Ii2xVc/pAePhXpYScwJuJ3mBQyxrMJlTqBWFWnzbK2mbW9Rb5fzO98wpnQQ/pXNEHQ85yjRkMDwbBywWe+w2Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nK8s3jq95aR0GBfj8VeMG5XE+IEAdi5+NIVp+ttXPT6HrXPERuhc2KjI9nxqKqJ2vryfgbZp2a7EJTtujl6j5OamOV5/GTTOWDcDTpVpEPL4H1T7MKPCTTVnNRHTsVdVzk9IegXXozZQDYnHT+yVDg1r5uo8geKe6xU0EksvISlpXJJX572K77HsSvJGvXVflJP5Y3zCf1qJN6BO+vi9cBvPWmHXKCJgVM2yKFOkn6DZuayfsnZyaloZe4wgPm9s1SAznUodIOC1VcuWNbH+41NX6JYsbfTnvK4CGfQnGrjlgBDxmxRfB49erP5X/l8AgrupLRnOMvijFoPj06eNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iefGtseeR8T4bINEtwsgEEg3NVUu/gPqbj6/DDnjGLo=;
 b=G+eoA2F1dkPxbXqb/+qctC7wW/KWGThGi2UWUXIg9z7mxb56qAw1uhV05N+jv2lnL/kNLGKjKm7FUbk63rZztFuAOfzYRwAx4DcaQFm8a2ZyyMOHYs9fLQvzNx3Q7I5VHnL8bDxI80Z01mnyi5B+wd9WMhVdKmjG5Yrlnty9QtrV9cUfjWs04YDihuu4VqF7M5HWq0cfFz+M8T6Yc4J+iDZaVs5t/djCDR4JHoHubYlBZz2s6c92kac3v3uveG/j080O0R6/RHiuuqDYs8cYcjgDRA0BuMdpYW/aGCw/HumF4Ra7V8gcNseCpntURkBgtK49mnWbtBYhARl6QAd6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iefGtseeR8T4bINEtwsgEEg3NVUu/gPqbj6/DDnjGLo=;
 b=WYxe4ReimclZiI1EH30OaHnHnsxWQlvxToFxLNK5vpWzlS1IzA1yzv+UOa1kqJWrmzfp0VoZvKZv4TucwbjMC6Ii2xVc/pAePhXpYScwJuJ3mBQyxrMJlTqBWFWnzbK2mbW9Rb5fzO98wpnQQ/pXNEHQ85yjRkMDwbBywWe+w2Q=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 19/22] xen/arm32: mm: Rename 'first' to 'root' in
 init_secondary_pagetables()
Thread-Topic: [PATCH 19/22] xen/arm32: mm: Rename 'first' to 'root' in
 init_secondary_pagetables()
Thread-Index: AQHZEUh3UTDXWpRZjEa7nLtXRiROF66RkhiA
Date: Fri, 6 Jan 2023 14:54:51 +0000
Message-ID:
 <AS8PR08MB7991C55F30024E017DB2912D92FB9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-20-julien@xen.org>
In-Reply-To: <20221216114853.8227-20-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 166E9CEA8F8BE44593B701E6599657EF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8639:EE_|DBAEUR03FT046:EE_|AM0PR08MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cbd839d-541e-4173-2576-08daeff5fc12
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ms5UL069jDPYJWnlaoI1S8c/OvH6A2RVp3IAsyEXhbB56DSBllGdOjmqfH+7TzJwOd6kfNPoQwPQ7luC/V0Mj47EcwfMpHHEF62ig2IyeCd9SVCTi/B5VxdKFY1GRIbA/n+1zJquDCMCT3F4/HrzE1azvvg9dciZSPgtL7AmwCQgWqo5hxZUSZSAxnX8DgNXV07CyV7MRvOPORGG7wOHL6TEPfaOUe/Yol+AExt5MlNss17zTvGdFVvJCYdweMV3Fj2E3uSAh531XWsX0G2ckIbVE1OZ2wazQjBrXB1skDFJkdtArmtXRvRXFfHXq+wlq+wM+UwI3dNtvRuFkWKt+3G83fudhG7Xt6rJGRhlqhy4UGUEEInXxSi0WxR7XnDR2XM7nnCODYv8RE/4+8Gy3Xl9I1Xbxmcan5Ur+Rin91BPLZqOifY6ZxXJ/DWf0Esz7FbxTk9RLhTt5GFeQ33zApk3bPs+FEeJv+AIv1wuH9gP/w8apRROE3zv6kQPW1Kr+BebrUWIsZoeCF5DGYOL8RnUu7E4Bq7aGnmseBB200xUVbADjAPtA/I8Ek5WsFKEt21XSL9IXw27K7uNnUdkssfFDbxWvJ6wT5CQfXru8CejcSAEYNcJJtGrRtr4nGfXJp8a62LZh43DQt0/xQDaSSM21M3TzaBmDbS34+rCE0nap78LbaBVM2QyFEVJzVuRW9IelogtW77mnQfFXj0RuA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(64756008)(66556008)(4744005)(66476007)(54906003)(66446008)(8676002)(86362001)(66946007)(478600001)(52536014)(76116006)(41300700001)(4326008)(8936002)(5660300002)(33656002)(2906002)(316002)(83380400001)(186003)(9686003)(26005)(7696005)(6506007)(55016003)(71200400001)(38070700005)(110136005)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8639
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd643ca2-f6f7-4c27-44f1-08daeff5f6f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SumpMe6cDP0Ji0gMfc+hDKBovLswnVLXyJkAK738wCOA4tF1l/fABb+kcJV6vz8LnnfgpN22sDiLHeJllLlHjRV6Ol3R1TQ8F9GcLy9JWPbf7/n45ZNKe7ADHlbZZ/+edYy7Ktfq49ibzEvIkCDJHIJEE/uuPhDi57Jh2PIXeSH3Gc7mirEk7YzGE084UAjR68G+Srt/qmwXlkvVUlAZhwm/8y6eE/a0L3zMzxF5rvHgySuOqEGqZi9KENcttTLJlxmwDR9b38UMW+tiQ4RLG4GsKyM1gbQrQYDXA6PDe2dpXgBTHzPDQVRQWFoOc8qIB/hD0CHLIUGfQ6FEpq70pu4lMeLob/UfICZcwIKlRSaZb7i0KCxg5v0xphTo4IzAer5r62IFZZl3UwkcdQkjyv8eTcfpTHJlN/mwcVpYFJRNVJOuBUqYTUThvjpeR0UJNldWMgtTYKaPUh4ijkYeEIeANVqrdczTTIUpqtZZ7KTagthvjeM01xKj22MeKL1Pd0aKEbO5+mr1wM69OPFs//KaYkyvYduC1UPA32oWCZVaQror0f/Eh5DXUnQ0HAfkRn0JnUk7X9Smxg5Ll3JFtD3zaO6jnqHtlaU7A8NxxwG1Au3+or2PGyCrLvr+ZRnDMlYjo8LO9t56XPFUfoafU6hyWgU/787CMSf0OaF3bh+siHX0N8SZIskX2TJNa0nwqTCHW8OzjnLVw66qsBqC7g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(336012)(356005)(8676002)(316002)(70206006)(82740400003)(4326008)(70586007)(54906003)(110136005)(33656002)(81166007)(40460700003)(36860700001)(4744005)(55016003)(40480700001)(2906002)(41300700001)(47076005)(52536014)(8936002)(5660300002)(83380400001)(186003)(6506007)(7696005)(26005)(86362001)(82310400005)(107886003)(478600001)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:55:00.1420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbd839d-541e-4173-2576-08daeff5fc12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5331

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 19/22] xen/arm32: mm: Rename 'first' to 'root' in
> init_secondary_pagetables()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The arm32 version of init_secondary_pagetables() will soon be re-used
> for arm64 as well where the root table start at level 0 rather than level=
 1.

Nit: s/start at/starts at/

>=20
> So rename 'first' to 'root'.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

