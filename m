Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118653251A
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 10:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336414.560727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPif-0002Lp-L4; Tue, 24 May 2022 08:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336414.560727; Tue, 24 May 2022 08:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPif-0002JK-H3; Tue, 24 May 2022 08:16:45 +0000
Received: by outflank-mailman (input) for mailman id 336414;
 Tue, 24 May 2022 08:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aI9d=WA=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ntPid-0002JE-I7
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 08:16:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d777216b-db39-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 10:16:41 +0200 (CEST)
Received: from AM5PR0601CA0044.eurprd06.prod.outlook.com
 (2603:10a6:203:68::30) by DB9PR08MB7130.eurprd08.prod.outlook.com
 (2603:10a6:10:2c8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 08:16:39 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::d) by AM5PR0601CA0044.outlook.office365.com
 (2603:10a6:203:68::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Tue, 24 May 2022 08:16:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 08:16:37 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Tue, 24 May 2022 08:16:37 +0000
Received: from 7add157299b2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 580ADE7E-2AC5-4E8C-AFF3-34AC6270CBCA.1; 
 Tue, 24 May 2022 08:16:27 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7add157299b2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 08:16:27 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB7192.eurprd08.prod.outlook.com (2603:10a6:20b:407::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 08:16:25 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5273.022; Tue, 24 May 2022
 08:16:25 +0000
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
X-Inumbo-ID: d777216b-db39-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QtTNyeZ/vrtPVHxljrDvu1nBfa3xiqaUBw3wriJAO50WFMgm9kvxEAKFL/zwBOG6Z09dR2P1Ups6hsDUFJwIFYeThgfhVOCuKbV+UVE7QuYzInWLMByyyYSDzCSyxBa7A7tycwGBPDwPnsYd+2YLdLSl0Rc44Eee/Xtqm7bdMgA8CKpkrX07pISvicorMPzdWZbOSLFsH1SbiBDkM3CxRPKeviulIfnEt9ECD9ADJyep4D3P9+sq0EZca8+9QvqKdytmmKxriaCZD+8tINJcUVG+6wqAuFm33f1jIIOjUdy9hDOOev+rW6tk1EOIkeitEkqYiaymG/ZeSK6meOrHVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRslCaqkSmqLBeZbFT77UwCcA7zwOMZv3Cw2FbW97zw=;
 b=ATpmxHOiPjvCKmTyj14jiElSYAI+4AsdtwuqprYJ4G+4L9noif0M9rmpOnc5CwWG4Xt/AlpGqMFQSRcCFCDHfDwN0Kjb/Gdnrg/FosFPia9PAiQ70hUn5LxeGFp5p9iU+Kq9GJuKqhEic5B7wusxSfsrtBvVS0AY4QYKvtlMP8lq1JzuV+ZQZRBdeGeH/9EQqCmWVAY3+ISdh3IG82eVXq6wwttyaR99DCaZihDPn128nMYT6/WWABKyNPk95hfLFQC2RvwFp+gC1lV62W6AL7p5canV2uRspfYeZocxXo/oLBzdwxsju9e6nEwOncTTZlzlpCKgBMoEZpJLrMwlFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRslCaqkSmqLBeZbFT77UwCcA7zwOMZv3Cw2FbW97zw=;
 b=73NUCyv0a1Q2vxcUayDXQx4jEBAAF6tXo9BpUY6YJNnSX6DhLS1qmYkWh0ZHDtpolLvi+I4ZY+79U4vuC5mifkHf+axvtky+cGwXPZeszrfMkYmD2jYFxCVcVDC9nFrPogJT7Q8T7I15iT1HWycdQKylGog8BLug3IHdmrrFeB4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXFnH+fCZzEaFDByLLikQShktGIb2X5TikFi3G3jmHPjhpScuNR2l5rFBSqXWyIV4aLf7N+jcA8Yms5FmRgQKqonByhx5RU6qKM3iCHzyzzEl/KRa7ki+AeqpB9MB6nqX1eNCmuwEG6QjEDcG9bzsr9nPBdJ37wVQPvqPNneYpJJ4P24RD7pHdpNwtHoMeGLISbUeyis0VQ9zVVZMUbuSt2tF8BH52Z0ZJQEIqrEUP0swmDu6L/XvGUfChkIvgDJHifowebz88WwI0oRIbs4uwJQonTaSFVuInZlC2HwtKCkN7AXXsf3DQIAbsLw7HgeViP0m2kN/YZ+Hnt+xtGEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRslCaqkSmqLBeZbFT77UwCcA7zwOMZv3Cw2FbW97zw=;
 b=Em8qPG9mgaibtAXNw9M74Ljyi4KvmXmxmMCBFUEPeD1DIAI/XdSvDCi0ZtcokyWz7VOStsC9A1J/vXKmoPXregiJ4jd+RQuBOLwOGGLHa91hg7I6+J1afmz9K40PTU1jdb5EFVxJgKgVefsfxUDnqQPjAC4tIfO9ku2w25x6VWzu10/QrOYfuum0/4tUvuxEtHE5yFpTjtnFSFWL4TJWsN86UI7UbNjxF3OJGRuzp4oUCCtTdXmNV+XBPlb9suFInnfjl0Q5TU4GGwMhoTmc9DIyWoWm9cEnV7EbP/HCQqXp96I+CDpOscJiexzbJTPxqCqv57GLdbD7hGM0FCPd/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRslCaqkSmqLBeZbFT77UwCcA7zwOMZv3Cw2FbW97zw=;
 b=73NUCyv0a1Q2vxcUayDXQx4jEBAAF6tXo9BpUY6YJNnSX6DhLS1qmYkWh0ZHDtpolLvi+I4ZY+79U4vuC5mifkHf+axvtky+cGwXPZeszrfMkYmD2jYFxCVcVDC9nFrPogJT7Q8T7I15iT1HWycdQKylGog8BLug3IHdmrrFeB4=
From: Wei Chen <Wei.Chen@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: RE: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Topic: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Index: AQHYbt50tGidbD5g50ygNS2KCABD4q0tOEpAgAB0coCAAADVMA==
Date: Tue, 24 May 2022 08:16:25 +0000
Message-ID:
 <PAXPR08MB7420EA90EFF303382953327E9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220523194953.70636-1-julien@xen.org>
 <PAXPR08MB74203220E82BEBB49540A7FE9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <21E706F6-0625-489B-AA19-278B58CD3537@arm.com>
In-Reply-To: <21E706F6-0625-489B-AA19-278B58CD3537@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 467E833A5D19644D91BF935DF49D9FB8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0a7d87b6-a5ea-4512-d7ba-08da3d5db996
x-ms-traffictypediagnostic:
	AS8PR08MB7192:EE_|VE1EUR03FT030:EE_|DB9PR08MB7130:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB71309FA83995C782BC7B394C9ED79@DB9PR08MB7130.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t5pgg+qMEtfRClay8j2DsVYS9SxLdu6dOWF2i5HMFrllqTs9u7ybfzklmdgj8UTififHu0vkET8kK7BQm/KNgQg5uSy7UbfDw6ve/r0bLspmGXv7XlkW9IXd2ObX5QaVdUkRPkrZuTmSSEYMjepZZToGAaG7EXsTpTUBbFcfn0ev3zjR+K/KM2TbIwhlC1/1DNbfe0TKK9AD7pS3c55TNzNP19Z1UNfSpIiiANo/ag/duiriSJaM49OuZVrv1w91l5eujAQ6OX0Cp3CZGsH/0T5zO948mnrJQZpLxTMXgPq+C3giRBDdwQVvcDQsyM72CWAUHyuTf43VJeWlnjx6MgKlcdBpO3fKwgJV8juqCm3WHuGsaA49jUgR8TS7A7TrHYmPrsYclh5br0o7iSh58kKYtKgtk++0hgCGNYKUoN2NxH36neWA5C/yWtJmD/3LQLjG2y+G+q/FZB0jSFA982dDlVDfA67sOSPcRp/6VmB18XOPY0MylG1c/tAJjo+fHm60sn38kODCYK4DrmY5COm4gDcX2xkcF9f4X4xQhwDfXapvp0ZTHl6I3xQ5mPkZXZcuC6gjGsEt4lqJqS/VSCZh1vzpTnQCR6RWRUzrE6TZsZ4laj1tnVtEZA2IyLGHhFkF5pkacUwxNsAC9pePXPM6bKnQz0/zyADBJYTKm/4R5qYkDkEHgCbxSK3AejcxCCT0mfBO6nkpFV8ObIfiJNO47XbXdBeuataMqfRKcAI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(52536014)(38070700005)(53546011)(83380400001)(5660300002)(8936002)(26005)(38100700002)(6506007)(9686003)(66946007)(6862004)(76116006)(4326008)(54906003)(66556008)(8676002)(66476007)(64756008)(66446008)(508600001)(2906002)(33656002)(6636002)(122000001)(86362001)(316002)(7696005)(71200400001)(55016003)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7192
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28c9f03f-1b1e-4e32-4007-08da3d5db1dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V4lWTzUevC+wHiFVGSupiqFMOBCCvdyBQEDgQj9Eouu9h73yLdRT7exLy4SjU4KXs28QBsJ8+A5XY7u+8tOgscE3LuiUUR/UaxQ8qPvTY3GSpqk1lplZq7+cSy6dxM0go1/oH+z6YEV/iXMNtMEKeUMAuMxlljJzI/FN768ZZ60Pw5Ref8fZ75kd989aqvZcXrWOzC7UrofY6CMOh5+65KdRD87PF1HEzWGDMJtDQbU2II6P/gn8KBkZtrjnl4mPPyAGr4RRHOplYlKoZ00Urt40LgxiYYFCMg+S/GqVoxaEDlsTH8tN1bC6VbXb7ghW3qvAE+HlRygxykmw92cokwJM7Z3hOR5MtVhe6S0TidentDrAGNfQ2LdeEg33TVlo94E2bcgKzsEdIeqRkU2LyRIPi3qffaROXA5iu/pgkVZKej5KsjSHbSE+2M0vLTyoJgcFst+NPnMHc/o9zqgsVvaP9LlUY5Rv5Dj6OzqsqKV+65BK4MpAqI2JkBKfaOY97Vam5hJUmBvcAVmodJN1+YMvm1iEJbrRbqVQuBtz2Jl8SUuSFg//tyaSM28Br8YQmplX5bTgWSj36kCVGwqNqr+hT64dfm7JDJeme3hYPi24c80tGJBI3bheit2KtdHGXSFNBCPyYJIijSroOZIFfZLGUZAXhxix1UUu8CMrYh5cszO8c6Dk7gesF/kemPys
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70586007)(70206006)(8936002)(186003)(107886003)(82310400005)(6862004)(5660300002)(53546011)(52536014)(83380400001)(336012)(8676002)(4326008)(33656002)(7696005)(36860700001)(6506007)(316002)(54906003)(9686003)(356005)(55016003)(508600001)(26005)(6636002)(2906002)(47076005)(81166007)(86362001)(40460700003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 08:16:37.9863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7d87b6-a5ea-4512-d7ba-08da3d5db996
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7130

SGkgQmVydHJhbmQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTZW50OiAyMDIy5bm0
NeaciDI05pelIDE2OjA3DQo+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEp1bGllbg0KPiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+OyBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9s
b2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsNCj4gPGtvbnJh
ZC53aWxrQG9yYWNsZS5jb20+OyBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVuL2FybTogUmVtb3ZlIG1vc3Qgb2YgdGhl
ICpfVklSVF9FTkQgZGVmaW5lcw0KPiANCj4gSGkgV2VpLA0KPiANCj4gPiBPbiAyNCBNYXkgMjAy
MiwgYXQgMDI6MjksIFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPiB3cm90ZToNCj4gPg0KPiA+
IEhpIEp1bGllbiwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBG
cm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBP
biBCZWhhbGYgT2YNCj4gPj4gSnVsaWVuIEdyYWxsDQo+ID4+IFNlbnQ6IDIwMjLlubQ15pyIMjTm
l6UgMzo1MA0KPiA+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IENj
OiBqdWxpZW5AeGVuLm9yZzsgSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT47IFN0ZWZh
bm8NCj4gU3RhYmVsbGluaQ0KPiA+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5k
IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+ID4+IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0K
PiA+PiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0hdIHhlbi9hcm06IFJlbW92ZSBt
b3N0IG9mIHRoZSAqX1ZJUlRfRU5EIGRlZmluZXMNCj4gPj4NCj4gPj4gRnJvbTogSnVsaWVuIEdy
YWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gPj4NCj4gPj4gQXQgdGhlIG1vbWVudCwgKl9WSVJU
X0VORCBtYXkgZWl0aGVyIHBvaW50IHRvIHRoZSBhZGRyZXNzIGFmdGVyIHRoZSBlbmQNCj4gPj4g
b3IgdGhlIGxhc3QgYWRkcmVzcyBvZiB0aGUgcmVnaW9uLg0KPiA+Pg0KPiA+PiBUaGUgbGFjayBv
ZiBjb25zaXN0ZW5jeSBtYWtlIHF1aXRlIGRpZmZpY3VsdCB0byByZWFzb24gd2l0aCB0aGVtLg0K
PiA+Pg0KPiA+PiBGdXJ0aGVybW9yZSwgdGhlcmUgaXMgYSByaXNrIG9mIG92ZXJmbG93IGluIHRo
ZSBjYXNlIHdoZXJlIHRoZSBhZGRyZXNzDQo+ID4+IHBvaW50cyBwYXN0IHRvIHRoZSBlbmQuIEkg
YW0gbm90IGF3YXJlIG9mIGFueSBjYXNlcywgc28gdGhpcyBpcyBvbmx5IGENCj4gPj4gbGF0ZW50
IGJ1Zy4NCj4gPj4NCj4gPj4gU3RhcnQgdG8gc29sdmUgdGhlIHByb2JsZW0gYnkgcmVtb3Zpbmcg
YWxsIHRoZSAqX1ZJUlRfRU5EIGV4Y2x1c2l2ZWx5DQo+IHVzZWQNCj4gPj4gYnkgdGhlIEFybSBj
b2RlIGFuZCBhZGQgKl9WSVJUX1NJWkUgd2hlbiBpdCBpcyBub3QgcHJlc2VudC4NCj4gPj4NCj4g
Pj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVuYW1lIEJPT1RfRkRUX1NMT1RfU0laRSB0byBC
T09UX0ZEVF9WSVJUX1NJWkUNCj4gPj4gZm9yIGJldHRlciBjb25zaXN0ZW5jeSBhbmQgdXNlIF9B
VCh2YWRkcl90LCApLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPg0KPiA+Pg0KPiA+PiAtLS0tDQo+ID4+DQo+ID4+IEkgbm90aWNlZCB0
aGF0IGEgZmV3IGZ1bmN0aW9ucyBpbiBYZW4gZXhwZWN0IFtzdGFydCwgZW5kWy4gVGhpcyBpcw0K
PiByaXNreQ0KPiA+PiBhcyB3ZSBtYXkgZW5kIHVwIHdpdGggZW5kIDwgc3RhcnQgaWYgdGhlIHJl
Z2lvbiBpcyBkZWZpbmVkIHJpZ2h0IGF0IHRoZQ0KPiA+PiB0b3Agb2YgdGhlIGFkZHJlc3Mgc3Bh
Y2UuDQo+ID4+DQo+ID4+IEkgaGF2ZW4ndCB5ZXQgdGFja2xlIHRoaXMgaXNzdWUuIEJ1dCBJIHdv
dWxkIGF0IGxlYXN0IGxpa2UgdG8gZ2V0IHJpZA0KPiA+PiBvZiAqX1ZJUlRfRU5ELg0KPiA+PiAt
LS0NCj4gPj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NvbmZpZy5oIHwgMTggKysrKysrKyst
LS0tLS0tLS0tDQo+ID4+IHhlbi9hcmNoL2FybS9saXZlcGF0Y2guYyB8IDIgKy0NCj4gPj4geGVu
L2FyY2gvYXJtL21tLmMgfCAxMyArKysrKysrKy0tLS0tDQo+ID4+IDMgZmlsZXMgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnLmgNCj4gPj4gYi94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vY29uZmlnLmgNCj4gPj4gaW5kZXggM2UyYTU1YTkxMDU4Li42NmRiNjE4YjM0
ZTcgMTAwNjQ0DQo+ID4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jb25maWcuaA0K
PiA+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnLmgNCj4gPj4gQEAgLTEx
MSwxMiArMTExLDExIEBADQo+ID4+ICNkZWZpbmUgRklYTUFQX0FERFIobikgKF9BVCh2YWRkcl90
LDB4MDA0MDAwMDApICsgKG4pICogUEFHRV9TSVpFKQ0KPiA+Pg0KPiA+PiAjZGVmaW5lIEJPT1Rf
RkRUX1ZJUlRfU1RBUlQgX0FUKHZhZGRyX3QsMHgwMDYwMDAwMCkNCj4gPj4gLSNkZWZpbmUgQk9P
VF9GRFRfU0xPVF9TSVpFIE1CKDQpDQo+ID4+IC0jZGVmaW5lIEJPT1RfRkRUX1ZJUlRfRU5EIChC
T09UX0ZEVF9WSVJUX1NUQVJUICsgQk9PVF9GRFRfU0xPVF9TSVpFKQ0KPiA+PiArI2RlZmluZSBC
T09UX0ZEVF9WSVJUX1NJWkUgX0FUKHZhZGRyX3QsIE1CKDQpKQ0KPiA+Pg0KPiA+PiAjaWZkZWYg
Q09ORklHX0xJVkVQQVRDSA0KPiA+PiAjZGVmaW5lIExJVkVQQVRDSF9WTUFQX1NUQVJUIF9BVCh2
YWRkcl90LDB4MDBhMDAwMDApDQo+ID4+IC0jZGVmaW5lIExJVkVQQVRDSF9WTUFQX0VORCAoTElW
RVBBVENIX1ZNQVBfU1RBUlQgKyBNQigyKSkNCj4gPj4gKyNkZWZpbmUgTElWRVBBVENIX1ZNQVBf
U0laRSBfQVQodmFkZHJfdCwgTUIoMikpDQo+ID4+ICNlbmRpZg0KPiA+Pg0KPiA+PiAjZGVmaW5l
IEhZUEVSVklTT1JfVklSVF9TVEFSVCBYRU5fVklSVF9TVEFSVA0KPiA+PiBAQCAtMTMyLDE4ICsx
MzEsMTggQEANCj4gPj4gI2RlZmluZSBGUkFNRVRBQkxFX1ZJUlRfRU5EIChGUkFNRVRBQkxFX1ZJ
UlRfU1RBUlQgKyBGUkFNRVRBQkxFX1NJWkUgLQ0KPiA+PiAxKQ0KPiA+Pg0KPiA+PiAjZGVmaW5l
IFZNQVBfVklSVF9TVEFSVCBfQVQodmFkZHJfdCwweDEwMDAwMDAwKQ0KPiA+PiArI2RlZmluZSBW
TUFQX1ZJUlRfU0laRSBfQVQodmFkZHJfdCwgR0IoMSkgLSBNQigyNTYpKQ0KPiA+Pg0KPiA+PiAj
ZGVmaW5lIFhFTkhFQVBfVklSVF9TVEFSVCBfQVQodmFkZHJfdCwweDQwMDAwMDAwKQ0KPiA+PiAt
I2RlZmluZSBYRU5IRUFQX1ZJUlRfRU5EIF9BVCh2YWRkcl90LDB4N2ZmZmZmZmYpDQo+ID4+IC0j
ZGVmaW5lIERPTUhFQVBfVklSVF9TVEFSVCBfQVQodmFkZHJfdCwweDgwMDAwMDAwKQ0KPiA+PiAt
I2RlZmluZSBET01IRUFQX1ZJUlRfRU5EIF9BVCh2YWRkcl90LDB4ZmZmZmZmZmYpDQo+ID4+ICsj
ZGVmaW5lIFhFTkhFQVBfVklSVF9TSVpFIF9BVCh2YWRkcl90LCBHQigxKSkNCj4gPj4NCj4gPj4g
LSNkZWZpbmUgVk1BUF9WSVJUX0VORCBYRU5IRUFQX1ZJUlRfU1RBUlQNCj4gPj4gKyNkZWZpbmUg
RE9NSEVBUF9WSVJUX1NUQVJUIF9BVCh2YWRkcl90LDB4ODAwMDAwMDApDQo+ID4+ICsjZGVmaW5l
IERPTUhFQVBfVklSVF9TSVpFIF9BVCh2YWRkcl90LCBHQigyKSkNCj4gPj4NCj4gPj4gI2RlZmlu
ZSBET01IRUFQX0VOVFJJRVMgMTAyNCAvKiAxMDI0IDJNQiBtYXBwaW5nIHNsb3RzICovDQo+ID4+
DQo+ID4+IC8qIE51bWJlciBvZiBkb21oZWFwIHBhZ2V0YWJsZSBwYWdlcyByZXF1aXJlZCBhdCB0
aGUgc2Vjb25kIGxldmVsICgyTUINCj4gPj4gbWFwcGluZ3MpICovDQo+ID4+IC0jZGVmaW5lIERP
TUhFQVBfU0VDT05EX1BBR0VTICgoRE9NSEVBUF9WSVJUX0VORCAtIERPTUhFQVBfVklSVF9TVEFS
VCArDQo+ID4+IDEpID4+IEZJUlNUX1NISUZUKQ0KPiA+PiArI2RlZmluZSBET01IRUFQX1NFQ09O
RF9QQUdFUyAoRE9NSEVBUF9WSVJUX1NJWkUgPj4gRklSU1RfU0hJRlQpDQo+ID4+DQo+ID4+ICNl
bHNlIC8qIEFSTV82NCAqLw0KPiA+Pg0KPiA+PiBAQCAtMTUyLDEyICsxNTEsMTEgQEANCj4gPj4g
I2RlZmluZSBTTE9UMF9FTlRSWV9TSVpFIFNMT1QwKDEpDQo+ID4+DQo+ID4+ICNkZWZpbmUgVk1B
UF9WSVJUX1NUQVJUIEdCKDEpDQo+ID4+IC0jZGVmaW5lIFZNQVBfVklSVF9FTkQgKFZNQVBfVklS
VF9TVEFSVCArIEdCKDEpKQ0KPiA+PiArI2RlZmluZSBWTUFQX1ZJUlRfU0laRSBHQigxKQ0KPiA+
Pg0KPiA+PiAjZGVmaW5lIEZSQU1FVEFCTEVfVklSVF9TVEFSVCBHQigzMikNCj4gPj4gI2RlZmlu
ZSBGUkFNRVRBQkxFX1NJWkUgR0IoMzIpDQo+ID4+ICNkZWZpbmUgRlJBTUVUQUJMRV9OUiAoRlJB
TUVUQUJMRV9TSVpFIC8gc2l6ZW9mKCpmcmFtZV90YWJsZSkpDQo+ID4+IC0jZGVmaW5lIEZSQU1F
VEFCTEVfVklSVF9FTkQgKEZSQU1FVEFCTEVfVklSVF9TVEFSVCArIEZSQU1FVEFCTEVfU0laRSAt
DQo+ID4+IDEpDQo+ID4+DQo+ID4+ICNkZWZpbmUgRElSRUNUTUFQX1ZJUlRfU1RBUlQgU0xPVDAo
MjU2KQ0KPiA+PiAjZGVmaW5lIERJUkVDVE1BUF9TSVpFIChTTE9UMF9FTlRSWV9TSVpFICogKDI2
NS0yNTYpKQ0KPiA+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jIGIveGVu
L2FyY2gvYXJtL2xpdmVwYXRjaC5jDQo+ID4+IGluZGV4IDc1ZThhZGNmZDZhMS4uNTdhYmM3NDZl
NjBiIDEwMDY0NA0KPiA+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMNCj4gPj4gKysr
IGIveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jDQo+ID4+IEBAIC0xNzUsNyArMTc1LDcgQEAgdm9p
ZCBfX2luaXQgYXJjaF9saXZlcGF0Y2hfaW5pdCh2b2lkKQ0KPiA+PiB2b2lkICpzdGFydCwgKmVu
ZDsNCj4gPj4NCj4gPj4gc3RhcnQgPSAodm9pZCAqKUxJVkVQQVRDSF9WTUFQX1NUQVJUOw0KPiA+
PiAtIGVuZCA9ICh2b2lkICopTElWRVBBVENIX1ZNQVBfRU5EOw0KPiA+PiArIGVuZCA9IHN0YXJ0
ICsgTElWRVBBVENIX1ZNQVBfU0laRTsNCj4gPj4NCj4gPj4gdm1faW5pdF90eXBlKFZNQVBfWEVO
LCBzdGFydCwgZW5kKTsNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5j
IGIveGVuL2FyY2gvYXJtL21tLmMNCj4gPj4gaW5kZXggYmUzNzE3NmE0NzI1Li4wNjA3YzY1Zjk1
Y2QgMTAwNjQ0DQo+ID4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jDQo+ID4+ICsrKyBiL3hlbi9h
cmNoL2FybS9tbS5jDQo+ID4+IEBAIC0xMjgsOSArMTI4LDExIEBAIHN0YXRpYyBERUZJTkVfUEFH
RV9UQUJMRSh4ZW5fZmlyc3QpOw0KPiA+PiAvKiB4ZW5fcGd0YWJsZSA9PSByb290IG9mIHRoZSB0
cmllICh6ZXJvZXRoIGxldmVsIG9uIDY0LWJpdCwgZmlyc3Qgb24NCj4gMzItDQo+ID4+IGJpdCkg
Ki8NCj4gPj4gc3RhdGljIERFRklORV9QRVJfQ1BVKGxwYWVfdCAqLCB4ZW5fcGd0YWJsZSk7DQo+
ID4+ICNkZWZpbmUgVEhJU19DUFVfUEdUQUJMRSB0aGlzX2NwdSh4ZW5fcGd0YWJsZSkNCj4gPj4g
LS8qIHhlbl9kb21tYXAgPT0gcGFnZXMgdXNlZCBieSBtYXBfZG9tYWluX3BhZ2UsIHRoZXNlIHBh
Z2VzIGNvbnRhaW4NCj4gPj4gKy8qDQo+ID4+ICsgKiB4ZW5fZG9tbWFwID09IHBhZ2VzIHVzZWQg
YnkgbWFwX2RvbWFpbl9wYWdlLCB0aGVzZSBwYWdlcyBjb250YWluDQo+ID4+ICogdGhlIHNlY29u
ZCBsZXZlbCBwYWdldGFibGVzIHdoaWNoIG1hcCB0aGUgZG9taGVhcCByZWdpb24NCj4gPj4gLSAq
IERPTUhFQVBfVklSVF9TVEFSVC4uLkRPTUhFQVBfVklSVF9FTkQgaW4gMk1CIGNodW5rcy4gKi8N
Cj4gPj4gKyAqIHN0YXJ0aW5nIGF0IERPTUhFQVBfVklSVF9TVEFSVCBpbiAyTUIgY2h1bmtzLg0K
PiA+PiArICovDQo+ID4+IHN0YXRpYyBERUZJTkVfUEVSX0NQVShscGFlX3QgKiwgeGVuX2RvbW1h
cCk7DQo+ID4+IC8qIFJvb3Qgb2YgdGhlIHRyaWUgZm9yIGNwdTAsIG90aGVyIENQVSdzIFBUcyBh
cmUgZHluYW1pY2FsbHkgYWxsb2NhdGVkDQo+ID4+ICovDQo+ID4+IHN0YXRpYyBERUZJTkVfUEFH
RV9UQUJMRShjcHUwX3BndGFibGUpOw0KPiA+PiBAQCAtNDc2LDcgKzQ3OCw3IEBAIG1mbl90IGRv
bWFpbl9wYWdlX21hcF90b19tZm4oY29uc3Qgdm9pZCAqcHRyKQ0KPiA+PiBpbnQgc2xvdCA9ICh2
YSAtIERPTUhFQVBfVklSVF9TVEFSVCkgPj4gU0VDT05EX1NISUZUOw0KPiA+PiB1bnNpZ25lZCBs
b25nIG9mZnNldCA9ICh2YT4+VEhJUkRfU0hJRlQpICYgWEVOX1BUX0xQQUVfRU5UUllfTUFTSzsN
Cj4gPj4NCj4gPj4gLSBpZiAoIHZhID49IFZNQVBfVklSVF9TVEFSVCAmJiB2YSA8IFZNQVBfVklS
VF9FTkQgKQ0KPiA+PiArIGlmICggKHZhID49IFZNQVBfVklSVF9TVEFSVCkgJiYgKChWTUFQX1ZJ
UlRfU1RBUlQgLSB2YSkgPA0KPiA+PiBWTUFQX1ZJUlRfU0laRSkgKQ0KPiA+PiByZXR1cm4gdmly
dF90b19tZm4odmEpOw0KPiA+Pg0KPiA+PiBBU1NFUlQoc2xvdCA+PSAwICYmIHNsb3QgPCBET01I
RUFQX0VOVFJJRVMpOw0KPiA+PiBAQCAtNTcwLDcgKzU3Miw4IEBAIHZvaWQgX19pbml0IHJlbW92
ZV9lYXJseV9tYXBwaW5ncyh2b2lkKQ0KPiA+PiBpbnQgcmM7DQo+ID4+DQo+ID4+IC8qIGRlc3Ry
b3kgdGhlIF9QQUdFX0JMT0NLIG1hcHBpbmcgKi8NCj4gPj4gLSByYyA9IG1vZGlmeV94ZW5fbWFw
cGluZ3MoQk9PVF9GRFRfVklSVF9TVEFSVCwgQk9PVF9GRFRfVklSVF9FTkQsDQo+ID4+ICsgcmMg
PSBtb2RpZnlfeGVuX21hcHBpbmdzKEJPT1RfRkRUX1ZJUlRfU1RBUlQsDQo+ID4+ICsgQk9PVF9G
RFRfVklSVF9TVEFSVCArIEJPT1RfRkRUX1ZJUlRfU0laRSwNCj4gPj4gX1BBR0VfQkxPQ0spOw0K
PiA+PiBCVUdfT04ocmMpOw0KPiA+PiB9DQo+ID4+IEBAIC04NTAsNyArODUzLDcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5ncyhwYWRkcl90IHBzLA0KPiA+PiBwYWRkcl90
IHBlKQ0KPiA+Pg0KPiA+PiB2b2lkICpfX2luaXQgYXJjaF92bWFwX3ZpcnRfZW5kKHZvaWQpDQo+
ID4+IHsNCj4gPj4gLSByZXR1cm4gKHZvaWQgKilWTUFQX1ZJUlRfRU5EOw0KPiA+PiArIHJldHVy
biAodm9pZCAqKShWTUFQX1ZJUlRfU1RBUlQgKyBWTUFQX1ZJUlRfU0laRSk7DQo+ID4NCj4gPiBJ
dCBzZWVtcyB5b3UgcHJlZmVyIHRvIHBvaW50IF9lbmQgdG8gdGhlIGFkZHJlc3MgYWZ0ZXIgdGhl
IGVuZC4gRXZlbg0KPiA+IHRob3VnaCB3ZSBnb3QgcmlkIG9mIHRoZSBtYWNybyBkZWZpbml0aW9u
IG9mIF9FTkQuIEJ1dCB3ZSBkaWRuJ3QgYWdyZWUNCj4gPiBvbiBob3cgdG8gdXNlIGl0LiBGb3Ig
bWUsIHdoZW4gSSBmaXJzdCBzYXcNCj4gPiAiZW5kID0gc3RhcnQgKyBMSVZFUEFUQ0hfVk1BUF9T
SVpFIiBJIHN1YmNvbnNjaW91c2x5IHRoaW5rIHRoZSAtMSBpcw0KPiA+IG1pc3NpbmcgaGVyZS4g
SSBldmVuIGFkZGVkIGEgY29tbWVudCwgYnV0IHJlbW92ZWQgaXQgd2hlbiBJIHJlYWNoZWQNCj4g
PiB0byB0aGlzIGxpbmUgOiApDQo+ID4gTWF5IGJlIGl0J3MgYmV0dGVyIHRvIHBsYWNlIHNvbWUg
Y29kZSBndWlkZSBmb3IgRU5EIGluIGNvZGUgY29tbWVudA0KPiA+IGluIHRoZSBTSVpFIGRlZmlu
aXRpb24sIG90aGVyd2lzZSwgd2UgbWF5IGhhdmUgZGlmZmVyZW50IHBvaW50IGFkZHJlc3Nlcw0K
PiA+IG9mIF9lbmQgZnVuY3Rpb25zLg0KPiANCj4gSSB0aGluayBpdCBpcyBxdWl0ZSBjb21tb24g
dG8gaGF2ZSBzaXplIGJlaW5nIHRoZSBhY3R1YWwgc2l6ZSBhbmQgbm90IHNpemUNCj4gLTEuDQo+
IEVORCBpcyBjbGVhcmx5IHRoZSBsYXN0IGFkZHJlc3Mgb2YgdGhlIGFyZWEgYnV0IFNJWkUgc2hv
dWxkIGJlIHRoZSBudW1iZXINCj4gb2YgYnl0ZXMgaW4gdGhlIGFyZWEgc28gSSB0aGluayBKdWxp
ZW4gaGVyZSBpcyByaWdodC4NCj4gDQoNCk1heWJlIEkgZGlkbid0IGRlc2NyaWJlIGl0IGNsZWFy
bHkgOiApDQpJIGFncmVlIHdpdGggdGhlIFNJWkUgdGhhdCBKdWxpZW4gaGFzIGRvbmUuIE15IGNv
bmNlcm4gaXMgdGhhdCwgc2hvdWxkIHdlDQpuZWVkIGEgZ3VpZGUgbGluZSBmb3IgaG93IHRvIHVz
ZSB0aGUgU0laRSB0byBjYWxjdWxhdGUgRU5EPw0KRm9yIGV4YW1wbGUsIGluIHRoaXMgcGF0Y2gs
IEp1bGllbiBpcyB1c2luZyBFTkQ9U1RBUlQrU0laRSwgdGhlbiBFTkQgaXMNCnBvaW50aW5nIHRv
IHRoZSBhZGRyZXNzIGFmdGVyIHRoZSBlbmQuIEJ1dCBmb3IgbWUsIEkgaW50ZW5kIHRvIHVzZQ0K
RU5EPVNUQVJUK1NJWkUtMSwgYmVjYXVzZSBJIHdhbnQgdGhlIEVORCBwb2ludCB0byB0aGUgbGFz
dCBhZGRyZXNzLg0KDQpPdmVyIHRpbWUsIHdoZW4gdGhlcmUgYXJlIGEgbG90IG9mIGdldF94eHhf
ZW5kIGZ1bmN0aW9ucyBpbiB0aGUgY29kZSwNCnRoZWlyIGFjdHVhbCBtZWFuaW5ncyB3aWxsIGJl
IGRpZmZlcmVudCwganVzdCBhcyBjb25mdXNpbmcgYXMgdGhlIHByZXZpb3VzDQptYWNybyBkZWZp
bml0aW9ucw0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+IENoZWVycw0KPiBCZXJ0cmFuZA0KPiAN
Cj4gPg0KPiA+IENoZWVycywNCj4gPiBXZWkgQ2hlbg0KPiA+DQo+ID4+IH0NCj4gPj4NCj4gPj4g
LyoNCj4gPj4gLS0NCj4gPj4gMi4zMi4wDQo+IA0KDQo=

