Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEBFLH/NgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6EBCEC62
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218795.1527701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZb-0001wU-Un; Mon, 02 Feb 2026 16:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218795.1527701; Mon, 02 Feb 2026 16:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZb-0001ss-Kw; Mon, 02 Feb 2026 16:14:47 +0000
Received: by outflank-mailman (input) for mailman id 1218795;
 Mon, 02 Feb 2026 16:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZZ-0000fY-1G
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:45 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47b44db1-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:41 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:39 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:39 +0000
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
X-Inumbo-ID: 47b44db1-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Erbisb+Of+SlMSdxM72a2OwcpAzZU303H66E5pwuV2nddPckGsF0KjnEETALJUai2jcGQB5pWf8znDlgtM7enkOFqePYJgj9I+MS1EhaKaqjYo9BOmDlAMPf5bX4zJ5gyUplFXbRRqybv8uPu8Du8c7DTFocHC6RTTqFdRCGru+6fwIllsRVjWSoIP9V6FBSFcxBVh/rCXBqUIwaMS1uJROsR4ZUZtArqacuGaY4fwBU7FA+PoJQqk6F5FJSQiMQzBNBUsD/WDjZtyRuJqAd/aI7v+rHfNkVXbsiRJRFufX/7G8lG7IJ9hUH6RBZET/eF9te0/2XBe0tYPh5q/6sSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1pz7vCFYxpX9MTz+b8Eqe1m9onDCDzvD7qLN1X6f4M=;
 b=q3lr3ApVth3VcNLXK8GyHLUCcNwlkpgQPgYm9GEl85vcB9FHjlCpaeX8CGnVPX9FbHLdXtZGPq2wNG3h591UJQ1ODIVTSIs6dRPMXovF0Q6Xim2Cjo/49Lc1G6qBHHO8U3trAOgm905wLC5+JHJabotIEmS84EQA5xuJXqdm08mHtZsDKaqo5OG2GaXXTdO3HP8FIwfVCVOfJ7ChpM5/+I47tR5DBXpw83kpcRhF6l88vkDdep3abMTrmr8y2KtoV58JO8X8WQio7eLcFL6A0u3XPzdmCQ9bjWR04b4U2Mwm807ABh+dsnaUQ6eZCj2DglnR5lpY0PFYj0Z830dnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1pz7vCFYxpX9MTz+b8Eqe1m9onDCDzvD7qLN1X6f4M=;
 b=sOAxwG8iNc/ha0SnPilfqyrl3KkDbLt56L0Fa045YBPZCiC9Ef60Z13oWbJFX3VemN4SIbqz18BzDspH6zpBZa47rFjBnUJPhluFLQ7vYUdtFQ8PPHTK1TIBz+KMg1xpXFbA2amoyc0riGvlMTBKa6+7Uonipn3J9bpZZZufEjQkcn0OGfAw8kc/UdehVpCvrrTctaA43zOcJ5kRCgd1pfecK+1E7838Vlx4uTAjT7tl1enfW5LNdu7ex9/GCGbOH6duU/ZOi4QJc5EU8EWOEQYrrRmx5qAWRVsMg7GgMe4vdOLGD1BCgwkHjTURiX7Dd8CdNiTILCpan4nlbRL7UQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 05/19] arm/irq: Add hw flag to pending_irq
