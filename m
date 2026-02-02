Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bedMGX3NgGkfBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09066CEC51
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218794.1527685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZZ-0001SY-FZ; Mon, 02 Feb 2026 16:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218794.1527685; Mon, 02 Feb 2026 16:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZZ-0001Pv-5k; Mon, 02 Feb 2026 16:14:45 +0000
Received: by outflank-mailman (input) for mailman id 1218794;
 Mon, 02 Feb 2026 16:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZY-0000fY-1Q
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:44 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4771892a-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:41 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:39 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:38 +0000
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
X-Inumbo-ID: 4771892a-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkfBReS2bO5x3YjBb8sJouEd1H704fJBtv5NyxTt2Ww060GltEgRw55PHzKcF8N9UQbonQGcuWmEkw5XpWizgEnTvU3ofdLNEdIADWnQtteat9Rjx2NO9xm/ZPdCIz77FDZauJCzJtfMvYb3hSAHSMMu1csAdiZh56wQW0nT3w4u57rpSBLipOKKu47RYbQGbPifSycKVHQkHfi03bWJCXZRoaAQo4bVbbHlnX1Juvyh++cEPAuJhKC9b2etqVhLVRRmnE/mu+DpukF4O1tLdOfBGJsiiNHphx56BRhnMUmWEwADph/1PubS+sXcqpvF7seufbSGxqzcOZnzUbwRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUeEU3bbSuS4RygDqfWI+sk2Oq51A0Lc+fee+eE/fIY=;
 b=PkTG8pYtHmP6qCNyre2QrVBU/6IpjFc3Hy6xGBdRqqfH/OhNKxTAQ9bK3xUeGQmuliDvXH1Lf9OHfT4LUY4ImJkmOvqbbeVlIQ5iQ++vzihuC/JMo7sFvJRWyUwHOc1Jv4WOiRg8EdmVsec3OLN4/lDODgGUZXgAYhlLJM9DgTXTweK9mEyuboCWx0qFI2Ur7X9+YHApuhF2Jwi8I/UYM5TyUTua8juc7OxRG+JVYZ4wN0hxLCXgQGJNE4SEDz4RQ4pnmf3Y+T50somjdP7CPpsZQnao6gesWmG417wPR8bFWGvDDuBp8mkqt0jlY9GXBnsjjMuM2Yj3qkq0kInV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUeEU3bbSuS4RygDqfWI+sk2Oq51A0Lc+fee+eE/fIY=;
 b=uKpIUWCnr/IfnfmQEzCBCtGFlQhGa2xZeyxI1tqC4pytFkQ3kJW6AlT9qNWC7m48ZyNkFsB3qFB2Y9LbdmTk7AD5R7aGkGam3IpPrVm+gO8q9lO1pIm5MEE+ZK9BzAV0jHIjPTHFD0Zjuakz6uNPMcVSr/GCidJU0a585116uxOkLc+jgw4RYDCTZCdHd0TeE/bRkyll6W5nI8Vl5tKDZXsBFb4NJYnqVZrDcrfG2lXWBJSM2ffHVk8VVsH/+IbQWzYaHnrPcOnhEkSYeVEZIHn71rYFneB0cgrXwGpfIsOTSffmHjuIh1Udekg/LValc3FRUwEil0kcf0clt0X1sA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 04/19] arm/its: Add vlpi configuration
Thread-Topic: [RFC PATCH 04/19] arm/its: Add vlpi configuration
Thread-Index: AQHclF8He0hTGFqEmEaW888dgnQDnw==
Date: Mon, 2 Feb 2026 16:14:38 +0000
Message-ID:
 <76de7174202e96fb907bb2ce1a874063ed9f393e.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11643:EE_
