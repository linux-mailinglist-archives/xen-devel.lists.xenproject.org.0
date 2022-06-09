Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B489544B09
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 13:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345135.570781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGhM-0002ql-Kt; Thu, 09 Jun 2022 11:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345135.570781; Thu, 09 Jun 2022 11:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGhM-0002o9-I2; Thu, 09 Jun 2022 11:51:36 +0000
Received: by outflank-mailman (input) for mailman id 345135;
 Thu, 09 Jun 2022 11:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kiA=WQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nzGhK-0002o3-93
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 11:51:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 814e152b-e7ea-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 13:51:32 +0200 (CEST)
Received: from DB9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:10:1db::7)
 by PA4PR08MB5999.eurprd08.prod.outlook.com (2603:10a6:102:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 11:51:29 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::84) by DB9PR06CA0002.outlook.office365.com
 (2603:10a6:10:1db::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Thu, 9 Jun 2022 11:51:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 11:51:28 +0000
Received: ("Tessian outbound ff2e13d26e0f:v120");
 Thu, 09 Jun 2022 11:51:28 +0000
Received: from fb01a8e492f6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FEE024F7-F983-4C49-823C-27D84901509B.1; 
 Thu, 09 Jun 2022 11:51:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb01a8e492f6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Jun 2022 11:51:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6358.eurprd08.prod.outlook.com (2603:10a6:20b:337::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 11:51:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 11:51:20 +0000
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
X-Inumbo-ID: 814e152b-e7ea-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gx3T+tkFoYFFuf0VjAVw4b6bFnCv4V04Z/VegoicZUHo+kylfeIWsMcIewDMyp0owBpKtVGG1KnKEC0zSKT95eUycjrdRvbs+EZPjul7i6Cxpk5Ien6TMRfvXazKRbZVTZQhuhnyR6u/+49Q5eH45L/T1Fr2rQ2maW7duBWxcKbW8eGl2URSwnvChnsvDQWt6UikGGV9PreCwqp8IhDftYAOl2imk2SgtcTh79hNMbyWOW9b9inA0S9zmcL2wJGszD6t8iCTRKqJk7Phc9rZ8y0Ke1f0cuEHTU+LTREiOOoyn/unNtpbJN6TubiD+Q0uPm5gDYj3rUuok1k/8EN75g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMZGG/HZy6KANbMxbw+WZ985zFopS3fJBwcjGW9i9p0=;
 b=FEtyioIFBw6MXboCbOoPRHVRZ7Zpr0NwC7YOxwhpbx114fuK/MXe++WSLITx7vG07SQzUd55fB75cYXlx3UvSfW8kuo8FN1SCJjjSHqb0qFLZ4Ybi3G93kK0INFrn9itP8zIJdgNmOVJHHfS5smdJFZJh2UXnwJty2b5s+KahCA0nB9ueneTndr58aP5TljXqDK+vOTM9cwCSQBORblvWoVVI29XZwxRoFoX9XshNSH9SfpC/TJEcfhi2+tLY2vMl7+kh7YP0R3eFs3jtA7W7pbnteQiyU7WT2XB2Be/ChjQtQiFrhiwc+fcaqnibGJLLypNR0jZ5/HOmzNWLwouAQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMZGG/HZy6KANbMxbw+WZ985zFopS3fJBwcjGW9i9p0=;
 b=7Q0HuxW/QVjWm2d5ooP9g6K1ocSgQS9UE5JLyiipN9akmJK2tndZyLOLR+S2BQChgBVzjVjLNXz+qqzpe6Kzo/1ThrqR4SclfrJiAU9LIusekVfSFIz+Td62mb50Jyw6CA80fO+DbZ/8MdrpzGSNSytCBXiwHq+mDwjf0sJODd4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1afd5b2e6379cff2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQI2U9CXfv5YJ8LbidbZJwyaYhTu97+NB5KHrlAHGaOyo6GHUDA/AVT3EarEiwwe+Gyw3Lt2qz4ojpViOR1765YpO01t7CEHxji0oyQ6D7aqwVk3mVupTt7P6O3Bp5DgjvXeXSMCiRttQenc+7GS8J1LC2oZGVpqXVu1CevxPVpBfLR7D7fEYa8aUqR3EL9brT/jSefw8kpZ/tEDsJYy26cn9ZSznd6npr2ue7DORN3ibsnCGjYNxR8fvobjHo2XVzxAKztFzDLhrgEN2Z7gRfrzOlkN9FHrxMxpx5C3cIym+NCEnRwOKfE2FQSZAAGicu5kUF/8Z+xYY7MLmDOdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMZGG/HZy6KANbMxbw+WZ985zFopS3fJBwcjGW9i9p0=;
 b=KgRtP6qQZWkKJRj1eywqJlTu8nG/jpzt9dAeJSHkMJOZwY2qIz9t4ulaU+7Kgl9+z8cYEfKFGg9NWhPekqq9lNPSWgxxmjFyALy9bfDPMZpH+Elwe9/mHi3BM5DnfIp9Kzjb0EjVCKdCumPsOWqfgqG9Wh7f/NbE1fdWtr2PBl++bLfqzXLKrZt982Pm4Ucfwq/9Stkj1VF+Z6bndwGhe8lWl1T2m9wrqvtblfDJTGKRyQYBfESodXA8/hjlH0za8zjrIa+kStt1AysdR67SG0SPbmmjQBhe0F5UhqsvEe17aEKLyIKm2uPNwoi4rRkZisIrW/kiQSoky3i/vkvLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMZGG/HZy6KANbMxbw+WZ985zFopS3fJBwcjGW9i9p0=;
 b=7Q0HuxW/QVjWm2d5ooP9g6K1ocSgQS9UE5JLyiipN9akmJK2tndZyLOLR+S2BQChgBVzjVjLNXz+qqzpe6Kzo/1ThrqR4SclfrJiAU9LIusekVfSFIz+Td62mb50Jyw6CA80fO+DbZ/8MdrpzGSNSytCBXiwHq+mDwjf0sJODd4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Topic: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Index: AQHYddkD4JsESJA0gkGnWWwykzQjSK1G6E+AgAAC3wCAABeVAA==
Date: Thu, 9 Jun 2022 11:51:20 +0000
Message-ID: <258D1BE1-8E77-4748-A64C-6F080B9C1539@arm.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
 <6EE2C13C-7218-4063-8C73-88695C6BF4CE@arm.com>
 <0d85ad23-a232-eac3-416f-fff4d5ec1a93@suse.com>
In-Reply-To: <0d85ad23-a232-eac3-416f-fff4d5ec1a93@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8f392215-5713-4183-546b-08da4a0e6383
x-ms-traffictypediagnostic:
	AS8PR08MB6358:EE_|DBAEUR03FT041:EE_|PA4PR08MB5999:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB59990D9FE1BB9B6A0C637B099DA79@PA4PR08MB5999.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K7+ZdpfZTsfkPNiJERqiBgSnsfeNNxotVaFvXz3p5bup6x0mNz//puehWo/wqw9+zNBJUWFKT6gMAeodglV9kIH3pgsVha/9kNFF3JJy50DLQKUNN6GAEmkiqz7VcqVXRU7X8FCfo1zN3TuHIFBT7vp4rPMccHCihCVVHP9D/PUaGh2h61JjZTLlgRTu4HfVJWpjr3mMAObIzpCzk0R9x0wkZZ44xmltsyycexROJoMb7ahEKLrt29v8SBvVLy7WzF5ac82rYnGgRv5CT6vYJ+6aAMaSstKXqdqXO3goA4qB7+i4CfG+t4jOJeuDVdnks4LvTmEKllNXSaqVyscu0UdK6n36KwYFtxf/4LBaeSXEd9wVVxsAClO/MZ910VUuIS7AyQnQUSrFZmvzgRGx15O7qlHsV5H0w1OOUwzp+EZgGA2B6KeUvwCPfjVnkweUAO632yGAqTJaTZrQQH0X1DASwG3ysdPshSnTykdHue6NCJgbWfrfl8JNuN4EhevQnUa8Q8/WwTJjHmIV7gQkN2omxN30mG3wEt8lFHPS3s6yyZi5lHk8lB3Ux358wUCGqVvGdGmUGWQ4khe6CCXjSluw5uzoOjrAf49Q/9YG9RYLYxheG2JrwuOvul88BvDi/UKL6Sx2c/9wld86lqIj97tfLaVZfVTkzY5PYmwMYK1GImHv7b3lBgRbOLGZNRWJhAZrU94FT1GfdBKasmWS6yfh8xAd3TA1YAFXExljB6oQnrwe9gnqZGbWV8RBukz+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6506007)(6512007)(26005)(83380400001)(38070700005)(5660300002)(8936002)(6486002)(508600001)(2616005)(86362001)(33656002)(66556008)(76116006)(4326008)(66446008)(64756008)(66946007)(186003)(8676002)(66476007)(71200400001)(2906002)(91956017)(36756003)(6916009)(54906003)(316002)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA40CDA3478BB044BE1B8881C4153BE0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6358
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3dcfac88-b764-4076-1020-08da4a0e5e9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EDbwc1tGVqBR7oGQgZZWTJiOiXMkvvi95FWGenQTT+Ve9NY95uKaof1fNYRq6PoOyDxswgM1M7gI7IS2fkweER/lGOAT2RJ7P6bPvALVyFyswhBIMePntLpF6q5a/UYgNbzRxcyNJneOuNZDy6oxUDMg4yGe5MQGssdncZPKtWKgGUth6E3FNeFnyBMmJtZXtbjeboSSwweW+TaM2O1BlF/TGe4MQtkwwlECW4ZUy5sollxiuP6AGc0Y2PnoDnT6Jp92c0IAU3sO+Y+j6rjE66YFRN+5PvvNmwOQ24aZ769VrVrAJW12MFZeI8toOivENC9hoFG3+WXNeXjmXjjRbVr6GWJEUqTvRSPY1FuKO4rQ4xgH0joBwpcXj889jcS3QP5FJGhJzV4PYepQ+l8/R8NeNwUCxSm1DnfT7sO/Sv1Oe/MIs4jBwNdTmfZEK877gtzg/n8OF+p8MKgMEVIbC8OqoJXWJWA6rSpVKhsQRpbMt16L61Npetg9nh59m214hZNyBQh0qd5LUvFxX1trilvjPCWIh2RilErrWq5Q5fx0tG6QKbhHWhpHjhC5Uz+v84bMiWC5hJkOj/BVP3iQl0TXr6+tq0k9D/zk71BpQb1A8KbHJXrSKUEis2/VbuJO9e29VYo4Xfxh+pgEUUCTtnb83bnqB6MWHG5PY5xhoxhphOqPQ9GhE/giau5ljAUi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(356005)(26005)(6512007)(186003)(4326008)(316002)(6506007)(53546011)(8936002)(54906003)(8676002)(86362001)(6862004)(47076005)(6486002)(70206006)(70586007)(107886003)(40460700003)(83380400001)(81166007)(508600001)(336012)(36860700001)(33656002)(82310400005)(5660300002)(2616005)(2906002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 11:51:28.5739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f392215-5713-4183-546b-08da4a0e6383
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5999

Hi,

> On 9 Jun 2022, at 11:26, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.06.2022 12:16, Bertrand Marquis wrote:
>>> On 1 Jun 2022, at 17:59, Anthony PERARD <anthony.perard@citrix.com> wro=
te:
>>>=20
>>> Use "define" for the headers*_chk commands as otherwise the "#"
>>> is interpreted as a comment and make can't find the end of
>>> $(foreach,).
>>>=20
>>> Adding several .PRECIOUS as without them `make` deletes the
>>> intermediate targets. This is an issue because the macro $(if_changed,)
>>> check if the target exist in order to decide whether to recreate the
>>> target.
>>>=20
>>> Removing the call to `mkdir` from the commands. Those aren't needed
>>> anymore because a rune in Rules.mk creates the directory for each
>>> $(targets).
>>>=20
>>> Remove "export PYTHON" as it is already exported.
>>=20
>> With this change, compiling for x86 is now ending up in:
>> CHK     include/headers99.chk
>> make[9]: execvp: /bin/sh: Argument list too long
>> make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
>>=20
>> Not quite sure yet why but I wanted to signal it early as other might be=
 impacted.
>>=20
>> Arm and arm64 builds are not impacted.
>=20
> Hmm, that patch has passed the smoke push gate already, so there likely i=
s
> more to it than there being an unconditional issue. I did build-test this
> before pushing, and I've just re-tested on a 2nd system without seeing an
> issue.

I have the problem only when building using Yocto, I did a normal build and=
 the
issue is not coming.

Doing a verbose compilation I have this (sorry for the long lines):

 for i in include/public/vcpu.h include/public/errno.h include/public/kexec=
.h include/public/argo.h include/public/xen.h include/public/nmi.h include/=
public/xencomm.h include/public/xenoprof.h include/public/device_tree_defs.=
h include/public/version.h include/public/memory.h include/public/features.=
h include/public/sched.h include/public/xen-compat.h include/public/callbac=
k.h include/public/vm_event.h include/public/grant_table.h include/public/p=
hysdev.h include/public/tmem.h include/public/hypfs.h include/public/platfo=
rm.h include/public/pmu.h include/public/elfnote.h include/public/trace.h i=
nclude/public/event_channel.h include/public/io/vscsiif.h include/public/io=
/kbdif.h include/public/io/protocols.h include/public/io/ring.h include/pub=
lic/io/displif.h include/public/io/fsif.h include/public/io/blkif.h include=
/public/io/console.h include/public/io/sndif.h include/public/io/fbif.h inc=
lude/public/io/libxenvchan.h include/public/io/netif.h include/public/io/us=
bif.h include/public/io/pciif.h include/public/io/tpmif.h include/public/io=
/xs_wire.h include/public/io/xenbus.h include/public/io/cameraif.h include/=
public/hvm/pvdrivers.h include/public/hvm/e820.h include/public/hvm/hvm_xs_=
strings.h include/public/hvm/dm_op.h include/public/hvm/ioreq.h include/pub=
lic/hvm/hvm_info_table.h include/public/hvm/hvm_vcpu.h include/public/hvm/h=
vm_op.h include/public/hvm/params.h; do x86_64-poky-linux-gcc  --sysroot=3D=
/home/bermar01/Development/xen-dev/build/profile-qemu-x86_64.prj/tmp/work/c=
ore2-64-poky-linux/xen/4.17+git1-r0/recipe-sysroot  -x c -ansi -Wall -Werro=
r -include stdint.h -S -o /dev/null $i || exit 1; echo $i; done >include/he=
aders.chk.new; mv include/headers.chk.new include/headers.chk
|       rm -f include/headers99.chk.new;  echo "#include "\"include/public/=
io/9pfs.h\" | x86_64-poky-linux-gcc  --sysroot=3D/home/bermar01/Development=
/xen-dev/build/profile-qemu-x86_64.prj/tmp/work/core2-64-poky-linux/xen/4.1=
7+git1-r0/recipe-sysroot  -x c -std=3Dc99 -Wall -Werror -include stdint.h  =
-include string.h -S -o /dev/null - || exit $?; echo include/public/io/9pfs=
.h >> include/headers99.chk.new;  echo "#include "\"include/public/io/pvcal=
ls.h\" | x86_64-poky-linux-gcc  --sysroot=3D/home/bermar01/Development/xen-=
dev/build/profile-qemu-x86_64.prj/tmp/work/core2-64-poky-linux/xen/4.17+git=
1-r0/recipe-sysroot  -x c -std=3Dc99 -Wall -Werror -include stdint.h  -incl=
ude string.h -S -o /dev/null - || exit $?; echo include/public/io/pvcalls.h=
 >> include/headers99.chk.new; mv include/headers99.chk.new include/headers=
99.chk
| make[9]: execvp: /bin/sh: Argument list too long
| make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
| make[9]: *** Waiting for unfinished jobs....

So the command passed to the sub shell by make is quite long.

No idea why this comes out only when building in Yocto but I will dig a bit=
.

>=20
> Also please remember to trim your replies.
>=20

Will do.

Bertrand


