Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA8/D4XNgGkfBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:15:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA587CEC82
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218798.1527727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZe-0002aC-OI; Mon, 02 Feb 2026 16:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218798.1527727; Mon, 02 Feb 2026 16:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZe-0002VS-AD; Mon, 02 Feb 2026 16:14:50 +0000
Received: by outflank-mailman (input) for mailman id 1218798;
 Mon, 02 Feb 2026 16:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZc-0000fY-1t
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:48 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48bf508a-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:43 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:40 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:40 +0000
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
X-Inumbo-ID: 48bf508a-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajqNt+LRKJEy4M1fbWTVJg6DbDonUK5eo3bBQLVvFYqCsBPh8KjC/kYV/nVlIMTDhFylWNmxwlW905P+TTh0xfucNDBGnQaUXmT2+q0cY/TQBUFOyUCZqJ18qgAedypA5VPDJS7lWUkigf1U2VaYRHiNQXOb60Et4EehQ/AfTl7ZJ4jqfBu/7Q897KKDazH/9gSdAnvAurCv+YWRkEziXljhPNEgBYF0T81cY79U59kDHgLWxFHHvHk0/5NsxdsIzZB/7Er0SMceKglEVzqUIclXIJwNhJegEAyQ4j/htoXxl5MjCHoN7M32q5eoGZM2/lWv1Jco7T9J+QaQNadvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XldT1n09TO58+jhUJFrzUJPDw25FVJdFd1IJhQ1NS/o=;
 b=Mhyb8d1OM2NnXIPrQcebHV0QkOv1k4nx5JQslnvlKqg7OLWM8WTosCZ5DFWpc2jRGi8/WdibT+yNS456rg3p1WdKDM2+DWNkq4a9oKowk9KhmjC/Mohlz1YrVxgP9qjFa5iFCNhjWSqXcd6ACvMITVB+JBarU1C8T7zJzdVNegNDeWvj/6xubi3PGVD9LQ0MPRH/CAmDzNxd5VsRMij3y2EOrvJ1KWjFXOzQtlG8OIiQpHtJCBzF0qLXM3Rb93KxXH1lwe8zoPTXvTWwGhgOWs7gpEdzH6jS9CIKGO5L0azddNSxy5YK2EXJZeqsKGjpDHzCDLyxDwrvPVSfZQ4Ttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XldT1n09TO58+jhUJFrzUJPDw25FVJdFd1IJhQ1NS/o=;
 b=AHiAP5YFAqbXL02DM71ubpfi1kHAdTSMIR6W8EqjKqNCb1BST+ftO8FqLvhFCtLIR7yZ4J8HBDvxK5XWMVbQB25n6CdZqcoFbT5W175y3Cu9aulmF8WsuMciSNGhLW6As7YRGqq/QzkaSYYZxFKJoX20yW5qTAeBNrZJDSqXe9laIw2Ofw1ioau4nWaJn/rL2eEVp2LCbbsApVmKcQTZjWpPCpHAezYx3IeC2MUQdm+yckuW91gDgMdNWDweMwH02hs1M4X1ksARqqua0lopol+u0Hv7Rrhv0VlCn0vYH2UCX2jKY1wtapRBFOToBkHlXqSGhv7qA4EBDr6C/8TbSg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 08/19] arm/gic: Keep track of GIC features
