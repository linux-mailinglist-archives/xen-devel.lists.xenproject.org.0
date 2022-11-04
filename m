Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440AA619476
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:31:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437501.691921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtxk-0004cn-8N; Fri, 04 Nov 2022 10:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437501.691921; Fri, 04 Nov 2022 10:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtxk-0004Zk-41; Fri, 04 Nov 2022 10:30:12 +0000
Received: by outflank-mailman (input) for mailman id 437501;
 Fri, 04 Nov 2022 10:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtxh-0004Ze-IJ
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:30:09 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20048.outbound.protection.outlook.com [40.107.2.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a68292ec-5c2b-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 11:30:07 +0100 (CET)
Received: from AS8PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:20b:311::27)
 by VE1PR08MB5662.eurprd08.prod.outlook.com (2603:10a6:800:1a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 10:30:04 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::50) by AS8PR05CA0022.outlook.office365.com
 (2603:10a6:20b:311::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:30:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:30:03 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Fri, 04 Nov 2022 10:30:03 +0000
Received: from 38e502c9f4b2.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 228A3F18-1179-4988-BE9B-28819182EADA.1; 
 Fri, 04 Nov 2022 10:29:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 38e502c9f4b2.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:29:55 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VE1PR08MB5822.eurprd08.prod.outlook.com (2603:10a6:800:1a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:29:50 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5769.016; Fri, 4 Nov 2022
 10:29:50 +0000
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
X-Inumbo-ID: a68292ec-5c2b-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hbE9X5IQNjl47ZvUuTxdQAmtUCiEpG78gvjzhsqAzc967HVbcxYY7J/PGyKKX1NdCydtNO2Y41yUfD70uB02Llvj2KCMCvIAGPyys3Y0aAz7pVl6W0VQyCA6zrsxIke/g3WAkRwJhQb5JQcmBZn/UdIcQY5HzrIAdFL8XqEjQU1h1r1RuCkRYyCFWwB0UQQwqVljWvlco/BS/ZyFp3QT4P/TJEiIXivhA3UIcbYkMUlQSr/4W2XhFsK+Yifgb645+v4DqsS2+eTlLoaL2WFuJ1b4R+RR3/HxYc8mfDyG5tmQ6Qx1TdKpXaec8frF2XgDYkd4tzqmGw345cDJy+25MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2/1Zk08baYKUnZ4Ze3qeMxNV80jfkU8x0Nla7XtZW0=;
 b=IY3Z2jT5ZxD3jIKUpopsbXq38FrNFORT1H1vGy3UZ2UOnUrGiQEMpsm/7RtuMkQcUCTMwKvKdvLUiw6dw3PpJUEG1ZOe5QiEcsFMC0mOEkg4nD16CqCoI9xL0U9ZYSM/7mdgbhsLF+yHHtkGJHTS3mQT3hPsjA2OLyYgk9C76PrBXoXRRDEA1CZFGZ+tS03J1OIXwiyTxMf4e4IV9vsWNdABvr6a4fzHD6HNK65Es48pvDBi6gPvHDmnvilcTppAAB/HXjLT55ctznW35MMqq02qxSGM9Lab+ee3Uq3xKWGEfY3jwavDpgpex82i72BIMZg3fJ2miS3ShfhF0sGBbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2/1Zk08baYKUnZ4Ze3qeMxNV80jfkU8x0Nla7XtZW0=;
 b=x/OdtfAtPbItRjkzdM4yEOUwhT9T5I7i0OS+Ca4B8KByD7WpatuLsFMlSliVxuP5lg2VjnEWcEMFjfcWOIVxKkRCtkCs3YeHB3Q+qL6IUj3tlbZQRGjU9WO+hJCL2b7wpHoRyX0k+ChrybOyzJscCFVMGOX8YAtbw2fbqL4Ggp8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZMNhzB7YbqnpARmna1PFC8nvMoiBbwJZIaTnaEt0cUzHewVQNbQWXFYbxc/dXqy2Qo1ueTQP7iGow3LQQ1irH4Ansy3ZW495Pd/ZIiOgkKtQEItz/AaX4mYUxp/aumfjwNyE+AqxULHtqMtPs5EDCBkpNXhi/iVPvL9suTrGJvea3+Xd8qgS/ex01aVszuKXhR7trMj5+Os1+RMy4ftGSeaxEKpzUgP/CbMbvViTyT1DZ9FKzZX+goRgYrD61ifb3+ktGrzh6GJQ92fbwiUbERhSoq1xyMtVOJKNjgH8wmd29QHZjBC+hZfgtpuJIiuWvgzDv4IBH+5HrKoZk0lCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2/1Zk08baYKUnZ4Ze3qeMxNV80jfkU8x0Nla7XtZW0=;
 b=K2HZe+YQp/IRaPIA0WlJFMQr6yg/zzK62g5ai9KPGww65HAG/ByLoNUUOvclPtZL/j/uDEkYjoAwjoZBUEV+hqVafx277Vvp62wvM6tmUqGXaz/OUrJqH6eF+pUE1Wlv3x/F/0Z/ScrfrbucrCs3+i9FuZhjMCH8uLgDENeyMGdu0BCYIYbboW2L/qz97h26HTexS5jFGqtenmydElz5ldqNIKZTO3tRifVKjzaANkF2TUa6hI1kzTYYiWPDQhYPl0Jweo1SpoRatT4NLrOi79qP5mobFe9Qn9SOOkUGg8+EV7svqQ8EIqY5IVsrk3Qble9lJviNzXZzUzTBpeuOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2/1Zk08baYKUnZ4Ze3qeMxNV80jfkU8x0Nla7XtZW0=;
 b=x/OdtfAtPbItRjkzdM4yEOUwhT9T5I7i0OS+Ca4B8KByD7WpatuLsFMlSliVxuP5lg2VjnEWcEMFjfcWOIVxKkRCtkCs3YeHB3Q+qL6IUj3tlbZQRGjU9WO+hJCL2b7wpHoRyX0k+ChrybOyzJscCFVMGOX8YAtbw2fbqL4Ggp8=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Thread-Topic: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Thread-Index: AQHY8DVcKFNDls96akm0LlhB1cf9B64uj+2A
Date: Fri, 4 Nov 2022 10:29:50 +0000
Message-ID:
 <PAXPR08MB7420529932E89FA43E51D8AB9E3B9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 633F9195BBCC7B4185DD3F8634782536.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|VE1PR08MB5822:EE_|AM7EUR03FT005:EE_|VE1PR08MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: 58fa15cf-8410-4024-df5d-08dabe4f8914
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mh4adz+jMOs4clkmtybn1Oz4uAL+WL7RFhMMqtmW3YE/KY18UE0qy87MeCO/+wWNoYHB7Ufy9HPTdDoPN9gNRo13Hog4bdsxna6LZoCGvE5Y7hF/CHgH2FaREstuT3CYWIY0QObK8TB/gTWRaaK/m1oJSly/22mmMDdcpk/Pr0BW5vHQKXuh9xqw119Zvel9aH7uhzM+C+Fva1ra9CCePNObMeGSzMEIN1bPnXzvU9oJar6r+B3Pz57AKkqtig8By3MA/rkjnSPFDr8Y95X9Ud8jhb8LldEChCCDD0c5+20cw7F9d7TcNLdqgIvSnwrNOjeSUIfyBjC6sYj2tCpeYVT3zKWlCSpoRuHv1wvhmvrdZJywtnelTG54wJZnZcDBxH15WIsdYI8TeaFGDO2qSuG9lw6/Whh8TItpXcWERFTxNOPJTdA3zva/V0d9oYcIcW9vPkk6CKExzqi7LagEPuW2/mhWmSDB1LSoOkbzXuDJZnkZzkxQx0uG0pBZMYdkdevoVhasOp++t8yGGwvyuXHEjQK2odsah1g1G/JTVKeOuwmly3t5g7Ry2P23vOKP9Hutl5tke5756Q5QjU4notF0gFZiQWcls/JbXBQJnfn6QY7aX+t2PzcKHdbDtAGgzUZP05moNCVHw3CCvsxcdnA0MpAF+HPipfZvrKD1slU6x21RGpQTHgOfWw11PsJZ6hQ116FNC+ifpmd6j4lIKvxTlssZdVVz6ocBsJKiZpQTE1Zc361Ixltb/bg2Sr7L9xU1fR1j87+sUTf4HfeOealP8kdq8XKgri/p0lN0gHUysFb8FOg20IVejO2ba9Lt5p3UC4lSrxPm88XiiID4h42TIgUGc6JQPyDnVHnyQUk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199015)(71200400001)(33656002)(54906003)(38070700005)(8936002)(5660300002)(66556008)(66446008)(66476007)(66946007)(64756008)(52536014)(41300700001)(86362001)(2906002)(110136005)(316002)(4326008)(8676002)(76116006)(9686003)(55016003)(122000001)(966005)(38100700002)(53546011)(6506007)(478600001)(7696005)(83380400001)(186003)(26005)(17413003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c69ff0f-f2e7-40e5-40dd-08dabe4f8111
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	avpfb3NaytRnKLXARZBP48q5VPzySaQjE0VBedIo2T0LSPLEfbKbcsTMDWDnFjZoro4civN245CoiF5fm+ILHIvN+ZkefwhkQEjNhg3NAu+Xs9t15T7tnwduPkkJ9Ol4OfASkgd7uXgdfoJETvWrdZDFlALTqc/nnQ/gZdedRLYEMmmyx7xY51nhbnCMhpBvYc66NRCNUhTlDe+vXGRRBJBbG/emkGFezpVBKnpZsqQ3kiJ4bNlW5AMSvdwe7FcNbv/no3UnSsFjw/Qd0lfsoN6tgAF/+UdsnES8H0koPE9jpEmHECaSN6lCSGTsltI09sgeMFzHbIGB3gpqzvVXo+FnsJZ08+ImyWKcGu1QxZccX+lCsju5xbWrk45LnO8HC34tU+Eg4Nh033J8kEf+LRq/XtuJcFjGQc5sRR5UYG4UB1FK+1dCPLN9qnZFzAD/3lLedJjowc2HEuAxbmyFXi9rvnZnH6hAzRNPhUKo/B2jF4H2BmWlNFBF//G8fagiK4FD0O9mAhcbslXu3yoeLmtnUP0LgpiEIJ2zBXm3D2bGPwnIDRB6kq1KkkHzFi4anPlCdFME8fGbM0CmgqJ2wz6XrTCMLJsX3SeUSHsN4T05rhA0zchBRsDZmTyyVD3AHg4u37wXw6ZriEaQep1CN05sSYER6luzmHnLIjs7GtbaplbRWHLHbvJemdl2ffL1b4j06n634ZkYyn3v2CMsPk8TKk51HXwM4oqw+H4jaMZydbhudv0XKlGohdTLLaVnxcdnz8xbKJHos/7SjzuONIlQFuiwgMQEOA60vHY/ubgj9asJqbNAYa/MhIFsmAnhWyh/vxlOYY8w+H86IYJrs8PEupZ7/StnIaraXb369As0zjz2gCGfW/Gh3Y13V98O
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(2906002)(47076005)(40460700003)(33656002)(9686003)(26005)(70586007)(70206006)(8676002)(4326008)(41300700001)(40480700001)(356005)(55016003)(82310400005)(81166007)(86362001)(316002)(110136005)(54906003)(82740400003)(107886003)(36860700001)(478600001)(8936002)(5660300002)(52536014)(186003)(336012)(53546011)(7696005)(6506007)(966005)(17413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:30:03.7105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fa15cf-8410-4024-df5d-08dabe4f8914
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5662

U29ycnkgZm9yIHRoZSB3cm9uZyBwYXRjaCB2ZXJzaW9uLiBUaGlzIGlzIHRoZSBmaXJzdCB2ZXJz
aW9uIG9mIHRoaXMgc2VyaWVzLg0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiBT
ZW50OiAyMDIyxOoxMdTCNMjVIDE4OjA4DQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+
OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFy
cXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjYgMDAvMTFdIHhlbi9hcm06IEFkZCBBcm12OC1SNjQg
TVBVIHN1cHBvcnQgdG8gWGVuIC0NCj4gUGFydCMxDQo+IA0KPiBUaGUgQXJtdi1SIGFyY2hpdGVj
dHVyZSBwcm9maWxlIHdhcyBkZXNpZ25lZCB0byBzdXBwb3J0IHVzZSBjYXNlcw0KPiB0aGF0IGhh
dmUgYSBoaWdoIHNlbnNpdGl2aXR5IHRvIGRldGVybWluaXN0aWMgZXhlY3V0aW9uLiAoZS5nLg0K
PiBGdWVsIEluamVjdGlvbiwgQnJha2UgY29udHJvbCwgRHJpdmUgdHJhaW5zLCBNb3RvciBjb250
cm9sIGV0YykNCj4gDQo+IEFybSBhbm5vdW5jZWQgQXJtdjgtUiBpbiAyMDEzLCBpdCBpcyB0aGUg
bGF0ZXN0IGdlbmVyYXRpb24gQXJtDQo+IGFyY2hpdGVjdHVyZSB0YXJnZXRlZCBhdCB0aGUgUmVh
bC10aW1lIHByb2ZpbGUuIEl0IGludHJvZHVjZXMNCj4gdmlydHVhbGl6YXRpb24gYXQgdGhlIGhp
Z2hlc3Qgc2VjdXJpdHkgbGV2ZWwgd2hpbGUgcmV0YWluaW5nIHRoZQ0KPiBQcm90ZWN0ZWQgTWVt
b3J5IFN5c3RlbSBBcmNoaXRlY3R1cmUgKFBNU0EpIGJhc2VkIG9uIGEgTWVtb3J5DQo+IFByb3Rl
Y3Rpb24gVW5pdCAoTVBVKS4gSW4gMjAyMCwgQXJtIGFubm91bmNlZCBDb3J0ZXgtUjgyLA0KPiB3
aGljaCBpcyB0aGUgZmlyc3QgQXJtIDY0LWJpdCBDb3J0ZXgtUiBwcm9jZXNzb3IgYmFzZWQgb24g
QXJtdjgtUjY0Lg0KPiBUaGUgbGF0ZXN0IEFybXY4LVI2NCBkb2N1bWVudCBjYW4gYmUgZm91bmQg
WzFdLiBBbmQgdGhlIGZlYXR1cmVzIG9mDQo+IEFybXY4LVI2NCBhcmNoaXRlY3R1cmU6DQo+ICAg
LSBBbiBleGNlcHRpb24gbW9kZWwgdGhhdCBpcyBjb21wYXRpYmxlIHdpdGggdGhlIEFybXY4LUEg
bW9kZWwNCj4gICAtIFZpcnR1YWxpemF0aW9uIHdpdGggc3VwcG9ydCBmb3IgZ3Vlc3Qgb3BlcmF0
aW5nIHN5c3RlbXMNCj4gICAtIFBNU0EgdmlydHVhbGl6YXRpb24gdXNpbmcgTVBVcyBJbiBFTDIu
DQo+ICAgLSBBZGRzIHN1cHBvcnQgZm9yIHRoZSA2NC1iaXQgQTY0IGluc3RydWN0aW9uIHNldC4N
Cj4gICAtIFN1cHBvcnRzIHVwIHRvIDQ4LWJpdCBwaHlzaWNhbCBhZGRyZXNzaW5nLg0KPiAgIC0g
U3VwcG9ydHMgdGhyZWUgRXhjZXB0aW9uIExldmVscyAoRUxzKQ0KPiAgICAgICAgIC0gU2VjdXJl
IEVMMiAtIFRoZSBIaWdoZXN0IFByaXZpbGVnZQ0KPiAgICAgICAgIC0gU2VjdXJlIEVMMSAtIFJp
Y2hPUyAoTU1VKSBvciBSVE9TIChNUFUpDQo+ICAgICAgICAgLSBTZWN1cmUgRUwwIC0gQXBwbGlj
YXRpb24gV29ya2xvYWRzDQo+ICAtIFN1cHBvcnRzIG9ubHkgYSBzaW5nbGUgU2VjdXJpdHkgc3Rh
dGUgLSBTZWN1cmUuDQo+ICAtIE1QVSBpbiBFTDEgJiBFTDIgaXMgY29uZmlndXJhYmxlLCBNTVUg
aW4gRUwxIGlzIGNvbmZpZ3VyYWJsZS4NCj4gDQo+IFRoZXNlIHBhdGNoIHNlcmllcyBhcmUgaW1w
bGVtZW50aW5nIHRoZSBBcm12OC1SNjQgTVBVIHN1cHBvcnQNCj4gZm9yIFhlbiwgd2hpY2ggYXJl
IGJhc2VkIG9uIHRoZSBkaXNjdXNzaW9uIG9mDQo+ICJQcm9wb3NhbCBmb3IgUG9ydGluZyBYZW4g
dG8gQXJtdjgtUjY0IC0gRHJhZnRDIiBbMV0uDQo+IA0KPiBXZSB3aWxsIGltcGxlbWVudCB0aGUg
QXJtdjgtUjY0IGFuZCBNUFUgc3VwcG9ydCBpbiB0aHJlZSBzdGFnZXM6DQo+IDEuIEJvb3QgWGVu
IGl0c2VsZiB0byBpZGxlIHRocmVhZCwgZG8gbm90IGNyZWF0ZSBhbnkgZ3Vlc3RzIG9uIGl0Lg0K
PiAyLiBTdXBwb3J0IHRvIGJvb3QgTVBVIGFuZCBNTVUgZG9tYWlucyBvbiBBcm12OC1SNjQgWGVu
Lg0KPiAzLiBTTVAgYW5kIG90aGVyIGFkdmFuY2VkIGZlYXR1cmVzIG9mIFhlbiBzdXBwb3J0IG9u
IEFybXY4LVI2NC4NCj4gDQo+IFdlIHdpbGwgc3BsaXQgdGhlc2UgcGF0Y2hlcyB0byBzZXZlcmFs
IHBhcnRzLCB0aGlzIHNlcmllcyBpcyB0aGUNCj4gcGFydCMxLCB0aGUgZnVsbCBQb0MgY2FuIGJl
IGZvdW5kIGluIFszXS4gTW9yZSBzb2Z0d2FyZSBmb3INCj4gQXJtdjgtUjY0IGNhbiBiZSBmb3Vu
ZCBpbiBbNF07DQo+IA0KPiBbMV0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0
aW9uL2RkaTA2MDAvbGF0ZXN0DQo+IFsyXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjItDQo+IDA1L21zZzAwNjQzLmh0bWwNCj4gWzNdIGh0
dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYm1hcnF1aXMveGVuLWFybS1wb2Mv
LQ0KPiAvdHJlZS9wb2MvcjgyLW1wdS12Mg0KPiBbNF0gaHR0cHM6Ly9hcm12OHI2NC1yZWZzdGFj
ay5kb2NzLmFybS5jb20vZW4vdjQuMC8NCj4gDQo+IFBlbm55IFpoZW5nICgzKToNCj4gICB4ZW4v
YXJtNjQ6IGNyZWF0ZSBib290LXRpbWUgTVBVIHByb3RlY3Rpb24gcmVnaW9ucw0KPiAgIHhlbi9h
cm02NDogaW50cm9kdWNlIGhlbHBlcnMgZm9yIE1QVSBlbmFibGUvZGlzYWJsZQ0KPiAgIHhlbi9h
cm02NDogYWRkIHNldHVwX2ZpeG1hcCBhbmQgcmVtb3ZlX2lkZW50aXR5X21hcHBpbmcgZm9yIE1Q
VQ0KPiANCj4gV2VpIENoZW4gKDgpOg0KPiAgIHhlbi9hcm06IHJlbW92ZSB4ZW5fcGh5c19zdGFy
dCBhbmQgeGVuaGVhcF9waHlzX2VuZCBmcm9tIGNvbmZpZy5oDQo+ICAgeGVuL2FybTogYWRkIGlv
dW5tYXAgYWZ0ZXIgaW5pdHJkIGhhcyBiZWVuIGxvYWRlZCBpbiBkb21haW5fYnVpbGQNCj4gICB4
ZW4vYXJtOiBkaXNhYmxlIEVGSSBib290IHNlcnZpY2VzIGZvciBNUFUgc3lzdGVtcw0KPiAgIHhl
bi9hcm06IGFkanVzdCBYZW4gVExCIGhlbHBlcnMgZm9yIEFybXY4LVI2NCBQTVNBDQo+ICAgeGVu
L2FybTogZGVmaW5lIFhlbiBzdGFydCBhZGRyZXNzIGZvciBGVlAgQmFzZVIgcGxhdGZvcm0NCj4g
ICB4ZW4vYXJtOiBzcGxpdCBNTVUgYW5kIE1QVSBjb25maWcgZmlsZXMgZnJvbSBjb25maWcuaA0K
PiAgIHhlbi9hcm06IGltcGxlbWVudCBGSVhNQVBfQUREUiBmb3IgTVBVIHN5c3RlbXMNCj4gICB4
ZW4vYXJtNjQ6IG1vdmUgTU1VIHJlbGF0ZWQgY29kZSBmcm9tIGhlYWQuUyB0byBoZWFkX21tdS5T
DQo+IA0KPiAgeGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDE1ICstDQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
fCAgIDUgKw0KPiAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyAgICAgICAgICAgICAgICAgICAg
IHwgNDI5ICsrLS0tLS0tLS0tLS0tLS0tLQ0KPiAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWRfbW11
LlMgICAgICAgICAgICAgICAgIHwgMzY0ICsrKysrKysrKysrKysrKw0KPiAgeGVuL2FyY2gvYXJt
L2FybTY0L2hlYWRfbXB1LlMgICAgICAgICAgICAgICAgIHwgMTU0ICsrKysrKysNCj4gIHhlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYyAgICAgICAgICAgICAgICAgICB8ICAgMiArDQo+ICB4ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvZmx1c2h0bGIuaCAgICAgfCAgMjUgKw0KPiAgeGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L21hY3Jvcy5oICAgICAgIHwgIDUyICsrLQ0KPiAg
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L21wdS5oICAgICAgICAgIHwgIDEzICsNCj4g
IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9zeXNyZWdzLmggICAgICB8ICA4OSArKysr
DQo+ICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnLmggICAgICAgICAgICAgfCAgOTkg
Ky0tLQ0KPiAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NvbmZpZ19tbXUuaCAgICAgICAgIHwg
MTE5ICsrKysrDQo+ICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnX21wdS5oICAgICAg
ICAgfCAgMjkgKysNCj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9maXhtYXAuaCAgICAgICAg
ICAgICB8ICAyNSArDQo+ICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZmx1c2h0bGIuaCAgICAg
ICAgICAgfCAgMjIgKw0KPiAgLi4uL2FybS9pbmNsdWRlL2FzbS9wbGF0Zm9ybXMvZnZwX2Jhc2Vy
LmggICAgIHwgIDE4ICsNCj4gIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZyAgICAgICAg
ICAgICAgICB8ICAxNiArLQ0KPiAgMTcgZmlsZXMgY2hhbmdlZCwgOTc2IGluc2VydGlvbnMoKyks
IDUwMCBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vYXJt
NjQvaGVhZF9tbXUuUw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9hcm02NC9o
ZWFkX21wdS5TDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2FybTY0L21wdS5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2NvbmZpZ19tbXUuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9jb25maWdfbXB1LmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vcGxhdGZvcm1zL2Z2cF9iYXNlci5oDQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K

