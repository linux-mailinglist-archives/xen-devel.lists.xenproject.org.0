Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2C5259A7
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 04:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328175.551127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npKwz-0002eE-GC; Fri, 13 May 2022 02:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328175.551127; Fri, 13 May 2022 02:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npKwz-0002cE-DC; Fri, 13 May 2022 02:22:41 +0000
Received: by outflank-mailman (input) for mailman id 328175;
 Fri, 13 May 2022 02:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=994T=VV=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1npKwx-0002c8-Om
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 02:22:40 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe09::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e9f7053-d263-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 04:22:38 +0200 (CEST)
Received: from DB6PR07CA0057.eurprd07.prod.outlook.com (2603:10a6:6:2a::19) by
 AM6PR08MB4104.eurprd08.prod.outlook.com (2603:10a6:20b:a9::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.14; Fri, 13 May 2022 02:22:34 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::2b) by DB6PR07CA0057.outlook.office365.com
 (2603:10a6:6:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.5 via Frontend
 Transport; Fri, 13 May 2022 02:22:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 02:22:34 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Fri, 13 May 2022 02:22:34 +0000
Received: from bc86b9393015.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3273E0BB-0946-4A6A-8071-46F5C27748B9.1; 
 Fri, 13 May 2022 02:22:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc86b9393015.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 May 2022 02:22:29 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by HE1PR0802MB2265.eurprd08.prod.outlook.com (2603:10a6:3:c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 02:22:27 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%4]) with mapi id 15.20.5227.023; Fri, 13 May 2022
 02:22:26 +0000
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
X-Inumbo-ID: 8e9f7053-d263-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Y2NNlq7JSzh1K88VpoBJTfiQw8Ryq/+TSACaFmcd0gQ2rfCqR5o/dE7Ib9jQ8jr+2Y2/so7bRXZKBj/u4EA1R5Ie4U1r0aYl6N3Z6vTKC5gaDpjJrcp+DphanWBOKylwwDoghyhXtjmxqb94vZaiJtd58GP0SQavmCKvcljDq+COy9Zy8ywafzK4Ds0GcCeVOYy12J6WUVDJcqyBTuKui5LyE/kgc19oxLwefPXC66KUznNKffQaVu0rh+xvZDQi05xbjFVsdDcqkxwTO8J6pNwUlfpqjLDIaN6Sw5yXHCGLxLVq2NNaxtVVq8b9bZAwmrW26m20CPI0s6LU6wuDCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqjTFTLDZfgvZpsKIEkXgtL0VXupn9ve/YITBfDtPW4=;
 b=DFw490veEaSUKKdS9zRcQSylJiqYJ49CZmBClDcsFqJOsWIxv9vfbjXU9PYt46SuQsVEcO/3btpverNTloCtLFILEOyxksT7jNcrhfq0jQnH1gnmnKZpI1XFSL1/dgNBn0kPvFG98Kq+Ufs8+VrhjTAO2WwwmOd0fg0ElbBvWPM/wLkfe/QKhABZysb5rzH+0YgX/HulzqkPd2hCmVLy/dlIoPWzeXgXTJGcMraF3eZqfNe1cd76hyjbi3OaNji8Ri1hMO6VsxMbhU+xRSRe6jocYv1YrY5xhZp1Cb483R9kGY+5JkPYstXvcgwyiLGivPR7nhHCIt7HKBAfB/BLTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqjTFTLDZfgvZpsKIEkXgtL0VXupn9ve/YITBfDtPW4=;
 b=if+W3ovuzMJ0Twkc0YANFDwF0v6TFKaitqCorT3WyXh5w2qe0ojs0Qch/22LcTSeAyfT9QN9zTrwda0rqZ10DPQ7GRnRCVbBPUxldRdxuP8j7NFufBuwuWgG5Rhx8E84j5+O9StvZGwZ9OUdPoWQKUio77k0TwTibbIyQZlNmVo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQrVY6ZFWA72W4DnYKOP+C5NchALF8SavKjEWxu12DvIzQU0S7PpjFs92Vvr3/4ZBTMJ0vzJYQQw1QvE9wW4NCzkfuyLuZO+kuBcuyPcnSI37UHs/i2EBt1PhMgNtpTsQh4fvEQhpwSrhfq7eFL7w55ONOQBwZeW9w4ZUkI2NMxb1cgn6dKYVRZKiWIgbKQYgktq8nnpVI2W+q2SPtgf9xVJSiakyCVUq+jrRz00NSpCuFKc9h7baKw/ghZQvO0D6Z3QfqR8hZ85ACXcH7TohqJj8cSibCWJwYNoL/eZKeEyd65XJpJxQTADh82TnD16ShG1oOcaeT9/RfZQ98xUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqjTFTLDZfgvZpsKIEkXgtL0VXupn9ve/YITBfDtPW4=;
 b=lC0j/O+5czcZXD5RwXEbWS26PQAoyK6CN1He1gy3ALrHJ+z3RR0Bsy1R2UxW9kyTX6VnvD00ZA/oLX2plcF8J/uLO82+8Bo0I+Mq5s+DiOraPfx438Jl+1BHo58rOlk4SYzXtBidyb2d55O+oZADnU00zaz/2zEyG3j7n3aH3Ho5AzbXgW5yRLGRVpeKGqi5h872GmWnA+SNczPIppqc/lidTncbRc3fayqEhX49mJ/WnI5S/lVGse8mq9lluhyytk+OASC9E/kfat+Q9ALK9u4KkWHNH0Z0xaAZFeGJO7l+7LlUsZyXV0uVvO0Ms4n8ONxSo3ydYQMN3FewxkKe9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqjTFTLDZfgvZpsKIEkXgtL0VXupn9ve/YITBfDtPW4=;
 b=if+W3ovuzMJ0Twkc0YANFDwF0v6TFKaitqCorT3WyXh5w2qe0ojs0Qch/22LcTSeAyfT9QN9zTrwda0rqZ10DPQ7GRnRCVbBPUxldRdxuP8j7NFufBuwuWgG5Rhx8E84j5+O9StvZGwZ9OUdPoWQKUio77k0TwTibbIyQZlNmVo=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v3 4/8] xen/arm: introduce put_page_nr and get_page_nr
