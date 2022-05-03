Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4FC518221
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 12:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319405.539646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpYs-0005Y2-44; Tue, 03 May 2022 10:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319405.539646; Tue, 03 May 2022 10:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpYr-0005UV-WA; Tue, 03 May 2022 10:15:17 +0000
Received: by outflank-mailman (input) for mailman id 319405;
 Tue, 03 May 2022 10:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlpYq-0005UP-6e
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 10:15:16 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec279146-cac9-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 12:15:14 +0200 (CEST)
Received: from AM6P193CA0080.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::21)
 by AM0PR08MB4003.eurprd08.prod.outlook.com (2603:10a6:208:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Tue, 3 May
 2022 10:15:12 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::9a) by AM6P193CA0080.outlook.office365.com
 (2603:10a6:209:88::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Tue, 3 May 2022 10:15:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 10:15:11 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Tue, 03 May 2022 10:15:11 +0000
Received: from be5eab844d01.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 445E2378-C782-480E-BD22-7AF8137BB4B8.1; 
 Tue, 03 May 2022 10:15:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be5eab844d01.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 10:15:05 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AS8PR08MB6549.eurprd08.prod.outlook.com (2603:10a6:20b:33d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 10:15:04 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 10:15:04 +0000
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
X-Inumbo-ID: ec279146-cac9-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nySQ4NXdCoBvf8kOKPzmIgO2nMb5Bm2JZBVm+LJjWrUBDg5w5rAvcQkTCLEyRNB2RfxnelSksmrm0zKMwiMPjhyjWFGJ8AQoUnW1xYXULk9VRWzaGpuv0pucJy6sbo6/XuOjC3fJZ1X8iKMrGZ4r+2xaHG2+/b2eznnTOh+855cLicrHWHuanz08DBgjYPOMuHBWslA3zsrGg89EyqFjaly3BSQWLqxn8zvSPiInT878cmeV0UcxaTr7+2QQXZEZElvQbtWjanhxXBzyg9jmC3YB/f2frMjuKmUfclNhuIT8P99uIbmDmdlfPoGXWNKdzQm/In/Waq40B6AE3muBzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O08oTBgJLixi80z0lATy7zmbB5LWkAjCrDCWbjYQqTI=;
 b=b/h4ZinUzCs+1d5DGbch1bda5I6pvlnyfh2IAK9HMExXIIWuvgMxYQFB9rBpRo2YU869VcPpTb2lcjIS7bztwc5x9ftYiG9/ICgmkjUEXWV/zzsiYzxckJ8OEtfeilClqOgFxS66XE39v56qlhh9g8GLXN/r1inntzygvrGr7aWyqRsCNCNZhGk/qe9Hu3cE/j0uYPD6iaeDT2CIll34Ba/Y2UUlaIM9z4hvdx916udaqEnpE1QDO3Utjk7VzzN/8sc2c7aA7GgnijaACE/CwlgrvKklTon1VhNenOBy6vNA0Cp/fVbCG/ZAcS+H3sc0Nr2TJQWwwuj7CoVKpSFK7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O08oTBgJLixi80z0lATy7zmbB5LWkAjCrDCWbjYQqTI=;
 b=EMvN4jcewlotb7hS+pG6UeZzhliWtGEgS9ADloUb9ZZ3lll+B5w7j5ZkKkuVh4NN712qAbomLaQfMoKR0HNQ0hUqzaUROYywuktV/cBU1ctyJtx6wgvagYClK3HmUdq49L9fEtdnBK95uL2o09KTLs9CF7hStbJnLmd/Y/URKUc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: da317987b6fac9ac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CS/thZwDOq80pyz1v9lTUHoNlwIG8WL9kDRXvD7mtUlrgFa5DUXkRJ2g4yGPc8iDyydQWUgg3SqqD2rTYUI9ZMnnitRhktNZwzHckN359yIFb+hghu16CVrc5ncZwNYXMgRTQpwKB74mJiUZW3sM0w2O+idkCRERNJUlFZhTScTaPKZkQfG5bKQBbccjKlevKbfaHrsHQaDmLQyGNXELW6uWrioY0a/wkC3ULmnn+rmEsUnSEcuhTDmc1hHWb0vfdHvKJid0rNSFnFy3bzjAt23gRIbyUjHMaT8dQNqkNQT9PClrVhztAFBk+C8LniMvAYDwYmWbo0oL2wM/P1qdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O08oTBgJLixi80z0lATy7zmbB5LWkAjCrDCWbjYQqTI=;
 b=YCg7h3mmhtkKqVUN6jRPxFoQvT+7/ozw5rK362QPhBqmOgG3bGwOXQp61ivEi2Dm3iThRVaQ6RyH4EP5HWtltNnZA2twaRK9WCgZZgwlsoLwePfbPgwiPbtRtsVyyDhsaPV9cd/1buawo8JMlk15zYHN65YKvoBQeblamnTmTT77DhsH72FPrFbPrm86vKDtfTmBlYdOJUTBqk43lNpK6Y9qt1KIxm/H3/ptl8fKwmGIdaU0hIfkfZ8tzw+IwYRmHCjggblfcY1rRdgrpcit/vkowgsVKbVETWM28+JcyWzub2zZiyoN2umVtQvzpOMtY7gBoY6T3In8TKTvUVNF8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O08oTBgJLixi80z0lATy7zmbB5LWkAjCrDCWbjYQqTI=;
 b=EMvN4jcewlotb7hS+pG6UeZzhliWtGEgS9ADloUb9ZZ3lll+B5w7j5ZkKkuVh4NN712qAbomLaQfMoKR0HNQ0hUqzaUROYywuktV/cBU1ctyJtx6wgvagYClK3HmUdq49L9fEtdnBK95uL2o09KTLs9CF7hStbJnLmd/Y/URKUc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, "jgross@suse.com"
	<jgross@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 1/7] xen/dt: of_property_read_string return -ENODATA
 when !length
Thread-Topic: [PATCH v5 1/7] xen/dt: of_property_read_string return -ENODATA
 when !length
Thread-Index: AQHYXAvNeYUSSCJ/SEOm+/N9Ov4Ija0M9TaA
Date: Tue, 3 May 2022 10:15:04 +0000
Message-ID: <98FDF48C-9EDD-4BF0-8C67-B63884E159EF@arm.com>
References:
 <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-1-sstabellini@kernel.org>
In-Reply-To: <20220429205732.2030094-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e3dfa394-a002-460f-866d-08da2cedcf2f
x-ms-traffictypediagnostic:
	AS8PR08MB6549:EE_|VE1EUR03FT025:EE_|AM0PR08MB4003:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB40032E1B7124EC4BFABF5638E4C09@AM0PR08MB4003.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wiGXJCdk/GaOvSNhTe+4T5OyjibJypOHmPOZIQv7hgMauS22MUcLISwSu/9jWro0D/aSPkd1di3QL9H15x/yKFvXpAO/PxbEU1NqSyhIzqqugLDTOi6J6SzF1ofjmz3oolr5eTVovj6ZoIfcW/gvQs0quHlL7SWP3GdS2Ug57qeO+RoOMqdmHyTwjLXHDDZ/9KkRpzHMUEl8HtxA/NACOp/7uSljBtYoaDeeUhITws1r67G6LyuYUkIZES1azHJ5efy7wW5qc3pRb7+uayhdIGhmyFJbyXJyFcHbQRtNvroE2VHe0BXitouWVT31uaW6Pk81U6elxFQYLvf9hFpGQSsAMErYcGbbNjrlEssrom1spuGJXeftQ57Bc6ICDqXwOx9Qk9JhRJiGjJkEQ1dj0OZsEorYskjDYm/7BFt1oCGCVyFjBE0wQFbUHr1tRDi+f+XOage3FkXmO3+OF+l4Le/VPliO4/SUwc1Yf4gC3bATxqxMP378UsBNN/+bUgdcbYX6SSpeDBVz5DaKXLhaLaKHOe/v7QPF5H/luFjmku5wQY69Xn+eueL9RTH3VHtRL9EZOtf0wEhrhUaGfeaWWppItWRz/0i13F7D0c+rZofLQus2WG+syebTWNBJeumSI0xEGnu+xNNxWUs3KRje2W5dtJcgAhmi8Uc2B8XlZSYzbjJFRHVgNddEjvNOM0l3T19d5AWdTUygIEo85hNkmf4rKaWGsZYDfE44ojJi4eVIS55VWTXC50aNmYtt8sp4IucUFtXLP7R/rT94yP8anonWvVbSGS5YNLIEg595gsifuhiVc2nA15v1XDVZMA7m
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(66946007)(5660300002)(2906002)(76116006)(8676002)(4326008)(33656002)(66556008)(508600001)(66476007)(8936002)(66446008)(64756008)(38100700002)(316002)(122000001)(966005)(6486002)(4744005)(186003)(36756003)(86362001)(2616005)(71200400001)(26005)(6916009)(6512007)(6506007)(54906003)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BC19016A3B248644A697B528AF126D6A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6549
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	58c70a91-44c9-49db-6427-08da2cedca72
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7acEtjr9ShExe0C7xcVPS0v3OaEHMQ8CGEjmhbVRiaelyK0frQTGZSMiC78IFRfVhk94c2LiA+NRXi0oxRP9SCSyJFkeZmJMG6sREdNZpKufNSJ5T60lMVSlUp1g8Q7lZyTLGGfey0aMN9URe6rJBgYo3EIG/GRw42Hin6dvwcfFR1KqTHmZjRfSvsgUO87ynHBN7mLCqdHyOjKAkH+90OAquFdSZLLOloyKme6DSW3TfvrOM6wSWFwurhJ5zDzoLXeYjrCd5h7QWJJ1s+zJL3Vay8YsWIaaNTYYWZ/+Lsms1N7Bvpsj1/Mae5Dxhz9e3AvLxvqNqwiR6dgRv2Noph5ilEanHfBRd5t7YRBsBQ2/CqlSTE8YUcq88ILqOfBDqbs7viIB6Ms9h7zey4rz9duTdJqt/87xN7dNZrzbGhJNed3s3nUeE+psu4drrsW0g7+tOixKUz03WGiRGI2l6QsMeHT5Fb6VGGHVYLbmjqOmtJe+EpUP5iez7d8CRZjXOyYNgYfLejH6sBYDb0SXIA1E7xArgEHGiKa+mGNo1sWP94YPH5FGe4nwEFFP0gaMwN3R63vpFEfWu4sbDC0qNJgF/id+orfIazzjJreCF4rie1Y8X+qIc/JIyqBV9x8zS6tJoqCyB2ufldxCLBXNDuEgiZe3h7ddo6gLiuae1z+g0/+9uXV7wQg8vUA8nOiwintRYqBIPrOkzWIaK6O9pvvbRg6kvuEP1Ze8RfRj8/OKt+tPpD1WnzmTodBBqWO6N1lHmZ2QxFjVN039PmXQAw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(82310400005)(33656002)(54906003)(8676002)(6862004)(4326008)(86362001)(356005)(2906002)(4744005)(316002)(966005)(6486002)(36756003)(5660300002)(70586007)(8936002)(70206006)(508600001)(53546011)(186003)(336012)(2616005)(47076005)(26005)(6506007)(107886003)(81166007)(6512007)(36860700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 10:15:11.9966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dfa394-a002-460f-866d-08da2cedcf2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4003



> On 29 Apr 2022, at 21:57, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> When the length of the string is zero of_property_read_string should
> return -ENODATA according to the description of the function.
>=20
> However, of_property_read_string doesn't check prop->length. If
> prop->length is zero, return -ENODATA.
>=20
> Without this patch the following command in u-boot:
>=20
> fdt set /chosen/node property-name
>=20
> results in of_property_read_string returning -EILSEQ when attempting to
> read property-name. With this patch, it returns -ENODATA as expected.
>=20
> This commit is a backport of:
> https://lore.kernel.org/xen-devel/20220416003028.1315268-1-sstabellini@ke=
rnel.org/
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> Changes in v5:
> - backport from Linux, I don't have the commit id yet so I used an LKML
>  link instead for now


