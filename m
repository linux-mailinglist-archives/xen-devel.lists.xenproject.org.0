Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INqlLXzNgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A6CEC43
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218791.1527659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZX-0000wq-Dt; Mon, 02 Feb 2026 16:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218791.1527659; Mon, 02 Feb 2026 16:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZX-0000tb-82; Mon, 02 Feb 2026 16:14:43 +0000
Received: by outflank-mailman (input) for mailman id 1218791;
 Mon, 02 Feb 2026 16:14:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZV-0000fY-0W
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:41 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46b41446-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:39 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:37 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:37 +0000
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
X-Inumbo-ID: 46b41446-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqJ+2fVAfmgl/Yee3BRylpSLhYoDZmb7++aMxscyIL1fPvF3XYWW4dFtdKXjufGjbsU+derlhfHHQ+MUN+wGAhEU2vqKWeL6ESVNUOpXVbyUbRbbz8j1i4FOvQihBmHe6OSEoBoJQMRFdnsgeF3q8TmphH6XoWZQWkq8zVMgl4Je9hNNoKw/yQ1Yb/NW+B8ym5mo7HwO29/QNFDZVH1Ao902f3Hgj04DVlZAH0+tj0oA81tZr/DlqCAbMRJWbV9E5bx6WIDmrXsGEyt/bp0hvop6k7aQGiBGFHTsahxKW/jFU6E7URw8qgn3nlNXHMOPU7YN2kQ2nqexfHdPPVI2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0wKswGnoqukjZ6Pa85VgI1m2PSff7ggRLxjCuUhdmA=;
 b=VGEaOUC+Eyr/6RdIkDlNuD+HKSO0Pzzco4l3haLWCDldN4qeZBxT0ysqTREAkl8IlAekrkrP01+KPps3mrna5r/k+U+PbOXIHyQCT3+Gwn+c5Jvpp+rozNjvAXyVrrWZdL3GRvT2ohBs8GpwW46PuuMeWfXmZ0mUGZ/Tij1WC08K0q2g7eWRXQKP35Wyl1X4cXZ1iHlPMRDFtEMxAuAtRY4o/1lHA5VWFTapdx1vQGM9xS3ZXqQ4zdvJk4kUEpwjB+X9mEHsjzwRoskRvPZ/xFxqLznTCbJX3EqDEl2DjPbZy+u8N1VeNHUpvw7p0VFEN8q8QtOPmh1ZPPSxB9dh2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0wKswGnoqukjZ6Pa85VgI1m2PSff7ggRLxjCuUhdmA=;
 b=T+S5k4C2mrKL50I9sLcqIoHRgtwfJ0rDPCIyri5skbbrmVwKB2ZqWOBLerLZQCur1zQ1ZUcIHNoi1n1jbNiecVnotDtTwFPhAvv8NRYNGrX+9U9vaHGnrdpketl+ezONoJWtSsgkMtEaczq0ax8VGBFjhhArpY4SDFZcvqjfIoX6bgVXdJiZ3bSXNHXXzUbU01HqCnWpGasvrN+S8pcxRV2RQkQdkKzVzI81a/0bwW12vN26wqTWRQHGHNAJHKSEsRCE7umHMTiXFyc8sDoRW53iGdirM55eQryVMv2FQhtfqzVvj12sqzglt6igacc6cUHd83twNYF9qNdXkNMq7g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 01/19] arm/gicv4 add management structure definitions
