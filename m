Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9214D5B05B8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401817.643768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvSV-0002RB-SU; Wed, 07 Sep 2022 13:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401817.643768; Wed, 07 Sep 2022 13:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvSV-0002On-Pj; Wed, 07 Sep 2022 13:51:15 +0000
Received: by outflank-mailman (input) for mailman id 401817;
 Wed, 07 Sep 2022 13:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVvSU-0002LN-Al
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:51:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22f1de71-2eb4-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 15:51:13 +0200 (CEST)
Received: from DB6PR0301CA0088.eurprd03.prod.outlook.com (2603:10a6:6:30::35)
 by DBAPR08MB5717.eurprd08.prod.outlook.com (2603:10a6:10:1ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 13:51:11 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::7d) by DB6PR0301CA0088.outlook.office365.com
 (2603:10a6:6:30::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 13:51:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:51:10 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 07 Sep 2022 13:51:10 +0000
Received: from 39a450b41e0a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 13BF524A-1A07-42C7-8D07-1F709F2F5146.1; 
 Wed, 07 Sep 2022 13:51:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39a450b41e0a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:51:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB6249.eurprd08.prod.outlook.com (2603:10a6:10:203::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 13:51:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 13:51:01 +0000
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
X-Inumbo-ID: 22f1de71-2eb4-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ghPgPktXz1x87sYSt0/dVL+e84m7RNrVAUcFenUC7QiOPOi2iFQ9VgCUi92zE17xpcsULsGKwCjfxWKXTlT3872H7ZzwngeRgKwKg8xTxtHpqdeCvhYd5GN+jeEatMo4il0+VasVQuPBIeLHzG/YsAkzypKijQ0MADniLPWMLfClcs68mrrms5jV/Bl4z+O9zs+qXMqLZ731OIU4cVVSp3s86AmAkpeTsHV7qJ++UY1E7PsJL8P201U8hyIOS5CXUkhXI9S9IWaLdDgKODP2rNDOOni7ohZ6pNw4GAjJ48WkrKVfouogYasOwDSe+qRinxa9KGWvjzE02qUbRVcueA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sO8nRLsNDjEbo/d5LmyjqEEzabWFl8xVanJD1nqwjX8=;
 b=l9HSuer/SCj0nKT4cRxgLgI6729bfYK1pN8iOE+GPuyUUCSKWSEvohWeNiBRUwU343N4eaClUOr48Zdk4ZIs9g/yyUQ9G8j81s7uiH6VeTlAVMr7M43etQrJ4wddEYss8wc7fDTOPH7E0XFB5wTm2wGHZtDBf3fmYPStHmI/y7IKeWLrBUr4wzHg45YgPtdWjel5POW6qM0xvhE/8yZUCfkYYcK6TL4VFYeku5UfRLEomySf5Dni7YT8WMzZs86nfXlh+rT2oOA/f5Tnpg81NQ9i5lDracpDeK6fdb+R5MLzuPfRYPmDumFxxblIv6BlsBW9iBIsRVHLRxX2YRNbkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO8nRLsNDjEbo/d5LmyjqEEzabWFl8xVanJD1nqwjX8=;
 b=efv6XjcFEPWgrwtfYny6rU+Pkm5l3gWBCgHwzunkcQ7Z/6gott9LYLk9FO+jNCdvGksJcMplV3+kFIvU9XqWcy3DclcvEYU56+9ceqX9GWHjoOUwy7Wouq6PKYOCgZIEQ+DwLWDwUbKTKoihAs4b+cWZv3uBllaJnU1BkzIOWIg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dfc09e8ce122878b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1LfcjrOm0LdMl3ZubyPEbvVjh2CJFixI36uN4hNtvJ6RA8sKGBBM+tRFqN0rUrHs25w61+i168PDVqrHEVkmuZxcItl117U9Y3loUZQYsXXzCAgiIYKY9B26tBl9GfMqd1bjoX49EjHy9L4H0lN03QLSgYrQ8J+ZmByTqgBU3vf8uVamwPQzcej0y8dWlRaoNUC9EyMyGsCcWbVwG37w1ldlQQ1itntihWxjXM/I6RDu54EV35NRc7onhTkOuSHDz2HfRQEJglpfHcRrAKmA+ttdAkQ4r9GJaaMLr4Fth7GqU8InALMXt0Vkq7zhfl4n23wxlLzunV1EZSUnzzcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sO8nRLsNDjEbo/d5LmyjqEEzabWFl8xVanJD1nqwjX8=;
 b=FORppwTnDoH6+X93H9Pt3V/R3jbbaPVVUR2MAdd+s/nQOygQCVgKthYmZkGt0JQCgXNnOICKisuw6swf97hLiF334NDEg93+3IqaxL133Ecoru/431kaRHS7unEshpKxzh0VCWvpchgCj3j+W93q5LFazCfc9fb43wxpZtjjxIepVqgYVaMLR2dDl6BBjj6CjbJU/BmqkaI/naLhdlgasVcHlGi1RR/6e8/29jOwVUviGQCLK08fFif4dhsNDj/Br4vJN94sDrSbTKe9DoIVYI2WdIxt9E+VnkBXlPY2JpFMuqLgmzfxJIeWp2QCsieImDZCHM937s5oJYLwPa3GYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO8nRLsNDjEbo/d5LmyjqEEzabWFl8xVanJD1nqwjX8=;
 b=efv6XjcFEPWgrwtfYny6rU+Pkm5l3gWBCgHwzunkcQ7Z/6gott9LYLk9FO+jNCdvGksJcMplV3+kFIvU9XqWcy3DclcvEYU56+9ceqX9GWHjoOUwy7Wouq6PKYOCgZIEQ+DwLWDwUbKTKoihAs4b+cWZv3uBllaJnU1BkzIOWIg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ4p6pfICa8EGhkwL2mg6iHK3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAbIgIAABXCAgAAA4QCAAAB+gIAAARoAgAACMwCAAAEagIAAAG6A
Date: Wed, 7 Sep 2022 13:51:01 +0000
Message-ID: <64B45AE5-1D8B-44BB-831B-73B5C2B785CA@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
 <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com>
 <eed26206-9684-4010-278c-14ed3602582b@amd.com>
 <759E29A4-AADA-4678-A88B-E96C5C15A462@arm.com>
 <AS8PR08MB79916A5189182179F6BEB29192419@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79916A5189182179F6BEB29192419@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 87bcf517-a87d-4feb-40a7-08da90d805a2
x-ms-traffictypediagnostic:
	DBBPR08MB6249:EE_|DBAEUR03FT026:EE_|DBAPR08MB5717:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 edkQMO5x5n4IDBVF4uwAxg0/vNhtOVJBYQpJIT4VU3z6PYeI3fel25lD5pnG8s69jBwsyyLzUcdAfvbRo6pQJcXXOVr9F2rbil4aDBboMur4k/mDjHZnIDZnWBe39rt8nDndGjfNzLOI4o/PClfSXIm/xOP+PiFyr9XWY/vj9eZm/s7N3aaAq8kkRFwaukefea/5D7ElZyOVEDqnaJDETVu87arSz4qNygUaIIpnu/HPsjgdVCL5mAarZoWD4bNpARPxi+swOSC0TdRwT20+bEO4vmUNXsWk2Hz0zncpjht6ni0zio2BvTi2Gre85Q+9BQXeAbuhCCj/Ic6QbY8sq0/5yKMtVUVetqcLOJF4ra1sMb1LEEgXiot3JKdnWg5pbB4qXsJ3TgJNDJ7vvH7nf7VcPbwdxWDQYdXnlcIlukSM+Aagy/y9YBStWY49WyCuf31NhBOWb9DaguJCZoa2i8EuZg1s9IdA7uUi0qxbapxlLQD0DL9FURXJe7WdJSz4ln6bDKSklQ7brdjHeHwPpfYh2jtI0yPdVZcrEtqyRUoBAKY6uIICf5nBqBTAQXF250VjJx5F5d0RnxdELa/2gUUte9ZW7FFzBrqOQ2nRwJ2tLLK2wJm51XUkN/JdjD7nBnt6kk2BydPJ/PmjQAY/KAmQJW3SLaExRBtG6xtuQ/3sNtKLj7CBFn9ZcY3paMTW9JWlzD0l3GWL0ULfPm09DK6945gg8641STUQgAlEqKWnooU/WzyKm6ztjCx8+r8nqcwsI5EEXsDeoXNrzq1IwAA5jXXwf/o0A7uYmHybE8s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(5660300002)(37006003)(316002)(6636002)(54906003)(33656002)(66476007)(76116006)(36756003)(64756008)(2906002)(91956017)(4326008)(8676002)(66556008)(8936002)(6862004)(66446008)(66946007)(478600001)(6486002)(2616005)(41300700001)(6506007)(186003)(83380400001)(71200400001)(26005)(38070700005)(6512007)(86362001)(53546011)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <247D7BCFB7474F409EE277922550C5FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6249
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e482851a-d9fe-4115-3e7e-08da90d80043
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XsJQM86vCiqbN3Y1NkNQ1KeUmhJOX6hq/lE8K2QHNuPCJI0IMIuBcvldSL4zJY633t+4v9LB7FDK4fiZyz6XEQ7uwBfl9TWrEgJubB2Ovbf//Ku+lroNWrqwHo2C3EADILproP8W01i72ABOUUZUCGaM7xGq5ATHT+n8nH0CnhQlV6WnbsrQRisvrbSJAvozz9rdVw2BY2fEY+1JtnlNedj3fJXQUsR4L2q6XMPTurj/ju52XpvsVHO4tBhL5z9Go6ajevAauCuPGrmxluvcts5kvIPAtwvbiy1FgdTgwzi6SPqyPbp5kvNgT239xcwR27EsiupULTVku4K5uWOzAoxNusxCJ6fcRDglVos9BCIKzS2H6iU3PiMgy/3QxmslZulsFCz9L+Y1G4R96IWhVBZDuZ3jpY9tLPxyiBlc8dJLKK4Qn/KuDgFKf5XKUC+dXtXmkKjIivUSB3GnAqM64D4rT0H83vDbqoDhiyWoiwIaEoKZ4XF9Wk5OY+INdHl18RxZ43MXERi8krJGx/nenJZ3ZKAcs2Ldr0oe2hLtUMGAIG40x4PtyN6dVAGM3hq4VfU5rkE/oTlfIjqimGoIKisJsjjVITsRTj4M6td/XehKJDJC1KDxGbrX5SKRGF7HJPOTSnHfbasvCf3Hsa6ax6RuXbCjTM4YzkCpuYLACwbA3AWcWsB4jLnyYaqwD4hEuPwSoS28Zdwr02wLumOIdrXYJdPocrhgocIBW2LFhAnXnM2ul/PcMa3qlWPPGDx6wxJo6uarCBjbNJIytBiy+Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(40470700004)(36840700001)(82740400003)(82310400005)(86362001)(36756003)(6636002)(2616005)(37006003)(54906003)(186003)(40480700001)(316002)(336012)(6862004)(6486002)(8936002)(47076005)(70206006)(70586007)(478600001)(5660300002)(8676002)(4326008)(6506007)(36860700001)(81166007)(53546011)(356005)(33656002)(6512007)(83380400001)(2906002)(40460700003)(26005)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:51:10.8045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bcf517-a87d-4feb-40a7-08da90d805a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5717

SGkgSGVucnksDQoNCj4gT24gNyBTZXAgMjAyMiwgYXQgMTQ6NDksIEhlbnJ5IFdhbmcgPEhlbnJ5
LldhbmdAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCBhbmQgTWljaGFsLA0KPiAN
Cj4gSSBkb24ndCB3YW50IHRvIHNwYW0gdGhlIGVtYWlsIHNvIEkganVzdCByZXBseSBoZXJlLi4u
DQo+IA0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEJlcnRyYW5kIE1h
cnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4+PiBCdXQgaW4gYW55IGNhc2Ug
d2Ugc2hvdWxkIG9ubHkgYWRkIG9uZSBwYWlyIGhlcmUgZm9yIHN1cmUsIGFzIHlvdSBzYXkNCj4+
IHRoZQ0KPj4+Pj4+IG9ubHkgaW1wbGljYXRpb24gaXMgdG8gYWRkIGEgY291cGxlIG9mIDAgaW4g
dGhlIHdvcnN0IGNhc2UuDQo+Pj4+PiBJIGFncmVlLiBUaGUgb25seSBkcmF3YmFjayBpcyB0aGUg
bmVlZCB0byBtb2RpZnkgdGhlIGFscmVhZHkgaW50cm9kdWNlZA0KPj4gcHJvcGVydGllcw0KPj4+
Pj4gdG8gYmUgY29oZXJlbnQuDQo+Pj4+IA0KPj4+PiBBZ3JlZSwgc29tZW9uZSB3aWxsIG5lZWQg
dG8gZG8gYSBwYXNzIG9uIHRoZSB3aG9sZSBkb2Mgd2hpY2ggbWlnaHQgYmUNCj4+IGVhc2llciB3
aXRoIGFsbCB0aGluZ3MgaW4uDQo+Pj4+IA0KPj4+IFdlbGwsIG5vdCBvbmx5IGRvY3MuIElmIHdl
IGRlY2lkZSB0byB1c2UgYSBzaW5nbGUgcGFpciBvZiAjYWRkcmVzcy1jZWxscyBhbmQNCj4+ICNz
aXplLWNlbGxzLCB0aGVuDQo+Pj4gd2UgbmVlZCB0byBtb2RpZnkgdGhlIGNvZGUgdGhhdCBleHBl
Y3RzIGRpZmZlcmVudCBwcm9wZXJ0aWVzIGUuZy4NCj4+IHhlbixzdGF0aWMtbWVtLXthZGRyZXNz
L3NpemV9LWNlbGxzLg0KPj4gDQo+PiBSaWdodCBJIGZvcmdvdCB0aGF0IHNvbWUgcGFydHMgYXJl
IGFscmVhZHkgaW4uDQo+PiBTbyB3ZSB3aWxsIG5lZWQgYW4gZXh0cmEgcGF0Y2ggdG8gaGFuZGxl
IHRob3NlLg0KPiANCj4gSSB0aGluayBJJ3ZlIGFkZHJlc3NlZCBhbGwgY29tbWVudHMgZnJvbSBK
dWxpZW4gcmVnYXJkaW5nIG15IHNlcmllcywNCj4gc28gSSB0aGluayBJJ3ZlIGdvdCBzb21lIGJh
bmR3aWR0aCB0byBkbyB0aGUgY2xlYW4tdXAgcGF0Y2ggdG9tb3Jyb3cNCj4gYWZ0ZXIgdGhlIGFn
cmVlbWVudCwgdW5sZXNzIHNvbWVvbmUgd291bGQgbGlrZSB0byBkbyBpdCBoaW1zZWxmPw0KDQpU
aGlzIGlzIHZlcnkgbmljZSBvZiB5b3UuDQpXZSBuZWVkIHRvIGNvbmZpcm0gZmlyc3QgaWYgc29t
ZXRoaW5nIGlzIGFjdHVhbGx5IG5lZWRlZCBvciBub3Qgc28gd2UgbmVlZCBTdGVmYW5v4oCZcyB2
aWV3IGhlcmUuDQpJZiBzbyB0aGVuIHBsZWFzZSBkbyBpdCA6LSkNCg0KQ2hlZXJzDQpCZXJ0cmFu
ZA0KDQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IEhlbnJ5DQo+IA0KPj4gDQo+PiBCZXJ0cmFuZA0K
Pj4gDQo+Pj4gDQo+Pj4+IENoZWVycw0KPj4+PiBCZXJ0cmFuZA0KPj4+PiANCj4+Pj4+IA0KPj4+
Pj4+IA0KPj4+Pj4+IENoZWVycw0KPj4+Pj4+IEJlcnRyYW5kDQo+Pj4+Pj4gDQo+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBDaGVlcnMsDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IC0tDQo+Pj4+
Pj4+PiBKdWxpZW4gR3JhbGwNCg0K

