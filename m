Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHCrEfgMj2kgHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA909135C58
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230657.1536121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU4-0002ZM-Va; Fri, 13 Feb 2026 11:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230657.1536121; Fri, 13 Feb 2026 11:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU4-0002W6-LC; Fri, 13 Feb 2026 11:37:16 +0000
Received: by outflank-mailman (input) for mailman id 1230657;
 Fri, 13 Feb 2026 11:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfN9=AR=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vqrU2-0001fQ-BR
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:37:14 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 574288de-08d0-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:37:13 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB9PR03MB7615.eurprd03.prod.outlook.com (2603:10a6:10:2ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 11:37:06 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 11:37:06 +0000
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
X-Inumbo-ID: 574288de-08d0-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voFYj/fI+dv2/gDbLLOZU8tn0PFwxmwh6Zu6409JKMOOqkf8XY7g6sPIx/xB830kzrl2P8o9ZOlXLj+bqDWhjQzwmeED5laDmGfEuZCTxml/Ky3KChTN7td5VC8qkaMmwy1k1I9WaARPDa5BN5oY9aB5bKpKDqqj1JQmbG2cXtfNZSt1E2yUjFqm997LoDDV1yTx+nDktwmVrZabOkeo/O44NJzLKT+OhvWN5NaUJkCGt4sddlhjFCZ8p+IkzW7n6oHnZzxZZmYJapNb2ar0UtPGThMcdB9Cdy3FLi6RlyuwAlp8+TK2gwVtQoEyVczXagZHJqRMNiish1M7KG4HoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mgaqa/c01imoHfkCt8+vCDciT8+gmUNtf4qlSh39+Go=;
 b=BvI1D59x0e2s067rSfVPdtYvR5S/0Z+v8ZIecVMDMWQZIe1xvD07xgtsSPk/lsLfaNZ0makLPEalDT607rKjYsfb8ITZ3iZur/dWdXM+MZ1f/Kcs9B6PjaTe3Z6Nl/qUrsacZP6/+PM57VJboAGXqOoJFrucROSq/bmabmI21moD6hjcbucpk4cottXcqUfsWdUbKuBXhYd5QBl36xl65zj1HS/kymkSRdKOlovAxAIa67LSdsH9SWqs/0TvGKitBLhLPdfqYqsA15tYowMJ6YVDmU8UuLH6ScgJx9Xt7eH2CaPLZ8YZQTwRhX+qjYcktgL9XgNLmqKj38KxeoDVqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mgaqa/c01imoHfkCt8+vCDciT8+gmUNtf4qlSh39+Go=;
 b=EFjOLo2K51eiVE/TWKM9x1MdKVAr2Jgzo0bCaqy0ihgcQYJqqx1arabugW82G6N1VfEEzpMGGmm8JtccEJwrRGwwPNvIF3AIZAyePWmIIsyMjx5Mx1zT0dNmk+UZ3I5vsS302GBXhfQ0jVUuugF3GcM/9q8JMF4WdtAYGEX0X9NbLb1YTkJqYoHYXrkBwQhXRbWhAXm3Z3M3ZyS00a/smjlLhXDD4U4eqkn/3sAqNLA325JSWxg2O847cIoT7OgM99+Hwd+tPH09Cr4uAu9lvKdeeEGGRexvfPjVHGDbixpiBh2lBryvg5ioeNJTYg4IswhoAIJmPXC9/xjXQJycXA==
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
Subject: [PATCH v10 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Topic: [PATCH v10 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Index: AQHcnN0UQQ2Rybdd30qyWy1uKJ9HWQ==
Date: Fri, 13 Feb 2026 11:37:05 +0000
Message-ID:
 <4ed96ed7bbb04c02b09eed63730702398b00b83f.1770982468.git.oleksii_moisieiev@epam.com>
References: <cover.1770982468.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1770982468.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DB9PR03MB7615:EE_
x-ms-office365-filtering-correlation-id: 6091f36a-e073-4df0-b31b-08de6af436f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hdkahDW7wQgpPdP2C/sjFTFS0UlBUPHMyZ2AXVAhNSPQ7/Qn+vmlBqWzdI?=
 =?iso-8859-1?Q?EEUf8Doln+cA7yeFyXpToUn7ONGCtjE2ccUXW66//P6MWbjBeTXgOVsXqH?=
 =?iso-8859-1?Q?q6bkk59ssydK4gF83+oo+9fPgbkP3CVsaUa2OrCg6TNzAMbOgP8q/epPB8?=
 =?iso-8859-1?Q?GnLKOCzjoSt9DPKYrXe3CUALbWzkoL5XfV9RMAsrTlftxhWLwOXju8XwkG?=
 =?iso-8859-1?Q?K57zjJ5WTasxQ8SP9l3UGwy7TYV2eFSH5Ds5sbjaBuhRQAC5ur15E5Y3/N?=
 =?iso-8859-1?Q?vVHmwOyoaHAFTIoNMdJBFfRCjrdr/qTo4nfiqp+uxU1G8Dt1ou4baYjsZz?=
 =?iso-8859-1?Q?RA6gXTZfifRTTVsxkEZQ31VjeQrRM1ukhdzSATDzbirG+bVJCgogsS8tlK?=
 =?iso-8859-1?Q?g0YlKqXUeN6wHJ+RRcktxL+MGYw+R9mpfjf17HTiyAkwtbEB18YPTIf4uz?=
 =?iso-8859-1?Q?rjGrrTPgv1zSxEX+R+wNvl8XMnQpGEWphTIMLW850I/KrdS33eOoOvN4dx?=
 =?iso-8859-1?Q?fH87UfBWTMWyBrePEC8x/yeLd2DS5c49srRqgOArkxw8uSJv2a0n6psZYA?=
 =?iso-8859-1?Q?RhLPs6VyiBZu+pjt9bvyfgi4gIdW54lddIXAqyiAob5ucp6oHbipChnmU3?=
 =?iso-8859-1?Q?3ZT5vdCTG3emcNyDLX9LrIzH9SMQaSAgobZWpj5E+9pe1eJ3QkTbQBCfSS?=
 =?iso-8859-1?Q?9NvQG2JeA5LvAKDz4tqEewFnW7w7e0iLrogxK9e2mPBZYddw4WRa3qKb5c?=
 =?iso-8859-1?Q?5gcRdJS6G8QtzAE/C4FEylRQ2GXFFi+Eeg7Op8sAB0dNSkmp6AB0aN2E7n?=
 =?iso-8859-1?Q?irrmFvJvTh32y+Tm+2y3GxRzZ3FBXzW79XINmTnui+uUJ3k+tBBvcGBV+T?=
 =?iso-8859-1?Q?T7wEkSzoy6f6IdUfanXyk7iZq51JH4PzNcrk6btegmSBJi3u+wHqX3f4bJ?=
 =?iso-8859-1?Q?HDMvhSRWpXF0pEQMP1qQqzEmjb/u3+6aXAFagpP6dCrdV5oxlQTVUCTEEY?=
 =?iso-8859-1?Q?VHEZqp8gKGhZ7IC/DMKXpfQeYo7zU/ZJtzDMh7qef7HQAHd3Eac2fVMyHx?=
 =?iso-8859-1?Q?gTZrIUE2dBnYCmjdIiGjbANE2qlEclXY1hpxwjQaFRJChtcgCcwPVv57Kf?=
 =?iso-8859-1?Q?aDY5E1zlDsAgPTDXrdxlOZE0KqmISAEZa5QL4v3VItEn6GtE8h5N9L3Fw5?=
 =?iso-8859-1?Q?U7Z+Uf6gvgqzfoZTr5cJpzHg6mqAbyEZDtVMwjxoJHKlor2rGU2pgDBkVe?=
 =?iso-8859-1?Q?mzhIFAoCsxk3LwH1RUBAPP5ErOmlrgDkfmeJky7PAPIokjdqk+EFwgtN25?=
 =?iso-8859-1?Q?RPxV0FWhrl3yJxVRmFKIGxN4Ftht0vxAdzSBEX1QfiXEycSWroNZCezoht?=
 =?iso-8859-1?Q?Tl2+Z63qf+Mg6h4BbJBUvuzhvvJbeBrB5cUUjL36jFDUR6xlgULQoh3fdb?=
 =?iso-8859-1?Q?1kZsGduJDVE/GJDekM7kXlOUGxWDn1jUyOESB5Cry/XhLF3B0GPb5WJgsX?=
 =?iso-8859-1?Q?UhoglWyeN8pkJXtiou80OxeTjZm+borkPaEJoRqlEObNN380PPhFPlqO1N?=
 =?iso-8859-1?Q?RF3PqpYYu2K1wcooeE3byoxtevTbEOpHIF7G6lvos37G30K81rupmfmKcC?=
 =?iso-8859-1?Q?Xx4OSVw/n0o/WcOaRSRnfPbyGh5gem8woA1w37J3ejM6xKl4o0RsLeb9l+?=
 =?iso-8859-1?Q?X1lb/Qec/M4d1azyLt4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XcaR6JCwaEo9Uu1f62TAFOZpWT8sJDAWjDODHnpHf3KUIF8AOf+l0oaStC?=
 =?iso-8859-1?Q?DmMGvN+JFvOAsuNLbUzK3e48tvEhA+iBJoZkAzs61i6RrQMRADE5EWYifS?=
 =?iso-8859-1?Q?OvvB89kXr5Xj1YMSi5m1ter/WTvmYCuCze3PCfdJm5MZmCTR8ldaOdpxfE?=
 =?iso-8859-1?Q?IfdoLmdy0NX960gIpta+aXUqUw8wk+NB8hMpcEmT5ZO94wQiueOC00+0g9?=
 =?iso-8859-1?Q?ZJVq7ZApjpPU2DFM1KRPTQtqrTJkk5mOlKCHcsEyfBIaAs7W/GhF9FZ7ig?=
 =?iso-8859-1?Q?HDucfxBIEVCcIABllWLI1IK6yrhnBzB0x33ej6KmVLYQuvQYxgjFYnm/Y5?=
 =?iso-8859-1?Q?Dls6T2aD3jGTPFTcFbNPBWOpO41ClcUFe6II0jnQzyMmLJ03XGjL+Kox0B?=
 =?iso-8859-1?Q?scqAmrgDWZunS8Vaqn1p1T0UQHWMLeL35hP6HQx8nk1/zYH5ekpEE6KROW?=
 =?iso-8859-1?Q?uIFpeNT5h13CJFari2HuhCHjj8CVJ1K31sjHRDM+LnLHNUKbKwQbnZuWaZ?=
 =?iso-8859-1?Q?Hm+RP2lye9URkayfbpY8W5364jlRJGDGJxcYS+hxmsD6aOHfqPB8chelr8?=
 =?iso-8859-1?Q?13SxRf9FVJ+hWSS+If2OxRkxIyXxkr11y5OdBIAKGFUXmI5tI9iKvOppRW?=
 =?iso-8859-1?Q?IJf5PVTJRXAkqECa86ErRrRyAi3XX8+NeKiGSg1lYO/QT6qcc9jNUaBhzV?=
 =?iso-8859-1?Q?onn/zMY5gPrp9LS3LjmP9umUUR7Xb0ueb8NUmim+malF6iuwq/MiSMwtUI?=
 =?iso-8859-1?Q?eao/J/JPRvlOSoT781piRMUCjbZwsH3bwfcZmSlBYqeE9aFahUosivDuvk?=
 =?iso-8859-1?Q?THq5FjuICpnppHIQVAnsLGFr5xAsf1A2t2uXyozjAn16NSf1JOVEYkv9lB?=
 =?iso-8859-1?Q?ZQZISzx7FKmI+pQYpK5Y/O0xc6XRE2E5AS3A3zjYNVVUZ0GSTSE6l3LKj4?=
 =?iso-8859-1?Q?NMarT0aPWvymPahOfIRcitJVB7vt/KnZnToLwt1zYDb/tQPHXoADxuqATL?=
 =?iso-8859-1?Q?PsyVWMh7k2+DxVduBDs9iqxVpsu0fR7t1BkHVE1P1ux8t0zPxf3kVFeOHl?=
 =?iso-8859-1?Q?FraFSuO8gGroMNJrgmMrvMDukWhcMlhH3EmoaaNslPQOjpTnR5nPI7izI6?=
 =?iso-8859-1?Q?KtjO0Xr/JCtMBiQfhquX4hBS0pjl9QLJYXN48jHJIiHPAT1EzcL5x2ZJwc?=
 =?iso-8859-1?Q?SjUEyjrgwbEu2xcw9eBtMCWJLsU+rl3F88b6kDvvMrHjKZrEfONjViJam7?=
 =?iso-8859-1?Q?DnNgqVC+ZGWf3v2keH5yqo5hUX34RfvwVAIxYuEhnu8aVMJtpApgBV3oB6?=
 =?iso-8859-1?Q?bC317txbkOtPCNU8ciRogvNK6hejmtgbYmf0t+jcTiQ1gK3kba9aok6IZs?=
 =?iso-8859-1?Q?th8sEkZFKq1V2KIf2AHrE8m8PCb6pZbKCYJ2PApAGTZtcS8Fp3s6+X98PM?=
 =?iso-8859-1?Q?rZ9JGr+PxIkFFbcj+SC87H8M/n+pgw7TSSqTAG5h4khoutawK/79e12Hj7?=
 =?iso-8859-1?Q?C5xccorcl+fQ4UlPsc3GRY8EEGK3lnDSJRDjPi6V0cZnwTEr65iEj1HFdl?=
 =?iso-8859-1?Q?Ll8H/2HkM272l+88MGc2yWyfa70HE4szEzr8sjQDX4dx8M74Rd3mcN11ej?=
 =?iso-8859-1?Q?BQ97OYCS30FnUWtyiQO7/SPlbEcPr1o6QAtE9PhlqJmk9EW3t+XxS8aN4t?=
 =?iso-8859-1?Q?XQvuev+a3YZafB86YpWbtxLMtuSrZHTEkLc9m6/spfwTT+v0fF46qAU4d6?=
 =?iso-8859-1?Q?UmtHDv1dRk/tA6oDM0p2lR4bgXc6oME29GQuCJ8Ex87A5DyMFcH1KzZKBM?=
 =?iso-8859-1?Q?eS5BijMkjIs3/WaKbAkCNQn4ILo4Li8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6091f36a-e073-4df0-b31b-08de6af436f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 11:37:05.8148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZAxnx82svNW82ONmef+8fir3LIiirSmMkEM2utTSXEoZ/s8MMqQWTM2v1DZyGxMV2cG7kxt9c0i5yJ7K5+YrFo/kq+ehnvIpjH1jZkmIoYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7615
X-Rspamd-Server: lfdr
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
X-Rspamd-Queue-Id: AA909135C58
X-Rspamd-Action: no action

Plumb the SCMI SMC multi-agent type through the toolstack:

- Extend libxl_arm_sci_type enumeration with scmi_smc_multiagent (value 2)
- Add agent_id field to libxl_arm_sci structure for per-domain agent assign=
ment
- Update libxl_arm.c to translate libxl config to XEN_DOMCTL_CONFIG_ARM_SCI=
_SCMI_SMC_MA
  and pass agent_id to the hypervisor via xen_domctl_createdomain
- Add xl.cfg parsing for arm_sci=3D"type=3Dscmi_smc_multiagent,agent_id=3DN=
"
- Document the new xl.cfg options in xl.cfg.5.pod.in

This completes the userspace side of multi-agent SCMI, allowing xl create
and dom0less configurations to assign unique agent_id values to domains.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v10:
- Split hypervisor and toolstack changes into separate commits

 docs/man/xl.cfg.5.pod.in         | 14 ++++++++++++++
 tools/libs/light/libxl_arm.c     |  4 ++++
 tools/libs/light/libxl_types.idl |  4 +++-
 tools/xl/xl_parse.c              | 12 ++++++++++++
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 27c455210b..e7f8af6156 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3156,8 +3156,22 @@ single SCMI OSPM agent support.
 Should be used together with B<scmi-smc-passthrough> Xen command line
 option.
=20
+=3Ditem B<scmi_smc_multiagent>
+
+Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI ov=
er
+SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmwar=
e-A)
+with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
+specified for the guest.
+
 =3Dback
=20
+=3Ditem B<agent_id=3DNUMBER>
+
+Specifies a non-zero ARM SCI agent id for the guest. This option is mandat=
ory
+if the SCMI SMC support is enabled for the guest. The agent ids of domains
+existing on a single host must be unique and in the range [0..254]. UINT8_=
MAX
+(255) is treated as invalid.
+
 =3Dback
=20
 =3Dback
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e4407d6e3f..be0e6263ae 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -240,6 +240,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
         config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
         break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_M=
A;
+        config->arch.arm_sci_agent_id =3D d_config->b_info.arch_arm.arm_sc=
i.agent_id;
+        break;
     default:
         LOG(ERROR, "Unknown ARM_SCI type %d",
             d_config->b_info.arch_arm.arm_sci.type);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index 4a958f69f4..9bfbf09145 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -554,11 +554,13 @@ libxl_sve_type =3D Enumeration("sve_type", [
=20
 libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
     (0, "none"),
-    (1, "scmi_smc")
+    (1, "scmi_smc"),
+    (2, "scmi_smc_multiagent")
     ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
=20
 libxl_arm_sci =3D Struct("arm_sci", [
     ("type", libxl_arm_sci_type),
+    ("agent_id", uint8)
     ])
=20
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1cc41f1bff..2f1b475022 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, lib=
xl_arm_sci *arm_sci,
             }
         }
=20
+        if (MATCH_OPTION("agent_id", ptr, oparg)) {
+            unsigned long val =3D parse_ulong(oparg);
+
+            if ( val >=3D UINT8_MAX ) {
+                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%l=
u). Valid range [0..254]\n",
+                        val);
+                ret =3D ERROR_INVAL;
+                goto out;
+            }
+            arm_sci->agent_id =3D val;
+        }
+
         ptr =3D strtok(NULL, ",");
     }
=20
--=20
2.34.1

