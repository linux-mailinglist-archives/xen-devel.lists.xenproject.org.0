Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D729F62E7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860186.1272243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrIB-0004SN-Ue; Wed, 18 Dec 2024 10:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860186.1272243; Wed, 18 Dec 2024 10:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrIB-0004Q3-RV; Wed, 18 Dec 2024 10:28:35 +0000
Received: by outflank-mailman (input) for mailman id 860186;
 Wed, 18 Dec 2024 10:28:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNrIA-0004OL-8F
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:28:34 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2606::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d476a0ea-bd2a-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:28:32 +0100 (CET)
Received: from DU2PR04CA0331.eurprd04.prod.outlook.com (2603:10a6:10:2b4::19)
 by DB9PR08MB6604.eurprd08.prod.outlook.com (2603:10a6:10:262::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 10:28:28 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::fc) by DU2PR04CA0331.outlook.office365.com
 (2603:10a6:10:2b4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 10:28:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 10:28:28 +0000
Received: ("Tessian outbound 050b604d5e06:v528");
 Wed, 18 Dec 2024 10:28:28 +0000
Received: from L7bafaf49c52a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 80CBF525-9593-4D91-A286-D5258F9015FE.1; 
 Wed, 18 Dec 2024 10:28:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7bafaf49c52a.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 10:28:22 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB7441.eurprd08.prod.outlook.com (2603:10a6:102:2b9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Wed, 18 Dec
 2024 10:28:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:28:19 +0000
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
X-Inumbo-ID: d476a0ea-bd2a-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Pi7IrmCl31VQKIvteV6R0IThvk2mzRAMJQEIznXTYlko8A1DIpHhfMiSyeDMXQGc33py7ieI97+mkGdKWOcf+8Psukuw2BW98tQ1BjcQDl+TEeYh+8PapnJcHDQt1G3B9ECrAy01vanNyYBEn6mkRNtj8jYl3G3rVyiC/2h7P1WL+e5ng38TSzt1W96NAUiXbYS3g9xT589U31GbERCHBYvij0JslLG5m6laWTPnraXUsjMMPbQRoy1E8Bl3Fd1PbNvoxEMCQPaHwgccikgYOL4gBEt+AwNJS7R3FzxqeQTeuwLxKcXpHnT3KvA9/OVIAh8jZSy7UXjJ8gnu8947wA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/RxLuNM/Ln+yHAclQMwKgcB16Z9vIKT7b87KvtPl0I=;
 b=TYnEjmO7lC8mRy2PDwobH6MZR3OQ9YiX7pIzpE1m5jihKYU7X0rOOV56iVseCiLL2HykhGgPLbteHeBN4ZkFqo5s9NEdVNDPrgt0AlSDbTXgBTiV3+/MXYzXGrL/l0+Fj/MupzyAKNmEtWHxRckcOra3tqRbTUEqGESPrMQ0IAWfvNuL2YgQ9ESvPbF+r4IDltN6oj+zxhRRXtzfhgA6Ckptkd6/F02s9GCFJcUdFdkx299wphwtUropUngq7QyxqszkDD1etCuwJRwKco8dj83kB96OlLdEt5TtY2w2r1xtzD+PuNzwxEV7p1B+Ho05duW6QUElRtBaYKuU+U2JMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/RxLuNM/Ln+yHAclQMwKgcB16Z9vIKT7b87KvtPl0I=;
 b=CP22rpCsg/h1t5vVSv0uu+87OuGUe7/znfLbtcZwuQFotVhdG0pvMk7tkOxt1j8gcKGk5wAA+PHHyNKTv2Nzbvt42d60lfqLMIeWbt9KgzTDbO6TMwkszS7zypUZVYbDOWwlq3bR/KvYCTKkY+F06k08YvLX8KTTb/1LSeb5K3Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3561336bd54bcb67
X-TessianGatewayMetadata: UTg4N5+z8jB+N1nmw9i3bvNriw5jW64lMHdIykJLJH9As/yKlXvB2GFlPkO6L39yuYQTuN6hSzxCq8cEROg/UIWu/1eu0zlPKxSR1S/wIt62hns2y/MoINGJTh/7JVcYREzhWooKc/2T4drYQBdUTL/GtLThkkK24hfrjFIhOOU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wryjcTlzezGyFkuGOGuf6Ff+ekeles0litPOQaIy+vYlFlnVIJCEj3ooBJxX/i2viJhxvkepw+h6iM7OM9IO3sbMMb2/tKqPPZsOF2U89DSf+UKLjxNjyL6QGmYCdc24N/qcx0ejo8MpX4+eMqtx5irVfRQEjyTrhEFghF01uW4ervnkj+2nDwzT4IVoWMLAZkI+E5rspHjTBfbTKfJG7mJ7UgHJ97D57mca7HoySJBQFtOdd8UHoWuzEbxDADB63N59Sb4St7Ms7lwkZ37/FFE1KuMrNFFEMxaheQ5Y/B8i+ZUu56/Kc31xxAJahxraCncW2SA3bb5wgpXI8PzsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/RxLuNM/Ln+yHAclQMwKgcB16Z9vIKT7b87KvtPl0I=;
 b=nnPZTH1be8gitKJ2ntRezDrNcVMLNdKmDyg2gnfgsg9NW/o31HMM8IPPTu0Az416LBlnT1i1BFLhJNAw5Kpzuio7DhyozZIpGN+ADNIH/xNEOXQr4wdKGHvErTn4x6EOwvQlY47Swvc3id3sALG+LTgcJ3tk3o6tnQCT7mXLvRA5PuqcYhyfnrEnVmqNZzhSVcXuM5t6foPGVujcrdq8H0JI0cqrzLFdZ6RdjfUfx+BHgV7klTBB8+LGoCcMQSNPVqQNKvlMN1EPk8kGWG2e8bFmnFD6NV7Ne/rFDUzk1b2/3E82X2p6UrE20cGMZim3jvdzRElS4ptfK3b9FViH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/RxLuNM/Ln+yHAclQMwKgcB16Z9vIKT7b87KvtPl0I=;
 b=CP22rpCsg/h1t5vVSv0uu+87OuGUe7/znfLbtcZwuQFotVhdG0pvMk7tkOxt1j8gcKGk5wAA+PHHyNKTv2Nzbvt42d60lfqLMIeWbt9KgzTDbO6TMwkszS7zypUZVYbDOWwlq3bR/KvYCTKkY+F06k08YvLX8KTTb/1LSeb5K3Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/6] xen/arm: platforms: Add NXP S32G3 Processors
 config
Thread-Topic: [PATCH v3 3/6] xen/arm: platforms: Add NXP S32G3 Processors
 config
Thread-Index: AQHbUTVdoMCMlYyvB0KhW/HQpIvTvrLrzKWA
Date: Wed, 18 Dec 2024 10:28:19 +0000
Message-ID: <4A3FB0B9-DF46-46A9-9390-4281FF72DE4B@arm.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-4-andrei.cherechesu@oss.nxp.com>
In-Reply-To: <20241218101142.1552618-4-andrei.cherechesu@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB7441:EE_|DB5PEPF00014B89:EE_|DB9PR08MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: ce706027-0518-4ec8-21cc-08dd1f4eb654
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?wvV5FKHeEcIc6dXhjLNmWkD6I3Mch0PPDwpMwXSvaMyc2YmsIcZ/CKXxOzRR?=
 =?us-ascii?Q?JRy4qquSmEoV5a+RXDePG5BBAN1mTXe96y0LfUMWBlDyRkmHywjOLAUj2baN?=
 =?us-ascii?Q?tryrcv+vR4HcssXUNL2Nl7h66aTBCQGtvv/e8r7zWUbulmeEESwOHMOyvmdc?=
 =?us-ascii?Q?wT1BGIm14tqaNVCYP1N99krXhVL4sFh/+k+bE98JwOek3UPReaLa+6admPEW?=
 =?us-ascii?Q?GSkexbIThTggJF4R9C4yg949uvFBCWss1ebwHBbgWoaYj7BrofhAtTQ6BxW2?=
 =?us-ascii?Q?wmmkJYoBL85iWGvy9wsiKsL6Hygo0hqOkEYJZ1HGvz3QLmau9femIi/1OA3A?=
 =?us-ascii?Q?jRDGe8Uqu4sR5MJcyz+sHjwjpvC+5CLsi/6M8Nv7qX2hBwlp1/tESTRIZE6I?=
 =?us-ascii?Q?NtEJIwtBM682rio6dFG5ZER+svrCmKEg4gUpURMJhI/34Pla4BACpJeDp32H?=
 =?us-ascii?Q?zYaeFeQ78GqhMmC/7kHOncZoWy9s6lfB8Mz7LcgvdQR9/N6L8YWMT8Ck/Ikd?=
 =?us-ascii?Q?JtHMw0r1ua8iuwbitQjSgMCpqjPMsYTPmLWGo8wdmYq3+SOj4FU1Bit8lpbq?=
 =?us-ascii?Q?pBuv07p/izDps7F1zcNV9XIkP/GszcU5IeZ8uQq0zfnGYmXUVM3t85zKZaYt?=
 =?us-ascii?Q?73aBy7N/msdBZrh6gvnWjgA618GjH82SlS9iWtqPklV9eORXda7iB147tzMc?=
 =?us-ascii?Q?YPGf86c02iWFJG43rKpj93g/Ao5Pa3EqnlFc6JU6NDf2tP59TP4cwf4dJIoA?=
 =?us-ascii?Q?iG2oG73gO3+G0SpCnM5XnFRCfTQGvUjGrYeX8yax4/fC+7Tl+8rzrGyddjRo?=
 =?us-ascii?Q?NkiJlrEs3Kgi6DVFbUoSmEYsMs4Qh0HDH/OOa8AMgMmhWC0gVvK+lRPHnRNy?=
 =?us-ascii?Q?RN1yxFPYawUUSeJsJXzNJ1Z8Tbk9wRnltfGQzrP/GsmjdLkvhPByc9WpdZr7?=
 =?us-ascii?Q?fFsvKKBTxeZAMck1frpYvG7UladRC8gJMZjUb5AARmIGbg4pd8azepPxcouU?=
 =?us-ascii?Q?1IEd4RDjnX6yu3JvbAOpJ5E8MLkZklEh/1Pz9k8SUTIQ20FQ+hz8mwYoklH2?=
 =?us-ascii?Q?5NQuW95mFxqVR8fHMJEbjrYHVy9hTi7aPTuiVbTVcsgx26Nh+cQiucDXxirq?=
 =?us-ascii?Q?y87hUtFZ9jOi+yA25bP0EPShDp3ssRDf+ysPYpf9WpEQHhAXkiLJRAQtvRN0?=
 =?us-ascii?Q?9Hb+w0Xz1p06VbJk6PyVRMWnZ/DVaCl8EWdnA8i/XGgHOn9QBDzt9g/WtK+q?=
 =?us-ascii?Q?ZNvZLdbiCdc2LWNPk05htZh36sfnC2Flr0f8/Chc/Q4FMjPVU0T4GeId0fsZ?=
 =?us-ascii?Q?KFXZoTjUA76AJYDesgVoZbrMQGdgHaTX1C2Cn15zkqzxo4wJxsURbqReTFIq?=
 =?us-ascii?Q?1Av01VT3/Mg20r26/Alp1W4KMzMP3MYrBonB9H5b2yHJV3MDFcWMWrhHPF6e?=
 =?us-ascii?Q?0okp/l3HoVVjrWJDWXBuePsF5kz8mJRd?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <244BB12504C2644A8D643392A35F5E6D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7b9e7244-8be3-45b9-b509-08dd1f4eb14f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l6auXQTpLmtCHu4KDUORosg/nqa4dE4i31Fue8+iFcf+pkbB9qPmHNCsTr5x?=
 =?us-ascii?Q?6MZrNgeORIJcAmz5deZs8rTuL4XQJdHsXCuD8EmasmmPtPf+BtK8x63X4din?=
 =?us-ascii?Q?e47tLCUT8YMB6k+X/bkmYf9Fo+dYPBe1VGpQ1ZjvQfYcmIDxCJBkfKCCP1E0?=
 =?us-ascii?Q?zbILWnhAph/WCpXNM+MgqwIJeYsSZc1sDpRe1z+EkOepAilsQ+L8id35ToRx?=
 =?us-ascii?Q?OXlYYgB69JKIQjy0xznBOEkCr64kWT5tlJzqMgJobinz5tZiFg8bG68ASwKB?=
 =?us-ascii?Q?AxbkzFg9xtvOInRCaUjTV6gRN+s/orT2DS2wmXceUxI6ZOPy0X+zu+h1mafa?=
 =?us-ascii?Q?KQbN+vDoE+BQ3qj1NpLCQFqpe1FDsxo5laOI7aPAve3zLZwuTiZiXmcGhSnt?=
 =?us-ascii?Q?XbxMbRB9cw3Uip4ZoGt2aLu2iQu4fxD3kJ4lwm0S7qRcGy5uH1df88dZ4+Po?=
 =?us-ascii?Q?H1NqTVDVYlW5/I/iNt/x9TamdWy9tq8CiAJR8K32/Qgi4fimNiV6KDd1AEEa?=
 =?us-ascii?Q?3n1W/r8kyhKCO+79tMz+xTHZ97OX2rvMsP2Vy6qlQ1mia0l/E8c6WG7z4VPG?=
 =?us-ascii?Q?WWER39ctyod+Q+AZxEVHPU1yj0JJRiydwuRMkqAUg9olCJqoUflu6dP32u3o?=
 =?us-ascii?Q?KZWQ9/TfzpsJK1hGQn8xNFDtU6O6NxoQE3DlK50whdQmY9TP8zv/y16lIx+E?=
 =?us-ascii?Q?t2msa0W0LqaMtnDrN3UDLJFNo+all0yqw51lTEUmHv5qmqW9Ksgh95DpBfNo?=
 =?us-ascii?Q?Hy6WWDQivT6oIGVaxyQmdYD1CqbEG/KfJBuZDNZ5/cPdkhakahHlEvAPpxTx?=
 =?us-ascii?Q?qiV8oRt30opSUNzgHyqQn4sAxGzQZLDTnuQyNgqEEkxIJyydhGJm6Wm1xNnR?=
 =?us-ascii?Q?2AQQ4U9Iz4GRDYLIzYFbtAzS6Cjknq9D3/Y5fEqpw7XsU4fXBpv4PGWJThFC?=
 =?us-ascii?Q?3oJrPn9QKOiAQwJsCUgKpJCo317ZArKyidn9xOMXXOQZySWoVgEr2cxcrFE0?=
 =?us-ascii?Q?l2WhUhmZq6fIdOXHIV7+mXjM/zZcvwMoE2FUsZYI7DrCP7oWMX0KZNcO5gf7?=
 =?us-ascii?Q?vUTUhWmpUhupOUQN0xarm+tl4Is/4jkaNx01ySWlgU76Rt+fbZBOFELZgLL5?=
 =?us-ascii?Q?Sbpw9/T35SrcRIPen9pOcC47Rf4dcn2e5Ct0Sw1w4g7jTPJzy9Mmy8UEETkM?=
 =?us-ascii?Q?Ei1w/AiihAsh0rlWwha9KyHGPflLGgr7mohpYPOtg+J/1JtOFN79CZHqo1pC?=
 =?us-ascii?Q?ed7oK/nStENHk9a8ubxtikDzBfaO+iWN/zhyU6DB5heOWN3om2/CtvYedAHZ?=
 =?us-ascii?Q?8iXfTyLC0ymYcv++dONxZNpdI5Wtm48COS5hLCsUoyyMyCJ/8SyefdkEPZiB?=
 =?us-ascii?Q?uNpAolZxeFhP0TV9yjKDfoc9z02C80GoFS+qiJ66SbCedWHHExhgzqLMT0fd?=
 =?us-ascii?Q?qWWv4yBiluBn8qvZ8dib9va1L6NSMqTTgnNlihFVeG6mVxQ+bS9mC0ckvLUR?=
 =?us-ascii?Q?5uCn1nWycuttlu4=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:28:28.3199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce706027-0518-4ec8-21cc-08dd1f4eb654
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6604

Hi Andrei,

> On 18 Dec 2024, at 11:11, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.=
nxp.com> wrote:
>=20
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>=20
> Platforms based on NXP S32G3 processors use the NXP LINFlexD
> UART driver for console by default, and rely on Dom0 having
> access to SCMI services for system-level resources from
> firmware at EL3.
>=20
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/platforms/Kconfig | 8 ++++++++
> 1 file changed, 8 insertions(+)
>=20
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kcon=
fig
> index 02322c259c..6dbf6ec87b 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -37,6 +37,14 @@ config MPSOC
> help
> Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>=20
> +config S32G3
> + bool "NXP S32G3 Processors support"
> + depends on ARM_64
> + select HAS_LINFLEX
> + select SCMI_SMC
> + help
> + Enable all the required drivers for NXP S32G3 Processors Family
> +
> config NO_PLAT
> bool "No Platforms"
> help
> --=20
> 2.45.2
>=20


