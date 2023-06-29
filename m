Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633DD742204
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 10:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556696.869404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEmuN-0005FO-Bb; Thu, 29 Jun 2023 08:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556696.869404; Thu, 29 Jun 2023 08:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEmuN-0005Cz-8q; Thu, 29 Jun 2023 08:21:43 +0000
Received: by outflank-mailman (input) for mailman id 556696;
 Thu, 29 Jun 2023 08:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjYd=CR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qEmuM-0005Ct-8j
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 08:21:42 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f68ffe52-1655-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 10:21:36 +0200 (CEST)
Received: from DBBPR09CA0023.eurprd09.prod.outlook.com (2603:10a6:10:c0::35)
 by AS2PR08MB8287.eurprd08.prod.outlook.com (2603:10a6:20b:556::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.44; Thu, 29 Jun
 2023 08:21:33 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::d1) by DBBPR09CA0023.outlook.office365.com
 (2603:10a6:10:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Thu, 29 Jun 2023 08:21:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.20 via Frontend Transport; Thu, 29 Jun 2023 08:21:33 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Thu, 29 Jun 2023 08:21:33 +0000
Received: from cc1c309af71e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F2DA05C8-AA14-4BEA-BDD5-BEAA19376452.1; 
 Thu, 29 Jun 2023 08:21:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc1c309af71e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Jun 2023 08:21:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB7337.eurprd08.prod.outlook.com (2603:10a6:20b:444::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 08:21:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 08:21:24 +0000
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
X-Inumbo-ID: f68ffe52-1655-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9wy44JI9gsq8hu9CRU8UTps+OR11TjbePSpCERO+6Q=;
 b=H7H7INb9DohODi1V4+NwNIl2ua5OMrIwNhSvKgyDxXwvhyo1GYrYfcHg3P7zQe4FhJxcUv9dNEq3hx5sO6EK+50kT+mqSyHPLeB9jV52BVtnVtg3DF9nE3ZfLuEG5CNbj6rSQo8ru/vZ4cJjjhAFl6y4dd3bm00bmzb9uJta3SA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae905de147b11744
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhzcDLRI0BsKx3PmYyi6W+nKbAbu2+AXEM+u2U43oqyJuJ0iw00t9Qk01hXRKXVMf0f3j241ssrgUPcBDR/aq7r6zOfxn01wfVoij+ZRpY9JhcxcuW8d8lQ0VC7NWjS7yVj1LZBpjNpjmKwt8G37+igYTWXZ66GlQW0R7Zs4WKvCVQ1xI/FmU9NY2CD3NU3+qUZ2/ONT0tazgAZnZ7vNyO8MUCmsB+pdwfvmuoJeFSBib1FQZ8MebPhcLVDJmq8x+L5n+RqZ8f400AoNXvzogurZVJLN9Ff5lv6jiUGkTov/1Itzz4FWJChRNpHZW3KWzROjV40LKmFZQyEwWer1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9wy44JI9gsq8hu9CRU8UTps+OR11TjbePSpCERO+6Q=;
 b=jihaJLnkvX+iEtxdXSle/pSs1PAdUY1ysDCn6AkLlHR2InQTYUqTrzL+iwvnsMH7G+vFNJ3UEbKNqbQSyTmnh8kG+4VF40gOxpM1Lp12FJMwGF+8go/KVBqyESPu5CiCqqvSIAQOTvfVG7tbIy6AvDaWPLFaRV2nwSh28aFiwMVTOPAnz+4PRlvQgw4Tfti0CBQ3gwYzFUZwPfcSjJGNfxPOan252jfHg+gVvfXAvN29JUDzz260gkPT/Uy/I4GqkKWmTZ2g74xUFUnjmHtUmXFicF2CkevdyorepSvkaW2nfVi/GEDUiGkG9ujRNS7LmV7M3i0wLIcYDbNctXCyXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9wy44JI9gsq8hu9CRU8UTps+OR11TjbePSpCERO+6Q=;
 b=H7H7INb9DohODi1V4+NwNIl2ua5OMrIwNhSvKgyDxXwvhyo1GYrYfcHg3P7zQe4FhJxcUv9dNEq3hx5sO6EK+50kT+mqSyHPLeB9jV52BVtnVtg3DF9nE3ZfLuEG5CNbj6rSQo8ru/vZ4cJjjhAFl6y4dd3bm00bmzb9uJta3SA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add Rules 8.2, 8.3, 8.14
Thread-Topic: [PATCH] docs/misra: add Rules 8.2, 8.3, 8.14
Thread-Index: AQHZo99p/T97HMuw0EqXSDkqCUoxs6+hfZcA
Date: Thu, 29 Jun 2023 08:21:24 +0000
Message-ID: <D396E9A0-1E08-44DD-BBDF-2B8A4840370E@arm.com>
References: <20230621012618.2661337-1-sstabellini@kernel.org>
In-Reply-To: <20230621012618.2661337-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB7337:EE_|DBAEUR03FT059:EE_|AS2PR08MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: f556fed5-2696-4b68-0f1c-08db7879d913
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5teRs7fhYH5NfUXT3RAYPdfcBhjSC2O4DaSSVdhlZsBB0VAeXpkV+3atB4jqAtG5FZKYX3E3qSK3fup+gcjQEoXBqOv6BmjdfWVuNzxyyEtnDIugskSDbdMLNuf81TVz4QXJ8YOntVw4Ka8mT0msiH6ujbGIkBDkdRRFY5G4182zHqeyu5MlV7V3DyeTNvjqtB5v0OnEwMz/zfj8eh3+tXgmt+bF9XWe1QkDEO/x8R3NfEGmm0cCsZAbhnKRlblyNU1i0fWhytEV811vpJzI5kPmnmi4jtg6eMCyuE+DgJwy/qu8ayR0RNbpu0kvWwmsCarkhYGHktgim9twIPQCkg+MGEH/cvO+AwHyyAUDwSY5b03xWjUqH5fqrJ23K8gVeVoRY0NnCxrLQPh7VWOttsvc2epRuWMXnG790qrzJgIzoMmHKV+03NP6g9//0hvZm9JalkF5E5Hwseatpf9+VIaEYIInhu1R3x44aPpuYHJBkRIlc9uWboGyc3vvt2valZOXvQGNcrPXBzbRxP8F/EmVY7AuELF2jkenLQd4pd4lPTcfsKNQJMIuqt1O11wDKrK/npA6R6T32PlPzzdipUIv3KUq7lQwu9ByDtY/e/HdhrzuX5kCxrA1/fNH1ozsYVsnffhjx3CL6U8TD3AsYgWrrhULOPmT4A7gCtmNKsY7Xg7I2c+RehNcW/xiWOXU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199021)(91956017)(36756003)(316002)(76116006)(33656002)(66946007)(66556008)(66476007)(66446008)(4326008)(6916009)(478600001)(38070700005)(64756008)(8936002)(5660300002)(8676002)(2906002)(41300700001)(86362001)(54906003)(6486002)(53546011)(6506007)(6512007)(38100700002)(186003)(71200400001)(122000001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DF77F29188ADE242814B169174FEB8D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7337
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4246c28-9474-4572-b822-08db7879d427
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W0P073jEv+6xdNpn11njlXQVetVGmSDlHJprIAg9hfK6WRmxuV/qq7Jp5C6bmst5i08ZVZKWWHTX4MQiNnwDAuoe6zv7iH8VPghWL3cmEdfCFtCarXF3GfoLwqU00a7Nd8WobzIP7NBlrmrdwunj/PeD0+p+dh9JYWdASRRRSqD8yxKpU6Sm+3n16GAhAh8QNH4QNT4wA8hiu7pfa9Ws3D9fR/83FCwNnIpt7w5HOPzTaVAWUTv+p913YGp+dQLcJ2QaCVr5nbRSC5EjA4A/KN4/81512OIWgM5/YLcJr7X5EthdqNlX1Y/xqQ8SZpdQzOVZF2ulv4LqCdDnSEZrTWAKwa39VxkfZ4NZRfnvnDVey/poPDW0zo1hcSmApejjQVAYqWjB+FkRSoxRbm1qBUKy5PvEddDXldM7s42zVT+UvbFYoOmBBVMiaIpnYur1j4w3gsIjZF0rPuWRjZjjSlVi+j4IeMksLZQ/vuwPvpyOHWroObqIPlc8/P8sYvhMf2fAYWamxr2evUR+AOOsFzvCKwPx6R9LHWVgWub8ptKK1hbpGTvWKwK+oyR/n7EjrRd+8Khy+ZLrZF2ONvml3EaAsDFJb+tzMEyjizRpvz184j6tX14VhN02XYWjZbfjEEr7sjDIYyLZwFMHdr34fCvupxn/DKCxvb2yivj1oWiepVMnss9POgjoI5DBXqyET6JJtiAnhKE7I5oS/J4p5e1cwatVUVySAABq6KdhEeJTTCRCkNRVAftjRKbGVSi96P/y4xeMAAUEu8NdAmxMbw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(478600001)(2616005)(4326008)(316002)(36756003)(6486002)(81166007)(356005)(186003)(82740400003)(82310400005)(36860700001)(6506007)(6512007)(26005)(53546011)(47076005)(70206006)(2906002)(70586007)(336012)(33656002)(86362001)(40480700001)(6862004)(41300700001)(8936002)(8676002)(54906003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 08:21:33.0869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f556fed5-2696-4b68-0f1c-08db7879d913
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8287

Hi Stefano,

> On 21 Jun 2023, at 03:26, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> docs/misra/rules.rst | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 11b9c42b70..9caf43968c 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -213,6 +213,17 @@ maintainers if you want to suggest a change.
>      - Types shall be explicitly specified
>      -
>=20
> +   * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_08_02.c>`_
> +     - Required
> +     - Function types shall be in prototype form with named parameters
> +     -
> +
> +   * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_08_03.c>`_
> +     - Required
> +     - All declarations of an object or function shall use the same
> +       names and type qualifiers
> +     -
> +
>    * - `Rule 8.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_08_04.c>`_
>      - Required
>      - A compatible declaration shall be visible when an object or
> @@ -248,6 +259,11 @@ maintainers if you want to suggest a change.
>        enumeration constant shall be unique
>      -
>=20
> +   * - `Rule 8.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_08_14.c>`_
> +     - Required
> +     - The restrict type qualifier shall not be used
> +     -
> +
>    * - `Rule 9.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_09_01.c>`_
>      - Mandatory
>      - The value of an object with automatic storage duration shall not
> --=20
> 2.25.1
>=20


