Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO4sHjzOgGkuBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891DCED2A
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218893.1527784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcd-0007QH-5q; Mon, 02 Feb 2026 16:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218893.1527784; Mon, 02 Feb 2026 16:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcc-0007KT-Ts; Mon, 02 Feb 2026 16:17:54 +0000
Received: by outflank-mailman (input) for mailman id 1218893;
 Mon, 02 Feb 2026 16:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZk-0000fY-3P
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:56 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c1ce79a-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:49 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10299.eurprd03.prod.outlook.com
 (2603:10a6:800:202::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:14:45 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:45 +0000
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
X-Inumbo-ID: 4c1ce79a-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZFwqLP8jnAX3vL533jFRxDiixPUBW2I/QRHrFwYd9qqpzalhNpjeYhXYGWrcGmuJUWz+toKCq/mbF2qkz0n9ITyIrZadbY4OTvmG/tNcEu2DQQFgnux7rmSp9yT4S/BOk9HSk8b/Z8ZCwI0DkNLfmTz4OJ5M2+QeF2CANSqZ0BiFw4MZSTAiaEw/lRShgP5RTHym8sfhznHZ3YvkDrzKTdiwMK1dF+JTiU4GwnmBxlawBPH43JwNJaSOd4R/885eh53byFsLjBtObUN4ZKzNEFI6qBwnMgdQDPFGfwlKW8Iugdg4HMCE2EfSUU22xatwPKRxJsgpNtxCsz2dMFPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpG0vAG8e6xad23pmIjhAdmaEHtng9kYL4aNQEOXKOI=;
 b=BZVoNtoyCYEZ2o1QinhknwRcqYO5DVx1RuSnTrz8AU53ZxTalm7xpwa9O9qTwI0GO9Uj4U0cPGTqQeggL8P2MH8wtegFkfwdUtsMgoL3gLprdJbvc92z6sWCFNG8GcmOAjL0ff5WA1cKy6F0MCPA2c8XwulLqsnKHEZ65yYTg6lQyoB7onRbq0IXk5a+QbOwUqZ9vmJnf4D3J/z5KI9/MHrJ9MtmVyKcaYLTpaSFwuwNIDOwLqsnmkIMsaRDmiGesVGMbByfUAmHXaJtkq874CcN6SJtzYaoNrviHzOmcy7CWNsHSHdkYb38sf5h4gP2vkB5HUbDPYC3cfihJqwemA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpG0vAG8e6xad23pmIjhAdmaEHtng9kYL4aNQEOXKOI=;
 b=AfMhSrlBAQv8JZjMCJwSItayuXsdKweoPAMWc7yT6VlTTeZmxzBX8AApmxB0i5IhyoWRzhbfDTS/P6Gm0YOXtdpcSQX7Ow66tDT5Py+wi19e0M/jdrHKcPAnrySX8+mK4xDxXFmrvI5Axms1qTzmhCNT3A3owwIN0plV+GzrzBxPWBeNxD7rG/UENMR+5mHk03ekRRzE3S/E5uF+psga64VMRxwLf4LVR9LPwgysDxd5UF7BybFIr3rrVu6S14LpH5ju90Cj6cVohBY4GorOlycqhWqZXuNLX+crrxWYkZgyyWlO6F390WHJlpMbxIS3TORtUYK4e9rSFe8ZP3lgcQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 16/19] arm/gic: Fix LR group handling for GICv4
Thread-Topic: [RFC PATCH 16/19] arm/gic: Fix LR group handling for GICv4
Thread-Index: AQHclF8K603U0XXQOEuJhQnegCFT+Q==
Date: Mon, 2 Feb 2026 16:14:43 +0000
Message-ID:
 <13bab832bed00832d7597105a33ab2f215e626ce.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10299:EE_
