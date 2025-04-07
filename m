Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFB3A7D44B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 08:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939168.1339368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1g6o-0000Ox-Oc; Mon, 07 Apr 2025 06:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939168.1339368; Mon, 07 Apr 2025 06:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1g6o-0000NY-Hs; Mon, 07 Apr 2025 06:37:26 +0000
Received: by outflank-mailman (input) for mailman id 939168;
 Mon, 07 Apr 2025 06:37:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OFM1=WZ=boeing.com=gihwan.kwon@srs-se1.protection.inumbo.net>)
 id 1u1g6n-0000NS-OY
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 06:37:26 +0000
Received: from ewa-mbsout-02.mbs.boeing.net (ewa-mbsout-02.mbs.boeing.net
 [130.76.20.195]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c12f12f3-137a-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 08:37:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 5376bHgw039837; Sun, 6 Apr 2025 23:37:18 -0700
Received: from XCH16-04-05.nos.boeing.com (xch16-04-05.nos.boeing.com
 [137.137.111.20])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 5376bD25039813
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 6 Apr 2025 23:37:13 -0700
Received: from XCH16-04-02.nos.boeing.com (137.137.111.17) by
 XCH16-04-05.nos.boeing.com (137.137.111.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 23:37:12 -0700
Received: from XCH19-EDGE-Q01.nos.boeing.com (130.76.23.13) by
 XCH16-04-02.nos.boeing.com (137.137.111.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Sun, 6 Apr 2025 23:37:12 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.180)
 by boeing.com (130.76.23.13) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 6 Apr
 2025 23:37:11 -0700
Received: from SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:198::5)
 by PH3P110MB2072.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Mon, 7 Apr
 2025 06:37:09 +0000
Received: from SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e652:58c7:c916:3735]) by SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e652:58c7:c916:3735%5]) with mapi id 15.20.8583.043; Mon, 7 Apr 2025
 06:37:09 +0000
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
X-Inumbo-ID: c12f12f3-137a-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1744007838;
	bh=D0LxvK9aqZ+NAQzIQmU8t2yZ6PkChepAB6P4JhqjNwc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PZ75FW5VnYa5IoKsIPkMQInu1kgKIRD9/134+q0vkWJAPieyssQjouL/0BPW62J0N
	 g71jnrFTsLlL9Z22Gyr1XqCZHQ3CCjWkXwHi0N2WkJsUDk5RVxIeqE02y/BFl8lbrT
	 vP5qCerf7fxfMgtl/rCtJcFdAmhsc8TWs470S9t2n+lPU6+CgNwCzNSqxR/00RE/fW
	 Avq+4hNQo28iOeGgJoGE5Rp7Od7f7MlOeGFHoF5cL1eo8QEBS9rt/0mhnlHeS6HZZs
	 pG9q8PLk+mrBADRbhKZh3qaUXnkvgUKnPeauk2biWcTKy81wUQ3Wh8ah+FzS5FWpRr
	 nvMaT01Bnd5Xw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=gg8JfXrgbLh7qgLWTdWE4j1gd17yLdZewg+sledJeVcR7wEvTNa4QziDlysVm3U/GvebEpBVwfMXaZ3mWS9dZpb6lQvubhBCcSz7p24mKzLSbihFg3DKXbX1g7Q4CIamr+Utv47nV4sRlw3Xk2LNUB6TstKTrflknqAoy6PCGkgD/AhfjmJaLeO/VGxSkJZP6W0O2axoqpRsgLko1Omq3p8qNzmiXH+l7TpS9ACVhrbRX+96wDCutg7In6vSHNZfHiuuDFfBjxfCpeBfTx7wkGPAim4oFMw5vb7TdUhOqbQa7E7Ik3LnznpkV1Vfo1Bo9BwKKtvUUyVja3B8iNSmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0LxvK9aqZ+NAQzIQmU8t2yZ6PkChepAB6P4JhqjNwc=;
 b=1W3+wy+PMnAikBITZHGxXXHMrN5xOGhO2A6eClIADLkhGj/iYJAmeflrU4KheIgM2lC3tln0ztFs2FhxdTJ/FQKNOMVmR1xRYA1mXEWDmmr77+tLo+v/QXkfzWImS6Cz2DO40Ngg2Fqo+sAiFJUXqUx+lqM8SWgpWyCjaU+0SK1WV07gQKkbOkgSj/e+Cwmp845fw2tUBNfEyHmcwP7AbXFX0niGfbuS48+QlFh1p1FoA4Qjv5+g2vCkSlFtZiZ1c/7rvus0/uHn6urvgBtiwEi8rviGXbhWSY5HS6bIhQbOrVKltVBCgOwjeKX6OKnrUNVR2sDkp1zQkJZATVtdZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0LxvK9aqZ+NAQzIQmU8t2yZ6PkChepAB6P4JhqjNwc=;
 b=Gy2DL3/QbrprfrLbRZiTumiQ9Uip7NNLF3Iht3xSTVRb8dqWumY1Dh5E/CC+ANqLpRENEmUr5Fdv8F2hQYC8wJO9rX5R7o3aK3nRH+43UrMMKDXO0OIKHwwy4YLowlTVzhxGsH5MCapZoUSTRySwF1ionJZ6VQu4conmieMGYW0=
