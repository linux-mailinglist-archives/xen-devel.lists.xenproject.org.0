Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A42D4445
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48311.85410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0Rd-0007CW-4o; Wed, 09 Dec 2020 14:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48311.85410; Wed, 09 Dec 2020 14:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0Rd-0007C7-1g; Wed, 09 Dec 2020 14:27:53 +0000
Received: by outflank-mailman (input) for mailman id 48311;
 Wed, 09 Dec 2020 14:27:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn0Ra-0007C2-VU
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:27:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::61d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec865b8e-0dee-4809-aac4-549f3f01008b;
 Wed, 09 Dec 2020 14:27:49 +0000 (UTC)
Received: from DB6PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::33)
 by VI1PR0802MB2301.eurprd08.prod.outlook.com (2603:10a6:800:a0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Wed, 9 Dec
 2020 14:27:46 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::5) by DB6PR1001CA0047.outlook.office365.com
 (2603:10a6:4:55::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 14:27:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 14:27:46 +0000
Received: ("Tessian outbound 6af064f543d4:v71");
 Wed, 09 Dec 2020 14:27:46 +0000
Received: from d1247c0b2995.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B0B855F-8EAF-472C-84C7-0F90CD0CB9C0.1; 
 Wed, 09 Dec 2020 14:27:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1247c0b2995.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 14:27:13 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 9 Dec
 2020 14:27:13 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 14:27:13 +0000
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
X-Inumbo-ID: ec865b8e-0dee-4809-aac4-549f3f01008b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Agrz0qaGZgpl61pf9qGCx/YT91JtFl0hwm5ZWOGy5uQ=;
 b=pOPLS1XCd/WJqxz4l9HzTf3lHqN0aHOQtUz03WH92hr6G/1qodfRe5dC8eBnLYVYN9SqImnJMtOIvQVup50drd2B2tft/rnlR/IH4gguxOus9mXXhZNgKS+1B/cjYH37+HNi85G4a3wwqxehdm51N7FEYAh4eZJCTVVofxr/PT4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48d9834b47b21bce
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKLKwe1G257P0qqicc7GmXnW+iQBajrtizG9m1J49Jtxk6VoZZv+tXpesdWHrPibphkH/mF1jCwpUX8lpdhGIwy8gPhFyVAVSm5inrWxqFrp6RfZEQDjJqnHfiwGFyX4Hsvl/58su1OifroCjgZf1GcE4Y9QErhLTNUMLKyZmINeX6+6OHHouSOIl67KHYPXeBAf5yyzzp8o5kfvo4KXmUbz5JFZTwYgpkUbSOTMThfjEw2J6cGkH8ZHwfZAQNK0syrNL4ckKoqFpStgME3vBEaTS1Ysizxeaswmf7zIRlZLKLX75NMO4sNUK8GshTSCaWeHUzZaicmFrQgcRhKcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Agrz0qaGZgpl61pf9qGCx/YT91JtFl0hwm5ZWOGy5uQ=;
 b=kQOChzO8uTuUxMvCVIHyW/cKbtw82/2jdQiHv1pTxV1lS8+3VEkexce3rM5TZtp0oE40dHlbI6jjT7ywQWmGwud+jvtvGsutciIcnmjs+NFJcKGKoY65J7AWNYG70q2Mn/09/USHCPPGWALL5UeHoGs7kwu+SSd6nSmJQU4Qz2I0MGDe0laxPYdvGbWVTrswEMmeQUDWVUiGfJ3GFM4mpXPGcWhn/0P8LA0NMi83mlIGGikVXYSbL759AQ3JHEdM9AU7sR2TcJU7mVYfHdUxRv+NF+aIh5sUZkKkj2Yx/5FiI18XCoRvHfg1+Qn4CfYqNfBycn0CwnOM7QsoinnmUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Agrz0qaGZgpl61pf9qGCx/YT91JtFl0hwm5ZWOGy5uQ=;
 b=pOPLS1XCd/WJqxz4l9HzTf3lHqN0aHOQtUz03WH92hr6G/1qodfRe5dC8eBnLYVYN9SqImnJMtOIvQVup50drd2B2tft/rnlR/IH4gguxOus9mXXhZNgKS+1B/cjYH37+HNi85G4a3wwqxehdm51N7FEYAh4eZJCTVVofxr/PT4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
Thread-Topic: [PATCH v2 7/8] lib: move bsearch code
Thread-Index:
 AQHWqSYUW6jKcf9JAUabryyJK6872KnOWaMAgAERSYCABxiQgIAAHyEAgAEQxgCAFABlAIADGMmAgABP5wA=
Date: Wed, 9 Dec 2020 14:27:12 +0000
Message-ID: <689373AE-AF16-429F-818C-0467485E5748@arm.com>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
 <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
 <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
 <2419eccf-c696-6aa1-ada4-0f7bd6bc5657@xen.org>
 <77534dc3-bdd6-f884-99e3-90dc9b02a81f@citrix.com>
 <59a4e1c1-ea39-1846-92ae-92560db4b1fb@xen.org>
 <e0782c3b-9958-3792-eab9-d3fd6708225f@suse.com>
 <5fc44865-2115-947c-bd22-b51d7f17d39c@xen.org>
In-Reply-To: <5fc44865-2115-947c-bd22-b51d7f17d39c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be07b293-1373-4d9a-0789-08d89c4e992c
x-ms-traffictypediagnostic: DBAPR08MB5752:|VI1PR0802MB2301:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB23018DC99AEA2C0FD4F36A5B9DCC0@VI1PR0802MB2301.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GtoYJyVOkHzv5eFFr7oWbilowD+6heG17YODoX4ZTYPr4AQHZ0z+XYDGqYkGnEzsFFAE41Cobimri9ls8VA6BLqVQZ2BZ/ZUuljmZONorwCjfXx6y3zKSzQ3J/FoUoFaEj0O6cZceKh0mHN4/2vOwZGr2hUqg8cKjrds+XeRH9KXymwcBKyCfjP6s9kdb2LCvq1Qkdy3DjnZNuleneDz4zA2nSJ/M01R1QeOofhhRnqA/H3UB8iCWgJfK6juFjLRlTQiKgzl1ZYwDCmwd5L9snUmO8mUeo5s+DDQpGNtUzfq39WAKs1MQBElYazwywBPCdC3soRU0AElgrE+Nf2c0VjzVHAIfe+Lxph/S3/CHa1fxvstWKia96531hUCpifc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(91956017)(478600001)(316002)(2616005)(36756003)(86362001)(6506007)(76116006)(6486002)(5660300002)(66476007)(2906002)(4326008)(186003)(6512007)(83380400001)(54906003)(66446008)(71200400001)(33656002)(6916009)(53546011)(64756008)(26005)(66556008)(66946007)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?hA2Fo+T52ickdi2sIR/sxohPAjor+Tcw2rtHek5C2zgTye4KPuIJYqDQhzYd?=
 =?us-ascii?Q?3VpLwc35XYF4jfAO8XJ1Kuavd9iVhWmRijRwnq2hnzGencKat6A5UVQCl01U?=
 =?us-ascii?Q?5+V8xxiJ2w4LEf2OyE3FV3iCNcz3/el56P7iO0lfyH/G8sDeDMKfcCdvKq04?=
 =?us-ascii?Q?zZ28D/zKV8ZoisyvV+PMNqM49erRr2a8b5DCeyKKjPDY7aSuy2wTxYFyerI8?=
 =?us-ascii?Q?uMr8/57jELQA6KoHLf/zcNN1wbQD0ZybKBCqALMH6l8RsuSSZn/xaZtUX7zL?=
 =?us-ascii?Q?yyD4tWGlEOWB6FU3gZ7Qj3Zxaf64gIncTYmav+KlyQpiSQGd6qlcF+iZscGN?=
 =?us-ascii?Q?49f0O1PyjgC/E8nscYdnrMdyuUE9qPXWIxtbi72uUGEfDd23zdNw77zvNmPO?=
 =?us-ascii?Q?+forT8RLUNunL+FZjPuSWCaBQmOzmt/o/S7RoKTeL/JpUzFgiss7mEo40hTT?=
 =?us-ascii?Q?sH5Ybodtw8dnn4T4ifuYMVAEWIgOIeOGuiv21ZBt0h1sjh+kmivOe0bWkvTQ?=
 =?us-ascii?Q?vbA2q5d6Y4srFR6Xd8fnR8IbaOuflQVAIq28AxU/WeGBTIyYpWjmOZetsk/j?=
 =?us-ascii?Q?mUyFBOj9iv7r2Fi6w8s3kkPav2tmCwC0nPsWMed0KrUHWTFL12qzmaWOOuSB?=
 =?us-ascii?Q?PCV2jiod67j9nAJfnKUgvXZL/HQi2+vj/tg+AUEF64Di0A2eisaTpFvLsTnr?=
 =?us-ascii?Q?9EZO/+blgi2+zW/D85XbcbnfgQ70Zo8X6b8XSAj8894hxCHhmUTdydY0zgnh?=
 =?us-ascii?Q?0YFCvIYi2noDBZYejsI8EvaoxCDubFn/c+ywiXswJyhKX782A6BG64iutbPz?=
 =?us-ascii?Q?4iGd3F03XFwQfGqTgJvAGo/iY6BjOE71LM8+AEVchku6waIZlRP5MfXVLFIX?=
 =?us-ascii?Q?oyND04VXIty8tVHjy8LaFh9HRKKPR6yjcnYZWP/H9rPLFMjC8DEalzmTLedM?=
 =?us-ascii?Q?uChR9yQxWznvmkvwtl9L1UJExaZLUeDRZTIiFV2z/5AOrrRe/mSHUNdn9q8V?=
 =?us-ascii?Q?QtpK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D26CFC3D25E4A4479F233923E1A6FD47@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5752
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e8db970a-578c-41d3-8b5a-08d89c4e8546
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tgW+vlxF5E4nmQrPnUOlezLF9uTZxhXNuBnwB21jHo+GR6A1huCRBq0PLsxR8MZ6g4q2YHb55ZVvYBgb9FdKuA0ZwcvsuhYXAdT91VGC1lRCr+rvxTyITPIOqwIMurGWERqSXW7KwUGbZZ50gHx7LZSm2x9SeQSkqZU88NYCJ7pYbq9XBd4ExWWgIBH95cmZ2Hi5Icm59wh4xQsqN5wRP6LFMc5Zo94A1BVfCzCFVpXTJgGu+2Y67Pj+7rQcn14KVgc59OJbBh2KlKZpC2XRuW1jTWa/KP/k+oAoJKDB+FvE5DLY460Mi/W6v6+bA03dxSgINxxSyOckPsVIt1als/b7DGeTmgC9kar4kRsgUNY+Uh31yflOqN3DLSHu45uACpyFy235m0JcaecDCGjsCQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(46966005)(26005)(6512007)(356005)(6862004)(8936002)(54906003)(186003)(33656002)(5660300002)(82310400003)(4326008)(86362001)(6486002)(2906002)(508600001)(336012)(81166007)(8676002)(6506007)(70586007)(107886003)(53546011)(70206006)(83380400001)(2616005)(36756003)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 14:27:46.3916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be07b293-1373-4d9a-0789-08d89c4e992c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2301

Hi Jan,

> On 9 Dec 2020, at 09:41, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jan,
>=20
> On 07/12/2020 10:23, Jan Beulich wrote:
>> On 24.11.2020 17:57, Julien Grall wrote:
>>> On 24/11/2020 00:40, Andrew Cooper wrote:
>>>> On a totally separate point,  I wonder if we'd be better off compiling
>>>> with -fgnu89-inline because I can't see any case we're we'd want the C=
99
>>>> inline semantics anywhere in Xen.
>>>=20
>>> This was one of my point above. It feels that if we want to use the
>>> behavior in Xen, then it should be everywhere rather than just this hel=
per.
>> I'll be committing the series up to patch 6 in a minute. It remains
>> unclear to me whether your responses on this sub-thread are meant
>> to be an objection, or just a comment. Andrew gave his R-b despite
>> this separate consideration, and I now also have an ack from Wei
>> for the entire series. Please clarify.
>=20
> It still feels strange to apply to one function and not the others... But=
 I don't have a strong objection against the idea of using C99 inlines in X=
en.
>=20
> IOW, I will neither Ack nor NAck this patch.

I think as Julien here: why doing this inline thing for this function and n=
ot the others
provided by the library ?
Could you explain the reasons for this or the use cases you expect ?

I see 2 usage of bsearch in arm code and I do not get why you are doing thi=
s for
bsearch and not for the other functions.

Regards
Bertrand

>=20
>> Or actually I only thought I could commit a fair initial part of
>> the series - I'm still lacking Arm-side acks for patches 2 and 3
>> here.
>=20
> If you remember, I have asked if Anthony could review the build system be=
cause he worked on it recently.
>=20
> Unfortunately, I haven't seen any answer so far... I have pinged him on I=
RC.
>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


