Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4E2FD168
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 14:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71374.127730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2DrX-0008JA-4c; Wed, 20 Jan 2021 13:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71374.127730; Wed, 20 Jan 2021 13:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2DrX-0008Ik-0z; Wed, 20 Jan 2021 13:49:31 +0000
Received: by outflank-mailman (input) for mailman id 71374;
 Wed, 20 Jan 2021 13:49:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ziLf=GX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l2DrV-0008If-F0
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 13:49:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.60]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fef6cbc5-7529-4206-8778-f4770de28122;
 Wed, 20 Jan 2021 13:49:27 +0000 (UTC)
Received: from AM5PR0202CA0023.eurprd02.prod.outlook.com
 (2603:10a6:203:69::33) by VI1PR08MB3871.eurprd08.prod.outlook.com
 (2603:10a6:803:b7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 13:49:23 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::96) by AM5PR0202CA0023.outlook.office365.com
 (2603:10a6:203:69::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Wed, 20 Jan 2021 13:49:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 13:49:23 +0000
Received: ("Tessian outbound 4d8113405d55:v71");
 Wed, 20 Jan 2021 13:49:23 +0000
Received: from f010c3c3b664.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33E7C152-FA9C-4312-8EA6-8B4B8158DA5D.1; 
 Wed, 20 Jan 2021 13:49:18 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f010c3c3b664.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Jan 2021 13:49:18 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com (2603:10a6:102:90::10)
 by PR3PR08MB5721.eurprd08.prod.outlook.com (2603:10a6:102:84::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 13:49:17 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892]) by PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 13:49:17 +0000
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
X-Inumbo-ID: fef6cbc5-7529-4206-8778-f4770de28122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d46rINQXHdPBfEE14otRu77IEYZASnQJZZvjW8s6JeU=;
 b=QHpaEfTA8JbZ71nddqN1rMNtZp9Zmc29qZgTOLguZ1vnXoOfFftrOTyr2hutbVA3WLn01uCp2ci9WGlBZR+LtvGcafm3p2G5zG5h/qrVL2QnMrYbr4AQUIThKUcKTuiXr7nhODmAjdZWUaTJwxFSNYJqQJOU2tlDbdNOYb2qcqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3533e4fa48874edf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5M8tDtwpHTbTBE/6fCI6b1/m2kwkdDsAu0n34HEXzRgWQJW1fyH5heEa0IAyKhnPlGOXWCAvRp6eq2V+rQ1PdjIT4Ihx/ouyhjfXdpUU5u2xLv/CgZPV/arDunSdJ7Z2DzI6sh1Q9UTR9ySoo5LMz3T7UkczACU7/EDJlhOv1/40DlQyhWXZ61jPAw5kE5aQilzytnodDgRh9S7ithjAwA7ZihFwAcxYn7XKTs/jQyAz2Gn183XDqOyxM+RgQwWfMlxShFqHJFnNM+v7V86JxhhnYV1Om6LxdOs7DCUzSPw+FySVdx6bS0gX5Xdqgxsjysnmv3yONmeUpR4xJzY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d46rINQXHdPBfEE14otRu77IEYZASnQJZZvjW8s6JeU=;
 b=j2pjPfpqgTbkx88XcXvi0z5syvspzKwAGShwiUwY0b4Bfy8oBcq/kMa4M5vXtw8fxwmstWQTgEuRCbhOJ4OsDT1qwGXwGOn9seYtiAaxvOzCZup0phe9zz4rcmntqB/PxTNtSsQmntyJGCHV+irsGLwigticedISluDOT8sKM/j02Lh7vhqR/IwfcI+mCs2bWXtOq4/d4JC8sAtmKsPvxFIL0Y9ODv2AZyerluV9IOf98G4oNCDukQOx2RcAibggtf6VgwFuRjR9kes9QF4mdfNxJMeq9hS4EE2EBeMjGtjPghGihv7Z7B45oQ0E0rwtcYm/3USffS3M7o9YEpKFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d46rINQXHdPBfEE14otRu77IEYZASnQJZZvjW8s6JeU=;
 b=QHpaEfTA8JbZ71nddqN1rMNtZp9Zmc29qZgTOLguZ1vnXoOfFftrOTyr2hutbVA3WLn01uCp2ci9WGlBZR+LtvGcafm3p2G5zG5h/qrVL2QnMrYbr4AQUIThKUcKTuiXr7nhODmAjdZWUaTJwxFSNYJqQJOU2tlDbdNOYb2qcqI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Vladimir Murzin <Vladimir.Murzin@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH] xen/arm: Relax GIC version check
