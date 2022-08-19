Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAB5599233
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 03:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389852.627025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOqPm-00012Y-6q; Fri, 19 Aug 2022 01:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389852.627025; Fri, 19 Aug 2022 01:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOqPm-0000zz-3d; Fri, 19 Aug 2022 01:03:10 +0000
Received: by outflank-mailman (input) for mailman id 389852;
 Fri, 19 Aug 2022 01:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAHB=YX=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oOqPj-0000zo-MK
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 01:03:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80084.outbound.protection.outlook.com [40.107.8.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae251bed-1f5a-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 03:03:04 +0200 (CEST)
Received: from AS9PR06CA0649.eurprd06.prod.outlook.com (2603:10a6:20b:46f::25)
 by AM0PR08MB3154.eurprd08.prod.outlook.com (2603:10a6:208:5d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Fri, 19 Aug
 2022 01:03:02 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::32) by AS9PR06CA0649.outlook.office365.com
 (2603:10a6:20b:46f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Fri, 19 Aug 2022 01:03:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Fri, 19 Aug 2022 01:03:01 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 19 Aug 2022 01:03:01 +0000
Received: from cfc94130a706.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 599F8E79-2582-4069-B6F2-E8C3E10567EE.1; 
 Fri, 19 Aug 2022 01:02:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cfc94130a706.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Aug 2022 01:02:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5247.eurprd08.prod.outlook.com (2603:10a6:803:10d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Fri, 19 Aug
 2022 01:02:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%4]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 01:02:53 +0000
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
X-Inumbo-ID: ae251bed-1f5a-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ePnGCxCNw+wQ5bQSd/WiIqNlwGhPvnxlvgVTu3TneYsbDMMvA5bfvrpcw94qat7l23c2sDRTTa3fEKiebYph+hgNxRAePrij+0xFIvlLlHtKKtJXM4RURNgakrKKJnUBJ8EdElc9O1VcvvSimGkw83IJz7mBL/w8gxCJ1EBEIiJUvFsDM5OVStXplVAfyuz5PQoCmUhG9MnKG8eORsERl3fgnmlAHr4Ks98T+AmRQ3A59Ir4gghgHOkaHoqxwpJKe3HBJQRKYBk66wa2HbG0YGPLThiqUtvK8sijxqD/tDZc8yQOaqWbpJgtgVDqb8NdJrb7L8DOSaUY6Zo8e1xSZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QEgKeZbNYvJBBY5kmdGAPNYeUcpwL9/4TMkWC9vfbw=;
 b=PEXxiyiPZ64AmiOxu6AZYzc78t0UUMfNkMtxQJDgndjo+9uxsvz70VAtmrolJKxW7329+NfOQtuQNb9qpmdpLgpaN6/enT1Gho2LbRCQnQAp07COgZfKRWxdlLTZ8P2588sDLMnirmb61qn+EOrsU/2W/+shMyi0xYhH1jOPpWqj9cj1J1qIyHcU4xK3QMcQ9+mAkoFpuNGPjj4UxPQQJga+huD9iaQ8VmlWdFbu+3wSv+ERejemg33M+U/TGgqpjl12dj3X41JkxoDVYvFuuUZiGnXlGTWuYi5RtFtEKZoshX3xGGFhkBCPDbOLslb/5/6wbC3yDep/aoKX0qazsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QEgKeZbNYvJBBY5kmdGAPNYeUcpwL9/4TMkWC9vfbw=;
 b=bUqduozQP1p7Kmum+TAAPD6n3t2Riq5AMpI2shqRYORj3UihMH7JaAAwIM1IvpjMHwLS77U3GilVUkpldhqoJWfsVvlfAU9xSMlFIFn8XLJcuxPcmgVe4RWRezqnL3wgR49hfdVQItXzUviR8htMWu/mhkPRq/zEhWbALT63Qp0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3hixYr2qCj8X+dpxv6w/AUEJ8a6vXwvU98iKz2k/VHKLoRI6R5ErWbPB8IMs4u15u8JPEk+cHe7A/TLr2aDrrgBfrTqbqvk4hkeaYs3Di1K+X8gp/aL5vd6lZECq7dkzkBU9lzNPsGTKIgecgMjg1+p+ocivYBm+jhECYqeFS2LkMppiT1OYci41aCgiTpNeqPtXXZu2IAFwDq7vFs8kpVxL7owKNyFA1uC3dviezjc7YVps+u3y//LRkPp3NfbXZqLkdXMyeIeGafIHhARxOX/dfRecjW62F2JuyNsvjT0oTRechrs2yJcWuQ2W2kKOZRgPerfFY0Q8s27j9IAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QEgKeZbNYvJBBY5kmdGAPNYeUcpwL9/4TMkWC9vfbw=;
 b=MuW5wzT306pIOfi3gIYZH+ah/OK94NTV4MZLhURe6/iBCBBe3AvuioHaxdQoNHk3KDt5VXbYeX+TFdp4bOzCZR0tgqswVBFizKZSwTh72XYGlSzS4sTc67Jo0u2Z99UhSTjoc/uhzFmO3LePCO6mlQ35oi7nt8OvYz1GWdsxIlzcGt/OqTgHLZjHM2F1dkVKx2GjryPv/ymuoBZc0BwiR3cSo/SfhHj5Y/KeJFwlWjKKTxLjr2zg6zGTU0/5gFy0j933M16lnL4xyE56i3iP/qX7dgSXfFPn6YIpNVzuqVweZAuJYYZAtwX1WfOoD3K+BEK3BIWqBh4hc2ijYn6/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QEgKeZbNYvJBBY5kmdGAPNYeUcpwL9/4TMkWC9vfbw=;
 b=bUqduozQP1p7Kmum+TAAPD6n3t2Riq5AMpI2shqRYORj3UihMH7JaAAwIM1IvpjMHwLS77U3GilVUkpldhqoJWfsVvlfAU9xSMlFIFn8XLJcuxPcmgVe4RWRezqnL3wgR49hfdVQItXzUviR8htMWu/mhkPRq/zEhWbALT63Qp0=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 0/5] x86/mwait-idle: (remaining) SPR + (new) ADL
 support
Thread-Topic: [PATCH v3 0/5] x86/mwait-idle: (remaining) SPR + (new) ADL
 support
Thread-Index: AQHYswLgEBgyLJ1ZH0yh+Kjbzu0UFa20oVcAgADEX1A=
Date: Fri, 19 Aug 2022 01:02:53 +0000
Message-ID:
 <AS8PR08MB7991031EE6E8C237D019F842926C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <b0a3960c-8d1b-556d-f4fa-4fa4c8597a7b@suse.com>
In-Reply-To: <b0a3960c-8d1b-556d-f4fa-4fa4c8597a7b@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DD762C16FD70B045B6415B099ACB3428.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: aa0609e4-e2e0-4324-25d2-08da817e90ab
x-ms-traffictypediagnostic:
	VE1PR08MB5247:EE_|VE1EUR03FT046:EE_|AM0PR08MB3154:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MxdDrNBYFciGsud+g48b2g4fMuuO5lJPM17s1wEaXEO7pabBWx5eFaYZR2MV3KTzVElwJc1/tYm4XAWgroNvaZOjL+/9/NKPL5rIQ2zcjALsN/o+ebGzD6o4bPT+InDWNFQV9SYOBZFxIhtTAENIAGb61Dhq1zB+o12Ek6hoWGeXsWTqUGLvoX/2rhimNAZIih+y1P5V1cHrGbVMs5v9noqCOY5IgLSEZ/PvwB7hJxzw2Tg0uqbjAcOTtzuuhkTxcQ91qeT6jhQFnR+mV8mAZSLmDkvwRAwspexnn6DvYbq1flxDr4FFfpbIG++jhHclWdBVwGxzIzPVpK4yt6goAeMYyu39zhx33Aq2OP8uFZJ7OJg5FT4z91OUM3bZSRVS5YQz2XZLOhoEt+/QrIO24lC3cIhGRql/Oh9W3wAvAgWxF4Jf8E57LQlM2RXaoZeTDJDBOJsKnt3PhX9+1Z5j8DQo8vB5VmAILleWEucUW6hdJ6Ai1J5nErvVbQiLl7dxPQkWFQdIOz+X5ReWyaDXqzxIqlfZKdMGAsj4m2b9bmuLlB5JvpRWLP/h1Z3i5MiuUSk9aw3htjhaFQ7lQOro9XZE1umdRbFXeba3vm5JbbKC9KTqf30bVNCkT97VdpwieHFN5uEaxJeejqhj+4NdAqMzlZwS/fiX+UwMU6sHP+XQHIqleaE3j2VS471FbHSeI7oCTC8ReF+eOKQ+jKvxa4rv+YYzcABydoe+Xd+sxsnQpY1N2+XlMiqoQQzhAbsA3iO83LPHz6xQ9p7uYmoK8g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(122000001)(38070700005)(86362001)(54906003)(38100700002)(8676002)(64756008)(66476007)(66556008)(66946007)(66446008)(4326008)(6916009)(76116006)(316002)(7696005)(2906002)(5660300002)(8936002)(52536014)(186003)(9686003)(53546011)(83380400001)(26005)(71200400001)(478600001)(33656002)(55016003)(6506007)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5247
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44f3f289-b7dd-449a-455c-08da817e8b74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TIgj1Hp9yxDuVCo9PKggrM0ATLVxPdYC37Watub0YKS6FTpIJNFr6RZyoepULp+eeZibzRMP/SE9lO/44rBwytZljYUSWDGNIuFVmKFmCBfRjH6C+wAPXHk8nVZdQgtpuNiLo1y1yrBxQ8qkPGKw9+/aamrt/6HZ0AAMg4wLCixv+NcvFTqDcuYnMkp8iZ3eoBaHY2qY3uTQfXD/McFqbbzyrTSWTofFfuRVwzwbKwtYxk5rIKuiNBmdZiVou/OzoNQh1c/b6ZZe2VQu0I1HNVjwvqcYGs9nExw4SGUbHi9HR4kYcZ0+AA7tsjEGgTqyjUg2uOKLRT9/KkJ3Pw77kTtemS62tN/xr0YzdQif5ZQ4hu0pW/G1z9Kr4uhru+dEfuew2Wv19T7znsZ2Rlexyl0Lyqw2kC3h4G2shKkG8YX0WYtS/tHpJI9h4VS+m96MS3kz+2YbeQnODlD/nlgKk2h5Xtx9zicLroO+pR6OL5fjJ7g6J9McvViXkBPTTD/0FYX8NtS1l8RZzgCWtq0u9FxnqOlRA8x28O+tm2BILkzYbtnOwh4UrDuDeqnrqwBR1w0s8dmOeciE+14PGPbts1JCKtLhiNCu8iZZyaHXT8bntQVo0Acuq967zGttvfCC4/ELWQl0V6lDTKI5d4BH1iBqnYWhsHNm6JxB1iKF8p75r5f/D1LCgm3Rhg47DU9uMxW56frTuY1JX2cbrGsS3AKaycAGQ9H1uOR+z0jlUwAizjsyxjfnrQunwp77jGb29BEAVocCEueFkqIwQFt9Zg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966006)(40470700004)(36840700001)(478600001)(9686003)(5660300002)(2906002)(40460700003)(36860700001)(6506007)(316002)(40480700001)(26005)(7696005)(47076005)(186003)(336012)(82310400005)(55016003)(6862004)(4326008)(82740400003)(8676002)(81166007)(356005)(41300700001)(33656002)(52536014)(53546011)(54906003)(86362001)(70206006)(70586007)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 01:03:01.8201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0609e4-e2e0-4324-25d2-08da817e90ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3154

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzVdIHg4
Ni9td2FpdC1pZGxlOiAocmVtYWluaW5nKSBTUFIgKyAobmV3KSBBREwNCj4gc3VwcG9ydA0KPiAN
Cj4gSGVucnksDQo+IA0KPiBPbiAxOC4wOC4yMDIyIDE1OjAyLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4gPiBOZXcgY2hhbmdlcyBoYXZlIGFwcGVhcmVkIGluIHRoZSBtZWFudGltZSwgaW4gcGFydGlj
dWxhciBvbmUgcGFydGx5DQo+IHVuZG9pbmcNCj4gPiB3aGF0IHdlIHN0aWxsIGhhdmVuJ3QgbWVy
Z2VkIChwYXRjaCAxIGhlcmUpLg0KPiA+DQo+ID4gMTogYWRkICdwcmVmZXJyZWRfY3N0YXRlcycg
bW9kdWxlIGFyZ3VtZW50DQo+ID4gMjogYWRkIGNvcmUgQzYgb3B0aW1pemF0aW9uIGZvciBTUFIN
Cj4gPiAzOiBhZGQgQWxkZXJMYWtlIHN1cHBvcnQNCj4gPiA0OiBkaXNhYmxlIElCUlMgZHVyaW5n
IGxvbmcgaWRsZQ0KPiA+IDU6IG1ha2UgU1BSIEMxIGFuZCBDMUUgYmUgaW5kZXBlbmRlbnQNCj4g
DQo+IHN0cmljdGx5IHNwZWFraW5nIHBhdGNoZXMgMy01IGFyZSBsYXRlIHN1Ym1pc3Npb25zLiBQ
YXRjaCA1LCBob3dldmVyLA0KPiBhY3R1YWxseSBjb3JyZWN0cyBwYXRjaCAxLCBhbmQgSSdkIHBy
ZWZlciB0byBrZWVwIHRoaW5ncyBpbiB0aGUgb3JkZXINCj4gaW4gd2hpY2ggdGhleSB3ZXJlIHB1
dCBpbiBmb3IgTGludXguIFdoZXRoZXIgd2UgYWN0dWFsbHkgd2FudCBwYXRjaCA0DQo+IGlzIHRv
IGJlIGRldGVybWluZWQ7IGlmIG5vdCB0aGF0IG9uZSBzaG91bGQgYmUgZWFzeSB0byBsZWF2ZSBv
dXQuIEluDQo+IGFueSBldmVudCBJJ2QgbGlrZSB0byBhc2sgZm9yIHlvdSB0byBjb25zaWRlciBn
cmFudGluZyBhbiBleGNlcHRpb24NCj4gb24gdGhlc2UgbGFzdCB0aHJlZSBwYXRjaGVzLg0KDQpU
aGFuayB5b3UgZm9yIGluZm9ybWluZyB0aGlzLg0KDQpMZXQgbWUgYWRkIHRoaXMgc2VyaWVzIHRv
IG15IGxpc3QgZmlyc3QuIFRoZSBmZWF0dXJlIGZyZWV6ZSBkYXRlIGlzDQpGcmkgU2VwIDIsIDIw
MjIgYW5kIGNvZGUgZnJlZXplIGRhdGUgaXMgRnJpIFNlcCAyMywgMjAyMi4gTXkgcGVyc29uYWwN
CmZlZWxpbmcgd291bGQgYmUgYXMgbG9uZyBhcyAoMSkgdGhpcyBzZXJpZXMgY2FuIGdldCBhIGdv
b2Qgc2hhcGUgdG8gZ28gaW4NCmJlZm9yZSB0aGUgY29kZSBmcmVlemUgYW5kICgyKSBvdGhlciB4
ODYgbWFpbnRhaW5lcnMgZG9uJ3QgaGF2ZQ0Kb2JqZWN0aW9uIHRvIGFjY2VwdCB0aGlzIHNlcmll
cywgaXQgaXMgZmluZSB3aXRoIG1lLiBBbHNvIGlmIHg4NiBwZW9wbGUgd2FudA0KdGhpcyBzZXJp
ZXMgaW4gdGhlIHJlbGVhc2UgYW5kIGl0IHdvbid0IGNhdXNlIHRoZSBkZWxheSBvZiByZWxlYXNl
LCBJIGRvbid0DQp0aGluayB0aGVyZSB3b3VsZCBiZSBhbnkgcmVhc29uIHRvIHJlZnVzZSB0aGlz
IHNlcmllcyA6KSkpIFNvIEkgZ3Vlc3MgcGxlYXNlDQpqdXN0IGtlZXAgdGhlc2UgMyBwYXRjaGVz
IGZvciBub3cgYW5kIGxldCdzIHNlZSB3aGF0IHRoZSBkaXNjdXNzaW9uIGluDQp0aGlzIHNlcmll
cyB3aWxsIGJlLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBUaGFua3MsIEphbg0K

