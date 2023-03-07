Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1921E6AE4BE
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507516.781112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZHS-0004tZ-Gb; Tue, 07 Mar 2023 15:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507516.781112; Tue, 07 Mar 2023 15:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZHS-0004qM-D7; Tue, 07 Mar 2023 15:31:10 +0000
Received: by outflank-mailman (input) for mailman id 507516;
 Tue, 07 Mar 2023 15:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TARO=67=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pZZHQ-0004qG-Gc
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:31:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe12::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 145a3f41-bcfd-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 16:31:08 +0100 (CET)
Received: from DB8PR09CA0017.eurprd09.prod.outlook.com (2603:10a6:10:a0::30)
 by AS8PR08MB9454.eurprd08.prod.outlook.com (2603:10a6:20b:5ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:31:02 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::b9) by DB8PR09CA0017.outlook.office365.com
 (2603:10a6:10:a0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Tue, 7 Mar 2023 15:31:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28 via Frontend Transport; Tue, 7 Mar 2023 15:31:01 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135");
 Tue, 07 Mar 2023 15:31:01 +0000
Received: from 620310e8841a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5E8A581-4040-41F0-82A8-87BE918BAAFC.1; 
 Tue, 07 Mar 2023 15:30:54 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 620310e8841a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Mar 2023 15:30:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7722.eurprd08.prod.outlook.com (2603:10a6:10:391::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 15:30:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 15:30:51 +0000
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
X-Inumbo-ID: 145a3f41-bcfd-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m39fUHKbdsfSZAPKYUk/QrC/E12wp8gklOEiWmeXzM=;
 b=4izBWgklCMdDeOeXpCujacxXrzE1dxUUd5EHRvWXxOqcBHE2DjcgN6dMEFsSAcNY7IUxQvxWP/Ajcim1ijwSOyORZAvExhGMEm7rUV6uq1vDEwB5BkHFCd2oXFzvcKmms3XRh7g+zgLrWQzZCwDEfIpbUpvdXJJVZEc+X9QfM2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7bb3030cf0f6bbbf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXtfMCz9FG5PICueB5gsfgjPssfL+pGGCwxo0b3OP5sEDyXDIDPHMUwAU2+c6FZ/YwKSmlpLNMQo9AWER2juhsVtlLrmI8tPZSr5JLfnV98ZX2gSFeqCSQYFpXDXR8pO4012v5CkOehyAaOQxWqgXy8FNHNtcpxe6+uAAD/Iv21jcEAWeYjZ9Eki8DWL4ucvBtv8ALkflC9nVk1xjJC5lT4fDGeFFvJ1W8OznghnmVI/MhxWXckkdqsTd/MpS9CU8QS51gXWwmsJ5+08sGQpQenpREiCmsNx9QtAecDF+iL/kMeyrQolu0FlvQ5IaRgDUrQgfJUPwsvCgCN9oXcCJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m39fUHKbdsfSZAPKYUk/QrC/E12wp8gklOEiWmeXzM=;
 b=W6RE8fed8XgMX3hva1MlYJ0oa7g4FnvKrsjBPCLFzwu5bS40cFGHTtdEB8tLgDxFRGpWTmdNt8eN3WucErOAjteIdeGrAFdenFq1CBOlUbajQF7NlK6FIa5B+1ksueQjpxWNFy80WfJ4uhklKl/KdPb30B3m0Q5YHV1j0W+HNgeHU/Z3mlcHotPH6TFpLBXyB3Dn+II1S7WhrSjRSUKBxYcpPJAbq95/3/FYCtJn5J6019ZP3KxmH1vo3PGaWXd2DuvOtSkjlsufQdYAzbeTQGPiBmhlenIU6V/yHlW2Ldt5LrkJDrVnO8Ws7ZveD20wDK7/nPrXbvhXjmIF0FSEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m39fUHKbdsfSZAPKYUk/QrC/E12wp8gklOEiWmeXzM=;
 b=4izBWgklCMdDeOeXpCujacxXrzE1dxUUd5EHRvWXxOqcBHE2DjcgN6dMEFsSAcNY7IUxQvxWP/Ajcim1ijwSOyORZAvExhGMEm7rUV6uq1vDEwB5BkHFCd2oXFzvcKmms3XRh7g+zgLrWQzZCwDEfIpbUpvdXJJVZEc+X9QfM2o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrei Cherechesu
	<andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/2] arch/arm: irq: Add platform_get_irq_byname()
 implementation
Thread-Topic: [PATCH v1 1/2] arch/arm: irq: Add platform_get_irq_byname()
 implementation
Thread-Index: AQHZUN0vf7k+uGdDiEO/X3y/WMrgC67vcdEA
Date: Tue, 7 Mar 2023 15:30:51 +0000
Message-ID: <CFC6E8A8-4826-44AE-96FE-8FE2696E91CF@arm.com>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-2-andrei.cherechesu@oss.nxp.com>
In-Reply-To: <20230307100949.9231-2-andrei.cherechesu@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB7722:EE_|DBAEUR03FT061:EE_|AS8PR08MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 948e94e9-38e9-4637-2c6e-08db1f20f527
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v0AwNZhdrUT63ao/AC3ve31zzS8rknzm+wYkgRom2oc7J4b1pziTHbaOHEIiG9vZPeLWax9RaL990Owavwe0EUFG7FPsuvl1B9Cr9xu/L+Vv7bSRdjFbBpi2Hw1ZupAmcBhINvHsztHNVowYNGXxAqWZG7tWUKL/UC4A2u9vz3HZqAx8M+NWkm9Q6WrWmvvbsmYPL1/8vlUU4X/5rABkMhEncoEhtdSRRDmCp1DaI77vZAgfka1og0II5zuuGZnCzkVHfyBquFHNag4/AAqE9PrwaUVMqjqpsQak4ruBDKJ8O1sXsOK7G/5GDylQCYf30NZhFDJLPSC2EIqN4l0NkrkaFX5SeHEIFDtUOCP6aB1UtGbeLcWh+M4nu78zRfdfbpXyyNOb6uiluCEf62gvu04JK/hxPhg4bzjEP8MONb1QP/zmbaZH9qSUvKIv4EIxyd9GD8SruciWFsNk2/Ln2uC9l/rCafn8bwKRnf58UTCqiervqc5J1ZUl8z4BZIJdryiIFICHJkS4L2cWOZxLX27y7pIF8BgDu9qjSGtUewH6pEQH33DKR9o5BzswFT26TSRuxzJWtquNB1MsmcdbQo8opOK2LeaB6i1V7Ok4yy1sGCVHxWG+tLg+C1H27sPo5/z8w5PVDP/YKvLEaraCPEg/ffQrOAvKTXphG2ocuDtvDIB1JjC+u0GKSkSymn4HC9fO/g5wC2RBVoRneabEYhooE71X2MWfMrrhwJvGgrw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199018)(8936002)(5660300002)(66446008)(76116006)(66946007)(91956017)(66556008)(2906002)(66476007)(6916009)(8676002)(4326008)(64756008)(54906003)(316002)(478600001)(71200400001)(36756003)(6506007)(6486002)(53546011)(41300700001)(83380400001)(2616005)(33656002)(38070700005)(86362001)(122000001)(186003)(38100700002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <141969BEF250CC478AE16AE7E5B12B03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7722
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97832c26-4bc8-46f1-cad7-08db1f20ef4e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lGjf0i4mrvEx1OHkX51pXOQOdvGg1Z9N0gyJNxnDNUH8WQytRl8ccDDLczGo3LnnqaBLNf6qrXPAmclYdSg8DDWFfU8y8SGjJUzKCZzcilpoMuttrYTIe+EP9FSofNfRZuRKvgwonjaxIMBwRwpti+uKDx+cTqly5vGHVBRRRv1fNl0HQHHieANI9+enh/ES862vU+n/JbzfjM0pTBUS8X7Zn4XjH/na2B+ws/4HtgyFJE4Wsm0tXn4/tLnodLYofl0y70YUc1oTZGfrvAKM81MsTyxBFphpdKDdUCG2/8jCcvE/lKLijklBwP3wUkZXudtNObCO4siuO01TLSusaUblofdBIz3ub//xMaVHAS3qfiyBdNAo+mNJwsFUM7BouyEYXiJ0O7N3M6D7QfhPeNIaZHjqUXqBmI72gHqRBkXQqoj5/k84DSJ0Q4LFH6VJ/4BOCkEF0xrCPckwtEQDVOAwMFW2d9pM4qm+aUfxcdG4DtybAPPrh9OUEq3C94x960PvtnKVn6+C+6zbTFJCuxrOgy+AWkGnK3KfoyLyNuT6VXmRRp6GjGa72l7FHQ/V+RxuEPMt5qZe/0OuGcpOnLMwm4jH5l4whL5s/DTkvJEZjys4osIrclbNUAkjdPFevWbsb3tGme5ZN0XtctLN21Nx6+WGig0ba6+i4lSPt18NftUN2OvMlzIn2UF3buyNXV7z5mk2PKIr9LkvE2KqoQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199018)(36840700001)(40470700004)(46966006)(83380400001)(316002)(8676002)(4326008)(70206006)(70586007)(86362001)(82310400005)(81166007)(40480700001)(2616005)(336012)(356005)(186003)(36860700001)(82740400003)(26005)(36756003)(478600001)(54906003)(6486002)(107886003)(33656002)(6506007)(6512007)(47076005)(53546011)(40460700003)(5660300002)(8936002)(6862004)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:31:01.5300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 948e94e9-38e9-4637-2c6e-08db1f20f527
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9454

Hi Andrei,

> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.n=
xp.com> wrote:
>=20
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>=20
> Moved implementation for the function which parses the IRQs of a DT
> node by the "interrupt-names" property from the SMMU-v3 driver
> to the IRQ core code and made it non-static to be used as helper.
>=20
> Also changed it to receive a "struct dt_device_node*" as parameter,
> like its counterpart, platform_get_irq(). Updated its usage inside
> the SMMU-v3 driver accordingly.
>=20
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/irq.h        |  2 ++
> xen/arch/arm/irq.c                    | 14 +++++++++++
> xen/drivers/passthrough/arm/smmu-v3.c | 35 +++++----------------------
> 3 files changed, 22 insertions(+), 29 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index 245f49dcba..af94f41994 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -89,6 +89,8 @@ int irq_set_type(unsigned int irq, unsigned int type);
>=20
> int platform_get_irq(const struct dt_device_node *device, int index);
>=20
> +int platform_get_irq_byname(struct dt_device_node *np, const char *name)=
;
> +
> void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask);
>=20
> /*
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 79718f68e7..ded495792b 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -718,6 +718,20 @@ int platform_get_irq(const struct dt_device_node *de=
vice, int index)
>     return irq;
> }
>=20
> +int platform_get_irq_byname(struct dt_device_node *np, const char *name)
> +{
> + int index;
> +
> + if ( unlikely(!name) )
> + return -EINVAL;
> +
> + index =3D dt_property_match_string(np, "interrupt-names", name);
> + if ( index < 0 )
> + return index;
> +
> + return platform_get_irq(np, index);
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index d58c5cd0bf..bfdb62b395 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -200,30 +200,6 @@ static inline void dev_iommu_priv_set(struct device =
*dev, void *priv)
> fwspec->iommu_priv =3D priv;
> }
>=20
> -static int platform_get_irq_byname_optional(struct device *dev,
> - const char *name)
> -{
> - int index, ret;
> - struct dt_device_node *np  =3D dev_to_dt(dev);
> -
> - if (unlikely(!name))
> - return -EINVAL;
> -
> - index =3D dt_property_match_string(np, "interrupt-names", name);
> - if (index < 0) {
> - dev_info(dev, "IRQ %s not found\n", name);
> - return index;
> - }
> -
> - ret =3D platform_get_irq(np, index);
> - if (ret < 0) {
> - dev_err(dev, "failed to get irq index %d\n", index);
> - return -ENODEV;
> - }
> -
> - return ret;
> -}
> -
> /* Start of Linux SMMUv3 code */
> static bool disable_bypass =3D 1;
>=20
> @@ -2434,6 +2410,7 @@ static int arm_smmu_device_probe(struct platform_de=
vice *pdev)
> int irq, ret;
> paddr_t ioaddr, iosize;
> struct arm_smmu_device *smmu;
> + struct dt_device_node *np =3D dev_to_dt(pdev);
>=20
> smmu =3D xzalloc(struct arm_smmu_device);
> if (!smmu)
> @@ -2451,7 +2428,7 @@ static int arm_smmu_device_probe(struct platform_de=
vice *pdev)
> }
>=20
> /* Base address */
> - ret =3D dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
> + ret =3D dt_device_get_address(np, 0, &ioaddr, &iosize);
> if (ret)
> goto out_free_smmu;
>=20
> @@ -2484,19 +2461,19 @@ static int arm_smmu_device_probe(struct platform_=
device *pdev)
>=20
> /* Interrupt lines */
>=20
> - irq =3D platform_get_irq_byname_optional(pdev, "combined");
> + irq =3D platform_get_irq_byname(np, "combined");
> if (irq > 0)
> smmu->combined_irq =3D irq;
> else {
> - irq =3D platform_get_irq_byname_optional(pdev, "eventq");
> + irq =3D platform_get_irq_byname(np, "eventq");
> if (irq > 0)
> smmu->evtq.q.irq =3D irq;
>=20
> - irq =3D platform_get_irq_byname_optional(pdev, "priq");
> + irq =3D platform_get_irq_byname(np, "priq");
> if (irq > 0)
> smmu->priq.q.irq =3D irq;
>=20
> - irq =3D platform_get_irq_byname_optional(pdev, "gerror");
> + irq =3D platform_get_irq_byname(np, "gerror");
> if (irq > 0)
> smmu->gerr_irq =3D irq;
> }
> --=20
> 2.35.1
>=20
>=20