Thread-Topic: [RFC PATCH 01/19] arm/gicv4 add management structure definitions
Thread-Index: AQHclF8HJLYhUOMDJ0SUd+oWyr6vSg==
Date: Mon, 2 Feb 2026 16:14:37 +0000
Message-ID:
 <21505d8f47bdabbf0f8e534eed937c5bf0a4ce02.1770046465.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 249ffcf0-f16b-4229-b65e-08de6276299f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EsBiZTrnM0tf6t5U0/3O+gY2tkAQ6D03mZz2J46Zi05b0EXGGQysz8nTYs?=
 =?iso-8859-1?Q?SuhFvjdix9gpBGeqcGkBbHPNVE24wAnUZCuVkwEjWddGwv01SePHZyUpeG?=
 =?iso-8859-1?Q?lkkRZC8xfGU3r3Dl//4Wf2XtxB2c5ZrqNrJ1GBM9pz945oxbrPp1kasD37?=
 =?iso-8859-1?Q?OYhDpCQjGWEr777guwO99KJenArHcV5lvF2OcRYQFzIYOzXWLUCOWyaMvS?=
 =?iso-8859-1?Q?YQc5GnKxrQEXs4e7zudyI/1zmO6i3oZPqtAsVp0AXFwXIOi9Z3LrrEk5hu?=
 =?iso-8859-1?Q?V1lmWCo4QwCa4cxUhaFPgk97L37tPqjz09iIKHRdGSWG7Ey/n2CHWxl2TK?=
 =?iso-8859-1?Q?9jDGJeE9tK+cDR2+XFbxOIySk+57EaR1/pKfur4FUmlwsoHQw3lH7D7CNq?=
 =?iso-8859-1?Q?aLhT81VcefxHCZUQOSTgvOIcLPgpLFBBhIp3PEjco81ZtjzPy9byzauoD8?=
 =?iso-8859-1?Q?NYL+JJG5rNNbKkTsI+kEfwKuCn5onzVlxLjykxWFBw9Y1+o5x2dCTMGsci?=
 =?iso-8859-1?Q?e8rlUfAHioGC98PSPneyxiRuD4RENIM4RKNehh7Ir71/oBYncE4uamgQdU?=
 =?iso-8859-1?Q?j3FmLPV4YeU1qPVgY9BsQMdBwianXzOdgIbKpd1zWOBnwcvU8JX3F3OcGy?=
 =?iso-8859-1?Q?g0827FJmVZ0/EfOnW0JYacXpzhm/UaJtLHRXGXlT7vx9JwOAjkF3hA/P+i?=
 =?iso-8859-1?Q?Oj94ZAWyVlCv3xzFlgStceVHhirEBVvJAXf4Jpu4SPgMvVTQehWvYMQWIx?=
 =?iso-8859-1?Q?r5LKlnv3VFgzlVcuStXu8TJgkhfZSdi7SUEuyJbPRX0FlgFE6xmyAmPITL?=
 =?iso-8859-1?Q?PsTtGVR/8xfuKGnXXkMvbRq/XNihk6BPZR7dtpRx1033g0d8tB1wy2NEno?=
 =?iso-8859-1?Q?VHyDWTAItJ24XT6DOz0W4uAlXZ88u/riQhTzPZM7wbZ+qJHR/LdCeQtIq6?=
 =?iso-8859-1?Q?s+BQhkIySp8jXk+WsSUslprw4aDIS/EsDYBdR9SfcApwA0lQwmKM97tL1y?=
 =?iso-8859-1?Q?Bdhmgb8n0SyQA+E0CVjqr6VBwJshJ9WXlq116rpMEoq8k4S3n+pSyuJn5z?=
 =?iso-8859-1?Q?jjNwuvJyVAUb/k9uP4v7kWzSS+iIxx6xOvgkrxroYIWnTARYD8YOgrjTw4?=
 =?iso-8859-1?Q?2pRFiekMhIUgHyFjn6zg4iBchngb68eOC/ag9qgCkW8F+QGyKek7FPeRXC?=
 =?iso-8859-1?Q?+YFvs5p0B2h6aFlyVagv+EhRNF779zQl2lEjp16rO7TbReZtZ5Usv0h0Uz?=
 =?iso-8859-1?Q?lHTX3Ge/5bekCqLsRcY/FmZeh8x/w6hfKjiE1T4DLfaoKfu1ovDEcVSCfa?=
 =?iso-8859-1?Q?FHDN2lvAtyltXhkv0nCut9d8nRua9RgA2t2zbFJeELYW456lvpXwaea5I+?=
 =?iso-8859-1?Q?inpKB38QVtW8St7aIDDUKyVCzCMM67iUlSBrXgWdxqdVsNoTe+6xY+S1l5?=
 =?iso-8859-1?Q?d8A44JiXOEz3kk3vyS2SwLyDqFfjrIZaRyPfx/xzcwxFYFzIr0i7ZyBFnx?=
 =?iso-8859-1?Q?oLYC4FXWiZbVWTHmuSz7lC/7vFlWaYuBdoOBFhqYN6TJfYGQhhx+fhcWrP?=
 =?iso-8859-1?Q?g24EdPIGmUpj+gm5494tZ2YzReinFiWBwutBmHNHN1qOp7b+qrCLutoGqK?=
 =?iso-8859-1?Q?+wqLSzhgpVOoYoisrPMcACeuAiadEHea2ET67fJVKFw6IVVMefDf/BSNND?=
 =?iso-8859-1?Q?djYCXyK3BCbRg2Um+Tc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NCxihKok1G8mwAphd6wsO1uy+GIclQa0JTPxqgwwu/VdqBIDH3bMe7zpSN?=
 =?iso-8859-1?Q?Lf1NVMOWQ+DhHTrNnnrHyBMfP/NBXu+hea2070p+UVxohBvXSplUVfCanm?=
 =?iso-8859-1?Q?QT/2F3vo1fGQj+b55kNMJimxIDp2r6jswYI5npIvZXLA4je0ynWuCMgDME?=
 =?iso-8859-1?Q?tPby5wZgz7CjdbIoju0RVsa1gg65JhND5eG/+pHKfYtad28D0fz8oEwyE9?=
 =?iso-8859-1?Q?KmTyijkhz7kEIQshwTFmUWG+ZUiFTfwB3C3Eu5gblyoMEbQqeDV3JNxI6Z?=
 =?iso-8859-1?Q?/BNHQHvHRaKEcHJ1M+bKHd7uWOxc4c/xZPG1tTpTfwND0ILi8QW9nM8Y/T?=
 =?iso-8859-1?Q?Bfhdw5X2wFjv/9Gtfkk5CKOHxtFBB3HsOaSLVwjC3YYeax5DcTnaG9xEa0?=
 =?iso-8859-1?Q?Gfz7pxFfo1PZQ6HqPJrLE20GkQI6bl8TxxZcGC207v8SPdWNltO/1k6Jfh?=
 =?iso-8859-1?Q?KDDCoPSOQOyNpq7k2WXli5CCVuQUYOjkOqpZVXoyCQ9wRm3bbOdOrOQPFE?=
 =?iso-8859-1?Q?nH1hkRWpltSkzbagoR8Q2BBej2658AWhnPIsimHCjTW4UTcNIiawhVbOhi?=
 =?iso-8859-1?Q?g4zhsYG07D5lRdSrdMo2Oqk/v44+Z6DtihjsfKci/3H42sMJ/u6yHqwrzR?=
 =?iso-8859-1?Q?Z2CjEvC45e5nQXXahgp6+kdZxDf4jXEtZXzri+I8Iv9LJqM+Z07BYABS8k?=
 =?iso-8859-1?Q?SnZYJzJdLOXWas1E94uw/n/94Mozx0ehST8fPghckMRu2ov2RGAbvw69dq?=
 =?iso-8859-1?Q?ZY0OCPUMv4I2G0YF2WN4o5khHviIbj+AiJr/Dh3wM43cYNyREMhkIqU/Y4?=
 =?iso-8859-1?Q?B3UnHJocqG6sIHUG/2PkF6n30jCsKAyE1AOk3EkF2kQkr4ucwaoBWhKV8o?=
 =?iso-8859-1?Q?S4G0Ku3r1twv6+F7xxH4s+PgtG9MnNgfjchBCiiACbFcMNaUcluiQVIW7M?=
 =?iso-8859-1?Q?8rcmbuunct9Hcvowcc8Bqi/GtajsInLObCWbqY2prxfmgSBFtFsNa2MJTu?=
 =?iso-8859-1?Q?0NOgB7jTPBWeq5Uvn7RO09YZgviXmtjsvKfs9zdUK/PuXYBHyff3S1IuLm?=
 =?iso-8859-1?Q?6q45y1LbcKz8wADCeVkqzb+bWTC5t/BqTv//UsNMLHyFSMKLHYNk+QXb1h?=
 =?iso-8859-1?Q?AyxREN79cFHIWc6t9ltAxXDBkyRiDSNBdMhu4p6IKYGtD+g4LbrcMTJ0YP?=
 =?iso-8859-1?Q?OZngWPtuGu7A25w4YE9kvie2CmB7sOUa9UPk4U3TWPP4L9u7sCVyEgcjr/?=
 =?iso-8859-1?Q?Dssx99lmT2mI7zZp+QcXqoIYMjtGdSckr9vZI5bq2dY97JpYdbB0CsmEFJ?=
 =?iso-8859-1?Q?I0vewNeLGpytdlfRdVJptFLroWM18ZTz1aE56spq8tUfsJMWvLtGyOtWpc?=
 =?iso-8859-1?Q?MjTpcAuQaffMxqowpz5IlAU/rO9zR5A2ooLnGhGOgXeMyZZv3owzbgssAC?=
 =?iso-8859-1?Q?xvoITZfVEZCioNyOcBmT6D4rQxXx+Eg78iTWak8k5cTMmkGurrfs4c023d?=
 =?iso-8859-1?Q?pva5o4nHgJD8CndN/SS2601GA+/arClVczwi73SzvqRbPs97jpVPFxShGp?=
 =?iso-8859-1?Q?udh8peTTKfgu2xD5cdQO+MbmZfkaEhTaPaMzSUQSfF+u9FmXY5duO5Eh9e?=
 =?iso-8859-1?Q?+RS0dc+L/YldvE4m+9pCQhdcKJzUUewGCPOvGaRzvuaND4roocHQyVZqJx?=
 =?iso-8859-1?Q?SRkOLGTHU/sMXvvbjdGLEbruG46lYZ5iX1cFdpazucFV7FjomD4y360xhR?=
 =?iso-8859-1?Q?tWmYUf0CBC5AaU8fRjdIfr1S2lZkDwPHrnuhARhjbJJRalXSN04YhlFhUm?=
 =?iso-8859-1?Q?0KpO1HRax2ln99ln5cR3ukDAqC/auP0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249ffcf0-f16b-4229-b65e-08de6276299f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:37.6705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4WJ796o4q+edkC7vFavEJZLCogcC0dUBVPGdT9xFUNkffWnXwCaxs5osQ75YI125+yZ14sdrYXVUO/BCtgg+8w==
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: 227A6CEC43
X-Rspamd-Action: no action

