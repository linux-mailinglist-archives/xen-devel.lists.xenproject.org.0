Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAY4K/1re2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E1B0D58
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216567.1526533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpo-00023q-Vw; Thu, 29 Jan 2026 14:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216567.1526533; Thu, 29 Jan 2026 14:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpo-00020w-Ro; Thu, 29 Jan 2026 14:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1216567;
 Thu, 29 Jan 2026 14:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fLTt=AC=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vlSpn-0000f7-8p
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:17:23 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 397206bb-fd1d-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 15:17:20 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI1PR03MB10078.eurprd03.prod.outlook.com (2603:10a6:800:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 14:16:55 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:16:55 +0000
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
X-Inumbo-ID: 397206bb-fd1d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VunVgkEvrIq+U2fX1VBPt6AMSvBwDAV1sCm+eJ3bG/wZkxWmbcKGuMMGELpzN4voOJLx3GGZWlDu9DwW7yFh2DYPMrLzztQVsA9fxDxfNMknUzzPNWGsOSJrUDItLGsyvy0L6cNDg861OjWDUz1w2RdMv/J83PmzuUZfw8jrdjBFjiXJ8gJ2a6pnxvoqasZuS8O8gYhy3zmFD79owjWQU8LejwI5jw05AkYq8ewkFjsv3Oc+bM0FwohmoMMWAVxXTIJwymqrjf0bTnyfo0RkdvEBOPE3lmaJLRrWv0TH8ysvK+MgQ9VuzUgjUkdwkJTky+JFIm41NkuPeeFvpOjq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJTslo0xgIyAVB/EXNqK9tipAhtRx4Tt0xxzCRX5TAQ=;
 b=dRnp7DfzvjKS1sdUN+Ef3gJeKCOpGjETfYkZUNeFVbd3b8DRpKbUh3cx0MoavytxwYAiJ0qY9hCKdjpJPvVva003QkMsojsgAEwGnKyEVA7jF0UcxXKvpEE4mqxZCfEbiRwCT+DQwtCekSjDTQLfOkZmtlrAzKf0UbhrDk075U5T7wsQIH8J7PR4+buAbzwWr94FaaxEBjk+UZN71Qz4BV2jI+58ea6nII+VYAkECYiKiBQPaTiWLQa0T9iv2bOeEvdSNFySQVu6j2PLCnY5B/Eo2KUw/RoSpJVyvRjojNar6+RAbmxi5LaPxCLcHjY0bM++3jai18G6aMb5E19yPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJTslo0xgIyAVB/EXNqK9tipAhtRx4Tt0xxzCRX5TAQ=;
 b=uVjeV6ib0W9YkTTqyyS/bNIqDCEDgffA7e9rAGn96H0XiOa6PTN2UIXyd6OmuLRfl+udIpVvzMScRvJ35LSMzH797trwymDkLQwJAqrGotHEediEcq09PHZ6kYbhKx9Pk2FuVsSzjJv/F9oTi7FXVEP1QBw2gooAvlk7toZxHioZxRoBYgNRoJNcKIPT7ssyRZ4jrjJ+4SIW2RSD36qphH6bKxr0hpTnCmSlNvqk1KF1sOD9eioQCC3qOU8DcHz526mURScsargzM3MzKYY1kft+Yx/PHQ6MlQgtoioJVWl6r7ACprSzreoNJZGB9wm47PHsT7ePVTnr4GBW82Eq8w==
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
Subject: [PATCH v9 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Thread-Topic: [PATCH v9 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Thread-Index: AQHckSnscogayWOoV0WYwtG2zZFEPg==
Date: Thu, 29 Jan 2026 14:16:55 +0000
Message-ID:
 <3a5ff98b9c46c393e856c2e9a645b2cb1509d5c4.1769696107.git.oleksii_moisieiev@epam.com>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1769696107.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI1PR03MB10078:EE_
x-ms-office365-filtering-correlation-id: 37366e22-1551-478a-c7a5-08de5f410ea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nwXgl47sOyfNudHlHF2/H5OnrTO9siReTxW2/z43Qr20i6fZBkAMhHKUdq?=
 =?iso-8859-1?Q?8SzBdcVQfgKERfMDF5wLuGXwMVoqFKanCFie1xY2PHCXI3z5NulcX8hS/o?=
 =?iso-8859-1?Q?ZDw9t0FfjxN8+HBWWMXxf1Em2H5VuW1JLbXxAONUZbql91+1YY9X4yGWov?=
 =?iso-8859-1?Q?vN5DxbaWDryeqra1wU09l4rFSYPH2ofIffNa6EIxjnsHOMMnnT6y5Iy2Gt?=
 =?iso-8859-1?Q?U7HrDr4vcJ6KC/gkpoWqzplPTUQbkzRRAaRumBQFIVZR0aaTbVGKzZKfiP?=
 =?iso-8859-1?Q?1R6QIBMRxr15bhpGANL4CC5Gat3PI3M8nvguenpFRBipa5jlBBr9zYgHtI?=
 =?iso-8859-1?Q?5Zd0g6LzOTc1cjvd7CLT1hq0ZT/t8YbJ0geKPUmfSPI4fxzA9rLDyQPd0Y?=
 =?iso-8859-1?Q?fL2JJKkDp/b142HzbwNurtMU4GJPycbD1jlvbkFHDBYRe3MEZ3nO3JJtWG?=
 =?iso-8859-1?Q?BUTfEOLeMtDXbzfK2+U8yxBYRExx/RkV9e0co0u9GFKv4jLZUd1GGOPCfU?=
 =?iso-8859-1?Q?isGajWqPauv9zIWK1ztW1zRXVnxsLDQqfaphzt00Mkk8cnKq5QBO0i1bjy?=
 =?iso-8859-1?Q?YPnRhiTprhPOye5UR3nHDk1/6Iv10t1Sddils23Ezp4DGmfGMMazqhjgre?=
 =?iso-8859-1?Q?t4ojuTYOEE4hRwIbhv7S4pdGut3zPw3weScLdJSw/iKJk9z0QDK4DfIOlh?=
 =?iso-8859-1?Q?dzgkOklx/jPCHXXBbpXX/2sDxopVc9YTOTp/eFlSa5vy6UHrrKxoWmyOOF?=
 =?iso-8859-1?Q?sgQZV3F5XUtRoqYKUAWzPl9qXF94YV6zgBEkwZYxz40r+AYgfd9YBK5byH?=
 =?iso-8859-1?Q?2pd0tkZi3vdVzCuDMBSGxatIiLTL6fzpt13C7fnt8pwH66U8Sp7dBQ5pqy?=
 =?iso-8859-1?Q?YZLvn0tAay+y7AFnuga9vCAU/iMgydqr3MxVsd3KyOE2TJKVxUH2EMTarX?=
 =?iso-8859-1?Q?ulIMEjULrsPxnuA5EcdrvAoouU04tVPZbMYUdJ97a8PgjEaiG3FrXfbGC4?=
 =?iso-8859-1?Q?RBJsEJq2vwwjN43zVsWZSQ50gI1StdLdbBkCkbchJU0lzUCypC0fmSQ0z3?=
 =?iso-8859-1?Q?XNCOBUfftWoMQ0JTYDEPiHNaApAOjuGVdzRkHGnipRxJNBT+Lu2W5Y7eXe?=
 =?iso-8859-1?Q?eZChfWiMQFCH2z9K+OSf4piAb6IFcorfcax88/b1YOpcVSNX4e1s5/uHY/?=
 =?iso-8859-1?Q?v+NY5bUb9++/zlZPswRMdIG1CsdWh3PXql74fBX8tHPtouOQXDfSvk8Q6M?=
 =?iso-8859-1?Q?KdShX23wblMGDEjcZIAhg8skTFOtM00CzcvngDnRlMMueGtQchML5QFhh9?=
 =?iso-8859-1?Q?v/Y9Th1OAlgVMoWh5GUS1ZFhfpZOELBlGW/c7YK7b3Msg3bhthf02zhf2a?=
 =?iso-8859-1?Q?rTbEBtFx/46/4WnWomt0IP++h5Te/YF/B/0D+0uLlIhgOhW3/cxC6ssldm?=
 =?iso-8859-1?Q?I2HFV3dxABdu97PDJwXeVWvxijs0t0C04A1pws/Ggrg4fd32JlZHiS0oHU?=
 =?iso-8859-1?Q?8dJ62RGF/UVy0r7+WrprZNpkj9gcjbFiiIC/9XBxZmc4Mp8qkeI36T3RZ3?=
 =?iso-8859-1?Q?OU/vvZFhO4tzByJD6LMPGILZov2CYSkc2MY2eqhV4H0ObiyMSRugbdt/2F?=
 =?iso-8859-1?Q?I2qQCKweH4GXdUHr5aa2lmmehQjhgCxN+I45qqq5r8HoqJxUXQ7pQlKjHA?=
 =?iso-8859-1?Q?D5mPQkTgYP8tkp10rBk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WARnp5S1EWXuRwUvG39nAdM7eF9BP5/p6cU+syBAVrHAjHF3hhp6OgylH8?=
 =?iso-8859-1?Q?bJeQuBu3r4z2Qz0uxvE0bbnoNbw1aJsUuxqotRJcpU8wtwnB2NguuUKy9+?=
 =?iso-8859-1?Q?q808wFiX+nFjyEkCEwR9c/aRojd5cW0ohEDK9ZJNaZda8BuHMeXEI5SgeC?=
 =?iso-8859-1?Q?IewLgRcgIQI6FmQ9pu5JgwmiQS3ulmFhbFqYVZNUkHow5H9hxn4I8lq/uS?=
 =?iso-8859-1?Q?ZRdw3kIqGYE7YfbPq1lRQr1YCPccY1Y+aFBIIIIbp2V2v3D2lzfoKtBfgR?=
 =?iso-8859-1?Q?jFWcdfUu/kiwSRr8S3X6ME8YpUGJokkYZ0jF1p00E9+qlL+tKf5f9X7lAK?=
 =?iso-8859-1?Q?NA5Zq1poTTLrGDkHCL2qNiSCH1sYOJTAX+ppAEi0KEIqU/sYx6ksp4ZLJD?=
 =?iso-8859-1?Q?WGBYbO8SzFS7Z7susg7SFn+mWpwQnlu86Aucvlp/u9GdIOyG/PCu/JhW5p?=
 =?iso-8859-1?Q?4j4K00LSdSloxBdqckygNKabkjhI9pVqrvvPRO8RD9Hb54ufbQM02ia9Uh?=
 =?iso-8859-1?Q?8IfPgIavfz7AAHyEkq/rIQRaquaVRdIuc1OZoXPNcvwdaT6vu+eCetslgM?=
 =?iso-8859-1?Q?BVnHFlconOH7Kel4UPg5w+TSjS/DaCFZuNCHBmkdLNPg2n6g/1CMfaP6FV?=
 =?iso-8859-1?Q?pbD2MQmWoR+g+kuYy0mJ2OjTspOAOAJGk2rBbRfeRZHlJY5BlgTr44MiAL?=
 =?iso-8859-1?Q?xG2iiUE2EwG/wxpoeEgN1flxUVubpR4+VhoovwEyCS8oNB34aecaQdtgj6?=
 =?iso-8859-1?Q?MymY0m0oap5mdP/S+c5nP4BR2yg69mqPk64ob4wVCEeCtGzuxS/oJeLZQe?=
 =?iso-8859-1?Q?nc9CY8fWPH11sMFChOpOjOLmlUYQhETrqWKRHjVLgwq2P9iu5n1fqYlUEh?=
 =?iso-8859-1?Q?K7c/4Z+IQsFEtNyGfFRv5zJZB0NrQYVCMVrEO2XCI/fEaBNWUmEwsLnk1/?=
 =?iso-8859-1?Q?BoSK1K8SwtLWKQ4lZfDAGEWGXMygPiD1ZqLaLy7tRWCPEHyy379CzrHMxi?=
 =?iso-8859-1?Q?RvUfn51nAAjFG9S2hHJvHIqvjVHYiFSrlKzjUyRONXvRggM+f52wjLvzsW?=
 =?iso-8859-1?Q?R/F0JYGV0eayfLHyrPycLeEWMtnbcP7Q0+X5eYIxWer1G8y5KLlp6hzL2R?=
 =?iso-8859-1?Q?Vhf/jHOnf4NI97T5SW+hmedivbbMZJWDWAzdKfjfFXmuED3Daxu396V3Sn?=
 =?iso-8859-1?Q?ItKnfN7UC1JVz387qSEjVxthtdb6eQsO1k1vHMSRb0q5W/slWUsm3L5UlB?=
 =?iso-8859-1?Q?IoDt3x1fmRFsPKrbxDd39tm4bhXy362E4um38P7CrngKEM9QJespFfwiNh?=
 =?iso-8859-1?Q?UneV4QILana7S+akFsTRlufuDIMk74nugEE0l7BVABdIRb/rPZR23Mrvoe?=
 =?iso-8859-1?Q?h2W7VfIBspx7dSOjMVcfFpKYCkNW6UI2gE99ddPPZxXQBI6LZZoRHu7hNO?=
 =?iso-8859-1?Q?BhlA6ESDCDrgZh9jLDOgHIWvSqywrCcVdbsdrxHDaPgeLZ35hHNwYs2cnP?=
 =?iso-8859-1?Q?gXH1HlWyr9HAXIMHsRnMf5pl9T2TXiEspeElgemue336vuOrnSKOU3ZuDs?=
 =?iso-8859-1?Q?gJt567dU9voIkioWbVV1PzpB+G9p0OhdVLxyMfvVJWJBGAyldS6Qgop6DP?=
 =?iso-8859-1?Q?U5mZRWLHsgCn5D12Vf8n+JDvJAgM1iCH+2GIqot1txLb1PcWFwXCGqBm/j?=
 =?iso-8859-1?Q?IJkmjeAiKVSCoewOXqM9MNxScdyQMOdI3lVWlAxAbY2uxbBa+Se1ZFaF5b?=
 =?iso-8859-1?Q?Azx2BNXWI26Hd7Wvf5tC/w81feLxcrEXdpcu/feCYQZWVC3GS2H76fmgSf?=
 =?iso-8859-1?Q?khqy5CG4wQNEkdHk0hQHZHEaGKTn3Ig=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37366e22-1551-478a-c7a5-08de5f410ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 14:16:55.5707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4V3+sewoYmfxMpx3kz29MqplF/6faCpI/mIVDSco56mZrE+2weiOB+nVFt2j0uzlUYJ1Ib3RqTOh3HyiuiqcGzKGTWwVYNkT4w/9Gs7ln2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[47ff2000:email,x:email,arm.com:url,47ff0000:email,support.md:url,epam.com:email,epam.com:dkim,epam.com:mid,0.0.0.1:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,hdr.id:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.85.241:email,1.79.181.104:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D80E1B0D58
X-Rspamd-Action: no action

This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
(TF-A) which provides SCMI interface with multi-agent support, as shown
below.

  +-----------------------------------------+
  |                                         |
  | EL3 TF-A SCMI                           |
  +-------+--+-------+--+-------+--+-------++
  |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
  +-----+-+  +---+---+  +--+----+  +---+---+
smc-id1 |        |         |           |
agent1  |        |         |           |
  +-----v--------+---------+-----------+----+
  |              |         |           |    |
  |              |         |           |    |
  +--------------+---------+-----------+----+
         smc-id0 |  smc-id2|    smc-idX|
         agent0  |  agent2 |    agentX |
                 |         |           |
            +----v---+  +--v-----+  +--v-----+
            |        |  |        |  |        |
            | Dom0   |  | Dom1   |  | DomX   |
            |        |  |        |  |        |
            |        |  |        |  |        |
            +--------+  +--------+  +--------+

The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared
memory transport for every Agent in the system.

The SCMI Agent transport channel defined by pair:
 - smc-id: SMC id used for Doorbell
 - shmem: shared memory for messages transfer, Xen page
 aligned. Shared memort is mapped with the following flags:
 MT_DEVICE_nGnRE.

The follwoing SCMI Agents are expected to be defined by SCMI FW to enable S=
CMI
multi-agent functionality under Xen:
- Xen management agent: trusted agents that accesses to the Base Protocol
commands to configure agent specific permissions
- OSPM VM agents: non-trusted agent, one for each Guest domain which is
  allowed direct HW access. At least one OSPM VM agent has to be provided
  by FW if HW is handled only by Dom0 or Driver Domain.

The EL3 SCMI FW is expected to implement following Base protocol messages:
- BASE_DISCOVER_AGENT (optional if agent_id was provided)
- BASE_RESET_AGENT_CONFIGURATION (optional)
- BASE_SET_DEVICE_PERMISSIONS (optional)

The SCI SCMI SMC multi-agent driver implements following
functionality:
- The driver is initialized from the Xen SCMI container ``xen_scmi_config``
  (compatible ``xen,sci``) placed under ``/chosen/xen``. Only the
  ``arm,scmi-smc`` node that is a child of this container will bind to Xen;
  other SCMI nodes (for example under ``/firmware``) are ignored to avoid
  stealing the host OSPM instance.

scmi_shm_1: sram@47ff1000 {
          compatible =3D "arm,scmi-shmem";
          reg =3D <0x0 0x47ff1000 0x0 0x1000>;
};
scmi_xen: scmi {
        compatible =3D "arm,scmi-smc";
        arm,smc-id =3D <0x82000003>; <--- Xen management agent smc-id
        #address-cells =3D < 1>;
        #size-cells =3D < 0>;
        #access-controller-cells =3D < 1>;
        shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
};

- The driver obtains Xen specific SCMI Agent's configuration from the
  Host DT, probes Agents and builds SCMI Agents list. The Agents
  configuration is taken from "scmi-secondary-agents" property where
  first item is "arm,smc-id", second - "arm,scmi-shmem" phandle and
  third is optional "agent_id":

/ {
  chosen {
    xen {
      ranges;
      xen_scmi_config {
        compatible =3D "xen,sci";
        #address-cells =3D <2>;
        #size-cells =3D <2>;
        ranges;

        scmi_shm_0: sram@47ff0000 {
          compatible =3D "arm,scmi-shmem";
          reg =3D <0x0 0x47ff0000 0x0 0x1000>;
        };

        /* Xen SCMI management channel */
        scmi_shm_1: sram@47ff1000 {
          compatible =3D "arm,scmi-shmem";
          reg =3D <0x0 0x47ff1000 0x0 0x1000>;
        };

        scmi_shm_2: sram@47ff2000 {
          compatible =3D "arm,scmi-shmem";
          reg =3D <0x0 0x47ff2000 0x0 0x1000>;
        };

        scmi_shm_3: sram@47ff3000 {
          compatible =3D "arm,scmi-shmem";
          reg =3D <0x0 0x47ff3000 0x0 0x1000>;
        };

        scmi-secondary-agents =3D <
          0x82000002 &scmi_shm_0 0
          0x82000004 &scmi_shm_2 2
          0x82000005 &scmi_shm_3 3>; <--- func_id, shmem, agent_id
        #scmi-secondary-agents-cells =3D <3>;
	xen,dom0-sci-agent-id =3D <0>;

        scmi_xen: scmi {
          compatible =3D "arm,scmi-smc";
          arm,smc-id =3D <0x82000003>; <--- Xen management agent func_id
          #address-cells =3D <1>;
          #size-cells =3D <0>;
          #access-controller-cells =3D <1>;
          shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
        };
      };
    };
  };
};

/ {
    /*
     * Host SCMI OSPM channel - provided to the Dom0 as is if SCMI
     * enabled for it, ignored by Xen multi-agent mediator
     */
    scmi_shm: sram@47ff0000 {
            compatible =3D "arm,scmi-shmem";
            reg =3D <0x0 0x47ff0000 0x0 0x1000>;
    };

    firmware {
      scmi: scmi {
        compatible =3D "arm,scmi-smc";
        arm,smc-id =3D <0x82000002>; <--- Host OSPM agent smc-id
        #address-cells =3D < 1>;
        #size-cells =3D < 0>;
        shmem =3D <&scmi_shm>; <--- Host OSPM agent shmem

        protocol@X{
        };
      };
   };
};

This approach allows defining multiple SCMI Agents by adding
Xen-specific properties under the ``/chosen`` node to the Host Device
Tree, leaving the main part unchanged. The Host DT SCMI channel will
be passed to Dom0.

The Xen management agent is described as a ``scmi_xen`` node under the
``xen,sci`` comaptible node, which is used by Xen to control other
SCMI Agents in the system.

All secondary agents' configurations are provided in the
``scmi-secondary-agents`` property with an optional ``agent_id`` field.

The ``agent_id`` from the ``scmi-secondary-agents`` property is used
to identify the agent in the system and can be omitted by setting
``#scmi-secondary-agents-cells =3D <2>``, so the Secondary Agents
configuration will look like this:

/ {
  chosen {
    xen {
      xen_scmi_config {
        compatible =3D "xen,sci";
        #address-cells =3D <2>;
        #size-cells =3D <2>;
        ranges;

        /* Shared memory nodes as defined earlier */

        scmi-secondary-agents =3D <
          0x82000003 &scmi_shm_0
          0x82000004 &scmi_shm_2
          0x82000005 &scmi_shm_3
          0x82000006 &scmi_shm_4>;
        #scmi-secondary-agents-cells =3D <2>;
      };
    };
  };
}

In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to
discover the ``agent_id`` for each secondary agent. Providing the
``agent_id`` in the ``scmi-secondary-agents`` property allows skipping
the discovery call, which is useful when the secondary agent's shared
memory is not accessible by Xen or when boot time is important because
it allows skipping the agent discovery procedure.

  Note that Xen is the only one entry in the system which need to know
  about SCMI multi-agent support.

SMC ID Configuration and SCMI Connection Compatibility:

The configuration allows the same device tree to work for both baremetal
Linux and Linux Dom0. This is achieved because:

- Baremetal Linux uses: func_id 0x82000002, scmi-shmem 0x47ff0000
- Dom0 Linux uses: func_id 0x82000002, scmi-shmem 0x47ff0000
- Xen management uses: func_id 0x82000003, scmi-shmem 0x47ff1000

This works because the privileged SCMI connection in EL3 firmware is not
tied exclusively to func_id 0x82000002. The EL3 firmware supports multiple
SCMI agents with different SMC IDs and shared memory regions. Each agent
(Dom0 via 0x82000002, Xen via 0x82000003, other domains via additional
func_ids) has an independent communication channel to the firmware.

The key distinction is that Xen's management channel (0x82000003) is used
for privileged operations like agent configuration and device permissions
(BASE_SET_DEVICE_PERMISSIONS, BASE_RESET_AGENT_CONFIGURATION), while Dom0's
channel (0x82000002) is used for standard SCMI protocol operations (power,
clock, sensor management, etc.). The firmware enforces different permission
levels for each agent based on their agent_id, not the SMC ID.

Therefore, there is no conflict: Linux Dom0 retains its standard SCMI
connection for hardware management, while Xen uses its separate privileged
channel for mediating access between multiple domains.

- It implements the SCI subsystem interface required for configuring and
enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
SCMI functionality for domain it has to be configured with unique supported
SCMI Agent_id and use corresponding SCMI SMC shared memory transport
[smc-id, shmem] defined for this SCMI Agent_id.
- Once Xen domain is configured it can communicate with EL3 SCMI FW:
  -- zero-copy, the guest domain puts SCMI message in shmem;
  -- the guest triggers SMC exception with smc-id (doorbell);
  -- the Xen driver catches exception, do checks and synchronously forwards
  it to EL3 FW.
- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
  management agent channel on domain destroy event. This allows to reset
  resources used by domain and so implement use-case like domain reboot.

Dom0 Enable SCMI SMC:
 - set xen,dom0-sci-agent-id=3D<agent_id> under the xen,sci container in
   the Host DT. If the property is absent, SCMI is disabled for Dom0
   and all SCMI nodes are removed from the Dom0 DT. The driver updates
   the Dom0 DT SCMI node "arm,smc-id" value and fixes up the shmem
   node according to the assigned agent_id.

 - pass dom0=3Dsci-agent-id=3D<agent_id> in Xen command line. if not provid=
ed
   SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
   The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
   node according to assigned agent_id.

Guest domains enable SCMI SMC:
 - xl.cfg: add configuration option as below

   arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"

 - xl.cfg: enable access to the "arm,scmi-shmem" which should
 correspond assigned agent_id for the domain, for example:

iomem =3D [
    "47ff2,1@22001",
]

 - DT: add SCMI nodes to the Driver domain partial device tree as in the
 below example. The "arm,smc-id" should correspond assigned agent_id
 for the domain:

passthrough {
   scmi_shm_0: sram@22001000 {
       compatible =3D "arm,scmi-shmem";
       reg =3D <0x0 0x22001000 0x0 0x1000>;
   };

   firmware {
        compatible =3D "simple-bus";
            scmi: scmi {
                compatible =3D "arm,scmi-smc";
                arm,smc-id =3D <0x82000004>;
                shmem =3D <&scmi_shm_0>;
                ...
            }
    }
}

SCMI "4.2.1.1 Device specific access control"

The XEN SCI SCMI SMC multi-agent driver performs "access-controller"
provider function in case EL3 SCMI FW implements SCMI "4.2.1.1 Device
specific access control" and provides the BASE_SET_DEVICE_PERMISSIONS
command to configure the devices that an agents have access to.
The DT SCMI node should "#access-controller-cells=3D<1>" property and DT
devices should be bound to the Xen SCMI.

&i2c1 {
	access-controllers =3D <&scmi 0>;
};

The Dom0 and dom0less domains DT devices will be processed
automatically through sci_assign_dt_device() call, but to assign SCMI
devices from toolstack the xl.cfg:"dtdev" property
shall be used:

dtdev =3D [
    "/soc/i2c@e6508000",
]

xl.cfg:dtdev will contain all nodes which are under SCMI
management (not only those which are behind IOMMU).

Additionally, this patch adds documentation for the pre-existing
scmi-smc-passthrough command line option, which was previously
undocumented.

[0] https://developer.arm.com/documentation/den0056
[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/access-controllers/access-controller=
s.yaml

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v9:
- sort and refactor MAINTAINERS enties
- remove Spurious changes
- add extra check to avoid ASSERT when calling unmap_channel_memory
from assign device method
- set correct tx flag to SCMI_BASE_AGENT_PERMISSIONS_RESET when
freeing resources. Flag should be set to 1 according to the
section 4.2.2.12 [0].
- fix dt node copmaring
- moved channel->shmem check from ASSERT in unmap_memory_channel to
"if" statement. This will prevent firing ASSERT if
unmap_channel_memory was called twice on the same channel.

Changes in v8:
- update xen_scmi func_id in commit description
- updated documentation with the new DT format
- updated opt_dom0_scmi_agent_id setting to avoid it to be equal
SCMI_AGENT_ID_INVALID.
- changed SCMI_AGENT_ID_INVALID from 0xff to UINT8_MAX which makes
code more clear showing that UINT8_MAX is theated like invalid
agent_id and couldn't be used. Also excluded SCMI_AGENT_ID_INVALID
from acceptable value range
- remove outdated xen,config property ignore, added xen,sci compatible
to skip_matches in handle_node
- add documentation for pre-existing scmi-smc-passthrough command line
option in alphabetically correct location (in 's' section)
- add note to commit description about documentation for previously
undocumented scmi-smc-passthrough
- Fix SMC IDs in DT examples (Xen management uses 0x82000003, Dom0 uses 0x8=
2000002)
- Add explicit note explaining why Dom0 and Xen channels do not conflict
- Document dom0less multi-agent configuration example (xen,sci_type / xen,s=
ci-agent-id)
- Add scmi_xen node to agent-discovery example with #scmi-secondary-agents-=
cells =3D 2
- Drop dom0=3Dsci-agent-id command line handling; Dom0 SCMI is now enabled =
via
  xen,dom0-sci-agent-id in the xen,sci DT container
- Refresh docs and examples to mention the DT property instead of the cmdli=
ne option

Changes in v7:
- rework scmi nodes for xen to match on compatible string instead of
the direct path

Changes in v6:
- updated scmi-shmem to use io.h from generic location
- update scmi_agent_id parameter to be provided inside dom0=3D parameter
list and have the following format "dom0=3Dsci-agent-id=3D0"
This change was done as a response for Stefano comment and
requires a lot of code changes, but produces much cleaner solution
that's why I've added it to the code.
- fix file comments and return codes
- fix lenght checks in shmem_{get,put}_message to use offsetof
- remove len member from scmi_channel structure as it is not used
- set scmi-secondary-agents property to be mandatory since if no
secondary agents were provided then there is no sence to enable scmi
when no secondary agents are populated to the Domains
- update documentation in booting.txt, added xen_scmi node to the
example
- adjust d->arch.sci_enabled value in scmi_domain_destroy
- fix lock management in smc_create_channel call
- avoid extra map_channel_memory command for Xen management channel
because collect_agent_id call unmaps memory if DOMID_XEN is not
set. So for Xen management channel we can init domain_id ad DOMID_XEN
before calling collect_agent_id so memory shouldn't be unmapped.

Changes in v5:
- fix device-tree example format in booting.txt, added ";" after "}".
- update define in scmi-proto.h
- update define in scmi-shmem.h file
- scmi_assign_device - do not ignore -EOPNOTSUPP return
code of the do_smc_xfer
- remove overwriting agent_channel->agent_id after
SCMI_BASE_DISCOVER_AGENT call
- add multi-agent files to the MAINTAINERS
- add SCMI multi-agent description to the SUPPORT.md
- handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
for smc call
- updated collect_agents function. Set agent_id parameter as optional
in scmi-secondary-agents device-tree property
- introduce "#scmi-secondary-agents-cells" parameter to set if
agent_id was provided
- reanme xen,scmi-secondary-agents property to scmi-secondary-agents
- move memcpu_toio/fromio for the generic place
- update Xen to get management channel from /chosen/xen,config node
- get hypervisor channnel from node instead of using hardcoded
- update handling scmi and shmem nodes for the domain
- Set multi-agent driver to support only Arm64

Changes in v4:
- toolstack comments from Anthony PERARD
- added dom0less support
- added doc for "xen,scmi-secondary-agents"

 MAINTAINERS                                 |   1 +
 SUPPORT.md                                  |  11 +
 docs/man/xl.cfg.5.pod.in                    |  13 +
 docs/misc/arm/device-tree/booting.txt       | 196 +++++
 tools/libs/light/libxl_arm.c                |   4 +
 tools/libs/light/libxl_types.idl            |   4 +-
 tools/xl/xl_parse.c                         |  12 +
 xen/arch/arm/dom0less-build.c               |  11 +
 xen/arch/arm/domain_build.c                 |  39 +
 xen/arch/arm/firmware/Kconfig               |  12 +
 xen/arch/arm/firmware/Makefile              |   1 +
 xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
 xen/arch/arm/firmware/scmi-shmem.c          | 115 +++
 xen/arch/arm/firmware/scmi-shmem.h          |  45 ++
 xen/arch/arm/firmware/scmi-smc-multiagent.c | 818 ++++++++++++++++++++
 xen/include/public/arch-arm.h               |   3 +
 16 files changed, 1448 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/firmware/scmi-proto.h
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
 create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bf00be928c..3f82a07070 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -529,6 +529,7 @@ SCI MEDIATORS
 R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
 S:	Supported
 F:	xen/arch/arm/firmware/sci.c
+F:  	xen/arch/arm/firmware/scmi-*.[ch]
 F:	xen/arch/arm/include/asm/firmware/sci.h
=20
 SEABIOS UPSTREAM
diff --git a/SUPPORT.md b/SUPPORT.md
index d441bccf37..03e3985da2 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -956,6 +956,17 @@ by hwdom. Some platforms use SCMI for access to system=
-level resources.
=20
     Status: Supported
=20
+### Arm: SCMI SMC multi-agent support
+
+Enable support for the multi-agent configuration of the EL3 Firmware, whic=
h
+allows Xen to provide an SCMI interface to the Domains.
+Xen manages access permissions to the HW resources and provides an SCMI in=
terface
+to the Domains. Each Domain is represented as a separate Agent, which can
+communicate with EL3 Firmware using a dedicated shared memory region, and
+notifications are passed through by Xen.
+
+    Status, ARM64: Tech Preview
+
 ### ARM: Guest PSCI support
=20
 Emulated PSCI interface exposed to guests. We support all mandatory
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 27c455210b..6943ae29ad 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3156,8 +3156,21 @@ single SCMI OSPM agent support.
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
+existing on a single host must be unique and in the range [1..255].
+
 =3Dback
=20
 =3Dback
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-t=
ree/booting.txt
index 977b428608..6b88dae347 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -322,6 +322,20 @@ with the following properties:
     Should be used together with scmi-smc-passthrough Xen command line
     option.
=20
+    - "scmi_smc_multiagent"
+
+    Enables ARM SCMI SMC multi-agent support for the guest by enabling SCM=
I over
+    SMC calls forwarding from domain to the EL3 firmware (like ARM
+    Trusted Firmware-A) with a multi SCMI OSPM agent support.
+    The SCMI agent_id should be specified for the guest with "xen,sci-agen=
t-id"
+    property.
+
+- "xen,sci-agent-id"
+
+    Specifies ARM SCMI agent id for the guest. This option is mandatory if=
 the
+    SCMI SMC "scmi_smc_multiagent" support is enabled for the guest. The a=
gent ids
+    of guest must be unique and in the range [0..255].
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
=20
@@ -824,3 +838,185 @@ The automatically allocated static shared memory will=
 get mapped at
 0x80000000 in DomU1 guest physical address space, and at 0x90000000 in Dom=
U2
 guest physical address space. DomU1 is explicitly defined as the owner dom=
ain,
 and DomU2 is the borrower domain.
+
+SCMI SMC multi-agent support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+For enabling the ARM SCMI SMC multi-agent support (enabled by CONFIG_SCMI_=
SMC_MA)
+the Xen specific SCMI Agent's configuration shall be provided in the Host =
DT
+according to the SCMI compliant EL3 Firmware specification with ARM SMC/HV=
C
+transport. The SCMI configuration must live under the Xen SCMI container
+"xen,sci" beneath "/chosen" (for example "/chosen/xen/xen_scmi_config/scmi=
"). The
+Xen SCMI mediator will bind only to the "arm,scmi-smc" node that is a chil=
d of
+this "xen,sci" container; any other "arm,scmi-smc" nodes (for example unde=
r
+"/firmware") are ignored to avoid stealing the host's SCMI OSPM instance.
+
+- scmi-secondary-agents
+
+    Defines a set of SCMI agents configuration supported by SCMI EL3 FW an=
d
+    available for Xen. Each Agent defined as triple consisting of:
+    SMC/HVC function_id assigned for the agent transport ("arm,smc-id"),
+    phandle to SCMI SHM assigned for the agent transport ("arm,scmi-shmem"=
),
+    SCMI agent_id (optional) if not set - Xen will determine Agent ID for
+    each provided channel using BASE_DISCOVER_AGENT message.
+
+- xen,dom0-sci-agent-id
+
+    Optional. Specifies the Dom0/hwdom SCMI agent_id inside the ``xen,sci`=
`
+    container. When provided, Dom0 will be configured for SCMI multi-agent
+    support; when omitted, SCMI remains disabled for Dom0. The value must
+    match the ``func_id`` and shmem pairing that EL3 firmware exposes for
+    Dom0 (for example via ``/firmware/scmi``).
+
+As an example:
+
+/ {
+    chosen {
+        xen {
+            ranges;
+            xen_scmi_config {
+                compatible =3D "xen,sci";
+                #address-cells =3D <2>;
+                #size-cells =3D <2>;
+                ranges;
+
+                scmi_shm_0: sram@47ff0000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+                };
+
+                /* Xen SCMI management channel */
+                scmi_shm_1: sram@47ff1000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+                };
+
+                scmi_shm_2: sram@47ff2000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+                };
+
+                scmi_shm_3: sram@47ff3000 {
+                    compatible =3D "arm,scmi-shmem";
+                    reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+                };
+
+                xen,dom0-sci-agent-id =3D <0>; <--- dom0 agent id
+                scmi-secondary-agents =3D <
+                    0x82000002 &scmi_shm_0 0
+                    0x82000004 &scmi_shm_2 2
+                    0x82000005 &scmi_shm_3 3>; <--- func_id, shmem, agent_=
id
+                #scmi-secondary-agents-cells =3D <3>;
+
+                scmi_xen: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    arm,smc-id =3D <0x82000003>; <--- Xen management agent=
 func_id
+                    #address-cells =3D <1>;
+                    #size-cells =3D <0>;
+                    #access-controller-cells =3D <1>;
+                    shmem =3D <&scmi_shm_1>; <--- Xen management agent shm=
em
+                };
+            };
+        };
+    };
+};
+
+Note: This example keeps the Host DT unchanged for Dom0 and baremetal Linu=
x
+by using func_id 0x82000002 / shmem 0x47ff0000 for Dom0, while Xen uses a
+separate privileged channel func_id 0x82000003 / shmem 0x47ff1000. EL3
+firmware enforces permissions per agent_id, so there is no conflict betwee=
n
+Dom0 and Xen channels.
+
+- #scmi-secondary-agents-cells
+
+    Defines whether Agent_id is set in the "scmi-secondary-agents" propert=
y.
+    Possible values are: 2, 3.
+    When set to 3 (the default), expect agent_id to be present in the seco=
ndary
+    agents list.
+    When set to 2, agent_id will be discovered for each channel using
+    BASE_DISCOVER_AGENT message.
+
+
+Example:
+
+/ {
+    chosen {
+        xen {
+            ranges;
+            xen_scmi_config {
+                compatible =3D "xen,sci";
+                #address-cells =3D <2>;
+                #size-cells =3D <2>;
+                ranges;
+
+                /* Shared memory nodes as in the previous example */
+
+                scmi-secondary-agents =3D <
+                    0x82000002 &scmi_shm_0
+                    0x82000004 &scmi_shm_2
+                    0x82000005 &scmi_shm_3
+                    0x82000006 &scmi_shm_4>;
+                #scmi-secondary-agents-cells =3D <2>;
+
+                scmi_xen: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    arm,smc-id =3D <0x82000003>; <--- Xen management agent=
 func_id
+                    #address-cells =3D <1>;
+                    #size-cells =3D <0>;
+                    #access-controller-cells =3D <1>;
+                    shmem =3D <&scmi_shm_1>; <--- Xen management agent shm=
em
+                };
+            };
+        };
+    };
+};
+
+Dom0less example (multi-agent)
+-------------------------------
+
+Below is a minimal dom0less configuration showing how to enable SCMI SMC
+multi-agent for a pre-defined guest domain using xen,sci_type and
+xen,sci-agent-id, together with the Xen SCMI container:
+
+chosen {
+    xen {
+        ranges;
+        xen_scmi_config {
+            compatible =3D "xen,sci";
+            #address-cells =3D <2>;
+            #size-cells =3D <2>;
+            ranges;
+
+            /* Xen management channel shared memory */
+            scmi_shm_1: sram@47ff1000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+            };
+
+            scmi_shm_domu: sram@47ff2000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+            };
+
+            scmi-secondary-agents =3D <
+                0x82000004 &scmi_shm_domu 2>;
+            #scmi-secondary-agents-cells =3D <3>;
+
+            scmi_xen: scmi {
+                compatible =3D "arm,scmi-smc";
+                arm,smc-id =3D <0x82000003>;
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+                #access-controller-cells =3D <1>;
+                shmem =3D <&scmi_shm_1>;
+            };
+        };
+    };
+
+    xen,domain@1 {
+        compatible =3D "xen,domain";
+        xen,sci_type =3D "scmi_smc_multiagent";
+        xen,sci-agent-id =3D <2>;
+        /* Additional domain properties (memory, cpus, kernels, etc.) */
+    };
+};
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
index 1cc41f1bff..0c389d25f9 100644
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
+            if (!val || val > 255) {
+                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%l=
u). Valid range [1..255]\n",
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
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c10538..ddadc89148 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -299,6 +299,17 @@ static int __init domu_dt_sci_parse(struct dt_device_n=
ode *node,
         d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
     else if ( !strcmp(sci_type, "scmi_smc") )
         d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+    else if ( !strcmp(sci_type, "scmi_smc_multiagent") )
+    {
+        uint32_t agent_id =3D 0;
+
+        if ( !dt_property_read_u32(node, "xen,sci-agent-id", &agent_id) ||
+             agent_id > UINT8_MAX )
+            return -EINVAL;
+
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA=
;
+        d_cfg->arch.arm_sci_agent_id =3D agent_id;
+    }
     else
     {
         printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n"=
,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 986a456f17..c09f50040e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -86,6 +86,37 @@ int __init parse_arch_dom0_param(const char *s, const ch=
ar *e)
     return -EINVAL;
 }
=20
+/* SCMI agent ID for dom0 obtained from xen,sci container */
+#define SCMI_AGENT_ID_INVALID UINT8_MAX
+
+static uint8_t __init get_dom0_scmi_agent_id(void)
+{
+    const struct dt_device_node *config_node;
+    u32 val;
+    const struct dt_property *prop;
+
+    config_node =3D dt_find_compatible_node(NULL, NULL, "xen,sci");
+    if ( !config_node )
+        return SCMI_AGENT_ID_INVALID;
+
+    prop =3D dt_find_property(config_node, "xen,dom0-sci-agent-id", NULL);
+    if ( !prop )
+        return SCMI_AGENT_ID_INVALID;
+
+    if ( !dt_property_read_u32(config_node, "xen,dom0-sci-agent-id", &val)=
 )
+        return SCMI_AGENT_ID_INVALID;
+
+    if ( val >=3D SCMI_AGENT_ID_INVALID )
+    {
+         printk(XENLOG_WARNING
+             "Invalid xen,dom0-sci-agent-id=3D%u, SCMI disabled for Dom0\n=
",
+             val);
+        return SCMI_AGENT_ID_INVALID;
+    }
+
+    return val;
+}
+
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
@@ -1459,6 +1490,7 @@ static int __init handle_node(struct domain *d, struc=
t kernel_info *kinfo,
         DT_MATCH_TYPE("memory"),
         /* The memory mapped timer is not supported by Xen. */
         DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
+        DT_MATCH_COMPATIBLE("xen,sci"),
         { /* sentinel */ },
     };
     static const struct dt_device_match timer_matches[] __initconst =3D
@@ -1947,6 +1979,13 @@ void __init create_dom0(void)
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
+    /* Set up SCMI agent ID if provided in the xen,sci container */
+    dom0_cfg.arch.arm_sci_agent_id =3D get_dom0_scmi_agent_id();
+    dom0_cfg.arch.arm_sci_type =3D (dom0_cfg.arch.arm_sci_agent_id !=3D
+                                  SCMI_AGENT_ID_INVALID) ?
+                                 XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA :
+                                 XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
=20
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 5c5f0880c4..972cd9b173 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -29,6 +29,18 @@ config SCMI_SMC
 	  driver domain.
 	  Use with EL3 firmware which supports only single SCMI OSPM agent.
=20
+config SCMI_SMC_MA
+	bool "Enable ARM SCMI SMC multi-agent driver"
+	depends on ARM_64
+	select ARM_SCI
+	help
+	  Enables SCMI SMC/HVC multi-agent in XEN to pass SCMI requests from Doma=
ins
+	  to EL3 firmware (TF-A) which supports multi-agent feature.
+	  This feature allows to enable SCMI per Domain using unique SCMI agent_i=
d,
+	  so Domain is identified by EL3 firmware as an SCMI Agent and can access
+	  allowed platform resources through dedicated SMC/HVC Shared memory base=
d
+	  transport.
+
 endchoice
=20
 endmenu
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index 71bdefc24a..37927e690e 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
+obj-$(CONFIG_SCMI_SMC_MA) +=3D scmi-shmem.o scmi-smc-multiagent.o
diff --git a/xen/arch/arm/firmware/scmi-proto.h b/xen/arch/arm/firmware/scm=
i-proto.h
new file mode 100644
index 0000000000..49f63cfc0a
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-proto.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ *
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef ARM_FIRMWARE_SCMI_PROTO_H_
+#define ARM_FIRMWARE_SCMI_PROTO_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHORT_NAME_MAX_SIZE 16
+
+/* SCMI status codes. See section 4.1.4 */
+#define SCMI_SUCCESS              0
+#define SCMI_NOT_SUPPORTED      (-1)
+#define SCMI_INVALID_PARAMETERS (-2)
+#define SCMI_DENIED             (-3)
+#define SCMI_NOT_FOUND          (-4)
+#define SCMI_OUT_OF_RANGE       (-5)
+#define SCMI_BUSY               (-6)
+#define SCMI_COMMS_ERROR        (-7)
+#define SCMI_GENERIC_ERROR      (-8)
+#define SCMI_HARDWARE_ERROR     (-9)
+#define SCMI_PROTOCOL_ERROR     (-10)
+
+/* Protocol IDs */
+#define SCMI_BASE_PROTOCOL 0x10
+
+/* Base protocol message IDs */
+#define SCMI_BASE_PROTOCOL_VERSION            0x0
+#define SCMI_BASE_PROTOCOL_ATTIBUTES          0x1
+#define SCMI_BASE_PROTOCOL_MESSAGE_ATTRIBUTES 0x2
+#define SCMI_BASE_DISCOVER_AGENT              0x7
+#define SCMI_BASE_SET_DEVICE_PERMISSIONS      0x9
+#define SCMI_BASE_RESET_AGENT_CONFIGURATION   0xB
+
+typedef struct scmi_msg_header {
+    uint8_t id;
+    uint8_t type;
+    uint8_t protocol;
+    uint32_t status;
+} scmi_msg_header_t;
+
+/* Table 2 Message header format */
+#define SCMI_HDR_ID    GENMASK(7, 0)
+#define SCMI_HDR_TYPE  GENMASK(9, 8)
+#define SCMI_HDR_PROTO GENMASK(17, 10)
+
+#define SCMI_FIELD_GET(_mask, _reg)                                       =
     \
+    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
+#define SCMI_FIELD_PREP(_mask, _val)                                      =
     \
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
+
+static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
+{
+    return SCMI_FIELD_PREP(SCMI_HDR_ID, hdr->id) |
+           SCMI_FIELD_PREP(SCMI_HDR_TYPE, hdr->type) |
+           SCMI_FIELD_PREP(SCMI_HDR_PROTO, hdr->protocol);
+}
+
+static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t =
*hdr)
+{
+    hdr->id =3D SCMI_FIELD_GET(SCMI_HDR_ID, msg_hdr);
+    hdr->type =3D SCMI_FIELD_GET(SCMI_HDR_TYPE, msg_hdr);
+    hdr->protocol =3D SCMI_FIELD_GET(SCMI_HDR_PROTO, msg_hdr);
+}
+
+static inline int scmi_to_xen_errno(int scmi_status)
+{
+    if ( scmi_status =3D=3D SCMI_SUCCESS )
+        return 0;
+
+    switch ( scmi_status )
+    {
+    case SCMI_NOT_SUPPORTED:
+        return -EOPNOTSUPP;
+    case SCMI_INVALID_PARAMETERS:
+        return -EINVAL;
+    case SCMI_DENIED:
+        return -EACCES;
+    case SCMI_NOT_FOUND:
+        return -ENOENT;
+    case SCMI_OUT_OF_RANGE:
+        return -ERANGE;
+    case SCMI_BUSY:
+        return -EBUSY;
+    case SCMI_COMMS_ERROR:
+        return -ENOTCONN;
+    case SCMI_GENERIC_ERROR:
+        return -EIO;
+    case SCMI_HARDWARE_ERROR:
+        return -ENXIO;
+    case SCMI_PROTOCOL_ERROR:
+        return -EBADMSG;
+    default:
+        return -EINVAL;
+    }
+}
+
+/* PROTOCOL_VERSION */
+#define SCMI_VERSION_MINOR GENMASK(15, 0)
+#define SCMI_VERSION_MAJOR GENMASK(31, 16)
+
+struct scmi_msg_prot_version_p2a {
+    uint32_t version;
+} __packed;
+
+/* BASE PROTOCOL_ATTRIBUTES */
+#define SCMI_BASE_ATTR_NUM_PROTO GENMASK(7, 0)
+#define SCMI_BASE_ATTR_NUM_AGENT GENMASK(15, 8)
+
+struct scmi_msg_base_attributes_p2a {
+    uint32_t attributes;
+} __packed;
+
+/*
+ * BASE_DISCOVER_AGENT
+ */
+#define SCMI_BASE_AGENT_ID_OWN 0xFFFFFFFF
+
+struct scmi_msg_base_discover_agent_a2p {
+    uint32_t agent_id;
+} __packed;
+
+struct scmi_msg_base_discover_agent_p2a {
+    uint32_t agent_id;
+    char name[SCMI_SHORT_NAME_MAX_SIZE];
+} __packed;
+
+/*
+ * BASE_SET_DEVICE_PERMISSIONS
+ */
+#define SCMI_BASE_DEVICE_ACCESS_ALLOW           BIT(0, UL)
+
+struct scmi_msg_base_set_device_permissions_a2p {
+    uint32_t agent_id;
+    uint32_t device_id;
+    uint32_t flags;
+} __packed;
+
+/*
+ * BASE_RESET_AGENT_CONFIGURATION
+ */
+#define SCMI_BASE_AGENT_PERMISSIONS_RESET       BIT(0, UL)
+
+struct scmi_msg_base_reset_agent_cfg_a2p {
+    uint32_t agent_id;
+    uint32_t flags;
+} __packed;
+
+#endif /* ARM_FIRMWARE_SCMI_PROTO_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.c b/xen/arch/arm/firmware/scm=
i-shmem.c
new file mode 100644
index 0000000000..6683e62544
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.c
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SMC/HVC shmem transport implementation used by
+ * SCI SCMI multi-agent driver.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/err.h>
+#include <xen/io.h>
+#include <asm/io.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+static inline int
+shmem_channel_is_free(const volatile struct scmi_shared_mem __iomem *shmem=
)
+{
+    return (readl(&shmem->channel_status) &
+            SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE) ? 0 : -EBUSY;
+}
+
+int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
+                      scmi_msg_header_t *hdr, void *data, int len)
+{
+    int ret;
+
+    if ( (len + offsetof(struct scmi_shared_mem, msg_payload)) >
+         SCMI_SHMEM_MAPPED_SIZE )
+    {
+        printk(XENLOG_ERR "scmi: Wrong size of smc message. Data is invali=
d\n");
+        return -EINVAL;
+    }
+
+    ret =3D shmem_channel_is_free(shmem);
+    if ( ret )
+        return ret;
+
+    writel_relaxed(0x0, &shmem->channel_status);
+    /* Writing 0x0 right now, but "shmem"_FLAG_INTR_ENABLED can be set */
+    writel_relaxed(0x0, &shmem->flags);
+    writel_relaxed(sizeof(shmem->msg_header) + len, &shmem->length);
+    writel(pack_scmi_header(hdr), &shmem->msg_header);
+
+    if ( len > 0 && data )
+        memcpy_toio(shmem->msg_payload, data, len);
+
+    return 0;
+}
+
+int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shme=
m,
+                       scmi_msg_header_t *hdr, void *data, int len)
+{
+    int recv_len;
+    int ret;
+    int pad =3D sizeof(hdr->status);
+
+    if ( len >=3D SCMI_SHMEM_MAPPED_SIZE -
+         offsetof(struct scmi_shared_mem, msg_payload) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of input smc message. Data may be invalid=
\n");
+        return -EINVAL;
+    }
+
+    ret =3D shmem_channel_is_free(shmem);
+    if ( ret )
+        return ret;
+
+    recv_len =3D readl(&shmem->length) - sizeof(shmem->msg_header);
+
+    if ( recv_len < 0 )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of smc message. Data may be invalid\n");
+        return -EINVAL;
+    }
+
+    unpack_scmi_header(readl(&shmem->msg_header), hdr);
+
+    hdr->status =3D readl(&shmem->msg_payload);
+    recv_len =3D recv_len > pad ? recv_len - pad : 0;
+
+    ret =3D scmi_to_xen_errno(hdr->status);
+    if ( ret )
+    {
+        printk(XENLOG_DEBUG "scmi: Error received: %d\n", ret);
+        return ret;
+    }
+
+    if ( recv_len > len )
+    {
+        printk(XENLOG_ERR
+               "scmi: Not enough buffer for message %d, expecting %d\n",
+               recv_len, len);
+        return -EINVAL;
+    }
+
+    if ( recv_len > 0 )
+        memcpy_fromio(data, shmem->msg_payload + pad, recv_len);
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.h b/xen/arch/arm/firmware/scm=
i-shmem.h
new file mode 100644
index 0000000000..7313cb6b26
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ * Shared Memory based Transport
+ *
+ * Copyright (c) 2024 EPAM Systems
+ */
+
+#ifndef ARM_FIRMWARE_SCMI_SHMEM_H_
+#define ARM_FIRMWARE_SCMI_SHMEM_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE  BIT(0, UL)
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR BIT(1, UL)
+
+struct scmi_shared_mem {
+    uint32_t reserved;
+    uint32_t channel_status;
+    uint32_t reserved1[2];
+    uint32_t flags;
+    uint32_t length;
+    uint32_t msg_header;
+    uint8_t msg_payload[];
+};
+
+#define SCMI_SHMEM_MAPPED_SIZE PAGE_SIZE
+
+int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
+                      scmi_msg_header_t *hdr, void *data, int len);
+
+int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shme=
m,
+                       scmi_msg_header_t *hdr, void *data, int len);
+#endif /* ARM_FIRMWARE_SCMI_SHMEM_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-smc-multiagent.c b/xen/arch/arm/fir=
mware/scmi-smc-multiagent.c
new file mode 100644
index 0000000000..339c45f285
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-smc-multiagent.c
@@ -0,0 +1,818 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/err.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/string.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/vmap.h>
+
+#include <asm/firmware/sci.h>
+#include <asm/smccc.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+#define SCMI_SECONDARY_AGENTS "scmi-secondary-agents"
+
+struct scmi_channel {
+    uint32_t agent_id;
+    uint32_t func_id;
+    domid_t domain_id;
+    uint64_t paddr;
+    struct scmi_shared_mem __iomem *shmem;
+    spinlock_t lock;
+    struct list_head list;
+};
+
+struct scmi_data {
+    struct list_head channel_list;
+    spinlock_t channel_list_lock;
+    uint32_t func_id;
+    bool initialized;
+    uint32_t shmem_phandle;
+    uint32_t hyp_channel_agent_id;
+    struct dt_device_node *dt_dev;
+};
+
+static struct scmi_data scmi_data;
+
+static bool scmi_is_under_xen_sci(const struct dt_device_node *node)
+{
+    const struct dt_device_node *p;
+
+    for ( p =3D node->parent; p; p =3D p->parent )
+        if ( dt_device_is_compatible(p, "xen,sci") )
+            return true;
+
+    return false;
+}
+
+static int send_smc_message(struct scmi_channel *chan_info,
+                            scmi_msg_header_t *hdr, void *data, int len)
+{
+    struct arm_smccc_res resp;
+    int ret;
+
+    ret =3D shmem_put_message(chan_info->shmem, hdr, data, len);
+    if ( ret )
+        return ret;
+
+    arm_smccc_1_1_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, 0, &resp);
+
+    if ( resp.a0 =3D=3D ARM_SMCCC_INVALID_PARAMETER )
+        return -EINVAL;
+
+    if ( resp.a0 )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+static int do_smc_xfer(struct scmi_channel *chan_info, scmi_msg_header_t *=
hdr,
+                       void *tx_data, int tx_size, void *rx_data, int rx_s=
ize)
+{
+    int ret =3D 0;
+
+    ASSERT(chan_info && chan_info->shmem);
+
+    if ( !hdr )
+        return -EINVAL;
+
+    spin_lock(&chan_info->lock);
+
+    printk(XENLOG_DEBUG
+           "scmi: agent_id =3D %d msg_id =3D %x type =3D %d, proto =3D %x\=
n",
+           chan_info->agent_id, hdr->id, hdr->type, hdr->protocol);
+
+    ret =3D send_smc_message(chan_info, hdr, tx_data, tx_size);
+    if ( ret )
+        goto clean;
+
+    ret =3D shmem_get_response(chan_info->shmem, hdr, rx_data, rx_size);
+
+clean:
+    printk(XENLOG_DEBUG
+           "scmi: get smc response agent_id =3D %d msg_id =3D %x proto =3D=
 %x res=3D%d\n",
+           chan_info->agent_id, hdr->id, hdr->protocol, ret);
+
+    spin_unlock(&chan_info->lock);
+
+    return ret;
+}
+
+static struct scmi_channel *get_channel_by_id(uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    bool found =3D false;
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            found =3D true;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    if ( found )
+        return curr;
+
+    return NULL;
+}
+
+static struct scmi_channel *acquire_scmi_channel(struct domain *d,
+                                                 uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    struct scmi_channel *ret =3D ERR_PTR(-ENOENT);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            if ( curr->domain_id !=3D DOMID_INVALID )
+            {
+                ret =3D ERR_PTR(-EEXIST);
+                break;
+            }
+
+            curr->domain_id =3D d->domain_id;
+            ret =3D curr;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+
+    return ret;
+}
+
+static void relinquish_scmi_channel(struct scmi_channel *channel)
+{
+    ASSERT(channel !=3D NULL);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    channel->domain_id =3D DOMID_INVALID;
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static int map_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT(channel && channel->paddr);
+    channel->shmem =3D ioremap_nocache(channel->paddr, SCMI_SHMEM_MAPPED_S=
IZE);
+    if ( !channel->shmem )
+        return -ENOMEM;
+
+    channel->shmem->channel_status =3D SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE;
+    printk(XENLOG_DEBUG "scmi: Got shmem %lx after vmap %p\n", channel->pa=
ddr,
+           channel->shmem);
+
+    return 0;
+}
+
+static void unmap_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT(channel);
+
+    if ( !channel->shmem )
+        return;
+
+    iounmap(channel->shmem);
+    channel->shmem =3D NULL;
+}
+
+static struct scmi_channel *smc_create_channel(uint32_t agent_id,
+                                               uint32_t func_id, uint64_t =
addr)
+{
+    struct scmi_channel *channel, *curr;
+
+    spin_lock(&scmi_data.channel_list_lock);
+
+    /* Check if channel already exists while holding the lock */
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            spin_unlock(&scmi_data.channel_list_lock);
+            return ERR_PTR(-EEXIST);
+        }
+    }
+
+    channel =3D xmalloc(struct scmi_channel);
+    if ( !channel )
+    {
+        spin_unlock(&scmi_data.channel_list_lock);
+        return ERR_PTR(-ENOMEM);
+    }
+
+    spin_lock_init(&channel->lock);
+    channel->agent_id =3D agent_id;
+    channel->func_id =3D func_id;
+    channel->domain_id =3D DOMID_INVALID;
+    channel->shmem =3D NULL;
+    channel->paddr =3D addr;
+    list_add_tail(&channel->list, &scmi_data.channel_list);
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    return channel;
+}
+
+static void free_channel_list(void)
+{
+    struct scmi_channel *curr, *_curr;
+
+    list_for_each_entry_safe(curr, _curr, &scmi_data.channel_list, list)
+    {
+        list_del(&curr->list);
+        xfree(curr);
+    }
+}
+
+static int __init
+scmi_dt_read_hyp_channel_addr(struct dt_device_node *scmi_node, u64 *addr,
+                              u64 *size)
+{
+    struct dt_device_node *shmem_node;
+    const __be32 *prop;
+
+    prop =3D dt_get_property(scmi_node, "shmem", NULL);
+    if ( !prop )
+        return -EINVAL;
+
+    shmem_node =3D dt_find_node_by_phandle(be32_to_cpu(*prop));
+    if ( IS_ERR_OR_NULL(shmem_node) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Device tree error, can't parse reserved memory %ld\n=
",
+               PTR_ERR(shmem_node));
+        return PTR_ERR(shmem_node);
+    }
+
+    return dt_device_get_address(shmem_node, 0, addr, size);
+}
+
+/*
+ * Handle Dom0 SCMI specific DT nodes
+ *
+ * Make a decision on copying SCMI specific nodes into Dom0 device tree.
+ * For SCMI multi-agent case:
+ * - shmem nodes will not be copied and generated instead if SCMI
+ *   is enabled for Dom0
+ * - scmi node will be copied if SCMI is enabled for Dom0
+ */
+static bool scmi_dt_handle_node(struct domain *d, struct dt_device_node *n=
ode)
+{
+    static const struct dt_device_match shmem_matches[] __initconst =3D {
+        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
+        { /* sentinel */ },
+    };
+    static const struct dt_device_match scmi_matches[] __initconst =3D {
+        DT_MATCH_PATH("/firmware/scmi"),
+        { /* sentinel */ },
+    };
+
+    if ( !scmi_data.initialized )
+        return false;
+
+    /* skip scmi shmem node for dom0 if scmi not enabled */
+    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("  Skip scmi shmem node\n");
+        return true;
+    }
+
+    /* drop scmi if not enabled */
+    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("  Skip scmi node\n");
+        return true;
+    }
+
+    return false;
+}
+
+static int scmi_assign_device(uint32_t agent_id, uint32_t device_id,
+                              uint32_t flags)
+{
+    struct scmi_msg_base_set_device_permissions_a2p tx;
+    struct scmi_channel *channel;
+    scmi_msg_header_t hdr;
+
+    channel =3D get_channel_by_id(scmi_data.hyp_channel_agent_id);
+    if ( !channel )
+        return -EINVAL;
+
+    hdr.id =3D SCMI_BASE_SET_DEVICE_PERMISSIONS;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.agent_id =3D agent_id;
+    tx.device_id =3D device_id;
+    tx.flags =3D flags;
+
+    return do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+}
+
+static int scmi_dt_assign_device(struct domain *d,
+                                 struct dt_phandle_args *ac_spec)
+{
+    struct scmi_channel *agent_channel;
+    uint32_t scmi_device_id =3D ac_spec->args[0];
+    int ret;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    /* The access-controllers is specified for DT dev, but it's not a SCMI=
 */
+    if ( !scmi_data.dt_dev ||
+         !dt_node_path_is_equal(ac_spec->np, scmi_data.dt_dev->full_name) =
)
+        return 0;
+
+    agent_channel =3D d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+
+    ret =3D scmi_assign_device(agent_channel->agent_id, scmi_device_id,
+                             SCMI_BASE_DEVICE_ACCESS_ALLOW);
+    if ( ret )
+    {
+        printk(XENLOG_ERR
+               "scmi: could not assign dev for %pd agent:%d dev_id:%u (%d)=
",
+               d, agent_channel->agent_id, scmi_device_id, ret);
+    }
+
+    spin_unlock(&agent_channel->lock);
+    return ret;
+}
+
+static int collect_agent_id(struct scmi_channel *agent_channel)
+{
+    int ret;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_discover_agent_p2a da_rx;
+    struct scmi_msg_base_discover_agent_a2p da_tx;
+
+    ret =3D map_channel_memory(agent_channel);
+    if ( ret )
+        return ret;
+
+    hdr.id =3D SCMI_BASE_DISCOVER_AGENT;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    da_tx.agent_id =3D agent_channel->agent_id;
+
+    ret =3D do_smc_xfer(agent_channel, &hdr, &da_tx, sizeof(da_tx), &da_rx=
,
+                        sizeof(da_rx));
+    if ( agent_channel->domain_id !=3D DOMID_XEN )
+        unmap_channel_memory(agent_channel);
+    if ( ret )
+        return ret;
+
+    printk(XENLOG_DEBUG "id=3D0x%x name=3D%s\n", da_rx.agent_id, da_rx.nam=
e);
+    agent_channel->agent_id =3D da_rx.agent_id;
+    return 0;
+}
+
+static __init int collect_agents(struct dt_device_node *scmi_node)
+{
+    const struct dt_device_node *config_node;
+    const __be32 *prop;
+    uint32_t len;
+    const __be32 *end;
+    uint32_t cells_per_entry =3D 3; /* Default to 3 cells if property is a=
bsent. */
+
+    config_node =3D dt_find_compatible_node(NULL, NULL, "xen,sci");
+    if ( !config_node )
+    {
+        printk(XENLOG_WARNING "scmi: xen,sci node not found, no agents to =
collect.\n");
+        return -ENOENT;
+    }
+
+    /* Check for the optional '#scmi-secondary-agents-cells' property. */
+    if ( dt_property_read_u32(config_node, "#scmi-secondary-agents-cells",
+                              &cells_per_entry) )
+    {
+        if ( cells_per_entry !=3D 2 && cells_per_entry !=3D 3 )
+        {
+            printk(XENLOG_ERR "scmi: Invalid #scmi-secondary-agents-cells =
value: %u\n",
+                   cells_per_entry);
+            return -EINVAL;
+        }
+    }
+
+    prop =3D dt_get_property(config_node, SCMI_SECONDARY_AGENTS, &len);
+    if ( !prop )
+    {
+        printk(XENLOG_ERR "scmi: No %s property found, no agents to collec=
t.\n",
+               SCMI_SECONDARY_AGENTS);
+        return -EINVAL;
+    }
+
+    /* Validate that the property length is a multiple of the cell size. *=
/
+    if ( len =3D=3D 0 || len % (cells_per_entry * sizeof(uint32_t)) !=3D 0=
 )
+    {
+        printk(XENLOG_ERR "scmi: Invalid length of %s property: %u for %u =
cells per entry\n",
+               SCMI_SECONDARY_AGENTS, len, cells_per_entry);
+        return -EINVAL;
+    }
+
+    end =3D (const __be32 *)((const u8 *)prop + len);
+
+    for ( ; prop < end; )
+    {
+        uint32_t agent_id;
+        uint32_t smc_id;
+        uint32_t shmem_phandle;
+        struct dt_device_node *node;
+        u64 addr, size;
+        int ret;
+        struct scmi_channel *agent_channel;
+
+        smc_id =3D be32_to_cpu(*prop++);
+        shmem_phandle =3D be32_to_cpu(*prop++);
+
+        if ( cells_per_entry =3D=3D 3 )
+            agent_id =3D be32_to_cpu(*prop++);
+        else
+            agent_id =3D SCMI_BASE_AGENT_ID_OWN;
+
+        node =3D dt_find_node_by_phandle(shmem_phandle);
+        if ( !node )
+        {
+            printk(XENLOG_ERR "scmi: Could not find shmem node for agent %=
u\n",
+                   agent_id);
+            return -EINVAL;
+        }
+
+        ret =3D dt_device_get_address(node, 0, &addr, &size);
+        if ( ret )
+        {
+            printk(XENLOG_ERR
+                   "scmi: Could not read shmem address for agent %u: %d\n"=
,
+                   agent_id, ret);
+            return ret;
+        }
+
+        if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
+        {
+            printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
+            return -EINVAL;
+        }
+
+        agent_channel =3D smc_create_channel(agent_id, smc_id, addr);
+        if ( IS_ERR(agent_channel) )
+        {
+            printk(XENLOG_ERR "scmi: Could not create channel for agent %u=
: %ld\n",
+                   agent_id, PTR_ERR(agent_channel));
+            return PTR_ERR(agent_channel);
+        }
+
+        if ( cells_per_entry =3D=3D 2 )
+        {
+            ret =3D collect_agent_id(agent_channel);
+            if ( ret )
+                return ret;
+        }
+
+        printk(XENLOG_DEBUG "scmi: Agent %u SMC %X addr %lx\n", agent_chan=
nel->agent_id,
+               smc_id, (unsigned long)addr);
+    }
+
+    return 0;
+}
+
+static int scmi_domain_init(struct domain *d,
+                            struct xen_domctl_createdomain *config)
+{
+    struct scmi_channel *channel;
+    int ret;
+
+    if ( !scmi_data.initialized )
+        return 0;
+
+    /*
+     * SCMI support is configured via:
+     * - For dom0: xen,dom0-sci-agent-id property under the xen,sci contai=
ner
+     * - For dom0less: xen,sci-agent-id in the domain node
+     * The config->arch.arm_sci_type and config->arch.arm_sci_agent_id
+     * are already set by domain_build.c or dom0less-build.c
+     */
+
+    if ( config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
+        return 0;
+
+    channel =3D acquire_scmi_channel(d, config->arch.arm_sci_agent_id);
+    if ( IS_ERR(channel) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Failed to acquire SCMI channel for agent_id %u: %ld\=
n",
+               config->arch.arm_sci_agent_id, PTR_ERR(channel));
+        return PTR_ERR(channel);
+    }
+
+    printk(XENLOG_INFO
+           "scmi: Acquire channel id =3D 0x%x, domain_id =3D %d paddr =3D =
0x%lx\n",
+           channel->agent_id, channel->domain_id, channel->paddr);
+
+    /*
+     * Dom0 (if present) needs to have an access to the guest memory range
+     * to satisfy iomem_access_permitted() check in XEN_DOMCTL_iomem_permi=
ssion
+     * domctl.
+     */
+    if ( hardware_domain && !is_hardware_domain(d) )
+    {
+        ret =3D iomem_permit_access(hardware_domain, paddr_to_pfn(channel-=
>paddr),
+                                  paddr_to_pfn(channel->paddr + PAGE_SIZE =
- 1));
+        if ( ret )
+            goto error;
+    }
+
+    d->arch.sci_data =3D channel;
+    d->arch.sci_enabled =3D true;
+
+    return 0;
+
+error:
+    relinquish_scmi_channel(channel);
+    return ret;
+}
+
+int scmi_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
+         config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC=
_MA )
+    {
+        dprintk(XENLOG_INFO, "scmi: Unsupported ARM_SCI type\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int scmi_relinquish_resources(struct domain *d)
+{
+    int ret;
+    struct scmi_channel *channel, *agent_channel;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_reset_agent_cfg_a2p tx;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    agent_channel =3D d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+    tx.agent_id =3D agent_channel->agent_id;
+    spin_unlock(&agent_channel->lock);
+
+    channel =3D get_channel_by_id(scmi_data.hyp_channel_agent_id);
+    if ( !channel )
+    {
+        printk(XENLOG_ERR
+               "scmi: Unable to get Hypervisor scmi channel for domain %d\=
n",
+               d->domain_id);
+        return -EINVAL;
+    }
+
+    hdr.id =3D SCMI_BASE_RESET_AGENT_CONFIGURATION;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.flags =3D SCMI_BASE_AGENT_PERMISSIONS_RESET;
+
+    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+    if ( ret =3D=3D -EOPNOTSUPP )
+        return 0;
+
+    return ret;
+}
+
+static void scmi_domain_destroy(struct domain *d)
+{
+    struct scmi_channel *channel;
+
+    if ( !d->arch.sci_data )
+        return;
+
+    channel =3D d->arch.sci_data;
+    spin_lock(&channel->lock);
+
+    relinquish_scmi_channel(channel);
+    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
+
+    d->arch.sci_data =3D NULL;
+    d->arch.sci_enabled =3D false;
+
+    spin_unlock(&channel->lock);
+}
+
+static bool scmi_handle_call(struct cpu_user_regs *regs)
+{
+    uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
+    struct scmi_channel *agent_channel;
+    struct domain *d =3D current->domain;
+    struct arm_smccc_res resp;
+    bool res =3D false;
+
+    if ( !sci_domain_is_enabled(d) )
+        return false;
+
+    agent_channel =3D d->arch.sci_data;
+    spin_lock(&agent_channel->lock);
+
+    if ( agent_channel->func_id !=3D fid )
+    {
+        res =3D false;
+        goto unlock;
+    }
+
+    arm_smccc_1_1_smc(fid,
+                      get_user_reg(regs, 1),
+                      get_user_reg(regs, 2),
+                      get_user_reg(regs, 3),
+                      get_user_reg(regs, 4),
+                      get_user_reg(regs, 5),
+                      get_user_reg(regs, 6),
+                      get_user_reg(regs, 7),
+                      &resp);
+
+    set_user_reg(regs, 0, resp.a0);
+    set_user_reg(regs, 1, resp.a1);
+    set_user_reg(regs, 2, resp.a2);
+    set_user_reg(regs, 3, resp.a3);
+    res =3D true;
+unlock:
+    spin_unlock(&agent_channel->lock);
+
+    return res;
+}
+
+static const struct sci_mediator_ops scmi_ops =3D {
+    .domain_init =3D scmi_domain_init,
+    .domain_destroy =3D scmi_domain_destroy,
+    .relinquish_resources =3D scmi_relinquish_resources,
+    .handle_call =3D scmi_handle_call,
+    .dom0_dt_handle_node =3D scmi_dt_handle_node,
+    .domain_sanitise_config =3D scmi_domain_sanitise_config,
+    .assign_dt_device =3D scmi_dt_assign_device,
+};
+
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
+    {
+        printk(XENLOG_WARNING
+               "scmi: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
+        return -ENOSYS;
+    }
+
+    return 0;
+}
+
+static int __init scmi_dt_hyp_channel_read(struct dt_device_node *scmi_nod=
e,
+                                           struct scmi_data *scmi_data,
+                                           u64 *addr)
+{
+    int ret;
+    u64 size;
+
+    if ( !dt_property_read_u32(scmi_node, "arm,smc-id", &scmi_data->func_i=
d) )
+    {
+        printk(XENLOG_ERR "scmi: unable to read smc-id from DT\n");
+        return -ENOENT;
+    }
+
+    ret =3D scmi_dt_read_hyp_channel_addr(scmi_node, addr, &size);
+    if ( IS_ERR_VALUE(ret) )
+        return -ENOENT;
+
+    if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
+    {
+        printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static __init int scmi_probe(struct dt_device_node *scmi_node, const void =
*data)
+{
+    u64 addr;
+    int ret;
+    struct scmi_channel *channel;
+    unsigned int n_agents;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_attributes_p2a rx;
+
+    ASSERT(scmi_node !=3D NULL);
+
+    /*
+     * Only bind to the SCMI node provided by Xen under the xen,sci contai=
ner
+     * (e.g. /chosen/xen/xen_scmi_config/scmi). This avoids binding to fir=
mware
+     * SCMI nodes that belong to the host OSPM and keeps the mediator scop=
ed to
+     * Xen-provided configuration only.
+     */
+    if ( !scmi_is_under_xen_sci(scmi_node) )
+        return -ENODEV;
+
+    INIT_LIST_HEAD(&scmi_data.channel_list);
+    spin_lock_init(&scmi_data.channel_list_lock);
+
+    if ( !acpi_disabled )
+    {
+        printk(XENLOG_WARNING "scmi: is not supported when using ACPI\n");
+        return -EINVAL;
+    }
+
+    ret =3D scmi_check_smccc_ver();
+    if ( ret )
+        return ret;
+
+    ret =3D scmi_dt_hyp_channel_read(scmi_node, &scmi_data, &addr);
+    if ( ret )
+        return ret;
+
+    scmi_data.dt_dev =3D scmi_node;
+
+    channel =3D smc_create_channel(SCMI_BASE_AGENT_ID_OWN, scmi_data.func_=
id, addr);
+    if ( IS_ERR(channel) )
+        goto out;
+
+    /* Mark as Xen management channel before collecting agent ID */
+    channel->domain_id =3D DOMID_XEN;
+
+    /* Request agent id for Xen management channel  */
+    ret =3D collect_agent_id(channel);
+    if ( ret )
+        goto error;
+
+    /* Save the agent id for Xen management channel */
+    scmi_data.hyp_channel_agent_id =3D channel->agent_id;
+
+    hdr.id =3D SCMI_BASE_PROTOCOL_ATTIBUTES;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    ret =3D do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
+    if ( ret )
+        goto error;
+
+    n_agents =3D SCMI_FIELD_GET(SCMI_BASE_ATTR_NUM_AGENT, rx.attributes);
+    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
+    ret =3D collect_agents(scmi_node);
+    if ( ret )
+        goto error;
+
+    ret =3D sci_register(&scmi_ops);
+    if ( ret )
+    {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %d)\=
n",
+               ret);
+        return ret;
+    }
+
+    scmi_data.initialized =3D true;
+    goto out;
+
+error:
+    unmap_channel_memory(channel);
+    free_channel_list();
+out:
+    return ret;
+}
+
+static const struct dt_device_match scmi_smc_match[] __initconst =3D {
+    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(scmi_smc_ma, "SCMI SMC MEDIATOR", DEVICE_FIRMWARE)
+        .dt_match =3D scmi_smc_match,
+        .init =3D scmi_probe,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index d30a288592..8f0f68544e 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -329,6 +329,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
=20
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
 #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA  2
=20
 struct xen_arch_domainconfig {
     /* IN/OUT */
@@ -355,6 +356,8 @@ struct xen_arch_domainconfig {
     uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
+    /* IN */
+    uint8_t arm_sci_agent_id;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
--=20
2.34.1