Thread-Topic: [RFC PATCH 08/19] arm/gic: Keep track of GIC features
Thread-Index: AQHclF8I5NEvxt05pU2Wk0lvwQAkCQ==
Date: Mon, 2 Feb 2026 16:14:40 +0000
Message-ID:
 <2687fa1a798f002b3126cdc851812be86c4cd8f1.1770046465.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: b9df5fb6-de93-4024-f2ad-08de62762b43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?q4P/NetXVUwjQrbtmFVEWLEfBowtkmEGEuUh5AnPlK9sqeNOFAPLbIddME?=
 =?iso-8859-1?Q?BKvVzgqJnFsZ1S0MhtHmaE6LljN/Pq3keZUS03x23uMuwd965MeRIebzMH?=
 =?iso-8859-1?Q?G6GD1/bg3EOszF6/8rT9e1B18gB8f6J1sqaYJAkqJzR7z/ucX/YlUeqhHR?=
 =?iso-8859-1?Q?RWOMHGijz3ze2pDzzGTcf+p/C5PrT/X5BATW4ETrpyFEyK3ROgIY9djJXw?=
 =?iso-8859-1?Q?P92ovwYhVs7SSkfKp6y0jHThLJf3xlSosGzMz6L60OX/gk3AUhp5CfpdPD?=
 =?iso-8859-1?Q?QGpLoyhudJ05MCrnYdIS9swHObe/mqIVYh0kFV87ag9N4tm8451CBJc4cm?=
 =?iso-8859-1?Q?i5WNjYMusJ0xCYmOn3IiRUpeWq32Ff9wSv2URkox1EoEOzCmOFq76jGT8c?=
 =?iso-8859-1?Q?KFv4LvjEBSdn8lj4owfqv3/L6pQk8NymNdFLBtfIKkN/iEXeI5v/MpXuOP?=
 =?iso-8859-1?Q?DFxlyCNyJAAGFmu+fO9fgDdMQnNrlnymxRxBKJcKlLjBCgmQS2RjpbpWbp?=
 =?iso-8859-1?Q?fPw5p+soQ60Dy+pvAZ9bI73TqpygjrmoSz5ATY5h8GFx3EC1UrBU1dcEC/?=
 =?iso-8859-1?Q?YUJuz/if9mT4ST4cw+i217QoE0SsP5EzLU7Hqm+occsAKnBDTeKOhY9aYX?=
 =?iso-8859-1?Q?1gUPFVXu/rm/qRUaRvD9HHxD6cpPB1IJYjs25ue/u49zp3q97Oi9//KJP+?=
 =?iso-8859-1?Q?2HUbanTWOCbs8V3JPyuM/Ux4VezgR35aOSFoi9nXj8fVdubv8w0jVKbPqv?=
 =?iso-8859-1?Q?g4jtjnQ+HbhLuEk1ismStpXijiBQ9jrcRmR0BVp1lXnmRxt92EXKJ3lZIH?=
 =?iso-8859-1?Q?e+JQuODuehnhUAKu8ElvaGO8p44EI39mHw50eUBbglyj23THZO8RIihgld?=
 =?iso-8859-1?Q?ReYXAmZa7oIWZm1U8+qsEpSjxvL6Wl1u5ai1uVZ/iBjbPzu8n7MWiC/8Y3?=
 =?iso-8859-1?Q?FKOU+TsAnD4E89xYieby4jzRU9EJOTyJJMAldOF8qqrPhnwp9XAYp70NmI?=
 =?iso-8859-1?Q?F1PLK8Yv+neJkZAJ04NYIMp5CltNQS8ClmatFuq62bmqir7HEKRSKDUmzT?=
 =?iso-8859-1?Q?Isx20Wl7S6JXp8SrlGPN9z2pNwYpb9+AY3Y/3sSntF5SwUWFPNHgQNkBnB?=
 =?iso-8859-1?Q?+J02ldCDr7nBimg/BlsxtT8CUJzSArUS7HRaqYiUKhwsYaYZ/o2zX04oPW?=
 =?iso-8859-1?Q?/05qPr9CNjKs9HPyiGiPt5Yg31IVuWtDnKvvzc/n24DlN/ZWCGpVIGiWOA?=
 =?iso-8859-1?Q?ZBxRjMK7An7S96L1kyYE0J3uXeTcgs/ONDOdzaCFUCHWkY5PS/0mDJYzD8?=
 =?iso-8859-1?Q?4ugOEYqDjXDcjiIPXTtAhbxXGG5qmmDPE2FVjbksY+I5FANZwmi/AIDXZy?=
 =?iso-8859-1?Q?rDMjVbcX2acSp5YVwlxXIkqKquZfiICSD3QdALYU5qAwRT/c+fyLtWkPlR?=
 =?iso-8859-1?Q?ozsXyQSQ/jVBUc23NO4qRRrY/fg6Tv5UmY3k+Z+vMJbQGSzXF/ntpZMIXW?=
 =?iso-8859-1?Q?L9pDmo2Gyt3FvlrlmMeNOOfhHvfjcPfCICzUN1XK2LTAYjonOz7GsSTMrN?=
 =?iso-8859-1?Q?4ArTH0owAZQhKMm4phiFTjPeRRvbqDfsp8EXmlnPXSt0yN7OPDi5PZHDwk?=
 =?iso-8859-1?Q?UYVqfaCZbrjs+dNdaOiQAx7cv1839z5RrCiotXVdJH1rGmb8Ovmx27m0Gj?=
 =?iso-8859-1?Q?hCbgtxqAIYoQPCYQTBE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ExlSQa8cMwoeHWNcNfSB5ObzOcMO+wqvAhgrUmDkj6WxkCuywaKjWSlJHe?=
 =?iso-8859-1?Q?iI3bxlYqdjDiqk3lMtwbL+rWOKVk4aGdonEOf5A4scxEfNdPcOahPxsrSD?=
 =?iso-8859-1?Q?oJmLQCTCHwdw0WisASCwShGXGP+vsbumAnFFCQKiPH312nNL/unvdOs8wp?=
 =?iso-8859-1?Q?vcy33kVHwUVxyyCUHukeQk84yZ5gnojiGY7SsF2zQ2LwTkJEsAwhxj1eUO?=
 =?iso-8859-1?Q?EUolznrjlSgquj1NXXmHBsNHYB+OlGwnTxVddgt66mJasObVDr15Jaq5ZO?=
 =?iso-8859-1?Q?imlmXtwCzDHCpnKxXBhHYoV53zvoeLOhDM10x5tmqImgsTIRD0EV+UdDAq?=
 =?iso-8859-1?Q?oQDFEZCcTsdNZ7G9F8u5zlE6CAl0ITOWSefBR3DhxkDlT3JVRj24BnuUSN?=
 =?iso-8859-1?Q?OVy0d4dh7j5+MFGMXpQ9csP51pKiz1G9OmFgRagEyZF8Z4P05155Nqzrrj?=
 =?iso-8859-1?Q?eqXtuj4xJ8lQMGd+bBYIkRGUdTih0GD8MAAOsQI9z/Yf3O3duyXAhROD4k?=
 =?iso-8859-1?Q?janlo59cScwMA0Rk/JC39WyOK/9DAaslDlcipQy6PScPKQrQim9b3oKBM5?=
 =?iso-8859-1?Q?ypqaE7hJK0JiDS8yHdMqx6lN32dKh6JMYQvEt5n8jQUQWx43wdPp8PJsrg?=
 =?iso-8859-1?Q?52NDRjMWvPi+4cQ5u26LtNURZmZExbGNgwNsKrbZwp87/tqCKnI5yPmsiT?=
 =?iso-8859-1?Q?7Xjd+g6JawQiB3RXqJ5Dl/KQvlh3nWXoN92vCaFGH6HvX4sYIMfO0UPwOO?=
 =?iso-8859-1?Q?c7F7k9CvoeQsllChDLAU+TCf5pPH4Anenig6mdtz59tpC1bjntm+Kmdph/?=
 =?iso-8859-1?Q?ynmnB6bGDsNGfjcYxKEhOg7u5S5Ypk39QEKTvjXvEuyiT8XPeLVylZwAlr?=
 =?iso-8859-1?Q?GyjOh3l+N8+K14onGVCzOgV04ngD7N0+rD4kBWNMo82p3AU4cgc2x5yJ1K?=
 =?iso-8859-1?Q?GSLNjoCfDsJCE5zaPCP7ac0Qbobkd92EHsrnwiRqu+u/2ElmcvaiKgAm+r?=
 =?iso-8859-1?Q?H9bAT3GfmIPQ5OAnuNUM8V82bevaxdEkOPspzU24d5inJ+e/a+a6aDB8xt?=
 =?iso-8859-1?Q?w2XfkXrUgx9m5cDntIRN5frIl5Qzsm0xm4Z7p+Goy9vbG9aqf61mRrq91j?=
 =?iso-8859-1?Q?p1YPUfwVlI1WEfjpIVnunvZbXa9oc0QvSVcp384okPRqAjgzL0QMJ4Rv1M?=
 =?iso-8859-1?Q?rwlxfuk0hiNJBC4fhR6nAOl36AIvHxiRZgNP8UJ3pHKma3AUxRTM/+FNNw?=
 =?iso-8859-1?Q?pf46E2fTHpJklUXIYMuGB1lnOza9WzINJg0gd1XTdo8II9RNF0EidEIg1d?=
 =?iso-8859-1?Q?ZoL8r8EqRCkQNd40nBqadmYZ1SBnD0AnXIKKmgrZG+M6BpFsNthZv5ZwoG?=
 =?iso-8859-1?Q?dgzNnFavLeSTcrBDENn24ZD6fTXy494M/Bji/urLW++WPOKYAw6ionkSxn?=
 =?iso-8859-1?Q?naHTyy2kAKt9WmR3cgCyp3Q2EX/ARtBWdzoSQqp3RTosClMkWWjPKFMSze?=
 =?iso-8859-1?Q?3irGy0m6nlqfX9DhQ9x3GH89oFYGKuZ/Mu/nSZd5ERpQh52XkuIza7F2HF?=
 =?iso-8859-1?Q?3CZCp3WfylI82SrLJHgjvaOhsjN2StwNV9aSOrLoTRJVsGAHw2XhyJSHRu?=
 =?iso-8859-1?Q?3C9t1fhV/1l6lVtILr5jdpOPsZWGIS944mhNIjPC8QqGtV93Q1y+8gozJM?=
 =?iso-8859-1?Q?lSNf05HgZpjya4xqTzNncEoeoSg++IM4zqnYm4BweRsJ9qDiB0pp0mQ4xz?=
 =?iso-8859-1?Q?zdjREax2eeCxz8IObbJ7dlSfVM/2sDE+Gb9mXq098hU4OfqCcPmHEDlsGa?=
 =?iso-8859-1?Q?dI+/SSHf+/sC9hGOtspDlm1Hzpx4Rz4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9df5fb6-de93-4024-f2ad-08de62762b43
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:40.4282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzbzrhqxzY+EPLmK2jCadG0fRhBwUf+pSu8KsLb/yd4Lga8gjoFcUYvHz8H+l+7pMFsPUY/YopJbogvztkZN1A==
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
X-Rspamd-Queue-Id: CA587CEC82
X-Rspamd-Action: no action

