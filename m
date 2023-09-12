Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0132279C157
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 02:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599852.935442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrda-0002GZ-V8; Tue, 12 Sep 2023 00:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599852.935442; Tue, 12 Sep 2023 00:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrda-0002EL-SM; Tue, 12 Sep 2023 00:52:18 +0000
Received: by outflank-mailman (input) for mailman id 599852;
 Tue, 12 Sep 2023 00:52:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/bM=E4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qfrdZ-0002EF-CA
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 00:52:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7d00::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e4d9516-5106-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 02:52:16 +0200 (CEST)
Received: from AM6P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::32)
 by AS2PR08MB8951.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Tue, 12 Sep
 2023 00:52:12 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::c0) by AM6P195CA0019.outlook.office365.com
 (2603:10a6:209:81::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Tue, 12 Sep 2023 00:52:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.11 via Frontend Transport; Tue, 12 Sep 2023 00:52:11 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Tue, 12 Sep 2023 00:52:11 +0000
Received: from 2b96ab36140d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 234F5C94-3AE2-4959-B636-26E91545BAF2.1; 
 Tue, 12 Sep 2023 00:52:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b96ab36140d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Sep 2023 00:52:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7518.eurprd08.prod.outlook.com (2603:10a6:10:312::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 00:51:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:51:56 +0000
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
X-Inumbo-ID: 9e4d9516-5106-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G66WJsm9YoL7h5KPdifZjeRlsNp5KT6hzQIL9HF7ogk=;
 b=ZUr4xzGyiM0mg17orU+8FhvnMzrniuDyvzAmfchgsm5h0hbZ3a3ufaV9U8/SSZhIjppl1ciRvf2zcFqZQuiSR5+D2ZM4JQcfX3fvvmd/d91ElKoYnse1+sOo//qbMMr6l21kdjJ/oH3N7tV14xclns9W03BWu45Ey4l1/2so45g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31c9191d2fb1a738
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9/wUvsLgRzU0nP8LTPelxb8+0BHRcxxYFLSNjXAXB9jcFbls03PhGuqRXMsJp4c56gBpn3/zLz/EEXTXjScnWsLhMGvTELvOm6HqhE0zCoN+MBGgt3AcS6meCjfycnZxaoWaI3Tq5qpSkSikrSKiKG4ERVmN1yW30NSaIg4dd1JHOWiFH3RCDAjNm2FJRfODtFtDjEua0eRP8E1PhcI41ZYz7kNOFlnYGEtnzfO6NMrPxaZ459riZXj6kQ1cXc36rqzdb6cxRYoe8o8MNXOnk5dT98iPGq4MDivrb7TNIkkrUMxJQKxb5eDYvnGdkXQxzFGttoKFoPJ1oWiqXcTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G66WJsm9YoL7h5KPdifZjeRlsNp5KT6hzQIL9HF7ogk=;
 b=V+6uBkfNjlup925wdbr7jJYkKtqDQSB/IRU1Ae50IfbvhTxWkb6n8XoWk0nbYNGjBg9WlL709HmI1FZR23YbwuW/y1uHNff8wN0NevuXVTg3IHLAw3dQ4QHw5SIs3omZQDo8vdCsyVTvks7hrXdep0ibC8jvJepYkpQFINY2aGCeVbNajfvrU/6F0A5ueDA77xlN1LpJHCC18C1LdMujiFuSmxQ6xpLPAnRT0QHpc2PvXOZ3+jykEtyEGXAvx35aKw6y4afZhj38wXbK/LZ596So5SNGPWCvV5woce5X/2Vecei1IDcjIRVoDR4izabg4U6AQADCu+ec3JenDYC+iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G66WJsm9YoL7h5KPdifZjeRlsNp5KT6hzQIL9HF7ogk=;
 b=ZUr4xzGyiM0mg17orU+8FhvnMzrniuDyvzAmfchgsm5h0hbZ3a3ufaV9U8/SSZhIjppl1ciRvf2zcFqZQuiSR5+D2ZM4JQcfX3fvvmd/d91ElKoYnse1+sOo//qbMMr6l21kdjJ/oH3N7tV14xclns9W03BWu45Ey4l1/2so45g=
From: Henry Wang <Henry.Wang@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <Penny.Zheng@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 00/13] xen/arm: Split MMU code as the prepration of MPU
 work
Thread-Topic: [PATCH v6 00/13] xen/arm: Split MMU code as the prepration of
 MPU work
Thread-Index: AQHZ2U+MSWp0FTqbTEGC9gDQVfV1eLARkWSAgAQtfICAALUbgA==
Date: Tue, 12 Sep 2023 00:51:56 +0000
Message-ID: <F05F6158-7D79-4EC3-B591-93DE4018EB33@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2309081515340.6458@ubuntu-linux-20-04-desktop>
 <8da354d9-5b80-709d-8b0a-be1ba5694b37@amd.com>
In-Reply-To: <8da354d9-5b80-709d-8b0a-be1ba5694b37@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7518:EE_|AM7EUR03FT062:EE_|AS2PR08MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fd1e72-27e0-48da-9b2e-08dbb32a7feb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C1eRvodfAvTUWlbxYvNdFzHfMRHLPjEcVhfaeEEqco0JCOEGlImNikVjhtzbRmnJCD4VGjSa9vY07qGu586KKZqBvACD8BrqJcbltxDYlk2Tyx0gl70oka+asGV6hdcEr2uj+yBKG2Q9O95AEOQnVnanrB0cYSraep9RSN9SzMc/GoRmfND7zpKbn7sz8O/atQ+WKuI9+Vv57KISzTBO1jGrsbYeNUlnAmqri7QY3uNHNNUff0Vo4/agCokNpLwa1i7TIRxE9xfQ12o6adAes9zVUYZXMrJ7s878DDfbeprw61BQt3m0qwXXRStxJGGqGoSpXQdUCfSmOGgPhWVLxEpmRcV5xNBssPRET5LgoKtSd0WgwIubyZDEmQ9x0JFn36inixxJiYhyOsyt0eOg6b/gIv9VcAEuTz2cS6z9I5+aq5qH+Sgo3obbnpO00aLsgy1zIQO5UFnsitlwdLIqTo83SAKgupsEdsxzNFRxlvu3Oj3YbifEp1CApT0ibFpHln8WXoLiBSCiTawwFt8S2z7D9cy9lUzbFmLxP1tJxd5q9yRd7IO1NfO18ftgwvvBT2HxvnZmYUISQMNfX3+TRa2PBMYKPInUzPjw+JrVvK4Zg1mCs02VQD7NSULzH4dA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(1800799009)(451199024)(186009)(71200400001)(6506007)(53546011)(6486002)(41300700001)(83380400001)(26005)(478600001)(2616005)(966005)(2906002)(54906003)(66446008)(6636002)(66476007)(76116006)(66946007)(66556008)(316002)(64756008)(91956017)(8676002)(4326008)(8936002)(86362001)(36756003)(6512007)(38070700005)(33656002)(38100700002)(5660300002)(110136005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C478792308C9854AB10A2FEC3AEF11F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7518
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eddd081f-2d31-414f-34b6-08dbb32a76a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kixE6eUky9cj9ff1r1jTGBL4BVhohlH8/p2asS+cpw1X6/e6MPwu3wxQwMxpdeLxEwiyDkbkyg/zax+EFQIOuQf8LF/QnQu5UEsVP335CO1GtXyhtX1c/T6BX1uIQkHPGODt90qJodc6EDCHB4sym+04XGCOz2WdNWTHnZB8ocr0GScnj0twuoRsQiW09g9a4EAVyX6TeIr1QldxUB9Gy9MMHW5fAYCwfF/QcgHnuTqpzUqwvs4csWDiQmNp0njRtzza/9KgGnk1tkMjULA/7KF2vOG8VRYCQeH3zoxckGgFN5uc1biJTvZL+p2+tPPslmLXCtf2wg4VlvoG+AW/3WZIxVWZzsSvC0ddNJ+QC4fyS42/dytV67uP9WoVc0QNt36noVM58thJsCwBGA/inrBaWUjapfNi8DVKANo7MrOKoCMwJZG8fHd17idr01TK/oE1XGLDH9+BlSpeLDNZNP1IyNEKXysT7nfq98e58kGQyG66dWKFbgXcPmXovT3UUH09j6ovSZDX/7QRaTi2w39vkP8/sgsmm9ILtyC3er7fCHr4J7vwB/Bx9TBU1fzhsZkVfZbFsp8a5C3KfSgYPyDe/Bu5F+Ynst96lntfAujw4Vwg1JMEIYVcpvzgMeGDZvsgQ438abB+sbMuKQePGYyIXlzUEKQMqPKMOo0UBbrj9SBfCbXWjbZEYxsycu8fadGe6Ll58nco2MrVsDdbGuwOIZUqOPZBiMgly5JM2F8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(186009)(451199024)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(81166007)(33656002)(36756003)(86362001)(40480700001)(2616005)(6512007)(5660300002)(966005)(478600001)(54906003)(53546011)(110136005)(6636002)(70586007)(6506007)(70206006)(316002)(6486002)(41300700001)(26005)(336012)(8936002)(8676002)(4326008)(47076005)(107886003)(356005)(82740400003)(40460700003)(83380400001)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:52:11.8577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fd1e72-27e0-48da-9b2e-08dbb32a7feb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8951

Hi Ayan,

> On Sep 11, 2023, at 22:03, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Henry,
>=20
> On 08/09/2023 23:15, Stefano Stabellini wrote:
>>=20
>> I committed patches 1-5
>>=20
>> On Mon, 28 Aug 2023, Henry Wang wrote:
>>>=20
>>> Henry Wang (9):
>>>   xen/arm: Introduce CONFIG_MMU Kconfig option
>>>   xen/arm64: Split and move MMU-specific head.S to mmu/head.S
>>>   xen/arm64: Fold setup_fixmap() to create_page_tables()
>>>   xen/arm: Split page table related code to mmu/pt.c
>>>   xen/arm: Split MMU system SMP MM bringup code to mmu/smpboot.c
>>>   xen/arm: Fold mmu_init_secondary_cpu() to head.S
>>>   xen/arm: Extract MMU-specific MM code
>>>   xen/arm: Split MMU-specific setup_mm() and related code out
>>>   xen/arm: Fold pmap and fixmap into MMU system
>>>=20
>>> Penny Zheng (2):
>>>   xen/arm: Rename init_secondary_pagetables() to prepare_secondary_mm()
>>>   xen/arm: mmu: move MMU specific P2M code to mmu/p2m.{c,h}
>>>=20
>>> Wei Chen (2):
>>>   xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()
>>>   xen/arm: Move MMU related definitions from config.h to mmu/layout.h
>=20
> Except for "[PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to he=
ad.S " where I have a small comment, I am happy with the current set.

Thanks!

>=20
> I have made the corresponding changes for Arm32 MMU (See https://gitlab.c=
om/xen-project/people/ayankuma/xen/-/commits/mmu_arm32_on_arm64?ref_type=3D=
heads ),
>=20
> and triggered the CI. It looks all good (qemu-smoke-ppc64le-pseries-gcc f=
ailure seems unrelated).
>=20
> I have sent out the patches for review so that the maintainers/you can ha=
ve a look and review them

Sure, me and Penny will have a look.

Kind regards,
Henry

>=20
> ("[XEN v1 0/4] xen/arm: Split MMU code as the prepration of MPU work form=
 Arm32").
>=20
> - Ayan


