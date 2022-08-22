Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4959B78A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 04:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391082.628770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPx0n-0000JP-No; Mon, 22 Aug 2022 02:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391082.628770; Mon, 22 Aug 2022 02:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPx0n-0000HN-Ky; Mon, 22 Aug 2022 02:17:57 +0000
Received: by outflank-mailman (input) for mailman id 391082;
 Mon, 22 Aug 2022 02:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MoR+=Y2=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oPx0l-0000HH-R2
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 02:17:56 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00072.outbound.protection.outlook.com [40.107.0.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a04d5270-21c0-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 04:17:53 +0200 (CEST)
Received: from AS8P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::28)
 by DB9PR08MB6491.eurprd08.prod.outlook.com (2603:10a6:10:23f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 02:17:50 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::a8) by AS8P251CA0013.outlook.office365.com
 (2603:10a6:20b:2f2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Mon, 22 Aug 2022 02:17:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:17:48 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Mon, 22 Aug 2022 02:17:48 +0000
Received: from 5b729565a213.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91227F5E-0796-4DB3-B608-FD3813401888.1; 
 Mon, 22 Aug 2022 02:17:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5b729565a213.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Aug 2022 02:17:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6711.eurprd08.prod.outlook.com (2603:10a6:20b:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 02:17:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 02:17:34 +0000
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
X-Inumbo-ID: a04d5270-21c0-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iqsOJfYUgEIjt+pwZq9t9o6ebMwhHqin8Yv04dT/TyIW8bqLPvhEJ+CRZFMk4rTezdM4R8Wt6gTPbV+hH8NpZLiBtrbEOuoYQ5fP6Tb2HIczVA7k5qxg6nKxGN8APkD9X1gX0+65cO8nGJwzhZHJbXv4bIUWtU4QZCl90PkcuPLjyYDW4OLCvCyirP4NznUKtNHbTf6Tp+yiBL1aIOqMIn87a/GmDWAgVbHxwTbT4gMCfZXtmwpC5VLgVVUdsVpNkwiTV2zK16I8Rwk2HnsQf/Ry5QebHXpEQ1oO5j8gzvL2lJvR+aaKaOED7bAKtMrbdLHoFT7Jf15D7erGH++bWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub6L/bY2UBePC8avvsSmPJDog3FXxLnCTq+TSRPbKy4=;
 b=ka/zY+123u8DosrAnQhs0OoZTwspWyofdYoaIJCfl8kPkWlDUnoLAyVeaT+VFl0EVUTgDDGvfWSKGaLbo7m6lgpDKPTeLxpstFq8K3pA69Nml73XPNPt06NKrJs6goB+BnsYijz04KswBJrRCUHLzVAUXNmGyCdQYri3U8YUsBMs3jmPmLiEPEe2sdhMoy6MDRfylDa/QZ7Jc7dvIPTdiDsFBu+MYGT4Dwd9NDdLkL/EwOCfcGsULIYPxt8uPP3k2NIEqmvB3+lroHug2aXRGazFUlAs/UvCmvbHM5nQUHf+0ESr/5RJYvfUbmkVvsoKZHJ78KsObqdTgSa5XoXCbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub6L/bY2UBePC8avvsSmPJDog3FXxLnCTq+TSRPbKy4=;
 b=iPZUP9mYeStm2bKh12d2em2iajSXnmKckv+WH1ipwImlji0XRO9wPmJ7je3dqj5NB2Qz7P2OEvDtU9p6DNDm4OZtSva1eKkFEN6GscNqMBHdE24eel7mZ0aFGL0Jl0vdDJZhBVb/I2uHhNOoHMQ/uw80nsuLkxXkbo0otez/NE8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+xyQ+S6NWpmQ1s5Zkk0L7P7ZUStsXh8glotaOKKA4w8sNu2gDzTGutG6GcacCsUf6GQA1uZaJo80eKI+0kG9Fl7nTHu52tVDQzwl9o3KwBDSApwf7oEytccj8CPiV8T+P8cOZIxMU0W7z8wnoNSurQuO8VHP6hdB8V99sBfGIsraQ6qvCoWp4axMyUqC3SpjeSDqnL8FG8WoHeiGTPlOcoi6VyhhR9QqVG25pi84CSVqffVO/9P5Sx4pAaPMgQ5jj6iQfNue86lZAZKhy3vEyCJ3ztYouTlGMmKq0hEx1DHaPVcpgWEhQI4ZAzo9xe2SfBL/P1KApKfqA/1ujy6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub6L/bY2UBePC8avvsSmPJDog3FXxLnCTq+TSRPbKy4=;
 b=imLtZ47D25SMtbxRapDax0sOpdvG2Wg5MA+j6o6oGaGGhAbN0ZoaKyAdEebhMI+CxwJ7+h0Izb5+DUvZGRZKjzl/hnVENtluCY0lSopqsP01BxH8qYAFmTohthhv58uMUTYlGygc8oO+xhYSYUnAQ+Wo4xkh2KwhNpng5CXRmHQYTpsuGt4rMqk+Th449m4BW1eK9pUclBB25G5Bdnv3S/NlQ+ONYBg6MSb0g7jWb6NSsWgt0Lv4hzrtzN0x6pz88s2yrwx6p5ghE2sal1+iNBd9VxAyPc+wIkiY4Wt+42yv9qtYCQi/s7ZP8jji1HWR0ELnaTPilCC4/ZlAEHzzLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub6L/bY2UBePC8avvsSmPJDog3FXxLnCTq+TSRPbKy4=;
 b=iPZUP9mYeStm2bKh12d2em2iajSXnmKckv+WH1ipwImlji0XRO9wPmJ7je3dqj5NB2Qz7P2OEvDtU9p6DNDm4OZtSva1eKkFEN6GscNqMBHdE24eel7mZ0aFGL0Jl0vdDJZhBVb/I2uHhNOoHMQ/uw80nsuLkxXkbo0otez/NE8=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: Xen 4.17 release: Discussion of Release Candidates schedule
Thread-Topic: Xen 4.17 release: Discussion of Release Candidates schedule
Thread-Index: Adi1zSPKZH6ytT7FRR6AxtAccCSz1w==
Date: Mon, 22 Aug 2022 02:17:34 +0000
Message-ID:
 <AS8PR08MB799187270C87E73737AB108892719@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 14770CF14778C045B1FFDABAE7A7B2CD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bd480f76-3dc9-4b50-4638-08da83e4823b
x-ms-traffictypediagnostic:
	AS8PR08MB6711:EE_|AM7EUR03FT029:EE_|DB9PR08MB6491:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DrHDQeZillb3NuvH1v5UahAn9gE87z4vgjAsOZcqyIcphLm0DXE+RzhdcgdUhK7h6FJjXTP3Be5kZAIpMzvMWqBz0dMRcYTShyhMpCqqrOzzZEOPNCeOhV7CUmYf7Z+fhHsnzALYYRtet1K6dwe35R04yWAYnOyqxxr/wgtDO4BqVweJ9Z8KsJpy6Q++/fgkM3LnFbRgKHMJ64v33CFTsw/JZ7XFrcrjGqgmiyofV1crZ/eeBiI6HQz59Vbgm1D+lBh1RtRpxnv/hpANH799y85q5cLOV4nCj1anbE7KLAfjVL2VTJPojqGHqZc6BDuWm7YhguvOCfGbNC/rLKuA3AdVCp+1RM+V4Y2N5Kfs/pvpzRP+bKA1RphDYBGf4zAdcLsqzeDXWIelGEo6SOf46OF32XDK1KiLljETGnyg38zFXVzIc12EepIF83vZ45R8lsSqEXNArszA0C7uOx9pKpmdGQhzRNvz4SuyXIYwnaBjq6kR1kMV2B5WbrGbewYAPbOUGc7G6J4n9HYNeRdOGDEOwrqt19Y7pGlmS9jAThyADzCevWW+sJhI8IIFNUemn0garl/3DqlOc3hERywFeaYBXAuLo01xr9BWq4Ah0MsjUwdpW3UCdK0ioBnZDez0EKm80YS4MC2oZ5tyR0390Mfo8AOMbxVKWjQl3flv2Vr/19GszOLs/4OQWqQeC4dflVjykuon93WjIIKNBBDAYwc8JlrVepqFUHY9Jz5zBwvl3j6CaQPHvB15nVJW4QkXAQYwB2k8YRV+L72yAk+BJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(41300700001)(6506007)(186003)(7696005)(71200400001)(478600001)(9686003)(26005)(2906002)(52536014)(5660300002)(4744005)(7416002)(55016003)(8936002)(316002)(6916009)(54906003)(33656002)(122000001)(8676002)(64756008)(66446008)(66476007)(66556008)(4326008)(66946007)(76116006)(38070700005)(38100700002)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6711
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac30b942-01b9-4a2e-2b76-08da83e479dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aJm3m3HzoDR31lbubivONLgLuv1/H/anttzu7BVdztccQbMxEqpfQq+H/RTwAS6alGaMu0E6WmgfQbOszNjS7ycyrp0CjRjlxCKbu2N7deXI5Pi/nrES2yzHuMVu4NId1eYV6CYT6eTECbwAwjxwoIRFcG41F0xLE3Rnsnh6CTEa0dIU18Pt0mCbditInaF7a/qdpWD1cEFF9E48dwdM56JJ7EbCMwYhrrM+uxbWiaMLeKr5nVu+vwrr/P1KZIHtd4Q9SsDNt+uS5kz0RgzLBPkURGVmygTCeKaM4DlG2ooBcTLk1fitt0mbJh++zK3Wmh8v/MbZH37p0Z3ek4HbqMGfz0Xcsda2ZO6dM5obxqpbYplOL9mPO2oXkyxqbdDrb/F7kJOoTUqQyr8zZXY5o5Tw5zluoPTWCCwBR+NwJpDVZH+O9qs8FGpE/lcZr2liinvU0XNRUnA5afxomn39mlX6mUk9S79V8whYYnp5BfhpDS5ktSTotmFdHmjn1xXWRWKJF7u9Dkin8nOvaeh0GzhlU3+tPsP5hG18N1BnZSik+AXHLTlQl29Ggrpt7zXHLRBByJL+RRLE64spqr8GWJ/1ckDDI7NzxMP3PiHakzlRti9HZVWKbLgKu0AbvdXQA1UB5HUtPhYSDZtuBmw7rUv8K54NXzJSk2/c4pGF/7QvhIeGyl9Wj+el4RunaMsI8jghZQsL3jvGQmStLVt71ereO/XZwliOUVIHxnA05H4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39850400004)(46966006)(36840700001)(70206006)(70586007)(8676002)(4326008)(33656002)(86362001)(81166007)(54906003)(6916009)(36860700001)(356005)(82740400003)(52536014)(336012)(47076005)(186003)(9686003)(26005)(8936002)(107886003)(41300700001)(7696005)(6506007)(478600001)(40480700001)(316002)(82310400005)(55016003)(2906002)(5660300002)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:17:48.6270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd480f76-3dc9-4b50-4638-08da83e4823b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6491

Hi,

This email is sent to discuss the possible Release Candidates (RCs) for
Xen 4.17 release. We are still 1+ month away from where they start but
we can start early to gather opinions from all stakeholders.

I checked the RC schedule when Xen 4.16 was released. The RCs were prepared
after the Code Freeze and there were 4 RCs one per week (Nov 1, 2021;
Nov 8, 2021;  Nov 16, 2021; Nov 23, 2021) before the final release (Dec 2,
2021).

For 4.17, the Code Freeze will happen in Fri Sep 23, 2022, which is also th=
e
week of Xen Summit, so I think the first RC can fall in the week after, so =
I
prepared below schedule:

RC1: Fri Sep 30, 2022.
RC2: Fri Oct 7, 2022.
RC3: Fri Oct 14, 2022 (The date of Hard Code Freeze).
RC4: Fri Oct 21, 2022.
RC5 (Final): Fri Oct 28, 2022 (The date of Final Commits).

Please kindly share your opinion on this schedule, thanks!

Kind regards,
Henry

