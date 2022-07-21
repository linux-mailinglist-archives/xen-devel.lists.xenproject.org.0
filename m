Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B457C706
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 11:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372583.604387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oES2U-0007jP-Sq; Thu, 21 Jul 2022 09:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372583.604387; Thu, 21 Jul 2022 09:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oES2U-0007fv-Pk; Thu, 21 Jul 2022 09:00:10 +0000
Received: by outflank-mailman (input) for mailman id 372583;
 Thu, 21 Jul 2022 09:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTDz=X2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oES2T-0007fp-PV
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 09:00:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8563f5f5-08d3-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 11:00:09 +0200 (CEST)
Received: from AS9PR06CA0326.eurprd06.prod.outlook.com (2603:10a6:20b:45b::34)
 by DB9PR08MB6684.eurprd08.prod.outlook.com (2603:10a6:10:26d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Thu, 21 Jul
 2022 08:59:56 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b::4) by AS9PR06CA0326.outlook.office365.com
 (2603:10a6:20b:45b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 21 Jul 2022 08:59:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 08:59:55 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 21 Jul 2022 08:59:54 +0000
Received: from 5a4b13f1ad07.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DBC4EC64-6E41-4889-BAF8-6520839A74AD.1; 
 Thu, 21 Jul 2022 08:59:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a4b13f1ad07.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 08:59:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Thu, 21 Jul
 2022 08:59:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 08:59:45 +0000
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
X-Inumbo-ID: 8563f5f5-08d3-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NHRyf6Q6//TEc8zY961B+Ax5zGZy9HZpzxVDBKPsYA+T36UOCyaxSZ2dfJnPVSPJzkoEGyEij/gXzcXeyHAcFSyfMMlJ+66bnVC63AuZjYZIr+uZ64S3o1rTTIJTrxSYxaXMSKGFFdbjGAsqhdBfjwC6laxzd/RvwYsw9nz9SewTzCP1fkrOYjjEPO0axgZ0Ct43RlkZiPgZvr3Y+oHBivdhmAI3cwyu/to1/zB4ZqosEzEqnFJqEBS36ARHdwWLx65PapXnJZy+YeMC+VquabuhxiRDB7/oHgpgmlKM9EkI5O9NQ888FowyV0q/qZvtDpYSa4x2SiwQlNvmvB/ibQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/KIo+477VEu1Sbz/j3vSz8fFclFe5qVsQi0g8TxE9E=;
 b=NUuV0sH+6loZdJkIPZUK9gGf34aRJ8bLAaUfyYu7OGryEYSGuvh9gvW8QsAKSkqT0qgTCr7MBvUaShD/W600mKLOT5gfhAkT87Fou5uHmKHogc1Fac4ADllbss5fT6dMDl1CsqBJFpLMuU7tdJNIK4+b7QYgpr+4XG4+naRuqJa/uf3Rb+5/nwwCoPlL6ZRTKMbdzDtD1r3LcY0jpBkYv+0cM2uD8bH95SnzyCGhotp4Ro9S0u/8YSEq+7+tARBzTApKWlnz9XLTmeyJ9zEc6LfQrxXPuEtAF1dRvjgRdWWVeHGB0BjzBr89797xWfJy0KL/Vk+QzYw+DprjnC5Gpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/KIo+477VEu1Sbz/j3vSz8fFclFe5qVsQi0g8TxE9E=;
 b=GtQvNZyAZQdjd6JpsTFBB3u5z8QPY6yzonRNTqe9nrzKUQX4XwyoP3IiVPjUKxibgWtgc7yu/Eztn8mHEHHUcvAyn1FRZZlYESEcpyuUVbLz2yZBzhMXrVYKn7Zu4WQrzxIlEDYrAg1VwEbaxwl90JQQhbn7wfYMLtQn6UsFZbY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8bed13d8b79e5796
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRaeeBdHsc8rWlCYgZfbEQCey5BWYIw0W2qnAXytAOXoPkhAbML1usSllegsLJcX0G//fCDfCaappB8NAcuWMElfZCxUwb6FPyvn/KPD1qijRmga/V8CLoJ63MgWxxDWUq3FFGbBDsUVe6X5r7F2Ze8pksEMbTtiJyxXed98Mdt5150aNdxlgrP5EGeEMEzQUfi/JedRWHXRywy+K2AyYf3LHuHWDlQnNCpUoos+7O1VvggR74FrYdcIGpcc+4xhIQRS8EExH+vsnOaZ06igYbOzN//w3Rxz2SyVzOjFglrbXt1pjK7MCqutCrDcRWnAiJkcnbN5+p8/fjVpkBmFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/KIo+477VEu1Sbz/j3vSz8fFclFe5qVsQi0g8TxE9E=;
 b=f4tnaW56lB8nUsQLMeIPxu5nKr5nEBq8G45vDx9jXjhCc+BIFYIrTSY+kfESfXVgxwgWyQ27x5/Z83nRWyUXarFtiL0q8t8MzEYQr8qybJdlZFVE8H5DkXq6cyethOMjrESa3iAyuaBUaHk2rYN0mgdWmXyqY4aF4Tcw7y+RTO+eJRiXgqa3ogW1A0e18lOKtV9DZ9csMSefISxGIy031FlHIZRmVkTmnJX7l+wFyuv37n4MkUW1wroUCqkF7u7HBQxIPUutXr2BzIqeDUeIi7rW1CxsRoBq1PUk1FriltS+bi8SWg6zvP9f8YuS+TztMcr5mLICzZRul0+cY8A35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/KIo+477VEu1Sbz/j3vSz8fFclFe5qVsQi0g8TxE9E=;
 b=GtQvNZyAZQdjd6JpsTFBB3u5z8QPY6yzonRNTqe9nrzKUQX4XwyoP3IiVPjUKxibgWtgc7yu/Eztn8mHEHHUcvAyn1FRZZlYESEcpyuUVbLz2yZBzhMXrVYKn7Zu4WQrzxIlEDYrAg1VwEbaxwl90JQQhbn7wfYMLtQn6UsFZbY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 0/5] xen/arm: mm: Bunch of clean-ups
