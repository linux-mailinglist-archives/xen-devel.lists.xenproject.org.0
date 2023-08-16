Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661777DDC7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584271.914784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDAg-0004yh-JZ; Wed, 16 Aug 2023 09:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584271.914784; Wed, 16 Aug 2023 09:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDAg-0004vI-GV; Wed, 16 Aug 2023 09:50:34 +0000
Received: by outflank-mailman (input) for mailman id 584271;
 Wed, 16 Aug 2023 09:50:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qWDAf-0004v6-HU
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:50:33 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe16::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 564739d7-3c1a-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 11:50:31 +0200 (CEST)
Received: from AM7PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:20b:100::35)
 by DB9PR08MB7398.eurprd08.prod.outlook.com (2603:10a6:10:372::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:50:23 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::7b) by AM7PR02CA0025.outlook.office365.com
 (2603:10a6:20b:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.15 via Frontend
 Transport; Wed, 16 Aug 2023 09:50:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 09:50:22 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Wed, 16 Aug 2023 09:50:22 +0000
Received: from 72afadd706bd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 857EC7A1-6BEC-4395-9E40-FCE9E46BF5AE.1; 
 Wed, 16 Aug 2023 09:50:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72afadd706bd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Aug 2023 09:50:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB5976.eurprd08.prod.outlook.com (2603:10a6:20b:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 09:50:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:50:13 +0000
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
X-Inumbo-ID: 564739d7-3c1a-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQny8tB5PIGhne1t/0CgKYj0/KVXcFOW/28/fDS5u/M=;
 b=rTwJvDvuFVqipvuHCk2zadFDKj1g12lH9lnrzoO7BO2gieprIsKu8QIu7aTG6CpLzsoN0Wu+5ngPlWY97yQR1VBMV53lbkQwkiG0tAarCgovixPLKMfXYsoqIl31r81A3SIU9QZJqw+8GJGLW+TjQ137ub0vfeW1oY4nvgPHfZ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6f9f2d06e8a56c0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3xXEUhSgq9nriyXVbh7zWWDVzNG+Eh7Ul02IKC667ma9Aa+xw6P2uoODE0u0Cz2ZLgVwIsijKhOC3k5HOyb+oB5qmXB37rBPk6StX1hz3kLQJblMaQALKXdVw5PeUC36MRX+D04XjS6mtrAjjnpZ9EcOE27QUwiSDJbsthkilvz9uRPA7b+koFd6HA+cqHabAgUCkrFts78AITVrkwpHdCmZ0ArH24eVJdxy0fscDTKQ5qtPnhAhJYhpVNb1rUyJOZDeUfH6CXZqTk0I22YWqlx2jdsnqDxXycaQYygeGZ1P69imvWxtuN+SGMoO1cYoc9wJAasSRY34dbHLcLSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQny8tB5PIGhne1t/0CgKYj0/KVXcFOW/28/fDS5u/M=;
 b=QX7v7KF4ar76DRrHwA73v4z4/9sCUOWJbYyb/Ua7l/B6etRyJHm4OwcnMehtnSkh1BZeHbf09jGpDkQhWqt8bQAlX5qHrc5gNmA1xshQ3Bdehe3tFt28RRPgPG4TXVXuoW+prGbhZIBUIKuFb9A4gcKFzIwddSlkgfE8GeRbUfSVg8w0fq6fAaQhPXwq/VuYr+3IFhgcZZkvoanv2psWcjpRbzgZ57czwRrrTpO/DLrJo4ax8FZqA/P11KIxeU2qJkgB68LhQjx4dQ+HbFIoOKf7Ybzj5hphF5q7Gn2QfHyWLj2eQ/StNZKrd6uu9Hl23vC7Jijrgi571jpkxdYUNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQny8tB5PIGhne1t/0CgKYj0/KVXcFOW/28/fDS5u/M=;
 b=rTwJvDvuFVqipvuHCk2zadFDKj1g12lH9lnrzoO7BO2gieprIsKu8QIu7aTG6CpLzsoN0Wu+5ngPlWY97yQR1VBMV53lbkQwkiG0tAarCgovixPLKMfXYsoqIl31r81A3SIU9QZJqw+8GJGLW+TjQ137ub0vfeW1oY4nvgPHfZ4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH v11 14/14] docs: add Arm FF-A mediator
Thread-Topic: [XEN PATCH v11 14/14] docs: add Arm FF-A mediator
Thread-Index: AQHZw6jHuO4c5RkQA0KRnx2SIvUV5q/sxr2A
Date: Wed, 16 Aug 2023 09:50:13 +0000
Message-ID: <1BF4C467-B053-4CA6-8988-119A0D9DFE82@arm.com>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-15-jens.wiklander@linaro.org>
In-Reply-To: <20230731121536.934239-15-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB5976:EE_|AM7EUR03FT064:EE_|DB9PR08MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: 082009e3-ef62-4479-5cdf-08db9e3e3585
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OGjjRMXidc+mRZqfcrrVK4RbNrmnoCdMqlofmRVOmQV7WNJvRkXciiyKhy7IPS0Fl/Y4dRCGasxK0NUdtjEHdjgvOBVTZGJIycXVwrUC9YspDdXPIFdsIIF77B6EA6Gr2RaGHvOgfsXePGpxYuzkwu3xl16XSDhQBEC3Vmr1JhguJF74GHOJKC9AzoQ05TQXP9yhvyjtnjvoNEBaH+GN0tr+TsMw/i6wbkDoUm6+RkCqeA+86wvXbAqbjhQJVdfyC6QQFuJ3tSuaOLrRAGCNK/Dr+f1U2vNTuRTvtE5XXuoM0E2+2sXosnonIAOZuLehoxOJ8Vc0oQm9Fok9b3/z2aJ7GGvVrQOVRxZVrUfEUdf7Jxb99QCPAhxXZn8VCxr4IOM8AB9kiZ+q6dY0XpSyfnomXcALnHJmu2c+YeotyInyLdSnlE6/MmUfugWDMJgp3l2uH0x0xX6sRRCghIOjgj06ER15uFqglA/miSgYWC5KBON8bReVZ/K2Hlcs+VoGCX81N9lx0BQJ6D/KdzuXpbI8hJm5giYsq12WSln1lNdJaEO5wwopgsC1wrU1CYKF9qVGDv0FGOumVhzZNleKw7xvZmCQ6i4g1stChx+zlJkcr85yNehnqkYBWHa99w6dNLTK5tXVsHrf4BaODENQcLD5vYId8zR3E/EXgZsE+AzqM4pnZ99ed4ezGdQH5Se7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(71200400001)(64756008)(54906003)(66446008)(76116006)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(4001150100001)(966005)(91956017)(6916009)(7416002)(5660300002)(2616005)(83380400001)(41300700001)(316002)(53546011)(8936002)(4326008)(8676002)(122000001)(38100700002)(38070700005)(33656002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA7D0353AA00F747B43AD7A2AA4A7BEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5976
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	761710ad-9246-4f2f-8dac-08db9e3e3046
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0+i/7WjJ+GKsPLZ3fWB4Y2Iu72l83SsorGnYIO0SLWnwcPTEUFA5GuzPkyFeta7NBZ/KA6wiPNhj5srHKj06qNRaRkzf/bYlVZrq12WKAy2ffNWFpVPvC9FSU2l/wEi1OCI4L5MrSJwLpWjnI6gVUsx3zI5JuDBFNc1/WCtQ5IqVXNUwrYGd4ueKnrppNXygV0ketPKoWXgRmPcT0DYgIn3WxBsYAwEGtkEpNYiOM1JID8EOaui3zN34MXc32K3qGKE7rcqK6QKT6Zu/9Uc8+SV1Yo+r6aCtSVICTqTlS1GZ1VrH8hZKHr2xiqTX3NXqaIot9GwXOlgqzHWgxMjBBiMqpfBBwkujbqdjPuiun3H0B2bcL8786+sJtqhduirkfeHBBBCaTIEuWa82/GjeDd25VeOD7Pkw+MubCO7OnfCkTa1g31ZhxlgyqoVe4XMC/UmYScjsSdXPrhecS1KQ28wOC56CwVpj7aq+8f77IKNAOVCGKVTdE9/p3VLtlU6PMWmFcpjuH8Pje55+AA4XdSyy4N6BlM2io/Tu8xHYgMz1v5uZxh4CakHtsQJoPCgsIiBhoi/LmnhCPpdzECZxOVV/ywiXuFOzo8Gfyus46uIdC0LN85lmbSa5NvgWVWqvPxwR/DxdiHedr0jLxb+bbMEn7hwQIzq7RfDI6KYAnWvxAfwRR9Ix4iWsGfrRGzk4WodBgyt/Ne5oSc5el064A6aMklMltc7uWfrM0TALRU1B1jv1lH3oTc5lTmlkTZvALeDU9QHfvPx21Qj+JtpHlg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(1800799009)(451199024)(186009)(82310400011)(46966006)(36840700001)(40470700004)(54906003)(316002)(356005)(82740400003)(81166007)(70586007)(70206006)(966005)(36860700001)(41300700001)(5660300002)(47076005)(8936002)(6862004)(4326008)(8676002)(2906002)(40460700003)(83380400001)(26005)(40480700001)(478600001)(336012)(4001150100001)(86362001)(6512007)(53546011)(107886003)(33656002)(6506007)(36756003)(6486002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:50:22.5681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 082009e3-ef62-4479-5cdf-08db9e3e3585
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7398

Hi Jens,

> On 31 Jul 2023, at 14:15, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
>=20
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v10->v11
> - Add a CHANGELOG.md entry as requested
> ---
> CHANGELOG.md             |  3 ++-
> SUPPORT.md               |  9 +++++++++
> docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
> 3 files changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 7d7e0590f8c6..f24c8c4b8011 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -24,7 +24,8 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>  - xl/libxl can customize SMBIOS strings for HVM guests.
>  - Add support for AVX512-FP16 on x86.
>  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Previ=
ew)
> -
> + - On Arm, add suport for Firmware Framework for Arm A-profile (FF-A) Me=
diator
> +   (Tech Preview)
>=20
> ## [4.17.0](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3D=
RELEASE-4.17.0) - 2022-12-12
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 35a6249e03b2..fe512762cee7 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -840,6 +840,15 @@ that covers the DMA of the device to be passed throu=
gh.
>=20
> No support for QEMU backends in a 16K or 64K domain.
>=20
> +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> +
> +    Status, Arm64: Tech Preview
> +
> +There are still some code paths where a vCPU may hog a pCPU longer than
> +necessary. The FF-A mediator is not yet implemented for Arm32. Part of t=
he
> +FF-A specification is not supported, see the top comment in
> +xen/arch/arm/tee/ffa.c for limitations.
> +
> ### ARM: Guest Device Tree support
>=20
>     Status: Supported
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index a2bccd5b48a1..ec4864958e0e 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1656,6 +1656,21 @@ in OP-TEE.
>=20
> This feature is a B<technology preview>.
>=20
> +=3Ditem B<ffa>
> +
> +B<Arm only.> Allow a guest to communicate via FF-A with Secure Partition=
s
> +(SP), default false.
> +
> +Currently only a small subset of the FF-A specification is supported. Ju=
st
> +enough to communicate with OP-TEE. In general only direct messaging and
> +sharing memory with one SP. More advanced use cases where memory might b=
e
> +shared or donated to multiple SPs are not supported.
> +
> +See L<https://developer.arm.com/documentation/den0077/latest> for more
> +information about FF-A.
> +
> +This feature is a B<technology preview>.
> +
> =3Dback
>=20
> =3Dback
> --=20
> 2.34.1
>=20


