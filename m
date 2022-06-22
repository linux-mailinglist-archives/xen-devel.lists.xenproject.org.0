Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B629554A08
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 14:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353832.580825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3zX7-0001JS-Ky; Wed, 22 Jun 2022 12:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353832.580825; Wed, 22 Jun 2022 12:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3zX7-0001H8-H1; Wed, 22 Jun 2022 12:32:33 +0000
Received: by outflank-mailman (input) for mailman id 353832;
 Wed, 22 Jun 2022 12:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UqP7=W5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o3zX5-0001Gj-Hj
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 12:32:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 612ac2c3-f227-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 14:32:29 +0200 (CEST)
Received: from DB6PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:4:91::22)
 by AM0PR08MB3201.eurprd08.prod.outlook.com (2603:10a6:208:59::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 12:32:26 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::a6) by DB6PR0402CA0012.outlook.office365.com
 (2603:10a6:4:91::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 22 Jun 2022 12:32:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 22 Jun 2022 12:32:25 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Wed, 22 Jun 2022 12:32:25 +0000
Received: from a97cfa49dd92.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1209F5E3-7F94-4BD0-A9D2-21D0CCFDF735.1; 
 Wed, 22 Jun 2022 12:32:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a97cfa49dd92.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Jun 2022 12:32:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6954.eurprd08.prod.outlook.com (2603:10a6:102:1d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 22 Jun
 2022 12:32:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 12:32:12 +0000
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
X-Inumbo-ID: 612ac2c3-f227-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dGInT8NxHVJEnvgMU+9mSdUhxb3ZxNS+jpN7bBk0ouRZcSSVSDQ/PiwbjeDD2HfNgxQlZDWpDELWy5B+pur3w8lQLdjCPb4e7Z2iBA1aILuG0+UtFDsKb3Id61azuZ7jRlY+e1nXPxaxzwuv0VYW0f5Dxi7nIi0sSVEKwbrmKIJeMasf9QiAGlfGBP2/lsAqkAWoOb9ushawsuz8Dxh+G10i4cylKDiaCpSM2FsEbLfxmnr7Vxzu38EzZyxyYkxO/ModI8Yq57Z5SrXxnkWGxBoFKYTHMLphkGsLlTzASxBze/z8Kl+JjchmTULp7Z0bOw/CvV+fVN/mZpmpD1Wi3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fgi6TXcmSbzgQatpsETcKcNUOjoWcdN5aXIF0Cw4eNg=;
 b=Bum95bq355+27efksxIrdDRkU7dqppJL1Yr0Syk9YzAROvtGuUEbOI3Lh2/KxeE5oo75zPj4nKWHWoLjlXyfAjeSWJHpbxR+R5dMN24U6UsV5PcpLwOo2A9bIAKKBwCcCKimUm8uUNhRUuCZmzL2uxRyTIakIkVNmYp6WX5wiliZAKfJDh0m5zkyZs+CovAcD6de8ZmJBi1a7heiY/pQVE35VXbFIJ80TbSKvfmVUOjuh35C53s2+yqKLEZP+/PN+xrVnRW3X6o24v9gOTB5l+ItGVVB6suuR37F6/AOlUYhy2lZHzJ0ItzYxFYtf4cHYJ5xGz3fXq6SeXYr7yIStQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fgi6TXcmSbzgQatpsETcKcNUOjoWcdN5aXIF0Cw4eNg=;
 b=2L3RfpB77qfuDVxSinipYBvcYO8sbEhMd55JSjSFygLMf9J+vidmm0j2crxA95O3zuXTf/tkZV6U7zTMD+NCibYU4kEUBJP4U7cbt0qeAq9Fg8jZS+YXfjN800Ybfimn/tDsRHrsejn4AzLQmImcNEWt4iIZcIUDy1zFJoKdYkw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0dd5bd4d7044be4c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=of29tEcOHRZFQrdt0v3lDJoqR0P8fPxpbJxcFZ7sayn9yqSPNcA2j0bGkiQqsWqQeWgqNc3nov7/1PAdj+Vfd4cPr61GiABW/rTI57tUnJlZLJf0Oa6jUoYQru7lyhOAYkdd9Ln/77lHptBoIN2FNAcAD3b8XpMHSR8eQN/ME+qn+v7hohXJ2B+NWImX0zl0Csw3ST7wqFBlNaPv/Lb2VydX8lAhI9pldKDzE9/25YiDMBH9EwTFny2KtpEuUzgVwnwKGuW1IzzdkIFCmE2o6NXruxO+Z8DB+l+p+pzGblw+jEYAW5lpJSKN5NyBN0cAz/m+Tam8CDbsLNl+rZuFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fgi6TXcmSbzgQatpsETcKcNUOjoWcdN5aXIF0Cw4eNg=;
 b=Tgg/DwxbGPVbYBLNZbNw5ih1qJvQiexkM92ZDp8iJMfuIWg9JC1IVIGLwaOYlwKIagDtANG1INJZ4cIPNSwvzmUJa9aE+8oC4xsByeU20sZyZGwrWG2qTDcMiB0Mg+g4mPqcAIpwarF+k7T5ORtheqo9XCRYpIrSk0m9G5la4KoUgWmxFNRGmCrG+e3i1il0Z7DJ0pdIPSxD5QuVJ2ufwpHph20qypKpxvmxG2lnfITUIPiXX0snevS/qp4eUzoNSH+7bKTSyHSvV2csQLNqHNp0rm0YgWGFA5hfTg+9oevFP0uz82P8yTzFeCxCzSTo5c8e37SiH4Oop/yXsuo0Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fgi6TXcmSbzgQatpsETcKcNUOjoWcdN5aXIF0Cw4eNg=;
 b=2L3RfpB77qfuDVxSinipYBvcYO8sbEhMd55JSjSFygLMf9J+vidmm0j2crxA95O3zuXTf/tkZV6U7zTMD+NCibYU4kEUBJP4U7cbt0qeAq9Fg8jZS+YXfjN800Ybfimn/tDsRHrsejn4AzLQmImcNEWt4iIZcIUDy1zFJoKdYkw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<Michal.Orzel@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, Roger Pau Monne <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: XTF-on-ARM: Bugs
Thread-Topic: XTF-on-ARM: Bugs
Thread-Index: AQHYhWH1+fjNtvukV0adEqGEdTB7sq1ZxCsAgAAXIgCAAAnTAIAAf4aAgAD4xwA=
Date: Wed, 22 Jun 2022 12:32:12 +0000
Message-ID: <30BB31A7-F49C-4908-8053-74E31D03BD33@arm.com>
References: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
 <b8f05e22-c30d-d4b2-b725-9db91ee7a09d@xen.org>
 <fd30be68-d1ac-b1bc-b3f1-cff589f338ee@citrix.com>
 <c97de57c-4812-cdfc-f329-cc2e1d950dc7@xen.org>
 <CACMJ4GY+H7P733_-UNgSd7P8+Z4ryeJwVy3QfekMJskkmh9btQ@mail.gmail.com>
In-Reply-To:
 <CACMJ4GY+H7P733_-UNgSd7P8+Z4ryeJwVy3QfekMJskkmh9btQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: eb7ba02f-f231-4e69-4afb-08da544b436e
x-ms-traffictypediagnostic:
	PAXPR08MB6954:EE_|DBAEUR03FT034:EE_|AM0PR08MB3201:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB320125EB8D73DD9218AADC739DB29@AM0PR08MB3201.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nndr8OAhU0/+syNHOt4GSvvQx2mGHQhDVDQHaISjyW+EQsyEMHRCinLO5xusnRS1DiSYaFt5Q+FY/NBv1Xee5nLeeq0RUZExDJ4bEp92TfXgxOgNsgYohS4TxJtyC2s5rXVYsxpBhGmbvHEzDV2QYKxoYsoaOSx4MwkX84JR/I3d5NKnzfXQqW0JKRElKSN2+Zcoyho15HOwiZ14mms9H1Ml5hGsp58OBgEtJA7KVD4fBkwikIQNkF2+/KWTGr/0iV7/mVU4mXGTOnH+QhsAWH8F+Awk9u5jGGk2JEM3+I0qB0mDdPLnu7LdbNZbw5zz4bpgRw5TTLtpN/vdI9JQK/Aj25PBKSqkfBRkybzFizfVC33YFxnhFG7zLmTme4ks93G2+53qtSfFvQvqVdzfwZXkz8/FkWt8fYKp64FZxcxDhP8nkFrNxyqgZ85l1moVCNjMAHk1mEN4Nzdi/wFzvOwYe9pi5PjvYTZ9Dt5197+Vknl8EJLCYIZXIXm8Dl39d2nif84BdOmmDW20B7tLQ/Uq1hty+3cRmKfbyCFk2F0iw+PGNohDQgnGafnf44DPKXmaQrFmPk2lPy+mqPuM5WGnLLom2krWikemsgFVrSGweLRbtIIxZX06lZTeNZNF5mq3aa2bw1ER7OsazvsIfrHqbgnON+gp1ZFGR5v4Ms3dqvxhWajxYuXlyfunx0uOmHuE9Bb4KDbSwejajCstJ8KEeIgTUS8csROScDDQVBCdbXSZheP+QH5nRsNB7NuD+TQdyPLFHxZuQi730f/CPP8PtCUwEk3aitmPBLh2uU1deITtYH7qNIxfSwqLSih5MkkECJ7qdh+lXCspyvFgCw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(5660300002)(4744005)(36756003)(8936002)(478600001)(66946007)(33656002)(6486002)(186003)(2616005)(122000001)(71200400001)(41300700001)(966005)(83380400001)(66446008)(64756008)(66556008)(86362001)(6512007)(26005)(66476007)(38070700005)(2906002)(6916009)(91956017)(4326008)(54906003)(8676002)(76116006)(6506007)(38100700002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CA3F0DA72BBC484A99C97A01047363B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6954
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	359dd567-4264-49c9-e76b-08da544b3b97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0P/d88AiezvuU2yLHksBDR4S0IlLD6qjhGtTJ8fnDac5vAdThxdLu0njWSgzQLgh1ZZyFEa4lulFIyqbly3MRcD7rcdXmHCvdFRF9Aws5DYEJFTYGPMPvwSYkPwOHZ2vI1L8S227GiINtzWxtT07E5C51x3SaGOeAx3DoDEvlh7DbdYMUs6nRMzlxo+0ToZS4pcV8jQvY6i5b38En0ombqfM3Y5MFhBG76fo3Ut6TXcVZvSlge4/M3483g+cAQx6CUiIgWbB+/ttXabRkTngG3/1tt3YcKodLxYXqilfL5y05lbss2ND5b1gRk8ObCZQU8wkC9hSe9uJS34957glzJjeohhQkUi5qvustutTr5pYtRziJNUk3QJXV5cqSUBnYAnVyGRd5tyEI4ZJ8fkMNaRn+FfB8yhBC6uGLHYhVkdNCjAkw4Fc3c5tPUqtG812mBu9caoajCLNaqluwmMzUmNkcoVloyashWj9FjFfmvljhLNLwlFcQr9XWksvDVczMH9FPivcuRpRu4TysYKrnpnh3G1EA5rX++n8FNEtJY6pwMcSkGSuDFwbCKWAWyGr7IRzeF1d1VXUZV4zFAnOOBLqqP2YYMFfKAud3rMeGoc/2pvdDqXCsgRvUHJ/FuLMlbkkdz6v1DNiKDUJkQR7j8YpieI8PaSt9XZLwST2nFFbAT3B1qmCSAws/uWr/BqH1+VBl2nMbplkRT3ry27OhlCdQfmr/DVaLrpB+RNqXLQwW2I7vULUkn5FlK/UbLp9TpNlPsE1/fUH2Vhr8LdXMubuf+Ll51dozXCNM8AV82M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(36840700001)(46966006)(40470700004)(966005)(54906003)(6486002)(8936002)(478600001)(2906002)(36756003)(316002)(4744005)(5660300002)(70206006)(4326008)(86362001)(6862004)(33656002)(6512007)(41300700001)(107886003)(8676002)(2616005)(70586007)(40480700001)(83380400001)(40460700003)(82740400003)(47076005)(81166007)(82310400005)(26005)(336012)(186003)(36860700001)(6506007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 12:32:25.6772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7ba02f-f231-4e69-4afb-08da544b436e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3201

Hi Andrew and Christopher,

I will not dig into the details of the issues you currently have
but it seems you are trying to re-do the work we already did
and have been using for quite a while.

Currently we maintain the xtf on arm code in gitlab and we
recently rebased it on the latest xtf master:
https://gitlab.com/xen-project/people/bmarquis/xtf

If possible I would suggest to start from there.

Cheers
Bertrand