Different versions of GICv4 may support different features. Record them
and provide functions to check for their availability.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3.c                  | 175 ++++++++++++++++++++-----
 xen/arch/arm/include/asm/gic.h         |   2 +
 xen/arch/arm/include/asm/gic_v3_defs.h |   9 ++
 xen/arch/arm/include/asm/vgic.h        |   9 ++
 4 files changed, 162 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 9b8b87078b..14852d18c2 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -100,6 +100,38 @@ static struct {
=20
 static struct gic_info gicv3_info;
=20
+#ifdef CONFIG_GICV4
+/* Global state */
+static struct {
+    bool has_vlpis;
+    bool has_direct_lpi;
+    bool has_vpend_valid_dirty;
+    bool has_rvpeid;
+} gicv4 =3D { .has_vlpis =3D true, .has_direct_lpi =3D true,
+            .has_vpend_valid_dirty =3D true, .has_rvpeid =3D true, };
+
+
+bool gic_support_directLPI(void)
+{
+    return gicv4.has_direct_lpi;
+}
+
+bool gic_support_vptValidDirty(void)
+{
+    return gicv4.has_vpend_valid_dirty;
+}
+
+bool gic_has_v4_1_extension(void)
+{
+    return gicv4.has_rvpeid;
+}
+
+bool gic_is_gicv4(void)
+{
+    return gicv4.has_vlpis;
+}
+#endif
+
 /* per-cpu re-distributor base */
 static DEFINE_PER_CPU(void __iomem*, rbase);
=20
@@ -914,7 +946,8 @@ static bool gicv3_enable_lpis(void)
     return true;
 }
