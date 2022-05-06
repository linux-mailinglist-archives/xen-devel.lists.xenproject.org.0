Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7AA51D6EC
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 13:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322960.544462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwNC-0004er-1p; Fri, 06 May 2022 11:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322960.544462; Fri, 06 May 2022 11:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwNB-0004bN-U3; Fri, 06 May 2022 11:43:49 +0000
Received: by outflank-mailman (input) for mailman id 322960;
 Fri, 06 May 2022 11:43:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjQo=VO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nmwNA-0004bH-U4
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 11:43:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca272749-cd31-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 13:43:47 +0200 (CEST)
Received: from DBBPR09CA0042.eurprd09.prod.outlook.com (2603:10a6:10:d4::30)
 by VE1PR08MB5006.eurprd08.prod.outlook.com (2603:10a6:803:113::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 11:43:43 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::29) by DBBPR09CA0042.outlook.office365.com
 (2603:10a6:10:d4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Fri, 6 May 2022 11:43:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 11:43:42 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Fri, 06 May 2022 11:43:42 +0000
Received: from e7368ddd322b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B220FD43-CA9A-48F2-BF41-3EE879EE918E.1; 
 Fri, 06 May 2022 11:43:31 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7368ddd322b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 May 2022 11:43:31 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16)
 by DBBPR08MB6059.eurprd08.prod.outlook.com (2603:10a6:10:202::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 11:43:27 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::d529:a34d:5df0:47ae]) by VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::d529:a34d:5df0:47ae%3]) with mapi id 15.20.5206.028; Fri, 6 May 2022
 11:43:27 +0000
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
X-Inumbo-ID: ca272749-cd31-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FckjDgDMccQb0C1CHBKH+5kGn0Nvni0IkkJuu9yC0xoyTMVoxjyaJxl0tj8oep4E98eOC9yoURlVzL12uSi+gMpHoSnw238WcYqC+QLe2kt3GakpGIVlq1plsnE1tLJHygbGEXR7GtK9Fj8SP+mD9ERvGpBN+c2/p1wJyFBPGMiM8rz4BX/74Ct7UuUurxq3F256K9n0FggGnBu10c/uEJx1o9jungbFO4KbNCaJwRwhvuKrQHVqvnKz3KD6sPQPZMzFyoC9NFZk/X7+V5RU4wHDWpccirpq02N/ZDTIhrnM73LjNbXIBupuEAtYvjrRYUcs+GlCgq26zblnmUNShQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXy3JtLng7ohu1dj92FGp1hY+RNsJ9Vt+cO9IyT1eQI=;
 b=aIaM4xUA8WXI0pfJooriG/vtjSZ2n+1QZBkWUqbwMfo0c9KLcOKyauBw7j5xdj4wC+0nyBSvfBGe6xsWiEb1hS/52IOxq5M8Tw3wQ2Tq8flhAl6EtSZWO8PEBo09Pj9Zzetluy1npfqSPvBUxWRWqOraLLacJrtS0UZC1NtBEwQYCE1LuIIBDuIKrxnmXdbxGMy0Vr773iVBEv7km3iaw4AZ8XYAgkgrj8AtPbYGj2Qdc9aHU/x4P/puWmF36iS+iqyxEpq+MDE48dN1Ya3de2Z1PDYk8BiGMnE4Whs4QbT2ENVgfZtJUSfI6Escqd6v64QUdcl/bLS5rwZIME4Scg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXy3JtLng7ohu1dj92FGp1hY+RNsJ9Vt+cO9IyT1eQI=;
 b=V/heoh6rliWkrxn08Gu203PUr/m7xYYYUb0axTVuWl3CoJZ3XLJir1MeUOVoEiS5wPfN7K/d9k6UMFwPaiu8RGLC1auZMOJZlL+PxkOuHneK+AS0SG95d0ocu2yJQam6HbOVA6kZEzxZPSxvEGs8Z8TuPiN/TXK3RYSqANoniD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22b35c96146ad874
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCRb3bXjg78sPFOwipwk3l/E0bnyQc5egu1o9UEETYTOJ+fwAS+HK2l5nZ+0FGUxNJ8AQg21sd7IahVOaqHNoshAsaA22ybfnM5ySP8qgar6c+RcAZ/8PKRfeJbwBKJ6wkK9zxUvbMSLVnLkbFdAw49XvIvmIaeGH8BTxQm+w/J8elmTQOBmUk2dg50aXXo0cpLkjaIk0majS5iV4Wff7XVPbVsXvi20rLcGHi4F4+a5zMUF1buL/DVvEqKcOtfK4dsC6Ph9AXBuv9nWFF+SaSzNBG9Y4HK/kvUtQs8pG/ecvNhmVB+IgplV2gjiC8gl+IeWg4MmvsMLpCGO7Z7TKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXy3JtLng7ohu1dj92FGp1hY+RNsJ9Vt+cO9IyT1eQI=;
 b=SeTKjBGkC0T3d+dD4AECYiWq07SQc5dv8hdXa06IhZdNTCV/6EOJGfXqDDYdTL+bexK5xaWPDtV8ADQywTW5q08H663aYqpSlGc6flWierXen0/8n0yZ08ztTes+cytMX6JWB2b2aYCeCt0QuIWpIIM3iIrT6FrWNbq4ZMs9HAClEscb3+ACcWzHdExxqAUvzEP4AIwYl41igeUZeLAVcSzmvAaPsuZuwt/aRAjOp8CUg8EX8DZZsZ5CL6DfIHuBD9+m2L7Ur3G6XinZT7TVEJx5fNU7I1lq57NQQUeTOrhK3j8SUX8ps34yXye8OofEkxsCa5+vqmO1ldqSWepf4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXy3JtLng7ohu1dj92FGp1hY+RNsJ9Vt+cO9IyT1eQI=;
 b=V/heoh6rliWkrxn08Gu203PUr/m7xYYYUb0axTVuWl3CoJZ3XLJir1MeUOVoEiS5wPfN7K/d9k6UMFwPaiu8RGLC1auZMOJZlL+PxkOuHneK+AS0SG95d0ocu2yJQam6HbOVA6kZEzxZPSxvEGs8Z8TuPiN/TXK3RYSqANoniD0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v8 0/7] Boot time cpupools