Add GICv4 specific structures to be used in later patches.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/vgic.h | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 6f9ab1c98c..a874a02d70 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -127,6 +127,42 @@ struct vgic_irq_rank {
     uint8_t vcpu[32];
 };
=20
+#ifdef CONFIG_GICV4
+struct its_vm {
+    struct its_vpe **vpes;
+    /* Number of VPE. */
+    unsigned int nr_vpes;
+    uint32_t *db_lpi_bases;
+    unsigned int nr_db_lpis;
+    /* Property table per VM. */
+    void *vproptable;
+};
+
+struct its_vpe {
+    rwlock_t lock;
+    uint32_t vpe_id;
+    /* Pending table per VCPU. */
+    void *vpendtable;
+    uint32_t vpe_db_lpi;
+    struct its_vm *its_vm;
+    unsigned int col_idx;
+    bool resident;
+    /* Pending VLPIs on schedule out? */
+    bool            pending_last;
+    struct {
+        /* Implementation Defined Area Invalid */
+        bool idai;
+        /* VPE proxy mapping */
+        int vpe_proxy_event;
+    };
+    /*
+     * Ensure mutual exclusion between affinity setting of the vPE
+     * and vLPI operations using vpe->col_idx.
+     */
+    spinlock_t vpe_lock;
+};
+#endif
+
 struct vgic_dist {
     /* Version of the vGIC */
     enum gic_version version;
@@ -193,6 +229,10 @@ struct vgic_dist {
      */
     bool rdists_enabled;                /* Is any redistributor enabled? *=
/
     bool has_its;
+#ifdef CONFIG_GICV4
+    struct its_vm *its_vm;
+#endif
+    bool nassgireq;
 #endif
 };
=20
@@ -227,6 +267,9 @@ struct vgic_cpu {
 #define VGIC_V3_RDIST_LAST      (1 << 0)        /* last vCPU of the rdist =
*/
 #define VGIC_V3_LPIS_ENABLED    (1 << 1)
     uint8_t flags;
+#ifdef CONFIG_GICV4
+    struct its_vpe *its_vpe;
+#endif
 };
=20
 struct sgi_target {
--=20
2.51.2

