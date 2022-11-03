Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97475618656
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 18:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436968.691236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqeFh-00011y-5t; Thu, 03 Nov 2022 17:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436968.691236; Thu, 03 Nov 2022 17:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqeFh-0000zb-2T; Thu, 03 Nov 2022 17:43:41 +0000
Received: by outflank-mailman (input) for mailman id 436968;
 Thu, 03 Nov 2022 17:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghSa=3D=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oqeFe-0000zV-Mh
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 17:43:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ad26626-5b9f-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 18:43:36 +0100 (CET)
Received: from ZR0P278CA0108.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::23)
 by PAXPR08MB7598.eurprd08.prod.outlook.com (2603:10a6:102:23d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 17:43:33 +0000
Received: from VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:23:cafe::76) by ZR0P278CA0108.outlook.office365.com
 (2603:10a6:910:23::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.22 via Frontend
 Transport; Thu, 3 Nov 2022 17:43:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT027.mail.protection.outlook.com (100.127.144.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 17:43:32 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Thu, 03 Nov 2022 17:43:32 +0000
Received: from d39feeff38a7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6AB13A9-DB60-4A30-9278-071F1655F115.1; 
 Thu, 03 Nov 2022 17:43:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d39feeff38a7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Nov 2022 17:43:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6464.eurprd08.prod.outlook.com (2603:10a6:102:df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 17:43:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 17:43:21 +0000
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
X-Inumbo-ID: 0ad26626-5b9f-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aHSeUQkvjlwbleCnfwSjocmh6vObfAfCEcvWwzCAeW+BEifUGux0UfGDAp97EVG52fGRsU/iXX25MKOoIgz5Qy9WacGhWWBXRONLYJR6OO6JHFslgmAy5DfI6soIciSpHZb7nyGqyZ2LVxWb/hMg4/qQX7UWPxsN+gwvGgqKv0m/dXa+l4jAfVIuIq6W7OUFEeTrDWuhhwJTPFc/PAx+g7ahviAvH7JBnv/k9Mb9dnYV7rRAcCaVdE3QAWwd4ASkoz/hIb82kcziNzTy1a/uC7PPtocBiXgBC3d6X9fJwG1gNn6JjrS0NM7TPWw8clt8FFZbK071vlO/S/+dUaG5SQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjxrKjPFZQds5WVF8IDxnIaxCFmmFKKiaeKQ8ufQvIE=;
 b=G9eJ1XMrvoORkc0qqMYKFumsIXKEbUxOGodd/2kqV3F11eMNW9oZat/d2UZl75xaCKaLMi5UqUbAk5H3gfaD8YNVts9bQZdwXr7MZQazOeKZXl78l36ppwyLbtS8EQtWdw/jevZWMGJcymISxyrJeYinghN7qPTIIwhpU//guOZv+ooDbridyCUQZf3hTPumTtGPWYdPOqUkGkoWTJIiGeMRmiuWtXC2k7t6VKTxHzMSU76MYONI5faZvDdGyVVmsBSj2TteWtxfKkbVYwPZZfmcfh6E06e2L74AtwPe9vyqsDeRlyIEODTeG8G4q/Z2LoJy30ST3CKw93U89nZk1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjxrKjPFZQds5WVF8IDxnIaxCFmmFKKiaeKQ8ufQvIE=;
 b=EM7trJgth00TgcOjVIw4Q9QbNRhgP6mPEKsdz0y/gWrpNP+MkPWd/bSqGwUNi75gAHpKGMwb2Mye31BWTtoQOLCUHnSv6EbGqcjFuipeMAnA/u7gPT4gJjfCnesBZlc942t7ENxc1lpf0n6wstHQfQJsm2x90h/EGbD8cmO+laE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 702141cb395c1d91
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSOACYdvrbOytmGBGYCPmmHS7ojooEy8bAgR8dmsIg7t0quAYxddvp9p9JkWN3zHSkCJWSzivNDAyvpoKmGK1FlulKcumLlY5K37Zm0wsNzvzRDb7jCtKbMVV96joQrlzYmiDqI8Gg2hLUI5cr3e6zNhitz1p03Sk0UBosGoRidSsZbR0yQByV1lzmFVibd+bIZU0WnEz91mtA/paDgPyFNxlr6VxrV8+JwbmbVUZ0vp1JFRg1H7mnXJFFstdolJXf6/mtK3qlh8yQq+E9z7FyPd4g4FRBB7kLq/8edbghD1ozE3/1lJXhpIh4ErvZtvi+bVG6PZy636AVFMWjFRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjxrKjPFZQds5WVF8IDxnIaxCFmmFKKiaeKQ8ufQvIE=;
 b=JDkz1Fu3DalGpL5lPBAGMALwweUI9TVMHW4+4KEY6JOgf8t5M+w+rtcYQ0yT3JnvzXpYl7EwRBtiordNTb3lZup6/nbmiMPi4BDu6NKnEHhtqyC42vWyCOPR6E/J6fG6whXEtHVBNrXTtQzz9OHuqUyloh7R7ZUEc2zR2QcB/zioq+pSmtuuSNn4Q0c6jS7ytiPNYpBmNNzmEkbM3Di9ejc8WHfMJ6xn49gnOM43IJ/jyMbXZUqKa271290GmPhdAE73K2hpKfgCNbUlrhKdqZ21xPWje+4ioBKGE6DdQKZHfL73+l5X78e9tffXgtQmQTqGPhe+XHP3p9h+Y91bxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjxrKjPFZQds5WVF8IDxnIaxCFmmFKKiaeKQ8ufQvIE=;
 b=EM7trJgth00TgcOjVIw4Q9QbNRhgP6mPEKsdz0y/gWrpNP+MkPWd/bSqGwUNi75gAHpKGMwb2Mye31BWTtoQOLCUHnSv6EbGqcjFuipeMAnA/u7gPT4gJjfCnesBZlc942t7ENxc1lpf0n6wstHQfQJsm2x90h/EGbD8cmO+laE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>, osstest service owner
	<osstest-admin@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [linux-linus test] 174539: regressions - FAIL
Thread-Topic: [linux-linus test] 174539: regressions - FAIL
Thread-Index: AQHY6+CQ4VZAde/T6k6I0fM4JzEhfa4ptwOAgAG0q4CAAhQYgA==
Date: Thu, 3 Nov 2022 17:43:21 +0000
Message-ID: <3BA37602-681E-4A1F-8C01-0DAB8FB9262B@arm.com>
References: <osstest-174539-mainreport@xen.org>
 <3c8a3be2-db65-253d-94ae-1bfcad1b94e2@suse.com>
 <ea2ac746-bed1-c43a-62e5-d2e693bef6f6@suse.com>
In-Reply-To: <ea2ac746-bed1-c43a-62e5-d2e693bef6f6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB6464:EE_|VI1EUR03FT027:EE_|PAXPR08MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a58d307-5148-459d-865d-08dabdc2ed58
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TLK47104wnaQMuNIL3BCDm1xYvjshFDqBg+mDDZcAVdOnUTT5nJwi/17sFntO7Mgms7otbk8h5F8aZL35U5602yaBcTP6lvhPdizKRgMYodx/wqqCagIhEUjm17fmiw451/iRzhekw4OYZoauWP+2i4grfzvbij6Lz+JN+rifhxWpeZkvG98O2p9MwJuU5TaIim0yRt/RZzCcd8dZBw6oHUQgbqM+V7cZLtgk/1ubwLS/84yzpEEfkiF6MOKFTVMjFkI6co6LJQZZ0IDQgcd4KC4fx4G8EfU79XN1bYcb2xt68z+d10AmG9WXHDLv2u82i9iGKs0xdAsIS6U0j8zspwaWnUO2KzcN969VdvwlWeuGfiC8vyCcBj42RmRrqKYM9z7QAW7HXqs/76zu3eMKKQJnVGCjk/xtyd9Avf41qn7H4I++ScU07zhA4jW4y5lKAerzw3tn79OUgFgImz5bzS7bTWQg0A4STFm3SUZvtbPiEkor9hNXX8Um5VEEp0xhy3DFBH2ENqECE+3mPq3gkdnTggcuSUvzfDZbnzZc/JhtiaU6g/z0HsS3gW/gjoB/xV5mwo9ee6lRAsCnZCscN2CtmlErggTD47RH5Rg+viNhqgzN7svTZPl+gP7tRdxYBLW/BH1mxKEGCQc2m1wP0zeArEN4ffE0X1+hLd8OjQdvyZpoGKOnOwQ0q1e9a/2Q9ISojNZfE02uf9UtK9mLxA8Kw3xfpWLaiRvS+EJTzrHmx3FAxLdYIP6aLpOHoYUKypzgpGWBvrXNkJB9/gpExm+IlP3bLykApIaJVUNxJHIPhASFmVvRVW8mXCgvXEQDRjaUZqXYgDRN+ymccWejg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199015)(36756003)(38100700002)(33656002)(38070700005)(122000001)(86362001)(6512007)(26005)(316002)(53546011)(478600001)(2616005)(6506007)(966005)(6486002)(71200400001)(64756008)(54906003)(66556008)(91956017)(66476007)(66946007)(2906002)(8676002)(8936002)(4326008)(76116006)(110136005)(5660300002)(41300700001)(186003)(66446008)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD173B526D69E24B9007C387B51B3B13@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6464
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7e55954-0a66-496f-a0c9-08dabdc2e6c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vcQBM7xImmDvl8ZorsPVzmChfWU6SFZGrJ8VqSjFIfPQAtWgY+WhCyKCf7MVnYSVQVBLJUpfOEec64BpAgq1yRpUsCbtiAQe99uSesdAYszJtS8Ih7q59p9KUXwiUHKeFKMFe/4A+C2fmYYDIwvIYK1zGsG9CF3X/SBNu2lpsPRSD8LxtvQvTk8TqpySoSP9lluEYNRGbdth4vOeB8mrcRWdEOo27HrSM4DOnVu/eOyaGLITZ8wGW8bQed+x+otttsdIPJGub9lADbxsp2xdaOi2+oUflCkf5WtiiiKppshP4pd6J77zmVyG1kfLDJljbdb4iZh0SPZ7hfPZh6kzkFMJGKywsrp8ep6zoszDv3hw9hbym+wbTHYZDYp8PtcsnLGNAlab5PYOiCY0V+hwpNiiRa1cVVEOh0ubLVTpG5ArLYdYMWFn7v09CKqQf1cKBEVA9UNDmV8rRHp2wqXCYVDkZHNZ8Mqb4e/dMkvhUcu+2YFpS+O2q7uR3db1sa/VevtMDTqvXPWD5SqWF2aR3sYmjNrZ96HIOZ/0p+t/veLdh2LCIYZCpKEtQXYfLbGYLwPHe5jF+Izsh++J3HN7BY1m+yYzJrf2Mpi/l5q879AbmjL/gkIBp/c9v9dyw9BQjvQrX2tCgvTvnHWaiYw75jbhrSsVSZVrR2TnH++V0/RzPtiCs+WwyPKJCXlt4lEbAAKPWYshmBYtmO095h2WGv7Qd8Oh29M1307ppZaENathj3DAP8TYhs8qP3PK0NrNZdiGYZvN+3PN9SBU4WSUxEO2ZWTaD0uOrqc/44qrEkiLiruUkMb7BYyOGCUUkzyl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(33656002)(6486002)(36756003)(47076005)(186003)(6506007)(2616005)(8936002)(5660300002)(356005)(81166007)(82740400003)(478600001)(966005)(336012)(26005)(53546011)(41300700001)(86362001)(2906002)(83380400001)(8676002)(6512007)(54906003)(40460700003)(70586007)(316002)(70206006)(36860700001)(4326008)(110136005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:43:32.7622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a58d307-5148-459d-865d-08dabdc2ed58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7598

Hi,

+Julien and Stefano

> On 2 Nov 2022, at 09:58, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 01.11.2022 08:56, Juergen Gross wrote:
>> On 29.10.22 23:50, osstest service owner wrote:
>>> flight 174539 linux-linus real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/174539/
>>>=20
>>> Regressions :-(
>>=20
>> I'm rather sure this is not kernel related, as the issue is occurring on=
ly on
>> Arm and it doesn't seem to be an architecture related issue (the volume =
group
>> containing the root file system couldn't be found).
>>=20
>> Could it be an infrastructure problem?
>=20
> Why would such manifest on only linux-linus? Along the lines of what I
> did say in reply to flight 173480's report I continue to think that
> there's an issue with the loading of a driver, perhaps because of a
> bad / missing dependency just on Arm. Sadly the log doesn't have any
> data in that regard (perhaps because of too low verbosity), so I
> suspect finding out can only be done by someone with actual access to
> one of the affected systems.

@Julien or Stefano: Can one of you check this ?

If not I can try next week to get an access on the system and check what
is going on but it might take some time to get in the game.

Cheers
Bertrand

>=20
> Jan
>=20


