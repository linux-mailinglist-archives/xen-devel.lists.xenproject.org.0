Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F68A9D653A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 22:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842001.1257456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEasP-000706-MA; Fri, 22 Nov 2024 21:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842001.1257456; Fri, 22 Nov 2024 21:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEasP-0006xJ-Iy; Fri, 22 Nov 2024 21:07:41 +0000
Received: by outflank-mailman (input) for mailman id 842001;
 Fri, 22 Nov 2024 21:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tm/o=SR=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tEasN-0006xA-MN
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 21:07:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f403:2614::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbf583f7-a915-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 22:07:35 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB9738.eurprd03.prod.outlook.com
 (2603:10a6:102:2ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 22 Nov
 2024 21:07:29 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 21:07:29 +0000
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
X-Inumbo-ID: cbf583f7-a915-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjI0IiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImNiZjU4M2Y3LWE5MTUtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzA5NjU1LjgyODIzNiwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkP2TPxSWigLeV6ImjKyUswMrA88KogGfDnUdcKvcTU0aE0gp81+LjLZQuwJ0AEMIdP1zlR9l8XCx16q+W1ApGRL0cEunxSQ8kZjQWWZ/kJe5HU+PTq+pjzok2ly2a9/sVMQg6ZJ7Nex061uo7di3vNhjk1wwLzA1wQqmqs8N86ZPGYrL5A3bclQN60fo//e7GXyTElFs1a1LGp5ewJvc5+G2DN8ZK+2hq9n8VWT/CcG23v4K2P7bceXf488K7xc7Wz2KxLlhPF2+vtM0knYfbgIpYWd0JhvNR5AsUuNZONjbBuRCS15Dt2Ec6NEZoseEmfDPWfK0L94aTbc+p+UiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMx/mwcK5hU6KcgFvnAc6iQo9AVCd9WSH/e8jGDjjvY=;
 b=mUpXtnfBajurR1r/njEq70+wdI8R8qNx2GeVWePeZHGVFrVzpWZVIv6Qh0FwBdJz6saU0DMNHqFZNPhWPXxHhLzRrpZBBI45Mk+HD5Z8ZxhiQQVOWc/whDbl0uHzwAoQadFVnpIrpWsLwcxHnrOEqsDXRpOWAT5/mxwLjh+YtOYoj0MIuVsUPrmb1u8fhhe5FrDXD9f6nj7rW3jHtBAcDM2ttyQN6e3K7omHC9R2Yk+fIY/sJt9KvqZnEZSyrE618KpW3yNCCTe9qesJvJxpOxbI2bdXgiChv52gQQnGCQMnGm7s6CU0Qd3gOLm4H+WqOUFndtxbE5k7hNjlkBAGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMx/mwcK5hU6KcgFvnAc6iQo9AVCd9WSH/e8jGDjjvY=;
 b=YEAeyDfcbp3NPA6vY7nNj94lu2mxujGT3Uapzew0x9vVkjjlaY/X6ki5Uo1Roy8cHJS+7jzcYjxn9KHPuOnF6+sgcPDo+/dOuzcA6qZ/CONsQDe9EBZLzxlTuLtJ/ItLto0zFJ2e8Dw6/14hNqIKrSgWVntbzxqCK4w2F2TLAX7tyS443jn+ZPA6j2yTxJJDRBhkqN0ADWnYv4HmcDjDzFLSlUn4MdYpJ3GFnpXXKr0TU2H2PCXSY4q+XDsEZG+qPuNQVUD29oZh+Alus8zSZZRr5gXF/gelRQRDYUOffRot3L0F0ewGvUwj8rzQQC+8i1URr51Z/HNJ4YfE0fgEBQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/3] Add stack protector
