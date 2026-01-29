Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GGvL/hre2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050FCB0D43
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216562.1526513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpk-0001Sx-6i; Thu, 29 Jan 2026 14:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216562.1526513; Thu, 29 Jan 2026 14:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpk-0001R9-3b; Thu, 29 Jan 2026 14:17:20 +0000
Received: by outflank-mailman (input) for mailman id 1216562;
 Thu, 29 Jan 2026 14:17:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fLTt=AC=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vlSpi-0000f7-N6
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:17:18 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37103eeb-fd1d-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 15:17:16 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI1PR03MB10078.eurprd03.prod.outlook.com (2603:10a6:800:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 14:16:56 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:16:56 +0000
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
X-Inumbo-ID: 37103eeb-fd1d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLW3hEndAjgRR4mVZBIoBes0v++OpWiPizmO2itTKVlAJJp3nhunok5A8pHoXoOWStz/WEbcHrgNXdnBskJzAhs8MoLkT8BdJedXIOuYMJrady8rK+UAwE6jx3GRhRdGdmvjBd+FVfBR7GjMWgfYVNEjhPwFd7zsW4rMCbO+vyo8I1+fpaLBrmLgbk2Y/Tzuqm5onEoTFni87MXXmrzOWLckQAm1InxkZiZZp0NflVv7XxYfqUOBJ/k3nEUmdEiYl4rcAsUdYftOlDTTeIpKpO9T7+LnrDlV4i8lEMPmtSJBUAxMwLO4kN0xkAbZUYFnJL39N1oXBfEFNubuQYlGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocv5dp9bHKEMUmwI+O1ki9LavAsE9xhcL6nc5aUA6FQ=;
 b=gSIKA0qho2XYg4LFvJpAU/wob42tF94JZqm++wNoAJZrEncjcFNPs2ROA7buy+2SlpEegDXwvQQlcw7X8n0AIRfCGSmP3vpMr8TR4MHcAIq/xVWgCDvyWlorfVax7uc9bInpelXGInnMImsCKPl0J1rWA7jLaPCIwBW1ymNVPMTnt84IFiV2yrPAkqMDv4CYUZwj3cmXp6lapN0wCfOaIwAicVd1M4+7YNtzXGRDrr09/bsQQgUASkH1O0I9LiEQ3gpG/F/j2cYfbmRiQhp7fCeenfYxJI3WHJF3Bd9r8/HFeMY/bBOL/3v1VdiaVFpMjXh3+vsy51/9EVV3xqx8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocv5dp9bHKEMUmwI+O1ki9LavAsE9xhcL6nc5aUA6FQ=;
 b=VkMBxUT+U5B8vLgzFkjwkRsvj5ROKLC0XrqFaQrzwtI0IDfNDEifY99l8wUz4tOGFD8SY+U4de1c0YgfJkKXn/6BNHF4RVEx4fx87hI2Rlf+i0S1xa3Uo3oxL5yBtYekG7ZRdA91BDjWRvDW3hE7Bzmg24bqea1vzNjcvywzJOgYZp1oI1edm59Ev3adD2ECo4I9UfeLoX6lc14BKge7WxrC13XFlGI/jaWk9tAwa6dXxwSh90ftBMf6CiPZu+fP/JQD0QAAkAIMenu+YlEVnyhgCBqE9PNPqmyL+c3kJX5AWcnXOSMZFxMQ708htlm5U5+4+TNoshUwRU5G4p57Ow==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v9 5/5] docs: arm: add SCI SCMI SMC multi-agent driver docs
Thread-Topic: [PATCH v9 5/5] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHckSnsbahe07agPEOZ4RxpOySFFg==
Date: Thu, 29 Jan 2026 14:16:55 +0000
Message-ID:
 <9a95d21c212013b8e76f20a0248e94108512c94f.1769696107.git.oleksii_moisieiev@epam.com>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1769696107.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI1PR03MB10078:EE_
