Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B46636358
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 16:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447623.704056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxra6-000597-LF; Wed, 23 Nov 2022 15:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447623.704056; Wed, 23 Nov 2022 15:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxra6-00056Z-Hg; Wed, 23 Nov 2022 15:22:34 +0000
Received: by outflank-mailman (input) for mailman id 447623;
 Wed, 23 Nov 2022 15:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSvp=3X=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oxra4-00056T-Q7
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 15:22:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4a0138f-6b42-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 16:22:29 +0100 (CET)
Received: from DB6P193CA0019.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::29) by
 AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17; Wed, 23 Nov 2022 15:22:25 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::fb) by DB6P193CA0019.outlook.office365.com
 (2603:10a6:6:29::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Wed, 23 Nov 2022 15:22:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 15:22:25 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Wed, 23 Nov 2022 15:22:24 +0000
Received: from ddb55654d503.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FEC085DD-0E6C-4FA6-A21E-2DD3B94E1F64.1; 
 Wed, 23 Nov 2022 15:22:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddb55654d503.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Nov 2022 15:22:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU2PR08MB10278.eurprd08.prod.outlook.com (2603:10a6:10:46e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 15:22:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 15:22:14 +0000
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
X-Inumbo-ID: a4a0138f-6b42-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJGdZSGA+Zz+MDqpTkkfwgrZXKIr7iCq3mH2Mrze9k0=;
 b=YZ6WkWUoO+4uFLht6l4/9aCpAYlWS/+kxtb9OR6zzEmtH9hYUB4NUstzSjm2HBe467FbcbiJd0b/dlKPOV6qzIHVijcxmhInAw4PiBhAXeVhTe4rOhbE0TPC0uDwMoI0BqkKMBGRJfQCJYx4pm279SvJ5hlXyoOVMCtacXWIIGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f1d60f574150f9a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBlUlss1jq6MT/ASG/mxKCf0NgjHbpdRNPuqTK8Y3Abul/ayGwCaC96V4CM0td+FcfXporg0pXxSIIGtraHzbIuyPcrrVAZkqiD0GHo3BXm2nsnvlLyEKJksvroLqdrl4tdv0NaQROpd+l8fOGryEiQSr20eeiOzP2GdeKIA84mcMC70V+J39/TeEKWNxu0qAXiL4JZ7cL8ihI66LF9ShNngSSwjemgEJ/qQzvQRB/gOZr9Mqd+rXaBUpOteYu6jAy2Fies5jnmKIL5syOLymNBh5v3iUh3pXiUXfo00rd2M3JEzVx5WmtC7tGb1ZkNwLBc4cArQ+m1cwFANHSjtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJGdZSGA+Zz+MDqpTkkfwgrZXKIr7iCq3mH2Mrze9k0=;
 b=ObHKkPQeOSNpS/Rztggj7M8urCHfJTe/AqueJK5bSJ0grzB8NR1en+/4JsdbLUL+Hx62qOt6TXKc4jSNsg75ysTg0HLZounQ7CI5h74XKF3SeijFxXmgYM8mqcDx0AaOKwvhbRVeeANmApkGbue1Ve7iTfbznPhL1fvPYWD2Y+2+fqCZFtaDq+8pIW6C43TZTjkZyd+GSCTL26Ls9njXwu7wI/wde6+P5LDadrOw5GGbvVcfvOUSUAVZ6rupszc5SwOMUjd8dXeCI6/q5wN0DbNLAyDwIPJWKHFQzUR3XnGdbB9E61QVpuMMQOkmVZiW0V153uK2W5V5JYI0m3nRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJGdZSGA+Zz+MDqpTkkfwgrZXKIr7iCq3mH2Mrze9k0=;
 b=YZ6WkWUoO+4uFLht6l4/9aCpAYlWS/+kxtb9OR6zzEmtH9hYUB4NUstzSjm2HBe467FbcbiJd0b/dlKPOV6qzIHVijcxmhInAw4PiBhAXeVhTe4rOhbE0TPC0uDwMoI0BqkKMBGRJfQCJYx4pm279SvJ5hlXyoOVMCtacXWIIGM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Fix unreachable panic for vpl011 vIRQ
Thread-Topic: [PATCH] xen/arm: Fix unreachable panic for vpl011 vIRQ
Thread-Index: AQHY/0lo6R8O+m1HBk2HOFtyHTk0r65MoCaA
Date: Wed, 23 Nov 2022 15:22:14 +0000
Message-ID: <29E29CB0-35F8-4961-9197-14E8CD7C43CA@arm.com>
References: <20221123143913.6527-1-michal.orzel@amd.com>
In-Reply-To: <20221123143913.6527-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU2PR08MB10278:EE_|DBAEUR03FT030:EE_|AS8PR08MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: ac08c42e-dfa3-497a-3521-08dacd66865a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hs6ic3IROOdez/ETdNeqdUi2TPdC4UzErwgigvr8XJ6B0p5EoDjhZ7pPzoHh6PhoCCGwG/amNkNe1omuAO+8j7auKv+QIh5313wBhc6+CPJJmxZQrzrWZNn+X7sbBpTUOB/scxB8dWLy0rJNsGEmzCpXi9CNqr616U+rpKdmnF+pZSVmxs/nAGrbUOptvkQZeepeRK06MD/GynCQ4pS2df/RiOrbxZH865/fRGooaMKaAgWuq2S28VWNRGduE0oNAbjAN7NL6LzGddyW7faZH86mmAM1gCVS+anddPJFad9deLk56KTJ5RY3IUFLW9CgqU17r8Hq8cuxTuVT284bWuqjshTeBbsSmnd8IX5r8k4ppwKqOx0A21rL84H43EIlxnmrZvzGuip+T4sRhIrkCrEoYrpiKRbIRM+UCwyhCJzNEnufp84yvVCF46iN/A2Magm9BMRhkrXJLjh/SYQ2u/0phlamZUOA58HQacNOArIbyBD8gGVlMwfvSAnu3otUk6nhZ6pR4Y61Q43VtYi3TZQK5dOZsNdFGbM8cCgIbXcpUakyKxhaHSjNX4Bi5KwtFV8hed6iDhOYO3kTw/REKyak2zxUvImpY2zbwqpWcWZdD/JEBbjZ5oHWMx7TIpg8OZrkh02D2GpPjbykQuPZdcp+iMu+2HA7VkmBbvyn/hl661x1VVqSKQ7otN6Lc2S7MG35ujp74tiItHoxr+eU3sgt4w5gebqGEn9t5xauVqA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(39850400004)(136003)(451199015)(122000001)(38100700002)(38070700005)(83380400001)(186003)(53546011)(2616005)(64756008)(71200400001)(54906003)(26005)(6512007)(66946007)(76116006)(6916009)(66556008)(66446008)(66476007)(6506007)(91956017)(8676002)(478600001)(6486002)(316002)(8936002)(33656002)(5660300002)(2906002)(41300700001)(4326008)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4096B94F8D741C4782097AEF009202DE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10278
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e97276ad-8fc0-4ee5-243f-08dacd667fcd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0+ho47lmBH29xXmBAvD0XKHRhmST45z/X5mGZGw/ziUq1ZT+CFwSkqRW1Ollm6pjEWHC3nwJkdd1dUTa+4AsEIfmDaA7PCh0691GVsGmFC24uK9oTVA8WALaBf/eNGn6YB4rmYzVG0o8mggZsf/SnrzbVMYNhnMY9JnEWF8qglOvJqfsCNbHfcu7UOSQuLm0qBfiK0UmLehEgWySE7OJ2X6gZRj9pXBjLBp83qxdR93dfEJlvBYl6QEfD8roors6sD7ew8jFtV8Nwa+jE7DeBKavf+CmfvXFgYfVh0EQ8V3EM2IOjGQGaB021p7F6Fn+bRl+cr3bME2LzOh1oNKdt8oHGqALtQg1yzHmXNFSvvQgUA0z+JhH2YWbaGTyl1o54W2vd1gNYi6b/miEjAafW+Y/tjYZDUT7o8glAhWc0eVWVll3C7Yci2eWy8Bxof8jeNBFcdF6vm04bXLy3Kq89Xy3udKqQ9yvQOr6YSs6BVwft6U14hEZ93Ccdy06q5+CTO4h/8dNFnlz3ElK+2jqAiFz+MBO1ZyWCANoHr4+Yarj1Bm1uDXkWh3Qe59E56DH98uUfszF/EEyPIAXj24l5kbx9T3arbEzB4VIjSTxyXZ0Ue3ogRrjN3kDwY0tYnpGBURQkRKSnP31I9sTJfNaY8EmZfoNDMlGxO/hbAVrRin4qoUeFBo1y3QUwofF9oiieXeKa33BliAx3xqvTumxJg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(2906002)(107886003)(336012)(2616005)(47076005)(186003)(26005)(6512007)(36756003)(6486002)(53546011)(478600001)(36860700001)(86362001)(40480700001)(356005)(40460700003)(82740400003)(81166007)(83380400001)(33656002)(6506007)(82310400005)(8936002)(6862004)(41300700001)(8676002)(4326008)(70586007)(54906003)(70206006)(316002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:22:25.0607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac08c42e-dfa3-497a-3521-08dacd66865a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990

Hi Michal,

> On 23 Nov 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> When creating direct mapped domU, the vIRQ for vpl011 is taken from
> the SERHND_DTUART serial port using serial_irq. This function can return
> -1 (i.e. no interrupt found) in which case we should call a panic.
> However, vpl011_virq is defined as unsigned int which causes the panic
> to be unreachable, because less than zero comparison of an unsigned value
> can never be true. Fix it by defining vpl011_virq as int.
>=20
> Fixes: 3580c8b2dfc3 ("xen/arm: if direct-map domain use native UART addre=
ss and IRQ number for vPL011")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>


> ---
> To be considered to be taken for 4.17, although direct-map depends on
> CONFIG_STATIC_MEMORY which is marked as unsupported.

At this stage I do not think we should back port it for the release.
We should consider this as candidate for 4.17.1

Cheers
Bertrand

> ---
> xen/arch/arm/domain_build.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index bd30d3798c9a..71a3243f48c5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3897,7 +3897,7 @@ void __init create_domUs(void)
>=20
>         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) =
)
>         {
> -            unsigned int vpl011_virq =3D GUEST_VPL011_SPI;
> +            int vpl011_virq =3D GUEST_VPL011_SPI;
>=20
>             d_cfg.arch.nr_spis =3D gic_number_lines() - 32;
>=20
> --=20
> 2.25.1
>=20


