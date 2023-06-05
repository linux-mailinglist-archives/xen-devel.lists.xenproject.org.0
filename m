Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16264722A30
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 17:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543758.848999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Bl4-00015s-9y; Mon, 05 Jun 2023 15:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543758.848999; Mon, 05 Jun 2023 15:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Bl4-00012Z-75; Mon, 05 Jun 2023 15:04:34 +0000
Received: by outflank-mailman (input) for mailman id 543758;
 Mon, 05 Jun 2023 15:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xfSY=BZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q6Bl2-00012L-OK
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 15:04:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45d539a9-03b2-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 17:04:31 +0200 (CEST)
Received: from AS9PR04CA0172.eurprd04.prod.outlook.com (2603:10a6:20b:530::18)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 15:04:27 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::ea) by AS9PR04CA0172.outlook.office365.com
 (2603:10a6:20b:530::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 15:04:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19 via Frontend Transport; Mon, 5 Jun 2023 15:04:26 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Mon, 05 Jun 2023 15:04:26 +0000
Received: from 1e78c923a6a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1316493C-F372-4D20-AE78-AB177152A3DB.1; 
 Mon, 05 Jun 2023 15:04:19 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1e78c923a6a5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jun 2023 15:04:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB9728.eurprd08.prod.outlook.com (2603:10a6:10:444::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Mon, 5 Jun
 2023 15:04:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:04:16 +0000
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
X-Inumbo-ID: 45d539a9-03b2-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiMoeb7BPg/mFFb12G5XeZ+waHi+R9f8p5aPOeM5dKU=;
 b=wLgiJNk4wLY/2uSqAkJ3NQ5CvJUb4AU8DWZbNgp1cowCOVQ63rUds8mHwtU23IRyPrIB9EDmuWNVz+r1Z84YWUYRz6WuS0XJkSRizOVlCf8eNC4bWnOMxVbsNl8y/v/ywva9ReiWDxXKdHr0sLkO4xLfjPP1BK/k2xoDv30w/QI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d48752990965baf2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xi8/+q3QoXJi1uSYkuCYw0tRwWslbJLPaFmOudhGxVkHBk9HOphguDI6j65rAE7g+Pg4Raq1y/rdMJIaHrQlivPciI2pZE1/sdjqbwtA1URoLLB7jJPoJz7FQPXYH7/htjQYfWta751Jzyb4aKbQESCnF0WiFEfGSpOgyRCYdAhwyqKCKu0MelHFBN1QUOXaRI/xaQ+SMBbWxrDX3fIizSM/yKrSXPWr92FqF4QAqCblIUJ4VXZvXlwgsagdkLvVa+PgNQ/YfxlcSQrJ3rCis3GCFxT9Q3ImlKmIkcWpEgbkOCEj5+0h5HLgNGEzhPN6CjQn9Wbz6ARStaorp9m8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiMoeb7BPg/mFFb12G5XeZ+waHi+R9f8p5aPOeM5dKU=;
 b=acBt7+ipdpK1vD+dvJOWJ1usMT1ZMILL5ErdYyp/Hw1+70pArQa93gADl08VeVfPc81Pt1LDdkIIfI8eqepgBCUqNKU5q2C97ErXpAi3SseWSGU8NLFdwykIJEo3M5vrlFDKSr0h1WT3ZscdhJQX4o3/WY8/MvqVwdSCwz22SRbJRITIXN0MKysPvitBHqT6yBWUunkCBTGYVh79cHjPfAo3l8a25Ukk3nPYsLx3m6PUV41W5xEutavSqhCv7usHxy6B6XCngys6Bz8GeJHLbZUFTHHt2e0VIZAhH78hIZud0cwjCehHyg1dyo07+ZPFsLVJeAcQnthu3tUxgKWfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiMoeb7BPg/mFFb12G5XeZ+waHi+R9f8p5aPOeM5dKU=;
 b=wLgiJNk4wLY/2uSqAkJ3NQ5CvJUb4AU8DWZbNgp1cowCOVQ63rUds8mHwtU23IRyPrIB9EDmuWNVz+r1Z84YWUYRz6WuS0XJkSRizOVlCf8eNC4bWnOMxVbsNl8y/v/ywva9ReiWDxXKdHr0sLkO4xLfjPP1BK/k2xoDv30w/QI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH 0/2] xen: Arch Teardown
Thread-Topic: [PATCH 0/2] xen: Arch Teardown
Thread-Index: AQHZl7wlup1CE36mrESnTYlVMy53E698TniA
Date: Mon, 5 Jun 2023 15:04:16 +0000
Message-ID: <C813B495-E667-48A4-8560-1C984DB0AFBF@arm.com>
References: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB9728:EE_|AM7EUR03FT063:EE_|AS8PR08MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: d545898d-c499-4744-fcaa-08db65d62789
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cfGQSm3izFzm1sLLzsILr8h2hEU0uK99pYRpEbqQcyrzNWgtUuufP8umNB+PM7kxiibOGWZeHxIBNPO9GE1tZFFv1wgELN8sPJjzBw79wOPszYLl6wZgWXu1TETzb+c714xYBZw5iP8Yi1AafXp0rCBFEkjzfPdntY5PfFb3WHczFhEReq0D82WAeJXUYVLuKRYWGyooS7nzXNdfQDVlCmfLtzQCYERM/c9IdX46itnbjZmq9ghtT007eveJscAOPR+iMkohnCDSSCox+wGlcXNTzfeM9IgUpJCfrTfJTSO3fXhlAJnvLVdsSdL4mxr5fpIsyCn3TEoaV96uS2LoImk+AlUteCmMAK1HrlQppN2Wo8WKjbt0LK1ZxjC5yfCLO1DfexmuqGYpDIG5g45OpuXPAEIRJRDv79DAoaKbhRW6sAOGns8rDBcmsJ2BZR2DvPg9H3G6+oceOiwpEnx7hhxjf4+dVqju2E8WGypGJtPg7EZj4OACZZYoorDbnEspxzdU3FfjsFwLxEoIQHYQs7mZPgOIFD2IAtcL1MUxc0YK/T9drvqDMVe3st9FDxj/UqphUCAOEbGrZOUvDUWpImCCWgNlvAzrQ7cYHE5uIQPd6kTs4HHoFfqNZlKjlgvwMwRjcJV3w8uTn6kjh33bYQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(54906003)(71200400001)(478600001)(8676002)(5660300002)(8936002)(36756003)(38070700005)(2906002)(33656002)(86362001)(4326008)(6916009)(122000001)(91956017)(64756008)(66446008)(66476007)(66556008)(316002)(76116006)(66946007)(38100700002)(41300700001)(2616005)(26005)(186003)(53546011)(6486002)(6506007)(966005)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <83B1F956C6707D43A2C85066F3D03F47@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9728
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b005a318-984d-4685-cf8b-08db65d621d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sIvF4inbINCvK8H6xcTPNRRWccf13KnnXURsOX8Dq8VA9lvgOSvD2vAyfpQ5dIPOFMuUT6NaLLaMZx3IX973V7RbqaTm52RxpvYVeGWtEeB8A90tUInoDtBwKJmX+fqQw6WS0NaMjwrIC3/rzGrvhdqj4fLLkXc6GHQ56ZFpgtJN7dsSoRAdrGrFcRjy+dwGFRvurQd6YMbubfhqQZ9R1ybym5FfiyhRUuBK4ZiSN1abtaPBqpw3gIH113D443xJC5lRdGzPcvGcM3bwGwQVXJMqPtPmk2LJERdwyH1i3Huvm0Fe4GxCjT3EI+E42gs0cqGarl+8nLehUKofwQm0a/23jOyPh+wiNVWZ8lkW9TM5sGArEjoGyHN79ZJyanKYQGpjPIFHOaPs2r/JBswQ/Y9BZO6jlR29XMXofjhrzmEN+LNi7XkATAWoYfElp3bFk+pEhM53hy9DwOaDXAcC9Cth1BaS6sYBA5fuw5LSxd2SLMxdJt8yE+eek7vZ3HXKr25GIZbOdq5fB0K+LzPxEdWaF0pY8OGFT9CK641YV79JYsRugnN5rytKMtPVYeUfPb4vssUwwe8PC+kanTQIamtBGjfh091985wno6GtWnpvFv9d+3bMFdGfqkYt4JzPXfJGIgRkh6Mc78BrfgwvADuBZZpO1nOAlDpW8MvKO44/1/0hBMdL07BeQ8L+SZEvgOXf/4Pn4AlKI7RSb7IrJzEd2VmtADWZCZ9F2ZQXRXY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(36840700001)(40470700004)(46966006)(47076005)(26005)(6512007)(53546011)(2616005)(6506007)(41300700001)(36860700001)(6486002)(107886003)(186003)(966005)(336012)(40460700003)(478600001)(54906003)(4326008)(82310400005)(82740400003)(40480700001)(356005)(70206006)(70586007)(81166007)(316002)(5660300002)(8936002)(8676002)(6862004)(2906002)(86362001)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:04:26.3193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d545898d-c499-4744-fcaa-08db65d62789
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534

Hi Andrew,

> On 5 Jun 2023, at 16:43, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> Sorry this is late...  Patch 1 ought to be ready in this form.
>=20
> I'll leave it up to the ARM maintainers as to whether they want to take p=
atch
> 2 in that form (with TEE in patch 3), or whether to merge the two.
>=20
> Compile tested on all architectures, functionally tested on x86 only.
>=20
> Branch available from:
>=20
>  https://xenbits.xen.org/gitweb/?p=3Dpeople/andrewcoop/xen.git;a=3Dshortl=
og;h=3Drefs/heads/arch-teardown
>=20
> Full Gitlab CI run in progress:
>=20
>  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/889759838


Thanks a lot for that.

I will sync up with Jens and we will handle the rest :-)

Cheers
Bertrand

>=20
> Andrew Cooper (2):
>  x86: Introduce arch_domain_teardown()
>  arm: Boilerpate arch_domain_teardown()
>=20
> xen/arch/arm/domain.c    | 32 ++++++++++++++++++++++++++++++++
> xen/arch/x86/domain.c    |  5 +++++
> xen/common/domain.c      |  6 ++++++
> xen/include/xen/domain.h |  1 +
> xen/include/xen/sched.h  |  1 +
> 5 files changed, 45 insertions(+)
>=20
>=20
> base-commit: b3880c365db89051728e1de6b6889c750cbdd915
> --=20
> 2.30.2
>=20


