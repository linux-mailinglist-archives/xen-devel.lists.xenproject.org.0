Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388FD98408C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:33:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802482.1212724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0z5-0002nr-SP; Tue, 24 Sep 2024 08:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802482.1212724; Tue, 24 Sep 2024 08:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0z5-0002le-Or; Tue, 24 Sep 2024 08:33:23 +0000
Received: by outflank-mailman (input) for mailman id 802482;
 Tue, 24 Sep 2024 08:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Gt=QW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1st0z4-0002lY-2o
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:33:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2614::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8079a6a-7a4f-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 10:33:21 +0200 (CEST)
Received: from AS9PR06CA0636.eurprd06.prod.outlook.com (2603:10a6:20b:46f::12)
 by DU0PR08MB9153.eurprd08.prod.outlook.com (2603:10a6:10:414::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 08:33:12 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:46f:cafe::5) by AS9PR06CA0636.outlook.office365.com
 (2603:10a6:20b:46f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Tue, 24 Sep 2024 08:33:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 24 Sep 2024 08:33:11 +0000
Received: ("Tessian outbound f9d5b330f2e0:v465");
 Tue, 24 Sep 2024 08:33:11 +0000
Received: from L7bb207eb6bfe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 644C1FEE-CDAD-4AEA-BB56-CC8DF53BFC33.1; 
 Tue, 24 Sep 2024 08:32:26 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7bb207eb6bfe.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Sep 2024 08:32:26 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB10296.eurprd08.prod.outlook.com (2603:10a6:20b:648::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Tue, 24 Sep
 2024 08:32:23 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 08:32:23 +0000
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
X-Inumbo-ID: a8079a6a-7a4f-11ef-a0ba-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RGNqMQ/GLmZjvp9niV3kd/u+gGE+HyW+srqiSpQWfoR7g01nZ1fHoY6b/AehaVmL0ZZ7u84WCZoB6pvYaxr+gOFnIIAuNkT12kxG2Htje9fBw0sF2ZrGooaGj+zXhG8EvIylm57F3ogIBcmyc7a8NNYXRLpk0LVBFJJBtdcIDvlf2njiSoij7sSm8ewL6DMQYj8hD34Ymoe2Cly9OXwrr3ECPCDF0Ozb/0QZr4QImCBHTRShBeai5cLnke0z0fhof0o99foo/D18lDMFTpNL0HE4RnokRJnnJQQM5XbFL2K/0zDOQgDCyeFx3VbrXJ9JHGh5Dbzp/BOAinLP/myriw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/GPS2Ndk/UfblQ3M8tOdpi0q3J9AFosfAuR8lPmrbU=;
 b=cci8tDGnPRGXtuht0nzqQBJL/IxcQv+eApAeMx4pTt5ivz+qCpY5lmFUl6bPxLMV8bwZE2xaMDob5z29DWwn0jWDAKVOK+Y9r/JgGR5Z8S6xVwdf8klejW88bY2r7bnOEttgvJlzdzXuSFOexF+6JDlc/J7WpnQ4RLH/m/JbH6aSx2pzR0mp7rklF5kQSdsVSvEeKkUFS3+4PwFNLfhyIBRCpXRlBHmCbN7rToaem2cN2CO8BHq990JfI7HGeX+ZLKWT6tYowXKBpzrxRG8cGguqp8Q5RqrUkhEPUMfB+0qyHfXUlMRVVDx5LTBi+/OPySRGtS+JZopPbI3jn3kZcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/GPS2Ndk/UfblQ3M8tOdpi0q3J9AFosfAuR8lPmrbU=;
 b=crwzMvdSIAZCowdQWVrlWNZBmgScHWDYPRqCeWOv9xHUsVOP75YZ3+zNHi3m3GjFcLOwdeVVDBfWClFZZ4kk+5ECwAbtr1jfqIMe9oThRbIL+qUBzMj6l//AphpGCmArNLT9H6HqJOfAWOybw4xfV6UALTAiMs/CKvsV4hqlBxM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed3f1ebd943a00ca
X-TessianGatewayMetadata: nUMA16z5g3IIX5liLo95flooyaWq3uY3SFed34dtuei5XqCmWRSmYreWcGBvQvAuOzl0Fo2CzT6rqUubP1RmVPaaxrGcor+qucNql3Va3JlFWT29p6mbmtPKR3RLi+wLedVFxYzye/WkpCO8Gxi4Vd10gypotWhC+2SK6ASOZ7k=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIxu8aOrXU+drewKzxNyFlOQXP6+fdNzSEoBP9CHENIER9EVCm0EhB/n+XqwkMuVq/vBeJ1atCgcWlTjdiCD10ciA4P696yQqyaQYB+7G+c5YFfOlnhZ0Ym/q+0798vL8hvVTvR2aLMEPqQfYe1lKwdH9sEzttE+TI2rTelMvRK+jw0XBRdgs+dTytnGlCarpGMWsaJaoQsERLac74TyYmwMrsr5QlXg/BHLSk7ZZPwjSK0597ggaJCNzNR7zDuuaqOW5DtxMOCelcPezCXdf62hhj42ygX7oZoPUkffnGWmJ7Jl4rq6VRhhTEH3qFFWR5HxxCSuVhDFqXf5pCOn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/GPS2Ndk/UfblQ3M8tOdpi0q3J9AFosfAuR8lPmrbU=;
 b=maIiIFGFIOx05i2om79g2GJrEXT2kJQThAFpkl48Kn3d0JutNgDucAoXC5RvGkluF6/A0sWtOA7XhUf7t0C+gkG0nb+yXq6m7Dn2h0hDGPK+OzauuqHoX4iqkATpCkn9vBJAcNXnkwIAAU2drtIcqb1a6C9kPGLOpcnQWZydUUToKEqus4s1oER4yHvxFqHWtQ5YvHTUnCrDmRxA3CdjZV2B3wemtFkeIzDalh/1wkjiAxhyxs+Sd3TZLbrl1oshvPJlLTUJrsK7m+gKgFeMOvznQWhW+05EUYeUgp48KOjjkbRVs3GapWxvXN3cYPT0SjeQJIuZUh5n+ibu4oZ2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/GPS2Ndk/UfblQ3M8tOdpi0q3J9AFosfAuR8lPmrbU=;
 b=crwzMvdSIAZCowdQWVrlWNZBmgScHWDYPRqCeWOv9xHUsVOP75YZ3+zNHi3m3GjFcLOwdeVVDBfWClFZZ4kk+5ECwAbtr1jfqIMe9oThRbIL+qUBzMj6l//AphpGCmArNLT9H6HqJOfAWOybw4xfV6UALTAiMs/CKvsV4hqlBxM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Artem Mygaiev <artem_mygaiev@epam.com>, Hisao
 Munakata <hisao.munakata.vt@renesas.com>, Julien Grall <julien@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
Thread-Topic: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
Thread-Index: AQHbCDKnNzyGC8DY7ki21+yQsaede7JfBtYAgAacA4CAAO+VgIAAEQKAgAAErIA=
Date: Tue, 24 Sep 2024 08:32:23 +0000
Message-ID: <DC433E1F-CD65-4F70-BD51-AABBBB320D73@arm.com>
References: <20240916121851.3587139-1-ayan.kumar.halder@amd.com>
 <C3DB9D13-B9E6-4F8D-9678-59555E36AD68@arm.com>
 <87472b10-8e36-462f-a4fb-973684bceaa1@amd.com>
 <F7E20E7F-FEB1-4A70-8D76-75B5A827048E@arm.com>
 <51b52075-cc06-45b4-8d85-d6cb903fcda1@citrix.com>
In-Reply-To: <51b52075-cc06-45b4-8d85-d6cb903fcda1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB10296:EE_|AMS0EPF000001B7:EE_|DU0PR08MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1fffe2-abe0-4548-2715-08dcdc7386c2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|376014|1800799024|7416014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?DpstwReeb0nECzlNhkuz4/B5+JRfp7EZGBBQ+bsyuPAP7sfclDcpQptOyJMA?=
 =?us-ascii?Q?Ob7sV+Hg40ElySJ/YTg+Y2sAzJalWWaLPWqd+77eTYL+aZKKsP5mJ5Ro/nOn?=
 =?us-ascii?Q?CCoC3yl/yRgcah+Ip7VUi20SfaVA7bmoYB9tzcXqpn8clV2GI7aAXQ2Dnief?=
 =?us-ascii?Q?JSPfdDOudduh+pRXPALN3Sc6AGDmGoYRqiXHpzJuvo4RJVGy5BA2sexrwd0y?=
 =?us-ascii?Q?9BIZxWOTcM6c9nnPfy+gjvpF74NLB8ZCXYWPecUO+CiKUfVi5VhqtNcQtJ/U?=
 =?us-ascii?Q?gzmYyWpJuSvunZ3v6iSfyRdkjW3eu+w/W034bRdHQUV7hpAIm7+V4ts6S4cB?=
 =?us-ascii?Q?yUQBHL+5UPU10PhrUIbmcHS6r3I3VTzUFg0ytH354vSPUfeQoBuLFsR6QAEa?=
 =?us-ascii?Q?fhhF4nk0m1wXzCjTwbAe12m0JCTIzFzKFAYS2xjBzE5VOuugxdQgpV9QIxgR?=
 =?us-ascii?Q?egHbYgYSgDehdgtplrz8D7yVy2xmE1dZW/XXXCVeHvipyZ6UOwbe4VqcChXG?=
 =?us-ascii?Q?1X3IolVOHrUbIHdDklrNUZW5U3LytjdhRCgv5mthLEBcevUUctk2B6dgLJFh?=
 =?us-ascii?Q?rnnKB3AnUa6oRhtb/dvzkeGNqouN6M5TeIYY7xotqy3u2if9TUoQNULPEZHY?=
 =?us-ascii?Q?7Vu4VzW7Cu2SIvLg0GCoA8q4DbQOckB/xFsbdkSCAExlp57yyEyTOPJGN+IW?=
 =?us-ascii?Q?TLF+fiHpRh0/kcoasy5DE1428sHgqm0gsNM1ktSISBFHmd3jLMnDUsQkv/O3?=
 =?us-ascii?Q?ykS6fJzhJ2Ds+rlr1aZqGI36UKUZrbhLTK0zRJi2/E0HQKP2ef5m8E3h4kIo?=
 =?us-ascii?Q?OVPcT6o21nlAWAj1ShdPqiKrLdTJ6gYgLAe9jrV6MgWGyL6lG9XuPTlhxrLW?=
 =?us-ascii?Q?5gEAkXrR2WH13hc87FBnJXDzyggHe4JDCkjVww5XOdIcRyLbbIcXK0AfjcSw?=
 =?us-ascii?Q?n3IMUGpcoSAmvkju8pCEycXCrogLhZildS67EYdpEgojV7CuN0ay765D5iuE?=
 =?us-ascii?Q?KNSPHQPAbexqBk3i8ALaRdT99Y4YfmjsuFI2RYZNgnLaMEOql0WCuIrCf2sn?=
 =?us-ascii?Q?bclsrt6ZRGvOvR2lY1KqVZu5cmKe9Q9+SVSH+FS739A/2nB/tdwtsqJvCnKa?=
 =?us-ascii?Q?diGQbh9ueRu1eHqNxY+HUH1HPZrhrjC13vgZulqQhF9iNzYs22lJd+vIlj+5?=
 =?us-ascii?Q?sFEsXlzIG84Ns2SMT0F3t01qoTyXya4VR7FXgMbHFIFtM6q6tYlTpl56o5Yw?=
 =?us-ascii?Q?HZJDkh4h8queUWLw0Ubd8Vn4B2sEjHot44Yhi+IwavHU6esUTQaTH4sFy2nf?=
 =?us-ascii?Q?9U9s/xOzMuDXVkASEw23FXtVdYLzM7ahllCgwynsXhH2GA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <464A0CE76CFC7A4D8A7B7242EAA6121E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10296
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a0b51fc-db6c-4deb-dd04-08dcdc7369e7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5QhDuqe5u9UIjpGqZGUDZ5npRz5CEl1gDdy0fwwlZg9oZ8ALsY5ifo9dG14h?=
 =?us-ascii?Q?6D9hbd1td0UO7/BpiJAd8lvXRe/VxIHj+O8pAPT9kO2S4ktWURgiqma4RI7M?=
 =?us-ascii?Q?3Bw8+c7ykAcdCdmK9FvGVxqW7H53BF57vvNazn10HA1jy1yMAG91j3pXtmW2?=
 =?us-ascii?Q?j0zHPTK76AfPIWgPF5ep7QtGBMxk/ovUF/4R0n+o3EYqLSiQIcPn+7+A5NTD?=
 =?us-ascii?Q?vsqwYis6EzpKyrOmrx2vPOFALHekZxianPzL51vUUOxham03tCypJFPUpCEE?=
 =?us-ascii?Q?dFzMJLBIScMfHZ0can5rBi/oaYdZD9ec6iCb4FmXQWXDAWuzSRqDcgo8jXmz?=
 =?us-ascii?Q?v6k98xodUgiqHj7W6t6tFvLpTS0Rdi+8ghnir6kt2mfc1di6um6BFMekSs2y?=
 =?us-ascii?Q?to4V51/VF5yAAcDP+xWefRQnLVJYScCg7DA6WhuHAHMVNT0DT/eDt27Dfaex?=
 =?us-ascii?Q?nXa/z72xJ1ZNg1OeDlt4oYhLUr8rMH3vqaCyPIlN5OqvMc55JHuQ1Je6fsJf?=
 =?us-ascii?Q?o/VBTs/wu9wH/ruZESha5VSHDPIoPfhGM6D3yYAPD9ViPPfy0lYcUYwgNyAn?=
 =?us-ascii?Q?1jFefqykB+4MaYngFeWTyRmiVo0cUwbHv0BST3/L74uskVUsfUXXE6eyNTk2?=
 =?us-ascii?Q?kp5TXY0uzT3eMJ+XBbjOg5TyppfDSTQGVSoqPIValp11a9bYuoFC+7MiDfjP?=
 =?us-ascii?Q?TmfAMMIG57JP4ak4k/e5wAPZDzWJFhLbrWQgxRBvn8CQ93qpivXmlpA9yEFq?=
 =?us-ascii?Q?XOBIAQnBnxTpJcpA0RUqK68v5EkLbKK25Q/DROUSYx5SfTatuzaeu3dFD2fl?=
 =?us-ascii?Q?1/XMSqfZ6Bcj244+w/PKrdUkv2pP1m1bJ2inSJoF7vJhJlj3rQcywGRSG9nz?=
 =?us-ascii?Q?3c+wcyHYN0UGNbAy9rMZuSlzADJE4ML4bCStSjXECjXtSJLvMKeqbNU399YQ?=
 =?us-ascii?Q?TkfxG+XLkJUWFnGJ5eYMIXFnqKlXesi2ofPqIwFq3b90PuIiasz6EkSFiG+t?=
 =?us-ascii?Q?vU4/eyRJui1kvq4gJBuXojRWxYMTSYun45SNOyKO9vN3G8+4SGAPw+l8y/o4?=
 =?us-ascii?Q?gWws/9SePOnWmYuKEk0qB7TwvIrHxlrc2vrfJb7lnOxUM35Dfhb1PrlKzN2t?=
 =?us-ascii?Q?72c4EhXd5YVSBG1Y9Mx57V+iY3tgSnun3l0M2Op6RiWXH6VhJRpIxVurooCG?=
 =?us-ascii?Q?6FRj/xl1Te2KzQFZIyifPN7WENSSFMbf/ZYoR95Vk6IdGB9xAD0zXKcbVrTP?=
 =?us-ascii?Q?gD/cdbP20VIsJm+FoorUP5y6U4fDyq/7a+vy+bgHzrvClXnn8hOBo3vTCehl?=
 =?us-ascii?Q?dppmn6SSEY4g/GmQPIaEKQnFJQ7u3/O89fJTbR18Wl3ks9QKLHcfrnvgQJKd?=
 =?us-ascii?Q?ECeBZLalzZ4G7hNQd1R97HvTyJhMEEvECf1ZPaeyOK57fav2KN0CSGKGsffA?=
 =?us-ascii?Q?TZVznoba08GWdmW06FCPVDQam8Iru6ah?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:33:11.9363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1fffe2-abe0-4548-2715-08dcdc7386c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9153

Hi Andrew,

> On 24 Sep 2024, at 10:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 24/09/2024 8:14 am, Bertrand Marquis wrote:
>>>>> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
>>>>> index 245a219ff2..aa85ff821c 100644
>>>>> --- a/docs/fusa/reqs/intro.rst
>>>>> +++ b/docs/fusa/reqs/intro.rst
>>>>> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
>>>>> OpenFastTrace parses through the requirements and generates a traceab=
ility
>>>>> report.
>>>>>=20
>>>>> +Assumption of Use
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +
>>>>> +To fulfill one or more design requirements, there may be underlying =
assumptions
>>>>> +on one or more components that Xen interacts with directly or indire=
ctly. For
>>>>> +eg, there may be assumptions on the underlying platform (hardware + =
firmware +
>>>>> +bootloader) to set certain registers, etc. The important thing here =
is that
>>>>> +anyone who validates these requirements, need to consider the assump=
tion on the
>>>>> +other components.
>>> I think there is a typo.
>>>> I would simplify a bit:
>>>> Xen is making several assumptions on the status of the platform or on =
some
>>>> functions being present and functional.
>>> s/functional/functionality.
>> no that sounds weird, functional is right in the sentence i think.
>=20
> "functional" is correct grammar here.  "functionality" would not be.
>=20
> However, "functions being present and functional" less than ideal.  I'd
> suggest "present and working", "present and operational" instead, or to
> rework the first "functions" into something else.

"Present and operational" sounds good to me as they might be working
but be deactivated by firmware for example.

Cheers
Bertrand

>=20
> ~Andrew