Thread-Topic: [PATCH 0/3] Add stack protector
Thread-Index: AQHbPSKJvmf4+DJbxEu3vjqcFnhN7Q==
Date: Fri, 22 Nov 2024 21:07:29 +0000
Message-ID: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB9738:EE_
x-ms-office365-filtering-correlation-id: 0ea95a58-1046-4d54-20ce-08dd0b39ac7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?TRHphPECUlSe/aaEWzduhgqDpQNY4ntR5bMWhpzeFTDV7JYEvzYU7Q9gu5?=
 =?iso-8859-1?Q?VAWDxogDnN7yscfQLtZa5CLhVkBQthrnOidCSmpGMnHQ1mZkGeK2Bn0qH4?=
 =?iso-8859-1?Q?PkVLF0v/u+ToHIRf9uBFt8nQwCqWWWsy30Imy5mG8dMvXJLE6UDhgD6V96?=
 =?iso-8859-1?Q?THwPPFR868pc7tX2eVTJsuCLw2XIiKoEJ3BOX6RQe3QCzai5oI/MTkOMps?=
 =?iso-8859-1?Q?Q0jtcS7MjrBGad+pmjsjtn0lHVQYvRqi/Z3BXRMhHUOSfSBlVQO1sM2ETB?=
 =?iso-8859-1?Q?KcDSSSsLlUAcq2BgeEStholhXxvokQBcXLO7a13mIVv8GWkbH4pQsRBhHu?=
 =?iso-8859-1?Q?ub6Fff4sOh7kC7nbA52gh3UhBUswTCtNT9ZrEu6QdP8qJEH2wm1XNW+sZF?=
 =?iso-8859-1?Q?FtaDcp5/WaT0efaTnX6cRZH0Ad1kUerBcRCdr6rJMbWQLFo9CuJlHu6mjL?=
 =?iso-8859-1?Q?83jyu2XKOZTNvWqa0wxcmW8h5N1m+qOOhPsTc+ASa6PT+LPzeEAoCXRMcq?=
 =?iso-8859-1?Q?q9Keiu/JKYhv1NcYgcmmsg/NtIVc+F7bEPX3zhbIqx0wiE42g7wb8lb+x+?=
 =?iso-8859-1?Q?stdEc+BJ1tV0PBuO8qjhFuHuRjeT40C6NjWtNGhKUZ/qyhkMcNhLl1VxB7?=
 =?iso-8859-1?Q?Dsb8dPLJIkFSyaymLVrYt57C6E9xaMhWugY9Gk/mmEv8k/mYzWa3tOKNnZ?=
 =?iso-8859-1?Q?oCcyrRGTv80cp4gHQfI4KFzvE+VE/v3tqLtGJiEj8XLjg6PG+9qn1on+5B?=
 =?iso-8859-1?Q?GIX4uwx+b64jupp8C8eHBZvqBUOcaWP8r7kVlcopmvLQJrS7LXD+fB2+2Y?=
 =?iso-8859-1?Q?PbDF6bSsVUq7BOQJYEY6NROl1NitFyYJ3s+9pu2JZxt39Bv4ehZt5BWyw0?=
 =?iso-8859-1?Q?B5wgoQQaSkaBbEIEJLolgURNdQswciGvWBKCpWwGSHSZAN6z231b7FSAQu?=
 =?iso-8859-1?Q?IsoN6LnM3X5vsdht6wEDivht+hzNiJDFAm1/bAxLI8REpyAvVK/9fR3JSr?=
 =?iso-8859-1?Q?M9fKmbflyTrBPozOW7Z/In2N6pbuASCh7BS0eIJpSMbZA9L4xYlxQch0R/?=
 =?iso-8859-1?Q?H2eFnomoFjD+mSDy91QgcTVPnbJr/9HnxZpeyS6l8BWj2cx/x2cL/Nz8Xc?=
 =?iso-8859-1?Q?JSmi0Gw5eV2knvU729WpZEedpikGERnOTrE+F/WesNmTj6S1Cj+rjc2QvS?=
 =?iso-8859-1?Q?3xJznNGy01NhUjjJkSjC1UnZOK2bfyj3PhSpcVZyTAIFUZspkDZfgYSmB0?=
 =?iso-8859-1?Q?1wAdNLymNgMqH5UhccOjJdYUuQEw9G7GZoCEsZqCF5gBocGN4v38AstfOK?=
 =?iso-8859-1?Q?etI3y77kpTRvvFtCMigz5e4m+optGKwU2peGpKvV1f+LUYxZrHtgWTReGK?=
 =?iso-8859-1?Q?pRK6JTtob5B9Aq4FfzzYLrrQpDiFfPyHY9jq3+V9w3FfRpL3FoJGA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VTFR4i6muhibFOShnM6jTUA+QHOXGmUOYYbnGZ/jZudnDJl6Ffa6T9Vi81?=
 =?iso-8859-1?Q?NC0aTf94Ot3xesgdZc7imHscTfM5VtI/kkLVyl0zmOroLwuXmMLcRAG4lI?=
 =?iso-8859-1?Q?KttnxMZ7E3EqFEzrgZEWFpwrGrLyJv8dZC04jXGvChBSDfj20D+a807TLR?=
 =?iso-8859-1?Q?sZFSDGP2qtTD1uVTNlxspmszqoxRuWPkYTI11WZ8xPIo844riZjR1FnWCI?=
 =?iso-8859-1?Q?G/o0jD6+6PJhm2hmeke63jE6YUOeoX5Ybh/wOcIvUGZrPlBOye0STZuL0V?=
 =?iso-8859-1?Q?e5EH78OraRWgpMS48xr/f/FMNimlrNCxkP381FeRmNbs19h2lNE/IH6qNL?=
 =?iso-8859-1?Q?3f1vKs6j5oXyGg2GF0d7iPa4e5VAlwPbHqWT5xYRh3vD15WdadnP2zsLnf?=
 =?iso-8859-1?Q?M+/1fHv829Ev79SUMkGwPqSzooi86kIiCxYYCs0ZBzCrDQ53mV2J41m9BW?=
 =?iso-8859-1?Q?tuTjn4wVjIIqJZljQjA83+B1mtqGmxunqv5R0I8Gw6mBILVlJEYuwE7Weu?=
 =?iso-8859-1?Q?1jIQT4mg1ZoQwcKd9M+ombHnCiDROaomXWA+q6Jkm7Q5pXK6WuYFast09p?=
 =?iso-8859-1?Q?E+MEIJ72twI7atFpCAuTSrhJnhZaA7BCwj+YWEXJVRmXbAFEWqFXFDzSkB?=
 =?iso-8859-1?Q?RTUuKSnUbzMtRn/Z1wew0nmTaSRLiFUBT+C/SXzPz6Cl/+l3AnLC4x5YvP?=
 =?iso-8859-1?Q?wv3qKffIx9P3cLI+yQrcH3+kpHPnmk9+QRdp2UswO31V2qdnmVa4oY3Ket?=
 =?iso-8859-1?Q?o2/oVSQP+mVxIk8wLydm5T6L25Em0owdDDJwh2X/LV4in+Eyq0YXvczf2y?=
 =?iso-8859-1?Q?v2Di2cvI1t1vLFO9QI1qoAYYafF5xiBh/ppzc322G5h3y2rV7NU3KSBTVu?=
 =?iso-8859-1?Q?PcmcFyr3n3kYJ9d2IIK6aEDIo/ETa4rGWLuIJRJCSapJ2ILPrwSrwKrsmC?=
 =?iso-8859-1?Q?cpKKER/a8oYF3uDkXbEKbwODcIcWbsA9+xc5hP8sdHWqDjDcHV2eZD65aM?=
 =?iso-8859-1?Q?q4e4cyBfRXzk9U8ekdXauOJ4rWhly3IrCLCedVJ76YXFoP4PaWXWCrVz/8?=
 =?iso-8859-1?Q?st97aA7rRbxErMxcvg41/PuQAP09F5Tr93rsPVEDDZj87UHJg/zr5Cg9f8?=
 =?iso-8859-1?Q?3+2rtsb5Y+5DphqGi6GFyt0SB9SZB0lkacMMpeJcsULSLJX3dFv/cty+pl?=
 =?iso-8859-1?Q?CQ4F8KbsjgRmYvM5XDRaZn5XPfckepthrDOJzPny/vTIY1MRVWD9UB2xj8?=
 =?iso-8859-1?Q?8jZPbOh4Wanhg1N3FuKN28m46Lao4xaqABatRldFZQ1yj95v3pPxJ33Cnw?=
 =?iso-8859-1?Q?jebex6hvqa2vjjoH/M3snck4JBCyLJAJ93EUmzAhUKovBlFT91dRE9L4wT?=
 =?iso-8859-1?Q?/tup2LcS0tn526y6WqpS4BdhTVknHEfMhxajM/4lB2e2mlMgAcMIBtSkjk?=
 =?iso-8859-1?Q?3Fb2/BPXQ+qOVfc/izUJSD/ME7l3HbqA6bxwm8W3drTplf5DeoCT2Rkmk2?=
 =?iso-8859-1?Q?1Muwc6TQWUdAuQABCTTZgf6IrcNKbg3zMv3BTvNplO2z3wA36WcqU6uh75?=
 =?iso-8859-1?Q?P23q4W6q1Ye+Q4N11Iv2rGHPc3UV7wuO9N/IycSOIRMX/O9okggAomuF+8?=
 =?iso-8859-1?Q?xCnLU4CAs8m+TDmhRm9K/tQcKr9T6E//TW7Wvo6xtlDyGi0NnpIvCkPg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea95a58-1046-4d54-20ce-08dd0b39ac7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 21:07:29.1312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/Mnn3ykmu5Rlc3cWISliAFH7S+t9DRgycId1yKHpgssN2f9ujHq39G0iBXmrYmCkg7fDlujskuPLf51tHIlPzCrgtmZnPs4VHMKzLmDxV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9738

