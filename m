Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BB6362507
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 18:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111899.213967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQxu-0001JR-IC; Fri, 16 Apr 2021 16:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111899.213967; Fri, 16 Apr 2021 16:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQxu-0001J2-EX; Fri, 16 Apr 2021 16:05:06 +0000
Received: by outflank-mailman (input) for mailman id 111899;
 Fri, 16 Apr 2021 16:05:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tm2+=JN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lXQxs-0001Ix-Pk
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 16:05:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab4dbcf2-2439-43e5-b5ad-50ba054c872c;
 Fri, 16 Apr 2021 16:05:02 +0000 (UTC)
Received: from AM6PR0502CA0057.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::34) by AS8PR08MB7045.eurprd08.prod.outlook.com
 (2603:10a6:20b:345::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 16:05:01 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::52) by AM6PR0502CA0057.outlook.office365.com
 (2603:10a6:20b:56::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19 via Frontend
 Transport; Fri, 16 Apr 2021 16:05:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 16:05:00 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90");
 Fri, 16 Apr 2021 16:05:00 +0000
Received: from 914cdf3e778f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF33E2CF-17E4-4358-B3E6-606C16F788AF.1; 
 Fri, 16 Apr 2021 16:04:51 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 914cdf3e778f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Apr 2021 16:04:51 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0802MB2333.eurprd08.prod.outlook.com (2603:10a6:800:9f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 16:04:49 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 16:04:48 +0000
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
X-Inumbo-ID: ab4dbcf2-2439-43e5-b5ad-50ba054c872c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXqBPmRtrTxv65RFtb2V6PD9vCaVGJ6A0iv/qJkl4Mo=;
 b=2ul2CX+bWdza83eCPqMli2ih7vHO8Wj4EQs4huWyyZfaNIeRgpNrBSMnqnKxZZCfUGi0o0QZewP0GY1sfANYPOp1UBWRh0T53joCpFn5uZF3Zuolc9Xb3zRDCjNDoaaLMM6yXdj+gFEBo5kTyORrRGxCcihmncQSWXTW0dQoKHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a726e488d8344c9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IulZrKUopanTRkgjSUwFHNzzNxOvry83LmutINzMrm9nXd56CRW7Wd6H2SucCpF72MHnI0Ck8AgceeAic+hdDP7aot5iGJhqrEkr6km+kbfdTCg/PwXM27t2czOAWWYS9c276CxIlHGiPclSRsUsQ0ZW+/vX6SajOIgtU8W6F7Tnh3F6cogRy7YOx0Z2edAidIzoLqJriHM3zNjRgg19SEOk3HHJ5KD91+mg/FOHijvSMXQorVoRcktAUiQkSser6sKk5YMn9p2pr4HOgTafIYtlnGQ3lC6zBhCRFIQdLhj8v2ORKthEP1p2UPnxmQKq2Ghy8RqeSg1JT5frD6FKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXqBPmRtrTxv65RFtb2V6PD9vCaVGJ6A0iv/qJkl4Mo=;
 b=AnoUhqwITrtDcj4HQqsDkaadlne+CduiKxGmoHShd9YdWnH/DC0tg2n18tBtpHiw6BdLPNAlx/o9u0NS4LwurbZFmS1pZIL9tdfOkKdRO3wHPEGPMcrRgVeAQTJnIjYm1Eq8ri1F5SwSFz/4/b3dYlL8b7iYDdvNFOrnaHr1V3hHO5h+cgaZOMQpVkgK/Y4ZkOWcXJVSR8r1V6rvbYjKzeEkmz1U55bwubRFjs5Gz+6qTam+YFdXKa8OgX0j+Vrj2NQxTh6pfI1NVXed+BBuFMYxhlRSrytnuNh5k9GKlsphgtUQyjNiY5YWNlGR2KlZSK/WQpHdyTXLcHBCDf/eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXqBPmRtrTxv65RFtb2V6PD9vCaVGJ6A0iv/qJkl4Mo=;
 b=2ul2CX+bWdza83eCPqMli2ih7vHO8Wj4EQs4huWyyZfaNIeRgpNrBSMnqnKxZZCfUGi0o0QZewP0GY1sfANYPOp1UBWRh0T53joCpFn5uZF3Zuolc9Xb3zRDCjNDoaaLMM6yXdj+gFEBo5kTyORrRGxCcihmncQSWXTW0dQoKHY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<julien@amazon.com>
Subject: Re: [PATCH] xen/arm: guest_walk: Only generate necessary
 offsets/masks
Thread-Topic: [PATCH] xen/arm: guest_walk: Only generate necessary
 offsets/masks
Thread-Index: AQHXKjesiGPIh/24CEW4HMn8sjGqgKq3YAMA
Date: Fri, 16 Apr 2021 16:04:48 +0000
Message-ID: <964513D8-D6CD-4419-9804-CF77363B81FD@arm.com>
References: <20210405162046.9353-1-julien@xen.org>
In-Reply-To: <20210405162046.9353-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 56407a45-4679-477a-88cc-08d900f163c8
x-ms-traffictypediagnostic: VI1PR0802MB2333:|AS8PR08MB7045:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB70452D38F1AF6D8CE9684F249D4C9@AS8PR08MB7045.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jR4PWYnLnKVVmOrhbYkruJDOhKQ+o3wX3O7y0vQ/ECS88y52zgNMGjFKHrxgV+uu1qmPA7OH1WNOrPjZgUuepX6/XooDBGjJpX6wBXWO53er7ByCfp2d8wFSOyXW8q+oB64nHBitBP8rGKP0xJpWNAbh+hbND0LBv5nTgh3xiDM4Cx6LHCthYsyn/L1/ih6HssfMJzbaw35V+INrzpZzEh2TNcwQS52NlAErJVeP+UCiZiIgX+q8Yqt+Grw8X+8dBtQQkOfC8bjx6nzBDXxlsFr3NJOB1EGZH2xLO4fQLDFEEgY3WFZXSVX1lljuLf2RRFjxtCWL5YqXogmj/vr6evUNh5+mKuBfP03ZKsFJXBTP0hWD0PQ/S9GB13CN2pBey6aCN972pX/S6aNnzP0IyId9leLBE4azWiKRvM5sQcKsSpbf2pCFLlkihNi45VLe0QoXFTfl4/dA7t41ZgE4pMK6eStuZ/MsXPL/ecPFCbGiDGzFkewWr24g29PJhYjn+A6K//Gxzu1ei+ciwmHE+xRmoexv3iK2ZfSHmHADVkLAMhEqS9xNPrNcsedI3fYUECcGUznQWtHKKwaPcrK8GXZHojHGXt97+50fap2t05gXMp0c0FHSrTaF1e/aY0+nJwh2tHbmQICsSCh036HTEUV6IfM0zFH5dU5WdwXD+3s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(54906003)(6506007)(6512007)(478600001)(122000001)(6486002)(66556008)(64756008)(53546011)(8936002)(8676002)(38100700002)(186003)(5660300002)(4326008)(316002)(26005)(2906002)(33656002)(86362001)(71200400001)(83380400001)(66476007)(66946007)(76116006)(66446008)(91956017)(6916009)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?EqW6SMOfoFqsiN9/mV4qqbNh8/zRYU93gc57kPjH7XUN/0Hh4S4iwPxyqMuz?=
 =?us-ascii?Q?WQGFlSWM1ucE5iTvd90b+ul13KTUbeq+aCyhf1f8as3PNHhS3uv6wo6ct05+?=
 =?us-ascii?Q?MseZpSwjViCUogDrPstULrQE0Qjz951qjEM1KGACjlbtVYLAEf7cKJgmHByv?=
 =?us-ascii?Q?01Avlwo87MDSSGYGGuvSEbj8oxci82G9jmJ38sfX34w4gPRG65ocdQBFEWI4?=
 =?us-ascii?Q?l4UbpNWy43gWUCpyCjQAHN7XhDXjxHXNNU+h6X12y0FG9cPXQTH6T2aE3lZK?=
 =?us-ascii?Q?tUk3R0sJvLjGIZN2DfCou4PCzpNAZDchSMW8SoWzDfqjn/u8xYIQX8Pbn/U1?=
 =?us-ascii?Q?8tzQRUL7jlP4zeJ8vClCb61FQo/DcwhCSzHWszlrADngtDKun5wYe8HWWwEO?=
 =?us-ascii?Q?OqSl4TGl7jH7ktefSELEPSzwbpFWzfisKYHX9sP4xMLScUigFB4aSnaIbEV0?=
 =?us-ascii?Q?iBfYa2lbF166j15STv2jsw9dpkWZBkO4mdPbcXtQrlpSK+R8lVp7bqvJ0EgZ?=
 =?us-ascii?Q?Hp/0RmBOzcBezk94FjxP3ykFXptzIv6jJb7wrrillNAdlptWIVU4akMkIlhM?=
 =?us-ascii?Q?++uMgAQM4B6zDsFNwUtMtDF4AcJ3m8MW+MtVdXbH9t7xbGs9PsKGfHJjzMXE?=
 =?us-ascii?Q?Nhsf4sSbZU1xNSYOpe0IoQcuxoFzGQCIEBHF8bxywqqGPh/88IQ7svLNmK9P?=
 =?us-ascii?Q?g13dfv2efFBhi49HbQzEJZ4WUuOUStz+Jy7T7zQ5WkvERZAFliPJmZNLIPTJ?=
 =?us-ascii?Q?Qi7iGPj12XFeaGN4gGTCsS+IrnLqnBUOq1MD+qq+Y5bs7Js87XY+V2dDfIvo?=
 =?us-ascii?Q?uD9Sca2KxfYD4iSItfWH5Wny9pUg0uGvRKrbAX90g14s2GP7ivu4T1d8sdI8?=
 =?us-ascii?Q?3lwK7DZMyRfidQX3kObS3Yjf+I4tSXZr5WqmGDu73N+AYCtc2indcPRj9TDB?=
 =?us-ascii?Q?t8i76ltcbLUvQou9/GYtIV3rT4qZzprZZyC4QGpviFv4iAw9NzqR/IbTI9BL?=
 =?us-ascii?Q?87qRCa4KXI7gB8PdXkg21jzTNFu1+F6Yl7/iKJoFbUH/ezGzGF5PJBArF999?=
 =?us-ascii?Q?AMN1EsvvaaZf1O/4/RVrgZk9qsUaB1SbwQA2jn05vQygsvnNFbbp6AApneT0?=
 =?us-ascii?Q?OD+/PBndJ7S1udxMv+yvfoOQSr4kLZr68EmHOVXExXcXb10P3MvvLF4Mh7tM?=
 =?us-ascii?Q?f7VCE/lJdMGy2n/mC2rvKJrr5r99N2tcg5uF+rHa5g25nUgGa40yQAcbfgdW?=
 =?us-ascii?Q?oYtCKJ9MEQBfQKYsRrT1ZltcBOAjh7riq7Lr0m4mvWyKEuUlpAYtf6khw+aX?=
 =?us-ascii?Q?CqJfGC5XNE1Mm0YTvmXeiRs8qv0xLpoHOx0aD2TqaRBXKQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D394565FBD6AB9419B0FC95FFB77A2A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2333
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6cd849cb-aa26-4b20-9769-08d900f15c81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jZO5LzOpIK75XWK1Zf98X6geZML1jdA1k4eoB+eiRs/xha4GUk5UDB5GoLXAaCTt9sJup8CsQdMwATQWeObshGiwOUG+kKBZjxxEB1lsfl/OQ5Q9rn75ZPhdnWMaTTb2Waxr8gy0NQstSzmXuO6OpisYX8pdc9oWJdLCCftrfuX4ER8tdGc67aEbsJ2o2IgZp+B+5lsFY/UAi8dLeQqdxEYSEE/+EMbCHSFU9/t2xd80c13FNn9NbwyR8zn4MWJxkA1hhuTS/izxuUVkEb+pPAPQ6toZCNgOwQhu5DV+sGwquKCI51g+ZX6exWe35isPMnJYvROjwuLlMRW2Gs1ytgN5q9KO4O4sHxzGXDg5cgx1xWHXQAJIlgp3LV2VNicQcSkPlTriytRBKGTegliLp0T9EC0JwBu5WJR67G18DY1aYsjZHiL4hSYC8pX/Uv60OZD0NMpPJFUUA1Zi0ToxXX9u7tm9bsWu8uZIsmsg9pwS0lPWfBNu6d/+yOpGZNJhZv3uz0feddeicby6EJ4FyFDc5gCkt1Hc+vGp+dzmT0lAyhq0NuV/AGfEx8hzvrbZIZcocGku3O+dggLFVXH1iuZhhRDT06OQqj3OIrAz2ZpTpZh9+iPKHEzYc75FdWnDwyxd8n19TJaZYCpYoMEB0xlOmAs/1jnRH2v/m8a6Fl8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(36840700001)(46966006)(47076005)(186003)(54906003)(6862004)(36756003)(33656002)(81166007)(8676002)(82310400003)(53546011)(70586007)(4326008)(336012)(82740400003)(70206006)(36860700001)(478600001)(356005)(83380400001)(6512007)(6486002)(5660300002)(107886003)(2906002)(26005)(316002)(6506007)(2616005)(86362001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 16:05:00.9121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56407a45-4679-477a-88cc-08d900f163c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7045

Hi Julien,

> On 5 Apr 2021, at 17:20, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, we are computing offsets/masks for each level and
> granularity. This is a bit of waste given that we only need to
> know the offsets/masks for the granularity used by the guest.
>=20
> All the LPAE information can easily be inferred with just the
> page shift for a given granularity and the level.
>=20
> So rather than providing a set of helpers per granularity, we can
> provide a single set that takes the granularity and the level in
> parameters.
>=20
> With the new helpers in place, we can rework guest_walk_ld() to
> only compute necessary information.
>=20
> Signed-off-by: Julien Grall <julien@amazon.com>

Very nice cleanup.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

I validated the changes on arm64 but not on arm32.

Regards
Bertrand

> ---
> xen/arch/arm/guest_walk.c  | 37 ++---------------
> xen/include/asm-arm/lpae.h | 82 +++++++++++++-------------------------
> 2 files changed, 30 insertions(+), 89 deletions(-)
>=20
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index b4496c4c86c6..87de40d0cb68 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -372,38 +372,6 @@ static bool guest_walk_ld(const struct vcpu *v,
>     register_t tcr =3D READ_SYSREG(TCR_EL1);
>     struct domain *d =3D v->domain;
>=20
> -#define OFFSETS(gva, gran)              \
> -{                                       \
> -    zeroeth_table_offset_##gran(gva),   \
> -    first_table_offset_##gran(gva),     \
> -    second_table_offset_##gran(gva),    \
> -    third_table_offset_##gran(gva)      \
> -}
> -
> -    const paddr_t offsets[3][4] =3D {
> -        OFFSETS(gva, 4K),
> -        OFFSETS(gva, 16K),
> -        OFFSETS(gva, 64K)
> -    };
> -
> -#undef OFFSETS
> -
> -#define MASKS(gran)                     \
> -{                                       \
> -    zeroeth_size(gran) - 1,             \
> -    first_size(gran) - 1,               \
> -    second_size(gran) - 1,              \
> -    third_size(gran) - 1                \
> -}
> -
> -    static const paddr_t masks[3][4] =3D {
> -        MASKS(4K),
> -        MASKS(16K),
> -        MASKS(64K)
> -    };
> -
> -#undef MASKS
> -
>     static const unsigned int grainsizes[3] =3D {
>         PAGE_SHIFT_4K,
>         PAGE_SHIFT_16K,
> @@ -519,7 +487,7 @@ static bool guest_walk_ld(const struct vcpu *v,
>          * Add offset given by the GVA to the translation table base addr=
ess.
>          * Shift the offset by 3 as it is 8-byte aligned.
>          */
> -        paddr |=3D offsets[gran][level] << 3;
> +        paddr |=3D LPAE_TABLE_INDEX_GS(grainsizes[gran], level, gva) << =
3;
>=20
>         /* Access the guest's memory to read only one PTE. */
>         ret =3D access_guest_memory_by_ipa(d, paddr, &pte, sizeof(lpae_t)=
, false);
> @@ -572,7 +540,8 @@ static bool guest_walk_ld(const struct vcpu *v,
>=20
>     /* Make sure that the lower bits of the PTE's base address are zero. =
*/
>     mask =3D GENMASK_ULL(47, grainsizes[gran]);
> -    *ipa =3D (pfn_to_paddr(pte.walk.base) & mask) | (gva & masks[gran][l=
evel]);
> +    *ipa =3D (pfn_to_paddr(pte.walk.base) & mask) |
> +        (gva & (LEVEL_SIZE_GS(grainsizes[gran], level) - 1));
>=20
>     /*
>      * Set permissions so that the caller can check the flags by herself.=
 Note
> diff --git a/xen/include/asm-arm/lpae.h b/xen/include/asm-arm/lpae.h
> index 4797f9cee494..e94de2e7d8e8 100644
> --- a/xen/include/asm-arm/lpae.h
> +++ b/xen/include/asm-arm/lpae.h
> @@ -160,63 +160,35 @@ static inline bool lpae_is_superpage(lpae_t pte, un=
signed int level)
> #define lpae_set_mfn(pte, mfn)  ((pte).walk.base =3D mfn_x(mfn))
>=20
> /*
> - * AArch64 supports pages with different sizes (4K, 16K, and 64K). To en=
able
> - * page table walks for various configurations, the following helpers en=
able
> - * walking the translation table with varying page size granularities.
> + * AArch64 supports pages with different sizes (4K, 16K, and 64K).
> + * Provide a set of generic helpers that will compute various
> + * information based on the page granularity.
> + *
> + * Note the parameter 'gs' is the page shift of the granularity used.
> + * Some macro will evaluate 'gs' twice rather than storing in a
> + * variable. This is to allow using the macros in assembly.
> + */
> +
> +/*
> + * Granularity | PAGE_SHIFT | LPAE_SHIFT
> + * -------------------------------------
> + * 4K          | 12         | 9
> + * 16K         | 14         | 11
> + * 64K         | 16         | 13
> + *
> + * This is equivalent to LPAE_SHIFT =3D PAGE_SHIFT - 3
>  */
> +#define LPAE_SHIFT_GS(gs)         ((gs) - 3)
> +#define LPAE_ENTRIES_GS(gs)       (_AC(1, U) << LPAE_SHIFT_GS(gs))
> +#define LPAE_ENTRIES_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
> +
> +#define LEVEL_ORDER_GS(gs, lvl)   ((3 - (lvl)) * LPAE_SHIFT_GS(gs))
> +#define LEVEL_SHIFT_GS(gs, lvl)   (LEVEL_ORDER_GS(gs, lvl) + (gs))
> +#define LEVEL_SIZE_GS(gs, lvl)    (_AT(paddr_t, 1) << LEVEL_SHIFT_GS(gs,=
 lvl))
>=20
> -#define LPAE_SHIFT_4K           (9)
> -#define LPAE_SHIFT_16K          (11)
> -#define LPAE_SHIFT_64K          (13)
> -
> -#define lpae_entries(gran)      (_AC(1,U) << LPAE_SHIFT_##gran)
> -#define lpae_entry_mask(gran)   (lpae_entries(gran) - 1)
> -
> -#define third_shift(gran)       (PAGE_SHIFT_##gran)
> -#define third_size(gran)        ((paddr_t)1 << third_shift(gran))
> -
> -#define second_shift(gran)      (third_shift(gran) + LPAE_SHIFT_##gran)
> -#define second_size(gran)       ((paddr_t)1 << second_shift(gran))
> -
> -#define first_shift(gran)       (second_shift(gran) + LPAE_SHIFT_##gran)
> -#define first_size(gran)        ((paddr_t)1 << first_shift(gran))
> -
> -/* Note that there is no zeroeth lookup level with a 64K granule size. *=
/
> -#define zeroeth_shift(gran)     (first_shift(gran) + LPAE_SHIFT_##gran)
> -#define zeroeth_size(gran)      ((paddr_t)1 << zeroeth_shift(gran))
> -
> -#define TABLE_OFFSET(offs, gran)      (offs & lpae_entry_mask(gran))
> -#define TABLE_OFFSET_HELPERS(gran)                                      =
    \
> -static inline paddr_t third_table_offset_##gran##K(paddr_t va)          =
    \
> -{                                                                       =
    \
> -    return TABLE_OFFSET((va >> third_shift(gran##K)), gran##K);         =
    \
> -}                                                                       =
    \
> -                                                                        =
    \
> -static inline paddr_t second_table_offset_##gran##K(paddr_t va)         =
    \
> -{                                                                       =
    \
> -    return TABLE_OFFSET((va >> second_shift(gran##K)), gran##K);        =
    \
> -}                                                                       =
    \
> -                                                                        =
    \
> -static inline paddr_t first_table_offset_##gran##K(paddr_t va)          =
    \
> -{                                                                       =
    \
> -    return TABLE_OFFSET((va >> first_shift(gran##K)), gran##K);         =
    \
> -}                                                                       =
    \
> -                                                                        =
    \
> -static inline paddr_t zeroeth_table_offset_##gran##K(paddr_t va)        =
    \
> -{                                                                       =
    \
> -    /* Note that there is no zeroeth lookup level with 64K granule sizes=
. */\
> -    if ( gran =3D=3D 64 )                                               =
        \
> -        return 0;                                                       =
    \
> -    else                                                                =
    \
> -        return TABLE_OFFSET((va >> zeroeth_shift(gran##K)), gran##K);   =
    \
> -}                                                                       =
    \
> -
> -TABLE_OFFSET_HELPERS(4);
> -TABLE_OFFSET_HELPERS(16);
> -TABLE_OFFSET_HELPERS(64);
> -
> -#undef TABLE_OFFSET
> -#undef TABLE_OFFSET_HELPERS
> +/* Offset in the table at level 'lvl' */
> +#define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
> +    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRIES_MASK_GS(gs))
>=20
> /* Generate an array @var containing the offset for each level from @addr=
 */
> #define DECLARE_OFFSETS(var, addr)          \
> --=20
> 2.17.1
>=20
>=20


