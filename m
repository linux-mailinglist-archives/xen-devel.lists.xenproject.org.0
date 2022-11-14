Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8BF627744
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 09:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443163.697646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUcX-0002dw-S8; Mon, 14 Nov 2022 08:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443163.697646; Mon, 14 Nov 2022 08:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUcX-0002ap-Ow; Mon, 14 Nov 2022 08:15:09 +0000
Received: by outflank-mailman (input) for mailman id 443163;
 Mon, 14 Nov 2022 08:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouUcW-0002aj-74
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 08:15:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7270fee1-63f4-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 09:15:06 +0100 (CET)
Received: from AS8PR04CA0166.eurprd04.prod.outlook.com (2603:10a6:20b:331::21)
 by DU0PR08MB7833.eurprd08.prod.outlook.com (2603:10a6:10:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.5; Mon, 14 Nov
 2022 08:14:52 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::85) by AS8PR04CA0166.outlook.office365.com
 (2603:10a6:20b:331::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Mon, 14 Nov 2022 08:14:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 08:14:51 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 14 Nov 2022 08:14:51 +0000
Received: from 10f395130d89.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95DF9526-7590-443B-837E-6A9D6C6B544D.1; 
 Mon, 14 Nov 2022 08:14:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10f395130d89.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 08:14:46 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV1PR08MB8216.eurprd08.prod.outlook.com (2603:10a6:150:5f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 08:14:44 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5834.005; Mon, 14 Nov 2022
 08:14:44 +0000
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
X-Inumbo-ID: 7270fee1-63f4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QeU7Q5XY8wgxKxgipZkCubYiIEDkmm+QFGINvV3epsgKYSLfJNZ+oTt77stSqVfx1lK+nQWpjZvbHzHVc5vpXz6yheMs4kLQH/9hM6IsBCnDBdy8bxnWpwvvT7V+s0PqAhVIIXC63v0NPQw/0OwfiDLn9UBpAiMNMPOx/XQe/DCe/Oy14YsdiqCBqhBpwEIZILmmYG/6lQLwzKoVkYokhg2IdbfF91KThKQXQco9w42JCo5crvar9bQhIXetvqApBf6Oq97Cl+GKXtzzh9fDFvV3zMX2enGI6P7WB7WyrMd3kJsYUuNtZjaB2zS9yxsXhnVmaLC3HPJz3oxbBthl0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jykWMjFo6ItSlI6iXCvjyj9v3NJA994pl1+dKjvUtio=;
 b=AxnPNgA5yKJ51xgdXd45qGePijIgf/z1vpjM9MLiVMKXh6zAopMhZ9wBFHpd03J6fTAByaKjBSkPiyjPbkmpuydZwrUev1pv7ES6DU5Nn3v7VPlCjhncHoe5PDhEH+fJPYJCZlwOi/3SDaNAz2uyaqh7namGSzcITGVFydKjQUxCV1okeLUl12IZ0fpuAxUs2KTSTMhVucX6UmhLpoFbpyzLzJz90QWwA1MxOsdTo++AtTtFMuyWOj486zJjjaNxZIlGuFt+9dPJZK/SuApdZ1YqmeEHRASFcChxVgK4VDYPnVsqwCfSNTJNan1VSQrteCVlokldaZ81Fcv1jWBYgg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jykWMjFo6ItSlI6iXCvjyj9v3NJA994pl1+dKjvUtio=;
 b=crMFsA44XLDYv4upBpubgqWtn54f+c0bniY0BFGqNqUqnSyyqr+5NszH3w+HNLJuWV4+4Q+pT/4rbugQ7lKhVhQus6J2ecD7vlmtetpW1IJUBhRM85/T+5IJKXMTDJ5GBIbDFwE/42paKWUnZc6MDCvP6E8shCyt1GZvVKzh9ow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ+EZ2wfpKV5S+D2zlLwR5MW6Si/4D/tD9SmHLE/8DAddO8RlC8PhyiSG+/YyXiCeULWEEiLPf4DEBxJAegZYd4IXgik5v6PN+c+5Imaqa0w2BgRx3Sb9cqYHA1aknxHEHgimtQ7d91NA4gVv01rYRqoup2GuSx1ZYXSoQM0ycVSN7bwCivm0qJykNiIfAgLV7O2O+lc2jQfH5wHIKKCNLk7939KyrPRPqQX+wP31MGEDofYYXyoiw3Uqbrf6QL+wcf42lJhzvDqYj1FBfAjHWieGXYaEdgo6ErHV0XbG4zBlx+1W8CJJSHIIdWA2MzH0r8tLsrDzKjg8pNY0si7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jykWMjFo6ItSlI6iXCvjyj9v3NJA994pl1+dKjvUtio=;
 b=BTDbCJZzXWYREpuSZ8dd2kO71s0hs0oRv8BCrVjOt0hZWlrC/zepOkYHN5H2SbfDK3nFD5nxUY7M476i7Ki7LX+hREbPj9oaPjYYLZH1v+rdMgmhvtlRZbfEFlm7m5IEO+FfBXoyEhiDEyI1HIASOzmFlcFxjfgisURyGVGvuqco62Bjo1k+MbNcxSduEGzgQwmHfCtn7m28JGaVa6aVM1T9x0IgpNTOSe/K9uy7MJjCq/snPL+R4LCrKggRUJX3B0/m3zPZ8bvlAVK9H2vcUc6LlRNfraPvtQaMH3h2oKfQ3OxoNd75bdlgTIwckPKZFLiUWdNuyGDnA2W18iP/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jykWMjFo6ItSlI6iXCvjyj9v3NJA994pl1+dKjvUtio=;
 b=crMFsA44XLDYv4upBpubgqWtn54f+c0bniY0BFGqNqUqnSyyqr+5NszH3w+HNLJuWV4+4Q+pT/4rbugQ7lKhVhQus6J2ecD7vlmtetpW1IJUBhRM85/T+5IJKXMTDJ5GBIbDFwE/42paKWUnZc6MDCvP6E8shCyt1GZvVKzh9ow=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Thread-Topic: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Thread-Index: AQHY9/NBdTAzy3F6U0ar/3rX7ynbh64+D8cAgAABF9A=
Date: Mon, 14 Nov 2022 08:14:44 +0000
Message-ID:
 <PAXPR08MB74209231BFD7E8C3004C55A49E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221114063451.473711-1-wei.chen@arm.com>
 <3aa067b2-fa49-326a-c5a0-6735bc95951e@suse.com>
In-Reply-To: <3aa067b2-fa49-326a-c5a0-6735bc95951e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C49993FA732C9C4AB00A558200440B28.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|GV1PR08MB8216:EE_|AM7EUR03FT036:EE_|DU0PR08MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f35982-f186-44ac-89eb-08dac6184e3b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4d1fDC7fthejTXvZQ3mTiOk0Epe5iorUauLv0mXRyqjMIg0N7z41ZtWKiSjaWqhEczANdG/6KWm6Q+2oDATbjz4xgd4fCFC0rzGPSQYxHAummMTtf/nPtUT5VycZ8oL+4r/8rIPhX714h3E6o6KbSZB1e1ytVfqHyCp26l1xph5Ilc1Tk/4pq9/NkDWCu0zKrJTq7CQGFT9AXpc0jInCoNcSDdQL3959BXfbDWTbYbait7sbuEbpBwKVCYNqEHr9+QwmWopsQGwvqrbSHPiPokW9l2rpZjffW1vgivl5EKz/yi3iTy1B0/TllnsvIv5A2/S8cP00bAL+HAwv5tuMUGKVVehimm5Yu9rPgp25vFRejiPNaCXcqcaqpkF5xRMSwRfknkCrMTEhFGcb4W+z0xlczswk6N7y14/J7sUuCVq1supsuniFL9cGrk+he0g9CsyclfyzxUXntGYlyRb1C7wO1C+pLDWS4hzaEMWcf4xkbm3sGKn6baXVUgYwdvb/g2b3x1Kfh0oswsu2t9tj7Z+0UODPOJo5Ml8pT6FFnniTw+xd2mLeLWXusJrA4z+lWbMJIPwOtcX6hTp65OSy8RcwJWOS90/bjY0HuCjSY5uKAjOlhZ/NXN8RB9uotufiv3IzscKBVD1yrLeYv1Zmhjkr8fCbawq/ByCTSHu7t9VRehMr1p/+MNZGZyMU8AHVUJKPIStwvqnwpZFROLN755F9+GesXphPMLuVAe/6aTTLephBuOwVcD7GjCeDY92Zgt4Xwvvly2d6CcINxEJN5cj237rqW/5MW1zAiYnarrbanCD1FYk/+fz9UmWcyi7zdnfSQpcPIwExv3M5ATH+aw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199015)(9686003)(53546011)(186003)(6916009)(86362001)(54906003)(478600001)(55016003)(6506007)(2906002)(41300700001)(33656002)(7696005)(966005)(66946007)(66556008)(8676002)(122000001)(66476007)(66446008)(64756008)(76116006)(316002)(8936002)(38070700005)(4326008)(83380400001)(52536014)(38100700002)(5660300002)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8216
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa84583c-dedb-4e08-ca06-08dac61849b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UYPkP1QhVHqhzKcmhJ0JzG2yEOIb09jbXxqmVmZ4gyISxYeUYtE4V332GmctjGBoWgeI7GhfdMDSjKkAjZgEnpMBdPnkJv5+N++78h9+OvuV6mQ4D3BXL9ZDZrEnGbMPbVskHVQBkmj+fjAXT9q5sodxabJKwyKXYKIblMdSHPLuxRNsOseseK6unh48wyXjQkheEUfOtsdmVvkZIvlKtbBCdNKINochHZ8WYPsfOZWwFgcBbS3mXlAyKtmJeDodiGlI9qdxS8+nvq78qPgDavQXI5a/uoESoyUv0VSiOVpBYtuKSneSgB94u5LiCOHjT7kl1qpAfGa8GahgfuCRlTIw/rqhL2wFJVR6bFHSBAkQgzKHkTRhpRWwMpNvnBVDtI9a6E8uerPFprTU9AAOVqRj8LwJo4zpCuU4AHcebtNYJvcghaDGftMv7Gfxm448t7QzoG2Lx4aOzrUM9yc+gyQM4mRATWRUMNOm+7ZGsoygpkuQq4Ar3eTxz2BWt/HUkBGN+MmUwaT756hIcxuS8DAB4ZsXj8werr0V93zg2Fwn/m2cHZfU8WIRhwS2hQHhFn09QfRmmc7ERGjFs1csd1vIsxZLHt85zLUlavPlFLPa1+P5eZo4J/8hxYS4yUw/AGk4jOVMhn1bqTgmNkO3A4UZ/u9eKPLQbfoTmkroZ/whuasl2eZ/+oVWiiJ8OA0/+Ct5lIaaojBQVndMtW3JQJKJjB56uloFMFoqt/gRlTrbpGXv3FbjlGy4Zy77ykxH10Yk8HHDPIju1C3cogDxVUQ2cIWUgaXbJ6YRPZD0GFTK3khuiOlbmIZFdBbqrHsVOeXa7veWNbNEuJebYQhumA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(54906003)(36860700001)(83380400001)(86362001)(82740400003)(356005)(81166007)(40460700003)(6862004)(41300700001)(2906002)(316002)(52536014)(82310400005)(5660300002)(8936002)(40480700001)(53546011)(7696005)(9686003)(6506007)(26005)(55016003)(47076005)(336012)(70586007)(70206006)(4326008)(478600001)(966005)(186003)(33656002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 08:14:51.9761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f35982-f186-44ac-89eb-08dac6184e3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7833

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEx5pyIMTTml6UgMTY6MDUN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogbmQgPG5kQGFybS5jb20+
OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgR2Vv
cmdlIER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY4IDAvNl0gRGV2aWNlIHRyZWUgYmFzZWQgTlVNQSBzdXBwb3J0IGZvciBBcm0gLQ0KPiBQ
YXJ0IzINCj4gPiBTbyBpbiB0aGlzIHBhdGNoIHNlcmllcywgd2UgaW1wbGVtZW50IGEgc2V0IG9m
IE5VTUEgQVBJIHRvIHVzZQ0KPiA+IGRldmljZSB0cmVlIHRvIGRlc2NyaWJlIHRoZSBOVU1BIGxh
eW91dC4gV2UgcmV1c2UgbW9zdCBvZiB0aGUNCj4gPiBjb2RlIG9mIHg4NiBOVU1BIHRvIGNyZWF0
ZSBhbmQgbWFpbnRhaW4gdGhlIG1hcHBpbmcgYmV0d2Vlbg0KPiA+IG1lbW9yeSBhbmQgQ1BVLCBj
cmVhdGUgdGhlIG1hdHJpeCBiZXR3ZWVuIGFueSB0d28gTlVNQSBub2Rlcy4NCj4gPiBFeGNlcHQg
QUNQSSBhbmQgc29tZSB4ODYgc3BlY2lmaWVkIGNvZGUsIHdlIGhhdmUgbW92ZWQgb3RoZXINCj4g
PiBjb2RlIHRvIGNvbW1vbi4gSW4gbmV4dCBzdGFnZSwgd2hlbiB3ZSBpbXBsZW1lbnQgQUNQSSBi
YXNlZA0KPiA+IE5VTUEgZm9yIEFybTY0LCB3ZSBtYXkgbW92ZSB0aGUgQUNQSSBOVU1BIGNvZGUg
dG8gY29tbW9uIHRvbywNCj4gPiBidXQgaW4gY3VycmVudCBzdGFnZSwgd2Uga2VlcCBpdCBhcyB4
ODYgb25seS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggc2VyaXJlcyBoYXMgYmVlbiB0ZXN0ZWQgYW5k
IGJvb3RlZCB3ZWxsIG9uIG9uZQ0KPiA+IEFybTY0IE5VTUEgbWFjaGluZSBhbmQgb25lIEhQRSB4
ODYgTlVNQSBtYWNoaW5lLg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMi0NCj4gMDYvbXNnMDA0OTkuaHRtbA0KPiA+
IFsyXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMjEtDQo+IDA5L21zZzAxOTAzLmh0bWwNCj4gPg0KPiA+IC0tLQ0KPiA+IHY3IC0+IHY4Og0K
PiA+ICAxLiBSZWJhc2UgY29kZSB0byByZXNvbHZlIG1lcmdlIGNvbmZsaWN0Lg0KPiANCj4gWW91
IG1lbnRpb24gdGhpcyBoZXJlIGJ1dCBub3QgaW4gYW55IG9mIHRoZSBwYXRjaGVzLiBXaGljaCBs
ZWF2ZXMNCj4gcmV2aWV3ZXJzIGd1ZXNzaW5nIHdoZXJlIHRoZSByZS1iYXNlIGFjdHVhbGx5IHdh
czogUmUtYmFzZXMsIGF0DQo+IGxlYXN0IHNvbWV0aW1lcywgYWxzbyBuZWVkIChyZS0pcmV2aWV3
aW5nLg0KPiANCg0KSSBqdXN0IGFwcGxpZWQgdGhlIHY3IHRvIHRoZSBsYXRlc3Qgc3RhZ2luZyBi
cmFuY2gsIHRoaXMgd29yayBoYXMgbm90DQpHZW5lcmF0ZWQgYW55IG5ldyBjaGFuZ2UgZm9yIHRo
aXMgc2VyaWVzLiBJIHNob3VsZCBoYXZlIGRlc2NyaWJlZCBpdA0KY2xlYXIgb3Igbm90IG1lbnRp
b25lZCB0aGlzIGluIGNvdmVyIGxldHRlci4gU29ycnkgZm9yIGNvbmZ1c2luZyB5b3UhDQoNCkNo
ZWVycywNCldlaSBDaGVuDQoNCj4gSmFuDQo=

