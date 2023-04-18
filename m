Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9BB6E6453
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522820.812426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokkf-00010g-0g; Tue, 18 Apr 2023 12:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522820.812426; Tue, 18 Apr 2023 12:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokke-0000yy-TI; Tue, 18 Apr 2023 12:48:04 +0000
Received: by outflank-mailman (input) for mailman id 522820;
 Tue, 18 Apr 2023 12:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pokkd-0000ys-R4
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:48:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41b49239-dde7-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 14:48:03 +0200 (CEST)
Received: from DB9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:10:1db::15)
 by AS8PR08MB7744.eurprd08.prod.outlook.com (2603:10a6:20b:508::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:47:55 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::44) by DB9PR06CA0010.outlook.office365.com
 (2603:10a6:10:1db::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 12:47:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 12:47:55 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Tue, 18 Apr 2023 12:47:55 +0000
Received: from b6a0658ec7c5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 472F295A-AFBE-408D-B33F-63627DE530B6.1; 
 Tue, 18 Apr 2023 12:47:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6a0658ec7c5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 12:47:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9578.eurprd08.prod.outlook.com (2603:10a6:102:310::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:47:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 12:47:36 +0000
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
X-Inumbo-ID: 41b49239-dde7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9ZKDk0iLgLKg/KqLgosILTuSTfBe1xK7PMUC6wjftA=;
 b=AyiQIStFaaBOQI4DQ+Qk39Jze1AK6gxb96biVZxzxSZyOtGFW1aj8tSfgkc6sxlDzQgWXX9c85sU79/wVrEUmWWW1dMplPpxryqmftyZ5iI7pnYXnyN+aNRR5ATarWrHFTeUrfX3w4JDmqNaUP4Hv7e4lU39Jjs9/myaH/WNbJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a802e5ffdf604c77
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnO58N0vtztA9ksh2OaaEFRjk+nrkkZOg5/vahdGyZeuuo5wHZC4bI/vlTsuvMxqCzdZ3WlQ5aVzIwynTkJO6Cpt5exfSAQ0d4O3f5L8PNBbCPkw0q3K+NBNdkN4j7YR46jmIhvN0c4SwYXj2JlU5HdsRJv51gi4CMy/tezZUmR2JTZdzr4+d4g0HlPhxVJ0aHAcDqVum2XshK69P06U+ly+PfUJZLMwEVIMEsrgNpfRJCSKNkC3XpIsjy3AUM5micy8JBUi69x6egQ5/zkJGzKBCgOmF/11+JdAYm5NX9sTZa/eHbgR5fh3IVpcm16PCepvpSCrud/BgbOQ5Devkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9ZKDk0iLgLKg/KqLgosILTuSTfBe1xK7PMUC6wjftA=;
 b=hd/U3dfE1LasOEQIIQ0NfohOLPMMGdVPDPcCP6h+LA3ZazHNYw6WufXNYSjjAR11MwzyPpxC35+cUaim4LcpnDt9kDpzpwWGkqOnkAcaAEbnPa3QdlZEO/NzFXNXKTzgIu2bAszf7Ue/o0OrnlPvvNAXL15kqDm4eNt0s8vlHSM9n+djadWKAbZY0FX8L3C55/Mnyc1jQm8lA24BQd+iQMvHIu/ast1s3Pz1fvtetprA/UWNWp7kJTQYf4w04S1N5ecsSUgMjEgBN7YA3q5UcYkBRT2XnwwXx2YKppXBMgn1nEuaMTs12ESiF43sqwf1TEk2QbSktFzAy6F+If5SEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9ZKDk0iLgLKg/KqLgosILTuSTfBe1xK7PMUC6wjftA=;
 b=AyiQIStFaaBOQI4DQ+Qk39Jze1AK6gxb96biVZxzxSZyOtGFW1aj8tSfgkc6sxlDzQgWXX9c85sU79/wVrEUmWWW1dMplPpxryqmftyZ5iI7pnYXnyN+aNRR5ATarWrHFTeUrfX3w4JDmqNaUP4Hv7e4lU39Jjs9/myaH/WNbJs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZbSQxHdlbNP/OhU+SnBXlOek6la8xDZGA
Date: Tue, 18 Apr 2023 12:47:35 +0000
Message-ID: <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-8-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAVPR08MB9578:EE_|DBAEUR03FT028:EE_|AS8PR08MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 81829f7c-e8b6-48a1-8d98-08db400b215d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IWAvAOtTOmSOUgWFJ4I7/6E8UhNEy5xP8tkOeFuWlG46fF2FSOYzpFSBZMh5sDtjgziHzL+fzGtTRy8nQdEf0pdnEj51Om1GO57IYC8eT6zTvW5YRyi8Ke+NfCjfoBJktwBO3Tdkg5MyOt4Fja7NDEEm4xDuYfO390azFtqfI/wkGqFAyF9/3OIoBlBKsxFbI2JtBY+1vPdbeDSttZzyD3UdfPE+8AfbImVT8eGpARiHoIh//E1in0C5ynXa3t6Qdy53h82AeHTie3OQUBaNv92f8bRgrPVdfcxnB4bYQk9qdO6g+5sBYSKN6CMwPHJTPavk65NZefJdnTNf9ysoyt4TWDQNLM5x/61yXYwP76J/NIJtZAso5vNuBG0Zc7/JoHj0BpXxeRmSEH6AN7nYjT0PjzjiccW9swXQWgBRXcc7qSNtzzhEw/0Fk5VkbLwYYHU5C3X4XfKQvWxSUrEnMQVOMK10OA8IvR3o1c5N8E9QtCev3A9c/69irAha3jTNqnq0xQhNRSlikwjzIh1w4S3ya5m3IHgnxM+qL1FG3ysTaB7m6RwVZzNgnf+9mF0GQpcjNiSNPfn9GtbTcGWxHloUXD1SiF8BTPCCpqhNGS1L2lF3dGYlH2Hv7LhmzDChur2dxyBr9/5vCgQkQixSBw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(37006003)(478600001)(71200400001)(38100700002)(8936002)(6862004)(8676002)(316002)(41300700001)(91956017)(4326008)(6636002)(76116006)(66446008)(66556008)(66946007)(54906003)(122000001)(66476007)(186003)(2906002)(53546011)(38070700005)(6512007)(64756008)(6506007)(86362001)(83380400001)(36756003)(33656002)(2616005)(5660300002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DBEBA3C24B097545A6F96461A8C96E97@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9578
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5db6804d-0d61-43dd-0dea-08db400b15ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FBIEPV7LNrH6g/NTSRciCZc7VHd+psGWpw+IZ5rPuIl93oKvjUb8hk2OziAU2MmXDxnX7lrlYId1QmdgCMlaN63QRaQO+4Jk20ztf+fM4l1n+ZZ4kY6oigtiAC6apaq8jb+pmjYsh0eCcPvhW6JhooAQUhiVREdMPcwY7AqgMO34va5dGSb8C4JHoXZ1wPKMAlvO3bgTQaFUtt5/02y10NfU7DFPCAoMi5lV+dIkPtIW0WwU9bwMGyp6VP9mHFc2rgSaT6w7Q14/mq7SViT9L7cG0tN0UZR2gqlTrv476IyzJcNyJ3RGVXtZKTn+OmDoHkb5EU4WjX8luehBOnfBwML4+C6XyaeopkS/KgHrvuW1KBrZBWBrZqJeQzbDP66hc8rOSAapgAVVoYnHqhUeiuV3mEsnKMdZIc+3qjWFFPcH/q+PaGEd3MgYTqTin0nGtutgI73gQ1+3aN+WlDEG6D2r7oqQeuKWJVSyshp2KlYd2jd7ka6Dsl2jZbHtbm/m37LOpnJpsJX6cwHIjnfAh8HN+67FAtF5nXbO4EK9T1dtt7SuL89622Deu6181WWypOmpAKAfchjNQnkPUS/mtCv2WkmZ9QrD196cATi3wXsoDdr1Bdzy8kGrovr2FkrXIc9P769urmQelvZmV34HkDh/SyOhHvoA+UK5HT/qy68xBtyb/rY0bAUvIJCxVn9k5XWLz2nwd5UyE/ojIV/rzQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(6506007)(336012)(83380400001)(6512007)(26005)(36756003)(86362001)(47076005)(82310400005)(186003)(356005)(40460700003)(2906002)(53546011)(107886003)(33656002)(2616005)(5660300002)(36860700001)(6486002)(8676002)(6862004)(8936002)(478600001)(81166007)(54906003)(37006003)(41300700001)(82740400003)(316002)(70586007)(40480700001)(70206006)(4326008)(6636002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 12:47:55.1654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81829f7c-e8b6-48a1-8d98-08db400b215d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7744

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Add a command line parameter to allow Dom0 the use of SVE resources,
> the command line parameter sve=3D<integer>, sub argument of dom0=3D,
> controls the feature on this domain and sets the maximum SVE vector
> length for Dom0.
>=20
> Add a new function, parse_signed_integer(), to parse an integer
> command line argument.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v4:
> - Negative values as user param means max supported HW VL (Jan)
> - update documentation, make use of no_config_param(), rename
>   parse_integer into parse_signed_integer and take long long *,
>   also put a comment on the -2 return condition, update
>   declaration comment to reflect the modifications (Jan)
> Changes from v3:
> - Don't use fixed len types when not needed (Jan)
> - renamed domainconfig_encode_vl to sve_encode_vl
> - Use a sub argument of dom0=3D to enable the feature (Jan)
> - Add parse_integer() function
> Changes from v2:
> - xen_domctl_createdomain field has changed into sve_vl and its
>   value now is the VL / 128, create an helper function for that.
> Changes from v1:
> - No changes
> Changes from RFC:
> - Changed docs to explain that the domain won't be created if the
>   requested vector length is above the supported one from the
>   platform.
> ---
> docs/misc/xen-command-line.pandoc    | 18 ++++++++++++++++--
> xen/arch/arm/arm64/sve.c             | 21 +++++++++++++++++++++
> xen/arch/arm/domain_build.c          | 27 +++++++++++++++++++++++++++
> xen/arch/arm/include/asm/arm64/sve.h | 15 +++++++++++++++
> xen/common/kernel.c                  | 25 +++++++++++++++++++++++++
> xen/include/xen/lib.h                | 10 ++++++++++
> 6 files changed, 114 insertions(+), 2 deletions(-)
>=20
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index e0b89b7d3319..9c0790ce6c7c 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -777,9 +777,9 @@ Specify the bit width of the DMA heap.
>=20
> ### dom0
>     =3D List of [ pv | pvh, shadow=3D<bool>, verbose=3D<bool>,
> -                cpuid-faulting=3D<bool>, msr-relaxed=3D<bool> ]
> +                cpuid-faulting=3D<bool>, msr-relaxed=3D<bool> ] (x86)
>=20
> -    Applicability: x86
> +    =3D List of [ sve=3D<integer> ] (Arm)
>=20
> Controls for how dom0 is constructed on x86 systems.
>=20
> @@ -838,6 +838,20 @@ Controls for how dom0 is constructed on x86 systems.
>=20
>     If using this option is necessary to fix an issue, please report a bu=
g.
>=20
> +Enables features on dom0 on Arm systems.
> +
> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain an=
d sets
> +    the maximum SVE vector length.
> +    A value equal to 0 disables the feature, this is the default value.
> +    Values below 0 means the feature uses the maximum SVE vector length
> +    supported by hardware, please be aware that if the hardware doesn't =
supports
> +    SVE, the feature remains disabled.
> +    Values above 0 explicitly set the maximum SVE vector length for Dom0=
,
> +    allowed values are from 128 to maximum 2048, being multiple of 128.
> +    Please note that when the user explicitly specify the value, if that=
 value
> +    is above the hardware supported maximum SVE vector length, the domai=
n
> +    creation will fail and the system will stop.
> +
> ### dom0-cpuid
>     =3D List of comma separated booleans
>=20
> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
> index 5485648850a0..ad5db62e1805 100644
> --- a/xen/arch/arm/arm64/sve.c
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -9,6 +9,9 @@
> #include <xen/sizes.h>
> #include <asm/arm64/sve.h>
>=20
> +/* opt_dom0_sve: allow Dom0 to use SVE and set maximum vector length. */
> +int __initdata opt_dom0_sve;
> +
> extern unsigned int sve_get_hw_vl(void);
> extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ffr=
);
> extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
> @@ -118,3 +121,21 @@ void sve_restore_state(struct vcpu *v)
>=20
>     sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
> }
> +
> +int __init sve_sanitize_vl_param(int val, unsigned int *out)
> +{
> +    /*
> +     * Negative SVE parameter value means to use the maximum supported
> +     * vector length, otherwise if a positive value is provided, check i=
f the
> +     * vector length is a multiple of 128 and not bigger than the maximu=
m value
> +     * 2048
> +     */
> +    if ( val < 0 )
> +        *out =3D get_sys_vl_len();
> +    else if ( ((val % SVE_VL_MULTIPLE_VAL) =3D=3D 0) && (val <=3D SVE_VL=
_MAX_BITS) )
> +        *out =3D val;

Shouldn't you also check if it is not greater than the maximum vector lengt=
h ?

> +    else
> +        return -1;
> +
> +    return 0;
> +}
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index eeb4662f0eee..3f30ef5c37b6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -26,6 +26,7 @@
> #include <asm/platform.h>
> #include <asm/psci.h>
> #include <asm/setup.h>
> +#include <asm/arm64/sve.h>
> #include <asm/cpufeature.h>
> #include <asm/domain_build.h>
> #include <xen/event.h>
> @@ -61,6 +62,21 @@ custom_param("dom0_mem", parse_dom0_mem);
>=20
> int __init parse_arch_dom0_param(const char *s, const char *e)
> {
> +    long long val;
> +
> +    if ( !parse_signed_integer("sve", s, e, &val) )
> +    {
> +#ifdef CONFIG_ARM64_SVE
> +        if ( (val >=3D INT_MIN) && (val <=3D INT_MAX) )
> +            opt_dom0_sve =3D val;
> +        else
> +            printk(XENLOG_INFO "'sve=3D%lld' value out of range!\n", val=
);
> +#else
> +        no_config_param("ARM64_SVE", "sve", s, e);
> +#endif

Correct me if my understanding is wrong but here you just ignore the sve
parameter if SVE is not supported by Xen ?

I am a bit wondering if we should not just refuse it here as the user might
wrongly think that his parameter had some effect.

Or is it a usual way to handle this case ?

> +        return 0;
> +    }
> +
>     return -EINVAL;
> }
>=20
> @@ -4109,6 +4125,17 @@ void __init create_dom0(void)
>     if ( iommu_enabled )
>         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>=20
> +    if ( opt_dom0_sve )
> +    {
> +        unsigned int vl;
> +
> +        if ( !sve_sanitize_vl_param(opt_dom0_sve, &vl) )
> +            dom0_cfg.arch.sve_vl =3D sve_encode_vl(vl);
> +        else
> +            printk(XENLOG_WARNING
> +                   "SVE vector length error, disable feature for Dom0\n"=
);
> +    }
> +
>     dom0 =3D domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
>     if ( IS_ERR(dom0) )
>         panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
> diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/=
asm/arm64/sve.h
> index fc162c9d2cf7..f1801876b5de 100644
> --- a/xen/arch/arm/include/asm/arm64/sve.h
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -19,8 +19,15 @@ static inline unsigned int sve_decode_vl(unsigned int =
sve_vl)
>     return sve_vl * SVE_VL_MULTIPLE_VAL;
> }
>=20
> +static inline unsigned int sve_encode_vl(unsigned int sve_vl_bits)
> +{
> +    return sve_vl_bits / SVE_VL_MULTIPLE_VAL;
> +}
> +
> #ifdef CONFIG_ARM64_SVE
>=20
> +extern int opt_dom0_sve;
> +
> register_t compute_max_zcr(void);
> register_t vl_to_zcr(unsigned int vl);
> unsigned int get_sys_vl_len(void);
> @@ -28,9 +35,12 @@ int sve_context_init(struct vcpu *v);
> void sve_context_free(struct vcpu *v);
> void sve_save_state(struct vcpu *v);
> void sve_restore_state(struct vcpu *v);
> +int sve_sanitize_vl_param(int val, unsigned int *out);
>=20
> #else /* !CONFIG_ARM64_SVE */
>=20
> +#define opt_dom0_sve (0)
> +
> static inline register_t compute_max_zcr(void)
> {
>     return 0;
> @@ -55,6 +65,11 @@ static inline void sve_context_free(struct vcpu *v) {}
> static inline void sve_save_state(struct vcpu *v) {}
> static inline void sve_restore_state(struct vcpu *v) {}
>=20
> +static inline int sve_sanitize_vl_param(int val, unsigned int *out)
> +{
> +    return -1;
> +}
> +
> #endif /* CONFIG_ARM64_SVE */
>=20
> #endif /* _ARM_ARM64_SVE_H */
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index f7b1f65f373c..29d05282c8bb 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -314,6 +314,31 @@ int parse_boolean(const char *name, const char *s, c=
onst char *e)
>     return -1;
> }
>=20
> +int __init parse_signed_integer(const char *name, const char *s, const c=
har *e,
> +                                long long *val)
> +{
> +    size_t slen, nlen;
> +    const char *str;
> +    long long pval;
> +
> +    slen =3D e ? ({ ASSERT(e >=3D s); e - s; }) : strlen(s);
> +    nlen =3D strlen(name);
> +
> +    /* Does s start with name or contains only the name? */
> +    if ( (slen <=3D nlen) || strncmp(s, name, nlen) || (s[nlen] !=3D '=
=3D') )
> +        return -1;
> +
> +    pval =3D simple_strtoll(&s[nlen + 1], &str, 0);
> +
> +    /* Number not recognised */
> +    if ( str !=3D e )
> +        return -2;
> +
> +    *val =3D pval;
> +
> +    return 0;
> +}
> +
> int cmdline_strcmp(const char *frag, const char *name)
> {
>     for ( ; ; frag++, name++ )
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index e914ccade095..5343ee7a944a 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -94,6 +94,16 @@ int parse_bool(const char *s, const char *e);
>  */
> int parse_boolean(const char *name, const char *s, const char *e);
>=20
> +/**
> + * Given a specific name, parses a string of the form:
> + *   $NAME=3D<integer number>
> + * returning 0 and a value in val, for a recognised integer.
> + * Returns -1 for name not found, general errors, or -2 if name is found=
 but
> + * not recognised number.
> + */
> +int parse_signed_integer(const char *name, const char *s, const char *e,
> +                         long long *val);
> +
> /**
>  * Very similar to strcmp(), but will declare a match if the NUL in 'name=
'
>  * lines up with comma, colon, semicolon or equals in 'frag'.  Designed f=
or
> --=20
> 2.34.1
>=20

Cheers
Bertrand



