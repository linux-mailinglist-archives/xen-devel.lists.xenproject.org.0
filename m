Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FDC6A1E8A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:28:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501193.772839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZzJ-0005XY-JF; Fri, 24 Feb 2023 15:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501193.772839; Fri, 24 Feb 2023 15:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZzJ-0005US-FD; Fri, 24 Feb 2023 15:27:57 +0000
Received: by outflank-mailman (input) for mailman id 501193;
 Fri, 24 Feb 2023 15:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/OIK=6U=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVZzI-0005SZ-6b
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:27:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cec64d22-b457-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 16:27:54 +0100 (CET)
Received: from DB6PR0601CA0001.eurprd06.prod.outlook.com (2603:10a6:4:7b::11)
 by DB9PR08MB8314.eurprd08.prod.outlook.com (2603:10a6:10:3de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 15:27:25 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::6) by DB6PR0601CA0001.outlook.office365.com
 (2603:10a6:4:7b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21 via Frontend
 Transport; Fri, 24 Feb 2023 15:27:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.11 via Frontend Transport; Fri, 24 Feb 2023 15:27:24 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Fri, 24 Feb 2023 15:27:24 +0000
Received: from 246d866e407e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C0D851E-1617-4C21-B741-EB388869F6C9.1; 
 Fri, 24 Feb 2023 15:27:14 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 246d866e407e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Feb 2023 15:27:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB9849.eurprd08.prod.outlook.com (2603:10a6:10:462::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 15:27:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 15:27:12 +0000
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
X-Inumbo-ID: cec64d22-b457-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLuA7n4YeEA5pGgCF0/yJiUAM9VSnZKIFtqScOmWx7M=;
 b=bfn7dqr5t7ld1n3uG/gbkTZ09U0+aW2GtXS/XZYw5K8fBsXCsDbKRUFvVUDu7Ouw1WkjXHqA8M6r9m2w8StJaiCni2bwnnBXqKZLSuMddDgLfYcvzuKI/69ylL27KFV/ZBwjdhyCsKJaa2WN5WFbCjo7S1tuLud+Vfa1akFmmno=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 272b069c31ecc33a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H31qi+I9XJD6mPOnIVqaZvT/RaqovVXTqlw83FBVm7Q/fwznVzXlV5oUGRYOjL9mjAGHYdVoXkFDALUKHoQCs5xe4E+SJEZhoHmkRzLDrwHZImA5LTO7QOcSjBuvdqBYAPvGNNNCjRa0D5GyNrI1j1AXFVGxa7fdASZdFepQKj3FnLAGkcR5gL0E/3y9vowkz/5kV3+itZ6FVNs6LuxahxlMV7oakRqY3F8SH6VR86KIcMo1j9zM0fYNLdvk1N5EPBRbhoYLSFtCugtAKlVLt8JYid+RTPwqxRUF4d95HhfRsShxzdVYSedIVpBzD+LUOu8x9G0/MHXKn9y3gOHfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLuA7n4YeEA5pGgCF0/yJiUAM9VSnZKIFtqScOmWx7M=;
 b=m0+DME/CRTbKBHjyRAFtuWMACP0F8p2nx3JKonv57xCpMG6nhseN+NogUlRwOys8u9tbf5r3xShlqzaoH9q2hO0km7mujuXFA4It0r09Aim8ke8z4QgNS2eLuA6yx1ANSdWl/S9SW0rVYS17IP6rE31ysmkIlMZ5GOmMnfszRBVAry9nn3vaZDheAyQiDJiIP7KvKFDGv/EN/5xMIbwg8V9WD74/xKahfq/p1Cr4CsNaWidhGyUkTuLiWoX8fjfub8y0zojcAAvMg8zhFbP5Xcs5SddGy71EkXMCD6XO128JlY8lu0uGwNmaqv8EBTyli7JxmFBl3ryCdqqmYr9CEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLuA7n4YeEA5pGgCF0/yJiUAM9VSnZKIFtqScOmWx7M=;
 b=bfn7dqr5t7ld1n3uG/gbkTZ09U0+aW2GtXS/XZYw5K8fBsXCsDbKRUFvVUDu7Ouw1WkjXHqA8M6r9m2w8StJaiCni2bwnnBXqKZLSuMddDgLfYcvzuKI/69ylL27KFV/ZBwjdhyCsKJaa2WN5WFbCjo7S1tuLud+Vfa1akFmmno=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 08/20] xen/arm: ffa: note dependency on 4k pages
Thread-Topic: [XEN PATCH v7 08/20] xen/arm: ffa: note dependency on 4k pages
Thread-Index: AQHZRtMZN0hUXh0yA0u/TS4KHErP767eOzoA
Date: Fri, 24 Feb 2023 15:27:11 +0000
Message-ID: <EE2EF6DF-0BBB-4F55-A34B-321795F7821B@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <6c0ef5d2174bfa8c25aeb94395160ab9d863b63a.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <6c0ef5d2174bfa8c25aeb94395160ab9d863b63a.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB9849:EE_|DBAEUR03FT028:EE_|DB9PR08MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 1caa8c17-b404-4b9f-af37-08db167ba17f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JY26Jmv3Ja5m8PZEaEjSaI8Gv/wHyjeT4RX80pioA9Vvpw3iUgLedg2WuUHpGD3r/1obhBHa8gvMdoHG8NiW4JNaQcLuqyXSGRHWX1Y6RnzmxnR6xpmsV9UvPfX7ofjVsA6r847LbRBtYkMLNVBbYmo+SthUbRVD68EmRfTTDAXeBc37xieWSdP0KpNWdhRLkBq1cxBHKanmj9oEUkPCgtZgRzQfAIEQ28HmK+VZvyCXHUdhkz3ajrzSNgkhmoNobOnfU80lPonFs1EuEyMy7BkKWPkFlucNfNsDoZfpxhWIrlvks6xMAb41b0r4X9NQSqRWQBlpGsxHeofDllPJwSEumINuFDGjM3NoKQKKS3KXdemYBN8Zd8LbgMCA54BssQ1UzrpcHXGlfegbbcxRcW0OCgr27ppqR8viaduFlJRR7prHpSNBk7kp1Nx6BJzEEgcPMOyzDEl6qJQNRObXvZGSB+jwKzXKe5sz64tWLLVPWz9Fw3BJKqGEGiIgs6Te4x5ooFR+SqyIg/+5Q2s64gYVAlo8wqjI3Bnzwk2n18D0HpwOlbxcbu4jS+3EUKfhLH086OqHBe9SgiAZSOYRhxj88Vxu/vnY42H4WNiwLwpADhSt4Dtw+Kg7k8fav9XMNQU7HxDC5jaLcHqAuBwR1WXvdYeiZDOl4huJoujtyXt4yKNiBxcX6Fanfbtm4yWOzuM31/EGnx0Vkj4v1ypUeN2j2NuFQOuiV8U6NuJH9wY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199018)(8676002)(36756003)(33656002)(66476007)(76116006)(64756008)(71200400001)(6486002)(2616005)(83380400001)(186003)(26005)(53546011)(6512007)(6506007)(8936002)(41300700001)(86362001)(38070700005)(5660300002)(2906002)(66946007)(54906003)(316002)(91956017)(38100700002)(478600001)(66446008)(4326008)(6916009)(66556008)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17DC4005EC033D438EE1A6ABD015AAF9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9849
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50606521-f005-4d1a-4b48-08db167b99d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	urngFWmnnrXcDvzeOgVaqyv5Tsl4zQztwYOOMbHAVyS7wxZlhfyeWpC0F5VF2OuECGs/XTqxT+/jFGwTEwhOznQBE583hBvSk9/jEqKH0Dfxji1PDp7BlyRgaNWpEQTqS+/R32+Q1F65PFPNJvwM/bs0eY7Yp/ko0BDP7aLCcLV9DPY+wKVK+c4+xN/dLKXfVRYcjyexziHQ3is7Qwb4fSAWJ3pWldalpSN9zHFfOL+gow8jDSZ6GkPfnEb6SxEiWrzLm7SEMf1kKzfpM9onu8luEZBdKByUFna3O2XgMITh+xtfNgy4eZ+tbPYjENx6rmpRWmmwNc1UmdW5qixWm1Uxv5Uf/dld3/lbZl1J2qbL4Q2oEnX9DF635c6o9WG9hoSprSV5ayuaPy1xDoSwNvTlyL09HEG1MqEPrg2/gJufl6pBfhjaj82cEftX4dcGZAV1aZtg+k8YbvPAnE2WTXxx18XR9nvTy0oPQxcvjttFLaf3wy+iKfZ0eVp0Ypp+kLZ5jGEusKTlgeC4gQULDWwzssJSA0AsFYh6ALKqz3qnHBewQpCnrKgv7MKggg7xBu84WZTzE8ANCxxZ0tmMdP2c63npPm8ol8nbGexDhAX4LuuZ8FDFGECNrYV9gw9VrP3tSYx9Fb2KaVQHmkZwSjYxDGUzfKpDSWlvFsTh7svlOz0kYSWhVnpIMnXmW9OtjK5QB8goNZ6Ev8b94d56Sw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199018)(40470700004)(46966006)(36840700001)(2906002)(40460700003)(81166007)(86362001)(53546011)(8676002)(40480700001)(54906003)(478600001)(356005)(316002)(70206006)(70586007)(6486002)(82740400003)(36756003)(6506007)(6512007)(41300700001)(5660300002)(33656002)(6862004)(8936002)(26005)(186003)(4326008)(83380400001)(36860700001)(82310400005)(336012)(2616005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:27:24.9189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1caa8c17-b404-4b9f-af37-08db167ba17f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8314

HI Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds a BUILD_BUG_ON() to assert the dependency on 4k pages in the FF-A
> mediator.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

NIT: I would s/note/enforce/ in the title:
xen/arm: ffa: enforce 4k pages

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
> 1 file changed, 21 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index d04bac9cc47f..8b0b80ce1ff5 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -56,6 +56,16 @@
> #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
>                                                  FFA_MY_VERSION_MINOR)
>=20
> +/*
> + * The FF-A specification explicitly works with 4K pages as a measure of
> + * memory size, for example, FFA_RXTX_MAP takes one parameter "RX/TX pag=
e
> + * count" which is the number of contiguous 4K pages allocated. Xen may =
use
> + * a different page size depending on the configuration to avoid confusi=
on
> + * with PAGE_SIZE use a special define when it's a page size as in the F=
F-A
> + * specification.
> + */
> +#define FFA_PAGE_SIZE                   SZ_4K
> +
> /* Framework direct request/response */
> #define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
> #define FFA_MSG_TYPE_MASK               0xFFU;
> @@ -242,6 +252,17 @@ static bool ffa_probe(void)
>     unsigned int major_vers;
>     unsigned int minor_vers;
>=20
> +    /*
> +     * FF-A often works in units of 4K pages and currently it's assumed
> +     * that we can map memory using that granularity. See also the comme=
nt
> +     * above the FFA_PAGE_SIZE define.
> +     *
> +     * It is possible to support a PAGE_SIZE larger than 4K in Xen, but
> +     * until that is fully handled in this code make sure that we only u=
se
> +     * 4K page sizes.
> +     */
> +    BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
> +
>     /*
>      * psci_init_smccc() updates this value with what's reported by EL-3
>      * or secure world.
> --=20
> 2.34.1
>=20