Both GCC and Clang support -fstack-protector feature, which add stack
canaries to functions where stack corruption is possible. This series
makes possible to use this feature in Xen. I tested this on ARM64 and
it is working as intended. Tested both with GCC and Clang.

My aim was to enable it on x86 also, but it appears that on x86 GCC
stores canary value in TLS, exactly at fs:40, which is hardcoded. As
Xen does not setup fs register for itself, any attempt to enable stack
protector leads to paging abort.

I also tested build-ability for RISCV platform, but didn't tested that
it does not break anything, so we will need RISCV maintainer's
approval.

Volodymyr Babchuk (3):
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature
  xen: riscv: enable stack protector feature

 Config.mk                            |  2 +-
 stubdom/Makefile                     |  2 ++
 tools/firmware/Rules.mk              |  2 ++
 tools/tests/x86_emulator/testcase.mk |  2 ++
 xen/Makefile                         |  6 ++++++
 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/setup.c                 |  3 +++
 xen/arch/riscv/Kconfig               |  1 +
 xen/arch/riscv/setup.c               |  3 +++
 xen/common/Kconfig                   | 13 ++++++++++++
 xen/common/Makefile                  |  1 +
 xen/common/stack_protector.c         | 16 +++++++++++++++
 xen/include/xen/stack_protector.h    | 30 ++++++++++++++++++++++++++++
 13 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/stack_protector.c
 create mode 100644 xen/include/xen/stack_protector.h

--=20
2.47.0

