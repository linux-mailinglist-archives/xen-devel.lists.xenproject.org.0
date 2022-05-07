Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3C851E5FF
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 11:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323653.545422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnGcg-0007Gp-1O; Sat, 07 May 2022 09:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323653.545422; Sat, 07 May 2022 09:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnGcf-0007D8-UU; Sat, 07 May 2022 09:21:09 +0000
Received: by outflank-mailman (input) for mailman id 323653;
 Sat, 07 May 2022 09:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJZu=VP=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nnGce-0007D2-Uq
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 09:21:09 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe05::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05dcbb27-cde7-11ec-a406-831a346695d4;
 Sat, 07 May 2022 11:21:06 +0200 (CEST)
Received: from DB7PR03CA0099.eurprd03.prod.outlook.com (2603:10a6:10:72::40)
 by DB7PR08MB3115.eurprd08.prod.outlook.com (2603:10a6:5:1d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Sat, 7 May
 2022 09:21:04 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::97) by DB7PR03CA0099.outlook.office365.com
 (2603:10a6:10:72::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21 via Frontend
 Transport; Sat, 7 May 2022 09:21:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Sat, 7 May 2022 09:21:03 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Sat, 07 May 2022 09:21:03 +0000
Received: from 583370501699.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 25E482B6-2BDE-4250-9BD1-D38480D77F5B.1; 
 Sat, 07 May 2022 09:20:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 583370501699.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 07 May 2022 09:20:52 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB3088.eurprd08.prod.outlook.com (2603:10a6:803:3f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sat, 7 May
 2022 09:20:49 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%4]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 09:20:49 +0000
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
X-Inumbo-ID: 05dcbb27-cde7-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZcABmErkokP8iYM3OMIexxrXkKzGreZrK88fwCUBWJue22I7fpdL8CnPzXOEt3swYp2luvgqo5XbiVaBo+qjQN+N49WoOaC7Zx8lPb+v9j8A486DJy11rhfLS5oTfYrsMCmVwHnnW4Kf1AsHGpKlB7Ej0InCFEVWncNnm0FrAmrRMoWOIQcWfKq/WEdR6nHrJBNzyOOSqrYGMxQKJCKYS08pzojkvJwopfMd2t0/JbQ2vi9itwsbWwGJWYZnHuwpjM/TS1Qtc1+kcueiydPfqRbcGaSJF4+Q/QtdYIOBy8gzdXsN89qKpbh2EHFjQo8e0Uw15l5aOehH6IiUjwZtnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4cXI1jrvipil1Uc8qsyj9LOctdmx7HmZqFp41ZPEdY=;
 b=D5DnCjGSfRqwRVRnORQRQ+EEljNwUTphd+iGmR+wlY4brWCezY/Y2A7VYnRfjiSARwCBl1SrdyqDJbkzhIIjxRvnJBK456Z80vIvy33dfYyi60nojquBBGT/gjyX5gAN0S1wwKgcbzIwGqksGPiGYD/8SlgjVzTwz00iAqQs8P7Rs4we6VUHhBcNlGP64JBkZmtnpYikXThfZ/53wp72lHLehlbPXbztFSUBSqOlyUzfk9003kjuoHpbDcR9pCYcVRzYo4BYwPIRriocHqTnq9XcIdgOPLZUPCkWXYzcUOH4wrP6nxgeIXAdznk4oMi+9IDnw3HLt6MEGV8HgDocwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4cXI1jrvipil1Uc8qsyj9LOctdmx7HmZqFp41ZPEdY=;
 b=h0XwuWBlTu11hkHY/a+23Ogz5qF3ObJidgLBXjJ3tvhPAWX56iohR6khrauG5Nb6Q4q1Bt4GUQ4P3ksaOzHD5EqKjNQWVoD948iFERSMj2kOZYOu9Gr3lcO+cOrNIiJrT+qxqJQ2uJ+OuvLyMY3ckQGC+D89nINORrVN/9hEIec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVcBIPe5ch5oihU7G5NQP70K88mnuV9as8YVtuQGVaCWOZ0i0WuByHO5uDtvXWR236IS4NZKWSth0NjycOuDAgOGoA9NExNjTcRYCpkuxazn/JkP8B/d6Ju18csG82yYCtNu+gE0AJAOAtloimVWAq9Yd/lM195hc0t1nLfowuH3vLFDB+U4A1EHT76yXF5tVeSctEMuW6iUZfUCnSEODma7miIgRSBbHoXwcfkDjbbcgI2sDgPI6IZYag+wGF6DQ2++SjLr9sYzW68UC1lDZFTiRoq0GKsvO//N/XMCdRegMi91Yn8YOBqzVNfWaRBiWldaflHo4ArZ5FA166Cxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4cXI1jrvipil1Uc8qsyj9LOctdmx7HmZqFp41ZPEdY=;
 b=Md3EqsYUFEOIh0pGV4gdCuu3uaeiNuFh0D3uXO0Tz98PpX02Suyf8Nw+mH5oIkYsk03C7QL143kGUPZnT8nnHDE3sYV71nPzspmMp69EP9cBwJwiEf8oLlggVWGrjdDeNvGfZcAbgktHnXmIx3y8bnRkVkVM0AX/kcC+61e88dMZXF8ifGzXfMVAEKfptEJQ50dlqTwbTBGOQEqATziH6zq2GWhjh2Om7FMOs5E+N7BAy8AvoHMJZTwZXFtA/mM1GADYRei8SXEa5VvWf2jMuwsKsOktgrz8gLk1fPRvFnfcBl1xBiJhiTxy8//yh6PJeCaG/HrPc96Kp53Q8bt+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4cXI1jrvipil1Uc8qsyj9LOctdmx7HmZqFp41ZPEdY=;
 b=h0XwuWBlTu11hkHY/a+23Ogz5qF3ObJidgLBXjJ3tvhPAWX56iohR6khrauG5Nb6Q4q1Bt4GUQ4P3ksaOzHD5EqKjNQWVoD948iFERSMj2kOZYOu9Gr3lcO+cOrNIiJrT+qxqJQ2uJ+OuvLyMY3ckQGC+D89nINORrVN/9hEIec=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 6/9] xen/arm: add P2M type parameter in
 guest_physmap_add_pages
