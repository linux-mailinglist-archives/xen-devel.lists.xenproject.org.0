Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959BB52B07B
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 04:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331557.555083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr9RW-00035p-F6; Wed, 18 May 2022 02:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331557.555083; Wed, 18 May 2022 02:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr9RW-00032L-Bf; Wed, 18 May 2022 02:29:42 +0000
Received: by outflank-mailman (input) for mailman id 331557;
 Wed, 18 May 2022 02:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9Io=V2=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nr9RU-00032F-TT
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 02:29:41 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe08::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ce16f55-d652-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 04:29:38 +0200 (CEST)
Received: from DB6PR07CA0191.eurprd07.prod.outlook.com (2603:10a6:6:42::21) by
 AS8PR08MB7234.eurprd08.prod.outlook.com (2603:10a6:20b:341::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13; Wed, 18 May 2022 02:29:35 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::2d) by DB6PR07CA0191.outlook.office365.com
 (2603:10a6:6:42::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.5 via Frontend
 Transport; Wed, 18 May 2022 02:29:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 02:29:35 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Wed, 18 May 2022 02:29:35 +0000
Received: from 3c222ef6331b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 522640E2-A226-40D7-9C69-0BA3D63376D7.1; 
 Wed, 18 May 2022 02:29:28 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c222ef6331b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 May 2022 02:29:28 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM9PR08MB6306.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 02:29:25 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 02:29:25 +0000
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
X-Inumbo-ID: 5ce16f55-d652-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AKbZCYTN5Yz3nTzwuQ4j4DpgVpPUPVe8Tg5WX5dipIJ1jzW/zdSFY2GWOZ5krTFNTI+/sPPDMG61Ov8fJ/S4iR0YUf+txqsBbIn3b/XTH/1PVW5LpzgNpTkzi/5gbBnCDRnq+5TuMa6fJgo3rwI9L8R+3LD23TGIPSDstACy5uwhDI43P7ZqczFfecH3oo65ZlJ5bnOE/P4wLt25/+2wRBDVX8Mst1RlkCpQlkzE7IE6UTOB09K6Ept/UBXwBgweOqwpt/2i+S+OIQLnWFEC0eNqYmm8wQpPmsHIc1pMYdgUTZVBuPDV9/DUjhuu2aE66NaN4MFyjFHtUomy6Kj5ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cLZcfcsapKxpJ/nIooyjnkFCSdNKz2n/GKOE6cMTEU=;
 b=BFdOtFJzZHpr987p97o6vcdDShMcSJRPXF8d3a2IyPGCKf2/HGHzTSfGNGCb8st5qDb0bZ7Lj/ZCtlIMA6rAKHiFQbfotIFmfD5+Bb2NxO5J52M3UyOeTZAJShqz2ciX8avtvS2igFKROv/zK90aTvHZYFM0KUvwORcblh0eoeTq3ayyDy0dfNdAD7sHkU8pxvYSLL4QOFRHPLBzN9A/Eke15fZvBJsjAF+Fv+LjOTgYiKlYd60831ixICTEYjf6oDVYCuvIoUeEBEhn6HwryLLgI8ZZWZowv805eyqQygMSoz2RBhXktqhkt5Eb1JtsUPkUO3G9b1ULmIs8AIsj+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cLZcfcsapKxpJ/nIooyjnkFCSdNKz2n/GKOE6cMTEU=;
 b=B6ox1DGlfJdEFp0D687y5Wl1g/lWWFuQVeo7MJcvP6p8mkHfCcYo4T9ciTMctWwB/HVQJvMsn56fSX/l6+HZRvSXA+wgZSqoYx+h8NEfCvLyPuRX6A6c9XkynnbkblFm46ZI+JCkAhMLp4ghZGpMoY3LCtbCB3cq/OSRqPTDGOI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ng9lLEs2aysmTnixiV5xp/lB6owdcrleYb08APvFkPV/Li+ygy8xQ6yb2JAJYZQrjVkyu9GqTUGmkELuKgrrRD+uU6VXc36I/+acodzt2F6dNYSbMyDOVmXe+AMn5eFtamVMQfAGzK1YXqI9XDZ66q+xF64NDXWwZpnsEk1IPrQ7AeRZwSKgKOxqRYwDpjhgDVYgB/t8MS9B1CjBxvoF6yrkx0cdze8eP/1RRxtk0jmBh8e0t5nIaSSi4ndbq9bKc0ZVpjfBH536ChhUMValpENLkbQp0bwtPPMDPPoKQeygeSzcBJMq65l0X6KhW+JXy5YggiZAiCYF2w597cD43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cLZcfcsapKxpJ/nIooyjnkFCSdNKz2n/GKOE6cMTEU=;
 b=bl1EtYMxD+DmBuY6vKGjK3NKUHh6bmD3M1VqbC9kuTlhoeMv+U9GROkiKcArJofAXvuwWU4ymTtcSvQtZIVR/Q1BVol5V9P56rJ5GvcHWea3xN6Bl99jbYIz4mDolKihJJPJ4RttH2PXf/bCzPYIpcRpE07uYNZdGFSwVoo8mRhFnSELZdd+BlS5En7zPZ9aPLm+pCzTOmOf914hS8K5jBM5LGFKwh+kz6xnUfuooX/y6NtRfcm9IZK3FSeMRz57jQ2tTXlDlemjC3GcQlRDvzsTL+/zyqBbItUbTWTDGLwpGR7+q8sWoYaam/+3VcP3eJji1/K8eJMbC9tADBRibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cLZcfcsapKxpJ/nIooyjnkFCSdNKz2n/GKOE6cMTEU=;
 b=B6ox1DGlfJdEFp0D687y5Wl1g/lWWFuQVeo7MJcvP6p8mkHfCcYo4T9ciTMctWwB/HVQJvMsn56fSX/l6+HZRvSXA+wgZSqoYx+h8NEfCvLyPuRX6A6c9XkynnbkblFm46ZI+JCkAhMLp4ghZGpMoY3LCtbCB3cq/OSRqPTDGOI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 1/6] xen: do not free reserved memory into heap
