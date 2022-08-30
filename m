Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E035A5F17
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 11:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394910.634503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSxNk-0004Q5-3c; Tue, 30 Aug 2022 09:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394910.634503; Tue, 30 Aug 2022 09:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSxNk-0004Ot-0F; Tue, 30 Aug 2022 09:18:04 +0000
Received: by outflank-mailman (input) for mailman id 394910;
 Tue, 30 Aug 2022 09:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y69e=ZC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oSxNj-0004O2-61
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 09:18:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a543f2a9-2844-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 11:18:01 +0200 (CEST)
Received: from AM5PR0601CA0080.eurprd06.prod.outlook.com (2603:10a6:206::45)
 by AS8PR08MB7693.eurprd08.prod.outlook.com (2603:10a6:20b:50b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 09:17:59 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::e8) by AM5PR0601CA0080.outlook.office365.com
 (2603:10a6:206::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 30 Aug 2022 09:17:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 09:17:59 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Tue, 30 Aug 2022 09:17:59 +0000
Received: from dd582148aecf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1202B6B1-DBC8-40E2-BCD2-DFA46E7DA6F9.1; 
 Tue, 30 Aug 2022 09:17:48 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dd582148aecf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Aug 2022 09:17:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9055.eurprd08.prod.outlook.com (2603:10a6:102:343::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Tue, 30 Aug
 2022 09:17:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 09:17:37 +0000
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
X-Inumbo-ID: a543f2a9-2844-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AkIYCNHTe44POMlsFNnT/bHMREggUiRhk+UFaPAVIFeupez9dXv9X7SWDikFMMK8A0LEqgqRYqUQCh68PL6USrckTncjDhWRtFf6OoV72s3+jFmwicdWnwtW1Vfq6chiuvQdFAC+2KaHZuxVyDIFdtoEF//3xzPa41nf9dLrizlrVDpeNZbtXiSz5hkFJMl0DkKF4fr6XJQLJ7rOu1X6RjUWDwF3LV7orRM9a0jFqus1BVGzLGd5ocNGyJP8W5jIKnoNtdf/ABM4jF5ZHNNnrM1g197xVtdNKZc8+fzQjzD1bzYDW7PqwyYoBR3TuHwgjDBEIYo8lHqQ/7t/dclMuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4CXnsArGcDUZI14zv4DeQPs0Vt2NmkQTfi4JcXNyIs=;
 b=e7jIW8z4EYlvjOSXzSRumHmld6jNObh+s8O81kXTFmOgE8DZT3huEnyisXGBO2OZ7KtcMSG+k6tVxdrofkRraf7imCQUvahq6W8xO9dBrR/NiJUuaPVGWJEtcCivVjkBrbnvwHjL1nyiTEJgwOSgTQ2vX6k9lnBGcYvbeYL4CfgY1UMk67IeRBO5f6hCFEmM8En2Au7pFHH1S0J3HLUc7MZE6SaY9dZhGlF+WnlwMNidy589buZdwWWypfURZcNW2Pf4WY///7c2ObUTJLeDblFel1wYq787crdh3GfBv75FftzGXmXzbdLOF0tBIs24zGIAZkHIi97QqCJeN+a6VQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4CXnsArGcDUZI14zv4DeQPs0Vt2NmkQTfi4JcXNyIs=;
 b=Z2HaRsDeYlq2oRQoJgeBousSXWqEgVFhTZPFG/mncMSAYTDdGOsKjmUTb0yxEx/g+/oL9/owwFy7kOb8qonKJM/YCYlmX382OKJP7Og8jjRHtjCMFwU/EP7oo0pVcj2/q4c3fBkL87LQikUrCE8+b02PPVeloruNFk3bYvqfLvA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nzn8ZSCWab7uoCuDc16nzPDwgdoeZ9rBMrMW50kf6aJPAx77D5El9lURgG5jSgvdMXNNPNjc9giWw7RRVXUKX8U6fliM2veDW5Fy2m3JF+Jl+sUTtkUcEK/NfcMf6euWYhMuuy7uCUu0IUpb4Oxm9Qq/nrWk9P3NlTcd00J61h4mJHl0EAKLxLvstbvZjH363n2//dVnLcpkhlRFkVdge240zCs1yFxI7F1sheKKRm1zldHjivvfed2r46w06dL+b9BHhd6vI5Zw6j3f0sBPT3celriqGfbW7QlbT9n/9/RglaNcwu8CryYO49UvSn99keXrkxNXN1ASG4UApJt0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4CXnsArGcDUZI14zv4DeQPs0Vt2NmkQTfi4JcXNyIs=;
 b=cOkA1gO9YxyDh63Pap4jbuyzuygoeRnMxmu//mHJaYzEjKz5rravsQTjavnXrPiJQW+mQ9wYHd2uB0usnfMPjmo4RvtgSpYtc2rkSkX49h5bvHom1ofU9vrUuQWuL6OesX4wBPSr1MIjz8NbMr+Z2alw+rMhJ4H7N2fud3jEtjMDawCHSm1765a2oGgu++FlcH9fYKyuF/2NlIXb9Wfmx0wwgb8k2ORE+ch0UUL9L48JKon1ZopBnhGHB7yxU0Q8qT/tuSayThH58Qp/aFfTVqYb08GhZkzXqz+DDxbUYGfps0DkCmdwuY+Uev+z2RBtP+GcMCDEY3gy2kS9kn7U1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4CXnsArGcDUZI14zv4DeQPs0Vt2NmkQTfi4JcXNyIs=;
 b=Z2HaRsDeYlq2oRQoJgeBousSXWqEgVFhTZPFG/mncMSAYTDdGOsKjmUTb0yxEx/g+/oL9/owwFy7kOb8qonKJM/YCYlmX382OKJP7Og8jjRHtjCMFwU/EP7oo0pVcj2/q4c3fBkL87LQikUrCE8+b02PPVeloruNFk3bYvqfLvA=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index:
 AQHYt4ugTfbCAM/WyEil7pMplK0r3q2/e0SAgAeAsxCAABaogIAAAyrggAAVl4CAAAH9oA==
Date: Tue, 30 Aug 2022 09:17:36 +0000
Message-ID:
 <AS8PR08MB7991C3859BA3BAF913D50E1C92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
 <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <536cad9e-53b5-2eae-0cd4-06f899229470@amd.com>
In-Reply-To: <536cad9e-53b5-2eae-0cd4-06f899229470@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1E9E8BCD29A7844BB5F42E8323C6C6C0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3df6ddfb-3776-4d44-0849-08da8a68884f
x-ms-traffictypediagnostic:
	PAWPR08MB9055:EE_|AM7EUR03FT029:EE_|AS8PR08MB7693:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1d3v3uwB/vTn4v3kI/VJRww8hLB0w0cMGn0Ym8RCTSQFuqNRnhI2BK9gaW3mI8C5Q6UypkylRvWGCB+J8fWOag0FSBsalKS1/5uS5vfzv0o7XytNKf8ti0WnfgrkLO7dxryvx6ecXeRciMSufZEGSh3SY/2w9q+MF1v0pYU4Tp2ep0p72g0AgSusqP8rrZBuasXDALOfbY7dnGBYwYoTrSKqnwS6D2RKe6e46VB2op+EnGVp3EYl+eyvArJpyGfyJW0TcculDW4HCRf+aegnCXkGg22usjzE8mQX96kbcuZEGYNf4ByFrqDhsW94wuc05LF3UmevyHQklv9jesik7Pkt6F3DmVQPFcTiyPlSGgJIo5DZE0FrmCDHjk4xnxjb64cvd5OIpvOkcBwn28vL9N/QQG6ejwsGxNER4Tl7bEXJLGBSBN+X3hqV/aEBYxA2McrsQo9hAYPMnGC+FFKjVSNvXYgAuRihm2pC2mRCz/H23Puk8rIdVM2lS2J3TxaJBI8iZJSdH6J224tMHkis63dMDTo8RDFH8Sg8mYiZNn9Aqvxqis9yCOFvKFiDVKoOWaTr2sYl09SNF34LXWngsNk2YNlVeHGtyfNgR8zZRbFFx9uuqOfaPIpOysfNTI5dYbEvr1ALEZyyDQlbhH3ktCHOfK4+PYvQqrqkHysG04O30q6l3l2+U1AtgZWw2l11vQqjtPdZ6E3JWrlb4sxbCnX2VCw0VzbC599F1hOxiHG60XkU4Wp6svM4Lgw3mW1mWX4SBS1MpNKyn5Pg7D7H2Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(186003)(33656002)(38100700002)(6506007)(71200400001)(316002)(2906002)(83380400001)(7696005)(26005)(9686003)(86362001)(38070700005)(55016003)(122000001)(8936002)(52536014)(478600001)(41300700001)(54906003)(110136005)(5660300002)(66946007)(66476007)(4326008)(64756008)(66446008)(8676002)(76116006)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9055
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7b981fef-f289-413e-d4e8-08da8a687ac0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6bFM5L0odnv9usDjh1GuJBEeFNfhPq1kqQ8C6+N3ExeTX9ZrK+Bsb+nTQK+2RJTdqbfdM4nzBg//KsHM+ojpOBL246J8vqAg+dENpx2eN/q0UvdJggq6gxlI1XHc3CHK/RxMMh7cL47H3O3CbQYbcKKjQXtXOf60r1bXzeugLOCsP9mNOmvFZyeEnllGxvj5QtbMTIG4jkUAPGkFEYrEp+z48y+0OptS+FMshrfmMiVTSpazbIydivpVJtXqZUAi9l26SLtqgLp9bE1Oq456U89q9HjXvw9CQbwYH3LSpYWSAo/BgQQKb486cEjL5akV4NpXP7yeftXsFqJakE6Rhb+01koabrtbEBykwaL5COn9r3nNfPMNTKWSODOYhOB6lphJb4VqZ8vbl+xW8SrJwxPZQM/FuNikmxbH9E9hhj7f4KhLzkGhacgkifFWRKw9FDvBbWEFBAvkrOoI4pw0V8sXFHTQcGwZVp0Hz6yX2wYHvUX5YgpK77cmB8ASDrzeE4nRUipRaQEA4jioqCQY9PS7MnDB8yZNE36GJ9pqFLYsD3aMsIwWEGCMnmk0FN9VbBGx5T7vdpWBRjKlIsTeoMYOvjZOASxNQsQv1rgcPHCiXOlta1Gu0s3XK61CfIoQXXNKOtnPZn0EcTZoK5s8RrLZv+L0ehkxwdjcY09e03doqdPj0dbIVcEdOqwf0v/t/1aIHFiiK3Mm6q2rtV1GYUHHTIx/pCigQ6DNp0sx93oJP2pczrSzpRVKHKXzmNd5rnmiO9SlAeYhqFluf5NEKg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(36840700001)(40470700004)(41300700001)(7696005)(478600001)(6506007)(107886003)(26005)(186003)(83380400001)(47076005)(336012)(82310400005)(2906002)(55016003)(8936002)(52536014)(5660300002)(110136005)(40460700003)(40480700001)(316002)(9686003)(54906003)(70586007)(8676002)(70206006)(356005)(4326008)(81166007)(86362001)(82740400003)(36860700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 09:17:59.3678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df6ddfb-3776-4d44-0849-08da8a68884f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7693

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4+IFRoaXMgaXMgdG90YWxseSBmaW5l
LiBXaGF0IEkgbWVhbiBpcyB0aGF0IHRoZSBjaGVjayB5b3UgaW50cm9kdWNlZCBkb2VzIG5vdA0K
PiA+PiBjb3JyZXNwb25kDQo+ID4+IHRvIHRoZSBwYW5pYyBtZXNzYWdlIGJlbG93LiBJbiBjYXNl
IG9mIHJlc2VydmVkIGhlYXAsIGl0cyBzaXplIGlzIHNlbGVjdGVkDQo+IGJ5DQo+ID4+IHRoZSB1
c2VyLg0KPiA+PiAiTm90IGVub3VnaCBzcGFjZSBmb3IgeGVuaGVhcCIgbWVhbnMgdGhhdCB0aGVy
ZSBpcyBub3QgZW5vdWdoIHNwYWNlIHRvDQo+IGJlDQo+ID4+IHJlc2VydmVkIGZvciBoZWFwLA0K
PiA+PiBtZWFuaW5nIGl0cyBzaXplIGlzIHRvbyBsYXJnZS4gQnV0IHlvdXIgY2hlY2sgaXMgYWJv
dXQgc2l6ZSBiZWluZyB0b28gc21hbGwuDQo+ID4NCj4gPiBBY3R1YWxseSBteSB1bmRlcnN0YW5k
aW5nIG9mICJOb3QgZW5vdWdoIHNwYWNlIGZvciB4ZW5oZWFwIiBpcyB4ZW5oZWFwDQo+ID4gaXMg
dG9vIGxhcmdlIHNvIHdlIG5lZWQgdG8gcmVzZXJ2ZSBtb3JlIHNwYWNlLCB3aGljaCBpcyBzbGln
aHRseSBkaWZmZXJlbnQNCj4gdGhhbg0KPiA+IHlvdXIgb3Bpbmlvbi4gQnV0IEkgYW0gbm90IHRo
ZSBuYXRpdmUgc3BlYWtlciBzbyBpdCBpcyBoaWdobHkgbGlrZWx5IHRoYXQgSSBhbQ0KPiA+IG1h
a2luZyBtaXN0YWtlcy4uLg0KPiBNeSB1bmRlcnN0YW5kaW5nIGlzIGV4YWN0bHkgdGhlIHNhbWUg
YXMgeW91cnMgOiksDQo+IG1lYW5pbmcgaGVhcCBpcyB0b28gbGFyZ2UuDQoNCk9oIEkgdGhpbmsg
Z2V0IHlvdXIgcG9pbnQuIExldCBtZSB0cnkgdG8gZXhwbGFpbiBteXNlbGYgYW5kIHRoYW5rcyBm
b3IgeW91cg0KcGF0aWVuY2UgOikpDQoNClRoZSByZXNlcnZlZCBoZWFwIHJlZ2lvbiBkZWZpbmVk
IGluIHRoZSBkZXZpY2UgdHJlZSBzaG91bGQgYmUgdXNlZCBmb3IgYm90aA0KWGVuaGVhcCBhbmQg
ZG9tYWluIGhlYXAsIHNvIGlmIHdlIHJlc2VydmVkIGEgdG9vIHNtYWxsIHJlZ2lvbiAoPDMyTSks
DQphbiBlcnJvciBzaG91bGQgcG9wIGJlY2F1c2UgdGhlIHJlc2VydmVkIHJlZ2lvbiBpcyBub3Qg
ZW5vdWdoIGZvciB4ZW5oZWFwLA0KYW5kIHVzZXIgc2hvdWxkIHJlc2VydmUgbW9yZS4NClsuLi5d
DQoNCj4gQnV0IHlvdXIgY2hlY2sgaXMgYWdhaW5zdCBoZWFwIGJlaW5nIHRvIHNtYWxsIChsZXNz
IHRoYW4gMzJNKS4NCj4gU28gYmFzaWNhbGx5IGlmIHRoZSBmb2xsb3dpbmcgY2hlY2sgZmFpbHM6
DQo+ICIoIHJlc2VydmVkX2hlYXAgJiYgcmVzZXJ2ZWRfaGVhcF9wYWdlcyA8IDMyPDwoMjAtUEFH
RV9TSElGVCkgKSApIg0KPiBpdCBtZWFucyB0aGF0IHRoZSBoZWFwIHJlZ2lvbiBkZWZpbmVkIGJ5
IGEgdXNlciBpcyB0b28gc21hbGwgKG5vdCB0b28gbGFyZ2UpLA0KPiBiZWNhdXNlIGFjY29yZGlu
ZyB0byByZXF1aXJlbWVudHMgaXQgc2hvdWxkIGJlIGF0IGxlYXN0IDMyTS4NCg0KWy4uLl0NClNv
IGluIHRoYXQgY2FzZSwgcHJpbnRpbmcgIk5vdCBlbm91Z2ggc3BhY2UgZm9yIHhlbmhlYXAiIG1l
YW5zIHRoZSByZXNlcnZlZA0KcmVnaW9uIGNhbm5vdCBzYXRpc2Z5IHRoZSBtaW5pbWFsIHJlcXVp
cmVtZW50IG9mIHRoZSBzcGFjZSBvZiB4ZW5oZWFwIChhdCBsZWFzdA0KMzJNKSwgYW5kIHRoaXMg
aXMgaW4gY29uc2lzdGVudCB3aXRoIHRoZSBjaGVjay4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkN
Cg0KDQoNCg0KDQo=

