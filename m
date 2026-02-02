Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OD0A4bOgGkuBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:19:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8DFCED5E
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218944.1527839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwdd-0002fL-M9; Mon, 02 Feb 2026 16:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218944.1527839; Mon, 02 Feb 2026 16:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwdd-0002cx-Iu; Mon, 02 Feb 2026 16:18:57 +0000
Received: by outflank-mailman (input) for mailman id 1218944;
 Mon, 02 Feb 2026 16:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZg-0000fY-2R
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:52 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a3211a8-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:45 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:42 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:42 +0000
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
X-Inumbo-ID: 4a3211a8-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpz7bDgc4WpWayg0CN6YFq+dyCiQcmhU36F7t0G/HB+04OdgZHXfPZ1BjqQ200TCTX6OYYTucD4yzW//VspSvB33k7B/PX3RDkopgJKtwECqL0Ja4k856n9PZTDdb4xUw5xGGQfHNXneD4WC7/yMcdWh96ymmGlX2k3kfMF/J2niTUJwByroidVIdZ1PGcuThYPz02sPGH3AZ4YmcbGEoLOrCwp0oSHwGG2tLJHE2Gxc1HyLYGC9oX6zhosZJRrm9v61Ptf8j8v9ZfXWg+mtiBwEyuiyW0+Tba6icvNqHUv07TBW0p4OMhD64LHq8eSL7al1MGhvy2IaxXumF/HtUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSB60wtIseXpEOBJ7I2DHvvHn5SQhFmvHE/+vrRCLY4=;
 b=dimiqiAOYns2b3Ua02S2KFdewYepAPlTHMHXFuIHbDTGeJLrEUzqkb3J3qmwrm63PUb/UNXwZZ2tigA1c3CaDyqpgpoYbdS880+UEiWtSJ0sGWwrLfgoiiDUhmAIn0GR5J7oI3TK7w6bQQF1G0+St7sW+j15L6eDCFE9mryT1WEhC9yK4Q7jTv4GbldTO+zc3DK+JZslJSdiG3vNtFakCKeYtr+9nRVmtLw72d3MldY2rglVErNpNiZt3ODQRkbO1Scd7F8S5LDfkEwWMXxGsab2Y9bTjwL5hSDzYTSFM4EF/1CQWpxo3ccQ9ew9+Ye21iVSUkR1IdQp06uyl3gH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSB60wtIseXpEOBJ7I2DHvvHn5SQhFmvHE/+vrRCLY4=;
 b=nFyi0S8S1eE2zuzV0NnC18eZOpaEIKmUzX+Njr5bRTjxXc8VK15HJhHnyF9M1GtXrHgMeZjF6/tzAqiS2lZ/Rf1sNSmM1+jI/J8kTntA25tY4Xo4zhNOtG4Oy/FZpTRbe8rUUiQp/tcxyy+iqz4kzhIxv0XqriwfRgFWt10oh7oZP900oHAAyRGLDDGG6m+nzHcos6+JZz9UVDgjc3AhkeBNDYkq6QvYv9mVDJ4cm9zI+FypXTitn2vteNUP6w3frmXhcJkx/gxsGKHnvqt8v3R5WUTUI4lJ2qBmnQoQMxVGO0Fm/BVfH9pxm+0BlI7sYJpLiDq1/qOoZcdhVhtpuA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 12/19] arm/gic: Add VPENDBASER/VPROPBASER accessors