Thread-Topic: [PATCH v8 0/7] Boot time cpupools
Thread-Index: AQHYVVhdzvmSbSkA9kKhcVjYQ/ksyq0RzUeAgAAEKQCAAADfgA==
Date: Fri, 6 May 2022 11:43:27 +0000
Message-ID: <4A9E62B2-0038-4558-A422-50E3E09B8480@arm.com>
References: <20220421081645.40235-1-luca.fancellu@arm.com>
 <0EA6F35B-89E9-45AC-9274-567F86E67C6E@arm.com>
 <a57af889-b231-2d34-7e0f-de0be920e00e@xen.org>
In-Reply-To: <a57af889-b231-2d34-7e0f-de0be920e00e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f2ffc2a3-428d-4c5e-a90e-08da2f55abbb
x-ms-traffictypediagnostic:
	DBBPR08MB6059:EE_|DBAEUR03FT053:EE_|VE1PR08MB5006:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB500674EEA940E8CE4825A918E4C59@VE1PR08MB5006.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vcFXAD8FRa9dNn2oV58mvgJuZGh8PiQSTpAYCNLmd9BpIxSXFOYt3qPycdJzYKPTigb9HZKH5fCXaU+RPKIH4EM9lwouzaxFpKK4lng1JyhbatidSQ6pc5WAF5C4Ew2NBPbPutjeFwHFSYmaGRpiHace2BRz5guURAt85NvLL2/wxotyqkCpTSS5L9VGMRw4ertmGDQ24CntG1glS23zgDR28jetOzQ1ifKnONwAyuubVgtUqCA2Xl2pFSTEQwqZGx6hN5GdM/8ApKryZzSWSlLOPH6JFS9h52S/cT0IhB8EyGj+4xDkbza6xdFbxT/ZIoOSsHrou9V0HaBYLuLh+YQ2pVuv5pXmB5cDS3AGksAVPZ7OsvHYdy+4TdfboJ3AQL4BetSTBMeyEz/Vl2ZwIpDl0BEM2DnMe4lR/SjRKkVL3R+UzVSm9t20KtIy20/8THLtZnMNbsflJSGg9gRzPkzojy+edUluSKuxW3YDFHR9Gtv1m6Em8pgdw3spWWHZR5J3M6fEhSEUp+alw3+4kHy2PLQ9XoyC09EPF1Yy3dPtUClVMZT1SjgatPskldV4KdM+ltIzKPdq/tErM92J2MgLpW7ZT0oSfPFJE8+G62Uizcru+hGWBjlzZwEra/3AGoWh/NmK3dwNYknV18KhYywvEfyl9PvI4BUwg6CLNWcee+rOibdZ5RqjMDhEFZ+rnsVQVg8VsgRrHM9GyrGLXs4SnGHvIso/uIsuD2/Jr59QXKsYqMOFYdTp6dzJ6hGnl1wNOkyR5UF1J7RFFHgTboIntXes2XT7g5YK6inCLsbajMSu8aV3xt/ynwoIprsWIFSIEM6k5wZq0yXzwbvhXw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(71200400001)(186003)(6486002)(508600001)(966005)(33656002)(6506007)(8936002)(66476007)(66556008)(66946007)(2906002)(76116006)(316002)(91956017)(8676002)(64756008)(4326008)(66446008)(36756003)(5660300002)(38100700002)(38070700005)(122000001)(86362001)(26005)(6512007)(6916009)(2616005)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C507B5DC23F9C4EAD8D843DD0A83E44@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6059
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93c14bd0-32ff-48a1-bbe9-08da2f55a2d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JDJUmqALx3e099qTLhyq3eBgh2fLuxEDY9H87FdADbikDAcZKTzrGhFwNDwk+aeqXbABbx1oKdxZZMdiOhrL2YXlwFH42S3JuTV/I7hNo0SxUIBtGepjA+rrIzzxVzLV5n1TD+L7dJ5bgLD/578JFLELB9MJwjPWkegCTYWpnVTWZfmwUuCTyM9VR6imY8K/pb8RdVmN7NfCPHUbm/pllfAGcVLX/0MEH7V0D1JIc/M5L2nNoGrHwcsaf0mIPXofKTm/5lBSiwDC+lnWl9vd961Mp4hFnBY2QPRX7+AKGIolGPOc4ie9DjsY1nEIL3+rC4miAnZCs8gEstaojNvctAfLoPwr0DyoqUlRrjlHMyyt+63NpQFWJR6VV6rvCRMUEPipvVAIxujfCXJotpm/ye3cklKvenVZw1TTbG2XdXtOPQPJh8m1C5rENa9K4k2TTnHD3G4sbboblln+yOz7PKIERaZAlxo50qfnJwY55Y1XMyi2yBv1sILqiQlwS11zui79XQKoLUv8NbPGy3iVwEfkkvzx2r58qy1ldhU1S8WGe0JlY7gIgAd/jfziOmkUY15oPTmhFp1wz8Db8LHi7fH+HoqJUNSJs9tGcBHJG1ILxYn5QjF2ss6TLuTV2jwNHxkvoc17aOjnCOpGRF49Le85gpmiRjBENVXTGZieW+Na5mHVph1dTlMFOo/K6jMm34V4FDmlVexvPpQmXshwPS7Ab8hd7kFxp6KdNi0FOSTSA+lWcs759SzdQchZ2tqhE5xuAz5b3h3wly1uLfNZAA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(86362001)(81166007)(966005)(5660300002)(2906002)(26005)(6486002)(508600001)(316002)(36756003)(2616005)(336012)(47076005)(186003)(8936002)(54906003)(82310400005)(33656002)(40460700003)(6512007)(83380400001)(8676002)(70586007)(356005)(4326008)(6862004)(70206006)(6506007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 11:43:42.6118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ffc2a3-428d-4c5e-a90e-08da2f55abbb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5006

Pj4+IA0KPj4+IEx1Y2EgRmFuY2VsbHUgKDcpOg0KPj4+IHRvb2xzL2NwdXBvb2xzOiBHaXZlIGEg
bmFtZSB0byB1bm5hbWVkIGNwdXBvb2xzDQo+Pj4geGVuL3NjaGVkOiBjcmVhdGUgcHVibGljIGZ1
bmN0aW9uIGZvciBjcHVwb29scyBjcmVhdGlvbg0KPj4+IHhlbi9zY2hlZDogcmV0cmlldmUgc2No
ZWR1bGVyIGlkIGJ5IG5hbWUNCj4+PiB4ZW4vY3B1cG9vbDogQ3JlYXRlIGRpZmZlcmVudCBjcHVw
b29scyBhdCBib290IHRpbWUNCj4+PiB4ZW4vY3B1cG9vbDogRG9uJ3QgYWxsb3cgcmVtb3Zpbmcg
Y3B1MCBmcm9tIGNwdXBvb2wwDQo+Pj4gYXJtL2RvbTBsZXNzOiBhc3NpZ24gZG9tMGxlc3MgZ3Vl
c3RzIHRvIGNwdXBvb2xzDQo+Pj4geGVuL2NwdXBvb2w6IEFsbG93IGNwdXBvb2wwIHRvIHVzZSBk
aWZmZXJlbnQgc2NoZWR1bGVyDQo+Pj4gDQo+Pj4gTUFJTlRBSU5FUlMgfCAyICstDQo+Pj4gZG9j
cy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dCB8IDUgKw0KPj4+IGRvY3MvbWlzYy9h
cm0vZGV2aWNlLXRyZWUvY3B1cG9vbHMudHh0IHwgMTQwICsrKysrKysrKysrKysrKw0KPj4+IHRv
b2xzL2hlbHBlcnMveGVuLWluaXQtZG9tMC5jIHwgMzcgKysrLQ0KPj4+IHRvb2xzL2xpYnMvbGln
aHQvbGlieGxfdXRpbHMuYyB8IDMgKy0NCj4+PiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMg
fCAxOSArLQ0KPj4+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zbXAuaCB8IDMgKw0KPj4+IHhl
bi9jb21tb24vZG9tYWluLmMgfCAyICstDQo+Pj4geGVuL2NvbW1vbi9zY2hlZC9LY29uZmlnIHwg
NyArDQo+Pj4geGVuL2NvbW1vbi9zY2hlZC9NYWtlZmlsZSB8IDEgKw0KPj4+IHhlbi9jb21tb24v
c2NoZWQvYm9vdC1jcHVwb29sLmMgfCAyMzQgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+
IHhlbi9jb21tb24vc2NoZWQvY29yZS5jIHwgNDAgKysrLS0NCj4+PiB4ZW4vY29tbW9uL3NjaGVk
L2NwdXBvb2wuYyB8IDQzICsrKystDQo+Pj4geGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIHwg
NSArLQ0KPj4+IHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgNTMgKysrKysrDQo+Pj4gMTUgZmls
ZXMgY2hhbmdlZCwgNTYzIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQ0KPj4+IGNyZWF0
ZSBtb2RlIDEwMDY0NCBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2NwdXBvb2xzLnR4dA0KPj4+
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL3NjaGVkL2Jvb3QtY3B1cG9vbC5jDQo+Pj4g
DQo+Pj4gLS0gDQo+Pj4gMi4xNy4xDQo+Pj4gDQo+PiBQaW5nPw0KPiANCj4gWW91IHNlZW1lZCB0
byBoYXZlIGZvcmdvdHRlbiB0byBDQyB0aGUgcmVsZXZhbnQgbWFpbnRhaW5lcnMgb24gZWFjaCBw
YXRjaCBhbmQgdGhlIGNvdmVyIGxldHRlci4gSSBvbmx5IGdvdCB0aGlzIGUtbWFpbCBiZWNhdXNl
IEkgaGF2ZSBhIGZpbHRlciBmb3Igc29tZSBrZXl3b3Jkcy4NCj4gDQo+PiBUaGUgdjggc2VlbXMg
dG8gYmUgcmV2aWV3ZWQgZm9yIGFsbCBwYXRjaA0KPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9saXN0Lz9zZXJpZXM9NjM0MDY0DQo+IA0KPiBBRkFJQ1Qs
IHBhdGNod29yayBvbmx5IHRlbGxzIHlvdSB0aGUgbnVtYmVyIG9mIHJldmlld2VkLWJ5IHRhZy4g
SXQgZG9lc24ndCB0ZWxsIHlvdSB3aGV0aGVyIHRoZSBwYXRjaCB3YXMgc3VpdGFibHkgcmV2aWV3
ZWQuDQo+IA0KPiBMb29raW5nIHRocm91Z2ggdGhlIHBhdGNoZXM6DQo+ICMxOiBSZWFkeQ0KPiAj
MjogUmVhZHkNCj4gIzM6IFJlYWR5DQo+ICM0OiBNaXNzaW5nIHJldmlldyBmcm9tIHRoZSBjcHVw
b29sIG1haW50YWluZXJzIChKdWVyZ2VuIG9yIERhcmlvKQ0KPiAjNTogUmVhZHkNCj4gIzY6IE1p
c3NpbmcgcmV2aWV3IGZyb20gdGhlIGNwdXBvb2wgbWFpbnRhaW5lcnMNCj4gIzc6IFJlYWR5DQo+
IA0KDQpUaGFua3MgSnVsaWVuLCBpbmRlZWQgbXkgcGluZyBkaWRu4oCZdCBDQyB0aGUgbWFpbnRh
aW5lcnMsIEkgd2lsbCBwaW5nIHNlcGFyYXRlbHkgb24gdGhlICM0IGFuZCAjNiBwYXRjaGVzLg0K
DQpDaGVlcnMsDQpMdWNhDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0K
DQo=

