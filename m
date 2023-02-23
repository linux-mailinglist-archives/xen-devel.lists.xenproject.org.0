Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2B6A0C9B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 16:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500517.771958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDEf-0002z8-LY; Thu, 23 Feb 2023 15:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500517.771958; Thu, 23 Feb 2023 15:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDEf-0002vk-GG; Thu, 23 Feb 2023 15:10:17 +0000
Received: by outflank-mailman (input) for mailman id 500517;
 Thu, 23 Feb 2023 15:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVDEe-0001aL-06
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 15:10:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d71a575-b38c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 16:10:15 +0100 (CET)
Received: from AM5PR0502CA0002.eurprd05.prod.outlook.com
 (2603:10a6:203:91::12) by PAVPR08MB9435.eurprd08.prod.outlook.com
 (2603:10a6:102:317::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.18; Thu, 23 Feb
 2023 15:10:08 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::a1) by AM5PR0502CA0002.outlook.office365.com
 (2603:10a6:203:91::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Thu, 23 Feb 2023 15:10:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 15:10:07 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Thu, 23 Feb 2023 15:10:07 +0000
Received: from 3820d3ed9b3c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B41C2CA-ADD0-4307-B6F1-52443CB32B9F.1; 
 Thu, 23 Feb 2023 15:09:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3820d3ed9b3c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 15:09:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR3PR08MB5737.eurprd08.prod.outlook.com (2603:10a6:102:8d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 15:09:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 15:09:55 +0000
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
X-Inumbo-ID: 2d71a575-b38c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlO7i8VlVryjmZjReemmQMfDhp3f7ROqvQPGx0SODxI=;
 b=mq6xyK26R7c/oqrEF7iCmXPkgvuEB+Fivhu311+oqIy39SG7a0Z/fckix6MttJAmIRBS1qcTGz1P9/mse0dwfgBx01wwdbr7Y9/fuSRS6m/6PCuUyldJxdPb29f7tYoJg1U8CHcQN5R5528iRvS31at9Z5Z1LPzbviKCUlOqxig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2bb1a882c070d638
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH7yGn97Q+GSDqbSnRZ4KtY/4MmI6iBbOWQcvO5zuzEWI9djeaikKrzT4I7Gk/CK1za1hugGDGfpKd/cqEVmFEAEOosJi1hAM4hiBE2ar8kmpqcOhCrISX9l+PATqMPeZ0IKWJXQRFLXNhaV/sfz+P9PkUmXS1/W2eZh2OcBS//IauZRsoaRChNIP/rXmQqPF7CKXM2hUDcQ/mCBAGAWRPQuRpaD2310rRT/6vGWF9jVSMzli2KB3GqkXtn56MwnqXgdPTAA+h3Pjd0pWayhq6h2ZL2EB7qsybNSRuBVzZWmZSUmUv8IUvUdXgdtmd5TgVZWMeh1jVUHa9/f/THxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlO7i8VlVryjmZjReemmQMfDhp3f7ROqvQPGx0SODxI=;
 b=LWxZSQSlpsFZWxjuEFJzbtnehPO8J+9nlCixgHlt0atEb37ud5/0a+G5NaxCN5QSBG1J4FPbH+6jnlbNRWXq++RlHhB01780v54IWGWs6rWXZ9Qv1MnmqDvjDWe1b9foF1xBzLem5QMPHiRk2Kf4Lab0Ol2g5o1o4aMmdKcTZoG7E4O1C1dfOO3BRwxViLTqxrWQs/lOKoErCxlABoKeuZyJXcidp9SXRnMiJS4eFl0dNjR8zoO9qC2h5/a3VOBfvuuYQ2rqAvnAZTSekQfpm+m7gHBdByZPwcN5HpYylYyQWXUYHqnQTFwB9QGnaJAiDJbcfb1QiuOGGPCXixPxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlO7i8VlVryjmZjReemmQMfDhp3f7ROqvQPGx0SODxI=;
 b=mq6xyK26R7c/oqrEF7iCmXPkgvuEB+Fivhu311+oqIy39SG7a0Z/fckix6MttJAmIRBS1qcTGz1P9/mse0dwfgBx01wwdbr7Y9/fuSRS6m/6PCuUyldJxdPb29f7tYoJg1U8CHcQN5R5528iRvS31at9Z5Z1LPzbviKCUlOqxig=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [XEN PATCH v7 04/20] docs: add Arm FF-A mediator
Thread-Topic: [XEN PATCH v7 04/20] docs: add Arm FF-A mediator
Thread-Index: AQHZRtMXs2QN+8f9H0SMTeKqt1y0sK7cpBGA
Date: Thu, 23 Feb 2023 15:09:54 +0000
Message-ID: <A87AAA80-9167-4DE5-91FD-BC00068AE83C@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <5c588d92cdf23a7355a79bf4b91c7214e5ced197.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <5c588d92cdf23a7355a79bf4b91c7214e5ced197.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PR3PR08MB5737:EE_|AM7EUR03FT009:EE_|PAVPR08MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5f514d-f9c4-4476-10cd-08db15b00ced
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dpPloAJvOLKtpX02neKmASTbPBH8eW/YbeqJTiMd6Z+u07UnnT+9FsYvwAGXg6pal6EJqMyaZ7HnQy1p7/NqKL/y8reKuRufPDm3dKclAfVPEZRqc7sd/8UqmqFsfy6EjJQWiLRsY3oytcbxEipcKwXrBOKSNy/uoKoq16Bg1LgWV8QaaGZoWK18GLMzNWJJKXmj4Nzfsday37TRC3evgRqW0SpPOn3PTualHt95uWIp9Kk7YILAUqTPmTg3R4nS/Y0rnJ/tIddkjlzw66ysIdfmUnlF+G2e0/TDZWDfsFxoXg2zUi90T/jo7+KUJ+2ZzkaadzjjFRgPBcyGhcojf6yJEPRQsUoYbnN1z8dAzSqjf7vOILhrqUg8tVbjNGZOFcjVxy+gUozcS8reH07YJlretqGymP/y5N2BpyXgxdzKY0dVXJ/fPtm2BuJGwPrnB9g+jWTKdRVi7u4XerwfbVSwr7OZupYkrrKsdDkNcCfBiFrrFJVSERgI3sFc2QOxIxrw6mrZMrD3p/hHv1oxtArLp+nwQgw6nSi+J2spQRRSZ77GrXSc7rWyP4WUii5wd6RX0WQy1qbzp4uiXOHxSv6ErCsmhFzmm6W1pttHMSKHgd4NLX/pK7ILfcsY1Gbr7z2gGKRuqb98Xz6LiJhjN0c/59CQQa7aRIm0RZL0n6qckAQb4uo4AvpxY62sqqxjHGdEFxfSJoawRcQ1TnITYAY9IwKAtI66slkU5Ow4KQI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199018)(86362001)(36756003)(38100700002)(38070700005)(122000001)(33656002)(478600001)(71200400001)(316002)(54906003)(6486002)(966005)(41300700001)(26005)(5660300002)(2906002)(91956017)(66446008)(4326008)(66476007)(64756008)(66946007)(76116006)(6916009)(8676002)(66556008)(83380400001)(186003)(6512007)(6506007)(8936002)(2616005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <26B9F302D762184F98E4AB4968A90283@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5737
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b9f81dfa-9ff2-43a6-8072-08db15b0053a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V+WjiRZvF4c0sIBBS1JVQyVvwuGfsMNHwP303AwVi/SdNfZLhVvQOQWhleMKQjK5Ji+fvuptOv5UxMESk9rIy79w5GpWQbywzEY7uOaXh4Tf0v39xFECIZv8MOzttH8wBowZwO0G/siTJKWwce5Mc54TJkZIPiihqK25/ydhGaDP5b5qXUTCF0VyFDRrGFWub5rbPNXsdUHA42iHIwl7b17cp/mdW0O00TB500rdCbpRUT90WeSLeinLCRFPhi+3mR3mieA+Ha3DLuI3zZ4FGCsGWDpeCcPkoyfhadTbYj66toNIv1wYMgdneu7unMG1jfsyGI1QPipFETVsvKcbxi/4cq6TUYPjxkbzIBv3hv7z5KSYEyGTJ7uw9DKOX1MaizZgD+HUYvsuMhj2r3ZKON9DpAYRJ3HJNU9pd9BbfXOhnW6hpxSKpt6LXbZJ+vJs4tFy4D7CZJlXQnWESm83Er4AQMYmU0h3MRu43FdPIENpFWzGdWz6rzwfNUQbJfp0t89TFGoIsXiEz8xh3ylbIaocajDVPkpr8a1pFMVxXuC8Vvz/4e3VPcSwa/EI8EA+8S0dEGfHN/4BjbSR5EgF4R9+YbKHh9Y50Ytt9eqkekV+UUbFUBxjRaEXbgQ1VS1+NgtqYDP7dW3N9Yp0Vr1R6yByN446iSl7rUajB98BHVl7YWOivpoei1Gw/5MsdCck
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199018)(36840700001)(46966006)(40470700004)(40460700003)(33656002)(8936002)(6862004)(41300700001)(107886003)(2906002)(47076005)(53546011)(336012)(2616005)(6486002)(54906003)(966005)(186003)(8676002)(316002)(26005)(70586007)(70206006)(5660300002)(82740400003)(6506007)(6512007)(356005)(4326008)(36756003)(86362001)(82310400005)(40480700001)(478600001)(81166007)(36860700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 15:10:07.7878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5f514d-f9c4-4476-10cd-08db15b00ced
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9435

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
>=20
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

It is a little bit hard to check what is said here as the limitations
are probably due to some things done after this patch.

I would suggest to move this patch later in the serie.

Cheers
Bertrand

> ---
> SUPPORT.md               |  7 +++++++
> docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
> 2 files changed, 22 insertions(+)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index aa1940e55f09..5e0595419684 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -818,6 +818,13 @@ that covers the DMA of the device to be passed throu=
gh.
>=20
> No support for QEMU backends in a 16K or 64K domain.
>=20
> +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> +
> +    Status, Arm64: Tech Preview
> +
> +There are still some code paths where a vCPU may hog a pCPU longer than
> +necessary. The FF-A mediator is not yet implemented for Arm32.
> +
> ### ARM: Guest Device Tree support
>=20
>     Status: Supported
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 024bceeb61b2..ca4fc3e67b0c 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1645,6 +1645,21 @@ in OP-TEE.
>=20
> This feature is a B<technology preview>.
>=20
> +=3Ditem B<ffa>
> +
> +B<Arm only.> Allow a guest to communicate via FF-A with Secure Partition=
s
> +(SP), default false.
> +
> +Currently is only a small subset of the FF-A specification supported. Ju=
st
> +enough to communicate with OP-TEE. In general only direct messaging and
> +sharing memory with one SP. More advanced use cases where memory might b=
e
> +shared or donated to multple SPs is not supported.
> +
> +See L<https://developer.arm.com/documentation/den0077/latest> for more
> +informantion about FF-A.
> +
> +This feature is a B<technology preview>.
> +
> =3Dback
>=20
> =3Dback
> --=20
> 2.34.1
>=20


