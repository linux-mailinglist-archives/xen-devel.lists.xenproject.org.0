Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9A58C568
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 11:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382302.617211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKyt9-0007CQ-Ep; Mon, 08 Aug 2022 09:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382302.617211; Mon, 08 Aug 2022 09:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKyt9-00079F-BV; Mon, 08 Aug 2022 09:17:31 +0000
Received: by outflank-mailman (input) for mailman id 382302;
 Mon, 08 Aug 2022 09:17:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FHLH=YM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oKyt8-000799-5M
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 09:17:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150073.outbound.protection.outlook.com [40.107.15.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb8a1552-16fa-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 11:17:28 +0200 (CEST)
Received: from AS9PR06CA0511.eurprd06.prod.outlook.com (2603:10a6:20b:49d::6)
 by AM9PR08MB6290.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 09:17:24 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49d:cafe::9) by AS9PR06CA0511.outlook.office365.com
 (2603:10a6:20b:49d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Mon, 8 Aug 2022 09:17:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Mon, 8 Aug 2022 09:17:23 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Mon, 08 Aug 2022 09:17:23 +0000
Received: from f7a8f1466d8e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 542AD46B-F8FF-4E18-A294-026331B47D60.1; 
 Mon, 08 Aug 2022 09:17:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7a8f1466d8e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Aug 2022 09:17:13 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS8PR08MB6200.eurprd08.prod.outlook.com (2603:10a6:20b:292::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 09:17:09 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 09:17:09 +0000
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
X-Inumbo-ID: eb8a1552-16fa-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=P92r3rktKX1NJpONqo9Sg2QiOLsChGQhGpyw/DLPWIXsAOKZRPzm9mOhE74FZtZ0g1DBPTIUb46UWlNBsdImJ8IzFDM2G26Az7qZM/pLnOIkji1iP7sK/mUu79Ohqt38WIlkXiNA0oKUa3Sk60PhEpDIlshstl07m3hSOfhznd/vhVmt2gqDXjy3p9NQf6JNY8ybUhwyhj/3jiB4cxiF8v+kShak6rpYG4LEcAFHWkSOxUa4uFFsMwj9K7S21Kzo3K5Z5hKo0wXs6lqai9C3aO0+dNCx24xX7Dz73iuJKyoiGd9xcvDweY0VLK5uMB3UoVrkKYVPhyZz1W92nScEEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75iWP21dbhB/tpAA/qlwGnhI8Qt//tkztN28LXdTycU=;
 b=ODS7uxAFh2SV4PgAtbts4ZOSeOqsupckw2QrJkms5QWlvUN452HB1M9UWjsl2AVUl0moagvnzYhcY8UDgiqP2ldE+C2mT8BssNHaH6umU4KjCwO7qUE8QoJOBxyeGeN+oquGOAooZnO8BCTUmdlXBs+hZJ6OlQsaZChiXAwNbw7Tgmh56XBQ9UpD0YlCKuC65GlJ434wrultsyzrOK5BGp9m0NCvS3rcW+U9G2SfG5apBRSktB+OKwR9scFcPDT+UwmBYPqfRub26MrAhBUaM7ctLqmWqEOJliAN51zb77Hw7ULQjBrCnMtFuxQnLZ/nKQml44a3t8aBzL2ZYf3E3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75iWP21dbhB/tpAA/qlwGnhI8Qt//tkztN28LXdTycU=;
 b=AzBpfxMJKsTdQO8xSNgIXDmkkQDBpV7vHhXUpp6SUdQSfiG1qbt3qxlx4BuOgemklmZ65mOwKVyH+Bk9Z5Am0qvhP8OFDhel9W32S5aiXIhrJgIxOKT1sACzN765RwVEF3eq+reCE1akmn9QKeliclZyfZfhkIOimkDnDgI6hSc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d06c4dbf8f1371e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQDeFfZ6fs2wMvKkRlME37jDDFokDaJUpW4vbu18hIC68X1ztNceNA+hU3X69clC7UppwO/N9CXfBjVZhjFDzkzhKzkVBnyjQbJbQ/FDV1KK50IdvDEIh3Wl2Q/h4o34b1ToLo1zWs4n95dA7B0GHL38Jj2Shk33PUvYGHOrmVwq7QLGjv8LfGgxPVO9XQEgWjfA3V7UzurQKttbQIpYhw9NCyxntAVQhCciIkEyVmwtsQw54wTrmmzeCA8LkqN7WuVSDvAhx1lkrXyO8ZQe879OJ/ps8fkDsw/PO/uJgvAyX8/fcmZ/3RN7g2pVxrQmBvTXp1BX1OkeGPgMvMXdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75iWP21dbhB/tpAA/qlwGnhI8Qt//tkztN28LXdTycU=;
 b=e9iLCAxJ7VnTC5Ty1q74IhK2SA33GFV1gFZtxmwHGPDMSqd8anG1BvHQKfVR5SzyU0qeKkCjW1vYu5snVcHNEHHdeWguQesiN9L9f2B08ileTWt3aTVp2E69sUaFdeZjgPmuuZWV0y5jQJcGax1Zaw47AB/lSDheml5aGc0++uCaEqCaln2uarHnj/30ED9/YIRxXZehwGcCewBXTg7mR4gTAPFYpJ9Jiu4mudC3AND4dJzdHe/SQmgdfblnwMLTEDVp+K4/O3HHaaAiK3XOTr86W/X2FnZQPIr/HRMKQflxbc5NH7sTOVaAnTOAMTiDJ9qcGGwmKaud3hISJi2nbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75iWP21dbhB/tpAA/qlwGnhI8Qt//tkztN28LXdTycU=;
 b=AzBpfxMJKsTdQO8xSNgIXDmkkQDBpV7vHhXUpp6SUdQSfiG1qbt3qxlx4BuOgemklmZ65mOwKVyH+Bk9Z5Am0qvhP8OFDhel9W32S5aiXIhrJgIxOKT1sACzN765RwVEF3eq+reCE1akmn9QKeliclZyfZfhkIOimkDnDgI6hSc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 7/8] xen: introduce xen-evtchn dom0less property
Thread-Topic: [PATCH 7/8] xen: introduce xen-evtchn dom0less property
Thread-Index: AQHYhkYA1mUxDH8Iek+Bi6llJii6za2gvxYAgAABLQCABEJzgA==
Date: Mon, 8 Aug 2022 09:17:08 +0000
Message-ID: <AE8DA632-9DAE-4728-8ECA-A569A8D7BB06@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <f2bc792f8dea59648b011cda4fe7c42929c4e3d7.1655903088.git.rahul.singh@arm.com>
 <B91E9B3F-27DA-4412-9F1D-AFD1287D0898@arm.com>
 <6a276407-cfcd-d383-6d51-644b463ee510@xen.org>
In-Reply-To: <6a276407-cfcd-d383-6d51-644b463ee510@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e849f7fe-9b50-4b56-ea53-08da791ece1c
x-ms-traffictypediagnostic:
	AS8PR08MB6200:EE_|AM5EUR03FT025:EE_|AM9PR08MB6290:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BtM0oWaW+mZPo+EYCFiDPDbAXW1p4kARjNYRsl7VmZ6QFonbVEefDZG+ZLED6qwCb5aDvN+qPGDew9ql3IxqJSKSHHWWzGQ/tgNofejwRwJphNUdvpUDEUwXj5STvtXh/5FIbVUXl0bZRfsc/CU7XFbIseoeQ2p/vxrnCZVF8vbNC0deaWgdWioM6ZQrUtVWpSETsS4aXlvRmyeiw5FBDDTkuZUYfW3C2V0HLjZDSUN0fo+MZ3SIyB+6Q89Jmyvji669R7m+7N0FBZaqla8LsRnAKgiPBDQvA24pu+IJYlQ/7BiKSLaWiiUHLpMzYH/PVWHm9TJ5LFN+8kOl7GoSmU85AmWuhFsGOWA8IUGOhTPDr9zyiSbK3u9E2Sx3VZ73/oY1lcSGnGW4Uv+4cqARCux6CbMm0dyVDJGJ2upXI8WINOz/7Wg0Sdz4q4yNw78HyTKufnyB8Kd49Prj1Ie1z810ziyJzp7YOfaHchjrfGkLzpfNMXd0iL0xB+WtfkeqpF5ne9uhiSkBQwRLYtN0VW6d63ZZwD56R0/vEGmyCRtZ1hMVYDe5ElNoGUb9MmRcY9tO9OJAAhDym8RRz/LoUq+1uHqo9rqsD9Wu68ZGgEGrJ5ICVID3xXbApZNYm+D6rkqLKXpe8QN3IdgdfU9w68vY3Upduov+dZSgVqn1xDvkddbFIBGHIw3jm10xXvJsvcoxB6tDHUtE+kGxPawzq2MuEc0a5KG8zIFh3OQDBXgyp0nXztin4NG+pCCXvcpx1DtSEXL2l5T5QMPgA7o2cNzZtvfQIj4F+UKjt8L1ePg9ohHJ41rEm987fY4r8p+GBd0NPIiDQMp3v2AAqDN94YvaJtMxkOKXLATE4q8dGRU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(5660300002)(4326008)(478600001)(33656002)(6486002)(2616005)(8936002)(26005)(8676002)(66446008)(41300700001)(76116006)(6512007)(66476007)(66556008)(6506007)(66946007)(86362001)(71200400001)(53546011)(91956017)(2906002)(64756008)(122000001)(38100700002)(38070700005)(6916009)(36756003)(186003)(316002)(54906003)(83380400001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA6C724BD1A5EA458AA11972FB850D4E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6200
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d07a0f76-be14-4214-ae01-08da791ec524
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X6raVAr/11JFFjk3MHkkeSFyat79AaZaAZCVIIsNK6O1N6gjp9WJ5bqrdIjet4DCyH5fIhS1szxLvchmHHPt9yxQVevnMdSm6Ni3w40LW3uOndP95nro5gJxGoj6YiuN+ee7Z/QPuVm/XPbW/i50qiSMzLxeVoQ5FCBK/Q9GSNv8QayeML0zYMqfCMMr979elBN7Acc4sxjKb0KsTxhbJ5pxwAccN/7bF8LvgcNHuxMSU6bpXHLF+Ws7RVBCAWrkh74qRdXpOLJRVzUuDRWpE08PVXahByEWcrQ5cuPdH1zM0q7CxnJfCZTEJ+JniV2ID1+TefgclntHB5PHunq+ya65ND2I1pRLuuYMyOf9RxNmNlqrwWvB0OIeKMfbfxiCX2J7TTuRz9uWUfLMe5LyMyaFeGwO0aNtXNZgAfYyBCoXL+x+5tHxVvuPToEPNT3HDIE40Q1D0exTQLlB9cpycXaZXXob09IpIW70OCAt6GswepcYBVKum4Gfzr7VBI0zNsLSeb2ToB5gGuL85ohfIKrNoK8xC5AOemHWZ0nija4sjVGmINSCukaG39MgUWGRyhwOJ9BiA0ALVl6PqwfxzvgmxXrLQ8i8JckeuQuZi6jQ6hth3a0sGVZPoz7EQpGP7vl7r3gdPgrKFpAejESVuWY76NjsaNOMQ+RVO9IcG/t8Ujl7KwJPGzq4uJUO6p4ovOxGW9BC7UJh/U+3jhHexZfpETu0jWF9hKAZthLM2SMEVaMKYg1+L9z30VWBC3y0FEV614gqD2O9O5/f1TZ8kQ3HXf2NPEdhW5zZzKP9VCnXV7RbfU04Ck8jTscmrl3dhhC6STrX3e6n64whx64Abw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966006)(36840700001)(40470700004)(82740400003)(36756003)(6506007)(26005)(6512007)(41300700001)(356005)(81166007)(86362001)(40480700001)(6486002)(478600001)(53546011)(33656002)(83380400001)(40460700003)(36860700001)(47076005)(107886003)(82310400005)(2616005)(336012)(186003)(2906002)(6862004)(8676002)(4326008)(70206006)(8936002)(70586007)(5660300002)(316002)(54906003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 09:17:23.9702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e849f7fe-9b50-4b56-ea53-08da791ece1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6290

Hi Julien,

> On 5 Aug 2022, at 5:14 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 05/08/2022 17:10, Rahul Singh wrote:
>> Hi ,
>=20
> Hi Rahul,
>=20
>>> On 22 Jun 2022, at 3:38 pm, Rahul Singh <Rahul.Singh@arm.com> wrote:
>>>=20
>>> Introduce a new sub-node under /chosen node to establish static event
>>> channel communication between domains on dom0less systems.
>>>=20
>>> An event channel will be created beforehand to allow the domains to
>>> send notifications to each other.
>>>=20
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> docs/misc/arm/device-tree/booting.txt |  62 +++++++++++-
>>> xen/arch/arm/domain_build.c           | 139 ++++++++++++++++++++++++++
>>> xen/arch/arm/include/asm/domain.h     |   1 +
>>> xen/arch/arm/include/asm/setup.h      |   1 +
>>> xen/arch/arm/setup.c                  |   2 +
>>> 5 files changed, 204 insertions(+), 1 deletion(-)
>> I am waiting for a review for this patch and the next patch in the serie=
s before
>> I send the next version. Sending this email as a gentle reminder.
>=20
> I wasn't planning to review this patch and the next one yet because this =
looks mostly parsing. I think this is more important to get patch #1-#6 cor=
rect first.

Make sense, then I will send the next version of patches #1-#6 for review.

Regards,
Rahul=20
>=20
> Cheers,
>=20
> --=20
> Julien Grall


