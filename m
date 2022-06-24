Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD005599A5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 14:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355511.583215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4iOf-0003UX-Sb; Fri, 24 Jun 2022 12:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355511.583215; Fri, 24 Jun 2022 12:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4iOf-0003Rq-Pi; Fri, 24 Jun 2022 12:26:49 +0000
Received: by outflank-mailman (input) for mailman id 355511;
 Fri, 24 Jun 2022 12:26:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5tQ=W7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o4iOe-0003Rk-8q
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 12:26:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea460125-f3b8-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 14:26:47 +0200 (CEST)
Received: from DB8PR06CA0057.eurprd06.prod.outlook.com (2603:10a6:10:120::31)
 by VE1PR08MB5742.eurprd08.prod.outlook.com (2603:10a6:800:1a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 12:26:43 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::3a) by DB8PR06CA0057.outlook.office365.com
 (2603:10a6:10:120::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 24 Jun 2022 12:26:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:26:42 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Fri, 24 Jun 2022 12:26:42 +0000
Received: from 65765f2da25a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2701253E-1FE8-40B6-ABA3-7387D5F31684.1; 
 Fri, 24 Jun 2022 12:26:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 65765f2da25a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Jun 2022 12:26:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB7851.eurprd08.prod.outlook.com (2603:10a6:150:5e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 24 Jun
 2022 12:26:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 12:26:32 +0000
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
X-Inumbo-ID: ea460125-f3b8-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PDb25U0fa03Hq3F4ZawuSD8VKc1R7jXYnFZqVkXV7/KIMJc3MoUW56yz6hmZhpcMKAvuahijocDx6WobQcE8NmFmwJaYtZAjw4CDNG2z5ldOMMJzu92HL0QpRod3mksJhbefH74gS5xBpZ5TIgpOrVsGoGaurpDnJNmy4+Mrp5RjqVzNJgJ3pbGHRsddokfFB30uuDFNytr/PLzYrT9U5gGgEB8VYbQlbFY1Q1rN66hv7GqbnSQeKGkqgmXcWM+2Bke1q4XF1MoBTDJxWqJsQ2sTe4RW3afsQZ4gg+lE0wVRuj7EkB10DaRLW1SzVyAPvVEUmeiEZfJ2QYfH1Am6Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilwf5G7GhpmBjzHhPzhO4tgbwBWqXxS+Ytyby8oCuAc=;
 b=oZV9tLbpJUIe72hMetMWGEd7GAavbff7gJcjz4spZre8cwqQvmSRWlM9wKWgNKH7S9PxSjod5vecYetFIgNpDw2Be2PVyuomEEAT6SvO/YHcfYk8hmu3uDiTMxSB8TAx4d8kFw6qf48obsYedAcgcqZHZogKvgecVlf2df9vN0Sh1C3Al1+qPZwdpwCEywDgIn0An9J6na8qWqDYZ8822kltXAyro1FDoiZTL8JAKNXJ/J+w/jGM8MC/20ncAbql1OYkBj6bQYqG7AFeZqQWFnmuw7GVNYaMLcHoETaKOF5Ev8dvBnPe5plHGPdpROeMSxFd5dIVDp07L5/bvYU9Xw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilwf5G7GhpmBjzHhPzhO4tgbwBWqXxS+Ytyby8oCuAc=;
 b=lM6qOJPmTO/j20bX3fVJTMkSulXnzgWzxJFGfGVpC2ubp+kZbxR+AXJnUSg5/SKSihGY1dI+WEOrZJteuBvDkJqTBI6z4BqmH0tU7WwDyVXOOsv3N3UVWFAiL6VnxfT4s6QaIna4hz+OGHC7PeCEgHXTX7LsNsBZonNccrLEb9I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fbc3772e1b68ce40
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+YTV8ogqSSujEsetpROOt6xh14YxiapER93o28XcFQQyHIYql8l32wGQY7pmTE3eh5h3zjeTWhewT5+EU1UIcCDTM/hxK6IWIXeCxhZauoYTBU4Rj2OdbjawvCSrZw3/HVRgTa8kqn+ii9j8NVkld6c+M99ye5YRK1CNWydQB4kNpZmWqP5mP+scMnR61y+PBJyF99LoMxgSuIOq3VuIlubKlvcKeQTI12i4WQSzivKDRnieJebjEy+Znd+J2QIFDmIOJMpRvn6r51+n0L+c5X5yDmSh9xLtBarCl7kNdT0xIRFHAAVyG2rfyc5irMBYmBupnPOFKJM/+hLY3YD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilwf5G7GhpmBjzHhPzhO4tgbwBWqXxS+Ytyby8oCuAc=;
 b=Q9RfARdNv3o4k4y2bkFJ8TSs5dDW+icdMumBtitm0AeDJg6nGoYORExHdHVYT/AfZ3gic1XRJjQ5F17Os9SRStV2Mmmk2ZqwyVYiXEg53VclrTZnPMJmgPnozdmXG7SlRo+94bRCOWGMjHG8qcSymbU/DK9iGXlxwCSbYk5IGjSgKsUcCqJg6Tcnffyffg9bvGrlUa5kurOJGpaKBtue2pEHb5AKL7+XVd7p+8wUBsdXBJaYJOH5jKny8td/I8JV+9vDx8/xemRCvkAKBpjVyhf4IbuKQ32dYLhPjS2g2Mf/6iNcSsdptn+cL+DvojeaH7WsRnAPOt+PFQCYoL6S6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilwf5G7GhpmBjzHhPzhO4tgbwBWqXxS+Ytyby8oCuAc=;
 b=lM6qOJPmTO/j20bX3fVJTMkSulXnzgWzxJFGfGVpC2ubp+kZbxR+AXJnUSg5/SKSihGY1dI+WEOrZJteuBvDkJqTBI6z4BqmH0tU7WwDyVXOOsv3N3UVWFAiL6VnxfT4s6QaIna4hz+OGHC7PeCEgHXTX7LsNsBZonNccrLEb9I=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Topic: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Index:
 AQHYh7iovubAjsqNDkKOdqYTdWMQia1eaYSAgAAFkYCAAAeUAIAAAtiAgAABHQCAAAE2AA==
Date: Fri, 24 Jun 2022 12:26:32 +0000
Message-ID: <243D0C5A-6E48-4392-BECE-C3EE74CC4566@arm.com>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
 <E5F45AD6-8D0E-447C-9864-6E9F34C1BE0D@arm.com>
 <c304be56-ae9b-121a-007e-1bb5ef06f95b@xen.org>
 <F0A0EE87-88CA-4A42-948F-D5CC4B5540DF@arm.com>
 <581ae1a2-bf1b-7dca-fa0b-a772ad7c489a@xen.org>
In-Reply-To: <581ae1a2-bf1b-7dca-fa0b-a772ad7c489a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e2e04037-e5de-4d00-e40f-08da55dccbf4
x-ms-traffictypediagnostic:
	GV1PR08MB7851:EE_|DBAEUR03FT049:EE_|VE1PR08MB5742:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lbSoKSWEMmgmVFIXqBdpwXoilW19jvRH4DmH3Q2wp2Z3O6FzPdlEAEHggoHU5n8u7WrCuRlyporLRFluvvHKQ0v6tvXta6gDgZnYes8DDKyYL5921DCmMCSfFDKDAlGgpf8L/otquGj64G9M/JDX+5hsuf+J09aRIVADh+xZ9ep4SleNQxvLgpqgtkkfM0onMu7NbqmcldHx9j9IvEQ9a8bPcC2taNRkltCWTaWNO++JcCmeay+6bZX2GBBW3UwPiagVLa9eaUo3Dk+FMJ+rngPAGoeQZ3ROKnArfmYwnAoGtXQ3Mx328KH/DTwkEgEtDigwtXeOE5lhbxdkNji5hf+A3UP8AMeIeku9MvJEyH9hgyU7g8VWxeKW/myURE90/ArNqWjHNGtIIDbXGXaAj/plQRN2QI/85jZ8UYd/+kOe/jZOsGgp7M2A3xvEKyCNeGUrtWi3JgrCUkIyCUN8itkLlOTVVww8e0ipMpV4SIT+FykHRKCQLAyACQG+tdHObmURVvzoTIHAaDrWz7lqTxsLW9AviZV9JxSWqa7KJwb/VSRL3f01DJaKRKeHHMSHU/4VRJ8VJNiPg4wVl/7w1aoEfOR5otcgtryRlbRhpKq+RX1IUYzIt7ybPPmW7lAbl9UH+8ZMVy8N4D5zPAaQSWnQ9QJ32Nvg8xh6PR5W543x+2RSiFndpBf2o/1sKPs/EPpnVdzogxdasP0HWcVS7oBzaKVQG7rzdrUwWhJnciPC3d60R2HdDf47wrrQENccLkrt18A7m+hQrU1X5/n799lY5R4iWIRPEOqY/Sp15dDIVKxnoT9oLod+nZh4uhsyYBbTZF+ZHqK1Q2JiXr9IjWxwlhANBUiz4gUnL0V1FYA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(6916009)(41300700001)(4326008)(66556008)(316002)(8936002)(83380400001)(186003)(2906002)(2616005)(38070700005)(66446008)(38100700002)(66946007)(66476007)(8676002)(36756003)(54906003)(6486002)(33656002)(64756008)(966005)(5660300002)(53546011)(86362001)(76116006)(122000001)(478600001)(6512007)(6506007)(91956017)(26005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <207E2FCE942AFE4E84D6584302B3BF17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7851
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37585c79-3bbf-416e-23ff-08da55dcc5ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pPCfuR86uYDKT0CDfTYsgMr3ZqmJkiQ720Tu22KAXfTAz9LHgU5+MtI2cmsMiXlNYVMVfbq6hhbn6V28W9ehiJV1AzGUQfviwvDAc3EYeyuuXeZcdVOBTFgcOysUjGE4Gk0F9t3XsLN4owImSyNu3CjmzpC6Jm4UwRnEv3d49gQcaVkgpWpGYuCVLB/sYu6RoBD9WF20fr/VNRgxYb8JHOOnK1dId18uoX1bjbGldcRBpngqB5d8tuax7cRZO/YWnG2TGZrGSEjP0F9/37fMU08LGSBw90IobznsPwfnTGxNMCfCrx0tz5DFRE06F4+Y4UHu0F+X+7BWHOZSTfAcfztqq91pzI3a/X6lDqU7mjb2bMpACrCHfBzR2jlTWkiuTEIZG9DlM493C+4gy4K38yS8ti5BjGTUfYSmuC2PIwnnDsIOTZFhPoigMDpgnHQtGJLlZkZbJKtPK0cLDa8klunzHuCFHOliCLPo95yU4nADqIUkCq3AP6uzMndASnDjxirpeqTsxEK+XsdPu+kU1ZWc9gh8dL2po4rnyLeeKNRuYcsPd15TEFdNFY7nBNATHNiYbVJwNpHFH6g4C4RbvK80T3A6v63qBY/8oT+AqJkxTlzfB0cHNht5CTIPGfJAe+PogZpogpgYEV2m990Q6l35RFY3h32TdMAv9xyuccvweUS7gKWNG82FYQT7qm71iQjqeSxCOGAxq2kq2wb5SwKNm4psEma7DtrKYNQEZb7uzhtHctF9AyWvNcIonzrkgp1+mH8E8KsOeOS0lLPFHiKmeoYN9ZSrA16WarbBjK7qFGM2EQ7tFHOvvbh1oBpk0x+JLWhSpgSXCayi+kEi6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(40470700004)(36840700001)(5660300002)(82310400005)(316002)(6506007)(40460700003)(356005)(33656002)(70586007)(4326008)(70206006)(8676002)(6862004)(478600001)(6486002)(40480700001)(336012)(8936002)(36756003)(2906002)(83380400001)(54906003)(966005)(36860700001)(86362001)(6512007)(41300700001)(53546011)(26005)(2616005)(186003)(82740400003)(81166007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:26:42.9336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e04037-e5de-4d00-e40f-08da55dccbf4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5742

Hi,

> On 24 Jun 2022, at 13:22, Julien Grall <julien@xen.org> wrote:
>=20
> On 24/06/2022 13:18, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 24 Jun 2022, at 13:08, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 24/06/2022 12:40, Bertrand Marquis wrote:
>>>> Hi Julien,
>>>=20
>>> Hi Bertrand,
>>>=20
>>>>> On 24 Jun 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi Luca,
>>>>>=20
>>>>> On 24/06/2022 11:53, Luca Fancellu wrote:
>>>>>> Add instructions on how to build cppcheck, the version currently use=
d
>>>>>> and an example to use the cppcheck integration to run the analysis o=
n
>>>>>> the Xen codebase
>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>> ---
>>>>>> docs/misra/cppcheck.txt | 66 +++++++++++++++++++++++++++++++++++++++=
++
>>>>>> 1 file changed, 66 insertions(+)
>>>>>> create mode 100644 docs/misra/cppcheck.txt
>>>>>> diff --git a/docs/misra/cppcheck.txt b/docs/misra/cppcheck.txt
>>>>>> new file mode 100644
>>>>>> index 000000000000..4df0488794aa
>>>>>> --- /dev/null
>>>>>> +++ b/docs/misra/cppcheck.txt
>>>>>> @@ -0,0 +1,66 @@
>>>>>> +Cppcheck for Xen static and MISRA analysis
>>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> +
>>>>>> +Xen can be analysed for both static analysis problems and MISRA vio=
lation using
>>>>>> +cppcheck, the open source tool allows the creation of a report with=
 all the
>>>>>> +findings. Xen has introduced the support in the Makefile so it's ve=
ry easy to
>>>>>> +use and in this document we can see how.
>>>>>> +
>>>>>> +First recommendation is to use exactly the same version in this pag=
e and provide
>>>>>> +the same option to the build system, so that every Xen developer ca=
n reproduce
>>>>>> +the same findings.
>>>>>=20
>>>>> I am not sure I agree. I think it is good that each developper use th=
eir own version (so long it is supported), so they may be able to find issu=
es that may not appear with 2.7.
>>>> Right now the reality is not that great:
>>>> - 2.8 version of cppcheck has bugs and Misra checking is not working
>>>=20
>>> Can you be more specifics for "bugs". Is it Xen specific?
>> No it is not Xen specific (see [1] for more info)
>=20
> Thanks for the information. How about writing something like:
>=20
> "
> The minimum version required for cppcheck is 2.7. Note that at the time o=
f writing (June 2022), the version 2.8 is known to be broken [1].
> "
>=20
> [1] https://sourceforge.net/p/cppcheck/discussion/general/thread/bfc3ab6c=
41/?limit=3D25
>=20

This up to Luca (as it is his patch) but I am ok with that.

Cheers
Bertrand


