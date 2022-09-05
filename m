Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257815AC933
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 05:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398445.639278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV32v-0000BH-Dj; Mon, 05 Sep 2022 03:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398445.639278; Mon, 05 Sep 2022 03:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV32v-00007W-AE; Mon, 05 Sep 2022 03:45:13 +0000
Received: by outflank-mailman (input) for mailman id 398445;
 Mon, 05 Sep 2022 03:45:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cA+y=ZI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oV32u-00007Q-1J
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 03:45:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23e8d05f-2ccd-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 05:45:10 +0200 (CEST)
Received: from DB7PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:10:52::31)
 by AM8PR08MB6628.eurprd08.prod.outlook.com (2603:10a6:20b:362::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 03:44:47 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::bc) by DB7PR02CA0018.outlook.office365.com
 (2603:10a6:10:52::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 03:44:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 03:44:46 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 05 Sep 2022 03:44:46 +0000
Received: from a8a37d5a5168.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17387697-A65C-4047-83F5-BDCF97051DCB.1; 
 Mon, 05 Sep 2022 03:44:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8a37d5a5168.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 03:44:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7804.eurprd08.prod.outlook.com (2603:10a6:150:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 03:44:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Mon, 5 Sep 2022
 03:44:33 +0000
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
X-Inumbo-ID: 23e8d05f-2ccd-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YtAsGO3l/u6f2na0w7n4UciwNdBSeeo8kFF4br5DBZMk9fxVaQxYK2XuEx2XilG+IpCYj2qja+CnkQHc+eGla+9wO6Yk4DUfis2xnIg+QRFjQvj7yxdsBWwe8ctrUh9Wp8fQHvWi37QuE9Q+fyiPsCdM3tA4xT2Ur7SFE8rY+woZqZmLRIBiXHTUJau5npa2EKifO+w/prnoFWGuqtYrZN5uvOO7q50mgzXriZqzrP5SYqAJlotXE/wPp+cf7Kn1oN86M+dEtKIo4lobl8iQuqpq86ctFgfd2fHADHujNsNfgkWtf2zuXWI4UQ99Ioh3AU07zbtIV8XcBWKMRrS5IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWoQ9ZSYFjnjyRnksdC3j5tqGGnmAdf0hNC572h/55M=;
 b=DMo+O8v5A9qmdrarwT8B3M3tsKG5uG+sBQUizcIgSTut2lCh2yJKh0BEpO0pbP2RQnubp4SplZ+/ry4HNHD7EAvZwArRya9XXSPT175BdBq3/YU/IcfN6Km8i2Hod9JQGXOhkX1em4BQy/D61DMPa2LdRkusLj7G2fgrh87S5i+Mt7ZWYvDmXM2AKFLNJz2PfJ2nzTJPhE9c5vwTv4Pwz5nyrHXJle2oV1kZUYfeNEWTKtEEXeoA4dbkyZR3bw8Dj4cYtslE7DdH7KIyePp/NLM8T18QSn9L1JiBnXjYsybomjN5hPDzeqIpsx9J7cjmFBr+bTpbh/4lb3+xJPB9XA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWoQ9ZSYFjnjyRnksdC3j5tqGGnmAdf0hNC572h/55M=;
 b=JIdFCN9TTPcy3B43QSSEWvz2trZIgJFjAanOmPOB17FAagCOtwJMREiZcczwjlHUhooJZCgKkEwjyG/6f+z9RCu7b7KJYHiHSAH5w3Vw/KLNdL2c6hIz8FHA2AUY1fdU1BOkjvqrlo+pfYW79sQT6UNNJa1966rxuepXjKSNI0I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMA7lBTnWr6WW47EYu214ws/uifdFJHojNE981QHzOnHoc1DnFH8j6RQ5IzRTnaGJolirwR2P48Da+qKdx9WOUCX4TjJrm8arTVklrLZLWV9Vu+cuKf6unkqbMnOsit3L7V/jyw3YEMD+O3ztk5EVN4ji3at6Drtv+0VLh5tcU9lWDSSMicDEYNH8DOJeWxKwBlNqebask9Q8TlYwZ3BCBdPhd2Yezck9WIIzZjAaqICq2ZqDFpA4xpr7S1Iw24l5yvjLHNaMZutiQwKfqahpm29SDUx3/vFY/34ZGZvRgavUTyLFXm4UPiedsX/1Sh2wLLoozpnA+pjwjfx3Zr03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWoQ9ZSYFjnjyRnksdC3j5tqGGnmAdf0hNC572h/55M=;
 b=XabJUdUw8XAST1Jzv3l7Xp8GJolFwoE0je2NJFJMVJP7Lxz9vYohJvoJbARG/Qz1NXYgFsVR5W1l7gVHSFeK2yXlysk+3lolBId49zABLPoLpQ6YniFWFJEx4feh1vOig/4FG01uyZLTL+eRFbfX3Luv2Ur9DlbexyuYWtDXRonUUqklJ7cmx8VnOjCJq5/DWc5IQIMylBtNhvudW9B/QFtwDEo7QYwDYFgJDx0NK1N6uJTRnXHm/1XgSqTIMUSM1i34L7Kc443sJxv8IeEO/e/9jp+nEJpfqmkNU1ywIBwHfKaPYc3mEx7pCxkRUHDdPMUekceHL+lFZlXtv6KZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWoQ9ZSYFjnjyRnksdC3j5tqGGnmAdf0hNC572h/55M=;
 b=JIdFCN9TTPcy3B43QSSEWvz2trZIgJFjAanOmPOB17FAagCOtwJMREiZcczwjlHUhooJZCgKkEwjyG/6f+z9RCu7b7KJYHiHSAH5w3Vw/KLNdL2c6hIz8FHA2AUY1fdU1BOkjvqrlo+pfYW79sQT6UNNJa1966rxuepXjKSNI0I=
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
Subject: Xen 4.17 release: Current status before the feature freeze
Thread-Topic: Xen 4.17 release: Current status before the feature freeze
Thread-Index: AdjA2VmJ6EcVoZ5cTOOgVSRHep4cQA==
Date: Mon, 5 Sep 2022 03:44:33 +0000
Message-ID:
 <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0CB61D2A885E34408716F6B41BD27DDF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 30386608-2497-4e7e-dc40-08da8ef0fa60
x-ms-traffictypediagnostic:
	GV1PR08MB7804:EE_|DBAEUR03FT034:EE_|AM8PR08MB6628:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lRUGf6YP0mGhDmx8LOhYz3axOHBqMLRB0gVkdoHI9Jgo26Rt1QX0uRX1YFKd111lds7eIMWgQ54GXXIDdKoucyIvlaLgHZeJXXHhJVSC8mDwhFVQmvNU3AxAzxMobTgrNZw852Cts96dhzDsmEAhpYnn5sbpSULXyZfIWBPG91YKOYTgRxT/P9xexM9k5bIFCEaEzr67+e5ur5KVCO4kBMK+Hn2moJ0kmKP+Z5ChJBbf/g+5hrm4Y2xwyGFaxweh5XUUk6ObrDREueMbrUfjbup6Y1f3uk/AK9Xz7O52uOyq9mHyPf+zVZkbUBD2Td9jDDe9n9jLLzqSNVyV+d7SJSVbmDfYjCYin4GveNtl5M7s83BkB0DS8W9hrrebAdpmwgdGO7Qt8FDheFt5UqrK4cz6qoIaDWXv7GDe1X4jsjF86bflHZTdCCfr+ahfVUcZpRgU6m1q58k0XFWQgpLSE4lHPF7zU0e6XxdVtAAiiwvRHX+Pji8SX+tYh9bODLNdbPGH9n8bWLm06CNuP83ipol5T+1jZoKSzjV8l0mXGTOqYnijf/sBToYEj18EY3caXTIhOIKQus2Hv9TlifNBpzVOG2DJs8vs1nEPwMEsr+xscXRmLKO/4wR2PF9hOS8GZYsBEJ9cJkxDthL8z3/gxkJATtR0caA37QT3HzvjeDPANiziipdEf1V3LgKqzCuWpVTAzl4ogAtz+nRYkqeDi1w7HJlT66JzBwwV58hoo5oxGzsFL1AK/MLeZW1xgAhaBNjn5H2WkmKWPzcLTqRSik1w8fUVrGejhzSUi34HEoutuaFg50bFo5+yVm2LvQmnsesLUQdD9oEc1x6h6MWo3g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(6916009)(316002)(83380400001)(9686003)(6506007)(26005)(7696005)(54906003)(52536014)(478600001)(8936002)(55016003)(38070700005)(7416002)(86362001)(2906002)(5660300002)(33656002)(122000001)(4326008)(76116006)(66556008)(66476007)(66446008)(64756008)(8676002)(66946007)(186003)(71200400001)(966005)(41300700001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7804
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	60a85741-798d-4a0b-502f-08da8ef0f26e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r9RevS05z7PcCz1BCiKXQdrR2Nahmge8CLB4/c8rgOJPaRIp3xnLpIzKWDcBLA7ZQE17P27d3Ictgi2AMpRYTotE/TiYmvbVzJuu8KEDCimECMaoo9vpkqmyqsaemx3MnFvwjk8Dyr4qEFHfbl8gMbwbFg2fLtXr4r/a79HvCPnlzCxLFt8jkr7v+kpuicEeWt7i+pcfNMJ7eZWcLMvYfcgdseGvrHFxmZDaQ7auUTvJwu+MBgRbNA+4/1XGMzZ4fDoz6mxMdlIhqXBm9K+bnOLQ1Mlx0r4zW2Rx8AHEAoWc9yQq1h3ZMRKHA4avKw4pC62V3/sZeeiITHXv2YsMMeunTailcu+oPhprBRPNWOffmaYohpV741pUe4A/awW1NK/Tu878+73wCx4g+lLQqN82Qam90/g2v/V6dw6AhyEHtnDP0HR1yHBRvnPoMqilcKluTlDjfVcCLUBGCIZhKp8z6Ri60QRudhyyiQIcGoTng+JQOcefsNZ6BYVqTV9x4yFl+NbHy06eCJb7jkGV5ot1VRS9jwgorKWcTzSSLrQSA7XRPoy3sBqE6ftlfkMF6RIrZdbJNtuwiG2CySlKqCSnsJkMIYplEVR8xkm7k795GBAPHvPaJGZH7PTgMsr15bWVrvlPiiGSx6iA8gcDvyYqMHYW0z3vhB6trhqSQ7YlUaDMGDeKAJsbqX0yNMt0y5UxS6b+PAkjwFNgjWKHIvpTILa6p/e/xStsr2sxcnF0zJkFS3MSvzg4HYTFH1l6lSA2//TS8leNkc1uOoPweQFewx0H8sPVfEnkzB9k75vITRgtW0z/zCcbzUBdckEP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(83380400001)(36860700001)(54906003)(6916009)(82740400003)(356005)(81166007)(4326008)(55016003)(70586007)(70206006)(82310400005)(8676002)(316002)(2906002)(40480700001)(52536014)(8936002)(5660300002)(9686003)(7696005)(47076005)(6506007)(26005)(186003)(336012)(966005)(107886003)(41300700001)(478600001)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 03:44:46.9199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30386608-2497-4e7e-dc40-08da8ef0fa60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6628

Hi all,

As the feature freeze date is around the corner (Sep. 9, 2022) and we are
currently summarizing the series for the release, here are the list of seri=
es
pending in the mailing list. Please add the ones that I probably missed.
Thank you very much!

Note that the blocker, automation, Arm lists should be accurate for trackin=
g
the 4.17 release IMHO. More inputs and clarifications might needed to clari=
fy
if all series in x86, tools and common lists are going to the Xen 4.17 rele=
ase.

Also, as agreed from the September community call, the tracking of Xen 4.17
release will happen both in the mailing list and the Gitlab. I will send th=
e Gitlab
link once the work is done. Thanks!

** Blocker List **:
1. Patch: x86: enable interrupts around dump_execstate()
https://patchwork.kernel.org/project/xen-devel/patch/e717897f-980d-ad44-31d=
9-39f5e7e1c45e@suse.com/
Status: Waiting for review.

2. The fix of libvirt after the virtio support in toolstack
Status: The OSSTEST seems to work properly, apart from what Jan
asked in IRC - the qemu and omvf OSSTEST might need a force push.
(I am not sure if this has been fixed so I just carried this)

3. [v2] x86/PV: issue branch prediction barrier when switching 64-bit guest=
 to kernel mode
https://patchwork.kernel.org/project/xen-devel/list/?series=3D661061
Status: Need review.

4. Licensing issues and details
https://lore.kernel.org/xen-devel/b58f5340-d4fa-df9d-89de-6137005add77@citr=
ix.com/T/#u
According to Andrew, relicensing device_tree_defs.h is a release blocker

** Arm **:
1. static shared memory on dom0less system
https://patchwork.kernel.org/project/xen-devel/list/?series=3D661838
Status: Need v7 from author.

2. populate/unpopulate memory when domain on static allocation
https://patchwork.kernel.org/project/xen-devel/list/?series=3D672665
Status: Patch #6 needs review.

3. xen/pci: implement is_memory_hole for ARM
https://patchwork.kernel.org/project/xen-devel/list/?series=3D673155
Status: Patch #2 has comments and probably need a v3.

4. Introduce reserved heap
Status: Need a v2.

5. xen/arm: smmuv3: Merge Linux fixes to Xen
https://patchwork.kernel.org/project/xen-devel/list/?series=3D673634
Status: Need a v3.

** Automation **
1. GitLab CI cleanup and boot time cpupools test
https://patchwork.kernel.org/project/xen-devel/list/?series=3D673488
Status: Need CI maintainer's review on Patch #1 #2, need author's
action for Patch #3.

2. automation: Test a pv network interface under dom0less enhanced
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666128
Status: Need reviews.

** x86 **:
1. [v2] x86: show_hvm_stack() requires enabled interrupts
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667114
Status: Need reviews.

2. [v2] x86: help inlining of functions involving alternative_call()
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667117
Status: Need reviews.

3. x86/spec-ctrl: Reduce HVM RAS overhead
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666983
Status: Patch #1 reviewed. Patch #2 discussion going on.

4. Intel Hardware P-States (HWP) support
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666690
Status: Need reviews.

5. x86/hvm: Improve hvm_set_guest_pat() code generation again
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666603
Status: Waiting actions from author.

6. x86/AMD: check microcode size against CPUID-supplied limit
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666515
Status: Need review.

7. xen/x86: import linkage.h and clean up x86/kexec.S and x86/entry.S
https://patchwork.kernel.org/project/xen-devel/list/?series=3D665401
Status: Patch #1 #3 merged. Patch #2 #4 need actions from author.

8. x86: limit issuing of IBPB during context switch
https://patchwork.kernel.org/project/xen-devel/list/?series=3D662741
Status: Need replies from maintainer

9. XSA-407 followon fixes
https://patchwork.kernel.org/project/xen-devel/list/?series=3D660818
Status: Patch #3 reviewed with further actions from author. Patch
#1 #2 merged.

10. x86/irq: switch x2APIC default destination mode
https://patchwork.kernel.org/project/xen-devel/list/?series=3D655330
Status: Patch #1 merged. Others need review.

11. [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors plus fallo=
ut
Status: Some parts committed, some parts entirely uncommented on.

12. [PATCH 0/2] x86/vMCE: address handling related adjustments
Status: No comments at all so far.

13. [PATCH v3 0/5] x86/mwait-idle: (remaining) SPR + (new) ADL support
https://patchwork.kernel.org/project/xen-devel/list/?series=3D668735
Status: Patch #1 #3 #5 need reviews.

14. [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Status: Entirely ignored for about a year (since v1 submission).

15. [PATCH 00/11] x86: support AVX512-FP16
Status: v1 was reviewed, but some of the review comments need further
clarifying before Jan can sensibly make/submit v2. Note that this depends
on item 22 (albeit if absolutely necessary it could be re-based ahead).

16. Device tree based NUMA support for Arm - Part#2
https://patchwork.kernel.org/project/xen-devel/list/?series=3D673455
Status: Need reviews for Patch #1 #2 #4 #5.

17. [v2] x86/public: move XEN_ACPI_ in a new header
https://patchwork.kernel.org/project/xen-devel/list/?series=3D670995
Status: Ready to be merged.

18. x86/PVH: restore VMX APIC assist for Dom0
https://patchwork.kernel.org/project/xen-devel/list/?series=3D670123
Status: Need review

** toolstack **:
1. Toolstack build system improvement, toward non-recursive makefiles
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666960
Status: Partially committed. Patch #1, #8 #17 needs an ack from related
maintainers. More reviews needed for Patch from #20

2. libxl smbios support
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666694
Status: Need reviews.

3. Virtio toolstack support for I2C and GPIO on Arm
https://patchwork.kernel.org/project/xen-devel/list/?series=3D669685
Status: Need reviews.

4. tools/ocaml code and build cleanups
https://patchwork.kernel.org/project/xen-devel/list/?series=3D664150
Status: Patch #2 #5 #6 merged. Others need actions from author.

5. [v2,1/4] tools: remove xenstore entries on vchan server closure
https://patchwork.kernel.org/project/xen-devel/list/?series=3D659375
Status: Need reviews for patch #3 #4.

6. [PATCH v7 00/11] libs/guest: new CPUID/MSR interface
Status: Largely reviewed, but there was something Andrew's input
was needed on, or he wasn't happy with.

7. tools/xenstore: add some new features to the documentation
https://patchwork.kernel.org/project/xen-devel/list/?series=3D665064
Status: Patch #2 merged. Only patch #5 is not properly reviewed/acked.
Discussion seems going on and (probably?) needs a respin.

8. acpi: Add TPM2 interface definition and make the TPM version configurabl=
e.
https://patchwork.kernel.org/project/xen-devel/list/?series=3D672588
Status: Need action from author.

9. Use direct I/O for loop devices
https://patchwork.kernel.org/project/xen-devel/list/?series=3D668537
Status: Need inputs from reviewer/maintainer.

10. x86/hvmloader: Fixes/improvements
https://patchwork.kernel.org/project/xen-devel/list/?series=3D670606
Status: Need actions from author.

** XSM **:
1. [v12] xsm: refactor flask sid alloc and domain check
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666302
Status: Need review.

** drivers **:
1. Add Xue - console over USB 3 Debug Capability
https://patchwork.kernel.org/project/xen-devel/list/?series=3D673630
Status: Need reviews for #1 #2 #4 #9 #10

2. PCI: avoid bogus calls to get_pseg()
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666322
Status: I am not sure if this is superseded by
PCI: re-work pci_get_pdev() and friends, if so please ignore this.

** Common **:
1. xen: add late init call in start_xen
https://patchwork.kernel.org/project/xen-devel/list/?series=3D664963
Status: Need actions from author.

2. xen/wait: Improvements
https://patchwork.kernel.org/project/xen-devel/list/?series=3D660565
Status: Need reviews for patch #4 #5.

3. xen/sched: fix cpu hotplug
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667963
Status: Need actions from author for Patch #2, need confirmation
from maintainer for Patch #3.

4. Hyperlaunch
https://patchwork.kernel.org/project/xen-devel/list/?series=3D657187
Status: Need actions from author.

5. [PATCH 0/9] gnttab: further work from XSA-380 / -382 context
Status: Some parts are controversial, but this shouldn't prevent the
reviewing / progressing of non-controversial ones there (7-9).

6. [XEN PATCH v2 0/4] xen: rework compat headers generation
Status: The 3rd patch needs reviewing by someone speaking enough Perl.

7. MISRA fixes.
https://patchwork.kernel.org/project/xen-devel/list/?series=3D672591
Status: Need review.

8. Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS
https://patchwork.kernel.org/project/xen-devel/list/?series=3D670926
Status: Need review.

9. Make XEN_FW_EFI_MEM_INFO easier to use
https://patchwork.kernel.org/project/xen-devel/list/?series=3D670812
Status: Need confirmation from maintainer

10. [XEN,v2] build: Fix x86 out-of-tree build without EFI
https://patchwork.kernel.org/project/xen-devel/list/?series=3D668331
Status: Reviewed but not merged.

11. [XEN] MAINTAINERS: CC Anthony on Xen's build system changes
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667992
Status: I guess this need a v2?

Kind regards,
Henry

