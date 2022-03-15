Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D074D9994
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 11:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290727.493162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4kj-0007vI-Hk; Tue, 15 Mar 2022 10:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290727.493162; Tue, 15 Mar 2022 10:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4kj-0007sK-EK; Tue, 15 Mar 2022 10:50:09 +0000
Received: by outflank-mailman (input) for mailman id 290727;
 Tue, 15 Mar 2022 10:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG/1=T2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nU4kh-0007ny-Cd
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 10:50:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac3c4397-a44d-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 11:50:05 +0100 (CET)
Received: from DB8PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:10:110::12)
 by AM0PR08MB3009.eurprd08.prod.outlook.com (2603:10a6:208:66::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Tue, 15 Mar
 2022 10:50:02 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::90) by DB8PR04CA0002.outlook.office365.com
 (2603:10a6:10:110::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28 via Frontend
 Transport; Tue, 15 Mar 2022 10:50:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 10:50:02 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Tue, 15 Mar 2022 10:50:02 +0000
Received: from ad1b7f1063a4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EEF7EDE4-9468-4835-BA17-18AC43C8BC8B.1; 
 Tue, 15 Mar 2022 10:49:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad1b7f1063a4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Mar 2022 10:49:51 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16)
 by AM0PR08MB3041.eurprd08.prod.outlook.com (2603:10a6:208:5c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Tue, 15 Mar
 2022 10:49:49 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74]) by VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74%5]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 10:49:48 +0000
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
X-Inumbo-ID: ac3c4397-a44d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/0ZxOlFSt+JpaPDDFNnM0cjDKFQZOl+CG4o5PcQgd4=;
 b=Nk71zB/E0HXjB6bPFQgBr+gRZ/9X1l6S28PbQK/3ElqIA3m5N1UPrPauy4dCVi75JuGpk2AE5EtOozT0dF+musrZvGYhXx8UiiO/Gmo87VUIJOBbRS5wqBEDCgLAaRCK3m7FX3eP1odCcniL58shjmgFQ8RGwmWTM9XLm/CydGA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4edfa8dd4866a65
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IC4T2icbfF3Xa2iW3xvdxl9nTAvTvbfygX3hELIdA3iBdlBREyc23tDcwGw+GqWme49/b3x8+QWnSDi+G2m7Wvc1MqRuQXQZoTIVo60TmGQMPZ8P/BQ8LKmIvBLR/JL+kJ/LHC2u3DshQHthlGkABFNjIGzzIBuEQL3f4IwqzU/ruqdk2wZKNa3dR3aaKri0phPmMVY7vxb3j3YZLRVbDQ3088hxkh/LdBCEYqr0ij9Uu+zbtnv2CV2Pznb65hlDivRNEpbv2M7jq8QfmYQVITuL6241iLt4EinLx7GHj9Ql0ou9aXGFePrMeAn78Gh3rrY7wDtZNvcJ3GEe97vzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/0ZxOlFSt+JpaPDDFNnM0cjDKFQZOl+CG4o5PcQgd4=;
 b=myVAT+6dDpmYzi7pYvkPmODZgU153QyIHriPlKvm2+RrMKnpOObYxCWr2sm4F94CgafIe40SGQJXGiUT/BKtuW2cHQ9pzQgSv61kz3/70M1plRrTjOSVHVmotKFx3nJad93wBI3sL1HzfiRn+RaYjz+FPMILMpMG3xhEzk/USQt94Bqc9EpTsBZMkb2JIk4HnAtnbS1raP6v5fQJrxDrZGEvx7JTuKyDOB9UZgTi/UZX866ebVdty51474qG5Szk/6KD3j73jpnuGvXJsreiV3rtgP3D3kcoFoE9nIDeBA9RberI3UrH5a7UidnuE+lhwhBZ+NFAI5p7XqZddiqyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/0ZxOlFSt+JpaPDDFNnM0cjDKFQZOl+CG4o5PcQgd4=;
 b=Nk71zB/E0HXjB6bPFQgBr+gRZ/9X1l6S28PbQK/3ElqIA3m5N1UPrPauy4dCVi75JuGpk2AE5EtOozT0dF+musrZvGYhXx8UiiO/Gmo87VUIJOBbRS5wqBEDCgLAaRCK3m7FX3eP1odCcniL58shjmgFQ8RGwmWTM9XLm/CydGA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v3 12/14] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Thread-Topic: [XEN][RFC PATCH v3 12/14] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Thread-Index: AQHYMyVwhcvCOHGT7kKCLwt0mHExGazATnuA
