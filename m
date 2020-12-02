Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F682CBC23
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 12:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42660.76759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkQlX-0002jd-Vx; Wed, 02 Dec 2020 11:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42660.76759; Wed, 02 Dec 2020 11:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkQlX-0002jE-S2; Wed, 02 Dec 2020 11:57:47 +0000
Received: by outflank-mailman (input) for mailman id 42660;
 Wed, 02 Dec 2020 11:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19jX=FG=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kkQlW-0002j9-IX
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 11:57:46 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e89901b7-d9ee-4831-9a8d-6a21ada420d9;
 Wed, 02 Dec 2020 11:57:45 +0000 (UTC)
Received: from AS8PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:20b:311::35)
 by AM6PR08MB4502.eurprd08.prod.outlook.com (2603:10a6:20b:b9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 2 Dec
 2020 11:57:42 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::5c) by AS8PR05CA0030.outlook.office365.com
 (2603:10a6:20b:311::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18 via Frontend
 Transport; Wed, 2 Dec 2020 11:57:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 11:57:41 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71");
 Wed, 02 Dec 2020 11:57:41 +0000
Received: from 8d3fbc22d040.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54AFD028-4889-4152-9906-0E0342715DD8.1; 
 Wed, 02 Dec 2020 11:57:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8d3fbc22d040.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Dec 2020 11:57:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2696.eurprd08.prod.outlook.com (2603:10a6:6:25::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Wed, 2 Dec
 2020 11:57:22 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 11:57:22 +0000
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
X-Inumbo-ID: e89901b7-d9ee-4831-9a8d-6a21ada420d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQbCXEmZIUtHqzG4a5vV0+9xRRlpqSIBpRofn89D9ww=;
 b=5d1AyhcY9qRQnkwRg5QuE9ZsHSX1KfUgu0OnUVPFgBIFEAjdHQT8tO2z1o+HNN9d3ci0gycIaXTx/GjZjCT0s50EJvss2Ag4Z5FJAr7NfnQ3p4zi9Re1K0b1NM2XF1F1sbHCsDtdgp5Xl0m3y7Giapjkw4l3qibEWG2JtuRHHj8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bfbea0626e59e7cc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xj36y0URqOb1kZMbcPrsmhNm26Xvd9UpgxqK7hKYIWlOYmDnk+OTx3vwvbImBz9s0lbmasgqQo+eMVq0bpHbp+S8W7spia+sslpjOTaY/hNztMJusUTKkjUsYaOYbit5s6MI3B2l3iuGxRoLN5DeogvVKyUvcich5v04jJ4L1StARQxYby91FRqPCTG2QGamBCXUUjcHyH7fPLIzj01HsuAIFLWyX7mmhZLy7g1p1iCzSNe8R4dhCQxQrywwC+jr+XZKXh5k0HlvvsH4n8EXnwgC9Ztk/0I+Lu/t+67KoSTbFwduu21/KJ7B+THuMPx+/meQmFF72Wxosrk8/OSYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQbCXEmZIUtHqzG4a5vV0+9xRRlpqSIBpRofn89D9ww=;
 b=kd3Dig5TZOkQn1m+qmZMYpQ4NFD0ai5kB81Q7evrsuK//vfV3rQuWcHquxe/NLJ/xdZohRuW2Q3lZ29DhGNDDKGo1WtohiQsw84oUCVE7BGWZt7eRcP1/9v8LOzHyCpdZxo5tqzTB9g49idhOp516aplozZFE4GhYS5x3ULOKkLDz1mtvWS8NOVgjUjSTlhez3YY3l2JWrECVFRu9Kddluf1+YK9ujBQMiOpK3EicQtSbxP3mqBN1XhO2BlZrqL9W/gr+1VYsnEenPIP11bbq2V6Ajd4iiHwHiIBr1V+t5xu4IivcUlOfu+prYYAL4S9+BLqyvno8b8GSTt2XPiUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQbCXEmZIUtHqzG4a5vV0+9xRRlpqSIBpRofn89D9ww=;
 b=5d1AyhcY9qRQnkwRg5QuE9ZsHSX1KfUgu0OnUVPFgBIFEAjdHQT8tO2z1o+HNN9d3ci0gycIaXTx/GjZjCT0s50EJvss2Ag4Z5FJAr7NfnQ3p4zi9Re1K0b1NM2XF1F1sbHCsDtdgp5Xl0m3y7Giapjkw4l3qibEWG2JtuRHHj8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Topic: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Index:
 AQHWxyRuchSNSGGKDEyJCEQqqd6Vw6nhIUWAgAD/ugCAAAW5gIAAJWmAgAAq44CAATKvAIAADJiA
Date: Wed, 2 Dec 2020 11:57:22 +0000
Message-ID: <2F7BDAAC-4253-4D92-A995-12AA1361AE35@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com>
 <87lfei7fj5.fsf@epam.com> <AB32AAFF-DD1D-4B13-ABC0-06F460E95E1C@arm.com>
 <87sg8p687j.fsf@epam.com> <87243486-2A58-4497-B566-5FDE4158D18E@arm.com>
 <87h7p55uwj.fsf@epam.com> <80D814EA-B0FC-4975-BB08-4D7DAE8C8B56@arm.com>
In-Reply-To: <80D814EA-B0FC-4975-BB08-4D7DAE8C8B56@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0bec37d8-e708-4bf6-b7d6-08d896b97930
x-ms-traffictypediagnostic: DB6PR08MB2696:|AM6PR08MB4502:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB45024D0924CB2E2F11CF616C9DF30@AM6PR08MB4502.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 upMZMQEEDzGTDaOl99+N3JSbeQERdq2zYrtHA+0mwBSJBi/iEUlreXGGJhgAkt8Al6jia7bXnOaAZkafHL1GiRoT2Ka3ntc7bgtP0+gcUJ008tlPKe9u/Sn1VzDPZ38oXCJwfFr0e7kABi16/pDU/vByeFCYLRyqpES0rFuxA89cTUd3knpC4nGC2v73cfNHQKPi29Jr3zoRlAX9fCEeJ4FUCFFaxNSTrskP8m9KxaXcyEPcSqLb62KiYmgd6dQ/5Vmms3FXv0QF9dvUxfdPdLTuKS8sxQ9DdEi/DcZjiKQS2q/kTQLdvcGFUNxYRYkP8AIo+I0RBDTRHQ+UlMfXugKyD8jymBfFNtGKcW0tpVvLHjDawR9raBJyaQ6D+pEB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(186003)(6506007)(86362001)(33656002)(8676002)(26005)(83380400001)(6486002)(4326008)(8936002)(6512007)(5660300002)(53546011)(71200400001)(54906003)(76116006)(36756003)(6916009)(91956017)(66556008)(66446008)(2616005)(64756008)(2906002)(66946007)(316002)(66476007)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?NXBNdGdXZEJ3MkI1WjFQMkU1K0FwbUd5N1BiQVkrQUVwVTF3ZVZnR0Z2VWZ1?=
 =?utf-8?B?a1FueGcxQ1Q1YUZIS1ZpbE1nTHUwT3dDekFjTENWYllDZ0xhV3ZuYUlxN2hK?=
 =?utf-8?B?ZFZMVEJhMnFyUnBDUWVXdExlQ1NFSE1iL0pzcmZBWXBTZHBKN1lCanpGcjVD?=
 =?utf-8?B?YzRZdFNwOExrL1BVaW9zNkdzcnY3dkFGZFlnZUMyVDZjcDBkOTFZK2hIeHhN?=
 =?utf-8?B?OWtpUGJ1SktwdCt4OUhXbFZ3cjA4QUpqUzVOOE4rUUNtWDVJNmVHRTF2VVV6?=
 =?utf-8?B?aEg5N1E2TjhCU0tvUk82V05NL0UrNzErQ2lXM1pWL3hHME9jMUZvU2w2dk5r?=
 =?utf-8?B?UmIveE80MWJqWFlLcThEaC9TTlFZRW1VY01qdWFtaWwzekJDU0g1emk4Qk15?=
 =?utf-8?B?dnIrekJZQ2xUYTJpVXlHK0pycS9HUGdPdHpEbng1THd3Z2tVd1lJZkFYTy9Z?=
 =?utf-8?B?S05FTjAyNjhKN2Y2ZDFnWVRjaktmcWQ3U2R0WWQrMUs2MmF4VlU5R1VTUVkz?=
 =?utf-8?B?Z1Y4ZGRzd043ZzlwOHN5Z2ppYXpIVGpNWGM1NTlDT2FGSnJ5cHF4YmFGOXJB?=
 =?utf-8?B?dnlvckNKYW1lZ3R5dzBpQVdzWGtsSU5QYVZCMEo4SkRQaUUrVTdXbXFOZjVH?=
 =?utf-8?B?QlFsS2x2cHNneG1icXk2ZlI0UERUekN1MERsY3dwcnFidkI4SmZjV2VVVGxn?=
 =?utf-8?B?WCs1VzNyQUNvT3VlMWxKV20yTnFmK0ZpcjNhOXpJQkpTbXJkMjV3NnpMbjha?=
 =?utf-8?B?eHY2N01PQk5FK3NZNWdrT01VeHhsNVhSaUY3TXlrWEF4N09Rdmh2dmk2bWVN?=
 =?utf-8?B?OXFld0dRS1FjbUdleXZUNkFoYXBQV0pYWS82aHJoZXlsY293YWJWUzlDYjhI?=
 =?utf-8?B?eWlqb2I5UmdQK1hOZldDNHJKRUZiWXJJSW5zYlRBS21FNVAwRXVYamIyRFRS?=
 =?utf-8?B?ZTc2ZUlSMFpVdTJ3K0QyRTNWbHVWSVdYZC9mRFFkTS9yUlIrTHFuQ1g4SmZH?=
 =?utf-8?B?TFcvTE45Q1BIb1NKUTB3U3hGdDY2azg5WkNyaEpGVEhISnlpQkdNZUlUU3Jl?=
 =?utf-8?B?dllOT2FxOVVxeTRlbTRBaFE2MFE0U0I5clFRanBkUWN5YTdUcXlQVUlZTDY0?=
 =?utf-8?B?Q0gxaXZSVWw0WmxIb0dRRzJmZVk2SW9EcklJQ3FRSmxFSUgrT2FuNmVEcVRz?=
 =?utf-8?B?cTBEbWprdGY5TFgwajFVTUxaWmY0SmdEYkV6VDZndkxMb0xVWU9OREhkcnAw?=
 =?utf-8?B?dG5iK2craWw5U0RMZWJueFhXVnJXbzdXMTVsTEw2dlQxbGJOdU9aak1ETThk?=
 =?utf-8?Q?uotGEYZDt2XNhAaIwImi+7rMQWrUH7dbtN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B72DC16E1D3B7449AE6DCB04C8E7CC3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2696
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c54f69ab-b558-4306-56d0-08d896b96d97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PGzGYxtJoXe5ct77wz6LH/kCUtsz7FM/deX9xE+Ycz1v9MVhQZFlbKx8bRQICL19kjhRMNF7j0/of4Uu/YrUBodfcjutRCgxTEsB5M84slpWHng0anBoNlzOvJP38tm6WEtehqVl7pPkHasymRH8Pji0K+AB5TPR/53X7GtJAmSdi3Vfg5AAs8xVS3ivTo2oo9WuJhmGWJ2zfvnRpqhv30mgKS7cXl4kaRiurKMNyU/wsAqOrMqxQLDD5LQwQorEaenO0JxqRaIFLXTy/6wfomgDDwOgorJWARMeCinimX+NDTYkC6IlBvxtX9k8YJBqu+3Oj6kfGxUe6FEaHfusbkKBiG9tOdKRN7BfNZYiuOkz37gRlhtt7uz7CF610wITNC1I9cif56oVT050B3+Q1Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(2906002)(356005)(26005)(81166007)(47076004)(53546011)(6506007)(336012)(2616005)(82740400003)(86362001)(186003)(6486002)(70586007)(33656002)(316002)(83380400001)(36756003)(4326008)(82310400003)(8936002)(54906003)(6862004)(8676002)(5660300002)(70206006)(478600001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 11:57:41.7558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bec37d8-e708-4bf6-b7d6-08d896b97930
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4502

SGksDQoNCj4gT24gMiBEZWMgMjAyMCwgYXQgMTE6MTIsIEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRy
YW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBISSBWb2xvZHlteXIsDQo+IA0KPj4g
T24gMSBEZWMgMjAyMCwgYXQgMTY6NTQsIFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFi
Y2h1a0BlcGFtLmNvbT4gd3JvdGU6DQo+PiANCj4+IA0KPj4gSGksDQo+PiANCj4+IEJlcnRyYW5k
IE1hcnF1aXMgd3JpdGVzOg0KPj4gDQo+Pj4gSGkgVm9sb2R5bXlyLA0KPj4+IA0KPj4+PiBPbiAx
IERlYyAyMDIwLCBhdCAxMjowNywgVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVr
QGVwYW0uY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiBIaSwNCj4+Pj4gDQo+Pj4+IEJl
cnRyYW5kIE1hcnF1aXMgd3JpdGVzOg0KPj4+PiANCj4+Pj4+IEhpLA0KPj4+Pj4gDQo+Pj4+Pj4g
T24gMzAgTm92IDIwMjAsIGF0IDIwOjMxLCBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0Jh
YmNodWtAZXBhbS5jb20+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IEJlcnRyYW5k
IE1hcnF1aXMgd3JpdGVzOg0KPj4+Pj4+IA0KPj4+Pj4+PiBBZGQgc3VwcG9ydCBmb3IgZW11bGF0
aW9uIG9mIGNwMTUgYmFzZWQgSUQgcmVnaXN0ZXJzIChvbiBhcm0zMiBvciB3aGVuDQo+Pj4+Pj4+
IHJ1bm5pbmcgYSAzMmJpdCBndWVzdCBvbiBhcm02NCkuDQo+Pj4+Pj4+IFRoZSBoYW5kbGVycyBh
cmUgcmV0dXJuaW5nIHRoZSB2YWx1ZXMgc3RvcmVkIGluIHRoZSBndWVzdF9jcHVpbmZvDQo+Pj4+
Pj4+IHN0cnVjdHVyZS4NCj4+Pj4+Pj4gSW4gdGhlIGN1cnJlbnQgc3RhdHVzIHRoZSBNVkZSIHJl
Z2lzdGVycyBhcmUgbm8gc3VwcG9ydGVkLg0KPj4+Pj4+IA0KPj4+Pj4+IEl0IGlzIHVuY2xlYXIg
d2hhdCB3aWxsIGhhcHBlbiB3aXRoIHJlZ2lzdGVycyB0aGF0IGFyZSBub3QgY292ZXJlZCBieQ0K
Pj4+Pj4+IGd1ZXN0X2NwdWluZm8gc3RydWN0dXJlLiBBY2NvcmRpbmcgdG8gQVJNIEFSTSwgaXQg
aXMgaW1wbGVtZW50YXRpb24NCj4+Pj4+PiBkZWZpbmVkIGlmIHN1Y2ggYWNjZXNzZXMgd2lsbCBi
ZSB0cmFwcGVkLiBPbiBvdGhlciBoYW5kLCB0aGVyZSBhcmUgbWFueQ0KPj4+Pj4+IHJlZ2lzdGVy
cyB3aGljaCBhcmUgUkFaLiBTbywgZ29vZCBiZWhhdmluZyBndWVzdCBjYW4gdHJ5IHRvIHJlYWQg
b25lIG9mDQo+Pj4+Pj4gdGhhdCByZWdpc3RlcnMgYW5kIGl0IHdpbGwgZ2V0IHVuZGVmaW5lZCBp
bnN0cnVjdGlvbiBleGNlcHRpb24sIGluc3RlYWQNCj4+Pj4+PiBvZiBqdXN0IHJlYWRpbmcgYWxs
IHplcm9lcy4NCj4+Pj4+IA0KPj4+Pj4gVGhpcyBpcyB0cnVlIGluIHRoZSBzdGF0dXMgb2YgdGhp
cyBwYXRjaCBidXQgdGhpcyBpcyBzb2x2ZWQgYnkgdGhlIG5leHQgcGF0Y2gNCj4+Pj4+IHdoaWNo
IGlzIGFkZGluZyBwcm9wZXIgaGFuZGxpbmcgb2YgdGhvc2UgcmVnaXN0ZXJzIChhZGQgQ1AxMCBl
eGNlcHRpb24NCj4+Pj4+IHN1cHBvcnQpLCBhdCBsZWFzdCBmb3IgTVZGUiBvbmVzLg0KPj4+Pj4g
DQo+Pj4+PiBGcm9tIEFSTSBBUk0gcG9pbnQgb2YgdmlldywgSSBkaWQgaGFuZGxlIGFsbCByZWdp
c3RlcnMgbGlzdGVkIEkgdGhpbmsuDQo+Pj4+PiBJZiB5b3UgdGhpbmsgc29tZSBhcmUgbWlzc2lu
ZyBwbGVhc2UgcG9pbnQgbWUgdG8gdGhlbSBhcyBPIGRvIG5vdA0KPj4+Pj4gY29tcGxldGVseSB1
bmRlcnN0YW5kIHdoYXQgYXJlIHRoZSDigJxyZWdpc3RlcnMgbm90IGNvdmVyZWTigJ0gdW5sZXNz
DQo+Pj4+PiB5b3UgbWVhbiB0aGUgTVZGUiBvbmVzLg0KPj4+PiANCj4+Pj4gV2VsbCwgSSBtYXkg
YmUgd3JvbmcgZm9yIGFhcmNoMzIgY2FzZSwgYnV0IGZvciBhYXJjaDY0LCB0aGVyZSBhcmUgbnVt
YmVyDQo+Pj4+IG9mIHJlc2VydmVkIHJlZ2lzdGVycyBpbiBJRHMgcmFuZ2UuIFRob3NlIHJlZ2lz
dGVycyBzaG91bGQgcmVhZCBhcw0KPj4+PiB6ZXJvLiBZb3UgY2FuIGZpbmQgdGhlbSBpbiB0aGUg
c2VjdGlvbiAiQzUuMS42IG9wMD09MGIxMSwgTW92ZXMgdG8gYW5kDQo+Pj4+IGZyb20gbm9uLWRl
YnVnIFN5c3RlbSByZWdpc3RlcnMgYW5kIFNwZWNpYWwtcHVycG9zZSByZWdpc3RlcnMiIG9mIEFS
TQ0KPj4+PiBEREkgMDQ4N0IuYS4gQ2hlY2sgb3V0ICJUYWJsZSBDNS02IFN5c3RlbSBpbnN0cnVj
dGlvbiBlbmNvZGluZ3MgZm9yDQo+Pj4+IG5vbi1EZWJ1ZyBTeXN0ZW0gcmVnaXN0ZXIgYWNjZXNz
ZXMiLg0KPj4+IA0KPj4+IFRoZSBwb2ludCBvZiB0aGUgc2VyaWUgaXMgdG8gaGFuZGxlIGFsbCBy
ZWdpc3RlcnMgdHJhcHBlZCBkdWUgdG8gVElEMyBiaXQgaW4gSENSX0VMMi4NCj4+PiANCj4+PiBB
bmQgaSB0aGluayBJIGhhbmRsZWQgYWxsIG9mIHRoZW0gYnV0IEkgbWlnaHQgYmUgd3JvbmcuDQo+
Pj4gDQo+Pj4gSGFuZGxpbmcgYWxsIHJlZ2lzdGVycyBmb3Igb3AwPT0wYjExIHdpbGwgY292ZXIg
YSBsb3QgbW9yZSB0aGluZ3MuDQo+Pj4gVGhpcyBjYW4gYmUgZG9uZSBvZiBjb3Vyc2UgYnV0IHRo
aXMgd2FzIG5vdCB0aGUgcG9pbnQgb2YgdGhpcyBzZXJpZS4NCj4+PiANCj4+PiBUaGUgbGlzdGlu
ZyBpbiBIQ1JfRUwyIGRvY3VtZW50YXRpb24gaXMgcHJldHR5IGNvbXBsZXRlIGFuZCBpZiBJIG1p
c3MgYW55IHJlZ2lzdGVyDQo+Pj4gdGhlcmUgcGxlYXNlIHRlbGwgbWUgYnV0IEkgZG8gbm8gdW5k
ZXJzdGFuZCBmcm9tIHRoZSBkb2N1bWVudGF0aW9uIHRoYXQgYWxsIHJlZ2lzdGVycw0KPj4+IHdp
dGggb3AwIDMgYXJlIHRyYXBwZWQgYnkgVElEMy4NCj4+IA0KPj4gTXkgY29uY2VybiBpcyB0aGF0
IHRoZSBzYW1lIGNvZGUgbWF5IG9ic2VydmUgZGlmZmVyZW50IGVmZmVjdHMgd2hlbg0KPj4gcnVu
bmluZyBpbiBiYXJlbWV0YWwgbW9kZSBhbmQgYXMgVk0uDQo+PiANCj4+IEZvciBleGFtcGxlLCB3
ZSBhcmUgdHJ5aW5nIHRvIHJ1biBhIG5ld2VyIHZlcnNpb24gb2YgYSBrZXJuZWwsIHRoYXQNCj4+
IHN1cHBvcnRzIHNvbWUgaHlwb3RoZXRpY2FsIEFSTXY4LjkuIEFuZCBpdCB0cmllcyB0byByZWFk
IGEgbmV3IElEDQo+PiByZWdpc3RlciB3aGljaCBpcyBhYnNlbnQgaW4gQVJNdjguMi4gVGhlcmUg
YXJlIHBvc3NpYmxlIGNhc2VzOg0KPj4gDQo+PiAwLiBJdCBydW5zIGFzIGEgYmFyZW1ldGFsIGNv
ZGUgb24gYSBjb21wYXRpYmxlIGFyY2hpdGVjdHVyZS4gU28gaXQganVzdA0KPj4gYWNjZXNzZXMg
dGhpcyByZWdpc3RlciBhbmQgYWxsIGlzIGZpbmUuDQo+PiANCj4+IDEuIEl0IHJ1bnMgYXMgYmFy
ZW1ldGFsIGNvZGUgb24gb2xkZXIgQVJNOCBhcmNoaXRlY3R1cmUuIEN1cnJlbnQNCj4+IHJlZmVy
ZW5jZSBtYW51YWwgc3RhdGVzIHRoYXQgdGhvc2UgcmVnaXN0ZXJzIHNob3VsZCByZWFkIGFzIHpl
cm8sIHNvDQo+PiBhbGwgaXMgZmluZSwgYXMgd2VsbC4NCj4+IA0KPj4gMi4gSXQgcnVucyBhcyBW
TSBvbiBhbiBvbGRlciBhcmNoaXRlY3R1cmUuIEl0IGlzIElNUExFTUVOVEFUSU9OIERFRklORUQN
Cj4+IGlmIEhDUi5JRDMgd2lsbCBjYXVzZSB0cmFwcyB3aGVuIGFjY2VzcyB0byB1bmFzc2lnbmVk
IHJlZ2lzdGVyczoNCj4+IA0KPj4gMmEuIFBsYXRmb3JtIGRvZXMgbm90IGNhdXNlIHRyYXBzIGFu
ZCBzb2Z0d2FyZSByZWFkcyB6ZXJvcyBkaXJlY3RseSBmcm9tDQo+PiByZWFsIHJlZ2lzdGVycy4g
VGhpcyBpcyBhIGdvb2Qgb3V0Y29tZS4NCj4+IA0KPj4gMmIuIFBsYXRmb3JtIGNhdXNlcyB0cmFw
LCBhbmQgeW91ciBjb2RlIGluamVjdHMgdGhlIHVuZGVmaW5lZA0KPj4gaW5zdHJ1Y3Rpb24gZXhj
ZXB0aW9uLiBUaGlzIGlzIGEgY2FzZSB0aGF0IGJvdGhlcnMgbWUuIFdlbGwgd3JpdHRlbiBjb2Rl
DQo+PiB0aGF0IGlzIHRyaWVzIHRvIGJlIGNvbXBhdGlibGUgd2l0aCBkaWZmZXJlbnQgdmVyc2lv
bnMgb2YgYXJjaGl0ZWN0dXJlDQo+PiB3aWxsIGZhaWwgdGhlcmUuDQo+PiANCj4+IDMuIEl0IHJ1
bnMgYXMgVk0gb24gYSBuZXZlciBhcmNoaXRlY3R1cmUuIEkgY2FuIG9ubHkgc3BlY3VsYXRlIHRo
ZXJlLA0KPj4gYnV0IEkgdGhpbmssIHRoYXQgbGlzdCBvZiByZWdpc3RlcnMgdHJhcHBlZCBieSBI
Q1IuSUQzIHdpbGwgYmUgZXh0ZW5kZWQNCj4+IHdoZW4gbmV3IGZlYXR1cmVzIGFyZSBhZGRlZC4g
QXQgbGVhc3QsIHRoaXMgZG9lcyBub3QgY29udHJhZGljdCB3aXRoIHRoZQ0KPj4gY3VycmVudCBJ
TVBMRU1FTlRBVElPTiBERUZJTkVEIGNvbnN0cmFpbnQuIEluIHRoaXMgY2FzZSwgaHlwZXJ2aXNv
ciB3aWxsDQo+PiBpbmplY3QgZXhjZXB0aW9uIHdoZW4gZ3Vlc3QgdHJpZXMgdG8gYWNjZXNzIGEg
dmFsaWQgcmVnaXN0ZXIuDQo+PiANCj4+IA0KPj4gU28sIGluIG15IG9waW5pb24gYW5kIHRvIGJl
IGNvbXBhdGlibGUgd2l0aCB0aGUgcmVmZXJlbmNlIG1hbnVhbCwgd2UNCj4+IHNob3VsZCBhbGxv
dyBndWVzdHMgdG8gcmVhZCAiUmVzZXJ2ZWQsIFJBWiIgcmVnaXN0ZXJzLg0KPiANCj4gVGhhbmtz
IGZvciB0aGUgdmVyeSBkZXRhaWxlZCBleHBsYW5hdGlvbiwgSSBrbm93IGJldHRlciB1bmRlcnN0
YW5kIHdoYXQgeW91DQo+IG1lYW4gaGVyZS4NCj4gDQo+IEkgd2lsbCB0cnkgdG8gY2hlY2sgaWYg
d2UgY291bGQgcmV0dXJuIFJBWiBmb3Ig4oCcb3RoZXLigJ0gb3AwPTMgcmVnaXN0ZXJzIGFuZCB3
aGF0DQo+IHNob3VsZCBiZSBkb25lIG9uIGNwMTUgcmVnaXN0ZXJzIHRvIGhhdmUgc29tZXRoaW5n
IGVxdWl2YWxlbnQuDQo+IA0KDQpJbiBmYWN0IEkgbmVlZCB0byBhZGQgaGFuZGxpbmcgZm9yIG90
aGVyIHJlZ2lzdGVycyBtZW50aW9ubmVkIGJ5IHRoZSBUSUQzDQpkZXNjcmlwdGlvbiBpbiB0aGUg
YXJtdjggYXJjaGl0ZWN0dXJlIG1hbnVhbDoNCiJUaGlzIGZpZWxkIHRyYXBzIGFsbCBNUlMgYWNj
ZXNzZXMgdG8gcmVnaXN0ZXJzIGluIHRoZSBmb2xsb3dpbmcgcmFuZ2UgdGhhdCBhcmUgbm90DQph
bHJlYWR5IG1lbnRpb25lZCBpbiB0aGlzIGZpZWxkIGRlc2NyaXB0aW9uOiBPcDAgPT0gMywgb3Ax
ID09IDAsIENSbiA9PSBjMCwNCiBDUm0gPT0ge2MxLWM3fSwgb3AyID09IHswLTd9LuKAnQ0KIlRo
aXMgZmllbGQgdHJhcHMgYWxsIE1SQyBhY2Nlc3NlcyB0byBlbmNvZGluZ3MgaW4gdGhlIGZvbGxv
d2luZyByYW5nZSB0aGF0IGFyZSBub3QNCmFscmVhZHkgbWVudGlvbmVkIGluIHRoaXMgZmllbGQg
ZGVzY3JpcHRpb246IGNvcHJvYyA9PSBwMTUsIG9wYzEgPT0gMCwgQ1JuID09IGMwLA0KQ1JtID09
IHtjMi1jN30sIG9wYzIgPT0gezAtN30u4oCdDQoNCkkgd2lsbCBjaGVjayBob3cgaSBjYW4gZG8g
dGhhdC4NCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3Lg0KDQpSZWdhcmRzDQpCZXJ0cmFu
ZA0KDQo+IFJlZ2FyZHMNCj4gQmVydHJhbmQNCj4gDQo+PiANCj4+IA0KPj4gDQo+Pj4gUmVnYXJk
cw0KPj4+IEJlcnRyYW5kDQo+Pj4gDQo+Pj4gDQo+Pj4+IA0KPj4+PiANCj4+Pj4+PiANCj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0u
Y29tPg0KPj4+Pj4+PiAtLS0NCj4+Pj4+Pj4gQ2hhbmdlcyBpbiBWMjogcmViYXNlDQo+Pj4+Pj4+
IC0tLQ0KPj4+Pj4+PiB4ZW4vYXJjaC9hcm0vdmNwcmVnLmMgfCAzNSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9u
cygrKQ0KPj4+Pj4+PiANCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Y3ByZWcu
YyBiL3hlbi9hcmNoL2FybS92Y3ByZWcuYw0KPj4+Pj4+PiBpbmRleCBjZGM5MWNkZjViLi5kMGM2
NDA2ZjM0IDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdmNwcmVnLmMNCj4+Pj4+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL3ZjcHJlZy5jDQo+Pj4+Pj4+IEBAIC0xNTUsNiArMTU1LDE0
IEBAIFRWTV9SRUczMihDT05URVhUSURSLCBDT05URVhUSURSX0VMMSkNCj4+Pj4+Pj4gICAgICBi
cmVhazsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcDQo+Pj4+Pj4+ICB9DQo+Pj4+Pj4+IA0KPj4+Pj4+PiArLyogTWFjcm8gdG8gZ2VuZXJhdGUg
ZWFzaWx5IGNhc2UgZm9yIElEIGNvLXByb2Nlc3NvciBlbXVsYXRpb24gKi8NCj4+Pj4+Pj4gKyNk
ZWZpbmUgR0VORVJBVEVfVElEM19JTkZPKHJlZyxmaWVsZCxvZmZzZXQpICAgICAgICAgICAgICAg
ICAgICAgICAgXA0KPj4+Pj4+PiArICAgIGNhc2UgSFNSX0NQUkVHMzIocmVnKTogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+Pj4+ICsgICAgeyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwN
Cj4+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIGhhbmRsZV9yb19yZWFkX3ZhbChyZWdzLCByZWdpZHgs
IGNwMzIucmVhZCwgaHNyLCAgICAgXA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAxLCBndWVzdF9jcHVpbmZvLmZpZWxkLmJpdHNbb2Zmc2V0XSk7ICAgICBcDQo+Pj4+Pj4+ICsg
ICAgfQ0KPj4+Pj4+PiArDQo+Pj4+Pj4+IHZvaWQgZG9fY3AxNV8zMihzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncywgY29uc3QgdW5pb24gaHNyIGhzcikNCj4+Pj4+Pj4gew0KPj4+Pj4+PiAgY29u
c3Qgc3RydWN0IGhzcl9jcDMyIGNwMzIgPSBoc3IuY3AzMjsNCj4+Pj4+Pj4gQEAgLTI4Niw2ICsy
OTQsMzMgQEAgdm9pZCBkb19jcDE1XzMyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBjb25z
dCB1bmlvbiBoc3IgaHNyKQ0KPj4+Pj4+PiAgICAgICAqLw0KPj4+Pj4+PiAgICAgIHJldHVybiBo
YW5kbGVfcmF6X3dpKHJlZ3MsIHJlZ2lkeCwgY3AzMi5yZWFkLCBoc3IsIDEpOw0KPj4+Pj4+PiAN
Cj4+Pj4+Pj4gKyAgICAvKg0KPj4+Pj4+PiArICAgICAqIEhDUl9FTDIuVElEMw0KPj4+Pj4+PiAr
ICAgICAqDQo+Pj4+Pj4+ICsgICAgICogVGhpcyBpcyB0cmFwcGluZyBtb3N0IElkZW50aWZpY2F0
aW9uIHJlZ2lzdGVycyB1c2VkIGJ5IGEgZ3Vlc3QNCj4+Pj4+Pj4gKyAgICAgKiB0byBpZGVudGlm
eSB0aGUgcHJvY2Vzc29yIGZlYXR1cmVzDQo+Pj4+Pj4+ICsgICAgICovDQo+Pj4+Pj4+ICsgICAg
R0VORVJBVEVfVElEM19JTkZPKElEX1BGUjAsIHBmcjMyLCAwKQ0KPj4+Pj4+PiArICAgIEdFTkVS
QVRFX1RJRDNfSU5GTyhJRF9QRlIxLCBwZnIzMiwgMSkNCj4+Pj4+Pj4gKyAgICBHRU5FUkFURV9U
SUQzX0lORk8oSURfUEZSMiwgcGZyMzIsIDIpDQo+Pj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19J
TkZPKElEX0RGUjAsIGRiZzMyLCAwKQ0KPj4+Pj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJ
RF9ERlIxLCBkYmczMiwgMSkNCj4+Pj4+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfQUZS
MCwgYXV4MzIsIDApDQo+Pj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX01NRlIwLCBt
bTMyLCAwKQ0KPj4+Pj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZSMSwgbW0zMiwg
MSkNCj4+Pj4+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfTU1GUjIsIG1tMzIsIDIpDQo+
Pj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX01NRlIzLCBtbTMyLCAzKQ0KPj4+Pj4+
PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZSNCwgbW0zMiwgNCkNCj4+Pj4+Pj4gKyAg
ICBHRU5FUkFURV9USUQzX0lORk8oSURfTU1GUjUsIG1tMzIsIDUpDQo+Pj4+Pj4+ICsgICAgR0VO
RVJBVEVfVElEM19JTkZPKElEX0lTQVIwLCBpc2EzMiwgMCkNCj4+Pj4+Pj4gKyAgICBHRU5FUkFU
RV9USUQzX0lORk8oSURfSVNBUjEsIGlzYTMyLCAxKQ0KPj4+Pj4+PiArICAgIEdFTkVSQVRFX1RJ
RDNfSU5GTyhJRF9JU0FSMiwgaXNhMzIsIDIpDQo+Pj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19J
TkZPKElEX0lTQVIzLCBpc2EzMiwgMykNCj4+Pj4+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8o
SURfSVNBUjQsIGlzYTMyLCA0KQ0KPj4+Pj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9J
U0FSNSwgaXNhMzIsIDUpDQo+Pj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVI2
LCBpc2EzMiwgNikNCj4+Pj4+Pj4gKyAgICAvKiBNVkZSIHJlZ2lzdGVycyBhcmUgaW4gY3AxMCBu
byBjcDE1ICovDQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gIC8qDQo+Pj4+Pj4+ICAgKiBIQ1JfRUwyLlRJ
RENQDQo+Pj4+Pj4+ICAgKg0KPj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IC0tIA0KPj4+Pj4+IFZv
bG9keW15ciBCYWJjaHVrIGF0IEVQQU0NCj4+Pj4gDQo+Pj4+IA0KPj4+PiAtLSANCj4+Pj4gVm9s
b2R5bXlyIEJhYmNodWsgYXQgRVBBTQ0KPj4gDQo+PiANCj4+IC0tIA0KPj4gVm9sb2R5bXlyIEJh
YmNodWsgYXQgRVBBTQ0KDQo=

