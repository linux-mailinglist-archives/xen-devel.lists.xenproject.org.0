Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B040356875F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 13:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362173.592126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93cL-0004pE-Gl; Wed, 06 Jul 2022 11:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362173.592126; Wed, 06 Jul 2022 11:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93cL-0004lj-Ch; Wed, 06 Jul 2022 11:54:53 +0000
Received: by outflank-mailman (input) for mailman id 362173;
 Wed, 06 Jul 2022 11:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LAHD=XL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o93cJ-0004lV-Um
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 11:54:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70d871c1-fd22-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 13:54:51 +0200 (CEST)
Received: from AS9PR0301CA0043.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::35) by VI1PR08MB5341.eurprd08.prod.outlook.com
 (2603:10a6:803:135::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 11:54:37 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::2c) by AS9PR0301CA0043.outlook.office365.com
 (2603:10a6:20b:469::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Wed, 6 Jul 2022 11:54:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 11:54:36 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Wed, 06 Jul 2022 11:54:36 +0000
Received: from 2c7ba2b4e1d1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5387D24A-7E70-4DA8-ACFC-AB9CA92B7E89.1; 
 Wed, 06 Jul 2022 11:54:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2c7ba2b4e1d1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 11:54:27 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7802.eurprd08.prod.outlook.com (2603:10a6:150:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 11:54:23 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 11:54:23 +0000
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
X-Inumbo-ID: 70d871c1-fd22-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CLUF/MSLPA9KYil+OKtMShXZr7Ew7/Ul40Ok5bvkShr43O94q9AgDTFMQHAZc/c6EDKcURvKdF7UnhP4pTgEJbkxZ0os7QbkxkVxtmceWAoJ9aRXg5oTs0qZgziS8ZRxAJHZDOx4jpnxcnD97YxEq/0baaMn711T2uQsFWK3Cp4rrPugJV3HOtJvt3JnvmccmmQh713ZJqw8Yk7QgyIG7u9ho4MK5fUcHEerZyVmf5i893PYvkgeh1kD9+XsMWVD1Scg2hp+C8FV6qDpG308rZRiZKK7ZAHExFYynLNrXvUgfaaTS7jx4vXWenlaTkuc3gLjkKfwoOblyBM7YX8AgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/a+kled6HyLt2uxnwrnF/nVz0cqm2yf5BD9ZX9pGkM=;
 b=DYeq4yanz+rf8Zn43WbOGeRLb+y6s0R7a0AuVqCtseCy79H7ohtcuWtOEPW3eTedwKSgFBpZIX1prOAyjUo1KeNO/pkhzr9d35o1bNJJY4AoTP6Md2wG+QSWV4XPtdmyh/WwkvPjvv9gRwxAi5djex8jGlIO2rXs5Go7Sul0iB5swOa0P3o2XgEwIPlewyd+lKEReci91sUpMd7uVvNk9vbcZGDy+myQO/Mp74cCuEkjA0tzBp8Sm0ZhDg9rTrAgCVHrOcMVC0zM+azV1B6/M+J3lY42CatEQYoG8n/5tu1mxouwGB0CKjoC+hCTQbOOzVKq+9JxRAOe4RHXiRnFJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/a+kled6HyLt2uxnwrnF/nVz0cqm2yf5BD9ZX9pGkM=;
 b=emjZBZsosNuDGew6kxmh+nO6Jtynl4xF2WaFieMsr+bMSbnFUvVqbPDypbhMxYxzhqOm5X6bTqfsqGr6DKGiBrgAM8xcHsRUkl8hiNaP2dhvZH08qtc7uXZGjlXy7r3k+hWWZeWt2V+fQllnTS4JzDPKga1yFCIiERadplWmD4c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c3f54e82dbc2bca
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALGFwkMc3yKm6E3as209r3tTbxwH70zwGp/Lzk9B8DP7a0J6wO9mPaxmDxO8B1QOiJetRE5jFkfHwmfW+gnHg6nEsNOdhwbWIz64jxbZqAAz3RcQNjjF9UF0V+NVvU34jlwoF0DxcEm5yPrErrFyvu4PDcJB8vSh/0iKmStGo72XeptS0S8cguZ4+22Y93jBp1L5ndc0YJZK6Yb56ZV+9P4uFF2ArfqMQBWxNuGlNGrBVBJbrnGBLoiG+69Z0TO1H0sYBVb1n7AjSvhmHbM7WK4PZx54/ELQDXOhGo5WoyZQbEdtw/iHVmdapkkOSgTQaKKD1rfu742ns2ZEpzPSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/a+kled6HyLt2uxnwrnF/nVz0cqm2yf5BD9ZX9pGkM=;
 b=TTJq60iCAF5EfJyxfCz78ys/ru28U0QcVp1LgqWx61Ebq0+roDJSqfzqPOvGbhO+awAkOq0hiXfxtINHOxsTyqkf+/J5bCK+PgIWungcAnMgxDoYfzr3wWuG/dRT9cdPO3NysgEzxeoHdMl1NkFo0IyCcnFVA2ePjBt8Oxq7zlAoXcS7D6FNY7Bk2HSDVGIDrquwox1c1+MDzTGqxiCc5bTHqv7kLT9tBvFKLYU3fcjWVGsZ/BmhmfojSxcwEOl2YsLAxu9BCSlTLLagw22obLpLMqnmqTQ+7QgAciS5a1nbcZr8Zo4Wj10HA9SPg/yQ61ElKwXvhVwGwHQtgp/gYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/a+kled6HyLt2uxnwrnF/nVz0cqm2yf5BD9ZX9pGkM=;
 b=emjZBZsosNuDGew6kxmh+nO6Jtynl4xF2WaFieMsr+bMSbnFUvVqbPDypbhMxYxzhqOm5X6bTqfsqGr6DKGiBrgAM8xcHsRUkl8hiNaP2dhvZH08qtc7uXZGjlXy7r3k+hWWZeWt2V+fQllnTS4JzDPKga1yFCIiERadplWmD4c=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/8] xen/evtchn: modify evtchn_bind_interdomain to pass
 domain as argument
Thread-Topic: [PATCH 4/8] xen/evtchn: modify evtchn_bind_interdomain to pass
 domain as argument
Thread-Index: AQHYhkXqHHUOFE7Oc0i6xmxR7R1MK61v9xKAgAFapQA=
Date: Wed, 6 Jul 2022 11:54:22 +0000
Message-ID: <78444E5D-3679-44B0-91BD-30A8E71A0413@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <037b30aa5186cff516f8acf17a3a465663a8194a.1655903088.git.rahul.singh@arm.com>
 <ddbf8e3e-d2f4-a7a9-f858-2ca4e5c056be@suse.com>
In-Reply-To: <ddbf8e3e-d2f4-a7a9-f858-2ca4e5c056be@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 457587a8-c567-4da6-2a8f-08da5f464cf1
x-ms-traffictypediagnostic:
	GV1PR08MB7802:EE_|AM5EUR03FT032:EE_|VI1PR08MB5341:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CBtKy2OuQCC/A0jEWCR5SbAkXBNBzqyUGAhuaK5zLSDqGH/rRF22kMr8HCIOrJDSAP9xhfbiqKdRXGDO8i3UKnGh8yfv1XoYVer/CTecsKz8aA1lj+TcvoLGoEzV+rDNIXuPpcQbTA1ypSmRx7eF3QQ3Bfw4TR1BroxrKxLNpBy8+2bbz1F5O58gS7Zs1+XqLHyU1WbZ6hsV9Nq1XcmrPNvWE7Q/HLgIZwyDerG88/DDjZIkXMapgFP9atMtiwx9IoCP3VLD19RykFhOFbvNtDlWXymC/lMQ5hGC6B7Ki+NOPTbQz/AVZrF2uN7ogyW5U7JCOBug2LErWcvS0QHnh6lSSabzLbaxdlRxkGVK03MfX7WuQ30D2FZXmeQ02q/Hu4d/Y6K4s5S6nS6avgbND0Q9lMPOU3TydHoOEjwLuFqoLwWLEw1EceqPhdUJVznby+RuKBfIHCnJLWt8HbGfxG0dtzT9Gj9wiMfI8I8YtZxyUMJx8FkOk0MCN+9pbfH2BdZzGwS7pcccvaS2jzHRFhkztnMuMuLtcch4dt9DQc74J9Zi2qZLF41+dRDUHhfhCbXjjzsQWBtjySVQXtHgzdW74s+5n5QMf84MLmT4pjHctuUn3isHWs9o1eONcDGb/0dgqjFH2XqogkQEoekLRcu1josf2eb0+AL6tfsGodLXaLk0+hmuR6onODtAOW5rmlgEkgZmxy7JgJYqBx6+8TWOJjnhSMnoJJ5tVGFdOJ9jGzXgflzcKKaHWqGHWbfDNnX/INMt/YqzbG/dylxVOgN/8uFr93n3kwS7x8ou0AkJkJyif0dvMlGznzz0TfBAlLzNOj65wkvV60p63Hbl5jVHRoH1nuHhYHnpDe4uFeY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(2906002)(36756003)(2616005)(33656002)(8936002)(186003)(38100700002)(91956017)(41300700001)(53546011)(26005)(4744005)(5660300002)(6512007)(6916009)(76116006)(38070700005)(66946007)(6506007)(4326008)(6486002)(66446008)(64756008)(66556008)(122000001)(8676002)(66476007)(71200400001)(316002)(54906003)(86362001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2A8AEA11D8AFAA40B7D0518281B672B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7802
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8cc2ec4f-c730-4a37-0157-08da5f464484
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EjvKVZJ6w01obYlIJx65bKxTdsj5MhKvbhCOLmQnCy4ZFg/XKg4Vc0GtEdKbXNTnF9PgCSCUya1JfhiACoeW0e8X8bvAY+qoOanUYTVqjNFpNSd8iMbSsYSXP+lkZ3CFLvNCrc/SlLsDE/zxDna3IDRwk53zCu0wdYzyfUMWRuPx7LMds2zStz0u//Tu9s1XLVGLHIGXs5eifmTGZOTdrXEaWkSnpAVpF3SjdeeFi3HUKtOzX9em/iNki5UC4NsFaJXFzgJiLpyZqixsRj615iLLgWP35cJleXImRwwXxdFzj8e93qvYnTLFqTWASjQyZhUzmYH71poc+/aVvLT+P5e4mdM+fkt2xnvH8+b9wUGBoB0R7FLTKrVj2RSAuPLyX+B62u/v6Sjfq+f/HEc6RacYqcMW1M3t/r1W71GAeXyC8OdVG9ZHBSoo8+/lN/m0VZUdQBoQzqbjDf/9Z17y9OxOR14etc6TvEuHaLSF2nypnEsE3r41muQiA7lTDE6SibjuSppByYTKWstPPU6iZCSSxGLlXFSvZdiMJGSw98H3oVfs32dE3XqMCoVB+6CSv5Nq+x817U0DG+YwsnaKgHpkt9/PoUzI2Gsc4m2fP1MDhlWDwBQA3uirGk+tiRbbvkHNThRUKsUNliL+QqgCURzolllRj1tefLb0Y3PdPNK6Dbfn34Ix/Rrs1z0CYExvYo2h+W8LxVvTTsrZbjc1j6K7h18SgBjDtrSwHGd6UmHGXh5dNO12eR3fJb+OXGV5rHwIVfOFmzt9wTNLxaoaUDdQ6B8yZPa0Re6Jz/jwmrz895HC/gPY26xL5NJhwrG3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39860400002)(36840700001)(40470700004)(46966006)(336012)(186003)(40480700001)(47076005)(54906003)(70206006)(70586007)(4326008)(8676002)(36756003)(6512007)(2616005)(26005)(6506007)(53546011)(81166007)(82310400005)(356005)(82740400003)(33656002)(40460700003)(36860700001)(86362001)(41300700001)(2906002)(5660300002)(4744005)(316002)(8936002)(478600001)(6486002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 11:54:36.8944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 457587a8-c567-4da6-2a8f-08da5f464cf1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5341

Hi Jan,

> On 5 Jul 2022, at 4:13 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 22.06.2022 16:38, Rahul Singh wrote:
>> evtchn_bind_interdomain() finds the local domain from "current->domain"
>> pointer.
>>=20
>> evtchn_bind_interdomain() will be called from the XEN to support static
>> event channel during domain creation. "current" pointer is not valid at
>> that time, therefore modify the evtchn_bind_interdomain() to pass
>> domain as an argument.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>=20
> I think this wants folding with the previous patch.

Ack.

Regards,
Rahul