x-ms-office365-filtering-correlation-id: 38f49fc7-6f95-4cff-ec65-08de62762e6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tNoVKT2OXWSdZGERcPGdG89siIzahz+RyAb6Z9nMupZmYJ3FQ1uGUTq1IK?=
 =?iso-8859-1?Q?u6ecb2X8GJqQKas4TcX1Z80oluwMI6anW1K0iX4pCW6cqndictP7/bmdTB?=
 =?iso-8859-1?Q?2wgluiK2D3gptnbTQbqDiV9A8cLuzJ/v5+O5bbV8/tOwKbCNapuGAuHILb?=
 =?iso-8859-1?Q?/1qrnGv5pJ0/vwGRXGHlmQ6oOlRyv5VZCMW5OCztLi/1EWbgmtAMh5c9Gg?=
 =?iso-8859-1?Q?annsXz7zcpZ3lJxC1m2LRmGkcGw6onJIBRGv/KzgXXtnERAK1SU9YLJbGA?=
 =?iso-8859-1?Q?Mg2LWih5239ejAVtquYopzXUQuMSMjAJgFSqGQjH5fkM0nLKAeqORP/pnJ?=
 =?iso-8859-1?Q?TJQecOPJhxcMTwcGhZPY8WpwRa0AX9eFZ9azaqSOjy5YjL5/rkPtYRhcQI?=
 =?iso-8859-1?Q?CvIod9RT/QL/8kkOu3KQ3hCBI+jStzmliHLZ63sTlkh8InvjUQixKhIk+k?=
 =?iso-8859-1?Q?WBGMBmz/gRsvv+/1KwX98aLZlz7B0nXA4L0juD2Uz/SUIwSL+DOQroZCCS?=
 =?iso-8859-1?Q?d7pHviSSn/qpp0GnF5PWWL+eniCWMzMaP+XlJRh3sJYi/NZJddpW36aQ7A?=
 =?iso-8859-1?Q?l54Oi9tfPnYppMLOgbeNfZCnMgxvdkvkj0lZKJS2uHsG0Hvn9B2UVfy8b0?=
 =?iso-8859-1?Q?quThzHpzZNdfunxAI2+uUVvpil7uWbcWI7b37UEHLibiUY/qvvFuZO5uFE?=
 =?iso-8859-1?Q?723Ew3A0SOc6jH5vlo5rF1/aBZaBjxIf4o1qxUn9JDE+0j/jqSTovuRt6L?=
 =?iso-8859-1?Q?kDjRJGDdR1kFcuX1PB6hWWXYK/fBrKiDtJZomYF42n8cPRCwEew6XYPWSR?=
 =?iso-8859-1?Q?SSgLXr15JTzt/HQprF+oX83EyYQUS+m6wGSHgC7NEWVlQ8Ury2MzjVQ9tM?=
 =?iso-8859-1?Q?D9HLryiFZlbHiVxylUUkXKqxD0/mfcvlGFAkoZCSGktP/YIujnOQNEBTrt?=
 =?iso-8859-1?Q?d8JD3B0g7IleTo0txAHwGL6njHO0evZa9zSzvghOx9nBKeZN42cc3X1+I0?=
 =?iso-8859-1?Q?j9Gvso9TczM/u077E1nmauEWd7nDAPCg5zu8GX2EsxiqQj+aM+PBv9cl1+?=
 =?iso-8859-1?Q?D4Vk+w7uLsW6/W8a9JsLthH7VNSzqi+21MQFBtXfo7TaVcRHqml6fsXQpL?=
 =?iso-8859-1?Q?jHUoDmNGI9Eel2q+s3cYAdleO+PpAMn5eq3OZHCZUrZn5YHhLm1C9OsZFD?=
 =?iso-8859-1?Q?vKC2yqLcQtUP1tb8SonEZKT89VnYyRS/VMw9cRbBR2lZ7k6PLpanTfPOpc?=
 =?iso-8859-1?Q?rI+lo+1vwUxSu+/XcYgRdVW/9AWByHdwFWMWMQefob+fmqgZFp47wDAIag?=
 =?iso-8859-1?Q?V3NnG/0B1KNcArA1IARJJ9VVRczhShcqqwtRJf5X3XnM+vWFxG3o+N1SB0?=
 =?iso-8859-1?Q?YK4htT5m4CaandOg2Mv6C9e8pFiivTNiQ5/fBoQcaGMJ/caglIYQ7p+siJ?=
 =?iso-8859-1?Q?N+u92CMPGslx3t5DMnlmK7C2GqjsQYnoRcWpS3McWHSnW0Guyrw9dsQTdy?=
 =?iso-8859-1?Q?jKjuQVkEteCeeuBDW0i+hWcH86MPrzuCI1XntImn7hfPlF48JY1KLjCjSf?=
 =?iso-8859-1?Q?c1w0JYB5vEa4x+CsChGY69umXjPHeYSBE6gBAvFi3ZB6wlb62Nvbl3J1Xu?=
 =?iso-8859-1?Q?GTWcD/+eKDssfDryXKkKKqnjdYt9CnFoWwHXpCgL8BqbAmdZmFBDO8PmGa?=
 =?iso-8859-1?Q?VX7AehcI1RQ1MddsG2E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UMOEIw0hkmLOTd3dPO2tSa+TMhUEdtTUCnsYqX4m4CItjd+ql5pLFaE47W?=
 =?iso-8859-1?Q?maHTfKeZJ/EJ0UgVGyFdF8Aiclck2z8DyXrxUCRZw+Sf+SraPOudWf6PtG?=
 =?iso-8859-1?Q?1BMzR5fCj9k/FnXOrtJoJCIsjBKWC352Vs9jDCfBTdn2l/vIP4e/KLpz7H?=
 =?iso-8859-1?Q?oBCI3Z7vsDDyApohUA8Xrjs6Z42CepJlxzJIVIRmoliQtabfvx9OkVi+Od?=
 =?iso-8859-1?Q?QhMVQU6XUAE26SVQSX358h39MLJuhw9uJ9vJx+2mbU+VJ+l4D1dE79x5Nu?=
 =?iso-8859-1?Q?U2r2jgOqcMJ65i3mAVireyF3HWeyjNddtzdyQr7/0VZi1aXlCTQPecD3t8?=
 =?iso-8859-1?Q?wIS6WV7V55J2n2CFLrD+eZ4eyr9TVLY8n0kvqPgQhR01RtUfJwT69cYFP9?=
 =?iso-8859-1?Q?QvesR3HySRcQBngddARujvqRU84+fgTyv//GfYZpVz1alEghjWBrhqmQMB?=
 =?iso-8859-1?Q?+shjayZGrTPEpIB9W6ZXAh6LM6gZNId0u4eGf5az9p47L61ZJ14ZTTxb1N?=
 =?iso-8859-1?Q?HdLiLsT2NAlS789/fowVW1ynWUaju+vJ5eErwfFPgpQM+j50mAzxotU2iq?=
 =?iso-8859-1?Q?/3SsC5AnE63gEmdxsw2xQwvq+qUq+Cs+Jc63+AnmfOPpQCXJXsoB+aTxgZ?=
 =?iso-8859-1?Q?LYAJrIPQHYkZKeVRKXoV6ykQONgOsOiMSFyFoJvlb4FxOz7diIr2nSgF1T?=
 =?iso-8859-1?Q?4MmzxDdknM33xWiV/sftEmgmx8XqS695n7b6e//mG2GKCFyeJeT/r8xpxW?=
 =?iso-8859-1?Q?Frugx5H3JBy1VjhpXTmVCqpKOi0HPdnDBW0O+yaUNupPCJs8GfuU0e5G4p?=
 =?iso-8859-1?Q?nAtV7LoFE1zpVSGW27VDTGH/Mym3sMAvWVLg2w5NMxx9ZGsZlPIoGyvcIh?=
 =?iso-8859-1?Q?kB7XfLjdH9IWFJjWS1L2zFm+MjclE9X40EksWzVFP3H7CGRAIRWfyUCXFO?=
 =?iso-8859-1?Q?J6JduhD0Qb00P/7EMEfx4RwyE5L1JEAk3L0oJ3basN+VNjh0sfhcc1+boQ?=
 =?iso-8859-1?Q?IbhqRwTwiy0ixoIzCjGHphKavMuQfZ0J1YNZbZqL1mcmfbLSDYnmISN71p?=
 =?iso-8859-1?Q?5uCOMm69iheMpZmOUW53c7qDevexm4TTC7bXc/H9BIkK+LhNV4mD2nOhpR?=
 =?iso-8859-1?Q?FmG3Qo5eVi87UO9Fbg8qJ0k7xsSeeq/eHO8+L8ymQNsBSBBWNrC/+H5tne?=
 =?iso-8859-1?Q?5NtPYdeNLNZei8jaDJ6gpRxdTE78kmPEyDSGMWo5BMGAv3FI6SbBi2HVrs?=
 =?iso-8859-1?Q?cCHoZbRQyfMQefXylPlTvxe2qqmhujOr7LDzqxzU2FUrbP0pCchvusJsmc?=
 =?iso-8859-1?Q?oFIBqnjshq/IM0N7alMWuzLjbvhtwPB8qWtUAH2hPs7jyJSjSC60qYzxux?=
 =?iso-8859-1?Q?nMudJLunp5QpVmRr5+apwZ6z14wE+EkEOL3enImsFEkzg9uTLo8/bQDKg4?=
 =?iso-8859-1?Q?SzObseb/PzvACvOr+zjmJj6oj8+Jojz5k/nUFcUNxCXykPH8SXAbxiGAdw?=
 =?iso-8859-1?Q?tqs9/YDnlWv2jOy24thUtdelGwm4RadSVKi2OKou6ElPuRnXXXMMBJ6A1K?=
 =?iso-8859-1?Q?7KVLx24TGYKbMvU3KPJxLWFlz2ZUk8da9TElV92ofZRv/l19mn9Sob48mo?=
 =?iso-8859-1?Q?ejKLvJWKXg0WhkrWpqDS4Bys6pOYjTp4A4FtU0h/jdcRSAVchQB0NTHtmR?=
 =?iso-8859-1?Q?F/9uUFjJrzchP0f20zWsV417mydSshLkDSlF7fMW9r94eF3L+QaDOaA1n2?=
 =?iso-8859-1?Q?kShtLb0Y60HSfKXYOX/UBDlJTFpRCSF53i/Dml2vGwmqyBe+R3pOVUWoL9?=
 =?iso-8859-1?Q?SSoYMDO6euhnlw6sQrwF/45ZnxvgefE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f49fc7-6f95-4cff-ec65-08de62762e6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:43.9878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A236MjKGG2Pg/MIz8G3Z7Od71MBa6gWYClrUz5yOodliucWrSkFJrLtAAwKrN08z+eFPi2ebWt2TTKeI6zSnAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10299
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 2891DCED2A
X-Rspamd-Action: no action

