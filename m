Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C448E60D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 09:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257564.442673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8HqL-0004BP-T9; Fri, 14 Jan 2022 08:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257564.442673; Fri, 14 Jan 2022 08:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8HqL-000487-P8; Fri, 14 Jan 2022 08:21:53 +0000
Received: by outflank-mailman (input) for mailman id 257564;
 Fri, 14 Jan 2022 08:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tv37=R6=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1n8HqJ-00046U-Gq
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 08:21:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f8c303-7513-11ec-bcf3-e9554a921baa;
 Fri, 14 Jan 2022 09:21:49 +0100 (CET)
Received: from AS9PR06CA0240.eurprd06.prod.outlook.com (2603:10a6:20b:45e::9)
 by AM9PR08MB7032.eurprd08.prod.outlook.com (2603:10a6:20b:41e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 08:21:46 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::31) by AS9PR06CA0240.outlook.office365.com
 (2603:10a6:20b:45e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Fri, 14 Jan 2022 08:21:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 08:21:46 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Fri, 14 Jan 2022 08:21:45 +0000
Received: from dba72bc1a2e0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 343B329B-EEF3-4B68-85B7-CCDA57412C4D.1; 
 Fri, 14 Jan 2022 08:21:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dba72bc1a2e0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Jan 2022 08:21:38 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by HE1PR0802MB2443.eurprd08.prod.outlook.com
 (2603:10a6:3:d7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 08:21:36 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::4469:791e:51b7:c378]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::4469:791e:51b7:c378%5]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 08:21:35 +0000
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
X-Inumbo-ID: 04f8c303-7513-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnUz3Bs6Swf0XDUbLTMu654w+yHd2hLWnHN6N6yr1xA=;
 b=xQT4mM3AJtGJNB1QguBjGPRCljKaLpE9F7AYz/Ph8+h9pjSTq7m//fe+PjF3SLXYZw6QdZ+eBHw8if7APVGmH5PjC81nz0YATOj7LOuYZt96nFb1OgM19SLdyUDR7QFvCFNbHzgCMQqh1sV+pbxIhh1nqb/ER5ODsANSBKlyhec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4e56990bf5b4959
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+mvp9uMNYK/0ZKadn9rPnUpwDUdOd/s/FiFC8PWSfweI9wgV/QT9VBtcf/W2e3TRV/ABgVsQC5hqV737EZtuY9oLKQAJ1Y0/W0yH3qmvGUtgUqPLYAenyBTXl1AZu1lIMFWu2x019C9svg/jxx0Ht3AO7bLzxo20g6Kx78x5lrnV06/l8RMaTqx35uX/ZbZSx8ZynZJG43jcVXcHUOX6yeTCuS/yJpe3MqutgnOngR6ckfQ6Z+yPIlzuD7UUe/2Kb+W4cEmPXd/gyEyr8Ydq036W2tOJRI2SKPuzGcSYF0KaQM/GPYBm2mQxi99XMnYXV+CM56Ki2nO+9pmndtZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnUz3Bs6Swf0XDUbLTMu654w+yHd2hLWnHN6N6yr1xA=;
 b=RxzDidvO8H9amneAyX74n32oClepZTLfhb4m96h2sDo7G2I3v1nPpRcEvnpASBFxlgewdh/+tHkt/HrxIhN4NFA3iKKgNoAlqsqQUZEXT+tGKTKg+ccim2H+Xgk53QKPJU8lkn1XRPc3yJvz8c2r11bGQXuQr/2sp1UQQxv0Xa4eSCc/wvhJu4yGSO7riCPThavBI7XDLBlzy8Yd179NR/bH9n7O/gQoYYC+lKplxLiPCKnG1K0DcMKFUHXXW9RTGo4HRKxq9AWIM3uRIhUn878eI4qEzK3k1/tJ4Nsf/m7d6Y9TzQScwiHNhsa4TQcgbuWuiAyuZD43qDgR/sUBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnUz3Bs6Swf0XDUbLTMu654w+yHd2hLWnHN6N6yr1xA=;
 b=xQT4mM3AJtGJNB1QguBjGPRCljKaLpE9F7AYz/Ph8+h9pjSTq7m//fe+PjF3SLXYZw6QdZ+eBHw8if7APVGmH5PjC81nz0YATOj7LOuYZt96nFb1OgM19SLdyUDR7QFvCFNbHzgCMQqh1sV+pbxIhh1nqb/ER5ODsANSBKlyhec=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [XEN PATCH v3] xen/arm: introduce dummy iommu node for dom0
