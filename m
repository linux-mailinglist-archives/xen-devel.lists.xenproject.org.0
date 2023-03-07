Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BB86AE501
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507525.781132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZOw-000697-L4; Tue, 07 Mar 2023 15:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507525.781132; Tue, 07 Mar 2023 15:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZOw-00066O-Hr; Tue, 07 Mar 2023 15:38:54 +0000
Received: by outflank-mailman (input) for mailman id 507525;
 Tue, 07 Mar 2023 15:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TARO=67=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pZZOv-00066G-Vr
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:38:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29adf11c-bcfe-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 16:38:52 +0100 (CET)
Received: from DBBPR09CA0024.eurprd09.prod.outlook.com (2603:10a6:10:c0::36)
 by DBBPR08MB5963.eurprd08.prod.outlook.com (2603:10a6:10:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:38:50 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::6) by DBBPR09CA0024.outlook.office365.com
 (2603:10a6:10:c0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:38:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29 via Frontend Transport; Tue, 7 Mar 2023 15:38:49 +0000
Received: ("Tessian outbound 55ffa3012b8f:v135");
 Tue, 07 Mar 2023 15:38:49 +0000
Received: from 7e1a2f40f6fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7850B24E-9C3B-4732-9A17-D88C6FEF06E0.1; 
 Tue, 07 Mar 2023 15:38:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e1a2f40f6fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Mar 2023 15:38:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5445.eurprd08.prod.outlook.com (2603:10a6:20b:10d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:38:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 15:38:39 +0000
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
X-Inumbo-ID: 29adf11c-bcfe-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//a1vcf1wJA4hnT9ci4K37o7JM9BgcgphPNyerFUPLo=;
 b=8Po8UMYmke/o+6onau8RBgo604Jf3GxEA85RCqnNhJvWFEpZoy99pb6C5ADaPWrV6hPwlNToMmxFU6eXQeIt4gTnm4am9edMtbuOJ4faeuLJsVQZUFB7RnDcFECfAcTNYzWk+tBrQLUqGcj0GLYUm2iuxrN+LP0fqtKf5SCYMTE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b50d4919ecc494e6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSVZh5w7D7ntL0BpXRz15v3rbUyNK3LVXM/S5Qz7JiQ6G9FTPyoh0yiyMhQtByS2jsWre3MSKWzt52jn+ixh9lyof2Nlp1z4gDl0dOjAoOZtj6KlvxaPkKSUzhWteEgDCsz5BdZh6Txq1Qj+u1H5w5g5Sbc07IFAHr0OblRXq5/u6OPf0kXQ4RdxJIzoGkmfJd1hayWoaD9sGZvE584kThKQUW58I2Pg/gUZN4Dvf5s5nVn2MJr6TlqAEeqIw3Z6vALEIByFqQyRJ2FdIAfa3H0qKdPvoaD5nbsVQS61OhePRYRW18ORy1VUngWDI6FpAnq1AWluvhheU8MStdsV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//a1vcf1wJA4hnT9ci4K37o7JM9BgcgphPNyerFUPLo=;
 b=TAssGFAHtwvFVRUrafTsT2ifPICCE9fvC41fn/8ilE5VgU0dK+pSX6ipIyOAARorMJQdUIV58Sf6+nB+jwIt01j4F94Jnr8zDo3B6t4iiAMyAYW66kGMLuJf9okToRtb5qi+OQ9TPhoyOU2uBzgch62YNjTn9ZStzpsddW0FKPofGr6LerU5LQwjK4U2FHVD63iS0ZlJPxTBmEQuPGoGvJgw0u2VKolWqlHhCUcltdcwVHbhmsS9cUhsPd0SMJCEzyfdBKFZs2wA2AaIS32piDhvtG4lLCRI7JcT9pMhKSTKw1zR6FbFTQevDdWGumd/pQSFsaWu1EsHGynZK8fMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//a1vcf1wJA4hnT9ci4K37o7JM9BgcgphPNyerFUPLo=;
 b=8Po8UMYmke/o+6onau8RBgo604Jf3GxEA85RCqnNhJvWFEpZoy99pb6C5ADaPWrV6hPwlNToMmxFU6eXQeIt4gTnm4am9edMtbuOJ4faeuLJsVQZUFB7RnDcFECfAcTNYzWk+tBrQLUqGcj0GLYUm2iuxrN+LP0fqtKf5SCYMTE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrei Cherechesu
	<andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Thread-Topic: [PATCH v1 2/2] arch/arm: time: Add support for parsing
 interrupts by names
Thread-Index: AQHZUN0sbGmRWBiDtEmQnPFLsz5lVK7vc/8A
Date: Tue, 7 Mar 2023 15:38:39 +0000
Message-ID: <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
In-Reply-To: <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM7PR08MB5445:EE_|DBAEUR03FT034:EE_|DBBPR08MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 92121148-e1b2-41a9-6946-08db1f220c46
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8n7/LZCw+fKnAF5uWQ2LFkDwKPk3plq6kRwg6XijHB2L2GDcRLcX5pnmtdkCcc0BeCqv77b1LaBc3yeGi2mXKpFuwtmAESzrrerax/ZaPzVKMvIYqc6aCHfoyWW071N5XL0sCIB6z+eA7J8UL8eZa0Kdvyirj6aamfq8bCJyQ1NQR//4bQsCnDBNo/G/8npOHQMR3gWccNPn/LniezVPP/xgkg6DMkA7FAKSpQGFcfARBv/79ppy0oy46ZGXif6y1/eqL4Y5EeOhRowC+mW/UZzxqa1glLxBY9UJqfF+LNkBCO1aC5eQMgMqID8PugS4Kcpzlv+ftEPuwAkiC6K71kc99FqKYfmuY9Q78ATgaOFk6Bwty/mlSBBb16yooB/lFrT2a+JEE2ORAA0CBXR3DjRI2ugWEtXYisc/EYwQkHVO7iWp+D6o2cUB7VBFN7ZdoPjsazPV+250GAHJohkmr7ALu9bqOSLzG/ryoJw1vRjSRI/3vZpC1BNvrR1PV4YCLmhrPsV10qAgo+04HfoKYwxqkzrwoV9CKpYpGx+UA8LHHxCu+XiqYnLCRXSfmv6+AqZMeqpZKBe/4ui3Kj2XoU8Yfmsi5JF7Ayl5NQ3QedRUyTC0MJ23G3GLRDFVml2LEVg9nHqCVx5gnOvez471O8Cl7dszPONvUyTUuoAtIqtBNEI9CpiCl74tGJUIIW3FXfm/DVOlPtktOyGNOfhShwR9uZqppDrb3rJfr2yY/JA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199018)(41300700001)(83380400001)(186003)(6512007)(2616005)(38070700005)(122000001)(6506007)(53546011)(38100700002)(478600001)(64756008)(54906003)(66446008)(6916009)(66556008)(66476007)(4326008)(36756003)(66946007)(76116006)(91956017)(8676002)(316002)(6486002)(86362001)(33656002)(71200400001)(2906002)(8936002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EF10CDD9555FBC4AACC8AD76D2C8BA36@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5445
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d746ee46-f160-4f02-7ead-08db1f220608
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OrlyAN7uZDQluQ+v/hQBgxJbXVfXnJTQ4EWtAZQBDk7wnp4ZnmIIsv5vO+36LHjIXtJTl50fageU/lge0Hp26bipAOIa3tB2h6SMYcVNRM2aZk4qDEgSm9M/5HI9IEXHxxq73AQ1z3aGOZ7lnunct+DYQaVlWimlK68thbDR952ikMT6SaQZU8EPakqe0apr6Vbj7YHQSISZz1v4YpFwlLOSZy0G9CQl5aVM7qVzIufPbjVoYGDGCtxk+AWzPS1bWCBheKC9xkXBCEFWxMBy21y9PekHg1JubA3028DqTA2qLOnPSGMVAXzO9QZBW/fYh/QXA9je9Z5r5LqsVTZV9AwpWaTzWUAa4A7zUVv7S+qa7YZIf8QcSMAgVMA0n/ErHLOyKLmjBA70ZnNgVkYTt57p/DSUn7HtyVg5Z5d8QZBipTLRcE6rciSvyw5iIkKeb4bGkOeqQcyTapVVYAKgFE48Kc7gvWdKlaAeYA9AbfebwnhLH0ZAlkfOt5Pnv0ULb8dhVUmrNeJbiVjIjgzHt5KCFuxnEVpRPtCRjbKMkJwi25mOzx1WMeZa7BhBPB9XIcsZGNL9Ve5eRRi9JRnxJn7nMBCaTDcujglDB4hjLIFndVbt3Xbp2v/DYvBP54D76CV+U4UMMW7rHIcMFoIzh51shpM/aSQMWLxUGnyixH/tZb954O0vvDE+RA7nRkz2LUDLl9rSrrSKGAg8zoG+jQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199018)(40470700004)(46966006)(36840700001)(33656002)(36756003)(70586007)(70206006)(41300700001)(8936002)(6862004)(40480700001)(8676002)(4326008)(2906002)(5660300002)(81166007)(86362001)(36860700001)(82740400003)(356005)(26005)(478600001)(6486002)(107886003)(316002)(54906003)(6506007)(82310400005)(83380400001)(47076005)(336012)(6512007)(40460700003)(2616005)(186003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:38:49.8191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92121148-e1b2-41a9-6946-08db1f220c46
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5963

Hi Andrei,

> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.n=
xp.com> wrote:
>=20
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>=20
> Added support for parsing the ARM generic timer interrupts DT
> node by the "interrupt-names" property, if it is available.
>=20
> If not available, the usual parsing based on the expected
> IRQ order is performed.
>=20
> Also added the "hyp-virt" PPI to the timer PPI list, even
> though it's currently not in use. If the "hyp-virt" PPI is
> not found, the hypervisor won't panic.
>=20
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> ---
> xen/arch/arm/include/asm/time.h |  3 ++-
> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
> 2 files changed, 24 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/t=
ime.h
> index 4b401c1110..49ad8c1a6d 100644
> --- a/xen/arch/arm/include/asm/time.h
> +++ b/xen/arch/arm/include/asm/time.h
> @@ -82,7 +82,8 @@ enum timer_ppi
>     TIMER_PHYS_NONSECURE_PPI =3D 1,
>     TIMER_VIRT_PPI =3D 2,
>     TIMER_HYP_PPI =3D 3,
> -    MAX_TIMER_PPI =3D 4,
> +    TIMER_HYP_VIRT_PPI =3D 4,
> +    MAX_TIMER_PPI =3D 5,
> };
>=20
> /*
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index 433d7be909..794da646d6 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>=20
> static unsigned int timer_irq[MAX_TIMER_PPI];
>=20
> +static const char *timer_irq_names[MAX_TIMER_PPI] =3D {
> +    [TIMER_PHYS_SECURE_PPI] =3D "sec-phys",
> +    [TIMER_PHYS_NONSECURE_PPI] =3D "phys",
> +    [TIMER_VIRT_PPI] =3D "virt",
> +    [TIMER_HYP_PPI] =3D "hyp-phys",
> +    [TIMER_HYP_VIRT_PPI] =3D "hyp-virt",
> +};
> +

I would need some reference or a pointer to some doc to check those.

> unsigned int timer_get_irq(enum timer_ppi ppi)
> {
>     ASSERT(ppi >=3D TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
> {
>     int res;
>     unsigned int i;
> +    bool has_names;
> +
> +    has_names =3D dt_property_read_bool(timer, "interrupt-names");
>=20
>     /* Retrieve all IRQs for the timer */
>     for ( i =3D TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>     {
> -        res =3D platform_get_irq(timer, i);
> -
> -        if ( res < 0 )
> +        if ( has_names )
> +            res =3D platform_get_irq_byname(timer, timer_irq_names[i]);
> +        else
> +            res =3D platform_get_irq(timer, i);
> +
> +        if ( res > 0 )

The behaviour of the code is changed here compared to the current
version as res =3D 0 will now generate a panic.

Some device tree might not specify an interrupt number and just put
0 and Xen will now panic on those systems.
As I have no idea if such systems exists and the behaviour is modified
you should justify this and mention it in the commit message or keep
the old behaviour and let 0 go through without a panic.

@stefano, julien any idea here ? should just keep the old behaviour ?

> +            timer_irq[i] =3D res;
> +        /* Do not panic if "hyp-virt" PPI is not found, since it's not
> +         * currently used.
> +         */

Please respect the standard for comments and keep the first line empty:
/*
 * comment
 */

> +        else if ( i !=3D TIMER_HYP_VIRT_PPI )
>             panic("Timer: Unable to retrieve IRQ %u from the device tree\=
n", i);
> -        timer_irq[i] =3D res;
>     }
> }

Cheers
Bertrand

>=20
> --=20
> 2.35.1
>=20
>=20


