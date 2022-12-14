Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C50C64CCFA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 16:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462349.720524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5TZ8-0003J0-RC; Wed, 14 Dec 2022 15:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462349.720524; Wed, 14 Dec 2022 15:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5TZ8-0003GG-Nk; Wed, 14 Dec 2022 15:21:02 +0000
Received: by outflank-mailman (input) for mailman id 462349;
 Wed, 14 Dec 2022 15:21:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0y70=4M=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p5TZ6-0003GA-U5
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 15:21:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2082.outbound.protection.outlook.com [40.107.6.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8880b10-7bc2-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 16:20:57 +0100 (CET)
Received: from AM6PR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::36) by AM8PR08MB6451.eurprd08.prod.outlook.com
 (2603:10a6:20b:315::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 15:20:47 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::e4) by AM6PR01CA0059.outlook.office365.com
 (2603:10a6:20b:e0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Wed, 14 Dec 2022 15:20:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11 via Frontend Transport; Wed, 14 Dec 2022 15:20:47 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 14 Dec 2022 15:20:46 +0000
Received: from a566ae695563.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72164559-CF17-47B0-9FE8-A16FCF384CF0.1; 
 Wed, 14 Dec 2022 15:20:45 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a566ae695563.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Dec 2022 15:20:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBAPR08MB5829.eurprd08.prod.outlook.com (2603:10a6:10:1a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 15:20:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5924.010; Wed, 14 Dec 2022
 15:20:31 +0000
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
X-Inumbo-ID: e8880b10-7bc2-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTym/Yo5ckKFFKsvIeBULuz83/6+wmN7G1wBIkwWE4k=;
 b=Ko6qbhuibid0+i6sbuW3PEneOmZWKsO29c0M0m1gDYGPJwPXYgy5mkyR+ohdxlmSKwR/k8M7qOCof907LCkKAthU3capo737gPVbZ0sFCla9ZfnZGNiLQnXZlUos7Nrg2gQuxPjqslcq01vZbghfSoRfnYKOLc+GJByLdu8IyOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 569ed49f5d80670b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGnOur/jtEFs7N/csqCKlxaRO8ntsOdnWYVFJAgQyyYfdqDl0/NYBihczHUUOnrzDWnnC5NjNRCrxu6+e2quSjuaPAYtQbtbp0t+vXXw78tu6kYUt+W69bVNR2bgpBHCbYGDMkudBZeiSnZ5sqnUCJbikPllxbBXVA7/De88mRH1VaL6FRo2jA8YCeHrFDZEHwxfdP6hCYX+GZx5uJUDqdepbkWRXAhzVkWLSao/D/V2F6q7CNjonvAQMccFcEArvHj+LlyOesuOWUAOpakteh980Xh+QdSSEX6RAQmexvLYJ6nyC8TanOyPt+KgIqyvVxceaSr2j65CQfzJOA1F1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTym/Yo5ckKFFKsvIeBULuz83/6+wmN7G1wBIkwWE4k=;
 b=ZjU1aqsW5cNFNdU0FJ0ERuvAseJms5bcxZGj3K3E6V9Hk3TWb8rIaQOWPLmHtNqQG5GOffo1epj6CZz6z+0PiDGv1C7EptVSh3e0S3t6ws0I8TqJXs9Gtg+i1b2jJ6fjWrLTXmu+sNQcIt/OQpzLSWt7iMTjjLa/Yr8xUAk7/a5yeMgcEk0nHw0glGoeUVQ3b25JAU25+X/1G2cphxCYGU+p8JwUwj5o//mfCK2SEc0po/b+NNU/OAMFCpf5QWeiKadT7MtsHpCgut5DNzFpCXTk12YbB/wNlaO/rmyVbCNuVQxRAto+wsGWirwVDFdObpbqm8m23vSOP2OVeLlllg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTym/Yo5ckKFFKsvIeBULuz83/6+wmN7G1wBIkwWE4k=;
 b=Ko6qbhuibid0+i6sbuW3PEneOmZWKsO29c0M0m1gDYGPJwPXYgy5mkyR+ohdxlmSKwR/k8M7qOCof907LCkKAthU3capo737gPVbZ0sFCla9ZfnZGNiLQnXZlUos7Nrg2gQuxPjqslcq01vZbghfSoRfnYKOLc+GJByLdu8IyOs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Allow to set grant table related limits for
 dom0less domUs
Thread-Topic: [PATCH] xen/arm: Allow to set grant table related limits for
 dom0less domUs
Thread-Index: AQHZD74qZCDATUsvpUqdx+UqIsQp5q5tf6sA
Date: Wed, 14 Dec 2022 15:20:31 +0000
Message-ID: <BAA21EC8-02F5-45AF-A8CB-34EF922AC7D6@arm.com>
References: <20221214130833.543-1-michal.orzel@amd.com>
In-Reply-To: <20221214130833.543-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBAPR08MB5829:EE_|AM7EUR03FT028:EE_|AM8PR08MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: f16ea502-b2ed-4631-8205-08dadde6c6ae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kgCrP+9cWFyhw1/XXlhtjawJxWyVCzr07ikyq4UAs61Bm3V9xKsjkZuYXM3cUmrosjdCUQt2G59hAP3pRBinHmXcAYyXKfeF5pQEGCNb3KPy9RC6dRhL67LY4JWjP61jbeFGRSExMo74i2bmDPJPJ6GsvYYReGuzkQ2GmSo633x37p1+3BQTtvvdEjuc21VDzI/EzpfgOyk0FwKB+Y6AT/LnczOMAlb91qbzz764LieX+aMN6NSqeSZu7ENZ+4leA0Qy0j85QnI1Xw2VyV1wOxo79XJ6huwIQUeLA4QsCR/WlBwG5wN5PIaBMod+gUqyTD0XRcxbYwPnVQ35XHSSvvVWdzzEH7O4cKlnbov2c5ljEhttJZJSBtW4XxVQ+a7j2KykYRpbzx3CZCk2V9GTBDqw31LZd34x5uy9QF6p8MkoyVHH09YlbRGDJtwZDahhs91qxgoH9mgPMnXfAlpxeWA1UT6+KMmnSLwvgs7VqTpnE0DQeECXg9OTlWPR/U/EH7qh8u6axVn3Gb1v8MZnulHbIFb5zXLKuz0nQKp/9BOjaL1luUK9l8kdoeWsnuErkh+IncuzLbMSpLHv5wfXEOn1tkd1hhL+vc1rxL6h+07QtFJLptJwSbT2NfZtnJhGDOXrUbrKQuDIW+iIKBWLkhW5q0g7lntIvyOtT8VjGZ3mSK2/v4E0xpeoYV3ajp6bcuXLYAj2EH6/9vr8n2q0PHl9bg/H+afE6ESmmQtG7YlvLjlHcU3b0ZOQVUofRYCP
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(38070700005)(66556008)(71200400001)(64756008)(66446008)(66476007)(53546011)(8676002)(4326008)(2906002)(2616005)(6506007)(86362001)(41300700001)(316002)(6916009)(54906003)(5660300002)(83380400001)(6512007)(36756003)(26005)(8936002)(186003)(66946007)(122000001)(33656002)(478600001)(6486002)(76116006)(38100700002)(91956017)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C2BCF481B2151847AE2995A0572CEFB2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5829
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70bb622c-2ba6-49e8-70fd-08dadde6bd14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8pA7kueq4v3aI813D98UxjUGvYvbWLGEuvvTZ4ap6ZcGm4Pis0zAxjpI2fvhG6Zr0yVqpNhYWLZZEURPQPldy7nP60aInCIegJA6SKuAaV3qIRlmkkCh1yWAaJwEToRAZAcW4uYS3UPMK9/ikUPgWsj7mmwko50stjFe6zZIRrA46jm6GJ8cBbV1bFpy1g/eoG/I8ewqrVOEFLwzU5QMgrrLEF7sFchX7JGX+DQz84N6M6Df+ClZryEGQN+oLRqFJkzoSVoHVHfcJcuX0019aPoJbvWo4gQGYQ1FhcLNtDrpmSxqCVcTy/2ga54uD4zoxuhUeBMonL7+QsJYMAoAjt43aUP4xn3UwuhmVSwLcnUpu64mLv0OScEF8Om9N1Hs5E8xWI3iDKMEqDDcrJ267jcDeIbQ3RrbCWBPtNHcVB3Nk7FA7BFRjgfHXU4sKiOQd4x6tUzKv1HwbYryh8lmYWn2al/77YJ9kdMMHO6Yljia1IXWu7PAavyW0KxAfX1Qsf4tA65H3cmK/G33HSKrNs0gUuPLoLVwXPnJuMTLnUp/oDaCvMRrqMMw0piR3hUC+CGSLL+UT7DrjjIQcdvypDpOLQJRgd/wWClmuFa138WoW94MzKDQuudc3/QgM7TvQnUy93ykNHCnmF7S1YRjz7k4HttnqcVy4cFPnbZSkw7tiZD9DGGNTt8lTl02GD/9xCBlzqEU3tXZ+zAPAV/Wt32pPToRMFxNqGIYu8h2mw/UMG8gw7M9i31wcNcmmP1P8+db+/o5XDZs8Y6Qi61iVw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(2616005)(336012)(86362001)(40460700003)(316002)(478600001)(54906003)(36756003)(356005)(33656002)(40480700001)(82740400003)(6506007)(53546011)(47076005)(82310400005)(81166007)(26005)(6512007)(186003)(2906002)(107886003)(6486002)(8936002)(6862004)(36860700001)(41300700001)(70206006)(5660300002)(8676002)(4326008)(70586007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 15:20:47.1263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f16ea502-b2ed-4631-8205-08dadde6c6ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6451



> On 14 Dec 2022, at 13:08, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> At the moment, for dom0less domUs, we do not have a way to specify
> per domain grant table related limits (unlike when using xl), namely
> max version, max number of grant frames, max number of maptrack frames.
> This means that such domains always use the values specified by the Xen
> command line parameters or their default values if unspecified.
>=20
> In order to have more control over dom0less domUs, introduce the
> following device-tree properties that can be set under domUs nodes:
> - max_grant_version to set the maximum grant table version the domain
>   is allowed to use,
> - max_grant_frames to set the maximum number of grant frames the domain
>   is allowed to have,
> - max_maptrack_frames to set the maximum number of grant maptrack frames
>   the domain is allowed to have.
>=20
> Update documentation accordingly.
>=20
> Note that the sanity checks regarding the passed values are already
> there in grant_table_init() resulting in panic in case of errors,
> therefore no need to repeat them in create_domUs().
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

The patch looks good to me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


> ---
> docs/misc/arm/device-tree/booting.txt | 21 +++++++++++++++++++++
> xen/arch/arm/domain_build.c           | 11 ++++++++++-
> 2 files changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 87eaa3e25491..3879340b5e0a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -223,6 +223,27 @@ with the following properties:
>     the default size of domain P2M pool, i.e. 1MB per guest vCPU plus 4KB
>     per MB of guest RAM plus 512KB for guest extended regions.
>=20
> +- max_grant_version
> +
> +    Optional. A 32-bit integer specifying the maximum grant table versio=
n
> +    the domain is allowed to use (valid values are 1 or 2). If this prop=
erty
> +    is missing, the value specified by Xen command line parameter gnttab=
=3Dmax-ver
> +    (or its default value if unspecified, i.e. 1) is used.
> +
> +- max_grant_frames
> +
> +    Optional. A 32-bit integer specifying the maximum number of grant fr=
ames
> +    the domain is allowed to have. If this property is missing, the valu=
e
> +    specified by Xen command line parameter gnttab_max_frames (or its de=
fault
> +    value if unspecified, i.e. 64) is used.
> +
> +- max_maptrack_frames
> +
> +    Optional. A 32-bit integer specifying the maximum number of grant ma=
ptrack
> +    frames the domain is allowed to have. If this property is missing, t=
he
> +    value specified by Xen command line parameter gnttab_max_maptrack_fr=
ames
> +    (or its default value if unspecified, i.e. 1024) is used.
> +
> Under the "xen,domain" compatible node, one or more sub-nodes are present
> for the DomU kernel and ramdisk.
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index bef5e905a73c..29b2f3e1faa2 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3871,7 +3871,7 @@ void __init create_domUs(void)
>             .max_maptrack_frames =3D -1,
>             .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versi=
on),
>         };
> -        unsigned int flags =3D 0U;
> +        unsigned int flags =3D 0U, val;
>=20
>         if ( !dt_device_is_compatible(node, "xen,domain") )
>             continue;
> @@ -3940,6 +3940,15 @@ void __init create_domUs(void)
>             d_cfg.cpupool_id =3D pool_id;
>         }
>=20
> +        if ( dt_property_read_u32(node, "max_grant_version", &val) )
> +            d_cfg.grant_opts =3D XEN_DOMCTL_GRANT_version(val);
> +
> +        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
> +            d_cfg.max_grant_frames =3D val;
> +
> +        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
> +            d_cfg.max_maptrack_frames =3D val;
> +
>         /*
>          * The variable max_init_domid is initialized with zero, so here =
it's
>          * very important to use the pre-increment operator to call
> --=20
> 2.25.1
>=20
>=20


