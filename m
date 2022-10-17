Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20B60084E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 10:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424153.671370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okL7a-0000Bt-Hz; Mon, 17 Oct 2022 08:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424153.671370; Mon, 17 Oct 2022 08:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okL7a-00008J-Eu; Mon, 17 Oct 2022 08:05:14 +0000
Received: by outflank-mailman (input) for mailman id 424153;
 Mon, 17 Oct 2022 08:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rSUT=2S=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1okL7Y-00008C-Vd
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 08:05:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bf85e5a-4df2-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 10:05:11 +0200 (CEST)
Received: from FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::22)
 by AM8PR08MB6626.eurprd08.prod.outlook.com (2603:10a6:20b:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 08:05:08 +0000
Received: from VI1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::29) by FR0P281CA0086.outlook.office365.com
 (2603:10a6:d10:1e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.11 via Frontend
 Transport; Mon, 17 Oct 2022 08:05:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT023.mail.protection.outlook.com (100.127.144.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 08:05:07 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 17 Oct 2022 08:05:07 +0000
Received: from 01b07d4b827f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1097AD82-6D22-4A04-A9F2-57A0F61CAA18.1; 
 Mon, 17 Oct 2022 08:04:58 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01b07d4b827f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 08:04:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB5889.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 08:04:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 08:04:54 +0000
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
X-Inumbo-ID: 6bf85e5a-4df2-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=M8vIbddhpuqbKtMvtf9jzoBxBYM21QC7lH32oPIeSQMFdnj6jWufyExg2S49ZJCwowAViNkFnIK/KsziFwBN8ZexHMqsFJlELdREAjkZnEKg9Z4kuSJzGDB6TRp+tYsRKgIj1P1V+b8RtXTGUPlL6x+bIrgHXoyA5uGzyk35zuM9FS/XENpKA/i4NQdtAjqvl4CFZvBcOIXB2/Pvz+CzdznY+hdUmtREjqlPBGipbvM28waTMg/l8URPi4LR0BbjHGGF7YSYjdkdIYokU0Z9GrVgZ9NrK7FEHjxLcZMN2Xcc0/iaOH2Us5095v9jLPsJZ+NG3YHwQSc/XL+fX1kY+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUQTYAAYg6BMKxnHHqfWjbSgA50vz4v+e8fI+kvGXmo=;
 b=JnWBjaFknS8DEMcK0RCWXxWSjYbZVTtWKCKuVF4iHCtcsSW5DBhZ+t/Ia9s42pMhXLaYeynaw4YiOdNjaLk//6XF1APuUJ2E9yhmLobg5J8FFXP27sBxT15WDcu8Yj1GoN+vrBzdEZyQxkylJFOMO/ORZVGM8KfU8lBOceR+CU+32cdGpiLeMzAbR53DJiUoNDEuxbTZ23wYmlk9UwZrI9u6ci1kmrTXbAjiqkQ2Nuo8AbTPGp9xwObUUQPqXp6lnMTXfYaXgGOLyXdX6dcO1Ib2Y6I9X6udzEls19yhxLH2zQEEoQQZUIW3AFUZAs/b7JdBLkg+tYpeSqNESbwyfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUQTYAAYg6BMKxnHHqfWjbSgA50vz4v+e8fI+kvGXmo=;
 b=wnXz09Ec4cLN1IUH5pGaEgo2uckSglcbeqC2olTFad/5VzYPbWfeYr4DkI/ufYeKPgasxDqIIbM5/7EVE5+QL17JH5vbE8DxHBPeluJc3FI5f09QNZ0Z4/la3ZjonHG7RpFriOSRNI1IAZXACNvox0CYloGjGMZnrVWprFP/Fww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnyXGUDReWYO5F4fa7JlJBK22gGYEvzWFWQpErYgZugd4+Oxym6m+59wzZU8rTqWnN3URjanGe3b0+35WBqnZii2do1mm+NJQVbq7t84P5vXqkSzOEUfTN7xB+M/NY2HHFF99d3raD+9/PnD8gwy+1Pv2FzFgn9v5qEF/Pf1Xq0YHwG/6qZY6fB8yawtQtbtWQV62sB44hwbVBtz8wrVnjazSwnrXHgxTj9oA/oAWgRBrvStKw+DKVH9X3TYN0Pko9ip5cySiu1xETPagCbmRfWSYIrLFs/8lwrZCnrtPYxIseLJWI+xJXekD5R9SX7lcGAnFBmia2KKdqJeaT0k7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUQTYAAYg6BMKxnHHqfWjbSgA50vz4v+e8fI+kvGXmo=;
 b=bF7V7neZ5XoZA6i226XsHZdRVvbJh4+QuU6N10Jskt5LuKrFoYbxz3brKFNWUfaKBxN4wvhB9d/t9wexDG42u4SaTE9/hKNMWLmHtwSWsn/RiEmb134PMHLYcaV3Dq5Le1ked6CBCxFJBLtyzYh7SXnmrigcr/96HV5xACrwkNpU71DEbK2k/1F2myDyeRNrYQdQk2V8zBGWGzT7YAsc4eRM8NzVcDd/dzk5UD+eZymKnhVXMR3CMyLmf+/iy5PMr7mvWD0r9KqYLEtG9QEp9AS7WmtjnPBK1HRBW65PH4WuF1Po3ib2B4ucWp2LHzkdTfzPPm1LH60ek+sj/OUIGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUQTYAAYg6BMKxnHHqfWjbSgA50vz4v+e8fI+kvGXmo=;
 b=wnXz09Ec4cLN1IUH5pGaEgo2uckSglcbeqC2olTFad/5VzYPbWfeYr4DkI/ufYeKPgasxDqIIbM5/7EVE5+QL17JH5vbE8DxHBPeluJc3FI5f09QNZ0Z4/la3ZjonHG7RpFriOSRNI1IAZXACNvox0CYloGjGMZnrVWprFP/Fww=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH for-4.17 1/2] docs: Document the minimal requirement of
 static heap
Thread-Topic: [PATCH for-4.17 1/2] docs: Document the minimal requirement of
 static heap
Thread-Index:
 AQHY3q+bU7An58kRd0C18nD7mqtwpK4Nk9IAgAAAuGCAAAmOAIAAAGRggACMTgCABBWckA==
Date: Mon, 17 Oct 2022 08:04:53 +0000
Message-ID:
 <AS8PR08MB79913E2ABF9CB8D9C60EC40292299@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013025722.48802-1-Henry.Wang@arm.com>
 <20221013025722.48802-2-Henry.Wang@arm.com>
 <00c6e7fc-7441-95bb-b7ff-dc78137df0f3@xen.org>
 <AS8PR08MB799119B54A5FE419CDDB9C1592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3cfdcd2b-cc18-0585-d837-f5932d9eeb0f@xen.org>
 <AS8PR08MB7991508880001B08C602881692249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e53601a1-a5ac-897a-334d-de45d96e9863@xen.org>
In-Reply-To: <e53601a1-a5ac-897a-334d-de45d96e9863@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1020805F993F104EA07AE7D48A832AB3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB5889:EE_|VI1EUR03FT023:EE_|AM8PR08MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: 2002c154-7b48-4137-f8dd-08dab0164e61
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YIBDo786MSlfq+ARRu9+37kRvx7tc0r0Akc3v5xks03mr0CP2+O+BOjN2KkAZM7n5pIoYLcusbC9EB946YAyP+4y0zFdBmm08ogruHs/jHpP5FWvphtOtagfwhLTlOzZHfil1lHZzlvmqBM6EU6YefPzSMwMvEVTA8cnBcvS+c7Z/9bXvooYR9Oyl27foH5ws9epRkRvoa5J4A2XdTdxux5ZkznOzrbdTzTJHVd9krRRtvL6jc0qbG6P2bC2rZLalFk2iA8uuJmcTDUZSFoyb2icyaa3zGnai52dykuaYF3iMVxAIeIHTXMsvHPoDU75AUxI90oMvVXaTjLo/mq3KaVdbCCTElLCoiB4jpETTijV9hZLuTsef5aNmunHl/+GGQGYwnyPcRKkSUir/dHeH3u+7I0pfRxJXGg20TfcKajSowjbXBjqMvwSAnicdmVJ42mHoJ3ygkGljb56SxskVZnfLJEjvdkEAfkmFtce/fH5baQ40RW8coaMcliXYYJ+PDgsTbc001o2t6srNzjzDWQm6pw1ECOnUKT3UZSkR5m9TmKEtbltxTP0wUWGYohdj/S4pbtulcq5GXw+Ov3T5SbdVDCX/XZzF48Pk4eUSZvG1m+cHBMLgKDk+HR1HA0S2t/aAozg5h5BQoismMVp06+v9N27h5mg8X8c0ePBAXmAe+zbeeomvTqIMk7vBEbil9nj3ESNWuJr1vhsLJL+Khu9i5B36EBBmDdjnBbv7pYOYihB6w2UWwhXQ3Jd1C1+a8Qut1003rts5q1eqEGbfg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199015)(38070700005)(478600001)(66899015)(71200400001)(38100700002)(122000001)(186003)(33656002)(316002)(4326008)(64756008)(66446008)(66556008)(66476007)(66946007)(110136005)(54906003)(8676002)(76116006)(6506007)(5660300002)(7696005)(26005)(41300700001)(9686003)(52536014)(8936002)(55016003)(86362001)(2906002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5889
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84c3c269-025c-4f8d-14ad-08dab0164638
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZvuNFAYRPmOfboB0XEIRbpOLqaihawwUDxvq6GYpkV8KQy8BoS6EMdLft8zj78ZQ19PLR6pxLW46Ij1dEu4SCmUp8LVpB2Yftc2l704y4pB7L2A0YA3bpOVo2oZoGspWJAwLv83ElSOh/f5trCWZ8X+z4io1QovCT6KD9Z/ZZRQjec3WMoO/goDaJx15Sp2wtkjrZBQoCIS9OKzrx3Vllhk3r596dkGpKorhAdSldiGv2uRaNTnqwu5tdqgE2KeUbg4IeRzE0TV6I56WA2JcTtbvJxPBMMUM607Q0CicqkSrVnNzN0AtHZQNh1CweLdWS1dD5dkhpXcm0Be1LQDUcjNcMMWyy45jlBBgEuTpFNVPklT3t2k+EcbYVNxSYxNPlf1uwNEzoo333UIrN5X01ebowLtS/izRc/7Q37e7S04JrqKPilehw/hWowyD0kMrsYifIPj9e7eu0pfewqzPExzdwDRgEK5926WLx0cumsJYH05r3PpoHBcg7dcWn1eU50cc2Gh2zNkqhUqg2t4oVIEl3031CdEuSNUPXczK70eEZoKKD8o+4ZE0i3ROISoEgkqNoZtulFdoO8mYqh8skuBg9ZONa4c1seYLknSjeDGgLbWbef2bQPDcyrkpZEnqITcPyV29J0cRDgua/oIpDU0oyOsf7+rV3x+9727oxCavdMyyFR2kjC6UrSms4QBpbEDshpjFvJQJ+n1c1ik+UGVlz3IIozkgfT9Q71RwLufpH2ZsTEGeKLMjZXlMa3KZIU0BjBHQJbQnO2yUcsNLqg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(478600001)(81166007)(356005)(66899015)(82740400003)(82310400005)(40460700003)(186003)(33656002)(316002)(8676002)(4326008)(54906003)(110136005)(107886003)(70206006)(70586007)(6506007)(5660300002)(7696005)(36860700001)(26005)(41300700001)(52536014)(8936002)(55016003)(86362001)(40480700001)(9686003)(2906002)(47076005)(83380400001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 08:05:07.6065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2002c154-7b48-4137-f8dd-08dab0164e61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6626

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTcg
MS8yXSBkb2NzOiBEb2N1bWVudCB0aGUgbWluaW1hbCByZXF1aXJlbWVudA0KPiBvZiBzdGF0aWMg
aGVhcA0KPiA+Pj4gSXMgdGhpcyBmb3JtdWxhIHNvbWVob3cgbWFrZSBzZW5zZSB0byB5b3U/IEkg
dGhpbmsgd2UgbmVlZCB0byBoYXZlIGENCj4gPj4+IHJvdWdoIGVzdGltYXRpb24gb2YgdGhlIGxh
c3QgcGFydCAoYm9vdCB0aW1lIGFsbG9jYXRpb24pIHRob3VnaC4NCj4gPj4NCj4gPj4gVGhhdCdz
IGdvaW5nIHRvIGJlIGhhcmQuIEl0IHdpbGwgdmFyeSBkZXBlbmRpbmcgb24geW91ciBzeXN0ZW0g
YW5kIHRoaXMNCj4gPj4gY291bGQgY2hhbmdlIGluIHRoZSBmdXR1cmUgYXMgd2UgYWRkIG1vcmUg
ZmVhdHVyZXMuIEZvciBpbnN0YW5jZSwgSQ0KPiA+PiBleHBlY3QgdGhlIFBDSSBwYXNzdGhyb3Vn
aCB3aWxsIG5lZWQgc29tZSBtZW1vcnkgdG8ga2VlcCB0cmFjayBvZiBhbGwNCj4gPj4gdGhlIGRl
dmljZXMuDQo+ID4+DQo+ID4+IEkgYW0gd29ycnkgdGhlIGZvcm11bGEgd2lsbCBiZWNvbWUgY29t
cGxleC4gSWRlYWxseSB3ZSBuZWVkIHRvIGhhdmUgYQ0KPiA+PiB2ZXJ5IHNpbXBsZSBmb3JtdWxh
LiBJZiB0aGF0J3Mgbm90IHBvc3NpYmxlLCB0aGVuIHdlIG5lZWQgdG8gcHJvdmlkZSBhDQo+ID4+
IHdheSBmb3IgdGhlIHVzZXIgdG8gZXN0aW1hdGUgaXQgYXQgcnVudGltZSAobGlrZSB3aGF0IEkg
c3VnZ2VzdGVkIGJlZm9yZSkuDQo+ID4NCj4gPiBJIGFncmVlLCBJIHRoaW5rIHRoZSBzaW1wbGUg
Zm9ybXVsYSBjYW4gb25seSBiZSBhY2hpZXZlZCBpcyB3ZSBoYXZlIGFuDQo+ID4gZXN0aW1hdGlv
biBvZiB0aGUgd29yc3QgY2FzZSBzY2VuYXJpbyBvZiB0aG9zZSBzY2F0dGVyZWQgbWVtb3J5IHVz
YWdlcy4NCj4gPiBJIHJlbWVtYmVyIEkgb25jZSBoYWQgYSB0cnkgc28gbGV0IG1lIHRyeSB0byBm
aW5kIHRoZSByZXN1bHRzIGJhY2sgdGhhdCB0aW1lLi4uDQo+ID4NCj4gPiBJIGFtIGFsc28gdmVy
eSBpbnRlcmVzdGVkIGluIHRoZSBtZXRob2QgdGhhdCB5b3UgcHJvcG9zZWQgdG8gcHJvdmlkZSBh
DQo+ID4gbWVjaGFuaXNtIGZvciB1c2VycyB0byBnZXQgdGhlIHN5c3RlbSBtZW1vcnkgYWxsb2Nh
dGlvbiBhdCBydW50aW1lLiBCdXQNCj4gPiBJSVVDIHRoaXMgbmVlZHMgc29tZSB3b3JrIGluIGFu
b3RoZXIgc2VyaWVzLiBDb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gaWYgSQ0KPiA+IGFtIHVuZGVy
c3RhbmRpbmcgY29ycmVjdGx5PyBPciBwcm9iYWJseSBYZW4gaGFzIHNvbWUgbWVjaGFuaXNtcyB0
aGF0DQo+ID4gSSBhbSBsaWtlbHkgdW5hd2FyZT8gVGhhbmtzIQ0KPiANCj4gSXQgd2lsbCBkZXBl
bmQgdGhlIHdheSB5b3UgYWNjb3VudCBtZW1vcnkgc3RhdGljYWxseSBhbGxvY2F0ZWQgdG8NCj4g
ZG9tYWlucyBpbiBYZW4uDQo+IA0KPiBXZSBhbHJlYWR5IHByb3ZpZGUgdGhlIHRvdGFsIGFtb3Vu
dCBvZiBtZW1vcnkgaW4gdGhlIHN5c3RlbSBhbmQgaG93DQo+IG11Y2gNCj4gaXMgZnJlZS4gVGhl
IHZhbHVlcyBjYW4gYmUgcmV0cmlldmVkIHVzaW5nIGBgeGwgaW5mb2BgLg0KPiANCj4gICAqIFdo
ZW4gbm90IGFsbG9jYXRlZCwgaXMgdGhpcyBjb25zaWRlcmVkIGZyZWUgb3IgdXNlZD8NCj4gICAq
IEFyZSB0aGV5IGluY2x1ZGVkIGluIHRoZSB0b3RhbCBtZW1vcnk/DQo+IA0KPiBJZiB0aGUgYW5z
d2VyIGlzIG5vIGZvciBib3RoIChwb3NzaWJseSBqdXN0IG9uZSksIHRoZW4gd2Ugd2lsbCBuZWVk
IHRvDQo+IHByb3ZpZGUgZXh0cmEgaHlwZXJjYWxscyB0byBleHBvc2UgdGhlIHNpemUgb2YgdGhl
IHhlbmhlYXAgYW5kIGhvdyBtdWNoDQo+IGlzIGZyZWUuDQoNClRoYW5rcyBmb3Igc2hhcmluZyB5
b3VyIHRob3VnaHRzLiBJIHdpbGwgYWRkIGEgZm9sbG93LXVwIHNlcmllcyBmb3IgdGhpcw0Kd29y
ay4gQmVmb3JlIHdlIGhhdmUgdGhpcyBtZWNoYW5pc20sIEkgdGhpbmsgdGhlIHBhdGNoIDIvMiBz
aG91bGQgYmUNCmRyb3BwZWQuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

