Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13302555168
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 18:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354245.581306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o43P3-000810-4G; Wed, 22 Jun 2022 16:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354245.581306; Wed, 22 Jun 2022 16:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o43P3-0007z1-0E; Wed, 22 Jun 2022 16:40:29 +0000
Received: by outflank-mailman (input) for mailman id 354245;
 Wed, 22 Jun 2022 16:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UqP7=W5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o43P1-0007yv-Do
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 16:40:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 047fd8b5-f24a-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 18:40:26 +0200 (CEST)
Received: from DB7PR03CA0101.eurprd03.prod.outlook.com (2603:10a6:10:72::42)
 by AM9PR08MB6981.eurprd08.prod.outlook.com (2603:10a6:20b:414::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 22 Jun
 2022 16:40:23 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::ac) by DB7PR03CA0101.outlook.office365.com
 (2603:10a6:10:72::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 22 Jun 2022 16:40:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 22 Jun 2022 16:40:23 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Wed, 22 Jun 2022 16:40:23 +0000
Received: from 16ec00be5f89.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 73024C99-0D15-4090-85D8-979CCAA40917.1; 
 Wed, 22 Jun 2022 16:40:16 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 16ec00be5f89.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Jun 2022 16:40:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0801MB1911.eurprd08.prod.outlook.com (2603:10a6:4:74::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 16:40:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 16:40:13 +0000
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
X-Inumbo-ID: 047fd8b5-f24a-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cuGyg6BG/sHYBiRCirvyDe5FrWE2HuVS13UGlQjzKwnH9P8rb3LFp2xUYIRnDWpfO/l18S90WrBLyZGDKcLY36WPW3SmprTo+deG3S3UKWhrVa4+C7MpbgSchXrHJG6GWZ205ltOvmNMcZbHWo5CuOejdr6kZzXiLkANRbPmM6BHCe5A8wTltnNMvzfqDltmu56s86jixd3v0/+ssjnOiGxjmYTpd8IChfIOE9wp7HNfmBMmKBEfUopY/vx40HFT1a1tBaUX5MlgfJD3ZgNGv8RKR3Cg/oeoIP9qOLy8RAW90QPeo4/sthArkuSaTWjCGsbwaN+gXz/33R+mzM98xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCebDf01YV/u880QEKJ/QrV9YMFnO0Td/GA8HPgRwc8=;
 b=l+PmW8bp7oT/Ph9EJN8LSE/qrsGIteWPhJ+fWFIk1mWHiw2JafWYgySQWEBj25JBijHSS3NY32/2/FQtfaC3J/8kA0s/Tqk1Xp3GK9xcd2iEI6LoAq/qYRuS29kosijMNIyoyNTXZs2LRhD0+tcSAak9lyQeQDum8Zs/RD0UDf76LokLIvlIUcVt8THwteGMbDYtoTGrYJA77xwOmyBaMPMJVJErF81ISa1d5ven1JY/mMyVl8fh+yaYFd2iTsqWXyJCvxKMmqGAGxwL79C1TfM3nT/1pWGC+ucoR3GP7o0uV06An67+eYT6ZJZNWwcvt7MbyOcTVI/Cxpu3/JS+SA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCebDf01YV/u880QEKJ/QrV9YMFnO0Td/GA8HPgRwc8=;
 b=mVbceSuv6zoOoLDB2rIXkjR7SRfkAzOuAkCPTniT984PUaaquxLNVtiOoXpW3w1E6P/6zuke46lt02+s2FdM0kFtBWB4oJfwfLPmPToC7Kt62elCmFDavnWnaCa7RN4k29sBuzypxb5F6yhVhwmy9lhHHCJMORyZ3cDcX+1a+p8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5533e804f7d6d983
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp2GL3fniGapjloSe/NrScGG08LebrSTkoIoapg/60lIZYpWkFGtp5oC/InNBUQPuDesQNN955FbOADqKRK631VU/QLY923E8A8kOAZ9Z/DBjW3Po1hE/0UksaK/xmPNf+rPrepiO+RMHYTsadW7+jFV55nT0biAIDQakK9U/zygiu9y0kM0m02JIn2UiL5qMcj7/Uff03e/fjYlwaIJcS+tDb9L6he3+/n4T8phCuku8OAgSuhrE0K2+EpsTMki9mhP+8QaCQPb7z/Id5KU58J1KREuiLjkluu2nOVKNRt2B8lAy30O089U43Mxc6CiIZDMdJYc/dwdXd8s7FascQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCebDf01YV/u880QEKJ/QrV9YMFnO0Td/GA8HPgRwc8=;
 b=l6st1TPjL+Fz68LihfEuRpqEHMOqdhShAp+wvZWmOpgoaHKfPW7B6EZkvutRkxDVWtAeVhB3h82sVduAFdaM6ukdtRSCZy6oVizdPQ0O4ndeJpZT11/TS36U+jfRLxEvJMHbBjWxtAlSX0UigIIS7oGEFnChOjhXdEFDSur/g1Z9wxkG6mZFE0w3/v9fMVsxlixtEUGlAZkHA5Y84lVpG1lHqz42Uaj0YVQb9dOl3RqL8Y+nq3yQkJmgMWQhydsh1uK9M2oggbVxDX0YhzbgyM/VCTGbXCY6Jyhjh3szv/UTzJtxmMOmu5wUuPefhwvJN0PDv61e6UVzn+f4jbVmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCebDf01YV/u880QEKJ/QrV9YMFnO0Td/GA8HPgRwc8=;
 b=mVbceSuv6zoOoLDB2rIXkjR7SRfkAzOuAkCPTniT984PUaaquxLNVtiOoXpW3w1E6P/6zuke46lt02+s2FdM0kFtBWB4oJfwfLPmPToC7Kt62elCmFDavnWnaCa7RN4k29sBuzypxb5F6yhVhwmy9lhHHCJMORyZ3cDcX+1a+p8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>, Julien Grall
	<julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<Michal.Orzel@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, Roger Pau Monne <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: XTF-on-ARM: Bugs
Thread-Topic: XTF-on-ARM: Bugs
Thread-Index:
 AQHYhWH1+fjNtvukV0adEqGEdTB7sq1ZxCsAgAAXIgCAAAnTAIAAf4aAgAD4xwCAAEImgIAAAyaA
Date: Wed, 22 Jun 2022 16:40:13 +0000
Message-ID: <A06EA6F6-BBB5-4FDC-BEA0-E5C6EB6B445B@arm.com>
References: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
 <b8f05e22-c30d-d4b2-b725-9db91ee7a09d@xen.org>
 <fd30be68-d1ac-b1bc-b3f1-cff589f338ee@citrix.com>
 <c97de57c-4812-cdfc-f329-cc2e1d950dc7@xen.org>
 <CACMJ4GY+H7P733_-UNgSd7P8+Z4ryeJwVy3QfekMJskkmh9btQ@mail.gmail.com>
 <30BB31A7-F49C-4908-8053-74E31D03BD33@arm.com>
 <36854512-23fe-57dc-3c47-5f996927872b@citrix.com>
In-Reply-To: <36854512-23fe-57dc-3c47-5f996927872b@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c1da04de-6d66-430e-b2ae-08da546de716
x-ms-traffictypediagnostic:
	DB6PR0801MB1911:EE_|DBAEUR03FT041:EE_|AM9PR08MB6981:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6981500413CA534C4E166F499DB29@AM9PR08MB6981.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q5MYUQVhI8LKJoxQkc//VWgKpuoAj8+k+R2uHo9T3TsjLC9BVnHrnOLKXUMAj5iBxZ/beAjBL66BuQ4H815fewNHkch0FB2b7VcQJapaS1E5dFMz0h7zMMVTU26IReM4l6IqiQhzYIbQ6SpmnX1jtYVEpParXm43TEs4cVPcBRZpo1rEsx9dlQPq255RQogyDH0D3/fIsKltn5EKB17Y9O8NfmbgUVM/nh+YhjDFi1H6115JEovA59U1u5KdJPGSzGjBZbr/u8mPyETRBPve+0UtGwwvo7c7wqMDBboiCj/q1+UoKLoVHhPffzdbiPdpeDxwKuvmr0UBM/9i+S7oU0vDc78NUYQIxuhrsa+eE7EdRjZdm6CGxodScPJh8u86wN+0tTdrJMzuAqyg+CrkPWf+A2SdM6e6mTKOI3g4OZxPlQ/FNbVaqnJ9FOryDllS7a25A5NEgiXgi6oE8y2U2jw7YEla584WDLj8QJaO+Xh0jRHeRvfpkvdrxVgb7sL5M6pvcga/N1pqvLCUz6S2axnPFLZb5kqxaefI80tY2r8vICuXIv+BHuMazT1foIYNgwMybQxqnYkuuf3IeyOftgGgsFAnYlcRockYhj6tmTinww9wyfQV85hzQfEeh2JPlQ7tAaGSRpcpKjTdabHbHRKDRu03r0LKFIN0sme8lJU3D2tc4HqYGTJAt9D0jj3tAd9fCT2wGMhpk5W7FC362ldANueumq742zhdISFh7XdgXI8KeINx6+wmamjnoJWHMMPeUA0LOSnuB2wzeCmxGCq4qTK+9JnrUlM1y/UxUmcPPS+oafb+HMi8W2xzlH5zwcwMytLSTirTsDMVCP5VxQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(38100700002)(6486002)(76116006)(8936002)(316002)(6916009)(66446008)(64756008)(54906003)(91956017)(5660300002)(66556008)(71200400001)(66476007)(33656002)(966005)(478600001)(66946007)(4326008)(2616005)(38070700005)(41300700001)(6506007)(86362001)(6512007)(2906002)(36756003)(186003)(8676002)(26005)(83380400001)(53546011)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1670565CC8A23848A7FDB70B9CF8251F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1911
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a178714f-4c0b-4876-8df0-08da546de176
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	peuGPf0iw4wKguagc2FiocBRZFmBjdjmbHz+LjAbU7Df0/A1RS5Ev3LPm24h5r/GA/SCap8zMCSp1fHxsidJ+DcBSdtRZgePX7n7mvmtgRQjwRDIXgq6dq3wzCYObp1l8ZW72Mz4FoLJgYmTzc82Fh/JVvRZgL0fopjbkRDrty2Lj0DR4ET5bM1W2kmbZkvjU/2TzQjOFWBAuNiNEM120XLIcPAwkifroEyBmmpyxU3KtmhKoTBH9PWdTqtNpioHInDCsKiqEPmkbJT5pbO5ziLYFh/4uGv06MbGC796u8GnSR4PcQPiv7fA/7HUrXPwuIq0ge4sFEJAgx9kLfcbBxyo3uKUt4bTyhDhVbrdPz7BJSUzO2foYsvlsfvhvlkzN5HVSYcRvC7wBF+PAvMZUEy7JPVXoR0lOaty6bSPZmeR1nBCJsSjOYVr6qAhatLpsNTROImwpEOpEkXUn9tQ5PcMkCivRMoRlci6RmqU7sIT4dPfk0fN1JJLHICYhYBDU9iKzXi73NNZ39yCiyxVZw1w6jdfcZOCdZi6+GErcWiAz8FzjJceGVf8piOJjw+8elYBJV3/K6N0KYlhYti8+/HYQRJST/7OJbks9/OR8d3lccyZhI4byvfvnUrG2/ckBlu9lld0vedG9VCX+7NAsWOeoakDK2O+XXDLdDVvkvYUi45Zj8F5VJWijc0MUs9lv2D90uZDb48ZgGd8xpAA+gDjM9F+gKhJDMf/q3uMHqU9GcvJaX0G4Yc2fqlTCER7kcJc0we5vEp/4DkuUTyL4IDFQY2BUer47A+H67O/kz8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(40470700004)(40460700003)(33656002)(186003)(41300700001)(316002)(107886003)(2616005)(6512007)(36860700001)(26005)(82310400005)(53546011)(6506007)(356005)(54906003)(86362001)(82740400003)(6862004)(4326008)(5660300002)(40480700001)(36756003)(70586007)(336012)(70206006)(83380400001)(2906002)(6486002)(966005)(478600001)(81166007)(8676002)(8936002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 16:40:23.1383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1da04de-6d66-430e-b2ae-08da546de716
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6981

Hi Andrew,

> On 22 Jun 2022, at 17:28, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> On 22/06/2022 13:32, Bertrand Marquis wrote:
>> Hi Andrew and Christopher,
>>=20
>> I will not dig into the details of the issues you currently have
>> but it seems you are trying to re-do the work we already did
>> and have been using for quite a while.
>>=20
>> Currently we maintain the xtf on arm code in gitlab and we
>> recently rebased it on the latest xtf master:
>> https://gitlab.com/xen-project/people/bmarquis/xtf
>>=20
>> If possible I would suggest to start from there.
>=20
> Sorry to be blunt, but no.  I've requested several times for that series
> to be broken down into something which is actually reviewable, and
> because that has not been done, I'm doing it at the fastest pace my
> other priorities allow.

You have not requested anything, we have been asking for a year
what we could do to help without getting any answer.

>=20
> Notice how 2/3 of the patches in the past year have been bits
> specifically carved out of the ARM series, or improvements to prevent
> the ARM series introducing technical debt.  Furthermore, you've not
> taken the "build ARM in CI" patch that I wrote specifically for you to
> be part of the series, and you've got breakages to x86 from rebasing.

Which patch ? Where ? There was no communication on anything like that.

>=20
> At this point, I am not interested in seeing any work which is not
> morphing (and mostly pruning) the arm-wip branch down into a set of
> clean build system modifications that can bootstrap the
> as-minimal-as-I-can-make-it stub.

You cannot expect us to poll on all the possible branches that you are crea=
ting
and simply rework what we did when you do something on some branch.

We went through what you requested using GitHub and asked you at almost all
Xen Community Call what we could do to go further without getting any answe=
r.

You are not interested in us contributing to XTF, this is understood.

Cheers
Bertrand


