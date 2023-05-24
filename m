Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9965970F9F3
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 17:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539132.839708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qHw-0005UF-6X; Wed, 24 May 2023 15:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539132.839708; Wed, 24 May 2023 15:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qHw-0005SU-3e; Wed, 24 May 2023 15:20:32 +0000
Received: by outflank-mailman (input) for mailman id 539132;
 Wed, 24 May 2023 15:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q1qHu-0005SO-Dl
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:20:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 842cf15d-fa46-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 17:20:29 +0200 (CEST)
Received: from AM6PR10CA0049.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::26)
 by DB3PR08MB8914.eurprd08.prod.outlook.com (2603:10a6:10:42a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 15:20:27 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::be) by AM6PR10CA0049.outlook.office365.com
 (2603:10a6:209:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 15:20:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 15:20:26 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Wed, 24 May 2023 15:20:26 +0000
Received: from bc8c95cf9e27.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE0F3723-1BF4-40D8-AB35-A24ED89D42BE.1; 
 Wed, 24 May 2023 15:20:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc8c95cf9e27.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 15:20:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB4PR08MB8128.eurprd08.prod.outlook.com (2603:10a6:10:381::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:20:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 15:20:12 +0000
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
X-Inumbo-ID: 842cf15d-fa46-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGQSEYXYzTOUrspQIYqCBfKVX8KDk+ogujSOEgH2T5s=;
 b=8vkDeNstl533oBrocjEK3l5FixziocRhFh6ganb7FtdGMSMdDqSpAFJQ/RMl3h7aNm44er/RDBvCIYxPWFI1sm1wXNU/W5rI3XAl8rWgl9LgiMBe3rvME2eKnmbrpLAnBwox7AoJvgx+ytYrN7Ud4FlZLZHUNYmj1IomrmeRXgM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a07f6aafb21d0a3f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EM64cbDnBi3LGi1ctV/BIm2URjodvf/1v1c5e6MXcEnTd/zBXEKUtrtH78RlZ/jkW6eSPwINdAlClO7DGzQIT04ZlJXrMM2s/WbU/iVx4U50Il0s6VDeWWIfMH57WRirDk4HucU7a5EeSiiw7HiEnvc+uk3Zkst65fV/xFnlQJkJyrSBrO0RZA0ecCcnhXoMeiqB1hvxp4fgBXXE9oQBtQyy6RnIpfKAaasZ9hlvz4L9YZlGYX3tJUXPAH426ljK1HAVmi1v83JZxUdRfkGyYFOWBgWnFWzdyIiDaFGDm/1Z3yS1fNTK3sUiDLkZAJKZJCgt6Fp7BkNGMayslKS6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGQSEYXYzTOUrspQIYqCBfKVX8KDk+ogujSOEgH2T5s=;
 b=SKY+jNRX8v4dl9oDA0J1DbnybWgOh/D4ggUH/d3cD8RK11lscde6SHlIZ1doXrIne6IrgeAPfzrletHaekNNvdNCt0BAIEDoXy2HYle6zXbawqo/GbVxe5G3GsrZDAzpUtVpV6VDwlLUkaxDXKulFA9dcNoIf9AkRCGFvH7EUWu9toP9elFvhYg8SkCd2UfQEoinb4VSMmJ3cHpNw055nLxPMxaUUvNuW2Yna1WRc8NyTV/PHzqR8FZLy1VdUsSgSojawk2MgfZgHl6rvtFyhL2XX5uGHrqgazfxC8RrgG5KRC6dzR//9TzCUdmi7ZGq+SCIk4KAA5PrA3OSnysgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGQSEYXYzTOUrspQIYqCBfKVX8KDk+ogujSOEgH2T5s=;
 b=8vkDeNstl533oBrocjEK3l5FixziocRhFh6ganb7FtdGMSMdDqSpAFJQ/RMl3h7aNm44er/RDBvCIYxPWFI1sm1wXNU/W5rI3XAl8rWgl9LgiMBe3rvME2eKnmbrpLAnBwox7AoJvgx+ytYrN7Ud4FlZLZHUNYmj1IomrmeRXgM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
Thread-Topic: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
Thread-Index: AQHZjUpY6xFVIVbG80+SN4dEj9SmF69pi9WA
Date: Wed, 24 May 2023 15:20:12 +0000
Message-ID: <D01601D3-8215-46A0-8539-CF126A5FE11F@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-12-luca.fancellu@arm.com>
In-Reply-To: <20230523074326.3035745-12-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB4PR08MB8128:EE_|AM7EUR03FT030:EE_|DB3PR08MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: 1138b77e-3698-4549-80a4-08db5c6a66ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ahLWNEp7j6Y5/5vdCDPuGSjUpmy5v5RG3fsHexteo/GhxzYfo9qPdbZZfdedsPKZlES2ZXEn1quVWpSKHE7PIhAcK8kh9ae3M7qW05BNIu+ZctV8pAzxe9J1TJOrsdk8kKVBqdjQ7tQSy2HGhMbLFtCDZsYgYirj493jwiG7hUK9joE1YaJzJFs7VoZEb36wMxuVd7oZRYMmSJuomvR4Lxmt1R2sU7HuWqH6lZtoGoEOfWkyWvBQLugjknElcn2VRtJh1qJ8WfnE/7neTWTknpnquepKMtI5a96BitISqVFQVBO6kSso8M9hBJq/76vUHpd/zxM/21S8SqKXaaYKphp+cY+Wr/CJj4KWWX71Lw6tA+7lv0JSGrSAPN7RFl4jqQ7kM7XMWBxj0i11s7OikpMMXYG2kzzMjLdkJABxGMwnaJWRr76Yd4Tk6cT7t3QqEm6wTCDcj9BBcKuCprRLtAoDrk3EPpxeaX0vJyPIboxnXkd4rSJVgTrmC2FYWtnvElvuupIds5QW7nTlupWblkX+/8v3WGPu/HP72riIxzl5M4+AqdRJybAlOTUubeZxwqg7v+QhoW2ahdJx9faMLqKQV0khN6FezemFyZRRS+2U/GRSNKzBADXTIneOjyxjKQ/UIbjd2yRJ02ErFcTfpDQSo5KmCfXaArEUX3Mt1GM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199021)(83380400001)(38100700002)(2906002)(38070700005)(41300700001)(36756003)(8936002)(8676002)(6862004)(6486002)(5660300002)(6512007)(6506007)(86362001)(33656002)(2616005)(71200400001)(122000001)(37006003)(26005)(186003)(53546011)(54906003)(64756008)(6636002)(76116006)(4326008)(66946007)(478600001)(91956017)(66556008)(66446008)(66476007)(316002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A186961898FF054181C7661A2DFA59B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8128
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47396534-0880-45d3-44db-08db5c6a5e52
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tg4ZmrLGeK1b9wSrJZZVDnq5QPzXY3x+fwsq0CsBCKywVntHpVGXMbDOwLAvTqwK8X22aPxW2t0d6T1+y7fVYoJyixuTYdvERSQURCPfVwBTGKqKSjSxmuh/ArT550w+hLMn5dLy97VIeYduuOBBTUeFRRpr6DUTm5Su9cLKbrKYIvkt8fC7iwUbkeqWl5XA5Dck8pUl66fKP88+ZoWepJcuvuRIRWlE3DFm3DQ420UeLVPPFQn9teeGY2wOBi/iD8An1FiTWwVYkGoJmB/uSKlQ2emCm/2s+SPkHp/u5D7w6whyPyo3IHaNsmozuWGFFl86rlkKcX5n5bezcCVO76HuEn7Zg/hbLMhtgtsT9/Rt0DojfBb5VFePPxE60uOkFZYv3B/svI/4jgjN6uAQKx0pFU0JRHxTaTDoPBMIJV1bfyIDtqrdhTyUfgQkyr6AU/PEqd8g3NOLm/BFqLgkjJJpq0at9SJZPHV8fd7oNjsXPu/gjsecf5NMJ8rvZ/EFzhDlVCCYIrN51aCIusPvXzvS6Oa2LUBWdACJurHUicrL1tS+/W3yt038ngO3xV21DD9SUeaPu6KxYSRv0qoKkMp/k99MiFyjwc2iyghEyF6q/IG5hBV2Z6+yAwjm1S1/J8G+s/Qv4gbWB2qd6T0Q84TeHkG2slo7JJ7poYU8ctK2My9SQOSdWw4X2U/kM8Wo/Fwy2vlpdnmrZBw+w3J9b3M09SfZUGtf2X3rMU8RoPVOJi//KhAu4T+DELBVjP3+wAVcdg4mk2ylPjImMmpElA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(4326008)(37006003)(54906003)(70206006)(70586007)(6636002)(316002)(81166007)(82740400003)(356005)(41300700001)(6486002)(82310400005)(478600001)(86362001)(8676002)(8936002)(6862004)(5660300002)(33656002)(40460700003)(107886003)(40480700001)(26005)(6512007)(6506007)(53546011)(36860700001)(36756003)(336012)(186003)(2906002)(83380400001)(47076005)(2616005)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:20:26.5561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1138b77e-3698-4549-80a4-08db5c6a66ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8914

Hi Luca,

> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Add a device tree property in the dom0less domU configuration
> to enable the guest to use SVE.
>=20
> Update documentation.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from v6:
> - Use ifdef in create_domUs and fail if 'sve' is used on systems
>   with CONFIG_ARM64_SVE not selected (Bertrand, Julien, Jan)
> Changes from v5:
> - Stop the domain creation if SVE not supported or SVE VL
>   errors (Julien, Bertrand)
> - now sve_sanitize_vl_param is renamed to sve_domctl_vl_param
>   and returns a boolean, change the affected code.
> - Reworded documentation.
> Changes from v4:
> - Now it is possible to specify the property "sve" for dom0less
>   device tree node without any value, that means the platform
>   supported VL will be used.
> Changes from v3:
> - Now domainconfig_encode_vl is named sve_encode_vl
> Changes from v2:
> - xen_domctl_createdomain field name has changed into sve_vl
>   and its value is the VL/128, use domainconfig_encode_vl
>   to encode a plain VL in bits.
> Changes from v1:
> - No changes
> Changes from RFC:
> - Changed documentation
> ---
> docs/misc/arm/device-tree/booting.txt | 16 +++++++++++++++
> xen/arch/arm/domain_build.c           | 28 +++++++++++++++++++++++++++
> 2 files changed, 44 insertions(+)
>=20
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 3879340b5e0a..32a0e508c471 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -193,6 +193,22 @@ with the following properties:
>     Optional. Handle to a xen,cpupool device tree node that identifies th=
e
>     cpupool where the guest will be started at boot.
>=20
> +- sve
> +
> +    Optional. The `sve` property enables Arm SVE usage for the domain an=
d sets
> +    the maximum SVE vector length, the option is applicable only to AArc=
h64
> +    guests.
> +    A value equal to 0 disables the feature, this is the default value.
> +    Specifying this property with no value, means that the SVE vector le=
ngth
> +    will be set equal to the maximum vector length supported by the plat=
form.
> +    Values above 0 explicitly set the maximum SVE vector length for the =
domain,
> +    allowed values are from 128 to maximum 2048, being multiple of 128.
> +    Please note that when the user explicitly specifies the value, if th=
at value
> +    is above the hardware supported maximum SVE vector length, the domai=
n
> +    creation will fail and the system will stop, the same will occur if =
the
> +    option is provided with a non zero value, but the platform doesn't s=
upport
> +    SVE.
> +
> - xen,enhanced
>=20
>     A string property. Possible property values are:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9202a96d9c28..ba4fe9e165ee 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -4008,6 +4008,34 @@ void __init create_domUs(void)
>             d_cfg.max_maptrack_frames =3D val;
>         }
>=20
> +        if ( dt_get_property(node, "sve", &val) )
> +        {
> +#ifdef CONFIG_ARM64_SVE
> +            unsigned int sve_vl_bits;
> +            bool ret =3D false;
> +
> +            if ( !val )
> +            {
> +                /* Property found with no value, means max HW VL support=
ed */
> +                ret =3D sve_domctl_vl_param(-1, &sve_vl_bits);
> +            }
> +            else
> +            {
> +                if ( dt_property_read_u32(node, "sve", &val) )
> +                    ret =3D sve_domctl_vl_param(val, &sve_vl_bits);
> +                else
> +                    panic("Error reading 'sve' property");
> +            }
> +
> +            if ( ret )
> +                d_cfg.arch.sve_vl =3D sve_encode_vl(sve_vl_bits);
> +            else
> +                panic("SVE vector length error\n");
> +#else
> +            panic("'sve' property found, but CONFIG_ARM64_SVE not select=
ed");
> +#endif
> +        }
> +
>         /*
>          * The variable max_init_domid is initialized with zero, so here =
it's
>          * very important to use the pre-increment operator to call
> --=20
> 2.34.1
>=20


