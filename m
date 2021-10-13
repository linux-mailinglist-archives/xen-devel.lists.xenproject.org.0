Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAD742C22B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208526.364679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeuh-0003ej-U1; Wed, 13 Oct 2021 14:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208526.364679; Wed, 13 Oct 2021 14:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeuh-0003bv-Qq; Wed, 13 Oct 2021 14:07:23 +0000
Received: by outflank-mailman (input) for mailman id 208526;
 Wed, 13 Oct 2021 14:07:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kt2p=PB=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1maeuf-0003bp-QZ
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:07:21 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08c68fa6-b936-4fdb-add1-891e8b6575cd;
 Wed, 13 Oct 2021 14:07:20 +0000 (UTC)
Received: from DB6PR0801CA0043.eurprd08.prod.outlook.com (2603:10a6:4:2b::11)
 by AM6PR08MB4641.eurprd08.prod.outlook.com (2603:10a6:20b:d1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 14:07:16 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::8c) by DB6PR0801CA0043.outlook.office365.com
 (2603:10a6:4:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 14:07:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 14:07:16 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Wed, 13 Oct 2021 14:07:16 +0000
Received: from 228b45dae248.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81B96E6B-5DC7-4DD4-BBD2-FC23BA1BAEA8.1; 
 Wed, 13 Oct 2021 14:07:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 228b45dae248.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Oct 2021 14:07:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6576.eurprd08.prod.outlook.com (2603:10a6:102:15a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 14:07:03 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.030; Wed, 13 Oct 2021
 14:07:03 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0255.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:194::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 14:07:02 +0000
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
X-Inumbo-ID: 08c68fa6-b936-4fdb-add1-891e8b6575cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfA6gMJ2c8wdENhSn5Nh0dqlqb1eWZfxEowzKo86LGI=;
 b=klK4fGWMTwUbN+ONriM/syqDyIYvlrZQ+fnyQz07NUv0qU3DmpwU8EZHeAQokbAYfsTpCwPTNRYQiFQabJDB0EGUSWV492fOVOaQ4S96cZrL83XSFTlyEj2B1bhA3Qd3/qL80dhIycIzV012ecjnWBJG1N4SAWjo+6IJP+cC0A0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83c91f2ae6ef9177
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJtCoyGtWE6yIr9GyQ/4ajeoX8a68FDY1izUyMFy9oAVUuLJ6GuTudS/QP8OHH5Ck6jGsKk+VNhJ+eHQ6i5WSPfHMtehDtTjsd/UPkf2pQljmA9vW0RnrvshGCRdiJNr/tTx35M3u6VFX5ALSZiMF9tV+1d+whBM+Y7oRUJapO6PonLB/T64Siye38XsJGE5bHMr3rWIBD/g/Y1k3vvaN+Nm7U6n+8AWzLRYiXpWvLC1oRRlMSNAj9UynM/oKF1hdW6jlQRnrfYaLpihIuF5ykp8fSOS5180lw4smBwoNtqPDH5Gm0T0qPXgKKcTqqTFwgaxcWOFpcm3lkXmki/tRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfA6gMJ2c8wdENhSn5Nh0dqlqb1eWZfxEowzKo86LGI=;
 b=b495Yd03x5Wez0DW+4/XExLJ2BZC3EnfIdVz2lCsHJBGw83pB1BaAb3QZ+4AGco7iZBjzGdRIrTMwDJ/m8nu617dk5yBdoKt2S9HUaweB9HCtr6rw112JdfOYsnB2mECCd2VrZ7T3JKIpIejjFHJDs+6HOJ2zNWP0JRBKxkolZGTN+oBLVaE/S1RK0w3vlD3mRf8bJsKNxZBTxfVTjQUINnNDlmLfNV6/6VVHA96/LKyPZNwA+E7OmvhyyEHQVRFEbJiD9YV1ZVKXZywzvhFIRmL5ogX22T2LiycIDVDhzHttAXpYuwexWD70VK8mbmLMI82/5jklXOtNRF4v4l9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfA6gMJ2c8wdENhSn5Nh0dqlqb1eWZfxEowzKo86LGI=;
 b=klK4fGWMTwUbN+ONriM/syqDyIYvlrZQ+fnyQz07NUv0qU3DmpwU8EZHeAQokbAYfsTpCwPTNRYQiFQabJDB0EGUSWV492fOVOaQ4S96cZrL83XSFTlyEj2B1bhA3Qd3/qL80dhIycIzV012ecjnWBJG1N4SAWjo+6IJP+cC0A0=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] arm/docs: Clarify legacy DT bindings on UEFI
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <a31231e3-a1eb-0e1f-59b8-75677d5db51b@xen.org>
Date: Wed, 13 Oct 2021 15:06:56 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <363EAF93-1165-4515-A582-B40B6115FA71@arm.com>
References: <20211013121929.30784-1-luca.fancellu@arm.com>
 <a31231e3-a1eb-0e1f-59b8-75677d5db51b@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0255.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::8) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cd52801-dda9-4c10-275d-08d98e52c349
