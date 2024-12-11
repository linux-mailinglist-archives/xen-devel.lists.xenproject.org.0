Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B7F9EC563
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:12:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853853.1267196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLGsm-0001Ie-Vj; Wed, 11 Dec 2024 07:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853853.1267196; Wed, 11 Dec 2024 07:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLGsm-0001HA-Ru; Wed, 11 Dec 2024 07:11:40 +0000
Received: by outflank-mailman (input) for mailman id 853853;
 Wed, 11 Dec 2024 07:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zUMN=TE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tLGsk-0001H0-Tj
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:11:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f403:2613::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 290eea46-b78f-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 08:11:37 +0100 (CET)
Received: from AS4P189CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::13)
 by GV1PR08MB10670.eurprd08.prod.outlook.com (2603:10a6:150:169::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 07:11:30 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::d5) by AS4P189CA0009.outlook.office365.com
 (2603:10a6:20b:5d7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Wed,
 11 Dec 2024 07:11:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Wed, 11 Dec 2024 07:11:28 +0000
Received: ("Tessian outbound 9c6259131e4d:v524");
 Wed, 11 Dec 2024 07:11:27 +0000
Received: from L229aa7588b07.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B547018F-72C8-4261-BC98-0E8C61EA0F2E.1; 
 Wed, 11 Dec 2024 07:11:20 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L229aa7588b07.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 07:11:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB8PR08MB5498.eurprd08.prod.outlook.com (2603:10a6:10:11c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 07:11:18 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 07:11:17 +0000
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
X-Inumbo-ID: 290eea46-b78f-11ef-a0d5-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G582q1hc2KB4nvk2+jE/M1Vdvx/F6GK3muFwPNv6YnE/+UcTBVC//dagWlzuPcFsDnEVin9WfDZGK7OnGNA3BpRa22V+zfYdeHYX1gemK/0UfYttj26YokdDNCxS1upWGaXmfhjzc1KcK2HzpspIcxFK3uPu5Ido4QkuIzo96MrGVXDoUOvkFq2ZELV/BUDq64UtKVqD9bMBcb9rsO2rUjy99792z7LWcykTX2y5DxqiRnqYWTcyd4SO8fp5mBN0uPcfFCXPGHSprHBPUChbPQcbhGLqjnF/40XV5+ullrxA+i+1BJVd985rbhNV/pcAOs/WioQnMnGevy+0sQERxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Lz8Yf+pNspBp7XiamSDOKZUHdeou7wJ8dh6tyrRdIA=;
 b=gN6onhuev8R/9DObG6wM20gCbnAVrZWfdVXk6+dCOW9daH1rlusBwtu6G8l0rzthMhTghuKKJqRkQt7oLhtD75STquCshs/PSJ72dRKsmE0mePMkTAzLppXKntD8Fy8cQ0y3VhYfQMX4WEurn5DR3+weopZiC4pFMNpOdO4rg8ZOYrfU/fkLACn0mFPi8a646mJTHlHTV0bzTb/BcyWx68vHfxcxt/w29wDaTEprvrdItk3Ltf+Uu788klD2DIlCaWYtqNyyUf2bC8IdpACnfVCQcHXU0+4ekfwxkF1sM0S8w0/SSLkOchX9Ft0LMYfvn2tYnk0ucuapMEdV3CwMDw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Lz8Yf+pNspBp7XiamSDOKZUHdeou7wJ8dh6tyrRdIA=;
 b=h6DrPD8/C69xSSQJ4vImIaPeMPjf1SWJ6tt6vYBeWbTsBJAhLSbzuGANNNp+svQtJ1Zc0iWtwi1zb01wCQN/kKXxGRNZFhephIj4fuK1lhw2bsY0hwpyOXvXbP7Ms5kHvsi5lTS5SQdo98GQuAXN7HumuIOQrS1bne4aKWOqbDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e74550dce57392cf
X-TessianGatewayMetadata: pyGUq/2KiIqAWtSf6px8sWqdyhzNMeKOwxOqcq8jrk9uyWKuovn9s7aBPJ43lplZtIaak0/4vCZTtRX8kyQubCZPtmRBFc3h9K5gmd4p2b/gVlxNAPPZuNuCHPsfsUb9k9ceqfQQgNEF6jjDBl/wZyO/CDzLBg2e2Sz1Uoardfo=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hagxs4ET/gOWk2YmoU/Um2/dRP6QKgQyLRcnyV3pK9F+9U5euQarA2AfPapKn0iRM9lqWvz5jumKlgxBovIu6GgWb3Vrb+y8L7ORXO9pusaza1VwUbSAakKLFoF4DTuxbCcTZlD6YRvm0CnWj5uay0Rr6qDJEGlNQBjKLrIaWXIqRwbYYmkawgHdiHqw3mjrb5PLm/rkyRrLRFZqCWK+c1WcfHu43JsIooxKPLIJ8RFibFdoW4wBGBj7PLhoBzoaF45Ijuelj/by7m92ANEVXsbJYt8rPy4pM64wl8yNeRNzruCaUFSB+WFLEkruKN0NTBUlvGMCAGo+dOd5qpJC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Lz8Yf+pNspBp7XiamSDOKZUHdeou7wJ8dh6tyrRdIA=;
 b=rtgMBAWzgjwbp+6+rlHdbrko/52OX5/aAtMmRnOX/d/L8vRHvZ3hwt8LEh3CTGgMDm4E8Us/oKhjrWoFT/zR1AV1wAEqVA2V+cOEbS3RIekoTCpPsR2tGUnDbRI2PB0xEBUsDnwW4hlNVN1MKaEKTGpeJdTbWdKrUnGqlMm+QXboKnJLafJshy/rww0zYUar/o35++0fNptzNod4Z3p2Z29uhWT8aviGear76emZGZTqGRBxtx6N/RDkjiPJbDwLPp0nXQzDAotSKV3izeiNi2BhrcmJdH4s5x5CshWrx5XCal6wv/pO/sJdxW6+NL4tLBfaSxVxncfcY/QOiNTPLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Lz8Yf+pNspBp7XiamSDOKZUHdeou7wJ8dh6tyrRdIA=;
 b=h6DrPD8/C69xSSQJ4vImIaPeMPjf1SWJ6tt6vYBeWbTsBJAhLSbzuGANNNp+svQtJ1Zc0iWtwi1zb01wCQN/kKXxGRNZFhephIj4fuK1lhw2bsY0hwpyOXvXbP7Ms5kHvsi5lTS5SQdo98GQuAXN7HumuIOQrS1bne4aKWOqbDc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"kelly.choi@cloud.com" <kelly.choi@cloud.com>, "anthony.perard@vates.tech"
	<anthony.perard@vates.tech>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"roger.pau@cloud.com" <roger.pau@cloud.com>, "committers@xenproject.org"
	<committers@xenproject.org>
Subject: Re: [PATCH] MAINTAINERS: add Anthony, Michal, Roger to THE REST
Thread-Topic: [PATCH] MAINTAINERS: add Anthony, Michal, Roger to THE REST
Thread-Index: AQHbS19p4yeriQH2lEerZ8Qjjr/HOLLgoPEA
Date: Wed, 11 Dec 2024 07:11:17 +0000
Message-ID: <EECC0F6C-C4FA-45FF-8D21-122F0276BF59@arm.com>
References:
 <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB8PR08MB5498:EE_|AM2PEPF0001C70A:EE_|GV1PR08MB10670:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da51311-433e-48c1-a552-08dd19b30841
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?d0yMdm+GO4mQngIhz9LgSXEIbcTY4I7aPxdV8AL93+OmLf/8GWIW7Oc0TTsN?=
 =?us-ascii?Q?KI4friVMyVjxGEKSLXcPyiV7IX5y0H8S6FhccSIJ3HKOxdt3NNTeY9vB4nYm?=
 =?us-ascii?Q?fG+cC42jVlvZ48xDJgpln5Q3uRYLiPyKkAXZor0LU/GT6w6kB+JyN7nwf2eu?=
 =?us-ascii?Q?NA7/fyFm37t0FT53c1aErKApPm9FICQiVxaZCib6Csb8S6dVSqumBuFPBXHj?=
 =?us-ascii?Q?640953xEIpt1g7vh+ev0dmuirmHGcE8mxDqhVPpr2DnMW5/HlUMeleRqHeil?=
 =?us-ascii?Q?3yvDorD7/InPpKW86zWd+xCyPyHMdV6KDf0YNTc6AQTxM+ApiKp0MJZmkbcP?=
 =?us-ascii?Q?OEDKPg3Rw7PLx5srqTGMll8IzTGyRy38xpnZRNERQcOEKV4F9FPsKI7+24vR?=
 =?us-ascii?Q?+TSUIDHzo8ZU7obwfiaIgLfWVbow6IiDEPuwhJaa1ax5zZEFbUXS6bXw5o+n?=
 =?us-ascii?Q?zQtUva7hIxWKZxxMwK3H1Ef81rvjBWCquzou9RinFmGi7cu9ExSwK9JyYmEP?=
 =?us-ascii?Q?mgzL6gzNBJNPJQKD+2PkK93H51b9t2RXVfZPbK+2RD21K4fKEIeYLfFVJr+F?=
 =?us-ascii?Q?jV6a8hd3t7+m95l+i5bWU/ruqRFhzpN50L2SvXugc03nuiSlthZQxEKWxSpM?=
 =?us-ascii?Q?6Av9HQkSxlz4B9wYoXB8x1qcFdEzE7yLMXmWiOJh3NJxHbBNmL+U8I5LHSeZ?=
 =?us-ascii?Q?1V091d13C6NdTPuGvkYPDJ1R84ugt8/VP5l4f7SDEfOQychiUUTawees1F2S?=
 =?us-ascii?Q?Xr4ekGSF1sTG3DNN/ps9zR+A/sNXuNZsGeuahFOV34cvXcHpR/e2DpE3+yNW?=
 =?us-ascii?Q?NoZDXRyB7zV+wsuNC+/CVBSZt/kNj1ClHPM7EP40j2lOcCdIrX9Lfk0YZFoG?=
 =?us-ascii?Q?v8/XPJbs8MnAMc+CeXeg3D6Bu3xcOQ1viW8yJxbNs9dykasULK7tdY1ubU8z?=
 =?us-ascii?Q?QWUMairIRzGeAvUM5aJCIU+h6Y6JRCaL5JwRPa+KIshNRY7XchsA778WMhbf?=
 =?us-ascii?Q?DCA6Ik7UoP4haIT1/rb+BKWxBE6n62wF90Q2aHcIF4QTLNfLWqkVshnIM1Ne?=
 =?us-ascii?Q?5kUM/AXJk84M8UzetY2FrCLoaaJQZEep7ABIcMI5j0RmRRhjdPcEIl4GyQuw?=
 =?us-ascii?Q?NzWGvh22wwxy7dxa+9eswAcwB3IhyEgPlzCWbweiQmj4rIaviXbhNbgQDscI?=
 =?us-ascii?Q?nL7T3Y0QXAZlB2BE+UiWfccElcG4nksDWd4aRRtCFb52fJZ27f0o+VdSSXeJ?=
 =?us-ascii?Q?mRYUmvi8BojZVMcH2ySdylN9GpEjmWDtpEYRJAb6DktAgdKvb1W0JLyqIjPc?=
 =?us-ascii?Q?bNHX7AwC9xqP1KVab1is5YB2HFBOBxpnx07AVRjnDPV9PqkpuFUFEdkU13fs?=
 =?us-ascii?Q?9LBcV0NJuRBgpbxPzyX5UlmSkPmmaobtPzJ1T+wetJnLuYfjiQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1C14BACB4DBC443BA7514048F1FB15A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5498
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc2dcd6f-c810-4cdd-5ead-08dd19b301d8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|14060799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8dYGqblNXN1NmU10g7NvEEIYdlvBwvwKqclkeNmLQT5oIfbtrAzrZVCIg1co?=
 =?us-ascii?Q?qcrqOKRQChrS7gx1+1aoZOWmMMah44i3/FzWEQaA3BtuxoRuCxzyK5iijNJg?=
 =?us-ascii?Q?3wZk4v7+VJzjLaafsI3e3CSIHa0otA7Hqo0JIQ3EFYPUtqYslauJJjPQIsWA?=
 =?us-ascii?Q?W+kq16uTrmWDxdckW95NToX1jLx0lFoRx8wXEjl/k5oMHSuT3fal+hvrqKT5?=
 =?us-ascii?Q?KI2hO/vBvfIdJ7M195orPqCvjDKFJT55tWjTUNQFXEhAhouYdfz2hJp3i/5w?=
 =?us-ascii?Q?QWdeT7U3N9J2sFJC08gX3rxc8/jqcKQYKTiRT2Urq/qDGZVdfhni+AJxKWG9?=
 =?us-ascii?Q?aFLWumZr8D8PSJLhMuLnED9yZhmHHQ8yI4plhyq4gZL+Ddxm3AyfzzBd1J0B?=
 =?us-ascii?Q?0oHI/cuVr/kIvU52Bh1XAzVyacxKVIXj66/jot9Kea2g9EIIOS94R514WqRA?=
 =?us-ascii?Q?IQ4aDS3Pxy4aD7y3Eii0sDc846IGcPmJeWhmuoeFJ+1qB3seclWrfo7UfGQV?=
 =?us-ascii?Q?ZTprGjUdfu+TYiEVsuzK1KgHQssBIxfqSiBLgw6GAZ4l2viThM+GCG+gxdtc?=
 =?us-ascii?Q?Zg9+BPCTd89IMzMG1+dv2hl1+311VWFTGLR2x86d/C9sY2Nt8n/wu5ZAk9TE?=
 =?us-ascii?Q?tfKgDh4yf+n3ItC9veOvQN9IXZjDOkrGdzXrDwLZ9MPihxXEISCfV9tZUq3L?=
 =?us-ascii?Q?c7faujpZ/E5FrrslZ/6mk5vASttQt9YzmskL86JdHB2KKeHrpYMbAZPQxDwt?=
 =?us-ascii?Q?e/+LTzVDyZb45W6D8yjj027tBWXDUlBCwzdvrsvhTLeyTxDSYr1tz8bjQLnl?=
 =?us-ascii?Q?G/QQvvefcDeVYQWy9qV9mTlCQxwiCtWxZV8aAuCkIbJJjt7Et50GdnVprz2W?=
 =?us-ascii?Q?Yd+RoiRshpd8g0dkQnAhMvDrJ2taYbQC/Ax8u71XinVRxw+qVKWRk7ICxib0?=
 =?us-ascii?Q?xzy7YqfKmW7yRCI8BIgXAin1H8kv0B2fkT/gYdineSzc94mycMiT21dWJO+2?=
 =?us-ascii?Q?hScjD1W9AD6Dc4UDiBh7LiAuLomfx78DSOq0Ae56UqANsVpq55NYyEuul3WF?=
 =?us-ascii?Q?rpF80fXX8VKLCj+bz+igP0lh6VJovlIYk/RBbMuaw4SErIfDPVlTu63n9uPB?=
 =?us-ascii?Q?hKSnliHzVFdrvGCw4WhHcGxbMtK91OP11znwibiiQ5p97lLvckYIQMSvm6YE?=
 =?us-ascii?Q?f1X8fSm//t/QMNT/pzCGO9s3Y58D4DHsyHb/1amTCHrfluMYdBP84z+FvOI9?=
 =?us-ascii?Q?2qXGd98VcmxNk1LdEeDylSWoTlvFF4sapA+ductPEV9BnXYHF0/IRg7mr/p6?=
 =?us-ascii?Q?3DYeHTiHNRifMlZ3TvJjWBuWmYaUXXiZWQKlP+k0tcGhhVHXgqBTc25cDtMR?=
 =?us-ascii?Q?BgZL8bGbHmOm9qaegC3jBZ2lPe/GreQuNL87cb7JaoUpPWUgr0jbheQzaZrl?=
 =?us-ascii?Q?HpzD5pff15WASVT5NkVbeFiIOUNINR0aeqq2cTNaDQpHS6f1qEo+Dw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(14060799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 07:11:28.4370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da51311-433e-48c1-a552-08dd19b30841
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10670



> On 11 Dec 2024, at 00:58, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> In recognition of their outstanding work and years of service to the Xen
> Community, please join me in welcoming Anthony, Michal, and Roger as
> Committers and REST Maintainers.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>