Thread-Topic: [PATCH v4 1/6] xen: do not free reserved memory into heap
Thread-Index: AQHYZBWe/uxRZBdW10mDRgQaF95/K60jSVqAgACnZgA=
Date: Wed, 18 May 2022 02:29:24 +0000
Message-ID:
 <DU2PR08MB7325E3D7474C737E35D18174F7D19@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-2-Penny.Zheng@arm.com>
 <20dd9308-3cdc-4ebb-61b2-e0a71e808697@suse.com>
In-Reply-To: <20dd9308-3cdc-4ebb-61b2-e0a71e808697@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D69583AF583F6D4185C5DFC81323147C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a61dc321-88a6-49cc-d67f-08da38763f9b
x-ms-traffictypediagnostic:
	AM9PR08MB6306:EE_|DBAEUR03FT024:EE_|AS8PR08MB7234:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB72349535EBD14D4F089A3C0BF7D19@AS8PR08MB7234.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jndSgcoj3CSQ1nJi6kdWrv5GyvYHEyYDX2RmKfbjxKMmi1m0+1sR3fngk07NuRyvW/YGCcjXSKCaNQb89bM1qzIdslk46O67TPX+NjiyQqjfW3kDOCHWLedfnnO5n5qJWlfoMEXmC1ggSzfnpxQlpYYWm3vBqaH6eoPtDdBcrQRtQpEFEWLcNCEBG5MCMTlnjKZe7S43tc524FTsqzV8523Aeem4d0Cx40FnwvJVtYSYR+sRNkYwJ/JhRULutFgL7Rk+NRdaUJMTnZms3di7gEe/TmtnSHxzJgrW10hyLGExJ3cCYsnr3sIk9FcysWIs+EtM4h07i6xjKylTK7wG2yx5iwVLRtQjEARxFawrbKdW+B65M+b8TU81HyaMt7ZOgPwbh37Aqjq6IDmgaFJXnUXCHaBppm5j8zVYcl7uCbo1xN/F4FyTMlGnxbcvM61dLoJg0YPZfrTKd1uVeOq4dzKXPYTzJqrqF8SFOS0n1GMu2dbx9S1YgoG++IeQhmiQzm56Jiu3wmSZTb3vQ4IxiybR07a9cCNmmBEgZE/1Ynfdjx+F7hr3SfFLeBKRez76emDzUjVoPDpHI6Mirovh1aWnvqmHYEmh5k2cO8cTq7j/cWduypR5/oJ3B+pvfOXWr1m0Sr+VT7vfpduBudeP4LTMIaahuez5FkIo4ivmzXILh1PQnY24phvAlIjVQVm8j+78cZ5Xc6j1P4Rznevr8A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(38070700005)(76116006)(66946007)(83380400001)(66476007)(4326008)(9686003)(66446008)(64756008)(66556008)(6506007)(8676002)(7696005)(71200400001)(316002)(26005)(122000001)(110136005)(38100700002)(55016003)(54906003)(8936002)(2906002)(33656002)(52536014)(508600001)(5660300002)(186003)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6306
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2452dd0b-180c-4179-8f4a-08da38763998
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	23iQIzvig7gFbsQ8m9r7/+hNYonHzZ5I1LgpQi/YcwBygAuVQWfQEmuuk7VDLr6hC8XTjwZWD1BFswh2Z0qhp+5a/hXQ47H6KE1z/TXUNhh5jLpxDUjoogRfzqHdzocDf9deoD5a+xqDAjwykYyaPWIrpmxrgGu/kIN6T4r0UPlCZvFcyRrgn/+xAn/jyUv3o8aA2vD2RebxXHI7w+iEEiT7RKLNUyR0zYDGeHGfNpXuVHill3uH61r5t0rU7RHdI6TupHWfdQa3F5Y+1utG5EhEC+IwbT9ekFaXPm7iIkZ02bfksTyDXKX3lgtTgMwT+FJPRPd++hormr8uL8skqda5m3FoeB3bgWl+lymE66ZCL3fJnnyrPF7KaoZN/+i9Y6tVs48DjTSAb72HHmGg26NR5DT5BnWfqclujufSBhFUfeT4UKCRf8P6JPcsgI9S8/xfy9N6FGeqdhNXGTcguij7EDkUXDAs8Pj2sDViyMHcfdAhLrvOd0WINaIf3Em2Tts1TmAKSq4LwZprjLWTmLosFASZ9mcTbqwJ6ue3EHK6Cs2rENrQbMelHGPmFxLqyqaDjgX8K7/EW99RxfrsN30Q7JRzTwcGwJ51D2Tv61+uHXSWmKW9obTi6KodEVT7PKOXnCLxnIhTSJu/cpFxw5WwfvsUZT5jYPoAASTFN3o1pxnm763/VBJXNbNsLaMa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(53546011)(82310400005)(36860700001)(26005)(356005)(83380400001)(33656002)(9686003)(70586007)(70206006)(52536014)(508600001)(81166007)(54906003)(86362001)(6506007)(110136005)(2906002)(47076005)(316002)(5660300002)(7696005)(186003)(336012)(40460700003)(4326008)(55016003)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 02:29:35.0820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a61dc321-88a6-49cc-d67f-08da38763f9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7234