x-ms-office365-filtering-correlation-id: 818f935b-38e4-43df-4689-08de5f410ed6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JbUxKZwSdrnFkpQN1HIVAM3ll1/tPYzKvzS3A3gpuoix6upvZa32/PISGw?=
 =?iso-8859-1?Q?UtdnNNBBp41bJb/yC6O9SVK0mx2JGZj6uIYQCTWuyK9+sxYizcrqP+owWz?=
 =?iso-8859-1?Q?kBoNZwFjidz/veZIna/y4k7i3U0JByAtPqD4UqNL7cCE4l4B/PSwArYu8e?=
 =?iso-8859-1?Q?YS/fa5h7RDC3WUrpX05755+Am9HMDGL8N9a2JUkqzHR/uGH037+0Z9RfzV?=
 =?iso-8859-1?Q?cJohOOx51u7jWnqmTkuuLqsCF0iM9sM1vPdVKonlym21+4iJutV4GhT8sv?=
 =?iso-8859-1?Q?oWsfxlE1k24n7RrfBdBzq3DONrKcXZz4BfulPH9sM1PxobO0svfr+ZxlfG?=
 =?iso-8859-1?Q?oDWbh8MzzGAm82JtofzWnb0h7M/E6cGOkYt+hlatKYIKKRG7/qtramjmCQ?=
 =?iso-8859-1?Q?/FHqO2vq9AwcVKMHNCnjtZsCa10IUAXTOVQdCq2fKIOJoR0NGKh03vhkCY?=
 =?iso-8859-1?Q?iGhbQe/1Gr6OQ5nZXhBS6cu+InuYIilh5rkYIUAlcSWwCgxMzSUrFipe70?=
 =?iso-8859-1?Q?sDOt9dEWpWoZ3jP++GXo4tsI539i4tbtMvae8xG9aMxoZAFhyFxm5+eiB9?=
 =?iso-8859-1?Q?LFO6rCyNdR1mkGFQ1fquMO9sOWUPSktRnkViKaVvtUYRjHenKC7KPcGBTM?=
 =?iso-8859-1?Q?XzM2+XJTlcclnc2XsocH8pzZk1f3YxF3wOfc/GQUv5tGrq0KlIXWxl6wCe?=
 =?iso-8859-1?Q?y9uOP4mDOtdA848JjFe3CcRkfnN6v2BT+c8j9DogRDqoBT2stuXZDG2pLT?=
 =?iso-8859-1?Q?0ipbN1n0/7WHsPMzw0UCg1dnzM34NY2l60P6UAuBB2SEVEs+Nl8PiWWBPA?=
 =?iso-8859-1?Q?Nk0lAls8PkorEVHMstA2lrKxdb5NK3Ln0AqVcsMAPa32TI9vwWgVltfiGa?=
 =?iso-8859-1?Q?Xg/KDeqzDzuFVHDY1LMnQaUbW1IMJ8jIwt2vLWD0lqGaWgj0O+gHIDHNrb?=
 =?iso-8859-1?Q?GxTg6GX/VKeWgI7jXGTlBwwOaRCM7DzH1DWoDNJlkM3eeGaoptQtfYS457?=
 =?iso-8859-1?Q?Tk3Lc5qhAwpJW1xiiPbWmLvlSFdYc3Ahy/J8ejuL4rU5dHohrKjYzGOqpZ?=
 =?iso-8859-1?Q?R5iT3F8alsh8o23rC9zIS/lFz2j11C03s3EZJZiYfHCLGTgUQ70AXLc1Lb?=
 =?iso-8859-1?Q?WgpfNNNEmmZOvx1tVVDsNVNs+JB+F0HSr9dVSuKy4rJVKFWRjfSTiIL0ps?=
 =?iso-8859-1?Q?zCAEXt/dt3so+BPR1Aqslr0KgeyJfau2HyQCLObCGAzM74W+OkcL+9PB5b?=
 =?iso-8859-1?Q?Qnzk209Ep1VZvRXX35nTlWiW2FwWH7yQEucHUeB/D14gyD7klDmridGS/Z?=
 =?iso-8859-1?Q?MMULbLXJeZ9zHUErtPq/4s0cg+iNe4klcj7pp5805fcaQ4PFFeTaWsJk86?=
 =?iso-8859-1?Q?K7E6qDXOVbHdYId7KAodGT2bKIlce90pwPfEzC95hjwwykXLilcIRx/7aq?=
 =?iso-8859-1?Q?GB7P7kghfpQ1GUDnAutWr3zYsqNr0waO0h5td7jhn6RDpQ3i4D4TdRQgNx?=
 =?iso-8859-1?Q?fnk4C2zQL8NU4FtmBdIk4gypMlI+zwkyWbOerqnH0XNfrG6fq/iP61KHZn?=
 =?iso-8859-1?Q?ofSI41lh+rh2oeolS+WHdpfVywlHSVWWDTrG6fOcwFPYC+8zl/eoshGCa5?=
 =?iso-8859-1?Q?71bRZ6LaoAX1+M7L7cRpVOsYiNh44NhvHMeBQlxM21IhEkFdexLIO+0h0y?=
 =?iso-8859-1?Q?J/7Rn/afOpFKsAQgWf4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?T5dXy/wb8SLLFoD9HFvbl5UE7VjZQETCnKR5MyxintoKzynRgSzdWMcmkI?=
 =?iso-8859-1?Q?VTGiTpptzMI1LOyBJpx7W1R3PXBIqIR33TbrSLPMvmjN5i5+laqr73YaYe?=
 =?iso-8859-1?Q?qFfetcYSgriJ7mg06R0qi2VlRTYR8lT5pijRXn+EDa6aS9MSYUWLctWYYf?=
 =?iso-8859-1?Q?Jczj0LQ2hZcdlZ51wu5/GW+j+Rk9Kn90ToQOZkvYRfwsCGx0giTY1646Dk?=
 =?iso-8859-1?Q?FgoIyWxmdqq0bYuJWSjBGfvkWu4Ya/jXqNNwynZ6Ec2rMTghqnpTyMGeb6?=
 =?iso-8859-1?Q?4r1RN0v9WEEgkRFcaqVzkif4Ij5phmQ/hzd5ioGv/pgtMsc5r493vLxoge?=
 =?iso-8859-1?Q?koagt6o0jFqlrj/3o6MFnyhFprqK6RamIMlAJvFKGkSWT+apdd9VV5vgYf?=
 =?iso-8859-1?Q?2TXtC4DiAmeHC+lOG9wPjgys9ZnlLFW+57hYLESSF2FWGgobvQtFt005Xs?=
 =?iso-8859-1?Q?aGOs2/PB4st9mQmg7SsQ5pgyebdx67gakXFWU1i8OepmDrxHmB0755fJ3v?=
 =?iso-8859-1?Q?o/6wqWpRJx9zx9czajBMGcsFdkcvCg8TCDvVGtfjLp9CqaWPdDw7v/emKO?=
 =?iso-8859-1?Q?dGMUqA5jyEln+xf4O5MD3LRTtn7ns+B98Sil92L7EKPL82CFENDZyoF96z?=
 =?iso-8859-1?Q?VxnqOFg6DY5402RALSF0eeEb1CbJu+wHtbBdpEAqGIxOD6ajS4RbFUegje?=
 =?iso-8859-1?Q?QaiKfzpin4V6c96iG7UT6gB/nN46yf69uQ1Jsf48ThfrVrMdsNFcJ7zLzK?=
 =?iso-8859-1?Q?/TZ+fn3Y+rai50sKbMVm8DX6DSCgfB5wr+RQCqIZrSPBebY5otcfwf54vo?=
 =?iso-8859-1?Q?nRqCmP7RCYi4wMoQZK+XrE2t0cdE/ms2A6LVFc/QrQLlhs5OhomFLTgpaz?=
 =?iso-8859-1?Q?57779uZzZon9/WR7i3yFG+WtmjnfmCxvG9ZtG2otKTXNGeGtkxEdtwNlV7?=
 =?iso-8859-1?Q?TOxm9uxdFEJtcCYkt1L/aIemzthuh1A935Bu4PM/8sJD0lO6HoQnDVYhq0?=
 =?iso-8859-1?Q?XrlFXZqPy/a7mjc/HzEbBDiMpMbV6baBnhXPvKJcG9eHSLotD5I6qnC+2f?=
 =?iso-8859-1?Q?gIMdllULw7h1odbntcF/2W2WYXNnLHmKgYEY3J0G9Uo0T4QALjBx7R/a+O?=
 =?iso-8859-1?Q?5LLMI1V+X1cV/UgM+N8DNZIJJL1+GCCg5qwmWEFV2c20wovMLS0fOLy3vH?=
 =?iso-8859-1?Q?qYBETwHi8Wuc6KbxENAxwDzfD7xp0yc57I/+DP6Z4aMAvPg+Bjh5q8/iM9?=
 =?iso-8859-1?Q?q9EDQI4D+6p/0CKIX5IUKLrXa4ZcnKXcetK5CkXclGCrD/rUJiGJR40Pn7?=
 =?iso-8859-1?Q?hXcIzKienl5HuzDkVbxYVGQxnNp8iMPb2FvE7hx3zECgUjsbTwLQRlZEKQ?=
 =?iso-8859-1?Q?pEVLXj5VkzPjPulbZawBunpRCGIjkq4GfSIowfcV1K5jXnDHpItx8asnpb?=
 =?iso-8859-1?Q?sdFNWY3SUx674pAz9WjqCALox9YEFmMQMCRfwoJy3kWNwlshLeoryjHgCT?=
 =?iso-8859-1?Q?ps9lbm10e1I6Qbk9Bfg7aFUSnd+uJwaEbmnC7SyFLIBYAuV7vEyZM0Cgph?=
 =?iso-8859-1?Q?dJ7j3YMjtkOzv4nMmQXkPL5Ipkf/cA605EN0jIaAVhG2x/kgYHfNdi2AHP?=
 =?iso-8859-1?Q?WE0KUokwfHvWZD9Wy0xItHAwb23TAk4705/W7z4J5FyvDsYXW50QhidcTk?=
 =?iso-8859-1?Q?yuPcCPdcNvSFgVv1x8fMLfEocZQT3M4y6eJtB+ya1NmOT2TGH4z3IJlCcY?=
 =?iso-8859-1?Q?jVnyITx1gsgAzDZ4jwRjoAyUr8UNYrgZ6rWaXX2pFgZ9oGodcPI8WdTgyL?=
 =?iso-8859-1?Q?GXd7kzLhvJM2D6ss00Lvk5IxpYPsQFY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818f935b-38e4-43df-4689-08de5f410ed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 14:16:55.9029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GEQILK5o/SS7YWSwk1X/LcMlAvfiSyiSn5j9DYXBpQwyMJOFPlKP5zSq0zIkxRol6kF9Ay11F3b81uAyf6I2EwxpC0zfZFi/JnsVtG+WS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid,0.0.0.1:email,47ff0000:email,47ff2000:email,x:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[1.79.181.104:email,0.0.85.241:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 050FCB0D43
X-Rspamd-Action: no action

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add SCI SCMI SMC multi-agent driver documentation.
It includes a detailed description of the SCMI multi-agent driver.
This document explains the driver's functionality, configuration,
and the compilation process. The Xen SCMI multi-agent driver is
designed to provide SCMI access to system resources from different
domains.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

(no changes since v8)

Changes in v8:
- update documentation to match the last DT format
- fixed RST: "... code-block:: dts" -> ".. code-block:: dts"
- update documentation with dom0less configuration example
- update documentation with new param xen,dom0-sci-agent-id
instead of the command line parameter

Changes in v7:
- update documentation in section of the xen_scmi configuration which
is matched by "xen,sci" compatible instead of the direct path.

Changes in v6:
- remove all HVC mentions from the multi-agent doc
- update sci-agent-id parameter description in the documentation
- add missing Sign-of
- minor fixes across the document

Changes in v5:
- rework multi-agent driver to leave Host Device-tree unmodified

 .../arm/firmware/arm-scmi.rst                 | 420 ++++++++++++++++++
 1 file changed, 420 insertions(+)

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
index d9698f4e4b..2497a870f3 100644
--- a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -36,6 +36,8 @@ The below sections describe SCMI support options availabl=
e for Xen.
=20
 | [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
 | [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+| [3] `Generic Domain Access Controllers bindings <https://web.git.kernel.=
org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetr=
ee/bindings/access-controllers/access-controllers.yaml>`_
+
=20
 Simple SCMI over SMC calls forwarding driver (EL3)
 ------------------------------------------------------
@@ -189,3 +191,421 @@ except explicitly enabling SCMI with "arm_sci" xl.cfg=
 option.
     ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
     ->        xen,force-assign-without-iommu;
       };
+
+SCMI SMC multi-agent driver (EL3)
+-------------------------------------
+
+The SCMI SMC multi-agent driver enables support for ARM EL3 Trusted Firmwa=
re-A (TF-A) which
+provides SCMI interface with multi-agent support, as shown below.
+
+::
+
+      +-----------------------------------------+
+      |                                         |
+      | EL3 TF-A SCMI                           |
+      +-------+--+-------+--+-------+--+-------++
+      |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
+      +-----+-+  +---+---+  +--+----+  +---+---+
+    smc-id1 |        |         |           |
+    agent1  |        |         |           |
+      +-----v--------+---------+-----------+----+
+      |              |         |           |    |
+      |              |         |           |    |
+      +--------------+---------+-----------+----+
+             smc-id0 |  smc-id2|    smc-idX|
+             agent0  |  agent2 |    agentX |
+                     |         |           |
+                +----v---+  +--v-----+  +--v-----+
+                |        |  |        |  |        |
+                | Dom0   |  | Dom1   |  | DomX   |
+                |        |  |        |  |        |
+                |        |  |        |  |        |
+                +--------+  +--------+  +--------+
+
+The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared-m=
emory transport
+for every Agent in the system. The SCMI Agent transport channel defined by=
 pair:
+
+- smc-id: SMC function id used for Doorbell
+- shmem: shared memory for messages transfer, **Xen page aligned**.
+  Shared memory is mapped with the following flags: MT_DEVICE_nGnRE and _P=
AGE_DEVICE, indicating that this
+  memory is mapped as device memory.
+
+The following SCMI Agents are expected to be defined by SCMI FW to enable =
SCMI multi-agent functionality
+under Xen:
+
+- Xen management agent: trusted agents that accesses to the Base Protocol =
commands to configure
+  agent specific permissions
+- OSPM VM agents: non-trusted agent, one for each Guest domain which is  a=
llowed direct HW access.
+  At least one OSPM VM agent has to be provided by FW if HW is handled onl=
y by Dom0 or Driver Domain.
+
+The EL3 SCMI FW is expected to implement following Base protocol messages:
+
+- BASE_DISCOVER_AGENT (optional if agent_id was provided)
+- BASE_RESET_AGENT_CONFIGURATION (optional)
+- BASE_SET_DEVICE_PERMISSIONS (optional)
+
+The number of supported SCMI agents and their transport specifications are=
 SCMI FW implementation
+specific.
+
+Compiling with multi-agent support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+To build with the SCMI SMC multi-agent driver support, enable Kconfig opti=
on:
+
+::
+
+    CONFIG_SCMI_SMC_MA
+
+
+Driver functionality
+^^^^^^^^^^^^^^^^^^^^
+
+The SCI SCMI SMC multi-agent driver implements following functionality:
+
+- The driver is initialized from the Xen SCMI container ``xen_scmi_config`=
`
+  under ``/chosen/xen`` (for example ``/chosen/xen/xen_scmi_config/scmi``)=
.
+  Only one SCMI interface is supported. The SCMI configuration must live u=
nder
+  the Xen SCMI container ``xen,sci`` beneath ``/chosen``.
+  The Xen SCMI mediator will bind only to the "arm,scmi-smc" node that is =
a child of
+  this "xen,sci" container; any other "arm,scmi-smc" nodes (for example un=
der
+  "/firmware") are ignored to avoid stealing the host's SCMI OSPM instance=
.
+
+.. code-block:: dts
+
+        scmi_shm_1: sram@47ff1000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+        scmi_xen: scmi {
+          compatible =3D "arm,scmi-smc";
+          arm,smc-id =3D <0x82000003>; <--- Xen management agent smc-id
+          #address-cells =3D < 1>;
+          #size-cells =3D < 0>;
+          #access-controller-cells =3D < 1>;
+          shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
+        };
+
+.. note::
+   This layout keeps the Host DT unchanged for Dom0 and baremetal Linux by
+   using func_id 0x82000002 / shmem 0x47ff0000 for Dom0, while Xen uses a
+   separate privileged channel func_id 0x82000003 / shmem 0x47ff1000. EL3
+   firmware enforces permissions per agent_id, so there is no conflict bet=
ween
+   Dom0 and Xen channels.
+
+- The driver obtains Xen specific SCMI Agent's configuration from the Host=
 DT, probes Agents and
+  builds SCMI Agents list. The Agents configuration is taken from "scmi-se=
condary-agents"
+  property where first item is "arm,smc-id", second - "arm,scmi-shmem" pha=
ndle and third is
+  optional "agent_id":
+
+.. code-block:: dts
+
+    chosen {
+      ranges; <--- set default ranges so address can be translated when pa=
rsing scmi_shm node
+      xen {
+        ranges;
+        xen_scmi_config {
+          compatible =3D "xen,sci";
+          #address-cells =3D <2>;
+          #size-cells =3D <2>;
+          ranges; <--- set default ranges so address can be translated whe=
n parsing scmi_shm node
+          scmi-secondary-agents =3D <
+                        0x82000002 &scmi_shm_0 0
+                        0x82000004 &scmi_shm_2 2
+                        0x82000005 &scmi_shm_3 3
+                        0x82000006 &scmi_shm_4 4>;
+          #scmi-secondary-agents-cells =3D <3>; <--- optional, default 3
+          xen,dom0-sci-agent-id =3D <0>;  /* Dom0 agent ID */
+
+          scmi_shm_0 : sram@47ff0000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+          };
+
+          scmi_shm_2: sram@47ff2000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+          };
+          scmi_shm_3: sram@47ff3000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+          };
+          scmi_shm_4: sram@47ff4000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff4000 0x0 0x1000>;
+          };
+
+          // Xen SCMI management channel
+          scmi_shm_1: sram@47ff1000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+          };
+
+          scmi_xen: scmi {
+              compatible =3D "arm,scmi-smc";
+              arm,smc-id =3D <0x82000003>; <--- Xen management agent smc-i=
d
+              #address-cells =3D < 1>;
+              #size-cells =3D < 0>;
+              #access-controller-cells =3D < 1>;
+              shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
+          };
+        };
+      };
+    };
+
+    /{
+        // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI ena=
bled for it
+        scmi_shm: sram@47ff0000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+        };
+
+        firmware {
+            scmi: scmi {
+                compatible =3D "arm,scmi-smc";
+                arm,smc-id =3D <0x82000002>; <--- Host OSPM agent smc-id
+                #address-cells =3D < 1>;
+                #size-cells =3D < 0>;
+                shmem =3D <&scmi_shm>; <--- Host OSPM agent shmem
+
+                protocol@X{
+                };
+            };
+        };
+    };
+
+  This approach allows defining multiple SCMI Agents by adding Xen-specifi=
c properties under
+  the ``/chosen`` node to the Host Device Tree, leaving the main part unch=
anged. The Host DT
+  SCMI channel will be passed to Dom0.
+
+  The Xen management agent is described as a ``scmi_xen`` node under the `=
`xen,sci`` compatible node,
+  which is used by Xen to control other SCMI Agents in the system.
+
+  All secondary agents' configurations are provided in the ``scmi-secondar=
y-agents`` property with
+  an optional ``agent_id`` field.
+
+  The ``agent_id`` from the ``scmi-secondary-agents`` property is used to =
identify the agent in the
+  system and can be omitted by setting ``#scmi-secondary-agents-cells =3D =
<2>``, so the Secondary
+  Agents configuration will look like this:
+
+.. code-block:: dts
+
+    chosen {
+      xen {
+        xen_scmi_config {
+          compatible =3D "xen,sci";
+          scmi-secondary-agents =3D <
+                        0x82000002 &scmi_shm_0
+                        0x82000004 &scmi_shm_2
+                        0x82000005 &scmi_shm_3
+                        0x82000006 &scmi_shm_4>;
+          #scmi-secondary-agents-cells =3D <2>;
+        };
+      };
+    }
+
+  In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to disc=
over the ``agent_id``
+  for each secondary agent. Providing the ``agent_id`` in the ``scmi-secon=
dary-agents`` property
+  allows skipping the discovery call, which is useful when the secondary a=
gent's shared memory is
+  not accessible by Xen or when boot time is important because it allows s=
kipping the agent
+  discovery procedure.
+
+.. note::
+
+    Note that Xen is the only one entry in the system which need to know a=
bout SCMI multi-agent support.
+
+- The driver implements the SCI subsystem interface required for configuri=
ng and enabling SCMI
+  functionality for Dom0/hwdom and Guest domains. To enable SCMI functiona=
lity for guest domain
+  it has to be configured with unique supported SCMI Agent_id and use corr=
esponding SCMI SMC
+  shared-memory transport ``[smc-id, shmem]`` defined for this SCMI Agent_=
id.
+
+- Once Xen domain is configured it can communicate with EL3 SCMI FW:
+
+  - zero-copy, the guest domain puts/gets SCMI message in/from shmem;
+  - the guest triggers SMC exception with agent "smc-id" (doorbell);
+  - the Xen driver catches exception, do checks and synchronously forwards=
 it to EL3 FW.
