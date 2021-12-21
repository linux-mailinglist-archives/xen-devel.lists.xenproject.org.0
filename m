Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C421747BCD5
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 10:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250249.431041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbPx-0007n2-8z; Tue, 21 Dec 2021 09:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250249.431041; Tue, 21 Dec 2021 09:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbPx-0007kC-4R; Tue, 21 Dec 2021 09:26:45 +0000
Received: by outflank-mailman (input) for mailman id 250249;
 Tue, 21 Dec 2021 09:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nh4l=RG=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mzbPu-0007k6-Nq
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 09:26:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a0c0b28-6240-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 10:26:40 +0100 (CET)
Received: from DB6PR1001CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::13)
 by AM0PR08MB4595.eurprd08.prod.outlook.com (2603:10a6:208:10c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Tue, 21 Dec
 2021 09:26:36 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::ec) by DB6PR1001CA0027.outlook.office365.com
 (2603:10a6:4:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Tue, 21 Dec 2021 09:26:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Tue, 21 Dec 2021 09:26:35 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Tue, 21 Dec 2021 09:26:35 +0000
Received: from c0c7137fcd97.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 451BC189-ECB5-490D-B0D4-4E07A12037B4.1; 
 Tue, 21 Dec 2021 09:26:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0c7137fcd97.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Dec 2021 09:26:29 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6135.eurprd08.prod.outlook.com (2603:10a6:20b:29f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 09:26:27 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e%9]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 09:26:26 +0000
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
X-Inumbo-ID: 1a0c0b28-6240-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZCDI1ymsMQl9AbLjmEaUHlkqY8TSvs+a5ArH8SKz8s=;
 b=0AjUKRzBlC5HI1/A80aBrg+RXAEmTH5QM1vEKtjBRH8u3pcrrzVErekXTkuqC0iXjVVt0I34tjkYt9onDgbZA9Z+q9nUWwcGx+D23d5yrBHiJN2JgK2UR2S7ke8x+oeIvGpWvzN8Fj1Fv2qRyOHkGTBZNzx2Zqadqc25LqUMLYs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6bd0f47d78ed2cf5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4DXEOHbzQu0FbXlwpwox6HzHl5Txctnn5a/JKL0xChPMsb958iyPeXX0OZ0tWNu3Dg4oOHxthGZHXMOxe5eef7t4F0SgfeNDLFoEyCE0zX25dRtmDZJh2ftrGhZY6ZY2IJQT+vuLgOMXmq5dL92/f2K1UU9vAyB6b3AwhuzXBAyxCt6QOVLgbF1iEpOOOGdVozSrvqd9jGbFQW7dGLePgmehc0HNIaiSmkugZqmXneRRj0qC2APlnYNaItSZMJP7vuvE02CxLX8L5CHwrQ0u74D6Cph4DT4HIN+tQ/WcyO6Yc0OpqYUPm/Uv/027YLHU8LZ9tmWMu62b4bEKksqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZCDI1ymsMQl9AbLjmEaUHlkqY8TSvs+a5ArH8SKz8s=;
 b=k2ND4x2z3MW/KdNH0dmC/CgoSQhfXqX3I2csmWyZClGX7PzTjkZC6d2e/Khbw2ql6cb7RK7UI00Gxr5JJOS0YwjN/HtTPsYvZ0evKtDf/TOQ27lAARlirvYuiwmYdIWjeAdLm8fagOe26egCrUQg+XPppbKd5i2JjP/99x9FNe9OmzaaIQJ9LuTxcxHQ0izRBc1i9taEx/eGlgUWLMSOLaxDtK5pnAxeDD+MHCHRWs9Q7uQExwqYK07rRkcw4+nh+fKFpPT5lLmENeswEqrIFbccwyA5IUD/sPxUkeQ0Pu7Qy2RVYoEZFmXhrUrL3qXZtjgNywnoLaIbSb1RqlSa+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZCDI1ymsMQl9AbLjmEaUHlkqY8TSvs+a5ArH8SKz8s=;
 b=0AjUKRzBlC5HI1/A80aBrg+RXAEmTH5QM1vEKtjBRH8u3pcrrzVErekXTkuqC0iXjVVt0I34tjkYt9onDgbZA9Z+q9nUWwcGx+D23d5yrBHiJN2JgK2UR2S7ke8x+oeIvGpWvzN8Fj1Fv2qRyOHkGTBZNzx2Zqadqc25LqUMLYs=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2 03/18] IOMMU: have vendor code announce supported page
 sizes
Thread-Topic: [PATCH v2 03/18] IOMMU: have vendor code announce supported page
 sizes
