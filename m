Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956C553404
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 15:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353259.580182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3eIf-0002Mc-1d; Tue, 21 Jun 2022 13:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353259.580182; Tue, 21 Jun 2022 13:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3eIe-0002KH-Uy; Tue, 21 Jun 2022 13:52:12 +0000
Received: by outflank-mailman (input) for mailman id 353259;
 Tue, 21 Jun 2022 13:52:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M95C=W4=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o3eIc-0002K7-Gy
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 13:52:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60083.outbound.protection.outlook.com [40.107.6.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 576684bd-f169-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 15:52:08 +0200 (CEST)
Received: from AS9PR06CA0474.eurprd06.prod.outlook.com (2603:10a6:20b:49a::27)
 by AM6PR08MB4565.eurprd08.prod.outlook.com (2603:10a6:20b:af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Tue, 21 Jun
 2022 13:52:06 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::b) by AS9PR06CA0474.outlook.office365.com
 (2603:10a6:20b:49a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Tue, 21 Jun 2022 13:52:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Tue, 21 Jun 2022 13:52:05 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Tue, 21 Jun 2022 13:52:05 +0000
Received: from d279d20d6b1b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3B97E04-4136-4F81-A73B-5FE7901240E2.1; 
 Tue, 21 Jun 2022 13:51:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d279d20d6b1b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Jun 2022 13:51:57 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 13:51:56 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 13:51:56 +0000
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
X-Inumbo-ID: 576684bd-f169-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=f4PRqajjSzYGJoAxGh3+QnrSQ+JdhRij8tCqC/WOI5q+6YTiw58CpDEbT3APo9xxNvYPW6fiuj3oA9jcRo/7duqAvy3QIwPx75wclETML34akaxE+Y9syAGcMg2O8c7rJerd+Z1qXhLksoCaxreNcvVxBuobfuGbLgbw79QBJ8M3rrq4OvZigq9IQPOBmLdMSaF9VKKgG0KweNWoR7u7Era95R0YRqM2tNg0m06ftmFbpdq/FBTEILybg2M5pkFmLyF04oo7RoILMX31TACKb9Fo0QU3+Qhi7Ol9yqiqp7LT5a45vmLoGTdPYFHRL9UZjoOW/SBz395ryqRUxrFoUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOGuhvqCIs1oxNymuMFyvzbwzfCeT9HJS6rcrPwb1kY=;
 b=giyCTYvRvDGk43quwUNhcxkvQQyOGp5i3YM0rqarE2mgkluYGjaPAFZ3wATI7AMXBgwhq8P5shvdMjABhS5O8tZ8QUGSIWC/9Oa/8TwHxLxtfC/2i8egB3IjidoWQCNmBycRdyKuoyE2tdqSS7EEcFO3474VjgrJo7BtSkpK2qbtN77Y/a5F8sIVy/t3PB6Ea/xPf+rFNwGwNYOrU6VIPA73LCY8+7P2VvuYMB9+ZwVkCH57R5Ku2BV2YTD220m/QK/PVGvVMBJaR4OGHCXzck5aJD7aa6+vbYg7fXyZR4hhtiMP9d215MJlCKHgbCVnqsRg3UagtMp3VEY9V8u7vg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOGuhvqCIs1oxNymuMFyvzbwzfCeT9HJS6rcrPwb1kY=;
 b=tXBRpJFhhkktjYvO6bPTMD9tD+UpmgJBj/SCDo/+jS27cpCyB42jx+R0MzOi7ulRvEHaSk8EuKEi3zMFox45kkNy2xB19osfKVHOytr3G0JLDqgttRHY+zmYM2mW87lxox9IeBwnJz2ITAWvoG7wNqQ7bRYLSbMIUen/Cqu8wjk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce8ebecf0af0b502
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQLdM5aKc4DkDbPxrP3RjCirRmTtYoP9TVRttvuFCuqrYTolHbtd9anRCy/AFOAV1cdSGsPKEWTKK8hn+tZPFYp71ouxOvr9rZQplhe6uFmRziuf83/g71k2fB4r1XR6eFOHblKenZIljQlJ9FDy7zq+8xfqokFft0yNjYK0EOCcIB4JU4lBPrSiaG9OzVxe4k8cZ8imGv6NSUrON6aJ4k0TQ9E/AXrt3LByTbAbYYiqNdegpqZn8KZ/Oi0Z7K+nLbXcQBlXpGpMiCGR5LTQp2idJ+CpQYKko3/ln1cBwOAN7owqsKjTfN5WjWyvsB6uAiLTiJTq3Hw9PwDs2ra7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOGuhvqCIs1oxNymuMFyvzbwzfCeT9HJS6rcrPwb1kY=;
 b=cNNLbJ/HuCu2ZtArX6/gfeduwcVTGHtd8cIBm7O1e/fx+UqlBRAz2/NgFUuMk1VNmZy0soVMcDGwK8PfxaaZ8IiMOpgcR7Fs8R0dFPoib7bFiDlNFuzWN4j/k7xVTGEbNa0VqL4Zf95zUyKrQrwbuqqLZUvZgTMJ5DUTxebQgkZh7EIefJfQVF1i/K6pFne5vtlConqca3UekHQnNcRyTpvMzwKg5MqgwHHCPevtkOwnzrDbv5VN1iZLNsdq+/N+8z/96STV+v11goxlEvCZ2As/HrfkcoVhZogqAzx9CJYH7yQ1i3J7kI8vWYNH6BovqhT5+dmo4aOfp05iyRJg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOGuhvqCIs1oxNymuMFyvzbwzfCeT9HJS6rcrPwb1kY=;
 b=tXBRpJFhhkktjYvO6bPTMD9tD+UpmgJBj/SCDo/+jS27cpCyB42jx+R0MzOi7ulRvEHaSk8EuKEi3zMFox45kkNy2xB19osfKVHOytr3G0JLDqgttRHY+zmYM2mW87lxox9IeBwnJz2ITAWvoG7wNqQ7bRYLSbMIUen/Cqu8wjk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Mykyta Poturai <mykyta.poturai@gmail.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Topic: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Index:
 AQHYWlIekEFYa4Z+ZkOKg6prrRxnv60EB7eAgALvxoCABl1EgIBEoW2AgAA0fACAAZfdAIAEm8YAgAGSSQCAAEbogA==
Date: Tue, 21 Jun 2022 13:51:56 +0000
Message-ID: <0A58139F-CA6F-4E18-B44A-2066AEF0C8F6@arm.com>
References: <A53A2C83-BA19-481D-8851-0B0E1A162F4D@arm.com>
 <20220621093808.597929-1-mykyta_poturai@epam.com>
In-Reply-To: <20220621093808.597929-1-mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e31edf60-7189-4e72-68e0-08da538d39e3
x-ms-traffictypediagnostic:
	PA4PR08MB5888:EE_|AM5EUR03FT011:EE_|AM6PR08MB4565:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB456500BD6C9ACD9131F30438FCB39@AM6PR08MB4565.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iM201TIXXpCc0flE0bAkjANbilEmEU4oqF0BcFsmk2lKF9c8XkwJe5anTCuUGAYn50MpLSmcoc4Tb2SjY7lmJ/giDn86DMD5Rk96ibE2YcXY3zLCe1FaGT8UvGsAowdSTenC/nYAMWae1SI1Cah2OTzLnajIFrkc2AQXZbj9fK54X1VAg/XNwY2FaoArSxDtshE5nq/7n4zArZrdmZeTCDHNdxc323skrgiV22NngObsZpEWAf6fkS1XULCIBqQ+MVh7y+fvnSV/IEtr73QDY2dON7F/Wgd6WZVgqMDMLoMC79dQJNszJiWw0wYkalFxRnYG9WFERhJzsexNNx87ohwjn0KPN/8pf0wIb1cf+hNAIgkJVHJBQh5DFlsiQx4DVdpSMS9W9K2Z/N7Xk7ET8JYfDCgfE3sQdetDQwPGZb5mrXC4znBcVH+0HRrsby9ukfVJ7CeX6D0GWUf7eeB5hV1B6MSs4iU0jl+hpUU3lJtAbv7H4wjNliCQPbSc90PknXL7HxHhkcpWy0fsY6K/JClIIu5R8/xS/WLGH4pFOSWQeSlT2ZJ/QUMpzJkkGFswEq4c4CksML4NBEnIiq/DbCmxlgsF3brOEol+rQoWPvT4bGwCdzM0fbLctXYOC/1+MW1Gyekcl+AtYVEZfVizu/Wk9NE1BGtUIOeUN2xAsuP4OliBDF1v02WLWt6MqOc9MQZRUJeXOPfW7IMqal/novj0yCFX8OWRcRsKgr9LBn0Z45glmFzA3zgwvfkrm3/E
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(86362001)(6506007)(2906002)(38100700002)(26005)(122000001)(6512007)(2616005)(41300700001)(83380400001)(38070700005)(186003)(53546011)(66556008)(71200400001)(6916009)(316002)(4326008)(8676002)(8936002)(66446008)(76116006)(33656002)(64756008)(478600001)(36756003)(5660300002)(54906003)(91956017)(6486002)(66946007)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <68480629F3DA5D428A12240C0DFCFF98@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62fb99df-00cf-42de-2e09-08da538d3490
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	85De4jiPDlSg8eRk+bAJ6L1rYlYHfJcAVssgjDVNcANHCZyaD+HlFE9WFm7yGCSyc6BKINHLFl2kNb8CD3zIhfGgGiW8KNaAm42RaVAp//zG4AXw6BA7u5coy4opH37f3be/M5vG0zunHp03eyYcnLBds9nN1PUt5eDq043GR5ZD2Rdpf0kltPwiyJWFDzJotOywYh/OLkKDOGpIFER737SjyjzJXSq949JFivZLhoiUvG921anmy8xOt5q30TUWiRzCpOjRjE2qqZqR87g5AmbX8/U0T9TwHPIsIsRyubYLV3W8ryOob2KXaJFyWyuYG+fQ7q1zTZenVQbYTS0QC4zckmNw3zSZ3hywJwSeJpwf7v0nPKatVjisEVVyfTfaIz8qaXwwpEYcWIrqD1i1OJ6WTwygF0tfGaEdIX6kBsJ2NGJLaKOnZnRhXu3tlVEZIuYV0tdXuNi/HzT7oXUgEzioo+E821oj+OdcRAmaefdwmSqmZlubPvf/VStToaP9FW2cfSkmx9ZGscv4bo1+KB3idW0guEMuS9bGy9muheLgKB2OjzWcAP6JdQ5dHrSA0FgP66th22ib6kMGJISvL/8bHuG1FLezDp3ukm1GT7NYO37fHaeUjpIq+xuEx+Fp1fhEqm/bDaxasNS9Z9YtienNsCnBhkctExXcNqbMfr8uAR+ro3rAFoIsp1YLZz75+UShJrx2iMhP9eDFPXcfhw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(40470700004)(316002)(5660300002)(40480700001)(6512007)(54906003)(86362001)(26005)(6506007)(70586007)(47076005)(36756003)(6486002)(8936002)(478600001)(336012)(2906002)(53546011)(83380400001)(41300700001)(2616005)(186003)(4326008)(33656002)(82310400005)(81166007)(6862004)(82740400003)(70206006)(36860700001)(8676002)(356005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 13:52:05.2420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e31edf60-7189-4e72-68e0-08da538d39e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4565

Hi Mykyta,

> On 21 Jun 2022, at 10:38 am, Mykyta Poturai <mykyta.poturai@gmail.com> wr=
ote:
>=20
>> Thanks for testing the patch.
>>> But not fixed the "Unexpected Global fault" that occasionally happens w=
hen destroying
>>> the domain with an actively working GPU. Although, I am not sure if thi=
s issue
>>> is relevant here.
>>=20
>> Can you please if possible share the more details and logs so that I can=
 look if this issue is relevant here ?
>=20
> So in my setup I have a board with IMX8 chip and 2 core Vivante GPU. GPU =
is split between domains.
> One core goes to Dom0 and one to DomU.
>=20
> Steps to trigger this issue:
> 1. Start DomU
> 2. Start wayland and glmark2-es2-wayland inside DomU
> 3. Destroy DomU
>=20
> Sometimes it destroys fine but roughly 1 of 8 times I get logs like this:
>=20
> root@dom0:~# xl dest DomU
> [12725.412940] xenbr0: port 1(vif8.0) entered disabled state
> [12725.671033] xenbr0: port 1(vif8.0) entered disabled state
> [12725.689923] device vif8.0 left promiscuous mode
> [12725.696736] xenbr0: port 1(vif8.0) entered disabled state
> [12725.696989] audit: type=3D1700 audit(1616594240.068:39): dev=3Dvif8.0 =
prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295
> (XEN) smmu: /iommu@51400000: Unexpected global fault, this could be serio=
us
> (XEN) smmu: /iommu@51400000:    GFSR 0x00000001, GFSYNR0 0x00000004, GFSY=
NR1 0x00001055, GFSYNR2 0x00000000
>=20
> My guess is that this happens because GPU continues to access memory when=
 the context is already invalidated,
> and therefore triggers the "Invalid context fault".

Yes you are right in this case GPU trying to do DMA operation after Xen des=
troyed the guest and configures
the S2CR type value to fault. Solution to this issue is the patch that I sh=
ared earlier.

You can try this patch and confirm.This patch will solve both the issues.

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index 5cacb2dd99..ff1b73d3d8 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1680,6 +1680,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *=
domain, struct device *dev)
if (!cfg)
return -ENODEV;

+ ret =3D arm_smmu_master_alloc_smes(dev);
+ if (ret)
+ return ret;
+
return arm_smmu_domain_add_master(smmu_domain, cfg);
}

@@ -2075,7 +2079,7 @@ static int arm_smmu_add_device(struct device *dev)
iommu_group_add_device(group, dev);
iommu_group_put(group);

- return arm_smmu_master_alloc_smes(dev);
+ return 0;
}


Regards,
Rahul=

