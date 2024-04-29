Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD468B5232
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 09:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713884.1114772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1LJi-0006HY-W7; Mon, 29 Apr 2024 07:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713884.1114772; Mon, 29 Apr 2024 07:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1LJi-0006Ey-S2; Mon, 29 Apr 2024 07:20:50 +0000
Received: by outflank-mailman (input) for mailman id 713884;
 Mon, 29 Apr 2024 07:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHc4=MC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1s1LJg-0006DE-QC
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 07:20:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2070.outbound.protection.outlook.com [40.107.13.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fff8a077-05f8-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 09:20:47 +0200 (CEST)
Received: from AM0PR04CA0086.eurprd04.prod.outlook.com (2603:10a6:208:be::27)
 by PAXPR08MB7490.eurprd08.prod.outlook.com (2603:10a6:102:2b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 07:20:14 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:208:be:cafe::e3) by AM0PR04CA0086.outlook.office365.com
 (2603:10a6:208:be::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34 via Frontend
 Transport; Mon, 29 Apr 2024 07:20:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Mon, 29 Apr 2024 07:20:13 +0000
Received: ("Tessian outbound b7675f20d34d:v315");
 Mon, 29 Apr 2024 07:20:13 +0000
Received: from 4c005ca8dd8f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF497F35-9413-4813-B1D5-EF901225DF83.1; 
 Mon, 29 Apr 2024 07:20:07 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c005ca8dd8f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 29 Apr 2024 07:20:07 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB5992.eurprd08.prod.outlook.com (2603:10a6:20b:292::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 07:20:03 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 07:20:02 +0000
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
X-Inumbo-ID: fff8a077-05f8-11ef-909b-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oHnOHWtQ35gvP3Po/vSKBtElW3RjvNRc4hbi23O4WnTpUAc/ZNFn5QLHqLMZbJzQbsQmp9M8XxZbW8QjRzCTOpWxW0jSaOgpVDllubrSGN2dxxwF0VQkm33gqlt1vna7dy6qc+gUf0CYiDaRVayyqEQ+fZpE06palKPTAcmYE+AnVeCyQoqnq2tno7fhpBxH4r8fFfkj7SJWG3DeaJbc8W0nFLMqPjSfxG6n2Wfm8UUwM+RMiIEvfZAbPG3hWInGHw+zyLJH1VCInpIqee8tujznAUhR1mvb252oilvo4tVeQ3+15kqUyX3gee0spIQzDMQkdPOXu9mSeRc7xtkE+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxv2wU8g6sQxWU3fglLP5zeRUV+PSiVX8qj7O7CIq5w=;
 b=LKr5YDETZw6AIO8Rk2bVJPcFQtfgPM4N4npBPel6n81EWZWFlIme0gZWNQQEa55JwQevNvYvC6bGNYOC8QPhdlt95Z3qzk7YkfgG9UDnJevpW9kKY+IZOv16zxrWcP0SvDNSDtRZQPRWf9kov9VaXlCU14IlX7U6dbOrSvr9ON9V9DRp1mOBg6jWCB4Z4E+bfQ3YWwVUeDWR5BezJSld1nT2bkYFivU1BqRQjkEvI4rh7CwsdgCR/1R8S57Cj4yiOcf9N17VA16Jpm0/mqS7GKTsv/m/O4F8RFPXrHfcdSaTyERYDLvb2QOhrBoG3mpnO8m3+N87UIrdh/H/2vFZiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxv2wU8g6sQxWU3fglLP5zeRUV+PSiVX8qj7O7CIq5w=;
 b=UJPg/j7n+Aq5lBLEYS8dX/sQzZoAFC6q/qHSc636ROsUjq3mGvKt02p9SH1AOIEf2kW80TNCrGwhqfOlim7kaMY7bEflssNTw8FkifXp4zpL4oakRwU+EteU+Y7LD0zREMrDxIFGJAPeaQ6eYY5sC5rs9qV4K20LHHg3xMf/Q/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c83492a41eb969fe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwwuh/BChQB/HWAwZ3lPPKc3SYdcC0jYC+X+M/a9wwxv6ZDrqDeijnB2sOdOVFfuh4ACr2NHsWBufG7I/fA7blN/wWl5/c9oShWKay23c34/nvgIODGQqkn+dzTKHKUwQlLUAYVsA9FSujsKZwEkjTJM4T/wegArytFGyb+pkOCNfGNN+9oiJWbtRzVKS6qekQm9qJYpK0RtuuzMhOFnbwQH6jS26wE4CjuYIPCrfMdGEBxS/1yTb/6zK10S0S7apBU7kEQLG3U+RWiYsF25FxrzWv1PAJoakTA6NV/65IOvvOwlf0rfchZGMWfJfFaO+ohhaKkIBc90SvKbhyvMVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxv2wU8g6sQxWU3fglLP5zeRUV+PSiVX8qj7O7CIq5w=;
 b=kJawp7t3Cyzx+1Sl8515ZZaI2KYkJlDe/iZojao9ZU+zljPMieaWmDgZoNuEAB8W5RfRYjT97zma3eVz8ilHCZPeLHAG7kIKFg6ppWTiSot8Ka+CZec+VDhz3kypV6B2J+LoB93DIVuovp/fRJATDTObcA8MEHg4xCcr5xSzWlv94UtXTfiCZUizgZcGHRbyGyjqPcJxgyecUYN2YNCQt8elKu5KdxCsr9mmYqrK31VW9/bRIZQtpjCHIsaCBcFoE1Y/9UoRyBBRr2SqkZaiOaqcUQ2+y7RkYoU7ol2DswWD/wuGdIfMP4HmvH91zLYB7m6vlyJ27eyozfN94jufmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxv2wU8g6sQxWU3fglLP5zeRUV+PSiVX8qj7O7CIq5w=;
 b=UJPg/j7n+Aq5lBLEYS8dX/sQzZoAFC6q/qHSc636ROsUjq3mGvKt02p9SH1AOIEf2kW80TNCrGwhqfOlim7kaMY7bEflssNTw8FkifXp4zpL4oakRwU+EteU+Y7LD0zREMrDxIFGJAPeaQ6eYY5sC5rs9qV4K20LHHg3xMf/Q/A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Thread-Index: AQHal7ZoS0Rs3weazUuhKfXitmlnMLF66mmAgAPxaoA=
Date: Mon, 29 Apr 2024 07:20:02 +0000
Message-ID: <1A23083C-9605-4291-AF2F-5891AF270333@arm.com>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org>
 <c7a672a7-02f8-4d24-b87e-1b8439d7eb4c@xen.org>
In-Reply-To: <c7a672a7-02f8-4d24-b87e-1b8439d7eb4c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB5992:EE_|AM3PEPF0000A796:EE_|PAXPR08MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: fb33766c-3027-485a-f13f-08dc681ccfff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?borNavzT3FwhxhusAAfCrGQ8ugLwyaIttLnmRHYB9/Y3ELiqgWZu3y/tDeAP?=
 =?us-ascii?Q?72p+C+MKGjGiDUsr6N7s38Ndm3dE938KPtFsISs3os8vGG8M+2je/nZEDyIF?=
 =?us-ascii?Q?ONeQTZDpRpl07Vqx9XiD+Jg9K2Cvb18Dnn7TpMO/HKcV9dpU1IvNqpY/Vy4V?=
 =?us-ascii?Q?pvWni+1ogoNL3GeAYShB7V2LRbQ/X1m9nbRKy4ujDH9lyObioXk271WMPWFp?=
 =?us-ascii?Q?+D/rx2ETZamjE1LwF9j3BClsatyQ0+RghUzBWAO7xv+7d8WcCY+wZvKlHuBu?=
 =?us-ascii?Q?FFiiRCspboHq6ouDSHV9+XVb9BoJ+Rl2R8MPJLrVwpYD4DfUcajSn6nj+CVW?=
 =?us-ascii?Q?TGb3OEJce6mnkTEjbQb4/j/cZPOzxMTWF3hd1/yUH6vFhxBTzyLTWSm+55SS?=
 =?us-ascii?Q?k4720g+xVEENE92qchPf1VNcwdbKmfULgBVaKDT2jzciHmkvTYhP7YVlj49Q?=
 =?us-ascii?Q?T77gx275HGCyGFtSnqXpodykFVCz0+WbGrVKmYqBIhulW5HtvzuiGuULhzjw?=
 =?us-ascii?Q?DHcxnky80I3/tSohDHQyvg92Js5HU1SM4eWiyDTG8FJS/28N+BYMmwLd83um?=
 =?us-ascii?Q?06cWNi7T+Vs2R221qlsG2S7VJ2omzMd9NMxnO9QeRMYypr+ZhOMwYkBv/0LQ?=
 =?us-ascii?Q?ldHAJ9d4mc1F65ZNIvzT/D/OBxwjxuY2VBogNJy/WQoZ0LK+2cvOJI+LTPko?=
 =?us-ascii?Q?ixoFvIZiQPfaq6z/BR5ao6p15u9RXEdnQr5TTWq3nagKv5Z6Hk4FVKioyakA?=
 =?us-ascii?Q?zztZ/+ZCgibatZnDT7dBN8EgFZfYsecsYtyMy+LBknJmg1DRX+l4cz7x+STK?=
 =?us-ascii?Q?6igRAvjaNA1Da2gGoKGaaVn6wWtiSFTJKujPryjAtnrUprrHRwWiSCmJNs6s?=
 =?us-ascii?Q?bCGOAPdTTpqreF9t7bnZr1YVXfUomI+CqtNe3Dr/nzS28dHCwx6QIC63I4vU?=
 =?us-ascii?Q?HMqTekYzGZJdWFgEHmZvDqZYwlowFl5WJXtUuomKgM/jsdSsJ46Z+fKU2j1b?=
 =?us-ascii?Q?Fg6FfNHd5eeW4I+EnB0bRJFsEj15xn+LSl+KWMLDV2BFYcwov4IcjcNn2k7e?=
 =?us-ascii?Q?1sBE6TApGDNex8C+5CNn+13h+g6CXoER3oX4obhhNZBOZzuxxf/mG6uXNU45?=
 =?us-ascii?Q?8f3QyfThFIypV0XZthwQ3DVk9RmEY+mJH0pxPWOWxFaQBP5vT/hgjAzzrw+v?=
 =?us-ascii?Q?9+e2rkzrEzxLmrFcy3RKad5T2sN7s7fOHnbOVSClHp+hPtkUf3Yb4i/Szcxs?=
 =?us-ascii?Q?WDqR334n2onHDwFqz2/1BSr9EB4VrHfJJJnuWZf6j7Srl+5nyK8jxFMU6c2L?=
 =?us-ascii?Q?+hAWfuUco0wbZY6jR4ktIkoU4+/OWDyZsbjQwC/HBR+Z3g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AC7267B09BF275458FC341916FDCCA7E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5992
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa2aec8b-5763-477e-419a-08dc681cc934
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|82310400014|1800799015|35042699010;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?REOVXsr8+78JzD9b2I0g6IwTLNxVkQ/PlOXMs2keEWZainCTABIipB5MplvY?=
 =?us-ascii?Q?CqcLeTsSLX6VeVgyRH/S8DADgX8tW7bBWIMLOKjKRAFW2aVASwabOQcsq/yD?=
 =?us-ascii?Q?v2lIhJBong9c8+rFWIZ8YS16Vyz19pJYEvV1XqcTdAgDyG2IiGKgWYCv7Ooj?=
 =?us-ascii?Q?JXn77vFhezS6MgIck+srzngPPY92gYtDtAY84fyWRolg2jIQs9NBhNWPvKhq?=
 =?us-ascii?Q?vQEssNVEd+dERcedmvMg8HdvL8JXgz9lWXxQchvnWZ4qIGkdVBl3u+wCzeuO?=
 =?us-ascii?Q?mXJC5xq35WZ5+9x0neOkW70dITollvpEFRS0ys0DE78y28qNvwNgPky0kvCK?=
 =?us-ascii?Q?1lz3Ma4I2A3tHyKd6+4r2ALTIW/dd9DtKbYKqNoXLczs3r9dLGysrTZkIy7P?=
 =?us-ascii?Q?qJ6yXqXLzQGA8qOImgfSNn11h4rPvchjoM8I70bS14pVESMgPNM4dLsfmeq6?=
 =?us-ascii?Q?lnBanHf4XcfIPX7QMo1Z37x8RviFsKp0by8CZC0Cud8d61tU36ZKe97LtWOl?=
 =?us-ascii?Q?0ABOz9/98NxxxLohFLDpf4MbePXXs2jAu8zkTvSOIOAVbqVPhJO752iKnxxm?=
 =?us-ascii?Q?hvOFFCv14nOcy2Om19cre90Aix6VKurYb7rlXsVU2KeB9FdlEETi/8YO4sbS?=
 =?us-ascii?Q?JH90Bb6HFIUB6suWYcg0psVwRjmHtNWTOTErHc8qs0CilqOKIepLiubLh//r?=
 =?us-ascii?Q?pLNCDMODRVHn8PA5EyQMAiZHt0ll4Ol/X9MW+I2PKTSjiXAyQJOEVdRr/zVn?=
 =?us-ascii?Q?Q7bQ6N2KHshPNvmgcmwfQ8J/5zSEqn3xX5rhsSYkxvLiPiobZ6zRMNoSPnGJ?=
 =?us-ascii?Q?R3g1QCKThcXkX1NCkLOGD11vGGDuBeTNxyycgwa0PY1AtzHzyIBK7t/qzJjB?=
 =?us-ascii?Q?LyWjvEdgjCRFJVfSVPLu7eSzWoKhEFCL1SXJczpLB2YDkszusyGGYCgWTCyw?=
 =?us-ascii?Q?rJkO3MxdAKfAPRzCbWbc4IDpH3aRKtIYKrownv2ojF1IBOZybOc1Yjscjk0o?=
 =?us-ascii?Q?CkfvKMimYdF2diGt2ucL5Jo7dSyg6/ymLfDzf2UX54Xd4qWmOZhSaIPd7hkg?=
 =?us-ascii?Q?fE2gGyMZwZiSB3zPOw6j0jmKUOBF3vxPU0UU+ItAxOSzEZ9yEJVSxFwKmqVh?=
 =?us-ascii?Q?sirFMi7AFvGqZQjzvmWS3vD/GeeQdIC/P6tshxIMwgrAxFigrbSnKeMYy6qa?=
 =?us-ascii?Q?ReLivUmhofOCc0r2GJr2UV66eZScHXaEK4PXleoeL1kj8nD/DcsN8iUjEJXI?=
 =?us-ascii?Q?+2xC1kMzNmPD5+DTMFSlatszP0S5Cgy1TaZxamBVZ7bvI3W6asXNrgzXb3Ou?=
 =?us-ascii?Q?2zhDGFuQUS4AUhf/luCjrYjJ66pRQQwaHwrA0cTyWwgAx7yLSUQimC5SndtH?=
 =?us-ascii?Q?EinZm8go0GIAQWWwb4T4wSt2i9GX?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015)(35042699010);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 07:20:13.7172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb33766c-3027-485a-f13f-08dc681ccfff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7490

Hi Julien,

> On 26 Apr 2024, at 21:07, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jens,
>=20
> On 26/04/2024 09:47, Jens Wiklander wrote:
>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>> index d7306aa64d50..5224898265a5 100644
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -155,7 +155,7 @@ void __init init_IRQ(void)
>>      {
>>          /* SGIs are always edge-triggered */
>>          if ( irq < NR_GIC_SGI )
>> -            local_irqs_type[irq] =3D DT_IRQ_TYPE_EDGE_RISING;
>> +            local_irqs_type[irq] =3D IRQ_TYPE_EDGE_RISING;
>=20
> This changes seems unrelated to this patch. This wants to be separate (if=
 you actually intended to change it).
>=20
>>          else
>>              local_irqs_type[irq] =3D IRQ_TYPE_INVALID;
>>      }
>> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
>> index f0112a2f922d..7c0f46f7f446 100644
>> --- a/xen/arch/arm/tee/Makefile
>> +++ b/xen/arch/arm/tee/Makefile
>> @@ -2,5 +2,6 @@ obj-$(CONFIG_FFA) +=3D ffa.o
>>  obj-$(CONFIG_FFA) +=3D ffa_shm.o
>>  obj-$(CONFIG_FFA) +=3D ffa_partinfo.o
>>  obj-$(CONFIG_FFA) +=3D ffa_rxtx.o
>> +obj-$(CONFIG_FFA) +=3D ffa_notif.o
>>  obj-y +=3D tee.o
>>  obj-$(CONFIG_OPTEE) +=3D optee.o
>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 5209612963e1..912e905a27bd 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -39,6 +39,9 @@
>>   *   - at most 32 shared memory regions per guest
>>   * o FFA_MSG_SEND_DIRECT_REQ:
>>   *   - only supported from a VM to an SP
>> + * o FFA_NOTIFICATION_*:
>> + *   - only supports global notifications, that is, per vCPU notificati=
ons
>> + *     are not supported
>>   *
>>   * There are some large locked sections with ffa_tx_buffer_lock and
>>   * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
>> @@ -194,6 +197,8 @@ out:
>>    static void handle_features(struct cpu_user_regs *regs)
>>  {
>> +    struct domain *d =3D current->domain;
>> +    struct ffa_ctx *ctx =3D d->arch.tee;
>>      uint32_t a1 =3D get_user_reg(regs, 1);
>>      unsigned int n;
>>  @@ -240,6 +245,30 @@ static void handle_features(struct cpu_user_regs *=
regs)
>>          BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
>>          ffa_set_regs_success(regs, 0, 0);
>>          break;
>> +    case FFA_FEATURE_NOTIF_PEND_INTR:
>> +        if ( ctx->notif.enabled )
>> +            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0)=
;
>> +        else
>> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>> +        break;
>> +    case FFA_FEATURE_SCHEDULE_RECV_INTR:
>> +        if ( ctx->notif.enabled )
>> +            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID,=
 0);
>> +        else
>> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>> +        break;
>> +
>> +    case FFA_NOTIFICATION_BIND:
>> +    case FFA_NOTIFICATION_UNBIND:
>> +    case FFA_NOTIFICATION_GET:
>> +    case FFA_NOTIFICATION_SET:
>> +    case FFA_NOTIFICATION_INFO_GET_32:
>> +    case FFA_NOTIFICATION_INFO_GET_64:
>> +        if ( ctx->notif.enabled )
>> +            ffa_set_regs_success(regs, 0, 0);
>> +        else
>> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>> +        break;
>>      default:
>>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>>          break;
>> @@ -305,6 +334,22 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>>                                                       get_user_reg(regs,=
 1)),