Thread-Topic: [PATCH v3 4/8] xen/arm: introduce put_page_nr and get_page_nr
Thread-Index: AQHYZeBr4CimJnwnVk2FbRYk6hcYT60bBl8AgAECWqA=
Date: Fri, 13 May 2022 02:22:26 +0000
Message-ID:
 <DU2PR08MB73258BDEB855D72AF0D0875FF7CA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com>
 <20220512091129.2802997-5-Penny.Zheng@arm.com>
 <47b4d6c2-3bc7-02bc-be5a-a2b782541c3c@xen.org>
In-Reply-To: <47b4d6c2-3bc7-02bc-be5a-a2b782541c3c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 88D7EB5539F8C240BD376BB82E245B0F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cce5cc7b-4b0b-4125-f61b-08da348770bb
x-ms-traffictypediagnostic:
	HE1PR0802MB2265:EE_|DBAEUR03FT061:EE_|AM6PR08MB4104:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB41043466DA8654CE40D2FD5BF7CA9@AM6PR08MB4104.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FE/+cF13yFTYbAjv7Fd4SkwMgRrTTWDt1iXghdTg3lp8mzDr/n1DLr9KOSBp3REwrGYlkijWYV96J8PH9DR18uMD6shxg2e6GT01tSosLHx9OMlPLuQrJHo/o3as21hXwwPksq/HTT7BSCVnn46sBQphPXKNVATZRN024wHwnJNX8sOGf5rUdOxizMgPOwc0UbakE6p5nulZ+hqMlAKd8TgBhunKy2OO3nav6TovzwdT0Tlavoa/RUnyh+bN/wpNVN2ne/c9Xc27eCSNjPQuXi7SakdAS7EIZgp6+QaPJW+CToRdyWzoPg7fk2oDxAePCLghEwGh0vXgo2ot2ovhf1wxIsSqDJC00x7p8uVbKsFuHcae/Ew7aFL9KspWFL047wn2pL73edkP+V/ykRxKSbblf10pwWuSUCspdl8bBGIz4EqCmzEsA1StllEaDu96w5fgORoeR8/ehfpnbPqFTB5uuh4FNrtbJYvFbpkvRVirfDw9m4nVWpNFPMrTHKHRPh1JISSUYdFbzCLYpw3CGWnfF35OPYl/VSVtDkhSqBP9qU7M8uTW1Xd2tzvUqtPZr7ZhUXCsCkHWwEaKrDDOxHnKjYsMoPf+oc52Wl2muwJGcA6k113BmGT+J5BMeYP+87nT+MfZ7p4ToQcBOSKk2YORM4Z058WxdYxuQJPNhABV+7F6sdtGMoJaFg+hOz1Drsn0N5ScVCFdoxgBAtnBLw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(71200400001)(66446008)(66556008)(38070700005)(86362001)(8676002)(110136005)(66946007)(64756008)(76116006)(4326008)(38100700002)(122000001)(508600001)(316002)(55016003)(83380400001)(54906003)(186003)(7696005)(53546011)(6506007)(5660300002)(9686003)(26005)(52536014)(8936002)(33656002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2265
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	484b2714-2e0d-415c-240c-08da34876c40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cCa6HqIeeXKULYmxRzKGhn5t/1uNh3x5EylAIuxir+UZY6R3ThIf4OQ3wDHLStZKMJ/gKCHTRiRvDxK5E63lhXxKZ9T9vf5G4k+T4l+QOCazMiln4KLCtzaN0+BEfWC4a1CL0WooACMqF50W3fKufDyAfBI4pqe3Zn9+OJfWFUp9J3k1RhchAnQZC/6NdGLVLmdyh+ZDeKdKjILzWQYPLiDDS6Z7tuZGFIkDq1Ii+Cq3tAhgCXOwFBAiOP9GwFmkpOan8GrkdOtC0ucjzN3Ug/hF/mfJhVzbTt3oE1KJ7eJGa0QFbDkS/xQ2gl8cVlQnOJCcibU4YNnfBO5sJmlUxZhoP0y3TbSg9/wyHD+l644iaiRecz4Xkp1sKCcPaeoezcjhE5tz3VyZws40FSGtbE+wGbOta5llT3zA+ztLx2UgZxLyoQHwc+v6u7xbCmgav8gWU++jlAA4FgxhJijLK3objU8f0sjqrq0MlNmN8QK2e06iJ6vYOOIluYrLO8YsZA5zwneAlAiBwijf8NUHDrqmB4vdnh+6ankELO/hc0l0ttNTvdjKwDXg5byPMhEIZNzJjlb4sJnTPjzxxRWvZs6Y9VOii7wqX2ldHv61WpTVE7USPH0Bzfo1qTvK5DR4iNb5erlTKIzqpt1XadXvvXfGq00H8jZBvwdb+9XY/Qxlipg3n1iGZdVhIsyChu+o
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70586007)(33656002)(316002)(110136005)(70206006)(356005)(54906003)(186003)(83380400001)(47076005)(9686003)(107886003)(26005)(336012)(2906002)(82310400005)(7696005)(55016003)(81166007)(36860700001)(86362001)(8676002)(40460700003)(8936002)(52536014)(5660300002)(508600001)(53546011)(4326008)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 02:22:34.2942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cce5cc7b-4b0b-4125-f61b-08da348770bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4104

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE1heSAxMiwgMjAyMiA2
OjE0IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+
OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFu
ZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1
ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
NC84XSB4ZW4vYXJtOiBpbnRyb2R1Y2UgcHV0X3BhZ2VfbnIgYW5kIGdldF9wYWdlX25yDQo+IA0K
PiANCj4gDQo+IE9uIDEyLzA1LzIwMjIgMTA6MTEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IExh
dGVyLCB3ZSBuZWVkIHRvIGFkZCB0aGUgcmlnaHQgYW1vdW50IG9mIHJlZmVyZW5jZXMsIHdoaWNo
IHNob3VsZCBiZQ0KPiA+IHRoZSBudW1iZXIgb2YgYm9ycm93ZXIgZG9tYWlucywgdG8gdGhlIG93
bmVyIGRvbWFpbi4gU2luY2Ugd2Ugb25seQ0KPiA+IGhhdmUNCj4gPiBnZXRfcGFnZSgpIHRvIGlu
Y3JlbWVudCB0aGUgcGFnZSByZWZlcmVuY2UgYnkgMSwgYSBsb29wIGlzIG5lZWRlZCBwZXINCj4g
PiBwYWdlLCB3aGljaCBpcyBpbmVmZmljaWVudCBhbmQgdGltZS1jb25zdW1pbmcuDQo+ID4NCj4g
PiBUbyBzYXZlIHRoZSBsb29wIHRpbWUsIHRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBzZXQgb2Yg
bmV3IGhlbHBlcnMNCj4gPiBwdXRfcGFnZV9ucigpIGFuZCBnZXRfcGFnZV9ucigpIHRvIGluY3Jl
bWVudC9kcm9wIHRoZSBwYWdlIHJlZmVyZW5jZSBieQ0KPiBuci4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+IHYz
IGNoYW5nZXM6DQo+ID4gLSBjaGVjayBvdmVyZmxvdyB3aXRoICJuIg0KPiA+IC0gcmVtb3ZlIHNw
dXJpb3VzIGNoYW5nZQ0KPiA+IC0gYnJpbmcgYmFjayB0aGUgY2hlY2sgdGhhdCB3ZSBlbnRlciB0
aGUgbG9vcCBvbmx5IHdoZW4gY291bnRfaW5mbyBpcw0KPiA+IGdyZWF0ZXIgdGhhbiAwDQo+ID4g
LS0tDQo+ID4gdjIgY2hhbmdlOg0KPiA+IC0gbmV3IGNvbW1pdA0KPiA+IC0tLQ0KPiA+ICAgeGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmggfCAgNCArKysrDQo+ID4gICB4ZW4vYXJjaC9hcm0v
bW0uYyAgICAgICAgICAgICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
DQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgNCj4g
PiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oIGluZGV4IDQyNGFhZjI4MjMuLmM3Mzdk
NTFlNGQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgNCj4g
PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KPiA+IEBAIC0zNDcsNiArMzQ3
LDEwIEBAIHZvaWQgZnJlZV9pbml0X21lbW9yeSh2b2lkKTsNCj4gPiAgIGludCBndWVzdF9waHlz
bWFwX21hcmtfcG9wdWxhdGVfb25fZGVtYW5kKHN0cnVjdCBkb21haW4gKmQsDQo+IHVuc2lnbmVk
IGxvbmcgZ2ZuLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IG9yZGVyKTsNCj4gPg0KPiA+ICtleHRlcm4gYm9vbCBnZXRfcGFnZV9u
cihzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCBjb25zdCBzdHJ1Y3QgZG9tYWluDQo+ICpkb21haW4s
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnIpOyBleHRlcm4g
dm9pZA0KPiA+ICtwdXRfcGFnZV9ucihzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCB1bnNpZ25lZCBs
b25nIG5yKTsNCj4gPiArDQo+ID4gICBleHRlcm4gdm9pZCBwdXRfcGFnZV90eXBlKHN0cnVjdCBw
YWdlX2luZm8gKnBhZ2UpOw0KPiA+ICAgc3RhdGljIGlubGluZSB2b2lkIHB1dF9wYWdlX2FuZF90
eXBlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpDQo+ID4gICB7DQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMgaW5kZXgNCj4gPiA3YjFmMmY0OTA2
Li5hOTQ2MWUwN2FhIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jDQo+ID4gKysr
IGIveGVuL2FyY2gvYXJtL21tLmMNCj4gPiBAQCAtMTUzNyw3ICsxNTM3LDggQEAgbG9uZyBhcmNo
X21lbW9yeV9vcChpbnQgb3AsDQo+IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0K
PiA+ICAgICAgIHJldHVybiAwOw0KPiA+ICAgfQ0KPiA+DQo+ID4gLXN0cnVjdCBkb21haW4gKnBh
Z2VfZ2V0X293bmVyX2FuZF9yZWZlcmVuY2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkNCj4gPiAr
c3RhdGljIHN0cnVjdCBkb21haW4gKnBhZ2VfZ2V0X293bmVyX2FuZF9ucl9yZWZlcmVuY2Uoc3Ry
dWN0IHBhZ2VfaW5mbw0KPiAqcGFnZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZw0KPiA+ICtucikNCj4gPiAg
IHsNCj4gPiAgICAgICB1bnNpZ25lZCBsb25nIHgsIHkgPSBwYWdlLT5jb3VudF9pbmZvOw0KPiA+
ICAgICAgIHN0cnVjdCBkb21haW4gKm93bmVyOw0KPiA+IEBAIC0xNTQ4LDEwICsxNTQ5LDEwIEBA
IHN0cnVjdCBkb21haW4NCj4gKnBhZ2VfZ2V0X293bmVyX2FuZF9yZWZlcmVuY2Uoc3RydWN0IHBh
Z2VfaW5mbyAqcGFnZSkNCj4gPiAgICAgICAgICAgICogQ291bnQgPT0gIDA6IFBhZ2UgaXMgbm90
IGFsbG9jYXRlZCwgc28gd2UgY2Fubm90IHRha2UgYSByZWZlcmVuY2UuDQo+ID4gICAgICAgICAg
ICAqIENvdW50ID09IC0xOiBSZWZlcmVuY2UgY291bnQgd291bGQgd3JhcCwgd2hpY2ggaXMgaW52
YWxpZC4NCj4gPiAgICAgICAgICAgICovDQo+ID4gLSAgICAgICAgaWYgKCB1bmxpa2VseSgoKHgg
KyAxKSAmIFBHQ19jb3VudF9tYXNrKSA8PSAxKSApDQo+ID4gKyAgICAgICAgaWYgKCB1bmxpa2Vs
eSgoKHggKyBucikgJiBQR0NfY291bnRfbWFzaykgPD0gMSkgKQ0KPiANCj4gVGhpcyBjaGVjayBs
b29rcyB3cm9uZyB0byBtZS4gWW91IHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIHJpZ2h0IGVx
dWF0aW9uDQo+IHJldHVybiBpcyBhdCBsZWFzdCBlcXVhbCB0byBuIG90aGVyd2lzZS4NCj4gDQoN
ClJpZ2h0LCByaWdodCwgSSBoYXZlbid0IGNvbnNpZGVyZWQgdGhvcm91Z2hseSEgQSB0aG91c2Fu
ZCB0aGFua3MgZm9yIHRoZSBmb2xsb3dpbmcNCmRldGFpbGVkIGV4cGxhbmF0aW9ufg0KDQo+IEZ1
cnRoZXJtb3JlLCBJIHRoaW5rIHdlIG5lZWQgdG8gcmVzdHJpY3QgJ25yJyB0byBQR0NfY291bnRf
bWFzayB0byBmdWxseSBjYXRjaA0KPiBhbnkgb3ZlcmZsb3cuDQo+IA0KPiBCZWZvcmUgdGhlIGxv
b3AsIHRoZSBjb2RlIHdvdWxkIGxvb2sgbGlrZToNCj4gDQo+IC8qIFJlc3RyaWN0IG5yIHRvIGF2
b2lkICJkb3VibGUiIG92ZXJmbG93ICovIGlmICggbnIgPj0gUEdDX2NvdW50X21hc2sgKSB7DQo+
ICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+ICAgICAgcmV0dXJuIE5VTEw7DQo+IH0NCj4g
DQo+IFRoZSBjaGVjayBpbiB0aGUgbG9vcCB3b3VsZCBsb29rIGxpa2U6DQo+IA0KPiBpZiAoIHVu
bGlrZWx5KCh4ICsgbnIpICYgUEdDX2NvdW50X21hc2spIDw9IG4gKQ0KPiANCj4gVGhhdCBzYWlk
LCBpdCBtaWdodCBiZSBlYXNpZXIgdG8gcmVhZCB0aGUgb3ZlcmZsb3cgY2hlY2sgaWYgd2UgZG86
DQo+IA0KPiBjb3VudCA9IHggJiBQR0NfY291bnRfbWFzazsNCj4gaWYgKCAhY291bnQgfHwgKChQ
R0NfY291bnRfbWFzayAtIGNvdW50KSA8PSBuKSApDQo+IA0KPiBJIGhhdmVuJ3QgbWVhc3VyZWQg
YW5kIGNoZWNrIHdoaWNoIG9mIHRoZSB0d28gb3B0aW9ucyB3b3VsZCByZXN1bHQgdG8gYmV0dGVy
DQo+IGNvZGUgYW5kIHBlcmZvcm1hbmNlIChnZXRfcGFnZSgpIGlzIG9mdGVuIGNhbGxlZCkuDQo+
DQoNCkNvcnJlY3QgbWUgaWYgSSB1bmRlcnN0YW5kIHdyb25nbHk6DQpJTU8sIG9ubHkgb3B0aW9u
IHR3byBpcyBhY3R1YWxseSBjYXRjaGluZyBhbnkgb3ZlcmZsb3c/IExldCAoUEdDX2NvdW50X21h
c2sgLSBjb3VudCkgPD0gbnINCnN0YXkgaW4gdGhlIGxvb3AsIG5vdCBiZWZvcmUgdGhlIGxvb3Ag
bGlrZSBvcHRpb24gMSwgdG8gY292ZXIgdGhlIGNoYW5nZWFibGUgcGFnZS0+Y291bnRfaW5mby4N
Cg0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ID4gICAgICAgfQ0KPiA+IC0gICAg
d2hpbGUgKCAoeSA9IGNtcHhjaGcoJnBhZ2UtPmNvdW50X2luZm8sIHgsIHggKyAxKSkgIT0geCAp
Ow0KPiA+ICsgICAgd2hpbGUgKCAoeSA9IGNtcHhjaGcoJnBhZ2UtPmNvdW50X2luZm8sIHgsIHgg
KyBucikpICE9IHggKTsNCj4gPg0KPiA+ICAgICAgIG93bmVyID0gcGFnZV9nZXRfb3duZXIocGFn
ZSk7DQo+ID4gICAgICAgQVNTRVJUKG93bmVyKTsNCj4gPiBAQCAtMTU1OSwxNCArMTU2MCwyMCBA
QCBzdHJ1Y3QgZG9tYWluDQo+ICpwYWdlX2dldF9vd25lcl9hbmRfcmVmZXJlbmNlKHN0cnVjdCBw
YWdlX2luZm8gKnBhZ2UpDQo+ID4gICAgICAgcmV0dXJuIG93bmVyOw0KPiA+ICAgfQ0KPiA+DQo+
ID4gLXZvaWQgcHV0X3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkNCj4gPiArc3RydWN0IGRv
bWFpbiAqcGFnZV9nZXRfb3duZXJfYW5kX3JlZmVyZW5jZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdl
KSB7DQo+ID4gKyAgICByZXR1cm4gcGFnZV9nZXRfb3duZXJfYW5kX25yX3JlZmVyZW5jZShwYWdl
LCAxKTsgfQ0KPiA+ICsNCj4gPiArdm9pZCBwdXRfcGFnZV9ucihzdHJ1Y3QgcGFnZV9pbmZvICpw
YWdlLCB1bnNpZ25lZCBsb25nIG5yKQ0KPiA+ICAgew0KPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcg
bngsIHgsIHkgPSBwYWdlLT5jb3VudF9pbmZvOw0KPiA+DQo+ID4gICAgICAgZG8gew0KPiA+IC0g
ICAgICAgIEFTU0VSVCgoeSAmIFBHQ19jb3VudF9tYXNrKSAhPSAwKTsNCj4gPiArICAgICAgICBB
U1NFUlQoKCh5ICYgUEdDX2NvdW50X21hc2spICE9IDApICYmDQo+ID4gKyAgICAgICAgICAgICAg
ICgoKHkgLSBucikgJiBQR0NfY291bnRfbWFzaykgPj0gMCkpOw0KPiANCj4gSSB0aGluayB0aGVy
ZSBhcmUgYSBwb3RlbnRpYWwgdW5kZXJmbG93IGhlcmUgaWYgJ3knIGlzIHNtYWxsZXIgdGhhbiAn
bnInLiBCdXQgb24gdjIsDQo+IFN0ZWZhbm8gc3VnZ2VzdCB0byB1c2UgQVNTRVJUKCh5ICYgUEdD
X2NvdW50X21hc2spID49IG5yKTsgd2hpY2ggSSB0aGluayBpcw0KPiBzdWZmaWNpZW50IGhlcmUu
DQo+IA0KDQpPaCwgdW5kZXJzdG9vZC4gdGhhbmtzIGZvciBjbGFyaWZpY2F0aW9ufg0KDQo+ID4g
ICAgICAgICAgIHggID0geTsNCj4gPiAtICAgICAgICBueCA9IHggLSAxOw0KPiA+ICsgICAgICAg
IG54ID0geCAtIG5yOw0KPiA+ICAgICAgIH0NCj4gPiAgICAgICB3aGlsZSAoIHVubGlrZWx5KCh5
ID0gY21weGNoZygmcGFnZS0+Y291bnRfaW5mbywgeCwgbngpKSAhPSB4KQ0KPiA+ICk7DQo+ID4N
Cj4gPiBAQCAtMTU3NiwxOSArMTU4MywzMCBAQCB2b2lkIHB1dF9wYWdlKHN0cnVjdCBwYWdlX2lu
Zm8gKnBhZ2UpDQo+ID4gICAgICAgfQ0KPiA+ICAgfQ0KPiA+DQo+ID4gLWJvb2wgZ2V0X3BhZ2Uo
c3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgY29uc3Qgc3RydWN0IGRvbWFpbiAqZG9tYWluKQ0KPiA+
ICt2b2lkIHB1dF9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpDQo+ID4gICB7DQo+ID4gLSAg
ICBjb25zdCBzdHJ1Y3QgZG9tYWluICpvd25lciA9IHBhZ2VfZ2V0X293bmVyX2FuZF9yZWZlcmVu
Y2UocGFnZSk7DQo+ID4gKyAgICBwdXRfcGFnZV9ucihwYWdlLCAxKTsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiArYm9vbCBnZXRfcGFnZV9ucihzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCBjb25zdCBzdHJ1
Y3QgZG9tYWluICpkb21haW4sDQo+ID4gKyAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBu
cikNCj4gPiArew0KPiA+ICsgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqb3duZXIgPQ0KPiA+ICtw
YWdlX2dldF9vd25lcl9hbmRfbnJfcmVmZXJlbmNlKHBhZ2UsIG5yKTsNCj4gPg0KPiA+ICAgICAg
IGlmICggbGlrZWx5KG93bmVyID09IGRvbWFpbikgKQ0KPiA+ICAgICAgICAgICByZXR1cm4gdHJ1
ZTsNCj4gPg0KPiA+ICAgICAgIGlmICggb3duZXIgIT0gTlVMTCApDQo+ID4gLSAgICAgICAgcHV0
X3BhZ2UocGFnZSk7DQo+ID4gKyAgICAgICAgcHV0X3BhZ2VfbnIocGFnZSwgbnIpOw0KPiA+DQo+
ID4gICAgICAgcmV0dXJuIGZhbHNlOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK2Jvb2wgZ2V0X3BhZ2Uo
c3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgY29uc3Qgc3RydWN0IGRvbWFpbiAqZG9tYWluKSB7DQo+
ID4gKyAgICByZXR1cm4gZ2V0X3BhZ2VfbnIocGFnZSwgZG9tYWluLCAxKTsgfQ0KPiA+ICsNCj4g
PiAgIC8qIENvbW1vbiBjb2RlIHJlcXVpcmVzIGdldF9wYWdlX3R5cGUgYW5kIHB1dF9wYWdlX3R5
cGUuDQo+ID4gICAgKiBXZSBkb24ndCBjYXJlIGFib3V0IHR5cGVjb3VudHMgc28gd2UganVzdCBk
byB0aGUgbWluaW11bSB0byBtYWtlIGl0DQo+ID4gICAgKiBoYXBweS4gKi8NCj4gDQo+IENoZWVy
cywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

