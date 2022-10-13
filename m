Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6105FD681
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 10:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421767.667375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiu0J-0008Jt-Mt; Thu, 13 Oct 2022 08:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421767.667375; Thu, 13 Oct 2022 08:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiu0J-0008I6-JU; Thu, 13 Oct 2022 08:55:47 +0000
Received: by outflank-mailman (input) for mailman id 421767;
 Thu, 13 Oct 2022 08:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oiu0I-0008Hh-H4
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 08:55:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2739a3e-4ad4-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 10:55:44 +0200 (CEST)
Received: from DB8PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:100::27)
 by AS4PR08MB8072.eurprd08.prod.outlook.com (2603:10a6:20b:58b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 08:55:42 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::28) by DB8PR06CA0014.outlook.office365.com
 (2603:10a6:10:100::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Thu, 13 Oct 2022 08:55:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 08:55:42 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Thu, 13 Oct 2022 08:55:42 +0000
Received: from bde6d727145e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF626BD7-A0BE-4072-977C-E402D8BDA9A9.1; 
 Thu, 13 Oct 2022 08:55:35 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bde6d727145e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 08:55:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8160.eurprd08.prod.outlook.com (2603:10a6:20b:561::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22; Thu, 13 Oct
 2022 08:55:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 08:55:33 +0000
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
X-Inumbo-ID: d2739a3e-4ad4-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kPunFIc2QdTUBDoA+ZVsO1Ail0pG8uptUwwP4/CD0Fiwb0n14FoPHsSj2hgKD2NXx7G3CPXby71Mf7tv4w82QZe5M/QktTLVdMklHNhNhnd49BNYJ7Y9gb3wnvtgbtZHWnma6pY/tbPfKscM+LcfrvoUfUhQRY3Isrii2gLbBOzoRc3cfgaQujL5iIVr+TU2qwG7uoeylhC/iOYgV9M19EwGnIhKCcSnt/CEpUyNqv3Oh2ShvHjszLqoQA10aRndRkQ6TFGcrgipvENw/MNRqI8arcfbmYcR/ea0HpeoXjIcAKPxKZl/SFn5E/4QhK8xE/sP7LbHBqJwQdN2VNqQ9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udxGqpiBrSXCbidG3f6nKXeFLhYrO410/IowZ/QFxCw=;
 b=QTHAUEN8wIpnfEoD69SE9O3EekEA783Z0c9XbinbHb9SsOEVpgmxpnnJ9/+bV3Mku0+oX8uDi967OL/a9mdTQLxflSDDYjApQWyR2+gTiTYQYF+jwsA7WATTM0UdQHiNKpg+PyDk0jW1lxyOK4HT+JFQLcKaTF46inANNmzHNHz2Fex3n83CrFmZefr0TvYw0oM1R84i8lR4zLZ9cbVzMOwcmkcyPMYJLx7lc5SbjNnHyU7S9SZYSJhDinabb2GUs2xzXVe1gaQaEs/q/+KP9WpVr4IOeUe5lGlhT351TyyUsufOIuvGxgCHJKIlNM1j94jQjj1uThdOunDv5NH/eA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udxGqpiBrSXCbidG3f6nKXeFLhYrO410/IowZ/QFxCw=;
 b=SH6bWuM6KO/hmEvIorFPpbXuOzWfBBUQT2Htkt1dek+gmQHnxDyk+DFZLT5I71iyC/yBQ7kl4Yk/DmmDjNHqLy339S35Ql9OwqTHwKjtihn77ndrfIJMM001PYp+GAmkDEMKfOsXMCsTI3NoyVRTl0a2cbyDuuHqQK9h2t+BE0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHAqkdZA5Lm47D8bSxiCrp4YDLOj0UACzK9Payn9HJCGy6/cET8oVgg5yEqbWMOoGnOeZ8nG9YntTv8JsjtEEWd1TyqqTLoecJraOd9m2djeUiku6zcyMUOrNwxe2ObuC9QefZ7/lXu9LbrunnLUIgok/4qmtpC2EaUmPCvc+kBh2bBqHFmxODYCYihyXVwwB9qkjyeRrO1ISwK5wqbXN4vn57t6XAo2E6YOLfFrmGz7ykWxgTNhD9xI7Nu63NWljaPt3oKLjZamHFwNXxdZp91I2+Fwx7bDlqR+YQxSnD/xB7oQ3KB61XiVuvKY//ABwN1gI6NFRlmBr+zRFpWmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udxGqpiBrSXCbidG3f6nKXeFLhYrO410/IowZ/QFxCw=;
 b=ggvaCQqMI4Lamfxzp0bq6TGHledWnicJot0keRZ89dbC4GbKSfa2Sa1B5J4K3DZDsEUiH4+kbbZSxcuZMVsEvKhWzkkZuRc6MabmilC+vFv//uoL9G7EB5LQa5adFKEYAILD6L+wlhb1d8lvIDWvSK17jb7T8X7gn7Bnjs3NaKEKwbu393MxKt4Pp2g/rZbPM6Ms1E/Bdei+Zo24+/ekpd2wSruCkc6Od8M/Y9aIZMd8cBDXNktU2PuWDVyVSOfwNl/gskT97SWc/qHVOuIzPaOsZBuHYhvwzRn6CioR0s+MMr444jDOP8kxVk0NNTC70M0Lw8oZ/+Tb3W22RjpT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udxGqpiBrSXCbidG3f6nKXeFLhYrO410/IowZ/QFxCw=;
 b=SH6bWuM6KO/hmEvIorFPpbXuOzWfBBUQT2Htkt1dek+gmQHnxDyk+DFZLT5I71iyC/yBQ7kl4Yk/DmmDjNHqLy339S35Ql9OwqTHwKjtihn77ndrfIJMM001PYp+GAmkDEMKfOsXMCsTI3NoyVRTl0a2cbyDuuHqQK9h2t+BE0M=
From: Henry Wang <Henry.Wang@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jason
 Andryuk <jandryuk@gmail.com>
Subject: Ping: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
Thread-Topic: Ping: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
Thread-Index: AQHY2oOIAk0kP8Ly4EylVwyMRp/g6q4DWdEAgABVmDCABXKqgIAC6/6Q
Date: Thu, 13 Oct 2022 08:55:33 +0000
Message-ID:
 <AS8PR08MB7991BCBC2BDFE841FDB9D86B92259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221007193124.20322-1-jandryuk@gmail.com>
 <a4524dcc-36ce-267a-afbd-5785eab73882@citrix.com>
 <AS8PR08MB7991432FC3C0643161277930925E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <CAKf6xpt3LL3tLMEQkxivqVCw-kQhLnZBfjO=kFvim9NwamNkDQ@mail.gmail.com>
In-Reply-To:
 <CAKf6xpt3LL3tLMEQkxivqVCw-kQhLnZBfjO=kFvim9NwamNkDQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 445B5E69966C4E469CACB39D6B78C6FD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8160:EE_|DBAEUR03FT063:EE_|AS4PR08MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6f4d3b-a264-4d48-c70d-08daacf8b56f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8kO8W6XTkYVBdmJFNHTZRfojbfYXLMWt/+VvXT6xu7c0ZBKdtI26VykjYGV2HHu/IFI/BEjfWVmwXizSLy1yMVeMOg+B/79nEs5w7bWZwFKykgNExrrR+BDEUGUfSOq7ED/hYAouE4n6/OBaqKWXYKdEldPVJeQRgivJdsmKgR8+SONzeLOnYTrgoI+0msMqmLECBEp1YZUHWZMmnVPOJOEb9S7TdAIh8IGKzCsfwyBBm1sqZsFC8Ra1NpQs0LfvCt0/Q+sW1H0kzvGes0saiX+MF+KGdaICQlTFY/6+4T2yZ/VO8JOwBnxvnofByQa0GYkWiWYyMjpgDppKf2J/EmcBd/donHBKLZqQvK6c725SPLWZEuUwOwkVjLJyJd+MKro5FRrW+JAzR8lFyVghmWPPZp6ppL/QcROyrGuhu2fy8T9ODw+Ys7CPung1r7vCby6FwLMfoxS1/Auc5yelixl8bH5Rrk7CVLUZRprawqVZ0S0ROWVVAgw8+jEo5vqi80WvDj53x6a7WHZITTuH75WGW5km06vLN1XFw8Zh/j8ssYMg654/H98zZ8C9BVLTjIi9Ppu+AF0XNDzcOATaq926EkGIyp7lvh/1OdU4ByJDAKAQ73rLD2fXHuK0Iu15W8m77o4NK1GPBpkH3bQH9RHW6L2maNySVMVp6Q5KoILG6mT1HPfMJ/c9y8y0HIhUcuWmYvDXvFfQGGc43Jqsnwrh8lW1LMJG1jw4aZHLQKj/zzzPqg+BnUaUiey2XZB8tzKmZnrkbgcD5g/llEHk3g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(86362001)(33656002)(2906002)(8936002)(38070700005)(5660300002)(52536014)(186003)(83380400001)(478600001)(54906003)(110136005)(7696005)(71200400001)(9686003)(26005)(66946007)(6506007)(53546011)(122000001)(4326008)(66476007)(66446008)(66556008)(8676002)(76116006)(64756008)(55016003)(38100700002)(41300700001)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8160
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef2f0800-e2a9-4beb-a1d9-08daacf8b039
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u9/bUmoxfBpUSiJhaOv2Spzb2YuFWZd0s8Hhw8ZWWelh3+y3bZQdXj02DjHCwUy9QX5UsOjb3TeUyJeVORUfCePlHznQoMJFYqFjXTwnVY2Zj94Gnlf4V4+bzpwHik+gNizfn91FVnSPsl5gd/UqNh1miwq/tPoDpqVRNnTz8uKEm6d4dAh1+pHzpg2ab2bps33BO2VKcW0wP15c5sBnQvyLDdpEZks7KgKlQMaJmSRzsAk1Hcg6Jt5B4H8EGojVt8BAkZlJiCtvuO26d7Yoo63K4d1PUbxiPQqZ87N7knY1IoX+XbRsQD8ZWMZz1Lcbw1utsd4y2nSQVKK3I04Y7Z0Ag+Xk0iEBDoyzJPzUi0IHvDa4s7wO84aGXxRg9n9gci6v6j0AyfvMX36SgHE02LQhKOh373/eT4obuIxSpcCTYuWRWMuzDAvuVFdNt1dCDE6cMDKxhAS2LBWDPaS1gheGR8RFjyrtdol+9Oa68jyCN5yPrfZY4ImWFrkEjHUljn9bVSdci++bZ+sDvT3ZRixSLyYSI8qHWGelUBMf7Ww93+61WLbcfUMCZGdhpQH85GX4k8UFxrXJ0XsB4sryabYh01PZBwH8C3teS7K8zzv55203cfpTzmeLc/f5xhE5zHjKaHCM8cUMPrvgCJtWxBrwrNV4gvWm15W5kHe9HHj0Ejs8eBGHvGiKHERfkmlhsx5HoNgChglCOApgx3QyT1KxrBpcmg231s5Spe0kuPdv0EU50Tqj5jbizJc6uabCAzJUC9XrAzZrTuImLuOe5w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(81166007)(356005)(54906003)(110136005)(478600001)(316002)(82740400003)(186003)(336012)(70586007)(70206006)(8676002)(4326008)(107886003)(55016003)(6506007)(5660300002)(26005)(7696005)(53546011)(41300700001)(33656002)(8936002)(40480700001)(52536014)(9686003)(36860700001)(83380400001)(40460700003)(2906002)(86362001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 08:55:42.2058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6f4d3b-a264-4d48-c70d-08daacf8b56f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8072

SGkgQ2hyaXN0b3BoZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
XSBhcmdvOiBSZW1vdmUgcmVhY2hhYmxlIEFTU0VSVF9VTlJFQUNIQUJMRQ0KPiANCj4gT24gRnJp
LCBPY3QgNywgMjAyMiBhdCA5OjEyIFBNIEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBIaSBBbmRyZXcgYW5kIEphc29uLA0KPiA+DQo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNv
b3BlcjNAY2l0cml4LmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFyZ286IFJlbW92
ZSByZWFjaGFibGUgQVNTRVJUX1VOUkVBQ0hBQkxFDQo+ID4gPg0KPiA+ID4gT24gMDcvMTAvMjAy
MiAyMDozMSwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gPiA+ID4gSSBvYnNlcnZlZCB0aGlzIEFT
U0VSVF9VTlJFQUNIQUJMRSBpbiBwYXJ0bmVyX3JpbmdzX3JlbW92ZQ0KPiA+ID4gY29uc2lzdGVu
dGx5DQo+ID4gPiA+IHRyaXAuICBJdCB3YXMgaW4gT3BlblhUIHdpdGggdGhlIHZpcHRhYmxlcyBw
YXRjaCBhcHBsaWVkLg0KPiA+ID4gPg0KPiA+ID4gPiBkb20xMCBzaHV0cyBkb3duLg0KPiA+ID4g
PiBkb203IGlzIFJFSkVDVEVEIHNlbmRpbmcgdG8gZG9tMTAuDQo+ID4gPiA+IGRvbTcgc2h1dHMg
ZG93biBhbmQgdGhpcyBBU1NFUlQgdHJpcHMgZm9yIGRvbTEwLg0KPiANCj4gZG9tNyB1c2VkIGEg
d2lsZGNhcmQgcmluZywgYW5kIGRvbTEwIGNvbm5lY3RlZCB0byBpdCB3aXRoIGEgKGRyaXZlcg0K
PiBsZXZlbCkgc3RyZWFtIHNvY2tldC4NCj4gDQo+ID4gPiA+IFRoZSBhcmdvX3NlbmRfaW5mbyBo
YXMgYSBkb21pZCwgYnV0IHRoZXJlIGlzIG5vIHJlZmNvdW50IHRha2VuIG9uDQo+ID4gPiA+IHRo
ZSBkb21haW4uICBUaGVyZWZvcmUgaXQncyBub3QgYXBwcm9wcmlhdGUgdG8gQVNTRVJUIHRoYXQg
dGhlIGRvbWFpbg0KPiA+ID4gPiBjYW4gYmUgbG9va2VkIHVwIHZpYSBkb21pZC4gIFJlcGxhY2Ug
d2l0aCBhIGRlYnVnIG1lc3NhZ2UuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEph
c29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4NCj4gPiA+DQo+ID4gPiBXZSdyZSBpbnRv
IHRoZSA0LjE3IHJlbGVhc2UgcHJvY2VzcyBub3cuICBBIGJ1Z2ZpeCBsaWtlIHRoaXMgb2J2aW91
c2x5DQo+ID4gPiBzaG91bGQgYmUgY29uc2lkZXJlZCwgYnV0IHdpbGwgbmVlZCBhcHByb3ZhbCBm
cm9tIHRoZSByZWxlYXNlIG1hbmFnZXIuDQo+ID4gPiBDQyBIZW5yeS4NCj4gDQo+IFRoYW5rcywg
QW5kcmV3Lg0KPiANCj4gPiBBbmRyZXc6IFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uIQ0KPiA+
DQo+ID4gSmFzb246IFdvdWxkIHlvdSBtaW5kIGFkZGluZyBhICJGaXhlczoiIHRhZyBmb2xsb3dp
bmcgdGhlIHJ1bGUgZGVzY3JpYmVkDQo+ID4gaW4gWzFdPyBUaGFua3MgdmVyeSBtdWNoISBXaXRo
IHRoaXMgdGFnIGFuZCBwcm9wZXIgcmV2aWV3L2FjayBmcm9tDQo+ID4gbWFpbnRhaW5lcnM6DQo+
IA0KPiBPZiBjb3Vyc2UuICBJdCB3b3VsZCBiZToNCj4gRml4ZXM6IDgyYTgxNzMwN2M1YiAiYXJn
bzogaW5pdCwgZGVzdHJveSBhbmQgc29mdC1yZXNldCwgd2l0aCBlbmFibGUNCj4gY29tbWFuZCBs
aW5lIG9wdCINCj4gDQo+ID4gUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2Fu
Z0Bhcm0uY29tPg0KPiANCj4gVGhhbmtzLCBIZW5yeS4gIFdlJ2xsIHNlZSB3aGF0IGZlZWRiYWNr
IENocmlzdG9waGVyIHByb3ZpZGVzLg0KDQpTaW5jZSB3ZSBhcmUgaW4gdGhlIHByb2Nlc3Mgb2Yg
NC4xNyByZWxlYXNlIGFuZCB0aGUgcmVsZWFzZSBpcyBzdXBwb3NlZCB0bw0KaGFwcGVuIGFmdGVy
IDIgd2Vla3MsIG1heSBJIGhhdmUgeW91ciBmZWVkYmFjayBoZXJlIGZvciB0aGUgcGF0Y2g/DQpU
aGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHRpbWUuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5
DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEphc29uDQo=

