Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED3783B6B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 10:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588228.919720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMRa-0003s7-AH; Tue, 22 Aug 2023 08:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588228.919720; Tue, 22 Aug 2023 08:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMRa-0003pT-6s; Tue, 22 Aug 2023 08:08:54 +0000
Received: by outflank-mailman (input) for mailman id 588228;
 Tue, 22 Aug 2023 08:08:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hUC=EH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qYMRY-0003pJ-7C
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 08:08:52 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe16::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20e8b009-40c3-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 10:08:51 +0200 (CEST)
Received: from AM6PR0502CA0038.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::15) by PAWPR08MB10260.eurprd08.prod.outlook.com
 (2603:10a6:102:369::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:08:44 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::1b) by AM6PR0502CA0038.outlook.office365.com
 (2603:10a6:20b:56::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:08:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Tue, 22 Aug 2023 08:08:44 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Tue, 22 Aug 2023 08:08:43 +0000
Received: from cd249ff62977.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5AACFEDC-0FB1-43FF-8F86-3043A75261FA.1; 
 Tue, 22 Aug 2023 08:08:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd249ff62977.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Aug 2023 08:08:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6022.eurprd08.prod.outlook.com (2603:10a6:20b:295::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:08:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:08:35 +0000
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
X-Inumbo-ID: 20e8b009-40c3-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19rMcGGnAmktaHpjkPeOK319Ti2TVQpElHBIt/oZu+o=;
 b=cx3ZFP2Y28wj19ugWrtRp0endSJiMGKghnRutUOY2mlkWnXtZnot4Z2He1sRjMdr9A/r2bMCb2fMTIFuOG+GLj+m+PefeMtUQbzv0Xq3jxDOn4t7HLHwWWaIP3+bEIPJnv/SKVHF8azGSBCA3gJcmUYiwztUTagjcdxVUkGWm8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e815ffca696627df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rr2GfAodEAr0sFc3v05Vj0IsrCUXs4Y76TCtTeyTSxzrN3gyX7YAlzMUSlVG3DFKNhr3zGl1bvA137mNsJFxvUbgEvwP/ppvTjWHoukeL/bgaDmyeIJ1P9w+RAKwtMKAvsWdhOzjhZa+a7XVFmNkbuPPqQS4AzJykxeFgJ5IePkN6nU380k9K49EHdbMzmQWx5elCvtzdXZ2WUPeztI5ZkUFZcHJF0vFrIVusx4CtHVmTZwQnhMEz6i5r4i/CDKjXfq4/yHIPqAMc6jditC56KR6A9SyzkOoZY8tEifheA0FRS+BHb8SRhZp8YSV66rubLsyEXpqEe96ORIU9sQxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19rMcGGnAmktaHpjkPeOK319Ti2TVQpElHBIt/oZu+o=;
 b=A0Bl+1aokS7TdGA3wGtjKTiBrzf2XpQq5KTXgzPUlORiYNnV4nf0DCQLA6B1wtdrB5IhHWU9+wDBaRJEj5gU+lp1RfRcP/n4bSiWcys2R29YjFRETPUoRLgG8NTtdxwYRzQUJNoHLxtZtlJcNdYdWuIvtuG88sqlJG6750DuTxPLjDPihL6rYQkTi8dzcEQ+rvEdIeNr4EWM8ypyrlaheNkMuckqWIESysd5RTBLgov/rzWzQ83Y6K63pvwETR1kLv5cMU+96To6NWs9GcK+psLjrGja+NKn3ou1D7rp/GdYUXrv4iwZXNjJ+vUx3b1qXwLr5VlWAUm0l0asOkCbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19rMcGGnAmktaHpjkPeOK319Ti2TVQpElHBIt/oZu+o=;
 b=cx3ZFP2Y28wj19ugWrtRp0endSJiMGKghnRutUOY2mlkWnXtZnot4Z2He1sRjMdr9A/r2bMCb2fMTIFuOG+GLj+m+PefeMtUQbzv0Xq3jxDOn4t7HLHwWWaIP3+bEIPJnv/SKVHF8azGSBCA3gJcmUYiwztUTagjcdxVUkGWm8k=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 08/13] xen/arm: Fold pmap and fixmap into MMU system
Thread-Topic: [PATCH v5 08/13] xen/arm: Fold pmap and fixmap into MMU system
Thread-Index: AQHZzmeE4KXhY3mNtkSLYSr+mWg0ta/1GdYAgACN7QCAAFqCgIAAAI+A
Date: Tue, 22 Aug 2023 08:08:34 +0000
Message-ID: <575A067A-1CF1-4197-A7C1-511A453FCF5D@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-9-Henry.Wang@arm.com>
 <7503cbad-a0b9-4683-880f-1099ad62f2f7@xen.org>
 <65B3F435-4086-4DDE-A050-A7B741D67973@arm.com>
 <a19f88f6-3c5e-48a1-805f-8afcad22ba4b@xen.org>
In-Reply-To: <a19f88f6-3c5e-48a1-805f-8afcad22ba4b@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6022:EE_|AM7EUR03FT017:EE_|PAWPR08MB10260:EE_
X-MS-Office365-Filtering-Correlation-Id: de42faba-2571-4422-ae50-08dba2e7010e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2YP+8eZ8tdxYegB/d2yqFo/y4LVoZirnijjI0KzKQUT4J7heTaHbu6uSIdC1dtbNAJiL78SZftKZ7VhQIg1IcNCmpw3XqfGZtHLpto9hLT/hDQ1b7ZB6Apl1e57ZSUBqcWSFPsY02CUZ9ENPRhC/pFC7hEXPlMw3myp8nFniLMXwfRVMHUXA/Yrd4FrHNJVBs9JJNXL6Te1W9JljfD4AyzOR24J1pVrRVo5uO96QPuHakqz2UIcQEF8KXIBqet0UJhMFZjWIgra33uQro890AdCfdI8e8mwMjk7XiwvNGi6fvAjmG/08PLWoE88nWm+nm6SsB/rxeKqkHpkp+HjwcZt8HBhbSts1HEpsgVfVJTdpq9n9QDfUbt6cgDJxiG5JlT518Cl1z9bn+VGY/F9nVaz/8DJ1bpva2jk0qMldPmm1Blu3twkz8GFooOD/zEMcXcxzWqk2ieqsFQy1JcJJ45WSWugISBdZov8SJct8wpymyV3uNfQ9YbnnIoD0xmNXtzvoTKTo2klFLzn2beQXI+d7wLUR2HkG3oBSRCkxH7LB6qRumywUbh3wG05toKz/2pIu4rZr1vfl6cRDxheRgrOqTx34XWBfut1aZv6U3ufiIYyAJQV1vYCTnMD37USkXSfueBZ9y/7Hoz5QQfH/xg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199024)(1800799009)(186009)(2906002)(4744005)(53546011)(38070700005)(38100700002)(6486002)(6506007)(5660300002)(33656002)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(6512007)(66946007)(64756008)(66446008)(6916009)(54906003)(76116006)(66556008)(66476007)(91956017)(478600001)(122000001)(71200400001)(36756003)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9F25861EFBCFF14B89B3D00C089503E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6022
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b41bffd6-935c-4305-13f7-08dba2e6fb9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ew5ifMgmkEbVoguLwtrbmWDa7RvGWPATVYhpg7eelSlNYfyDq/PxRjUhI6nQrb2yBIjP1/84dvVc+RKj/gqwKgpJ3vXWI+JEqBsAipztohMUI4yvJu81sZnd8DvxrKzesgHyoyAUtzW6I/JD1PAManjp5dcWT/ZeFFZaxIgcUtKxqFoV4+YdPA8tQFTE2yW4GJlPnzDQQRubrX9KbFNvseENPVcKRhyBDdIcfhoAjZoJmylmagFOiIq1RBrRH5oZPJYjO6ZQtqSgB6IpSCSIIqnsMco9BFV3gxGJ9WlVo8F1Oab7KceCcyjREax5OQzlvKjKPa6keo/fHq4NeTM8FFCwI+6CALLxIG/iVXFOqqugbOikXyMvwzMmBTpGmvpXb1E6K6bsL4WSBBl5Df/0Uo157OFaKQvsqboWKoyolJ9Vx/wrbgazL2lYBRVv4uAv3q8ohO0jMZF240Hp+v4s0o5GyDkWgHS0mCbQa0AoJ9UgXpfyO0KAlbgUQfq1kW5BNDtcbRzDNZCFTV3dakdOEfk3m7LT+LMx0aDAOjQpBTAOdEGp9HUAEZyGrjn8sE7Axi6VRcpI3LOgjxaq+F4XZRfMv31dL7uI1Hnx004XMgaruDhNHNRTlXerv4oCqfu6CGf0fvdEOgDPR7gnv49KA0uLp1tVHsx8RO8t8sjfdB3q/AGerGHC4pwcKfNH3fmADvJwffNZxFAYeMhP8yI8QUbvgUYuK4yN7+7Xn/KSF3CMVD3f48/7qFc5WqVMmX5l
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(6486002)(6506007)(6512007)(53546011)(40460700003)(36860700001)(336012)(40480700001)(107886003)(83380400001)(36756003)(26005)(356005)(82740400003)(47076005)(81166007)(41300700001)(2616005)(33656002)(2906002)(316002)(54906003)(4744005)(70206006)(86362001)(5660300002)(70586007)(478600001)(8676002)(6862004)(8936002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:08:44.1316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de42faba-2571-4422-ae50-08dba2e7010e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10260

Hi Julien,

> On Aug 22, 2023, at 16:06, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 22/08/2023 03:42, Henry Wang wrote:
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index 0d433a32e7..bc3e5bd6f9 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -16,7 +16,6 @@
>>  #include <xen/vmap.h>
>>  #include <asm/byteorder.h>
>> -#include <asm/fixmap.h>
>>  #include <asm/kernel.h>
>>  #include <asm/setup.h>
>> ```
>=20
> The changes in kernel.c should go in patch #12 where the fixmap user is m=
oved out.

Thanks, sounds good. I will fix it in v6.

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


