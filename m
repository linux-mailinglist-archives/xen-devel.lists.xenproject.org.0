Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E36A77E31
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934520.1336202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcvc-0002BV-Rn; Tue, 01 Apr 2025 14:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934520.1336202; Tue, 01 Apr 2025 14:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcvc-00028i-OL; Tue, 01 Apr 2025 14:49:24 +0000
Received: by outflank-mailman (input) for mailman id 934520;
 Tue, 01 Apr 2025 14:49:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hrmQ=WT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tzcva-00028a-UN
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:49:23 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e386e76-0f08-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 16:49:20 +0200 (CEST)
Received: from AS9PR06CA0566.eurprd06.prod.outlook.com (2603:10a6:20b:485::27)
 by AS8PR08MB9888.eurprd08.prod.outlook.com (2603:10a6:20b:5ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 14:49:15 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:20b:485:cafe::ca) by AS9PR06CA0566.outlook.office365.com
 (2603:10a6:20b:485::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 14:49:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 14:49:14 +0000
Received: ("Tessian outbound d933a9851b56:v604");
 Tue, 01 Apr 2025 14:49:13 +0000
Received: from L57e4fcb3af52.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB63007D-FF76-48DB-820D-339FB22D78DE.1; 
 Tue, 01 Apr 2025 14:49:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L57e4fcb3af52.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 14:49:07 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9739.eurprd08.prod.outlook.com (2603:10a6:20b:605::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 14:49:05 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:49:05 +0000
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
X-Inumbo-ID: 7e386e76-0f08-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jS3vU61gwIWrUyf+iexoekfuvhBfQDhl49izRVqt/UqUayeh4yv/hbZHiqyMO7pLfvClLxRnNsbwfBVkIQoMY5dPZTNIKG8CgHwCGHJF8VPPP4pRwH7yFDpw7U9kU0LRfFviF0jpZ6VXjt1zKBRZ4t1blZExxfWzM7S4Q2EzUEJ//Z/iKuSFz9YYWcfh4WS6t7tY/TzGzXOhxTrOjValL9hb/PHTQpD+JE0WrYew5EwFLHMFsGgf3/r/a9OC8D98/r3THOnusdKkjOCyr4xo9M0yJ0ounmzHqryUxW8RnRkfHPgIiEzSctSnlpNTafdBWw8PgVVLPWldGzWrv/56NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBoxAhTMvGTHVvXw6TRdNqZ5477E5cRCBeyA5QD0awA=;
 b=mr+LR2yUDOA0Nf7AUEIwcILw6nmij6vqXEK8NUcDgqKjDn+VOYajVSZFOcnn7veK2orCCqQHlZw5VyWwEaMUAI0QBVVAoVBEA1kOOvM8pGv1xiCXIRjXQCX1aOqLmFSnXkI0Jt5EDYWMt9jWu+ggpjzZXPpnsgLvndoZRcwNZMG560LxSzEFqPP6Y5zF3TPDZIUOBpS04pbqJ8X05wPSSP6Vo8x38p6TjT6NtVB1zOlsb+kJMYYUrDLZVZrfB+1R0Km+z2XqZmGoXDmKnoztTAnzi9kwtTiO0+kQZDegP107ShVstLSnjrr4Z73knS1jOYDTvHcib+7hUm/0LRfnFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBoxAhTMvGTHVvXw6TRdNqZ5477E5cRCBeyA5QD0awA=;
 b=nbHg+7ZicZCqICPt+tIqpcnqcNrmUx2JAkj0ycSkmkk2PUCegnwQGz9Z2Mb20Uh5HXZGCJQZR9VqVbak0MF41YR0xlyvi3JUdUzYgKuJ/PWlS7NfAY1uVXptP3Lu3Az1BEKe4r3avR8rCSN7VZrfPF2OEYAL1A5ywxidQJiF+jw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 45346fb1b0927520
X-TessianGatewayMetadata: B+XeTytQrhw3kQ/pw0LwH/OPjFHhlcfJNV/15Nr5CAkwHlEv6BQULan9XY9jpLyGMqTXam84mgOTxT4t0QOAX+cDwGALZTKHmAaFVcxQgREWBmy+v0b0hQTMADEkcZaKAjqgEscu1cmYron96P8f3uy+4ZKiSWueuyS3s6KAHB8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d24qkDXRrfX4egOHecja84hbUyCOQa2jpbjzi55wsltB8Zw48sCrDS9iK7Uy0PR1GvPYE4WPeBLWuJHOKQKtxKdOjwPJLS7VfRSms/WE5XytpYZcndx4nUXl2xBXj7INTe1mGVVwc7BCl6dEfjOwBV3n8XdjS17BM9fRXWwEfntrt1A97pB8WafOLYSG8gz3a3yu2g1bmMolzNkKjCj3ok5WyPrPpzPMXQ93qaFAnJ4uXwXzxepRSw78HTqvEsEE1o4v/JFAMu3HMKhHH3ccyxoCJgxgIbnZsnzR6piB4putSZDJ9pdT+XB0IMzhFHLn3b9qGyQfnxH8YSPlSfsIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBoxAhTMvGTHVvXw6TRdNqZ5477E5cRCBeyA5QD0awA=;
 b=rIqgQ2+RrucAiIzXQ6YmJuIi4PcI6l85kRWnEwLeonrCkv7573bX8rOTFa5v0y6VMYGyGweZSlt8O3M1O4j+PaEdnTVwwJE3Xbm8T6otGMyFIMtajeyIYMweUBEl/5XXcskzCEtojAFblymKkbtH32Lo1nc6TAMKaVS0kPMzUNMErGZtNcUkt85p43POJy6wwf0onUJ4+FDiUlZeovrZslyZKNaz86HkhCbyFWWxaCRvH9YQEoS3Eob7+uIl1Zz7bDAM+t/TvYvdwf+iU6Z3ZLXHTK3yPQvPZnd1vMwz0tA/vS3JjZ7tKmBH/ci0m1s/VtmNT2cTkFoluz6mTanRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBoxAhTMvGTHVvXw6TRdNqZ5477E5cRCBeyA5QD0awA=;
 b=nbHg+7ZicZCqICPt+tIqpcnqcNrmUx2JAkj0ycSkmkk2PUCegnwQGz9Z2Mb20Uh5HXZGCJQZR9VqVbak0MF41YR0xlyvi3JUdUzYgKuJ/PWlS7NfAY1uVXptP3Lu3Az1BEKe4r3avR8rCSN7VZrfPF2OEYAL1A5ywxidQJiF+jw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Topic: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Index: AQHbouXQNh7nKprt5k2iUHPtnXy/N7OOxVgAgAAX+QCAAAdEAA==
Date: Tue, 1 Apr 2025 14:49:05 +0000
Message-ID: <237153F4-56B2-40AD-A2D4-824B621D3477@arm.com>
References: <20250401090937.105187-1-michal.orzel@amd.com>
 <3D313BC0-75C9-4208-9067-C1F6153B3859@arm.com>
 <f7a6dd50-28d9-409b-8740-f4433f2fd72e@amd.com>
In-Reply-To: <f7a6dd50-28d9-409b-8740-f4433f2fd72e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9739:EE_|AM2PEPF0001C70E:EE_|AS8PR08MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: df459a68-69ec-4f77-2252-08dd712c5f54
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?9kl58yCHIEeG9yWA3zvAflHtS1iCQTf6gWAsz3BaQ1mdqzCSyz6vy57K4goy?=
 =?us-ascii?Q?hvuFoTYjqL9bizJlvIL165O/EGerPtf2+U+STMU9LWFfN4tC03SYYVTo5GLQ?=
 =?us-ascii?Q?fnpMz72VmSuY9yy7Kt3cMmraYFz8hyAP9TQFAamPSoG6qimTVZwET4VhC3UG?=
 =?us-ascii?Q?UdisN2LvwJ3gbevBR6zJV1IUKek/lcsYdcTCXxLm45FDPxCZy7pbkv3he0DP?=
 =?us-ascii?Q?xCNdOh8BHX1j/0QooyU0EiRY3JNsurFXQGyfo+f5PNUbdFe0QjWrhZC6N3/4?=
 =?us-ascii?Q?xnNbZx95aQZgbWVIN/JTvt6wRdot2+RgMITvPaZF6HG2gj63VeVbxH2b+dHX?=
 =?us-ascii?Q?2YM3bAxcgT8AWnhpyh4SNsFbltef4HHNiMcT/cOf7tbubxKDrsZppLNPfFc3?=
 =?us-ascii?Q?cnBbzizdQ+fHDv2Y8ibq1FF8cOZL8hoihSEt/pTs4OcGavkJgLU42Tvyek1v?=
 =?us-ascii?Q?Ox0Dme+gdDTry/B1kwmwg9QdTZDlyWxjM6peQmspAaw2BO13/bNNjY3ijneV?=
 =?us-ascii?Q?oikuOILd71EnBjLyQGK/X93AOvwFHgxyYmLsdX0emjVR5l4ftaVbr4oDXcSd?=
 =?us-ascii?Q?1s1r0DFKRcWaAmwpnSXegqEvZ5uZD2D/6E9QSOG/kx+m4jdJksu4LYcM4V+/?=
 =?us-ascii?Q?3GzIN3f6XIRL2nobuLre2oeqNVFEJ6c463nCLG0CzwY541l4On0d/8rohVd7?=
 =?us-ascii?Q?iypeOZ7bYSrhDok8OPNvEOe66eJ8wMKeJxkX6I0oSxEsfAiIUS+jk2ACUoyJ?=
 =?us-ascii?Q?eFu2DmllqYddgq9yJiN90jzOrW6CrTDP3KiW7+AenE3EDnqJ4yneRFtfhg6W?=
 =?us-ascii?Q?HrF27ZW0wrM7YlqiYPKvPb35tve2j2cVKmS8h7fT73g6sQQvXJL5Z3DdHDvh?=
 =?us-ascii?Q?jRzormkjbN2jUjInGfMYkLgqkKKjWC+6S8iLnXJeGGX0h3EM3+vCGZ/SVf+/?=
 =?us-ascii?Q?MXRvsw/LkldQKogn5P1546vSJjDTiKnxGyMrk5u2JYwZC0zYeU+5m9Bm5SNb?=
 =?us-ascii?Q?avZqbnh09I3EXVYSd0IwUlvpjTaxjXIIYam+gQwjH8kxKLr3dvc9T82xU79n?=
 =?us-ascii?Q?K9q8vjt/CMToS9JHqf8tnjJNFMgejVorX+I+pJ+ZlNA7VLWwTqoTSOtQcU51?=
 =?us-ascii?Q?T6QSD7oIRpWucVeZUkGns1GGUg6sHrrnd0JvnE4AkemAHKfOF+G5lohgSJvT?=
 =?us-ascii?Q?dNb9zx5i0l3UWXAciJUFqnPmfxGPTRWmUZGdx67cmD/1c0q2y5guyHiQ8yHH?=
 =?us-ascii?Q?EzmaH7Hl1Imlv85Mv0G9iIXg9WmRcfz54fq2Ly+3Aq7mvfCt79A2JFfXKnV2?=
 =?us-ascii?Q?fTEzjpsrKwIUiliZfonoYJZdN7E1SVyUCfOPVWpPQQyNMXiVRjdFD2D7sn6q?=
 =?us-ascii?Q?H2YSwQM/FkAa2kL/C6U7siyBmoGInScpU5n/rHKeuyYdufuAbkc+oC6891YY?=
 =?us-ascii?Q?FhKF1xMfdGuU6oSnAUhlx/YLDCSNNXyg?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F3488EC0DC0F374A822ED68F4F0ADEA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9739
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82e62bf4-410d-44e5-1fd2-08dd712c59a0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|1800799024|82310400026|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F0XE7K/fBZAeI/BoskgXfuFEwmeQvC2hAFIWLfqyvxezIcD2a3JPGQ0XeTnH?=
 =?us-ascii?Q?Wjr2W8MAzU2sQYKIJ6a56YFngZ/8E8NLMr0cw4ydHm/4BP6DfSXzq06D46UC?=
 =?us-ascii?Q?Grb7sRG/9EIHJXIg4bVA5sujNXaRaEXoZZipklnAj6eIIcmuGwNvRh84TjIL?=
 =?us-ascii?Q?+V69eO/peHFUQ2RdheR3ifZ39SMTjlmFNygRsb7X4mYNNhEHRRIZ5BVPIBl5?=
 =?us-ascii?Q?46sRUA/bblVeHIBTf1Kxg5a9DT5Wdtb5Nyv51f3woMaRB7mAHr0H0JgxMI/x?=
 =?us-ascii?Q?cm8CbXOkHNGwd66zhrgagXB+RAQs11tOAm73ocnLuFQhFDW8np9x8BUZHZ7Y?=
 =?us-ascii?Q?rbSb2r0pQCQME5H8wGBE8ASR0bL3c3cA6lbuK/1RJpllRCXx1HeZkFiAjpxc?=
 =?us-ascii?Q?YfWfHrGty0CEEAyno+CCknps3WxMXddsSiXfuMsI+ItrK0NxvdjPu/ZAPMUG?=
 =?us-ascii?Q?5m+CIRhmvrOEd58DpxULnhwhiK0SnwcPJVPFvvm374+q4TPWjyqfF13b7GBU?=
 =?us-ascii?Q?lciFM7nX7mm8eyAs5gDuhh4C6KBsDREo/STQ9Yv8blwTBQGRmLC1qZbBJt1d?=
 =?us-ascii?Q?JE181Z973ksUTRygz2/9+GSiNvsBC2j2abaKuMCEaWrx6aO91sQkW0y+Wu0n?=
 =?us-ascii?Q?c6c+dYyH9jY0V8/AcDuv9cAdMUxxwA3TAeEMCJdcOTyRnOxG+Kok71nTPwu+?=
 =?us-ascii?Q?ZIjM2qQRykyRqlRt7HMmCwHNKjVnje8gKkE6RDqi80ILTyOfGmW/k8n9PQpl?=
 =?us-ascii?Q?uoGEK3NXqHrmnlYWeG4mSOVnFKJWqODW/hti0CYcGiCqRR6sMnzgYFCWLwjc?=
 =?us-ascii?Q?GCJTdWnJmfKSTjKF1t55fAPDb8L9EEjh8QhlQ7Llw1kcfx2T0F21BbIoSLFn?=
 =?us-ascii?Q?2+Qq9TiblZFgyXYuo53hep9i4IlCVC7ZLTSGzeYhzNnak1FNkNtZqEljn/QJ?=
 =?us-ascii?Q?6b5RH0hKIs7qKxWZZrlWjD/LDl2cyUkiuLjJcmQarVac6HiklaImAAcHFy5M?=
 =?us-ascii?Q?vfnqr7G7AQU3mdyFgjxMHAiAqyLW+tSWa1xezl8EUto0Hp2PcKm9u86H7Fps?=
 =?us-ascii?Q?68NlkaHkrjBPjC9eNkru6F2tTgHGgB8C5W6B+u/R0of+kLPcKOsfwGiyZsFU?=
 =?us-ascii?Q?j1naRL+U7Y1cdotJz/nBEfidfMm3WFSKy//FTf85gLAfNXcBjMzXKiX4FYwn?=
 =?us-ascii?Q?DMdf/96Ar9BaAkiYQ+yFgikySXxAOwUtt5KKavfwiE/O1OBtPdtWbgnops42?=
 =?us-ascii?Q?AH4xOdbpesLz0WDaCxmdu5psEtL/EWxKk1QzYmissTuNhWXsVJgkHgtJOFzy?=
 =?us-ascii?Q?jo51RVQ8vj/M1SWLPhnvjZsXCTdflZBfp0YifjzFlSJ9+wAahBt0ZSoBmL4Y?=
 =?us-ascii?Q?hIofyVPxo0N9rWO7xO9Ss9DTG4f7W3k2z/x6Hte+ldeiK4B4p1k7r6gwDTKf?=
 =?us-ascii?Q?YaXCNHr111OVxzzroqQO+3/bQwgqD/tDXy6SMO7+mxbgpfvLXs5MLoqXEmEQ?=
 =?us-ascii?Q?jEPv3sMQBlgkcUU=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(1800799024)(82310400026)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:49:14.7390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df459a68-69ec-4f77-2252-08dd712c5f54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9888

Hi,

> On 1 Apr 2025, at 16:22, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 01/04/2025 14:57, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Michal,
>>=20
>>> On 1 Apr 2025, at 11:09, Michal Orzel <michal.orzel@amd.com> wrote:
>>>=20
>>> There's no benefit in having process_shm_chosen() next to process_shm()=
.
>>> The former is just a helper to pass "/chosen" node to the latter for
>>> hwdom case. Drop process_shm_chosen() and instead use process_shm()
>>> passing NULL as node parameter, which will result in searching for and
>>> using /chosen to find shm node (the DT full path search is done in
>>> process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
>>> will simplify future handling of hw/control domain separation.
>>>=20
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> xen/arch/arm/domain_build.c             |  2 +-
>>> xen/arch/arm/include/asm/static-shmem.h | 14 --------------
>>> xen/arch/arm/static-shmem.c             |  4 ++++
>>> 3 files changed, 5 insertions(+), 15 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 2b5b4331834f..7f9e17e1de4d 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2325,7 +2325,7 @@ int __init construct_hwdom(struct kernel_info *ki=
nfo)
>>>    else
>>>        allocate_memory(d, kinfo);
>>>=20
>>> -    rc =3D process_shm_chosen(d, kinfo);
>>> +    rc =3D process_shm(d, kinfo, NULL);
>>>    if ( rc < 0 )
>>>        return rc;
>>>=20
>>> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/inc=
lude/asm/static-shmem.h
>>> index fd0867c4f26b..94eaa9d500f9 100644
>>> --- a/xen/arch/arm/include/asm/static-shmem.h
>>> +++ b/xen/arch/arm/include/asm/static-shmem.h
>>> @@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_info *=
kinfo, int addrcells,
>>> int process_shm(struct domain *d, struct kernel_info *kinfo,
>>>                const struct dt_device_node *node);
>>>=20
>>> -static inline int process_shm_chosen(struct domain *d,
>>> -                                     struct kernel_info *kinfo)
>>> -{
>>> -    const struct dt_device_node *node =3D dt_find_node_by_path("/chose=
n");
>>> -
>>> -    return process_shm(d, kinfo, node);
>>> -}
>>> -
>>> int process_shm_node(const void *fdt, int node, uint32_t address_cells,
>>>                     uint32_t size_cells);
>>>=20
>>> @@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, stru=
ct kernel_info *kinfo,
>>>    return 0;
>>> }
>>>=20
>>> -static inline int process_shm_chosen(struct domain *d,
>>> -                                     struct kernel_info *kinfo)
>>> -{
>>> -    return 0;
>>> -}
>>> -
>>> static inline void init_sharedmem_pages(void) {};
>>>=20
>>> static inline int remove_shm_from_rangeset(const struct kernel_info *ki=
nfo,
>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>>> index c74fa13d4847..cda90105923d 100644
>>> --- a/xen/arch/arm/static-shmem.c
>>> +++ b/xen/arch/arm/static-shmem.c
>>> @@ -297,6 +297,10 @@ int __init process_shm(struct domain *d, struct ke=
rnel_info *kinfo,
>>> {
>>>    struct dt_device_node *shm_node;
>>>=20
>>> +    /* Hwdom case - shm node under /chosen */
>>> +    if ( !node )
>>> +        node =3D dt_find_node_by_path("/chosen");
>>> +
>>=20
>> I would have 2 questions here:
>> - what if a NULL pointer is passed, wouldn't you wrongly look in the mai=
n device tree ?
> Do you mean from hwdom or domU path? In the former it is expected. In the=
 latter
> it would be a bug given that there are several dozens of things that oper=
ate on
> this node being a /chosen/domU@X node before we pass node to process_shm(=
).
>=20
>> - isn't there a NULL case to be handled if dt_find_node_by_path does not=
 find a result ?
> It wasn't validated before this change. It would be catched in early boot=
 code
> so no worries.

Then an ASSERT on NULL would be good.

>=20
>>=20
>> Couldn't the condition also check for the domain to be the hwdom ?
> I could although we have so many /chosen and hwdom asserts in the tree in=
 the
> dom0 creation that I find it not necessary.

There are never to many asserts but ok :-)

With an ASSERT added for the NULL case you can add my R-b.

Cheers
Bertrand

>=20
> ~Michal



