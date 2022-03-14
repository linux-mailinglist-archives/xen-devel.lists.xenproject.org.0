Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555024D88A3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 16:59:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290298.492294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTn5m-0001lu-Gn; Mon, 14 Mar 2022 15:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290298.492294; Mon, 14 Mar 2022 15:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTn5m-0001k5-DX; Mon, 14 Mar 2022 15:58:42 +0000
Received: by outflank-mailman (input) for mailman id 290298;
 Mon, 14 Mar 2022 15:58:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1jB=TZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nTn5k-0001jz-VV
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 15:58:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cd032c8-a3af-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 16:58:39 +0100 (CET)
Received: from DU2PR04CA0055.eurprd04.prod.outlook.com (2603:10a6:10:234::30)
 by DB8PR08MB4058.eurprd08.prod.outlook.com (2603:10a6:10:aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 15:58:36 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::25) by DU2PR04CA0055.outlook.office365.com
 (2603:10a6:10:234::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Mon, 14 Mar 2022 15:58:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 15:58:36 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Mon, 14 Mar 2022 15:58:36 +0000
Received: from dba508e38c02.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E28E4428-10C7-4889-AA68-207655280CAB.1; 
 Mon, 14 Mar 2022 15:58:26 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dba508e38c02.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 15:58:26 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM6PR08MB4167.eurprd08.prod.outlook.com (2603:10a6:20b:ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 15:58:22 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 15:58:22 +0000
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
X-Inumbo-ID: 9cd032c8-a3af-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ0teu4xHkZMW5oIDulrSlOAgq2X79hUYcgZGFr32Fw=;
 b=vCeIIY1SCV/SU/hCMJAWDi0jY2ZwXEAkj+lwC9rpQ3xD6tNNwYh/pHZSHRmDfUskdmhT88r5P/2ePds3qKBcxMDFsQuX3j8zNFOxZhIFrO1SHDpbkF1XfqYeCR6KjxFfBOG7OREof2QJ55lf4s/D9JhjISLZlcGSWdRITK70weU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3c8149e39e275731
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQJ0258Mm37+ENhouwf8jomwENrYouUm0yAU14Ut3v6KltPKH9coKPCcVUX/v8pO8WPaKATs3lsYRGCuZnNOlhwBpEM9vOGK/a+iL+pI7jV8Bw1u6qtk34OjBOOog2fgnQoHWJw+sqJvvudj9Z++4h5Nu8ipYQXm2IUJXc9IClHSYwQ/QwssrJRXzsJ6/turFtT0L1qSoSM+BIBE4UVhE4d2hZFSqBa9PdjnO3wdlVzVg3Vyvo2+e8gfwM08R6NFaIBGz26sRrUup8vLgz6EqgDxZ9i/fT9/jNCr7lyjuSdIBwBGk1euq6mNHGxUYD7k+Nq9fsEcgD8iWjT85sgICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ0teu4xHkZMW5oIDulrSlOAgq2X79hUYcgZGFr32Fw=;
 b=c9I94y/c3UDCIGhejYIjwBP7yZ6yZ7M9OhUct4PJ6xtFKOzoC/cpupcQy4bnCvlcVd+q5FtXdbGhktUFISQy9PRJYYkYN9waWd4Cc8evIO1HeCy/XD3lWyGwxxKL797Z322cH3wH7DYfiyYVUNjnX2uMDp5zFVByvuETs51s1uyJfbNXoMIhht281/4mjhZKNg+5LWPc2jQq0nYPaBzYCo+3i1/4+93fPesbeH9HJgNsxYdEHggiIuDEC/0mApit4sQStu2i9JW7EH4LrXrmbIjbR6pEY6rxIvhckzYdh/iptIhvGtS90N3qqrjNwYXNi5+/LZ3ivmizmAK0qUYczg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ0teu4xHkZMW5oIDulrSlOAgq2X79hUYcgZGFr32Fw=;
 b=vCeIIY1SCV/SU/hCMJAWDi0jY2ZwXEAkj+lwC9rpQ3xD6tNNwYh/pHZSHRmDfUskdmhT88r5P/2ePds3qKBcxMDFsQuX3j8zNFOxZhIFrO1SHDpbkF1XfqYeCR6KjxFfBOG7OREof2QJ55lf4s/D9JhjISLZlcGSWdRITK70weU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>
Subject: Re: [XEN][RFC PATCH v3 07/14] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Thread-Topic: [XEN][RFC PATCH v3 07/14] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Thread-Index: AQHYMyV0/VHCKbIU/Emb5cXwtoiAAKy/El2A
Date: Mon, 14 Mar 2022 15:58:22 +0000
Message-ID: <BAAC4BA1-BFB2-4B6B-A7FB-4AA1ECE58F29@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-8-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-8-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 012ff2ed-4d7e-4f76-3a99-08da05d37f86
x-ms-traffictypediagnostic:
	AM6PR08MB4167:EE_|DB5EUR03FT040:EE_|DB8PR08MB4058:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB405889DC7689232B20B4CAB7E40F9@DB8PR08MB4058.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qUuB0dirm5IiSRPK0g6lEOx5/Vy3SWwWJGG3svKlD14FKXhlelGlq1ppJJTMYl45fOzJoYjeVr9n1z1Iz/B3E0NLdAUpKms+L+cqKPlIdgEKbeeuBuxX84cmaHgspxlaVLXiYoPyHjTJqkc66WSsWahOw0EWifT9gUU/XphC+IpjTKVK/mXTtsxitYhludNI3b37kPpflcDTWFh+7BTpKKsd3YEiXSEKyo2iSYtLVb7PZCTrzS5xTMm9V9y2W3w8pnxzY9mhg+h8qdS5f6Ak4kcOPmV1GQAWCtXS4042DUJ1AqEzGxbY2dlSdbwcV5jHw7PVOP8zb1AhIceQ27eMGJm09e3I3lyKwr4O/SIfykfCNZwYCnfpe5LaeWVpiabIXRlEr4Af7T/ExqqXnxwHtov07KigHwDT+x5muNrQfPOh/e1tkdY2U81rQL3PkjrjrPkzY85bRH3YlX/aB8hFeIFEycPcqtIsTUywTynyadDA13qxAmly20N7ft8zJwMrVqk7gCTiAkF6KA13Q9No+eMBNbabixFPliIYYs06ysrJd5QsRzKDf+Ct6avnjYpj9MhIZCGxjQmTc/pAT4Ie+TVSvRNN15aHQVGfYF+Brh0ZhrJCmorDPTA3zxmx9zltjmXdrCAP8mgFI9EXDuSmjV3tP6vlXhHs5OPwSVCqOv4+JC6dxs0A9yeZ+ptszyW6Y/DPOnrsD8F8mL+DOMc4IhsL+kuNLm8XDOS1kHXsE/cLj7RhXXnwV5dfVUjOLF6I
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(36756003)(2906002)(38100700002)(6486002)(122000001)(8676002)(38070700005)(5660300002)(316002)(6506007)(8936002)(53546011)(83380400001)(2616005)(4326008)(26005)(6512007)(76116006)(33656002)(91956017)(54906003)(508600001)(6916009)(186003)(66946007)(66556008)(64756008)(66476007)(66446008)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C40EA242E6D40243A4432242B6AD195B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4167
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4950d6f7-8a43-4a2e-9f0a-08da05d3772c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YWxwc7ywBdteBu/JLYoobQnopE8A0vEuemApdrijbZkUw5Uo59xNgU+Ep+zP1avsCggT9xFG+kTEOCdJdk7SC7L9DWss7UxI1WnnHwBq/G9DB7Wq7it8IS0L9SSuWaFKKFq8RCsPjVtOdjfXWClzJxBecjczJ2+hwIZv+QqALCMsBRRAx6PCmN55bqOR5E0Q09TPwnAh3pJLxFgPVTJa+LejuV3Qa7biTdCjvMWb8mKz2GL8myAU4LNABWQVj1dKJ9kjtPDlKk4oaDKbypaTc7V+yts9pmpornURuGhVnhkRghUQ2OPkprbvP2Z7XqNYXEL8HGUA4Tp7GZqC3OF+vbPMi8J97kPjA/4QxFPT7NitqmDmzE2Vj119Y6S34dUvPwuhgljng8mLh3aGQh3eNQZCA7wUg+/L3dNJ7waHqyzXtfE+lW3k+8S7LHS2CEyOk0Q5tGVRZ+0yGrBHbFxlQEr0iW+k2UFggg04Gp8NtiOmvyvMVmPCaMjC6Vp/keklD5UbgTFx4c/iaFIL+Sg7BlNbyF6mdQ7sZ/xrLIQhSSOUKJcCEtpzRx+IFUVSi4ou3xdz+Gg/QQq8Cz4DIyF4mrKy7nysREii3Asjk/eRUoR2/0PCKOiLny+0o/PyUB9Sj4kh4cu5ARb/eRxMroq5yBuUUwsLDq6Eyb3Kf6pZvyk6QyworDNKij+icbV/3ojJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(6486002)(36860700001)(8936002)(5660300002)(336012)(54906003)(8676002)(316002)(70206006)(70586007)(6862004)(4326008)(26005)(86362001)(186003)(107886003)(2616005)(6506007)(47076005)(356005)(81166007)(53546011)(2906002)(6512007)(36756003)(33656002)(40460700003)(83380400001)(82310400004)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 15:58:36.1931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 012ff2ed-4d7e-4f76-3a99-08da05d37f86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4058



> On 8 Mar 2022, at 19:46, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>=20
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_lock(=
).
>=20
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign.
>=20
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
> xen/drivers/passthrough/device_tree.c | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthro=
ugh/device_tree.c
> index 98f2aa0dad..b3b04f8e03 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -83,16 +83,14 @@ fail:
>     return rc;
> }
>=20
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *d=
ev)
> +static bool_t iommu_dt_device_is_assigned_lock(const struct dt_device_no=
de *dev)
> {
>     bool_t assigned =3D 0;
>=20

You can add an ASSERT(spin_is_locked(&dtdevs_lock)); to be sure, however th=
e name is pretty clear,
so for me with or without it:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

>     if ( !dt_device_is_protected(dev) )
>         return 0;
>=20
> -    spin_lock(&dtdevs_lock);
>     assigned =3D !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
>=20
>     return assigned;
> }
> @@ -225,12 +223,17 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, s=
truct domain *d,
>=20
>         if ( domctl->cmd =3D=3D XEN_DOMCTL_test_assign_device )
>         {
> -            if ( iommu_dt_device_is_assigned(dev) )
> +            spin_lock(&dtdevs_lock);
> +
> +            if ( iommu_dt_device_is_assigned_lock(dev) )
>             {
>                 printk(XENLOG_G_ERR "%s already assigned.\n",
>                        dt_node_full_name(dev));
>                 ret =3D -EINVAL;
>             }
> +
> +            spin_unlock(&dtdevs_lock);
> +
>             break;
>         }
>=20
>=20


