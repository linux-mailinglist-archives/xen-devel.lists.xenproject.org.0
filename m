Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E6570407
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 15:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365119.595193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAtHE-000290-FD; Mon, 11 Jul 2022 13:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365119.595193; Mon, 11 Jul 2022 13:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAtHE-00025w-BW; Mon, 11 Jul 2022 13:16:40 +0000
Received: by outflank-mailman (input) for mailman id 365119;
 Mon, 11 Jul 2022 13:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZps=XQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oAtHC-00025q-BD
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 13:16:38 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10073.outbound.protection.outlook.com [40.107.1.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0707028-011b-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 15:16:35 +0200 (CEST)
Received: from AS8PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:20b:311::27)
 by VI1PR0801MB2079.eurprd08.prod.outlook.com (2603:10a6:800:8e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 13:16:33 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::41) by AS8PR05CA0022.outlook.office365.com
 (2603:10a6:20b:311::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Mon, 11 Jul 2022 13:16:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 13:16:33 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Mon, 11 Jul 2022 13:16:33 +0000
Received: from 35722b311dfe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49C5D426-D7EA-439B-8774-C390F38A1743.1; 
 Mon, 11 Jul 2022 13:16:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35722b311dfe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jul 2022 13:16:26 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB4279.eurprd08.prod.outlook.com (2603:10a6:20b:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 13:16:24 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 13:16:24 +0000
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
X-Inumbo-ID: b0707028-011b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=P+XLbzx7dWTX/hMxgLojT12BTfvuqZ8l/2W3aPRKgFFXcECMFHYYeKiPO4PvGY7I5jIHLm6jahQxOnRkRKRZL0IVr/gETTytd8ifIvk7eoW7sj4l0hqhwOmLaQ+WUQH+8WntlwNMuIR56AgCwWZA74EQTHi0CsB+b9x+3I+RRTgHaRLiVoiPbvLDh36n7s5bRvAtu6BBAHuiMC5Xy6rBTcVulJWvOL+ZZArAmn+1KfsELG2FzOOFBJFiGZlzaXu/Al+O0t1QykUlO7d9D5KF9YCiaZqgD947Na45GblzSpDz8rPyQs+If/DSbbCwWfCd55rHar+tV16hzk8p1jxI2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XyHL7k9sDbzNZSQxIZNh4sn2ME+ML1tTLUUsJeBh7w=;
 b=Pr0IKYUkYOLU5LUwcQBvm4ktUR39rVCvIyyPfC5+5xz/vhZTH4yCoxtTdBgLDkqjIFpM4a9BZLy30dFfvw9DluOOO3T4X0K46Yo6PZoK9SQ6XHSfW/1DMKSXHAEUNxkzJEaEFb7OoOvlBuuRmB+bRaPRMt2G/TnsCUeCAmqxsQaVW/cpAE5PM0BQVZctfg+05Px4t2O2wA5c3NkNZpGo/KrQVsCAPi+0bG11cxKHpNXtII1B9uof5HOukM3yT4c/1g6kvvEJdtfLHpP1rQDIojjAljt85UzK7p0CqUAsPfU3X72ECJcsx0BQnmERAbBZJhgL7ZPZkM+2dIfWlh7pRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XyHL7k9sDbzNZSQxIZNh4sn2ME+ML1tTLUUsJeBh7w=;
 b=G2m0vAMtgpHvsCpJn+0QYQvwUBb5208f0PlVT+15BN8EnumhJYYkFJ90rQaibld5ZwhyjzbTJwCL0rjvNoJOt+iXxfhNyq0ZmFfbuLUWJ7arMzrc3EVi6XcdE4/lQTRplRfDt8czFdo19JAyk9iSGvF8SSKVwvgIieL8HkxSNik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6c631df147a3a9e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBdzj2mLiL87hCWfbFDrvSFLpDz6QxIOMcQc4CGQV4Ebqrq7bVp2iG+rLzCsYAIjxXVZb9La/yKYxLG2TQJsMU2XIsDukUitA8E9SWGOxZ0nVPCTWAsmdkCHLFsnUAoouoMTZHSejxA4vmxA2UTRgJWCkkN9FbKkFqczhUO3A2BzteKGg2v6a5BpliD1S518jxe+quwi2TuNImNYegDgOQSgMqXFAXcZ6Ja7QJRV0TnrBga/rmLql5c9r2kdPowzh/+h0p+W0R2LIFMEm0ceIu6mI3Dc7MLgtkj4KO8GK8ieh+Tk4EJDC3Mij4U0au7mFZJHX3VpQYU0VJ2qZxul2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XyHL7k9sDbzNZSQxIZNh4sn2ME+ML1tTLUUsJeBh7w=;
 b=R0wiBgpOS1WFHMrV5flGcBjIEOMljiuWzqKWUT1vO6tgiNm2FnUv7J6zJpiQo8zgJkm+lwhfPg8Ie6hEbFufKEwhSKnYRXlsnHKCpez6LyvH81kpSS/cxukIeofL8qLr/Q0OIr4cR/IG2lY8DoACuO5mi0Hty8Ywt0nfbCSPSKk6zaajEuE4Y3ViU6i7v6cduFxOgVHm36KV9vKWRRg1hLedi1WAEWodZvMtL1/zD/Ki/PZE/9uo45hEZdUJNziUTk1ay1YtkYJPnS5SjUxNrTHsIoNN5snLTEGkNzAOj95OELezBOLe4qefKWcjuDF2ikZSq+cwyoG4q7dQwoRPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XyHL7k9sDbzNZSQxIZNh4sn2ME+ML1tTLUUsJeBh7w=;
 b=G2m0vAMtgpHvsCpJn+0QYQvwUBb5208f0PlVT+15BN8EnumhJYYkFJ90rQaibld5ZwhyjzbTJwCL0rjvNoJOt+iXxfhNyq0ZmFfbuLUWJ7arMzrc3EVi6XcdE4/lQTRplRfDt8czFdo19JAyk9iSGvF8SSKVwvgIieL8HkxSNik=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3 06/25] tools/fuzz/x86_instruction_emulator: rework
 makefile
Thread-Topic: [XEN PATCH v3 06/25] tools/fuzz/x86_instruction_emulator: rework
 makefile
Thread-Index: AQHYh+Q/HQapn5xyFk+tBpnRucH3tK15QQ4A
Date: Mon, 11 Jul 2022 13:16:24 +0000
Message-ID: <2F79AABB-DC61-4DC2-8C0D-23585B27AA4C@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-7-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-7-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0a7b0648-ccd4-4328-aaf2-08da633f937c
x-ms-traffictypediagnostic:
	AM6PR08MB4279:EE_|AM5EUR03FT053:EE_|VI1PR0801MB2079:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YhtEvT8UwD417gCfr6Tykwo5/2elyF4mNxWDzcxKtWGzaAKqp6fazv9BJ2GeGVcp0eWk0Vntl85UPtYgiAXVcXRX9eFgLeKOWZQLQsou6gEUPYTxqbTZVrKEGQgJiUPC4wW1WpjYeFI+1vmvdDlR54myjjDW/seKDp/9e1lPYXnSdL8cE/LfgGCxhv7vkY/aLYVlyB8mIjOpQrPbqe2vwwnStGTlMjJRdQBNGf7VD5jDp/jBaRklQklJ+cbaQEbZaDwMApilXC1/ubgq8uxB9EfPIPbM6CR4ODl3DJMf4GjzmCGQs8V+VvgMnNrcqqIAFvgSbkITlgMUbUYf/hiaLhmZRHiHdhWqQ6GhjkHsAy7ZThpUCnoACiHvkkYaqRKkk6dAusjdJlg0WXyO8jduyCdywHTIjbxaepqxGGzUOzRET15ID1vhKtVlzPlSvdSaTROx2ocNVTk9M+iUjKQHK6VZp4ObCbG69qCBnj0yf+R7Gvz2+FJPLZbbO05yp//ZDqCtyrAoF6M4+p24GJZmHMV3UK++583dARshJ4pH9Z/hxX0DL/SAgYBTLqc5ybnB0pWp2NTXflaKjG5MeNcsJGdjuV2WehlBO1BAZr2Fy2NngWh/S3c27N0fz4dttMACc9/5ZG1534L6oJobfLrLdk84owdtCq26n8tWO3FzTJKiweG80tVnNE5uxqSahlI4gVDOBNui/t7UiZ88IEYjX4lesLUXRI1nz48ma2nJg5XUvjkbRc1ljnNcvaGVnBSbPJNK/7bOu3WQEFUZQ1rVuCroupuZk/Tza1Wt17/CKRJIKgfRajAeM3hobiBiB4xp3A4FC4jsH6KbIQ6fHUe34dYPpjGRXqcU849NrlYfz18=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(86362001)(2906002)(26005)(478600001)(6486002)(6512007)(38100700002)(41300700001)(6506007)(33656002)(53546011)(4744005)(2616005)(5660300002)(8936002)(186003)(83380400001)(38070700005)(6916009)(122000001)(36756003)(8676002)(71200400001)(66446008)(66556008)(66476007)(66946007)(76116006)(4326008)(91956017)(64756008)(54906003)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AA3B884C220BE4FB86882A202569FEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	921a7725-8707-4bdf-92a1-08da633f8e32
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TLhdRAT1u9gCuDa6vudwwCKYj+60lk/zqc82w0hn7Hpb1BQTG5Q66WzFF8czjHCeKQwI12VO+KxptK4U3hn8T0Z68bCERnlRpdGdvfZhFwM+nScuYcCbR30TcYcmlNkUDBt1FA75+4lc/ufUpelmgCC0tDLxtC60Jodpjgmrxyr5KrZ/UIXYT3o5fx9XMMQPnP4mOsiyK+G12dpNWCaSqKcTCRcSKfQ5TLssR2T1IrloLpC+pJ1sXpckbRj20dfKfiQtbYk5VFTNiIU4aa6A/5Avx7LCRHOC7Eil5VGVL5umMKierHG569BecbnVDBG7BxluytnNGjjvBviURGAZKfcXRDBUgXARgQciIwEpp2k6yG0eZsETMLsRaEhieLVPVNSPL56zaPWqcuwZ0Ug5iPQhvCscuggkBNr0KN2ssN2qmZAvtZe1uXHqRMlNWvAdKr/rP1kEKoOBV5I/YmO6jbh4ce25ZLPqZHY4D5IP0Kz8v+WNdfcYnw6gZf2PEgj93vJJhP9/TLCH1o/7kDBgTndk7c19q013neGLi1fFqhVE3ZqT0ioUecuactbYWNqL21i8h/xaXlprSymttSOVWKcGhGV8JtIzyyzB4VWF9L9m0JzM7nhnX/mBGTtEczRvYLALCmWdCLcvuRCDaY0YcYCbKXbDirPAcdzOdHZIzIJZv0zFZaktLsuzjZ+hoStrLLZKb/ywhD+epuDPPb5wWCobu/sk/fyPFQvIk3WUut7J/aFJyoHSRwlOKyGddauLdkhZgv3OvrqOD8FvonU8ZrC+t/eDmrEY0/GVliNTKsSXSTnBMEkCXOncUgkNRh8w
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(36840700001)(46966006)(40470700004)(2906002)(47076005)(36860700001)(33656002)(336012)(6486002)(478600001)(83380400001)(356005)(40460700003)(82310400005)(36756003)(4744005)(40480700001)(186003)(5660300002)(316002)(8676002)(86362001)(70586007)(6862004)(81166007)(8936002)(54906003)(107886003)(4326008)(26005)(82740400003)(41300700001)(53546011)(6506007)(2616005)(6512007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 13:16:33.4231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7b0648-ccd4-4328-aaf2-08da633f937c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2079

DQoNCj4gT24gMjQgSnVuIDIwMjIsIGF0IDE3OjA0LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBSZXdvcmsgZGVwZW5kZW5jaWVzIG9mIGFs
bCBvYmplY3RzLiBXZSBkb24ndCBuZWVkIHRvIGFkZCBkZXBlbmRlbmNpZXMNCj4gZm9yIGhlYWRl
cnMgdGhhdCAkKENDKSBpcyBjYXBhYmxlIG9mIGdlbmVyYXRpbmcsIHdlIG9ubHkgbmVlZCB0bw0K
PiBpbmNsdWRlICQoREVQU19JTkNMVURFKS4gU29tZSBkZXBlbmRlbmNpZXMgYXJlIHN0aWxsIG5l
ZWRlZCBzbyBtYWtlDQo+IGtub3dzIHRvIGdlbmVyYXRlIHN5bWxpbmtzIGZvciB0aGVtLg0KPiAN
Cj4gV2UgcmVtb3ZlIHRoZSB1c2Ugb2YgInZwYXRoIiBmb3IgY3B1aWQuYy4gV2hpbGUgaXQgd29y
a3MgZmluZSBmb3Igbm93LA0KPiB3aGVuIHdlIHdpbGwgY29udmVydCB0aGlzIG1ha2VmaWxlIHRv
IHN1YmRpcm1rLCB2cGF0aCB3aWxsIG5vdCBiZQ0KPiB1c2FibGUuIEFsc28sICItaXF1b3RlIiBp
cyBub3cgbmVlZGVkIHRvIGJ1aWxkICJjcHVpZC5vIi4NCj4gDQo+IFJlcGxhY2UgIi1JLiIgYnkg
Ii1pcXVvdGUgLiIsIHNvIGl0IGFwcGxpZXMgdG8gZG91YmxlLXF1b3RlIGluY2x1ZGVzDQo+IG9u
bHkuDQo+IA0KPiBSYXRoZXIgdGhhbiBjaGVja2luZyBpZiBhIHN5bWxpbmsgZXhpc3QsIGFsd2F5
cyByZWdlbmVyYXRlIHRoZQ0KPiBzeW1saW5rLiBTbyBpZiB0aGUgc291cmNlIHRyZWUgY2hhbmdl
ZCBsb2NhdGlvbiwgdGhlIHN5bWxpbmsgaXMNCj4gdXBkYXRlZC4NCj4gDQo+IFNpbmNlIHdlIGFy
ZSBjcmVhdGluZyBhIG5ldyAuZ2l0aWdub3JlIGZvciB0aGUgc3ltbGluaywgYWxzbyBtb3ZlIHRo
ZQ0KPiBlbnRyeSB0byBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPiDigJQNCg0KSGkgQW50b255LA0KDQpSZXZpZXdl
ZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoNCg0K

