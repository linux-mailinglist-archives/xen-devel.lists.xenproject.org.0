Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLE2KEHOgGkfBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC1CED2B
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218894.1527791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcd-0007Wt-ID; Mon, 02 Feb 2026 16:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218894.1527791; Mon, 02 Feb 2026 16:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcd-0007Qj-C5; Mon, 02 Feb 2026 16:17:55 +0000
Received: by outflank-mailman (input) for mailman id 1218894;
 Mon, 02 Feb 2026 16:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZo-0000fY-4N
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:15:00 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ceebecc-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:50 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10299.eurprd03.prod.outlook.com
 (2603:10a6:800:202::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:14:46 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:46 +0000
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
X-Inumbo-ID: 4ceebecc-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1buO1wly/sDB9AUbLL01qigQcEAu1BnTNK6j0PmFutscJxL8tLFYmsOqhTP5WaYJdazggK+VqnCskFsdBUkVYkWjPiVgLyDL0A8+WkhIikgd0pGL76N2P1blstvuvkI2jabTtQpdGjIBk8IAYztb3SeiR0u27SLdZzaB8zfkUAx/1dSSvqOocFhdmZy530zhN20UzzWS8jouMd3R6isDYOJVj5nzr72x0ZVOODR8M5W1GnSuC0IfIhlniHpAgLlnYCQPiMzUi4yNBdwJjbE+MVDLXXlglDuh98hv1tz3YLVO9Sr+XVqRLOvI/6vsBXt790Lr0R7Tt9GdgxNkFU+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=947yUiItWFbYBUq0+f2mt/sPhjNqCQyd8DuWv6qI49k=;
 b=x9cslM0JENIwJ54WAltKMjAddHUQ+pSXP8S1ynno3Kg6x6gMZBis3vHA4pCvD3wL4NiV6/vKCPiKpZct8NdUHVeB5un8N6wi1qF0sFPLAn78HNwKqU9htlUHLctVW2T/lDkkI31mybqOluH0OLF1LMZDxfz7X4GFRsQ2KlXS38cCBTPpdnHR6lcemBzi1T7waJueh4ZIpokpZ5AuB00Olc9Q/l+bnHe7RlrsZnQXyAgrreT4ZyolHfThji6jhOd0yqTW1lWCQcbkQHhWGi8iLyBjmzuJEwYw0NFQsgGG/xMVq59MHD+YEtEv1bw6P5vq5X6oJMIoIvYrhtwcNLwkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=947yUiItWFbYBUq0+f2mt/sPhjNqCQyd8DuWv6qI49k=;
 b=NuuBWw7gVgzGABg052kUeizAsjUZ7XMbBfwOFkfe4t9zHhJ2PF25xnaX2wEq8hKhrcq8wIbFyP5K2+UdeV0PFW/Ir0PwfrCjOhtZQRMOV6YoVb2fOYwi4Lmd9QBi927NhIPSFlmR4xA3ojZGGimrBYp+2j93M3go5wXieJANyTD+stjlr3cRTMpIYho3bTceQXedshwYXZ0ErOQ+CK5xb2cIroqMvkstvTjgELs2mUGGLVRdtjbG0Gm+IQH+stjYWuPE/jaXcEizC85gNEKRdl50dyUSp0KJQggq0799uyoBc29kcbljDdcW/1Txn9wMvoyjcnCw94ZOfJGJBiWxxg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 18/19] arm/gic: Add VPE proxy support
