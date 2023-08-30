Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA94778D3BA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 09:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592726.925534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFvo-0000jz-7W; Wed, 30 Aug 2023 07:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592726.925534; Wed, 30 Aug 2023 07:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFvo-0000h0-4t; Wed, 30 Aug 2023 07:48:04 +0000
Received: by outflank-mailman (input) for mailman id 592726;
 Wed, 30 Aug 2023 07:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TI6i=EP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qbFvm-0000gu-8Z
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 07:48:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b2b9a1f-4709-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 09:48:01 +0200 (CEST)
Received: from DU2PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:10:3b::22)
 by DB3PR08MB8796.eurprd08.prod.outlook.com (2603:10a6:10:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 07:47:53 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::2e) by DU2PR04CA0017.outlook.office365.com
 (2603:10a6:10:3b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Wed, 30 Aug 2023 07:47:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.20 via Frontend Transport; Wed, 30 Aug 2023 07:47:53 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Wed, 30 Aug 2023 07:47:52 +0000
Received: from 3e0e5c1aeda7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 37D684FB-6630-4A3E-9520-3C9E7E52BD45.1; 
 Wed, 30 Aug 2023 07:47:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3e0e5c1aeda7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Aug 2023 07:47:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB7378.eurprd08.prod.outlook.com (2603:10a6:150:22::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 07:47:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 07:47:38 +0000
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
X-Inumbo-ID: 8b2b9a1f-4709-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDEr1Jxw+JaRbik7MchJ2c3IT5s7A0oo/MOX89vzJyk=;
 b=IAzIHjWOLg+qreWiywKiYPnUmdT6TClqWv7n2hFe0ltfaO+ZkdKeGz5mxZ0md1nNjDQFMn69N/kCKp6A0etGkjTW837oHrk0dSpf6OpdoqfJ0wcA81EpNIK3w0YBBa7+Kc7q+HkIIyy2xnyB7mAC7nz2YDUvHFLG5gKnv3C9EqQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 037f13676078ad4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+j+SgME8IAkTQ7RI3hTiPfQaDFxzufR3h1tfTy8V1RR2tG27ad5sdrDXVWZ96SIyaJBWqSr74F/gmDwQshXnxQPX8dQe9OQmaeEuUL524POO+FmtNQRtXZqE+eUpgchJLkcigR5M0MixPtRnDNPkG1NobuDK+nUilpx5BJj4Y1809ronJLeGTjy4Ex4nEkbVxVybJjxJBZ5xomt/yOuKVEIPPT3IGqdjn8f0iYHUUDRsFomXPrt2Sp2mCHiJDAJM5M7C/zlXIqaUAXueeBjuyrgvhv3cNZl/7+DpZwM/g+vDVPc8YBZdiIiww96oyw0jSzaklRJr3X7O/fE/paClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDEr1Jxw+JaRbik7MchJ2c3IT5s7A0oo/MOX89vzJyk=;
 b=j4ml4OHk9SkO33RnVw8ycAc2ggQe00CyWn0Td8ZqqvVEBR7W61uXmceTs5daAlF0+dOny9HkEr3smPbgmdb/PNoFaps38++zhm3WCUvRbUxrMQwZBiw+2fyPx2V7nd9rf9sOhdxmFbp7PlRQSJOgXcvTNXuXuoJvfe9dStdhUeU6gImHJ4aT8GHyN2dZ7/vAWNGneHrFwY18j1aQ+wQc3yKrBEmpdXyGHSr4i6Q2Wv1fLxVavZ6y+O1f5Gvo75lBmRyx4VAEZ9o9cQZlJlRjlxFo42dX/j5+FzS0nQdqAP0el60K+FeSnyU2z5tjoD4sYwTgrtPJxheCZV9AQQn50g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDEr1Jxw+JaRbik7MchJ2c3IT5s7A0oo/MOX89vzJyk=;
 b=IAzIHjWOLg+qreWiywKiYPnUmdT6TClqWv7n2hFe0ltfaO+ZkdKeGz5mxZ0md1nNjDQFMn69N/kCKp6A0etGkjTW837oHrk0dSpf6OpdoqfJ0wcA81EpNIK3w0YBBa7+Kc7q+HkIIyy2xnyB7mAC7nz2YDUvHFLG5gKnv3C9EqQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>,
	"roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] docs/misra: add rules 10.1 10.2 10.3 10.4
Thread-Topic: [PATCH v2] docs/misra: add rules 10.1 10.2 10.3 10.4
Thread-Index: AQHZ15302aQv2TiBlUOrKbURllq98bACfTWA
Date: Wed, 30 Aug 2023 07:47:38 +0000
Message-ID: <312503E5-4C61-4F1E-979C-536B6369D30E@arm.com>
References: <20230825214842.3467599-1-sstabellini@kernel.org>
In-Reply-To: <20230825214842.3467599-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB7378:EE_|DBAEUR03FT006:EE_|DB3PR08MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aac4ec8-2238-4eec-6be5-08dba92d6aa4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BLb0guHWYXQ1oFwln3FRofr3JMd/VVmyEVRK7HSc3pa4GzHLSntYO+uf2zvqFqes1e2+cnAks2v5+dVAbQo/Dth6hWoqKIG/KPD9LvyWBjE5uQErUIFsAOqydVg9Gx8Bh7dVx0p1ZdW0cZVwTtWg+31qggW3NJrtNnvDwsmrpli6Vh+f5m18fXwc8z/huYVE6DkHSO88C6oAjFo84ckRah8zF+sZUezdPzcY8sgHQa3OkV4boK2oPjDCwOX5kufwQGOKTMz/tNqwcwOi2iPQZ234Q/5lXEHsh5HOWWNfG8Uyv4wuzcqCpA3oKc3DaAEw8tImaysPPdS96yyUed5D8V1jUgjRakCyN4/kGg1aaXRYAZnRdpA5Ert5wLo1v/1pvOq8YfJG5eTp8IF8qAeYCs4rOOhDGCpfzec6RCtNLtspkC6qnGCqhmYml+4/sbyvJV7nxK/rn8kU5mmMNCoxBAW/7is6W/Vi6giYQhUbYcuvbAl0zryoM6GvF7pOanWg4E2X/+GrVev/DDIPIP+gOwrb+8GpV8B99SVQ6l3b9C/bL3IL8WRQ/uD4y/odzxIoahoODucaYUh6m7YXh7z1sNRYFOEhKbqdrn+RxwahURuaDJx3eTA08CxN1cxJLj0QoEBXbqYaD1HAj3ZaY7g9bh1sXYdASov1ITtUWKbjWR42qnM2E/ZSXsQJL2zP/1DO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199024)(1800799009)(186009)(36756003)(33656002)(83380400001)(86362001)(7416002)(41300700001)(5660300002)(53546011)(4326008)(8676002)(8936002)(6506007)(6486002)(71200400001)(2616005)(6512007)(91956017)(76116006)(478600001)(2906002)(38070700005)(122000001)(38100700002)(64756008)(54906003)(66946007)(6916009)(66476007)(66446008)(66556008)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2097FD623F4D5C4FA6CD7E39AA3B5B4C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7378
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8f55ee5-4c8f-4a07-552f-08dba92d61f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HDX92eH4nbpV58JBwLv2JTjh90ocT66l0y0ea6srwAEK0c3NhUqwz1ETbDXkVMyvEOcuAPsCm6OtGlpbFidRpIWQgs+Ra1e1vJxlRi3oNE0lz1bjT1ZARQWgegYKY5McpDGMwF1DqcHJrAUU4q+xnQgaqKvOnjFaf2UpQAVc7p12jwzqmQ9MUPLvX8XFMudTp3azGYJ3Gyg6Y+I1yyzlK8aOcwq8GHYniAi0lo/fiDEtKwCcq5zSjK606+ojnnLL5iDTksOTNwTmDRR9mWSKSVEMdKZXcAk86UtPliYPEztE1DCeJ4206otCvxrYWeF28xqJ+h4UYP3sHpSAwrpm0hsv2ayk5JRuY8Mb1xfhLf7ovMu0VrZGOkvHqVR19B3HzriNsi1NQPvuO4XKsfy9FwCdLLIy/zSqnPjYePYTca9rQKEmYImR/WeHGeE24VXLJN1h/+ppRSoGSA8xPQHZ/vtFrWkLxzWpu8QBaRI4pISecqg0uOoAFR6fHmXpnGeMnMmfgHsl0/6TVvrocdIWcR1CDe3PD5y4GX+SowbM9LOteJdj72BxNnOUPoC95aqnfDqCMsKytEJ+XhgtY1zaYpZDXOmh9rSiMtKIEIVk1Pwltt8khEskEmq2clQbkFmbO7hugD9KvriEqVPBNAB+3plbt9mB6Rx/Qn3X0q0E0D+lNlmCjOYt32tIGBk2f3VdT6vKdfzzES+nqhq8WKSKSArI72tB0Wsi9fYVaVTvgE1PRqoYt6/v1xKteEHL6nc0KRMWB3P9kK2pIaHQHiibyg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(82310400011)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(6506007)(6486002)(6512007)(53546011)(83380400001)(2616005)(478600001)(26005)(336012)(2906002)(54906003)(316002)(70206006)(4326008)(5660300002)(70586007)(41300700001)(6862004)(8936002)(8676002)(36756003)(81166007)(33656002)(40480700001)(47076005)(40460700003)(36860700001)(86362001)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 07:47:53.0683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aac4ec8-2238-4eec-6be5-08dba92d6aa4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8796

Hi Stefano,

> On 25 Aug 2023, at 23:48, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> 10.1 with several caveats, described in the notes.
> 10.3 and 10.4 as "aspirational" guidelines, as clarified in the notes.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v2:
> - typo fix
> - Implicit conversions to boolean for conditionals and logical operators
> - make -C xen
> ---
> docs/misra/rules.rst | 53 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 53 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index db30632b93..34916e266a 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -310,6 +310,59 @@ maintainers if you want to suggest a change.
>      - An element of an object shall not be initialized more than once
>      -
>=20
> +   * - `Rule 10.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_10_01.c>`_
> +     - Required
> +     - Operands shall not be of an inappropriate essential type
> +     - The following are allowed:
> +         - Value-preserving conversions of integer constants
> +         - Bitwise and, or, xor, one's complement, bitwise and assignmen=
t,
> +           bitwise or assignment, bitwise xor assignment (bitwise and, o=
r, xor
> +           are safe on non-negative integers; also Xen assumes two's com=
plement
> +           representation)
> +         - Left shift, right shift, left shift assignment, right shift
> +           assignment (see C-language-toolchain.rst for uses of
> +           compilers' extensions)
> +         - Implicit conversions to boolean for conditionals (?: if while
> +           for) and logical operators (! || &&)
> +
> +   * - `Rule 10.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_10_02.c>`_
> +     - Required
> +     - Expressions of essentially character type shall not be used
> +       inappropriately in addition and subtraction operations
> +     -
> +
> +   * - `Rule 10.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_10_03.c>`_
> +     - Required
> +     - The value of an expression shall not be assigned to an object
> +       with a narrower essential type or of a different essential type
> +       category
> +     - Please beware that this rule has many violations in the Xen
> +       codebase today, and its adoption is aspirational. However, when
> +       submitting new patches please try to decrease the number of
> +       violations when possible.
> +
> +       gcc has a helpful warning that can help you spot and remove
> +       violations of this kind: conversion. For instance, you can use
> +       it as follows:
> +
> +       CFLAGS=3D"-Wconversion -Wno-error=3Dsign-conversion -Wno-error=3D=
conversion" make -C xen
> +
> +   * - `Rule 10.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_10_04.c>`_
> +     - Required
> +     - Both operands of an operator in which the usual arithmetic
> +       conversions are performed shall have the same essential type
> +       category
> +     - Please beware that this rule has many violations in the Xen
> +       codebase today, and its adoption is aspirational. However, when
> +       submitting new patches please try to decrease the number of
> +       violations when possible.
> +
> +       gcc has a helpful warning that can help you spot and remove
> +       violations of this kind: arith-conversion. For instance, you
> +       can use it as follows:
> +
> +       CFLAGS=3D"-Warith-conversion -Wno-error=3Darith-conversion" make =
-C xen
> +
>    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_12_05.c>`_
>      - Mandatory
>      - The sizeof operator shall not have an operand which is a function
> --=20
> 2.25.1
>=20


