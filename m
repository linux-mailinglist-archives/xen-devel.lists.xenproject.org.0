Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED08C4D883D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 16:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290284.492261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTmk0-0006Dh-1m; Mon, 14 Mar 2022 15:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290284.492261; Mon, 14 Mar 2022 15:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTmjz-0006BG-Uu; Mon, 14 Mar 2022 15:36:11 +0000
Received: by outflank-mailman (input) for mailman id 290284;
 Mon, 14 Mar 2022 15:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1jB=TZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nTmjz-0006BA-6r
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 15:36:11 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe07::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73a96c44-a3ac-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 16:36:01 +0100 (CET)
Received: from AS8P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::17)
 by DBBPR08MB6105.eurprd08.prod.outlook.com (2603:10a6:10:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Mon, 14 Mar
 2022 15:35:59 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::b2) by AS8P251CA0026.outlook.office365.com
 (2603:10a6:20b:2f2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Mon, 14 Mar 2022 15:35:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 15:35:59 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Mon, 14 Mar 2022 15:35:58 +0000
Received: from 27c59a146418.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BADE2D3-336A-441F-83B1-094EB06F7971.1; 
 Mon, 14 Mar 2022 15:35:49 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27c59a146418.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 15:35:49 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM0PR08MB4082.eurprd08.prod.outlook.com (2603:10a6:208:12e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 15:35:45 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 15:35:45 +0000
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
X-Inumbo-ID: 73a96c44-a3ac-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkD05uplLEp7mBYLZoJBUEKsIlaEpaz0CRsM2QYgifY=;
 b=7/fEreNmGOVtYHeiAQjfsDN2OHmXjgOL3ym5GoOJ3gQrdlKF75tzEjd3HTNiWrFi9Q8eVxWsSqW++GZC6kVMoEruJgAQmgC7CV3Fmvhwyxu9VWl4wHOjB4M7tBPvpNNgMfoeS3M06thMee3t1m9F2XAC3xfz2bsE2UKH+4e/6pI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc7e1ede03485260
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mjt+0pTtt5hY+qXuaSUD5/aa5r/3UqgrkNj1tMOm3osRtHMcB00Q5qCwytDJ2phzpfLi+nYdJxPqdE9R49O3qis3LHXgqRy9Dhc3K3I0fgu2KwXyuNNDTXTdeHTi2ixAuaq4enSFVDaOllNvNcvoI+1doJiE/BeJB2FnlJ/TwmVcabrb9SPqSomKCIJAjUJi8YQZpzAZGbixfUXeRx25b5tbftyNCsdVWn+lO9nUYCu4cATtPtJEtx1deDAkTNsC7XDU+Q4y2nWMmTJlGE+aSXa9i85EQV5CjmUy0UijWUWCtW4iBM0OToCtSkaBSBUdYCzzYy2/aao55/oj4tkTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkD05uplLEp7mBYLZoJBUEKsIlaEpaz0CRsM2QYgifY=;
 b=KOWgfvyPnSj4JUpAAX550c01D8Etxxd2bDqgP05/hxgL9OoS+FBfRiIkMZQ6SKwsUOp/xEPzBuRx02/2/P7pboAO3WkQs64Gm96CrbM/QslK4NDNrZNBQzwabeTdwRzBIr3nCQqfQQFHdPElhJAXCw7UxOnlHXB5KZ7WCal/UCvmAlLSN9PUGh16O9FBCmYL+/Hf0pxZOxkXy7qtd+YRP5zYT0RvPOE22nUtA8mncJeqSgmWkQL5iYYKH3dF72cadXTE/nGUmnX/ziaOn68rRi3sVkgaAwA37t9ughGIBVEKFQ/R/fqs+eCZ+RHEEUp9+WMsvuJir/0VgE50WAWdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkD05uplLEp7mBYLZoJBUEKsIlaEpaz0CRsM2QYgifY=;
 b=7/fEreNmGOVtYHeiAQjfsDN2OHmXjgOL3ym5GoOJ3gQrdlKF75tzEjd3HTNiWrFi9Q8eVxWsSqW++GZC6kVMoEruJgAQmgC7CV3Fmvhwyxu9VWl4wHOjB4M7tBPvpNNgMfoeS3M06thMee3t1m9F2XAC3xfz2bsE2UKH+4e/6pI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>
Subject: Re: [XEN][RFC PATCH v3 05/14] xen/device-tree: Add
 _dt_find_node_by_path() to find nodes in device tree
Thread-Topic: [XEN][RFC PATCH v3 05/14] xen/device-tree: Add
 _dt_find_node_by_path() to find nodes in device tree
Thread-Index: AQHYMyVuH8IU/vkP80S9r/WX11Sag6y/DAsA
Date: Mon, 14 Mar 2022 15:35:45 +0000
Message-ID: <238C7B4B-B1DB-4870-B7DD-979749FBA977@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-6-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-6-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 88e132d7-6eff-488c-dcaf-08da05d056a6
x-ms-traffictypediagnostic:
	AM0PR08MB4082:EE_|AM5EUR03FT044:EE_|DBBPR08MB6105:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6105F1D52B7D8AAE270D7EADE40F9@DBBPR08MB6105.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3/dURJA+JJrRx3+Fg6laI5p57Lu8wGeGO68YyRLH1T3jLb/5xGcqdtufMt7SwGZKmVdsOaLbreILotmyCJx9iMiR8a0VziNg0wBYH6dyKtd4zo66YzwOq+j88KRlYVjIeeSEhdAfyGoSaizaD/6LLMNkCFpMjHxZTFmRWwarhchWTTiTnEw9ubR0PIhapYJCOhxM3y1vRm0tcxenqpDutnqJN6yq7nIkkpkxTbs/wVC4XpgDzwrCeR6vGYIEBLs+od6wt8JiyTgxckUBb6X5EiNp8JxV5J/TxQCuwbKG+Fng68LXAMqXRnvvPXI8AUou5j7NuYOpJTJIx7a0kvqaftTkfQAXEIgF4fnmxIk/AqC2YF3ewoGWRMFSH1EWRQv8qnmuCBpiS8GhNkHn6QQmsq1ILuW4Pou+2dliUyxZ+o8MqQfjI8az2Sq1V55w1uYYnEtqcZCgWYGMOTYx2D4/ySpoOaYXT9Zuay+wfa1VA5mkH/EDWuDLjOY3WNnZudrp2zpIpUahhg0xgWfJTWoX7CvvXJ3FdigLuDMpzN7dp4vOicCSM146NCxScdaBua5R6s+rPl9u0vuRGjYC2Doc4swo0bk0ZU/zrAaOi9f2lCqS/mE/WGHe10M7HcVLjSdiusEuTx+8WgHVXLjg/sHSXwCPpRq4ZBU2w++o7WgMa2WBRQmSbhq0nMOEMV1XEW26SERSEnvqm1dCN0aNFCXBl1rpzSnviHzDcD0DCEo/LGpWwGFpTWElMF6RwcUr5pBUGrcj3wf6CycV3q2BV5sSrg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(86362001)(38100700002)(122000001)(66946007)(66556008)(66446008)(91956017)(64756008)(66476007)(6916009)(316002)(4326008)(5660300002)(76116006)(8676002)(54906003)(2906002)(83380400001)(8936002)(36756003)(2616005)(186003)(71200400001)(26005)(6486002)(508600001)(53546011)(6506007)(6512007)(33656002)(37363002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9A5AB5386FAA24D96D837B6CF227DA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4082
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1dab651c-d19f-407a-76cf-08da05d04e5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z0m6V8jgAuARj87JcYEPXYtM8Mddw7ejlVa+/nbQ8Ows50gk5RODm1aTR/huCL2BHQ4uxZ5HrdQB6K9C5CbusJxddvUsdUQ72vDDZTPsVGYmZkHkAOef4DL9vBXtuX5WGzXUyiZapLXulphoDFqmUXv7yyAU5twfrRyKUneW1jn3vHiBHgo51zADK89z2ZMDOLNFQM0vtqQzFsG7Dxg6MxXEoe8fQetUcOvBGGZOYp1qLp5h/+46BGCx/R/HC694kkuQLaC6p2FGciUCu2PAaUVCwo/VyOYil0vsgLraNai87UlPhZ09i2PYhcp1q7LvhLfOZQotzuDD1+dB7pPXwfvQqF8f6UC1L92vPFfyb/u7OgfgUuadhAugbzrwuqN8fbnQNxdv4VTRojq3WgrgHn+hIxCFo02fwTwpPSQmj8YzOOgGRWwNRUBffl5KSyeUwfMGxsltkB/rce4o6lkAOr318al1VGQ3Q/A2Sy1tGIukNmU7J9nFSE0HhzcYdhubLOSSfDbyR5bqqze9I2b9WZZ95tJaKPk8EahS1HJC3rMTo971Vt4zLpLzHqtwYSOaQLJRD/amt3Kka8j7KPpZygA6QGbEag3mDr6bue2Ye3J9BgudIm2D+K1Osa1FxUla/8FrllL1vygIy2xBBlt2wd2fQrHGz43xD/OsQecRreOAfCF9lo6ojzSAoAO0MUPKNRUTPwcclnULRSbjKp67KQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(83380400001)(36756003)(2616005)(107886003)(2906002)(6862004)(4326008)(8676002)(70586007)(70206006)(186003)(26005)(336012)(53546011)(508600001)(6512007)(6506007)(47076005)(36860700001)(8936002)(82310400004)(33656002)(316002)(86362001)(6486002)(54906003)(5660300002)(81166007)(40460700003)(356005)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 15:35:59.0677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e132d7-6eff-488c-dcaf-08da05d056a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6105

SGkgVmlrcmFtLA0KDQo+IE9uIDggTWFyIDIwMjIsIGF0IDE5OjQ2LCBWaWtyYW0gR2FyaHdhbCA8
Zm51LnZpa3JhbUB4aWxpbnguY29tPiB3cm90ZToNCj4gDQo+IEFkZCBfZHRfZmluZF9ieV9wYXRo
KCkgdG8gZmluZCBhIG1hdGNoaW5nIG5vZGUgd2l0aCBwYXRoIGZvciBhIGR0X2RldmljZV9ub2Rl
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmlrcmFtIEdhcmh3YWwgPGZudS52aWtyYW1AeGlsaW54
LmNvbT4NCj4gLS0tDQo+IHhlbi9jb21tb24vZGV2aWNlX3RyZWUuYyAgICAgIHwgMTAgKysrKysr
KystLQ0KPiB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCB8ICA5ICsrKysrKysrKw0KPiAy
IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jIGIveGVuL2NvbW1vbi9kZXZpY2Vf
dHJlZS5jDQo+IGluZGV4IGY0M2Q2NmE1MDEuLjJlMzM0Zjk0OWUgMTAwNjQ0DQo+IC0tLSBhL3hl
bi9jb21tb24vZGV2aWNlX3RyZWUuYw0KPiArKysgYi94ZW4vY29tbW9uL2RldmljZV90cmVlLmMN
Cj4gQEAgLTM1OCwxNyArMzU4LDIzIEBAIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZHRfZmluZF9u
b2RlX2J5X3R5cGUoc3RydWN0IGR0X2RldmljZV9ub2RlICpmcm9tLA0KPiAgICAgcmV0dXJuIG5w
Ow0KPiB9DQo+IA0KPiAtc3RydWN0IGR0X2RldmljZV9ub2RlICpkdF9maW5kX25vZGVfYnlfcGF0
aChjb25zdCBjaGFyICpwYXRoKQ0KPiArc3RydWN0IGR0X2RldmljZV9ub2RlICpfZHRfZmluZF9u
b2RlX2J5X3BhdGgoc3RydWN0IGR0X2RldmljZV9ub2RlICpkdCwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnBhdGgpDQoNCkEgZnVu
Y3Rpb24gd2l0aCBhIG5hbWUgc3RhcnRpbmcgd2l0aCBhbiB1bmRlcnNjb3JlIGZlZWxzIHRvIG1l
IG1vcmUgYW4gaW50ZXJuYWwgZnVuY3Rpb24gcmF0aGVyIHRoYW4gcHVibGljLA0KSSBzdWdnZXN0
IHRvIGZpbmQgYW5vdGhlciBuYW1lLCBtYXliZSBkZXZpY2VfdHJlZV9maW5kX25vZGVfYnlfcGF0
aD8gDQoNCj4gew0KPiAgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpucDsNCj4gDQo+IC0gICAg
ZHRfZm9yX2VhY2hfZGV2aWNlX25vZGUoZHRfaG9zdCwgbnApDQo+ICsgICAgZHRfZm9yX2VhY2hf
ZGV2aWNlX25vZGUoZHQsIG5wKQ0KPiAgICAgICAgIGlmICggbnAtPmZ1bGxfbmFtZSAmJiAoZHRf
bm9kZV9jbXAobnAtPmZ1bGxfbmFtZSwgcGF0aCkgPT0gMCkgKQ0KPiAgICAgICAgICAgICBicmVh
azsNCj4gDQo+ICAgICByZXR1cm4gbnA7DQo+IH0NCj4gDQo+ICtzdHJ1Y3QgZHRfZGV2aWNlX25v
ZGUgKmR0X2ZpbmRfbm9kZV9ieV9wYXRoKGNvbnN0IGNoYXIgKnBhdGgpDQo+ICt7DQo+ICsgICAg
cmV0dXJuIF9kdF9maW5kX25vZGVfYnlfcGF0aChkdF9ob3N0LCBwYXRoKTsNCj4gK30NCg0KVGhp
cyBpcyBwdWJsaWMgYnV0IGl04oCZcyBub3QgZGVjbGFyZWQgaW4gZGV2aWNlX3RyZWUuaC4gTWF5
YmUgdGhpcyBjYW4gYmVjb21lIGEgc3RhdGljIGlubGluZSBkZWZpbmVkIGluIHRoZSBoZWFkZXI/
DQoNCkNoZWVycywNCkx1Y2E=