Thread-Topic: [XEN PATCH] xen/arm: Relax GIC version check
Thread-Index: AQHW7x9HewSid3p/SkK1tULxfyE6Rqowh9cA
Date: Wed, 20 Jan 2021 13:49:17 +0000
Message-ID: <2E5ADE20-FA13-4114-B618-9E081C311DAB@arm.com>
References: <20210120112644.8882-1-vladimir.murzin@arm.com>
In-Reply-To: <20210120112644.8882-1-vladimir.murzin@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d9a43cd3-e000-4e83-4a8b-08d8bd4a31ee
x-ms-traffictypediagnostic: PR3PR08MB5721:|VI1PR08MB3871:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3871440DAFCF808ACA9185B29DA20@VI1PR08MB3871.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qY5dq4GAMD9EZzqN3gCHiLCorMrEr1bD15w5OsTuN2ws0x1QkERdtMWZvZ/Th3k7uIhVi7z6AsNmBCk/fTi4sFn5Eci0CKzU5whWmrL7V24lghMnIAudYFErcaoYFdbuT3+sHpdtU8XADzmqM6WkO8cnfyUuDoZK1X2pH+hlndnv2D0dmp2/y2hg2tBk03pmOdwvlxcxhw7LKKP3xmA8KO6kcqaGUthtxk2O6T67mCR7d+IIMW+V5Pdys7mzszjDssiwkgkzqzZX3wGRR3VJKXPFW9N9Jpli3MSDFCYc3VPJ8bH4ODJdGDVPIYrTIW5iN/FY5qtUFE0uExnkyasEgep8nV3T03CNYtYjoUUO05G1uyW2GVS0FtpwTnKgMFYLZ/vRjuMweJN2xETLGGvRgiLEPUVAbOVXlt75DAJUg/1pPpYdLuYuaSXNY9SbhSdL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(37006003)(33656002)(36756003)(8936002)(71200400001)(2906002)(54906003)(316002)(6486002)(8676002)(6506007)(53546011)(6512007)(5660300002)(186003)(66446008)(55236004)(83380400001)(26005)(86362001)(6862004)(66476007)(4326008)(6636002)(66556008)(64756008)(2616005)(76116006)(66946007)(91956017)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?h5822KttANQSAfakrvgeNqCfniMTKV2diUbeAkpi7wQ6SUv4M2hyCluT2J0V?=
 =?us-ascii?Q?ffsZa5dofCoATpA05WPSrwz06oGGoeN4mofX7IqPiO1MRctnzfDutkNYEr4A?=
 =?us-ascii?Q?uIJ6MyRHXc6/juOAyYba9uhkPaJf4pguBd9vb3jOyAPnDzjtH7jn5UiMMxFv?=
 =?us-ascii?Q?w6/bdQvVIpPe/7QSdyUbSivAQhn5zY05s/ZqsPY9Eu7LzJxiihUiW67WcXzQ?=
 =?us-ascii?Q?NCx48/MA4RECyoPsuroc8VoIXktsVSU8BhTwdxpU3l8Y7+Dv0Fwg2Q2zeSBX?=
 =?us-ascii?Q?6aRDgDEPK60N2+piqvKgFh0cj3QX/hkWNhfNuVCrPvjh3HqRCE6VcQhFZnSl?=
 =?us-ascii?Q?49+2IzKb8yBjikl/FPLn3YfTA9njeQKZ/gBk+fbya4bWAmPwiIjtTv86RlLz?=
 =?us-ascii?Q?rwAqKi9NlwQOg19pcEKV00N12CvnJklZiMhyPXoyhSUbqGf/JwuFIvGM6yOn?=
 =?us-ascii?Q?+sjXS9BLz1GJIHvW2URHtLZTg/keCpUAKw/9JxXOgA3VO4X8FD4JMd5kkeuv?=
 =?us-ascii?Q?04SPPHQNPWVpw2jxznhXgjkBOR+lZ6gLyKuITBNCwAyTf5B+gS5oaad+t+NK?=
 =?us-ascii?Q?S50oKXAXO4lI1avek9+zwbBVhzlTbfLRRZvBC9Kamc7L3ffN9JI3gM0M66/z?=
 =?us-ascii?Q?NgY28SAql1AFi96LnUU8BCefxY4ezGHeoUM9nPKg5q5tj6vBH/akte9v8GTm?=
 =?us-ascii?Q?mOf+TGhfOr0shRAIuFJcbI9mMrBZsyLWhriN+F8KYRN/jELy3p7PStKAYGCl?=
 =?us-ascii?Q?elptsf0/gCH8NuIX+z0vTsAkzp9j+bTqiIwY261k/3DPpffu3BHSoi8K0boT?=
 =?us-ascii?Q?7jeIMdXqV9s4kieOgN9i7THgBJfy8iH9j8i8NljPqHJVU0S+uXT5ZhJBB0o7?=
 =?us-ascii?Q?MS1LShJpFW9bcdn5FaUT5HvchMyce6FdSuOhBpWZefwrCVZeBkyOzPUEjW6z?=
 =?us-ascii?Q?8F/+Cz43l98QnLsNAyWIurPx7ry2fbuudmWN5Tu4JZp+YqBVzr50PTq5soFI?=
 =?us-ascii?Q?EM3O?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2B0E4D12D3BB58459B27ECA9425E2226@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5721
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65382e66-a60a-4e79-7a8d-08d8bd4a2e1c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nNRCR9Ubx12f0o7O3IK+gCJ5ZfgeMVx9CjVx7Nw0b51WP3V19tdzGk6CRwBSTabMMKaIiqvuQ0YWelvlqMYKtn1n7oAkBoJYEd2J+2V86sZkaTUQLDp081vxCp8e9gtNNwF8gEJJRa+YThs9dHi8u24z5t45h2O+UhW+RUJ9fUHpmrHagCyDZVxfdvNp/UY1qZBxEl+Fbcevfl4XKGUtFGi9vGMueTF+HxODZrWBxYRtYHJQ5X6Soww75/54RUU8pk0XcETd2aX5KJCpDdc7X1CE7S4A/Ei+65EFb/nu7kmLu++K4sWTXyWE9w5CDCWiHg7OkzRcYAAOqiLH75fwimO5RND0iCK5kHKDCHCaXjCsY645GNyjZjnzgzITiWvCHeMMlwa/VWC64hTPmWsL0o95o5FFn+ldEFXHyj4LElj9sjLaozRUYViZm1yyshTJGae7gifq+HGBhV1nijZiqw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(5660300002)(70206006)(26005)(107886003)(316002)(2616005)(356005)(83380400001)(86362001)(82740400003)(6636002)(6862004)(82310400003)(6486002)(6512007)(81166007)(55236004)(2906002)(186003)(336012)(33656002)(37006003)(6506007)(478600001)(8936002)(70586007)(8676002)(54906003)(47076005)(36756003)(4326008)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:49:23.5195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a43cd3-e000-4e83-4a8b-08d8bd4a31ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3871

Hi Vladimir,

> On 20 Jan 2021, at 11:26, Vladimir Murzin <Vladimir.Murzin@arm.com> wrote=
:
>=20
> Supported values are
>=20
> 0b0000 GIC CPU interface system registers not implemented.
>=20
> 0b0001 System register interface to versions 3.0 and 4.0 of the GIC
>       CPU interface is supported.
>=20
> 0b0011 System register interface to version 4.1 of the GIC CPU
>       interface is supported.
>=20
> 4.1 is still backward compatible with 4.0/3.0, moreover ARM ARM
> guarantees that future versions of the GIC CPU interface retain
> backwards compatible.
>=20
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks a lot

Cheers
Bertrand

> ---
> xen/include/asm-arm/cpufeature.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufe=
ature.h
> index 13a2739a6..c6e5711b2 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -17,7 +17,7 @@
> #define cpu_has_el3_64    (boot_cpu_feature64(el3) >=3D 1)
> #define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
> #define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
> -#define cpu_has_gicv3     (boot_cpu_feature64(gic) =3D=3D 1)
> +#define cpu_has_gicv3     (boot_cpu_feature64(gic) >=3D 1)
> #endif
>=20
> #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
> --=20
> 2.24.0
>=20
>=20


