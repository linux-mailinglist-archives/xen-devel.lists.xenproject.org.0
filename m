Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D061B61F015
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439225.693245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzBz-00032m-JP; Mon, 07 Nov 2022 10:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439225.693245; Mon, 07 Nov 2022 10:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzBz-000302-FA; Mon, 07 Nov 2022 10:17:23 +0000
Received: by outflank-mailman (input) for mailman id 439225;
 Mon, 07 Nov 2022 10:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkz+=3H=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1orzBx-0002zp-PR
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:17:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d013403-5e85-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 11:17:20 +0100 (CET)
Received: from AS8PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::28)
 by GVXPR08MB7894.eurprd08.prod.outlook.com (2603:10a6:150::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11; Mon, 7 Nov 2022 10:17:15 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::42) by AS8PR04CA0203.outlook.office365.com
 (2603:10a6:20b:2f3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Mon, 7 Nov 2022 10:17:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 10:17:14 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Mon, 07 Nov 2022 10:17:14 +0000
Received: from 0419c6185c35.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EFDCE1D7-B16C-425E-93EA-FD575ED8E8E4.1; 
 Mon, 07 Nov 2022 10:17:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0419c6185c35.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Nov 2022 10:17:09 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by PR3PR08MB5772.eurprd08.prod.outlook.com (2603:10a6:102:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 10:17:08 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::461b:c1cb:368c:707e]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::461b:c1cb:368c:707e%5]) with mapi id 15.20.5813.011; Mon, 7 Nov 2022
 10:17:08 +0000
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
X-Inumbo-ID: 5d013403-5e85-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lZvBsns65oPmkgZ+DGzFvLJyx3KhHmsoftJh4Y96o2qPwMlGSYxl+DKzUf439HAMrUFvI0LuL5/T8wLHyoxkXJOjf7NUW93kvgb2FFmpZTw1etk6GHavw80GJ8xV0qS8X4t5WwrVcb+m9Kz76FQQUBJPJAcoaEvPgs5oZoDA2YlgasqV6w3W7zAwKNY9vVKaa8zbhEvhuTT+nvRt4ExaQJDao0oI1lQWn4wp/u8BKm95D8PgWQI0a41eALAIbAbmq33VL127FR5GQUVc2YPbcvP0lpBH2cV4OUi/IPQDepAM6GDHAQGbfTplT+lFEJEGhKgLYkmOG8L9556VH1nqxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBv5hnaBTQqHm/aC59NGTBldhIyrn+SCQ++O86EPYy0=;
 b=Ym6kBoWpqpc7eQympCjucMbhnSsW5PqAsHTrlkoivFVjMh05/97bVhPAsc5+cbLV9Yz+GZI6LHjq+d0R3o9nuDMreL32DiNUUe+ikgWxYKhzbYd1/p2KnyMq50qklxxLvLAqdMeLh3AVORSRG6iGdZwKrSi1WIg1JloICEb3Idpg9j7LtscqE3KkXBp/j0nw5XKpKzA94Mgt27FCiM/8ZBxzDi8P0b0c1AFNDWuGyJEOGRzbySNCwz76991VMY6AaG0Br5j6kE2UfyZ+iG7XsfcKpeXhFvBbE4fAil7Gz1e6evi26spb6EWsao6scyn7h65MTsdtTy18ZwgvakDDIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBv5hnaBTQqHm/aC59NGTBldhIyrn+SCQ++O86EPYy0=;
 b=zmADT947plb0KjkzTXu8bxs575wr6Dm0O8IgMwBLSxwjQjhAN9DsTxBARc7xQ7CqHosCXyzmS4uZmhf75VVIQs+y9t4+/Ejz4AE8MGATQ4W7Y2oVfVUJ1xoNlckxVnIBhioAGDpNmrXDxJ93pu6Pk5/kEv9DQ6ceSR3mpqQDOL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNIjrELCjp3AnxcnV1D+LnnLygsEiBeO0DJydsgmkftWar30lWLxjT1wA6KhZ3ASayq9iAizGqhhSQp0SEDbvdpGSzP3DG7ZkM0wGRHsvv5/+HXvBIxz8QG47lV51uU7mlx4aKAHkCyOTH59podhOE3BJFEQ5OduRYJmh8ex2cRzu4m5dXgDmhpKZk9CXsLEGrd972xoHLlPEgspxNGDaxOAWcRzH1w7oTFzlAuTlIuRXyu+eHpxSpCmr8+AMnODgb6ZfPXSs7ciIGpxCuhoTRZ8E2ZclqS8ilFhQHHIz4oUbrL49N1F0fbhLjZs3Zv/19uILQm+tI6lfEuRlw8spQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBv5hnaBTQqHm/aC59NGTBldhIyrn+SCQ++O86EPYy0=;
 b=d/ctcfmaR/93XiOefz51Lc23bPbKJNO2cfArU9axs5R7DQs7xkM9JGoNI21eEL0rQgQgF3c8qa57d194MzI8R+VfKmalOjZB6HgJSwqWCnUGgss2V7DTxQ8TTYmDjY1tYsNU/xQOGqNutONvBsw2q50UHqhN2hOARAm/nIepFoQNstoLboI0Li1aGoQRbFmcQ2wCEgAiNbnuS9yBKqVbwmms151DemlZZ7OFNWQ4eQAT4Y3Vvs7y2WRWh1M94P7O8GhbXXPZ3YaSjj6H8lVZL+425kDFTNobUCyuMj1zvp+KsPI5amNaPMd+gTqG1rTAgEn5ykPhF+zuBmJtnpwLOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBv5hnaBTQqHm/aC59NGTBldhIyrn+SCQ++O86EPYy0=;
 b=zmADT947plb0KjkzTXu8bxs575wr6Dm0O8IgMwBLSxwjQjhAN9DsTxBARc7xQ7CqHosCXyzmS4uZmhf75VVIQs+y9t4+/Ejz4AE8MGATQ4W7Y2oVfVUJ1xoNlckxVnIBhioAGDpNmrXDxJ93pu6Pk5/kEv9DQ6ceSR3mpqQDOL8=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 09/11] xen/arm64: create boot-time MPU protection
 regions
