Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6585B04C2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401667.643574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuo7-0003W5-WB; Wed, 07 Sep 2022 13:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401667.643574; Wed, 07 Sep 2022 13:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuo7-0003PG-QW; Wed, 07 Sep 2022 13:09:31 +0000
Received: by outflank-mailman (input) for mailman id 401667;
 Wed, 07 Sep 2022 13:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVuo6-0003Jk-Ko
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:09:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80043.outbound.protection.outlook.com [40.107.8.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e70cfc2-2eae-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 15:09:29 +0200 (CEST)
Received: from FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::22)
 by GV1PR08MB7732.eurprd08.prod.outlook.com (2603:10a6:150:53::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Wed, 7 Sep
 2022 13:09:21 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::8e) by FR3P281CA0029.outlook.office365.com
 (2603:10a6:d10:1c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.13 via Frontend
 Transport; Wed, 7 Sep 2022 13:09:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:09:21 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 07 Sep 2022 13:09:21 +0000
Received: from e411e0bbb69c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9017FDC5-428E-4B2A-9FC8-9D6B1E9983B0.1; 
 Wed, 07 Sep 2022 13:09:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e411e0bbb69c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:09:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7422.eurprd08.prod.outlook.com (2603:10a6:10:371::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 13:09:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 13:09:07 +0000
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
X-Inumbo-ID: 4e70cfc2-2eae-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PkNk1rMEfdkOyAoG0XNCLu1t54VV1POCYWJrOD2B6092Oq3/PZZ9bAitOUXP29nQugo7MlUyJUSbIjSJNgysjAXBghKF5E/YUaTe/IHgFispDc8jLd9L/qIJQjkaOQX52gmElwJSllAnNyMvyKLqkwldOlyQfXllglce/T62uAqb7nYzjMeOmm8vFfo7tbfFmhIM4NgMf4uKhlGizShbcBoPk5vSL+biaZOicEbaSg8EwgHEYwyFRS8HrQwz1lm52EeB6U2eZtUi9VDf8Xso1uaDlW3ComJofi49ltpdIYd6jG1bZMHPHJij+YCgAs2ZBp+FjnABj99A9XPj9++3tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pu90OKSD6I9CjvlJHqdkQC2NU9v6LeR4717/HITzoyo=;
 b=Yt6KZT15aCDKIp+I8YYYbPU0K3BQ6Qxag/o3cglq7W5woQDkaAD+vtyNJqco9YxXtuntXKxVc4TmBAheVoPNYAPXlSrMgPrE12HoD0nss6Ct2sqvs3n9jQT7OXefyk5MR9t6ZFM0Dbavez/oBStiTnMiWMkOGcyx850M2+bCTxeBYShERMmUslIdcID53m5Ncz56VYXxh9dQeAjM0qii0ra0Rbv/qEWUqQuofY0qhuaPPV2Wix4w/Lo+q/9JLirdpIvolagMgXvaX4RPjxgQzEnUZrzF+0f/9eehQXY6Mi2cUwmG/685q7QRRrbJuqQ6XWzcpYeD11saoHhyKbWtQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu90OKSD6I9CjvlJHqdkQC2NU9v6LeR4717/HITzoyo=;
 b=cIOj4zNhFY8wqBEmsjmfK6nhqnCAdxdgWrnptNveSgUTjJ49K2Qd74BQ9ig91mkKmaHnkE+I7czFIxbdSoyOz069uLUIu5BfYRLwQibmQ9Mb3muWNt1/ASDFp+bspfk6hRlHE4LvnwxQzyxftByW8yuNr0eYsFOQtSqPo4hcvUs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3c69b11ac487930d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGF7T1Bwsta672YT6KledCZPIAXNUebUYOTqPlYJUm1XFx7XJPMtmaCJbuV7Se5jc/idmn8VGfFLaZvsZ1DNgnvhxzAANcAUBh4zwSbKEBSVx76Vb57jgJtaTwxUynU+/BZcfdnDIeV62cKpU9qM0wlZC9hkVjiUFXEDwQrjHPagmj5v0kCEwlWVhCy240OkAQNYluqbM4LbKhQFbQf02ACMrFynbYeDC0kOCdwblCQU6UcT6K0Dg452To3IoiywxUCjh+ABW126GqYIHv807yW7SsfBK3ib9fKr3EuSpbIRzHUZ9IuCEv3tBVtHGbvlHNrlZpohe2NLt8x2EbJoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pu90OKSD6I9CjvlJHqdkQC2NU9v6LeR4717/HITzoyo=;
 b=RpzvxUomOqNcmdWrdJoUuzHGNSQK+CaOjToelJgO0gKAitn/yUJUzJeZwGOML6NaCRAHrbJ8m4q0ss4yajViEWj9/jVH0x8KRKhJBMrLHZITqZU/J0/UkPCxv8toHHtzWDu8dMtFItg6FHDrtGwqm7xV/g65HdTI6XjU1YSWoaXdQ9iy52E1Pmr5ooZBajGixwhmdap6/ixorrOpmlh15WzWVUa6YbzpNu/oeajok0WK/xsm/dWi/YRllhXwpjzuwR7uYxmVyTnaB5W+Cfk2ZNIN9VG5DXpm8QqeVGrzDom+6A8LrbiTiLLi4NJMNwv8WuslbvCyC+CGeJQDUZUUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu90OKSD6I9CjvlJHqdkQC2NU9v6LeR4717/HITzoyo=;
 b=cIOj4zNhFY8wqBEmsjmfK6nhqnCAdxdgWrnptNveSgUTjJ49K2Qd74BQ9ig91mkKmaHnkE+I7czFIxbdSoyOz069uLUIu5BfYRLwQibmQ9Mb3muWNt1/ASDFp+bspfk6hRlHE4LvnwxQzyxftByW8yuNr0eYsFOQtSqPo4hcvUs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ4p6pfICa8EGhkwL2mg6iHK3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAa2AA==
Date: Wed, 7 Sep 2022 13:09:07 +0000
Message-ID: <08B04F1C-FA10-4A71-A251-64ECB3C97F48@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
In-Reply-To: <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7eb8f7f2-c693-4409-3775-08da90d22dd9
x-ms-traffictypediagnostic:
	DB9PR08MB7422:EE_|VE1EUR03FT006:EE_|GV1PR08MB7732:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3PFSCzvX8jVjnH5DfpEG5EUmQp/dttu432Jg1bpoZ2dx3L2EVKISz14sdYLT15WUFeuGDPeVyelCosoDoYelSwmVfO6xSR1GqHYDE2D0SUfR66Af6VIbAGYqB5Pkp5L6cyZ8+DdQsrI5bOD80OB5Rd23mIM+RXq/hGSvbhrLCbi3gFFFtb0OZ9ItxBwmthxIxXOAVkMOW23MMQKJLyId4Vn+UMe13BcaZzVb8NTRpWbKOu9H5xebq9Q8lMmA9xKduPXy23/51NgWRicRejGd5wbhg2Mk5u8WPXAvWdnSYCwBEh8PTFLiko3CevV0V40f4E/bTKMCW3JsrY8yo3hRI+86COOWXaaxbQKS73EALEqGEPzQFZ6pFlWUD+mJduJVVt4dlG+14wv5j1lffbUrAruKXGwgxWGXLevL7tpLgkJvfLRwUoJ54RT4t4CO1+WjhhLjvk3a5tH5o668ZDyRDEHtCKbZT0rmYjE8nSfeIfmnqDvhAhZSR4Deg/+K9gLLXCoedFB5bG0o4TuYXsgzO2tbx1Wknu3ME0iX2lwk2AblcpK4vMvP9rTnn0qq7j+nfz6/yV255LHgjm36wBdblM7e1qTXJYsKkkrE+FX5tupQjVSKbZ+Qsn3hfRrmuL+tFJ+1p2ofX230viqo4GCluVCY9RxFFyK7bVxr1y40fnV0wn7ord+N9WRF7kHME5szyRYQeAnypvYw7sR9u4nWejo6a7zxhnVbi4iT5405s0CUn7w6E7BELPkKcgOGkAJd0ATJ7+I0ERrwGKNYuiA1LE9Joyl8np3BXJ7avEI61jrsbFTZoYrcBaQhxsSx0+upBzfG0GXFzZaEJtbW2zWNeg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(83380400001)(2616005)(186003)(76116006)(122000001)(38100700002)(8936002)(5660300002)(66476007)(64756008)(66446008)(66556008)(66946007)(2906002)(6512007)(478600001)(26005)(6506007)(91956017)(8676002)(71200400001)(6916009)(54906003)(4326008)(6486002)(53546011)(33656002)(966005)(38070700005)(36756003)(41300700001)(316002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D611FE07CD6B614A9F0C9120A9910434@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7422
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ec52718-f7a1-47d7-66ab-08da90d2256b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4nxB4iqngB4N+JqbjxZPMQoLQWLXNQ4QuuCnD6QdgF0CTO4EtLM7sgVuxMlFoji3NGrxGrqii0CHFmQ9NLp7MpurHyDd+Mcf2K8V8bKCSfR80Bov2QtaVrA6dFIl6RfwIvo0EwGIOy4rI8H+KPR/IRbbF3hhMNNAfHVKlNB/iO9aBgAwbt2YWCvyewN26bdPdOdo9m4JEFwYU+N0asHIahGchyRYzbH1RXshqEK7NDoq7QNOtHjIBGDwR3qrjcUqPVINhljP3CXi13M4wFbna0Yi/yaa/nYJPbC8UjTcnCPm0aVBpMggGD+n7LSYpMPJrLjQebwMn9leALDd2mQ5FGj5IPaEzdfPYuh+g+w/NyzIki1Ebv6zxdJjM/ST26Uf1H8ZsjoF6XxUbb1J28lmQZBlrYFldnxsHM2oA29vlf3a357hRbzrsx40j161VXsT98pd6EEZg0Y4WfFv0hoMFGg6/tk9RVAveBGnWVcd51xbD4Emx+dNJSmAA5jC0b6d1/+fVAWZrY/AzhTA7XW3DvaUQV6x5GzgUAw3NMATJT5nEvVAS+hTWnN4VviNHw7NvD9r2LG1w8r3A4Q6D8HxAsxIGTHD6kSDINV+9h01zA21npH2H9e3eALyTlXJTh161A1gEp+fBxwa9K3vqbIlHDWdcjhkwNGI/82fhkaaBEzABUOsWYU1+ccplJ4vPmA54QEe82xFn9zxyxvabGtBgaMUmngE/Co74hzl6KUNh56cfWqY4YX1kvcRhu/pX5Bv2JYsjnVjUFNSMVmYWl+I1jY5vW0bh3yZKYFi/RLQ9vo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(40470700004)(36840700001)(46966006)(81166007)(41300700001)(478600001)(966005)(54906003)(316002)(2616005)(336012)(47076005)(186003)(356005)(40460700003)(36860700001)(83380400001)(6486002)(53546011)(26005)(6512007)(82740400003)(6506007)(86362001)(33656002)(82310400005)(36756003)(8676002)(2906002)(5660300002)(70586007)(6862004)(40480700001)(4326008)(8936002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:09:21.1369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb8f7f2-c693-4409-3775-08da90d22dd9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7732

SGksDQoNCj4gT24gNyBTZXAgMjAyMiwgYXQgMTM6NDUsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwNy8wOS8yMDIyIDEzOjQxLCBNaWNoYWwg
T3J6ZWwgd3JvdGU6DQo+PiBPbiAwNy8wOS8yMDIyIDE0OjMyLCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+Pj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPj4+IA0KPj4+IE9uIDA3LzA5LzIwMjIg
MTM6MTIsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+Pj4gSGkgSnVsaWVuLA0KPj4+IA0KPj4+IEhp
IE1pY2hhbCwNCj4+PiANCj4+Pj4gT24gMDcvMDkvMjAyMiAxMzozNiwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPj4+Pj4gDQo+Pj4+PiBIaSBIZW5yeSwNCj4+Pj4+IA0KPj4+Pj4gV2hpbGUgcmV2aWV3
aW5nIHRoZSBiaW5kaW5nIHNlbnQgYnkgUGVubnkgSSBub3RpY2VkIHNvbWUgaW5jb25zaXN0ZW5j
eQ0KPj4+Pj4gd2l0aCB0aGUgb25lIHlvdSBpbnRyb2R1Y2VkLiBTZWUgYmVsb3cuDQo+Pj4+PiAN
Cj4+Pj4+IE9uIDA3LzA5LzIwMjIgMDk6MzYsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+Pj4+Pj4gKy0g
eGVuLHN0YXRpYy1oZWFwDQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgUHJvcGVydHkgdW5kZXIgdGhl
IHRvcC1sZXZlbCAiY2hvc2VuIiBub2RlLiBJdCBzcGVjaWZpZXMgdGhlIGFkZHJlc3MNCj4+Pj4+
PiArICAgIGFuZCBzaXplIG9mIFhlbiBzdGF0aWMgaGVhcCBtZW1vcnkuIE5vdGUgdGhhdCBhdCBs
ZWFzdCBhIDY0S0INCj4+Pj4+PiArICAgIGFsaWdubWVudCBpcyByZXF1aXJlZC4NCj4+Pj4+PiAr
DQo+Pj4+Pj4gKy0gI3hlbixzdGF0aWMtaGVhcC1hZGRyZXNzLWNlbGxzIGFuZCAjeGVuLHN0YXRp
Yy1oZWFwLXNpemUtY2VsbHMNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBTcGVjaWZ5IHRoZSBudW1i
ZXIgb2YgY2VsbHMgdXNlZCBmb3IgdGhlIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlDQo+Pj4+Pj4g
KyAgICAieGVuLHN0YXRpYy1oZWFwIiBwcm9wZXJ0eSB1bmRlciAiY2hvc2VuIi4NCj4+Pj4+PiAr
DQo+Pj4+Pj4gK0JlbG93IGlzIGFuIGV4YW1wbGUgb24gaG93IHRvIHNwZWNpZnkgdGhlIHN0YXRp
YyBoZWFwIGluIGRldmljZSB0cmVlOg0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIC8gew0KPj4+Pj4+
ICsgICAgICAgIGNob3NlbiB7DQo+Pj4+Pj4gKyAgICAgICAgICAgICN4ZW4sc3RhdGljLWhlYXAt
YWRkcmVzcy1jZWxscyA9IDwweDI+Ow0KPj4+Pj4+ICsgICAgICAgICAgICAjeGVuLHN0YXRpYy1o
ZWFwLXNpemUtY2VsbHMgPSA8MHgyPjsNCj4+Pj4+IA0KPj4+Pj4gWW91ciBiaW5kaW5nLCBpcyBp
bnRyb2R1Y2UgI3hlbixzdGF0aWMtaGVhcC17YWRkcmVzcywgc2l6ZX0tY2VsbHMNCj4+Pj4+IHdo
ZXJlYXMgUGVubnkncyBvbmUgaXMgdXNpbmcgI3thZGRyZXNzLCBzaXplfS1jZWxscyBldmVuIGlm
IHRoZSBwcm9wZXJ0eQ0KPj4+Pj4gaXMgbm90ICJyZWciLg0KPj4+Pj4gDQo+Pj4+PiBJIHdvdWxk
IGxpa2Ugc29tZSBjb25zaXN0ZW5jeSBpbiB0aGUgd2F5IHdlIGRlZmluZSBiaW5kaW5ncy4gTG9v
a2luZyBhdA0KPj4+Pj4gdGhlIHRyZWUsIHdlIGFscmVhZHkgc2VlbSB0byBoYXZlIGludHJvZHVj
ZWQNCj4+Pj4+ICN4ZW4tc3RhdGljLW1lbS1hZGRyZXNzLWNlbGxzLiBTbyBtYXliZSB3ZSBzaG91
bGQgZm9sbG93IHlvdXIgYXBwcm9hY2g/DQo+Pj4+PiANCj4+Pj4+IFRoYXQgc2FpZCwgSSBhbSB3
b25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQganVzdCB1c2Ugb25lIHNldCBvZiBwcm9wZXJ0eQ0K
Pj4+Pj4gbmFtZS4NCj4+Pj4+IA0KPj4+Pj4gSSBhbSBvcGVuIHRvIHN1Z2dlc3Rpb24gaGVyZS4g
TXkgb25seSByZXF1ZXN0IGlzIHdlIGFyZSBjb25zaXN0ZW50IChpLmUuDQo+Pj4+PiB0aGlzIGRv
ZXNuJ3QgZGVwZW5kIG9uIHdobyB3cm90ZSB0aGUgYmluZGluZ3MpLg0KPj4+Pj4gDQo+Pj4+IElu
IG15IG9waW5pb24gd2Ugc2hvdWxkIGZvbGxvdyB0aGUgZGV2aWNlIHRyZWUgc3BlY2lmaWNhdGlv
biB3aGljaCBzdGF0ZXMNCj4+Pj4gdGhhdCB0aGUgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNl
bGxzIGNvcnJlc3BvbmQgdG8gdGhlIHJlZyBwcm9wZXJ0eS4NCj4+PiANCj4+PiBIbW1tLi4uLiBM
b29raW5nIGF0IFsxXSwgdGhlIHR3byBwcm9wZXJ0aWVzIGFyZSBub3QgZXhjbHVzaXZlIHRvICdy
ZWcnDQo+Pj4gRnVydGhlcm1vcmUsIEkgYW0gbm90IGF3YXJlIG9mIGFueSByZXN0cmljdGlvbiBm
b3IgdXMgdG8gcmUtdXNlIHRoZW0uIERvDQo+Pj4geW91IGhhdmUgYSBwb2ludGVyPw0KPj4gQXMg
d2UgYXJlIGRpc2N1c3NpbmcgcmUtdXNhZ2Ugb2YgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNl
bGxzIGZvciBjdXN0b20gcHJvcGVydGllcyB0aGF0IGFyZSBub3QgInJlZyIsDQo+PiBJIHRvb2sg
dGhpcyBpbmZvIGZyb20gdGhlIGxhdGVzdCBkZXZpY2UgdHJlZSBzcGVjcyBmb3VuZCB1bmRlciBo
dHRwczovL3d3dy5kZXZpY2V0cmVlLm9yZy9zcGVjaWZpY2F0aW9ucy86DQo+PiAiVGhlICNhZGRy
ZXNzLWNlbGxzIHByb3BlcnR5IGRlZmluZXMgdGhlIG51bWJlciBvZiA8dTMyPiBjZWxscyB1c2Vk
IHRvIGVuY29kZSB0aGUgYWRkcmVzcyBmaWVsZCBpbiBhIGNoaWxkIG5vZGUncyByZWcgcHJvcGVy
dHkiDQo+PiBhbmQNCj4+ICJUaGUgI3NpemUtY2VsbHMgcHJvcGVydHkgZGVmaW5lcyB0aGUgbnVt
YmVyIG9mIDx1MzI+IGNlbGxzIHVzZWQgdG8gZW5jb2RlIHRoZSBzaXplIGZpZWxkIGluIGEgY2hp
bGQgbm9kZeKAmXMgcmVnIHByb3BlcnR5Ig0KPiANCj4gUmlnaHQuIEJ1dCB0aGVyZSBpcyBub3Ro
aW5nIGluIHRoZSB3b3JkaW5nIHN1Z2dlc3RpbmcgdGhhdCAjYWRkcmVzcy1jZWxscyBhbmQgI3Np
emUtY2VsbHMgY2FuJ3QgYmUgcmUtdXNlZC4gRnJvbSBbMV0sIGl0IGlzIGNsZWFyIHRoYXQgdGhl
IG1lYW5pbmcgaGFzIGNoYW5nZWQuDQo+IA0KPiBTbyB3aHkgY2FuJ3Qgd2UgZG8gdGhlIHNhbWU/
DQoNCkkgYWdyZWUgaGVyZSwgdGhvc2UgYXJlIHVzZWQgZm9yIGhvdyByZWcgaXMgZW5jb2RlZCBi
dXQgbm90aGluZyBzYXlzIHRoYXQgd2UgY2Fubm90IHJldXNlIHRoZW0gZm9yIHRoZSBlbmNvZGlu
ZyBvZiBzb21ldGhpbmcgZWxzZS4NCkV2ZW4gaWYgd2UgZG8gbm90IHVzZSDigJxyZWfigJ0gZm9y
IHRob3NlIHNldHMsIHRoZXkgYXJlIHN0aWxsIGRlZmluaW5nIG1lbW9yeSBhZGRyZXNzZXMgYW5k
IHNpemVzIHdoaWNoIGlzIGNvaGVyZW50Lg0KDQpJbiBzb21lIGNhc2VzIHJlZyBpcyB1c2VkIHRv
IGVuY29kZSBzb21ldGhpbmcgZGlmZmVyZW50IHNvIHRob3NlIGNvdWxkIGhhdmUgZGlmZmVyZW50
IHZhbHVlcyB0aGF0IHdlIGNvdWxkIG5vdCB1c2UgYnV0IGZvciB0aGUgY2hvc2VuIG5vZGUsIHRo
ZXkgc2hvdWxkIGFsd2F5cyBzZXQgdGhlIGVuY29kaW5nIGZvciBzb21ldGhpbmcgYWRkcmVzc2lu
ZyBhIG1lbW9yeSBhcmVhLg0KDQpTbyBpZiB3ZSBoYXZlIGEgZ29vZCByZWFzb24gdGhlbiBJIHdv
dWxkIHZvdGUgZm9yIHhlbixtZW1vcnktKiBwcm9wb3NhbCBidXQgc28gZmFyIEkgY291bGQgbm90
IGZpbmQgYSByZWFzb24gbm90IHRvIHVzZSB0aGUgc3RhbmRhcmQgb25lcy4NCg0KQ2hlZXJzDQpC
ZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

