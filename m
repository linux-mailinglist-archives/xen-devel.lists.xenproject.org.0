Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904651FA7A
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 12:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324389.546404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0xf-0007UA-5o; Mon, 09 May 2022 10:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324389.546404; Mon, 09 May 2022 10:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0xf-0007RS-22; Mon, 09 May 2022 10:49:55 +0000
Received: by outflank-mailman (input) for mailman id 324389;
 Mon, 09 May 2022 10:49:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11oC=VR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1no0xd-0007RM-1E
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 10:49:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c13941e4-cf85-11ec-a406-831a346695d4;
 Mon, 09 May 2022 12:49:52 +0200 (CEST)
Received: from DB7PR02CA0032.eurprd02.prod.outlook.com (2603:10a6:10:52::45)
 by GV1PR08MB8033.eurprd08.prod.outlook.com (2603:10a6:150:9a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 10:49:48 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::7c) by DB7PR02CA0032.outlook.office365.com
 (2603:10a6:10:52::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 10:49:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 10:49:47 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Mon, 09 May 2022 10:49:47 +0000
Received: from 84f40401e50f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA19423F-48C7-47B4-95EA-BA81C219835E.1; 
 Mon, 09 May 2022 10:49:40 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84f40401e50f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 May 2022 10:49:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 10:49:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 10:49:38 +0000
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
X-Inumbo-ID: c13941e4-cf85-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XuGlKkjAAAShlHyDPRN2Bx5ZOy3UbugYEUcDFSvSmiQ1zV3udJBhGdvd0WlgXwW6rMgBDnpinC7ZRJViYzxua9az8gYag31yPNOXJQEj8Dj+lUoY4TPZeqZ8TGLqH/C2o/A48kxMEK/l2Et7GDocOHVqfsxcNhs3mELT/Or7LRRh95pNZTeJSGDC/9upwOmpyVOwkBOYX1rXRDpR18QiIdAh6C/prAj1CghkmGMbv+H5xbuOdyIcgT3qBXhXxQjqBS2WvYhcK8pZmnuiO9yIk3508OAV4r5fXwT/g+oFkIRIgvzch941t/7EMPqsPIi8AmA4nvBKDbSPvmonf4WasQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxVaQMx+lv0ITeN6nkEB0ETAt3MqVsfGx9fx5K+EEsI=;
 b=Wtj6VQhX+Cq37viFaceI1i6hpibrNscAAXYhGG/jcMxpK+9UNxToAvSEhVZ86unmCiyTINbZg+jb+6oWk52wxLBwFYtOef75mVSvNSTqJBZxrMozOyje1nPb5S4D/z9ZCz7MhusEf1INDgTOS9gQHYPQZTp9RnJFhOhx+5Rysupdm+G8EAYtkVbPIJyQKlKTKjO8yomiNfEJJItvNYndRA88VVrlxtKakOZa3kgi/lRnBtpDPDve/RVQ4ZNu8w2XlctBuIKXepg/ETlZFlupcbKkRQUJrCvo/quZ90f1MWTGFWNxeTKmqNZOXslSHg4mLXTnlVIdTvGgyGqKlFmKzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxVaQMx+lv0ITeN6nkEB0ETAt3MqVsfGx9fx5K+EEsI=;
 b=kxOKGmNg0HquXaA4lCTOVzCccMmWyyR8jB6kenwYapgW0GWe9MtF6ZilrW4Qf+P1qXm446GHiCOPaethJlDz2cXBGp1uoXVBTOFzZRPHtbJNUPegs0HIc0ICjRC3BllGS7qD2WdlfLdn2X+R5zhy9rQQz0zw4JOOjVD6RNSjrX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2dc891999b583186
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MimHVU/747JlH8fqkjmImlwkT4MTgKTqzwegGtwA5RjQP1sDRjnfX5GhQLSSsopQSg2JADl2A3pRu1x2XPjQQ/0hztgKd2DfVWqTt76x3o6JjuHnb6k5n/Hv/uBHAmJnL+ZJ9HxYmM1ChECxPrhnXBuEXfh27CguLsiAQ577UE5qOzCtyozio1wZ+jlCLZ+epMYLUzMeTjJ7wevxoekzd84hIyhSsgc2jis2OqJHKBF4R0PxwMKePMxX2ZPqSfeOYp4rsiTzHIuH1uoPBOaQu7f7+OVpkf89QCQh6Ts1HbqAWYYIopEC8SiCWPjBSfPMX07YdtGj5KwJ7L+1fTsH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxVaQMx+lv0ITeN6nkEB0ETAt3MqVsfGx9fx5K+EEsI=;
 b=fVK+HPkcE6aZpp+KzIHXZGCwAfCjhnZloCdazJ9QJalQqARRwo/eF0+NG3UxfBPOvpnTwD5IxJEeiz9Ir2V6Np8mylyavEAIDA0ts0mQ2PAxo5QHEFT+6/lnNmYAC+HWyZtb1Gseew8xHABl4qzubOvNMbPgdvue95VQspKpK881NsMbeHloSVszVqqUiyfFzoCRMIGXXivGuwYOROKTjVBxnxHXEIXpF25HrQ35GlHe3+JoIhAuQxORLeJPkm3JzhEDPN9NtH5lcvMdvod66wov70Vm87H4XMPvAJPdTLWP+iQohHD3H7gMFUKKuHLBD6833p9JdXMgIujcwrF2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxVaQMx+lv0ITeN6nkEB0ETAt3MqVsfGx9fx5K+EEsI=;
 b=kxOKGmNg0HquXaA4lCTOVzCccMmWyyR8jB6kenwYapgW0GWe9MtF6ZilrW4Qf+P1qXm446GHiCOPaethJlDz2cXBGp1uoXVBTOFzZRPHtbJNUPegs0HIc0ICjRC3BllGS7qD2WdlfLdn2X+R5zhy9rQQz0zw4JOOjVD6RNSjrX4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: Add sb instruction support
Thread-Topic: [PATCH 3/3] xen/arm: Add sb instruction support
Thread-Index:
 AQHYXtGbLw8lUArxPEOQFl634Avmjq0NftKAgADToQCAAAuUAIAH/dMAgAAGbICAAAULAA==
Date: Mon, 9 May 2022 10:49:38 +0000
Message-ID: <3E6AFDF4-A55B-4C7C-ADFB-A451C478661C@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
 <6571ead7-ff94-acb5-1e55-53ae69944bf0@xen.org>
 <E67D129C-DCA4-479E-B8B8-4C7DF8CC92B9@arm.com>
 <d8889ee4-7790-ab93-a5d1-708aa541dd1b@xen.org>
 <15DEAB6E-3130-49E8-87BD-AC82C08C7698@arm.com>
 <0ac6d6c0-4f34-ad1e-c473-2278dd7289c9@xen.org>
In-Reply-To: <0ac6d6c0-4f34-ad1e-c473-2278dd7289c9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d953eeb3-585b-4693-b361-08da31a9a2e6
x-ms-traffictypediagnostic:
	HE1PR0801MB2058:EE_|DBAEUR03FT010:EE_|GV1PR08MB8033:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB8033C3B7DB20F0404288BBED9DC69@GV1PR08MB8033.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9FFdhTB0kH2X21Xc3VJX7lJlpsYGw7EhbNDnt5gBoeWeManw93jySUVQxfSq6Bn/gVo91qNx6SwiYNtZlhLEi7C78RQa4ha4TYkOlR8ZIk/kvJDA5Xg6fBaguJQHIn5Aij/Xe/T8rLIqN9KgA6+Vr0J/Wn7LXLv/YflghqWPzPMxEhdLyCg3syksKZvvhA24JoX5Udik+SepVqRzsGsLHq9Qvgbr4seTnXZVr7m65FjjATL0TRUG1eJp2n7cuZH2tcl9nyeSrviyq3X9/UzoLWC5+JlD2mG9kK/JUN1qHXbnCpw9n55oaNRhYmbZBHIZF1NWMbUNPtP52AE0EV+hRzeblNkwW5R1jA8jSwjvfuwj6KLfNc84OkP4pk8e8MDcrzf8V9QVJY/p+hOZEPgZkd9H3Mv4UyhqSSsx2iELzK6/aUQ4MVH0D0SyqM5h3dFstNev/8FtIGrAlMea/OfDyQPk5y6pwZ7gtCBOtBwRpUUsYT0IDX9QgY1eZMvfpLnELQiVdGwLHOK7kVWjEduFzNoIUtJiUNk6D2L6CPJWUbtKzIcu0gOYRRYAPOF35LCKGVnwkMfVBhPM1jUX6oa3O4+rmxp27hjMvdxS+m8DugIXpSa9JqS9TJwIV07Q7L+Ak16qt2F5Lw3cspxOYYNiw5vOG9Kbp8ftPZMJA925AXB/2r//locC+4R/gzz51USBwxVJKhx0mQ3gmgLJCed1nap4uWXZWbx9zVp6mStFlfNp1aML5JeAIC6Vjt1ZJV9u
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(316002)(38070700005)(2616005)(86362001)(38100700002)(26005)(53546011)(4326008)(5660300002)(6486002)(186003)(6506007)(71200400001)(8936002)(36756003)(91956017)(508600001)(64756008)(2906002)(33656002)(76116006)(66556008)(66446008)(66946007)(66476007)(54906003)(83380400001)(6916009)(8676002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <076F3F001CC9E145B50DFC372D383FEE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2058
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc09accc-3736-4dbf-7e21-08da31a99d79
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	18mTVnRTBtW4/KfhBzft/xs7OUsQgLDjjTvF30EerdnoFBVfLHnjYs1BLhytjvikRkrgruhJ5PXIxGJGo+HfCWEy9ymFg7ISAwbCVWsK9vM4wesxhCH0W7raZsWD5i/Rkr6+NN8hMGOtrWgBeQtzjsJKeMh5KSk0Pvp0KcIx/1P4gzizj4jgeEq6K+nDi+516ibsrQSwK5tLu6lhPGVMh7xkx69xkqxxGSxoaIdKAUeRkgFSXJfZef8I/To08smaFfpJbCGk8pFlE9Cb/Hl4oi+lowk4ZFx7QYS/t9CdF9vH5pGxC5vx2cYx72Dxs6kfmwftk6DjE4z46b+1nmn8EEMLEzmUp97L0TCZaDBUtxtjpLB2ITQ3NNH06EehgHk3ZvNCBZnYgX0plAQOpCeTjjKJ4JYITds1JnAzRvadpVRTPh9GfMjYfAesXGZngU3YcFx/JP5g9fe3bZ2a/eCAsa8QKZ5OQ0gKz9h/hrVE2ND5KMnAZkGe++ugPc5x/xAE+78lmbDz+FZq1RKAr1UcmP1VrFEpCow40N33PrZ+pOtJl1Bj9Mjw1V39PunmAgRtnOyLo3Fpt1HA9bOLTCjKyYmivneptqPGHmk6TKez+ayHQao5K8OuQKV9rfC9atWxX1FozBDGsXTjZlYouGezD5J2MxyhqyRVZACX9V3g+ZWfTa78s8r75+dXGNM5FNFL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(186003)(83380400001)(33656002)(36860700001)(26005)(107886003)(2616005)(2906002)(6512007)(36756003)(336012)(82310400005)(47076005)(40460700003)(6486002)(356005)(86362001)(5660300002)(8936002)(70206006)(54906003)(70586007)(8676002)(6862004)(81166007)(4326008)(6506007)(53546011)(316002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 10:49:47.8452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d953eeb3-585b-4693-b361-08da31a9a2e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8033

SGkgSnVsaWVuLCwNCg0KPiBPbiA5IE1heSAyMDIyLCBhdCAxMTozMSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDA5LzA1LzIwMjIgMTE6MDgs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSwNCj4gDQo+
Pj4gT24gNCBNYXkgMjAyMiwgYXQgMDk6MDYsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDA0LzA1LzIwMjIgMDg6MjQsIEJlcnRy
YW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+IEhpIEp1bGllbiwNCj4+PiANCj4+PiBIaSBCZXJ0cmFu
ZCwNCj4+PiANCj4+Pj4+IE9uIDMgTWF5IDIwMjIsIGF0IDE5OjQ3LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+PiBBIG5ldyBjcHVlcnJhdGEgY2FwYWJpbGl0eSBp
cyBpbnRyb2R1Y2VkIHRvIGVuYWJsZSB0aGUgYWx0ZXJuYXRpdmUNCj4+Pj4+IA0KPj4+Pj4gJ3Ni
JyBpcyBkZWZpbml0ZWx5IG5vdCBhbiBlcnJhdHVtLiBFcnJhdGEgYXJlIGZvciBzdHVmZiB0aGF0
IGFyZSBtZWFudCB0byBiZSBzcGVjaWZpYyB0byBvbmUgKG9yIG11bHRpcGxlKSBDUFUgYW5kIHRo
ZXkgYXJlIG5vdCBwYXJ0IG9mIHRoZSBhcmNoaXRlY3R1cmUuDQo+Pj4+PiANCj4+Pj4+IFRoaXMg
aXMgdGhlIGZpcnN0IHRpbWUgd2UgaW50cm9kdWNlIGEgZmVhdHVyZSBpbiBYZW4uIFNvIHdlIG5l
ZWQgdG8gYWRkIGEgbmV3IGFycmF5IGluIGNwdWZlYXR1cmUuYyB0aGF0IHdpbGwgY292ZXIgJ1NC
JyBmb3Igbm93LiBJbiBmdXR1cmUgd2UgY291bGQgYWRkIGZlYXR1cmUgbGlrZSBwb2ludGVyIGF1
dGgsIExTRSBhdG9taWNzLi4uDQo+Pj4+IEkgYW0gbm90IHF1aXRlIHN1cmUgd2h5IHlvdSB3b3Vs
ZCB3YW50IHRvIGRvIHRoYXQuDQo+Pj4+IFVzaW5nIHRoZSBzYiBpbnN0cnVjdGlvbiBpcyBkZWZp
bml0ZWx5IHNvbWV0aGluZyB0byBkbyB0byBzb2x2ZSBlcnJhdGFzLCBpZiBhIENQVSBpcyBub3Qg
aW1wYWN0ZWQgYnkgdGhvc2UgZXJyYXRhcywgd2h5IHdvdWxkIHlvdSB3YW50IHRvIHVzZSB0aGlz
ID8NCj4+PiANCj4+PiBJIGFncmVlIHRoYXQgU0IgaXMgdXNlZCB0byBzb2x2ZSBlcnJhdGEgYnV0
IHRoZSBpbnN0cnVjdGlvbiBpdHNlbGYgaXMgbm90IGEgd29ya2Fyb3VuZCAoaXQgbWF5IGJlIHBh
cnQgb2YgaXQgdGhvdWdoKS4gSW5zdGVhZCwgdGhpcyBpcyBhIG1vcmUgZWZmaWNpZW50IHdheSB0
byBwcmV2ZW50IHNwZWN1bGF0aW9uIGFuZCB3aWxsIHJlcGxhY2UgZHNiL2lzYi4NCj4+PiANCj4+
PiBTcGVjdWxhdGlvbiBpcyBuZXZlciBnb2luZyB0byBkaXNhcHBlYXIgZnJvbSBwcm9jZXNzb3Iu
IFNvLCBpbiB0aGUgZnV0dXJlLCB0aGVyZSBtaWdodCBiZSB2YWxpZCByZWFzb24gZm9yIHVzIHRv
IHNheSAiV2UgZG9uJ3Qgd2FudCB0aGUgcHJvY2Vzc29yIHRvIHNwZWN1bGF0ZSIuIFRoaXMgd291
bGQgbWVhbiB1c2luZyBTQi4NCj4+IElmIHRoZSBuZWVkIGFyaXNlIHRoZW4gd2Ugd2lsbCBjaGVj
ayBkZXBlbmRpbmcgb24gdGhhdCBob3cgd2UgY2FuIHN1cHBvcnQgaXQgYnV0IGluIHRoZSBjdXJy
ZW50IHN0YXR1cyBhcyB0aGVyZSBpcyBubyB1c2UgY2FzZSBJIGRvbuKAmXQgdGhpbmsgd2UgbmVl
ZCB0aGF0Lg0KPiANCj4gSXQgaXMgbm90IGNsZWFyIGhvdyBJIHNob3VsZCByZWFkIHRoaXMgYW5z
d2VyLi4uIElmIHlvdSBhZGQgU0IgaW4gY3B1ZXJyYXRhLmMsIHRoZW4gYSB1c2VyIHdpbGwgc3Rh
cnQgdG8gc2VlIG1lc3NhZ2UgbGlrZToNCj4gDQo+ICJlbmFibGVkIHdvcmthcm91bmQgZm9yIFNw
ZWN1bGF0aW9uIEJhcnJpZXIiLg0KPiANCj4gV2hpY2ggaXMgY29tcGxldGVseSBib2d1cy4gUmVw
bGFjaW5nICJkc2I7IGlzYiIgd2l0aCAic2IiIGlzIG1vc3RseSBhbiBvcHRpbWl6YXRpb24gYW5k
IG5vbmUgb2YgdGhlIGN1cnJlbnQgdXNlIHdpbGwgZW5kIHVwIHRvIGJlIGFyY2hpdGVjdHVyYWx5
IGV4ZWN1dGVkLg0KDQpTbyB1bHRpbWF0ZWx5IHNvbWV0aGluZyBsaWtlIHRoaXMgaXMgd2hhdCB5
b3UgYXJlIGxvb2tpbmcgZm9yID8NCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVlcnJh
dGEuYyBiL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYw0KaW5kZXggZTc0NGFiZTgwMC4uN2MzZTUx
NDFhNiAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYw0KKysrIGIveGVuL2Fy
Y2gvYXJtL2NwdWVycmF0YS5jDQpAQCAtNjgxLDkgKzY4MSwxMiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFybV9jcHVfY2FwYWJpbGl0aWVzIGFybV9lcnJhdGFbXSA9IHsNCiAgICAgICAgIC5jYXBh
YmlsaXR5ID0gQVJNNjRfV09SS0FST1VORF9BVF9TUEVDVUxBVEUsDQogICAgICAgICBNSURSX0FM
TF9WRVJTSU9OUyhNSURSX0NPUlRFWF9BNTUpLA0KICAgICB9LA0KK307DQorDQorc3RhdGljIGNv
bnN0IHN0cnVjdCBhcm1fY3B1X2NhcGFiaWxpdGllcyBhcm1fZmVhdHVyZXNbXSA9IHsNCiAjaWZk
ZWYgQ09ORklHX0FSTV82NA0KICAgICB7DQotICAgICAgICAuZGVzYyA9ICJTcGVjdWxhdGlvbiBi
YXJyaWVyIChTQikiLA0KKyAgICAgICAgLmRlc2MgPSAiU3BlY3VsYXRpb24gYmFycmllciBpbnN0
cnVjdGlvbiAoU0IpIiwNCiAgICAgICAgIC5jYXBhYmlsaXR5ID0gQVJNNjRfSEFTX1NCLA0KICAg
ICAgICAgLm1hdGNoZXMgPSBoYXNfc2JfaW5zdHJ1Y3Rpb24sDQogICAgIH0sDQpAQCAtNjk0LDYg
KzY5Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXJtX2NwdV9jYXBhYmlsaXRpZXMgYXJtX2Vy
cmF0YVtdID0gew0KIHZvaWQgY2hlY2tfbG9jYWxfY3B1X2VycmF0YSh2b2lkKQ0KIHsNCiAgICAg
dXBkYXRlX2NwdV9jYXBhYmlsaXRpZXMoYXJtX2VycmF0YSwgImVuYWJsZWQgd29ya2Fyb3VuZCBm
b3IiKTsNCisgICAgdXBkYXRlX2NwdV9jYXBhYmlsaXRpZXMoYXJtX2ZlYXR1cmVzLCAiZW5hYmxl
ZCBzdXBwb3J0IGZvciIpOw0KIH0NCg0KPiANCj4gSSBhcHByZWNpYXRlIHRoaXMgaXMgbW9yZSB3
b3JrIHRvIGFkZCBjcHVmZWF0dXJlLmMuIEhvd2V2ZXIsIEFGQUlLLCB0aGVyZSBhcmUgbm8gcnVz
aCB0byBnZXQgdGhpcyBvcHRpbWl6YXRpb24gaW4gKHNlZSB3aHkgYWJvdmUpIGFuZCBtdWRkeSAo
ZXZlbiB0ZW1wb3JhcmlseSkgdGhlIGxvZ3MuDQoNClRoZSB1cHBlciBJIGFtIG9rIHRvIGRvIGJ1
dCBpZiB3ZSB3YW50IHRvIGRlc2lnbiBzb21ldGhpbmcgbmV3IHRvIGhhbmRsZSBwb3NzaWJsZSBm
ZWF0dXJlcyBhbmQgbW92ZSB0aGlzIHRvIGNwdWZlYXR1cmUsIHdlIHdpbGwgbmVlZCB0byBzdGVw
IGJhY2sgYW5kIGNoZWNrIG1vcmUgcG9zc2libGUgdXNlIGNhc2VzIGFuZCBob3cgd2Ugd2FudCB0
byBoYW5kbGUgdGhlbS4NCg0KVGhpcyBpcyB0aGUgcGFydCB3aGljaCBJIGRvIG5vdCB3YW50IHRv
IGhhbmRsZSBpbiB0aGlzIHNlcmllLg0KUG9pbnQgaGVyZSBpcyB0byBlbmFibGUgdGhlIHVzZSBv
ZiB0aGUgcHJvcGVyIGluc3RydWN0aW9uIHdoZW4gcG9zc2libGUgb24gbmV3IHByb2Nlc3NvcnMg
KG5hbWVseSBOZW92ZXJzZSBOMiBhdCB0aGUgbW9tZW50KS4NCg0KSXMgZG9pbmcgaXQgbGlrZSB0
aGlzIChtYXliZSB3aXRoIGEgVE9ETyB0byBzYXkgdGhhdCB0aGlzIHNob3VsZCBiZSBtb3ZlZCB0
byBjcHVmZWF0dXJlKSBvayBmb3IgeW91ID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

