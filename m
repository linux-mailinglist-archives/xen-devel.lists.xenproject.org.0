Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E8C592795
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 03:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386912.622940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNP5o-0002H0-R4; Mon, 15 Aug 2022 01:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386912.622940; Mon, 15 Aug 2022 01:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNP5o-0002Du-NG; Mon, 15 Aug 2022 01:40:36 +0000
Received: by outflank-mailman (input) for mailman id 386912;
 Mon, 15 Aug 2022 01:40:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krio=YT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oNP5n-0002Do-1w
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 01:40:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40ba3706-1c3b-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 03:40:33 +0200 (CEST)
Received: from FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::12)
 by DB7PR08MB2972.eurprd08.prod.outlook.com (2603:10a6:5:1b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 01:40:31 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::f3) by FR3P281CA0151.outlook.office365.com
 (2603:10a6:d10:a2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.14 via Frontend
 Transport; Mon, 15 Aug 2022 01:40:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 01:40:31 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Mon, 15 Aug 2022 01:40:30 +0000
Received: from 914a771fa467.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB5FAB7B-6725-4AE7-B8D8-8E47BD6EB4B7.1; 
 Mon, 15 Aug 2022 01:40:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 914a771fa467.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 01:40:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7401.eurprd08.prod.outlook.com (2603:10a6:20b:4c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 01:40:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 01:40:23 +0000
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
X-Inumbo-ID: 40ba3706-1c3b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ESNy8S0Y05FdZ2D4HHyZB+In2OiKPkOP86nRyRIMPk5LnPIbXFi2HxkBUAqMLUKzqQ8hQBiusdHI252G93QKqMfELgQOhGAr2fas9Yc3lAX4X7zezds6qVZpija7ios5n5/eb6rC54mXApK8hLRRLXWcSWQ+ZiZK+E5uVt7UFfeOdCKzCzr3SJom8BmCTZ5KVzQP4nAsIgzgaPu6n6j7K2rc4Nj6GmplGm2gcMRuNI4p4lL7Zr7rLQ0pnkqYOLoYdfJZJ7HHvS6TiybLemINtLrUoYGoIvTEaZo9HHgplgBQwRfq4iTK937ZNdppSuxN4VXbeocXnayiOR5X4CaVxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4th/mCebd/QpOjLG0hZvSB0Lj8WRj7xm5gAcknz7osQ=;
 b=XRlnGOUNuTnpEqNoglOZAj8xvUsV0N62FM8WZHwRrens+NfocEvngZxf/jA16eBCL3nJS7bnw1vjbgx2QHww9/xaYXwSaBKYshxcfOfPKCUNGZuUOUejz8pw1JbHQtcfUlztuDO8awklh4PVniZhUNjJOf8AKwSMf+QZFomZT39wlVZiNdCB7RfOwsAgbKxEEof6t3N09TIWfzIBx2NhtR0HOEu4idD2nVHQ4mbOnw1td50J5RDhTCffRy/0qVJ3T0VMjIRyiHpQ8R+ZghyYxLBVsWMT4BicULJWOvlEJ7+0LD5yzoiNCiTeLywFYSPte4j7FaP68ewXGHRCbo2OCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4th/mCebd/QpOjLG0hZvSB0Lj8WRj7xm5gAcknz7osQ=;
 b=lDGTcrqQBeoxNDbKJcsazDVDb/8J3HaQo/MQtP/PKQd8pTNSjbDWUYvclQtC3E3NsTwHNKAuV40BWr/c2ofQ+6Q34gXDLGJ+jyQu0/4tNpOwFZP9dPCSq9QWd7nyGNu1o+R8h9I85Kzu3BeDJpXX0oToa0+kIFXPFDrcZg6Y9Ko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWyKArihc7HDBfFYXcn5WhWxt5CH+nVhuoAgmfeheBjp7rSHUqrSxKbLYWltTF/BdG2O5QoJ/mvIhbwtxifDbXpqHBsvCwfwt/0WFBiFR1TNMaa5bUBPxWmKrCu5l4PFpI9TU4gC9hyAnxWofShxjrdMnwn2YW1uEnnzWTgPEGY6djQd9ltCNh0MvJX6+trRqZmgzPCQo8oaE4UmlQ0PVJuiIYSRpQ9S0zGJle6PP8H4YPwWGNJ8r9WWZqS0UTHZ25W3y9v+ZzxYBS3jXDDNE1lVMEmR0fyEL/67A/Q+GaIdynrgr0E5fO2/Ff1uwg98cre8FGusWck30ZxsiCCUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4th/mCebd/QpOjLG0hZvSB0Lj8WRj7xm5gAcknz7osQ=;
 b=hf7qhhFNBCw50qPmBV1hVoPEEuLLu+jWDhaNEO5BMT24Upq76TdGPccfX0Z+6yuQckytSTH0lElfsONWvm4UBtFWi9Q0PtJ/5HbSibVzNxCrjHK1TWMTkMXzUgK/E+iLrNqKeIWIlr8/KPbIpjU+myGOlXz4QeSsrKZAb1KhgM4gckplE/RWD6r4tz/p+AP/RQ+G/GmwFu0Qg2NPR9RYv86DvAEO539cNTWg/GTX8W0xQrswqvkCjGx91Z53kj98XHf6a7lJU2H5oSM42kS5aCySApJsWcymvcyvJPe8IKwW1DafgIZssahZ74SgGZWEYNYv1O4AiPupv7ihvoQgEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4th/mCebd/QpOjLG0hZvSB0Lj8WRj7xm5gAcknz7osQ=;
 b=lDGTcrqQBeoxNDbKJcsazDVDb/8J3HaQo/MQtP/PKQd8pTNSjbDWUYvclQtC3E3NsTwHNKAuV40BWr/c2ofQ+6Q34gXDLGJ+jyQu0/4tNpOwFZP9dPCSq9QWd7nyGNu1o+R8h9I85Kzu3BeDJpXX0oToa0+kIFXPFDrcZg6Y9Ko=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
Thread-Topic: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
Thread-Index: AQHYroFOVyqyQRSbhkS8uh6wKmYB5q2vMYiA
Date: Mon, 15 Aug 2022 01:40:23 +0000
Message-ID:
 <AS8PR08MB799170A0EF051DE12565D9D992689@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-9-julien@xen.org>
In-Reply-To: <20220812192448.43016-9-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 904DCBDEFF23B449993B3536E72CA109.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 104c50a6-3f09-4f7e-e1e6-08da7e5f23a5
x-ms-traffictypediagnostic:
	AS1PR08MB7401:EE_|VE1EUR03FT061:EE_|DB7PR08MB2972:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rJLKlSSDMwUCLaRpaOYsf2CmY9hQnWSVnr04D4IAFmJw1R9eTsbZ32LvBNSIrjdH90bsfKch8IQwY0fAVbNxlccI2okXJpUp4gdSLKT1J9YOrMpfVql0HGTAQZtd2vESIDg+D1W/wx5uNW/Ufy4WNtb3Sym4uoc9hGg8PGjy/Pg79JHm+3dOGu1ndk7F1hmBya4pIGxJC5HoB3BvwcXihc3/jDQ/fOhCpAAIeltO0GO8Zu2fdLgnIGUwU0DUB0aq9EmkIMeiud4GKgNd6o4N4H6qxTOomXHDbWEGPPhPz+HfjD3WDTsWjBtCZbNc/iVH7XOQcDWbkEiZVe04deOudE9BfXIWzjHVZAW5LgmRix5oBWowHOGtUY7w39swNauFa1BrLivKf8heGcBn6HjpptF05gGDJG3nl25JhNBD42SsBVet1DOjJB/qEpPk40/GmJVxvq+7geBFGdRdzsLcY72mgjylKLJzuMuan569jwcjLeXG4N69IuPwU8U9ajCGS+YY0NAtk4B/KLH2hk9HLMGTiZurrZEdRwsoI3VWHsEmx1F4TG8aOrVotwodkk0yrNDsXmDSycLMAvbQDmlRt0YxQCxlzXgiYU48RZhTpbHp/IkmPNvYw4Bf3OtJ4arqA9Rk05fSUW4R/zKqqc/Bgeye5iholDbvTvkxvY5m7byh8dh321r65y0L5TC5pCX/dYm2EHQpNsJXVfn6zYjJmpZnlP5FXLymoyAVknenn88vznGPdFeHrQzKuc9/Mm/aUuLq3V5zVd0sUCRJmVtwEfnP2GxAi7LtLzh75PncUuXJm2wMvsYoTzW4yRMrdN9HQddHPWzDQMcZCHVB6MeAwQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(478600001)(83380400001)(7696005)(6506007)(9686003)(26005)(186003)(38100700002)(122000001)(38070700005)(86362001)(8936002)(2906002)(5660300002)(52536014)(64756008)(66476007)(76116006)(8676002)(4326008)(66556008)(66946007)(4744005)(71200400001)(33656002)(316002)(110136005)(966005)(41300700001)(54906003)(55016003)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7401
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6653a862-d6bc-40d4-8c33-08da7e5f1ef8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q9mmzUcWrm92ayO10XR3rzrQhJQFf71tbhtrozh1zLUl25uYW1ikwKKTrm7586imyfkgJ+aUR3qAXTlOih/vBIuiCkU+m1HHQeqXhig1lHenaJTvemp9Cu5DV+s5qddpcn9e99xpnPX9U45XNJShTa+1bNV7khpckduwCyh875eq3CHp9GN67UMJlaV9i/OT4NUJ/iHMDQELonnxdLbxD1NLtjys9Q5DKVgSIx7bV4feAH23rzI1J1dFPO27YLodc44FXl/7H3wgqSUbUmmlD7QJsLFiT2uv6mZjrbpMd3z8s16lZhHBSEbWvcqXiZTh0yhOTi2Ndg1C50Yp7EMSeMm8NLzfGX1ykC+d3SZQTMz8vNg9FKNOWHPiShNpeDf+AD6i75cK9OCi3p/Khvbuy+7l8tZAD61hI0Y2/xHUBE7YLVbskz9AZWevYrKtdzmk6+f1zkRjXqz4cZpwGI6l14WilCWEd6F80KysMYItfPGUg8HwNALQcNNZFLfDLMFOMLe95DpkW/bSwjhqJBAh0iqkIVbxN1IMbPdg78KmvPm+58Rsl8NxFFoBnRmo9/+bPrB61ygB4MO6irJEoOOJjM33DpsztNChyTB2w3XtfbrgYbR3Sgnp/ITUeqN0STNXuOJgtOUibr3HXyk69zm6nt+ZZAkLxh9j7qWlVKzav4N8LAkSJh1QYmRGMVkLO8lrYsKHATMTB1huch1Pj/053eK9Yz2U+yImTX8Yu/mUaVA5LP/XkvlODqmZenbIOonAmIgkNlXr6olvc9Y5Xu6INqOYJYI31eFfXomijrLeITBkl6jGAE1LuATMVkp2tuYl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39850400004)(36840700001)(46966006)(186003)(356005)(6506007)(478600001)(41300700001)(86362001)(26005)(9686003)(33656002)(81166007)(336012)(7696005)(107886003)(83380400001)(47076005)(966005)(316002)(8676002)(82310400005)(40480700001)(55016003)(110136005)(4326008)(5660300002)(52536014)(70586007)(54906003)(36860700001)(8936002)(82740400003)(4744005)(70206006)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 01:40:31.0319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 104c50a6-3f09-4f7e-e1e6-08da7e5f23a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2972

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 7/7] xen/arm32: traps: Dump more information for
> hypervisor data abort
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Unlike arm64, on arm32 there are no extra information dumped (e.g.
> page table walk) for hypervisor data abort.
>=20
> For data abort, the HSR will be set properly and so replace the call
> to do_unexpected_trap() with do_trap_hyp_sync() to dispatch the error.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I think this patch looks good to me so:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

But it seems that there is a duplicated patch at:
https://patchwork.kernel.org/project/xen-devel/patch/20220812192448.43016-1=
0-julien@xen.org/

Kind regards,
Henry



