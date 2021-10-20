Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 411CA434C02
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 15:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213930.372302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBaA-00034C-G5; Wed, 20 Oct 2021 13:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213930.372302; Wed, 20 Oct 2021 13:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBaA-00032P-CN; Wed, 20 Oct 2021 13:24:38 +0000
Received: by outflank-mailman (input) for mailman id 213930;
 Wed, 20 Oct 2021 13:24:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=faDG=PI=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mdBa9-00032J-78
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 13:24:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7ad1d5e-23da-44ae-aeac-d70c10a3fd43;
 Wed, 20 Oct 2021 13:24:35 +0000 (UTC)
Received: from AM6P192CA0062.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::39)
 by DBBPR08MB6187.eurprd08.prod.outlook.com (2603:10a6:10:209::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 20 Oct
 2021 13:24:22 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::a3) by AM6P192CA0062.outlook.office365.com
 (2603:10a6:209:82::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 13:24:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 13:24:22 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Wed, 20 Oct 2021 13:24:21 +0000
Received: from d7b54d621a2b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB070066-E1D8-4B4C-AE61-3AE41166E76A.1; 
 Wed, 20 Oct 2021 13:24:10 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7b54d621a2b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Oct 2021 13:24:10 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB4185.eurprd08.prod.outlook.com (2603:10a6:10:aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 13:24:08 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 13:24:07 +0000
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
X-Inumbo-ID: a7ad1d5e-23da-44ae-aeac-d70c10a3fd43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMnlSk7ryK/CuINV4bvRZ+yHVMIhjzh1KukZkqwxgg0=;
 b=MhXccfRgs69a0xTnUGPscQqV5qCjj8ti6XjxL3MPl72fE92/CGGLCNeM6ybZDLwud8b74DhlZ7w1b1edXiRYKlch3sD6t8xsDRd93GRbMkjisTo8zeYOVeYc2p/r01vKei7bMDsbN/WX7YdHlVv+v9z8QXIdL/G12wh6zhyXNY8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6cac44c3614e7c4b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3knO7q7f0szjbcg7/7n4rChTPPeBDIGdfJ+AeW3Mdqers+sXZyqZstA3IF0Xnv0H/d+5XxqD3Zcz054ffLWwwDE3d6BY46sVYe6NlFc+Ny2zXRjYn59KbMHLoPdZszwOYCJ69u3eJOr/6Lch83wVUf0uZp4qVpJk5TTaShZnhXlk+0MSCQI7XMKXtazFtTHPrd8FgQt/dH8mY0zudwg00Mdkr95owakwqu18KuuHYfjhPbhuCCe+ZeGeTfrgGjdiS1BXbzoJpF8tVyk1xsAXvYbSmx6GRdcczOqQLZqwSMfBpBbwKJjVU1bZAzls6J/CeorFPdB+V+lufNOuJuj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMnlSk7ryK/CuINV4bvRZ+yHVMIhjzh1KukZkqwxgg0=;
 b=l85m5bUe6FE7mE2CpJZmw+Yq/uE2bW21OjliZfqWXTNNsY43rydgAnfV2lfFfvehbWBYdWLeqRUfACGGmjKZDAxVe0gt2YFNGV9MtAEh0y0xatcNk9LRUqpdXA21HnXyicVAn2EbpsMJahUbIqGPEf9iCTddkIcFmEj64ci7VnMrIlK6BHClKAlmT2ZbbIJt7ZnQnzkwoASvpJLGj3ij9Ka2eVfKCsm4M8tNbfH38t2kGQSYoui8O2rOrlm+Y7+nKLD9jVFEyte1lo3YT8JqKv5dnXlgo3MQPVsZzLYxCEBBBl69hLm7sefYQToWRvM+cWFFKOEsc8CZWcoZ34QCXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMnlSk7ryK/CuINV4bvRZ+yHVMIhjzh1KukZkqwxgg0=;
 b=MhXccfRgs69a0xTnUGPscQqV5qCjj8ti6XjxL3MPl72fE92/CGGLCNeM6ybZDLwud8b74DhlZ7w1b1edXiRYKlch3sD6t8xsDRd93GRbMkjisTo8zeYOVeYc2p/r01vKei7bMDsbN/WX7YdHlVv+v9z8QXIdL/G12wh6zhyXNY8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Hongda Deng <Hongda.Deng@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Wei Chen
	<Wei.Chen@arm.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers access
Thread-Topic: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers
 access
Thread-Index: AQHXxZrAxvKJmM1p6EelRjLGqFxZEKvb4E+A
Date: Wed, 20 Oct 2021 13:24:07 +0000
Message-ID: <87512F00-48DA-4E66-B3A8-47F48B9C6A87@arm.com>
References: <20211020101021.9793-1-Hongda.Deng@arm.com>
In-Reply-To: <20211020101021.9793-1-Hongda.Deng@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 75674ecf-e2ca-439e-1e9b-08d993ccede9
x-ms-traffictypediagnostic: DB8PR08MB4185:|DBBPR08MB6187:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6187D417B9ADC967B1D9AEA59DBE9@DBBPR08MB6187.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0fMmHCmFYAg1JTvOuDLiSR5O2/yIh5QHqcxDgjrM/zmW3BFkp7oaELw12h9Zibr3elrPMyi2p6ZMY3cnpxjtWUT9dFXE+++lsghtOjQyiRYCxWZNasprtOKAaTBpheyG6EODOKm0t7ee65bj9SbJi50q3JP1JNvOvrd/HuDpzp5QadazHyLicoYxIgt+x9vRFfF4RrYR/wO0SYS/Bm5Q+FBLJIORHSrzMK9PpZlFcVO4W/htSw24X/kxJ/3xHdCuxu7iG9sTAwKn7YXzWGB6uKKmQjTZ5FeHXcQ76xI3KPU5NObLN+xW7xrulkyt4v85/xBjy6Xu9k/Z+DtWIhVXUw9k0B9IrIGREiv8TAh1q6Ztfqq9EpQwi1wzeb6XPjnbIdlCNOwYDN+m2FPlawsX9dI9WY/9tqyH5O/R0EYEohx7fJeLqdnLN+HrrAoJG6+I+Vq0aL052NUXN0HxVkMmzPBbkMq1cyDKUMub8NQwVrkvY+ELKPsH8ytatMXP5u0YYJxWmsnn8a7+asnOccUzu0WUHHRHLP7HhShztmrTbxptOIHw75O33Db4IBjRR4yD+uv8mkDGkeTIU8jDgrz4b4Zt88dLieqUb/Cap7tIKeZf0h9d0gnDjw9psVBdeBkxSeoJS9tsuslfVU5dXbQsqA9/tz9PF1VYvRmgsdNq6b9jZXQTrYXJgStP8/VJdLSfvKGBDiF2vDHvByqLEEf+zM9MZJwua7ey8GkvIjQoMj++vuLKYpaXIe+nHhKjKwcZCWxjhOjqsyGl0KUF7SPJLvYPZa9aVIMAEbVMlsEUNZ131d0heLlBjxSKC/Pq5ZnUTCGwapsML19XBj08S4vEGg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(71200400001)(508600001)(26005)(4326008)(966005)(36756003)(6506007)(53546011)(86362001)(186003)(122000001)(8676002)(8936002)(83380400001)(37006003)(6512007)(54906003)(38070700005)(66556008)(91956017)(66946007)(76116006)(64756008)(66446008)(6636002)(38100700002)(66476007)(316002)(33656002)(6486002)(6862004)(2616005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <74F5D0303B50D34ABA35D920BAAF597F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4185
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7b7c32ae-fbbd-4c3a-0e88-08d993cce556
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yjyotJWYMO6BwaCUsgk6b8Ps3P7PfrVf1qFDSVlsvxDl5rEFBY9/7iKSQtpPZCVB7lcNLJI4++jm6oL9egh6oeMYJyqCfsqNF+qEwjMdB6/vfobHTVeFBHXBDmzOzq4NGAlYsqzI3H4syDH3iNuC0PjDnE8jIlcTwXo/LwQCuhQaF2sSXGWJVWw8L24ducxkk1WLl2nLfUISSlYjvAuZ5CQSok1GFiu0PfMzfTMMi2HCrpVdz0h7Yw9PIz5yFsYscY/SPZq+Pyw95VucU6NovY+/TXDgcGEeepPJSlfKwfN4lB6mFq21umOmdCIZ1NHTa7QHn5sEfZ8Oow8Zpbx9tyeESJM6q+sKHfLRd4nLTnBq/4LAceQoyj/NY9LGV6M7gmmGrcgEUd+g9QS+ZU+FAJyDer4V+VtQ2MBxTJEqTlQibT9GFu8hKd5qtlAWCJI6izXUi/XppkQAh+ss1epy2TFPHgATLISDQXBtkQUyBCfzYYxEttvvk32NMzFD1LXQdzomIT+KiirPGIU9bFVuxzI+ujrVK33qiq+C20yP8GXEnG2WxQOxXCM//N1OQFO5v5EXMF4GFk0P8GAFo0ed/BwU1cnn0vSBMA7dOp9AO6v/qkC5zvax2IIH0aSUGLgjBp4qzTyaQTed44qQrvD3pBZoy1Ihiv4TqiJ0eIngoHlIhXyW+uoaoHaw+5Fvomzh0wGjPqF1zBziJBulcZek6WRJMDfXHFvzx2g/K5n+OhUadPAdwbjJSTyZzAU9d2lFCMIg0nO0nJ1mK0E6FCi1d0qw+F0y5WOdZ1JbPcalta4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(81166007)(54906003)(6486002)(70586007)(336012)(186003)(6506007)(356005)(5660300002)(47076005)(8676002)(82310400003)(86362001)(36860700001)(6862004)(508600001)(316002)(2906002)(33656002)(2616005)(36756003)(37006003)(83380400001)(26005)(53546011)(6512007)(4326008)(966005)(8936002)(6636002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 13:24:22.2302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75674ecf-e2ca-439e-1e9b-08d993ccede9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6187

Hi Hongda,

[+Ian]

> On 20 Oct 2021, at 11:10, Hongda Deng <Hongda.Deng@arm.com> wrote:
>=20
> Currently, Xen will return IO unhandled when guests access GICD ICPENRn
> registers. This will raise a data abort inside guest. For Linux Guest,
> these virtual registers will not be accessed. But for Zephyr, in its
> GIC initialization code, these virtual registers will be accessed. And
> zephyr guest will get an IO data abort in initilization stage and enter
> fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
> we currently ignore these virtual registers access and print a message
> about whether they are already pending instead of returning unhandled.
> More details can be found at [1].
>=20
> [1] https://github.com/zephyrproject-rtos/zephyr/blob/eaf6cf745df3807e6e
> cc941c3a30de6c179ae359/drivers/interrupt_controller/intc_gicv3.c#L274
>=20
> Signed-off-by: Hongda Deng <hongda.deng@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Ian this is fixing a bug in the vgic implementation which is preventing to =
run
Zephyr as a guest on top of Xen. Xen support has now been merged in Zephyr
so this is required to use it.

Could we consider adding this patch into the 4.16 release ?

Thanks
Bertrand

> ---
> Changes since v2:
> *  Avoid to print messages when there is no pending interrupt
> *  Add helper vgic_check_inflight_irqs_pending to check pending status
> *  Print a message for each interrupt separately
> Changes since v1:
> *  Check pending states by going through vcpu->arch.vgic.inflight_irqs
>    instead of checking hardware registers
> ---
> xen/arch/arm/vgic-v2.c     | 10 ++++++----
> xen/arch/arm/vgic-v3.c     | 16 ++++++++--------
> xen/arch/arm/vgic.c        | 36 ++++++++++++++++++++++++++++++++++++
> xen/include/asm-arm/vgic.h |  3 ++-
> 4 files changed, 52 insertions(+), 13 deletions(-)
>=20
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index b2da886adc..7c30da327c 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -481,10 +481,12 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
>=20
>     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: vGICD: unhandled word write %#"PRIregister" to ICPE=
NDR%d\n",
> -               v, r, gicd_reg - GICD_ICPENDR);
> -        return 0;
> +        rank =3D vgic_rank_offset(v, 1, gicd_reg - GICD_ICPENDR, DABT_WO=
RD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +
> +        vgic_check_inflight_irqs_pending(v->domain, v, rank->index, r);
> +
> +        goto write_ignore_32;
>=20
>     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index cb5a70c42e..4913301d22 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -817,10 +817,12 @@ static int __vgic_v3_distr_common_mmio_write(const =
char *name, struct vcpu *v,
>=20
>     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR=
%d\n",
> -               v, name, r, reg - GICD_ICPENDR);
> -        return 0;
> +        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +
> +        vgic_check_inflight_irqs_pending(v->domain, v, rank->index, r);
> +
> +        goto write_ignore_32;
>=20
>     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> @@ -987,10 +989,8 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu=
 *v, mmio_info_t *info,
>=20
>     case VREG32(GICR_ICPENDR0):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to=
 ICPENDR0\n",
> -               v, r);
> -        return 0;
> +        return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
> +                                                 info, gicr_reg, r);
>=20
>     case VREG32(GICR_IGRPMODR0):
>         /* We do not implement security extensions for guests, write igno=
re */
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 8f9400a519..0565557814 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -726,6 +726,42 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic=
_version)
>     }
> }
>=20
> +void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
> +                                      unsigned int rank, uint32_t r)
> +{
> +    const unsigned long mask =3D r;
> +    unsigned int i;
> +    unsigned long flags;
> +    struct pending_irq *p;
> +    bool private =3D rank =3D=3D 0;
> +    struct vcpu *v_target;
> +
> +    for_each_set_bit( i, &mask, 32 )
> +    {
> +        unsigned int irq =3D i + 32 * rank;
> +
> +        if ( private )
> +            v_target =3D vgic_get_target_vcpu(v, irq);
> +        else
> +            v_target =3D vgic_get_target_vcpu(d->vcpu[0], irq);
> +
> +        spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
> +
> +        p =3D irq_to_pending(v_target, irq);
> +
> +        if ( unlikely(!p) )
> +        {
> +            spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
> +            continue;
> +        }
> +
> +        if ( !list_empty(&p->inflight) )
> +            printk("%pv trying to clear pending interrupt %u.\n", v, irq=
);
> +
> +        spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
> +    }
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index 62c2ae538d..abcaae2969 100644
> --- a/xen/include/asm-arm/vgic.h
> +++ b/xen/include/asm-arm/vgic.h
> @@ -298,7 +298,8 @@ extern bool vgic_to_sgi(struct vcpu *v, register_t sg=
ir,
>                         enum gic_sgi_mode irqmode, int virq,
>                         const struct sgi_target *target);
> extern bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned=
 int irq);
> -
> +extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vc=
pu *v,
> +                                             unsigned int rank, uint32_t=
 r);
> #endif /* !CONFIG_NEW_VGIC */
>=20
> /*** Common VGIC functions used by Xen arch code ****/
> --=20
> 2.17.1
>=20


