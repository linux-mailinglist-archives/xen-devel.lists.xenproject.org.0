Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BA9729CD0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 16:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546085.852692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7d3d-0005hR-S1; Fri, 09 Jun 2023 14:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546085.852692; Fri, 09 Jun 2023 14:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7d3d-0005es-PH; Fri, 09 Jun 2023 14:25:41 +0000
Received: by outflank-mailman (input) for mailman id 546085;
 Fri, 09 Jun 2023 14:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63PW=B5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q7d3b-0005ek-Fz
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 14:25:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 814d05fa-06d1-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 16:25:38 +0200 (CEST)
Received: from AS9PR06CA0018.eurprd06.prod.outlook.com (2603:10a6:20b:462::11)
 by DU0PR08MB9653.eurprd08.prod.outlook.com (2603:10a6:10:449::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.41; Fri, 9 Jun
 2023 14:25:34 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::cd) by AS9PR06CA0018.outlook.office365.com
 (2603:10a6:20b:462::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.26 via Frontend
 Transport; Fri, 9 Jun 2023 14:25:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.27 via Frontend Transport; Fri, 9 Jun 2023 14:25:33 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Fri, 09 Jun 2023 14:25:33 +0000
Received: from d3513fa0ee7c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5148FF8F-C164-449A-BC89-71F52581C961.1; 
 Fri, 09 Jun 2023 14:25:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3513fa0ee7c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Jun 2023 14:25:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9089.eurprd08.prod.outlook.com (2603:10a6:102:32a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 14:25:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6455.034; Fri, 9 Jun 2023
 14:25:24 +0000
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
X-Inumbo-ID: 814d05fa-06d1-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmhE+I2M7oc/0YLB1PK3/zPbN1oV0hZIX4fdmICidM0=;
 b=2lXp3hk1d0izeECax6LVsrEeaUOMRlAU4jyPjkdZYqsK+QwAtwGT4ITKERyQglCddQyRu2OpODz+/7oUHiLFfAVOit21mgjGirVPwtPnD9ESMEznqv6BkePDOZb65dYxcDCxYyOFCXAZeQNCM9dcaUfx/mhhemHJH+bjLHROpfU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15f32560548da5e5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1fSTpnU2PFBniKgY5QGGV/ms2l7PtbV0taclPjfSUFMQ9WU60U3QCP/plMrQzDUYI1apqFvGWVg45wiF/ougYKppZ27G8/rU1JTaF4k1dIJ0l8xhJzXTBt/WywNW+bv9AD9/v8RQI8OfEp93z5IzkwXwYkkfZcn+6IVSNFNJHKBpDHSL3YT5Wxp4A+uwRevU0YDDAABy1prUhE2rXlHDfvlw5I1+gFE/hXH6CTeBZqy7JHxjUqQhTsNKSrTEQ0bOKaO1KTjGGSfaAvfXpwX6HOZnSGHu+a0/KaXUga6UcxuSvIJpgZBZUG5XWHQN0nDaZBECD9XQBXf1ozI+Vm6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmhE+I2M7oc/0YLB1PK3/zPbN1oV0hZIX4fdmICidM0=;
 b=dPgYawDGcIEg+l0nlBybAjdUZs9gflZVw2Klyc4qM7Du+hdhu+y4M10zICwNAZmVca1sSZWLKhz50HYzg4RcUE0GcUcrr0LklNSmVIs4WeNCCDPHZGRfL4iYfWuqgN+tu/jjQLvMZ2kjoj68u/r2xSLLGKMq1iIkiaZ8F+2Y8FgEq6IwA+kSjmLwuvnyIfi0EFfA3FhVMIVYfG7rqNgsnsqNCi/VsFO2gWQIIWkZTBuyEMWgmNu2y2yy5JqBe3bwRTs96mbzuRsCO/Rm8GJ0RHYxCOW2lL7dgyeTLGU047IhsdBFeFWOOq9jOv+nfeTE8+QrEwPx1vqKQyDcp5xSrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmhE+I2M7oc/0YLB1PK3/zPbN1oV0hZIX4fdmICidM0=;
 b=2lXp3hk1d0izeECax6LVsrEeaUOMRlAU4jyPjkdZYqsK+QwAtwGT4ITKERyQglCddQyRu2OpODz+/7oUHiLFfAVOit21mgjGirVPwtPnD9ESMEznqv6BkePDOZb65dYxcDCxYyOFCXAZeQNCM9dcaUfx/mhhemHJH+bjLHROpfU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Roberto Bagnara <bagnara@cs.unipr.it>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"consulting@bugseng.com" <consulting@bugseng.com>
Subject: Re: Xen reliance on non-standard GCC features
Thread-Topic: Xen reliance on non-standard GCC features
Thread-Index:
 AQHZl26d8Aek6tjnZE6ifkCnLNFck6978WEAgABCdQCAAsOqgIAB4G6AgAFZQICAAEoFAIAAElgA
Date: Fri, 9 Jun 2023 14:25:24 +0000
Message-ID: <17C59D5C-795E-4591-A7C9-A4C5179BF373@arm.com>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
 <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
 <968ba799-8fe4-e22f-b678-64e52f789026@suse.com>
 <9df8560d-4b06-2ab4-b09a-30241dd19676@cs.unipr.it>
 <4f5e33e7-9606-2cc7-79ec-c03cc724b6c6@suse.com>
 <063e14e4-4f88-f4aa-56b4-0b450f69e73f@xen.org>
In-Reply-To: <063e14e4-4f88-f4aa-56b4-0b450f69e73f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAVPR08MB9089:EE_|AM7EUR03FT017:EE_|DU0PR08MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: 4512b15e-ffab-4e56-f89b-08db68f562a3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2lFSusc2N2QrT2L6s1NyMWoE9iUdzS2YPFNPK7dNDhv5KpJS9yixZLLOr1NHTskmu4Pi95wxVxD9Hyig8LM5c99xKnbiqYxwCXkiwmeqCZVWvDOsu2aS4ufPgdfpvsOVIsRGTgX+JouQPrX6sRVekf8rTYDyzjjvooddEkGWBviPb3aMTpPyj/ItHRsgwgG4A0QHuC7hJPmgoxqaP2FiDig60zdohWTylXltdoOqyONr/sO2plPr2zD2gnqoFEUV9VINkIL7J8g3tTtYTXX/QWukpioPwmWvE8QXJuVilBxDE4/qe77bJCP20aoGCKL+X+iV2FeJJzkWUSWAa4RDtCAlZY5anLMpb6CBSVpay5XECg6f6oVzkEzJ0f5lM/DwS146LaRedjt+afSBOfKnlNh82Ab0tCpCV7WXfkBdSdLp2Mc7BtpfuRbYCC4WtCzYvqqt0v2IQFuwR5Fs6z4qZtvnSJ7KKfHYAXY8wvjg95sIvh8jfUNvGlpnmPCs7zxztFka7ri6JPIz15WeqeaolKnFy57hzTZmTvnSQ8ITHlw3tpP5n1dKkBAggGVVmE+B4Z+GJAmKKAuEy62WLaxbaUYJ4jJKig0KpjSe8jqPkOrqWRmU67377YF2w2kPmAf1W8yGdbmD9XSXhzDGTOFhzw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(122000001)(6506007)(53546011)(6512007)(186003)(83380400001)(33656002)(86362001)(38070700005)(2616005)(38100700002)(26005)(36756003)(41300700001)(66556008)(8936002)(54906003)(2906002)(64756008)(76116006)(91956017)(478600001)(6916009)(8676002)(4326008)(316002)(5660300002)(66946007)(71200400001)(6486002)(66476007)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D86B63A50DA10142B3429F03C6C9B575@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9089
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7a709845-33c5-4e49-7b0b-08db68f55d68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wif/mFXxqHINnAXq2ccuuRIP2qZZxRqN6ZD5+uPo2EV3RrFiFQhzB50xWhEvamRKsfedkRfCQq+qCJVvoFlXSO7okDSdbNyZqaUSHtXngWYTE9L8Fw4lrHFuIYARESCSVKPyJ5g/0lz+q9iigaEyZw9zHUGDwnJz5PlAZ2p/i6WAJ1PvKMGJnIxlUCCFshjcnjZhEBkeadaJBFZMy2+nEiLTOA4vcGqluY0dtOnGfmO3h7uKGIb9yjxldfqIPqNrtyhQSojaaPhYfNP8hgk5y14YuT7J81/DJcR12eaXwxnsP9UYzYNXgr7RrzLz5IstSCmqFXZUN635QquX4lQh3xjK5qryinEJT7im+jzwWWYSeGhtD6+62VCZrdTkR3hDLcsTBB/+2JqRfzHaLx5IN4GrTw3q9ztidANOikCjyVpIQdrzci70CKYnYcCjp6U6bMKVe4l4WmTpQUHNwPLRM1+Cf87GsqqFnn/h6mPBtErYocktb/vthA3c7fXzab4fXfwPYr8VDUWH/LidvwW6ZLiFeBvFN07g/ufvNednKJQsjqbMhsSWm+W2gd2giDm8WaaxT0SoyAHqh4jExMIjvYmvfzT4lrms0+G7/KfppRDjMEhqtWX4MbeIeJ1uz2KwvmPp16xFmDBP3zw+SOxhw4/wmk/zVEuXPaFEuSWX0/XAUqISXzijeKPXUImkudH3NcKWBai+ZFWN+AanKmJn/2a+ngc0ILJMXsEQzoaky2LXJhKrukg6ZR4RqgdZc9AO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(2906002)(86362001)(33656002)(82310400005)(5660300002)(40480700001)(2616005)(47076005)(6486002)(336012)(186003)(83380400001)(107886003)(36860700001)(40460700003)(6506007)(53546011)(26005)(6512007)(356005)(81166007)(82740400003)(478600001)(54906003)(4326008)(6862004)(316002)(41300700001)(70586007)(70206006)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 14:25:33.3465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4512b15e-ffab-4e56-f89b-08db68f562a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9653

Hi,

> On 9 Jun 2023, at 15:19, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jan,
>=20
> On 09/06/2023 09:54, Jan Beulich wrote:
>> On 08.06.2023 14:18, Roberto Bagnara wrote:
>>> On 07/06/23 09:39, Jan Beulich wrote:
>>>> On 05.06.2023 15:26, Roberto Bagnara wrote:
>>>>> On 05/06/23 11:28, Jan Beulich wrote:
>>>>>> On 05.06.2023 07:28, Roberto Bagnara wrote:
>>>>> You are right: here are a few examples for U2:
>>>>>=20
>>>>> xen/arch/arm/cpuerrata.c:92.12-92.35:
>>>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899=
:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool =
used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>> xen/include/xen/spinlock.h:31.21-31.23: expanded from macro `_LOCK_DE=
BUG'
>>>>> xen/include/xen/spinlock.h:143.57-143.67: expanded from macro `SPIN_L=
OCK_UNLOCKED'
>>>>> xen/include/xen/spinlock.h:144.43-144.60: expanded from macro `DEFINE=
_SPINLOCK'
>>>>=20
>>>> I'm afraid this is a bad example, as it goes hand-in-hand with using
>>>> another extension. I don't think using a non-empty initialization list
>>>> is going to work with
>>>>=20
>>>> union lock_debug { };
>>>=20
>>> Yes, this is C99 undefined behavior 58:
>>> "A structure or union is defined as containing no named members (6.7.2.=
1)."
>>>=20
>>> Here is another example:
>>>=20
>>> lpae_t pte =3D {};
>>>=20
>>> whereas we have
>>>=20
>>> typedef union {
>>>      uint64_t bits;
>>>      lpae_pt_t pt;
>>>      lpae_p2m_t p2m;
>>>      lpae_walk_t walk;
>>> } lpae_t;
>>>=20
>>>=20
>>>>> xen/arch/arm/cpuerrata.c:678.5-678.6:
>>>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899=
:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool =
used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>=20
>>>>> xen/arch/arm/cpufeature.c:33.5-33.6:
>>>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899=
:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool =
used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>=20
>>>> Both of these are a common idiom we use: The "sentinel" of an array
>>>> of compound type initializer.
>>>=20
>>> Wouldn't it be possible writing such sentinels in a standard-compliant
>>> way, like {0} or similar, instead of {}?
>> I would be possible, sure, but the question is whether we want that. Iir=
c
>> in review comments we've been asking to preferably use {}, for being
>> shorter / less clutter without resulting in any ambiguity.
>>>>>>> U6) Empty declarations.
>>>>>=20
>>>>> Examples:
>>>>>=20
>>>>> xen/arch/arm/arm64/lib/find_next_bit.c:57.29:
>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999=
 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/b=
in/aarch64-linux-gnu-gcc-12'
>>>>>=20
>>>>> xen/arch/arm/arm64/lib/find_next_bit.c:103.34:
>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999=
 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/b=
in/aarch64-linux-gnu-gcc-12'
>>>>=20
>>>> Looks like these could be taken care of by finally purging our
>>>> EXPORT_SYMBOL() stub.
>>>>=20
>>>>> xen/arch/arm/include/asm/vreg.h:143.26:
>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999=
 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/b=
in/aarch64-linux-gnu-gcc-12'
>>>>>=20
>>>>> xen/arch/arm/include/asm/vreg.h:144.26:
>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999=
 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/b=
in/aarch64-linux-gnu-gcc-12'
>>>>=20
>>>> I'm having trouble spotting anything suspicious there.
>>>=20
>>> The macro expands to definitions of inline functions
>>> and after the macro invocation there is a ";".
>>>=20
>>> The preprocessed code is then:
>>>=20
>>> static inline void foo() { ... }
>>> ;
>>>=20
>>> where the final ";" is an empty declaration not allowed by
>>> the C99 language standard.
>> Oh, I see.
>>> Removing the ";" after the macro invocation is a possible solution,
>>> but other possibilities exist if this is strongly unwanted.
>> We have other macros to instantiate functions, and there no stray
>> semicolons are used. I think this wants doing the same way here, but it
>> being Arm code the ultimate say is with the Arm maintainers.
>=20
> I don't think there is a reason to keep the ";" after. So I would be fine=
 if this is removed.

+1

Cheers
Bertrand


