Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B96538F38
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 12:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339481.564367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzRy-0004cs-MZ; Tue, 31 May 2022 10:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339481.564367; Tue, 31 May 2022 10:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzRy-0004Zz-JD; Tue, 31 May 2022 10:50:10 +0000
Received: by outflank-mailman (input) for mailman id 339481;
 Tue, 31 May 2022 10:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nvzRw-0004VS-J5
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 10:50:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f4ec877-e0cf-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 12:50:07 +0200 (CEST)
Received: from AS9PR06CA0731.eurprd06.prod.outlook.com (2603:10a6:20b:487::22)
 by DB9PR08MB6683.eurprd08.prod.outlook.com (2603:10a6:10:2ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 10:50:00 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::a9) by AS9PR06CA0731.outlook.office365.com
 (2603:10a6:20b:487::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 10:50:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 10:50:00 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Tue, 31 May 2022 10:50:00 +0000
Received: from 20d5c47f2dca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8734D44D-3D5B-4359-8B74-9283B0935C27.1; 
 Tue, 31 May 2022 10:49:53 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 20d5c47f2dca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 May 2022 10:49:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB5084.eurprd08.prod.outlook.com (2603:10a6:10:38::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 10:49:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 10:49:50 +0000
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
X-Inumbo-ID: 6f4ec877-e0cf-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BTudENzgMkGr7XzVJb1Nlr8whRx4YaLDEUp9wxcx8rAp8m9z/rFejhTybr8+SYiEVutKdSLYRk8kC05d80OPW/LQFF6JXTou2pZLSfJj2xymhd1NQqhVwCBcfhAMqpHIUW5lqSC1AWaacrd+JvWsS273X26V3iOyWVi2sD/GS9Gt8F8MTNYqDpCNh1Jw7KTytpMEfKe15Whd3ZhQuaq+8SCTOoAytnXQxvNNjLeyNDFE0n45SZ/iDJ8qZc7WTnku/XbZQxhtqOocxP6zCXUmHIObH5ktV6D01bN7RBwc4epsriXbPxtTstdPKka4mvgSVN/m1NkudHo8NkJe/G6FmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nt0BiWc4Qk2mUTO+wWjDgSo14elBfR7b1c5gfQnBeyE=;
 b=TerzhIz934b0JxjlS14QUoX8ocZw2kM7YVdHjLS/ziut8PliHimVa2M8LE+1c7MdLtrE2mscfsMXTU9VTBpS19RZru3LAsjtP7XjkXiyefB8F0ri2cGUovSik3b29wt/QPFMqKkwPbRFYSqPg+A8DjPGMZe3lThKqm2He7Rp6WnxFlROhm2jLfyQ8JkuECy6c2Z0B8Rtlkh8GhX5/1VwF5DvCm9EhNgLjNb493/tMJ+3Ye4rB4cItljJEaYLRj43rMrCoXEEzE6jcfzI2ilsytuwMXNCKMERAfcAgNYKO6B/zP5zJ/dl+rUAnC7tw5U0Y2DTSls6Gtv06lmOs+JQAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt0BiWc4Qk2mUTO+wWjDgSo14elBfR7b1c5gfQnBeyE=;
 b=AzqUwIlE8e5WrvZ4sDi/2MS966sbEQ2kyuslCX2T6S674x0tFkVOFzN5ZWIAUWqOazX5R0c5gF+D7bKjiCjDe4KHGfdRkBAatoqUFhDApmmTlCGXpOJ+m6VjTzJD+aVaAJhdn7FbWd8NDNGzWw/R3m63LyZQuZU52unrMZRQ1t8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e2cdd268ca7404be
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4KTmD0nfI5E2ZBAL/OS6tCqqUhxyyfUcjZQJ8WJM87Duff+XHEEpACoJnZlJ3jL9Yn015/qcMfhRvG2VgTNFqTf6simQ4q+aW/6ASCQD0/01zxGf1+cHL0SjxZModG3hzx2oQGRJxoRPW8Rjjhz6C/jBvS+E4Hrt/aCrsd1WEI9AV501TSuknHHN49t6sq+w0i1b/FCyX5cSG3xfZxXS0y3SaUMUizZ9xfFrtttyu7S9v3o2a7dNF2IdLqld/bRmDTBCWGXeFJfxs4TYhGIEQQ+C7zP95aTdIe6bfvTUX+iX9K81pnlgnAeHSiNcsbrMC4NtPXz6GzVkhSnlDs2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nt0BiWc4Qk2mUTO+wWjDgSo14elBfR7b1c5gfQnBeyE=;
 b=CLwZm2OgBW7xoGef82yBsZoqN/rZPQPXKAk0Q6udXfY1WAqYIRccsbRjsZHkduG/BN7FKFKoooHMoF6SCXQN/H6Kk/0AvANB9W7COMMkB2prCA44iDOoOxZHOaRyUO/xh+L9tV3AdFaVU7vh15EgUFMKH5lyrIyEpTIkuvZQdcdd/XDIK1pjdWDZvAKFQO2l0WHeVsmJLJxPj70aSBCq2Ugq1+6ky/g3q8c1+DmbX6ao811hyFs7bqr0VPEspoINTMXGfepKiXmUNIb3aZTOTtbblqrW+szejE6UOYZayEjDaB5OS016eWVHwL4s0UBUoEr9/RbDSbW3rL4sl3aEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt0BiWc4Qk2mUTO+wWjDgSo14elBfR7b1c5gfQnBeyE=;
 b=AzqUwIlE8e5WrvZ4sDi/2MS966sbEQ2kyuslCX2T6S674x0tFkVOFzN5ZWIAUWqOazX5R0c5gF+D7bKjiCjDe4KHGfdRkBAatoqUFhDApmmTlCGXpOJ+m6VjTzJD+aVaAJhdn7FbWd8NDNGzWw/R3m63LyZQuZU52unrMZRQ1t8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "scott.davis@starlab.io"
	<scott.davis@starlab.io>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Thread-Topic: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Thread-Index: AQHYdHaP7qNDYyBbfkiCxkS8602Jcq04suAAgAAbZACAAAEcAA==
Date: Tue, 31 May 2022 10:49:50 +0000
Message-ID: <674E45E3-0B50-4098-9B15-B51EEEC54534@arm.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <2F13F24D-0A55-4BC3-9AC6-606C7E1626E8@arm.com>
 <4ebbb465-00ec-f4ba-8555-711cd76517ed@apertussolutions.com>
In-Reply-To: <4ebbb465-00ec-f4ba-8555-711cd76517ed@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0df3cf04-47ae-4388-7360-08da42f34f48
x-ms-traffictypediagnostic:
	DB8PR08MB5084:EE_|AM5EUR03FT037:EE_|DB9PR08MB6683:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6683B71A015F384E8927F1A39DDC9@DB9PR08MB6683.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oD/nh9VdAEIvJD2v6Vx2PbtZsvA5d4hZiwgfCbbomXegArw8FpZ/ELAiunqhdhK8SlkAVH3PM9Hcha9SHP/pWJgFZMqjZm3Wf4LwcYKYX8vg/WWEPNON7Yp2KfgGjC7akHgUkEuHAJGm2CssZdIBpuuCGzdcBo6y6jSFgWP0dnRd98Kkq7xLY170WMl0xiPc6ovHGTRIyj00yQPEh6Qj88+br/Zkm3LPrIeOy7yUG07XH3OM+ezrEMHVq+3bwGbz77wG5SGEOyAZ/hVyQUh1Y1Zp7ZDCQAd32muXial9mOWkyM7YV3n1flIzZA/MnhjOaJyWZVrU4AeCXZgeOR9DlBoBIvIOYKese1O+kNdKmmkfRtk29Da4kiSs2o8oHL9GenAjpKepqPHBXniXUG0JGXtufI1pTsd8nxdU3Rk2U6kd3NQwu6IKqy3hYTyV0k5J7J7159IuV3CsMghjK8bEXtvrdzMP8GyTfVASE+qVvXtNa62e+aWsJz9lcoToyUtuXEMMlzutZc1TOQaJX96y098CMCqXHu/HbQK/zNWri7JAxkD3S+rsuqOJDZgkrJf6lRuhYdr3DjQjP8ILFsrG01lFRMWPvXF4xqTQJGYX4OnlB48Mxo8EKkAVmylP1DEQciv9gqB+5ycjCzKLsdphKVZiJ4+gGx84YQEw4wDixnor+0V0w1EMyXQ4/s0pnFJZuCsG5B+wsbzHsGL7W8EfnP1gH9un9i87uWoZ251D19qTuJvUC9VsdHNM6KtL0OJ0
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(5660300002)(64756008)(66446008)(66476007)(66556008)(4326008)(8676002)(33656002)(76116006)(91956017)(71200400001)(7416002)(186003)(38070700005)(66946007)(86362001)(8936002)(26005)(6512007)(38100700002)(122000001)(2616005)(53546011)(6506007)(2906002)(6916009)(54906003)(36756003)(316002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A72897EB1A4E334F8EC6D5C8548C33F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5084
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a9674703-42ab-4b12-e6a3-08da42f349c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Os5OHsB8793hLPdz+OTp67aaSo1k5Ea605TCwLhzhXV0mzhXmr7SX7okQ/hs+GP4SzhStJ0K7fTHFb0gOOwgQ1SuR5moaG7NbDchQK2xzVLClk4BhplefMsBBNXLCKCuyR6wCamHpoihDVwX1H3U3RChghdQavL3KwxuOEsoIvlOhe9QVLN0F3FIFBqkBhq3qAwVsuhuumkGPn7ahHa57jdtES3Ha/IjUe+Zo2pnGjwDQGkArq8vxucpjzWhm7BUEucU9A3h6MePra14zJR+XSBUmTEo140sw49euHbQkrLNDupz3Nd+tg+I7c/fwy5mC1BLufvR/23qrERqGgtgdKu5JlLCJdscxNkhC5RlBgP2Fl4ssb74Y4d2OGg4t9zmpmwVXjfrRQRZYxU782zOTWZWvV6g5wjXGm+33oeAFpZ+agAA8uoeK8CPCHSlgFgw8vQe3RuDk+zZwRFk4Sn5jka0FwdGoIuqiQCZffu7mzdNOHuQtlymTjGOC8FaI1KvBwysGfq+rIqYRwlAIt2o9ebN6W68fthWRENmUdx2IaAkkjVgFDyip7aK0aAB9gPSYYwN/IUQ37UN8WUI9gvV2zrBBqV/VtitRtqhGvGmTyM9uy9k0cUYHskSJBgsrJ95JdnBx/goCargmeZ5vgYc081+ExR555cE/p/thlW1mIUO84OCtMmjVXkhvLgXukoB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6506007)(40460700003)(5660300002)(83380400001)(81166007)(2906002)(47076005)(33656002)(336012)(8936002)(508600001)(86362001)(186003)(356005)(36860700001)(54906003)(2616005)(82310400005)(316002)(107886003)(53546011)(8676002)(6862004)(70586007)(70206006)(4326008)(36756003)(26005)(6512007)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 10:50:00.0355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df3cf04-47ae-4388-7360-08da42f34f48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6683

Hi Daniel,

> On 31 May 2022, at 11:45, Daniel P. Smith <dpsmith@apertussolutions.com> =
wrote:
>=20
> On 5/31/22 05:07, Bertrand Marquis wrote:
>> Hi Daniel,
>=20
> Greetings Bertrand.
>=20
>>> On 31 May 2022, at 03:41, Daniel P. Smith <dpsmith@apertussolutions.com=
> wrote:
>>>=20
>>> For x86 the number of allowable multiboot modules varies between the di=
fferent
>>> entry points, non-efi boot, pvh boot, and efi boot. In the case of both=
 Arm and
>>> x86 this value is fixed to values based on generalized assumptions. Wit=
h
>>> hyperlaunch for x86 and dom0less on Arm, use of static sizes results in=
 large
>>> allocations compiled into the hypervisor that will go unused by many us=
e cases.
>>>=20
>>> This commit introduces a Kconfig variable that is set with sane default=
s based
>>> on configuration selection. This variable is in turned used as the arra=
y size
>>> for the cases where a static allocated array of boot modules is declare=
d.
>>>=20
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>> xen/arch/Kconfig | 12 ++++++++++++
>>> xen/arch/arm/include/asm/setup.h | 5 +++--
>>> xen/arch/x86/efi/efi-boot.h | 2 +-
>>> xen/arch/x86/guest/xen/pvh-boot.c | 2 +-
>>> xen/arch/x86/setup.c | 4 ++--
>>> 5 files changed, 19 insertions(+), 6 deletions(-)
>>>=20
>>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>>> index f16eb0df43..57b14e22c9 100644
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -17,3 +17,15 @@ config NR_CPUS
>>> 	 For CPU cores which support Simultaneous Multi-Threading or similar
>>> 	 technologies, this the number of logical threads which Xen will
>>> 	 support.
>>> +
>>> +config NR_BOOTMODS
>>> +	int "Maximum number of boot modules that a loader can pass"
>>> +	range 1 64
>>> +	default "8" if X86
>>> +	default "32" if ARM
>>> +	help
>>> +	 Controls the build-time size of various arrays allocated for
>>> +	 parsing the boot modules passed by a loader when starting Xen.
>>> +
>>> +	 This is of particular interest when using Xen's hypervisor domain
>>> +	 capabilities such as dom0less.
>>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/as=
m/setup.h
>>> index 2bb01ecfa8..312a3e4209 100644
>>> --- a/xen/arch/arm/include/asm/setup.h
>>> +++ b/xen/arch/arm/include/asm/setup.h
>>> @@ -10,7 +10,8 @@
>>>=20
>>> #define NR_MEM_BANKS 256
>>>=20
>>> -#define MAX_MODULES 32 /* Current maximum useful modules */
>>> +/* Current maximum useful modules */
>>> +#define MAX_MODULES CONFIG_NR_BOOTMODS
>>>=20
>>> typedef enum {
>>> BOOTMOD_XEN,
>>> @@ -38,7 +39,7 @@ struct meminfo {
>>> * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
>>> * The purpose of the domU flag is to avoid getting confused in
>>> * kernel_probe, where we try to guess which is the dom0 kernel and
>>> - * initrd to be compatible with all versions of the multiboot spec.=20
>>> + * initrd to be compatible with all versions of the multiboot spec.
>>=20
>> This seems to be a spurious change.
>=20
> I have been trying to clean up trailing white space when I see it
> nearby. I can drop this one if that is desired.

If this is wanted this is ok, just mention it in the commit message so that=
 we know it was on purpose.

>=20
>> With that fixed, for the arm part:
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Thank you, will add it in when I respin it for submission.

Cheers
Bertrand

>=20
> v/r,
> dps


