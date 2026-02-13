Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DL7J/UMj2kgHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA3A135C44
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230658.1536128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU5-0002jW-IR; Fri, 13 Feb 2026 11:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230658.1536128; Fri, 13 Feb 2026 11:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU5-0002fP-CC; Fri, 13 Feb 2026 11:37:17 +0000
Received: by outflank-mailman (input) for mailman id 1230658;
 Fri, 13 Feb 2026 11:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfN9=AR=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vqrU3-0001fQ-Bg
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:37:15 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 578b5121-08d0-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:37:14 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB9PR03MB7615.eurprd03.prod.outlook.com (2603:10a6:10:2ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 11:37:07 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 11:37:07 +0000
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
X-Inumbo-ID: 578b5121-08d0-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEKYhQLuCFEyagVscjPkn+0/4x5+kFuGmKgKa/I52Ib40QIfORlpTUuRz6gftYVVYYD6GMtnSu6rgAV9Nzx+oZ9B/SG9J2+RUB6qcnRDeH5HbsF+DPXoDTjWuH3xby1B+UCG0h7AbErin3UHhiPO/Z5VrRpezs5S7UV3IPsprN+zxWAEEOCymGzHjkqmNdVLSq+ISy70sfkkQu5Z0X//YoVuyDJArGQelldXslo37P7ShSaiAtYVyaFsKd92EU7GAFwrzxUL/xpqysZpykduos8JLzObXjDRoL/qsJXybtJ3Mhl/hh1ZPAXGu1v3ECD+5yuAK7iV6T00JnUXnDAYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMUkvd7maD0fWSxn+3jLDMY1Y4cX4+DkKiSXZNac1iQ=;
 b=rRAy0kkQJ+ZOcQm3pbAQ19CT8T53qbY5uViIN2c+tY5AzKhbpEDnDdyJ1OFgtHyQFZZ7/9reoRN87UVRdoLlaMGrRQkOI9tqCRtrExsNoRPDyht9Taq+AMy8bxYQ69r4C9YgR+OhfHar2B/Gc7G2rfie1sKbG583vfnSBxpvLEUjKw92rrEeHTKABmRSpUETBIPi0H33kVQeoDFMNuyZrUBhAa2LWIaELmom/o06t28VNJsu5AIS3ZQdZtf4iECFvL4isPaVxJoGPtkvEVmAs+D20u9EYxUw/JStVH0cKp4M46nHZf+TB6YfJ55SqXuESKeDzpR3nq1dlSwiIHH+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMUkvd7maD0fWSxn+3jLDMY1Y4cX4+DkKiSXZNac1iQ=;
 b=CN4TqL+hUTVAcmLxF9tIO3esvDi35WShI+uuBDH9EGJb6V3AK2ZIYY0PDbkqxQzKgyEHZG6BSwDzfMa9LLXnmoc7X48bfJ5hamU+VR2grAfWJeKMrfA7j6FCggVqh4yiTnlj7z/gRIvlr8gKpl6M8pEy8161+dbmQZvahGf7g89wrkudhn2vAG0ZOA7Hx476dodWMjC8dsUORyLBCsZvtXgjbwqCBEs5p2Jr8mfpLSt/GP9nGcOOpEigg3YYVhEZlpHRkdvoYiIdDSqpNdiQ/anAvVPR/MBVl2LQLDoTxBnbwoVeTziU93uDO0tqeu7r59LdVCJedt5nYIMYZ7tLpQ==
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
Subject: [PATCH v10 6/6] docs: arm: add SCI SCMI SMC multi-agent driver docs
Thread-Topic: [PATCH v10 6/6] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHcnN0Urp6cJEf8yE+DawhXXhlh+g==
Date: Fri, 13 Feb 2026 11:37:06 +0000
Message-ID:
 <a7bf8ff218ca05eb3674fdfd2817f6cff471e96a.1770982468.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: 774cf44d-cd65-45a6-f1e2-08de6af437a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+ev7EMoXrinjJ/be5hW/0/u7oC2hl4OOFp6Do/V+nab41mAmgoQHFFyw4Q?=
 =?iso-8859-1?Q?j9aH/idQQs9+Q+et8IYhEgGMCvd4RWqXJHdXMLTK4mOmQRaBTGXWC8KDY3?=
 =?iso-8859-1?Q?Ad3ntqG86oCKT5CRA6rI8+JyeNmYXpX55zlDat9Fpz6n+jhRykTWmZP+Yr?=
 =?iso-8859-1?Q?R8fc+a5qOFrB3QcSgNzlS7Fki/snJl+0OC+zMTRKO2Yvcg7ByqA7shb6sf?=
 =?iso-8859-1?Q?O2NsIOMt1wvtvClUpkBxtawuDjuNb3RqTMzzAZI4o7Fds5Cr0KAaTCLDGX?=
 =?iso-8859-1?Q?C3kmQ3sOMLP1Ne2Vgh6FjfJ/nvd2NYnSzSmlwnRwV45ZQc8xIRJwSc0T0Y?=
 =?iso-8859-1?Q?dDvcmPc/1Q2wgtD1HpLM05/bdUeQWpjrI0tcEVL/ySG4n90g1Ht9RBI59w?=
 =?iso-8859-1?Q?pyqqcywL7IdItxgwB1pyggGY8JSigW5wTWMxSF2gz92OUQFsneKbCbr+jY?=
 =?iso-8859-1?Q?n5WNyQjaxXHgA53aDyAxq1SIAg3NfHVpodXCv3UXWII6uGtZqaL4PTBCo8?=
 =?iso-8859-1?Q?lwpY3Sa7Jw+nYmngwc74fKwHyiyyzrhIz94D6AkcJbzzpkpCxCA5em6nZ+?=
 =?iso-8859-1?Q?tw82Di1JyZOck9jm9kdokxCLmHQQC4yiW9Jg3XGMLj6dlTBSsibROq2CzF?=
 =?iso-8859-1?Q?xxr4cs0nE7UFeye+fp2ywK+fqhfokuSHNK+cYPvW9qSIOWqnkJSLB/AaxN?=
 =?iso-8859-1?Q?fTqX2BybZYHNLcCHmCwWFhfo4GZPZDGSWx0dvqAljJ0SVTAdu7f7IZcrmq?=
 =?iso-8859-1?Q?YqYLlaVBnljXaI0Z75Kzsx0UyE/MWp/S++s90zFXXqgBlWZRiRTdXs+efJ?=
 =?iso-8859-1?Q?nZcj3bvtlNQbmIjTpS4cYhQE8W1dpFpwk/79cYqG6bnDWrnycIUq+lgKJU?=
 =?iso-8859-1?Q?tc0LDksG/AqMKOYjLgrU69dBZAohUPCgyvi7ZHnVvbMnrC2FtJ3l9JwSDX?=
 =?iso-8859-1?Q?29V0OGuEA14V34Mu19h2NI3NjJpFanA5GB8yhfnid77uK/yeOAFitv0eFu?=
 =?iso-8859-1?Q?iVDa/G/LikciYLvRP9X2YalG6x9amNa/ufZ0GR8owL8REKAb5pERsHNQCN?=
 =?iso-8859-1?Q?NwYC6n+H1L7iF07rPmkc5D7mr0ULlnHtyQGiLBbbG7b3mXsG56n5e/I6hD?=
 =?iso-8859-1?Q?1iyh90nVBhSiXB2fDJNIoI+V3hHgcXC9dYzlsUENAaNyJNfviRZSYqou4S?=
 =?iso-8859-1?Q?wxWBgH7c0e2o6If8TbFXml/2/zjbjpZBDN8SSLpwRzEP25coI1znBbQTqB?=
 =?iso-8859-1?Q?ur2wZMvn1OFiL3v9GVVt4S8Eh9x0oEANrG103167MuELm/KWGXPxhLpQQD?=
 =?iso-8859-1?Q?z3g2vlDL7hQFX7n3Hb/fQufsZyT7T6pImu9LALKL9velJDiliFxMgwdXDl?=
 =?iso-8859-1?Q?Rf7UOOJ5bY83aBCQIbXy3nqwgpMVtnhSXQaaLdI6MbYUJCbCr/7BYlo6Za?=
 =?iso-8859-1?Q?ThUnISS5b/QlVkS1i7/91W6KwmoICvKbrX7562I/UCGKq6tNR+9xPo5bDU?=
 =?iso-8859-1?Q?6tn3NWWndykDfFSaUX1Bm3agJPeCpxhkaG7w+1EV1u7SAUtL5cSEk3xauv?=
 =?iso-8859-1?Q?qdj0sZKmau90y7C8e2OQnXnpgWzNjuI6cHshxS1TgHSd/oUfUDXeO1G9hN?=
 =?iso-8859-1?Q?izEzgJjJBk0erwXQBv7U8JF1xxI3EeH1JAesLNsKnmZc5axw06CP6VP0+g?=
 =?iso-8859-1?Q?1zset8Vci8a11lHouZg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Oh3UDjz4oszYxKjg439Jx1UhuBEFjyhZtKo+Q5vcaxMgs8jmyts4CuLzky?=
 =?iso-8859-1?Q?H6I1Co/1xO1swc8AFEeODw/xfCK9ap5gsNfpEyzENHbTXDVC7hKiGbURC5?=
 =?iso-8859-1?Q?2MWuHcTMrMiCa7K4JhEGaFBrX03CHu0uAVpPammOcUay13IZwKDnUJupez?=
 =?iso-8859-1?Q?5wsFjEaxqNd7cgkjhNfslT1MlAjvhZyv+7Th9QPvXs+IYzB5varJG2/eAi?=
 =?iso-8859-1?Q?2N4gVT0vIo5+/lqx/e4FBrzD2kbrHKOKhJHiA74GhB0CIICs3KBjbtRH+R?=
 =?iso-8859-1?Q?v8A1JdeD8Oa+wHStco5iP1yh4QtkN1BKTWbHAoAGYSRfyIDCm0RcU8t+0o?=
 =?iso-8859-1?Q?Ge1Y2vzMGCFjvJ2rCtfnVk6fPxyd2RxZDZ5SkjCp5aDjN/ulvJMy/5BmhH?=
 =?iso-8859-1?Q?Ue4MlcSZi5nZERLNpllc8GyfibegmAtfmZdggU6s0sDCh12UxvEFSoT0+C?=
 =?iso-8859-1?Q?z4eREXS0/wZP6Z/CbYAJyCwBysM31OuC5YZ3EWliUtzPp3K/Lx6AzO92xt?=
 =?iso-8859-1?Q?XrrT7hKvvrrC9DIYAd69YJlXgsiRaIygCJp0omPzFDdUfD5kSTAU+tUG9U?=
 =?iso-8859-1?Q?nc47V2BgnzI9CSvXzvJFwCnDEiXcYo9TFSuiSCz62qqUQ64RyylGMrDsNO?=
 =?iso-8859-1?Q?XNME9dPygLpOa9z1yEthUvCnU31MYjseWIjcxSz1J8EFwmu/Un15/43g/J?=
 =?iso-8859-1?Q?gm6F4HgdPasaZkpIzYXzfTak2rJojmbDutr0DE7q4MLshCgR23tsflkQbI?=
 =?iso-8859-1?Q?DRacjpIrZ5RaOArAFZHqfmd9+gYNwB397ULEYCXwQ8dwZS5zDpXUXterSe?=
 =?iso-8859-1?Q?SUciztqfqinVGlJg1nqdjR/wQrJEUMx388n79b0YQlcKgKKOMmyEPlgK6O?=
 =?iso-8859-1?Q?WctdP3N/NPOxUgEfEF9ZvhElLDxORO/63BZ5YFQkw+UiZ3WC5MmrnoGruc?=
 =?iso-8859-1?Q?xQAfhW6V6oFjO5pF/AHctwFmmGpJw/T/ROQdvFXFFugiaQKlbXgZh2jVUw?=
 =?iso-8859-1?Q?zolBe/LyGfTA0nKOyGUSmMKouAXoybSpQ5Zd9mAn6J0QcvHze1AFOf780i?=
 =?iso-8859-1?Q?BrLWeMN/QEMt/ziCTUXkdu3aDX7i+fkMFflq9uqtPV3r9jSk/RKVyYfWZk?=
 =?iso-8859-1?Q?2A2ANLlipgsORoJifXxQsDXLO7dA9orLOb5vVk4xErZzpyOE/qrW1I2yPd?=
 =?iso-8859-1?Q?NWt4NBYqUNAbm88c5BNQ50PeJBY31Kt8sjKNfbmZlb8UgcAHgJwAQwyrx9?=
 =?iso-8859-1?Q?muNRJVT1szfdmuftQCY+F4beym0wYi87g6Igr3kHMeJ0y5TPEgyT7bBL7z?=
 =?iso-8859-1?Q?tWCItp5rlEBCRWUoYjCH5JzX9KvenfBUa+52Cqhj4YvN+S0JMyiKwfdMi9?=
 =?iso-8859-1?Q?Y1NsLElgslJhthoPILErIxk3u4YFcBuwGgSSYa9M3gGYZ8FE+PCtp6loh9?=
 =?iso-8859-1?Q?Ic2NT8H0y5Wgo1v28mtYomVFDoJm/OqP9AW2qROo3HG7cY5nPgDOvkGwUF?=
 =?iso-8859-1?Q?w7VsUdpAYQQJc+vUjUYG6XwnOMZ1EaSvWeV+0OwVhdUt2RPe2gU7QOalFh?=
 =?iso-8859-1?Q?xPvXy26DkK6BoQqIErRbu5e9P24xk137Tk7hDM+oZ0DGqdg9gIxLN1+R6K?=
 =?iso-8859-1?Q?AgwW2nPQYOEJXTWuPBu8J6Z6fLKDhv72k4b1a6KtK2OJypB6xoRBvG3w39?=
 =?iso-8859-1?Q?8ruNv/ftLWRmP4rLnOBzZx8cuq0a5h/F5IbLRAT0UTbWbRKv3mQIII2uMA?=
 =?iso-8859-1?Q?G/5JIRVxoCMLpxFGFCFj3vn17DuIwrvbhfpTLZmDDFveY0+TTvdLrEulgZ?=
 =?iso-8859-1?Q?/NTpOMbPF2weOXLwjpSr7qIzvXuRSXw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774cf44d-cd65-45a6-f1e2-08de6af437a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 11:37:06.2194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAEbsbAH3TkxBQxENsOemDf7UzZY16PcVfwciWq7Bjvx3iwrp10gFSGdWT/nhKpF4vHIHsN+4RM5tfBCabtSyN1hvdpummEgT6dvUxWw1U0=
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
X-Rspamd-Queue-Id: CDA3A135C44
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

Changes in v10:
- rephrase section about /firmware/scmi. Mentioned that this node is
taken from Host DT and copied unmodified.
- fix xen,reg address for secondary domains for Dom0less configuration

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

 .../arm/firmware/arm-scmi.rst                 | 422 ++++++++++++++++++
 1 file changed, 422 insertions(+)

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
index d9698f4e4b..8791bc665e 100644
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
@@ -189,3 +191,423 @@ except explicitly enabling SCMI with "arm_sci" xl.cfg=
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
+The Host DT ``/firmware/scmi`` node is copied to the Dom0 DT unmodified. H=
owever, for Dom0 SCMI
+configuration, Xen actually relies on ``scmi-secondary-agents`` and ``xen,=
dom0-sci-agent-id``
+properties from the ``xen,sci`` container under ``/chosen``. If the ``/fir=
mware/scmi`` node is
+missing or disabled, or if ``xen,dom0-sci-agent-id`` is not provided, the =
Dom0 SCMI agent will not
+be configured.
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
+    ->        xen,reg =3D <0x0 0x47ff2000 0x0 0x1000 0x0 0x22001000>;
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

