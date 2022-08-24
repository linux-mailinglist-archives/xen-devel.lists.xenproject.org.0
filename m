Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD959FA2B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 14:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392541.630964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpjR-0005j8-Vf; Wed, 24 Aug 2022 12:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392541.630964; Wed, 24 Aug 2022 12:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpjR-0005gC-RP; Wed, 24 Aug 2022 12:43:41 +0000
Received: by outflank-mailman (input) for mailman id 392541;
 Wed, 24 Aug 2022 12:43:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQpjP-0005g6-Vk
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 12:43:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60661c60-23aa-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 14:43:39 +0200 (CEST)
Received: from AS9PR06CA0306.eurprd06.prod.outlook.com (2603:10a6:20b:45b::15)
 by DU0PR08MB7737.eurprd08.prod.outlook.com (2603:10a6:10:3bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 12:43:35 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::67) by AS9PR06CA0306.outlook.office365.com
 (2603:10a6:20b:45b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21 via Frontend
 Transport; Wed, 24 Aug 2022 12:43:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 12:43:34 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Wed, 24 Aug 2022 12:43:34 +0000
Received: from b5120e51fbc7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB6E430F-7F5B-49D1-B52C-BC8ECF07B328.1; 
 Wed, 24 Aug 2022 12:43:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5120e51fbc7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 12:43:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB7063.eurprd08.prod.outlook.com (2603:10a6:20b:34b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 12:43:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 12:43:25 +0000
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
X-Inumbo-ID: 60661c60-23aa-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=P7NZQkUbQ6h4/YGW1aB2/C3J5teNdG/CDI4cHp7hFHAvIzmsIDuH+6vChGA2lWUEPQOPVx4UaE0366GLaepzZeWO+c3VBo50OdUChpU918k0gWjCTVNu1DMZwUUE6Uc6AriJFlCOLiU4ZMdmzaSZbBlzofnZJZ1Fv01aNrFhTH7yjhZMpMUfSNSHIMcenozjbFQhtTRJEglkFyNMuePEOTqxcrlMO+fKYjND3a6dOLVDm5KZLv/RR+KxL7ZSSl4FeqBD+iDEXfJdXWOfAzNrMXqpo+zPGs59sRLxmGhCW7bUEbQ1L05yvPR9soqQne5XMdW2LjdTZUdLVA1GePzZiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9MI+PVZgQEw8wLHxna5/MS9fcGtnjZIqZi//fxtens=;
 b=VLag+RbPntCSsqhMmkVf8MK4XWV9GGzeKP2BbY61tjuwXzcjH/NEPhLqCH5gD3LCCVai6kD6Keb5cz5Ww68kRaIQldqgmc3FvNmNrfa4zQLwN1F0vQ7hw4p8p5DEkbCnPWOtCML5d3kf0pcDUZvubQk5gAhAtMFZYK/GIa4z+b2KFm9vLPnSzY30PgYRTVtB79ii6eVLNhFckMorRMhQNmdKksNGlyNtpJ60owadtcbFi376jLn93SDI8ClH6PM3Sb/iVHeK36Nb1q3AQ5uht5pOCxecwJ+iIklAbsLpaGrV1GOSICTM5JcexdJLxxMfV+mZb5yrTfFI8fFr4lWs3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9MI+PVZgQEw8wLHxna5/MS9fcGtnjZIqZi//fxtens=;
 b=BTMoyBRh/pttVf+TqYQc1ETHerxEG0rw+NfwsUItezLF2NxPr4l0xzu7yMznqxPQH7SReD3FGJ3d+2RBKrIIRbIJawYgRhWqoljpF0bbJ6JeLIMzO91jfNF5bcjEdbWj+u49SO0rzMQQXGYZpSD5t6CpYPYmqh16GxvcS+Jqu1o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a1f1d0425805cf6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcIe5dBmKcIX+0vYT4JEHuRqjMaRUs7+0yR1W1quYoaI39rr03JRIBB7zMu6jvtvVVAxDjWrMeQBqipg1uTVlghPAUhYWD9DVjfWHZnE/Rvei90+05yd0muFpBax5hTGmqqEP9YdQntR6H27rwrAFvTAlAiWEWsJlIsiSkyDNmQTdDYA23owsIYZhURG2clV3qFO4r3JGk3DBWGs71Pl2SdJcPtbrViGVC/jL+IG+z7eFLX0p0G89FvrTM0yWPiKU6GIL5cpOdl2/jExYk3acBsDfz6TdDVucyBEY1587TAxbmqVHij3UzWpZDDjf1EClJ7czpqWanWRA3tQpWserg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9MI+PVZgQEw8wLHxna5/MS9fcGtnjZIqZi//fxtens=;
 b=dBrtUb477s+4qljmNzkt6++XR19P1IzoyCQgl2ngWe6Gcp4/9V1L/1lShx4XKA0BO1YlH6UCM1HHq/9/B+3dY7VuMQqUZCLAqsi2aHuSqEKjUyDukv8N/nk+71M+2n/lGrEfOQbO2hBRQIo0I1oj5sC0wDlhs2kaIhsNwFvxKxDj0ZjPrBz/MCOL8nm5eJaL9DBrlHaTjzIIdJWlwsPDm8fCCOzt+d1rPs1fI/5kdO7v4LZfyjZN8smgt9aNwrM55xaYc9Iahiknvm6SiXq6Yz9Ybt0l2vmFIEPmOMfaOcELZEu/lYOHcu1CBa1mFwSSScYiPFLySgDlfxQJ0b7Zlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9MI+PVZgQEw8wLHxna5/MS9fcGtnjZIqZi//fxtens=;
 b=BTMoyBRh/pttVf+TqYQc1ETHerxEG0rw+NfwsUItezLF2NxPr4l0xzu7yMznqxPQH7SReD3FGJ3d+2RBKrIIRbIJawYgRhWqoljpF0bbJ6JeLIMzO91jfNF5bcjEdbWj+u49SO0rzMQQXGYZpSD5t6CpYPYmqh16GxvcS+Jqu1o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Topic: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Index:
 AQHYttqU3r7Sk/IKHkKroerrTRS8F628a1KAgAARJACAABAJgIAAAokAgAAIAACAAAnuAIAAA0iAgAEG1gCAAFVqgA==
Date: Wed, 24 Aug 2022 12:43:25 +0000
Message-ID: <6692B919-268F-461C-B5CE-DF07914DAFCF@arm.com>
References:
 <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
 <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
 <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
 <C7766EB8-B741-4443-99C3-EB14C1EA9804@arm.com>
 <348e6d5c-d846-3d8a-e26c-316ba6a98938@suse.com>
 <F1E1B306-5C4C-44C1-B4BE-E546B0B67C97@arm.com>
 <3a4cbf36-ff90-bf7d-b7e6-5d8a49880f2d@suse.com>
In-Reply-To: <3a4cbf36-ff90-bf7d-b7e6-5d8a49880f2d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ae8b3c5e-9a9a-413d-c804-08da85ce4236
x-ms-traffictypediagnostic:
	AS8PR08MB7063:EE_|AM7EUR03FT009:EE_|DU0PR08MB7737:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HsrMf5YsZJiKpuXSWP4woAU7H+33pDjMTDyfiHikpEi20PJWzjmHp/zD3fmSfyW6xCRTpX0lbaCf5SZOvjmPwOLFl0MhYLmtGx3p0YcsLmUfnFlxbUGjTTME7N9Amci+isdTzgLJHFiyYmMbW5CzXlZ8zEXrVdqJ1MWHHYbGTp8jjpGdz6GhLZDIqLqq8023+9Dg+lo9eEr9LYuuRN7krl4oEe8rMlxMRKR91DrjxapaX+9HC8Mvm8rilf9AG0lLJXY8TwuOcEfkTyPg/xeyG5zS1/yv6V3y4eTbE1NtEsHTFkN8n4arUzvZNKBLtqVdAK7A2kxlz3zTPap13xFiEnDLDf7GHOjztzDkbKCOdEcPIBYirmw0TdmK8QjGuF8H12Z8g5WmEg2NbBdw/tk64PEvWKxpoeOmN7Vd3hCnuOp/hvMTEx6zszXEzqdjuS3G2Sm/wb5MWfBhNxYGGUrYLbfUkLRzD3HK46yUfJlRJW97XPwHO+CsZYGLOBLFreRKF8H93KdKxmsWoSUvnStK7FkHmIjqH1nD7AN+2LRosu8QUNsYyB881KXvyYqxNd5xDpcalBAXEI9eRa7NGk7GYWgdiuUdZnsmjhuxbpPPqX4ox4VkCGukvRYWrLcZp5WkyqMjQiaAw3cTvToHjsT4smXwLtLbStmlH3HaGVa9Ohs+ROpQMpzgwHXPCn/100vJsf3+9WfORAwza80XwVJ/h/aBPuKEAcSf22zUY4fPd1CCOX0UFiBDuAaVzeOS/JP6+Dfmh8E2vVhoOyTSWy9HCQtA9tRXzxvOzo11PybH2CI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(76116006)(91956017)(66946007)(66446008)(8676002)(38100700002)(36756003)(122000001)(66556008)(64756008)(66476007)(4326008)(86362001)(33656002)(38070700005)(26005)(6512007)(186003)(83380400001)(71200400001)(53546011)(6506007)(478600001)(6486002)(41300700001)(2616005)(54906003)(6916009)(316002)(2906002)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ACA1D15AB032AD45A1B22DFF20128FCA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7063
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ea2d351-d8ef-4931-f0d4-08da85ce3ce7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HBOx4T3vWXIbWwKa5GxnJWHLkujgtOMJ1IsHF4r1zr+9iXKKsj53mWLaL4ZIGayToCh7+DM/EA8tcTZp+eM2udFRH4IL9YuUA6Bx+AkurQCkrcaFgv8/0C8iSpb3wAEXoA0+ujYo4y9TR94X4scxGm5xyrwP2mIU82LrSj/CDvGcCxj6VSg4OMsYyDdYS6KMnQgFS5bmuGkZJLxX8MdCqz+XXiUpOg9eoER/Du+6ROIJPf3hoeltK1k3iqw7446FJECqGWpf9q4EyL2bqsiRVp1m4BllbdyIz59aVRWUX/i1dLLOZ5baToS1ziQNryae7sS3d/7aMMCqv4GelC3C+j3dDBMboDdvOWD60xX5sE1ccH56s1WQCXMhl7r0wE71CeaM0d33YPzyCFR1J/BF1C/xSOqmkuLSSv43BcbwdDRjEJPAqfSjRzPJ4xmo+tgGeirzMTX18VluKN5KSriHq/03xiwo61IaEGGZBXG9MEbNZ5rGprO27KCOLlI9lug270j+HuO5JaC1hUUHZPZYQkmpHVC1d2xpTIb0e4wp0amaDeu55smDH7M54OAz0mPlCzU3AT29VckexITT2mc3aNdjCoDeet/aHlrAwtakhsYJDIkRfJPtT6QhfSIY8X7soxBIke99ERdT8OTjR9MLz+Tdeo2Shw9EU0D4TxaMY+kW7RWKffQ7wzmGpGHtaWgui9U5M0eVQOkjH7mNVOlI1TIGm521zfmpkMWziXVb1Fqi3L1DJrelU0ndZu1jnrhGWpYWnhKFnj551CokQQmICg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(40470700004)(46966006)(36840700001)(53546011)(186003)(6506007)(41300700001)(26005)(82310400005)(8676002)(4326008)(86362001)(6862004)(8936002)(6512007)(36860700001)(70586007)(83380400001)(70206006)(336012)(33656002)(6486002)(40480700001)(2616005)(5660300002)(47076005)(36756003)(356005)(81166007)(478600001)(40460700003)(82740400003)(316002)(2906002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 12:43:34.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8b3c5e-9a9a-413d-c804-08da85ce4236
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7737



> On 24 Aug 2022, at 08:37, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 23.08.2022 17:56, Bertrand Marquis wrote:
>>> On 23 Aug 2022, at 16:45, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 23.08.2022 17:09, Bertrand Marquis wrote:
>>>> How about moving those to a xen-acpi.h header and include that one in =
xen.h ?
>>>=20
>>> In principle okay, if there wasn't the need for HVM_MAX_VCPUS. With a
>>> suitable comment it may be okay to live there. I'd be curious what
>>> others think.
>>=20
>> The problem with this already exists in the current status as this is de=
fined in
>> hvm_info_table.h which is never included from arch-x86/xen.h
>=20
> You're referring to it being necessary to explicitly include both headers=
.
> That's not what I'm referring to, though: The tool imo shouldn't include
> hvm_info_table.h, and hence the HVM_MAX_VCPUS would need to move as well.

Any suggestion where ?
The more I dig, the more I find that everything is including xen.h and goin=
g round.
Arch-x86_*.h headers are including arch-x86/xen.h including xen.h

>=20
>> Including hvm_info_table.h from xen-acpi.h could create include path iss=
ues.
>=20
> Include path issues? Both are / would be public headers. But as said, I
> don't think any new header introduced for the purpose at hand should
> include _any_ other public header.

For now I can create a arch-x86/xen-acpi.h and move there the XEN_ACPI_*
definitions and include that one instead in mk_dsdt.h.
The change will be small and should not have much impact.

Modifying HVM_MAX_VCPUS is not per say needed and I think would not be
enough to make the situation cleaner.

>=20
>> But as those are used nowhere apart from mk_dsdt, I would probably skip =
the
>> include of xen-acpi.h from xen.h.
>=20
> Hmm, yes, that's reasonable I guess as far as XEN_ACPI_* go. Of course
> HVM_MAX_VCPUS is a different matter.
>=20
>> Any chance that those XEN_ACPI_ are needed by some external tools that
>> could get broken by this modification ?
>=20
> Requiring them to include another header is, I think, a tolerable form
> of breakage, the more that such breakage isn't very likely anyway.

Then if you are ok with it, I will just submit the xen-acpi.h creation patc=
h and fix
mk_dsdt compilation for x86 on arm.

The rest would require more thinking and I do not think it should be done n=
ow.

Can you confirm you agree ?

Cheers
Bertrand

>=20
> Jan