Thread-Topic: [RFC PATCH 05/19] arm/irq: Add hw flag to pending_irq
Thread-Index: AQHclF8IAwxlbrsSsEO8DhPwxpUVpw==
Date: Mon, 2 Feb 2026 16:14:39 +0000
Message-ID:
 <5d63b3b4c9c7b43e7cd8afdecbcf0b2c77f51d13.1770046465.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 895c550e-c48f-45b5-6e73-08de62762a8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+YFxjRX6cW5YnTOVwX9rfJF4ANjYhwdBIzBs4E2XeLMno0PhuF56bHd3kB?=
 =?iso-8859-1?Q?vfJpZPH5JjKsRmKpg78AVZBaHao+hIpiYUJW2U2ihHWPslzImDQV7+Bhzs?=
 =?iso-8859-1?Q?NVa4g2OVWUXVuyYj+3h6fU4Mtysd83c6haNh5O+UdXJqput4PA5MfgdBHs?=
 =?iso-8859-1?Q?xErl+T5AGIdrtdxuWgfVq3PP6Cjcp5/lIQ3oELv2VnFmLIdpWV7VLLkTxl?=
 =?iso-8859-1?Q?eU5sURUDyZzqxdsTBnheYi/F3ZMGNortcKy2L7+cw/x5lI5cPGpULhbVCV?=
 =?iso-8859-1?Q?OuffD9XRiNh8OnDbUsoHJD6D14ydPgK26Nh7cAhJM96qK06TUl0sOQgLcl?=
 =?iso-8859-1?Q?ywbxh2S4mG/whoRNKur+9qjel7tue+SpCede5IN2y+xDGWdn7Vp6d4n7JJ?=
 =?iso-8859-1?Q?OIAcLKIPno6i/J030GTWu7OP7DeoS/zkMgHOSkeAcoCKZxNxxHwWPNOa+Y?=
 =?iso-8859-1?Q?WfNDkuND80WYPP2P0urVxmnF0hdk8W71P84jHbXRdJGtnUiSEpI+pzVJ8N?=
 =?iso-8859-1?Q?P9jVC1Mnd2TNO6kNn20vk8FlnJr0aBTulwBqExR0CsxJA/xu4srpGWxkmz?=
 =?iso-8859-1?Q?dnOsoJiH8buuhHOBJo/SBopGOdAWbUrBbdCyCNgflwcSxmDvccJb0F3ea4?=
 =?iso-8859-1?Q?p7iqvXmZAqe7QVf+t0Y+eGx1QCgxWcSTNC5ArDkLQbDlV2XP0FgLZTafgq?=
 =?iso-8859-1?Q?CHQ1Mvft/pQdMKQ4xZkHJY/XdBeyRWTNGGRkQYVJaZXwESmIfh86Yu+yN5?=
 =?iso-8859-1?Q?u5RprkDhmgH1ZMJqoQNcZWpkzI67YCa6Wf5OQtIINUD/qS1vxvV4qHYN5r?=
 =?iso-8859-1?Q?kNjplVusG6TTlh8gSMvZzhQZHZfAwr0pF+c6K6P0MFFMht54eDGNvLIkYJ?=
 =?iso-8859-1?Q?PWIjy2HAERftvM8cWsG6Dz98jXCXh/YNRxuHeZ/82nahH1wadkrM5B2PPk?=
 =?iso-8859-1?Q?W6zyQleod8BEBbA2MOoOVYdTDq24+NLpUjCzz4GioyufAIK0cGXLWRS53R?=
 =?iso-8859-1?Q?203lvH4QltfOBfIiDPJXww+Ob9q3FujBmfT+9MyBsU33o+bU/YlAdp7R8C?=
 =?iso-8859-1?Q?+WNNEup/s64Xh1Yg4Q8Nca8s0EPu/7cfd7wlC9AVaVMhblAh6nNmQiNJPk?=
 =?iso-8859-1?Q?Dd29cH0d+0XRqNz4AG/F6Nnchh62+GGYDFt3P5gavCWeSgfI7o+4D6wSlJ?=
 =?iso-8859-1?Q?tQkz4DQbd8ojLIM8pEsWyWgY/PtQtz9avRwkdQ0PVP3zC5pcbOFzlOZLcA?=
 =?iso-8859-1?Q?RboC8SgqYHan3+loyU6z34mvfCPa7Ep9+/FLyn3OpBi4GgMyL3Rth9u47B?=
 =?iso-8859-1?Q?Hn6LvZjos0AMa5o+fqRxmNH00UR7CqC5sHPFmHm9FPCNjEoomW7bFd0O+p?=
 =?iso-8859-1?Q?2xevZaWi8kutGqBa1SMtgh+Au8gQSY5eJwk5XWyy/xkZPrkLDH48O11A3A?=
 =?iso-8859-1?Q?yPq9ISz+WKba1yxaulGXIzyv6ZDe8Ikc5TFKK4/ULCTjwouW8EVUHA+0in?=
 =?iso-8859-1?Q?Lk8pdovxMTISdaFqinktupSuAWjTzx6mTICjFeoVEF9xKyIirVt4x867j5?=
 =?iso-8859-1?Q?RKrIQKZCuTo/EsjEubpGVlQwHSGCiHK1xx0Di0WTNYb6bjGwcqViK+rsDg?=
 =?iso-8859-1?Q?AvyE02bPzTYteDj4c0p/cTKPYhImoXfdcYri+0ipSABlw5m6G1eZITeLyp?=
 =?iso-8859-1?Q?uD9TwrJQoyi7LQHO934=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fpQsk3Q9v17BnWAuFXt/nokrqeT/dhkWGo0TE167OSuzQQ6yZjcKZprXd2?=
 =?iso-8859-1?Q?A+MV8hz66gCrMDJnBB5deE5ZiLfWjspY13wW8p2RjkPBnkoSbZIymuuIDi?=
 =?iso-8859-1?Q?wkPJT0mB6dLIxyWu2vx49hFPEgDdk/rcem3k1R0GItsRaVC6jarFMfaNNr?=
 =?iso-8859-1?Q?XXA3Bb34bsBn0Y5yY9K0sLRSSsc9kQUvoTmebrBm+4yowF8xbVqHvqc1ju?=
 =?iso-8859-1?Q?CyaAu/YEufVVU67W080u41Xo2uiAnyCX9fqgugCplMN/5RVX172DzhxzWu?=
 =?iso-8859-1?Q?p+zodqXzakLJVp3R/FrxcFOHync9Q5jKrezdf1FJjAxsOwlZCb5vNS80jB?=
 =?iso-8859-1?Q?NeGlmkEK9rhz/H3rJPYvk266DRmLIzsunz7FTg4L1yJw518rYaPAMNEvBj?=
 =?iso-8859-1?Q?AQeMK7VIJnht9L/wZweB0bSZpEzZyGTk1YxnmA1xycyc7eB+DuBn+yjhUp?=
 =?iso-8859-1?Q?s56JM7BLkjrVAie6w9CuV0EUzkPOzZXvrVpGM8B5JqUrzvVVnidn7MOqpk?=
 =?iso-8859-1?Q?tUx1kGribyWie5CGj3RwdQv2cR8paWIkwAhm2QkOPF/M1KU75xRkUbHY6v?=
 =?iso-8859-1?Q?oENf9bEfEtpPE+XdsrQD7qQskyaM040aJMCwJnfCjFU+9osxyZqmTspCNO?=
 =?iso-8859-1?Q?qdAG+vnsIaMagLNJg+1NROXDf2GirDivscGz/e3Ey9zZJ6bIa14WkCCUY+?=
 =?iso-8859-1?Q?qoxMulnyKbmIVj1m6vWPwdxQC9MHbXWtsdp9h3VUt8f31HH0bvtKI0b21B?=
 =?iso-8859-1?Q?B1jzUWqd3VId6AVexUhQsK2fDsmFI9f8gOFs6yPUfdjS8SYkQAVQt4tmus?=
 =?iso-8859-1?Q?KgQYRDzKDeJfoCs7ae7KkCFHArJqvmn/h4PVzDBWvHG0lYTzLNQLZFAKal?=
 =?iso-8859-1?Q?DNx29upCuhjbAHrNbkW78R1xvwh2UeZhQBfzQKZuy0DJHrFA4B39q0UmRg?=
 =?iso-8859-1?Q?bZMXX9orf8d8yz7CMmpIogjMF2mtpf5XqUf3+6GyKNMB7oR11J+rpkYTv3?=
 =?iso-8859-1?Q?uGhhOs/8+x8+e1rCG4h3mBs1WyUC9hmdifOObLFb/u0J6hizKmdFINxbiY?=
 =?iso-8859-1?Q?mn3zKxh6dluSpwrTj6N3zYS0jX+KmZ9RsOM/eHpYmKwZQcy52IidCy0pPn?=
 =?iso-8859-1?Q?4y6Qvcf9uKT1h7uta62szB5RAN4GnbpjXRgphPtQQv9hOzBJ3PCjPZNyPY?=
 =?iso-8859-1?Q?8hdn7KfKPeXcLTreH5MHyvW0zln0UPK4VHuzV980X56UDlvhHtHXM6wpXN?=
 =?iso-8859-1?Q?jW1VsST4nVJN2mSX/6linX/mYAXgxXopZg5aJg8VP40HYPFEJWn7eIda2h?=
 =?iso-8859-1?Q?PW8L7Kn+mE8O5ji/5W6NtM0lDz2F92lJ5eny3cGZM3oxnYp1LUznunSf59?=
 =?iso-8859-1?Q?Zlu5/lCMC3EP7G6H5658Kl3hY2F3SFYPP9seheBynIrXvF5t0+mHfixrL4?=
 =?iso-8859-1?Q?gUQVbo9FDwNAqFt6XeJARz6mgNQgM5HLAdKBCsGvN6JFwbIfQUSB2Wq4AF?=
 =?iso-8859-1?Q?uYfPJyqumHY3x5DvDmy3KDhnh4Fm3i2nBSz99HpfnjA4Fvj+VesjpuJZ42?=
 =?iso-8859-1?Q?1z0Q51DEQUaY3YPo9MvsoyicTnV03/+Xnmfcfyl6EIyBp41HlHS8g/uTsv?=
 =?iso-8859-1?Q?iUnXRLuR/RcaTw9vwhC2BzGaMxb/nx6j+AbSOhpLhgMnvtTTNqW+wXinc+?=
 =?iso-8859-1?Q?LfW1gXFXVJkd1HxhOP6ZpljXq9fFHtk0uivJRFVNlcZTbjxUEXxPue/bzF?=
 =?iso-8859-1?Q?JdyF+y72yJQGeFimMi7rYGHSErlZYNljCWVENIGoEZYv13WVfYLVa1ZUxo?=
 =?iso-8859-1?Q?/QMnYrQwohpUeG9zz+tyAsMWbjFGkJU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895c550e-c48f-45b5-6e73-08de62762a8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:39.2434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JXwwlmfxxG7ZsUUcxaQHvqiFUQpNvhKMdIy/f2xQ4FSCLGChlRqbjpvhj/NfN2X7cMLBcuwh2/Jm9P2H3X2iSg==
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
X-Rspamd-Queue-Id: 4B6EBCEC62
X-Rspamd-Action: no action

