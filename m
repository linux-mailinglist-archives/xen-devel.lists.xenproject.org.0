Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525AF2D3C8B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 08:56:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48014.84938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmuKD-00081S-1Q; Wed, 09 Dec 2020 07:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48014.84938; Wed, 09 Dec 2020 07:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmuKC-000813-UD; Wed, 09 Dec 2020 07:55:48 +0000
Received: by outflank-mailman (input) for mailman id 48014;
 Wed, 09 Dec 2020 07:55:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kmuKA-00080y-Og
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 07:55:46 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87dd7c2b-47ec-4966-af42-5f4af7ca806a;
 Wed, 09 Dec 2020 07:55:45 +0000 (UTC)
Received: from DU2PR04CA0136.eurprd04.prod.outlook.com (2603:10a6:10:231::21)
 by DBBPR08MB4474.eurprd08.prod.outlook.com (2603:10a6:10:c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Wed, 9 Dec
 2020 07:55:41 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::ac) by DU2PR04CA0136.outlook.office365.com
 (2603:10a6:10:231::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 9 Dec 2020 07:55:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 07:55:41 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Wed, 09 Dec 2020 07:55:41 +0000
Received: from a3413eff1521.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0C68268B-C683-4C00-B1EB-F337538C4260.1; 
 Wed, 09 Dec 2020 07:55:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3413eff1521.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 07:55:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2295.eurprd08.prod.outlook.com (2603:10a6:4:84::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 07:55:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 07:55:24 +0000
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
X-Inumbo-ID: 87dd7c2b-47ec-4966-af42-5f4af7ca806a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqajidAzes7AiDmYPl58ikzgJpH/RfXnbQTEW6FdPHM=;
 b=a0QyeZVGnOXEazyxeXDOkojnbz1NA70qiCg+m64jjardF1KJFQPTOimNoBTxVgvaX2jswGLPRjnVtmLn+E4XgAduICQuFgc9yKQttnhscbeDZ0VDeERWsgrC+cRQvSXPY82f18e9nb5eP8p/QNDqh0TQmEvPYKRlbkfVWyTPkuo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11d54bafe44e01a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXXuibQh/bkSjE63VFWStJp/jibERVwQ4NQclc5qWveghSXw2qgob89d1OqFTWhfe5TFa67XWAvXfwkhaiu67cOCJWkYpkRKm8M5nf0+27hIrdSCTW75nagVd69ZM/XfCEbdAxnwbNyt4k/EBFE/QnZfjgTzrUEmrMd9qitWj+5mJEyZDd4Y0zja2q2tdL/yStzfjcqyEvUuJIpYuIZvRHQnDv9iFVWo27j493fbRwZxkgnxxSravnN9QqDfn1hW8FtjDTamRoNb2APYHJ6Jh3OyybS8C3irTU1aaY7Q/fI7WAVYcQW3oAPMXfKT+EOI2i/J2fUZEi8vrpCDwrV1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqajidAzes7AiDmYPl58ikzgJpH/RfXnbQTEW6FdPHM=;
 b=B5i4rZODJIAvkrs1JhRisL4R2sIwsZkP4ysN1OH1Hh+RAA1qE5EJJ0RIREIy1a1MxJIbtMqiTUx2Rhl3SVi7h8vBUqp7dWWw3z5epSj/s/WwMztdAJfpg1AZQtNC6NzwiovsIZxqPUC7SC+kXPWAf8jLbPa66iu7fhIVZli/7dtesKEQGS7m8yAXodXDRF9AUfacf41EXC9YlRdUdOydvGR+N/6bvd6zz8SLY6UQPxYHpPg09o1YzWTItjE+79vFIIKt+HAQMsh3ITlVWP6EhuCq5saJie6GHWDTrU/UbZ86pSWNc7C0uG/0mZ0EauBquzniSZ5iuWqySWWBNvXe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqajidAzes7AiDmYPl58ikzgJpH/RfXnbQTEW6FdPHM=;
 b=a0QyeZVGnOXEazyxeXDOkojnbz1NA70qiCg+m64jjardF1KJFQPTOimNoBTxVgvaX2jswGLPRjnVtmLn+E4XgAduICQuFgc9yKQttnhscbeDZ0VDeERWsgrC+cRQvSXPY82f18e9nb5eP8p/QNDqh0TQmEvPYKRlbkfVWyTPkuo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
Thread-Topic: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
Thread-Index:
 AQHWxBX/rtTrR0LJ0EyzSHUauPpHcqnkBpwAgAeVnwCAAFt/gIAAEZUAgAGYywCAAGhiAIAAbqQA
Date: Wed, 9 Dec 2020 07:55:24 +0000
Message-ID: <BE0F99C1-AAA7-4EC7-A800-7CDEA24177DF@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
 <a67bb114-a4a9-651a-338b-123b350ac4b3@xen.org>
 <9C890E87-D438-4232-8647-8EC64FF32C42@arm.com>
 <bb6a710e-4a7a-5db2-fece-b5845e06d092@xen.org>
 <9F9A955B-815C-4771-9EC0-073E9CF3E995@arm.com>
 <156ab0f5-e46d-6b96-7ff1-28ad3a748950@xen.org>
 <alpine.DEB.2.21.2012081711200.20986@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012081711200.20986@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ebf6ce2a-a3f8-4b01-510c-08d89c17d327
x-ms-traffictypediagnostic: DB6PR0802MB2295:|DBBPR08MB4474:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB44743417879E37535B3744119DCC0@DBBPR08MB4474.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KCKwkuDD18SIl56d7sQ9EA7wtDomGt4ua4RLtNdUyuPPt+TLBZYWKo4lauamIBkadj/3/wP57GXQfzRNmQ9lqaByvODLFd3W5DZUTBY6JxMtzX2QElZn7LaVacB4XuAokb0Zqd/FnKr/lcgqn7WExRyZ3xR4924SKM6w4aYlmORQvfF3BinPmD3rbxdiaRCqA1CAFh9dsSSzaseKCwmLl9SmpxvlznFaBf2COpwU/r6/UQYEHyvg+5cCiIgcgcZx6tcQvoxnfZtEF/+STbX/2i6uiISKxGXzwt9T9Z+yPVjM8qV86Pd4TNidD8/AarSvLhADXZVyql27M/lrR2WrCaMVEVUwr8zRA/CW1p1qzex/Fa2StAbXOBmOOz+GNSMq
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(366004)(136003)(83380400001)(66946007)(6512007)(91956017)(36756003)(66476007)(8936002)(6486002)(26005)(86362001)(186003)(64756008)(7416002)(66556008)(6506007)(8676002)(2906002)(478600001)(4326008)(66446008)(76116006)(71200400001)(54906003)(33656002)(5660300002)(2616005)(53546011)(6916009)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?R1h1NE1nb1FMZjYxZks1bzJnaENjazl6bmppclpUd0FHbE5Yd3NUbmtjL0RK?=
 =?utf-8?B?QUxLVXJ0VDkvNWFwL011RnFWR3pxNEd2RmZETzZJbFdzS1Zmc3Z6UEJwTHpJ?=
 =?utf-8?B?WHdrYWNyM251MlBkZnArVUNzUnE1Sm5WdWtRa09mZjlpVGlHK2cwRWJlbjVj?=
 =?utf-8?B?QnZrVkZDOHBGUFhmb0VFYUZub2RHYldZMERFQ3g5TkxmemhRY3ZoMlYvb1E3?=
 =?utf-8?B?MTBEcUM0TS9FRE5OSTRmbXFnRlZhWFVOc0pVMm4wQ2t1TVRoZHRkVHFpaDNp?=
 =?utf-8?B?d0VIUXJuZlJra0poSWFtamUrYlJ1N2RGWGlyUDJmNzF1NnFmaDZjK2pOSlY5?=
 =?utf-8?B?U3VaRVZXcEI3VWFOblBrZW8yVUVZbEJpaTFIdVJXdXpQMjIwWHIxNWNRYnpB?=
 =?utf-8?B?ZVVxR1BYOXMxQlFkbzVLN3RGMFhFOFVYeWlSR0lEMEdwWmNnYlFQOW94M1Nj?=
 =?utf-8?B?MXdDWVkwai9OUzM1RkdCckl5YlU4eWlvMnlZbzVVVFB6cTl5UWV2dWltc0kv?=
 =?utf-8?B?RG1zTmF4RitTcktUdk14MG5lUm9xMDZFVzlocml1M3BQcGZnZ2w4NmY0TTQ1?=
 =?utf-8?B?Qm1lV2FYVktOcm00S3ZYM1AyYnoxTnJLd0ova21ueXBBQ012bHcvTlFqRXRm?=
 =?utf-8?B?SmV5enJFeXJWRUE2alhnc3lTK1JIVEdxL2dNbGpaVlRXSjZ3RzZ6bVBTZHoy?=
 =?utf-8?B?dERRK09TRE5FYW91Y09GVnhsMHd0UVBHem9oSEdHK1NuMmNUUDJycTR1Vkxt?=
 =?utf-8?B?WGJVRnVJODMwVWtwcS9DVStocWhKYitHRVFCZTFlZWRwd1E2OHdESXVSd1Nk?=
 =?utf-8?B?Ny82cTYvM1FVZUZuWVVkdUlES2kxczJKeXdkS0UzQXVSNnJ6bXlvMmsvWk9m?=
 =?utf-8?B?enhTdFlwVllTUE5ncGIyQU93ZkFQM0RZN2lRcDFaTXVzVm5qWkpIamNUcEYy?=
 =?utf-8?B?MEU1WnNCQTdSNkRzUGhCVjBoZ0UwaGtMWThoVGcyM2pTT0VzRHVzaFNEaFg0?=
 =?utf-8?B?OWZIaUltSE43U1pSM1RXQjF1elBvV3lEd2k3M09TQjRIZGUySFR4SFVLQnVI?=
 =?utf-8?B?L2djakh2UXgrTytxcDlPMFBDRVZYZjFhQVVMc0lINUpvM0ZYMnlQZkoyYkpW?=
 =?utf-8?B?TytCeFY0dHlPZG9Yb0xzV0xpTTE2SGJ6emM1Um1mUzUvOTFMT3pPTTNmS0pR?=
 =?utf-8?B?Q2JKN0pHOUJwQkljNytRV0svNjB5V1hobHdQdkQ1S0t3cy9JVzdKOG1QaW5B?=
 =?utf-8?B?MlZLUk0vaFJaeXdpZUl1OVZRMmRTRU5PeGtEU1lzb2c5VzRoUzZXQlRuZ1lB?=
 =?utf-8?Q?d24H2v5Ob+GbIQPg4uAoyEyiEOrCvLpmx5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <431E8F9461222C48828EFE0EB94A90FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2295
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	354b7248-fddf-4324-a2a0-08d89c17c94c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4NzwmgTU5K6jxTZQYaG4zV9yYfP6qDiWGx3/q9JZngjNYCKvA/ffurXI8ur022L2/G9bsZTe0v+iEOD6ysIhLzAz3ScqiR5Zog3/yBnSON9P76tBYtNN+Y7+dR05fDzh1rrfLTdMoe8hpmeSom0x/rBPR+rlyl+DdFt2dRZGe6OUQbW9kgm/ycWsV8DDMyUBP6tqHMWvUaGiDUeMvJfY4d5TnB/+LQuet+Eqphv7MdsWfh6lkHrxNhP+Gs7JIzwMKW9GX69ozoY2c6ks8P3T14AN0ex9Hs3oWHUQTqSOtQVSLl1OUlx831NWI/GcBLc7C8LEgI67yHvBbxMsOnKvl6VBtST7wHM3cHtkb2MEYBlUinL8uMslks3mhYSIgXr53cX0V9lZR9v9rhYlxBedzA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(46966005)(107886003)(47076004)(336012)(36756003)(478600001)(26005)(6862004)(54906003)(33656002)(81166007)(2906002)(53546011)(82740400003)(316002)(70586007)(2616005)(83380400001)(70206006)(356005)(6512007)(186003)(8676002)(5660300002)(82310400003)(86362001)(6506007)(6486002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 07:55:41.3605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf6ce2a-a3f8-4b01-510c-08d89c17d327
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4474

SGksDQoNCj4gT24gOSBEZWMgMjAyMCwgYXQgMDE6MTksIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIDggRGVjIDIwMjAsIEp1
bGllbiBHcmFsbCB3cm90ZToNCj4+IE9uIDA3LzEyLzIwMjAgMTg6NDIsIFJhaHVsIFNpbmdoIHdy
b3RlOg0KPj4+PiBPbiA3IERlYyAyMDIwLCBhdCA1OjM5IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4gT24gMDcvMTIvMjAyMCAxMjoxMiwgUmFodWwgU2luZ2gg
d3JvdGU6DQo+Pj4+Pj4+ICt0eXBlZGVmIHBhZGRyX3QgZG1hX2FkZHJfdDsNCj4+Pj4+Pj4gK3R5
cGVkZWYgdW5zaWduZWQgaW50IGdmcF90Ow0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsjZGVmaW5lIHBs
YXRmb3JtX2RldmljZSBkZXZpY2UNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArI2RlZmluZSBHRlBfS0VS
TkVMIDANCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArLyogQWxpYXMgdG8gWGVuIGRldmljZSB0cmVlIGhl
bHBlcnMgKi8NCj4+Pj4+Pj4gKyNkZWZpbmUgZGV2aWNlX25vZGUgZHRfZGV2aWNlX25vZGUNCj4+
Pj4+Pj4gKyNkZWZpbmUgb2ZfcGhhbmRsZV9hcmdzIGR0X3BoYW5kbGVfYXJncw0KPj4+Pj4+PiAr
I2RlZmluZSBvZl9kZXZpY2VfaWQgZHRfZGV2aWNlX21hdGNoDQo+Pj4+Pj4+ICsjZGVmaW5lIG9m
X21hdGNoX25vZGUgZHRfbWF0Y2hfbm9kZQ0KPj4+Pj4+PiArI2RlZmluZSBvZl9wcm9wZXJ0eV9y
ZWFkX3UzMihucCwgcG5hbWUsIG91dCkNCj4+Pj4+Pj4gKCFkdF9wcm9wZXJ0eV9yZWFkX3UzMihu
cCwgcG5hbWUsIG91dCkpDQo+Pj4+Pj4+ICsjZGVmaW5lIG9mX3Byb3BlcnR5X3JlYWRfYm9vbCBk
dF9wcm9wZXJ0eV9yZWFkX2Jvb2wNCj4+Pj4+Pj4gKyNkZWZpbmUgb2ZfcGFyc2VfcGhhbmRsZV93
aXRoX2FyZ3MgZHRfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiAr
LyogQWxpYXMgdG8gWGVuIGxvY2sgZnVuY3Rpb25zICovDQo+Pj4+Pj4+ICsjZGVmaW5lIG11dGV4
IHNwaW5sb2NrDQo+Pj4+Pj4+ICsjZGVmaW5lIG11dGV4X2luaXQgc3Bpbl9sb2NrX2luaXQNCj4+
Pj4+Pj4gKyNkZWZpbmUgbXV0ZXhfbG9jayBzcGluX2xvY2sNCj4+Pj4+Pj4gKyNkZWZpbmUgbXV0
ZXhfdW5sb2NrIHNwaW5fdW5sb2NrDQo+Pj4+Pj4gDQo+Pj4+Pj4gSG1tLi4uIG11dGV4IGFyZSBu
b3Qgc3BpbmxvY2suIENhbiB5b3UgZXhwbGFpbiB3aHkgdGhpcyBpcyBmaW5lIHRvDQo+Pj4+Pj4g
c3dpdGNoIHRvIHNwaW5sb2NrPw0KPj4+Pj4gWWVzIG11dGV4IGFyZSBub3Qgc3BpbmxvY2suIEFz
IG11dGV4IGlzIG5vdCBpbXBsZW1lbnRlZCBpbiBYRU4gSSB0aG91Z2h0DQo+Pj4+PiBvZiB1c2lu
ZyBzcGlubG9jayBpbiBwbGFjZSBvZiBtdXRleCBhcyB0aGlzIGlzIHRoZSBvbmx5IGxvY2tpbmcN
Cj4+Pj4+IG1lY2hhbmlzbSBhdmFpbGFibGUgaW4gWEVOLg0KPj4+Pj4gTGV0IG1lIGtub3cgaWYg
dGhlcmUgaXMgYW5vdGhlciBibG9ja2luZyBsb2NrIGF2YWlsYWJsZSBpbiBYRU4uIEkgd2lsbA0K
Pj4+Pj4gY2hlY2sgaWYgd2UgY2FuIHVzZSB0aGF0Lg0KPj4+PiANCj4+Pj4gVGhlcmUgYXJlIG5v
IGJsb2NraW5nIGxvY2sgYXZhaWxhYmxlIGluIFhlbiBzbyBmYXIuIEhvd2V2ZXIsIGlmIExpbnV4
IHdlcmUNCj4+Pj4gdXNpbmcgbXV0ZXggaW5zdGVhZCBvZiBzcGlubG9jaywgdGhlbiBpdCBsaWtl
bHkgbWVhbnMgdGhleSBvcGVyYXRpb25zIGluDQo+Pj4+IHRoZSBjcml0aWNhbCBzZWN0aW9uIGNh
biBiZSBsb25nIHJ1bm5pbmcuDQo+Pj4gDQo+Pj4gWWVzIHlvdSBhcmUgcmlnaHQgTGludXggaXMg
dXNpbmcgbXV0ZXggd2hlbiBhdHRhY2hpbmcgYSBkZXZpY2UgdG8gdGhlIFNNTVUNCj4+PiBhcyB0
aGlzIG9wZXJhdGlvbiBtaWdodCB0YWtlIGxvbmdlciB0aW1lLg0KPj4+PiANCj4+Pj4gSG93IGRp
ZCB5b3UgY2FtZSB0byB0aGUgY29uY2x1c2lvbiB0aGF0IHVzaW5nIHNwaW5sb2NrIGluIHRoZSBT
TU1VIGRyaXZlcg0KPj4+PiB3b3VsZCBiZSBmaW5lPw0KPj4+IA0KPj4+IE11dGV4IGlzIHJlcGxh
Y2VkIGJ5IHNwaW5sb2NrICBpbiB0aGUgU01NVSBkcml2ZXIgd2hlbiB0aGVyZSBpcyBhIHJlcXVl
c3QgdG8NCj4+PiBhc3NpZ24gYSBkZXZpY2UgdG8gdGhlIGd1ZXN0LiBBcyB3ZSBhcmUgaW4gdXNl
ciBjb250ZXh0IGF0IHRoYXQgdGltZSBpdHMgb2sNCj4+PiB0byB1c2Ugc3BpbmxvY2suDQo+PiAN
Cj4+IEkgYW0gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIGJ5ICJ1c2VyIGNv
bnRleHQiIGhlcmUuIENhbiB5b3UNCj4+IGNsYXJpZnkgaXQ/DQo+PiANCj4+PiBBcyBwZXIgbXkg
dW5kZXJzdGFuZGluZyB0aGVyZSBpcyBvbmUgc2NlbmFyaW8gd2hlbiBDUFUgd2lsbCBzcGluIHdo
ZW4gdGhlcmUNCj4+PiBpcyBhIHJlcXVlc3QgZnJvbSB0aGUgdXNlciBhdCB0aGUgc2FtZSB0aW1l
IHRvIGFzc2lnbiBhbm90aGVyIGRldmljZSB0byB0aGUNCj4+PiBTTU1VIGFuZCBJIHRoaW5rIHRo
YXQgaXMgdmVyeSByYXJlLg0KPj4gDQo+PiBXaGF0ICJ1c2VyIiBhcmUgeW91IHJlZmVycmluZyB0
bz8NCj4+IA0KPj4+IA0KPj4+IFBsZWFzZSBzdWdnZXN0IGhvdyB3ZSBjYW4gcHJvY2VlZCBvbiB0
aGlzLg0KPj4gDQo+PiBJIGFtIGd1ZXNzaW5nIHRoYXQgd2hhdCB5b3UgYXJlIHNheWluZyBpcyB0
aGUgcmVxdWVzdCB0byBhc3NpZ24vZGUtYXNzaWduDQo+PiBkZXZpY2Ugd2lsbCBiZSBpc3N1ZWQg
YnkgdGhlIHRvb2xzdGFjayBhbmQgdGhlcmVmb3JlIHRoZXkgc2hvdWxkIGJlIHRydXN0ZWQuDQo+
PiANCj4+IE15IGNvbmNlcm4gaGVyZSBpcyBub3QgYWJvdXQgc29tZW9uZSB3YWl0aW5nIG9uIHRo
ZSBsb2NrIHRvIGJlIHJlbGVhc2VkLiBJdCBpcw0KPj4gbW9yZSB0aGUgZmFjdCB0aGF0IHVzaW5n
IGEgbXV0ZXgoKSBpcyBhbiBpbnNpZ2h0IHRoYXQgdGhlIG9wZXJhdGlvbiBwcm90ZWN0ZWQNCj4+
IGNhbiBiZSBsb25nLiBEZXBlbmRpbmcgb24gdGhlIGxlbmd0aCwgdGhpcyBtYXkgcmVzdWx0IHRv
IHVud2FudGVkIHNpZGUgZWZmZWN0DQo+PiAoZS5nLiBvdGhlciB2Q1BVIG5vdCBzY2hlZHVsZWQs
IFJDVSBzdGFsbCBpbiBkb20wLCB3YXRjaGRvZyBoaXQuLi4pLg0KPj4gDQo+PiBJIHJlY2FsbCBh
IGRpc2N1c3Npb24gZnJvbSBhIGNvdXBsZSBvZiB5ZWFycyBhZ28gbWVudGlvbmluZyB0aGF0IFNU
RQ0KPj4gcHJvZ3JhbW1pbmcgb3BlcmF0aW9ucyBjYW4gdGFrZSBxdWl0ZSBhIGxvbmcgdGltZS4g
U28gSSB3b3VsZCBsaWtlIHRvDQo+PiB1bmRlcnN0YW5kIGhvdyBsb25nIHRoZSBvcGVyYXRpb24g
aXMgbWVhbnQgdG8gbGFzdC4NCj4+IA0KPj4gRm9yIGEgdGVjaCBwcmV2aWV3LCB0aGlzIGlzIHBy
b2JhYmx5IE9LIHRvIHJlcGxhY2UgdGhlIG11dGV4IHdpdGggYW4gc3BpbmxvY2suDQo+PiBCdXQg
SSB3b3VsZCBub3Qgd2FudCB0aGlzIHRvIGdvIHBhc3QgdGhlIHRlY2ggcHJldmlldyBzdGFnZSB3
aXRob3V0IGEgcHJvcGVyDQo+PiBhbmFseXNpcy4NCj4+IA0KPj4gU3RlZmFubywgd2hhdCBkbyB5
b3UgdGhpbms/DQo+IA0KPiBJbiBzaG9ydCwgSSBhZ3JlZS4NCj4gDQo+IA0KPiBXZSBuZWVkIHRv
IGJlIHZlcnkgY2FyZWZ1bCByZXBsYWNpbmcgbXV0ZXhlcyB3aXRoIHNwaW5sb2Nrcy4gV2UgbmVl
ZCB0bw0KPiBsb29rIGNsb3NlbHkgYXQgdGhlIHdheXMgdGhlIHNwaW5sb2NrcyBjb3VsZCBpbnRy
b2R1Y2UgdW53YW50ZWQNCj4gbGF0ZW5jaWVzLiBDb25jdXJyZW50IGFzc2lnbl9kZXZpY2Ugb3Bl
cmF0aW9ucyBhcmUgcG9zc2libGUgYnV0IHJhcmUNCj4gYW5kLCBtb3JlIGltcG9ydGFudGx5LCB0
aGV5IGFyZSB1c2VyLWRyaXZlbiBzbyB0aGV5IGNvdWxkIGJlIG1pdGlnYXRlZC4NCj4gSSBhbSBt
b3JlIHdvcnJpZWQgYWJvdXQgb3RoZXIgcG9zc2libGUgc2NlbmFyaW9zLCBlLmcuIFNURSBvciBv
dGhlcg0KPiBvcGVyYXRpb25zLg0KPiANCj4gUmFodWwgY2xlYXJseSBwdXQgYSBsb3Qgb2Ygd29y
ayBpbnRvIHRoaXMgc2VyaWVzIGFscmVhZHkgYW5kIEkgdGhpbmsgaXQNCj4gaXMgYmV0dGVyIHRv
IHRha2UgdGhpcyBpbmNyZW1lbnRhbGx5LCB3aGljaCB3aWxsIGFsbG93IHVzIHRvIGRvIGJldHRl
cg0KPiB0ZXN0aW5nIGFuZCBhbHNvIG1vdmUgZmFzdGVyIG92ZXJhbGwuIFNvIEkgYW0gZmluZSB0
byB0YWtlIHRoZSBzZXJpZXMgYXMNCj4gaXMgbm93LCBwZW5kaW5nIGFuIGludmVzdGlnYXRpb24g
b24gdGhlIHNwaW5sb2NrcyBsYXRlci4NCg0KSSBhbHNvIGFncmVlIHdpdGggdGhlIGlzc3VlIG9u
IHRoZSBzcGlubG9jayBidXQgd2UgaGF2ZSBubyBlcXVpdmFsZW50IG9mIHNvbWV0aGluZw0KbG9v
a2luZyBsaWtlIGEgbXV0ZXggZm9yIG5vdyBpbiBYZW4gc28gdGhpcyB3b3VsZCByZXF1aXJlIHNv
bWUgbWFqb3IgcmVkZXNpZ24gYW5kDQp3aWxsIHRha2UgdXMgZmFyIGZyb20gdGhlIGxpbnV4IGRy
aXZlci4NCg0KSSB3b3VsZCBzdWdnZXN0IHRvIGFkZCBhIGNvbW1lbnQgYmVmb3JlIHRoaXMgcGFy
dCBvZiB0aGUgY29kZSB3aXRoIGEg4oCcVE9ET+KAnSBzbyB0aGF0DQppdCBpcyBjbGVhciBpbnNp
ZGUgdGhlIGNvZGUuDQpXZSBjb3VsZCBhbHNvIGFkZCBzb21lIGNvbW1lbnQgaW4gS2NvbmZpZyB0
byBtZW50aW9uIHRoaXMgcG9zc2libGUg4oCcZmF1bHR54oCdIGJlaGF2aW91ci4NCg0KV291bGQg
eW91IGFncmVlIG9uIGdvaW5nIGZvcndhcmQgbGlrZSB0aGlzID8NCg0KUmVnYXJkcw0KQmVydHJh
bmQNCg0KDQo=