+
+- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen manag=
ement agent channel on
+  domain destroy event. This allows to reset resources used by domain and =
so implement use-case
+  like domain reboot.
+
+
+Configure SCMI for Dom0
+^^^^^^^^^^^^^^^^^^^^^^^
+Set the Dom0 SCMI agent ID in the device tree using the Xen SCMI container=
 under ``/chosen``.
+Add ``xen,dom0-sci-agent-id`` to the ``xen,sci`` node. If the property is =
absent, SCMI stays
+disabled for Dom0 and the SCMI nodes are removed from Dom0 DT.
+
+.. code-block:: dts
+
+  chosen {
+    xen {
+      ranges;
+      xen_scmi_config {
+        compatible =3D "xen,sci";
+        xen,dom0-sci-agent-id =3D <0>;  /* Dom0 agent ID */
+        /* scmi-secondary-agents and scmi_xen as shown above */
+      };
+    };
+  };
+
+Xen utilizes the Host DT ``/firmware/scmi`` node to configure the Dom0 SCM=
I agent, leaving the
+rest of the Host DT unchanged except for the Xen-specific properties under=
 ``/chosen``. If the
+``/firmware/scmi`` node is missing or disabled, the Dom0 SCMI agent will n=
ot be configured.
+
+.. note::
+
+  The ``xen,dom0-sci-agent-id`` value must match the ``func_id`` and ``shm=
em`` pairing provided by
+  the EL3 firmware for Dom0 (for example in the ``/firmware/scmi`` node).
+
+Configure SCMI for for guest domain with toolstack
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem" which shou=
ld correspond
+  assigned "agent_id" for the domain, for example:
+
+::
+
+    iomem =3D [
+        "47ff2,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example.
+  The "arm,smc-id" should correspond assigned agent_id for the domain:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    arm,smc-id =3D <0x82000004>;  <--- smc-id for agent_id=
=3D2
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+**Device specific access control**
+
+The XEN SCMI SMC multi-agent driver performs "access-controller" provider =
function in case
+EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and p=
rovides the
+BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agent=
s have access to.
+The Host DT SCMI node should have "#access-controller-cells=3D<1>" propert=
y and DT devices should
+be bound to the SCMI node using Access Controllers bindings [3].
+
+For example:
+
+.. code-block:: dts
+
+    &i2c1 {
+            access-controllers =3D <&scmi 0>;
+    };
+
+Use domain's xl.cfg file **"dtdev"** property to assign SCMI devices from =
toolstack to the guest:
+
+::
+
+    dtdev =3D [
+        "/soc/i2c@e6508000",
+    ]
+
+.. note::
+
+    xl.cfg:"dtdev" need contain all nodes which are under SCMI management =
(not only those which are
+    behind IOMMU) and passed-through to the guest domain.
+
+Configure SCMI for predefined domains (dom0less)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* add "xen,sci_type" and "xen,sci-agent-id" properties for required DomU (=
"xen,domain") node
+
+::
+
+    xen,sci_type=3D"scmi_smc_multiagent"
+    xen,sci-agent-id=3D2
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above (toolstack case) and
+  enable access to the "arm,scmi-shmem" according to the dom0less document=
ation. For example:
+
+.. code-block:: dts
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
+
+* For SCMI device access control configure pass-through devices in the gue=
st partial DT according to
+  the dom0less documentation and ensure that devices SCMI management has "=
xen,path" property set:
+
+Example (dom0less, multi-agent):
+
+.. code-block:: dts
+
+  chosen {
+    xen {
+      ranges;
+      xen_scmi_config {
+        compatible =3D "xen,sci";
+        #address-cells =3D <2>;
+        #size-cells =3D <2>;
+        ranges;
+
+        /* Xen management channel shared memory */
+        scmi_shm_1: sram@47ff1000 {
+          compatible =3D "arm,scmi-shmem";
+          reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+
+        scmi_shm_domu: sram@47ff2000 {
+          compatible =3D "arm,scmi-shmem";
+          reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+        };
+
+        scmi-secondary-agents =3D <
+          0x82000004 &scmi_shm_domu 2>;
+        #scmi-secondary-agents-cells =3D <3>;
+
+        scmi_xen: scmi {
+          compatible =3D "arm,scmi-smc";
+          arm,smc-id =3D <0x82000003>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          #access-controller-cells =3D <1>;
+          shmem =3D <&scmi_shm_1>;
+        };
+      };
+    };
+
+    xen,domain@1 {
+      compatible =3D "xen,domain";
+      xen,sci_type =3D "scmi_smc_multiagent";
+      xen,sci-agent-id =3D <2>;
+      /* other domain properties here */
+    };
+  };
+
+.. code-block:: dts
+
+		i2c@e6508000 {
+            ...
+			reg =3D <0x00 0xe6508000 0x00 0x1000>;
+    ->        xen,path =3D "/soc/i2c@e6508000"
+    ->        xen,reg =3D <0x0 0xe6508000 0x0 0x1000 0x0 0xe6508000>;
+    ->        xen,force-assign-without-iommu;
+        };
--=20
2.34.1