Thread-Topic: [XEN PATCH v3] xen/arm: introduce dummy iommu node for dom0
Thread-Index: AQHYBt4itusLhq1+GU+ohCCSHNq3taxiMcCA
Date: Fri, 14 Jan 2022 08:21:35 +0000
Message-ID: <964D6F09-82DF-4B33-AD93-A1C04E7A7FC7@arm.com>
References: <20220111112611.90508-1-Sergiy_Kibrik@epam.com>
In-Reply-To: <20220111112611.90508-1-Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f272a84d-a787-493f-274e-08d9d736e784
x-ms-traffictypediagnostic:
	HE1PR0802MB2443:EE_|AM5EUR03FT010:EE_|AM9PR08MB7032:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7032CA3D3922FFC2E828106AFC549@AM9PR08MB7032.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lNPM7vBnrbsswNnHgW2xXk7m1qbQHbqX1Mx+FB30rdigBydb8VBVTYvHYDH7G/svKqwIpW8QM7R75W9DZPm+o5dvif9CawfxGAuAVtOkNhxAUlIOslGwSunPPPC8fu3uh+K0cZXJhgC0wqH3ActJ8Hgjq1rWGY75K0esph1IFa7xwPg/xlVxXXxtEVyYwaktVSf7dGiCuPjbz6zeIjbyy1rqFFOBfchPAOWvS4qo6RSaSp/kFHCbbxqyG1AdS9synAuLwxmQpWQjuQs/PZdPM5c6BIPkg27tAAJmZqWCRRSyIXlG4KKJoN+QKY9xLSAXIGG8m2EJvQgkWWRT3+r/whZh+DJDPF+9zlPbI1876MdCJG8rg1A7zcWn7ZyKBH4B03xc9HUWgKTcPSVJUPEgG+pEO6kIvbRxBKmrGysKVQ6G7LXL98YYSQCVb5DrMQVbJdg0iNoW3J/2gfft+RsecyRg5FqPdeUr5WIvhatjmxYWJkYNpFaXeSnyvTUV6E+cEIltjkRpt1Lce1uPTbfJ/1Aew8VigqF0tMUOp9E0lSM94BR+gON31i2bi54IHeHov/48nXMaeVixEKhsc8HlxqxtrZmIBNAy/39CLySeAUMDKR1aQCiqLAmKt1Nlcn0m/nQ6mBYG3HhWIrtsyD1jsETC/2h2sxSTB+jJ3GZIOrgdUmdeb5QQ5HnUzpaj3iJvTJ3JN8P5cNLDlkaA6mvnHFqy73GkDEJPdd/WwfjO4M87SjNdSG2uxar78p+lAYHIMEauGcldQKb7RbAd4WcsBpEy7+iQpN/g0ldCfyPxEF2G22bvk4b2uOUTm7fYSK1mvuPshmj8B70ztMNFrcAoxI35BZHImTW4Gk88LXOSGWY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(5660300002)(71200400001)(966005)(26005)(8936002)(2906002)(6486002)(508600001)(4326008)(186003)(36756003)(38070700005)(66476007)(316002)(66946007)(33656002)(2616005)(76116006)(91956017)(6512007)(6916009)(6506007)(86362001)(53546011)(66446008)(38100700002)(122000001)(54906003)(64756008)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <504EDB3ED007A04F8F7DA356807556E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2443
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec300bbf-a366-4d2e-2377-08d9d736e16f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kP/K1goKv+4o1q9He2hJkYC9jwrlMaKYV+kbg/iuo9Y5IZC4wFJZneIy0ZGeX4EwFRoKnGWngqVpuaH1VLAzOAlU6DqeT+H5Kxpdqjw1oqsjCMpYF0F0uZtdFinM3L1T7LCVwmOyojtqY3EpbsjfvSEC5ro1/T46GpPMNOZgRjooE2j0wGibhPNy6aKM+mejVqBksvPLsH6cckhKuP4G15ic00VH91ro0uSMBN6AF21C/oeK7ZVrR7uzEoM/HisNJGk4q5zAFYvVGVIMUWgELiJXGmzLxFDQLMXJnySzhxZ+Ra3zpfvnnnGT4MH3dT/4iJ7alyaCN+lYPFUpAfIun2HtQ1STPm3+NewtdZU6Gin6vIxr0zmevZyOe96J4HbRS0j6DeCsZm2OH+pJci8KkI+sGpPwdWgYICqitYxE+DsjL3zQy0HnLuSu9zNfW/b/EexqmPv2/z/uwm47GqZggjErk/orRqNPrIKcYeLRdkrebi2SAcfGfZs/FT26MvMTFbzypILBaK4lQnPFxRYDO8qI+sklvEO4T8NVMZdGWHFd0GtM2Hkp29TRUr96RS/Vz/iAdStK5SHGfqpulJ4wd5to9nAw+uGj4i5XFptiilosv8Z0y8ICXt+RfPPGjY4vWkId3iHgfLKwKENcySq8lg+YaSR1c8eX6G7j46OWtrqOQkwuRGCXu/Dvbkkldxa0f2kxtEhO8KiHwQG/Egro+VqkC/s1UKCXe7Kouw3X/cOCaUJPPhXL4G432GZOMF5FWiMqrNJUjvUWnFZiFX60spnWF4rvIWrhGFPWEoaHrZArFlBeX8zSiBDI9lBt9j9A07R6xsIEQR+dge/3Pr5yiw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(356005)(2616005)(2906002)(6862004)(5660300002)(82310400004)(81166007)(86362001)(4326008)(53546011)(107886003)(54906003)(508600001)(186003)(8676002)(316002)(36756003)(33656002)(966005)(47076005)(6506007)(8936002)(336012)(6486002)(26005)(70586007)(70206006)(6512007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 08:21:46.1395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f272a84d-a787-493f-274e-08d9d736e784
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7032

Hi,

> On 11 Jan 2022, at 11:26 am, Sergiy Kibrik <Sergiy_Kibrik@epam.com> wrote=
:
>=20
> Currently no IOMMU properties are exposed to dom0, thus kernel by default
> assumes no protection and enables swiotlb-xen, which leads to costly and
> unnecessary buffers bouncing.
>=20
> To let kernel know which device is behing IOMMU and hence needs no swiotl=
b
> services we introduce dummy xen-iommu node in FDT and link protected devi=
ce
> nodes to it, using here device tree iommu bindings.
>=20
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Julien Grall <julien@xen.org>
> Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Cc: Andrii Anisov <Andrii_Anisov@epam.com>
>=20
>=20
> Changelog:
>=20
> v3: rebased over staging & remove redundand phandle_iommu attribute, disc=
ussion:
> 	https://lists.xenproject.org/archives/html/xen-devel/2021-12/msg01753.ht=
ml
>=20
> v2: re-use common iommu dt bindings to let guests know which devices are =
protected:
> 	https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00073.ht=
ml
>=20
> xen/arch/arm/domain_build.c           | 42 +++++++++++++++++++++++++++
> xen/include/public/device_tree_defs.h |  1 +
> 2 files changed, 43 insertions(+)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6931c022a2..b82ba72fac 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -845,6 +845,12 @@ static int __init write_properties(struct domain *d,=
 struct kernel_info *kinfo,
>         }
>     }
>=20
> +    if ( iommu_node && is_iommu_enabled(d) && dt_device_is_protected(nod=
e) )
> +    {
> +        res =3D fdt_property_cell(kinfo->fdt, "iommus", GUEST_PHANDLE_IO=
MMU);
> +        if ( res )
> +            return res;
> +    }
>     return 0;
> }
>=20
> @@ -1479,6 +1485,38 @@ static int __init make_cpus_node(const struct doma=
in *d, void *fdt)
>     return res;
> }
>=20
> +static int __init make_iommu_node(const struct domain *d,
> +                                  const struct kernel_info *kinfo)
> +{
> +    const char compat[] =3D "xen,iommu-el2-v1";
> +    int res;
> +
> +    if ( !is_iommu_enabled(d) )
> +        return 0;
> +
> +    dt_dprintk("Create iommu node\n");
> +
> +    res =3D fdt_begin_node(kinfo->fdt, "xen-iommu");
> +    if ( res )
> +        return res;
> +
> +    res =3D fdt_property(kinfo->fdt, "compatible", compat, sizeof(compat=
));
> +    if ( res )
> +        return res;
> +
> +    res =3D fdt_property_cell(kinfo->fdt, "#iommu-cells", 0);
> +    if ( res )
> +        return res;
> +
> +    res =3D fdt_property_cell(kinfo->fdt, "phandle", GUEST_PHANDLE_IOMMU=
);
> +
> +    res =3D fdt_end_node(kinfo->fdt);
> +    if ( res )
> +        return res;
> +
> +    return res;
> +}
> +
> static int __init make_gic_node(const struct domain *d, void *fdt,
>                                 const struct dt_device_node *node)
> {
> @@ -2127,6 +2165,10 @@ static int __init handle_node(struct domain *d, st=
ruct kernel_info *kinfo,
>         if ( res )
>             return res;
>=20
> +        res =3D make_iommu_node(d, kinfo);
> +        if ( res )
> +            return res;
> +
>         res =3D make_memory_node(d, kinfo->fdt, addrcells, sizecells, &ki=
nfo->mem);
>         if ( res )
>             return res;
> diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/d=
evice_tree_defs.h
> index 209d43de3f..df58944bd0 100644
> --- a/xen/include/public/device_tree_defs.h
> +++ b/xen/include/public/device_tree_defs.h
> @@ -7,6 +7,7 @@
>  * onwards. Reserve a high value for the GIC phandle.
>  */
> #define GUEST_PHANDLE_GIC (65000)
> +#define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
>=20
> #define GUEST_ROOT_ADDRESS_CELLS 2
> #define GUEST_ROOT_SIZE_CELLS 2
> --=20
> 2.25.1
>=20
>=20


