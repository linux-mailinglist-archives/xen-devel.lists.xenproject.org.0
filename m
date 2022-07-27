Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E2B5827AB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 15:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376208.608828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGh4T-0007Gt-U7; Wed, 27 Jul 2022 13:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376208.608828; Wed, 27 Jul 2022 13:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGh4T-0007DP-Ow; Wed, 27 Jul 2022 13:27:29 +0000
Received: by outflank-mailman (input) for mailman id 376208;
 Wed, 27 Jul 2022 13:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q1aQ=YA=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oGh4S-0007DJ-7W
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 13:27:28 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20069.outbound.protection.outlook.com [40.107.2.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dab3ea89-0daf-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 15:27:26 +0200 (CEST)
Received: from DU2PR04CA0305.eurprd04.prod.outlook.com (2603:10a6:10:2b5::10)
 by DB6PR0801MB2021.eurprd08.prod.outlook.com (2603:10a6:4:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Wed, 27 Jul
 2022 13:27:20 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::2c) by DU2PR04CA0305.outlook.office365.com
 (2603:10a6:10:2b5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Wed, 27 Jul 2022 13:27:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 27 Jul 2022 13:27:20 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Wed, 27 Jul 2022 13:27:20 +0000
Received: from f102c05ecde9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F44A81B-B2DE-4460-8E59-53B837A6B3C0.1; 
 Wed, 27 Jul 2022 13:27:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f102c05ecde9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Jul 2022 13:27:09 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7939.eurprd08.prod.outlook.com (2603:10a6:150:8c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Wed, 27 Jul
 2022 13:27:06 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 13:27:06 +0000
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
X-Inumbo-ID: dab3ea89-0daf-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mwX98lu9kWL881FrwAkDccxy90awztPBihVj9reTFtHTZUHHC3GhQmLUdwKhoQfykjoV2pFp91LXI0sS+vjSd3vrBlcQKpUS/hs8TvR1U10BJt1nxu3dMbB0bELYBoGvShfLBDyO24+gyeOAB3Kw1V+ERrkzXKXQrPKYrXyY7ghZl7xnR3JT5r1GeDd6Qhkr0Tqmfh4ijfdwt+6unV9BrhKAw7kwdeL+E2QDrDDBSz4uC82vlc6o8D/ygkhj5axEX9S+fxtEcFFF1PzQ3WWbSlswbJqm+4HfOFdqKHIttisogMP9DQw8t+KV1vkdN6avpKzXoS9Tc61b6nVF9cVVMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kow4sXle+3sWRlyVMFxh1A0emb2wKI58TcxvzhzMUGc=;
 b=kdyJXa67MwiUZk/7b0x+STMMZla3ZCU6ujqnd2Fci+bIcyEo0Hmq7DJUpUZTif7nJdt31ckQ1ju1egpY+tLq6j+8mJYZx1MtnHPyCpfeMqlWYY/nGoZrr5qEiGXN19+ak2/j403cPnh1RRmfU20s/qBiI2MvA4/sQwCSvRCEZBRWLLnNE8h10ibBoDGurCREczI92NhOdkRTsfN2g/EkODMDMnniRydkQSOtYDHblujFt1jQCrWPRIoxgmhANmz4nN8x4KqWIugigpUD+lxZQtCFU6mvd1p9xSfzMcGaFRRjqYQcPBpyAUhl93ZwdCJgSS3Hm8vaAHT03CUtTO6lKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kow4sXle+3sWRlyVMFxh1A0emb2wKI58TcxvzhzMUGc=;
 b=583jnbcPwecj4+9ZZKiIHZ9HrnUl2qhqABjB065fl2VE4U0N7VbyTNNn2rCDlHk7+5LJ0Rx9fqSPdgiaAlwRfExEEtUFaAlKa7Cjii4IZShuMXV+wBiNcotjRJCruOTYx9pKSyyhHbDJm4/D0gVZypa9xo2ZgKHXUrTnN/wQt34=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7aebe9e4f5ac8c6a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O88rgpIeDcS3RoqCQ3krTf9L96pp2tViGrEWqvusjnIDdsovTLlYIlHlaEThA2ZWxB6I9jqRGEl5PqMUgXEUCRcIxZ2dXNK1omjYnqNXG+cYDgqlYIb/EPztzeyo6lTZ3eEWPi1RM5KzgO5pzxL5fbyoXNTToHwzF7Wzv6CQOuuXs+b5Gf4OJ9qhCcZ56uGXw8vBiTCA6Avw3tF0ZNESPWr+PxxjFafdcMp5U2RkGu05SPIZNVl6p8E0mTCVyvkxQmjAePg9IQ4fROSgtZci1E2NqI7dqc0BzLO5hf1uBsNO8JYKaoAJ+AcaenXtZ5TdNjq4NYD6ZAJYe0HA4wRZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kow4sXle+3sWRlyVMFxh1A0emb2wKI58TcxvzhzMUGc=;
 b=UmXs7Bnmdv0Wi+8Ibr0rt66kU6hGCmzWko31vTko2uD6QY76Hw7+01EQ7vWjw+h1lCG1kdTEwlH6wd+Sd5gyMh5+Xr9KMBo0bQd9I6ucwKVgUi/i45io+SXiL0ERjBtwcEA4w1MYlSFsKyhf2QL2soQRIUMrdCoigDBsfPcZA968zW6CRWO9nGCMGRnzv2NBATp5lyxemVxCgaeDqW5/H397uZe8IV3ctVBvrnvsfQI4EOVYmNg9iOOycsjqrUky7EQ3pn/s8PlmLYnlwb+mmXA4GIdkbPLNAFAQyvhiZY0ZbKI9bc7Z1Wzd5GHLOR6eaR8QyrO8e24tNIa/B04XzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kow4sXle+3sWRlyVMFxh1A0emb2wKI58TcxvzhzMUGc=;
 b=583jnbcPwecj4+9ZZKiIHZ9HrnUl2qhqABjB065fl2VE4U0N7VbyTNNn2rCDlHk7+5LJ0Rx9fqSPdgiaAlwRfExEEtUFaAlKa7Cjii4IZShuMXV+wBiNcotjRJCruOTYx9pKSyyhHbDJm4/D0gVZypa9xo2ZgKHXUrTnN/wQt34=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Mykyta Poturai <mykyta.poturai@gmail.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Topic: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Index:
 AQHYWlIekEFYa4Z+ZkOKg6prrRxnv60EB7eAgALvxoCABl1EgIBEoW2AgAA0fACAAZfdAIAEm8YAgAGSSQCAAEbogIALO3kAgCQMb4CAB/g1AIABTOIA
Date: Wed, 27 Jul 2022 13:27:06 +0000
Message-ID: <0959FB77-458C-419C-BFE8-A2474517DBC3@arm.com>
References: <0A58139F-CA6F-4E18-B44A-2066AEF0C8F6@arm.com>
 <20220628172338.1637121-1-mykyta_poturai@epam.com>
 <69C0FF69-98E3-440B-9CE7-3025EE5E0E4C@arm.com>
 <53703921-12a2-90cc-55bd-94a4d86a5d70@xen.org>
In-Reply-To: <53703921-12a2-90cc-55bd-94a4d86a5d70@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 367f8cd2-40d0-4698-75fc-08da6fd3bbb3
x-ms-traffictypediagnostic:
	GV1PR08MB7939:EE_|DBAEUR03FT035:EE_|DB6PR0801MB2021:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 R7o0hrNhM00rYLod0YjMisHPx+g9dbAFxNx5JZVYS9XCob7u9Rif9EAO0oNwfrtGZU1MPpMV1p/TlO5RO0lMrU2p9XGt0jIDMqNR8bdH6FQ04Hw0lfLlcKVTKSsXSwtlwpOfiy+Z0b0LrDAiEwXB2x9QixESsgqNBtHwMKMDqvSloZOGgkK/T5lholVXDfLDVwnr1oZs+pLXNQdEIE1Ham3tjUh8NbEErVgCDAiWYBzDRgDfgHSlcLe13cH/T6niElbn55WOOQ5pQtqWW6n3DbWUgdwOy4GDBYhBgqjIyXuvTcRHB/lQK1J/rxeWzzTgXXtC6ci93u3Mj0UQse43DDIR1rgeBoixtoteRmZMeLhCe4qomIkNNyY2cfnxeSlxhAF5mm9NyNhkayMY/q/m+bx7xXyhCYiRx2IK25JTzo23Ql2hgDvQxcWkb82EnzILctxC/DmfUwYn8Hf0XavcjK7bhsJ4Z+Y7+JL6Ol7NiApbJlpklOcoY45XOgapXRAyX1KimqGCqpbazfjNBYlj50fcfavF41gRkQb5zwtnwT9xumjGp5hRi/5lKZ+KCuXTjzsXCkH2aYre2pK2ypP22UqetGlCUFEhkfqXHDCmp5MEXHFtA8be8fHnEhs6swtQGC643WSjjG9v46158D+l2U/TIBXwbiSCboVdhfsiU1oqVmHnGoOIPMe4gDM5cl/dpA9VnPLy6AmF+zaHSQKhtL+LQs6mWKmjld7IOPkydxPXLcgx4uF8HkccwMaeD9FCmhQPvUFoLXibQv5HTXyKbh1BJIKVZneTxcjI0M4BUf9YFaDl9bmayjqviPwsqyKu5LTPEnBtMjVXwq4q2MiXPQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(41300700001)(38100700002)(2616005)(8936002)(53546011)(26005)(6512007)(36756003)(6506007)(186003)(4744005)(2906002)(5660300002)(6486002)(316002)(478600001)(6916009)(83380400001)(64756008)(33656002)(66446008)(66556008)(66946007)(8676002)(76116006)(71200400001)(91956017)(66476007)(86362001)(38070700005)(54906003)(122000001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AE04331D1CC3D84AABB09C48ADA681DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7939
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f873c90-88c5-484d-afc2-08da6fd3b38a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2emc+nGhtWBgdOhmXc9lckuIwDu632wjWZXXsJCumnG5kfuvGL7zWErwXTfiIi9BLXRqMi++OxPsj0fYvvWuThJ7nG8ynbydX20rZpuFAq2hDObtE4jPkIrQS9DeHRCDisBo/QeGizydTwZ6SONK/lvcHBlQydai8HU9za+qQLajVbcxkBj4qfVW59lM+11dNs6kLbtMwlM6MjWZ09ISym/DH0T4mPklE6ZwXF9+15dGT51jsuopV1nsTVnMjy+EGczMtMZZt+YafN3hvKUBPzP3792jl3bmBe2KOBUU84MUv08k30tNzfYRMspf/ryHY2zqeXnm6x7g8kix0dXZUVzkjsi9A7GAFXzIpLjgtQC4IazRGjL7govyUuu4ZICsJAxGJcVNVAh7rw7tAsBuKEFVWZDbTDOxo7GMSULPtnSIbDQ+kufPEq+aelK644jq+Zvi3tI63zxy1D7rLHHxH59Es+vh8XY52Nyx0SYW8llyHaDzUwm10D7HB2dEotz1wmfSkcOW9fhwh8p6uHEBQaxAjTWDXNHXPsrDqPQ0vWtkj/TtTDapwTtfpdb0NoZjTICOxKpGiYg2/nsJnmk0/sSyyaMHzX2UKkJW30InEzc9tM++e8/yth+LmoXPgh6ZI56nXt5UyLjriZVjSXVJ3xfCTWeSGyrGH3Tr5PrLLn3LinEpjGE1Z96N2ZxV1iA9ai4ZGhF1cVqxjKfiopbakxbPmc5UKlwkA7G6kIN7yLFZsSl24XepryJIYgZgp0+NziHZ8qz1viYz0PbjibnIyvx+LAh0s7CAc+CUikDCO4hZkRCNWCUyTz4gnTR8h/hG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(40470700004)(46966006)(36840700001)(54906003)(6512007)(33656002)(26005)(6506007)(6486002)(82740400003)(70586007)(4326008)(336012)(8676002)(40460700003)(86362001)(36860700001)(186003)(81166007)(47076005)(316002)(83380400001)(40480700001)(53546011)(36756003)(2616005)(70206006)(356005)(82310400005)(8936002)(2906002)(478600001)(41300700001)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 13:27:20.4229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367f8cd2-40d0-4698-75fc-08da6fd3bbb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2021

Hi Julien,

> On 26 Jul 2022, at 6:35 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 21/07/2022 16:53, Rahul Singh wrote:
>>> On 28 Jun 2022, at 6:23 pm, Mykyta Poturai <mykyta.poturai@gmail.com> w=
rote:
>>> With this patch I get the same results, here is the error message:
>>>=20
>>> (XEN) smmu: /iommu@51400000: Unexpected global fault, this could be ser=
ious
>>> (XEN) smmu: /iommu@51400000:    GFSR 0x00000001, GFSYNR0 0x00000004, GF=
SYNR1 0x00001055, GFSYNR2 0x00000000
>>>=20
>> As you mentioned earlier, this fault is observed because GPU continues t=
o access memory when the context is
>> already invalidated, and therefore triggers the "Invalid context fault".=
  This is a different issue and is not related to this patch.
>> @Julien are you okay if I will send the below patch for official review =
as this issue pending for a long time?
>=20
> I am OK in principle. I will do a proper review on you send a formal patc=
h.

Thanks for the confirmation. I will send the formal patch for review.

Regards.
Rahul


