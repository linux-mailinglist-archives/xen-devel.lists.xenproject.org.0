Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12AA7F4EE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 08:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941404.1340900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22Oy-0003LK-WB; Tue, 08 Apr 2025 06:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941404.1340900; Tue, 08 Apr 2025 06:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22Oy-0003JS-S3; Tue, 08 Apr 2025 06:25:40 +0000
Received: by outflank-mailman (input) for mailman id 941404;
 Tue, 08 Apr 2025 06:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JFBl=W2=boeing.com=gihwan.kwon@srs-se1.protection.inumbo.net>)
 id 1u22Ox-000319-D5
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 06:25:39 +0000
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net
 [130.76.144.162]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47d8c043-1442-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 08:25:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 5386PVnD012424; Tue, 8 Apr 2025 02:25:34 -0400
Received: from XCH16-06-12.nos.boeing.com (xch16-06-12.nos.boeing.com
 [144.115.66.108])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 5386PM1t012356
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Apr 2025 02:25:22 -0400
Received: from XCH16-06-12.nos.boeing.com (144.115.66.108) by
 XCH16-06-12.nos.boeing.com (144.115.66.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 23:25:21 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-06-12.nos.boeing.com (144.115.66.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Mon, 7 Apr 2025 23:25:21 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.145)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 7 Apr
 2025 23:25:20 -0700
Received: from SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:198::5)
 by PH1P110MB1699.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Tue, 8 Apr
 2025 06:25:20 +0000
Received: from SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e652:58c7:c916:3735]) by SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e652:58c7:c916:3735%5]) with mapi id 15.20.8583.043; Tue, 8 Apr 2025
 06:25:20 +0000
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
X-Inumbo-ID: 47d8c043-1442-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1744093534;
	bh=WoDTeEyU7d7mtmlWrzsmr8QzD3GpVbhHENRMwROJlQA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=rj2KuDXdKJZUPhz2poxqiXbXkz38DAroJsgayYTnVIPp4aPIWqWSGi/RTajjsX11S
	 LR/9w4V8KYxSZXjNxf2WkV9UseEgAyVVwSDcOXzcaaX8dw+aKbGot4Y7yRYjRYsrvv
	 Om4mb6W0oq/KeL1jRTNmOLT/K7/ezQYVcCxG5QBMZYizgkZzWdR2y7b6hcE7sJu+IJ
	 ktXNt7yODNHXFagc3g3Gz8LKl8SPxmm/pjBbWHtLktzZkGsVwF6xgMk7p0AahQrRlE
	 /+kpi5oaKnDE+aUuu8gUiHi865Mcesj5Hj/pGod7tbLuAq1Cc8uWp+1JNCLoTsfMxb
	 bnnLxSQjMex4w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=WaMw1La/kfA2VL2bWXzuPrdv3xSkeqvmFEdY61S4mZ8fI8SvGBv1GaOyBIep78YXKKAWWLG6QyY6Lkn2UP7qgcZXWH8x7h9H6IOtZIumCjjKI2oeyyE2ng24QRFSIkjvRj6Ag1CW1ONvOowubp6e/pKlSscjcx9f6AowNY3lwn41Db/DTFBh71T6r4qcYraq4oNBWmpg4BLHBQlEQGTlOzLI88dDA6GzAxnMne2YNvTrpOsgU5vybqdyQiv49ipdY0WCgdxzuU0A9axTr40jtHBfi7cyQimMCoHfnl/wPESJKzfDF/VRW8lVpwWrPLO+UuA/craEMqINbwu+hCx6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoDTeEyU7d7mtmlWrzsmr8QzD3GpVbhHENRMwROJlQA=;
 b=RKbsMOwJy6e+WWMbK8DwWKOtYOOoWfOxY0WUvYvfDgtVKTjgHWgpB+VHHiKzGXC7GeLQHE9m5FLURHfO1oYrDNLPcMqie59pfzACI2vZXM/egfNHPEIcUui5X/6aCa4NYUaZjlgFM1FXkGQQVIfKtG18OCHIviSF50HX/PdOXK/G1ml/V9ZH3mbN3IZdpO+Ag90shsw3AdYBGd02b1JSCg/gYic39Muah3gEEjCUEGRamPHWWO7ONa0ylMWJF5JwN/eK8PhclGc2X4dCdaeiYMGj84lzaTOS+c4P5II1Y9A6s0C9hx6GpiXZKaU7diMZRXC7MC6jesx7MHf9/4eoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoDTeEyU7d7mtmlWrzsmr8QzD3GpVbhHENRMwROJlQA=;
 b=KrGY1ciGfFBnd0emcU6FCp2nmKzIncH02NPwuG1Bd5sQojR/vGcwhbVUmRdtm5IBUxWWBl3PnhIKxfWLTfhhIsGylgDbfDN2F0aSzc5a/rAfhHNJ2swL5MQS576vjU34lV0FWQBw38Nn7/5yJSuYYewGp8OCp8CNtzgtfuP/ep0=
