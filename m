Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F3058D525
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 10:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382822.617860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLKHe-0004Rl-PV; Tue, 09 Aug 2022 08:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382822.617860; Tue, 09 Aug 2022 08:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLKHe-0004OR-M6; Tue, 09 Aug 2022 08:08:14 +0000
Received: by outflank-mailman (input) for mailman id 382822;
 Tue, 09 Aug 2022 08:08:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsBn=YN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oLKHc-0004OJ-Sx
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 08:08:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80084.outbound.protection.outlook.com [40.107.8.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65413755-17ba-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 10:08:05 +0200 (CEST)
Received: from AS9PR06CA0308.eurprd06.prod.outlook.com (2603:10a6:20b:45b::28)
 by DB9PR08MB6507.eurprd08.prod.outlook.com (2603:10a6:10:25a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 08:08:08 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::7e) by AS9PR06CA0308.outlook.office365.com
 (2603:10a6:20b:45b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Tue, 9 Aug 2022 08:08:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 08:08:07 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 09 Aug 2022 08:08:07 +0000
Received: from 5e29a059cbca.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC595C5E-A5A2-4CFA-98E8-3F1EF15201BF.1; 
 Tue, 09 Aug 2022 08:08:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e29a059cbca.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Aug 2022 08:08:01 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB5470.eurprd08.prod.outlook.com (2603:10a6:803:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 08:07:59 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518%8]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 08:07:59 +0000
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
X-Inumbo-ID: 65413755-17ba-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nRUZ7HZ5yovfmYihyLxrVHr8/UE36gi4O74optTVREjGA7NLkx1e88CEUTE3rDuoejqqEyIRPJLSAjVR2k5fJvJbavu7dZqqyftaKkRFZV1SAlXI8E9C+auUf+T7qtPN/0mmH3qxJEG3Cvu3TVssIVHbEquqBczxEq8CYqrTTdliIw9ZhlAVUS87jY0DjlhRz9/LYJg5KAOC/lHrrlqcFKfgU38AIwIyYNds6iD5P74CL2oF5E+qFd18xhRMV0c42XeDd3udtbNfgrLZeTmJzEpPafXNnjqJzA1PiJarRVQe8Vx3QLCm+YDBKcuyHxzqaJ5yu0ZOAgdVQkAT2Kb49g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kCQSUP1KNF16XoRASwxg0ZiuNazY6sZKtoDPBN1gBk=;
 b=mRZSEQbzdQwzekbzDSHv9ajiP5nlo82iysTcsWYWIg9v5MWMc3wKyhf051SJiFleWnmC8IdWVmiO1kkj+HAYXY1UwEjTkK2zPdN4JRzbAftA2N2cSjc1smZtUFlhvodpMvI2tFAgy7t8rsZhFFYdZj8IPAq3ryTuYiehQ3wEBNcAhjtOSutqBJsFlVWd5cfETFzk4WV6tVafSoE932jXyTD6LGgx+axkzDyyO2DxJ42pxsQT7UCXVMkm4YbPZUYzU3zYV6c/5JenVsC0VYJKJvVt8oFdbfBkwHdYzoO3ZFNeDEdKZ8aaqlGMzC9T95lJ+VBlsT37J/t02U9Ekjy4Ow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kCQSUP1KNF16XoRASwxg0ZiuNazY6sZKtoDPBN1gBk=;
 b=Lq3N9o5OpKyOp+zT9z3EMgvlci2d4iVTobXhrD6UkYl8Q6auDm0E8XZeJdPYQeBppWmTd1IiK89ClAtvLSxn511EVyGDTSsAMaiummZ0C6CgeU7kXlwZ6gr7QFsvTkILWjfeeJO3C1QpYCox/khDo0wmz3+c9OhWkMjP3iWGJH0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFs1uFSfcjMer+XFlRY0h59ho0XzMRcCmMYEUTGmVIYTt6wDEVTI4VuVvrEqjgEwRgVnxwDF/T7cOL6sl/2ZLT0QE2b4j53JQisTLLz8wwgpWEbHEJwi4OHdqTRK4wuWYVEDZMteSzdlEtn5V1qQeJjyQw3Y+RQwKXjOhlwB6YcbRFAQ7F0hdGis857hWhL8YdviEsrc5iyB9C68YWJrgQ14NhRCCFrZ1+HCbgWaR41kOSMI9/UL75105QQ2LogXhXWK7v+bQ5gAW49lWQT85YTE5cx9/gxQ0nOMCdDU1sP3CSaOSM1JzXGAGU4u3GasZ1n8d9bv7bcdb0sekmR7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kCQSUP1KNF16XoRASwxg0ZiuNazY6sZKtoDPBN1gBk=;
 b=VooDAHp86T2g2H9QOEZX66P3+XVxQUugqu+qeXUTNwZ0xNfscIvsVewKgHbM7lxh0dL1TcpXl/zYBAthBdPkiWM/ES4UOak6Bzsij/2BrnrkDjAAY7BXzd+vZkbZ5oHreMLmOA1tCqKxPjxll4faD99Lb4/ZM/+NA3okAuwPHjRg3OcJn0TGdIxNaGo3tGzNJPk1jX3gJ0LKDQUtXfUcoGY+eLziTpbVgQQyuV8YK/rb3F3nQvjnekPI7Fg9iRTCoFpbNm7y9AELBgXZpaLlOZw4U95PnhgEahFM9ToIRGi4c3Zt1OCA0D9iN1FZVvc2ta65r9Q2KMyF5V9FaoQ4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kCQSUP1KNF16XoRASwxg0ZiuNazY6sZKtoDPBN1gBk=;
 b=Lq3N9o5OpKyOp+zT9z3EMgvlci2d4iVTobXhrD6UkYl8Q6auDm0E8XZeJdPYQeBppWmTd1IiK89ClAtvLSxn511EVyGDTSsAMaiummZ0C6CgeU7kXlwZ6gr7QFsvTkILWjfeeJO3C1QpYCox/khDo0wmz3+c9OhWkMjP3iWGJH0=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYm/wqv1nrEHMOJUyQDyAePQJHla2PQtqAgBcOCRCAAALrAIAAAXbw
Date: Tue, 9 Aug 2022 08:07:59 +0000
Message-ID:
 <DU2PR08MB7325A733C5B374ED899A2007F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-9-Penny.Zheng@arm.com>
 <d050bcf4-f71d-423d-a157-4243548f47a6@suse.com>
 <DU2PR08MB7325EB83FDD208467A493557F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <99e65678-c394-01f1-9f49-827388f2fff6@suse.com>
In-Reply-To: <99e65678-c394-01f1-9f49-827388f2fff6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 42FF908CD720B246B0FE3C97F5FC4C6C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 94458ecd-9a2f-4fc1-f17c-08da79de4b38
x-ms-traffictypediagnostic:
	VI1PR08MB5470:EE_|VE1EUR03FT008:EE_|DB9PR08MB6507:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JgIvgWftmUUa18CaI/VZyr+tLTHGYvtYckZRG03ZU8kNXlmy+myHTPSYvJ05pq8tAOhqTgsLcZllHAJFOfcljuownkQGlDmZtQj5ifKkRdCX/OicumKUy42kbz/HcyTTrHWg2f4fGBMbVVKtAqoefs3K5XZcsRF+wO7JRlUXqMbKzZdYAkbp2ULEvkdownqOzN9gCCF75sJ8E9wW8LSQyZPD94tID3rGodsFJWPdc99l8YPT4HEysYPfumZd3TqGWijqOnV29fEy1gKBrQGB+h7gEXJYv5PSj4bLNNyQ8bFmBEs+7iwXR9yp7qjXvCnSJ1BuqdLO396INqp/5wtPpzirsXK44anwAQ2WRRIB688+oT8v3FnXV1CIu6xzOLCHQgjPGkITIh941k052sbOaot59wO/XC6qs26Qv2iu1NWRwatfmg/r0QcSq2EkI6CChTbL4UazdtpqgXgxgSL52A1gIbTx8nBLeUJ2rlZrtobOtCJIoBPr8bT+cprTVreQCcPNfDS8CKYI8CNgiYV1qBA3pXZf/YqTqBRzEPKGjeQ3IO6bkDhOnkLfDKITEqIKAhXsX4cwqvCFQ34BCJFxiAV1GafYq1dvWErExZygOl39ADRmYCvZCu0aBmKNB9dZOzmOLCqSJSV9Cu+C2lRiSR/ccHOH2JTjOwsU8MGkoQ3ggAYq0iZnvyFSmGqe3SNQxOb1XUEL2g2r2XQ1FzTJk+Cs6ephSxS1qlAG7EeemOMXnpUh16p5JP8R849FGxewbqVczUtyj+2Of9/8w4+vftqqmTgl/DupQtL0XJyhV1watfjcZxIlwQwccyvTWuFT
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(122000001)(2906002)(6916009)(54906003)(38070700005)(55016003)(38100700002)(83380400001)(52536014)(33656002)(8936002)(5660300002)(66476007)(186003)(53546011)(478600001)(9686003)(41300700001)(66556008)(66946007)(4326008)(76116006)(66446008)(64756008)(26005)(8676002)(86362001)(316002)(7696005)(71200400001)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5470
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc46f409-6f72-4858-47ee-08da79de460d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sDzPTFwY++0AZvOblhuTHcxFqb3BbsS4kYhx3cVHBipO3YfdcpYrIl9GTDe4aWJU8Z5qe42AMd4PtK11iNklUCVhkpkAeWWripTswXul2KREZiYbAlY1alsST61DeGPQL23QluShWKWHBHtViLhyNlFN5dtPrY5Bi1bZProZSWw1WCcTVuZcTOrDwro7NKkeAtrN8ocuz1tIWiKI+78bIrU4BXHhQIqsttrTW6ZqopqnaZohLUGkCNoxmNwK0z7eBVlVKFlh3tHDjyURuOSgcEyJbi+/mYznlQytQ6O7yRNC6VBgOiWnIqdC6v2tcFmPVZWKkv4cws0EMwXI7PMFyq/oZLlWJNpDEB169gD8MVvuE7zNygFvqIL9H65YwBR3hqBuPQrvV+bgRqw+w9EsgMX23dRwNOg3+0n/CL5Dw7gxPHBkDOVR1T8+yOzY8vCbiKpCzaxLqfp7cLnO7DuChcpjfdl1cpAnCChOr8avQj0a87vXZS6r26cwIsWFvIpye96CTDFmTzOpWh0rijUM6gol3aroZv3TB22Kb1Rc1PVCKZrnP4Zl85SpwaZHpuWUb+0uDpsZjtGBcP7VAXTskyeMdGQjiH2HuqFOcblcIyDc+QGjjLO0zW47ybP42P/yFRhiSTo2VcMz2mul6jaRXBTcJMmrXMRZzRxyyfPTmpHCY/2ekEmB29copQwRiVqPRJSPuqpUI6vei501qjrBxrc78b1KlJc0L1CQQBWnxE/ssOEfjNofDB/a3/rYLbWLE7MQSjFb+14T+VudgSy/OTIkf54yoUm+QK49Dgi1JgkXfsscgwGy7jJUMrisB7/s
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(40470700004)(36840700001)(46966006)(82740400003)(4326008)(70586007)(70206006)(6862004)(54906003)(36860700001)(5660300002)(316002)(82310400005)(8936002)(8676002)(186003)(478600001)(52536014)(2906002)(47076005)(26005)(9686003)(33656002)(41300700001)(7696005)(336012)(6506007)(53546011)(40480700001)(356005)(81166007)(83380400001)(40460700003)(86362001)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 08:08:07.6820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94458ecd-9a2f-4fc1-f17c-08da79de4b38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6507

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgOSwgMjAyMiAz
OjU5IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47
DQo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjkgOC84XSB4ZW46
IHJldHJpZXZlIHJlc2VydmVkIHBhZ2VzIG9uDQo+IHBvcHVsYXRlX3BoeXNtYXANCj4gDQo+IE9u
IDA5LjA4LjIwMjIgMDk6NTMsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxp
c3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gPj4gSmFuIEJldWxpY2gNCj4gPj4g
U2VudDogTW9uZGF5LCBKdWx5IDI1LCAyMDIyIDExOjQ0IFBNDQo+ID4+DQo+ID4+IE9uIDIwLjA3
LjIwMjIgMDc6NDYsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gV2hlbiBhIHN0YXRpYyBkb21h
aW4gcG9wdWxhdGVzIG1lbW9yeSB0aHJvdWdoIHBvcHVsYXRlX3BoeXNtYXAgYXQNCj4gPj4+IHJ1
bnRpbWUsIGl0IHNoYWxsIHJldHJpZXZlIHJlc2VydmVkIHBhZ2VzIGZyb20gcmVzdl9wYWdlX2xp
c3QgdG8NCj4gPj4+IG1ha2Ugc3VyZSB0aGF0IGd1ZXN0IFJBTSBpcyBzdGlsbCByZXN0cmljdGVk
IGluIHN0YXRpY2FsbHkNCj4gPj4+IGNvbmZpZ3VyZWQgbWVtb3J5DQo+ID4+IHJlZ2lvbnMuDQo+
ID4+PiBUaGlzIGNvbW1pdCBhbHNvIGludHJvZHVjZXMgYSBuZXcgaGVscGVyIGFjcXVpcmVfcmVz
ZXJ2ZWRfcGFnZSB0bw0KPiA+Pj4gbWFrZQ0KPiA+PiBpdCB3b3JrLg0KPiA+Pj4NCj4gPj4+IFNp
Z25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+Pj4gLS0t
DQo+ID4+PiB2OSBjaGFuZ2VzOg0KPiA+Pj4gLSBVc2UgQVNTRVJUX0FMTE9DX0NPTlRFWFQoKSBp
biBhY3F1aXJlX3Jlc2VydmVkX3BhZ2UNCj4gPj4+IC0gQWRkIGZyZWVfc3RhdGljbWVtX3BhZ2Vz
IHRvIHVuZG8gcHJlcGFyZV9zdGF0aWNtZW1fcGFnZXMgd2hlbg0KPiA+Pj4gYXNzaWduX2RvbXN0
YXRpY19wYWdlcyBmYWlscw0KPiA+Pg0KPiA+PiBNYXkgSSBzdWdnZXN0IHRvIHJlLWNvbnNpZGVy
IG5hbWluZyBvZiB0aGUgdmFyaW91cyBmdW5jdGlvbnM/IFVuZG9pbmcNCj4gPj4gd2hhdCAicHJl
cGFyZSIgZGlkIGJ5ICJmcmVlIiBpcywgd2VsbCwgY291bnRlcmludHVpdGl2ZS4NCj4gPj4NCj4g
Pg0KPiA+IEhvdyBhYm91dCBjaGFuZ2UgdGhlIG5hbWUgInByZXBhcmVfc3RhdGljbWVtX3BhZ2Vz
IiB0bw0KPiAiYWxsb2NhdGVfc3RhdGljbWVtX3BhZ2VzIj8NCj4gDQo+IFBlcmhhcHMgLSBpZiB3
aGF0IHRoZSBmdW5jdGlvbiBkb2VzIHJlYWxseSByZXNlbWJsZXMgYWxsb2NhdGlvbiBpbiBzb21l
IHdheS4NCj4gU28gZmFyIEkgd2Fzbid0IHJlYWxseSBjZXJ0YWluIGluIHRoYXQgcmVnYXJkLCBh
bmQgaGVuY2UgSSB3YXMgd29uZGVyaW5nDQo+IHdoZXRoZXIgInByZXBhcmUiIGRvZXNuJ3QgYmV0
dGVyIGRlc2NyaWJlIHdoYXQgaXQgZG9lcywgYnV0IHRoZW4gaXRzIGludmVyc2UNCj4gYWxzbyBk
b2Vzbid0IHJlYWxseSAiZnJlZSIgYW55dGhpbmcuDQo+IA0KDQpIbW1tbSwg4oCccHJlcGFyZeKA
nSB3aXRoIOKAnGRlc3Ryb3nigJ0gaW4gaXRzIGludmVyc2U/IERvIHlvdSBoYXZlIGFueSBzdWdn
ZXN0aW9uIGluIG1pbmQ/DQogDQo+IEphbg0K

