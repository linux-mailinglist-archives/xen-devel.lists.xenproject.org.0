Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC55AF751
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400390.642113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSg-0002mn-6X; Tue, 06 Sep 2022 21:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400390.642113; Tue, 06 Sep 2022 21:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSg-0002iq-0r; Tue, 06 Sep 2022 21:50:26 +0000
Received: by outflank-mailman (input) for mailman id 400390;
 Tue, 06 Sep 2022 21:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuBZ=ZJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVgHq-0000Cs-Aq
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29ed7b06-2de5-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 15:09:39 +0200 (CEST)
Received: from AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) by AS8PR08MB6118.eurprd08.prod.outlook.com
 (2603:10a6:20b:29b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 13:09:37 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::92) by AM5PR0201CA0022.outlook.office365.com
 (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Tue, 6 Sep 2022 13:09:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 13:09:37 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Tue, 06 Sep 2022 13:09:36 +0000
Received: from e5e0fdbf346f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8B4861C-460E-42D3-8FC2-30ED1DC68135.1; 
 Tue, 06 Sep 2022 13:09:29 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5e0fdbf346f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 13:09:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8465.eurprd08.prod.outlook.com (2603:10a6:20b:569::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Tue, 6 Sep
 2022 13:09:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 13:09:28 +0000
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
X-Inumbo-ID: 29ed7b06-2de5-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XvTnAT7UeuHEgnwLxFKjkJwYC5OKf/sSInD73MpC+aKvkx9H7NYkkA7nZIhl5b7l61ft8P58rplFXj1EDKLyqDuwUaVsqqFnIQ5igZMYjPQipV24ZjN2q88WU+BxQ8rUspCpJJVdLBCXe2ixNSgoJdcVKq9GyjxcvYUGD+PQ+4JGF/eFNSKej/509c/dZJodgKPcloosfflT79TWr1Mz4g+ZbpWGJhHg7GYTEU6Yrj96vCPXXiQeE4bIGBfkqKwjDd9NWx3K0v0bNj7XThu++oAQKqOMxvhiWfwEwqZWPSUxKW/CSjFTHsg+9NX9qfYCLoOR06GLMz92mon6MFF1vA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2lfvMOkncCIuRb+EZwQay3iR+IhRohamSnzjyZQXLQ=;
 b=SskBLFsoI8ipThe31t2mK0U1Pr72CEyMD8PJ79ch5oi1qg9qns0W9vfEjJT4cNQZNaDucxlgY3c62GDTm6B4axPDGHFHOPsHdkiYSYgSJXecXuT5s+jTf+GIcKVHXgtPiepngWATK8vN1aZIyBdMPRlxY1G2KfN9GJvfmR98TLm8qBWfg588M/p2bglWM0NP2twfRK6LJI/sMsHOpTac/qhuWqpje+iVEix22k6mxjZNbw5gilYS8ekbfgamO5Lck+rhslRtLA/KiutZ0ngw5FjwfGRWkX0SP9Hlw+gQqIo2kwiEJY7+ZGg70LH51tmSZKSPn4hseB4l/MTVeSDvAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2lfvMOkncCIuRb+EZwQay3iR+IhRohamSnzjyZQXLQ=;
 b=TrzZ00S94AuATuSz+6nSicssg+7mw+5npaMntKE1KvCqYU8kNeakqospDNXTkoheYMvm7jo5aHil6UppQ01aTDGtusfpSFfcoizf0ijW5H8g21iieah6JLK+VNZXMJ6uNk9U8CgCC8nwzB9ZYMO6Pk1srRoti81mX3AnyFYz/38=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2029b4c1f6e07c5f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Omfpsp6htz0t58upEcgko9eb/1CRGgF/9FpGnkmc3v9Pgihkkm4lLYWlRKEPyBsEpyY/GjD/pnXz4rseA5IPk2Rxe8MIi+nlA5SYZUIFYhXSRK1XZv5Zns5p11xbPKbXAI1VRvc6hb5zYOISS1wLKcqeT04EfqlVc1jIYYOui049/HCZ/cuJJPVpdsdMLQDqpLTNd4TdcHiHtqmlxtEYjeeRWOCYBHCtsATkxFR/qzqaChuvTyEZl02gLOKhJx4GBkk4bSLd+hxZ0Mivdz74dvSBIH1l2N/DO5zHa45mpXHparhVEajMg+a+U0RPsIID9dG7+UiML+Rcq+6KhoosdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2lfvMOkncCIuRb+EZwQay3iR+IhRohamSnzjyZQXLQ=;
 b=bfgGGOoQ2/gzdiRBMc2pU/8Kr5IQWbH35yUHSpbY34cwK8NIX22sQPrLfkY2UI3Fg1EzR03SMOKbHleKlUBl+qbtPUaLxEwVqD7UWApAB5dzU2RHlzIRfoiE3ZYgO0WwfZOrh42GIFKv2fHIOSF8VqMirV4Zda1jYkNIVcKDPe3szyz+Xi3kRdseHilP5sjdCBruDHtyhN9pfQbDcV88UhOrGPJBx2o2xufpGaUZQqhoNGWth7LK4fCXpbAaHpRnaAMjhRvZVGRx4N1ViBcNjoTs8uAttcjmed49d8stdItbJcqQ5inrWth9P1/BtKUJCsWaytibFJ4jmxyqDoOptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2lfvMOkncCIuRb+EZwQay3iR+IhRohamSnzjyZQXLQ=;
 b=TrzZ00S94AuATuSz+6nSicssg+7mw+5npaMntKE1KvCqYU8kNeakqospDNXTkoheYMvm7jo5aHil6UppQ01aTDGtusfpSFfcoizf0ijW5H8g21iieah6JLK+VNZXMJ6uNk9U8CgCC8nwzB9ZYMO6Pk1srRoti81mX3AnyFYz/38=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Topic: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Index: AQHYweQzyVikzADCFE2Bfo+zYT5rgq3SYAEA
Date: Tue, 6 Sep 2022 13:09:28 +0000
Message-ID: <09F01AC7-6125-49C3-80BF-637BBFDC739A@arm.com>
References: <20220906113112.106995-1-leo.yan@linaro.org>
In-Reply-To: <20220906113112.106995-1-leo.yan@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2f2d538a-032c-4bfc-b295-08da90090ce7
x-ms-traffictypediagnostic:
	AS8PR08MB8465:EE_|AM7EUR03FT015:EE_|AS8PR08MB6118:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ODZUjAK9ir4fuCw89rbVUDubjz7HJ4p1j0bgV91kHn4vnMz5O2XWooOJB7XnsJHNR4a93VEDhwD7UNpDiYh4DIfTE+NmqIuE5G1Jd3KBsu/G2Wubwh43PeaXZN+9eiQx/sfwG8h7kDEc2wb7jfbvjX9je4wqlvRt4eTOOBgFydLxVu4CB+AJkzGqa0bB0nxMgzWh1ulvDCEaGQ93b0ApXkDhu6UtPFxZzGYwXHAa2lA53Ijkea0DJI1pbfHOMWau0DG5CmapuONSIbybdbiSkTt0TdNg8dHrySYWhVWDwLoehz7VFUgGfFkI9HJsjKRkLw4dplT2s1wKJYEr+BPv1taWuJiwshY9Yzg/2qlzc63weOZyOAw2ukP1CERqe9p+YCNp4VriuMvFxDheqH/oK+770iceW2UDi0XsFTmtHxnKpI/JLw2mxMpSrAx/MporYesDyqUdqzlu94VRmXXMKAX+KXVqsmsOti24jhbL/8BZ2WUlDQWJx5VGn3bBJWF1YsGdVCUk7QmywqqY8ZUVrdXADA5gbaWM411iHaA4736XtUhLK3kwSOlWFZH//xoVwssvWPVtrUSJZJPJ3gXbLq4anAGtjpWJ3d3eSz8Jlm+ftBvXgAsiqQqeAzOlm65tH6VqiHG3F7m62ySgxXYIBGTb1cSaQo1Zrr3/15ukXz0ABeWI/x6zaZaNQGAM21KHLBlNCVTcAa8T7O/MwSstkA859PV8BMZNvymoHps9tZywJAlSLQzBZisCT3AycxvbG4oEYzL2AZBrIu0WtrqOpWW9SQG3HuDFYsurv86U3D8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(6506007)(2616005)(6512007)(8936002)(2906002)(66946007)(66476007)(53546011)(64756008)(26005)(8676002)(4326008)(66446008)(6486002)(76116006)(478600001)(41300700001)(5660300002)(186003)(38100700002)(316002)(36756003)(54906003)(6916009)(66556008)(91956017)(33656002)(71200400001)(86362001)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <211465EF80024A42BF646BA32D373279@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	388fab50-19db-4813-f1b5-08da900907b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QoBAEG+TB1TmXcQARJ5snLo1Edm5d8i9efkcjFavSI5tqV2I3BWW0L2zLBWI1m0sVlLlaJwDjoKaq2OGU/FMLtu9pSKJA8+pXwQNJclzIPizp5xcLZjtrTHCddTbTjiXBYdZnS1oiuj85QPPVEVdSQxAZmhdGkNTKXphyg7puNgEX/nM7cKfhtptnux0QHOW5zyJ0OqznDo4+BXF4Nnj9svbjcfVZ2W5c3iNm4Ok59XefpXpr2sbzhVPKVC57iel2WuVo2ccQVK1UKUo8ZOa3amOuvBK1mzd8v2xqSmBkFC92jiIRHZ/ASA2rWek3r2qtlktwwNpWDL0TuqzH9NymtmlTNXhDG66nkVS17MF4a2gvUdEVi4rkUS0zgpjU7GkIq/42IaJjYoQbQ8FXaVzLLEenU46Zp53ldjzs2kxnPkWdduh2+HhXKEiGWt2Sz1szBIEyOSnf5PgutSpJz8xcVWusj1eySxsbbbuXw0JvjVTH7AnJMZxjI7ZATDq+NPk/nM1Uz95nTgtyiF3s9/3tqlBuJLJRHwvmFG+AmqpDtKjtU+5b77F+AxcSrEFLQvniqm7FF87BzP4/VGyNi4bw7lW9njDR8mg6p86lILpKQ6IMYsiivKEnYcyU4tT+hvWK/9Kzj2IW0Pygo1UtpB6oj4W0blRVBi8MpsMDYA+00ZOyZmkUsZT9x+n8B4/C4BL8UKAJQ/0BuNKK5Z2EB3rJxkaMc/0lkzzvk45glyp2JiFj+iMo/FAs5Vn/EEYKem18WikG6AL3T68pNndm19AUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(40470700004)(46966006)(36756003)(8676002)(36860700001)(70586007)(4326008)(70206006)(2906002)(316002)(54906003)(5660300002)(6862004)(8936002)(33656002)(41300700001)(82310400005)(6486002)(40480700001)(6512007)(47076005)(336012)(478600001)(2616005)(186003)(40460700003)(356005)(81166007)(53546011)(26005)(6506007)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 13:09:37.1494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2d538a-032c-4bfc-b295-08da90090ce7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6118

Hi Leo,

> On 6 Sep 2022, at 12:31, Leo Yan <leo.yan@linaro.org> wrote:
>=20
> On Arm64 Linux kernel prints log for Xen version number:
>=20
>  [    0.000000] Xen XEN_VERSION.XEN_SUBVERSION support found
>=20
> Because the header file "xen/compile.h" is missed, XEN_VERSION and
> XEN_SUBVERSION are not defined, thus compiler directly uses the
> string "XEN_VERSION" and "XEN_SUBVERSION" in the compatible string.
>=20
> This patch includes the header "xen/compile.h" which defines macros for
> XEN_VERSION and XEN_SUBVERSION, thus Xen can pass the version number via
> hypervisor node.
>=20
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Very nice finding and side effect from stringify.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/acpi/domain_build.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_=
build.c
> index bbdc90f92c..2649e11fd4 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -9,6 +9,7 @@
>  * GNU General Public License for more details.
>  */
>=20
> +#include <xen/compile.h>
> #include <xen/mm.h>
> #include <xen/sched.h>
> #include <xen/acpi.h>
> --=20
> 2.34.1
>=20