x-ms-office365-filtering-correlation-id: 48df5614-b3bf-4b5f-7b3e-08de62762a5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DmRWj+mJyXm1gk+vyXNtGCVIwj+6Y963FfLUaxxuKVe1alH2DZ3qhNqbO4?=
 =?iso-8859-1?Q?BbVyV2mZuGuFdiDELshJ7LfGzZJJETKv70yD4UjAp//PREe07rVZ4A1skI?=
 =?iso-8859-1?Q?RJ0yfvOo/JF4LNaCRgYuD4uXYYochWn0YTzrUc6YSxx3EMFrxKtonGHUj9?=
 =?iso-8859-1?Q?5nonVfwViNV174CMjCBTMhKxM9k0bGtMk27f1V1x6wSVbmAemHAiatzG8w?=
 =?iso-8859-1?Q?O3jzX58Fj3qDRMSyRhdKYEoYHk458nQp5WrK71rVShJ764pZ5kdfSYEEO5?=
 =?iso-8859-1?Q?tdPGJVuni48IyBNaxTsLiMPLL7GLgUn5BxSn2iAq0ncbpkhVJUjxXw/gZw?=
 =?iso-8859-1?Q?fy2rSerxzjIZpsJyn2IimkYLHqfuA38LDacGB/xvVqywgQn1oHHQF1zwiM?=
 =?iso-8859-1?Q?FbV1kMXNidIPt724PJWik91UPECzrFGXp74SCSDsGBJBPlF8wGIH8dkvJb?=
 =?iso-8859-1?Q?J4rlHuLJT9RdS+d/68bX4ZiB7hAksnZ6i9gG3uELJUJGWvvKaWe/+Q7cG8?=
 =?iso-8859-1?Q?y/nkPLos77FlnEg9JzRlMink6ElDEWzrT3g3/um1Ec6Aph4v8HV/SPEdvR?=
 =?iso-8859-1?Q?NbC6zIS8HqdMhQKFHRgCIeKbBQ+5WMwrarqv3VMC67wBBdBYWWZPd0FEFf?=
 =?iso-8859-1?Q?uD70eXbGowUbYKTnzlIq73SdMSbp4Os1z9W4zOokJ/PFqkl33GzaGPUOkn?=
 =?iso-8859-1?Q?YJwumvKTv/xpKEM7sXWbFH6JAQoxjHC391oq+1E6kt2v/QMV8VrOQjLt44?=
 =?iso-8859-1?Q?H8moUZk4aD0u726DmFghf+oXQBt3ZUELi7s0QOhZ+0cu5KqV+JimKt7Z21?=
 =?iso-8859-1?Q?nBa+/K411b1R2TklJXR/+M6/aRFYSii4vf64mFDGglq8GsNOO54OmebWeX?=
 =?iso-8859-1?Q?1SHHt5SaMMfLAYgb9Jk+Sy0TBKuthPBeZWM32tYgvxGNYhZzBM7gJw1KjE?=
 =?iso-8859-1?Q?sVhyl2fw7j7Keyy927ICQCb6A6kSgGwaekaUxkGRMvatie6B+eiaNfWoD+?=
 =?iso-8859-1?Q?Oc0sKSTz1c2Evc9k2NppV8/mgS4XsiGTuu769koUTZ4Poscy4eGVo9GCxz?=
 =?iso-8859-1?Q?hzqS+Ood82lDdrWwfuC1lvLY0EL6+NAVrelKssSeHFxi79r7IMMNtMEE+0?=
 =?iso-8859-1?Q?TEvXvO6ctwhyw83iM8Mp/bKr/B9y5zR79cLIyUMnbF0L1V7c9FAm+OfTk1?=
 =?iso-8859-1?Q?6CdtcaEiQlXSRXHIk8vGDQnhr1eyQrN3Jhyr1/LyPhyk4/JIn5K23EpFnB?=
 =?iso-8859-1?Q?pEr2c2gkYWS062beHA8Iby16YyCpHauZ3v8XtCbwQSkYSjdAfu0On0ja+M?=
 =?iso-8859-1?Q?wv4h1QJ+YwQgxHYed+pavN0UBAcgBERBj56o+zbBAQhW7mN5CCp8rAvSaG?=
 =?iso-8859-1?Q?QLjUgcB2tc/g0k0jdxTNWBYWxGixFgY/kp/xBgazYXBpTxkFSNpVxaYOOf?=
 =?iso-8859-1?Q?HdQaK0TA8J4KQEZozWC8paxDsJlg4xiQI0vXOty0kN8ZFDP07I1w/wF6EU?=
 =?iso-8859-1?Q?8H5NLj6dENL+DP75r13sjzT6qUQedyVgTyw4/V3oMEe0hIBusMQwOebBwI?=
 =?iso-8859-1?Q?ijm+XC9To44aboGRyPbiDcpYO75kG+FQSJI5yVREU9o6SjZ34NYF05UQT8?=
 =?iso-8859-1?Q?M+i2JchcPTItvj961AwR9lOde9kd1wjt/gxViruFc3FsiDLouFNn6kwLAy?=
 =?iso-8859-1?Q?XgUk46qNZ0Umey90iYg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YZTF/XhXQUb/jIbEBpLZ4Zbcri5Cm99NKWj0Keole+CCu6o5MymyzhskUu?=
 =?iso-8859-1?Q?o3q9Pc4PZL5fCmWX7acFL5Wqyg1AoAEHkgUACBQETehbcM61UWngDBildG?=
 =?iso-8859-1?Q?7yEW+Dow83PC/qOomvevPVYA6oYmPGIuHX9PJ6+CmvTuZHpcDt+Zypxij2?=
 =?iso-8859-1?Q?7fQy4By7LLi0EfsR+UXQY5KC74mLNXRAi5tudYXJEjAHLVG1tlrCzCf2y5?=
 =?iso-8859-1?Q?simhqJN17xvtcLUWs77uPWzB/jLsEkW6qd5T+7WeefjyzfW3KIZij9eOOd?=
 =?iso-8859-1?Q?4uLSCjn1wRdHVbP6os3ENyQGDhX2Bk2cUWVMk2GQvdGZ5iNSBYqV5uizb0?=
 =?iso-8859-1?Q?8oNYskOpuTIxGUJq0JN7Y9dHSMV1+tdegZ4hxB9bFNvvjn7kJvidYJdhjz?=
 =?iso-8859-1?Q?MiUlg9jFX4FN4n4zwi6gZHxT8RmaG1uY0hRx2IwBoMxxJOqY0G+Y8Fcy/+?=
 =?iso-8859-1?Q?ycgUyp3gdp0Z0cwZO4dJUbMpBc2wbFFSG1s4lFoDzamtUmU9/OWgxF4gtS?=
 =?iso-8859-1?Q?RdaaPjLqsO7L4CjG9afTOvsy4jUVfnU/Lko3O2C1hSufGx3f4Ed6yyX9Vq?=
 =?iso-8859-1?Q?3oHRmJ+87bleE0gWA+93BI31BRY4udhRv2DXxurVGUwoP5yoW532F8Xp24?=
 =?iso-8859-1?Q?dpXGYJ5AXPFTmXm/bnlm4AGKMRkW2qtz2/SR7ce9MCphixk/itnQ6bfSJT?=
 =?iso-8859-1?Q?mUQakbnM3wPSkP9ilQRFmKpnAFFT2PzKXM97YqGBwYseqaGp+PzsFJp6i3?=
 =?iso-8859-1?Q?AbzS7hnhxk2FQQQTDtsj++gd+ofbxMWRGOjMZJYsfXpRyC46qal5yv8S0H?=
 =?iso-8859-1?Q?pj4ibeOq18ee27ZVn5qbRVQ/5m2/H2Rf4nqKJ/MowTRQInmVtfenXQ6kaQ?=
 =?iso-8859-1?Q?I61/ME22vaGaW6/zc6h0TCEDZ5+kESd9KtNjMtSGAuvCZaNAcn7h/fqQjN?=
 =?iso-8859-1?Q?gJvASLSuNoUmwgMzu0XxZSEKmrT5mDiZOpNgI+mENdrmgmuoBFpku5D2pq?=
 =?iso-8859-1?Q?k0+6g/6N02bDdUjPypAmZgblOj8pF9tJH1O3AWsJhEsp0ORu5IEjipbDH3?=
 =?iso-8859-1?Q?kP2lR40zpnsxZALwtbI6TVpOekaoukrgoLIupptQGQuonlgT8l+Haosagz?=
 =?iso-8859-1?Q?ri8mBcRphhaa8n9MZY4gHfNkvf6zGmBR4Lb6jxRyl8ZOQPYUz8vcjKvmS4?=
 =?iso-8859-1?Q?GcsQgNRl2X0PKiCvsyXNJZx6d1DySljbQ/HCK2gKykmtN8gFKvpt+X6SHJ?=
 =?iso-8859-1?Q?1F24VsNtXwIFdGA/Ptli0uQLB8wLuS5nHNhPK2u4ff79eDfc28B/uEBv13?=
 =?iso-8859-1?Q?YX4uDbneGl85sGvHeArDPsN6/0h2dcjSHVOTEYiyk8UAdk2562IcIKwW60?=
 =?iso-8859-1?Q?c2Cg118rIxH+REORSdf0X0/WlqSaXXQB9oESEAsq1yJc3Nh94deVv6z51E?=
 =?iso-8859-1?Q?53K5YtxS+l7wiBSD2KvXduM5PsMWJ8Il8ZvWVAhVErC4oxtM6YWNMAwIs9?=
 =?iso-8859-1?Q?bXn4AlCW1riMAKhjYoEgzlljGVZ9+LYWzaurLopawzdquiCKAPsndEY8lH?=
 =?iso-8859-1?Q?qZjBC3pxWxHRMgm/IxqcHMTFbfWgF8aZRwFCpQf4g2f56zFoNl+HqX0a7j?=
 =?iso-8859-1?Q?v9CUcks7oWzOtWTq+M83mrYRzq/gmSMsY7C79sPDI0yrPSuvcnfgWa+4hu?=
 =?iso-8859-1?Q?MnlusjzNyByTwZrIauO3GFLxZGVagc0AMnz/90i00AXwNXw2CPcwNdFKW3?=
 =?iso-8859-1?Q?psKzuapU7BBsUCwRolkyl62nts78HJ5v30QVTa7ooBbZmzWAo+p5/XWovt?=
 =?iso-8859-1?Q?JABl6dhR7pInCYJ/8h7OtcxAYr3PbeA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48df5614-b3bf-4b5f-7b3e-08de62762a5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:38.9082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYrJ1o6b5X3GGapGp+aJsYzpIjgVgsjSsGfOVltrGr83RUIvHw8FjvMfjXkJRVaea4wInPk+omAQGzwNRlypCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 09066CEC51