Add a new flag to vgic_init_pending_irq() so that we can record
whether a virtual interrupt is tied to a hardware one. The ITS code sets
the flag when mapping an LPI on GICv4 systems and the cleanup path skips
removing such IRQs from the virtual queues to avoid interfering with
hardware-backed injections.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/vgic.h | 15 ++++++++++++++-
 xen/arch/arm/vgic-v3-its.c      |  4 ++--
 xen/arch/arm/vgic.c             | 10 ++++++----
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index a874a02d70..77323b2584 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -94,11 +94,23 @@ struct pending_irq
      * TODO: when implementing irq migration, taking only the current
      * vgic lock is not going to be enough. */
     struct list_head lr_queue;
+    bool hw;                    /* Tied to HW IRQ */
 };
=20
 #define NR_INTERRUPT_PER_RANK   32
 #define INTERRUPT_RANK_MASK (NR_INTERRUPT_PER_RANK - 1)
=20
+#ifdef CONFIG_GICV4
+static inline bool pirq_is_tied_to_hw(struct pending_irq *pirq)
+{
+    ASSERT(pirq);
+    return pirq->hw;
+}
+
+#else
+#define pirq_is_tied_to_hw(pirq) ((void)pirq, false)
+#endif
+
 /* Represents state corresponding to a block of 32 interrupts */
 struct vgic_irq_rank {
     spinlock_t lock; /* Covers access to all other members of this struct =
*/
@@ -360,7 +372,8 @@ static inline paddr_t vgic_dist_base(const struct vgic_=
dist *vgic)
 extern struct vcpu *vgic_get_target_vcpu(struct vcpu *v, unsigned int virq=
);
 extern void vgic_remove_irq_from_queues(struct vcpu *v, struct pending_irq=
 *p);
 extern void gic_remove_from_lr_pending(struct vcpu *v, struct pending_irq =
*p);
-extern void vgic_init_pending_irq(struct pending_irq *p, unsigned int virq=
);
+extern void vgic_init_pending_irq(struct pending_irq *p, unsigned int virq=
,
+                                  bool hw);
 extern struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq=
);
 extern struct pending_irq *spi_to_pending(struct domain *d, unsigned int i=
rq);
 extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v,
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index bc738614bb..576e7fd4b0 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -610,7 +610,7 @@ static int its_discard_event(struct virt_its *its,
=20
     /* Cleanup the pending_irq and disconnect it from the LPI. */
     vgic_remove_irq_from_queues(vcpu, p);
-    vgic_init_pending_irq(p, INVALID_LPI);
+    vgic_init_pending_irq(p, INVALID_LPI, false);
=20
     spin_unlock_irqrestore(&vcpu->arch.vgic.lock, flags);
=20
@@ -749,7 +749,7 @@ static int its_handle_mapti(struct virt_its *its, uint6=
4_t *cmdptr)
     if ( !pirq )
         goto out_remove_mapping;
=20
-    vgic_init_pending_irq(pirq, intid);
+    vgic_init_pending_irq(pirq, intid, gic_is_gicv4());
=20
     /*
      * Now read the guest's property table to initialize our cached state.
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 6647071ad4..0da8c1a425 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -112,7 +112,7 @@ struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, uns=
igned int irq)
     return vgic_get_rank(v, rank);
 }
=20
-void vgic_init_pending_irq(struct pending_irq *p, unsigned int virq)
+void vgic_init_pending_irq(struct pending_irq *p, unsigned int virq, bool =
hw)
 {
     /* The lpi_vcpu_id field must be big enough to hold a VCPU ID. */
     BUILD_BUG_ON(BIT(sizeof(p->lpi_vcpu_id) * 8, UL) < MAX_VIRT_CPUS);
@@ -122,6 +122,8 @@ void vgic_init_pending_irq(struct pending_irq *p, unsig=
ned int virq)
     INIT_LIST_HEAD(&p->lr_queue);
     p->irq =3D virq;
     p->lpi_vcpu_id =3D INVALID_VCPU_ID;
+    /* Whether virtual irq is tied to a HW one. */
+    p->hw =3D hw;
 }
