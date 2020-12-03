Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831FD2CD4E7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 12:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43375.77974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkn7V-0008UV-BA; Thu, 03 Dec 2020 11:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43375.77974; Thu, 03 Dec 2020 11:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkn7V-0008U6-83; Thu, 03 Dec 2020 11:49:57 +0000
Received: by outflank-mailman (input) for mailman id 43375;
 Thu, 03 Dec 2020 11:49:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lp8G=FH=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkn7T-0008U1-Ja
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 11:49:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.62]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e0b4539-3ea8-4dba-a7ee-ba8cea05c117;
 Thu, 03 Dec 2020 11:49:52 +0000 (UTC)
Received: from AM6P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::29)
 by AM6PR08MB2965.eurprd08.prod.outlook.com (2603:10a6:209:49::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 11:49:50 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::75) by AM6P195CA0016.outlook.office365.com
 (2603:10a6:209:81::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18 via Frontend
 Transport; Thu, 3 Dec 2020 11:49:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 11:49:50 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71");
 Thu, 03 Dec 2020 11:49:50 +0000
Received: from 313b5f7836c1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A6E3DC77-2FED-42F6-965E-2B9D96CA055E.1; 
 Thu, 03 Dec 2020 11:49:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 313b5f7836c1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Dec 2020 11:49:44 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5483.eurprd08.prod.outlook.com (2603:10a6:10:11b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 11:49:42 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.032; Thu, 3 Dec 2020
 11:49:42 +0000
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
X-Inumbo-ID: 2e0b4539-3ea8-4dba-a7ee-ba8cea05c117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl/NRmHDmxQaVqoLAx3cifSnwO2lV9rCIJZ7zKBLR/g=;
 b=1rixW6atrJJzBpdW3l48D+FfPO2RoKOLcdIFcqTfXj8TBLN2Lqn4E1LHCt2Z4IfQ0b8+oaH5H7fkN9pqWhBmlFYdupqZRnrZxIxQZzCNfbwR4OhCIn6Nk/4VtnE+ZFa5pHykbbC8G7liZZLvxp4w0zAQl2qrTOeBqKWoZMvKpj4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d42a9bc30ee15799
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kios/xh+ln7Fv/Eggimi55OkNWM191m0xWBYgI80hmTTdNbeGzZENhB3RJyK+Wtom8EtQSWIS3yP6t89GQnjSSR4xZB8Z0qlblzP5NeOF2eCMrUx4vjDwrsKCNRa0HiRWIG0vnMbMul9pQ3NClnuoCQehGK7BEhf0/H8TylXzvfAeEzgjOVhTwZIn4tafQ/P/eeriKLi+C/Ste/qIxldtyVHEQvyOMxXLPKRNIJtAm4nJJ/aKjSbGRTlWjaSCFtkvPRYWCfp5bl1KgDsfLzW1wXtArn9iNqBhyJ2jEt5B0IOuYFtud5Q8xkbubD8GxzXu4V4/0ylU6TzCQ6CZB0wXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl/NRmHDmxQaVqoLAx3cifSnwO2lV9rCIJZ7zKBLR/g=;
 b=nDR1zGAIbWDe7j2vm9IVmZMc4Feu340IK6sAOuZRgHr40zB1YEQraVN4g68O4cLAJr8lTWhaHZnK7XB8ng20D2nr4gwP4ErKyDfFv+ZJHdjEQSYYtPtGJAS06lhDvn357FLc7CMG2yDQOb1MC0Wck6oJUN6n3ZpF0K21n6hXrRHTftscDRewsXiaLsq7+ZfVH8gFxDykDmaPkrzQS7BBNn9ohd3TuMTKDZF0NJGTbcQEaQl+8684uBIGkMM5BHK0r5qeGQZR5HP327QhiPq63Lz+CX+HDQiXTO85vbn1HPQKpRkIdy3z43BZyyqd3Vu3NyVrtyvYFe8vJwFuAfSWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl/NRmHDmxQaVqoLAx3cifSnwO2lV9rCIJZ7zKBLR/g=;
 b=1rixW6atrJJzBpdW3l48D+FfPO2RoKOLcdIFcqTfXj8TBLN2Lqn4E1LHCt2Z4IfQ0b8+oaH5H7fkN9pqWhBmlFYdupqZRnrZxIxQZzCNfbwR4OhCIn6Nk/4VtnE+ZFa5pHykbbC8G7liZZLvxp4w0zAQl2qrTOeBqKWoZMvKpj4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/8] xen/arm: revert atomic operation related
 command-queue insertion patch
Thread-Topic: [PATCH v2 2/8] xen/arm: revert atomic operation related
 command-queue insertion patch
Thread-Index: AQHWxBX9ux1e0/RKik+PTdn4Fk42F6nj2m+AgAFyKwA=
Date: Thu, 3 Dec 2020 11:49:42 +0000
Message-ID: <3CA139F8-4156-4637-8986-84351C3E1400@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <4a0ca6d03b5f1f5b30c4cdbdff0688cea84d9e91.1606406359.git.rahul.singh@arm.com>
 <39a9c619-d7b2-eca0-688c-5f35546e59fa@xen.org>
In-Reply-To: <39a9c619-d7b2-eca0-688c-5f35546e59fa@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4aa07cd-4713-4cc1-4852-08d897818aa9
x-ms-traffictypediagnostic: DB8PR08MB5483:|AM6PR08MB2965:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB296533392824C6E61C95AC2FFCF20@AM6PR08MB2965.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B7pbjYLkiyhrz98ExJ9jp/O5jZvXXlN04BJA/ELRHdZkIKPzEP5PtqrX9mQsmAFj2jbe2Y41UJdbNT7hhljdqfJ/luuHNjRo9FwCUqMte0n38vba3Kj0d7J1TqjELwxaB4xch8DSnA6/SE5Weypyg4dgvOzAGgaYProYB1/Z7pou7pC059gZ5mkVZ7+61wbGEb2KBx7/SB0WjpDom98WTxlHyTwifVIoMYf170ONvEHPugNbp6qY7cgUQ3i9RTCyTmI2OPTGEfcEYjtgyjrzKklfS1WzmlG8NJ/iIf43ZxQxkE0Q+nwxqV3e5OB5IopAbb8CBYV2hS4njmKprGvYZZG4hwpH42uzpGq6q0pRE2C9Y3yySJe54ccWyQfQZ5bO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(66946007)(6916009)(83380400001)(4326008)(6512007)(8676002)(4744005)(6486002)(36756003)(5660300002)(8936002)(66446008)(76116006)(2906002)(64756008)(66556008)(66476007)(91956017)(86362001)(54906003)(71200400001)(186003)(26005)(2616005)(316002)(33656002)(53546011)(478600001)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?D35RhRdul0c5JBk9FXFTIyHFFhgXo04pVXm2Gdeiu7oYA4k/5eiZ6pWCGJVP?=
 =?us-ascii?Q?Vq+7PGzC71jxdcPvbA/zfI+yVOtS/On0bwM7Xxw2Y5qtdXHRI6MGapuyA/+7?=
 =?us-ascii?Q?BXOAu7rChSaGBBzg45a8+Nw7/80e4pzY/ssijkuUauY+bF/W+VZlqe8pUf3o?=
 =?us-ascii?Q?nJlkitbE7N77PyhzT9G45bSwBn942twGJ5hQTQDSNt82qVQwGjyeCKYllK3t?=
 =?us-ascii?Q?2I+W0jVFVdDXSXnsGW7kqIdA8Q90mZupz6NC8/SuXSt+MUxUzERanPMUzpVe?=
 =?us-ascii?Q?Gj4riqzB0nBFuF5ILI1flkWePW2piwXlB8Exl9K7QZ4gAKiWo9tOHQ1Wo885?=
 =?us-ascii?Q?+OlcqFDhlb00ovg/hVnP/5BF3KqB7ObHr6sqv2XoKXgausD4RggiLSKSlRXv?=
 =?us-ascii?Q?EWAx64uit2IqdiyUcak17qiaMfAZ5SNd21bi8qkRAUsdSgKmpMOxsIwCNg4G?=
 =?us-ascii?Q?SSw237EkNE68IBzGA/PqIZD572fKpSehmWPPxqufY96E9yFil1KK0uw0cPI7?=
 =?us-ascii?Q?asjWY4nc82tlMqTVXV2OGfv5bZCu9SyGlNxBW2/5UbVvEKOLpf91LmwzFNFt?=
 =?us-ascii?Q?AgGulBA/s4GPBf59EnqPRtLNcYfG5zekm23dsQ8fxeybCHEdFQi0nghVGJ+X?=
 =?us-ascii?Q?dXNzMxDSXxoIEZOnGSBdOPVXwLXkjPAiJZbwgEtl19tvNAbqGRCRwUBo0mWC?=
 =?us-ascii?Q?2jNCO8JxrILtrPu4PyoNIVK8+H3/396gG7jmAripm8WMRi9mTMjG9tSKjQgb?=
 =?us-ascii?Q?IFQuiDfK1JlrH+NlsC1+qpf4XFisJDGPETN5zw7Gp3EJt+eDXAMiqtotSPk5?=
 =?us-ascii?Q?UK9zw5v3CMAASN+GbjiwcvAN5VL1gZpg51Rq/FWqN03pxJ6o0UGdrdh1igLq?=
 =?us-ascii?Q?2CHVTFuTKFyF054BktvMnpNoC5FtXPaQIXT+yDCQ38D69saPX/wWGUprtRje?=
 =?us-ascii?Q?g5pP9TN2OiKLIRwNdMGq1EqwiSZ4nbGDgiJJmA1kKPBcEwAEhOERUgjkFc6o?=
 =?us-ascii?Q?1sxW?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86C657322E75434FA8E75396A88EF856@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5483
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71ed074c-f59f-49e1-4911-08d8978185e6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tp5Dj3m/HhZ8OOO566UGpkvx/TBH2GBxH6D6T+WFDhoVxvkxoC6jlQAAP0vYNWL4ThaRy3Lp77L27mqZ1GX2Rt4lELBgH5sRWVB8v8li4x+8Kf8GR8bGlw4qXNtI18gKnCFbR/ZplNUWDIQEHMwhwMHHJRtuxeelu0WvAytyaUzIHDyTzhn+gTRvL48zfQByTl66uXKdXzjgEoHI8fCtkkrQ+SXJsehGBykkVBSB81mNZO2DnWFTe17/1tX44njkg/p6jNuSQWkOv8J6llU0kA4xGWh4H9HTh/90HB8lG/RZ68FCkbZlQIMZJiMs5tLtgn6IATorN2FrhXWsRprv/bL0Itc6cpWBzXwP+PMzp3YNqi5snhXELulaeN+TKCAC62GFQCSdNYq6u/6ZoRxIYg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966005)(36756003)(70206006)(356005)(47076004)(82310400003)(4326008)(107886003)(6862004)(5660300002)(81166007)(83380400001)(4744005)(86362001)(8936002)(2616005)(336012)(33656002)(316002)(70586007)(82740400003)(6512007)(54906003)(6506007)(53546011)(26005)(478600001)(186003)(6486002)(2906002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 11:49:50.4561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4aa07cd-4713-4cc1-4852-08d897818aa9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2965

Hello Julien,

Thanks for reviewing the code.

> On 2 Dec 2020, at 1:44 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 26/11/2020 17:02, Rahul Singh wrote:
>> Linux SMMUv3 code implements the commands-queue insertion based on
>> atomic operations implemented in Linux. Atomic functions used by the
>> commands-queue insertion is not implemented in XEN therefore revert the
>> patch that implemented the commands-queue insertion based on atomic
>> operations.
>=20
> This commit message explains why we revert but not the consequence of the=
 revert. Can outline if there are any and why they are fine?

Ok let me try to add more detail.
>=20
> I am also interested to have a list of *must* have for the driver to be o=
ut of the tech preview.

Ok let me add more informing in the commit message in next version of the p=
atch.

Regards,
Rahul

>=20
> Cheers,
>=20
> --=20
> Julien Grall