X-Rspamd-Action: no action

Add a helper to write LPI configuration entries. Expose lpi_data
structure in the header to be used in said helper.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-lpi.c             | 39 +++++++++++----------------
 xen/arch/arm/include/asm/gic_v3_its.h | 27 +++++++++++++++++++
 2 files changed, 43 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index de5052e5cf..c029d5d7a4 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -46,29 +46,7 @@ union host_lpi {
 #define LPI_PROPTABLE_NEEDS_FLUSHING    (1U << 0)
=20
 /* Global state */
-static struct {
-    /* The global LPI property table, shared by all redistributors. */
-    uint8_t *lpi_property;
-    /*
-     * A two-level table to lookup LPIs firing on the host and look up the
-     * VCPU and virtual LPI number to inject into.
-     */
-    union host_lpi **host_lpis;
-    /*
-     * Number of physical LPIs the host supports. This is a property of
-     * the GIC hardware. We depart from the habit of naming these things
-     * "physical" in Xen, as the GICv3/4 spec uses the term "physical LPI"
-     * in a different context to differentiate them from "virtual LPIs".
-     */
-    unsigned long int max_host_lpi_ids;
-    /*
-     * Protects allocation and deallocation of host LPIs and next_free_lpi=
,
-     * but not the actual data stored in the host_lpi entry.
-     */
-    spinlock_t host_lpis_lock;
-    uint32_t next_free_lpi;
-    unsigned int flags;
-} lpi_data;
+struct __lpi_data lpi_data;
=20
 struct lpi_redist_data {
     paddr_t             redist_addr;
@@ -492,6 +470,21 @@ static int find_unused_host_lpi(uint32_t start, uint32=
_t *index)
     return -1;
 }
=20
+void lpi_write_config(uint8_t *prop_table, uint32_t lpi, uint8_t clr,
+                      uint8_t set)
+{
+    u8 *cfg;
+
+    cfg =3D prop_table + lpi - LPI_OFFSET;
+    *cfg &=3D ~clr;
+    *cfg |=3D set | LPI_PROP_RES1;
+
+    /* Make the above write visible to the redistributors. */
+    if ( lpi_data.flags & LPI_PROPTABLE_NEEDS_FLUSHING ) {
+        clean_and_invalidate_dcache_va_range(cfg, sizeof(*cfg));
+    }
+}
+
 /*
  * Allocate a block of 32 LPIs on the given host ITS for device "devid",
  * starting with "eventid". Put them into the respective ITT by issuing a
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index aa54e9a364..9f0ea9ccb1 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -157,6 +157,31 @@ int gicv3_its_setup_collection(unsigned int cpu);
=20
 #ifdef CONFIG_HAS_ITS
=20
+struct __lpi_data {
+    /* The global LPI property table, shared by all redistributors. */
+    uint8_t *lpi_property;
+    /*
+     * A two-level table to lookup LPIs firing on the host and look up the
+     * VCPU and virtual LPI number to inject into.
+     */
+    union host_lpi **host_lpis;
+    /*
+     * Number of physical LPIs the host supports. This is a property of
+     * the GIC hardware. We depart from the habit of naming these things
+     * "physical" in Xen, as the GICv3/4 spec uses the term "physical LPI"
+     * in a different context to differentiate them from "virtual LPIs".
+     */
+    unsigned long int max_host_lpi_ids;
+    /*
+     * Protects allocation and deallocation of host LPIs and next_free_lpi=
,
+     * but not the actual data stored in the host_lpi entry.
+     */
+    spinlock_t host_lpis_lock;
+    uint32_t next_free_lpi;
+    unsigned int flags;
+};
+extern struct __lpi_data lpi_data;
+
 extern struct list_head host_its_list;
=20
 int its_send_cmd_inv(struct host_its *its, uint32_t deviceid, uint32_t eve=
ntid);
@@ -223,6 +248,8 @@ struct pending_irq *gicv3_assign_guest_event(struct dom=
ain *d,
                                              uint32_t virt_lpi);
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
+void lpi_write_config(uint8_t *prop_table, uint32_t lpi, uint8_t clr,
+                      uint8_t set);
 int its_send_command(struct host_its *hw_its, const void *its_cmd);
=20
 struct its_device *get_its_device(struct domain *d, paddr_t vdoorbell,
--=20
2.51.2

