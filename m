Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5A562D7E6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 11:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444898.700066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovc0Q-0004Tc-PL; Thu, 17 Nov 2022 10:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444898.700066; Thu, 17 Nov 2022 10:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovc0Q-0004Rp-KQ; Thu, 17 Nov 2022 10:20:26 +0000
Received: by outflank-mailman (input) for mailman id 444898;
 Thu, 17 Nov 2022 10:20:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sbrt=3R=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ovc0P-0004Rh-2H
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 10:20:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 727f724b-6661-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 11:20:23 +0100 (CET)
Received: from DB6P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::12) by
 AM0PR08MB5362.eurprd08.prod.outlook.com (2603:10a6:208:180::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.8; Thu, 17 Nov
 2022 10:20:12 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::56) by DB6P195CA0002.outlook.office365.com
 (2603:10a6:4:cb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 10:20:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 10:20:12 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Thu, 17 Nov 2022 10:20:12 +0000
Received: from 35092e57e288.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F823479F-F2B8-45C5-AD00-4502E89A9DC5.1; 
 Thu, 17 Nov 2022 10:20:04 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35092e57e288.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Nov 2022 10:20:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6498.eurprd08.prod.outlook.com (2603:10a6:20b:364::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Thu, 17 Nov
 2022 10:20:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5834.007; Thu, 17 Nov 2022
 10:20:02 +0000
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
X-Inumbo-ID: 727f724b-6661-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9m0uTBehi+zPsqi5jId/NAKX92nGp2NMwLzNmZ+Girk=;
 b=z/3yToptXc7R0Sh1LDzsMjXXwr8dBz53fRWTOPDt66hlp/4rZkbydAmtdmZn/oCVLh7TMws7JUNVxFlDgzDJbh1RpzHkqWFqowu9RLn9FaODleav2n0xxN7T8ZC32Dfdtpkg6n6+2FRVr37Ugmxi6eG4+XLbCNRTx6Y5kwOEgc0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98f4c26d21629d47
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ug54etEbZq3NDcVv1hD9ghug1hcmlXRAO6WxbxWUlaz1Bs6ggdwdThL/qmPopTqI0EeYMYWBJnl8KTyCGpH/Jqjb4jhUieNH5H4UEH5rpTfvDsL3OVud9KDlXQCpn42qhNgudx4E57y8HOi0jUlukR+xGSDCFB3KLdJ7cOU4vMIEIc2ERDIqwgsjlEh2mt5j8sdcr+ONgJTFX/pZRggRzY0fyNIL0RmPYxExK/xmXjZq1oEpZXR5sa1K5hOiFqNM8SbeJPwIwVCGY4MRXy6pyCWfb4OWqYs/jFn/wSNi21PuAxWVOJ08I2NpoUZGwu5CVBYSc06fAwK2OKgQuvlUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9m0uTBehi+zPsqi5jId/NAKX92nGp2NMwLzNmZ+Girk=;
 b=hXdbd5bX6x6Ghn57+L6DQyb9/0qZkmeMrG3+nfB4fhgCrwT5Z/4pqg/SRWK00QXtZP21sjb8GtEdS27kbAcpG6P8/UXGdOibDBAR6jYTMLW1RAdQnoYXAx5oXgTyZnrqsN6txXgb7SpJCouqlCr9iIhh9MFxcmlspraMRD/lqhHm6HtbUGsOFqFH+0qrs9/yIJF+71924APqogq+4OzxigS6mj7v/dlD50Vs3+nl8tcgtOWATFGsjzDIBGYNHAv5Vd3+bIwvT9Hnh2PGCpahQIiqSutpjLpzVw76WEyg5BGKyzZGr0/rCrK6P0esXcm06ujCZFhvGBsCxb6C0xPKog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9m0uTBehi+zPsqi5jId/NAKX92nGp2NMwLzNmZ+Girk=;
 b=z/3yToptXc7R0Sh1LDzsMjXXwr8dBz53fRWTOPDt66hlp/4rZkbydAmtdmZn/oCVLh7TMws7JUNVxFlDgzDJbh1RpzHkqWFqowu9RLn9FaODleav2n0xxN7T8ZC32Dfdtpkg6n6+2FRVr37Ugmxi6eG4+XLbCNRTx6Y5kwOEgc0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
Thread-Topic: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of
 hardcoded values
Thread-Index:
 AQHY55A0LevsoY2L90OFIBLiUlnr6K5Av9+AgACVYoCAAF4AgIAAEeUAgAATsACAACQMgIAACNUAgADp3YCAAA96gIAABs2AgAAE/ACAAAJXAA==
Date: Thu, 17 Nov 2022 10:20:02 +0000
Message-ID: <8AD88FC3-ABED-4B70-9DC5-351C265A7BD8@arm.com>
References: <20221024100536.12874-1-michal.orzel@amd.com>
 <fd7bd57d-b7a2-8be6-cead-2903a6115f40@xen.org>
 <d472516a-6ba4-167d-6eed-e9a4a43f65b2@amd.com>
 <653bdfb0-2926-531b-bb56-d0797fbf3877@xen.org>
 <60cf8d8e-e4d6-2c8b-50ba-ab6c3fe7d84c@amd.com>
 <0400b2d8-6f2c-6406-d966-64ed5720688c@xen.org>
 <350afafd-821c-1a05-13cb-1704d3a61bfc@amd.com>
 <84710d96-c473-fa41-d847-2b109dfb49c9@xen.org>
 <85f4f42b-b1ee-36bf-5ba9-21b1047351cf@amd.com>
 <7d3f9021-d608-9e8f-9593-1099d7bd2003@xen.org>
 <c932c530-69c0-8c75-ff37-cb35d0ad5de3@amd.com>
 <51fdb064-682e-b995-5171-ba23f75bc760@xen.org>
In-Reply-To: <51fdb064-682e-b995-5171-ba23f75bc760@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB6498:EE_|DBAEUR03FT060:EE_|AM0PR08MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: bf06b1ff-61cb-4b81-3fdb-08dac8854fd8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3CreNUJQkFRpWcHdnZdD2xspd2p6+jX8SKhfrIh87zpa8d0++YT3QcQhKMmivRmA2LG4PeztXsugYs1tcQuZnXYtuaL6OeMj5POVIOdWrV2GrMTa00RCun7JG4J5flS6MM4LXnc3vzvBNlR/MkndhtGxgzQ/pPEnWGJIEBnaZB6DBcDfdmKJEyg9NVSsud7+WYj8yJzCGI/s8MLJaw4TND3MscyOzqA2JQyQnwbalWXxtIhZZ7LXaeKIWJDjH5BmP9/2t7TvI/YPIBG0/FvY0G7U1VDpvI4upEyjoQopcSFSh5gCpwbzs56K7SdBCN4a3dN7iT/Dc3C0Y6OZ9tlBNIBWEfoSK1ADvLk7Nh7y6QnFG5x9OEUL+HmU8n8Nbc87X9b3pGUfFDOiZr07KiU/D7KBKGLQHLbs7g1m56yyFgQuBIil3JPWTIuE1J0fwqusLgF7zYY25Nis6U2RceJJuPD8UO1WJbFevi9YAHvYakacsYCot6RhmINQGcJ5ECI+apxPEvW/5DtR8nCGqMlUqtFAX9sRuaSRqxfo9VUCCzO24V5RyA7rY7wL50WclXC6BpQZNGZFDKTQrgndX0vQWEW6nM7UdBOJ+eRWhYutf+yyVCJSqkgdXj0wld2PTc60ZDCcJq7YKfLJk7o0A9HYe7+N0iJMR8Ftv1GfD+ULwpct9oMzrQRE8d62GOHnwCTmbImWvvq9y8qEHx/OphQluHh5IdsM84IvBQ+K8JkVrosc+2MGrjkBbVJ4GYEkVeTj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(6486002)(6512007)(478600001)(966005)(2906002)(66899015)(71200400001)(26005)(53546011)(6506007)(41300700001)(91956017)(4326008)(8676002)(186003)(54906003)(122000001)(66946007)(66476007)(66446008)(66556008)(64756008)(76116006)(5660300002)(36756003)(6916009)(316002)(8936002)(83380400001)(33656002)(2616005)(86362001)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5A9D79E7161A6F4ABAC0F27F271117E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6498
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce837316-2af6-4014-0eef-08dac8854a09
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	713NHal0x8hrHnBc3OrLSI+KiR+jIZYfnH2NHGuj8ApVH5xFgRR2NsNg5YrKlVotpzuQd7CSQnbWzcEAskBatrcV4d/dTvWfe6RZuTy+oZtLPepprPjY+wkg+PpS6Id5aFSx4M4xVWmW3pEf/1L1Mt+EDIz5Gm4K34G9/rO80FWQktVROkGYXywPUVq4HRtwNvi/qZuEkvAxtyFMeMggHi8k1Mt0+vvC4PljlR7Ll7zMQYyJrliDn5vJYhzaRyPLg8GW/N4TGIcDgx8HZOLmlnmPIu2suHJdQaFXVZ4IVGNSQcz502sID5nJGaYWpz2qPqeqYOIIYnj/EuDskd8Yqoligtps2Ko3JoTJ86Oh98hZowgjnm+fMjCyTGAIG9w0hEOnQS4XE7KTUkinuNVB1TY4Uy1FDCgIQksV7Ygj7yhgN0MI1rTuAKt0Pm12RiFZGwT82w+YWfl8TTlsTrtOc+Yl/q1zhDcMkUFo5cJE8nXWjNWAoY42mGU0Y6/sTsiiWg2k9+uM/aLjkEpB71OtMl/c/CqK3hJKjmeOr+Oco//QKkh4iH/KMdHO8ohNtiPFSvayFhcqHVYxjRXwKwaRjVFQrv6VOQx3eUixF5UxW6GhaKeSCiA10hBQxx7wbeUKuyig9pMsN8Z0CKNb4goZDRhzbPTmW0nSbpvbhQakqIDG4kYB8WDYKIWNaWtKhaT3KKU9b2FnZNuW71NvCKrf0YPS9/di03KvHP9KE41K19c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(107886003)(26005)(478600001)(66899015)(53546011)(6506007)(6512007)(186003)(336012)(2616005)(47076005)(54906003)(36756003)(316002)(8676002)(41300700001)(70586007)(40460700003)(83380400001)(4326008)(70206006)(6486002)(966005)(40480700001)(33656002)(8936002)(6862004)(2906002)(36860700001)(356005)(5660300002)(86362001)(81166007)(82740400003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 10:20:12.1968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf06b1ff-61cb-4b81-3fdb-08dac8854fd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5362

Hi Julien,

> On 17 Nov 2022, at 10:11, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 17/11/2022 09:53, Michal Orzel wrote:
>> On 17/11/2022 10:29, Julien Grall wrote:
>>>=20
>>>=20
>>> On 17/11/2022 08:34, Michal Orzel wrote:
>>>> Hi Julien,
>>>>=20
>>>> On 16/11/2022 19:37, Julien Grall wrote:
>>>>>=20
>>>>>=20
>>>>> Hi Michal,
>>>>>=20
>>>>> On 16/11/2022 18:05, Michal Orzel wrote:
>>>>>> On 16/11/2022 16:56, Julien Grall wrote:
>>>>>>>=20
>>>>>>>=20
>>>>>>> On 16/11/2022 14:45, Michal Orzel wrote:
>>>>>>>> Hi Julien,
>>>>>>>=20
>>>>>>> Hi Michal,
>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>>> and use it in the pl011-debug files (+ there is a question wheth=
er we should define WLEN_7-5 for completeness).
>>>>>>>>>=20
>>>>>>>>> I would not define WLEN_7-5. That said, I wonder if we really nee=
d to
>>>>>>>>> set the baud rate & co here?
>>>>>>>>>=20
>>>>>>>>> AFAICT the runtime driver never touch them. The reasoning is the
>>>>>>>>> firmware is responsible to configure the serial. Therefore, I wou=
ld
>>>>>>>>> consider to drop the code (setting UARTCR might still be necessar=
y).
>>>>>>>> I do not really agree because the current behavior was done on pur=
pose.
>>>>>>>=20
>>>>>>> EARLY_UART_PL011_BAUD_RATE is only used for very early debugging (t=
his
>>>>>>> is protected by CONFIG_DEBUG and CONFIG_EXPERT). This is not a
>>>>>>> production ready code.
>>>>>> I am fully aware of it. I just found it useful but I understand the =
global reasoning.
>>>>>>=20
>>>>>>>=20
>>>>>>>> At the moment early_uart_init is called only if EARLY_UART_PL011_B=
AUD_RATE is set to a value !=3D 0.
>>>>>>>> This is done in order to have flexibility to either stick to what =
firmware/bootloader configured or to change this
>>>>>>>> configuration by specifying the EARLY_UART_PL011_BAUD_RATE (useful=
 when you do not know what
>>>>>>>> the firmware configured).
>>>>>>> The chances are that you want to use the baud rate that was configu=
red
>>>>>>> by the firmware. Otherwise, you would need to change the configurat=
ion
>>>>>>> of minicom (or whatever you used) to get proper output for the firm=
ware
>>>>>>> and then Xen.
>>>>>>>=20
>>>>>>> Furthermore, as I wrote before, the runtime driver doesn't configur=
e the
>>>>>>> baud rate. This was removed in Xen 4.7 (see commit 2048e17ca9df
>>>>>>> "drivers/pl011: Don't configure baudrate") because it was buggy and=
 this
>>>>>>> code is not simple.
>>>>>>>=20
>>>>>>> So it makes no sense to configure the baud rate when using early pr=
intk
>>>>>>> but not the runtime driver.
>>>>>> Ok, so we will get rid of EARLY_UART_PL011_BAUD_RATE config and sett=
ing the bd
>>>>>> in the early uart code. Now, what about setting "8n1"? The runtime d=
river sets them
>>>>>> as well as the early code. It can also be set to a different value f=
rom the firmware
>>>>>> (unlikely but it can happen I think). In any case, if we decide to d=
o what the runtime driver
>>>>>> does, I reckon setting LCR_H should be kept in early code.
>>>>>=20
>>>>> Good question. I think, you would end up with the same issue I mentio=
ned
>>>>> above if the firmware and Xen have different line control registers
>>>>> (tools like minicom/screen would ask for it).
>>>>>=20
>>>>> So I am on the fence here. In one way, it seems pointless keep it. Bu=
t
>>>>> on the other hand, Xen has always set it. So I have no data to prove
>>>>> this will be fine everywhere.
>>>> If we are relying on the firmware[1] to configure the baud rate, it is=
 not very wise
>>>> not to rely on it to configure the LCR. Looking at the other serial dr=
ivers in Xen,
>>>> we have a real mismatch in what is being configured. Some of the drive=
rs (omap, imx),
>>>> apart from setting 8n1 also set the baud rate explicitly to 115200 and=
 almost all of them
>>>> do set 8n1. In that case we will not benefit too much from fixing just=
 pl011.
>>> It is not great that Xen hardcode the baud rate (I can't remember
>>> whether there was a reason), but I don't think the consistency is
>>> necessary here (see more below).
>>>=20
>>>>=20
>>>> On the other hand, Xen follows the zImage/Image protocols for ARM [2] =
which do not
>>>> state that serial port initializing is something mandatory. This could=
 indicate that
>>>> the firmware does not really need to configure the serial.
>>>=20
>>> The firmware doesn't need to configure the serial and yes in theory Xen
>>> should configure the baud rate and parity based on the firmware table.
>>>=20
>>> However, this is a trade off between complexity and benefits. The patch
>>> I mentioned earlier has been removed nearly 6 years ago and I haven't
>>> seen anyone reporting any issues.
>>>=20
>>> Hence why I think for the PL011 it is not worth looking [3] at the baud
>>> rate and instead removing it completely in the early PL011 code as well=
.
>>>=20
>>> That said, if you feel strongly adding support for baud rate then I wil=
l
>>> be happy to review the patch.
>> I'm not in favor of this approach either. That said, I will prepare patc=
hes to remove
>> CONFIG_EARLY_UART_PL011_BAUD_RATE and its usage in early printk code as =
we agreed earlier.
>> As for the LCR setting, I will keep it in early printk code to maintain =
the same behavior as
>> runtime driver who sets them.
>>>=20
>>>>=20
>>>> [1] It is not stated anywhere in our docs.
>>>=20
>>> Our docs are not perfect. Patches are welcomed for improvement.
>>> Although, I think the statement should only be for driver where we don'=
t
>>> set the baud rate. For the others, we should leave it as is unless you
>>> can prove this is not necessary (we don't want to break existing setup)=
.
>>>=20
>>>>=20
>>>> [2] BTW: our docs/misc/arm/booting contains invalid links to the kerne=
l docs. I guess
>>>> this wants to be fixed.
>>>=20
>>> Patches are welcomed.
>>>=20
>>> [3] I do have a large list of more critical bugs that I will be happy t=
o
>>> share if you are looking for improving Xen.
>> That is cool and such list would be great for everyone having some spare=
 time (+ newcomers).
>> Taking the opportunity of having a GitLab CI epics, I think it is worth =
adding such work items here:
>> https://gitlab.com/groups/xen-project/-/epics?state=3Dopened&page=3D1&so=
rt=3Dstart_date_desc
>=20
> I already have a Trello board I created a few years ago when I left Arm [=
1] with 30+ issues. I have another 30+ in my private board.
>=20
> I can try to clean-up the one I have in my private board. But I will need=
 some help for transfer everything to gitlab.

Do not hesitate to ping me if you want some help on that :-)

Cheers
Bertrand

>=20
> Cheers,
>=20
> [1] https://trello.com/invite/b/L54vXoqM/ATTI99c86a2718dec17b3b08f0de35fb=
3b5bC8729E45/xen
>=20
> --=20
> Julien Grall


