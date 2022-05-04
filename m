Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D0E519D53
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 12:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320573.541372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmCaM-0002Op-1n; Wed, 04 May 2022 10:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320573.541372; Wed, 04 May 2022 10:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmCaL-0002Mh-Uo; Wed, 04 May 2022 10:50:21 +0000
Received: by outflank-mailman (input) for mailman id 320573;
 Wed, 04 May 2022 10:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mWz8=VM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nmCaK-0002MZ-FK
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 10:50:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc7217f4-cb97-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 12:50:18 +0200 (CEST)
Received: from DB6PR07CA0183.eurprd07.prod.outlook.com (2603:10a6:6:42::13) by
 VI1PR08MB3008.eurprd08.prod.outlook.com (2603:10a6:803:43::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Wed, 4 May 2022 10:50:15 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::7e) by DB6PR07CA0183.outlook.office365.com
 (2603:10a6:6:42::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.6 via Frontend
 Transport; Wed, 4 May 2022 10:50:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 10:50:14 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Wed, 04 May 2022 10:50:13 +0000
Received: from a82bc442a9a9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 43B0544E-01A5-469D-8C8A-F816AD5029A8.1; 
 Wed, 04 May 2022 10:50:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a82bc442a9a9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 May 2022 10:50:02 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by DB8PR08MB5435.eurprd08.prod.outlook.com
 (2603:10a6:10:113::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 10:49:59 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::6c39:76a0:c05c:2938]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::6c39:76a0:c05c:2938%11]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 10:49:59 +0000
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
X-Inumbo-ID: fc7217f4-cb97-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PfmHPMuklw+D5EA+VpEBhXSvyZQrh1T9LsOSRnwOXLEUuuWTGQVXzf6kyshspw7zZmvthMBxLEmD6V03CTslSoR3GOc5XMjt1/aVcjg7mcATdcmDtwBmZL6M4m5gbuScFx0t1LggbjHAcRf0rIj8XxXM9n6bnMQkkaPifQ6EupxbhE1Wx4cVacwudrzm5GecR/rAcLkDeFFkg7X96hAMbG35gPEq8owMhcibwLeSCpzHg0EwI+5+ro7StPNzDGEwDAWXT+wsfrGRXSwV4qLhMp4s8Wwpb49KiZVjQecxjm/QE3CP+lsyXvBJww1pM1aM0iy7UzN9UD5uXcatnjh7Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUrGaD67QOs6TcY79KbZjv/R7D4tuZmtwnwyrSQu7xk=;
 b=IbEaDvPny4NXClL4DyNQT7S4oMtXE+DJNmL+Cmxtpp4aRB6Cu9sfHeoJ/rB+VMZI0RcQIpK/Nklokx/CcL1W75LPnWkDGhN06MZyvIYKeqCKSwme79Drt/XXcOMom6WQgsCKNYgoe3292jHlUEjx9q+4R6/uRlhufcCP+wWbSitaNFrdsHxzc30dlM64EAnp1L/6A0EyJbnc035EsuFZxnMwq4mCYO/7UTEC1mM0O9FO5qOxGIgezL09zsSZSKn3D1TKhUQI2QYi08igU8cD0a8mDU82sNa1+LQ7QgJhk8I7m9fawvgWhmiRvQ3yRIPjhkSUkzlImEJD9A+1EH+X6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUrGaD67QOs6TcY79KbZjv/R7D4tuZmtwnwyrSQu7xk=;
 b=2rGtfmSafHtBH8WUVfTBqc5/wqlDtbOW+bCi+vyWg00Jgowbf694G+fS0pz59C5p+4eZ043v72qyZjreiBmX2rw6Zre7buqz3iPC1wKO8ENQx5Q9dbtoj7BvceuowvIbFXdPd0bFY6j/VljSsRAm51FhGJIjHkcHfrGekLz68ww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48f6a743b9987708
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxST/VwUEWvCKoooN+NTg92d9UYnCFmf4/89erFLXgukLPYl85AgIVH04CouQQF26M6wQXpbnUNZKidPwNqwAl3z1anhmnGWDLp0ujijGwMmES44ZvyWzI2VICEaccRpMrf1w7pmHcXoemWG53fid33SJdFzWJUf4XiGxssC2YcmDoTvXNVCiLT/B1b3N2/+EbLPKoCVndO+pjV17hwnDQyCq/K4YsWhViIl1P2pYF0s3hC6FSwqou7KsNeK9nR7CRi4spXnHTUHLQbiNDBT5Z+p3+vWhmQWtqJ1lCCHzTEZqYfI6st3mOuPCuznhtVN1I7U2Zhb9bjPpUuTjIfg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUrGaD67QOs6TcY79KbZjv/R7D4tuZmtwnwyrSQu7xk=;
 b=MkAIgrJ6s8W+LpLEqbrwVLzRNhTfWTc0399NjCcHVb0cUpUc7TmXpkeqVNmGdJe9c+uFt4yayY9UsXxvxqT9HRlBHmbQ/HFfUh9fD8Gcanzi0WX/3YUk+ej8Q0HKTwK79tqDlWMUYYVOcnjVqcC+i/vhWTVoAhiq78GLry3YfXYTXrZA/PJboB7Vl7v4uOus2/Wyom5UDg4uBhy+YBCYAXj7fVhwPuK8pCXVcBp77YzZycSloAIMgeZj34Ql/UHQpv6xaDInrIKnnn46VBdd+CPUrRbgaDJA1GWOL3M/i6ZKjHkmXDO9kaB9Pk5nc4OMJYLBHSlxA5ZiW8KJFfstqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUrGaD67QOs6TcY79KbZjv/R7D4tuZmtwnwyrSQu7xk=;
 b=2rGtfmSafHtBH8WUVfTBqc5/wqlDtbOW+bCi+vyWg00Jgowbf694G+fS0pz59C5p+4eZ043v72qyZjreiBmX2rw6Zre7buqz3iPC1wKO8ENQx5Q9dbtoj7BvceuowvIbFXdPd0bFY6j/VljSsRAm51FhGJIjHkcHfrGekLz68ww=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Topic: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Index:
 AQHYWlHsf41jIOfeQ0mX6M++noloAq0EDIIAgAEMUACAADIdgIAAFDQAgAf3yoCAAT3VgA==
