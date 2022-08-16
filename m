Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D88594F0C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 05:30:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387926.624400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNnHB-0001ck-SE; Tue, 16 Aug 2022 03:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387926.624400; Tue, 16 Aug 2022 03:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNnHB-0001aH-PR; Tue, 16 Aug 2022 03:29:57 +0000
Received: by outflank-mailman (input) for mailman id 387926;
 Tue, 16 Aug 2022 03:29:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4dL=YU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oNnHA-0001aB-Ep
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 03:29:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1628207-1d13-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 05:29:55 +0200 (CEST)
Received: from DB6PR0501CA0048.eurprd05.prod.outlook.com (2603:10a6:4:67::34)
 by DBBPR08MB4742.eurprd08.prod.outlook.com (2603:10a6:10:f5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 03:29:51 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::14) by DB6PR0501CA0048.outlook.office365.com
 (2603:10a6:4:67::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Tue, 16 Aug 2022 03:29:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Tue, 16 Aug 2022 03:29:51 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 16 Aug 2022 03:29:51 +0000
Received: from 1f9f2ffb2936.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16990204-7976-4E67-9929-34A49F2AE250.1; 
 Tue, 16 Aug 2022 03:29:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f9f2ffb2936.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Aug 2022 03:29:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6399.eurprd08.prod.outlook.com (2603:10a6:102:158::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 03:29:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 03:29:37 +0000
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
X-Inumbo-ID: b1628207-1d13-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ofwl9MKipqVnBZTs5zaBJCVFXYorLB97qlw4nExyTp6ycvAv9ReoWWpXnTczkxoDi0zDA0FevdhxKKaDsMXR0tJ+PT7L3gsuUSssbIsY5XJCcDqgYD1l/X0GjIbgcS8O3JM8c7ySz0utocpaefffP1YBLiXmMoJaJ+OQjf6j9M7mJjG+7cXXRj8BpbGGuSl8ox339wck8CqLpL/BFxSt8vIHI72YdVNVBXnjWxyfIjCKaelR9Y8J8hbYNAwe2D7OHItxKf2hIqSUBxbtA2leX4WKaWSnMGakkoiu5cw3b9Kwa/SCPKxj27HO+z67dQBnKtGQVFL3n1pvEdt3A613yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvmy6xLMrBw6EerRvt4CfL1XSxObEW0p6xXhBtoLA/A=;
 b=XyDQpRSh/DdbObXm4ahUu/TAkQVSC12PgPZvfM6z74mRc4U6quPBqZWUMlSMsPlQl+e7cfExQshhNvYZ7ObR5yf0J9FQBGUavnI2JQhfPiOnUQVkS9e2GJrvOWwolsmSUkCLZlrq5bxyoEXYfGctoy7i6vYWRWhUmoHuL1S0+QUOBLi6lCKIXreN0IckpcFJQyl5kLx+1aaHb+PJQXvYHPsnh4yprt33Lk2zedSJF3tJyyVo0bwwx7WNZNjG2rmwCp+sIVI418x92LZXYHbShk3Xjnr90aCSIh9O148kBERspE8IocJJQpEzldUYuNfw9nvRjuRPHQUMTxjRtXex6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvmy6xLMrBw6EerRvt4CfL1XSxObEW0p6xXhBtoLA/A=;
 b=ohvqdz9SC3BedsqpOvfp0rUMoVK183aGHI0pJo//EczuHwCQ0iC+il8GEZUKn1p9dFIwvEPA/kC1EpJrRJxOpnNeSPLCDcXuJwpfIFi8Nm3p21qiLp1d7vUJzm7mFparQucCATOQ7BhVJqprcScbqQGBC26LDwFJlIbVoGnwlT4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl46t+3yDUuJ7AopFr5OVNsdsrmAlt54y1RknRYyFEoH8lDSuWzDcBummnORAVm1yty9ZOT1bqb0ZVHGspbxhsT0M7IVjCO4dujJBcmNZfuXgKiv3vJtxi05eyhzxr44GJB9MjX6aDKAoxGNTxCI9wG+oHKE7kyX54flgcTalHJJ6OZlOrEauRseUc4fTFCT07n8hTCzqzySX602Y1W3SYfAOtwYWrl0OYXMtDKMr6wJcyTaxpHp8jAWEWrnuM+53tssjSFzuqh6Ttk00uvoMNYrLUQ+Srnj8u58KSem+PDF4dCRmk+gaPl9eT71aKPT8nuXJnNQPdLT74QoY5gxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvmy6xLMrBw6EerRvt4CfL1XSxObEW0p6xXhBtoLA/A=;
 b=jR1Higg+QXbxIpBrfmDuxFTr688VTp6IbDV+qpWZ5KR4mHnaBs3z111i2+9wA4PrLT8FJ4DuP9hu/KiBL5U1/Qti435tCwYmsXIVIiQ2kB8F68E816yAXNX+6/d85LcWuHOs6Syc9WmKGwNhO2StFqcUY6wNK1d1N014RK2f3apxil0elSKVLqxWWBLBnEHV8sFOG20b6qfHPNkJZBYY55XLryDvmRQdw3PvJCkerT39NJup+wuvU8HnYbfEI0Nh80pnwKMb7cBSJK8bHMsuilOTvrYOMVqLysKnkxvpu/GrRYLormrwt9t24vYyKnt49iHJXG8vdV1UkmvqIXjvXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvmy6xLMrBw6EerRvt4CfL1XSxObEW0p6xXhBtoLA/A=;
 b=ohvqdz9SC3BedsqpOvfp0rUMoVK183aGHI0pJo//EczuHwCQ0iC+il8GEZUKn1p9dFIwvEPA/kC1EpJrRJxOpnNeSPLCDcXuJwpfIFi8Nm3p21qiLp1d7vUJzm7mFparQucCATOQ7BhVJqprcScbqQGBC26LDwFJlIbVoGnwlT4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
Thread-Topic: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
Thread-Index: AQHYroFOVyqyQRSbhkS8uh6wKmYB5q2vMYiAgAD+9oCAALMGYA==
Date: Tue, 16 Aug 2022 03:29:36 +0000
Message-ID:
 <AS8PR08MB79916319A3B57AE6D255A5C4926B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-9-julien@xen.org>
 <AS8PR08MB799170A0EF051DE12565D9D992689@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <15023215-6697-112b-2bc6-8ec7880a9704@xen.org>
In-Reply-To: <15023215-6697-112b-2bc6-8ec7880a9704@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 360C6EA9BD1B5F4189465CB5C21C1876.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5d53b5a3-ef87-4212-af8b-08da7f379443
x-ms-traffictypediagnostic:
	PAXPR08MB6399:EE_|DBAEUR03FT047:EE_|DBBPR08MB4742:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eVWJ0yhs4NLwTt8dbaQEWAD9BVcxH2ijZ4o26yS7H9MnoMPRwofh3Ec70MWEQq8rNwPFvQiSpJsPyAjtrkw07ubOoRf8YmKB0IbJSfF5AYbjusb5T8btZhbkj9fHa3gJcSCq6iD2xX6tzfW26snMgBZUDsDrD+81R0XiiUPQz9ghVcyXQ0rWO3c6UXue4bzgYtgiDCxzfePAJcuMK0jvPw83sSQ6el/IgSIlcGZ0Qk26DqQ83NjqwxW3oB8vKeVCBVntfxHdnzMmFnliIb+oOFhWSPQRoGVEe/F7brGsHEtYzx9DxZue5T2sJwOF9FS3IqvU5EgJ/PcL1dTvdy4NrljgboBw/oqVV30fxm87WjlpGjM+Bqho7VmyW59tv2SsIeSX8N7gsLZJucNZjamQOkktrfT5bGwywAFz+U+8Kj1jq8D+HDHNLxTjfm/6XI15sq+M2Q3smwp7dER+6mQ92Qsb5zSUb3gHijJpLcFfkA7j1PTQsfbbEWfiCD6SFeZd+0certAmA/aKaBm7laG5zjTF/vwSS23zK5FY/jfMvCDwJizqeUEfRCDdzbJM54PyYEucivYMApyNX8tv9W0s8LG7NTu86hIpNM9NUJaIEz8zu7PkPw9XocHGq29hYs8zdg+EZ7eV6t9+Xjf0sO1Lfgz3V+L6UP7eTnGLgS5rMSklCHJVZJ1/QHpR8sUtdXoHUWr/ycUhLwy1f188i/aUeShFqiECgis21xRAo0sAM9E2PKiLrcO098noXVQferGtDyqZGK+uvoCd4xcBQfCDGI9h37OdMNZXKqJT31OVRBDMC/eTCvbZxjxq9dUilt/Lpxo1SblK+khCPiM6YyLQ/w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(86362001)(186003)(38070700005)(122000001)(83380400001)(9686003)(55016003)(7696005)(33656002)(6506007)(26005)(316002)(54906003)(478600001)(966005)(4744005)(71200400001)(41300700001)(66446008)(8936002)(64756008)(110136005)(66946007)(8676002)(2906002)(5660300002)(52536014)(66476007)(66556008)(76116006)(38100700002)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6399
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b99431f4-f825-4877-dc3a-08da7f378b31
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jvbIsazlU0XQVmehLNO27KjB9xN8u8wXIIcDhH7ex8t+wb+XNPoByPObAVqeEsppdUr6HQwwwh+S3GsSCsiAcROm95Vgqcx5rr6uYmeD/Fma8+m6K6gXAQMG++DEbdw3USupoR26HCVrtwbxw6Dc0iy26fMl7fghvwNhLo7j73x3lUxNkERh0fdP7+lkTfhepbSnaiVcpsPVH2HADm17eUZi2N21+1m2Ej9cWNz8u/j4ApHWFUqf8z4qNipCNkQsCYR6eP9kDrWESnUqbWN77oU+pKeJf/ryjGqN2GKJxLcsPT6XJJN6zGHOsrbAExt/Aya0He1xrSeVoy+V+ZPxmb+LYzoYreIfMas6Owm+e1Mzy/bAZMu05pMjY5SFKbMpv28TcP9JPPbgU51doFr6Z1o+UAc9hjIcG7RIYEul+Jjcv2oTgNArPzgN3xvM5R8vmGRvzCWHhymUAUj9d0sF/xx+GWMN5+CNG9C8u0BpeMXLjA5N1jC8kFdGecFjisujjLqWdcQWIFJmw4PXt7CQbYeemHO9BtP0v1inZJvF+/sCwzVFdn1QwYMDLjpQz/OU/KkwpTufQbEPEor3ztE3XQefLh6PY1eUvHr6b2kF4qNDEiuJ65i5fM3lynvQEYLlTn+sGe9J0qDDr3CTk8PcYKSg9vEIruB6FeS+saJz7aHWp/Z7GMG1DeusgV7x1uAQZv8IJsIRPqQBYSRI7EzzDPGnbvKMGU5lvqAKQa/biFFpOFUzdx7D2vGsF4jVaZCvicsTrbZ2/4gGtZuFFuVEsjQpBDk3z35d0kdoSJoaafxzbDp85bBp0cLdZKcib/wM1X5xQJNa0lCOS6rKtF3MAw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(40470700004)(46966006)(36840700001)(82740400003)(316002)(55016003)(8676002)(83380400001)(41300700001)(40480700001)(4326008)(2906002)(336012)(54906003)(110136005)(47076005)(36860700001)(186003)(107886003)(70586007)(70206006)(82310400005)(26005)(356005)(9686003)(81166007)(4744005)(33656002)(40460700003)(8936002)(6506007)(478600001)(86362001)(52536014)(7696005)(5660300002)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 03:29:51.3582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d53b5a3-ef87-4212-af8b-08da7f379443
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4742

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNy83XSB4ZW4v
YXJtMzI6IHRyYXBzOiBEdW1wIG1vcmUgaW5mb3JtYXRpb24gZm9yDQo+IGh5cGVydmlzb3IgZGF0
YSBhYm9ydA0KPiBIbW1tLi4uIEkgZHJvcHBlZCBhIHBhdGNoIGZyb20gdGhlIHNlcmllcyBhbmQg
aXQgbG9va3MgbGlrZSBJIGRpZG4ndA0KPiBwcm9wZXJseSBjbGVhbiB0aGUgZGlyZWN0b3J5IGJl
Zm9yZSBkb2luZyB0aGF0LiBQbGVhc2UgaWdub3JlIHBhdGNoICM4Lg0KDQpTdXJlLCBJIGd1ZXNz
IHRoZSBwYXRjaCB0aGF0IHlvdSBkcm9wcGVkIGlzIHRoaXMgb25lPw0KaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9wYXRjaC8yMDIyMDgxMjE5MjQ0OC40MzAx
Ni04LWp1bGllbkB4ZW4ub3JnLw0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

