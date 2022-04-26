Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946CF50FA32
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313674.531351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIJK-0005Z3-Py; Tue, 26 Apr 2022 10:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313674.531351; Tue, 26 Apr 2022 10:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIJK-0005Wk-L2; Tue, 26 Apr 2022 10:20:46 +0000
Received: by outflank-mailman (input) for mailman id 313674;
 Tue, 26 Apr 2022 10:20:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vuZH=VE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1njIJI-0005Ca-60
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:20:44 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe08::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 876ffa8b-c54a-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:20:43 +0200 (CEST)
Received: from AM6PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:20b:6e::35)
 by PAXPR08MB7599.eurprd08.prod.outlook.com (2603:10a6:102:23e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Tue, 26 Apr
 2022 10:20:32 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::61) by AM6PR02CA0022.outlook.office365.com
 (2603:10a6:20b:6e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Tue, 26 Apr 2022 10:20:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 10:20:31 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Tue, 26 Apr 2022 10:20:31 +0000
Received: from 5a9e5d68d459.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F054EF5A-200F-48C6-AF04-264CDA370597.1; 
 Tue, 26 Apr 2022 10:20:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a9e5d68d459.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Apr 2022 10:20:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB3329.eurprd08.prod.outlook.com (2603:10a6:208:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 10:20:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:20:22 +0000
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
X-Inumbo-ID: 876ffa8b-c54a-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Kdg9zGBmcvBqjhfHXhjdyLyAVYZajORcqlZhqe8DMrlpyHkxxNKTlvON3/beSsXOVW6H8q8UVoCh97wvROlefyIIln1HLI1yLUvLh7f3z1nHfhaqIyf6wkIRox7m6bAkXlhawEwvdd38xqi/u0DHsrsXjL4MXYDKSxYdlKwEAatywdQtIvezQm8RxJQcJHisqeyF7d/Zvw2gfXE6otalwCM/dPIdjfan8vaoAIYJBiezQ1QWN1pPmvgScbLpqPi1u8GZLXaqlDcfYuACYwlmWGT13YCOQd0LlJ/CicwTKRyg3dzp7rGGbE/EKAbepV848gr5rOhGSQVadPJ3vZ77FQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tscUQdUglwfema12OFYVNsKYu0QcYLEJLvV9gkBCL6I=;
 b=AUl0ZpR9tnOpiYuW6PWUDJvwu1TDa3q14wgCDV2RFcuNrM4j3HHxiblDRXJHzuUVKKwpHa6wteY04IHw1DgxMShpRvwZsEGaBp4HvONyuF+dJu+8SH+BoRUGQUvENl0HAImNX1iUTp556pRyoSvrG2KNfsO61reO9amEVQF9FkiJ6deNA9tTh3elM4ezkSb1ztO1G0NZMKSES58A5EfJm8w6uHyNBccBBVqB0hCbdEFP/4qboZMZwVdfXMIL+GkZo0O57WEXpad1j8JUZd3JZqaDMjX7omAh5Oco+Vz+NExM1/GZ4nMsEQpx7xKWXqhqSEDEntvOM8mZTb1RUFQ/7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tscUQdUglwfema12OFYVNsKYu0QcYLEJLvV9gkBCL6I=;
 b=xWeFPWFo7fGlpdN8/Gg5jN0f8fv0aQRwy9HO4n6Bc867iJ7oio5F3mmateX2l1r4gYyqSmS61GvVh3UtYhr6Ek0EDQBMAA193RjXoeCC28dyPeOzyXD3hX5AAOjI2F2UvQdxaBK1znhNE78mnauJVEHzoArIySFLB9Uq5Zv46wo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b1efb985ecdaded
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6a9kgC55y1eKvUZJi3XTAUDo9HFHASGMGhoPCuHKGXgqUflV5SJZG0UXEtZs/Xq0RD0IKS6nezFniyHp0ghicVElVqzAQcE2dslrIhEyp2Rw2sGgXJtSAY0X8dBJGC4Zkbfxi3ZSCokNg2KqWxRtk/CVLb/uoKr42zU+8wSubRkcG+C1bukIo1vN6C2mvc0o1yddqs1xseBLicylW/Z2J2bGDRbXuMupwsMBWGfzKg7C4oT6AD73ganafbMUUYz9Vwp2xZ0H3zPAxNWJELfudyVHXn0QL19bGran6iQn9M7OjRbWISOp4idQ6p3+klKf75n9xsnhpGLD3WpOc0Dww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tscUQdUglwfema12OFYVNsKYu0QcYLEJLvV9gkBCL6I=;
 b=Dp3NHjnelROHGOMPncnjjDet8Aa527ZLuhq37ODiYAIblUTxmsanRg/6nlZB4RmxoRsda/rNroJZxVaKEOfOJxLlNAO0PmYhQQgDwMMsDRAJZYsN0yvcNK/iW2J4F2igjbE8Z/YkA4YAaGP7eLlewh1x4JLMrqv8+FKq+buKUOny9ftKd3+oxj6UAo6eZgPMHuqCMUPIHD2GVUquCfAEBPQBDQPIGH/u3b3uIYSeIgJlckvqrIffiFV9KEE+uDo4B0CZU3UBMGX7DRWbQ/cCtZYApoKTE9fIW3XFKPNePn0uxcrFH31AyAzzlAvosPwIHaixDbVoW4lAlwUAY2CoPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tscUQdUglwfema12OFYVNsKYu0QcYLEJLvV9gkBCL6I=;
 b=xWeFPWFo7fGlpdN8/Gg5jN0f8fv0aQRwy9HO4n6Bc867iJ7oio5F3mmateX2l1r4gYyqSmS61GvVh3UtYhr6Ek0EDQBMAA193RjXoeCC28dyPeOzyXD3hX5AAOjI2F2UvQdxaBK1znhNE78mnauJVEHzoArIySFLB9Uq5Zv46wo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/build: Fix build failure from LDFLAGS mismatch
Thread-Topic: [PATCH] xen/build: Fix build failure from LDFLAGS mismatch
Thread-Index: AQHYWPk+OteSOJ5lX0epW57I3+JqnK0B/IQA
Date: Tue, 26 Apr 2022 10:20:21 +0000
Message-ID: <BABB5651-D588-4453-A2BE-03FE7D105901@arm.com>
References: <20220425230656.12808-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220425230656.12808-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e31daf54-6dc2-4456-754e-08da276e64fb
x-ms-traffictypediagnostic:
	AM0PR08MB3329:EE_|VE1EUR03FT049:EE_|PAXPR08MB7599:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB759930342E56E99EA7B79C439DFB9@PAXPR08MB7599.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G/hi7hFYFy0DMhCu0dEtgwwOQfhoShSBnbVxG2BBn8b2zVNbdOgZAqfWSmfnW322sMHhFUSAQSJaveFBgaraijXibT8jp15+XVjOmVKY6zw8yrX7nSDtbrgqxYi+/Y4+77UP8rvtTQ0ZHP6BRkZ/P08/6Tc7O811oq6fZV+X7hk5jYsoCJ8w2mYAuO1eB6us/APGVIicXOeU0Ttz6JIOT8tJBi37fBzAB6NeDY6+RXVk6XMIVcVpEJ4BRJoQtLnCktGiZLo31c98f/ooPbxqcHnm7hY1gy2q3KH7pEc4T/fnmoQD00LAxXsinAtYk57cNZeVQlFNrORdaNxVXBc9oKFrEO9D0LWo+dRsZKIXVHoCRs0p0yvk+hLZ6Dde0BUSIE6KOqiDyJHJFVDQRovVQizUql80qMFOLxKUGJb3hFaJKSk9TpALn0TytvTTa+kSuJvSYWUr0kMXXjQydqenX88pNjo5A5eTEWBC5UJUozT8ihOnmOgbE/Oo47mehaRtyIj8YA9A4TU4o+qNrde+V75oGrR+xXvJQCHoH5rfTJ4Xf1Vf5cire/xPjOYbs8ljzkFf28BRIemnUnEz6rpcJEhyzIKTHZYRpTwtFhGAI/FJUSr086pg6hOj+ZWpIP25m6tPTXGMtiRiPcKVS+2jPzBsq4FHdrO2njdaEn3uEk8nMe4mgDbxGnGfuN8U6s8Y+NYh1f4mfdgFy7w1N9O8HKjBreiOtOx4od/uOxUBCC2+N37fP4urDx3pKGwet2MF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(26005)(186003)(54906003)(6916009)(6506007)(71200400001)(6512007)(91956017)(36756003)(33656002)(6486002)(508600001)(2616005)(5660300002)(86362001)(2906002)(316002)(7416002)(38100700002)(83380400001)(8676002)(4326008)(8936002)(64756008)(66446008)(66556008)(66946007)(38070700005)(76116006)(66476007)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <70F71EEA88D0ED4DA35FD26D2983393D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3329
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d08617e7-b0ae-47d3-0296-08da276e5e99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1bY8Gd+zwoh7lUW0NQeqvkgUqgaF6A/zin5l4mr1cUs97TVUT1hgClgX/NGj15Uf4ARVt4B+JTflYOum5D6BQbuOilgdX84cfE+Ne4uCIf91lFl+brXja8f41OIWNCRKU1Kp6S+HAp9dqkfkpKjZ+b0VF4RMenMNwb2feQjNJfQWSPJ06T03esZ0ZFxE9mHZNYjMPKMlP2X0KqRu20tE88MX+Gzrt8ZUckzE5HQ279Wg90/y5Yi2jDwKRh7W9Q2qjFnrY28JCy1zSKD9Yo7DruNmhSrdw6nJy7WAnRIXDtrYr3wJijMuCHBTJ+N7T4hYM93E904766T4IFbh+DxvQyYup8q95ZQSW8XdGAOHoDzgnebhKpQpMmMYzMe0scu+mAT/4Px6KODuMPjQAfDmR5rYJxZJjFFxx5sMfHfIbEldelQwyHRT8ffs4G/yNv98lnyX5F7rKAHlAsTPnr7IsJRirOkKWyOl47laLG5kyedYkZjweos7zfOyPsGRcocjPM0kTKNWgzWIatC0SHFQJMAF8TV0CxcXWAcCPwKBuV0JXBMIN7PsVRklm+76rEqRw0w7HCb3w1Z/X477MsaLvwJCpAVjZSbquYo9LAxrO28sDrJk/o7rZXreGWoVXjJcWvFxB58KxUHJBb5A/odVRl4tvQau32QDdGMCGoSAwoVcZXEHwT5pm9MrdQ3kdos8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6486002)(40460700003)(36860700001)(54906003)(508600001)(4326008)(81166007)(70206006)(8676002)(33656002)(6862004)(86362001)(356005)(70586007)(336012)(82310400005)(36756003)(83380400001)(47076005)(316002)(5660300002)(26005)(6512007)(2906002)(53546011)(6506007)(186003)(2616005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:20:31.9339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e31daf54-6dc2-4456-754e-08da276e64fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7599

SGkgQW5kcmV3LA0KDQo+IE9uIDI2IEFwciAyMDIyLCBhdCAwMDowNiwgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBJbiBhIEdOVSBjb21wYXRi
aWxlIG1ha2VmaWxlLCAkKExERkxBR1MpIGFyZSBwYXNzZWQgdG8gJChDQyksIG5vdCAkKExEKS4N
Cg0KWW91IG1lYW4gYmVjYXVzZSBDQyBpcyB1c2VkIGZvciBsaW5raW5nIG9yIGV2ZW4gd2hlbiBj
b21waWxpbmcgb2JqZWN0IGZpbGVzID8NCg0KSWYgbm90LCB3aGF0IGlzIHRoZSBleHBlY3RlZCB3
YXkgdG8gcGFzcyBsaW5rZXIgZmxhZ3MgPw0KDQo+IA0KPiBJbiBhIGRlZmF1bHQgQ2VudE9TIDcg
YnVpbGQgZW52aXJvbm1lbnQsICQoTERGTEFHUykgaXMgc2V0IHRvIC1XbCwteixyZWxybywNCj4g
d2hpY2ggY2F1c2VzIHRoZSBYZW4gYnVpbGQgdG8gZXhwbG9kZSB3aXRoOg0KPiANCj4gIGxkOiB1
bnJlY29nbml6ZWQgb3B0aW9uICctV2wsLXoscmVscm8nDQo+ICBsZDogdXNlIHRoZSAtLWhlbHAg
b3B0aW9uIGZvciB1c2FnZSBpbmZvcm1hdGlvbg0KPiANCj4gSXQgdHVybnMgb3V0IHRoYXQgbWFu
eSBkb3duc3RyZWFtcyBpZGVudGlmeSB0aGlzIGFzIGEgYnJlYWthZ2UgaW4gWGVuJ3MgYnVpbGQN
Cj4gc3lzdGVtIGFuZCBib2RnZSBhcm91bmQgaXQgaW4gdmFyaW91cyB3YXlzLCBtb3N0bHkgYnkg
dW5zZXR0aW5nIGFsbCBvZg0KPiAkKENGTEFHUyksICQoQUZMQUdTKSBhbmQgJChMREZMQUdTKS4N
Cj4gDQo+IEhvd2V2ZXIsIHRoYXQgaXMgYSBzZWN1cml0eSBpc3N1ZSBiZWNhdXNlIGl0IG1lYW5z
IHRoYXQgdG9vbHMvIGlzIG5vdCBidWlsdA0KPiB3aXRoIHRoZSBkaXN0cm8td2lkZSBoYXJkZW5p
bmcgZmxhZ3MgdGhhdCBhcmUgb3RoZXJ3aXNlIGV4cGVjdGVkIG9mDQo+IHBhY2thZ2VzIChyZWxy
bywgX0ZPUlRJRllfU09VUkNFLCBzdGFjay1wcm90ZWN0b3IsIGV0YykuDQo+IA0KPiB0b29scy8g
c3BlY2lmaWNhbGx5IHNob3VsZCBob25vdXIgdGhlIHBhY2thZ2luZyBlbnZpcm9ubWVudCdzIGNo
b2ljZSBvZiBmbGFncywNCj4gd2hpbGUgeGVuLyBtdXN0IG5vdCBwYXNzICQoTERGTEFHUykgdG8g
JChMRCksIGFuZCBzaG91bGQgbm90IGJlIGluZmx1ZW5jZWQgYnkNCj4gdGhlIG90aGVycyBlaXRo
ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KPiAtLS0NCj4gQ0M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPg0KPiBDQzogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0u
Y29tPg0KPiBDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPg0K
PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPg0KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4N
Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBDQzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBDQzogVm9sb2R5bXly
IEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBDQzogV2VpIExpdSA8d2xA
eGVuLm9yZz4NCj4gDQo+IFJGQywgYmVjYXVzZSBDRkxBR1MvQUZMQUdTIG5lZWQgbnVraW5nIHRv
bywgYW5kIHRoZXkncmUgcmF0aGVyIG1vcmUgZW50YW5nbGVkLg0KPiBJIGV4cGVjdCB0aGlzIHRv
IGNhdXNlIHNvbWUgZGlzZ3JlZW1lbnQsIGJ1dCBYZW4gaXMgYmVoYXZpbmcgaW4gYSB2ZXJ5DQo+
IG5vbnN0YW5kYXJkIHdheSBldmVuIGFtb25nIGVtYmVkZGVkIHByb2plY3RzIGFuZCBhbGwgZG93
bnN0cmVhbXMgYXJlIHN1ZmZlcmluZw0KPiBzZWN1cml0eSBwcm9ibGVtcyBhcyBhIGNvbnNlcXVl
bmNlLg0KPiAtLS0NCj4geGVuL01ha2VmaWxlIHwgMiArKw0KPiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL01ha2VmaWxlIGIveGVuL01ha2Vm
aWxlDQo+IGluZGV4IGVjMzQ1MjRlZDIxZC4uYThlMWRlNTQ4MjNiIDEwMDY0NA0KPiAtLS0gYS94
ZW4vTWFrZWZpbGUNCj4gKysrIGIveGVuL01ha2VmaWxlDQo+IEBAIC0yNTQsNiArMjU0LDggQEAg
ZXhwb3J0IEtCVUlMRF9ERUZDT05GSUcgOj0gJChBUkNIKV9kZWZjb25maWcNCj4gIyByZXBhcnNp
bmcgQ29uZmlnLm1rIGJ5IGUuZy4gYXJjaC94ODYvYm9vdC8uDQo+IGV4cG9ydCBYRU5fVFJFRVdJ
REVfQ0ZMQUdTIDo9ICQoQ0ZMQUdTKQ0KPiANCj4gK0xERkxBR1MgOj0NCj4gKw0KDQpUaGlzIHdv
dWxkIHJlcXVpcmUgYSBjb21tZW50IGluIHRoZSBNYWtlZmlsZSB0byBleHBsYWluIHdoeSB0aGlz
IGlzIGRvbmUuDQoNCkFsc28gaG93IGNvdWxkIGFueWJvZHkgc3BlY2lmeSBsaW5rZXIgc3BlY2lm
aWMgZmxhZ3MgaWYgdGhpcyBpcyBkb25lID8NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KDQo+ICMg
Q0xBTkdfRkxBR1MgbmVlZHMgdG8gYmUgY2FsY3VsYXRlZCBiZWZvcmUgY2FsbGluZyBLY29uZmln
DQo+IGlmbmVxICgkKHNoZWxsICQoQ0MpIC0tdmVyc2lvbiAyPiYxIHwgaGVhZCAtbiAxIHwgZ3Jl
cCBjbGFuZyksKQ0KPiBDTEFOR19GTEFHUyA6PQ0KPiAtLSANCj4gMi4xMS4wDQo+IA0KDQo=

