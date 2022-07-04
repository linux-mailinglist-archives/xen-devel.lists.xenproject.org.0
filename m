Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE85564F30
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 09:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359893.589163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Gya-0005Tn-8e; Mon, 04 Jul 2022 07:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359893.589163; Mon, 04 Jul 2022 07:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Gya-0005RG-56; Mon, 04 Jul 2022 07:58:36 +0000
Received: by outflank-mailman (input) for mailman id 359893;
 Mon, 04 Jul 2022 07:58:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=byhi=XJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o8GyY-0005RA-9T
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 07:58:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1944b73f-fb6f-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 09:58:32 +0200 (CEST)
Received: from AM5PR0602CA0005.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::15) by DB9PR08MB6508.eurprd08.prod.outlook.com
 (2603:10a6:10:262::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 07:58:30 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::7) by AM5PR0602CA0005.outlook.office365.com
 (2603:10a6:203:a3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18 via Frontend
 Transport; Mon, 4 Jul 2022 07:58:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 07:58:29 +0000
Received: ("Tessian outbound d5fa056a5959:v121");
 Mon, 04 Jul 2022 07:58:29 +0000
Received: from b2907b2dd29a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF69B989-4334-44BA-BEAB-64631DFF0454.1; 
 Mon, 04 Jul 2022 07:58:22 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2907b2dd29a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 07:58:22 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB4167.eurprd08.prod.outlook.com (2603:10a6:20b:ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Mon, 4 Jul
 2022 07:58:19 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 07:58:19 +0000
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
X-Inumbo-ID: 1944b73f-fb6f-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LIa7S44yQK5Ap2umPmNN1hZiCCmEZvE7YOfyeSggrNwjRYbLz9GzLCWrSlBC6IBL3r3No8/cl5YTMoryhYEbbBTSEeZBGqGT6gQZOWDCeie2Tk9KiSe5u9uT3nzfMciEEEXtCVU8LFy1/KUGuxV6LK0TksXEpp78e3jdN1907t0J/SWj9H5qJrrsMxhRQ1LBPMVyyx6ZCD+4rjvfodf8F2HcIjfSYEtIsGE4IgwDAaeypiRn2F/on18sSubRoB0yUBtTGKRKXcF/vB4xXDrEjXzupN1wcFVxQBuoSUxZ7EGw8SNWclNT4Diag0aKQSDbSFHZW0PlLVrZLqT7xhenog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8iN7FG7QqIPSNaC7tk21q2PP6kF+jvvb+UHhnPZMsc=;
 b=IcrPlGxtnShEIfkFOfVfQOzucX0ePTSkywvazD+Ox83CwWb8tPB6uJrsUaZZc1DwCQUC2rNmY7doYD+FfzDx8aAn05h9Ata8lBu6ZJ/BL4OE7uoW71sZflLBERi7mRa79CDvwvDm1xWCelMrX9RHZ5CkfCk6J7ngswIU0AnyaHSUnxeru8TBddccPG4o53okym8vJFs1wKdCIftu/vIZecrY8ws15K/pTmmxvD0t7dj9plOYHlMswSioKS9izNxc3jrxcCZ+uxDsbhdGyRH7Rw18Gwjh+d1QyBSeQ+tB7gmts97xg3v6bhBnpjMeFIUmjusCK3TB7Eo5UdMtuTVkWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8iN7FG7QqIPSNaC7tk21q2PP6kF+jvvb+UHhnPZMsc=;
 b=fqrWFMsEIpQEYkKtwHmRQyRMp78fesMgZnBUjykX9A9D+MRlV1tt3M+7qOC4i/t3EMo7g9YN972E0iaRWFD/Sg85lwG2SMvLWC65f6l47aPQECboovtnWqJToSBaky/pI9oQbFbgj5IgO0zka1IYi2Yt5BH1U2gD4oMFFT2TdZw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4ab59a1a25fc732
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNiT8BDuaxJeqngfI6qdkPr58XXsZW03b15rtmFLnoIJWB6ffzJ6ndJefr4/6JXd+UumzeRdeKOg7lwsepEyi4dboRjMiQr0MXDpB3MP5wuTP8Xr06Ac7LmiynksLboKZfSk7uMA4EXubSLsNmvepypI38LHZK8Buz7fyjxVNoj8Y89GBcl2otDv9abxttOlSlwXgQS+fe1RBG3gBmeTNxCq5GZvY69RUC/2fERz22oQpyOPP94LN9eIH5HMgeCjKzxDwKv6Yx/lSZlT2x3yHuVKQ53An2X/1BFnj2PwabA1QLbCibM2Ipdy5C+WwA0ir4RUMPi2kIhIROfwS/CN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8iN7FG7QqIPSNaC7tk21q2PP6kF+jvvb+UHhnPZMsc=;
 b=BBarIyztV+nyZkO7Y8gtV9ZjSCnwSiBTBSRTi/FsZJdCzCB2c14NbpA1hGiUg+ZxTO5XA6xfGH1otQMdfpAEu+PaxifEAK/PZ1zgoZnKDUAS8/dwUVfnFvX0zx9pYJVMWUCr3YWJPdFmY2wGLoES7EQNWqRTspWXdIgn7zXDV4Zsv7UnhKBc9dDkZpTcvGTYUWjALT9TiIuyCctABsrgPEQCkq3XBuV32hZxS8N7ksJxpg+x8pc1XmoukUmdMKTJ9OIhss8MhDCp83k5KQ225x9WvbczV6R1xVkvpSZE3aoiUsaEWCVl3sBT5h8FmjzkOLRfLee1175H74dymvF7vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8iN7FG7QqIPSNaC7tk21q2PP6kF+jvvb+UHhnPZMsc=;
 b=fqrWFMsEIpQEYkKtwHmRQyRMp78fesMgZnBUjykX9A9D+MRlV1tt3M+7qOC4i/t3EMo7g9YN972E0iaRWFD/Sg85lwG2SMvLWC65f6l47aPQECboovtnWqJToSBaky/pI9oQbFbgj5IgO0zka1IYi2Yt5BH1U2gD4oMFFT2TdZw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Topic: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Index: AQHYj3bsMO2Y3PSLZ0WCUDTYt37uBq1t0/kAgAAEvQA=
Date: Mon, 4 Jul 2022 07:58:19 +0000
Message-ID: <BB492376-6171-4ECB-8F24-6F419E9A5926@arm.com>
References: <20220704072232.117517-1-burzalodowa@gmail.com>
 <EB360E93-8353-48D0-844F-CB529B94B9C1@arm.com>
In-Reply-To: <EB360E93-8353-48D0-844F-CB529B94B9C1@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d01d3064-f51b-4249-336b-08da5d92fb8f
x-ms-traffictypediagnostic:
	AM6PR08MB4167:EE_|AM5EUR03FT052:EE_|DB9PR08MB6508:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PaGOY+A0P5fh5poKW8XHHntc9EjEzhYYbmHyeCLg/Kx5if62GCp7QvNrqQPw0whjydwmjBRD6C/w3MVnO/ls6X5OWh3PT991f18pPvryCOXtILy9r/CRakqv1rgCn2x0JqzCvwl3w71Ai7lYLXAFU42ltSJAuypKx0aZlx+kw8cs0mIDDOEwWj5AMik578xxB17wsix3Aaazw3ksrOj3s7YF6U7XsyETAUf9OIx/vCphvvpy1YHwir01z+L6tDiBFza0poY4S7p69jw2cHWegiAGuR7cBTK28kRBsfyynVSnHYaE6NPcJhxiqPl9CIw9y4sooJnw0bqeyEPnmk2epxEJFMH5agte2ECf+6mcFr7pMwfNesqyIzAmbmE83nIRKInzledciIzWPLZOVZWZ439fE9EeKA+0cnJayJYo33FkgUdg/cthEV/6zdkrf074Wh3gT6ylZVczTKKaUxr95+gA8fNco3q2LlKp1Gx9A2+F24GVLjWs9kecRWQ34/MMHAy5mByp1aSeh+/bg9awY6Bh9R0ZOjrbwC8pIiyS4INPDD713wDsr1tlwAbNQ1N4nub+/KMeuhYzmlWpsvbXqn2KiZwqbpwpSqRbE00v5jInHCxntJ6xwxXK6epKEQvFnOgijdLQOhwnlmfrH0C1/WGCiKe+9dB9aV44gdb2JonIPYOFk2g01W1Qv4y9exhwTpo9efzriUS56/7ZIzQnx3iV9NpPAvxot284Y9tPpkNP4xiP8EAiGVd8Ly9P58N8t2974SmiN3SrxErxt7+Vnqd0zO+RcprCn6I6EbCmpBhl/YE/vKhwQLM8jePfbi+EwuIn0UVkcU8lefK443aIROehN2nulgFToRbkmwbHHBQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(186003)(38100700002)(2616005)(36756003)(33656002)(2906002)(76116006)(26005)(86362001)(71200400001)(66556008)(66446008)(66476007)(8676002)(4326008)(64756008)(6862004)(91956017)(66946007)(6512007)(5660300002)(8936002)(6506007)(122000001)(6486002)(54906003)(478600001)(316002)(37006003)(6636002)(41300700001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1088578C35947D4D9A0DD1802F1A6A1B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4167
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ccf844b3-0a01-4717-f2ba-08da5d92f5d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	21ZHPMRr4efaVzsnKRKjrj6j6aDrEQH6zODAvV3w/JehKqs7k1aKK0AGrdAy7F3MBerUe+zpM+O3vwYmqp6YGOdOtOaFntw69ArhodCykUEQ8jPuztzGVqrcKEDiAkuG08H7rx3KxtGux8Yc+F5EGQ2JAoyA38kOSb3J7M/vT/iiy5n/wJHKnJDb1NvyMUY6YMmMiWpeb+3mFbCPLFuFcwHnMHrYpjfq4V54NtjGBgQKa08ilf/kj+4H29rosXntHvcnCHnBjoa11/QbA8CROUWPT7Bkh49kPbIRlsfOJOj0+0gzCy7PB/SS7NBEAAGwNJhVaZeRbadqsLwsw3TM9TFElaAt5aizmv6GuFikFZTwSZ8mQomdjshZjx4Ha09yxEOLTwjDUMYj2RWZzgeo7KzDbAz8pDq++e4+/CJXcumEnpdiro5PHJCnr/Yrtx76Wrx/T2aGv9RY/h8k/UIQHCwA+rERbs09J/KD6hKlJkkUQXEbRPo6mi8HVSFd0LztPunVysdj+BKDzSjmDzV9Rmu1nfuPOM1G0K+GXKdd/3Z+sZ0JgthS9Ns2OMNyFA35KnD4DgsEU1Kc9dJ9I96Db3ri5jVVcSIn74w9c9B4izTw9LwoGy+cbfJdvtVabHJ0Q3EasnUv+M2I2TjDN6B80gzhqzuH9WyTeJ0bJi/nXVytSsZ0l9PPPIglhIQSbCCegKcQ4xLn71HP6/WAzENVPzPpCT9/x1GtLcBlEBGCa1zNIf4nEuPh6EKRzy9P+SxoPlaa3MQR93mu+jVM500/yRvdLh8kdZAuGbKb+04rORT1gmVM7TfM0zqdi3wBOJQc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(336012)(47076005)(36860700001)(107886003)(186003)(82310400005)(2616005)(36756003)(2906002)(33656002)(54906003)(6862004)(26005)(86362001)(70206006)(8676002)(4326008)(70586007)(6512007)(5660300002)(8936002)(6506007)(356005)(6486002)(82740400003)(316002)(478600001)(37006003)(6636002)(41300700001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 07:58:29.2952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d01d3064-f51b-4249-336b-08da5d92fb8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6508

DQo+PiBJIGFtIG5vdCAxMDAlIHN1cmUgYWJvdXQgdGhpcyBwYXRjaC4NCj4+IEkgdGhpbmsgc2hv
d19zdGFjaygpIHNob3VsZCBiZSBkZWNsYXJlZCB0aGUgc2FtZSB3YXkgYXMgc2hvd19yZWdpc3Rl
cnMoKS4NCj4+IFNvIGVpdGhlciBib3RoIG9mIHRoZW0gd2lsbCBiZSBkZWNsYXJlZCB3aXRoIGV4
dGVybmFsIGxpbmthZ2Ugb3IgYm90aCBvZiB0aGVtDQo+PiB3aWxsIGJlIGRlY2xhcmVkIHdpdGgg
aW50ZXJuYWwgbGlua2FnZS4NCj4gDQo+IEkgdGhpbmsgdGhhdCB0aG9zZSAyIHNob3VsZCBiZSBk
ZWNsYXJlZCB3aXRoIGV4dGVybmFsIGxpbmthZ2Ugd2l0aCBhIGNvbW1lbnQNCj4gZXhwbGFpbmlu
ZyB3aHkgdGhleSBhcmUuIEZvciBtZSB0aG9zZSBhcmUgdXNlZnVsIHdoZW4gZGV2ZWxvcGluZyBv
ciBkZWJ1Z2dpbmcNCj4gYW5kIEkgc29tZXRpbWUgY2FsbCB0aG9zZSB0byBmb3JjZSBkdW1waW5n
IHRoZSBzdGF0dXMuDQo+IFNvIEkgd291bGQgdm90ZSB0byBrZWVwIHRoZSBleHRlcm5hbCBsaW5r
YWdlLg0KPiANCj4+IEkgZGVjaWRlZCB0byBkZWNsYXJlIGJvdGggb2YgdGhlbSBzdGF0aWMgYmVj
YXVzZSB0aGV5IGFyZSByZWZlcmVuY2VkIG9ubHkgaW4NCj4+IHRyYXBzLmMgYnV0IEkgY291bGQg
aGF2ZSwgYWxzbywgYWRkIHRoZSBkZWNsYXJhdGlvbiBvZiBzaG93X3N0YWNrKCkgaW4NCj4+IGFz
bS9wcm9jZXNzb3IuaCBoZWFkZXIgaW5zdGVhZC4gUnVsZSA4LjcgaXMgYWR2aXNvcnkuDQo+IA0K
PiBBcyBzYWlkIEkgd291bGQgdm90ZSBmb3IgZXh0ZXJuYWwgbGlua2FnZSBoZXJlIGJ1dCB3b3Vs
ZCBiZSBuaWNlIHRvIGhhdmUgb3RoZXINCj4gZGV2ZWxvcGVycyB2aWV3IG9uIHRoaXMuDQo+IA0K
DQpJbiBhZGRpdGlvbiB0byB0aGlzLCBpZiB3ZSBkb27igJl0IHdhbnQgdG8gcHJvdmlkZSBhIGp1
c3RpZmljYXRpb24gZm9yIHRob3NlLCBzaW5jZSB0aGV5IHNlZW1zIHRvIG1lDQpjb2RlIHJlbGF0
ZWQgdG8gZGVidWdnaW5nIHRoZXkgY2FuIGJlIHJlbW92ZWQgZnJvbSDigJxwcm9kdWN0aW9u4oCd
IGNvZGUgaW4gc29tZSB3YXkuDQoNCj4gQ2hlZXJzDQo+IEJlcnRyYW5kDQoNCg==