Thread-Topic: [PATCH v6 09/11] xen/arm64: create boot-time MPU protection
 regions
Thread-Index: AQHY8DVssS7ibAAWlEawRuPWKxX+kq4yYWYAgACZqiCAADt4AIAACYaw
Date: Mon, 7 Nov 2022 10:17:08 +0000
Message-ID:
 <AM0PR08MB453023F373EC84BD48FB9CD4F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-10-wei.chen@arm.com>
 <f83fdce2-b16e-9ef7-e3b8-d62641907aff@xen.org>
 <AM0PR08MB453082216C4AB04CC8F47612F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <e8b30043-64b3-a8d2-073b-289a1f85f02b@xen.org>
In-Reply-To: <e8b30043-64b3-a8d2-073b-289a1f85f02b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A40723F14849274DAEE1E6E9B954B0F0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|PR3PR08MB5772:EE_|AM7EUR03FT046:EE_|GVXPR08MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6c59f7-9179-4a6a-775c-08dac0a93e17
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZmJ/qyUAjC4L92b/3bECRv96f5oh7BfnQXx4svXBL+l44+vsbbSHSlPhF0j41xH/jIz4UhasZI+RIvxJncYla5eVfNWPtMqI5obCkrppM4N68OXrE8aUDduSlSCkv+oA5RbKd5QDy3sWokcmAjJeiMXLrKJ3Ow2asLUzoGcyIJT33oVrfQQW7e5mD17qEaOuwYDcXRQYpuSTeCs2PZgMozIsx4f+kPq4TKOsHaECscWHle4kEqoQ7MKIbO1ek45Q0CAh5q7CrRxOtiYAOZFefV/JkSvoLQZjQkXB3vLZm/JF6FgB+j0Ngx2N0WhYp3pyDo/rQkX2mbJFAsX4r4jeAKdxOoaYRX3EPLPCrsdudNDumKYlxmdaYF+/P+EodKIbNLA0Oe7o7CMrO/H68S5eiusW2W93ZQsfSXvmm4IXU/XiS07oBcqmZFKuEKHYYRVlwBJeOEon111IPgfs2AcdfjgRkVaQIhcXC0JvwY0F+JKIXPQvTpebk2cOgKaZJEheWenwGZ0yxxutB9jvHSm28q0xGnVoB9IL1FDpiU8O9M1W4SE7Y7/N9ySMurxjHmKu3NiF8UBzDyAKpF6IF1VOttvmVLRXzP4k56EIyZd1023oj0P4JPOT1u81Ymug4SGjDkTrNclnnfHEZPOXA6IE0TpN36DHAkhMdjBulxS8Hn5wBRg//ehLYlM58fuErneWrTw/qaN+pBLpTcKW9hzYZmlLSDi5TFuEYaWlJuGhFXh4WwjWz3FEJCghdSO3JMsdsDb/Yucxg73H0rkB+C5mWA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(33656002)(7696005)(86362001)(53546011)(26005)(9686003)(316002)(54906003)(76116006)(186003)(110136005)(2906002)(52536014)(5660300002)(38100700002)(122000001)(66556008)(66476007)(66946007)(8936002)(55016003)(66446008)(64756008)(41300700001)(4326008)(38070700005)(8676002)(83380400001)(6506007)(478600001)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	faa4c30e-063a-4d22-60c8-08dac0a939fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ncP4ngUd7QBVCvvbiwL/pgn6npCEjdGTVMi6D0T861vyrfueEtmSeR0kZtzNgNp7JQegvK9QqCvP6aTHBAfvMlfY7NW6IdY+8GI2/t4J0GhBZeEvXGFeCNiKgv89kLh+x6NemcmoTh2me/zOnpsSEPl2pzEY4oHnAeJIGTzW2XVaDeb/u2AbxVNTiMqLwGkFbT9clYDwI2BB9u1t6di+v3tjoLxwSxmVdKIvMUr1T50CLW5Ah3/AhDP42Bet9xor5Dpcdwc7N5aYQ0/42K+VydcFECMYUjqonhz8vMwF91oXEJlIYVdH9bRzrvIjKvqlN4k/u89LrHyEGn5mIe9Qm8l2nIW3PWmKSAMFedOA9c4kuBMLpTXGZttN/sAvuSxK3hoURvtOd5RFe2RrF+BfCqIPH90/xJ/K0txM3bjNiyY900ntj/cCvOLsNX6j0j2GmHEumQWjrBLC7I99Kgc+oGE8y3LErQLxD6ejMNvN4zXc6jjMPz26jgUgj/QcTLZLTHfXDLSO0zzpG7+GISbx7cTwzSIR3alcyuipAUwzfzD7OaawEomiEPhK6jY0pRcGqC0bvbGG8M29fB+S4hidXomyXzukOfFEn1ZgOoX9vm7GG/WKsdbUG3NWEMegtnM9oqBaXuXjjcMLMcckRNtirbrGbzmt23aQ/U/IJ4S0M1ijlgUr/EKXUp4gFExb0HNZu7kjBJRiPLjhLYKmCYri9HlaOcb2TromuIUJO+oc5odatlnjrVV6JY2dV8gBGWFdhqh0ml6xT8uzVIgUluiOLg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(52536014)(8936002)(33656002)(5660300002)(40480700001)(41300700001)(40460700003)(86362001)(83380400001)(47076005)(336012)(186003)(82310400005)(7696005)(4326008)(53546011)(6506007)(9686003)(26005)(478600001)(107886003)(81166007)(356005)(82740400003)(55016003)(8676002)(70206006)(70586007)(36860700001)(110136005)(54906003)(316002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 10:17:14.9296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6c59f7-9179-4a6a-775c-08dac0a93e17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7894

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA3LCAyMDIy
IDU6MzAgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgV2VpIENo
ZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgQmVydHJhbmQNCj4gTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
PjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY2IDA5LzExXSB4ZW4vYXJtNjQ6IGNyZWF0ZSBib290LXRpbWUg
TVBVIHByb3RlY3Rpb24NCj4gcmVnaW9ucw0KPiANCj4gT24gMDcvMTEvMjAyMiAwNjo1OSwgUGVu
bnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuDQo+IA0KPiBIaSBQZW5ueSwNCj4gDQo+ID4+
PiArDQo+ID4+PiArLyoNCj4gPj4+ICsgKiBJbiBib290IHN0YWdlLCB3ZSB3aWxsIHVzZSAxIE1Q
VSByZWdpb246DQo+ID4+PiArICogUmVnaW9uIzA6IE5vcm1hbCBtZW1vcnkgZm9yIFhlbiB0ZXh0
ICsgZGF0YSArIGJzcyAoMk1CKSAgKi8NCj4gPj4NCj4gPj4gQXJlIHdlIG9ubHkgZ29pbmcgdG8g
bW9kaWZ5IHRoZSBNUFUgaW4gaGVhZC5TPyBJZiBub3QsIHRoZW4gSSB3b3VsZA0KPiA+PiBkZWZp
bmUgdGhlIGxheW91dCBpbiBjb25maWdfbXB1Lmggc28gdGhlcmUgYXJlIGEgc2luZ2xlIHBvaW50
IHdoZXJlDQo+ID4+IHlvdSBjYW4gcmVhZCBob3cgdGhpcyB3b3Jrcy4NCj4gPj4NCj4gPg0KPiA+
IFdlIHdpbGwgcmVtYXAgWGVuIGluIEMgY29kZXMgaW4gc2V0dXBfbW0oKS4NCj4gPiBUaGUgd2hv
bGUgc3RyYXRlZ3kgaXMgYWxpZ25lZCB3aXRoIE1NVTogYSB2ZXJ5IHNpbXBsZSBzZXR1cChtYXAg
eGVuDQo+ID4gd2l0aCB0aGUgbWF4aW11bSBzaXplLCAyTSkgYXQgc3RhcnQtb2YtdGhlLWRheSwg
YW5kIGEgZml0IG1hcCBpbg0KPiA+IHNldHVwX21tLg0KPiANCj4gVGhlIHN0cmF0ZWd5IHdlIGFy
ZSB1c2luZyBmb3IgdGhlIE1NVSBpcyBjb21wbGV0ZWx5IGJyb2tlbiAobm90IGNvbXBsaWFudA0K
PiB3aXRoIHRoZSBBcm0gQXJtKSBhbmQgdW5uZWNlc3NhcnkuIE15IGxvbmcgdGVybSBnb2FsIGlz
IHRvIGFjdHVhbGx5IHJlbW92ZQ0KPiB0aGUgc3dpdGNoX3R0YnIoKSBhbmQgbW9zdCBvZiBzZXR1
cF9wYWdldGFibGVzKCkgZm9yIGFsbCBzZXR1cCBidXQgY2FjaGUNCj4gY29sb3JpbmcuIFRoaXMg
bWVhbnMgdGhlIGNvbmNlcHQgb2YgYm9vdCBwYWdlcyB3aWxsIG5vdCBleGlzdCBhbnltb3JlLg0K
PiANCj4gRm9yIHRoZSBNUFUsIHdlIHNob3VsZCBhaW0gdG8gZG8gYmV0dGVyIHRoYW4gd2hhdCB3
YXMgZG9uZSBmb3IgdGhlIE1NVS4NCj4gUmlnaHQgbm93LCBJIHNlZSBubyBhcmd1bWVudCBmb3Ig
c3dpdGNoaW5nIE1QVXMgdGFibGUuIEkgYW0gb25seSBzZWVuDQo+IGFyZ3VtZW50IGFnYWluc3Qg
aXQgYmVjYXVzZSB5b3UgbmVlZCB0byBkaXNhYmxlIHRoZSBjYWNoZSBhbmQgaXMgcXVpdGUgZnJh
Z2lsZS4NCj4gDQoNCj4gWy4uLl0NCj4gDQo+ID4+PiArDQo+ID4+PiArICAgIGxkciB4MiwgPVhF
Tl9TVEFSVF9BRERSRVNTDQo+ID4+PiArICAgIG1vdiB4MywgIyhYRU5fU1RBUlRfTUVNX1NJWkUg
LSAxKQ0KPiA+Pg0KPiA+PiBYRU5fU1RBUlRfTUVNX1NJWkUgaXMgdGhlIG1heGltdW0gc2l6ZSBv
ZiBYZW4uIElPVywgWGVuIG1heSBiZQ0KPiA+PiBzbWFsbGVyIGFuZCB5b3Ugd2lsbCBtYXAgbWVt
b3J5IHRoYXQgbWF5IG5vdCBiZSBwYXJ0IG9mIFhlbi4NCj4gPj4gVGhlcmVmb3JlLCB5b3UgbGlr
ZWx5IHdhbnQgdG8gY29tcHV0ZSB0aGUgcmVhbCBzaXplIHRvIGF2b2lkIG1hcHBpbmcNCj4gPj4g
dG9vIG11Y2guDQo+ID4+DQo+ID4NCj4gPiBMYXRlciwgaW4gc2V0dXBfbW0gd2Ugd2lsbCBtYXAg
WEVOIGNvbXBvbmVudHMgYnkgY29tcG9uZW50cywgc3VjaCBhcywNCj4gPiBvbmUgTVBVIG1lbW9y
eSByZWdpb24gZm9yIHJlYWQtb25seS1leGVjdXRhYmxlIHRleHQgc2VjdGlvbiwgb25lIE1QVQ0K
PiA+IG1lbW9yeSByZWdpb24gZm9yIHJlYWQtb25seSBkYXRhIHNlY3Rpb24sIGV0YywgZXRjLg0K
PiA+IFNvIGluIHRoZXJlLCBYRU4gd2lsbCBiZSBtYXBwZWQgZml0bHkuDQo+IA0KPiBCdXQgd2hh
dCBwcmV2ZW50cyB5b3UgdG8gZG8gdGhpcyBub3c/DQo+IA0KPiA+DQo+ID4gSU1ITywgdGhlIG1h
cHBpbmcgaW4gY29tcGlsZXIgd2l0aCBtYXhpbXVtIHNpemUgb2YgWGVuIGlzIGFsc28gd2hhdA0K
PiA+IE1NVSBkb2VzLg0KPiANCj4gV2hpY2ggaXMgYnJva2VuIGJlY2F1c2Ugd2UgZG9uJ3Qga25v
dyB3aGF0IGxvY2F0ZWQgYWZ0ZXIgWGVuIGJpbmFyeS4NCj4gVGhpcyBjb3VsZCBiZSByZXNlcnZl
ZCBSQU0sIGRldmljZSB3aGljaCBtYXkgcmVxdWlyZXMgbm9uLWNhY2hpbmcNCj4gYXR0cmlidXRl
LiBNYXBwaW5nIHRob3NlIHJlZ2lvbnMgd2l0aCBjYWNoaW5nIGF0dHJpYnV0ZXMgaXMgZ29pbmcg
dG8gYnJlYWsuDQo+IA0KDQpVbmRlcnN0b29kIQ0KVGhlbiBJIHdpbGwgbWFwIFhlbiBjb21wb25l
bnRzIGJ5IGNvbXBvbmVudHMgaW4gdGhlIGNvbXBpbGUgdGltZSwNCnRoZW4gbGF0ZXIgdGhlIGZp
cnN0IE1QVS9DYWNoZSBkaXNhYmxlZCB3aWxsIGJlIGVsaW1pbmF0ZWQsIEkgZ3Vlc3MuDQoNCj4g
DQo+IENoZWVycywNCj4gDQo+IFsxXSAyMDIyMTAyMjE1MDQyMi4xNzcwNy0xLWp1bGllbkB4ZW4u
b3JnDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