Date: Wed, 4 May 2022 10:49:59 +0000
Message-ID: <3ABD11B7-08F2-495B-A008-B00E2F671D85@arm.com>
References:
 <7762e8e35be1f99f2a7ca81aa8cf8fc502030e7b.1651075773.git.rahul.singh@arm.com>
 <a2bba079-0a26-8648-6f39-93148dbd5107@xen.org>
 <73BA5CB5-8B01-41BF-B967-15886554C230@arm.com>
 <fd2492da-0980-2dd4-f8d8-e2b86e9444ef@xen.org>
 <92ECC32D-DA6E-4DC8-B0E2-8EC758471C4B@arm.com>
 <76b13da0-9ec4-1cc1-547a-129f89956ad5@xen.org>
In-Reply-To: <76b13da0-9ec4-1cc1-547a-129f89956ad5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1c0a19c0-a187-4f87-feff-08da2dbbde7d
x-ms-traffictypediagnostic:
	DB8PR08MB5435:EE_|DBAEUR03FT013:EE_|VI1PR08MB3008:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3008C54A9B560A7F9A33D7C2FCC39@VI1PR08MB3008.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YLJRpenSkYMunDi/ROdnkWVdJkucXgIxb6UFFnFH/WXlCDXbsY9FiVsICGVvGzEFwHrqWEgpKRgJ287RDEvAAHyvscG86gt4YCwVqhyuT5Dzj4pKwp6/2OxY3Bg2L11DRAOiRmzK+VucEtAY96m0SaicTpya/j2YZzUPjgedagfQMX/NzlaLhSsBVRnvH7sbsqLk1N/u7tIL1vM7Xebkd3cYcaSX6iPrkl6zb2hkHRSkm8oqeHFjhXbakPqBrqz39k75UzLqx1TC4Tkl4+3qyJoJb0+QHHnXpBM759gs8VXoVUM2Tu165o+FyNnTefYwTu7NNp73ekouGwDGjsv6tO2iLKAT0nVYLj5lwk1z+38cKCVmQxpjg2me7KCjyuPSVJ4DaXwhCVq5EGkhmwbyuzXb0n81fI3qaXbIs/4JMwJiE/+P4yreD9bvPEtU3+Nd4whr3u+TRDxmmfod36XuVZqRQa1Ku2U6MsxthbAhkofor/JvU77G6FnCDWd690jv22eBOWLjIbLjKfnvA7Jp1HxQpBpInxDrHOLTmQloQ/eAmtbJY0IGG+PvonvpLWXk62c4Hjqz4XFioyQ5izHtTbOV2dISZZdZR6Mz1fIr2Zu1C0qr6k/5Sf9x3T6Ycv6zHJRR/awWBSw8KekqwPAGsd0JeiGsowGfJeh0wudwHrb9QzLidSnZZudZoLEsYe483VcgezMQyfsOEXNTEfPggsIXqNCliQg+Utq1W4a55v9Zs95yU/iLoVYGa+kqzQZlxAdD7sSjRqrXdEmI9Fkja9v0OvDVDfuosksK19cu06sLpqEM1WX/CojbaHmI6fvR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(4326008)(86362001)(6486002)(8676002)(71200400001)(966005)(91956017)(508600001)(66556008)(66446008)(64756008)(38070700005)(66946007)(66476007)(316002)(6916009)(186003)(54906003)(83380400001)(2616005)(122000001)(6506007)(26005)(53546011)(6512007)(36756003)(8936002)(33656002)(2906002)(5660300002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E506F8C0996BFB43B119547634A975D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5435
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a45df6a8-1690-4567-a929-08da2dbbd5d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OtKju9h0F7sFjRg0paYHrToYeiKxsilTGofHa9dpLEZj+AIg9DYFheuswo6qOemQBeNN+U2HOBd++VHO3xzaVFHzVFPGfStoY2KgvKA8tzIMEu00pGK57uOm71rZlT+zUGnMmrBFBY3x+5xj8yjbbRcbylMCN4cpezT4MJwoRzDWlbXhlZOROElZu1+NW6MnBmhnd+oxMLVmJ7FJssGgtIkbFU+QONsdjNXdIhm0ZtZYiX0ibGuGh4mrj0eVemcX4jpQ0anZ6eFnQU2K2S5Eqblbs914ifyv+tIQckWw1AX/Ud9cQSmHHVW2D4PPBH+uidtKodEmo9Rn2zXbAGP8Lh+n3a4h2/IUTOVbDTDVAwsnz3DB4/R5E4eO3PVDNxmjilQe725In4/fwMxwMx1bi2pfRnu2GnRSVbesZFxEQNDJaiWOFJDlE8DK2CUdlzfP7SWs+Y0wgDGJPWLr8ZcI1tCdi0mBaGnY2ryB5ER8syYv9vQUeMYCu1DJFU+qC/xKOEDpS20CzIdjbzUQZgKy9Vwdq31ihnxAHM7SOlkJgSd4Uo0uF8mb+giD2BqENWASR5Y3/cJSpBDp0YBwu/eLTM+njbDmaXYch20w0VKVMv56kM+NALqfcEALHsKiAejsVgEmrvjUjZ1OkoyIojCyqso53VSqAl/L/MZl6y8uhOADoegBHSwY3CR/OpidC22oSgDIDdG7+p64RTQTyO9aMitVJ8L7dDYpBZ1lScjKiAls1wOQwM9WOmdUzqvpYg4UpfJtNjln0bo+7DfhI6UHOg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(2906002)(6506007)(53546011)(6512007)(26005)(5660300002)(6486002)(8936002)(966005)(8676002)(82310400005)(508600001)(36756003)(356005)(83380400001)(6862004)(70206006)(107886003)(81166007)(70586007)(4326008)(40460700003)(336012)(47076005)(33656002)(186003)(316002)(54906003)(36860700001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 10:50:14.1123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0a19c0-a187-4f87-feff-08da2dbbde7d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3008

Hi Julien,

> On 3 May 2022, at 4:52 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 28/04/2022 15:11, Rahul Singh wrote:
>> Hi Julien,
>=20
> Hi Rahul,
>=20
>>> On 28 Apr 2022, at 1:59 pm, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 28/04/2022 11:00, Rahul Singh wrote:
>>>> Hi Julien,
>>>>> On 27 Apr 2022, at 6:59 pm, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi Rahul,
>>>>>=20
>>>>> On 27/04/2022 17:14, Rahul Singh wrote:
>>>>>> MAPC_LPI_OFF ITS command error can be reported to software if LPIs a=
re
>>>>>=20
>>>>> Looking at the spec (ARM IHI 0069H), I can't find a command error nam=
ed MAPC_LPI_OFF. Is it something specific to your HW?
>>>> I found the issue on HW that implements GIC-600 and GIC-600 TRM specif=
y the MAPC_LPI_OFF its command error.
>>>> https://developer.arm.com/documentation/100336/0106/introduction/about=
-the-gic-600
>>>> {Table 3-15 ITS command and translation errors, records 13+ page 3-89}
>>>=20
>>> Please provide a pointer to the spec in the commit message. This would =
help the reviewer to know where MAPC_LPI_OFF come from.
>> Ok.
>>>=20
>>>>>=20
>>>>>> not enabled before mapping the collection table using MAPC command.
>>>>>> Enable the LPIs using GICR_CTLR.EnableLPIs before mapping the collec=
tion
>>>>>> table.
>>>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>>>> ---
>>>>>> xen/arch/arm/gic-v3.c | 4 ++--
>>>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>>>> index 3c472ed768..8fb0014b16 100644
>>>>>> --- a/xen/arch/arm/gic-v3.c
>>>>>> +++ b/xen/arch/arm/gic-v3.c
>>>>>> @@ -812,11 +812,11 @@ static int gicv3_cpu_init(void)
>>>>>> /* If the host has any ITSes, enable LPIs now. */
>>>>>> if ( gicv3_its_host_has_its() )
>>>>>> {
>>>>>> + if ( !gicv3_enable_lpis() )
>>>>>> + return -EBUSY;
>>>>>> ret =3D gicv3_its_setup_collection(smp_processor_id());
>>>>>> if ( ret )
>>>>>> return ret;
>>>>>> - if ( !gicv3_enable_lpis() )
>>>>>> - return -EBUSY;
>>>>>=20
>>>>> AFAICT, Linux is using the same ordering as your are proposing. It se=
ems to have been introduced from the start, so it is not clear why we chose=
 this approach.
>>>> Yes I also confirmed that before sending the patch for review. I think=
 this is okay if we enable the enable LPIs before mapping the collection ta=
ble.
>>>=20
>>> In general, I expect change touching the GICv3 code based on the specif=
ication rather than "we think this is okay". This reduce the risk to make m=
odification that could break other platforms (we can't possibly test all of=
 them).
>>>=20
>>> Reading through the spec, the definition of GICR.EnableLPIs contains th=
e following:
>>>=20
>>> "
>>> 0b0 LPI support is disabled. Any doorbell interrupt generated as a resu=
lt of a write to a virtual LPI register must be discarded, and any ITS tran=
slation requests or commands involving LPIs in this Redistributor are ignor=
ed.
>>>=20
>>> 0b1 LPI support is enabled.
>>> "
>>>=20
>>> So your change is correct. But the commit message needs to be updated w=
ith more details on which GIC HW the issue was seen and why your proposal i=
s correct (i.e. quoting the spec).
>> Ok. I will modify the commit msg as below.Please let me know if it is ok=
ay.
>> arm/its: enable LPIs before mapping the collection table
>> When Xen boots on the platform that implements the GIC 600, ITS
>> MAPC_LPI_OFF uncorrectable command error issue is oberved.
>=20
> s/oberved/observed/
Ack.=20
>=20
>> As per the GIC-600 TRM (Revision: r1p6) MAPC_LPI_OFF command error can
>> be reported if the ITS MAPC command has tried to map a collection to a c=
ore
>> that does not have LPIs enabled.
>=20
> Please add a quote from the GICv3 specification (see my previous reply).
Ok.

Regards,
Rahul


