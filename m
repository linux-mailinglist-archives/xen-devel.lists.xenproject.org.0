Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9CF9C5B39
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 16:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834730.1250541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAsQ7-0008C8-SN; Tue, 12 Nov 2024 15:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834730.1250541; Tue, 12 Nov 2024 15:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAsQ7-00089r-Pj; Tue, 12 Nov 2024 15:03:07 +0000
Received: by outflank-mailman (input) for mailman id 834730;
 Tue, 12 Nov 2024 15:03:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T01z=SH=epam.com=Artem_Mygaiev@srs-se1.protection.inumbo.net>)
 id 1tAsQ7-00089l-2Y
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 15:03:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f403:2612::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36fe88b3-a107-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 16:03:03 +0100 (CET)
Received: from AM9PR03MB7680.eurprd03.prod.outlook.com (2603:10a6:20b:41d::24)
 by PAVPR03MB9703.eurprd03.prod.outlook.com (2603:10a6:102:313::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Tue, 12 Nov
 2024 15:03:00 +0000
Received: from AM9PR03MB7680.eurprd03.prod.outlook.com
 ([fe80::5d8b:ec56:b7cf:8c4c]) by AM9PR03MB7680.eurprd03.prod.outlook.com
 ([fe80::5d8b:ec56:b7cf:8c4c%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 15:02:59 +0000
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
X-Inumbo-ID: 36fe88b3-a107-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjI2IiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjM2ZmU4OGIzLWExMDctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDIzNzgzLjQ1NTg2Mywic2VuZGVyIjoiYXJ0ZW1fbXlnYWlldkBlcGFtLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyD+H6b+S0l0fdVaOo53RTKvuj68qROg6XH/P3uP9FzyJJ8G+48ut7qUaP7yRHDA6WfsFBEXjB0yyUHZkkwIn/ru9Cv/BmAq47fIqUtra+au9wdOkAOxG2tLQvrVQkU/tuvzgCZy4wCxfx9o6lgwEWuxKVNvdWKDSF46FSS1hd4WGXilenyExlmow+rDmK+fIRBKTrTvu9OVb3hx5hEiX7BzvzjFwGFz99O8QXgzoI3ThB68s8FbKWPzV4aRc4wwAjb16D1dekay/+DAUG03qeJ85NniwgM33CGKKyxwVDukbwrRtQNQVZfzLhZzCF74MtNUXhepz7gDiGkja4e3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCZmdN1i/YEHMfL2b6q9+uX/kJnQenauO/NLQtZd970=;
 b=qzrzH19ZHPbqxEvgg5Jo92htyiQXN+zuCcs40u9yldO6WckOYEXzAZ2Ovs7tI/TDZXmkR+kv5JMWyK9kBvn1UAAEFK6oVV0sJ1T1GmKYGmG9gvhkWGlLVCu7pFU4IcEBciGPNHtihvWYbTTtEKqMFVy1b4P4MreLQi0YD2uPGCyS7kgLyz/glYCFgOrO3Z2rPuIY1wgW2XiwJUhFUQ2IV7leyba51SgkNINnN28ErbIcJqbRJBNPxfnYX26pJICTXBLh/dNV9UdK3u5evH9lh1s5AEkbPezG3RFVnHiZOB6DU7JIhh/z19YbIYPM9hbDzVGetGdB1KQr1hAkmB9sRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCZmdN1i/YEHMfL2b6q9+uX/kJnQenauO/NLQtZd970=;
 b=nTD8j+7brvVrIXlju7YhJXNTTRcr8NYF1BPWL1nC/HbQUUQ3f41ElC9AnL/3qp1pKZk+NXzy06Nh4afepdnUbpKOhERw/etzzpD59gx5xsp7Q8vMHp55lPs4KS+2sJG8wa/00jCXwBX2uJxh4QntsljR1+siP9D+WyFBpa8SlKee/yZb1pVezpohnTmoGU1Ury+KQFNEnQPznmAV6fJLpu4nWEdlwEyFf72cmgdXL31xOowDYj8TbEBaYAlksFlXnxlEygiHa/5afRFHwXqv/lp+tIJnQOOigQGvs//wZ2F2OWg04O/fzP5MFFzMbH6kPgpC+2SP9shEL+PuH6AztQ==
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Munakata Hisao <hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index: AQHbIXWuASycxuwjpUOJwZCeCRQus7Kz4w//
Date: Tue, 12 Nov 2024 15:02:59 +0000
Message-ID:
 <AM9PR03MB7680CB5714FDB6DDDB4B551BF4592@AM9PR03MB7680.eurprd03.prod.outlook.com>
References: <20241018155144.3433395-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20241018155144.3433395-1-ayan.kumar.halder@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7680:EE_|PAVPR03MB9703:EE_
x-ms-office365-filtering-correlation-id: 2b351cf3-2a03-45b4-a70c-08dd032b194c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?m36bPD5nwxgV1yvtV8Rda1lieEVfx3jYy5hA9maTaEhoxnySHSyQIsepfP?=
 =?iso-8859-1?Q?lppxtAYSi/QgffiF91AIiJmSa4Qge4wxwFPsM4swY8OvJs/3FvUiDCVhUP?=
 =?iso-8859-1?Q?OqVwLE3lXZJFN+4w26UXHBn5V8pAi6y9iSlkLyrOeAUMUOKt8uiTtAkjW9?=
 =?iso-8859-1?Q?X7+CsYXDl+Bf6ZoFXhTXAbTGZ+Z+OridmA22GDlW4QMqZg2co7IMj2TI4m?=
 =?iso-8859-1?Q?/MUUgQsR83YPPPqsQHJjW6TSa5tY1+kTlAAhnj8TEHCg8rVx6KbjWTuA4u?=
 =?iso-8859-1?Q?ue/300vGfZklWztJktzGhSXoD1v1YZ5cfoNxLoFfR4tMAe7HNy5SwWasKs?=
 =?iso-8859-1?Q?kLUunTmT/317yAUVp6Vpk9xS+8L0vF83+bSqCoGRykoow0lTACGw1buwlF?=
 =?iso-8859-1?Q?qEIHdosew6e6hjFBeq1OY0zV3huEbFbLHtuFfJxP4vdGkJaL75kXuOMFcY?=
 =?iso-8859-1?Q?W1N7nrH4/8gh6nUVDJWGzjrUUfaVIF+X3Mww2wMr9f83WQ9XE9+dTjZk/C?=
 =?iso-8859-1?Q?jLFkr8a9gRrI6Xjr8/IMPaPkMivKgAntG25HD2qWSs2tv7PlM3RHHSWlre?=
 =?iso-8859-1?Q?SUUksGgrybqutGiueTDepg2ZbdS8+Rd89/xurUff7KiuUwxyl3YnuA4RIu?=
 =?iso-8859-1?Q?5qr6ErTrpUzcDufUiwQHOtrlFF81uioC+HDvF1AT+MGTiiwXUlBQaSHZje?=
 =?iso-8859-1?Q?PM0kodQ5M7aqTwEuY5+6O6XQI+Grh5wTCACI5F2hXEgOKDZJF6QmA7spn/?=
 =?iso-8859-1?Q?Oe8FmpUX9WvxgO5jxhJEm58GZpCbaQT6redG7Rmzt/C72mZ0F8dcI1Twod?=
 =?iso-8859-1?Q?RbZRdrYmyzihJhIIxD/QMcQtV77PkH1hLONPFeYx9CbAysw4x4Okoqnwrk?=
 =?iso-8859-1?Q?BOrp66AZ9AvYFv5iHv1uAjXiBoz8hcANPSOgbSGpl4a5g0rG/TNbulge5a?=
 =?iso-8859-1?Q?wVlvRKWZZ9BviZnIeNgFaGlVDoxShuPeHRc1TTo2GlAFHwT0uqBGO0Y55H?=
 =?iso-8859-1?Q?7x6NvQVz5IVO2OiGkTisJR9A9cS7/oEkhlY3sE72pWiFRNNoBKb7D3eLTB?=
 =?iso-8859-1?Q?zfibyQCLdaYFAPhQ/4f0roM9btBN2gqHAg8VBUvkvZUybr6kwK1cG8dkOq?=
 =?iso-8859-1?Q?icz/5iln94c/mymxin956ylVnJe99ehnjh3G8MBairH5mGYpg8Z2SeAVq4?=
 =?iso-8859-1?Q?PgVXDyHNnTSw2eNV+uMCMxstcg79VLjbcktkOYw1vq6WmMYJ7Ne1GqZnC5?=
 =?iso-8859-1?Q?Vo+D16S7PiEXuMKZwYND4TOagxQO47t4cppqLZqzMJ915stEyzNO/Yr7he?=
 =?iso-8859-1?Q?O3WlZKDkWUUaDPQ9y+bSMAgyAGwCka8wAnACdxdj/imdAb3xhh13g1dlx9?=
 =?iso-8859-1?Q?9dyKl7siycsho46LzOGNHOvV5xpYGfBAHz/EPU/f8GXIKzpdYIV8U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7680.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0FOizYHLRj6iqvXFe//9kgcP0m7oo8StVNh8rDumuE8dVDiphU+UYdK54b?=
 =?iso-8859-1?Q?1tTSYKMaiLyWgWx2EFsIlOzGLhZ5jBYJ2bzMyeCYEh9L1M/GhxeShnUEG5?=
 =?iso-8859-1?Q?aQy1KujEoXq3ZsTEourvCDVhkbUvLwkVLwfi+VX2wuHy2yYOMXPayQywtI?=
 =?iso-8859-1?Q?XxcDMoTSS+kG+D2bfT9Z8WonAIUIbBIpM7oR1ZCehEHZB+um/k06DSAXDq?=
 =?iso-8859-1?Q?qWtlY2E1MzhI1EylDhZDn9o6AFPzCuSiz3p3Nn7IS4oma7bHdpIgFzFgPH?=
 =?iso-8859-1?Q?EiH34ARZxRdGHMFcLpxDyu7+/mK6laLU7o0Yjc3Iey6mB20PLrbao0R5hU?=
 =?iso-8859-1?Q?pIPF5aQ7ekif4nIaZqMNktxqwQ8VJ7KZTULkjFfASyRMqPPkDIMGkmXaFO?=
 =?iso-8859-1?Q?9VOOwZr2nKuiA7D04bk2RFRwsa/p9Et2LFG/Pc54w4cBA4BJCWF9ilSs+g?=
 =?iso-8859-1?Q?vNf6hH95OqmDXRP44P7drXB7obyLWR6plh8SM60TJP16QWqdiDenAEYzhl?=
 =?iso-8859-1?Q?fJYvk46pHcUYvR2TfB3TVLjhCQTNb05t2W0CTzl3GW+Bhja4vsYGWJKtMJ?=
 =?iso-8859-1?Q?H+KXjOXo+FyfQvRTYPmZHRvUO5rK/fVdInPOzeHPPSXHuxMrvJWf1r/9j4?=
 =?iso-8859-1?Q?PFWay/5hc8PRNzZEag5f/l9hA66cyAv4l2iTXkNE/H7mM3DUTcv64OPOiM?=
 =?iso-8859-1?Q?4EbmaemA1xKVOTnKGEfv0e6EI0fLSe2LEALphU6A+Tz0ZVFYSkbwXXHK+J?=
 =?iso-8859-1?Q?JpwvFb/ulv2nfRRZfNG7hTphTErnIPleTOGlsN/vISbUHG7upfsZqQUXCx?=
 =?iso-8859-1?Q?mlZRPWtNUYY5FWTwJpdkwS3aCemSvL6CFAngh0haR7ByVDogHGuEnKljZ2?=
 =?iso-8859-1?Q?tdOcJqeS9XPlQ6MDUWN2iJyUDcmFvGQfx8+0tYiEaFk0bUcpRyLp88NpQY?=
 =?iso-8859-1?Q?bzGyXC5f7MDs3x3q5eUbf/OBIq0WZC9BDvd4RDA3MVBCyMg1jXzYoYP776?=
 =?iso-8859-1?Q?Sg0dAsZBD4y3IzQ4wPSwufDXUIyRrr/Ho0c9tVhIW/D4X52LtRfeoBWZkN?=
 =?iso-8859-1?Q?y42GQ60bbZkdYEe34bSLrqG8Cg8y1Ic5WWe54kDADWeR/aObdhoAHyV29P?=
 =?iso-8859-1?Q?36TOlmB06i0R7S8BE084JAkCpPuThP8pPddD6NiMUC0PQb9bpPqSSz2Rks?=
 =?iso-8859-1?Q?djEi9g2v4JykTG03Kh8quTFIH4kFOum8h6jzTQwAUHrxMVyc/mMSC+aBo7?=
 =?iso-8859-1?Q?01M41YDszZOBOLx+TzM1RuEscEFZyXNAGRFNeVCiV5RM6U+iFHihKWrmjg?=
 =?iso-8859-1?Q?5XBBpvbIbPMaCrD2YZgA8QR2oWAVFcvb3NhxpTHH1H/3g2dHTjRaLOIyGB?=
 =?iso-8859-1?Q?wGvlKAd9MOydt7sZDm2hVPe6TiXM/tNjKkNo1ITA5BRTgM3txszPtBuktp?=
 =?iso-8859-1?Q?KsC0pOVVLC5RD2SFMrdHWfgCi2VWDQBWp1/dHr81bujsPu/nkPJNytox8s?=
 =?iso-8859-1?Q?6nmtP+yBQL6zFMd4bf7cc2yZQeZoE87fgWEblPMCItDmjg3OiTk3yiy1vE?=
 =?iso-8859-1?Q?d33WYetZL7zlIVbu5SKVY6I0MG6pQLGpD+YMaJJbztzGi34xBinE8a8vhS?=
 =?iso-8859-1?Q?SGfzayHSzHzS4JNpwU7fVULiSdPcNTLYOO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7680.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b351cf3-2a03-45b4-a70c-08dd032b194c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 15:02:59.9224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0drahElqAdkbDnroIgGDxEyKbQgAaKvhobkuwQISUfZzigEksRFrLCyvp1koxvp5RJCLXwF//miok/XJCrcPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9703

On October 18, 2024 Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:=0A=
=0A=
> From: Michal Orzel <michal.orzel@amd.com>=0A=
>=0A=
> Add requirements for dom0less domain creation.=0A=
>=0A=
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>=0A=
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>=0A=
> ---=0A=
=0A=
Reviewed-by: Artem Mygaiev <artem_mygaiev@epam.com>=0A=
=0A=
Minor: in lines like=0A=
 - Xen shall assign multiple vCPUs to a domain=0A=
 - Xen shall assign a CPU pool scheduler to a domain=0A=
is it better with 'specified'? E.g. "specified number of vCPUs" and so on.=
=0A=
=0A=
 -- Artem=

