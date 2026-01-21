Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LrSGosecWmodQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:44:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876A5B74C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:44:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210166.1522001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vidBf-0000ND-G4; Wed, 21 Jan 2026 18:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210166.1522001; Wed, 21 Jan 2026 18:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vidBf-0000Kw-Au; Wed, 21 Jan 2026 18:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1210166;
 Wed, 21 Jan 2026 18:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t4jW=72=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vidBd-00083G-Mf
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 18:44:13 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d3c95db-f6f9-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 19:44:11 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PAVPR03MB8945.eurprd03.prod.outlook.com (2603:10a6:102:322::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:43:58 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 18:43:58 +0000
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
X-Inumbo-ID: 2d3c95db-f6f9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YG80mM+Mdv8mUw4nz956SA4aFCOSzKSa7DPYjCECZYlMjsnmANghzEtDllhVTF6XVCVta5BTAKB8gFffKlLLGkwQb4Wsb9EAMg746TA18YurxC/MsWl8cAbG507bbDOT54qqgvKvZmrJIw0BmRunWzXBuhMTW1GNzUFUaPbY0P1M0ktgPPw2q6h6jgQvDvX/y0xBkbOKw0JoMQySzB4UMoIYWhf2kUEM6ligZ3lktwjrXElKzTXonM4afaZHEpby5Vp2BxPynOpoAjO8TcbwAlPlzn7m5sXs5Grvz0xluXVMfDmiHqg8uhBRvwrxw7uNXylOxEuyxXAKmah3mqJb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0x5Toi5O1tcXhnydAj6PUK5eC3l3b3k896d9Upmr358=;
 b=YSdpvPtupjM/SpMeZSn1BR57Z+fQQ8x/rLsByeeZ8VmkiZrhsLF7Wi38zt+TGfvI69uzjWWu2sb2/DxuHB1Vu+4MbAmsEZsEYS+O9Ivwcg/FzZj8LDDDmp3obkxPRXOkgxDGQb4G6SLqY7b7Lcjol5ptYviiZumFy9/k/cbXCeubtukTxXeyl2fED3TzAubde3+Mb28448uNL/Pg6WBCJWtoX0uk0fEOW97m1P3avP+goonWmwcdrizA25+bWwkxe7UH+kttCYbDF2/uGVlAB9ht+ZNypz9M2KNGAIQcG7kG51Qw94k0W5bz2tXKq2Pn4IMn8mQiHmDU8MnVcgn+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0x5Toi5O1tcXhnydAj6PUK5eC3l3b3k896d9Upmr358=;
 b=vJhTxr7mEClSahZ6DSHX1Z+IFs85cvyrOo7qgC8jpDgv91L7gowbt2qL7C9diJSL6FpC6z58kJ8XypFESE9U+hyx3zwQMamzSEvrF2vQFMzVmRrNg9TY5elaSp1ABaAVd32u18W1n2DYTookFcJWLLVo//FWNRj048kuB6uOnqHZS5MZf85kxHYz+zltGNwQYIs8CCJbTDVVg5BAeqt8yHCAotWQ31FFYu6SiN3oRyhm59h7nFl+5vYSsU6W7tQXyaCEKb9Pje0HMCFbqE1i2j+lK0JpdF1Z8+41tory2idpHisr4URHytuAjfOei8CyIU5P4Rc2mYcMO8wyYSdJSA==
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
Subject: [PATCH v8 5/5] docs: arm: add SCI SCMI SMC multi-agent driver docs
Thread-Topic: [PATCH v8 5/5] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHciwXlP9Ogh5hL/k+s7e3EDf9c/Q==
Date: Wed, 21 Jan 2026 18:43:56 +0000
Message-ID:
 <18730683fa731383231fbce51dc188a978304ff0.1769020872.git.oleksii_moisieiev@epam.com>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1769020872.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PAVPR03MB8945:EE_
x-ms-office365-filtering-correlation-id: 4548fb3a-79ae-473e-d4d0-08de591d09bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?y3g/nDJZoD9IdknXshYQ0+/FFw5YmKJXj5uqeqizpYdQpHnGCoa6uP+3nR?=
 =?iso-8859-1?Q?aVQd+ZUWrkNk8hzZdOg5O3vhsPUC5K/oNbiV4rHlPGS/J4PgAQbma7kqxg?=
 =?iso-8859-1?Q?Cl7X7+TuVbA7ojWZq+n8mpPbqCRnvwlBKCzg59AOlYMqtYm5+eUh7gJMr2?=
 =?iso-8859-1?Q?86SdpqSEaYXpTlqYPqP7mZBPx+IJUe5js0MyX0zsCJeFQ65i4ExQuuNpC9?=
 =?iso-8859-1?Q?vOb5nilw1k7b3HjooMopQQpfyvJeeWkr+cu4VvBwL7QdRKkKcpBIg7eSJG?=
 =?iso-8859-1?Q?lYWubwFP5/BfTDzfdZA66pEUmmZ1Dp4bdjgWbrUdnZwTCHvhew+dStEO/B?=
 =?iso-8859-1?Q?RMIqK/XBW+spYeItgDmFG8ionrABzlZornCCEM3TXoAeY4kjVuhg6+e4eh?=
 =?iso-8859-1?Q?7CqfjmaxoundhKhvgkCssjhfBA4I1L5Bo1h7Bjw/sjCr9AL4nM6frUlFEg?=
 =?iso-8859-1?Q?GzJTRaqvnzu3cnZQdofQaoW0xqlwDyTN8va0/ReTsNO5L6GO47QsaN3CGB?=
 =?iso-8859-1?Q?abdvCv+a083JyPnVnfB4iv2qgAOnD5s08TIjYL/5pxYgk4QvZgCETM8xv0?=
 =?iso-8859-1?Q?sS7UV5tt+RSiCMj14oExYuCzSlMQclmC21cb0LZbHZ0AU/JoCExf4+R7Sb?=
 =?iso-8859-1?Q?IqEhoLg9KGnPxcZLDVD3QbH58I+Zjq9RRBDSL+AM3c9niRqzF5jJ4yUGAX?=
 =?iso-8859-1?Q?fpzzt1eYUjuoCocQbOvk5aMdy/Rp52aiZs0NqjDvWS/YGpDa6u+kcUMyAQ?=
 =?iso-8859-1?Q?O9Hs2bweJ7rjidop7fCkaQDx0mrAdCRimrJsDZevEvS5Am36lfajBEpyhB?=
 =?iso-8859-1?Q?fOj1RC0P6qKW7l6eq1Ih1q/Wkh7Zuv8qsWZ3jp0t6S9xVfWM5GfH36wGKu?=
 =?iso-8859-1?Q?dkWXzZbmy7OkVekWRM7gLYsGirDMxzJMUGyJiGH40RDxv0vZ5M3MySw+OM?=
 =?iso-8859-1?Q?HRbmezsuZmlGXKWTl9w+0fWfzzNnJeWpB7IGqYxqLO5iJn8ZsWhEfyO9ld?=
 =?iso-8859-1?Q?wRR47nfhmOeZ7DCt/3XcnH0m6kRzAl7NA0kTG7vzF1ZppoSyiNMFTMBwVF?=
 =?iso-8859-1?Q?Yf4NKxoeyna8mJZRfic3mpy7xfIyrc1d13foAKcLJ6KR0XAvX4djMU2vlr?=
 =?iso-8859-1?Q?OliJfDL2yXz6Qdmjcw758DK+VW1Hm06LY9DfVhRyeKQpXC1zrEKZmHSYO5?=
 =?iso-8859-1?Q?uxN69yKCH5MNexHmXKqbsp9Zh5H/BvIPnfmwgfzkCPOR1AMSpuhhFC9YfR?=
 =?iso-8859-1?Q?RlIpbkRrW8a58XttxPpG1L5GrlQ+GmiQTCRpuzb2wYhMv8QLiJ9Q9ha+WT?=
 =?iso-8859-1?Q?+cslwFPJckBzCB13QjWD6NjIbz3efowquVunjW1JyCL+Iuo64wbUGNh8oM?=
 =?iso-8859-1?Q?xnqUOHdg86jxDl+Pjxgu2hCVDXnNTVJcnC2hZ56lVMyd4HgKJG1WCZ9PxC?=
 =?iso-8859-1?Q?ayCLTzkBTHfbCEgbR2lmLuGUGKMYe7AftFzd0tzr1WgNlQjrKfiYdfnr+p?=
 =?iso-8859-1?Q?DdSCwCp9Gya94Z6d7AQ3loctT5PGW1rqnqFpbiE57Pi8vTobClFmOXN5Nw?=
 =?iso-8859-1?Q?qWfpqUSgoQLF8BK+N/lXuJdPERSn+Ag/d65OjucGLM5ylYKV9Rn+AReTAX?=
 =?iso-8859-1?Q?MtaklvRogQCn4kr1nlN6h0zIhQYNlaelQ23hiospxepY6berVNpPkTbyDn?=
 =?iso-8859-1?Q?jdKv1huBRVUsQw1LZpA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OESh/f+GGfO/9CzjGkHGoN1x71px/T2qqpFn2ZPPZaO3NxkdgC5cptI5+B?=
 =?iso-8859-1?Q?fYa9wwb4K9ZrzPkcvha9srTTkmpT4aU17Dh9stjrt+vKbXC/MmE8VkDSr6?=
 =?iso-8859-1?Q?IGalMSsaa4Vm4NJbmN37y/zr5a0FqbLgdCgkvKyRXRUupQ//3cJChGUVzF?=
 =?iso-8859-1?Q?SCu7UiJRIdzF8Aa4L3/S1cS6ud3hlVktgd909AaLBy7/khw84lSWuQcdf1?=
 =?iso-8859-1?Q?S6RmkWM7SazzxsLA0U3WYMMePdyEIyqLMqSZp+D0LkrzllCaY/ExlK8EAJ?=
 =?iso-8859-1?Q?GfTjP+99/ck4OYaYHaLPK1s0bNDL+seX3h1Bu6NHv1PVeDsQ9k13hSfVyQ?=
 =?iso-8859-1?Q?AFrsLXmSFQxFqzj9MExDA/q0G69M4wJPNACWh2otdfOiFcpOrD1vgnY5Xm?=
 =?iso-8859-1?Q?KmGJD7J/y3UK0BhkfX8BECAgcOMV4u17rja/gZw9wbR1Sxe+CoRegM5Uag?=
 =?iso-8859-1?Q?OsFNEsn6Z/trdJE2DXCLW4ojWbhqeYcLLCslKZv/QNFFxZOhHeZ07YFxzt?=
 =?iso-8859-1?Q?EvThN1G2mTnd6pqSQqyaPGRHP6CUCeAC18/Xmysq/Z+BkZPNnIWI+1W7DT?=
 =?iso-8859-1?Q?jvBwFv2L8OSVHGef/31UeTTptP7z5/LPUzIbnLgkK3opo8A2kMbb5dT4iD?=
 =?iso-8859-1?Q?iRa6AJDESDsx0e5/0J67nYyo1FRSs51pSQT8YM+jz1IF2gi0eJL65rI22U?=
 =?iso-8859-1?Q?YQDvX8A69mgF19S7pKstQtDJRypAyfxe4iVO13tEg+kDYHjQ49tFvYgNQA?=
 =?iso-8859-1?Q?D0AFu3fzsMqYBxF+kR67dtDf0kf6citS8kk9JqfUIBzd/ayMApRaNFHWWe?=
 =?iso-8859-1?Q?9541vqL6DlqbNX7LR1JsSh60LG3T4UE527CcBRtXwxmHhX1zPM4XINf4Gf?=
 =?iso-8859-1?Q?7AEoYnWQNBzvQbIbpLs8KgHSE4jNEF0cED+Nq7jFcGgMr87YXTNDEke7wI?=
 =?iso-8859-1?Q?TwKuG/Q3+mke8faiU/AxAXBUmKj2Oe7aWiEGYudaKmJU72r/RPd6K2jvCQ?=
 =?iso-8859-1?Q?dPIS1XZ+ixu7JKB4g+ezMjTCqnMc/Gu2FwpvGtyvShPxK412uubcls9XaH?=
 =?iso-8859-1?Q?k3xGpKZLKCFlND5NxPpaqQy2Auvjr1U/nF3bz2IJ47C/x7q/um1n8D8UDf?=
 =?iso-8859-1?Q?fJotfGH19MMCzszbNT9+vEdcsBhEPJwkO7FD397M2H4xvtGWuV4v7c0UQi?=
 =?iso-8859-1?Q?1A0PlTzyXjz2JnwWG021YkkANC8tT9h0vcOib/MkF9DdCboevZEM425O7J?=
 =?iso-8859-1?Q?WNjJ394hkLSiHm5aOrSAk0GsrWGKPi8SCL4b8zQjDMuRyd3l7loW83blca?=
 =?iso-8859-1?Q?TcodZsQvS8QXqPz5NjxhaZ5oipYjOsVeAMGxiJHaB9MJiKpbJKxPXm+Fru?=
 =?iso-8859-1?Q?BwLJOpSj5a5oASW5/ZSbEo6bmhn+wlurLrSDW+7PEbrRRPm2vV7Mc82JYg?=
 =?iso-8859-1?Q?+IVLepcgSM4HAfpz50WZHXyUPfW6hPSEcqgdfoWJp4GEA+rLbc45pWF3cU?=
 =?iso-8859-1?Q?XXthsonyY4iS6irPhceHXavyq/9pm5yEMYiBMBXtngYUBsaN+WQCiAD29P?=
 =?iso-8859-1?Q?PC41y4NXrZUOGzMJ4B5ofPlpMISXVs231QQdJHyA0VJDx6m0E8vIV6S9QT?=
 =?iso-8859-1?Q?A1bI4Dy7ExKLllPXJum+T7xcmQmmj3K1kpzqdvyXWbTcz8nQvD9P7M+cdE?=
 =?iso-8859-1?Q?OIDtt4ySgU0aD1PrRNsfb21bJzC+SlWvD1WqEm+nNjOSWEbtlgvjwMFvMV?=
 =?iso-8859-1?Q?KRpI5/PIGKmAWdRZ5oBjKXOcGLvqQtF6vwZ419N06vo5Jjd8KNFXTdc7pw?=
 =?iso-8859-1?Q?Yr/hi2YAyktw0jKZEqlgSXK+dQqLlaQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4548fb3a-79ae-473e-d4d0-08de591d09bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 18:43:56.3160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1YOPCModIIRfBGlT+9b09ucyVgXLK027+G3zvae6o94Ty0TFC3Mey+sNYeqef9q/xYE8aJE+1wRb1dGPt25TE6HNkogOcc4IvsPayzvAs0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8945
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9876A5B74C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

