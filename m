Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5A8519C4C
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 11:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320508.541278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmBe7-0000mM-Fy; Wed, 04 May 2022 09:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320508.541278; Wed, 04 May 2022 09:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmBe7-0000jl-C6; Wed, 04 May 2022 09:50:11 +0000
Received: by outflank-mailman (input) for mailman id 320508;
 Wed, 04 May 2022 09:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLg=VM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nmBe5-0000jX-93
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 09:50:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d0f904-cb8f-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 11:50:08 +0200 (CEST)
Received: from DBBPR09CA0012.eurprd09.prod.outlook.com (2603:10a6:10:c0::24)
 by GV1PR08MB7986.eurprd08.prod.outlook.com (2603:10a6:150:9e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 09:50:04 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::9a) by DBBPR09CA0012.outlook.office365.com
 (2603:10a6:10:c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Wed, 4 May 2022 09:50:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 09:50:04 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Wed, 04 May 2022 09:50:04 +0000
Received: from a08369454825.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FD642911-2911-499C-9D32-E1926D99BAD8.1; 
 Wed, 04 May 2022 09:49:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a08369454825.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 May 2022 09:49:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB3009.eurprd08.prod.outlook.com (2603:10a6:208:66::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.16; Wed, 4 May
 2022 09:49:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.028; Wed, 4 May 2022
 09:49:54 +0000
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
X-Inumbo-ID: 94d0f904-cb8f-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CDRFsv4Df9OZYMtw+OVd5bCd2CeDxb7tEU0QRx9l6KSUsAGKNCMTkb2fi0kGaG1qhNWJigG91XHZuu/aVWeb25exk5bHc0YsAR5AwVjGFMZ4G6VfJA9xrCKLg1bBOj7TR78PxtfOKwfu0WiiGSmrpwJSNieGaZpo8y69oIAungc46Lgb29qcTG8akgOhvQz8dlTmr4r4pJ2TAcK0BUlgXzaVAZF5qN7IGgp6NGKHWT6+Ax841vVjwJKYM+/ycfl/VsIW9yp/sxu14Ycd/eh46BY8HLFs2qvRjYPJrXUW3yDF03YMpV/ObUX/pse6RqH3Oqyc7dVSheLZD5pu7x1RFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4yrrZoq72BY0aOgRp+XuKvQ60XUgDAQlKDmxu9cXok=;
 b=Bl/LRoLhzUZZv1pGG8MyrPv63Rv4ZWlbHkuOtwj51kGZSOv44GuO1yUxjUga77gafFdV+/CiBDQzeIetoLkPjyKiq5o9DV6pWwz+JIhJBQ+mjxV5NOhuDdCeNrJ6EbGA12TXcKi68ws4Gh3l+m3cycaUTTt59vVABbdZBHpIGoF8pPovR6pKrCu9P3j/RzLjWhJKzCtlmidScySSqFKbT/97WP99DMBAYqg4f0VBytSA+L7JdjFh/ZJyepeMjgqImEF/H8tqFoxoOb+8G4eeAhuEaRvk9lzS/u37+xfSItJYAqO+zlIjiZrXQlwpD54sOvrz/ntf5xPnjsJa0RWJ6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4yrrZoq72BY0aOgRp+XuKvQ60XUgDAQlKDmxu9cXok=;
 b=zsYQOXHxTbtIyZA35uCCUPPg9MXfpM0SjgRjQPW9JFU1eQQv2RjhvpWaoyDlMHQi3jZ9QXAotJY+FkM1GN9vEW7s3O9KEjYjkuky8makOBz0YLdjyYYjzMk6W7ZcLEUi/XgJ2D+5DmGxEiQzMUeJShJe2XW4cCY8wS8WL4Wm19E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 002f77ecf03e342c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5gifq9RU5WGkcaqMeYwDqW6FxM/mGWcZZGywNGmxCAv58pj8IctGxVIRNqu2mrCV5/v6YBCRGLrZMzygXykbQq030yDeHZFpFZ3U3h88F2UnFchl9Hf0qmwC6TX4p0Hjp+TNdnlo4jZDeGuicmNE1Lj8nhXVh3KvGH0hBaszXavIok6HzLccrsHIIBJwseyHtPAnJXhMNDB/K/ThpqFc6LV+a0SXmOKUXA4DG8eTSUmQvb5GACTxJiOTRG1yICnUNWmY1pm6TXsbwmo5ZxQOmgsiSPF+bUeBuJ8EO0FIae462sgB7ZXTtEjYrbhCaM+T87NLa/ojFYGMsK2R18mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4yrrZoq72BY0aOgRp+XuKvQ60XUgDAQlKDmxu9cXok=;
 b=fWocSSXb5G0f3pvuRa2nQDcfh47LAOup8JUrMPlCMoubCHy2X23IwLLJxlLHgRHjopUVzj0iuEp2FgYqNDLK6kJtukOuebmVc9iY9l047FSFAxZXnfKlnbfEgFH4JPgRvbziOqfAfWzEEyCm2AnCTqYHwIXwJDA4/Ms/C9PPVc+80/zDeWWYQxY0ZE5s/GYcgwygLnMMKbx3Bykfky3Pmqfdw3+PE0dX3hXMw4E/9F/XQ/nb9Z5P9v3ili9o5kNnqh6RM5qNgTF+s7VBsp+kA806Op5NPMaN/0NUZUxCN+pWwHbaev7nRMrxjaNEdIj8dwPIOHrEqRGfi1LKAEB3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4yrrZoq72BY0aOgRp+XuKvQ60XUgDAQlKDmxu9cXok=;
 b=zsYQOXHxTbtIyZA35uCCUPPg9MXfpM0SjgRjQPW9JFU1eQQv2RjhvpWaoyDlMHQi3jZ9QXAotJY+FkM1GN9vEW7s3O9KEjYjkuky8makOBz0YLdjyYYjzMk6W7ZcLEUi/XgJ2D+5DmGxEiQzMUeJShJe2XW4cCY8wS8WL4Wm19E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
Thread-Topic: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux
 5.18-rc3
Thread-Index: AQHYXtGhqgeBKorGIE+S3ZHm07cmGK0Nc+GAgADisYCAAAtXAIAAGQ0A
Date: Wed, 4 May 2022 09:49:54 +0000
Message-ID: <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
 <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
 <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org>
In-Reply-To: <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a0c3c9d5-7147-4e25-58b1-08da2db376c4
x-ms-traffictypediagnostic:
	AM0PR08MB3009:EE_|DB5EUR03FT010:EE_|GV1PR08MB7986:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB79862538BAD7E88263A15B179DC39@GV1PR08MB7986.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BcocTth2w+yKls3hK3gg72r93mA1DAS/1CZU7xMM1JDe5pJAjfaxqu8ebYMY/tju7wRjSssWThUNUrkR/zkk8fj/3KtCTK9RQWkVKGHdyj6jM9Z222kFI8ZxMgaoiUeF61P05GfGVtAOOz+cUECSv8/Y45rFDmFssOFez+xIgpbz8C2WiKgqUm69e0Yu8jWJLSXVhZncwpqRuekQpoprNE1teexLlkhKr35wKqAiFBjqD4iZiG2CuP6zfVGIvtrqRLw9hWbmHBVCxXrMatKGNxqCHJ4jWuieKTSXOc97Yj/sWAXWcMec60T7Hz9DZ/d9yS+EIzUnUW21wLuXAR+ixfjJMgGb/JD49jFFZL0xFLDjDSHWNPC1qln1hEEiA/fFLOSkB+/3gzp02QTLbJPbEu+3xlKPP5sdvmt7bkEMVkLQgqjryW2qnt/6kxazNbeUt9wnlx6tGwuv9YotRRHGrqloNR2G84bFLedmm2zmkF8IZPflWpzJTI+wJUlRHvJXhZMziY+RRwp8lNN8eQzxZyxTKxfb3sc+2Q3Oeyi/VekAwrWqp3o0bidlgW4UB0aDD0J6YcKhYdUnxhuQmCXmOmAR7B8xKKAoFx0/fJ+9bc/TKQo158FKsQdRqc9SDF4eQLOFv+cN/XWRbpri1yKAfD/YWxpyjBJbbqhg9VH9eUuKH+U5E6EC0vpVyPCqwRqe3++0ajHzfqyvrvn1o9qEJNiLbGbYsX7lrCQbjnlbAp27/smfEGC6OSJ4qPo/3fTteH9hykuE/Njw/FctVy0U4tHZhNDV0GtDp61qlrUoAIm9rS0z/RxRx0rcA4GBHbvQUv4DNmzQXHKXsuL/d4EVjHnqNaLuTdWSD/CZ4+VHkUTDX/vE+AYLz4TLnn324sfH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(186003)(36756003)(83380400001)(2906002)(53546011)(26005)(66946007)(122000001)(8936002)(6512007)(5660300002)(6506007)(66476007)(508600001)(76116006)(66556008)(33656002)(8676002)(4326008)(91956017)(66446008)(86362001)(6916009)(316002)(71200400001)(54906003)(38100700002)(38070700005)(6486002)(966005)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3739599378D65043842FCFA835B71FF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3009
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b4872e6-254c-4371-5994-08da2db3711a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X7Dc2AoSehozbmLsDcyBZR8NhkcLtftUrxfx4cBEf1YHZglsJ6nNmivna/LnBKlvGlvVhPT1clq4gckMQyu1xSJiYvpC9Uc98fMtGfkUHeCRJ8Me2W8yPNnQqS88r4W4VrBi9Q0xTNjRXC39S8jnK/J1OduA18pYjzN0mmBDltqct+vwqdFFdj6TqLEWJtx+/Hc7LaT+Vh5/SXdRq7fX1/8SEoV/LeZFDv244GFraNffpuF7LcbLkmDAnBHhB17No4sDvYxuK/0KWkDSpxFE+KLNQBCNNSq7E52UHya7h6thsLhT4z4LGYRMjIUiymXG3YG2Y9xbwy+ntT4mcXO8VyVsFVJLJbp5HHHEtwnNHUXC30GcOP2GrBwkLX+OSqSYbZmie7J1EgCMDbTvdhAOKUY8RqPzqsRt0wkwhOSd4swkiHIkPu+Wf6if6SQPPzbURbHvx3JGDyD3PmVSE3x7saku516XksB3jp2a9MdNGnPIUQNMzF8qp+xG82/eKW9XiIl4UH4PTH1PcFoKh0cN32UPk6wzXNHC82jbMb7r225UPGT2J/H+guJMWE1VwQqvL4YRL6PhPZvB4bflPCBR93oIGAmZ4+gsFQQuESFbWrpzXPEqIvKo2oa2fqvFph3AzZhoGqdJC6NzoqHDYP5ndCRtU2uNFRyhU0FxBrUZ0QPIEA+wjByW35x1fve2Hb5RJbPEMMDDhpA40BorG8ZRUgnRE2o416EBQtTnfZ9bz1sWAbIz0fRjq4Q5aSn6IYFH4gUUQRch6hu972S00z4SGA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(186003)(6506007)(26005)(336012)(107886003)(6512007)(83380400001)(47076005)(2616005)(81166007)(36860700001)(40460700003)(53546011)(2906002)(316002)(82310400005)(33656002)(8676002)(4326008)(6862004)(54906003)(86362001)(70206006)(5660300002)(8936002)(70586007)(508600001)(36756003)(966005)(6486002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 09:50:04.1236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c3c9d5-7147-4e25-58b1-08da2db376c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7986

Hi Julien,

> On 4 May 2022, at 09:20, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 04/05/2022 08:39, Bertrand Marquis wrote:
>> Hi Julien,
> Hi,
>=20
>>> On 3 May 2022, at 19:08, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 03/05/2022 10:38, Bertrand Marquis wrote:
>>>> Sync arm64 sysreg bit shift definitions with status of Linux kernel as
>>>> of 5.18-rc3 version (linux commit b2d229d4ddb1).
>>>> Sync ID registers sanitization with the status of Linux 5.18-rc3 and a=
dd
>>>> sanitization of ISAR2 registers.
>>> Please outline which specific commits you are actually backported. This=
 would help to know what changed, why and also keep track of the autorships=
.
>>>=20
>>> When possible, the changes should be separated to match each Linux comm=
it we backport.
>> As those are exactly identical to the linux tree, one can easily use git=
 blame on the linux source tree to find those information if it is needed
>=20
> Well... that's possible at the cost of everyone going through Linux to un=
derstand why the changes were made. This is not very scalable.
>=20
>> I checked a bit and this is not something that was required before (for =
example when the cpufeature was introduced).
>=20
> If we import the full file, then we will generally don't log all the comm=
its. However, for smaller changes, we will always mention the commit backpo=
rted. There are several examples on the ML:
>=20
> - 0435784cc75d ("xen/arm: smmuv1: Intelligent SMR allocation")
> - 9c432b876bf5 ("x86/mwait-idle: add SPR support")
>=20
> We also recently introduced a tag "Origin:" to keep track of which commit=
 was backported. If you want to understand the rationale, you can read this=
 long thread:
>=20
> https://lore.kernel.org/xen-devel/0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@su=
se.com/

Do I understand right that it is ok for you if I push one patch mentioning =
all the commits done in Linux corresponding to the changes (instead of one =
patch per commit) ?

>=20
>>>=20
>>>> Complete AA64ISAR2 and AA64MMFR1 with more fields.
>>>> While there add a comment for MMFR bitfields as for other registers in
>>>> the cpuinfo structure definition.
>>>=20
>>> AFAICT, this patch is doing 3 different things that are somewhat relate=
d:
>>> - Sync cpufeature.c
>>> - Update the headers with unused defines
>>> - Complete the structure cpufeature.h
>>>=20
>>> All those changes seem to be independent, so I think they should be don=
e separately. This would help to keep the authorship right (your code vs Li=
nux code).
>> This and the previous request to split using linux commit will actually =
end up in 10 patches or more.
>=20
> I think we need to differentiate the two request. The previous request is=
 about logging which commits you backported. I would be open to have all of=
 them in one patch so long we account the authors/tags properly.
>=20
> For this request, this is mostly about avoid to mix multiple things toget=
her. Your commit message describes 3 distinct parts and therefore they shou=
ld be split.

So 3 patches if you confirm the previous point.
I am ok with that

>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>> xen/arch/arm/arm64/cpufeature.c | 18 +++++-
>>>> xen/arch/arm/include/asm/arm64/sysregs.h | 76 ++++++++++++++++++++----
>>>> xen/arch/arm/include/asm/cpufeature.h | 14 ++++-
>>>> 3 files changed, 91 insertions(+), 17 deletions(-)
>>>> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpuf=
eature.c
>>>> index 6e5d30dc7b..d9039d37b2 100644
>>>> --- a/xen/arch/arm/arm64/cpufeature.c
>>>> +++ b/xen/arch/arm/arm64/cpufeature.c
>>>> @@ -143,6 +143,16 @@ static const struct arm64_ftr_bits ftr_id_aa64isa=
r1[] =3D {
>>>> 	ARM64_FTR_END,
>>>> };
>>>> +static const struct arm64_ftr_bits ftr_id_aa64isar2[] =3D {
>>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64ISAR2=
_CLEARBHB_SHIFT, 4, 0),
>>>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>>>> +		 FTR_STRICT, FTR_EXACT, ID_AA64ISAR2_APA3_SHIFT, 4, 0),
>>>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>>> So we are using CONFIG_ARM64_PTR_AUTH. But this is not defined in Kconf=
ig. I realize there are more in cpufeature.c (somehow I didn't spot during =
preview), but I don't think this is right to define CONFIG_* without an ass=
ociated entry in Kconfig.
>>>=20
>>> In one hand, I think it would be odd to add an entry in Kconfig because=
 Xen wouldn't properly work if selected. On the other hand, it is useful if=
 when we will implement pointer authentification.
>>>=20
>>> So maybe we should just add the Kconfig entry with a comment explaning =
why they are not selected. Any thoughts?
>> This is really right and a very good catch.
>> I think it would make sense to introduce those in Kconfig in order to ke=
ep the code equivalent to Linux.
>> So I would suggest here to add hidden entries like this:
>> ARM64_PTR_AUTH
>> 	def_bool n
>> 	depends on ARM64
>> help
>> Pointer authentication support.
>> This feature is not supported by Xen.
>=20
> I am OK with that.

Ok, there are currently 4 CONFIG_ not defined so I will add a patch for tho=
se in my serie.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


