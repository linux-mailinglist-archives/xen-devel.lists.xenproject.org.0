Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED65927AE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 04:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386964.623006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPUn-00085N-AT; Mon, 15 Aug 2022 02:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386964.623006; Mon, 15 Aug 2022 02:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPUn-00082f-6t; Mon, 15 Aug 2022 02:06:25 +0000
Received: by outflank-mailman (input) for mailman id 386964;
 Mon, 15 Aug 2022 02:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zthq=YT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oNPUl-00082X-U5
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 02:06:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc32a222-1c3e-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 04:06:22 +0200 (CEST)
Received: from FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::13)
 by AM6PR08MB3944.eurprd08.prod.outlook.com (2603:10a6:20b:a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 02:06:16 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::95) by FR0P281CA0068.outlook.office365.com
 (2603:10a6:d10:49::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.14 via Frontend
 Transport; Mon, 15 Aug 2022 02:06:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 02:06:16 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 15 Aug 2022 02:06:15 +0000
Received: from 814ea3f87901.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78B802AF-1E73-4847-8C41-8E47E8E430EC.1; 
 Mon, 15 Aug 2022 02:06:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 814ea3f87901.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 02:06:04 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV1PR08MB7732.eurprd08.prod.outlook.com (2603:10a6:150:53::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Mon, 15 Aug
 2022 02:06:01 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 02:06:01 +0000
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
X-Inumbo-ID: dc32a222-1c3e-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jerwNsq30B6A8EgwUGgjz+1nrHp6CbivH4Hd69jg0MInyZFw8E8hVpABnnqcXpcidxvnRY2COY3palxFzEkK2ZYtz1cNJZBjGprpM6WXh+9QOeZWrLntReau7HwO359wfWTT5R1wIfiJMVFeMV6CeYobPGGKPX8V5B0SlHmLmU0n9ebS4yZRZ6QNww+CuDzlkociJxQTScCIn68WZBUCKXRv7Wsae2ij9L+jbZs3T2os5+QbBbJOklF1K9BrTGfzmq48GX6WYGKBuPUCtM0151YVCIMUltWmBfTccpuAWEZ2tU+u3S9WAnoDNtaMwQCQXse5FR1NAlFvfHAEcZ05Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzdOkapmekA1JlCMQ/kiY/PAJ5Vq97zQiawEZFkNp14=;
 b=PGQisYYFXUHYe4yoBR9fWthnqKhCrnJ95jxvyFHHnW3rvwaF8r6pcaNRqWu8kKoQUADI0oFC/cw1n2KoFhtHBinL9IKPRGy7PVJs0y+8x7MAZWJKI2/ajbVqGQXT/5A0Wxhf5k0Tl7kzE4huWrr7ZrlTmTjP89d8x6W9m9nLTOueuTfQFcPjHQ9xXcdnps/GXJ/7D22is4yAb0DiTcSR7a/bXXHjCM18YxgIBQWJ5vpr6UqLrI9BcFDH6UNSeSNaqQZdREgEqZ2YDWNPE95l2ZzbJQkILIw2sZfUvsv2St+/CfzE7H/ZCIjw0LVVlicylDFjVByp+P9wXbdT+D/BxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzdOkapmekA1JlCMQ/kiY/PAJ5Vq97zQiawEZFkNp14=;
 b=I3pTWcODD3LgrQ8HnFsKMTPN0Y0VT656UOK9K6uD8TM4w9qYFYey5jXz0uvU5J3SfQ/rN2ujCWM8JTtBiYOTii8TSp1LOjr9Ot2eHy+xL1LK2+MTYeQxM1L+cq/ZTGOh9zi4sboJVbH5f8qz/E6We5kh18E8S93RN7A5Pum2zUs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c29fcb3d7552d66
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwrrbwMZJ3cXAL+Nir1KDFDSfG9AcX4zRh4TagY1cs5vggtchX8aqZwPbW5Pu/ORVILuM1PhfOGYlRSfdWhJqqm1SbEbeiKjF2tebm3HVEmGRYaFdEMdyH3ZkrAOMkl7AAoaNJQx23F27uk+aHj2CFWwf6cPj9W9IrpdgDzWbXyH+rbWtczsSo9GhxE/Cs5T18RyNzyIIDfGM1GJKRx2r0d+m8ntGcOhmLqdd512Ms9oqcosLsetPKBpv8W3jgqlxgF8sVFYKfKasInCxERhBnes9irca2ESreTe5B6rg4B0B1B3ui7tQMNX6JamlU61oxAlc+sQkDwrEAMV/qtSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzdOkapmekA1JlCMQ/kiY/PAJ5Vq97zQiawEZFkNp14=;
 b=Fm+kNs9pCh4uo0nTpYhqdKPN75SH/2gvdG6ZW9x73bxyen8mUBrB5E7OSzXxI8WqQpHltdHSU30t+b3qBSOgRNgU9irBNmyUTOcUx16HJJEeHSwQyOnkal7JHcwVw2h3nBaFLXVuSDtURGW5lWtZonlm67JDB2mUlwr0SoFwvBHa/+IEYCT+SsnFGgUkUNyqnYTKdpDgh94dnBU9FEyQZdsUw4zMyntvOEMW4M8ebjkjyKHma1PRG1tYcw0vKjivKIGaXfGSYpBa7sUZfzSYRSfU/WYFzQeluIfUP0bn42P475wnYj0WEgz/7lgEv62LgdJV3v/Yz9sJyUUjrjfemA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzdOkapmekA1JlCMQ/kiY/PAJ5Vq97zQiawEZFkNp14=;
 b=I3pTWcODD3LgrQ8HnFsKMTPN0Y0VT656UOK9K6uD8TM4w9qYFYey5jXz0uvU5J3SfQ/rN2ujCWM8JTtBiYOTii8TSp1LOjr9Ot2eHy+xL1LK2+MTYeQxM1L+cq/ZTGOh9zi4sboJVbH5f8qz/E6We5kh18E8S93RN7A5Pum2zUs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <10636538-cb61-f346-4af4-970b36ad41ab@arm.com>
Date: Mon, 15 Aug 2022 10:05:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages to
 .rodata.str
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-6-julien@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220812192448.43016-6-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 814b079e-e0e1-40e9-a872-08da7e62bcb2
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB7732:EE_|VE1EUR03FT010:EE_|AM6PR08MB3944:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g6JZxeNAmHynBnBBYOtjnLj+lhWn6moedEGVS474Vc6NAfRLMTAXTHyo4qS8UH4TJwKZUucebxJhjxp8VnVGLDrEFCkLQe2T7tbNTWenLrCIfKfLe3VPjQqQMiXMPqQcr6tPXNQTeLjQILPwHJOWt6zuuMQQuew+iJNi+cCPdgCEyNt/KG0PAfudsnlEbGr/d9LNRVh+cXTmCfnzM+Q78mKYCF5XuFYKiQQWtw0oI2B4P3Zt124mc60CBPbeqYpriH8Lv4f/NnBb+fan87Q6Taqb6an9oyt5uHO1PnCvIP0RYUsVSXLdhe6VXyWS9McOT7mxFOqNQMGNFkcLkhj/mwA1JCApNAOk5qhkOe8FEcxJnsdGfUN+MUhLhVz8iz/ICPeebFiSO3Ady4qep8JMTt45WGed/qfgsgK8TCNn4t4RZE87hguc0fsRZ26LOvKbwNBmGiBLGEQfTnNlIEEoCy1kOXg31jpZNAdiobSUrexjRUn3HMMZe7dRJvggxYgEY2ocE8jyKYWg6fC/xUBVhhVdZeMt13R0gRfyd4Yr50vKd/+ogMsFDHYhYNW1wsY3IkBNkaQzsn3BOaygo0OpIRBOir4rFA7bYyWR6be+cqgcK+eg3ZYUNOf3UL3TSAPsXF+0xWyrX6KYUIXmYOxI97zbxdcAqpOpseOWsYk9VH9ERwyH+asht8F4JwrO8H59phBx2oBoG3WEteGXCAVKloYcX/TUeu9BnWBYVUGU9ioCE63RqHGDuIPauryFoa56fFPHMYnWSJP9FyKnpT7/tbCGggB1Knj33co2BP8nWgFeBojJXyr0ozWyzCRY9uKiBi6i01l6r4YfBFxsKJItiIkZ8b7wbeZene/7SHKc3yg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(2906002)(41300700001)(53546011)(6666004)(26005)(83380400001)(6506007)(6512007)(38100700002)(4326008)(6486002)(66946007)(86362001)(36756003)(8676002)(2616005)(66556008)(31686004)(316002)(5660300002)(54906003)(8936002)(186003)(66476007)(31696002)(478600001)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7732
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea60897b-de58-43a9-3ce8-08da7e62b398
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9s97mGf3AsQQj8JZpg9xDI3qB5mK9SUHuQgPQtUkiqp34FRoy/LY4KGKkktuLu/cAS1TU+TGTtrbPSKwQ75K/ABD++AAx4WxstMjAeO543eXe6kKVx1QbR3C7hZBYpgoGk13UUbqPg++fc/RaqDZO7RxTqrh+7FZ3x90LXHDlsTPVir/QYp29mkyyeEOlqeqygDM+dfDiMs4BzrsiGjS9UQxOO2kswoYO8rXuJGH49QlXaIEe33qyL9CzutOf0I6nRqYPT5nIcT0hAL8Qb8q8L1rE/ebrdnJCBFfoZWc5NmwosHOPqyiZHPhOcpJunqU/QXk/EQigBI+vKv2RRo5pcS1TRDU/KBazX7h3KpPeV+et2U5HJyiMX7t9R0q7AiSBaRCLRF+2kKH4tizhOOQ5D19+bS+LVWaZqYyB/eegUxlh216JqgNv0iCTaDOqccyCJGZl0MTv2QBci0+aDrnR6o6mtFa1uMJFlqn8ek3C1K/30EM+9pRd0TFZHyZmxMv13930LL0A/oPPrTNZJtObahI32bNx2NZLOib6knGQKu9Up0PuzQoHiGVYMczayKqiO8hZVyuLJ+trh2aPhfhrBpL74gBnRRwFVCwHqnLAgImIPtDkTu7attdvBMgn1OH07+ROUNQ4J+7dvH7rMf3BJ62OL8MSuCJq5fEQRHHGMCLh0JFgJfk62A3nTGSAm7ExlEs2GG3LF3AEPQwTUsSs73zWJhmnpaOBTblO1eb3i1iRmujvBeM1uES0v6Y9x3qjXJFrX39Yhup41Btn3MSSBVswoviFukn4e3TugM4aLPKd71kx8BPPllN3xa3d92w48Skh2dYGSQQ8Xs0NBumNQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966006)(36840700001)(6512007)(26005)(70586007)(8676002)(8936002)(6666004)(70206006)(4326008)(41300700001)(53546011)(5660300002)(2906002)(6506007)(47076005)(336012)(478600001)(186003)(86362001)(107886003)(31696002)(83380400001)(6486002)(2616005)(82740400003)(82310400005)(81166007)(356005)(316002)(36860700001)(40480700001)(36756003)(31686004)(54906003)(142923001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 02:06:16.2972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 814b079e-e0e1-40e9-a872-08da7e62bcb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3944

Hi Julien,


On 2022/8/13 3:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, the strings are in text right after each use because
> the instruction 'adr' has specific requirement on the location
> and the compiler will forbid cross section label.
> 
> The macro 'adr_l' was recently reworked so the caller doesn't need
> to know whether the MMU is on. This makes it easier to use where
> instructions can be run in both context.
> 
> This also means that the strings don't need to be part of .text
> anymore. So move them to .rodata.str.
> 

This sounds very good!

> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   xen/arch/arm/arm32/head.S | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 27d02ac8d68f..a558c2a6876e 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -93,13 +93,10 @@
>    */
>   #define PRINT(_s)           \
>           mov   r3, lr       ;\
> -        adr   r0, 98f      ;\
> +        adr_l r0, 98f      ;\
>           bl    puts         ;\
>           mov   lr, r3       ;\
> -        b     99f          ;\
> -98:     .asciz _s          ;\
> -        .align 2           ;\
> -99:
> +        RODATA_STR(98, _s)
>   
>   /*
>    * Macro to print the value of register \rb
> @@ -736,7 +733,7 @@ ENDPROC(puts)
>    * Clobbers r0-r3
>    */
>   putn:
> -        adr   r1, hex
> +        adr_l r1, hex
>           mov   r3, #8
>   1:
>           early_uart_ready r11, r2
> @@ -749,8 +746,7 @@ putn:
>           mov   pc, lr
>   ENDPROC(putn)
>   
> -hex:    .ascii "0123456789abcdef"
> -        .align 2
> +RODATA_STR(hex, "0123456789abcdef")
>   
>   #else  /* CONFIG_EARLY_PRINTK */
>   

Reviewed-by: Wei Chen <Wei.Chen@arm.com>