>>                                     get_user_reg(regs, 3));
>>          break;
>> +    case FFA_NOTIFICATION_BIND:
>> +        e =3D ffa_handle_notification_bind(regs);
>> +        break;
>> +    case FFA_NOTIFICATION_UNBIND:
>> +        e =3D ffa_handle_notification_unbind(regs);
>> +        break;
>> +    case FFA_NOTIFICATION_INFO_GET_32:
>> +    case FFA_NOTIFICATION_INFO_GET_64:
>> +        ffa_handle_notification_info_get(regs);
>> +        return true;
>> +    case FFA_NOTIFICATION_GET:
>> +        ffa_handle_notification_get(regs);
>> +        return true;
>> +    case FFA_NOTIFICATION_SET:
>> +        e =3D ffa_handle_notification_set(regs);
>> +        break;
>>        default:
>>          gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
>> @@ -322,6 +367,7 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>>  static int ffa_domain_init(struct domain *d)
>>  {
>>      struct ffa_ctx *ctx;
>> +    int ret;
>>        if ( !ffa_version )
>>          return -ENODEV;
>> @@ -345,10 +391,11 @@ static int ffa_domain_init(struct domain *d)
>>       * error, so no need for cleanup in this function.
>>       */
>>  -    if ( !ffa_partinfo_domain_init(d) )
>> -        return -EIO;
>> +    ret =3D ffa_partinfo_domain_init(d);
>> +    if ( ret )
>> +        return ret;
>>  -    return 0;
>> +    return ffa_notif_domain_init(d);
>>  }
>>    static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool fi=
rst_time)
>> @@ -423,6 +470,7 @@ static int ffa_domain_teardown(struct domain *d)
>>          return 0;
>>        ffa_rxtx_domain_destroy(d);
>> +    ffa_notif_domain_destroy(d);
>>        ffa_domain_teardown_continue(ctx, true /* first_time */);
>>  @@ -502,6 +550,7 @@ static bool ffa_probe(void)
>>      if ( !ffa_partinfo_init() )
>>          goto err_rxtx_destroy;
>>  +    ffa_notif_init();
>>      INIT_LIST_HEAD(&ffa_teardown_head);
>>      init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, =
0);
>>  diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.=
c
>> new file mode 100644
>> index 000000000000..6bb0804ee2f8
>> --- /dev/null
>> +++ b/xen/arch/arm/tee/ffa_notif.c
>> @@ -0,0 +1,378 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024  Linaro Limited
>> + */
>> +
>> +#include <xen/const.h>
>> +#include <xen/list.h>
>> +#include <xen/spinlock.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/smccc.h>
>> +#include <asm/regs.h>
>> +
>> +#include "ffa_private.h"
>> +
>> +static bool __ro_after_init notif_enabled;
>> +
>> +int ffa_handle_notification_bind(struct cpu_user_regs *regs)
>> +{
>> +    struct domain *d =3D current->domain;
>> +    uint32_t src_dst =3D get_user_reg(regs, 1);
>> +    uint32_t flags =3D get_user_reg(regs, 2);
>> +    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>> +    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
>> +
>> +    if ( !notif_enabled )
>> +        return FFA_RET_NOT_SUPPORTED;
>> +
>> +    if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
>> +        return FFA_RET_INVALID_PARAMETERS;
>> +
>> +    if ( flags )    /* Only global notifications are supported */
>> +        return FFA_RET_DENIED;
>> +
>> +    /*
>> +     * We only support notifications from SP so no need to check the se=
nder
>> +     * endpoint ID, the SPMC will take care of that for us.
>> +     */
>> +    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitma=
p_hi,
>> +                           bitmap_lo);
>> +}
>> +
>> +int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
>> +{
>> +    struct domain *d =3D current->domain;
>> +    uint32_t src_dst =3D get_user_reg(regs, 1);
>> +    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>> +    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
>> +
>> +    if ( !notif_enabled )
>> +        return FFA_RET_NOT_SUPPORTED;
>> +
>> +    if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
>> +        return FFA_RET_INVALID_PARAMETERS;
>> +
>> +    /*
>> +     * We only support notifications from SP so no need to check the
>> +     * destination endpoint ID, the SPMC will take care of that for us.
>> +     */
>> +    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap=
_hi,
>> +                            bitmap_lo);
>> +}
>> +
>> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
>> +{
>> +    struct domain *d =3D current->domain;
>> +    struct ffa_ctx *ctx =3D d->arch.tee;
>> +    bool pending_global;
>> +
>> +    if ( !notif_enabled )
>> +    {
>> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>> +        return;
>> +    }
>> +
>> +    spin_lock(&ctx->notif.lock);
>> +    pending_global =3D ctx->notif.secure_pending;
>> +    ctx->notif.secure_pending =3D false;
>> +    spin_unlock(&ctx->notif.lock);
>> +
>> +    if ( pending_global )
>> +    {
>> +        /* A pending global notification for the guest */
>> +        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
>> +                     1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_get_v=
m_id(d),
>> +                     0, 0, 0, 0);
>> +    }
>> +    else
>> +    {
>> +        /* Report an error if there where no pending global notificatio=
n */
>> +        ffa_set_regs_error(regs, FFA_RET_NO_DATA);
>> +    }
>> +}
>> +static void notif_irq_handler(int irq, void *data)
>> +{
>> +    const struct arm_smccc_1_2_regs arg =3D {
>> +        .a0 =3D FFA_NOTIFICATION_INFO_GET_64,
>> +    };
>> +    struct arm_smccc_1_2_regs resp;
>> +    unsigned int id_pos;
>> +    unsigned int list_count;
>> +    uint64_t ids_count;
>> +    unsigned int n;
>> +    int32_t res;
>> +
>> +    do {
>> +        arm_smccc_1_2_smc(&arg, &resp);
>> +        res =3D ffa_get_ret_code(&resp);
>> +        if ( res )
>> +        {
>> +            if ( res !=3D FFA_RET_NO_DATA )
>> +                printk(XENLOG_ERR "ffa: notification info get failed: e=
rror %d\n",
>> +                       res);
>> +            return;
>> +        }
>> +
>> +        ids_count =3D resp.a2 >> FFA_NOTIF_INFO_GET_ID_LIST_SHIFT;
>> +        list_count =3D ( resp.a2 >> FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT )=
 &
>> +                     FFA_NOTIF_INFO_GET_ID_COUNT_MASK;
>> +
>> +        id_pos =3D 0;
>> +        for ( n =3D 0; n < list_count; n++ )
>> +        {
>> +            unsigned int count =3D ((ids_count >> 2 * n) & 0x3) + 1;
>> +            struct domain *d;
>> +
>> +            d =3D ffa_get_domain_by_vm_id(get_id_from_resp(&resp, id_po=
s));
>=20
> Thinking a bit more about the question from Bertrand about get_domain_id(=
) vs rcu_lock_domain_by_id(). I am actually not sure whether either are ok =
here.
>=20
> If I am not mistaken, d->arch.tee will be freed as part of the domain tea=
rdown process. This means you can have the following scenario:
>=20
> CPU0: ffa_get_domain_by_vm_id() (return the domain as it is alive)
>=20
> CPU1: call domain_kill()
> CPU1: teardown is called, free d->arch.tee (the pointer is not set to NUL=
L)
>=20
> d->arch.tee is now a dangling pointer
>=20
> CPU0: access d->arch.tee
>=20
> This implies you may need to gain a global lock (I don't have a better id=
ea so far) to protect the IRQ handler against domains teardown.
>=20
> Did I miss anything?

I think you are right which is why I was thinking to use rcu_lock_live_remo=
te_domain_by_id to only get a reference
to the domain if it is not dying.

From the comment in sched.h:
/*
 * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
 * This is the preferred function if the returned domain reference
 * is short lived,  but it cannot be used if the domain reference needs
 * to be kept beyond the current scope (e.g., across a softirq).
 * The returned domain reference must be discarded using rcu_unlock_domain(=
).
 */

Now the question of short lived should be challenged but I do not think we =
can
consider the current code as "long lived".

It would be a good idea to start a mailing list thread discussion with othe=
r
maintainers on the subject to confirm.
@Jens: as i will be off for some time, would you mind doing it ?

>=20
>> +
>> +            if ( d )
>> +            {
>> +                struct ffa_ctx *ctx =3D d->arch.tee;
>> +
>> +                spin_lock(&ctx->notif.lock);
>> +                ctx->notif.secure_pending =3D true;
>> +                spin_unlock(&ctx->notif.lock);
>=20
>=20
> AFAICT, the spinlock is used with IRQ enabled (see ffa_handle_notificatio=
n_info_get()) but also in an IRQ handler. So to prevent deadlock, you will =
want to use spin_lock_irq* helpers.
>=20
> That said, I don't think you need a spin_lock(). You could use atomic ope=
rations instead. For the first hunk, you could use test_and_clear_bool(). E=
.g.:
>=20
> if ( test_and_clear_bool(ctx.notif.secure_pending) )
>=20
> For the second part, it might be fine to use ACCESS_ONCE().
>=20
>> +
>> +                /*
>> +                 * Since we're only delivering global notification, alw=
ays
>> +                 * deliver to the first vCPU. It doesn't matter which w=
e
>> +                 * chose, as long as it's available.
>=20
> What if vCPU0 is offlined?
>=20
>> +                 */
>> +                vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INT=
R_ID,
>> +                                true);
>> +
>> +                put_domain(d);
>> +            }
>> +
>> +            id_pos +=3D count;
>> +        }
>> +
>> +    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
>> +}
>=20
> [..]
>=20
>> +struct ffa_ctx_notif {
>> +    bool enabled;
>> +
>> +    /* Used to serialize access to the rest of this struct */
>> +    spinlock_t lock;
>=20
> Regardless what I wrote above, I can't seem to find a call to spin_lock_i=
nit(). You will want it to initialize.
>=20
> Also, it would be best if we keep the two booleans close to each other so=
 we limit the amount of padding in the structure.
>=20
>> +
>> +    /*
>> +     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
>> +     * pending global notifications.
>> +     */
>> +    bool secure_pending;
>> +};
>>    struct ffa_ctx {
>>      void *rx;
>> @@ -228,6 +265,7 @@ struct ffa_ctx {
>>      struct list_head shm_list;
>>      /* Number of allocated shared memory object */
>>      unsigned int shm_count;
>> +    struct ffa_ctx_notif notif;
>>      /*
>>       * tx_lock is used to serialize access to tx
>>       * rx_lock is used to serialize access to rx
>> @@ -257,7 +295,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs=
);
>>  int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
>>    bool ffa_partinfo_init(void);
>> -bool ffa_partinfo_domain_init(struct domain *d);
>> +int ffa_partinfo_domain_init(struct domain *d);
>>  bool ffa_partinfo_domain_destroy(struct domain *d);
>>  int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_=
t w3,
>>                                        uint32_t w4, uint32_t w5, uint32_=
t *count,
>> @@ -271,12 +309,28 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, registe=
r_t tx_addr,
>>  uint32_t ffa_handle_rxtx_unmap(void);
>>  int32_t ffa_handle_rx_release(void);
>>  +void ffa_notif_init(void);
>> +int ffa_notif_domain_init(struct domain *d);
>> +void ffa_notif_domain_destroy(struct domain *d);
>> +
>> +int ffa_handle_notification_bind(struct cpu_user_regs *regs);
>> +int ffa_handle_notification_unbind(struct cpu_user_regs *regs);
>> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
>> +void ffa_handle_notification_get(struct cpu_user_regs *regs);
>> +int ffa_handle_notification_set(struct cpu_user_regs *regs);
>> +
>>  static inline uint16_t ffa_get_vm_id(const struct domain *d)
>>  {
>>      /* +1 since 0 is reserved for the hypervisor in FF-A */
>>      return d->domain_id + 1;
>>  }
>>  +static inline struct domain *ffa_get_domain_by_vm_id(uint16_t vm_id)
>> +{
>=20
> Is this expected to be called with vm_id =3D=3D 0? If not, then I would c=
onsider to add an ASSERT(vm_id !=3D 0). If yes, then I please add a runtime=
 check and return NULL.
>=20
>> +    /* -1 to match ffa_get_vm_id() */
>> +    return get_domain_by_id(vm_id - 1);
>> +}
>> +
>>  static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t =
v0,
>>                                  register_t v1, register_t v2, register_=
t v3,
>>                                  register_t v4, register_t v5, register_=
t v6,

Cheers
Bertrand