Date: Tue, 15 Mar 2022 10:49:48 +0000
Message-ID: <DF0CEB0D-9B6B-45D9-B104-3F2AE5DA9208@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-13-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-13-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4b75fad8-31eb-4e28-da1c-08da06718edd
x-ms-traffictypediagnostic:
	AM0PR08MB3041:EE_|DB5EUR03FT013:EE_|AM0PR08MB3009:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3009EAF8FE6DAA434C0C8591E4109@AM0PR08MB3009.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G5N+hU1OWMadqJGwL0226bu3d5XD84WAPSqnSIPm2oeo29j2iDu8uvEx7Tcw0LzPS9rfhTwdM4tsRthF+nk4ZpxX3KNQLu3IwKk03dqdHu5YkxJzV5vJ97j85HC73JcorglpMIp2xz1Nmp1AUWbHW8sz5kcKh4ZSamTI+3IkYFwvlXRSbYl6ycJbjHPcSkxoydDi3rtDmfb2tFzDEZoqudNm1r/Vdwi+WwXRDP7NVn6smLc3fi3FejEBBwwjfGlf3rTmooQ/d/TB7ax84g47Ydi+1X7xVekDuiGed4PNHInFCy0pUfRsn1sGtohQ5fqWPkt+f46B3w7CYNk0n7iliU8sydlZihZ3m+hRXLx/UEJ6c0VIPViPk1und9GQ4akoMWgiZeITZqxZlomkNpYvYY4W8h5/f2Wze63CviwPPp3E2Labw+N5wh2rshzQo7BnV5f0WR+DhExA5D/ohnRNVeXcr6X73sSgfDO0n0cYUqqIcI3T69IDktrpWSeRPHolHal1mH2+8DFeBVgLeOb8JYi3ClIBJEwPaWwSyeEQ6jzXqgplU4yuKN6d+tZrWXiiW6uXmxECKG81ybu6hAx/BKyobnCrd2I3F05ZR+tm+sRuzivfcIonT8X2xSGroUsmsDSrHw5IJNMzXKoozK4x43B0QseepXysPtVZiMPKZyMEE21fGRWRR0GWs4BXTT7GNEHPXxetDrjVXYGMFc+QCoKUrdjIWoGAnBPFkkIOzGwGn+j39pWnDgC7cCH9n3IqUonBlaFgiHxTMgv4fWp9JhTpby9XzGhbt6VNIXqEMGoFXaYhf8Vtev0z5BDxD8szs1gXWHJ3qAoieY+IIqKeMw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38100700002)(122000001)(86362001)(38070700005)(2616005)(6512007)(6916009)(186003)(26005)(54906003)(508600001)(71200400001)(6506007)(6486002)(4326008)(8676002)(64756008)(66446008)(66476007)(5660300002)(76116006)(66946007)(8936002)(66556008)(316002)(83380400001)(91956017)(36756003)(33656002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <551D585A6EF1F842A99D984340F1EA41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3041
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d70dfaa4-08f8-40fe-3b78-08da067186d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YDoDVAiNX9RWpdwxAWMqriMZloVunaXcoyqMwoBHNQYyT7/7mGHZQwtcUai/J2+1Y/zQNJGbPAV4newJV07ErwiSkgsJiR14QWADESIQxDcJMy4eYfI1/Z7EAq0J8eU3tGAZ7nfvddbJb+I12dTE+lihkpDTIOs5qObQinHN8fgOVJJS4YwL5G9HyX6AwEIr0dH00Fyykq8MUmyllWcTkLpHOJ3fM4y51Ex0kPOF+CLn/cf3s/eiTsYq8HLJzuAXTjihCQVGYqdWWDTJYBWfxGo+jgJ1g7LsEFQd6HLeObB7Hm8B6uIdkPXt18bNooK7r4iBbuYQaghXz2yUWHRv6NJCShCvfduo9eXnWSZ4GLYFw4A4qms76njw7FZYZQk0pd9j2NdqyNlNH7Gv5qlbAO1Rjbz0lE4vCWkezWWaRvHQaFGUjNGUH6e4ilSvqyAeLgKSEnqRmlMCs8PDtkjr03jnbIYZNkRCgyeUUIS8KDaOw5KbMn70Nlrlgi5cNiLqq8rHYJd5iWuq0G6GUpWKGrhmX7+CwHLQhg2aXykLGEkzdDQVq00JiXFAadIEkivoVlwPfniMlC0H26wsd8MmdrOd1cKWSWUUlOUStttM6nrcldiHj6F6VA9Ni2U1Rj7rppLAyqtjRloqkQf0pAGI9z4pT7pdW8Va0Fs9isziVF1mi3aqubxPJ6lfhsDqMWYeEkR0Z1YTxt6FkKCfoOIXS8jey1cQ5ZsZOfBkoEHYA/yFSBmoE+/zlWSRj2Su4c3eoSsGh52iNH1MyHtUJZcs06G4pmdLFY+aSnYHImochfbjwHA1irzHxHjCGN0X1j3YQiKg90ce+uiV3Bk2ECkxBw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(2906002)(356005)(81166007)(86362001)(40460700003)(2616005)(6512007)(107886003)(336012)(54906003)(186003)(26005)(508600001)(6506007)(6486002)(4326008)(6862004)(8676002)(5660300002)(8936002)(70586007)(70206006)(47076005)(316002)(83380400001)(33656002)(82310400004)(36756003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 10:50:02.4165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b75fad8-31eb-4e28-da1c-08da06718edd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3009

>=20
> diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
> index ef7362327f..848a8737c7 100644
> --- a/tools/libs/ctrl/Makefile
> +++ b/tools/libs/ctrl/Makefile
> @@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>=20
> SRCS-y       +=3D xc_altp2m.c
> SRCS-y       +=3D xc_cpupool.c
> +SRCS-y       +=3D xc_overlay.c

I think these entries are in alphabetical order

> SRCS-y       +=3D xc_domain.c
> SRCS-y       +=3D xc_evtchn.c
> SRCS-y       +=3D xc_gnttab.c
> diff --git a/tools/libs/ctrl/xc_overlay.c b/tools/libs/ctrl/xc_overlay.c
> new file mode 100644
> index 0000000000..8fe780d75a
> --- /dev/null
> +++ b/tools/libs/ctrl/xc_overlay.c
> @@ -0,0 +1,51 @@
> +/*
> + *

This blank line can be removed=20

> + * Overlay control functions.
> + * Copyright (C) 2021 Xilinx Inc.
> + * Author Vikram Garhwal <fnu.vikram@xilinx.com>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation;
> + * version 2.1 of the License.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; If not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +
> +#include "xc_bitops.h"
> +#include "xc_private.h"
> +#include <xen/hvm/hvm_op.h>
> +#include <libfdt.h>
> +
> +int xc_dt_overlay(xc_interface *xch, void *overlay_fdt, int overlay_fdt_=
size,
> +                  uint8_t overlay_op)
> +{
> +    int err;
> +    DECLARE_SYSCTL;
> +
> +    DECLARE_HYPERCALL_BOUNCE(overlay_fdt, overlay_fdt_size,
> +                        XC_HYPERCALL_BUFFER_BOUNCE_IN);

XC_HYPERCALL_BUFFER_BOUNCE_IN can stay at the same level of overlay_fdt