Thread-Topic: [RFC PATCH 12/19] arm/gic: Add VPENDBASER/VPROPBASER accessors
Thread-Index: AQHclF8JYkeRiWQD1Em9PXuDXFnTeQ==
Date: Mon, 2 Feb 2026 16:14:42 +0000
Message-ID:
 <b15ec6f42418d7c0669d551e42be1d1b75839df8.1770046465.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: bbca65a2-2351-4be3-25fa-08de62762c37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GiO84A7sCEuKmQteepO07iqxVNrjKBASy1P5OdS+VxaFy3uCRaFR+VcXDZ?=
 =?iso-8859-1?Q?w7JjEIlXAyTseuJjbdpqCnGdR+MgXCe/hb8ckyN2203cFdLycIgA+b8bkq?=
 =?iso-8859-1?Q?tdr9dj1R9ceo1ZG/bgMuMH3VCPAdj+YDe62UF5uR14l0GgyVKvs9Wd6V7+?=
 =?iso-8859-1?Q?V3xAl+9sEaynp7A2vc+appmiv+ccupx4hjCtau0CYHbGrtuupEUoamk9l4?=
 =?iso-8859-1?Q?b4Zv6Z+iTLDfpQAW9JgPCGCWL//aPYwuoyr/FKZzMDAy0dtQTUGamoMgjt?=
 =?iso-8859-1?Q?SPVXHjZQ0JRjVrN6lNP0nfT7MS9+Ird+VGDHjisvDTyDVM0jp0OM9r8EBE?=
 =?iso-8859-1?Q?G34FubRi+Vv2dDzBPe69OlhKluZGJDha4sOlr6SUHAJ5b0oI84/rGVuSvO?=
 =?iso-8859-1?Q?BtIkLouznljS6P/rF4GD8Kw3u/KARbowSNs0BfXb8jiy5P45zYfgS2Tu97?=
 =?iso-8859-1?Q?abQE7e/Xgtm3YNvw/2Crio2b0d7AFnSIezHX7DI+6GA37uBynWoexdqHZZ?=
 =?iso-8859-1?Q?wdoiAG/nBnM+2HFfemRVgBvwiNEclNs1cgJ8sJcuqVb3iyJkDyAacQkHgY?=
 =?iso-8859-1?Q?N/cQsSHmS/bBnsJehezmUhZkeWz+U64PRzgS2dqizwDbzEMuP3VkOO422f?=
 =?iso-8859-1?Q?TVa3L2GaSnsTPkMHiCV7bvcmvPSAbidXMVikJiy9tBy1uvI4Zh8wHL3A2H?=
 =?iso-8859-1?Q?TqMrilMRG+3xMgTpmd8KtXlRI5pDNhYb9uPPWoFbpYT2UMNuGQeghPzFGo?=
 =?iso-8859-1?Q?gBW+/BTc+0re0nd7hOPXv8Lw2XtCjrp8Q+0gwg1Bhlkt87lshlMYpbEGYo?=
 =?iso-8859-1?Q?HCV0AZNLy/5kViSooLicr58sjoM4rt4345pOuQuEkclC/5qqojvIGkw5tS?=
 =?iso-8859-1?Q?EZU3uSlodDUVsCRpvRBvB8zSL7923fcYu3H84gotYRr+e2u3Yu1kEWpmlR?=
 =?iso-8859-1?Q?Dlfp3MUP8NZ/AHAFkvq47Yuc2+9nlEa1SkrxliSfOU0zTIyKSmkNQv5RnY?=
 =?iso-8859-1?Q?Jhb8FAuJ+yqrqVYokxSK7VDl0XB2pOlzel6DPjmnGaWzwFhX165zvrrPOE?=
 =?iso-8859-1?Q?NC1s/NYiLtw+SvvhNHyHbOB75p8QpymcdIbyl/MNVT731HgopmOGjmeXFv?=
 =?iso-8859-1?Q?gFQQMfKNSzoGMD1Q8WBWmtrgQk9m97CAtvL7uioWSFy/vbt9GHNTA+PbB0?=
 =?iso-8859-1?Q?xpwBXkPZtiLEdhqgB/yzQfhvK2WEmIYofb9jkgMaPRgKDq58xkie2moYIB?=
 =?iso-8859-1?Q?hogxQlSzTpqKqbEU+HdWHT9eDV3zwaEPDgpzY5Taja63wlHjuYxYewESNg?=
 =?iso-8859-1?Q?8pvAeqznvmqSuryraDvb4wyQ/9uaXUfk7s5NsH22fH8h58zdPaOf/ATVPq?=
 =?iso-8859-1?Q?nFmRjquvnY/Yg/QQGSyOn4q5oH5ji+zc4RcB9lwESpyoeqVdV6c/Tta276?=
 =?iso-8859-1?Q?nT5ITRM14AVmAcq43PLMNSe1ZKfC6OnR2+HE4riN+DI1Uux/Y4scGviE8k?=
 =?iso-8859-1?Q?ABsaBjBc+DbRvYHWKrugshz5XUw2ku9zcWjjEarDx2j8hG7BBtu/Nxd856?=
 =?iso-8859-1?Q?FLB3stECS5FASfzlf5Y7Lk2230sHAHRM03ZaniWAvkhIg9CqE8r+G3fNku?=
 =?iso-8859-1?Q?KDsoTXAIX7CIUdMQvP6t/TR7v0OLVN0IogpYkPiJr/eNbsoqiEY6W/gBFI?=
 =?iso-8859-1?Q?SGEQLt5VD8EVSLsC0VM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aGYKjMAljCyl/sqS506FdNk3f8xekyglwAol9TrH1lD92Taekfhe8IGuAS?=
 =?iso-8859-1?Q?FAZN/WoBt9/ZzS4CpgLyyG04/zV5ZP4aOI5HPqNmlItpC0ixefaawCtmRy?=
 =?iso-8859-1?Q?I2DRIdorIiOxiHCdsSbRiGn+3cNJay9pJEV3L1dmVDEfsKyr1IWj77PndC?=
 =?iso-8859-1?Q?WtzWAgofq7dFg/bGtneFmgPYZeLkVt2+/cTT7iBReYqaUHtIQJNsb73bMa?=
 =?iso-8859-1?Q?xXZAqu//DIx1T6f3vARYJnKYIKsA9KwCk7LYghfXFVU1fEVXhY4rqeWlnG?=
 =?iso-8859-1?Q?6qwIjcvI3K62XPVdrTceJBos1uWMfimnEbWlcCbA7/Cp9bzNtmch4cdRXE?=
 =?iso-8859-1?Q?EV4Wr9RCd2j6cE36b6N0+kn5GnOz45Vr6VBziLB4EakdSoenYPfV8TlvjH?=
 =?iso-8859-1?Q?/8t0YjIF9ouHJ1coIM0E+SxLxZPSe8Y8MevmpKWANss+7SNbpMl1aX8FlQ?=
 =?iso-8859-1?Q?H2SgOi0UTmiryfclY8KiV/TosBVcGpbXRxUv+pE5MkAhX2de2W1knkEiub?=
 =?iso-8859-1?Q?TssUCUZmnz4cdW3806KvWw91yPX/F7EmDGJXVZce18mWmrVpnjCDzVa1FC?=
 =?iso-8859-1?Q?XwKg15xBw0uS8Gb2XMwFG1PlKhCXiiHD+Hk8t1Av4U6TNec70q1zX0c24p?=
 =?iso-8859-1?Q?uJ0lP6I+L6K08kqZQCuu6tJ0owzerjg9cWGo9ykiEALdo+ynIHoxv84285?=
 =?iso-8859-1?Q?rbnpv85Bhp5AfCLOOsFr1WPwqJHMTytuTkhedNorU8QgEWz5ZvG8FXQC3B?=
 =?iso-8859-1?Q?oi8EdzxJ5O3c8FW26TACXl2hUv5pNCopsl2YlnD9EJg3pnqGdZdebSq96z?=
 =?iso-8859-1?Q?payKap6Q/MPIJLSbjDIz3KWSLdX9T6WKUJ89vvkZC6u0IKmTynyNtpe27t?=
 =?iso-8859-1?Q?J1kPsA/KlfGVEEz+NraZD59i73H1XOBuzEiMyrx8NaKfla7R66S3T6UIix?=
 =?iso-8859-1?Q?0oqw7/O9L9fX4zOAjeK0X+9qKRyoSbygjFvXdjYKXURIFrbW40JFD7hqsc?=
 =?iso-8859-1?Q?F1a0cL3LnuO791bakKvbl3DAqyBWovUQzEKMtiUeoKp1ANmSTtKl8riivg?=
 =?iso-8859-1?Q?bljdeVUdCmiZxCXrX2/nJBqV439KP2FqSM++FdHjtjoZeE5PTXkxzc24H3?=
 =?iso-8859-1?Q?KdYWaGQ2Mqi/YUF+5X7U+8sy+1pKVNIfFJKYNu3VwZcxBdjhXN/KoSUWDg?=
 =?iso-8859-1?Q?fQcEPi1qr2+pegR3YEONO+IRc91fwhjKliB4Guraxd8inQYGxislcY5n8t?=
 =?iso-8859-1?Q?edJfE3S9HKnpkwdpahsSmFzZ9nqdOZ1NClrffI3XQh99foz5iCWQ6GLNKz?=
 =?iso-8859-1?Q?Otcl8GWbxqm9yOVBnkno3A/vV7Q3iEYbuQmx54ji5LZvOYDyCxp87gq5N7?=
 =?iso-8859-1?Q?jbZG8FecLVF1N6+LcgmT8i8AzhKaeRqh98697DGOU11m40ftI3lBcxTy5j?=
 =?iso-8859-1?Q?fm6UbllRibCHJMnyLl9j2p9djkKTAtarv/Yf3Q6C1aSrunIl9NRmPMjkBQ?=
 =?iso-8859-1?Q?ZFNSiZ0Xh9/HMUUeIfRvJ5uqz/AeIPQtNEowPu9qQsKZn+LrD4uxILh/m3?=
 =?iso-8859-1?Q?tQfwHes/+AIbSdE8QpNkzKypjVfUig4n49UI2gWAR6Jrix7Ry+QUKmkPjk?=
 =?iso-8859-1?Q?MtHWkSjq7Q4vKwI4JAIraL7wHMB210JEzacpzoVR3uEeQxZClXIfqWX+wc?=
 =?iso-8859-1?Q?1tU35I/G/HxTmavMmzTfmZbu62n/YdKytbMSHLP5rH6U/tzfgF/CGiKij4?=
 =?iso-8859-1?Q?AwjK2zzAE91Z+FePzEYpQG0pbCY+IwVmrtHYUnaIV/C0dmeEEQ74rk/FXR?=
 =?iso-8859-1?Q?RcM3TE2QBsZAiJXiahlma2X7VoIsyNw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbca65a2-2351-4be3-25fa-08de62762c37
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:42.0533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nXocrPXq/w2x2PyglV+fh8ncdKOYZ5IUoWaxcBR09ifZliZ4z5eK4c+Vk7JKqy4Q/DkCSLOvIPQfh5/vNpTBAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid,gnu.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	SURBL_MULTI_FAIL(0.00)[www.gnu.org:query timed out];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AE8DFCED5E
X-Rspamd-Action: no action

