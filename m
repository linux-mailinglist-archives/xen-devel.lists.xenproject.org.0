Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A18058C650
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 12:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382364.617288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKzvl-0000tB-2b; Mon, 08 Aug 2022 10:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382364.617288; Mon, 08 Aug 2022 10:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKzvk-0000qn-Vn; Mon, 08 Aug 2022 10:24:16 +0000
Received: by outflank-mailman (input) for mailman id 382364;
 Mon, 08 Aug 2022 10:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FHLH=YM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oKzvk-0000qf-Cs
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 10:24:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20089.outbound.protection.outlook.com [40.107.2.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ad2a4fa-1704-11ed-924f-1f966e50362f;
 Mon, 08 Aug 2022 12:24:05 +0200 (CEST)
Received: from AS8PR04CA0103.eurprd04.prod.outlook.com (2603:10a6:20b:31e::18)
 by AM0PR08MB5361.eurprd08.prod.outlook.com (2603:10a6:208:18d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 10:24:10 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::e1) by AS8PR04CA0103.outlook.office365.com
 (2603:10a6:20b:31e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20 via Frontend
 Transport; Mon, 8 Aug 2022 10:24:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Mon, 8 Aug 2022 10:24:10 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Mon, 08 Aug 2022 10:24:09 +0000
Received: from 18778cc10c6d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0617DDE5-2C29-4267-9E71-CF4B09DE43AE.1; 
 Mon, 08 Aug 2022 10:24:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18778cc10c6d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Aug 2022 10:24:00 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB8PR08MB4201.eurprd08.prod.outlook.com (2603:10a6:10:a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 8 Aug
 2022 10:23:56 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 10:23:56 +0000
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
X-Inumbo-ID: 3ad2a4fa-1704-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GYjNeW/QLR5XMIwrqDHQAzR1c3HOXVfJJLa9vZ5OXlgbQCgoe7mX7A+EBHo+9ZdB+QKktF5CRyDlFTlhsFYjEm9jhbXbHQftmtWFGUf0XmZxkxMLvVdFJBuaO0+qReaJu5pKKvgCTpGPbWNyPfPaLek6ApgW0uIsounMumCWbaXBJT+exh0i5iSHsIxae7lnBNKXuuqfKLZgJYVcCgyoWcmaBS1QXF8LdBS4UNICb9XmaAMGWVI3EKM3dF2iHWuh4JGC9pUMddtZnfTpeWriiu35Ks3nPqN8QEMSf2R1P3dRy53MrWj7CEY7OXaW8iQIXwfkoOeV2PLFbyd02QENWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEC1UNeVFQYe9s1W5kVVrxpcNejWT9OQBrLvfsXAHRY=;
 b=QL8mlQ9rtkVb3IRbbpmlGQ12B2F7ReRhQ78At3RLhF2NZbTew2wgwA6hV2yt1u21aD+yBL+wox0PvtawuhVkR4H6xiDlhPfDOtjXgl7OAqkYSOp5j8I6M5lOGpNgBiJ2nTPxOLY5iPP7fL6tw8lpiJepOPF/Iqi6R6A+CiPzvqvO74TizpTAP/HyV1LsbC9Yfqsu489yEsb1VAE4tQ5gRU5szA0x7L5obtV05W9YwUAGwimF0F7WE0Bv3bWNQ7wRHTn/kMOMRrPM1dsRru1Loq9JwNjUaHUpaZPwpL2/UYdz6tSm3RtxvG6uBFl+eoSx83eXzoxgIshu++xQailGrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEC1UNeVFQYe9s1W5kVVrxpcNejWT9OQBrLvfsXAHRY=;
 b=Vzoh0UZCpIBcyHlfD9O/0PiiGsRn3y6bVjphbPFhpNsEiz6EXWYAP3m19SCJcXkLdYqa6pk+kSywEV/x+uQhzJkbYmqbq96hUle2djC8qvYXiCT2o2A7zVvxVJCB59KqxwxqTasyUV4BxRUyqprXyrOFH/XRpF60PCKIJj7zgrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31dd563db0a9b5d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFnQU1dS9FkHXUGYrK38Et3XRcEiDyYTJVdEc3YCmQMa3USYy7rc/cvuApGsM9I2Qfy0znHCxEZQeoJCpc8FLzkV+wOmXlSxmLCHtjsWDaU7IKkL7O8DUSDbhKIkg1xv49OLqKyaaxrKcr82R6CYRE7P3bt5CZJJPPHn+PF79hxycyIsl3wvyuaUNZZPlT06DoJcMYVYHDTIpFgxHcL8R08ppY/fd6YNcSE8i1TrOF2hiu7kckluzJlNffjhds6llVQEsk2x1Ld2ySy5LZKenIihBiSpcULMyqEhd0p0C6idUeiBerMX/y8xN6GzmatU/tj+2OM3Lhp6zSfr7WCFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEC1UNeVFQYe9s1W5kVVrxpcNejWT9OQBrLvfsXAHRY=;
 b=mtf+2+7PGG/jm37SwaBNNT+Wz+E9VbmlXV8UR+JliJ7O1WGTAabgI8TyDZBU5U4b1eHSneKYlxoBug8WJMLoUFFsbSR18uB56uRe/UDQF8ows4/GyHBe+uWm7IFjOiqemjphMIGcEfxB8+CfsEakAgTYdDRIWrxvUqe9RhjuvwTAjVqz/9S1sygseVykun0wpV176bu4Pbx3EJiNsZyaTB8T5G8ZTsMPnFz4FCmWdhJKQfM7rwaYKrhTZmMXN3c/VhGx9yOYqOxt7wzuC2gTYV99dRzY33JEXwTjhn06Bie1d5ZsKk8AqzZEz1zF9i7KL1H0D9NqWmSvmZzAnaUovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEC1UNeVFQYe9s1W5kVVrxpcNejWT9OQBrLvfsXAHRY=;
 b=Vzoh0UZCpIBcyHlfD9O/0PiiGsRn3y6bVjphbPFhpNsEiz6EXWYAP3m19SCJcXkLdYqa6pk+kSywEV/x+uQhzJkbYmqbq96hUle2djC8qvYXiCT2o2A7zVvxVJCB59KqxwxqTasyUV4BxRUyqprXyrOFH/XRpF60PCKIJj7zgrA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: regs: Fix MISRA C 2012 Rule 20.7 violation
Thread-Topic: [PATCH] xen/arm: regs: Fix MISRA C 2012 Rule 20.7 violation
Thread-Index: AQHYqwwZtXumFYx8Q0O7NIXFXrkCLa2ky9SA
Date: Mon, 8 Aug 2022 10:23:56 +0000
Message-ID: <0D928059-208D-49EC-913C-321963E5C8E3@arm.com>
References: <20220808094837.1880522-1-burzalodowa@gmail.com>
In-Reply-To: <20220808094837.1880522-1-burzalodowa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9fa101ce-3445-4acc-fbd1-08da792821ff
x-ms-traffictypediagnostic:
	DB8PR08MB4201:EE_|AM5EUR03FT051:EE_|AM0PR08MB5361:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2qP3x3675g1ElEQQ6Dm+/QUkuDwj9LoqGYhwhFIShbCN1D2HuIapc+NLwT//jD7MYnn24E6Wr2xCE2uNJeabKmkje8fYEDwJ9wo3fM6WA+tPIqIec9yD3caVvl3vDIKq130YAhnheFB2wQ2PzJQhOWF9MOIY0D8Jjkc0GPD/c0sLfCqdBvQ5wucsOq5he2ik+7G9IQZjaQxmCHWZcN9NQ1w7S9NX+8nqDaKTJFfae8FLycBZSgmHF7wnY4WAxdSIT9XRQ2jFlaGODP3TqwXEWN7k16sdbVVd2zyBQaH/6rf1XpyEs5XRYgDw30IQnzlTEZ7aq0rVDjY1DsfNv2vZev0vFuRHpodufvyxXkBV6Kymj3KWX+tvINFXfG0y1OykC/nrumsGs9Bk24cfmUwaZylsGWxrIJpCdGqmmGv+cdlasPqBLcoQOUzHiBUXZFERTzR6Uk0s39mxGjuqJx8/HrtamJmZviwOVL2AqjuNd6tQrxjdKYlszBQMsNMNjMs5iAHMEXhbJr/wU9TmRx0IMI5OXn+twX5h9c5U3zZMbblo+8ONUSbxT6TXB+SgTax7O+KtuirLP56vqCMm4zLGfqFsj+A+vtjOZxvXZtUbIqSZyK0zmb9QaQPxUpZpjIymHveKXYQR/zIBt9ujb9iSLQ8+9HAdU2uNyUqwmtX3JY61zCAPVUcsPLJPZYMeI7rznfcYwAtQ86h0VszRskC17md+yWqOL+sm3n+THUBRS11vtMMytiZp4aN9VW9x4fHXwlvdJFN17UG7H73DSojQPvqN2eK2m7nvtxJ5+HUyJNmrCaKuoxnTNNuMjZGMPb3wJge+GtZC9Jslr8cmhEPzVw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(4744005)(478600001)(6486002)(66946007)(8936002)(66556008)(76116006)(33656002)(4326008)(66446008)(2906002)(38070700005)(66476007)(91956017)(38100700002)(5660300002)(53546011)(122000001)(86362001)(2616005)(186003)(41300700001)(71200400001)(26005)(6512007)(6506007)(316002)(54906003)(6916009)(36756003)(64756008)(8676002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <69B7C8F9296B1C4FB9869DB7E78B9BD4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4201
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a59f2bb5-3a2c-4578-1d25-08da792819c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XnlEmeO+Hzvd9VZHxsENdHN37gtRvP0q4LxP9foh4pHY6pfzLYvzPrmlR3lmCy+ejUqHxHZ4I+EczeRPupyky/L8ZzsrHK/rw5zKQWyRucGJd95DBTIskj3ZCgq3pKrgj2wixnxixde2cWPrGBBzN+uxnM6bGi62MmkR3Tphs+hlhkSNTnrloh9pbfCdsy0+4g8ag9YwNL9kxspP0b+mUJlfh5aN724widS4gAl5XDQItHtCkEVBA4d4+upP/aJ1HFwxA+aA0VaKME23Odr5PAG4HPmnZINAyD9Z58aTQB0MukZmYSW6K4NxMpGm6IpBLiDrTP2w0R7YCMCAuSavcYn0BnyaQe9YXFX6wCcandB5v5Zf+uxBAx18BZmfPDZKdplttt41qnQHRWj/pucf0k47rADQQv6jpFLp2NCIOpIieshGkmEeOaHpt6VgxU1z6jihDXBIM2sd6jn+4rO1e5hmsYWHZLs2KpVyJMgGVKPqh6hWhKQQ0uehb9fhTYDgUego8icdQs5prV7sqfIElCOVsl0Uw0wpywnfDtraVjGVsnFuxwLKOy21mAAfT2TYkECBXVVCYhJiwBDuiinPg1xR2eD9sNV1igvJBN6yFVqnDI5g4sA4mZRO/TBjZDnijSKqolEQRpPZJNiYQi4U1wQAMsjHa2wgYZAPmPrOSPsOoy3Jp/+cb8B6aEwJhS2IA04kDXArCDCyT+KKS4nU7eGuZDty79oSzSVcXh6+nfecnrBEHQQX4xHzugVzfJUf+Dh2nhFdANhKyPqrWKF3PHyw25ZJptuq7APnq+/0V4jhK2U5s7sLwjwx+jkB8EyG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(346002)(36840700001)(40470700004)(46966006)(82740400003)(316002)(82310400005)(356005)(40460700003)(478600001)(81166007)(2616005)(2906002)(54906003)(41300700001)(70206006)(70586007)(36756003)(4326008)(36860700001)(8676002)(33656002)(5660300002)(4744005)(40480700001)(6486002)(6512007)(107886003)(86362001)(83380400001)(8936002)(6862004)(53546011)(6506007)(186003)(26005)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 10:24:10.1798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa101ce-3445-4acc-fbd1-08da792821ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5361

Hi Xenia,

> On 8 Aug 2022, at 10:48 am, Xenia Ragiadakou <burzalodowa@gmail.com> wrot=
e:
>=20
> In macro psr_mode(), the macro parameter 'm' is used as expression and
> therefore it is good to be enclosed in parentheses to prevent against
> unintended expansions.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
=20