From: "Kwon, Gihwan" <gihwan.kwon@boeing.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Nicola Vetrini
	<nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "stewart.hildebrand@amd.com" <stewart.hildebrand@amd.com>
Subject: Re: [QUESTION] Minimal Xen Configuration
Thread-Topic: [QUESTION] Minimal Xen Configuration
Thread-Index: AQHbp4d8CTfihWvrfUi9wdjpxoA8Ow==
Date: Mon, 7 Apr 2025 06:37:09 +0000
Message-ID: <SA1P110MB2252BBBB6801DBDB88B828BE90AAA@SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM>
References: <PH3P110MB2246A9D7AFA0A73000781B0390A0A@PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM>
 <f4803fc17047a9d74928c66d39bf9632@bugseng.com>
 <alpine.DEB.2.22.394.2504021409170.3098208@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2504021409170.3098208@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2252:EE_|PH3P110MB2072:EE_
x-ms-office365-filtering-correlation-id: e65aff37-8871-4193-b1a7-08dd759e9f7a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?lXgQ4iyP2+YI94LYK4OmGI+sB1R1kwZt97rwN+qThjI3SLd9EgzAUR64sGSO?=
 =?us-ascii?Q?xj2G4jjicHQ0IntjulM/hVyI2FBJBPaLCrLC853CBU+WryjtAPK4ZMN6YHOj?=
 =?us-ascii?Q?g2c4xxtyLt3qgCjGOGXa33sNfYDxR/LpgLXavVY0Fw6Qd9aKW0R0YEBYjz/e?=
 =?us-ascii?Q?ttGYrESCWyGFqvgO6tr9QcCwSX8jCrxPQmNlI722piqEmB9O2OGFEm7GxnKX?=
 =?us-ascii?Q?mGfLpghiszjHWk7vz92LjCyfX7VbZNvv3p3Y0mqaxDLxnMY9lmh6GBZAk4V6?=
 =?us-ascii?Q?/hSMgVq4ABcBuphNfeS4lQoW6OAEI17pgLia5DtuJjNe39ZctTAfnTS1aukL?=
 =?us-ascii?Q?90KmeLoUzIo2yAJea6sH/W3PGvNUMnrX1kMp88dqVGjcgcFpgx9rzAuLy2Qp?=
 =?us-ascii?Q?CGZAnKSPwNQ12ZBfFjEhz0Gqei2t1fCza+fyq8oRzWumXdbERUINl6cMGtwR?=
 =?us-ascii?Q?qXli+zmrNXH0n9v5tPbd/nbLysjcPH12OCyJnWG2H1K54lKCErHwEveus/6/?=
 =?us-ascii?Q?HLJ5XESXKsAp0iWaN8SquOoJPWNW4PighxhRZm3NzQq+mtNT+AlK+2nd4rJZ?=
 =?us-ascii?Q?JpPRf38by0BR/zMaCfVW19ogdm4TWaGGLYFR6oAd9Wl+MIKLQrSW8lDj52Mo?=
 =?us-ascii?Q?EDxcrYjMG9SAVOPqt4Dpz1aXsFqCHtlYOiph8V0OG6zrdGWk7LDms/djz+T4?=
 =?us-ascii?Q?PcIdO7EpMrx+EMqEieEF5KEVKp6BBQtcB/SycLaSB5x5IPmzZQjMV2krx+55?=
 =?us-ascii?Q?NTAandbIMwhYF512YkMGitytU+HTy73lMN5WYbl3SjRVwtXOGGBTHAnEn8gc?=
 =?us-ascii?Q?8HiYu8ZduBlSrKMdX08hVBpqX3K/J/rGJjAiRTWvZBq6Vz6kZBQ/mIs1NxQo?=
 =?us-ascii?Q?Jt8ePlqFT59eq/y6Jqv9fVez9/Ke1yjsQe9U028NuF6CPwLVpJMOXGGrE+IK?=
 =?us-ascii?Q?b8gzjLodt7WjZJdfjc2ttnxvC7Z/y6OC+5bUF2fozwoKHXdhcuwNw6B1irX3?=
 =?us-ascii?Q?LjtB6AN2DRh5034OCoUijIgu+WA3thBuFx1nX9WLzJl5NH++toHbSaOKZq5z?=
 =?us-ascii?Q?F/wKNw1QKgO3TzLVfOhu3TP9pX3t8ml8QG1U8BzQMEhHcVZeouIocubF0PJS?=
 =?us-ascii?Q?hJys3gMzjy8mmgNk8s+/dsuiU5tgrUu9Aq40cCoYPdZEBa6uCgEMVnnDwX+/?=
 =?us-ascii?Q?v+mhuD933cMZFm3z8oq7SZlS+vmS1zN6iggq8g/EcmsXeLlIUKPhDrUGmsGF?=
 =?us-ascii?Q?evY4hDUp0ZFUCae4VBg26i5mhWyT4Ydei6VznAnzh22oY/qFD37Zb//Brt4r?=
 =?us-ascii?Q?Z8Fv7PMnc3wSiQA9QAPIrkEdMwfR7dh58tgZF9eD6GbRIT9EVZ/TrKZXR2FF?=
 =?us-ascii?Q?6jK2oQgdiHGdX9Y9MMbUR/N3dAxCxCHqecUYFX90jm3JeFvbF2TCZgKT/SOo?=
 =?us-ascii?Q?nol9/qLdtr0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cl2UcGA5tPlSb2EKdrwpXD3+W73HyoyWtRp5Xsrq2tquYv7+GTKoQFWycQn6?=
 =?us-ascii?Q?aBoevtDgMmsjRux4FqZiOPsv1q1fEP9slKdzW/V9IBtdpXvaNDhjThXYu0I8?=
 =?us-ascii?Q?+tCOXEVH2dgMpJ97bN1Edx1Q76us/kXzLw/5vqodjRx/0lKs88YEqKbV0lM2?=
 =?us-ascii?Q?8uk4+0hODWb0tbecFgSA9syoHQiIOh6I+UiRR9N3K4ijjrmV0CPvHfNjWKy4?=
 =?us-ascii?Q?lxEq/mb2bFq3SPVM+aAwGJri3kRfQY4mFWjq5oluJ7sIHH0E+Ku3OiGNNJ6y?=
 =?us-ascii?Q?14h1dULoryYht5EaMR/l6w9a0xJlDbSpBrNVKAR/98CDoND9Im77vjSv2YKQ?=
 =?us-ascii?Q?U5ay1PELdNFUtFzVCcWOhAapxWnWLOoOxdZWcc0/7PxXPy7WJS9C1F/Fw9iX?=
 =?us-ascii?Q?f+ReDaCYe1MsyAf85ba+LrGsM8DJMIuZ/uDFK/4R3+mHaI1wFeCrcI7/s+81?=
 =?us-ascii?Q?+Lkq/gVL+K3/dKUxO4ECDSNccngBj2wUItuxUB/9t/O7OJ5W3Ol//MzXlJzk?=
 =?us-ascii?Q?By7BOmgd8tq1gCfI4ZnE0ld6wGoU3hdcdnJjBHu42csG9mhxNnabP2VMQSyt?=
 =?us-ascii?Q?+v8qcSUuW8XUdcgguImTTXNy1TgVRl/Hd3FWMGhh0rY/FlBS2iCAeIpnAHep?=
 =?us-ascii?Q?MTTCpRLaYkfsTgvKBHWb07NKfjeCyJ/JhI3p6puWRXbskAbqwl6Cd1ODbm4B?=
 =?us-ascii?Q?CAO6GwI+6gA4JD/0kBcIoXDMn5Y70zjslWxl9bPX1o07zeFpx3IFm4ETuiWv?=
 =?us-ascii?Q?9JL4eFmOV4mY2zexaLsqODzX67Dp7rbh7995+kuRaqn/79nLX7fTj+Bd4VT0?=
 =?us-ascii?Q?NW6gvFwmD4ciPy5c+ZlEC85MIuHv0mO0dOejLgB5GwD3ctBfm8WCJg9b4u2K?=
 =?us-ascii?Q?RkOv6eetpZRVWQhjecGuGAcFZo7b7CDSAD2Gzh8K0XLa2kDyV3KHeFULkp2K?=
 =?us-ascii?Q?5ZMH6mm31Ek0jwZXxjjihnnCnqETXUODBAL2kol0FQHPkkvTeVE3fSygld38?=
 =?us-ascii?Q?Y78OTte6aaALuQz8kDzLhmoscGIcmvJ4gvVOMZZc5vtwWbUG817DQyX6wX1A?=
 =?us-ascii?Q?2WwLGNX4H3IxrWWU3QTWWuRUTpmgyR2FbgtX3m5nvat/nFRLhaKQaG47XE/b?=
 =?us-ascii?Q?uWNWVrIab12oMPiBfJQBnKosKsVfJkR+4bYzQOp8P/7BmW5aqivmarEBdwbQ?=
 =?us-ascii?Q?NSAeE2PxEPw6Hf7ulmk9jXcSHqYAyZuuPSdXVljC1GX4/AywzcrSqIK0gHZa?=
 =?us-ascii?Q?nis5gPyVKVoiToIlNmDNlTjDGwnbOZ64fH4QXQaJWcCWkrx55KWJw4v2PTpf?=
 =?us-ascii?Q?18pvAW/vsA+0tiygLWNAYTvGDJ6BarHkiR/hw9/QuQlvTLX6XCTAxkX+9byo?=
 =?us-ascii?Q?vCZEaM8DTS/F8tuAVCST8PQ5OncRLFKwM7rdLfcc21eygYBaMuJa/4ZyBCcV?=
 =?us-ascii?Q?DNZZM1P/7jG0+rDNUfVfMIXS6jyr1A+/R72LrAbfi0CDVmoZxOw/jvbtpnq2?=
 =?us-ascii?Q?C8L0FaXSMQuFu2o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2252.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e65aff37-8871-4193-b1a7-08dd759e9f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 06:37:09.7340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB2072
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

