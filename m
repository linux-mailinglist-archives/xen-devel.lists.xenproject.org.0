Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E94D8AE4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 18:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290385.492437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTobS-0002dl-4I; Mon, 14 Mar 2022 17:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290385.492437; Mon, 14 Mar 2022 17:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTobS-0002bQ-1O; Mon, 14 Mar 2022 17:35:30 +0000
Received: by outflank-mailman (input) for mailman id 290385;
 Mon, 14 Mar 2022 17:35:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1jB=TZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nTobR-0002bK-4e
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 17:35:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22663be3-a3bd-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 18:35:27 +0100 (CET)
Received: from DB6PR1001CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::28)
 by AM0PR08MB4483.eurprd08.prod.outlook.com (2603:10a6:208:145::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 17:35:15 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::99) by DB6PR1001CA0018.outlook.office365.com
 (2603:10a6:4:b7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Mon, 14 Mar 2022 17:35:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 17:35:15 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Mon, 14 Mar 2022 17:35:15 +0000
Received: from 64347d83d306.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 093EC78E-DFE6-4DFC-97EE-CBD89DEBD7F4.1; 
 Mon, 14 Mar 2022 17:35:04 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64347d83d306.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 17:35:04 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by VI1PR0801MB2031.eurprd08.prod.outlook.com (2603:10a6:800:8b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 17:34:58 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 17:34:57 +0000
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
X-Inumbo-ID: 22663be3-a3bd-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJDL7ccx5slMFHnI8wW4Mi3rtx40GYNDx/jcbdVxNkU=;
 b=xuPm7wRn8zSak2pp5vYWG64wl62R6aWIoQtUMtGBTsJkkzbQD2cnfh9r4/m4gjvMRwdiPk8orr/u+KnTWvPJClxttRLqHX2YLXAHABj1gbE5h5u8nxfItIeA7YRwt2uEvOOPlEyleDQSXrGhQb9iDCFMo56EZcyo/Y93ulcnkrM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63af4ccee43c779c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwRAHQqE0iFWHwInheFEVWatqea7JEt4njNEktvZ1uMYjyIc3Vka5i4uTRKLSmaeCAtD98+HWr6WIrfTKOZJE6cn0/P4/KcIiyxoLu45bygC+R2vlCvy2yjHcpFqR4iidADVsRXAyLGNTajO747C6CfTB4tMLwffLmZfNrzKU28dP2HbYdDo0vtn810SZIoOWuMIKJhNMTHCmqhMvAsYy+2pO4v1AtD03GZC7RQ1SAgCL+07Odqw7wl3LZtQx+Ut8zldwzaIdvXi1ohH+Vq/76cBY4CsJgHA3YGjSDabfbLMwkNLL/W8lggZhs+ETUCS+xzWIMOx/M7NCHj7pvnDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJDL7ccx5slMFHnI8wW4Mi3rtx40GYNDx/jcbdVxNkU=;
 b=PZtgxOtFGEuvrK/cNiHDsI0EveGoeVHX3epP+TlnvLhTqEl0RO/aPdnZkdmLadtcrkcp+HD7FNBU4mH5RoIZcnD7ho/GrwtTIgcRUaMChHUJcuju9Wg0JVvuGuTGiRcwxGTz6laiGTvDkTU/e0QQKV5wt0duzJoCdtgQof4mILKwLFz2AI3v6ukfdFVsSQoRTxpXVV+PC6Xmb14z9P+4AyA/O9Cq8xqtRTofKnfTAltsPacTbtNgRUSyjuvoxMOR2RMCuP6d77tTAQW4rwAJta3AN2feecF2u6C5hv+2zg9etvbNsBsdDCqATL5h5TzB8+j8hVFDwHHF2x6DE3ST3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJDL7ccx5slMFHnI8wW4Mi3rtx40GYNDx/jcbdVxNkU=;
 b=xuPm7wRn8zSak2pp5vYWG64wl62R6aWIoQtUMtGBTsJkkzbQD2cnfh9r4/m4gjvMRwdiPk8orr/u+KnTWvPJClxttRLqHX2YLXAHABj1gbE5h5u8nxfItIeA7YRwt2uEvOOPlEyleDQSXrGhQb9iDCFMo56EZcyo/Y93ulcnkrM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>
Subject: Re: [XEN][RFC PATCH v3 08/14] xen/iommu: protect
 iommu_add_dt_device() with dtdevs_lock
Thread-Topic: [XEN][RFC PATCH v3 08/14] xen/iommu: protect
 iommu_add_dt_device() with dtdevs_lock
Thread-Index: AQHYMyVll+vC1BXMkUCqASVymvvkmKy/LVYA
Date: Mon, 14 Mar 2022 17:34:55 +0000
Message-ID: <5A6431AB-E5AB-48BB-9C5D-6098FC5392B9@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-9-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-9-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e599d783-c84e-4681-4f15-08da05e1002e
x-ms-traffictypediagnostic:
	VI1PR0801MB2031:EE_|DB5EUR03FT039:EE_|AM0PR08MB4483:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB44837E8518DF26138C820DADE40F9@AM0PR08MB4483.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iiFSjXHt8CRrB+zmpMpz5D5Is8jQdb+KAicMX3lGSTaJKmM6Sw3FNySkDnbVaJr9z/+HeVZL5gks3MuAqO6Q4/7L59Mz35UyT/exG4uJomDKjenWypxhqy1VcKB9+F1BIa7jWPIxd5fNebsWg+AeeA+oJktYJUSQGlReNXf4zsqm3U3/Vwhn0AeWbzjVkRXTQNLuLrFJpKQsLdpEq/fy1ovHihVJxT21XGFrO6NmQwYAq3WZVUQ1SXDOY8fnUTf6dXIlJdzKVOFRb0n/VfBwqjwA3PTmfPZmZWGHe8cyEskGRdifLTkpICYh0qQi1uCiywK7yHmM11a1FKaluci8RBn9Oo3i6H04DmW7ohwTXkAKJrFLp4E7pelO0r0XD666jybBIjh8CEMEX927i9hUfSYPwGD+NhTuRPtXvBPTxiLrDbONupMoS2dQTinfG6FW1QCLo+V5I9fmHev+HzhKOXM29sedat7hGMqObDnJw2T9Rz3Q7PIhX77ozGYKgW4PNxujFeuMqvqB7KNjsPhx+O+A3mUHBtDGDa9+n5Di8vMaPc6Kb4XS3DPKsI6dDyimiBCEFxREh3uyuKX3OSL6Lg+0q+vOWa6kDQnKJr8kGGsJzjTSk2qm9x/R7xdnp5wimSZWL1yeW9PeKRsB4Qx4zkNvrZbvvTDpVbl3LCkSyoe5nhT88wU2z2BH+xhZqvSBapgVZphV0OJFZtD71CV0inMFDvYGOtYtLc3+2GxduDmGBUFcsf6GHc1RIAyTvRoC
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(91956017)(53546011)(66946007)(5660300002)(2906002)(38070700005)(508600001)(8936002)(36756003)(76116006)(66446008)(64756008)(66476007)(66556008)(2616005)(38100700002)(26005)(83380400001)(186003)(316002)(122000001)(8676002)(54906003)(86362001)(6486002)(33656002)(4326008)(71200400001)(6512007)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8C27670A242A64F9F82897FC3BB3E48@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2031
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c8a7b87-2e69-4a87-9c6f-08da05e0f54b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1jDlPFS/GcHigM9eALOy8mRCZ2ahDJqeVQQN0zIeFgU0PNx362u8Kugz0qsliYB+4uZhUz3hqW7SuF9WpzIRM0ofyzYnUzlbE+AEAr8KUwSEDnAHOoW4SHAM3/Dq41USLm7xZNHZ34V38tfHnrGkgPagSYww9W4DnM0fCcvbf59UQksnIZi3vwX1lgjQS4OGgqaoIWH35mRtJ/dgoZEbrJKpDOxNialPrL6+Qesp9rlAlbNX5ra9ZCpIVdrpQtazOMqlfI1eDvSqqTos3zZJDLl9niiFdV0POl8f7OuJPHt6OWTCHLYECLrwFAbSy1qqcUPvLdRmCia7bepGScu8MjqX+JW4PxQBRzl6jYtWnauT/OZ/yMVNxusL68Oyq3rzVvwSoqPt44dbLhvfhhWU568B8jExq869dp3QvYMYoiCiTEp3q+EvN+X2vYY9u7AgYpgNVXo7Kw5OrSQdoiyZN1jdPhfXHg8+V+L4R4v0VZ8aXUOBK2dJmU+5nxJMDmw3X2DUkMuPJWZJGzs5dBk8zO8iJ3f+icBZBS8A7uxXU4EDgPfLG1ydF+dGyJbQS32Nm3XnjNIOrVOktxhwF01KWlGWb1DV3P0Aq4U8yOLLbfja6Y5MGuqcnSHXCo8jlirBZKg7d+EYqIUnZqEiwHytM6bopdy1+Gl6qmdiPwz/v1L7sckmkyWYJhoKcJ44SNX+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2616005)(107886003)(6506007)(53546011)(336012)(81166007)(6512007)(356005)(86362001)(26005)(47076005)(83380400001)(186003)(36860700001)(6862004)(4326008)(8936002)(8676002)(5660300002)(70206006)(70586007)(82310400004)(36756003)(2906002)(33656002)(508600001)(6486002)(40460700003)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 17:35:15.5161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e599d783-c84e-4681-4f15-08da05e1002e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4483



> On 8 Mar 2022, at 19:46, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>=20
> Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent acce=
ss add.
>=20
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> xen/drivers/passthrough/device_tree.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthro=
ugh/device_tree.c
> index b3b04f8e03..776809a8f2 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -145,6 +145,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
>     if ( dev_iommu_fwspec_get(dev) )
>         return 0;
>=20
> +    spin_lock(&dtdevs_lock);
> +
>     /*
>      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
>      * from Linux.
> @@ -157,7 +159,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
>          * these callback implemented.
>          */
>         if ( !ops->add_device || !ops->dt_xlate )
> -            return -EINVAL;
> +        {
> +            rc =3D -EINVAL;
> +            goto fail;
> +        }
>=20
>         if ( !dt_device_is_available(iommu_spec.np) )
>             break;
> @@ -188,6 +193,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
>     if ( rc < 0 )
>         iommu_fwspec_free(dev);
>=20
> +fail:
> +    spin_unlock(&dtdevs_lock);
>     return rc;
> }
>=20
>=20