Extend the check to mark interrupts as Group1 for all GIC versions >=3D 3

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 07736179db..1cb3169b72 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1366,10 +1366,10 @@ static void gicv3_update_lr(int lr, unsigned int vi=
rq, uint8_t priority,
     val =3D  (((uint64_t)state & 0x3) << ICH_LR_STATE_SHIFT);
=20
     /*
-     * When the guest is GICv3, all guest IRQs are Group 1, as Group0
-     * would result in a FIQ in the guest, which it wouldn't expect
+     * When the guest is GICv3/GICv4/GICv4.1, all guest IRQs are Group 1, =
as
+     * Group0 would result in a FIQ in the guest, which it wouldn't expect
      */
-    if ( current->domain->arch.vgic.version =3D=3D GIC_V3 )
+    if ( current->domain->arch.vgic.version >=3D GIC_V3 )
         val |=3D ICH_LR_GRP1;
=20
     val |=3D (uint64_t)priority << ICH_LR_PRIORITY_SHIFT;
@@ -1455,10 +1455,10 @@ static void gicv3_write_lr(int lr, const struct gic=
_lr *lr_reg)
     }
=20
     /*
-     * When the guest is using vGICv3, all the IRQs are Group 1. Group 0
-     * would result in a FIQ, which will not be expected by the guest OS.
+     * When the guest is using vGICv3/vGICv4/vGICv4.1, all the IRQs are Gr=
oup 1.
+     * Group 0 would result in a FIQ, which will not be expected by the gu=
est OS.
      */
-    if ( vgic_version =3D=3D GIC_V3 )
+    if ( vgic_version >=3D GIC_V3 )
         lrv |=3D ICH_LR_GRP1;
=20
     gicv3_ich_write_lr(lr, lrv);
--=20
2.51.2