=20
 static void vgic_rank_init(struct vgic_irq_rank *rank, uint8_t index,
@@ -202,7 +204,7 @@ static int init_vgic_espi(struct domain *d)
     for ( i =3D d->arch.vgic.nr_spis, idx =3D 0;
           i < vgic_num_spi_lines(d); i++, idx++ )
         vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
-                              espi_idx_to_intid(idx));
+                              espi_idx_to_intid(idx), false);
=20
     for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
         vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i],
@@ -304,7 +306,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_=
spis)
         return -ENOMEM;
=20
     for (i=3D0; i<d->arch.vgic.nr_spis; i++)
-        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i], i + 32);
+        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i], i + 32, false=
);
=20
     /* SPIs are routed to VCPU0 by default */
     for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
@@ -381,7 +383,7 @@ int vcpu_vgic_init(struct vcpu *v)
=20
     memset(&v->arch.vgic.pending_irqs, 0, sizeof(v->arch.vgic.pending_irqs=
));
     for (i =3D 0; i < 32; i++)
-        vgic_init_pending_irq(&v->arch.vgic.pending_irqs[i], i);
+        vgic_init_pending_irq(&v->arch.vgic.pending_irqs[i], i, false);
=20
     INIT_LIST_HEAD(&v->arch.vgic.inflight_irqs);
     INIT_LIST_HEAD(&v->arch.vgic.lr_pending);
--=20
2.51.2