Thread-Topic: [RFC PATCH 18/19] arm/gic: Add VPE proxy support
Thread-Index: AQHclF8L8u/ksOolEkegMdNrkhgb0g==
Date: Mon, 2 Feb 2026 16:14:44 +0000
Message-ID:
 <2bbe54851092309a0c23d68e60dfe93e4f77ef3a.1770046465.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: c99e3eb7-35cf-4e75-69a0-08de62762ed7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ndmDNkLHHNDqoq5+RXBalAyr1JIYypPczRUDs00+WbBU3H2Ku7NJDtIyyq?=
 =?iso-8859-1?Q?24RHx6J6uhUVa9830+6nQ16SMV1n25oaW9Hm532IVNmyoryXtauwWOR6S7?=
 =?iso-8859-1?Q?zLd2DklXnSME9NJzz/gNKTEL2YcRzxEg9TbO1HMkK+A0tS75+ETB54YOPh?=
 =?iso-8859-1?Q?W3PUAIwJj6dE+LGPymMpCkt70x2gdvbPguY8F9cOTH77FNGWIHySro3SP6?=
 =?iso-8859-1?Q?L+0xACo1ZJHr213SAieOBVM74+HEp5fUA8Byutt393smALrnU8i9ivxhBe?=
 =?iso-8859-1?Q?UcvlRVdpF5nf5gOnxuGz27omi9HPxY7Ug7ik+8mcmSQx5ossEbUfFNpGxR?=
 =?iso-8859-1?Q?ZZuvQqZqwZvaW+fC3c9YDL6AsHnU7pYuLC8c13GgE/dtcuLNa8h5Hrgank?=
 =?iso-8859-1?Q?EDY97V3zLA6vdEjBB5rB31YdnKrdq7hq99DiccfpVrd1P3LmHuQ12Sj+M9?=
 =?iso-8859-1?Q?weKuaw15h0JLnyQtBq+3w49WolmR3FbxYB2jThSqnp7ZsrnkyL1f2Daw5c?=
 =?iso-8859-1?Q?dBxGeBraeGwyoDLg3ZwkwVSnJWPcXVjaIQm90nfp64FKPPraxNudUP2pMN?=
 =?iso-8859-1?Q?qALij1JzfQVz6kHNSg6o1NvhJsDRvFWmnJ9N+ZKlHPuc0p+3VHOxiE8VUa?=
 =?iso-8859-1?Q?1FY1mT35RQXzjM4gr1q5plI8opPtaigcaE1yhKHHsR3pp/I68sjDtw+oA6?=
 =?iso-8859-1?Q?SSGBxFUbDe9rRCTBmwIvyVIkYNSEEgPDcZxIDapBokF6CwN31YjhoKTldH?=
 =?iso-8859-1?Q?5aYa1aTtpqsv47cTS+VM26NcUJGdXn7A1DKsTtG0V38RDCvkZDRoMQNger?=
 =?iso-8859-1?Q?VtnUyNeoo9g/TPlbSEeqcSkdHVoGjA0V2pNOUQcD73gtIj09TJUY+c+Zlh?=
 =?iso-8859-1?Q?Bt/e5+TR04sT7qO9PcrBI5zRIQfvU5NQ4vzwEvJBEqGuBv+p6g1SvanX98?=
 =?iso-8859-1?Q?RUSKiMD4wbbElEPYdYM9/YPaCBmmJ59mGoH1V74kHgE+RgVBAdOadO0/zd?=
 =?iso-8859-1?Q?OTo2aJo3AAB5gig6zAHJYfUSoHEssmbpL6Yb6lFf8fdPXfS4G5ijrdLhBP?=
 =?iso-8859-1?Q?TFUBbXeY3Ldcq7JpPl4BjCKOsx2X/umLj/0RexrLemvh7NfjksFT7tqDM6?=
 =?iso-8859-1?Q?ThxCeDIV3xJIOyjhY1+ewNJS6Jei9k/RYR+Lb5lvqaApgwHrswZFECEeL6?=
 =?iso-8859-1?Q?TuYKTUVtN52XvBrd97F8MEzhCuplLntMjSJmI2AMuCXrVkoHnSSiPlAjT2?=
 =?iso-8859-1?Q?fx0ogAn25mJnoyPRKjE3iPX5AGieaMaEbUxuNKDPjW3QnL+pCPKY7ac31B?=
 =?iso-8859-1?Q?55IypUR7wIR1zXAgYa0syz457Ac2pXrHoA4LG55ta+NU5FXJlteYr8o38n?=
 =?iso-8859-1?Q?SclEdNTXePEF037UGYNPWWC+L4YsgkRdM6TraKBi7tJgE5psrh2Tdb1w56?=
 =?iso-8859-1?Q?Nof65ba9UTry3rQ/AT+e+X6u3PPpD07g/ssTmIVAWlrk+v7x6dtZ3yJGRu?=
 =?iso-8859-1?Q?F+qipSmh3UWTKmiunDeNa9GjFHWJu9oIVmXUXiq4GVXKD0A7w4hu5u98XG?=
 =?iso-8859-1?Q?Zg+V0xZc3OWssGTHgz/DsRBD9qY8LTbPLpjKR+Qwt+DndpTFuhHW0BE+dh?=
 =?iso-8859-1?Q?aPJAHP/MZnjVCpScbaemNqz68qGL/dp0J0y0+8KmrrAP9IvWzegwRiq87h?=
 =?iso-8859-1?Q?7fMeKSTX6tx9P3B/sPk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vbCiDV2hHOfXypqTquZVYeImI6kwCGpg7UaTj/OJeNqZZXy8dNQYTf5VrK?=
 =?iso-8859-1?Q?xfqil9LXeplFfoJLUm5HLYMJ+4MN+5k2Tl8dYCgyZeEizX+kHJLMghX9nq?=
 =?iso-8859-1?Q?3zr9B1b0mAxr2vNZ3QznY9k98bLUNYLyEsA7v9Le2LpYpNgUvLRJDWbHg5?=
 =?iso-8859-1?Q?3mYwWOC0OChVE+9avZL6vzZyTISXEPksHfodW4nmE73Vlvc8HyXEQaSN4u?=
 =?iso-8859-1?Q?+1VgKUZ0mbe6fyQiAE9e7q/cvrzMSDQkp9IDdLog/X7sicAgSw3d3TMtnM?=
 =?iso-8859-1?Q?XJ/FGE7Z3ihuXwUgStECcStrvKNoLSoT39otU9WychyrNNpzWQ+A8gT+KI?=
 =?iso-8859-1?Q?ShFERpJjGKfww8J5etznQ5tfMll5YBQTdXsmoGVI0E/KTPdiEAs8LzbBRZ?=
 =?iso-8859-1?Q?sQndmIuERWpX6OkK3sHZtPNxTgBjijdapZsKlEt5Uhh6U3QMaORghgCPi6?=
 =?iso-8859-1?Q?oY+L0MYqwL8wfGO+cg2wcs+rzmcxNY250LFGMxC7GxqwLCcKzTxAW0bQnx?=
 =?iso-8859-1?Q?dIyKgVrh71RDrAolC0UFd6qq5w9AwtbPLVhtsURxejxJpl9oKcZAZu/uYk?=
 =?iso-8859-1?Q?sq6Ya9hjo/Ug9dMuZW8DDsrKDrscITaUJHGMxlzQgGqb9mVskgXvat4Lz4?=
 =?iso-8859-1?Q?B+EmafZR7kB4YlsffyYS1zBaMUBvRwCn/oP3oFOVlPY/E1GXNAxMNAEuxV?=
 =?iso-8859-1?Q?aL4NG2Umh9eVRzMV5/Ndfbn1hLzetMTh6QCvWSaylPrBZszXjuRddJbpTj?=
 =?iso-8859-1?Q?aQ/QbrDAec8KqOGSOFf6APxy+RoJspD28LhJKkd+R9txOnOmoa55bnwXQk?=
 =?iso-8859-1?Q?0TCo6G0zsvWGIuSDxABT3QQKka9xVqaMfy/yEeIEMUZyjtfsJrU34pZl64?=
 =?iso-8859-1?Q?q9SKDD8Ze8CaEWiaqB8c/2zthAXAtD3O3lWyGQKtNNvDw/TISDV1PY6Ytg?=
 =?iso-8859-1?Q?0Z1+FHNwuiD+jZxon03fIYuw5VrAMDGtb6Pc4xIUEaRD2Md0KcgkI0rMTT?=
 =?iso-8859-1?Q?VCX5Ey/53PBGk2sa18bPyM/uWkp5lmmIy2abbjTPI6uLwv+xbOEGt4dqkS?=
 =?iso-8859-1?Q?FW0ElK7UBh0IF+WkRydbHG+rGTrep1wa0OEu3J3jRezDBh2adff3ZcNiWI?=
 =?iso-8859-1?Q?FQyE60jcYTpg7fRY52qipOaY+rDrZAFj2bVgAwSHkWF3ye1myTOo/zwd4G?=
 =?iso-8859-1?Q?/b8uMoExJ6nyPJuFcu7FbdWMdC859CwM2Sxt7w0lpN+aSLBfT7T42zYjKj?=
 =?iso-8859-1?Q?8fqKfb7MnpEC0kEPsPBLXhMw3SmbTLxYfjk0b8zrvX5ZUpPi9Lmt18KQe2?=
 =?iso-8859-1?Q?bhjeu5lLFUfLwIn1g4lGR6KuW+7r8iw8brnhpJpp6jxvUnNcyLvjrCbjSQ?=
 =?iso-8859-1?Q?kW1QBAcUeQjSAz/TyNSyg7szip0iKKG+SXFSaom9gDXrKMb4QqlAK4KSud?=
 =?iso-8859-1?Q?7ql8oOpCBkjrSt9c7JcQcVv5JBnOEBuYqeGlvgW96bltc1H1Rah8h5KezH?=
 =?iso-8859-1?Q?ENeDTn3aS8DMbBciX+53JBiWuOPeGdFWiN2m/tt+5LwNi4mFKvd/gNWFpW?=
 =?iso-8859-1?Q?JZVvx7FjY7xcMj+rwfeNr/MgrHc2Y8g7sJwLWeYhWUfGthv5AQ5kfhEFhV?=
 =?iso-8859-1?Q?7M9SpfkKzJ3Cw/ArirN9chmJK2p7hcpKlC6rGzYL5tCRajg4bGUEKInppm?=
 =?iso-8859-1?Q?CxckmLmuy4joMKPgc3Tx99s0fKlesCuQWjE0HCapcGiKDS2/5XVWYQZhd2?=
 =?iso-8859-1?Q?52evudrv/VbQZ60An4gW9zIpjyZY5AiFFKEA9rGYDByaFaTSDx/E+HP7Ip?=
 =?iso-8859-1?Q?2TCohDW9CJ7G2UBSG1RT6U4VCEeNhhQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99e3eb7-35cf-4e75-69a0-08de62762ed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:44.6107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDe0wUbfyeAzn7BTfW4lAGXf9AM5f4YJuxLQ8nR1E/eiTGu7nxnV6bMZmuum0lCHjuiCCiaDT/t396RSEyHpWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_FAIL(0.00)[vpe_proxy.dev:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[192.237.175.120:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3DAC1CED2B
X-Rspamd-Action: no action

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-its.c              |  13 ++
 xen/arch/arm/gic-v3.c                  |   1 +
 xen/arch/arm/gic-v4-its.c              | 207 ++++++++++++++++++++++++-
 xen/arch/arm/include/asm/gic_v3_defs.h |   7 +
 xen/arch/arm/include/asm/gic_v3_its.h  |   7 +
 xen/arch/arm/include/asm/gic_v4_its.h  |   5 +
 xen/arch/arm/include/asm/vgic.h        |   2 +
 7 files changed, 235 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index fa5c1eb6d1..5979a82526 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -333,6 +333,19 @@ int its_send_cmd_discard(struct host_its *its, struct =
its_device *dev,
     return its_send_command(its, cmd);
 }
=20
+int its_send_cmd_movi(struct host_its *its, uint32_t deviceid, uint32_t ev=
entid,
+                      uint16_t icid)
+{
+    uint64_t cmd[4];
+
+    cmd[0] =3D GITS_CMD_MOVI | ((uint64_t)deviceid << 32);
+    cmd[1] =3D eventid;
+    cmd[2] =3D icid;
+    cmd[3] =3D 0x00;
+
+    return its_send_command(its, cmd);
+}
+
 /* Set up the (1:1) collection mapping for the given host CPU. */
 int gicv3_its_setup_collection(unsigned int cpu)
 {
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 1cb3169b72..fb80038f17 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -2096,6 +2096,7 @@ static void __init gicv4_init(void)
=20
     gicv4_its_vpeid_allocator_init();
=20
+    gicv4_init_vpe_proxy();
 }
 #else
 static void __init gicv4_init(void)
diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
index 0462976b93..83ee0510ac 100644
--- a/xen/arch/arm/gic-v4-its.c
+++ b/xen/arch/arm/gic-v4-its.c
@@ -39,6 +39,13 @@ static spinlock_t vpeid_alloc_lock =3D SPIN_LOCK_UNLOCKE=
D;
 static uint16_t vmovp_seq_num;
 static spinlock_t vmovp_lock =3D SPIN_LOCK_UNLOCKED;
=20
+static struct {
+    spinlock_t lock;
+    struct its_device *dev;
+    struct its_vpe **vpes;
+    int next_victim;
+} vpe_proxy;
+
 void __init gicv4_its_vpeid_allocator_init(void)
 {
     /* Allocate space for vpeid_mask based on MAX_VPEID */
@@ -201,6 +208,124 @@ static int its_map_vpe(struct host_its *its, struct i=
ts_vpe *vpe)
=20
     return 0;
 }
+static int gicv4_vpe_db_proxy_unmap_locked(struct its_vpe *vpe)
+{
+    int ret;
+
+    /* Already unmapped? */
+    if ( vpe->vpe_proxy_event =3D=3D -1 )
+        return 0;
+
+    ret =3D its_send_cmd_discard(vpe_proxy.dev->hw_its, vpe_proxy.dev,
+                               vpe->vpe_proxy_event);
+    if ( ret )
+        return ret;
+    vpe_proxy.vpes[vpe->vpe_proxy_event] =3D NULL;
+
+    /*
+     * We don't track empty slots at all, so let's move the
+     * next_victim pointer to quickly reuse the unmapped slot
+     */
+    if ( vpe_proxy.vpes[vpe_proxy.next_victim] )
+        vpe_proxy.next_victim =3D vpe->vpe_proxy_event;
+
+    vpe->vpe_proxy_event =3D -1;
+
+    return 0;
+}
+
+static void gicv4_vpe_db_proxy_unmap(struct its_vpe *vpe)
+{
+    if ( !gic_support_directLPI() )
+    {
+        unsigned long flags;
+
+        spin_lock_irqsave(&vpe_proxy.lock, flags);
+        gicv4_vpe_db_proxy_unmap_locked(vpe);
+        spin_unlock_irqrestore(&vpe_proxy.lock, flags);
+    }
+}
+
+/*
+ * If a GICv4.0 doesn't implement Direct LPIs (which is extremely
+ * likely), the only way to perform an invalidate is to use a fake
+ * device to issue an INV command, implying that the LPI has first
+ * been mapped to some event on that device. Since this is not exactly
+ * cheap, we try to keep that mapping around as long as possible, and
+ * only issue an UNMAP if we're short on available slots.
+ *
+ * GICv4.1 mandates that we're able to invalidate by writing to a
+ * MMIO register. And most of the time, we don't even have to invalidate
+ * vPE doorbell, as the redistributor can be told whether to generate a
+ * doorbell or not.
+ */
+static int gicv4_vpe_db_proxy_map_locked(struct its_vpe *vpe)
+{
+    int ret;
+
+    /* Already mapped? */
+    if ( vpe->vpe_proxy_event !=3D -1 )
+        return 0;
+
+    /* This slot was already allocated. Kick the other VPE out. */
+    if ( vpe_proxy.vpes[vpe_proxy.next_victim] )
+    {
+        struct its_vpe *old_vpe =3D vpe_proxy.vpes[vpe_proxy.next_victim];
+
+        ret =3D gicv4_vpe_db_proxy_unmap_locked(old_vpe);
+        if ( ret )
+            return ret;
+    }
+
+    /* Map the new VPE instead */
+    vpe_proxy.vpes[vpe_proxy.next_victim] =3D vpe;
+    vpe->vpe_proxy_event =3D vpe_proxy.next_victim;
+    vpe_proxy.next_victim =3D (vpe_proxy.next_victim + 1) %
+                            vpe_proxy.dev->eventids;
+
+    return its_send_cmd_mapti(vpe_proxy.dev->hw_its, vpe_proxy.dev->host_d=
evid,
+                              vpe->vpe_proxy_event, vpe->vpe_db_lpi,
+                              vpe->col_idx);
+}
+
+int __init gicv4_init_vpe_proxy(void)
+{
+    struct host_its *hw_its;
+    uint32_t devid;
+
+    if ( gic_support_directLPI() )
+    {
+        printk("ITS: Using DirectLPI for GICv4 VPE invalidation\n");
+        return 0;
+    }
+
+    /* Any ITS will do, even if not v4 */
+    hw_its =3D list_first_entry(&host_its_list, struct host_its, entry);
+
+    vpe_proxy.vpes =3D xzalloc_array(struct its_vpe *, nr_cpu_ids);
+    if ( !vpe_proxy.vpes )
+    {
+        printk(XENLOG_ERR "ITS: Can't allocate GICv4 VPE proxy device arra=
y\n");
+        return -ENOMEM;
+    }
+
+    /* Use the last possible DevID */
+    devid =3D BIT(hw_its->devid_bits, UL) - 1;
+    vpe_proxy.dev =3D its_create_device(hw_its, devid, nr_cpu_ids);
+    if ( !vpe_proxy.dev )
+    {
+        printk(XENLOG_ERR "ITS: Can't allocate GICv4 VPE proxy device\n");
+        return -ENOMEM;
+    }
+
+    spin_lock_init(&vpe_proxy.lock);
+    vpe_proxy.next_victim =3D 0;
+    printk(XENLOG_INFO
+           "ITS: Allocated DevID %u as GICv4 VPE proxy device\n", devid);
+
+    return 0;
+}
+
 static int __init its_vpe_init(struct its_vpe *vpe)
 {
     int vpe_id, rc =3D -ENOMEM;
@@ -224,6 +349,7 @@ static int __init its_vpe_init(struct its_vpe *vpe)
     rwlock_init(&vpe->lock);
     vpe->vpe_id =3D vpe_id;
     vpe->vpendtable =3D page_to_virt(vpendtable);
+        vpe->vpe_proxy_event =3D -1;
     /*
      * We eagerly inform all the v4 ITS and map vPE to the first
      * possible CPU
@@ -299,16 +425,45 @@ static int its_send_cmd_vmovp(struct its_vpe *vpe)
     return 0;
 }
=20
+/* GICR_SYNCR.Busy =3D=3D 1 until the invalidation completes. */
+static void wait_for_syncr(void __iomem *rdbase)
+{
+    while ( readl_relaxed(rdbase + GICR_SYNCR) & 1 )
+        cpu_relax();
+}
+
+void direct_lpi_inv(struct its_device *dev, uint32_t eventid,
+                    uint32_t db_lpi, unsigned int cpu)
+{
+    void __iomem *rdbase;
+    uint64_t val;
+    /* Register-based LPI invalidation for DB on GICv4.0 */
+    val =3D FIELD_PREP(GICR_INVLPIR_INTID, db_lpi);
+
+    rdbase =3D per_cpu(rbase, cpu);
+    writeq_relaxed(val, rdbase + GICR_INVLPIR);
+    wait_for_syncr(rdbase);
+}
=20
 static void its_vpe_send_inv_db(struct its_vpe *vpe)
 {
-    // struct its_device *dev =3D vpe_proxy.dev;
-    // unsigned long flags;
+    if ( gic_support_directLPI() )
+    {
+        unsigned int cpu =3D vpe->col_idx;
=20
-    // spin_lock_irqsave(&vpe_proxy.lock, flags);
-    // gicv4_vpe_db_proxy_map_locked(vpe);
-    // its_send_cmd_inv(dev->hw_its, dev->host_devid, vpe->vpe_proxy_event=
);
-    // spin_unlock_irqrestore(&vpe_proxy.lock, flags);
+        /* Target the redistributor this VPE is currently known on */
+        direct_lpi_inv(NULL, 0, vpe->vpe_db_lpi, cpu);
+    }
+    else
+    {
+        struct its_device *dev =3D vpe_proxy.dev;
+        unsigned long flags;
+
+        spin_lock_irqsave(&vpe_proxy.lock, flags);
+        gicv4_vpe_db_proxy_map_locked(vpe);
+        its_send_cmd_inv(dev->hw_its, dev->host_devid, vpe->vpe_proxy_even=
t);
+        spin_unlock_irqrestore(&vpe_proxy.lock, flags);
+    }
 }
=20
 static void its_vpe_inv_db(struct its_vpe *vpe)
@@ -335,6 +490,7 @@ static void __init its_vpe_teardown(struct its_vpe *vpe=
)
     unsigned int order;
=20
     order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (uns=
igned long)SZ_64K));
+    gicv4_vpe_db_proxy_unmap(vpe);
     its_free_vpeid(vpe->vpe_id);
     free_xenheap_pages(vpe->vpendtable, order);
     xfree(vpe);
@@ -830,6 +986,43 @@ static void vpe_to_cpuid_unlock(struct its_vpe *vpe, u=
nsigned long *flags)
     spin_unlock_irqrestore(&vpe->vpe_lock, *flags);
 }