Stefano, Nicola

> On Wed, 2 Apr 2025, Nicola Vetrini wrote:
>> On 2025-03-28 07:43, Kwon, Gihwan wrote:
>>> Dear Xen Community,
>>>=20
>>> I hope this message finds you well.
>>>=20
>>> I have heard that there exists a minimal Xen configuration optimized
>>> for safety-critical products, particularly in automotive applications,
>>> with the code size reduced to approximately 50k SLOC.
>>>=20
>>> Could anyone provide guidance or point me to relevant resources
>>> regarding this minimal Xen configuration? Any insights or references
>>> would be greatly appreciated.
>>>=20
>>> Thank you in advance for your assistance.
>>>=20
>>> Best regards,
>>> Gihwan Kwon
>>=20
>> Hello,
>>=20
>> I am part of the team that provides static analysis for Xen, mainly
>> towards the objective to make Xen compliant with MISRA C guidelines. As
>> part of that effort, a minimal Xen configuration has been defined (for
>> Arm and x86_64) at [1], which is the one currently analyzed for static
>> analysis for each commit [2]. It starts from the default configuration
>> for the architecture (i.e., make defconfig) and then turns on or off
>> various Kconfig options, as specified by EXTRA_XEN_CONFIG.
>>=20
>> @Stefano Stabellini (Cc'ed) is the main driving force behind the Xen
>> certification effort for automotive, therefore he's probably the best
>> person to approach to get more information on this matter.
>=20
> Thanks Nicola. In addition to what Nicola wrote, there is an outstanding
> activity to further reduce the code size by adding more kconfig options.
> There are a couple of patch series on the list right now to that effect.
>=20
> https://marc.info/?l=3Dxen-devel&m=3D173745442831026
>=20
> Last year we ran some experiments and for ARM we should be able to go
> below 35K LOC. The tools measuring LOC are very imprecise as they do not
> account for #ifdefs and kconfig options. So we switched to text binary
> size for measurements as it is more accurate. do not account for kconfig
> options and #ifdefs. Hence, we switch to using text size as size
> measurement for Xen. One of the figure was XXX.

Thank you for sharing information regarding the current minimal config
and additional activities. I have reviewed the configuration applied to the
 CI and have a question.
=20
Currently, `CONFIG_SCHED_RTDS` is enabled instead of `CONFIG_SCHED_CREDIT2`
and `CONFIG_SCHED_CREDIT`. Is this because ARINC653 scheduler cannot be
used as default scheduler, as well as, rt scheduler is smaller than=20
credit2 or credit scheduler?

- Gihwan