Implement accessors for GICv4 registers VPENDBASER and VPROPBASER.
VPENDBASER access needs special handling to clear the Valid bit before
writing a new value.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/gic_v4_its.h | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include/a=
sm/gic_v4_its.h
index fb0ef37bbe..ba81b25bde 100644
--- a/xen/arch/arm/include/asm/gic_v4_its.h
+++ b/xen/arch/arm/include/asm/gic_v4_its.h
@@ -17,6 +17,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
=20
+#include <asm/arm64/io.h>
+
 #ifndef __ASM_ARM_GICV4_ITS_H__
 #define __ASM_ARM_GICV4_ITS_H__
=20
@@ -50,6 +52,42 @@ struct event_vlpi_map {
 };
=20
 void gicv4_its_vpeid_allocator_init(void);
+
+#define GICR_VPROPBASER                              0x0070
+#define GICR_VPENDBASER                              0x0078
+
+#define GICR_VPENDBASER_Dirty                   (1UL << 60)
+#define GICR_VPENDBASER_PendingLast             (1UL << 61)
+#define GICR_VPENDBASER_IDAI                    (1UL << 62)
+#define GICR_VPENDBASER_Valid                   (1UL << 63)
+
+#define GICR_VPENDBASER_OUTER_CACHEABILITY_SHIFT         56
+#define GICR_VPENDBASER_SHAREABILITY_SHIFT               10
+#define GICR_VPENDBASER_INNER_CACHEABILITY_SHIFT          7
+
+#define gits_read_vpropbaser(c)         readq_relaxed(c)
+#define gits_write_vpropbaser(v, c)     {writeq_relaxed(v, c);}
+
+/*
+ * GICR_VPENDBASER - the Valid bit must be cleared before changing
+ * anything else.
+ */
+static inline void gits_write_vpendbaser(uint64_t val, void __iomem *addr)
+{
+    uint64_t tmp;
+
+    tmp =3D readq_relaxed(addr);
+    while ( tmp & GICR_VPENDBASER_Valid )
+    {
+        tmp &=3D ~GICR_VPENDBASER_Valid;
+        writeq_relaxed(tmp, addr);
+        tmp =3D readq_relaxed(addr);
+    }
+
+    writeq_relaxed(val, addr);
+}
+#define gits_read_vpendbaser(c)     readq_relaxed(c)
+
 #endif
=20
 /*
--=20
2.51.2

