Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9C5EA578
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411720.654757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmpS-0007Kk-Ax; Mon, 26 Sep 2022 12:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411720.654757; Mon, 26 Sep 2022 12:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmpS-0007IL-6p; Mon, 26 Sep 2022 12:03:18 +0000
Received: by outflank-mailman (input) for mailman id 411720;
 Mon, 26 Sep 2022 12:03:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M8J=Z5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ocmpQ-0007Gn-SA
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:03:16 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50044.outbound.protection.outlook.com [40.107.5.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a2f13a-3d93-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 14:03:15 +0200 (CEST)
Received: from DB6PR0202CA0001.eurprd02.prod.outlook.com (2603:10a6:4:29::11)
 by AS2PR08MB9714.eurprd08.prod.outlook.com (2603:10a6:20b:606::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:03:13 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::38) by DB6PR0202CA0001.outlook.office365.com
 (2603:10a6:4:29::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 12:03:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 12:03:13 +0000
Received: ("Tessian outbound 3c27ae03f5ec:v124");
 Mon, 26 Sep 2022 12:03:13 +0000
Received: from 2b25109b6a7e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1FEB1C5-7798-440C-B1F0-333A6954517C.1; 
 Mon, 26 Sep 2022 12:03:06 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b25109b6a7e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 12:03:06 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS8PR08MB6133.eurprd08.prod.outlook.com (2603:10a6:20b:298::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:03:05 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 12:03:05 +0000
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
X-Inumbo-ID: 33a2f13a-3d93-11ed-9648-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JjAQS/0vNYzna107O28Jsl6sjYrRMEo/xkHFgMMYK6mAyDm35WgY11l7LeOs1iUI+SpFS2QdmAd71mhGG65B/cK35Md5+XPWnVnFeyl+cC/7F8p57QyPZCDDYYIE0WxFw0WRqWAQ+M/2bSshdh78sqvKM6bKDlzqbgWET5Sk6xv3msSOR/xcYbWOJXXIAsm2qfNctxmsmI0ZK5Xu5OSXi8XJF7J9Vq9eFN8CJyHMkTH9eLq7jS33NQgxQlVH+vBf6a/0uYoga/43E4N5WRiPphzEqqpAl1uThGKaisZzk5PQSwkgnVBNcgvqLkgDI/2OhjC8s+RjIZyFLTEC2chIGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzYwX7vb1KK1OgAAwpa2Jya2o8+y4mTZsYXv3yDt33Q=;
 b=DmGR7ur6InIwVqZAPn4aFEds6CPyy3NT3Z3IJ5ejMWfiDdgfFH7HiH1JVZy7S0JPVb94c/cvgDB9OOpsuU1OqPdAq/DCeMvtcsILErhKUp4jCLS7NyJJwigiP74wjq0HJwByhvOv6zSbaOesQ7ODV3pzdh9m63pXLNeVsJCr+XtU9mJylNaHHqI6VSln6PTx2FnKkRSxe/GbZK/OhRG6+08l1DJfuxYalCZ3TD5VKctBcZ2YvjcA2o22Jgo1Xg6K0glrfp+Hc72Efvy0t+V9Nvjiam90a4hcL8pM+gUVQmfPw14whfCjIgjUULq1CgyhAepeeqn7htC8HPxqmfIgBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzYwX7vb1KK1OgAAwpa2Jya2o8+y4mTZsYXv3yDt33Q=;
 b=z8IHs/BN/yfhTI5v+UIeCX8s/Gy/z8mjWkM5UhaYsPF+/dCRI653nvyNxafJnolJYmV64OXxMi83nr9/2PrcmaHio96H9Flqowi27B1/ugp1aA2XKVyjVz+Su18wlB0XxjU3sRAnC/38zZdefrlmm+mUdnT+zoga35Ejopam+UM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69146f1d6f72bd97
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtNiEpul1Osd2b3apko042lrG4HVgTXihqKLy9m1YGt9G8aC8+O6gzsvfyiqMgB37wW8FNwf+YG8YOUhBT23wZziSbGtoEk8n4qDN3yayzONtqBE1PSxaF6yDDEykNg0VIJn9tb+X3Bq4nwEI6ikYEwR0TgSn3xnvmmK/bJMFYb9+3OUcrb4qhALc75mLLYX7Eyi0RuGUCr9fFxlMhWMid+Ad92hAQJ5vIXURWSAYHazmR1mClBOazPyx/LJypjvM2PuwBPCgbqhPf2NyNseGv1bIaHm4QEq1A3IgNGd8OrIm18OOAdwSxx8p7UjGNza3S22h8FNzcfjfPPm546/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzYwX7vb1KK1OgAAwpa2Jya2o8+y4mTZsYXv3yDt33Q=;
 b=RgWQ/vlrlilp7o/dPxe9icbX9Qc+G3u3DI1D4uXg1IYKdUptFzDcze2h8rV1ql9km9kKC5TEAmZdiRQI8xBto65EXw0FM1EHFCnNTnMG4OApCC4inH4Z0ZrgAkBwQY2Wj4JYzeOR/WCeitDCwPQwvIqYxGbOsqC/ZvRgP8QW2uWI3rH64+6bklvymhxTN0Scymd/FzM5GQZKsIO9dtA0yvykDlhZdaEpvxDyOTNx5alKOGw676/takTnzQ6kOiO2CyvnssdXmT+Dou1ncqziPySMvKhR6fyF2Ji6akfjihyyfsEgJ6qyqDvvxmkU9HCjncsglQWDOyFv0BPQvNMyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzYwX7vb1KK1OgAAwpa2Jya2o8+y4mTZsYXv3yDt33Q=;
 b=z8IHs/BN/yfhTI5v+UIeCX8s/Gy/z8mjWkM5UhaYsPF+/dCRI653nvyNxafJnolJYmV64OXxMi83nr9/2PrcmaHio96H9Flqowi27B1/ugp1aA2XKVyjVz+Su18wlB0XxjU3sRAnC/38zZdefrlmm+mUdnT+zoga35Ejopam+UM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 06/10] automation: qemu-smoke-arm32.sh: Modify script
 to use ImageBuilder
Thread-Topic: [PATCH v2 06/10] automation: qemu-smoke-arm32.sh: Modify script
 to use ImageBuilder
Thread-Index: AQHY0ZlPuMCVGNTPOE2yAZ2LVPw1i63xnKoA
Date: Mon, 26 Sep 2022 12:03:05 +0000
Message-ID: <2DAF4A07-AE3D-450B-A440-1B03769AE57E@arm.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
 <20220926110423.26030-7-michal.orzel@amd.com>
In-Reply-To: <20220926110423.26030-7-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS8PR08MB6133:EE_|DBAEUR03FT051:EE_|AS2PR08MB9714:EE_
X-MS-Office365-Filtering-Correlation-Id: b9505f20-25c1-4845-00b3-08da9fb71674
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tKINFJu5LMt9nskBjVCIXu8Gq22U50zbcFYOn/eDRvliy9IKPhklJ9OmIcvP7GQmklnbdb99SBdv3VOEeB67T42nMQTgFIFFynVyUKfv1+7whVg0mRjARTAV0seosqP5fiGOouLOgJ7U9PX5ri559VbqzyIx/3DrivyGikpKVfuD34+PegXjr8bokuNaksscpJ5A6Ot7gFi83WhAwQANxRH4YoVfYr++MENh1/aNDuj4w5OGU55zjTjDlBKSOQZ/dHeX0IbFfc9nOATkMxjT4i8KqtrFgyJ1VwESGGIW22ekjHM4CKjFCnXrC89It3yeZKYHQlwaQdXRBRqXgTp1XeyVkMlM1/NeX75m9Xx/8YFCi66ajCbYcBj9w2THV2XeZIHMZvv8tZly7NzPF9jP2Dc9zDcYxx50GMxP4EDWBFuwkwpTcJprBoBqVw7UizEwqNcp/brP1E1Ce51d1RhxMpTxxELP9/gZEfxXy0ndBtslmoeJL1ghikC6cDbR0KGdI7lgwm48rgFn1iOtXZOB+BpuRBxZE2lFWfXCs8hIpLe71spmpCSVvWY7SC+VB1y2Ki1Pj6GG8YnG1hU820Q+dqtWQroNSuHP0Zz51W7o93EZqedLZfK6ce3Y8T/hM9xuV0pfZ7j1U0zpcjtj6LvHfWEwTVWvaqIqTTjHxYXqFt6kGNDrfha/j8UQFdzrVBReNLBF5WFUd/oB1aaRbPZ9gKUBO2m4FteqQ21YtK4IRL4BdJa1bYmXei29caRPLhmj0WhGKhleRBjcNcPkYIUzPzuDf9TU6lkcUvWREZ4bTfk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(71200400001)(186003)(8676002)(2616005)(316002)(38100700002)(8936002)(4744005)(26005)(53546011)(6512007)(6506007)(86362001)(91956017)(5660300002)(2906002)(38070700005)(478600001)(66556008)(64756008)(66476007)(66446008)(76116006)(54906003)(66946007)(6916009)(122000001)(4326008)(36756003)(33656002)(41300700001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FA584E5C2BB0543B8CE91DEABC441EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6133
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14fcf782-2513-48d2-69e0-08da9fb711fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e0doYlyMKKP7lYEVW2BR/q7+POeBAXy9DJA925t+YR4qdP8E1LpfIj0FN7eERFenQx7cc1g4nGNmvvtuXx+fk2v1r9bglhwxnYsZF8ZswDl+XgK6bYTnowbdomI6eeyaRZK5dbrDgKuiexF1QhBXQub+F3aa/FjxwCUs7VKeFO9YR7tQArsCsRalq+uhPYzyMUa9G9aHkqf7xxMWEZK4dsfBP9A3kt5jIInJKDjf6iQLTZNS9bhIq/j2rJGhqOTmYCmZD9LOaeXut5MnUr7NzE0R4j57vWuaR60SDbPKJt0J2fd8jwwy8z8zxJSqfbnqpOInXQq/ArQJNeQHSqKY05/8dywWFc+afyPHJNstZLXegklFUQ6YITWaNdaKG2QJ43FTDmhC++nraKZ8ey95nX+64WMiFJ7Ywy5Dp2+pw3jkKhQd0jayPNLRG+AQqCYdVrkunw16/tNUknIotygepGsF5AK2///1zTg514u2iwxECodg6EMRjumTDZzFQAJFWBxhMkap8HgNZ30dwN9iQ2h8trWo8QgNdInVhmu0eDkfc1YdTx4hovjjIW0M0MhF2fC+YhZvag/COVJCf1TNezgbdsBjzxdQoAH8QL0O7IAypL5BkLmuPNr20SsQ+cXqbYUPGKCGKMetAH7hIMG5gswFZNk/BqBdExMWM9HGKEUKKW71BAn0cE1YZTTpYGGaRJY2MJFz0F0G77LIfZOKvKkyyDY3980HTNTZ2Xvn+YnJrI7ABH8xTv91PQq9Iejs1kwA89Tpc98MmNcNsWi1Fw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(54906003)(316002)(6486002)(478600001)(70586007)(70206006)(8676002)(4326008)(107886003)(41300700001)(6506007)(36756003)(5660300002)(53546011)(6512007)(26005)(4744005)(6862004)(2906002)(2616005)(8936002)(33656002)(186003)(336012)(36860700001)(47076005)(356005)(40460700003)(82310400005)(81166007)(82740400003)(40480700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:03:13.0722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9505f20-25c1-4845-00b3-08da9fb71674
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9714



> On 26 Sep 2022, at 12:04, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Take an example from arm64 qemu test scripts and use ImageBuilder
> to generate u-boot script automatically. Calculating the addresses
> manually is quite error prone and also we will be able to benefit
> from using ImageBuilder when adding domUs to this test in the future.
>=20
> Install and use u-boot from the debian package.
> Modify the script so that binaries are loaded from u-boot via tftp.
> Remove dtuart=3D/pl011@9000000 because stdout-path in QEMU dtb is always
> set to pl011 node path.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
> - add explanation in commit msg why we remove dtuart path
> ---

Hi Michal,

This looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