SGkgSmFuIGFuZCBKdWxpZW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5
IDE4LCAyMDIyIDEyOjExIEFNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNv
bT4NCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
Y2l0cml4LmNvbT47DQo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3Jn
PjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djQgMS82XSB4ZW46IGRvIG5vdCBmcmVlIHJlc2VydmVkIG1lbW9yeSBpbnRvIGhlYXANCj4gDQo+
IE9uIDEwLjA1LjIwMjIgMDQ6MjcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEBAIC0yNzYyLDYg
KzI3NjcsMTIgQEAgaW50IF9faW5pdCBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcyhzdHJ1Y3QNCj4g
PiBkb21haW4gKmQsIG1mbl90IHNtZm4sDQo+ID4NCj4gPiAgICAgIHJldHVybiAwOw0KPiA+ICB9
DQo+ID4gKyNlbHNlDQo+ID4gK3ZvaWQgZnJlZV9zdGF0aWNtZW1fcGFnZXMoc3RydWN0IHBhZ2Vf
aW5mbyAqcGcsIHVuc2lnbmVkIGxvbmcgbnJfbWZucywNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICBib29sIG5lZWRfc2NydWIpIHsNCj4gPiArICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgp
Ow0KPiA+ICt9DQo+ID4gICNlbmRpZg0KPiANCj4gQXMgYmVmb3JlIEkgZG8gbm90IGFncmVlIHRo
YXQgd2UgbmVlZCB0aGlzIChvciBzaW1pbGFyKSBzdHViIGZ1bmN0aW9ucy4gQXMNCj4gYWxyZWFk
eSBzdWdnZXN0ZWQgSSB0aGluayB0aGF0IGluc3RlYWQgQXJtIHdhbnRzIHRvICNkZWZpbmUgUEdD
X3Jlc2VydmVkICh0bw0KPiBub24temVybykgb25seSB3aGVuICFDT05GSUdfU1RBVElDX01FTU9S
WSwganVzdCBsaWtlIGlzIGFscmVhZHkgdGhlIGNhc2UNCj4gb24geDg2Lg0KPiANCg0KT2ssIGlm
IHlvdSBkbyBub3QgbGlrZSB0aGUgc3R1YiBmdW5jdGlvbiwgdGhlbiB3aGF0IGFib3V0IEkgcHV0
dGluZyB0aGUgI2lmZGVmLWFycmF5IGJhY2sNCnRvIHRoZSBjb21tb24gd2hlcmUgZnJlZV9zdGF0
aWNtZW1fcGFnZXMgaXMgdXNlZDoNCiNpZmRlZiBDT05GSUdfU1RBVElDX01FTU9SWQ0KCWlmICgg
cGctPmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQgKQ0KCSAgICAvKiBSZXNlcnZlZCBwYWdlIHNo
YWxsIG5vdCBnbyBiYWNrIHRvIHRoZSBoZWFwLiAqLw0KCSAgICByZXR1cm4gZnJlZV9zdGF0aWNt
ZW1fcGFnZXMocGcsIDFVTCA8PCBvcmRlciwgbmVlZF9zY3J1Yik7DQojZW5kaWYNCklmIHRoaXMg
aXMgbm90IHRoZSBvcHRpb24gaGVyZSB0b28sIGJlZm9yZSBJIG1ha2UgdGhlIGNoYW5nZSBhYm91
dCBndWFyZGluZyB0aGUNClBHQ19yZXNlcnZlZCB3aXRoIENPTkZJR19TVEFUSUNfTUVNT1JZIG9u
IEFSTSwgSSdkIGxpa2UgdG8gY2MgSnVsaWVuIGhlcmUsDQpTaW5jZSBpbiB0aGUgdmVyeSBiZWdp
bm5pbmcgd2hlbiB3ZSBpbnRyb2R1Y2VkIFBHQ19yZXNlcnZlZCBmbGFnLCBoZSBtaWdodCBoYXZl
DQpjb25jZXJucyBhYm91dCBsaW1pdGluZyB0aGUgdXNhZ2Ugb2YgUEdDX3Jlc2VydmVkIHRvIHN0
YXRpYyBtZW1vcnksIGlmIGhlIGlzDQpva2F5IG5vdywgSSdtIGZpbmUgdG9vLiA7KQ0KDQo+IEph
bg0KDQo=