Thread-Index: AQHXsSi8nS3gY9fgEUm/NXnQX6ocmqw9N1SA
Date: Tue, 21 Dec 2021 09:26:26 +0000
Message-ID: <31D3D9E4-14A8-46CE-8F14-72F99BFE7403@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <3f0adf5b-cc2a-1b72-8376-baad574fa824@suse.com>
In-Reply-To: <3f0adf5b-cc2a-1b72-8376-baad574fa824@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dba14b71-ca12-40e6-cfa7-08d9c463fbe4
x-ms-traffictypediagnostic:
	AS8PR08MB6135:EE_|DB5EUR03FT012:EE_|AM0PR08MB4595:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4595D31534A4AECB9F41633AFC7C9@AM0PR08MB4595.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CNGmRA5NvOwjLbwWt0hM5f0wDekg23/u/5Qeei1ov1d/c8CLz4TY1Af+JtouQw3nmZf0w4OqegIZFeZTBKISqoNVDoa+JY7LerkXifSNCljjLMyuZ30sE/Dkm/Gk2giktL5+C2+NnWot5Mz8BYotJvMSDxRVqQz4GR3uGqaI5HbvtktquEWox5i7FVY2BnPz5i4ZR/HV6dib8ypAAaheHNlk/eNMBjvRxYmDpoPtQvKM1MpNRZBLhfpPXbFXYYpOHLLdWRVQdF9tXHMuE81Xp3fNIHMZ7GPHTGmpNSx/suZ3h9+LRtsUk9WUHv95PL5XK/f4ANI3i6JIfedfKojW09hZCcQlq8opZdIREIlwLqfyV1y/dcc7PdDnUHe6ivUK/m68XFEXAfY3X5jnZ8qHDMRGRv0hIkxKLP3nIt2UZKlwLYFMYuSvzTnqpHdjlr6s8roIRLAfwAMpLAm4FnqjWwvUn5iX2AvlOhCmc2uveswO4ccch8JmMmqtk9Bs94BVrEAyanAzLNA+5hnpyTcHxlLALZ4BK8G8L5YQC498efx0r7Qwp8qieCL3bYAFxmPMmBCqILxcXvZpP+mV7iaHWHsyFd/pXgD9dZSZ5PCjKQwEQBtwH11K2AxfHapIi8sbmtLzyPA7fqV57GdI77di0sNwKV6mxCl3TqLViGWWnY3eddSk1GPJMVs1yYKogGTu2/PRup8A0QrhsPLUqQZieLYVxTG7ZrXFR6Y8ltpeoo8OdXslOz6djUCNizWZk2Vc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(186003)(26005)(54906003)(6916009)(53546011)(76116006)(6486002)(66476007)(6506007)(33656002)(2906002)(71200400001)(36756003)(64756008)(8936002)(66556008)(122000001)(8676002)(2616005)(66946007)(91956017)(38100700002)(6512007)(83380400001)(508600001)(38070700005)(5660300002)(316002)(4326008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EB31EEBACA7E3949A7013EAEFA5FF9C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6135
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5485c831-e5f7-42d4-7280-08d9c463f6b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5lBk2ZaMDEcBGZBkraVTdtU1m0292qZOe9yY5KGcISP5LAKl8U9IJ7j4s9yeqiPM7cXTAfDP1VbRvFMIjdpvgcK1FfUdfcEI2b2pNYSGExSg8qzmdBwjJR5m3zhD1CGgStWn7yCxHNYI+YvFyyJ2Aqrs7v6UdnlXhARsT3iHDN1s3Cer5hGEWDU6P6MfjbALjtmy4jl/ZPbFqyxnzMFvYXwBdgHumwBuRV81KtyaXGi6sh1C8FDksTboN2VtQ/NeossAcj5QTGmxu+Cekbb6dp5GDRnfuQq9nc5oqZtbL9LQESaGHiEFa3wk8lYjZYz2lwOv3TeWZOtZ0A0xkgpKixHABHyp+QSbxB7j+TUxGdrGNt/5/w4P3KjmfAHgEQztxdoawaXxhj0cjmA/9dW1Dw8y6HAu0p/urx+OjHOJHWaZy6y1z1DgfzG51S1oaHR3tOSE0BP/pJIqT4gxv8d9BqKNs33NXO+xopo84eujdzg59nci/DOJ5lCZAquF9kOCHQStQjNbE8SxQVpapXG5wG5PWOowHV6rya7jhA2XyvFPTNOVRBoTwl+OHl9xwkPxpy+JbfxljAqfMrZU9Z5hFbSUoAmOp5d41zzmp1E2M6VMSoKMu88y6YRqLo0k54ER9zoGPYjpEp4d8jGHNEAOpR1qHhkK7Qgt6cj5Xyvxx1GUUYMInz2h2vuwSKnlDacc7UvjLxMHPkKXV5tFfrOF6VF+xX6pBymL2+MAinwVaGKpdHShruxn6tTrm2uezsx4BQ1s1iDz5iBqh6X1BhAVCw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(81166007)(36860700001)(336012)(6862004)(40460700001)(356005)(54906003)(53546011)(33656002)(6506007)(36756003)(26005)(5660300002)(86362001)(508600001)(82310400004)(2616005)(83380400001)(4326008)(186003)(6512007)(70206006)(70586007)(47076005)(6486002)(8936002)(316002)(8676002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 09:26:35.6428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba14b71-ca12-40e6-cfa7-08d9c463fbe4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4595

Hi Jan,

> On 24 Sep 2021, at 10:43 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Generic code will use this information to determine what order values
> can legitimately be passed to the ->{,un}map_page() hooks. For now all
> ops structures simply get to announce 4k mappings (as base page size),
> and there is (and always has been) an assumption that this matches the
> CPU's MMU base page size (eventually we will want to permit IOMMUs with
> a base page size smaller than the CPU MMU's).
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -629,6 +629,7 @@ static void amd_dump_page_tables(struct
> }
>=20
> static const struct iommu_ops __initconstrel _iommu_ops =3D {
> +    .page_sizes =3D PAGE_SIZE_4K,
>     .init =3D amd_iommu_domain_init,
>     .hwdom_init =3D amd_iommu_hwdom_init,
>     .quarantine_init =3D amd_iommu_quarantine_init,
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1298,6 +1298,7 @@ static void ipmmu_iommu_domain_teardown(
>=20
> static const struct iommu_ops ipmmu_iommu_ops =3D
> {
> +    .page_sizes      =3D PAGE_SIZE_4K,
>     .init            =3D ipmmu_iommu_domain_init,
>     .hwdom_init      =3D ipmmu_iommu_hwdom_init,
>     .teardown        =3D ipmmu_iommu_domain_teardown,
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2873,6 +2873,7 @@ static void arm_smmu_iommu_domain_teardo
> }
>=20
> static const struct iommu_ops arm_smmu_iommu_ops =3D {
> +    .page_sizes =3D PAGE_SIZE_4K,
>     .init =3D arm_smmu_iommu_domain_init,
>     .hwdom_init =3D arm_smmu_iommu_hwdom_init,
>     .add_device =3D arm_smmu_dt_add_device_generic,
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3426,7 +3426,8 @@ static void arm_smmu_iommu_xen_domain_te
> }
>=20
> static const struct iommu_ops arm_smmu_iommu_ops =3D {
> -	.init		=3D arm_smmu_iommu_xen_domain_init,
> +	.page_sizes		=3D PAGE_SIZE_4K,
> +	.init			=3D arm_smmu_iommu_xen_domain_init,
> 	.hwdom_init		=3D arm_smmu_iommu_hwdom_init,
> 	.teardown		=3D arm_smmu_iommu_xen_domain_teardown,
> 	.iotlb_flush		=3D arm_smmu_iotlb_flush,
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -470,7 +470,17 @@ int __init iommu_setup(void)
>=20
>     if ( iommu_enable )
>     {
> +        const struct iommu_ops *ops =3D NULL;
> +
>         rc =3D iommu_hardware_setup();
> +        if ( !rc )
> +            ops =3D iommu_get_ops();
> +        if ( ops && (ops->page_sizes & -ops->page_sizes) !=3D PAGE_SIZE =
)
> +        {
> +            printk(XENLOG_ERR "IOMMU: page size mask %lx unsupported\n",
> +                   ops->page_sizes);
> +            rc =3D ops->page_sizes ? -EPERM : -ENODATA;
> +        }
>         iommu_enabled =3D (rc =3D=3D 0);
>     }
>=20
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2806,6 +2806,7 @@ static int __init intel_iommu_quarantine
> }
>=20
> static struct iommu_ops __initdata vtd_ops =3D {
> +    .page_sizes =3D PAGE_SIZE_4K,
>     .init =3D intel_iommu_domain_init,
>     .hwdom_init =3D intel_iommu_hwdom_init,
>     .quarantine_init =3D intel_iommu_quarantine_init,
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -231,6 +231,7 @@ struct page_info;
> typedef int iommu_grdm_t(xen_pfn_t start, xen_ulong_t nr, u32 id, void *c=
txt);
>=20
> struct iommu_ops {
> +    unsigned long page_sizes;
>     int (*init)(struct domain *d);
>     void (*hwdom_init)(struct domain *d);
>     int (*quarantine_init)(struct domain *d);
>=20


