Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C857C95C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 12:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372657.604505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETiY-0000du-J0; Thu, 21 Jul 2022 10:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372657.604505; Thu, 21 Jul 2022 10:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETiY-0000az-G5; Thu, 21 Jul 2022 10:47:42 +0000
Received: by outflank-mailman (input) for mailman id 372657;
 Thu, 21 Jul 2022 10:47:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTDz=X2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oETiW-0000at-N2
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 10:47:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140057.outbound.protection.outlook.com [40.107.14.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89eb8c9a-08e2-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 12:47:39 +0200 (CEST)
Received: from AM6P195CA0092.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::33)
 by VI1PR0802MB2141.eurprd08.prod.outlook.com (2603:10a6:800:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 10:47:35 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::21) by AM6P195CA0092.outlook.office365.com
 (2603:10a6:209:86::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Thu, 21 Jul 2022 10:47:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Thu, 21 Jul 2022 10:47:35 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 21 Jul 2022 10:47:35 +0000
Received: from 7f0ad47bd94d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1E2481A-B09A-4CD8-A179-AB6A415FA4F5.1; 
 Thu, 21 Jul 2022 10:47:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f0ad47bd94d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 10:47:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB2800.eurprd08.prod.outlook.com (2603:10a6:802:1b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 10:47:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 10:47:12 +0000
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
X-Inumbo-ID: 89eb8c9a-08e2-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BqNzWhPfrp4npaWEqC1iAmE7/TqonUrAeaRP7nIh12MkifGqJc+Kgdq85GdEnxTZn1xZBPMpCxgGtOW+aBpZhCv7AaJORZPBRcpUjl41YUFonXmAIGolbObSLUaU7z2QdWzlU+PLoq9bg7XR5ebfvTA/QRQCsON1BdoYmkywXUA7VOqdT5ab4nWFChjapTJCSquMkHAxTFi4vVihz3yeEUonrv3S4rpMulGzrJ7OyxlJXgC/j67Tq9Y2vZJA/4v6/MRqLPwBjPxf4A5y+M+RvKy2veuGOWxuiI4cRwWZoqg7fMJgeu6AibmVLVQMFDB6W66Vm0o5RVfffG+bXFr37w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSH43A6qt4zFa+wW0FGzZ4cwVivxVXU9pacBfuLujtU=;
 b=MeI0paRXarau9rLFChco+HybwHp2DGAJWpB46w+br9WbooyN4iRoDPhc41ma1omwvVYz7xSOcPAaMB42z2UKkczrajhXupMN/XKnjbZaBquLzxYKUMKDlewecme90fH0oQz1SN4+J8nYXEYMIF+f59TncbLBaXqn4/PWA6p4bn5Sqmvkq1FLgTr9Q3yed4P53Q13PByxSyazvjf3yDHLEtv7bhgFb+I4KYpkQSqdkIS5u4+3hrvfEJs7C3GilZ7baLPcwa5UBwG9uRZfiyWsiZYBbs9i3lgM9x/N+Bip8GrwN/jgjftoGyyU0A/GJAzV5xKh7P3pGxjGkFP9z6VJCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSH43A6qt4zFa+wW0FGzZ4cwVivxVXU9pacBfuLujtU=;
 b=VCPmm04NoftJsvRvLRDLNruzlC6j5WbPjxGNOt9mbNpfgJ862XHhH5HTiVEYQYqi2lCwJqXy3d3slxLpFh6/OwkVfkqJt00IEUZMEY9XMmpfEg+2aWKPKFkFT/5Gu2vLhvru89jpy+AkwuX9AhmKg2VZRqNV6yf3D4/H4sSLILc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4583c43156cefe7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkN2s00uTGuFPEgETAhu4TOJNZyLyT6+1pP74aSTfXmJR4AHDL+s3PtgaNPUPxe/jLTwazjRf86Ym1Gj6yiD2M0F79IrnFC+1CyJa+iNTYxC9eQl7+/lfetrhIihD7sF2VjtvV6Vq3XpuQzG1uS29J7H3k+JF+gRRfrJaJiDuYq+Y3JllxBAFqNj4asIc3Pe5Y29sE/bwLTeONFsj31JWibCb3CPK+/To/0Huipdlq91PYQqCoyAzJaG3Ds14TmBlJy1mXZYaBMOur4lxU9VK18LkzYhPf0j3wZDwtuMOaYu4bx2cPQPwWOuLJ9LtBHSMq/nKqiGUai8cP+W3oKP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSH43A6qt4zFa+wW0FGzZ4cwVivxVXU9pacBfuLujtU=;
 b=gMspU/jePg85tjeG/E48dvhJwjpCN8BRcJyUNTyFbXqYOzrf7KjXsPqlGV5HLOGWDtmSBmpgBgl+H68cGJZdsV2I9cFD1VUN3DKkqnBLs1WhQoZCVNI6ydSo9IiKzDgtFBkWD9YEXFabYx2/daU5ThGaKgNWXOZP57aaKdfq5pun/Nhw4JYjTkpclPoR4a5rpmmf7tkng+5Hc2NbjKRBbxEo+flad9P0lGjCkOjQYVJwPS2kJ6CqQW9zv9SJiAFGoCd5xqGyH+Liz942GFV5x9crkskdeRs1PVw2cfbUD/yyeXHkvbtnSsqaGNr/Abe1PhdnSoqosta8TiBKEWD3NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSH43A6qt4zFa+wW0FGzZ4cwVivxVXU9pacBfuLujtU=;
 b=VCPmm04NoftJsvRvLRDLNruzlC6j5WbPjxGNOt9mbNpfgJ862XHhH5HTiVEYQYqi2lCwJqXy3d3slxLpFh6/OwkVfkqJt00IEUZMEY9XMmpfEg+2aWKPKFkFT/5Gu2vLhvru89jpy+AkwuX9AhmKg2VZRqNV6yf3D4/H4sSLILc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Michal Orzel <Michal.Orzel@arm.com>
Subject: Re: [PATCH v2 5/5] xen/arm: mm: Reduce the area that xen_second
 covers
Thread-Topic: [PATCH v2 5/5] xen/arm: mm: Reduce the area that xen_second
 covers
Thread-Index: AQHYnGjeDDgZDtcVsUyunSX4tE/BZq2IpaUA
Date: Thu, 21 Jul 2022 10:47:12 +0000
Message-ID: <C72656EE-EA0D-4DF9-AB27-75D0856CC241@arm.com>
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-6-julien@xen.org>
In-Reply-To: <20220720184459.51582-6-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 898a802a-246c-432e-d04d-08da6b066c17
x-ms-traffictypediagnostic:
	VI1PR08MB2800:EE_|AM5EUR03FT014:EE_|VI1PR0802MB2141:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KIIMJhZrjtSrQ4Pwc9bJaBd0Asgo0uypC5jq+KAb/KoCl2k5P332hwf3eXzmH0QVuwCIAfkTyI/C+9TGbNUvRAmXdAwXTeH+YTNGkp1m/XN1VX0419gBZwmS9o+1OxETbrAu3GTwWm4uofTF/Lom/eYipTllXCfjwad1LvQGSA3hnIGYf4cGppkSzfaw0TumZpGXh5vNdHYCU6OZXLbz92L/iykwC0PP6PLE/ppM0fEQKEPVYV+Xmpj6RYm64UGKsadYNBd1U6RnYmpxNB79xDDAZcnE8BJhH1ax+wxrdQnWwGOP5CDNiACvxeUwtsxCEjVvtIQjvlRn6Y9x3DiGlZ/811a43aQDFGiUyUO6xy+VVUqAUROdErD3eqxV7Dtu3gGG2+EumB5eRZMxTc8j8N8kpMpL3wVQxM6s/USjZs9wXePkTQFD7a+q84k0sdev6LzDsLhTQmwQ+XaN6BJp1/s7fA+jZeD99P88d7h7prsO1h1rbxddL3KbuiQgYSDxAXUQcgbayKtFoiNBrtsbZApJk7HoKJn8hgkG/fKlVMlbkguU7eFtRSIVfuuXmCafx5Z6Wu89gHje1c4G0LknrcO7Bmn7SUx5WOVT74LMntveMdLbf0KOLXcw6Y4TLOW86byy+KaBcsWZzUNl5TZTBZKZzL5bKyt0lg2ZAGA/Zockrb1qxEe6YdClGPDuSGvNhwqPilQdbpAVOPHL1vstg8JVsk3CgzkZc3TJtLKmiBcFMD9TwAnYBLTY/hkatp/kQxBpb3HsUwy+MVtfjUW7PdbKykMqZ5xWODS16a5BRMs3c0FDXJQz3JEJ0325FufeHaw+s29NzqKmnBG4fU8ZYQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(64756008)(71200400001)(54906003)(6916009)(41300700001)(26005)(53546011)(478600001)(6506007)(6486002)(6512007)(8936002)(2906002)(4744005)(5660300002)(76116006)(66946007)(91956017)(316002)(4326008)(66446008)(66476007)(66556008)(8676002)(33656002)(122000001)(36756003)(86362001)(38070700005)(38100700002)(2616005)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60225FBE3A31DD4789BA7928579736D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2800
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6338256f-11a6-4d3c-f216-08da6b065e61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fl6uoo4AXTKcyvWLqZ0j1IgkHiQaRL2FbcEx/3d5zlTHAV9XZwyeb42yWm71nAGszkI2xGzFU3TLsAWEiaB/QeW7nvrhx+Kf1J29hvZpLfLbm99M0AY5lAT6nF67FJqJEcsGhGdkjN1JnlbqRLe4r4KbonEGJWe4KFrQjSS/w9NDnqnxaYcEG9BgwnmGKavXF7H9oa/DHQYEFZZn7JklrIHAUWxCBKGSD50rXdyuKDXKT6DEEiFCikCcfKpBVTGNeClJW5q8dvJ6O6sXv4QP34NVrsPpPLgAwK+ROkPFBfLf4z9W7hWFBW71kvFFIX/9EWOtEZOUSb4Tcc/Ss1AnhapJ/pZHCT5+bmzk7grHdkMQsV9VFRSD8+z79Bl9B/By0kAF1hKLm9DYk0qTSDQ9+D8YEpeOdFABLE7gH14n1cuALe+HzGTc/yXOwUzHVXsIEZE2ixR1qJulUQbhXyuLw4wdQU41x6oWjxUXlIbC71Sfabup9GQQzaJBl2gyJN1wCEjp2nU8mK+vN4DoQwnX0WDyYEpQ/Dbn358tGdiTS0Nkm98INNK48jEMthZ64tOxj6pU1zCn6q93nje8u2bBbxq8u1EYotcUKC4FWmHw9gbEGIZdLnDrQi+qf0onlJ3zAnPJrREHQPZlNcgWCwALPqrE0gUJqCAUj1vD9YTwUyuH51iJ5B3SFI0DnIGuP9eKJfalsIqSRkuiC4DEu9KQDLNKGao7zKCinmqTVeEI1HqiODyVMQ/TlaE9IpYUacsw3CPkPBx3mMXnkk8CJdY4gmeBg5pCbfCWYMbnmboXgCyP9Vmqj6Jvi1isHxz5YaN+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(40470700004)(82740400003)(81166007)(36860700001)(356005)(40480700001)(83380400001)(70586007)(47076005)(336012)(316002)(8676002)(4326008)(33656002)(36756003)(70206006)(186003)(6506007)(478600001)(54906003)(6486002)(82310400005)(40460700003)(41300700001)(26005)(86362001)(6512007)(53546011)(2906002)(2616005)(5660300002)(6862004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 10:47:35.3197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 898a802a-246c-432e-d04d-08da6b066c17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2141

Hi Julien,

> On 20 Jul 2022, at 19:44, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, xen_second is used to cover the first 2GB of the
> virtual address space. With the recent rework of the page-tables,
> only the first 1GB region (where Xen resides) is effectively used.
>=20
> In addition to that, I would like to reshuffle the memory layout.
> So Xen mappings may not be anymore in the first 2GB of the virtual
> address space.
>=20
> Therefore, rework xen_second so it only covers the 1GB region where
> Xen will reside.
>=20
> With this change, xen_second doesn't cover anymore the xenheap area
> on arm32. So, we first need to add memory to the boot allocator before
> setting up the xenheap mappings.
>=20
> Take the opportunity to update the comments on top of xen_fixmap and
> xen_xenmap.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


