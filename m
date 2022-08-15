Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890995930EF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 16:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387546.623846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbLT-0007jL-4H; Mon, 15 Aug 2022 14:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387546.623846; Mon, 15 Aug 2022 14:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbLT-0007gi-1R; Mon, 15 Aug 2022 14:45:35 +0000
Received: by outflank-mailman (input) for mailman id 387546;
 Mon, 15 Aug 2022 14:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1rB=YT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oNbLR-0007gc-RJ
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 14:45:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9b107e3-1ca8-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 16:45:32 +0200 (CEST)
Received: from DB6PR07CA0196.eurprd07.prod.outlook.com (2603:10a6:6:42::26) by
 VI1PR08MB3230.eurprd08.prod.outlook.com (2603:10a6:803:3e::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Mon, 15 Aug 2022 14:45:25 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::ff) by DB6PR07CA0196.outlook.office365.com
 (2603:10a6:6:42::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.14 via Frontend
 Transport; Mon, 15 Aug 2022 14:45:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 14:45:24 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Mon, 15 Aug 2022 14:45:24 +0000
Received: from bb2ba58480a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 293FB1E4-5949-4975-ACA5-704DCDE0F588.1; 
 Mon, 15 Aug 2022 14:45:17 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb2ba58480a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 14:45:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6907.eurprd08.prod.outlook.com (2603:10a6:10:26d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 14:45:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Mon, 15 Aug 2022
 14:45:15 +0000
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
X-Inumbo-ID: e9b107e3-1ca8-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OX6dowWxtsCHTrqGYpJIlp8IqrMxpXlFY9mW3JcTxatSasP9hpj/OhaWCeZ7bGLEaaBVOqF6M1SjTGP7xzYaN1O08CyQBWsSmEJlWwLlmwuy3vnzri3/eXyKrxVmcL6K/voIetx+aQyxDOAKhp7Ebmq9iAbeRISACG35mpS9vpIkSS1Cq8UuZbCR/Aef4LL26lgdqzV8H5gsr5pvfWbj0Pusjgz5i9TrUjasEk/x/kSO5j2a9CqSH9mFjsPqBwVYg6p636LBvjDFIBT1TWG92Qh1qdRh3CqAkSPGSCCIm39onZfiv9bgrTq4b3tAVQb8YIfZKI+W7hNMI5gImYPBtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X499eUT4J2rTCNAIsrSj1W+XPj0roleTYhXsYG1D7Iw=;
 b=TiWz0L3Hwg/1lZcEl43zqDsNvOWgfnwOOqoaGds4TcocpkQEOCYHhDZMAMS7RV+Q/p9yv5rqWDWP/32eawMXw70Tc9iZP+ypyN/Em9ztsaOfk1v+XQj71VpP6jG6aRC27kCvF0CR5NcEd/43asotq3ZP01ZEdbTBpxta39bfqzlt9LW0keOl9MQwR4kNviPOz69c7VSfc5vY9xjsjPTYTEQSQ0WnlC1nrzxo5BENr0KAkC/11GQhcpzwH3mKbXHupGzBdjJ0IOJkrc2u8buqG08LSTQg7xl0P3g3gQwHmoShTQTwzWzd4ONzYsACKMb/YGu4cM9I6UTVl609M7m0Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X499eUT4J2rTCNAIsrSj1W+XPj0roleTYhXsYG1D7Iw=;
 b=W2N1aWDszt4QUc1ca1UBXsOcXx2tFwYVOQceqaYCRoO11a0GLxO1b6OZa6jinrUS8NW8SKgLZwInCilClqOhu4a/aCME4KVL7WSmTiJ+sG9AC0px8R3myQUyUjs8cUjUFa3QxTBqmDc8fmNgZk2d8qQzeY9+Uw7Q0iRR9u4p/U8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: debdbe77fe474927
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTNkwerYi4ZgaCl+onntLspgtATDZLgG7vIRLSNVl1bIoryRzUY4Wn0s7tuCamOUNeA+KpWZqsy55nMqja2PZgMtxKD6lZuvmZXJSexoTzYrBS4dIGLzLA8KQisLEgsn5zNyQpA5JVvo/z6ads6EYH04rSI+dQJt7lcLqMHNEWYn64W6WdJ6wGhRfzRPevl0G3EQaa2R/8u1du3mBDdTrNTiHRBjYFGQEh1iPP/j9RxrxGMINn7TuHVwk3MItaURbXGSR0m8CptqxQTARXgUZFNnbbhD7m3u3AqJLGXSDtxAE4HqOgrIEVC4Gc5eFijwI+xMLVZSOlkDADN4eMwCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X499eUT4J2rTCNAIsrSj1W+XPj0roleTYhXsYG1D7Iw=;
 b=cNjNxY3nUg1WTtASm5ejVcKPhMRAVuM/cmlXJBFS/j2yrSzpQIlNW3VF8Ngh0JeSDc2unM2wdqR2beVA9tYz5wciGdwbilVk9sbCuwEw7ZtuU9CbS+htPbWL3BxrehkDdtp8FKjhHZ5BD7JdVg1cD4V8A4gYDfCIx02jIT76iUj36owYtuEAX1jLULiepQcHMXpImf5mO/Kc0c3ETJZ6IQgxw6v4bueYwfJZQPsVDplpo31irzwV/A4dVHJowwFyaEHFp4mUGK69BBAQbPTtei1WmjDLBSKTNRV85iZUv2YSJ4uWy8cjCn4JYKNAI2Jgk3HTrS1sIIVgHmbKgkUvUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X499eUT4J2rTCNAIsrSj1W+XPj0roleTYhXsYG1D7Iw=;
 b=W2N1aWDszt4QUc1ca1UBXsOcXx2tFwYVOQceqaYCRoO11a0GLxO1b6OZa6jinrUS8NW8SKgLZwInCilClqOhu4a/aCME4KVL7WSmTiJ+sG9AC0px8R3myQUyUjs8cUjUFa3QxTBqmDc8fmNgZk2d8qQzeY9+Uw7Q0iRR9u4p/U8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/7] xen/arm64: head: Introduce get_table_slot() and use
 it
Thread-Topic: [PATCH 2/7] xen/arm64: head: Introduce get_table_slot() and use
 it
Thread-Index: AQHYroFCs26JN7h8TUSY3teW0vzrLK2wDkCA
Date: Mon, 15 Aug 2022 14:45:15 +0000
Message-ID: <8FA138D1-CBF2-4BAB-9283-2573A6A09C79@arm.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-3-julien@xen.org>
In-Reply-To: <20220812192448.43016-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 15ba7412-4d26-4af4-8af4-08da7eccc980
x-ms-traffictypediagnostic:
	DB9PR08MB6907:EE_|DBAEUR03FT049:EE_|VI1PR08MB3230:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Us4CtmM/34saLTu34fpU4qMtoC8S/GUmW5178wQLGE8vj7jwBi7UfNLzEkZsWj2s7OmziuZZIafsniblIhbellWnnuYqAA9OET3RUJD0phIikfRUOfdV13Zxtbtj5Fp64Hn4xxFNXyqWT/lyGiFjXDl1PBuwlxap/qYjLSNEZDggECSZDW3uf0+Ehbo0OyRqzFl+xmcMQa7AV/RW7VhNQgQpD3bQH1+9nV8FSIwJxgyd9xLqvULa/EnNtKJOg/Qh7LneVHR+ZSb1AOgSVVGF6tMeMq5sM/oM6fhRdb5nliQCRKNtWjE/mFMikwdP92oHX039tLTS+Z2wdD2aiMccnXC+xwrB4lW0A2k77MiXcr1TMx6E+mb/dgDDAykA2lWlnX+ugW0fxfipbVFbiTA2Gi5YIhmF6ircRLg8d6vyxrfr08w/mrJ4WraX3CvDchArV3C3aIcsOPK5KOx8HSZnR5wK3IC5WDQVMowBdYU52QPI7CnPbpTlBrnaS6MntsqkA3A2FTv/T2F2oW8DeEHcGli4amB1ugzPh+nHqg+3/OsHWP09gSfZhZxW1E4TDRh2uC8UhP38ChB0luCg6hg23L1eEZDTZ9UXyoelYED9mcJtX9tRC0WZBcX/qWtvuHoiaIm230HtgR0/kVJqGdlK0dvwjkdw1ZCMsmmRq53gBI8ahPgMfDEOztGnkky2BGtjWxc3OIAgR/Q/PUW5BXXf9u9nSpi96fAk6nl3GF6ycE9yq2SVsb6+pOHxaFqDQob4R3CL0xq6Nw8b1rCf00obYee4IzelSP6jvHCh5t+A34igGeOuHAtLxAVsWXIkypRW7jz/4oKjCOvYkqXMTXD++g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(64756008)(66556008)(4326008)(66946007)(66476007)(8676002)(316002)(76116006)(6916009)(54906003)(91956017)(5660300002)(8936002)(2906002)(66446008)(122000001)(38100700002)(33656002)(38070700005)(86362001)(478600001)(6506007)(53546011)(36756003)(71200400001)(41300700001)(6486002)(83380400001)(6512007)(2616005)(26005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3C0E62BC637C44438DB56EAA2E1C6DB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6907
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31e8ccea-5558-4b1e-bbb9-08da7eccc42c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v1esydykq36kAo1zeA+zXImnyS6X4K3SxBN64vS23J0WdBo1FbRIza2GNywaWgpQ3QHZNAKL5/zUb7mzFjr8v5vjXm0j+JNK5Pq+8xzI9FETdLZZz8MrOwRh1RaMRefwy1UgtbHxpIKph5LGZFesdLgDj+sur5Y4PuGPxBPyNcPpJODupy3TPY0cDpLdJ+qrfqYkRReQxwHIx48mOhpQMAQXzopveeW2xOls1TgmS/rLX8qdcD0Bro8pgQgYX1EyW/JZP5zyrL3Xgm5HTPIZYJDDEwnwK3Qz/kVVFuHznz4D+dOI4gH9oEbGADhEh8RtkQwweEIzvZhXXeOmNEuAg8YA//2KvbVOLCE8wFrI2fOTwM3S3ga/xovizQIBjWv72VHHYCrY9Dh/NfEeYDzwf/tPH4tgNvSrgvWU/Wlzfscm1wr3xbAR0KXBLdmab34YBs7i7tLwylqN6TbPwZjTndpmdyP2xniSN3N1vwyteTiCwfdbu4YMblICbdd60cwjXrhtyh3aftOLhMMUCOsBiuyL4dA7lcWvJVqNwDmd3oHHcp58ek8BDAQcpSc5pGxtbzZX3FEjtaPpe5VWtKeJMRPey9WkWSUCzgrSy4DKPomX7t+nU9q08oWcj+dJa/NiWhnnVsdEiUQEvjl0yLupE+LJA6383QW0IH+mx7GNf/wM1D99IN9gfF6VcGwM4mzGqkQT2fB8AHKklLAOOa1EFHBkIDmm+eEA7WDIMc7/pIKbXEL2DcFndp8yAKBUHMr2aYvOEBBcU9f469kOq5oNdZSw72p2+irHKERvsKtyFEH1f8lMWunpoHqYGMGiCwxk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966006)(40470700004)(36840700001)(8936002)(83380400001)(81166007)(82740400003)(356005)(86362001)(36860700001)(40460700003)(70206006)(316002)(70586007)(8676002)(4326008)(54906003)(2906002)(82310400005)(40480700001)(5660300002)(26005)(53546011)(6512007)(41300700001)(6506007)(336012)(47076005)(186003)(107886003)(2616005)(478600001)(6486002)(36756003)(33656002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 14:45:24.5263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ba7412-4d26-4af4-8af4-08da7eccc980
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3230

Hi Julien,

> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> There are a few places in the code that need to find the slot
> at a given page-table level.
>=20
> So create a new macro get_table_slot() for that. This will reduce
> the effort to figure out whether the code is doing the right thing.
>=20
> Take the opportunity to use 'ubfx'. The only benefits is reducing
> the number of instructions from 2 to 1.
>=20
> The new macro is used everywhere we need to compute the slot. This
> requires to tweak the parameter of create_table_entry() to pass
> a level rather than shift.
>=20
> Note, for slot 0 the code is currently skipping the masking part. While
> this is fine, it is safer to mask it as technically slot 0 only covers
> bit 48 - 39 bit (assuming 4KB page granularity).
>=20
> Take the opportunity to correct the comment when finding the second
> slot for the identity mapping (we are computing the second slot
> rather than first).
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

>=20
> ----
>=20
>    This patch also has the benefits to reduce the number
>    of use of {ZEROETH, FIRST, SECOND, THIRD}_SHIFT. The next
>    patch for arm32 will reduce further.
> ---
> xen/arch/arm/arm64/head.S | 55 +++++++++++++++++++++------------------
> 1 file changed, 30 insertions(+), 25 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 26cc7705f556..ad014716db6f 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -493,13 +493,24 @@ cpu_init:
>         ret
> ENDPROC(cpu_init)
>=20
> +/*
> + * Macro to find the slot number at a given page-table level
> + *
> + * slot:     slot computed
> + * virt:     virtual address
> + * lvl:      page-table level
> + */
> +.macro get_table_slot, slot, virt, lvl
> +        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIF=
T
> +.endm
> +

Crawling through the macros to verify the code was not that easy.
This is not related to this patch but XEN_PT_* macros could really do with =
more comments.

Cheers
Bertrand

> /*
>  * Macro to create a page table entry in \ptbl to \tbl
>  *
>  * ptbl:    table symbol where the entry will be created
>  * tbl:     table symbol to point to
>  * virt:    virtual address
> - * shift:   #imm page table shift
> + * lvl:     page-table level
>  * tmp1:    scratch register
>  * tmp2:    scratch register
>  * tmp3:    scratch register
> @@ -511,9 +522,8 @@ ENDPROC(cpu_init)
>  *
>  * Note that all parameters using registers should be distinct.
>  */
> -.macro create_table_entry, ptbl, tbl, virt, shift, tmp1, tmp2, tmp3
> -        lsr   \tmp1, \virt, #\shift
> -        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 :=3D slot in=
 \tlb */
> +.macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
> +        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 :=3D slot in \tlb *=
/
>=20
>         load_paddr \tmp2, \tbl
>         mov   \tmp3, #PT_PT                 /* \tmp3 :=3D right for linea=
r PT */
> @@ -544,8 +554,7 @@ ENDPROC(cpu_init)
> .macro create_mapping_entry, ptbl, virt, phys, tmp1, tmp2, tmp3, type=3DP=
T_MEM_L3
>         and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 :=3D PAGE_ALIGNED(ph=
ys) */
>=20
> -        lsr   \tmp1, \virt, #THIRD_SHIFT
> -        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 :=3D slot in=
 \tlb */
> +        get_table_slot \tmp1, \virt, 3      /* \tmp1 :=3D slot in \tlb *=
/
>=20
>         mov   \tmp2, #\type                 /* \tmp2 :=3D right for secti=
on PT */
>         orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(ph=
ys) */
> @@ -573,9 +582,9 @@ ENDPROC(cpu_init)
> create_page_tables:
>         /* Prepare the page-tables for mapping Xen */
>         ldr   x0, =3DXEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_first, x0, ZEROETH_SHIFT, =
x1, x2, x3
> -        create_table_entry boot_first, boot_second, x0, FIRST_SHIFT, x1,=
 x2, x3
> -        create_table_entry boot_second, boot_third, x0, SECOND_SHIFT, x1=
, x2, x3
> +        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
> +        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
> +        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
>=20
>         /* Map Xen */
>         adr_l x4, boot_third
> @@ -612,10 +621,10 @@ create_page_tables:
>          * XEN_ZEROETH_SLOT, then the 1:1 mapping will use its own set of
>          * page-tables from the first level.
>          */
> -        lsr   x0, x19, #ZEROETH_SHIFT   /* x0 :=3D zeroeth slot */
> +        get_table_slot x0, x19, 0       /* x0 :=3D zeroeth slot */
>         cmp   x0, #XEN_ZEROETH_SLOT
>         beq   1f
> -        create_table_entry boot_pgtable, boot_first_id, x19, ZEROETH_SHI=
FT, x0, x1, x2
> +        create_table_entry boot_pgtable, boot_first_id, x19, 0, x0, x1, =
x2
>         b     link_from_first_id
>=20
> 1:
> @@ -624,11 +633,10 @@ create_page_tables:
>          * then the 1:1 mapping will use its own set of page-tables from
>          * the second level.
>          */
> -        lsr   x0, x19, #FIRST_SHIFT
> -        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 :=3D first slot */
> +        get_table_slot x0, x19, 1      /* x0 :=3D first slot */
>         cmp   x0, #XEN_FIRST_SLOT
>         beq   1f
> -        create_table_entry boot_first, boot_second_id, x19, FIRST_SHIFT,=
 x0, x1, x2
> +        create_table_entry boot_first, boot_second_id, x19, 1, x0, x1, x=
2
>         b     link_from_second_id
>=20
> 1:
> @@ -638,17 +646,16 @@ create_page_tables:
>          * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to =
handle
>          * it.
>          */
> -        lsr   x0, x19, #SECOND_SHIFT
> -        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 :=3D first slot */
> +        get_table_slot x0, x19, 2     /* x0 :=3D second slot */
>         cmp   x0, #XEN_SECOND_SLOT
>         beq   virtphys_clash
> -        create_table_entry boot_second, boot_third_id, x19, SECOND_SHIFT=
, x0, x1, x2
> +        create_table_entry boot_second, boot_third_id, x19, 2, x0, x1, x=
2
>         b     link_from_third_id
>=20
> link_from_first_id:
> -        create_table_entry boot_first_id, boot_second_id, x19, FIRST_SHI=
FT, x0, x1, x2
> +        create_table_entry boot_first_id, boot_second_id, x19, 1, x0, x1=
, x2
> link_from_second_id:
> -        create_table_entry boot_second_id, boot_third_id, x19, SECOND_SH=
IFT, x0, x1, x2
> +        create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1=
, x2
> link_from_third_id:
>         create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
>         ret
> @@ -705,7 +712,7 @@ remove_identity_mapping:
>          * Find the zeroeth slot used. Remove the entry from zeroeth
>          * table if the slot is not XEN_ZEROETH_SLOT.
>          */
> -        lsr   x1, x19, #ZEROETH_SHIFT   /* x1 :=3D zeroeth slot */
> +        get_table_slot x1, x19, 0       /* x1 :=3D zeroeth slot */
>         cmp   x1, #XEN_ZEROETH_SLOT
>         beq   1f
>         /* It is not in slot XEN_ZEROETH_SLOT, remove the entry. */
> @@ -718,8 +725,7 @@ remove_identity_mapping:
>          * Find the first slot used. Remove the entry for the first
>          * table if the slot is not XEN_FIRST_SLOT.
>          */
> -        lsr   x1, x19, #FIRST_SHIFT
> -        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 :=3D first slot */
> +        get_table_slot x1, x19, 1       /* x1 :=3D first slot */
>         cmp   x1, #XEN_FIRST_SLOT
>         beq   1f
>         /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
> @@ -732,8 +738,7 @@ remove_identity_mapping:
>          * Find the second slot used. Remove the entry for the first
>          * table if the slot is not XEN_SECOND_SLOT.
>          */
> -        lsr   x1, x19, #SECOND_SHIFT
> -        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 :=3D first slot */
> +        get_table_slot x1, x19, 2       /* x1 :=3D second slot */
>         cmp   x1, #XEN_SECOND_SLOT
>         beq   identity_mapping_removed
>         /* It is not in slot 1, remove the entry */
> @@ -771,7 +776,7 @@ setup_fixmap:
> #endif
>         /* Map fixmap into boot_second */
>         ldr   x0, =3DFIXMAP_ADDR(0)
> -        create_table_entry boot_second, xen_fixmap, x0, SECOND_SHIFT, x1=
, x2, x3
> +        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
>         /* Ensure any page table updates made above have occurred. */
>         dsb   nshst
>=20
> --=20
> 2.37.1
>=20


