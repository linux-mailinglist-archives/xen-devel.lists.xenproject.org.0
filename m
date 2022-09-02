Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAF75AB4A1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 17:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397804.638492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU8Br-0007RR-Ca; Fri, 02 Sep 2022 15:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397804.638492; Fri, 02 Sep 2022 15:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU8Br-0007Pc-9D; Fri, 02 Sep 2022 15:02:39 +0000
Received: by outflank-mailman (input) for mailman id 397804;
 Fri, 02 Sep 2022 15:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Z99=ZF=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oU8Bp-0007PW-MG
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 15:02:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4753a1ea-2ad0-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 17:02:36 +0200 (CEST)
Received: from DB8PR06CA0027.eurprd06.prod.outlook.com (2603:10a6:10:100::40)
 by DBAPR08MB5814.eurprd08.prod.outlook.com (2603:10a6:10:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 15:02:34 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::2b) by DB8PR06CA0027.outlook.office365.com
 (2603:10a6:10:100::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 15:02:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 15:02:33 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Fri, 02 Sep 2022 15:02:33 +0000
Received: from 0265feb2c93c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4331EE66-7259-4240-A456-B1E8B35A2856.1; 
 Fri, 02 Sep 2022 15:02:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0265feb2c93c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 15:02:23 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV2PR08MB8004.eurprd08.prod.outlook.com (2603:10a6:150:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 15:02:20 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.012; Fri, 2 Sep 2022
 15:02:20 +0000
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
X-Inumbo-ID: 4753a1ea-2ad0-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gOMCztR32DKUnLYx47/uVf1oViinWEKbZ2oeospcr3cD942GXHBLxj8XF0Spbon3yUlScTDmDjflnaXivz+ScVHBqR48tJKgpOL4X9fJ+UOmC3ROgxDo5DzOo0obAku/tNqIoEG5B9lo/Y4d7hAKdoGS6MfsEQqgGG6KoYz9IwXJYKmaPTzDb++Cdw7Tp1T0QeUdPrv5nAPNzTdVFtJYxNpUMtm3RhU0roAxAKI05GgN/Y8J1GsXqMbZQP+CuOhygGK5YpzDZ+u4Dej6ZIcXkoD+jJcox9j5iAi6EDrQsnrjjcgjiPiZ+GP75Jl0QZjF0/vkzY4Bs364DFMbFv2iag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfmu6RFcwy0jtroWdMtyZfHH9lJ5HBEtyduPA+q04kg=;
 b=L/DjP9kbZrH6f4cd2GhqVT/6jsLpXWi3yOm0TDoZ/c7vUaaqUp5zTUqpwBHf6fKzvjJcg6JW7xyNexSWax7RJCAPM6igZevR6aLRTsgvlIekC0ytVMVOVHWfSFpc8UalMEk8uVUv6wMLarHK1FGCqz9Zm0S6PHI2vQ+ajR/JxB2nJkXw282ZxTMfX3RLMQOLQigxd83+CG2lNaXhc4LgwntA3mNGtRYBDvvcncs0tRI6M0LaReuqB3jgeXcHcJ8r2wncybfwcj/cx7Cns0xGkRfr9INgNIYXf9BwVR0wjs4UjiiUeGD9hCJA/4ZJu4Z8L0OnRVLrlZu5XMP1mdDAuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfmu6RFcwy0jtroWdMtyZfHH9lJ5HBEtyduPA+q04kg=;
 b=zeAoXwXxZ2Ihv4Pj9KyeOOJxiUsNix6LGhjEkZXWE5AtQLRYGp9MEW8lwFK+pR83S/wc+2zc1cWeN5N3CzMlDmnKczHz8y2wqR2cMFl/VvT6ljznYIF4l82wLW0pj1vHkAyI4p/0iMfg85sg4aMgGLsfsQiqwRxnabm4RLB3cM4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3212560e182afd6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVCnZv8B3zMxmZl3IinJAC+zGd5WbMtoO1PRn7mBmrQ5jrfI/2L+U+qLqFETfFSbgtrw0i3TWkh5LGS/R9jemLJQwTMMLGHLR6ZAykJLgqbDkFoIhRhpEuJuUdWrclxr5qrMreBbhjuebQaQcrAo9RXqVt4xIucjTdDARQ4R4oG6TckGLgSJZjwRrKJyghpKfol60pPow/UVhg4UAArnZ2maUsf1ziwi/7BIQlzEt8JO3CC9Fb3QDSbyK5muYj5H6iAhkOAheY+36GiVoiTniWPrVMktp0sDR1v052yhfXGg4WwVwHcvJ+ySlizR+/CcXn6vYx7mzlusB1XpiMZyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfmu6RFcwy0jtroWdMtyZfHH9lJ5HBEtyduPA+q04kg=;
 b=FBZhdmYeLomx9M8UQL6HfxKz6xes3JdUFRr/T6g0usGVZKAXrO49jrt3sMaSE/Orn9ka6oXvafKG7fWaHwh7YKXA7x2ZJzMu5bKAOPZtrzbh7o8TMMs9INLoAasZde787GeBnToWx41sD+E1tdYIUf3Hf0HEP+F9i9yQiCuTxxTkrF/HMxOdWWD6O9oX5/FhC/teykvg5EQeKX+8wQPLJSnpJTvYl5+YWkCPCL3zpU1oHO1O/6KEpclmNweITwweUVs/p4uHbNUeUiK2sKjs5CKeUBswNKpavrjsWx/WE3sGAEK2wDmjshbEip19/IY6BQbK38YMz5r0B3V6/XCDAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfmu6RFcwy0jtroWdMtyZfHH9lJ5HBEtyduPA+q04kg=;
 b=zeAoXwXxZ2Ihv4Pj9KyeOOJxiUsNix6LGhjEkZXWE5AtQLRYGp9MEW8lwFK+pR83S/wc+2zc1cWeN5N3CzMlDmnKczHz8y2wqR2cMFl/VvT6ljznYIF4l82wLW0pj1vHkAyI4p/0iMfg85sg4aMgGLsfsQiqwRxnabm4RLB3cM4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index: AQHYveOA33HU3e+ak0GIRMMly1Yth63K4ewAgAFcTAA=
Date: Fri, 2 Sep 2022 15:02:20 +0000
Message-ID: <99959982-8A12-44ED-9959-6BB5AA695447@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
In-Reply-To: <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d2f4676d-cc67-41ea-a300-08da8cf42a63
x-ms-traffictypediagnostic:
	GV2PR08MB8004:EE_|DBAEUR03FT058:EE_|DBAPR08MB5814:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zuyqk0kGiEkbqjZU7CK/V25JI3xuUr/BVuXikvu8FH4BcTPfO9jZpACOqCFaUmvElSQDUN9ZYLCWn7QnNqD8pEOY2AZoAinssuswItva3IKgP89yODcXooqv0ru2Ho7ZCuZ+pmEFN0td/t2CWYJmo87CFJrRaYm3x6s6YUwHB7rrcRyjgPQqjddSGYzaZCaNYBkeAAnN9sxyNziGcd0bUmPX7umABfS/8FNVi7JsIAtyNzs44oQzYX3SBDqPcCV+jVyB0/FFHQ+sS6O8mrqtiZdXEkeqESPDz5SPIYZcFTfrAX7/nlgBYkbHe8X3yQleFVluqPZecSEIPZ9xwCli6CnFssxJVKgLapIchE6EyA1STLvoosp60r8zlT/I29mfKnzwA3P/nZriDz0aK5UlKeU3wn72Dc2hwKmBreOudQrb8EVsINQdjsugEKRmBpjO5sGiyPCfet+opbgippbVXx1pseP3TOe7OFIw6TkXew0l8UAsl2xMWORZSUQ6qGnkEPEC6EwmwxnIe0mtqImv9SUXYDVvuotLUlqdu65q8AckYEMr+KNf10ALyaCgeJgYxEy9X5vJIzJG5Xlv7OaR5dIikHurz+20+y05TVyzC8W2JqEHJbFKvBvN+0Sd4DdXP8zC++sGCa7SSSRXSc1Ua1+chtehK1Yo7hLuj27lZ96CEjvLH94SKpRw1rInpeI2fKvaGs+Jy0BKssEO9BSwOfTF8bhDXypvvhDRJ925uKYqGmQJ55zv1wvLXdlzGyf/tMX+enSGWtprwoT6K7m43jdKzCut+yRStPEMNPOejlI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(2616005)(186003)(6512007)(26005)(53546011)(36756003)(38100700002)(2906002)(122000001)(6506007)(38070700005)(4326008)(8676002)(5660300002)(71200400001)(33656002)(316002)(83380400001)(76116006)(66556008)(66476007)(66446008)(66946007)(64756008)(6486002)(86362001)(8936002)(6916009)(41300700001)(91956017)(478600001)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <48C1189192AB4B4D8440E82305EBE1FF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8004
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b0e9bdc-9aa6-4e5d-7218-08da8cf42295
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CkBGARp3Gy/PU/CnxC+psw+Zabkc4H6S0NDdrGyB139STtRQZ9aDX4L8p5XufzopUuXHmJzb1zDFnqR/lDC7PqTjG1csDGlD2KxjPDrrXKak9oy12jdUd6KtvEz80g+zu/Lpq0/TqLu9J5Tm7RAEJvJ4FjgW2/RBx7QavtdAWzeDvMJvCgpji2tGUM/rFtOjZjW61EK857G0lXz2PZmhdBWk4JfEP2mWBc5TpC+lmY7oX7dsYUJUeqfsj5k57RIjOOR7h5B+GHla4tUgSGmAjA4FLZ134oOI7EAaFpfPAeNsPjWdg++LgOymJT39hmVx5Z2DamnHvZ//eGr25lbST2y/JWtv+9tqOSgyV4fG5Ap4U/G3ZSkA/K9cGRAsK4GqSrsMUXi3LovaqTfAz8iyjGc+C2GSabK1jYpj80A2GuZENFvj5xQszonunHBJiWJSYfN5Ih2V6MkhJt5B1vRiKsK7iqxGmjktzWx3TXKHjKBXTz4dUElJMc/L5NKCAs3xAWub40mNQuMDiEus1P+iYXyIBnN4Wn6kkzj/wK6Ep2O/ebTHVKkXlUuxqxDJtQDTsRu8hRMm5mBPRFmAoAdPzbEeHQHNMJutob5JFSvjNRaYr60vAwqWUHT4Cs7WDXZDwfCeCWd+SzqpXEFnyva526VwK/u9bxn5y457nJbLiw/2JO41sip0kOxjCuMZ6/r+JJBhjGSC6ZPm7yCMN15huQCOuBk14/E3fxtN30jhuE82aGyOfg6wPUJPQM6nEUUuh5FjeOXQlXgQ9jOMps7BkQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(40470700004)(36840700001)(46966006)(186003)(2616005)(2906002)(36756003)(83380400001)(47076005)(82310400005)(336012)(82740400003)(5660300002)(33656002)(8936002)(6512007)(316002)(6862004)(36860700001)(6506007)(70586007)(53546011)(70206006)(4326008)(8676002)(107886003)(81166007)(41300700001)(26005)(54906003)(356005)(86362001)(40480700001)(6486002)(40460700003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 15:02:33.7428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f4676d-cc67-41ea-a300-08da8cf42a63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5814

Hi Julien,

> On 1 Sep 2022, at 7:15 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 01/09/2022 10:13, Rahul Singh wrote:
>> Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
>> disable xenstore interface for dom0less guests.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v3:
>>  - new patch in this version
>> ---
>>  docs/misc/arm/device-tree/booting.txt |  4 ++++
>>  xen/arch/arm/domain_build.c           | 10 +++++++---
>>  xen/arch/arm/include/asm/kernel.h     |  3 +++
>>  3 files changed, 14 insertions(+), 3 deletions(-)
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index edef98e6d1..87f57f8889 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -204,6 +204,10 @@ with the following properties:
>>      - "disabled"
>>      Xen PV interfaces are disabled.
>>  +    - no-xenstore
>> +    Xen PV interfaces, including grant-table will be enabled for the VM=
 but
>> +    xenstore will be disabled for the VM.
>=20
> NIT: I would drop one of the "for the VM" as it seems to be redundant.

Ack.=20
>=20
>> +
>>      If the xen,enhanced property is present with no value, it defaults
>>      to "enabled". If the xen,enhanced property is not present, PV
>>      interfaces are disabled.
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 4b24261825..8dd9984225 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3336,10 +3336,14 @@ static int __init construct_domU(struct domain *=
d,
>>           (rc =3D=3D 0 && !strcmp(dom0less_enhanced, "enabled")) )
>>      {
>>          if ( hardware_domain )
>> -            kinfo.dom0less_enhanced =3D true;
>> +            kinfo.dom0less_xenstore =3D true;
>>          else
>> -            panic("Tried to use xen,enhanced without dom0\n");
>> +            panic("Tried to use xen,enhanced without dom0 without no-xe=
nstore\n");
>=20
> This is a bit hard to parse. How about:
>=20
> "At the moment, Xenstore support requires dom0 to be present"

Ack.=20
>=20
>>      }
>> +    else if ( rc =3D=3D 0 && !strcmp(dom0less_enhanced, "no-xenstore") =
)
>> +        kinfo.dom0less_xenstore =3D false;
>> +
>> +    kinfo.dom0less_enhanced =3D true;
>=20
> Wouldn't this now set dom0less_enhanced unconditionally?

Yes , I will fix this in next version.
=20

Regards,
Rahul=

