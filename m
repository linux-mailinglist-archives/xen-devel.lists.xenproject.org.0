Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9505730EF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 10:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366290.597015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBXeB-000629-9Z; Wed, 13 Jul 2022 08:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366290.597015; Wed, 13 Jul 2022 08:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBXeB-0005zY-5O; Wed, 13 Jul 2022 08:23:03 +0000
Received: by outflank-mailman (input) for mailman id 366290;
 Wed, 13 Jul 2022 08:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKIO=XS=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBXe9-0005zS-Om
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 08:23:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00ece72c-0285-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 10:22:59 +0200 (CEST)
Received: from DB6PR07CA0178.eurprd07.prod.outlook.com (2603:10a6:6:43::32) by
 HE1PR08MB2681.eurprd08.prod.outlook.com (2603:10a6:7:30::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.21; Wed, 13 Jul 2022 08:22:56 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::ff) by DB6PR07CA0178.outlook.office365.com
 (2603:10a6:6:43::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.5 via Frontend
 Transport; Wed, 13 Jul 2022 08:22:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 08:22:56 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Wed, 13 Jul 2022 08:22:56 +0000
Received: from 70c09e9cdd40.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDACC8E3-84D9-4CCD-B250-52EDF7A08042.1; 
 Wed, 13 Jul 2022 08:22:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70c09e9cdd40.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jul 2022 08:22:50 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB7PR08MB3578.eurprd08.prod.outlook.com (2603:10a6:10:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Wed, 13 Jul
 2022 08:22:48 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 08:22:48 +0000
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
X-Inumbo-ID: 00ece72c-0285-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=i5JhTUkb0UQaAhX5dAOKJ0OEiUP49QuDt3Dykyo5ftSAoLQJLW2Fd3lv3CpBJ3/HxXg6Uh2a9KsCFNoHxSjRWntkiZs41eOuNTtQMEjBEgyaKPX7syMOeWlGKvgL+xeon9a6cnImAWJ+KVDLpx5bhInJeTTUZyUBvWtTbGDP9d5hqRsEnSbteR8dludhPjNx0qlZ14bPQKhcwBy7jglXNKZr+tD9D+tjtRDGVfePI6P9njQZ4iJb2gVdJ4svB4SrRPnedOxp8MitfCcX9fd8EInCukRm0Kr6zVHf791jocb/atWdyd2MDNWmikyI2gSHwu+fV3uK34pHofopYNi81g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay3hcF9CeM9SMZQuVZtsHZTUxUiuPcnoG/aF8us2nIU=;
 b=PX5Pzs3EpghNEmrpCO9sZ3EVtx/XsgXyaTcPDFQ8P0s6QWni/r/QQAvgWaa/a1R/tT7A+OON7uMl8n8LUFdo49kCpgAEtLpFAv7e8OuejwfA8oXsGtGH6Pb2xP0B/JAKz5Y0Yn/obQGQWkfEF+0Z3F6S/6t0MuSvxQ/gzVOPDmghALcKZs8RLM0QgyBdNth9C6XY4bsyiPYQ134tN0iKB0+OlQLIXa09ODm80/Ad8Ly2eptUrL3Mk3+MQ5RJAa6jB2QdsImpCg8RpAdQFpC1rXOkR7R0aJUN6OsbRedbtju/+dJQa/hh97uZgBlnH8zlfplvv45T1wcSwSeZnu2qSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay3hcF9CeM9SMZQuVZtsHZTUxUiuPcnoG/aF8us2nIU=;
 b=z7nHkiJa3n3xBM1S3YATB18/phhINpEEAS4XTQ+nIsCxnwC3LFfD/zVFvjZ0lF2co09MsZYJcqiGqMXtquPAaTaNReGdLB6B6g5WlB1+KBcaJZvODhiOzKfplmLJFtp2dkHm8JI8MF2mZVwb+r9FKoZqI+V6suTqp1Ra7DtMHd0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEoRNdqFoEgq2Af614FDJPJQVw78tT3r8ZV+Cui8RB9sOikMVIEtcf/MokkTqCD1r/QenMO/tjz3HzDcCFDzz0rKM8ZGcOr8bd/Nuv+VMNPDqKsJI6VhlgwrfqU5XoYIEu7r6aF227XxPi07eu3ABdAazWgP2AapPmLU2NQ5B9WGNTHGXiSoAHrs3Hkn+XbwU9B+TUXFAooUOo9WT6bH2plgy6DJKhkA4J6irdFGEQ15pesfv9mZcdJ1eS6XmalGEHyhzrTOO0fc6I6+vrWxhLW9L/cOYLrVYv7cn7ohGHYRwMpfWyboVP6Q60Bng7BC+K8NPi3lInH2HZHsGmSx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay3hcF9CeM9SMZQuVZtsHZTUxUiuPcnoG/aF8us2nIU=;
 b=QI5duJDvcL/Hiudz/R3QWcLx5GdxJCbkIb6+HetxnC651yYzKFA37KYlP5Wd1vBzG3Tc6iU4d3FKfqi0uTJAkmklOSctZFPqUQA4w42LRPKQ+HXUN9FlsBthiLoV3qnO59zL3ghzjeJo4ZoAA2GXxWUZUI+GErEIQOb4sgKTb6owZDCq573VSqEE2o2BddGXuogosMtVNTSZ+9gOgZhcgkglGOrMucgSRZVjgbErFLbokHxD6XM1WFD3ob0+Q8LpzwwjvJgB7fSkMOj8fQAFxkzSHarClhqjUgd9GHY6yUkT/du9WINIqOD1hQZlsbm+tmZbxLEgBOAowqopCxXSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay3hcF9CeM9SMZQuVZtsHZTUxUiuPcnoG/aF8us2nIU=;
 b=z7nHkiJa3n3xBM1S3YATB18/phhINpEEAS4XTQ+nIsCxnwC3LFfD/zVFvjZ0lF2co09MsZYJcqiGqMXtquPAaTaNReGdLB6B6g5WlB1+KBcaJZvODhiOzKfplmLJFtp2dkHm8JI8MF2mZVwb+r9FKoZqI+V6suTqp1Ra7DtMHd0=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 1/9] xen/x86: introduce a helper to update memory
 hotplug end
Thread-Topic: [PATCH v2 1/9] xen/x86: introduce a helper to update memory
 hotplug end
Thread-Index: AQHYktq36ViOQfJ5uUWUa1pA0oRKx616pmYAgAFNx1A=
Date: Wed, 13 Jul 2022 08:22:47 +0000
Message-ID:
 <PAXPR08MB74209F2975388E5A181C12B09E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-2-wei.chen@arm.com>
 <115e36f9-fb73-9692-a6c6-35ad683805bd@suse.com>
In-Reply-To: <115e36f9-fb73-9692-a6c6-35ad683805bd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D6B7C1440B77784AA8C1C0B3B5A74605.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 85bc4dba-e0a6-48a1-0c4f-08da64a8e3a4
x-ms-traffictypediagnostic:
	DB7PR08MB3578:EE_|DBAEUR03FT013:EE_|HE1PR08MB2681:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FO6BeoP+e0KxrxNRXNl+4P9naztQXsllwdKy8uo66pcyXWDJQtqPv3hsOHjQaM71WtDKdrNaGv+njOYGObKUZdUXRyjsrJ+2HJtLIohlJk7gS+8+CctIvcCoiETwLKdtccM9c7G0XP2TmXTqnCJpnQBYjnIEAu1Nd049TDJzgEUH8/hXnx0ZYoPaN4xo0vTjoVpRaZ7OmTjKaggnh2PKwtpdG3n7IZZ6nwHHpXJWoKj+OZkJZ66j1wDguQHNgf8W7Y3BjXQfJSlzoInh4OHhLx7LaVN6OoaaQ/XipSFMZBE3x1gQaDH/fYQy/JFAU2AhgzeMG0oi6pnoShHvirv0w8VkARSs3aJpI0voxXGsI+axI3S+bHXGjAVNbWxjkAP/koeohRSXGrDSU+QSoFT1XxX7+m/QjYZVzqTN7TF1y+18VARvmbnb3HOC9KsbOBtdiDM9b7RAfOaJXiq2PNAffiZwiWFmOF9iWrk1vmHuoXF62uKN+ttlNrLs2rlC0HqZwfaURaPE7212Nn4T+MjTEo6CbNH+W+L8Ybl7/gEfZHua5iPy0JaowO8vwDKsqnzY7HDJhzNdP0jspYtCoFOfClJaKT/HYYmWOkWqf6Ei853TQjRc7/AiT77Egokiksf3BuEkq73S9BJAsjkK8BRDI7OQXCHHtyzW1+Lxm9iSV0c/A8/f+wqrVlul3cAyxO7VCISVwt55I4bACNcRXVxNnYSEZn4tZzq98TdhmCgfeLzL8i0zSRRZV/12CnKCjNb1kCCCf3slr8Pi9RiK0g8YeTbKJiW/c3W9nOd6Xv0FQarwns/dX0T4D/zumdX2XAM8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(52536014)(15650500001)(55016003)(54906003)(71200400001)(53546011)(5660300002)(316002)(7696005)(6506007)(6916009)(2906002)(76116006)(38070700005)(478600001)(41300700001)(9686003)(26005)(33656002)(66946007)(122000001)(66476007)(83380400001)(64756008)(66446008)(8676002)(4326008)(38100700002)(8936002)(86362001)(66556008)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3578
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0c23160-4050-40dc-e0a2-08da64a8de93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JFdqHQXYqdr6gHvZKGM9GMuOVNGiZxa9BRRaCgztpZFmGU82hCB9+tWNtIPRNr63FkQturmhBFSAmF9TcHV1oUDZ0ihIsQDrcHpffVTWbOjw03C4nu3yXjWT8SM9BdNTzHzMotzcX2p14TNbF95AXNZOz3vjzqB8ipCy17ZBJ+xefxV0pdJcOQo5r1ZjBqhbKDtihfjIYnIXqZ/YIapqzBcszEL5ol6q1w/yiud/s7s0xOnaOMuBXobDrrln4seXCycLueRUOsPp6Pi7qPlm3kuA7cIRh+KKdile+4fNiCcnaF4m9ElH3tqlQ1frw8WgcZwm/bBq3OomrXgirSKlQWje5iiVPoFlLfn4A9AltJVyu6fd+h1rsO0yGnE1KQvmzEydDVGs4G+SLYQNeNLaxtU+2A0MKXWy6xTO90L3/xL2CXhizUhiBR1uv7nineEjIR+c95rYSwf1a3XfkDfGAHQ8ht+mHV3BbO2gHb/WYJYp0Z5beu4gKyxkwOMTMXP2Oe90JcyAqoB271j9tpjuLNH4/RPhRXQ5Uewv6niyUxauVfP8Ld2uNOy45WmrrGd8CmUDffnrzx+ISUZCytr1n4kpp8tn6L+h7YbgMgXuLM2+DiGibfmcGnEQq0u5V9BGs6wU8zXcBqNrI34w0FGPsT/iiBecrlnqYH6r5pccoTCzDGb5v7k5BDJeKrQuzVuOelf19zpPO1QnBy54mGU4cg7bte2xrRXtVmsQYiH9rF7LfsjTnP/KHz1DFoJU29rGIAoPksfhgCVX3XZRac8Lk/5H4JS9ssMAzvJ0+Zp1QunbLMGobIh2SRNxkt5iqGSA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(40470700004)(36840700001)(46966006)(36860700001)(86362001)(40460700003)(41300700001)(82310400005)(81166007)(2906002)(8936002)(52536014)(82740400003)(6862004)(15650500001)(33656002)(316002)(478600001)(356005)(5660300002)(53546011)(26005)(54906003)(47076005)(40480700001)(336012)(70586007)(186003)(8676002)(4326008)(70206006)(55016003)(83380400001)(6506007)(7696005)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 08:22:56.2652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bc4dba-e0a6-48a1-0c4f-08da64a8e3a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2681

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxMuaXpSAxOTo1NA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MS85XSB4ZW4veDg2OiBpbnRyb2R1Y2UgYSBoZWxwZXIgdG8gdXBkYXRlIG1lbW9yeQ0KPiBob3Rw
bHVnIGVuZA0KPiANCj4gT24gMDguMDcuMjAyMiAxNjo1NCwgV2VpIENoZW4gd3JvdGU6DQo+ID4g
eDg2IHByb3ZpZGVzIGEgbWVtX2hvdHBsdWcgdmFyaWFibGUgdG8gbWFpbnRhaW4gdGhlIG1lbW9y
eSBob3RwbHVnDQo+ID4gZW5kIGFkZHJlc3MuIFdlIHdhbnQgdG8gbW92ZSBzb21lIGNvZGVzIGZy
b20geDg2IHRvIGNvbW1vbiwgc28gdGhhdA0KPiA+IGl0IGNhbiBiZSByZXVzZWQgYnkgb3RoZXIg
YXJjaGl0ZWN0dXJlcy4gQnV0IG5vdCBhbGwgYXJjaGl0ZWN0dXJlcw0KPiA+IGhhdmUgc3VwcG9y
dGVkIG1lbW9yeSBob3RwbHVnLiBTbyBpbiB0aGlzIHBhdGNoLCB3ZSBpbnRyb2R1Y2UgdGhpcw0K
PiA+IGhlbHBlciB0byByZXBsYWNlIG1lbV9ob3RwbHVnIGRpcmVjdCBhY2Nlc3MgaW4gdGhlc2Ug
Y29kZXMuIFRoaXMNCj4gPiB3aWxsIGdpdmUgdGhlIGFiaWxpdHkgb2Ygc3R1YmJpbmcgdGhpcyBo
ZWxwZXIgdG8gdGhvc2UgYXJjaGl0ZWN0dXJlcw0KPiA+IHdpdGhvdXQgbWVtb3J5IGhvdHBsdWcg
c3VwcG9ydC4NCj4gDQo+IFdoYXQgcmVtYWlucyB1bmNsZWFyIHRvIG1lIGlzIHdoeSBBcm0gY2Fu
J3Qgc2ltcGx5IGdhaW4gdGhlIG5lY2Vzc2FyeQ0KPiB2YXJpYWJsZS4gU29vbmVyIG9yIGxhdGVy
IHlvdSdsbCB3YW50IHRvIHN1cHBvcnQgaG90cGx1ZyB0aGVyZSBhbnl3YXksDQoNCkkgYW0gbm90
IHN1cmUgbXkgbGltaXRlZCBtZW1vcnkgaG90cGx1ZyBrbm93bGVkZ2UgY2FuIGFuc3dlciB5b3Vy
IHF1ZXN0aW9uDQpvciBub3QuIEFzIG1lbW9yeSBob3RwbHVnIGRlcGVuZHMgb24gaGFyZHdhcmUg
YW5kIGZpcm13YXJlIHN1cHBvcnQuIE5vdw0KZm9yIEFybSwgd2Ugb25seSBoYXZlIEFDUEkgZmly
bXdhcmUgdGhhdCBjYW4gbm90aWZ5IE9TIHRocm91Z2ggR0VEIGV2ZW50DQoobm90IHZlcnkgc3Vy
ZSkuIEJ1dCBBQ1BJIGFuZCBkZXZpY2UgdHJlZSBjb3VsZG4ndCBiZSBlbmFibGVkIGF0IHRoZSBz
YW1lDQp0aW1lIGZyb20gT1MgYm9vdGluZy4gSW4gZGV2aWNlIHRyZWUgYmFzZWQgTlVNQSwgd2Ug
d2lsbCBlbmFibGUgZGV2aWNlDQp0cmVlLCBBQ1BJIHNlcnZpY2Ugd2lsbCBub3QgYmUgaW5pdGlh
bGl6ZWQsIHRoYXQgbWVhbnMgd2UgY2FuIG5vdCBnZXQNCm5vdGlmaWNhdGlvbiBvZiBtZW1vcnkg
aG90cGx1ZyBldmVudHMgZnJvbSBBQ1BJIGZpcm13YXJlLiANCg0KT2YgY291cnNlLCBhZGRpbmcg
R0VEIGRldmljZSBub2RlcyB0byB0aGUgZGV2aWNlIHRyZWUsIGFuZCBnZXR0aW5nIHRoZXNlDQpl
dmVudHMgdGhyb3VnaCBHRUQgaW50ZXJydXB0cyBzaG91bGQgbm90IGJlIGEgYmlnIHRlY2huaWNh
bCBwcm9ibGVtLiBCdXQNCnRoZXJlIG1heSBiZSBvdGhlciByZWFzb25zLCBhbmQgbm8gb25lIGlz
IHBsYW5uaW5nIHRvIGFkZCBtZW1vcnkgaG90cGx1Zw0Kc3VwcG9ydCB0byB0aGUgZGV2aWNlIHRy
ZWUgKHBlcmhhcHMgbmVlZCBhbiBBQ1BJLWxpa2Ugc3BlY2lmaWNhdGlvbiBvciBhDQpmaXJtd2Fy
ZSBhYnN0cmFjdGlvbiBpbnRlcmZhY2UpLiBTbyBpZiB3ZSB3YW50IHRvIGltcGxlbWVudCBYZW4g
QXJtIG1lbW9yeQ0KaG90cGx1ZywgaXQgc2hvdWxkIGFsc28gc3RhcnQgZnJvbSBBQ1BJLiBTbyBj
dXJyZW50bHkgZXZlbiBpZiB3ZSBnYWluIHRoZQ0KdmFyaWFibGUgaW4gQXJtLCBpdCB3aWxsIG5v
dCBiZSB1c2VkLiBEZXZpY2UgdHJlZSBkb2VzIG5vdCBoYXZlIHByb3BlcnR5DQp0byBpbmRpY2F0
ZSBhIG1lbW9yeSBibG9jayBjYW4gYmUgaG90cGx1ZyBvciBub3QuDQoNCj4gSSBzdXBwb3NlLiBN
ZWNoYW5pY2FsbHkgdGhlIGNoYW5nZSBpcyBmaW5lLiBBbGJlaXQgbWF5YmUgInRvcCIgaW5zdGVh
ZA0KPiBvZiAiYm91bmRhcnkiLCBhbmQgbWF5YmUgYWxzbyBwYXNzICJub2RlIiBldmVuIGlmIHg4
NiBkb2Vzbid0IG5lZWQgaXQ/DQo+IA0KDQpTb3JyeSwgSSBhbSBub3QgdmVyeSBjbGVhciBhYm91
dCB0aGVzZSBjb21tZW50czoNCkl0IG1ha2VzIHNlbnNlIHRvIHVzZSBtZW1faG90cGx1Z191cGRh
dGVfdG9wIGluc3RlYWQNCm9mIG1lbV9ob3RwbHVnX3VwZGF0ZV9ib3VuZGFyeS4gQnV0IGhvdyBj
YW4gSSB1bmRlcnN0YW5kIHBhc3MgIm5vZGUiPw0KZGlkIHlvdSBtZWFuIG1lbV9ob3RwbHVnX3Vw
ZGF0ZV90b3Aobm9kZSwgZW5kKT8gQnV0IG1lbV9ob3RwbHVnIGlzDQphIGdsb2JhbCB0b3AgZm9y
IG1lbW9yeSBob3RwbHVnIHJhbmdlcy4gSSBkb24ndCB0aGluayBwYXNzICJub2RlIg0KdG8gdGhp
cyBmdW5jdGlvbiBjYW4gYmUgdXNlZnVsLg0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+IEphbg0K
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAt
LS0NCj4gPiB2MSAtPiB2MjoNCj4gPiAxLiBSZWZpbmUgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiA+
IDIuIE1lcmdlIHYxIHBhdGNoIzksMTAgaW50byBvbmUgcGF0Y2guIEludHJvZHVjZSB0aGUgbmV3
IGZ1bmN0aW9ucw0KPiA+ICAgIGluIHRoZSBzYW1lIHBhdGNoIHRoYXQgdGhpcyBwYXRjaCB3aWxs
IGJlIHVzZWQgZmlyc3QgdGltZS4NCj4gPiAzLiBGb2xkIGlmICggZW5kID4gbWVtX2hvdHBsdWcg
KSB0byBtZW1faG90cGx1Z191cGRhdGVfYm91bmRhcnksDQo+ID4gICAgaW4gdGhpcyBjYXNlLCB3
ZSBjYW4gZHJvcCBtZW1faG90cGx1Z19ib3VuZGFyeS4NCj4gPiAtLS0NCj4gPiAgeGVuL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL21tLmggfCA2ICsrKysrKw0KPiA+ICB4ZW4vYXJjaC94ODYvc3JhdC5j
ICAgICAgICAgICB8IDMgKy0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9tbS5oDQo+IGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21tLmgNCj4gPiBpbmRl
eCAwN2I1OWM5ODJiLi5iM2RmYmRiNTJiIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9tbS5oDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21tLmgN
Cj4gPiBAQCAtNDc2LDYgKzQ3NiwxMiBAQCBzdGF0aWMgaW5saW5lIGludCBnZXRfcGFnZV9hbmRf
dHlwZShzdHJ1Y3QNCj4gcGFnZV9pbmZvICpwYWdlLA0KPiA+DQo+ID4gIGV4dGVybiBwYWRkcl90
IG1lbV9ob3RwbHVnOw0KPiA+DQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBtZW1faG90cGx1Z191
cGRhdGVfYm91bmRhcnkocGFkZHJfdCBlbmQpDQo+ID4gK3sNCj4gPiArICAgIGlmICggZW5kID4g
bWVtX2hvdHBsdWcgKQ0KPiA+ICsgICAgICAgIG1lbV9ob3RwbHVnID0gZW5kOw0KPiA+ICt9DQo+
ID4gKw0KPiA+DQo+IC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ICoqKioqDQo+ID4gICAqIFdpdGggc2hh
ZG93IHBhZ2V0YWJsZXMsIHRoZSBkaWZmZXJlbnQga2luZHMgb2YgYWRkcmVzcyBzdGFydA0KPiA+
ICAgKiB0byBnZXQgZ2V0IGNvbmZ1c2luZy4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L3NyYXQuYyBiL3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiBpbmRleCBiNjJhMTUyOTExLi5mNTM0
MzFmNWU4IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiArKysgYi94
ZW4vYXJjaC94ODYvc3JhdC5jDQo+ID4gQEAgLTQxOCw4ICs0MTgsNyBAQCBhY3BpX251bWFfbWVt
b3J5X2FmZmluaXR5X2luaXQoY29uc3Qgc3RydWN0DQo+IGFjcGlfc3JhdF9tZW1fYWZmaW5pdHkg
Km1hKQ0KPiA+ICAJbWVtYmxrX25vZGVpZFtudW1fbm9kZV9tZW1ibGtzXSA9IG5vZGU7DQo+ID4g
IAlpZiAobWEtPmZsYWdzICYgQUNQSV9TUkFUX01FTV9IT1RfUExVR0dBQkxFKSB7DQo+ID4gIAkJ
X19zZXRfYml0KG51bV9ub2RlX21lbWJsa3MsIG1lbWJsa19ob3RwbHVnKTsNCj4gPiAtCQlpZiAo
ZW5kID4gbWVtX2hvdHBsdWcpDQo+ID4gLQkJCW1lbV9ob3RwbHVnID0gZW5kOw0KPiA+ICsJCW1l
bV9ob3RwbHVnX3VwZGF0ZV9ib3VuZGFyeShlbmQpOw0KPiA+ICAJfQ0KPiA+ICAJbnVtX25vZGVf
bWVtYmxrcysrOw0KPiA+ICB9DQoNCg==