Thread-Topic: [PATCH v2 6/9] xen/arm: add P2M type parameter in
 guest_physmap_add_pages
Thread-Index: AQHYYRqTRs6WKDynUESu6+gNH4KxLK0TH6WAgAAFK1A=
Date: Sat, 7 May 2022 09:20:49 +0000
Message-ID:
 <DU2PR08MB73254BF9880B718BA1631D7CF7C49@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
 <20220506072502.2177828-7-Penny.Zheng@arm.com>
 <442a17fb-b859-8067-417e-a1286dfcec80@xen.org>
In-Reply-To: <442a17fb-b859-8067-417e-a1286dfcec80@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1E505C8F72B33C4AAABFAD19E397AF95.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c939fb91-ea8c-4663-0679-08da300ae88f
x-ms-traffictypediagnostic:
	VI1PR08MB3088:EE_|DBAEUR03FT058:EE_|DB7PR08MB3115:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB31156B04C45A8E8B6C86FD05F7C49@DB7PR08MB3115.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u6KE8Rs6/6nlFIsr4/IlH3y8GPKz/RJNMMo6tVbNBadRIu6hRFwhIPaCXl1DvQS/CUb3Gq1ePVHjKkrIUUdy/JKK2hb6AbA4xST222hHQIAzZ6akxzFpsb7LngNC+nhLko2rzJ4nbmqRM2al6OiZgEQHx92a3y17fD/Crk++kJdDT6A8kAOG7mxa3d5HrfCqcXfXTifsufmsIlyE+gLF/jkh7hbn6rAy/dblJcnEMmKcateJPOqpfUCvVD6QSLwT/CqpWVE+gqMXb6e0rUo+w8s+aZC94gsOqoAhIatDgca7w8SkGB9867y5kkkFrWUg610K+s9wASjV/UyR6RYQf0bkbOuDicd/gUek4MlCG1Z6DynTKt3zO2n2vYb74RF+cnK/r6ZhcnS3YL9LWlfmmacQwt6KbiPi3W3B299ybZCoeRn9cMJIS2W6k3jQDp9fz0vPRSWBjP07ltm1Xu3c/r9pfR6lLAXeEieN8Q6rF/rBIgSWkkufgUdnkuZdZxeL767Cm5qiJj5BtCLwYw822uDeDVJbSpeYwY+lzQAYvYy52YmWj0nhrE+wlI6+OFcymuvsKT5ynHTCE8DLd2Pf6GWdRbxcHp/67Ji1YdYthg2CeXUgZrDI5UZbNcX1QOi6OhXA+SJbOxRMfFl0EAZq8Lh8U3cjAgK/cZqJZfxLt4xW6CHWa7R3PumlBMuLTkFqbTeveP+vLVfqRtSJzOpVOQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(2906002)(7696005)(5660300002)(508600001)(9686003)(8936002)(66476007)(66556008)(26005)(76116006)(66946007)(66446008)(64756008)(6506007)(53546011)(33656002)(86362001)(71200400001)(52536014)(316002)(83380400001)(54906003)(122000001)(38070700005)(186003)(38100700002)(55016003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3088
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c540d85c-eeec-4912-a78e-08da300adff0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cTi38DY2hrxTL+VTVe8knLObB6HqtAJumM0sbjqsv3PUW8Gq6PvtHLOatUaiC3ZJPM+TJEOFBXjREwIZ0lpATy519LdmAanLI7roO2L1170F0/XrtijZmr1K7dg2yjMPmjM6c9AAVxvzTun8NwsdyESWs96ITu+9RLdeMpRwmT85Fo7rq+nrjKrSUh9ad+a5bggSIDi1Dpyy7m1gYg9d5zINf/P3rWpXwPCPcW2mRgQpB/ux6lJVeO7QL6cYeNbGVmvXQB1r38FAyLZcCxvN5gR5G7x4gG1L23Nytd7mEQGEeXeNT8Vi+3pck3LMn1FnbIkGmEk8gBy9g61EpRt7oAWurwXkRyOm23w/enlVqjv3nu6Y9E4E9h8GN1WxioGMyyH6C6H4LlnitgZpGd2Y23ga/BQCfYiIBA2/d9Ol3kmF4Qt9PgPd/Il5cGVcUJS7+ccJA3T+id9qE7AvF7yz1a/aIuTCjas5rKDCxNrakh/tmf+udyGn6LUTZjjCK2eX4qwJ8ag1f1/kt4k8UTq/BHXg3IL48Q2m3CLgJX8NKQm2CfrvuQFW0pRmDk2CSpyfZmiT41CBzO8C07GKhLFCoTPdsgAIG6Xlq3wx4UL9fOWRCxtMtWNaVfibq9g4RjOPrihi4Mt6YdqdcxZJ1Za+JBbxzzLPtIdsThQg7VH7E6XLKZKDOQ4TcXwjCFjAAg2b
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(55016003)(356005)(26005)(8676002)(4326008)(336012)(86362001)(8936002)(53546011)(7696005)(5660300002)(2906002)(47076005)(52536014)(40460700003)(36860700001)(508600001)(70206006)(70586007)(6506007)(83380400001)(82310400005)(110136005)(81166007)(54906003)(316002)(186003)(9686003)(33656002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 09:21:03.5840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c939fb91-ea8c-4663-0679-08da300ae88f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3115

SGkganVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIE1heSA3LCAyMDIyIDU6
MDEgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5k
IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVr
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA2
LzldIHhlbi9hcm06IGFkZCBQMk0gdHlwZSBwYXJhbWV0ZXIgaW4NCj4gZ3Vlc3RfcGh5c21hcF9h
ZGRfcGFnZXMNCj4gDQo+IEhpLA0KPiANCj4gT24gMDYvMDUvMjAyMiAwODoyNCwgUGVubnkgWmhl
bmcgd3JvdGU6DQo+ID4gSW4gb3JkZXIgdG8gY292ZXIgdGhlIHNjZW5hcmlvIHdoZXJlIHVzZXJz
IGludGVuZCB0byBzZXQgdXAgZ3Vlc3QgcDJtDQo+ID4gZm9yZWlnbiBtYXBwaW5nIHdpdGggbnJf
cGFnZXMsIHRoaXMgY29tbWl0IGFkZHMgYSBuZXcgUDJNIHR5cGUNCj4gPiBwYXJhbWV0ZXIgaW4g
Z3Vlc3RfcGh5c21hcF9hZGRfcGFnZXMuDQo+IA0KPiBXaXRoIHRoaXMgcGF0Y2gsIGd1ZXN0X3Bo
eXNtYXBfYWRkX3BhZ2VzKCkgYW5kIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKQ0KPiB3aWxsIGJl
aGF2ZSBkaWZmZXJlbnRseS4gVGhlIGZvcm1lciB3aWxsIGJlIGFibGUgdG8gZGVhbCB3aXRoIGFu
eSB0eXBlIHdoaWxzdCB0aGUNCj4gbGF0dGVyIGNhbiBvbmx5IGhhbmRsZSBSQU0gdHlwZS4NCj4g
DQo+IEkgdGhpbmsgd2UgbmVlZCB0byBzdGF5IGNvbnNpc3RlbnQgd2l0aCB0aGUgbmFtZS4gTG9v
a2luZyBhdCB0aGUgZXhpc3RpbmcNCj4gaGVscGVyLCB3ZSBhbHJlYWR5IGhhdmUgb25lIHRoYXQg
c2hvdWxkIHN1aXQgeW91IChzZWUgbWFwX3JlZ2lvbnNfcDJtdCgpKS4NCj4gU28gdGhpcyBwYXRj
aCBsb29rcyB1bm5lY2Vzc2FyeS4NCj4gDQoNClJpZ2h0LCBtYXBfcmVnaW9uc19wMm10IGhhcyB0
aGUgUDJNIHR5cGUgYXMgcGFyYW1ldGVyLiBJJ2xsIGNoYW5nZSB0byBpdC4gVGh4fg0KIA0KPiBD
aGVlcnMsDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55Lnpo
ZW5nQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gdjIgY2hhbmdlOg0KPiA+IC0gbm8gY2hhbmdlDQo+
ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgICAgfCA1ICsrKy0tDQo+
ID4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcDJtLmggfCA1ICsrKy0tDQo+ID4gICAyIGZp
bGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMNCj4gPiBpbmRleCBiM2JhMGM1MDFkLi4wODliOWU5OWZjIDEwMDY0NA0KPiA+
IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYw0KPiA+IEBAIC01MDcsNyArNTA3LDcgQEAgc3RhdGljIGJvb2wgX19p
bml0DQo+IGFwcGVuZF9zdGF0aWNfbWVtb3J5X3RvX2Jhbmsoc3RydWN0IGRvbWFpbiAqZCwNCj4g
PiAgICAgICBlbHNlDQo+ID4gICAgICAgICAgIHNnZm4gPSBnYWRkcl90b19nZm4obWZuX3RvX21h
ZGRyKHNtZm4pKTsNCj4gPg0KPiA+IC0gICAgcmVzID0gZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZXMo
ZCwgc2dmbiwgc21mbiwgbnJfcGFnZXMpOw0KPiA+ICsgICAgcmVzID0gZ3Vlc3RfcGh5c21hcF9h
ZGRfcGFnZXMoZCwgc2dmbiwgc21mbiwgbnJfcGFnZXMsDQo+ID4gKyBwMm1fcmFtX3J3KTsNCj4g
PiAgICAgICBpZiAoIHJlcyApDQo+ID4gICAgICAgew0KPiA+ICAgICAgICAgICBkcHJpbnRrKFhF
TkxPR19FUlIsICJGYWlsZWQgdG8gbWFwIHBhZ2VzIHRvIERPTVU6ICVkIiwgcmVzKTsNCj4gPiBA
QCAtODUwLDcgKzg1MCw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGFsbG9jYXRlX3NoYXJlZF9tZW1v
cnkoc3RydWN0DQo+IGRvbWFpbiAqZCwNCj4gPiAgICAgICBucl9wYWdlcyA9IFBGTl9ET1dOKHBz
aXplKTsNCj4gPiAgICAgICBpZiAoIGQgIT0gZG9tX2lvICkNCj4gPiAgICAgICB7DQo+ID4gLSAg
ICAgICAgcmV0ID0gZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZXMoZCwgZ2FkZHJfdG9fZ2ZuKGdiYXNl
KSwgc21mbiwNCj4gUEZOX0RPV04ocHNpemUpKTsNCj4gPiArICAgICAgICByZXQgPSBndWVzdF9w
aHlzbWFwX2FkZF9wYWdlcyhkLCBnYWRkcl90b19nZm4oZ2Jhc2UpLCBzbWZuLA0KPiBucl9wYWdl
cywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fcmFtX3J3
KTsNCj4gPiAgICAgICAgICAgaWYgKCByZXQgKQ0KPiA+ICAgICAgICAgICB7DQo+ID4gICAgICAg
ICAgICAgICBwcmludGsoWEVOTE9HX0VSUg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vcDJtLmgNCj4gPiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wMm0uaCBp
bmRleCA4Y2NlNDU5YjY3Li41ODU5MDE0NWIwIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9wMm0uaA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9w
Mm0uaA0KPiA+IEBAIC0zMTcsOSArMzE3LDEwIEBAIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2Uoc3Ry
dWN0IGRvbWFpbiAqZCwgZ2ZuX3QNCj4gZ2ZuLCBtZm5fdCBtZm4sDQo+ID4gICBzdGF0aWMgaW5s
aW5lIGludCBndWVzdF9waHlzbWFwX2FkZF9wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLA0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3QgZ2ZuLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuLA0K
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgbnJfcGFnZXMpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBucl9wYWdlcywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCB0KQ0KPiA+ICAgew0KPiA+IC0gICAgcmV0dXJu
IHAybV9pbnNlcnRfbWFwcGluZyhkLCBnZm4sIG5yX3BhZ2VzLCBtZm4sIHAybV9yYW1fcncpOw0K
PiA+ICsgICAgcmV0dXJuIHAybV9pbnNlcnRfbWFwcGluZyhkLCBnZm4sIG5yX3BhZ2VzLCBtZm4s
IHQpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gICBtZm5fdCBnZm5fdG9fbWZuKHN0cnVjdCBkb21haW4g
KmQsIGdmbl90IGdmbik7DQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

