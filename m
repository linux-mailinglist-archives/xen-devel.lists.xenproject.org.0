Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7C41DC60
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 16:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199994.354366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVx8m-0008PQ-PC; Thu, 30 Sep 2021 14:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199994.354366; Thu, 30 Sep 2021 14:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVx8m-0008Lr-Kq; Thu, 30 Sep 2021 14:34:28 +0000
Received: by outflank-mailman (input) for mailman id 199994;
 Thu, 30 Sep 2021 14:34:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YInd=OU=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVx8k-0008Kr-ND
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 14:34:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82835e69-21fb-11ec-bd4e-12813bfff9fa;
 Thu, 30 Sep 2021 14:34:25 +0000 (UTC)
Received: from DB6PR07CA0112.eurprd07.prod.outlook.com (2603:10a6:6:2c::26) by
 AS8PR08MB6696.eurprd08.prod.outlook.com (2603:10a6:20b:395::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15; Thu, 30 Sep 2021 14:34:23 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::75) by DB6PR07CA0112.outlook.office365.com
 (2603:10a6:6:2c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7 via Frontend
 Transport; Thu, 30 Sep 2021 14:34:23 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 14:34:23 +0000
Received: ("Tessian outbound ac52c8afb262:v103");
 Thu, 30 Sep 2021 14:34:20 +0000
Received: from 56e10d3f41fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19CCD413-BD0A-44CF-9BDA-0B86ECB9268D.1; 
 Thu, 30 Sep 2021 14:34:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56e10d3f41fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Sep 2021 14:34:04 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB7033.eurprd08.prod.outlook.com (2603:10a6:102:205::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 14:34:03 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4566.017; Thu, 30 Sep 2021
 14:34:03 +0000
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
X-Inumbo-ID: 82835e69-21fb-11ec-bd4e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/Go2rrV/CU19V32/sbDJzpTN+DxJv09PRmwy2pct5Q=;
 b=+IypazHw6IAwmOadB49aATZ6ZqCzFiN/atClH2prO33eQcPNNlIankkoKe/PjndX2vztVUXf234nnMDF+QVPdodwhzpQyfcl/pdfPE8zv9SgjYRh+Mh0rjNh/ButHZl0qrRVWShft9QhDq9HEaYom1F07M75v9JQDt/q7F9HT3k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d7116eb65465f56a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPPCpLsLnazcTOcrYuKpyd0yhy0Txi+nfGiddnXSDACyjJ5OVOVEAQUjrj/gbzAVm7WPjP2LUImYS2hEnQuoZ+43BVynzkpoX9P2PN+Sjz+xQB2MOWFx+uriHu70nqn8KkV8kSTC/i8Q9upAAISggipfP0DUlshx+xXqMv3YHeYnb/SO+7ktvSIbrEzq3j3dWHBHjSf7whFnsksZcdCewlkG76844VXm91IdVubd2qUnWpmVr3Y9mOqBMzUa+7dIdVHAR21gISYV61tZg00IAdaMndi6uSub5pteyw3nA4VW2IR3fPwvZwncIGp6prUrFHwjOY51/5cUQ8z6lXWIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=x/Go2rrV/CU19V32/sbDJzpTN+DxJv09PRmwy2pct5Q=;
 b=YntlPN6DtYAxNMmtTP9F+2pHuy9iup/IBLnWtma+YDgdR4mgl5n8obeUnoqrObucnzd8Uc5ihYQTStbz6ZHEx4ZRp9GUyUnrGmA3SQVAclxZicYgxgXqGhLjghscsnjbYZZN2qJzqJQvBwosFHVRav1wya5YtNmaqm3u9+lg8IKJDB4Lh37EdM/rxXp+H9yMGHOWk0bTIvpTrpKRF8PlvHbzCac6XUJF4qwTYGIV04dL4q7KjFKqPMLgKzJ5+XtmJDmjAY/VeC0VIQVMk0lQ3MQDg8NAohGmf7cUtpdTIcUIC6nMqkv2bARt97ijbacPcyTXy+6E4iENXp7TVuXF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/Go2rrV/CU19V32/sbDJzpTN+DxJv09PRmwy2pct5Q=;
 b=+IypazHw6IAwmOadB49aATZ6ZqCzFiN/atClH2prO33eQcPNNlIankkoKe/PjndX2vztVUXf234nnMDF+QVPdodwhzpQyfcl/pdfPE8zv9SgjYRh+Mh0rjNh/ButHZl0qrRVWShft9QhDq9HEaYom1F07M75v9JQDt/q7F9HT3k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v4 3/3] arm/efi: load dom0 modules from DT using UEFI
Thread-Topic: [PATCH v4 3/3] arm/efi: load dom0 modules from DT using UEFI
Thread-Index: AQHXtgeNfczdAxKdc02vjouzHO+KY6u8pF6A
Date: Thu, 30 Sep 2021 14:34:03 +0000
Message-ID: <21DC7A33-876E-409C-9A8A-F5263D29CA2D@arm.com>
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-4-luca.fancellu@arm.com>
In-Reply-To: <20210930142846.13348-4-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 85c5a054-5b77-4b51-f7a1-08d9841f659b
x-ms-traffictypediagnostic: PAXPR08MB7033:|AS8PR08MB6696:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6696A8901C01693BEC5FFCCE9DAA9@AS8PR08MB6696.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YDqow4uzVBtFqJA9mp8APe477GHGksIVHcC88EmMiSfemgRkL2nVn6TCmiDNibkLlUHSg11zglnsOHdIPToqwrRFA95GgHbI9dP5lqsHHPbac+U2HWR8dekw0Htec8pHm+fivS4t5PSvHsMw4m8CXw+QaENWTAtYTKc3+5v+T0DiP0VacT7Z/WFCcs/+SLZcz93NQgAUn3QpGrAyF+7d0nZ/Zq4A0qK45G5h3HD15+JG0IHn76WHd+vAhxlqMeorXJ6hlgSZu4yKeMtWlVEpKJecp616TkUrV0EpUNfldREQr/tE/ged8Sn+PiTmOTAayW+GcingukmEe59uxIjncPCq2NzeBBtvBwk39uPGFlNnvYflAUCkcJMZWDYHUvcfB+T2HVCEQ23Lc4ZwS5A51320UMMmB8rFNSxpdBfa/6a2NQ+PdcOTawXVGMbML9pmUiC5KpuD1irnSoeiYQna2JfF4UHEDfZr5uyvwnN84b9cvEt2r6uc0rNR3A8/2y9y1DFnyFNgBu1CgDcrQWG1NPDVjsqf7um7Gc+zPMkgI5Ui9ndpLrKobM8Bi8bjrfdGvGQksBOZpjeghYSlvuwvmCTOuEc18hiCxj8sqFvJ0RAGKf/WjtZgHSPQ6L3wdtTGq82E+Bcbo+H3tgH11jTOGITKkq/qX9ECFFbGJPG0ECqAEj6i/wj/KV2II3dZr8qbgCAX2jx+jvQfWxXQuAoJWJ1nABMs6N4rWvbpLO2Ohx7/42DIikEzFsGxpr1PBlyGth1qWtrioQE67uWJ3MM0rQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(83380400001)(508600001)(36756003)(186003)(6636002)(33656002)(86362001)(122000001)(5660300002)(4326008)(37006003)(38100700002)(6486002)(26005)(54906003)(6862004)(76116006)(71200400001)(53546011)(6512007)(38070700005)(66446008)(64756008)(66556008)(66476007)(91956017)(66946007)(8936002)(2906002)(6506007)(8676002)(316002)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D6D1CC7C0C0204BA293C6D3E44BAB3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7033
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2aa19fd4-aa03-4792-37ec-08d9841f59d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3EGiq3lZvz9HoIV+crRxczqAd6u/qw6Ct6EU/GT9ILWpHDJ5cJO0Iy/3bZIWmmJBdS9CKsc4ZMbIJEjLHH+LG1EaPRjIFSQSY3TG0CSd7y5ixy3my3oqhlSR88HtjfTlv5GcAG4sKUgptmbjpE1Im4KJLwuo0izANoHpFitDCzRkKBvzm+W0pmacFIQxidUHuSwljoaxoVv20jtM9ZrLC9Y/5TfqusxQvhq5u2PVM487+VBf8dyCSgCIpzqICs87cVDwD1lOY7zfDP9n00jMwD1FjMxKSAF4xuF7slk0fj4KZXT4Vt8f1wcDkUeVYNBOhUgcCdDmsf4EBCvmOIXUr5t8iqtPZaeLjVgmlfjZS02LZ9l9I0KsGO27KDWQYvLhUk+01sFn1Qlbmi8LUp2mgg2XNr1f28AQWRSHSqW2N/EVCTGhU9rBkmFbed52p7dhFTV2gdi9duqAGzBOhh9zP8yI85G7DgnlNVoHj0OV3s6c4UjB8e870kBhM2l9Xro7zZvLSbTJ/uhMsbQtpPWhwwIKVNZsuZpGQFmj3YOENUEq1tSdVSjtnsUCvcY8ZyxFP5Ny0V6Jh0uyvOpG6xDjwzhR8GLv5MBq1z2bWeD3cNYlV9DtAToiE6ilrOtvXm2qRh08evba/tv2SjD07GOR78q7ixkHKXAE+cordZJEppkp+2DpKefovsUyk+1WIcxYgDZYSW2SmaMY2GUP4P9plHUBxVSHzBb2NJbhksUGb0M=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(86362001)(70206006)(8936002)(82310400003)(70586007)(6506007)(53546011)(6512007)(83380400001)(186003)(2616005)(336012)(26005)(4326008)(8676002)(33656002)(5660300002)(6862004)(36860700001)(6636002)(2906002)(356005)(36756003)(508600001)(54906003)(37006003)(316002)(47076005)(6486002)(81166007)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 14:34:23.3138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c5a054-5b77-4b51-f7a1-08d9841f659b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6696

Hi Luca,

> On 30 Sep 2021, at 15:28, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Add support to load Dom0 boot modules from
> the device tree using the xen,uefi-binary property.
>=20
> Update documentation about that.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v4:
> - Add check to avoid double definition of Dom0 ramdisk
> from cfg file and DT
> - Fix if conditions indentation in boot.c
> - Moved Dom0 kernel verification code after check for
> presence for Dom0 or DomU(s)
> - Changed uefi,binary property to xen,uefi-binary
> Changes in v3:
> - new patch
> ---
> docs/misc/arm/device-tree/booting.txt |  8 ++++
> docs/misc/efi.pandoc                  | 64 +++++++++++++++++++++++++--
> xen/arch/arm/efi/efi-boot.h           | 47 ++++++++++++++++++--
> xen/common/efi/boot.c                 | 16 ++++---
> 4 files changed, 123 insertions(+), 12 deletions(-)
>=20
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 7258e7e1ec..8e0c327ba4 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -70,6 +70,14 @@ Each node contains the following properties:
> 	priority of this field vs. other mechanisms of specifying the
> 	bootargs for the kernel.
>=20
> +- uefi,binary (UEFI boot only)
> +
> +	String property that specifies the file name to be loaded by the UEFI
> +	boot for this module. If this is specified, there is no need to specify
> +	the reg property because it will be created by the UEFI stub on boot.
> +	This option is needed only when UEFI boot is used, the node needs to be
> +	compatible with multiboot,kernel or multiboot,ramdisk.
> +
> Examples
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 876cd55005..4abbb5bb82 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -167,6 +167,28 @@ sbsign \
> 	--output xen.signed.efi \
> 	xen.unified.efi
> ```
> +## UEFI boot and Dom0 modules on ARM
> +
> +When booting using UEFI on ARM, it is possible to specify the Dom0 modul=
es
> +directly from the device tree without using the Xen configuration file, =
here an
> +example:
> +
> +chosen {
> +	#size-cells =3D <0x1>;
> +	#address-cells =3D <0x1>;
> +	xen,xen-bootargs =3D "[Xen boot arguments]"
> +
> +	module@1 {
> +		compatible =3D "multiboot,kernel", "multiboot,module";
> +		xen,uefi-binary =3D "vmlinuz-3.0.31-0.4-xen";
> +		bootargs =3D "[domain 0 command line options]";
> +	};
> +
> +	module@2 {
> +		compatible =3D "multiboot,ramdisk", "multiboot,module";
> +		xen,uefi-binary =3D "initrd-3.0.31-0.4-xen";
> +	};
> +}
>=20
> ## UEFI boot and dom0less on ARM
>=20
> @@ -326,10 +348,10 @@ chosen {
> ### Boot Xen, Dom0 and DomU(s)
>=20
> This configuration is a mix of the two configuration above, to boot this =
one
> -the configuration file must be processed so the /chosen node must have t=
he
> -"xen,uefi-cfg-load" property.
> +the configuration file can be processed or the Dom0 modules can be read =
from
> +the device tree.
>=20
> -Here an example:
> +Here the first example:
>=20
> Xen configuration file:
>=20
> @@ -369,4 +391,40 @@ chosen {
> };
> ```
>=20
> +Here the second example:
> +
> +Device tree:
> +
> +```
> +chosen {
> +	#size-cells =3D <0x1>;
> +	#address-cells =3D <0x1>;
> +	xen,xen-bootargs =3D "[Xen boot arguments]"
> +
> +	module@1 {
> +		compatible =3D "multiboot,kernel", "multiboot,module";
> +		xen,uefi-binary =3D "vmlinuz-3.0.31-0.4-xen";
> +		bootargs =3D "[domain 0 command line options]";
> +	};
> +
> +	module@2 {
> +		compatible =3D "multiboot,ramdisk", "multiboot,module";
> +		xen,uefi-binary =3D "initrd-3.0.31-0.4-xen";
> +	};
> +
> +	domU1 {
> +		#size-cells =3D <0x1>;
> +		#address-cells =3D <0x1>;
> +		compatible =3D "xen,domain";
> +		cpus =3D <0x1>;
> +		memory =3D <0x0 0xc0000>;
> +		vpl011;
>=20
> +		module@1 {
> +			compatible =3D "multiboot,kernel", "multiboot,module";
> +			xen,uefi-binary =3D "Image-domu1.bin";
> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
> +		};
> +	};
> +};
> +```
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 50b3829ae0..b122e2846a 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -31,8 +31,11 @@ static unsigned int __initdata modules_idx;
> #define ERROR_MISSING_DT_PROPERTY   (-3)
> #define ERROR_RENAME_MODULE_NAME    (-4)
> #define ERROR_SET_REG_PROPERTY      (-5)
> +#define ERROR_DOM0_ALREADY_FOUND    (-6)
> +#define ERROR_DOM0_RAMDISK_FOUND    (-7)
> #define ERROR_DT_MODULE_DOMU        (-1)
> #define ERROR_DT_CHOSEN_NODE        (-2)
> +#define ERROR_DT_MODULE_DOM0        (-3)
>=20
> void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
> void __flush_dcache_area(const void *vaddr, unsigned long size);
> @@ -45,7 +48,8 @@ static int allocate_module_file(EFI_FILE_HANDLE dir_han=
dle,
> static int handle_module_node(EFI_FILE_HANDLE dir_handle,
>                               int module_node_offset,
>                               int reg_addr_cells,
> -                              int reg_size_cells);
> +                              int reg_size_cells,
> +                              bool is_domu_module);
> static bool is_boot_module(int dt_module_offset);
> static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>                                        int domain_node);
> @@ -701,7 +705,8 @@ static int __init allocate_module_file(EFI_FILE_HANDL=
E dir_handle,
> static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
>                                      int module_node_offset,
>                                      int reg_addr_cells,
> -                                     int reg_size_cells)
> +                                     int reg_size_cells,
> +                                     bool is_domu_module)
> {
>     const void *uefi_name_prop;
>     char mod_string[24]; /* Placeholder for module@ + a 64-bit number + \=
0 */
> @@ -743,6 +748,34 @@ static int __init handle_module_node(EFI_FILE_HANDLE=
 dir_handle,
>         return ERROR_SET_REG_PROPERTY;
>     }
>=20
> +    if ( !is_domu_module )
> +    {
> +        if ( (fdt_node_check_compatible(fdt, module_node_offset,
> +                                    "multiboot,kernel") =3D=3D 0) )
> +        {
> +            /*
> +            * This is the Dom0 kernel, wire it to the kernel variable be=
cause it
> +            * will be verified by the shim lock protocol later in the co=
mmon
> +            * code.
> +            */
> +            if ( kernel.addr )
> +            {
> +                PrintMessage(L"Dom0 kernel already found in cfg file.");
> +                return ERROR_DOM0_ALREADY_FOUND;
> +            }
> +            kernel.need_to_free =3D false; /* Freed using the module arr=
ay */
> +            kernel.addr =3D file->addr;
> +            kernel.size =3D file->size;
> +        }
> +        else if ( ramdisk.addr &&
> +                  (fdt_node_check_compatible(fdt, module_node_offset,
> +                                             "multiboot,ramdisk") =3D=3D=
 0) )
> +        {
> +            PrintMessage(L"Dom0 ramdisk already found in cfg file.");
> +            return ERROR_DOM0_RAMDISK_FOUND;
> +        }
> +    }
> +
>     return 0;
> }
>=20
> @@ -799,7 +832,7 @@ static int __init handle_dom0less_domain_node(EFI_FIL=
E_HANDLE dir_handle,
>         if ( is_boot_module(module_node) )
>         {
>             int ret =3D handle_module_node(dir_handle, module_node, addr_=
cells,
> -                                         size_cells);
> +                                         size_cells, true);
>             if ( ret < 0 )
>                 return ret;
>         }
> @@ -809,7 +842,7 @@ static int __init handle_dom0less_domain_node(EFI_FIL=
E_HANDLE dir_handle,
>=20
> /*
>  * This function checks for xen domain nodes under the /chosen node for p=
ossible
> - * domU guests to be loaded.
> + * dom0 and domU guests to be loaded.
>  * Returns the number of modules loaded or a negative number for error.
>  */
> static int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> @@ -836,6 +869,12 @@ static int __init efi_arch_check_dt_boot(EFI_FILE_HA=
NDLE dir_handle)
>             if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
>                 return ERROR_DT_MODULE_DOMU;
>         }
> +        else if ( is_boot_module(node) )
> +        {
> +            if ( handle_module_node(dir_handle, node, addr_len, size_len=
,
> +                                    false) < 0 )
> +                return ERROR_DT_MODULE_DOM0;
> +        }
>     }
>=20
>     /* Free boot modules file names if any */
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index daf7c26099..e4295dbe34 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1296,11 +1296,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>         {
>             read_file(dir_handle, s2w(&name), &kernel, option_str);
>             efi_bs->FreePool(name.w);
> -
> -            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL=
,
> -                            (void **)&shim_lock)) &&
> -                 (status =3D shim_lock->Verify(kernel.ptr, kernel.size))=
 !=3D EFI_SUCCESS )
> -                PrintErrMesg(L"Dom0 kernel image could not be verified",=
 status);
>         }
>=20
>         if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
> @@ -1385,6 +1380,17 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>     if ( !dt_modules_found && !kernel.addr )
>         blexit(L"No Dom0 kernel image specified.");
>=20
> +    /*
> +     * The Dom0 kernel can be loaded from the configuration file or by t=
he
> +     * device tree through the efi_arch_check_dt_boot function, in this =
stage
> +     * verify it.
> +     */
> +    if ( kernel.addr &&
> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> +                                           (void **)&shim_lock)) &&
> +         (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D EF=
I_SUCCESS )
> +        PrintErrMesg(L"Dom0 kernel image could not be verified", status)=
;
> +
>     efi_arch_edd();
>=20
>     /* XXX Collect EDID info. */
> --=20
> 2.17.1
>=20