=20
-static int __init gicv3_populate_rdist(void)
+static int __init gic_iterate_rdists(int (*fn)(struct rdist_region *,
+                                               void __iomem *))
 {
     int i;
     uint32_t aff;
@@ -958,40 +991,16 @@ static int __init gicv3_populate_rdist(void)
=20
             if ( (typer >> 32) =3D=3D aff )
             {
+                int ret;
+
                 this_cpu(rbase) =3D ptr;
=20
-                if ( typer & GICR_TYPER_PLPIS )
-                {
-                    paddr_t rdist_addr;
-                    unsigned int procnum;
-                    int ret;
-
-                    /*
-                     * The ITS refers to redistributors either by their ph=
ysical
-                     * address or by their ID. Which one to use is an ITS
-                     * choice. So determine those two values here (which w=
e
-                     * can do only here in GICv3 code) and tell the
-                     * ITS code about it, so it can use them later to be a=
ble
-                     * to address those redistributors accordingly.
-                     */
-                    rdist_addr =3D gicv3.rdist_regions[i].base;
-                    rdist_addr +=3D ptr - gicv3.rdist_regions[i].map_base;
-                    procnum =3D (typer & GICR_TYPER_PROC_NUM_MASK);
-                    procnum >>=3D GICR_TYPER_PROC_NUM_SHIFT;
-
-                    gicv3_set_redist_address(rdist_addr, procnum);
-
-                    ret =3D gicv3_lpi_init_rdist(ptr);
-                    if ( ret && ret !=3D -ENODEV )
-                    {
-                        printk("GICv3: CPU%d: Cannot initialize LPIs: %u\n=
",
-                               smp_processor_id(), ret);
-                        break;
-                    }
-                }
-
-                printk("GICv3: CPU%d: Found redistributor in region %d @%p=
\n",
-                        smp_processor_id(), i, ptr);
+                ret =3D fn(gicv3.rdist_regions + i, ptr);
+                if ( ret )
+                    return ret;
+
+                printk("GICv3: CPU%d: Found redistributor @%p\n",
+                       smp_processor_id(), ptr);
                 return 0;
             }
=20
@@ -1010,11 +1019,107 @@ static int __init gicv3_populate_rdist(void)
         } while ( !(typer & GICR_TYPER_LAST) );
     }