From: "Kwon, Gihwan" <gihwan.kwon@boeing.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Nicola Vetrini
	<nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "stewart.hildebrand@amd.com" <stewart.hildebrand@amd.com>
Subject: RE: [QUESTION] Minimal Xen Configuration
Thread-Topic: [QUESTION] Minimal Xen Configuration
Thread-Index: AQHbp4d8CTfihWvrfUi9wdjpxoA8O7OZTdEw
Date: Tue, 8 Apr 2025 06:25:20 +0000
Message-ID: <SA1P110MB2252D220AD05DCCB7E9B79BF90B5A@SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM>
References: <PH3P110MB2246A9D7AFA0A73000781B0390A0A@PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM>
 <f4803fc17047a9d74928c66d39bf9632@bugseng.com>
 <alpine.DEB.2.22.394.2504021409170.3098208@ubuntu-linux-20-04-desktop>
 <SA1P110MB2252BBBB6801DBDB88B828BE90AAA@SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <SA1P110MB2252BBBB6801DBDB88B828BE90AAA@SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2252:EE_|PH1P110MB1699:EE_
x-ms-office365-filtering-correlation-id: 46186b03-d0fc-403a-e879-08dd7666231e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?EUIdVixRixpB8MCw6wXPHqsowmBz4+GXMuSoGfDXPT8tJVdU1vTUiKcrQsqw?=
 =?us-ascii?Q?n/JO3DkgLOh+2xISAIzXawaQTKapaIRQxFJipmXFESimr3Wm2FzwkPjh9efZ?=
 =?us-ascii?Q?SmyYAV1vpjARVYM9F6o2MySH14MxFCUAFTLdaUtFqQthDC3DmZUCyA3OzaoA?=
 =?us-ascii?Q?gPjdNMIva1KnZ+dLh2PsgebtFPuyscmbd8oW37xLoPjtXnO8Y1R5rBvymAsB?=
 =?us-ascii?Q?K9gpDB95jFlZM02L6XLaDyrp6y5avNICjgaZW+QTO7JUZ2GWHiJ8+SVyubu5?=
 =?us-ascii?Q?aPnhO0P7UTVU/VO6v1r9AH2YrbH9W06yj3AvLc7Oz001+XiLmLCx2EAaq5Ff?=
 =?us-ascii?Q?ynf3Z4t3QbkRGCoOgiqD5a4eyNJMc9DpMEknihWlJdx7svaLe04cNUfdDDwl?=
 =?us-ascii?Q?CUeubKxBlBI7cD68IjKZ1ifKcXtk0/axYd1Bj8pkeSueSus5pmxfwM3CZLcN?=
 =?us-ascii?Q?leoJXRfXNiKK7wnhefXE4MJFKSMXfS4pIY/ixnopop0mmdzL+xi/QtFCfo6i?=
 =?us-ascii?Q?zgPK0TrsZdIBeuW6PdeXwOMPZja1GAk917qZ+U5AQpVcwM1yQ6Ba8NvLtXW7?=
 =?us-ascii?Q?mCdH4i3m7EFGVRVpI1PFL1SEX925lYvt6r2DBAaatlALu8IkOfkc+2dBM699?=
 =?us-ascii?Q?3akBl54NeFdX8YCnWZRzvXFWzcCxQkramLsDyQ2EVTOWgAShCW+H9jwxr3Q3?=
 =?us-ascii?Q?xu7hKZhH9iux5uaaLOzyTqMCYfTftmmeSsqg7XGDMeJ/SyP8EzBY+m0maRGU?=
 =?us-ascii?Q?Dh25AqsBaqO4d2rUnlB/MsWpAB3t27UE2jLLk8dzIXFpdUPov0jTLPzWVh5G?=
 =?us-ascii?Q?haVonPRd7ZoFk9XmPfJoXTfJlLwBhTEapanssgKDIrbLTM2/9udEZ1hc0aIa?=
 =?us-ascii?Q?Xnq+rYwxJxNKZPVp6HRdTO11aEC8d3cS+HmCfrJWQE5J82UkoK6Q+QQEW89P?=
 =?us-ascii?Q?4TrPJ9rjS1pLLivHElmCsZ1gqCKDzBMzoSSJwVMxFuurPBqmjmJKaJZikC9r?=
 =?us-ascii?Q?s9qaHaQ1SN9++N5h+ATvTdc1NkQY57GFLgv7Dckven8Fez83VzWbmlf1uCej?=
 =?us-ascii?Q?VE5sKWIt+OdTLUUEY0bPdNMXP1Dl0VQ94lLQQp3xdwABPzJKEb0FPliI6kV5?=
 =?us-ascii?Q?ipB9+OxG/R5FsnBT+pmYGGB112jY5bEr2AP8+cw6lKUKMonq/LBpmdy0Jfbo?=
 =?us-ascii?Q?YNG3AlJfFd9em15dxXgeAsjKh2ia256ACZqHV4/jshebMMzVv6ttHkz2I1D0?=
 =?us-ascii?Q?yDB4lKKXs+JKhWfwFdp2BmwCnJxdu6zppzB8mY8rOcsuWJDWvPLT2Vuuq4oG?=
 =?us-ascii?Q?FtT9jfwQJCKtbG6UlmFiqRi4xxTo0ONNK2889su8ctB9Olvk8lVRcFmVSxEw?=
 =?us-ascii?Q?oGOcZ14+fmGSfqS0FS3sk0bBJsk9?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zQ3IaCoDg9NG7EKFNsCk090JeusduKVi+WlUdRQ/UfHh9NdyOcJp94aJlvOC?=
 =?us-ascii?Q?U/G9ytStmp1ovqdg404suKYYChfSihKjGBy8y9DX+x3yoG1opiEMShGhObz8?=
 =?us-ascii?Q?MwQM/J5gHN9sIvBAXHu1Req3lFf+rhLD1U3YmvaQlmaf+/J4cOBdxPRsDBXv?=
 =?us-ascii?Q?+SOJeCc+ErRe3zfSkHiKEleBuNrN0qmtRlhp96UYFL5T21+UKfGFUjA95B42?=
 =?us-ascii?Q?1/+2s2bWdD0PRlE093uDKhmDPgYhGpgfwreLK8ZY2PHegvvPcpDWe+xQLkaV?=
 =?us-ascii?Q?CC3Z2q5MXPHVR13Z4kDqk5hJbEg4pWIlkcdMQepaLxrfEpCj3z2hwuvQ761I?=
 =?us-ascii?Q?PIN+xpaDmkf2oqhcH4ZlemhmFpV+67BZEItZyf2C27Y7TDZyEK8NaySqgbVr?=
 =?us-ascii?Q?hCBQC6S2jEFBe58HgAw0SzJGKHJaKoO1t0ZrrbUQP6NI0x42rgqJ0urJMdg3?=
 =?us-ascii?Q?h+3aru1anGg6noF8JJKL0R583BUysS+/djhmp+3OorAm6v6MfpL5i4hZB/bs?=
 =?us-ascii?Q?8nEB/NGwUbGk+WKkqTx8hgTMypUMs5JKEW4B0/88K6raeWT/95gTnpnlz9TX?=
 =?us-ascii?Q?La2SLVDUeUo7dZQvlE2WklsB1F3XmwZfTDm0voqHovHGkcU1dvZLjt8v6O4X?=
 =?us-ascii?Q?aDYoqCd+1kbJEA5LsUM2cMxY+lQf9BTTGA+5GT4m1ViBksmcVKIbH0c6MUZS?=
 =?us-ascii?Q?goVVa1VOntlnk5xKxweARSzKgK/Mu9ZJHX18ijw58u22Q3NhpxRB8jmpIAai?=
 =?us-ascii?Q?UUWHJc8wvWmltlGiHFXu67odcj1p4CpVqa9yET6LXBAHWupqbl/rdXibAZ+h?=
 =?us-ascii?Q?RD3OAvi0frUfCsjBt7U71tydC+jGn3kRB28D6r8ZSdi0U4q7MD0ek0mysnbz?=
 =?us-ascii?Q?tz7LSjlObPN9ZZdV9csTsoE5KNoOH89E/JYP4KLLL95s6yz0dSmOpm4zL3y4?=
 =?us-ascii?Q?knHXN3hrdm/31bLFx0TAZeeYRgkOp2fk/eV2GrJ4TIUCcJ4+N2cxg2ilI/4r?=
 =?us-ascii?Q?y8RnJQvbkDEMrN7cmxUUzJO7eiFCXe1RgFhkSk4Davf2Zqbp9l0enNePe9X7?=
 =?us-ascii?Q?N8wH2d72NJkf+MiRBDm5WU8A5jGfcQ2gFK9Rxa1hSBJggza8L/s5XtCrZMsA?=
 =?us-ascii?Q?txF/8s87/snhv2BLvxb7xLxVNiym9G7UmP8dKcJAeuvTpTBBWJh7BMjlZC0w?=
 =?us-ascii?Q?DKoJTiSzNYa2juvmplMt3uYNbevIWOvUI+cyvmLkUHsnnJbj1WaV7FcHXzD6?=
 =?us-ascii?Q?GaZtOhgUn1+pZyBSOiV0I4nvohR/zcYNxgencfFCZwy0paKOHK6rn3mp63XM?=
 =?us-ascii?Q?FMPrICzW/Ts+0RZc3vkXBHjoPno8n2xnbN+LRLqs7mO3md2Y0LrxrwhHrBT4?=
 =?us-ascii?Q?ZFEPcJO2t03ZrhjIzE89rWrknNlbv4EZPDSIomJynxVF1AuEJsZjrvu74zP0?=
 =?us-ascii?Q?CeZWp+KXOTxh7E22wR7t0kQRAUFiLqbMCXbI/YVMIRTah8VB+eoONXXLWad/?=
 =?us-ascii?Q?fvxEdsELsMm6hX4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46186b03-d0fc-403a-e879-08dd7666231e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 06:25:20.4159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1699
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