=20
+static void gicv4_vpe_db_proxy_move(struct its_vpe *vpe, unsigned int from=
,
+                                    unsigned int to)
+{
+    unsigned long flags;
+
+    if ( gic_support_directLPI() )
+    {
+        void __iomem *rdbase;
+
+        rdbase =3D per_cpu(rbase, from);
+        /* Clear potential pending state on the old redistributor */
+        writeq_relaxed(vpe->vpe_db_lpi, rdbase + GICR_CLRLPIR);
+        wait_for_syncr(rdbase);
+        return;
+    }
+
+    spin_lock_irqsave(&vpe_proxy.lock, flags);
+
+    gicv4_vpe_db_proxy_map_locked(vpe);
+
+    /* MOVI instructs the appropriate Redistributor to move the pending st=
ate */
+    its_send_cmd_movi(vpe_proxy.dev->hw_its, vpe_proxy.dev->host_devid,
+                      vpe->vpe_proxy_event, to);
+
+    /*
+     * ARM spec says that If, after using MOVI to move an interrupt from
+     * collection A to collection B, software moves the same interrupt aga=
in
+     * from collection B to collection C, a SYNC command must be used befo=
re
+     * the second MOVI for the Redistributor associated with collection A =
to
+     * ensure correct behavior.
+     * So each time we issue VMOVI, we VSYNC the old VPE for good measure.
+     */
+    WARN_ON(its_send_cmd_sync(vpe_proxy.dev->hw_its, from));
+
+    spin_unlock_irqrestore(&vpe_proxy.lock, flags);
+}
+
 static int gicv4_vpe_set_affinity(struct vcpu *vcpu)
 {
     struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
@@ -859,6 +1052,7 @@ static int gicv4_vpe_set_affinity(struct vcpu *vcpu)
     ret =3D its_send_cmd_vmovp(vpe);
     if ( ret )
         goto out;
+    gicv4_vpe_db_proxy_move(vpe, from, to);
=20
  out:
     vpe_to_cpuid_unlock(vpe, &flags);
@@ -940,4 +1134,3 @@ int its_vlpi_prop_update(struct pending_irq *pirq, uin=
t8_t property,
=20
     return its_vlpi_set_doorbell(map, property & LPI_PROP_ENABLED);
 }
-
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 0db75309cf..b4d50516ef 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -20,6 +20,13 @@
=20
 #include <xen/sizes.h>
=20
+#ifndef FIELD_GET
+#define FIELD_GET(_mask, _reg)			\
+	((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
+#endif
+
+#define FIELD_PREP(_mask, _val)			\
+	(((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
 /*
  * Additional registers defined in GIC v3.
  * Common GICD registers are defined in gic.h
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index dababe97cd..0e82625840 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -236,6 +236,11 @@ int its_inv_lpi(struct host_its *its, struct its_devic=
e *dev,
                 uint32_t eventid, unsigned int cpu);
 int its_send_cmd_mapti(struct host_its *its, uint32_t deviceid,
                        uint32_t eventid, uint32_t pintid, uint16_t icid);
+struct its_device *its_create_device(struct host_its *hw_its,
+                                     uint32_t host_devid, uint64_t nr_even=
ts);
+int its_send_cmd_movi(struct host_its *its, uint32_t deviceid, uint32_t ev=
entid,
+                      uint16_t icid);
+int its_send_cmd_sync(struct host_its *its, unsigned int cpu);
 #ifdef CONFIG_ACPI
 unsigned long gicv3_its_make_hwdom_madt(const struct domain *d,
                                         void *base_ptr);
@@ -326,6 +331,8 @@ void its_vpe_mask_db(struct its_vpe *vpe);
 int gicv4_its_vlpi_unmap(struct pending_irq *pirq);
 int its_vlpi_prop_update(struct pending_irq *pirq, uint8_t property,
                          bool needs_inv);
+void direct_lpi_inv(struct its_device *dev, uint32_t eventid,
+                    uint32_t db_lpi, unsigned int cpu);
=20
 /* ITS quirks handling. */
 uint64_t gicv3_its_get_cacheability(void);
diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include/a=
sm/gic_v4_its.h
index 37b6b92f0c..1d800fdbaf 100644
--- a/xen/arch/arm/include/asm/gic_v4_its.h
+++ b/xen/arch/arm/include/asm/gic_v4_its.h
@@ -52,6 +52,7 @@ struct event_vlpi_map {
 };
=20
 void gicv4_its_vpeid_allocator_init(void);
+int gicv4_init_vpe_proxy(void);
=20
 #define GICR_VPROPBASER                              0x0070
 #define GICR_VPENDBASER                              0x0078
@@ -97,6 +98,10 @@ static inline void gits_write_vpendbaser(uint64_t val, v=
oid __iomem *addr)
 }
 #define gits_read_vpendbaser(c)     readq_relaxed(c)
=20
+#define GICR_INVLPIR_INTID                GENMASK_ULL(31, 0)
+#define GICR_INVLPIR_VPEID                GICR_INVALLR_VPEID
+#define GICR_INVLPIR_V                    GICR_INVALLR_V
+
 #endif
=20
 /*
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 9ef667decb..558f81818c 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -407,9 +407,11 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
=20
 /* GICV4 functions */
 #ifdef CONFIG_GICV4
+bool gic_support_directLPI(void);
 bool gic_support_vptValidDirty(void);
 bool gic_is_gicv4(void);
 #else
+#define gic_support_directLPI() (false)
 #define gic_support_vptValidDirty() (false)
 #define gic_is_gicv4() (false)
 #endif
--=20
2.51.2