=20
+    return -ENODEV;
+}
+
+static int __init __gicv3_populate_rdist(struct rdist_region *region,
+                                         void __iomem *ptr)
+{
+    uint64_t typer;
+
+    typer =3D readq_relaxed(ptr + GICR_TYPER);
+    if ( typer & GICR_TYPER_PLPIS )
+    {
+        paddr_t rdist_addr;
+        unsigned int procnum;
+        int ret;
+
+        /*
+         * The ITS refers to redistributors either by their physical
+         * address or by their ID. Which one to use is an ITS
+         * choice. So determine those two values here (which we
+         * can do only here in GICv3 code) and tell the
+         * ITS code about it, so it can use them later to be able
+         * to address those redistributors accordingly.
+         */
+        rdist_addr =3D region->base;
+        rdist_addr +=3D ptr - region->map_base;
+        procnum =3D (typer & GICR_TYPER_PROC_NUM_MASK);
+        procnum >>=3D GICR_TYPER_PROC_NUM_SHIFT;
+
+        gicv3_set_redist_address(rdist_addr, procnum);
+
+        ret =3D gicv3_lpi_init_rdist(ptr);
+        if ( ret && ret !=3D -ENODEV )
+        {
+            printk("GICv3: CPU%d: Cannot initialize LPIs: %d\n",
+                   smp_processor_id(), ret);
+            printk("%s %d\n", __func__, __LINE__);
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+static int __init gicv3_populate_rdist(void)
+{
+    int ret =3D gic_iterate_rdists(__gicv3_populate_rdist);
+    if ( ret =3D=3D 0)
+        return 0;
+
     dprintk(XENLOG_ERR, "GICv3: CPU%d: mpidr 0x%"PRIregister" has no re-di=
stributor!\n",
             smp_processor_id(), cpu_logical_map(smp_processor_id()));
+    return -ENODEV;
+}
+
+#ifdef CONFIG_GICV4
+static int __init __gicv4_update_vlpi_properties(struct rdist_region *regi=
on,
+                                                 void __iomem *ptr)
+{
+    uint64_t typer;
+
+    typer =3D readq_relaxed(ptr + GICR_TYPER);
+    gicv4.has_vlpis &=3D !!(typer & GICR_TYPER_VLPIS);
+    gicv4.has_rvpeid &=3D !!(typer & GICR_TYPER_RVPEID);
+    /* RVPEID implies some form of DirectLPI. */
+    gicv4.has_direct_lpi &=3D (!!(typer & GICR_TYPER_DirectLPIS) ||
+                             !!(typer & GICR_TYPER_RVPEID));
+    gicv4.has_vpend_valid_dirty &=3D !!(typer & GICR_TYPER_DIRTY);
+
+    /* Detect non-sensical configurations */
+    if ( gicv4.has_rvpeid && !gicv4.has_vlpis )
+    {
+        gicv4.has_direct_lpi =3D false;
+        gicv4.has_vlpis =3D false;
+        gicv4.has_rvpeid =3D false;
+    }
+
+    printk("GICv4: CPU%d: %sVLPI support, %sdirect LPI support, %sValid+Di=
rty support, %sRVPEID support\n",
+           smp_processor_id(), !!(typer & GICR_TYPER_VLPIS) ? "" : "no ",
+           (!!(typer & GICR_TYPER_DirectLPIS) ||
+            !!(typer & GICR_TYPER_RVPEID)) ? "" : "no ",
+           !!(typer & GICR_TYPER_DIRTY) ? "" : "no ",
+           !!(typer & GICR_TYPER_RVPEID) ? "" : "no ");
+
+    return 0;
+}
+
+static int __init gicv4_update_vlpi_properties(void)
+{
+    int ret =3D gic_iterate_rdists(__gicv4_update_vlpi_properties);
+
+    if ( ret =3D=3D 0 )
+        return 0;
=20
     return -ENODEV;
 }
+#else
+static int __init gicv4_update_vlpi_properties(void)
+{
+    return 0;
+}
+#endif
=20
 static int gicv3_cpu_init(void)
 {
@@ -1024,6 +1129,10 @@ static int gicv3_cpu_init(void)
     if ( gicv3_populate_rdist() )
         return -ENODEV;
=20
+    ret =3D gicv4_update_vlpi_properties();
+    if ( ret )
+        return ret;
+
     if ( gicv3_enable_redist() )
         return -ENODEV;
=20
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 8e713aa477..afb1cc3751 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -235,6 +235,8 @@ enum gic_version {
     GIC_INVALID =3D 0,    /* the default until explicitly set up */
     GIC_V2,
     GIC_V3,
+    GIC_V4,
+    GIC_V4_1,
 };
=20
 DECLARE_PER_CPU(uint64_t, lr_mask);
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index c373b94d19..3a7d18ef59 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -93,6 +93,12 @@
=20
 #define GICD_TYPE_LPIS               (1U << 17)
=20
+#define GICD_TYPER2                  0x000c
+
+#define GICD_TYPER2_VIL              (1U << 7)
+#define GICD_TYPER2_VID              GENMASK(4, 0)
+#define GICD_TYPER2_nASSGIcap        (1U << 8)
+
 #define GICD_CTLR_RWP                (1UL << 31)
 #define GICD_CTLR_ARE_NS             (1U << 4)
 #define GICD_CTLR_ENABLE_G1A         (1U << 1)
@@ -149,7 +155,10 @@
=20
 #define GICR_TYPER_PLPIS             (1U << 0)
 #define GICR_TYPER_VLPIS             (1U << 1)
+#define GICR_TYPER_DIRTY             (1U << 2)
+#define GICR_TYPER_DirectLPIS        (1U << 3)
 #define GICR_TYPER_LAST              (1U << 4)
+#define GICR_TYPER_RVPEID            (1U << 7)
 #define GICR_TYPER_PROC_NUM_SHIFT    8
 #define GICR_TYPER_PROC_NUM_MASK     (0xffff << GICR_TYPER_PROC_NUM_SHIFT)
=20
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 360f8a968e..f12d736808 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -405,6 +405,15 @@ extern bool vgic_migrate_irq(struct vcpu *old, struct =
vcpu *new, unsigned int ir
 extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
                                              unsigned int rank, uint32_t r=
);
=20
+/* GICV4 functions */
+#ifdef CONFIG_GICV4
+bool gic_support_vptValidDirty(void);
+bool gic_is_gicv4(void);
+#else
+#define gic_support_vptValidDirty() (false)
+#define gic_is_gicv4() (false)
+#endif
+
 #endif /* !CONFIG_NEW_VGIC */
=20
 /*** Common VGIC functions used by Xen arch code ****/
--=20
2.51.2