Stefano and Nicola,

> Stefano, Nicola
>=20
>> On Wed, 2 Apr 2025, Nicola Vetrini wrote:
>>> On 2025-03-28 07:43, Kwon, Gihwan wrote:
>>>> Dear Xen Community,
>>>>=20
>>>> I hope this message finds you well.
>>>>=20
>>>> I have heard that there exists a minimal Xen configuration optimized
>>>> for safety-critical products, particularly in automotive applications,
>>>> with the code size reduced to approximately 50k SLOC.
>>>>=20
>>>> Could anyone provide guidance or point me to relevant resources
>>>> regarding this minimal Xen configuration? Any insights or references
>>>> would be greatly appreciated.
>>>>=20
>>>> Thank you in advance for your assistance.
>>>>=20
>>>> Best regards,
>>>> Gihwan Kwon
>>>=20
>>> Hello,
>>>=20
>>> I am part of the team that provides static analysis for Xen, mainly
>>> towards the objective to make Xen compliant with MISRA C guidelines.
>>> As part of that effort, a minimal Xen configuration has been defined
>>> (for Arm and x86_64) at [1], which is the one currently analyzed for
>>> static analysis for each commit [2]. It starts from the default
>>> configuration for the architecture (i.e., make defconfig) and then
>>> turns on or off various Kconfig options, as specified by
>>> EXTRA_XEN_CONFIG.
>>>=20
>>> @Stefano Stabellini (Cc'ed) is the main driving force behind the Xen
>>> certification effort for automotive, therefore he's probably the best
>>> person to approach to get more information on this matter.
>>=20
>> Thanks Nicola. In addition to what Nicola wrote, there is an outstanding
>> activity to further reduce the code size by adding more kconfig options.
>> There are a couple of patch series on the list right now to that effect.
>>=20
>> https://marc.info/?l=3Dxen-devel&m=3D173745442831026
>>=20
>> Last year we ran some experiments and for ARM we should be able to go
>> below 35K LOC. The tools measuring LOC are very imprecise as they do
>> not account for #ifdefs and kconfig options. So we switched to text
>> binary size for measurements as it is more accurate. do not account for
>> kconfig options and #ifdefs. Hence, we switch to using text size as
>> size measurement for Xen. One of the figure was XXX.
>=20
> Thank you for sharing information regarding the current minimal config
> and additional activities. I have reviewed the configuration applied to t=
he
>  CI and have a question.
> Currently, `CONFIG_SCHED_RTDS` is enabled instead of
> `CONFIG_SCHED_CREDIT2` and `CONFIG_SCHED_CREDIT`. Is this because
> ARINC653 scheduler cannot be used as default scheduler, as well as, rt
> scheduler is smaller than credit2 or credit scheduler?

Please disregard my previous message. I have double checked that=20
mentioned configurations are set 'n'. Therefore,  `CONFIG_SCHED_NULL`=20
and  `CONFIG_SCHED_CREDIT2` is being set and used in the minimal xen=20
configuration.

>=20
> - Gihwan
>=20
>

- Gihwan