Thread-Topic: [PATCH v2 0/5] xen/arm: mm: Bunch of clean-ups
Thread-Index: AQHYnGjd/WoMkI+VCEKYLle60EibRq2Ih6CA
Date: Thu, 21 Jul 2022 08:59:45 +0000
Message-ID: <4E4C5ACE-D7BB-4AAF-BE51-471BB73A2F08@arm.com>
References: <20220720184459.51582-1-julien@xen.org>
In-Reply-To: <20220720184459.51582-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b78b75da-24d6-45a0-b320-08da6af7619f
x-ms-traffictypediagnostic:
	VI1PR08MB5501:EE_|VE1EUR03FT052:EE_|DB9PR08MB6684:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cqLxfcdl2vNJASD+D1BYM4FchDMHEnSRq2NKX5E+Wl47a1Xz8LQSxjbCI72dZmVNsheAjhf4KLodkY+PjwqPiygnb+owYkb76Zm3c0L3ySJQG1KgNhBT7aE/B8W3UoYcnu93/99oYTIkz7HSNsfS/40PMUdor12SqrywQsRs7AMZbsvU+jJXsWXughRgQUvFiTkGrSEbmWlW61VGBej3B6zLns3ecGdwioJrll6a3l90/xvJ6G3AOhyDg0qRU5udcHnvnwbi9/4p68pqEdpGJLMU4RUH+OKzBNXk5bJRrAcB2yPKbTD42bQIbSR31Z1Ig/ENZyNnJaTFTL+f7gvC0xh8XqfV3e0j0VRcfOybLsiTVq384L2z4WAgfiGWTsOGH4sGf3+DG3SG3/+CBaj3KFRy/Uv2A7hT/VSEvpzKKDPsPF8OUn26hOuA4bBn+2kdLB42zNWFzuxXt0CnARKMG7U6VDDy24W0N8g0F5scfVgulSw+/rXRctqHStLrVEN0X7Hb5KC7cHlwwjzqREDsgTO9i97R5AErxO3cfZMn56Km5xbYc5YYEkt9P6a59PbParflC7625IR7oNm0ypo3ibHDpO1jjpb391gZDU9VyhRrDCjC2EvpQ7TMuDn2vtdFo7HgVxLceFc/79evnsmHiwbrqFiPhch4q/8s/aPD7X8NiuzUZNuCPzqoBBDPTewC9D9X/QRErGNLGZju0bGAZncGLG48JdepfRibPpS2Lp9UYNe3IIEorJAq5R1jZ2XInJpnm3a/HBIAtdrgiAELf4+MsGLF7HUdAMqpu362eca/sJweBQ8lAe5v1RdTGzh2n+Mykg1W+Lf0Bgr5V6vDOAh9wnRK8zGnglih3AuWTvfBwfRtNslSsfojs56LUzbS
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(8676002)(76116006)(66476007)(64756008)(316002)(66446008)(38100700002)(4326008)(66946007)(54906003)(66556008)(38070700005)(91956017)(33656002)(6916009)(86362001)(71200400001)(36756003)(6512007)(6506007)(122000001)(8936002)(5660300002)(6486002)(478600001)(41300700001)(2616005)(966005)(53546011)(7416002)(83380400001)(26005)(186003)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FAF7D143E01D3246A637B462BDEE6A3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85522c94-eef2-4f3d-4968-08da6af75bb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2/f3x3VjqhixmHVIxUmPeVXfer+7PorSQ+69bF/gyMZ8oUq2Mnq336cjM9O6F4fciTmHOpzlAGczp9p1glnkXthc7+DVLyYkIOlEdGFsdu7/zmXtgiMGu3vhQ8kPtrgPb0avMYslRcYM6pv/28qwR/kFF2XpUh3t94y3bwFcBsFPP4u3gac97PGtAziKpdnKhr8v/rsznNwSBrUhINtE47PhG47150xA0CIVuKzkUWOWjPW0HveVl2KNz9ZBFEJNeH0WGVB3gqXv87Hr7wYkD9vTQj7I7+LjqMmuv8t+IVJm4BMVlXHU/vSoavrEi46GpsRW9ApyTcTBaofxiN9BYjGgzSPunjNy74XYRZGtKAeRTy8ZiQegRHU9dL28pocq388M+1CtoynCC9Lzed0rHfrFOuCSDs41zWlW37DAV3YxGLjFC9wet5dR+klSACcDbaaLUFAzOMkrzPdMny7Rzx2lJRGezDhK0v5CUApjaC0DEbhaovWhCf1TrHraZHkOccw31SqEnslWHdTT6VOmh6ZAZ3CVbYryHLm6J4y4SoSp2Vo0SoO3EKhSBkDs4aUBb3F+B8uLVhYrss5j35Aa2u7Bx67Mgqkd54lL7DtYGjy2ac7mmnC/YUbxqBHJFGKQfunMQHUNBAioCgWldNcEmdMffikuVJ6TFAQB2GpdvZTW5LIHN7D6H8TiCcfOWdAMXSoe/FNNqljXL+07Kj76FNkVbAuubvV+9OSaCNefeHEBM56yhvc4fgXPYvjAe5+l9BivvPCipa/tB6t/VZ9UDYi4A3qBQ010a/pUqXkmFAqVGP2kYnMlzzsWEjHHrmc0hxue9hwm5NjxOQuWes5aAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(40470700004)(2906002)(53546011)(6506007)(82310400005)(83380400001)(81166007)(41300700001)(107886003)(2616005)(26005)(6512007)(356005)(82740400003)(47076005)(186003)(33656002)(336012)(966005)(70586007)(70206006)(36756003)(4326008)(8676002)(54906003)(40480700001)(40460700003)(316002)(478600001)(8936002)(6862004)(5660300002)(6486002)(86362001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 08:59:55.2575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b78b75da-24d6-45a0-b320-08da6af7619f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6684

Hi Julien,

> On 20 Jul 2022, at 19:44, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Hi all,
>=20
> This series is a collection of patches to clean-up the MM subsystem
> I have done in preparation for the next revision of "xen/arm: Don't
> switch TTBR while the MMU is on" [1].
>=20
> Cheers,
>=20
> [1] https://lore.kernel.org/all/20220309112048.17377-1-julien@xen.org/
>=20


I tested the whole serie with (including starting a guest) on qemu x86, qem=
u arm32, qemu arm64 and fvp base.

So for the whole serie:
Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> Julien Grall (5):
>  xen/arm: Remove most of the *_VIRT_END defines
>  xen/arm32: mm: Consolidate the domheap mappings initialization
>  xen: Rename CONFIG_DOMAIN_PAGE to CONFIG_ARCH_MAP_DOMAIN_PAGE and...
>  xen/arm: mm: Move domain_{,un}map_* helpers in a separate file
>  xen/arm: mm: Reduce the area that xen_second covers
>=20
> xen/arch/arm/Kconfig                |   1 +
> xen/arch/arm/Makefile               |   1 +
> xen/arch/arm/domain_page.c          | 193 ++++++++++++++++++++++++
> xen/arch/arm/include/asm/arm32/mm.h |   8 +
> xen/arch/arm/include/asm/config.h   |  19 +--
> xen/arch/arm/include/asm/lpae.h     |  17 +++
> xen/arch/arm/livepatch.c            |   2 +-
> xen/arch/arm/mm.c                   | 221 ++++------------------------
> xen/arch/arm/setup.c                |  21 ++-
> xen/arch/x86/Kconfig                |   1 +
> xen/arch/x86/include/asm/config.h   |   1 -
> xen/common/Kconfig                  |   6 +
> xen/include/xen/domain_page.h       |   6 +-
> 13 files changed, 283 insertions(+), 214 deletions(-)
> create mode 100644 xen/arch/arm/domain_page.c
>=20
> --=20
> 2.32.0
>=20
>=20


