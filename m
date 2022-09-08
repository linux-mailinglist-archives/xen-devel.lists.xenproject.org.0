Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA95B11FF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 03:18:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402427.644371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW6Aq-0007IC-61; Thu, 08 Sep 2022 01:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402427.644371; Thu, 08 Sep 2022 01:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW6Aq-0007Fm-3I; Thu, 08 Sep 2022 01:17:44 +0000
Received: by outflank-mailman (input) for mailman id 402427;
 Thu, 08 Sep 2022 01:17:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oW6Ao-0007Fg-5C
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 01:17:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00069.outbound.protection.outlook.com [40.107.0.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 077488eb-2f14-11ed-a016-b9edf5238543;
 Thu, 08 Sep 2022 03:17:39 +0200 (CEST)
Received: from AS9PR06CA0262.eurprd06.prod.outlook.com (2603:10a6:20b:45f::16)
 by DBBPR08MB5978.eurprd08.prod.outlook.com (2603:10a6:10:1f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 01:17:31 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::9f) by AS9PR06CA0262.outlook.office365.com
 (2603:10a6:20b:45f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.13 via Frontend
 Transport; Thu, 8 Sep 2022 01:17:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 01:17:30 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Thu, 08 Sep 2022 01:17:30 +0000
Received: from 82e50276bc56.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3411AA1A-3D30-41F9-AD2B-FCC8BAD0B797.1; 
 Thu, 08 Sep 2022 01:17:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82e50276bc56.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 01:17:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB7550.eurprd08.prod.outlook.com (2603:10a6:102:24d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 01:17:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Thu, 8 Sep 2022
 01:17:22 +0000
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
X-Inumbo-ID: 077488eb-2f14-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NcjkWpANM7i0VASWKotOKI1JZ6FfufpzD52TUbRucFsFehyZEa0k5jAFA5FWHORModfJtCBFvsec3hjD+zvzS1/l/hWcgriP7su0v7aJLGFRabDt/5mIaB9VBcdW4oJluM4hdOppGgpIFPxtZvyOTsz5FT3a88ve2v9wBa0g88NhZCduKMs5ict7w3whI5VQM28/kg0p/w94eOTg/yBUOS7nbQJB2Sjy6DpDrRINkiXpvWjC3npG3Jeqv23pObvbC5C5yKd9i0QLijjdtNGldRUtiSuYVlnE2Dzkitq/7vbqmbWZ5zzaglufoOSBaX5Z208q4eW8XfiSpRIsiuM6eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7yDCSamfKK/lBbBhwu0TAL+0KunvxQ11SF8NZsaBHc=;
 b=KfveL7WtcqtqWSkkYFTeH/KtwP/tKkFsdwofcVimpwdoq98y4FHwKcbodYyFglLPjtnb7o9ImisAz+VVVa1Ltp7xbZU3UBB29K/P31sKpavwZMVLSHoOpS1wr3SbiiCZ1FXKGD1SDlx0hHyUUwWQUoDEJ/Y8gP9l1Qc7o7bzxrZv+cZ5IoJYVedRVrl9uQ7Yccm/HSIZ+TuPHQra0BObM/YFQHz2UfhcAWGS9mGchPN33Ipq68CKUGpW7k6hmIwCFMYJ5aflC92+R7zk7XqcrKvODLO+bo3Ihxj0Xlo/56se71sNpsNFwKYZ2OqWvO1iHAOoy8Cjfrb28LJWZTbfcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7yDCSamfKK/lBbBhwu0TAL+0KunvxQ11SF8NZsaBHc=;
 b=nM5YYexOcC+9TvU+xMVhFBAsN86p13OrlBgF6SARG45TW5a6MUoagSl+j62bpFyQe3s9jpLodVwYd5qgLXJxZh9mMaJz3RFc8VvVvDRYiuN1Nqpm+iIVgV/srIfnQYy65GhgWdRYbtCC4KZ9j+JJgUuR+SxPnvhoYHruuCkXNB8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWYpF1WW9Ah0s1IRDplyrScZGNmcwlwpGUZNmQts8hWV4PcEp/9a7KPpehQcbJwzw4iTSPLvRzkWjh4kw39IGTtZKeOFxsqG4lPyCuuzB2qB995Q6pT6ttsmX5p5vWWPXyqbINJkgCYw7MiVY995Ft+pk/InlfmQ2DuLoSM0pe2YzYNHSivHlecaPO46d3kdDQ6T7A/QttNT/8oUxJKjdgwRQqo8YKEToirkV5Ttnqe5J7svBZ2OazBOl2UsVQ9J/VTusiDQk75eVkSZhEhqLiq32OYgK9KEwGVWekSFmO1rzaU6zgHKy5VVV95SbKTFkCL4W4mi6pVgZzQyrcVdZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7yDCSamfKK/lBbBhwu0TAL+0KunvxQ11SF8NZsaBHc=;
 b=L8DwpyAQ0Cy5xbJTvrwT21xSrgvO921D+DoMtKuYHTjBCfBP/WQ/88cUEb6CXSsjKN1eAB5zNFGvS08EfndlUc2TPeqSecIMz3BwKQ8u2te46Hx6Z7eQAaiE6nvy4dKB4dEV0rM8rdZY2g02YRaO+P9FlOz14+GjGLiyz2QfkLwiqzrc/mBUIVUQXGLyMtey7uVD+3V4jlm4+KmdsCsrFxRPBG5BOeHuLvw2t8iykhfc8Lr+S3xJEfNVknATjgyUbHE2MSeMVQndXZhrruSrkvrC14RWbYnsU8zr9HA6HDmXsSQkJOoN+QbPeYRtrl1DUnvbHEcCL8p5S9hPd1YKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7yDCSamfKK/lBbBhwu0TAL+0KunvxQ11SF8NZsaBHc=;
 b=nM5YYexOcC+9TvU+xMVhFBAsN86p13OrlBgF6SARG45TW5a6MUoagSl+j62bpFyQe3s9jpLodVwYd5qgLXJxZh9mMaJz3RFc8VvVvDRYiuN1Nqpm+iIVgV/srIfnQYy65GhgWdRYbtCC4KZ9j+JJgUuR+SxPnvhoYHruuCkXNB8=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ7IYztv5II0KGaSuPgw9aFq3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAbIgIAABXCAgAAA4QCAAAB+gIAAARoAgAACMwCAAABysIAABM8AgAClgQCAABX8MA==
Date: Thu, 8 Sep 2022 01:17:22 +0000
Message-ID:
 <AS8PR08MB7991598098F337CDDD8B9DC492409@AS8PR08MB7991.eurprd08.prod.outlook.com>
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
 <39862a75-ed08-1289-0a0d-a2580f27fdf1@xen.org>
 <alpine.DEB.2.22.394.2209071646210.157835@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209071646210.157835@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DBAA8B47C99EF1419D7F0355DD4EFD9F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 170f7df9-8dc7-4b90-ff0e-08da9137e6b8
x-ms-traffictypediagnostic:
	PAXPR08MB7550:EE_|AM7EUR03FT045:EE_|DBBPR08MB5978:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ybLqx4LfC47UmOWvhMz+b/yU4rVPIqgmGBGvHWS2xwBZjVuFfY6JKNKKGBnONIvGh92xxXKxVYU4vt3L49aJnVz2e4bKnWSBgwNcprxm7tBccPSlG0wRUOoXcCLLSq1UQkJcl0lXYGbGoHfeQEgXw0GyUH/fKxUj+APTVJsCopsWfrbrmRTJCQBetNIi1FimgZaZBij+bq/wf7qkBHWiHRZQAGvqr2MlfEToYQPaT3EeQtSHEYkU4XR5jEB5xPU7d21vTInB8JFBZU9t2OBEuLAKLom3s1qgbXIdnrygGQ8cB5WMSLJYehQY5oM+9BKgd2TwyJ/R1kprGa5L/lxAunkonDCy1NeDsp9S5s66ziGX+rCUnjV+VsWxXQlf5Yb/bPzcOKPGs4gJaUtwdTtnwG75VB0Cn87ZaOZgtGiMAydg5fiWDPID66z0PQFUaV+B314VNNaWwkizZ/Ee77Sq48DBldTJjQlx+qOJWTI12okUXLBSboCphcA0T4dhVWlPOM2JjxQWH531VEDOIhnEGFtHYmYp08KEUgLKxGc4YKyc0KOeQ2E50mjtEeop2qS2tX22XuyeVUYuAG4Pw3VhDdVhPc9ERWC4TyoI4XyfqDKyFXEWocMWRAAEBKFAGxSG0JOBzFOJEtlp+zZNdr3eDKUtqKtyxMdlHEvB9hNviL0zB3+qljl648Rkh56YDhQQnwS+i1nsxU7E4dDG0m/I0yMEX+532JpbLQTPFNl5NR6MMuPN00ZFnGfpWmqYnnP0HhNnPmffwkGSYrpL4JoPkg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(110136005)(122000001)(86362001)(5660300002)(38070700005)(316002)(54906003)(66476007)(76116006)(38100700002)(66946007)(66556008)(2906002)(4326008)(66446008)(64756008)(52536014)(8676002)(186003)(71200400001)(55016003)(478600001)(8936002)(83380400001)(41300700001)(33656002)(7696005)(6506007)(9686003)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7550
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3eafa90f-0d6c-4681-a8cd-08da9137e1c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5IIuiLBTsLW7YWTYStd8lKyP99Jb0mU3JTnMMxowwtqrrZnXfDjLuOOCZLxmcH8oZl1FxIqxukGsgxPh/etZKaAnP614XiVtdg5n/N9SSWOnNdzscenuwzCB6F1nHGNQu/IF5grenmGekWpBrS7egEl7kQNk5x+ZrVqXV021/nIJ6Eyxkq2EoWZDCwBqU1y/SJcyZr17LUiy5Y/71P8BHsLz3Hw9mxI15kaR6HaPziENyIm1NaupKj/IOzs82uUnUqx4grb7jg/PrDRP1ljzHVfbQZ18ZrTh2/OPSOdRPH2iKx4YcEIUGQMi+2bOzUCK1xOucGTeGL805lnT9MRB9AlgKdX1h9UbFgJvb2dSTSeiT2YaNmeQ/mWX1rppbbItj19na9ivgGNzH59QZqOROg+JYdENOKbt5dSdcdA1RQIDBqo24WGkRvAP6va4PWZiJ8aIN35ZvM+BTkXuM/Al3P8E1N5+cvsIA8ijlNSaPWWekCX65BRklcLnC1Z2yM0sNP7TwwfT6MhSkmx7hsdgaMF/ufc8aZVRmybfsuCDF2fza80tb+8zh2Mu25KIfnZ1EiZrVGmSoSO0+p/I3rQiqepUu1LtTSX9sbCmvGB+CuFRFRC01b2E8+vpIkwOPf53Hgjc3eUTJOPUx6qdI7c1aDeIHVfDzX5jNXTDoV6+cYvH4Qq8FkV7ludf/lnm7CPaM2jVB2cyTmD7HRuML6jRoFupMCpOP+r91OjRIlj21BSm5t/FGyyuE0PI+hxl0ZMFMau/wMeO3Q/T6RETmEtcsA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(40470700004)(46966006)(36840700001)(5660300002)(40460700003)(7696005)(6506007)(478600001)(8676002)(4326008)(70206006)(86362001)(70586007)(8936002)(41300700001)(52536014)(33656002)(40480700001)(36860700001)(55016003)(83380400001)(47076005)(186003)(336012)(81166007)(356005)(2906002)(26005)(9686003)(82310400005)(82740400003)(316002)(110136005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 01:17:30.5990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 170f7df9-8dc7-4b90-ff0e-08da9137e6b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5978

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> > I would not block this series on the renaming for existing property (wh=
at
> > matter is the new ones are consistent with the discussion). The renamin=
g
> could
> > be done afterwards. I would even say post the feature freeze on Friday
> because
> > this could be considered as a bug fix (assuming you agree as the releas=
e
> > manager :)).
>=20
> I very much agree that we should be consistent. Consistency aside, I
> would prefer *not* to introduce #xen,static-heap-address-cells and
> #xen,static-heap-size-cells and instead reuse the regular #address-cells
> and #size-cells. I think there is no reason why we shouldn't.
>=20
> I was about to write something about it a couple of days ago but then I
> noticed that we had already introduced #xen,static-mem-address-cells and
> #xen,static-mem-size-cells. In order to be consistent I didn't say
> anything and gave my ack.
>=20
> But actually I think it is better to get rid of them all. I think we
> should:
>=20
> 1) do not introduce #xen,static-heap-address-cells and
> #xen,static-heap-size-cells in this series, instead rely on
> #address-cells and #size-cells. Please write in the binding that the
> number of address cells and size cells of xen,static-heap is determined
> by the parent #address-cells and #size-cells. (It has to be the parent
> because that is how #address-cells and #size-cells are defined.)

Ack, I will do in v5, also drop your previous ack so you can take a look
again.=20

>=20
> 2) Also remove "#xen,static-mem-address-cells" and
> "#xen,static-mem-size-cells", and also use #address-cells and
> #size-cells for xen,static-mem as well. I think we should do that in
> this release for consistency. Any volunteers? :-)

I will add a new patch in the end of this series for static-mem cleanup.
This can be merged later as a bug fix according to the discussion with
Julien.

Kind regards,
Henry

>=20
> It is not going to break anything because, not only static-mem is tech
> preview, but also it is very likely that if someone was using
> #xen,static-heap-address-cells it would be setting it to the same value
> as #address-cells. So in the vast majority of cases it would continue to
> work as expected (not that we couldn't change it anyway, given that it
> is a tech preview.)
>=20
> So I am aligned with Julien on this.

