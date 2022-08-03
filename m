Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B63C588867
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 10:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379631.613231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9It-0000ey-ET; Wed, 03 Aug 2022 08:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379631.613231; Wed, 03 Aug 2022 08:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9It-0000cl-Bd; Wed, 03 Aug 2022 08:00:31 +0000
Received: by outflank-mailman (input) for mailman id 379631;
 Wed, 03 Aug 2022 08:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4Xu=YH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oJ9Is-0000cf-NB
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 08:00:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b9d90a-1302-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 10:00:29 +0200 (CEST)
Received: from DB6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::29) by
 AM6PR08MB4833.eurprd08.prod.outlook.com (2603:10a6:20b:ce::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10; Wed, 3 Aug 2022 08:00:26 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::14) by DB6P191CA0019.outlook.office365.com
 (2603:10a6:6:28::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Wed, 3 Aug 2022 08:00:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Wed, 3 Aug 2022 08:00:25 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Wed, 03 Aug 2022 08:00:25 +0000
Received: from ff261d33fec2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63671C47-8F40-465B-83B9-211C0EBE8CA3.1; 
 Wed, 03 Aug 2022 08:00:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff261d33fec2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Aug 2022 08:00:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4518.eurprd08.prod.outlook.com (2603:10a6:20b:b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Wed, 3 Aug
 2022 08:00:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 08:00:15 +0000
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
X-Inumbo-ID: 56b9d90a-1302-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cC4QLeuNmUfK34EVyOaUcuMKCAi1q65tu8d/bmnkETRKqGO7HUCOYIFj5Y1wpKNhCt1vlNhOiAxhCWQC71tV52r9mA7tJVxyCGlD/t8WUNTpNjtv52oKSLiY6aC5ozE8LbbVOGeyXKybpQsf5DeuwyR1PgNKe2DPLGHtGK9bwvkdu/Z/nm22BAz7B4ALtNtMRyHhc/MDABpFnijm//JuCoLDiuxk+M9GTc/pjDQ7BqJPwBw8PCd8F+DQTGehPddiFCy4XkoKY10U/gRV6gCSdBcuWFLpwBkWUOGD2yri+Z6OxVxvNJPervOGxxn/f36k6wOajrgoBFzCg7FOJbKYcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3kcBuUgyV2t/niFtsBOtVDWn++Jnvy3h1vWxqn/ARw=;
 b=mgM/uO0ShtmuttxB1tqr+D5RBEULH9EwUXLuMWFx3cw/SEe0kzv2NyzDLOUIIshghDyMY/gFLpXKhT1yQVHb4gt8YwBC2wdLI9ZXUOpuzYY9fLKuZXc3z9x1dkD2SrIlJ5DyeRtsSfGLkHSYfCYNPzwtz7g37/wijK4laIUiTHxRU5K6cVTACckBrCci+wOSZK3dck6OSE1073Dgn0LZh2MFBM/Ta/anqQoDGYQAwvNt4VqIuAF9RMfohxDTKjP3IbjkZM6YepT43a8oKnTyfScmjv1bzfQD447g/eRrI8rveChHrGDNqWaR+s2E/Qm3BHYQ5hF5QOJnKXT0QALcHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3kcBuUgyV2t/niFtsBOtVDWn++Jnvy3h1vWxqn/ARw=;
 b=CKqbMCu8A41s0Zq+js693oGUROJGX8YhH/yWZHGcK5aZhWcBjjE+0pESf7HsIXsGFUQ3VhAqjyi1qYQj7GmzlU5WGEnL7iHCTzC9wbq2U+j3D5Olcqc4qxhojq5CGzw/GToQtu9jHUZFRB1+Inn8qkjuUI8eX54DDNkbMNx38fM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 622743d175e19c82
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW6vjuN2AecFTudiTazkBzKDMAkDDgj4Syr5r4omY6Yg5P9OAnQt1Gpq5dqU2QM0Qmwed8w1FNCKP8zSRLgDO4iK2LyqLzmMXxrWyLwN5KxBjTDrNmjxY007J3qlMo6q4Bp88kYyeMEMk4zCepcMWXCD9ivH6vdmy8BANlFVUjKtWNAjB2uFB8F+WWG7bbSgDW+4rbNyUjBKOMsx4I/ZKx1V+eaGxNyfi7FbTg1tGUGM4Pu26LBKiEXl7ILaLrF0YIQ/Jw/zv7aQstypJGMKlF/d4MRA9kTPPuvWPSj5siBWnmXvGPYd8PbrpZn02BTbtiOza+8/gkZd+9iMjl2Zzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3kcBuUgyV2t/niFtsBOtVDWn++Jnvy3h1vWxqn/ARw=;
 b=IHukTWMG8+pSgA90UYDiw2Z91qx3Lgq4sMKUtzlDKk5S+3a8pS5zOI2tzyQz9nrA7+5CMMEwSYT6K5ZPOOMpvko135VXw5s2a3+d/5tGfdJJXGRpyNzAUd/YjaMPFjEEHFdet/8fkhyM1lvbyvIObPiyRQBkdgWnWsHfNLZ8RHRaPHQJGwbXRLzc2PrAv6S78aypyGr87cppYUqa0zh2lDJQSsv3DQPYatdIdTmgDGi6oBhjWsvYQEA3E6o1jup6Aj+Q5HEEbZzWCxjxhdQDr1Wli9ukS+fEzsVl/ggrw5t68Rrln0SiE7bPMtdbavVU36hLH8cPjJ3i8Xw5p/agtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3kcBuUgyV2t/niFtsBOtVDWn++Jnvy3h1vWxqn/ARw=;
 b=CKqbMCu8A41s0Zq+js693oGUROJGX8YhH/yWZHGcK5aZhWcBjjE+0pESf7HsIXsGFUQ3VhAqjyi1qYQj7GmzlU5WGEnL7iHCTzC9wbq2U+j3D5Olcqc4qxhojq5CGzw/GToQtu9jHUZFRB1+Inn8qkjuUI8eX54DDNkbMNx38fM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools: make misra convert tool executable
Thread-Topic: [PATCH] tools: make misra convert tool executable
Thread-Index: AQHYpwulczj3QM+7gEqGae0IHiG86q2cztOAgAABNQA=
Date: Wed, 3 Aug 2022 08:00:15 +0000
Message-ID: <39EAF06E-B487-41AC-82B6-E2F2A6142868@arm.com>
References:
 <65d730eb0543c507e76b33285bb9d3430662732b.1659444520.git.bertrand.marquis@arm.com>
 <5d680c69-40e3-c980-c917-f8c983318d17@suse.com>
In-Reply-To: <5d680c69-40e3-c980-c917-f8c983318d17@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3b0d09a2-fc0c-4828-9f2f-08da7526396c
x-ms-traffictypediagnostic:
	AM6PR08MB4518:EE_|DBAEUR03FT063:EE_|AM6PR08MB4833:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q+7vkW+i0x5sC/kmrpF4jpBwT7cWRKCGoi6R5gp+MqPcenamusqQok78buaBKjRj3l7Vzh97MZQP1sHKkhPuEJkZPpoIqKe0wDvVcQOFACj9ngaSj4jaHRkRLiuDdux01yd8CyJNYkk5aLWP4BbdivLmeyfa6huOU7TVS/WgHpz9TR14c2F9a8Ni7/T/aOpAbK9l42WDnTyzaBoB1uKHDEHauJxHeCPXraN8Otli4QBw2VpdLpwUcMsZx7NT3A+EJksqthI/EzU94Wvmax57UAapvb+mS1FN3T3brx2GjqkZ5f6ErrsfrXUrYTeqw1U+PlR8OyXUnCbTa+ph2PClZ0AAcD5JmM0LHPySzEZfUwXWr81byWGJHwdAApnRQVqhFvr7vGop5KOUvgy2wi6ww4niti7p/i4PrVMHZNNJf1DjhyGsHpnRBi3p1f2Wl+loM8kWrqa76LyFa+HfY3cdcAw2Rb3pQ7Zu/aomsfCtzLUMn7yK4biaLvGQYL1qQkMF9M2rYuXZ59uI4IK17gr/BYRgvfs+TIjbPajqNBPO7RPm1vdQKrAqEXmM/vb7wbtvEFLqINj5rOKXcE79FiEweM3TslcmRCa2fE8IhlWZ6PyKaijuIr+5GYtqPOKzI1u6zXrGZlkwpVB1uVcSSSnVT7DtB3KNb52ZfJ0p2Tr48a8jxSlW2ZKweG85g90JVR/RLrUN8MnyU6udgjkb0RsWU0PU3dDi2w9dD25kyStXnWCkNboVedUztlNI2KEvd5WIQJmhmOiVaW9lBrxgCBekN05vBhxpjCtVgS5Uob2GwTnydal3OK1qmO0wEEz+lt3t30tEByKtAsFnSEu7C7klVg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(64756008)(8676002)(66476007)(66446008)(66556008)(4326008)(83380400001)(66946007)(91956017)(4744005)(2616005)(186003)(8936002)(36756003)(5660300002)(33656002)(76116006)(2906002)(478600001)(71200400001)(6486002)(53546011)(6512007)(41300700001)(6916009)(54906003)(26005)(86362001)(6506007)(38100700002)(122000001)(316002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46A1A227FFE3754E978118E67F2C0592@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4518
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a9daf43-ce85-4255-9479-08da75263306
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rZXVIC/YaSgxdEPfe5xVJQotIZ1WH6jKRMOz3dtLFghnDrxjUfr9QFfB0c8WpV3uqDXHIb62NdsFv1pXTqXfcFBEVUCpBai0vhLqn5zO7qFcCYSvTmjEFQ5lyI1gPURKZDc1+HfuwayyNP71WST9INs1gCi4mPSvq4M+WR3ZEyvRwfqeVi/mQqTMIXYJ/fJchY5EFcXBq62MpnUunOHnezI8XEMtTod62ZOiD5ESIfrSwB95QO0odgjg1xI/j97cLbGUgMVCwsUGsDogOy1YiHPRcY9pthHCIe00+9XtxXYT1P41+pxsiBiBtCZnfM/PF+YmnqhJF9aqE1acPl+ztU/wcJaITOjks0XgCxR4yVEjDa7PZzZPqtewBN2jZRZ0exiXJrxMMlzuSf+9AskeTVFgps2x5504FqA0DQw6LEStbDA/LSECYV4vL/bv25Ke40IcFamHQ8C8yi0rWuILmURcUD/jFeotgz2wqhfr63+vlrBuXJIFNCkydCtBOvKWNmhQCQDbrcBMXsWmuuxBb9I2FZ5BZgAbdBAZLyA7LlELa3b7R1oLW5nHjV+hYpg7p/jj59wA3zDvrd0cGlpjyzC+FwQ3yfhj3Q+mKMLyVaxlb18P9f0sQaX5W9RDld6ioDPxsoRLR5b/I2DEjK9IlBNQxySDWG/hpluKsR9hssv+/5pdZ+jI9MJQnLkcSzIlxN21Ja9y0eayMMeVx5+P1yrO5JZDWrFaH8LLTUa6HhYZCLYNey9sTjknZyPpWHCjHGEZA+O8HgtQWIohnZljX/wgmiGwtkUr2Wscnv6ycxcUrGAyZ2vXGBnFWngkwYXS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966006)(40470700004)(36840700001)(83380400001)(4744005)(2616005)(336012)(36860700001)(47076005)(186003)(8936002)(36756003)(6862004)(4326008)(2906002)(5660300002)(70586007)(8676002)(33656002)(70206006)(316002)(86362001)(40480700001)(82310400005)(54906003)(478600001)(6512007)(26005)(41300700001)(53546011)(6506007)(40460700003)(82740400003)(81166007)(6486002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:00:25.8817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0d09a2-fc0c-4828-9f2f-08da7526396c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4833

Hi Jan,

> On 3 Aug 2022, at 08:55, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.08.2022 09:35, Bertrand Marquis wrote:
>> Fix misra document conversion script to be executable.
>>=20
>> Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/tools/convert_misra_doc.py | 0
>> 1 file changed, 0 insertions(+), 0 deletions(-)
>> mode change 100644 =3D> 100755 xen/tools/convert_misra_doc.py
>=20
> Hmm, the real fix imo would be to add $(PYTHON), just like we use
> $(SHELL) to invoke shell scripts. This is to cover for file systems
> lacking a way to express executable permission. (Along with that I
> certainly wouldn't mind the mode change, but that would then only
> be for cosmetic reasons.)

Good point, I will submit a v2 doing both.

Cheers
Bertrand

>=20
> Jan


