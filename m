Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5761F0A8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439241.693267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzOp-0006Je-7b; Mon, 07 Nov 2022 10:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439241.693267; Mon, 07 Nov 2022 10:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzOp-0006HI-4U; Mon, 07 Nov 2022 10:30:39 +0000
Received: by outflank-mailman (input) for mailman id 439241;
 Mon, 07 Nov 2022 10:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XaRo=3H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1orzOn-0006HC-CV
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:30:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 367f4ca0-5e87-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 11:30:34 +0100 (CET)
Received: from AS9PR06CA0249.eurprd06.prod.outlook.com (2603:10a6:20b:45f::22)
 by AS8PR08MB7815.eurprd08.prod.outlook.com (2603:10a6:20b:529::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 10:30:32 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::a8) by AS9PR06CA0249.outlook.office365.com
 (2603:10a6:20b:45f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Mon, 7 Nov 2022 10:30:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 10:30:32 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Mon, 07 Nov 2022 10:30:31 +0000
Received: from 2ac3d14619d4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2327B603-4108-4CFA-97A4-84D225BA167C.1; 
 Mon, 07 Nov 2022 10:30:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ac3d14619d4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Nov 2022 10:30:21 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB8PR08MB5500.eurprd08.prod.outlook.com (2603:10a6:10:11e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 10:30:18 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5813.011; Mon, 7 Nov 2022
 10:30:18 +0000
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
X-Inumbo-ID: 367f4ca0-5e87-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O1OV801M/6SEY9UfaJrrqAdJK7aYwgZKqBvYJB6actfRz0b5U3nT0PgVShmIAFJB8TY4x5od94LB2XcjjfI+D7QGHbh3Rjm7FkwhHlPKHB0fmwGr9MWqXLpaptwjuG7LEPQS8VKRQRrYDSc+QqgkTpYRV5OzrOztXioY1JG6VOxD+l8X1cjG6xqgdxhVa9ZrFOJKRjgkz/9WfD/rB2xPzp7iwy0/1YW9axbgI42y2VLj3iIDRKNn4tvFyL8fW2YWbb+6W710YnI0TeWFYJQdXZROeVeSmsNdXkYJD4GQe0llbzJ9qjDjcOcBJMv8ACaQFB3ucdjawmCOfvd2Ud2tpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMXT2ZVQw2wA5iL09XanV5OpL9jUtQZtDIehowkp1dk=;
 b=DZyPAevuzQwuHpqGi19vV/kNJwiYDXvvv8dM6G68owsJDM/JxPQsLWY1kOV1m5qqWEXNXjIK7MYHImKPtWiWMafm+djR8hooacgyhC5RCSOS9ucLesitAOmTKPCSbxo9INsgJwc0YBbmi6jHvWtcDbgCY9fA0qq4CeexkQhz9b84FxRtX0ySYMChGuXiZHIgqPwn03veTmWx37R5cYlleBW81YL0RfU+ew1f8cdcPHz7lrb4IMAL9tjZjLIrYyG2WcNIS7StYJCHedMtiEKUP1Mcsd7gcbnZJy83jDzMg/5r8PkcaqPapg7oQLF8gHUdOdahOp8/Q9ePuqDwhkWjFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMXT2ZVQw2wA5iL09XanV5OpL9jUtQZtDIehowkp1dk=;
 b=hJbRe4WIvTP5RL14tfEFb8dyAdzhn61enUv9/AD5GIfa59M+BHFKDXuH+0q6QqPnX6qz7fsjrJwfRYvIupVbTgdU2I+e2iqyBXorE7rj217FZ0nppNLs9aSw5bsN7Yb61/5zXAcIaqmipupIs8nC2aC1axNV+bg+/2sfXrPBA+g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ucb9S2QzvMHdOa0nTJovUYf6DpbBfH+U8o+e2z6r1IbStHXg7TRf0QKlgwLwOSAA9/jz8m/wZI+ZCLxU03Ydv6m95KyDV6mukAVfKGq1vWp0gKOt2gYe20AjpKGB3N5vQTWsruFonGFVZxR5oJ//fy3tP0TbTv5i/OhB115r2hCee5pxIfF5NXbpyy+7wli4zEZxdY/dNv8Jk0vyL2PcB/+Q6n+1cRgFJQUJzF1Fwu64TgZbsEp9XCErHP/NwomewbBbFqkYlineKNl0DocNeLQQ0jpbSxvxCcBm8aQLYeEJoio6OgBbP6dzFe+cIii6oFiWZPo2swfqUReKUoYz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMXT2ZVQw2wA5iL09XanV5OpL9jUtQZtDIehowkp1dk=;
 b=DsqU4rBQ4R9oM3hv+0Vmi7FxtD47Aqwqp2s50hhrI/jhCa+pDlIgEtrv9yjYGGfLJ3hxqlfvZX21k6O7+wLlXDUHmpkyJcP46x49GlO1EAsoavpAiUCujg7trjK+UnZrQgkVAZ4ck2B8eHjAssdiQzTfwHFrDiji/uSPZw4WnxbxJpeXiC9S7C/TMCF/YenaoKmUKQ2CSPW5/xYxEDG06wiKTK9i3LjYbRIW6oEfC6DvIUyPITE4dIW9kRgUaP3Z2X+wnNl5hNvV7puzXtCCEjyqQ4EqUAnjl80WrZTyWiuMdkfAAKROBnPVwAkQndw9sLj71ktERv93wdBB3SEGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMXT2ZVQw2wA5iL09XanV5OpL9jUtQZtDIehowkp1dk=;
 b=hJbRe4WIvTP5RL14tfEFb8dyAdzhn61enUv9/AD5GIfa59M+BHFKDXuH+0q6QqPnX6qz7fsjrJwfRYvIupVbTgdU2I+e2iqyBXorE7rj217FZ0nppNLs9aSw5bsN7Yb61/5zXAcIaqmipupIs8nC2aC1axNV+bg+/2sfXrPBA+g=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Thread-Topic: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Thread-Index: AQHY8DVcKFNDls96akm0LlhB1cf9B64yRBkAgADyKCCAAA1MAIAAAWqg
Date: Mon, 7 Nov 2022 10:30:18 +0000
Message-ID:
 <PAXPR08MB7420AA9428230246BF21D0409E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <9c3bfa0c-2c8f-2160-46d1-3be234b5bcaf@xen.org>
 <PAXPR08MB742097DFF1BD4E9BF19B41459E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <88c909b5-4cad-aab0-2acd-fb3519963128@xen.org>
In-Reply-To: <88c909b5-4cad-aab0-2acd-fb3519963128@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 054A1801B4950945805C8E40049A97F0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DB8PR08MB5500:EE_|AM7EUR03FT059:EE_|AS8PR08MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ada50e8-1093-4cf1-c505-08dac0ab1944
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PDdTgAMWQdHAMxfro9mThdjrCSAShp9EJoJZcah+eXUlLowunROY1ZcGyAyI42tE1MzH+kCtXcCp2z9uajiLAt/u1kFOLUsDrDL+FS02WAHjMs0VhH33jPFalPODZUn28uJiHv5Z4RimRrIm4qCiMyydbji98s1MLbeqXNXX+Nq+mA+smbG50ZA+OOaIeJK6qGspDpypIQMI0lQTfA224bFxDY3f6zpRmozqNeE039fIQP/+b8vbBCaNKPj4HEXgNFDko0fRwQ0W70eoV2Py3qUcLJ188Kpp99qH1qV1RtffQUvuIv1N/xTGFVjOll/iW207vBlxeNsJ8sNTPNvdeuAOMD02Se1DOg8nfmqLarvT0ehe81hPYV4M20kBuACkpVlnUAg1G59NW21l5/o2WUp5SZ0EPnmls8AYDhSQP4Ml1WqXm6u0adZeTXQzClTawa3dq3bP8b4odN0Bcl6FfYZ59qo5QHH8LUz06GqsAzZ3IwA70MzojZ2Ort9w9hAxQTHHWVF9hNMhlB3MBalH8b9d+gBFpnS36uShjZxE0uZR0tUUDjWyvOb3fSLFGQ6nZuSTwnlabRBYQPN+BZ0vcW1UTYnyfNqIFAEulVtDjer3McSl9lY10RBevWeBkIjsz7VHJ5wb14DIFet4zzE4CAxia9Yop/HHMbWG8W8whOezMDI/Xz7fUC6oLFv7bfS1JXOEeH6hajWIE2gBsGx+5LVUN2LrQ2EfJEg+O/jthG4AO7LITvBQYPwfeY6uYFXVsHDKnVnPTDL3kfbf8E4xXp1JB9NkdgWJZBYObFUihqFmPWF/gydyni8qJCyxkIku7itNawyP3iik3xEepCNN8Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199015)(38100700002)(66476007)(41300700001)(4326008)(66556008)(66446008)(8676002)(64756008)(66946007)(54906003)(110136005)(38070700005)(26005)(83380400001)(71200400001)(8936002)(55016003)(966005)(478600001)(316002)(33656002)(2906002)(52536014)(5660300002)(9686003)(186003)(76116006)(122000001)(53546011)(86362001)(7696005)(6506007)(17413003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5500
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09bd3799-e309-48c0-28d6-08dac0ab10ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vtCtP+GVZykxmFR/vzW1YcAsIvYWAja4ofEKy9W2x2SYcYpzB+GyZthVqoV/Ps97Xa6+s43IaZFmFJIzqvT4EqWxbA1FN4Csh4j6q5HDQPxHYBcvN1WnWi0RBmMWFUQ/tvfiVTWeLOt2YbLRWmtfJ4uKzvbRstXzwbySNq3zCgZaWSrSIJwBHeEonCN+GHVP7ytIPTnQu5NAIGgJASVPgJoeLSCekMu5vO0KPpnLcPcjWp38PRBOK2JpHgBLhDrJwzLLqVSQNECuglueBqBV00LfbYvlZL+qcirMipoSPDDam722LewH/syX4nLsAj/xXuFS//54/Htem5DUL2Dxw0YQynK+NIarol3hRHgRbPCPp1VfYTmVOHZ1aPltIZsNYoECNVmUyYgIjzB3y2keAwZZIxAx9mXGrNzT88RKtovPd7oDi1uSn3V0XszM+iZbOjO7FWRIvwSGVebXy/mpzqduNw44tgsntD3/8OTFHRWIdVCPcufiVDfGG2PAAI5/xLjZWJ/m7q043ofH9cQUP26qTIkomWSKb5IwTaIid+i2augORECRrd1REIsQ2NPCQ7Airuy2K6Y4mJknWYaELlSYgas7VqVJJu2O91eeP1azDQXKlrvfOZDoYRYkgzd9059RAW2Bnw8o0KxuI9SfpGIbBZsU1W+6FhpSlbhKv4qADdpF+a5r6LoeVBBwHEbDrY9Uu01qWPJleve5mqgGPyJwj827kQum7ZlJ9dkscJq7Jw99Eq047RSIsISgBmqXr/45vYIvsidgYvdXkz2hoseC3kXuWGUFYLEQklX9tV6GTq8552CGh1BW9FjyVvbzgbPFrZTU8cXKN5oIHRYGag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(8936002)(36860700001)(5660300002)(52536014)(2906002)(33656002)(55016003)(336012)(40480700001)(70586007)(70206006)(316002)(82310400005)(40460700003)(86362001)(186003)(82740400003)(478600001)(110136005)(966005)(356005)(81166007)(8676002)(41300700001)(4326008)(9686003)(47076005)(83380400001)(26005)(7696005)(6506007)(54906003)(53546011)(107886003)(17413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 10:30:32.1755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ada50e8-1093-4cf1-c505-08dac0ab1944
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7815

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQxMeaciDfml6UgMTg6MTYN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1
aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwMC8xMV0geGVuL2FybTogQWRkIEFybXY4
LVI2NCBNUFUgc3VwcG9ydCB0byBYZW4gLQ0KPiBQYXJ0IzENCj4gDQo+IA0KPiANCj4gT24gMDcv
MTEvMjAyMiAwOTo1MiwgV2VpIENoZW4gd3JvdGU6DQo+ID4gSGkgSnVsaWVuLA0KPiANCj4gSGks
DQo+IA0KPiA+DQo+ID4+PiAgICAtIFN1cHBvcnRzIG9ubHkgYSBzaW5nbGUgU2VjdXJpdHkgc3Rh
dGUgLSBTZWN1cmUuDQo+ID4+PiAgICAtIE1QVSBpbiBFTDEgJiBFTDIgaXMgY29uZmlndXJhYmxl
LCBNTVUgaW4gRUwxIGlzIGNvbmZpZ3VyYWJsZS4NCj4gPj4+DQo+ID4+PiBUaGVzZSBwYXRjaCBz
ZXJpZXMgYXJlIGltcGxlbWVudGluZyB0aGUgQXJtdjgtUjY0IE1QVSBzdXBwb3J0DQo+ID4+PiBm
b3IgWGVuLCB3aGljaCBhcmUgYmFzZWQgb24gdGhlIGRpc2N1c3Npb24gb2YNCj4gPj4+ICJQcm9w
b3NhbCBmb3IgUG9ydGluZyBYZW4gdG8gQXJtdjgtUjY0IC0gRHJhZnRDIiBbMV0uDQo+ID4+Pg0K
PiA+Pj4gV2Ugd2lsbCBpbXBsZW1lbnQgdGhlIEFybXY4LVI2NCBhbmQgTVBVIHN1cHBvcnQgaW4g
dGhyZWUgc3RhZ2VzOg0KPiA+Pj4gMS4gQm9vdCBYZW4gaXRzZWxmIHRvIGlkbGUgdGhyZWFkLCBk
byBub3QgY3JlYXRlIGFueSBndWVzdHMgb24gaXQuDQo+ID4+DQo+ID4+IEkgcmVhZCB0aGlzIGFz
IEkgY2FuIGJ1aWxkIFhlbiBhbmQgc2VlIGl0IGJvb3RzIChub3QgY3JlYXRpbmcgZG9tYWluKS4N
Cj4gPj4gSG93ZXZlci4uLiBIQVNfTVBVIGlzIG5vdCBkZWZpbmVkIGFuZCBJIHdhcyBleHBlY3Rp
bmcgbW0uYyB0byBiZQ0KPiA+PiBtb2RpZmllZCB0byBjYXRlciB0aGUgTVBVIHN1cHBvcnQuIFNv
IEkgYW0gYSBiaXQgZW5zdXJlIHdoYXQgdGhlIHNlcmllcw0KPiA+PiBpcyBhY3R1YWxseSBkb2lu
Zy4NCj4gPj4NCj4gPg0KPiA+IFRoZXNlIDExIHBhdGNoZXMgYXJlIHBhcnQjMSBvZiBzdGFnZSMx
LCB0aGUgZnVsbCBzdGFnZSMxIGhhcyBhYm91dCAzMA0KPiA+IHBhdGNoZXMuIFdlIGhhdmUgc29t
ZSBjb25jZXJucyBpZiB3ZSBzZW5kIHNvIG1hbnkgcGF0Y2hlcyBhdCBvbmNlLCB0aGUNCj4gPiBy
ZXZpZXcgcHJlc3N1cmUgb2YgbWFpbnRhaW5lcnMgbWF5IGJlIHZlcnkgaGlnaCwgc28gd2Ugb25s
eSBjaG9vc2UgYWJvdXQNCj4gPiAxMCB0byBzZW5kIGFzIHBhcnQgb2YgaXQuIEJ1dCB0aGlzIGFs
c28gbWVhbnMgdGhhdCB3ZSBjYW4ndCBkbyBhDQo+IHJlbGF0aXZlbHkNCj4gPiBjb21wbGV0ZSB0
aGluZyBpbiB0aGlzIHBhcnQjMSBzZXJpZXMuDQo+ID4NCj4gPiBXZSB3YW50IHRvIGhlYXIgc29t
ZSBzdWdnZXN0aW9ucyBmcm9tIHlvdSB0byBtYWtlIHNvIG1hbnkgcGF0Y2hlcyBjYW4gYmUNCj4g
PiBSZXZpZXdlZCBlZmZpY2llbnRseS4gQ2FuIHdlIHNlbmQgdGhlIHBhdGNoZXMgYnkgc3RhZ2Vz
LCBldmVuIHRoZQ0KPiBzdGFnZSMxDQo+ID4gd2lsbCBoYXZlIGFib3V0IDMwIHBhdGNoZXM/DQo+
IA0KPiAzMCBwYXRjaGVzIGluIGEgZ28gaXMgbm8gdG9vIGJhZC4gSSB3b3VsZCBwZXJzb25hbGx5
IHByZWZlciB0aGF0IGJlY2F1c2UNCj4gYXQgbGVhc3QgSSBoYXZlIGJldHRlciBpZGVhIG9mIHRo
ZSBzaGFwZSBvZiB0aGUgY29kZSBhZnRlciBzdGFnZSMxIGFuZA0KPiBhbHNvIHBvc3NpYmx5IHRl
c3QgaXQgKEkgbmVlZCB0byBjaGVjayBpZiBJIGhhdmUgYWNjZXNzIGZvciB0aGUgQVJNdjgtUg0K
PiBtb2RlbCkuDQo+IA0KDQpJIGFsc28gcHJlZmVyIHRvIHRoaXMgd2F5LiBBZnRlciB3ZSBoYXZl
IGFkZHJlc3NlZCB0aGUgY29tbWVudHMgaW4NCnRoaXMgc2VyaWVzLCB3ZSB3aWxsIHNlbmQgdGhl
IGZ1bGwgc3RhZ2UjMSBwYXRjaGVzIHRvZ2V0aGVyIGluIHYyLg0KDQpGb3IgQXJtdjgtUiBtb2Rl
bCwgeW91IGNhbiBkb3dubG9hZCBBcm12OC1SIEFFTSBGVlAgbW9kZWwgZnJvbSBsaW5rWzFdLg0K
SXQncyBsaWNlbnNlIGZyZWUuDQoNClsxXSBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2Rvd25s
b2Fkcy8tL2FybS1lY29zeXN0ZW0tbW9kZWxzDQoNCkNoZWVycywNCldlaSBDaGVuDQoNCj4gQ2hl
ZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