X-MS-TrafficTypeDiagnostic: PAXPR08MB6576:|AM6PR08MB4641:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB464180E957B65B8DA4D7707AE4B79@AM6PR08MB4641.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TGBD57ODc+uF43Ign5rJP03T3SgkSZczIP+/jHBFb7SbgXLSNS4mU+NVhpgna/rHOcubp7wWPUqyoZUUh2VSzfuAh4cChqTSpm+IXO52xFSTt07VSlgouydAN0q3+YRQkbpVLWTmdLSHo98VPOuDpMKSTqCTdhn7b5RpTaXdFuTgyhf1knH0O/qxne2MoBdA5+Oq1pR4qLFDWTFGWCWvW2ruKxf+P2eaDX8gxHf5K3X0U22yzPlDbvnOCnFaIR6C3AJ5NYGJXKE4yjUkKwYJLbUNDaJhdblIpfKARB2Tk22eGK5f6DmdiyP/bh3XP8qv9sRJmW9u/PsXDQwSjV9gtugDCISkbvgvs8nx95+nBM0Gx/vDjq3voyEYJzi1b8BjX72oA/d3HN6ifNG00T+YNeVVaspBBBodRxoaaFY1Wwl6/f/G/Hf/6ze8dtc7TjFiDZk3O2JI9OMIaf9nBZawWbPSZbr9NoaY8byTGot1YIpqF4ole4DGVj98rmV+Kl0qINpbPvkvzaV5194amAmCg2dkF0Sm3ionL2r0lCI0TvU9KEhLO5JbwqhBB/myWi0vBSzL1eDXmPDdaws4CSPyx5bwCKrCxO837kFVhG9oyjRuKoLr7cTGeiANuYj8mUAO6xoOzD39u7qNXwNuwmMIPq2oM3G3Fjct8dqQ2jt03nepVKrFBMyjopdrdQFarCW8cVi2oqEkw78DqBymJ9QzMN4+MHpT73MOjSpiDvUS9zc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(5660300002)(33656002)(36756003)(6916009)(38100700002)(38350700002)(6666004)(2906002)(66476007)(66556008)(316002)(6512007)(2616005)(66946007)(8676002)(44832011)(508600001)(53546011)(6506007)(83380400001)(86362001)(54906003)(8936002)(6486002)(26005)(52116002)(956004)(186003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6576
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f33acf6e-59d4-4bc9-9b93-08d98e52bb24
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A+JUhCurm8eOJiDr3aS3MHtK0vC07XRz5c/zFRAgnLV/yBIqGpxz2yzkI/hHf8DuXKthSu7zPSKZfoNhzyIslNKAfhOzi80gfCShrwFLaYPuA8ZR9s3yKd3mHAoSz0els0qe/wtAdgqd0AqYOsfz+5DLPULfm5bw/4X/EedeWx0hGH7i3ABOcFSzxsRuYJlXVLjALVHhvzCsOYyzPVhVIASWfTcqP+RIlFUFZaKVafNxYovKbV18wRbDPBPdSM5uoZT8Vd/Nbt5A+jRkdeKGMk8TkEswr0EZZ1xM5yC3y5zqh7B8jkrim1YpSgKMnJ0mEV25RgsWghGLa89nYIRWmapu+xLreOgjCTfqIFeaBWF3fVkl4zkWtXJh/HrIRgBkD+1NWC2JIftKrMx1vfwhV79kXEEezH8cNORuSM89rlBt5N0Px1U5eMJbL3VuLFKbz/kkBB9+tygHh0waMIANF7NOEDlhoIhJFd6Dto8BMAmEZhqMnNZaxnmpvGIOIxoOmZLo/jqgUKcbCAIYBDMxqZMvwaqr0YNjkCJ7NjSzLTnV38p4YRzV62dORzNW1S5mQfPqamJrvh8MRLXTC3hhxS3UgTRxLvQuV5x4XnsS9VfFdcRwt3i4XXL2W/Dpl9o4MpxHFUs0Cd6qN4yRT+KQVyAaPRJi3NcWW6gR90aRWI0G+qo0qjzWzCSRUzvqH4iP48Ma4UogqMp6bGrIJSVgJg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(36756003)(5660300002)(186003)(8676002)(36860700001)(6512007)(83380400001)(44832011)(53546011)(6506007)(356005)(33656002)(508600001)(107886003)(6862004)(6666004)(336012)(81166007)(82310400003)(2616005)(86362001)(956004)(4326008)(54906003)(2906002)(70586007)(70206006)(316002)(47076005)(6486002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 14:07:16.4369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd52801-dda9-4c10-275d-08d98e52c349
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4641



> On 13 Oct 2021, at 14:27, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 13/10/2021 13:19, Luca Fancellu wrote:
>> Legacy compatible strings for dom0 modules are not
>> supported when booting using UEFI, the documentation
>> doesn't mention that.
>=20
> Can you add a summary in the commit message why we consider the legacy bi=
nding is not supported?

Yes what about:

Since the introduction of UEFI boot for Xen, the legacy
compatible strings were not supported and the stub code
was checking only the presence of =E2=80=9Cmultiboot,module=E2=80=9D to
require the Xen UEFI configuration file or not.
The documentation was not updated to specify that behavior.

Add a phrase to docs/misc/arm/device-tree/booting.txt
to clarify it.

>=20
>> Add a phrase to docs/misc/arm/device-tree/booting.txt
>> to clarify it.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  docs/misc/arm/device-tree/booting.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index c6a775f4e8..017c0f13eb 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -51,6 +51,8 @@ Each node contains the following properties:
>>  	Xen 4.4 supported a different set of legacy compatible strings
>>  	which remain supported such that systems supporting both 4.4
>>  	and later can use a single DTB.
>> +	However when booting Xen using UEFI and Device Tree, the legacy
>=20
> NIT: I would drop "and Device Tree" because this feels a bit redundant as=
 this compatible can only be used in the Device-Tree.

I will drop it

>=20
>> +	compatible strings are not supported.
>>    	- "xen,multiboot-module" equivalent to "multiboot,module"
>>  	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
>=20
> Cheers,
>=20
> --=20
> Julien Grall


