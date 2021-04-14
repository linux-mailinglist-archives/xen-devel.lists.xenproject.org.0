Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0335F277
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 13:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110525.210971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdid-0007MT-S9; Wed, 14 Apr 2021 11:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110525.210971; Wed, 14 Apr 2021 11:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdid-0007Lg-Mq; Wed, 14 Apr 2021 11:30:03 +0000
Received: by outflank-mailman (input) for mailman id 110525;
 Wed, 14 Apr 2021 11:30:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF16=JL=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lWdib-00077W-NS
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 11:30:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::613])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cf8ab71-310e-4d43-8fc4-fb8195fc2b57;
 Wed, 14 Apr 2021 11:29:59 +0000 (UTC)
Received: from DB9PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:10:1da::26)
 by AM0PR08MB5298.eurprd08.prod.outlook.com (2603:10a6:208:188::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 11:29:56 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::ae) by DB9PR05CA0021.outlook.office365.com
 (2603:10a6:10:1da::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 11:29:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 11:29:56 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Wed, 14 Apr 2021 11:29:56 +0000
Received: from f17e551cd0cc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59110E80-2119-4219-8800-224243954ECE.1; 
 Wed, 14 Apr 2021 11:29:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f17e551cd0cc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Apr 2021 11:29:46 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1629.eurprd08.prod.outlook.com (2603:10a6:800:4f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 11:29:42 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 11:29:42 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 11:29:41 +0000
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
X-Inumbo-ID: 9cf8ab71-310e-4d43-8fc4-fb8195fc2b57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/VN/GoQKR6zPj5D4Kg4MdD4GzHVKmR7F6Rx58LTb2E=;
 b=rDE3QfXZp5wxgeNUvYUWbtrGVL60gcIvzcy9sO1Ovk2A53WvdUuREHvqyuUlMxqzs6TEQdr8pGpfWBOiE0FHK3d8dB0vSCpshWG6ouhK81k1e7ws0HGfr85zImvtXIQFT9ZaabLpGfzDOohklyd7cs9qNAFvZiC7dO5KRGf8+YI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5eb48d41946bce8d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doeqdN87xrQskHcboqecBQWRylIvzZxucjEqW21FnYu9ClSQ9DaWWm/a8XG43ccblzgcZxCvmQDf+k7VuAW1X9IViGULg3OktBDGWfJ+Fav2yUiLbZSNEhw0il0JzljO640uGFunBrGDTGSoPH51nxx1V2r72/XLDBk6LM6aIzYmTswU3Z/dYeStmamqqyc7RLK1BumKXHE2p+Y8O3y4Xy0ZpLoG6vrWOGH5WeUH1o5o2i5TRONR3YVpIQ8FqvJTImCTG8UgfoCaqv5jJXme+YSymS7ie5cQTTo6NTXSiLKxAr6xoVwe5Vlt24Mx3pmb5H1+p3TCywXEqSeg+mc7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/VN/GoQKR6zPj5D4Kg4MdD4GzHVKmR7F6Rx58LTb2E=;
 b=T/nGOUcachSsHHcBUdywpuIM83v2tc1fjbg8SOZaF41dVUfDRXNNuJX1N7WE+GpL3iFHOW/scHFpvAeF9vxVURuIgdd2KOjIDyN89PHT24R3i6C0Qy82mUzBha5mL6zbcawmSmznmwwXszszHot/zaR7y7iBgW+sRZ3bqJW+LA7AcDMsP910B7jtH4rn4PF/anRV3NBHZ87X5tNJfWU+rND81TPH7BSf5rq7aJzpQIWry+COi6fEhhWhlNj7d4WuOucV1C5hY1cAcUMuxvNhsev8VeJ9lKwb7SZH87m6b9pb3Z43ZEjm0Cn8hetap7u9+rUo7T7k0gE5g+YBGr+C+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/VN/GoQKR6zPj5D4Kg4MdD4GzHVKmR7F6Rx58LTb2E=;
 b=rDE3QfXZp5wxgeNUvYUWbtrGVL60gcIvzcy9sO1Ovk2A53WvdUuREHvqyuUlMxqzs6TEQdr8pGpfWBOiE0FHK3d8dB0vSCpshWG6ouhK81k1e7ws0HGfr85zImvtXIQFT9ZaabLpGfzDOohklyd7cs9qNAFvZiC7dO5KRGf8+YI=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v4 2/4] xen/arm: Handle cases when hardware_domain is NULL
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <3424d24f-b189-c125-7b84-96848bbdcfd7@xen.org>
Date: Wed, 14 Apr 2021 12:29:34 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <04326BA4-6E73-44BA-AB19-8F2B99000D8B@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-3-luca.fancellu@arm.com>
 <3424d24f-b189-c125-7b84-96848bbdcfd7@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::20)
 To VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b919a276-dc0e-47c2-4cfd-08d8ff38a19d
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1629:|AM0PR08MB5298:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5298D0C6D19A3280D95B85E3E44E9@AM0PR08MB5298.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5sji58McAD1kQQ6H9bzd9cH+4FysWQi4I/++ZxzsO8mEkJ6F4T0zo4VmPrF9sZjmxQTdWSTc7zYAPW/fS1Ca3dvSEe39KxXal+q9Momkv6jHWZ6okXgLBZEqzXhuH0t8BEopNyNAMsaXSZOuY0wKVK69imTSOoVO9E2HLyoPYSXKy2IDN04bZurExejpV+RStQOBr6kR+u+Gr0vCCpANnOFtkNqvxJtR/cHzCcrzSoeItdmoB7oYsEUOqQgdskbzRaHanmUM3hxjjE8vK37iR+qkfarHikvthI65dtig1uGkFxHOce3L3gCtFClzkogkvtf9DBinnDKvhQpE9mNfN0XRqiAGqr+2UcOjHk7fBvmqRcQC17Z0w23u/gU2Tby90ko9tt9oT3el54xQUPfCuRIaF7VxfQG3XYHKCtDM+1OO+gScCMYnLDvzdB49dvwJAElU/b1cTVW2etkCqI7Nhd/vjec98Z17zz6D6BZgxbAOZE4+Dj7xkFlGbMSKZ+EfImX2MWACTkUsH/vMZWGdMN56yWuCY8o/tfaflKPAWnM5ltd8+zG2KckYd68HuSv/1wuvQJoxSakwFvNQ3/YFuP9cXNaQcILGRUb3aRhDjpDNorje2Dm+kTUYPEXiLNJUFCjlaX2FkgtveBhQTOmaoiYjcDsSpk4SLppmhnLw5pkV2DS4ShnHof5mbB2v2rMm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(186003)(7696005)(956004)(54906003)(6666004)(6486002)(26005)(16526019)(478600001)(8936002)(53546011)(66946007)(33656002)(2616005)(83380400001)(44832011)(316002)(66556008)(38100700002)(6916009)(66476007)(38350700002)(2906002)(5660300002)(4326008)(8676002)(52116002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?hLW3PpypUx+VNC2MuFeTZnvLtot0jYMsKBGVlFJALQIoXSmIjJN7sQtGd6oN?=
 =?us-ascii?Q?JRTYH0s0jX/pa+Em3Yvc2E0xnkVKTKINiEehSzLogAA2X/BYEkN+Twmshich?=
 =?us-ascii?Q?trys8SKn+YChRdgakOh51xQ+cKq18VceNr0E8DgIvi7X6clQPC8o8Zr561Nb?=
 =?us-ascii?Q?dIcrP3wKl+OnVxqu3G453A0iH83ii0zKlqhaTOaBIq3kXOmscgSDImaWwyNf?=
 =?us-ascii?Q?41PDDwITGky9Ddp7ws/qlC+2s2hOnPOKs57hi/EcmaQPCzCKXtsITNU9jomD?=
 =?us-ascii?Q?t2b++26oFlUPmsRiB1/moSeOZmgAp7tf2CzmT3+jTE5nkbrnF++1aqm1Jf0K?=
 =?us-ascii?Q?0JQ6PkiFnAjhphmgKd8s9MG/bUWQzodkNtBOHT6pcL/4TO3tO1VCeB3DQh27?=
 =?us-ascii?Q?YQ9rIIYAiq0Tycl3KRQ9c0W5lZ7AkiLyiPIbnqMASfORWE5hM0Hp2VI+mPtX?=
 =?us-ascii?Q?bSZsVvdEPvxJHUllSqmqmihtCGlhGJY5FG4STjZ/gXMjN2BF2OOq205vL85J?=
 =?us-ascii?Q?ySH4OiUH2JddzGwdT9qNjk9EWElzFEd3ggEa6dzqhVr3nVN6GKIAXY4iFxbq?=
 =?us-ascii?Q?6oosAMb3oh1UmUeuQlUqkLvy9qZwTOAaxD1mknqhRK9uwRkIRmXQwF7dMxWH?=
 =?us-ascii?Q?rLicnAXkagXO+/TrxYQLKlqxXaEBIRmp9m+uri0NXad0L5PSdudLXbS0Swk4?=
 =?us-ascii?Q?r+rBaoz6TMvqfNfQO+tIzmLFpYfztBg7nRbDN+q0Aoto2JT2rdaX/z91eIuq?=
 =?us-ascii?Q?oZ2DMLhev9jzCj7vQMjXnTbRXJ3lmVZtjXt3lt6hYhCnyMjgQQFsOtuvQFRt?=
 =?us-ascii?Q?xb8dYmTP0B66RL8wv+CCe8jf32fA/1wYVfkJQpXIQ7ye+lYUgYbXeneQB2g+?=
 =?us-ascii?Q?HRUlpI2ekfDvbDlV+iq5tH/4ceUu9IY12Aesawvw5q/Urot1nyM3lG2W+j0J?=
 =?us-ascii?Q?otE7mlWPY8BDLzzZHJnoDHOWI4jBw/PP4xoGNz8XBCqnE4iZfmJmo8m/R+8r?=
 =?us-ascii?Q?4+M460KZ1qFxodMyyUMRHXLZ181p+0QO80CeLxnP4Nqu94+SonDHQ9+tALfM?=
 =?us-ascii?Q?fDSe7JXhdbiQXtwkmoZkmYak8I15nYmf7TxP8vt8GV19WVbqiSI2tAkt5+xx?=
 =?us-ascii?Q?PQT3gddHW4z68ktFjaivnFswmdiFplsq7ZdEQtZAfK4575RClxrVjsQj5COX?=
 =?us-ascii?Q?4bM0biMz7F5vUWevqKyrXr1n4qxcraZ7C06T9Dk+wgnbm+COJxf9w54dJzlP?=
 =?us-ascii?Q?KFLJpNJixrLQNJGgKM+ixoAhhBCaQkDPM4wKSZLe2/Y1K1IejZ7K4SSnDqrO?=
 =?us-ascii?Q?bnVyFcABHx+hqR7W/wu1ffXP?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1629
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6cc2bdcf-4473-412f-b0be-08d8ff3898fd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SU8s2PXMS8tDqNXrWqZ3cmlJxfS/kI4Mq8otRuTFQ0jR6QQ5Cg8DIEAcwrrd0/zi6BJ+Z2H0/BHtzA16sH6tNwqiwR+Lj7A+yhYgjrJOiYz2wRMJl10F1TYhBWjpeljhQqs7XcxE/IvWnBjriN/JEGa4wjJg6/dCRDvdcMczvRTtwmconVE+FjUdQE7zrIkjFkLZQ/HDchal2GHnfpVurJQyjQxcTd6tdrlhl1l2x4i+gKuZahjyxXiOYRlqm8yByMkgjdvu2Qsx/LSISiMiOZfRjc14c3xpOvc7fJ9tNKErz9RUs76O8zGojiWgCZLuRJdx48PCuzc1k1gF33ePk56v4fjqMNU+a0WcHku3Nd1J+YVUkfCqHJfn0uhu/nuQ0OUnWfE/TUoaXaW13/WH5ubbrZspFul+INUxyi1qrxj1r8aZ4Nvd0JhlWwzQbUIidmbDctNwMAKnsp+1f2uQnuYHWIStKH+Lft0LE0EOwj+rD0DMi3VRJl+jejlAls7UHr5cRrmr0B8Drv21pXy6FbTAxl0hDDFR0NgNhAFPqm+yHgwhORyXSKxc01acueBbY8pRcF7o/zD7uL+nqx4znB+Lz2q9rIAoJXEor3pBmFN5olOXdtiv2/zILYICqC2L3iWgzXh1YldXcxTdhWbYp2Tk8FjQs0WyLAy7qNa0a2M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(44832011)(33656002)(336012)(8676002)(82310400003)(53546011)(70206006)(2906002)(6666004)(81166007)(2616005)(5660300002)(186003)(8936002)(26005)(54906003)(6486002)(70586007)(6862004)(36860700001)(47076005)(356005)(36756003)(316002)(7696005)(4326008)(83380400001)(86362001)(16526019)(478600001)(956004)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 11:29:56.7552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b919a276-dc0e-47c2-4cfd-08d8ff38a19d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5298



> On 14 Apr 2021, at 12:16, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 14/04/2021 10:14, Luca Fancellu wrote:
>> Among the common and arm codebase there are few cases where
>> the hardware_domain variable is checked to see if the current
>> domain is equal to the hardware_domain, change this cases to
>> use is_hardware_domain() function instead. >
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v4 changes:
>> - removed unneeded check for domain NULL from is_hardware_domain
>>   introduced in v3
>=20
> After this change, this patch is only avoid to open-code is_hardware_doma=
in(). Although, it adds an extra speculation barrier.
>=20
> I am not against the change, however I think the commit message needs to =
updated to match what the patch is doing.
>=20
> Can you propose a new commit message?

Hi Julien,

Yes I agree, what about:

xen/arm: Reinforce use of is_hardware_domain

Among the common and arm codebase there are few cases where
the hardware_domain variable is checked to see if the current
domain is equal to the hardware_domain, change this cases to
use is_hardware_domain() function instead.
In the eventuality that hardware_domain is NULL, is_hardware_domain
will return false because an analysis of the common and arm codebase
shows that is_hardware_domain is called always with a non NULL=20
domain pointer.

Cheers,
Luca

>=20
> Cheers,
>=20
> --=20
> Julien Grall


