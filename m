Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C616D2F8F91
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 23:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69119.123803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0tbZ-0005PP-GX; Sat, 16 Jan 2021 21:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69119.123803; Sat, 16 Jan 2021 21:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0tbZ-0005P2-BS; Sat, 16 Jan 2021 21:59:33 +0000
Received: by outflank-mailman (input) for mailman id 69119;
 Sat, 16 Jan 2021 21:59:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MaLu=GT=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1l0tbX-0005Ou-4b
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 21:59:31 +0000
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (unknown
 [40.107.11.92]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8a7cd41-7964-4710-8d71-180d81825e68;
 Sat, 16 Jan 2021 21:59:29 +0000 (UTC)
Received: from LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:185::13)
 by LO3P265MB2411.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Sat, 16 Jan
 2021 21:59:27 +0000
Received: from LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM
 ([fe80::195d:9a0e:6fbf:14aa]) by LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM
 ([fe80::195d:9a0e:6fbf:14aa%6]) with mapi id 15.20.3763.014; Sat, 16 Jan 2021
 21:59:27 +0000
Received: from broadband.bt.com (2a00:23c6:751d:7701:1f1a:39af:4235:7681) by
 LO2P265CA0317.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Sat, 16 Jan 2021 21:59:26 +0000
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
X-Inumbo-ID: f8a7cd41-7964-4710-8d71-180d81825e68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ypj1kqSe9wEhc6O6dlYXUDOJIogYSyWJKHrKOLYgX/06ZmH1qO3UXCVE3anYaiYrwLAX7kgnVO8UYFOWQTk+uAeCwa0mfLcR1X9cCwi31z8ARn1EEjbxcUOOpGq3+A4AZRe1h206jNDRJjucOkFEuCoV3WD7otowpl75ESULrJK1Fic8euwo3IpPRMajF8ByRQZdazeDav/I7tmgbJa0LRa+1XIpjyRaBX4occA02No43G/8QehphKEiUj4vIVITEHqZMRsaY264ZH0NWt7QkfPy+j8UNgtGDkMCnzfRmHg6GTT1tPZ+FDyFKerPkTVwek64iv0jvimAvP256LSgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXmx+vJDWoejd4D0AnVart4vV2HBXTLFmxxFL43MCUI=;
 b=VG8pKyzrr7D7tNj0HGMwDNo7d6PCbIAGNkz/oS1jMLbUtFTJvg5586sIyo4CkzVadHp9g7eGnkU7Cj4Od7xYZTnATVasLuTgkJPZtq0pVUzDIYUJ7DP3c3nXpc0y6Q7qnvWnhzz2zZ+y2rvY+hW9IWFYrzk7rbB8xjQfgeWpfl/FRMaUsuAt3A3McLnVrly4TkCoeVyGn1gaEH5lxWDsjtMLAulJbyCTK7Sb4zlxd/BsEA9zZawMuyWY2qV2UCwir1xgvD6eQ1wjxICiNCRX3hJhrRg5T69Iz61GS2c4FgzNIqO+WZkXcAlugCthKeVBIVLKjGLS/cDVUADhXdo8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXmx+vJDWoejd4D0AnVart4vV2HBXTLFmxxFL43MCUI=;
 b=qg9DUqqAkjT2ZSFqaauU0rkbvoGMc5rQWS0qF3Mas1q3LBqvGJi4S7PXvUYZsLj33HeiA/LQFfilCyzxOozRWrX9kgwIbseJpxteglxEY0/7Q+F2oeMAlGBRVun/r2NyxFNbyIcG+KItMNhK1ooTIC7iybA5LhvoGxCuf+eHHd0=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=durham.ac.uk;
Date: Sat, 16 Jan 2021 21:59:23 +0000 (GMT)
From: Michael Young <m.a.young@durham.ac.uk>
To: Jan Beulich <jbeulich@suse.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: zstd compressed kernels
In-Reply-To: <e500ee3a-01fb-ac1b-5ea2-47fd0f2a67db@suse.com>
Message-ID: <ebca949a-719c-ad5a-37a1-d340f37b59d8@austen3.home>
References: <1abcd9d-428f-93d-b63d-996ef4592723@austen3.home> <71d36766-1258-0a79-02ff-d888a41e431e@citrix.com> <6edb6c99-4289-b991-c767-333e376ce66@austen3.home> <e500ee3a-01fb-ac1b-5ea2-47fd0f2a67db@suse.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Originating-IP: [2a00:23c6:751d:7701:1f1a:39af:4235:7681]
X-ClientProxiedBy: LO2P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::17) To LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:185::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b1e0b21-88e5-44a8-1eff-08d8ba69fdc6
X-MS-TrafficTypeDiagnostic: LO3P265MB2411:
X-Microsoft-Antispam-PRVS:
	<LO3P265MB241132BEE9D182FD9A763D8787A60@LO3P265MB2411.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ua3Myc9VU/qmplE0Zik1M5YpYT6T10zKV/Xok/wM/ryiRDNAen6bcOSWAoehVeRHeXDkRHGxIBOB7ko7JNIvT/7UyH9MTaiaBqChHjpAkErMPGDlcq0/wKOeuMmBobYAOOIiQwIYFJF1JPdMlOreEgPjtCr40LfzIbQof+p6jcNl/fGjIxweuZnaC2Me3jcSjwyJ+ObThntg5jIPIg/qx1DgHv9/6niGGp/a2VRbAo0M8ysL63x18Rst9LXPqniAgu/YBXt2KYfi8B/+5VZg62oOBS6Hrd21580x8PnNBNcihdzJPwCQ8uOlc9Y2Z6C7L8Km429fFK+qNWAHJW0XweJd7UIaN/rxm6uP1aJhsuxmhvFTIdQsl4IgRZKYzTejGs1HhZytWzk5n2r20m4jig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(86362001)(6506007)(6666004)(6486002)(316002)(786003)(8936002)(31686004)(9686003)(6512007)(52116002)(8676002)(3480700007)(4744005)(7116003)(478600001)(4326008)(186003)(16526019)(6916009)(5660300002)(31696002)(2906002)(66946007)(66476007)(66556008)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?GI2vIBvaxkNMeIBAOLaelOj0uY/YJyy8LZdr6JAlqJKcPkZRaIqFA/Gv6WOi?=
 =?us-ascii?Q?VjmuZ6xbgcgXekCbPYpiQTN2JWXF9ANe0XsNjSCAnlZyb+oM85+68UsvPjjh?=
 =?us-ascii?Q?JQwaFKaWb3SsE98+qIn4baE6cLgNfuB732K+wjc8GV3i11MWTAm8CwQqSgp3?=
 =?us-ascii?Q?EQ11Bb7NRom+2qlyFhvxKFgWD2KZ9NzTDbBKZxMeN3MSXCiq2ics/CXHR22A?=
 =?us-ascii?Q?8dWMrjYZpF18pEZ1KMGRo9CK6WaxHEAITKYihkJ3FA0jFOhyds5QMJweCVAm?=
 =?us-ascii?Q?ru40eH7Rt5yuVeciUtTTEOo37Q7EJ3RNxdaiCifz7851eBLP1kB5RLOjOuDy?=
 =?us-ascii?Q?hpMoU7+4Kse5mjqNOlbCySVEfzUA7YHBtdK4FjMpKUap89824BYkCnYIA8ce?=
 =?us-ascii?Q?M/OKqtclF5FgNis2FjzoU0tlxEM8hujyU5TisZR9DZaCQkrZQNhD+yImIVdP?=
 =?us-ascii?Q?6d+TZHDRetLIPCFWOCED7Hg1g8T0pqR6w/Vr9xXGGb1ZIs9K7HfeL2FvMKBr?=
 =?us-ascii?Q?MaWJ37ZUeWFFKyCiaYOaQXZRnUaBQT4r98xc2EzCvYG3mb5UTTjl8rSNAykX?=
 =?us-ascii?Q?Bn+RYOcUNbcsyD0dRftpichqO062boeS+VMyv5Li889syPzJYi1vM+p3ZIfp?=
 =?us-ascii?Q?foCp+xhdVmqLGmQyiZQB+E2JYTpq+gHYLxr1oSGaL8Bws/cnCqB2jD/wvAVQ?=
 =?us-ascii?Q?ZCv3cBdeIc1q1zxYveJLrql4azz4uCshYu7uFPm3olDBpFeDXFOTF1+o55IV?=
 =?us-ascii?Q?I4ORo6vC0RT3qBsVzmlLx85Wgd77/rk/Eac2X+GflNp5BKUu/pavItEX6SUE?=
 =?us-ascii?Q?jpBAbotdYBbPCV2KrfoYzCyWN3/NEgXRCOWW3IBUiYi+YG0APLm4Ky492FmW?=
 =?us-ascii?Q?8Cyaln5gdnCalBwZvmQukH3gjvj3dMhv4Y/lBfNtF1WWVkzrDoSGTer4FeCN?=
 =?us-ascii?Q?GmVH5We5hcP7WTMvSe/kf2Is4DiRTlYHVjidH+gS2JErSUHTR4YmI6TPua0B?=
 =?us-ascii?Q?5mgnm0ydJNmMwwDYCY0suBDlpaYUsoBsutO2/zXzC5fdMN66M1amK3LMu9If?=
 =?us-ascii?Q?GYhIpnCfWQAs6sfLV9ZJP4b689MrM+L/yBPaTUB/D9zjXch5DPRXeOYZwiwo?=
 =?us-ascii?Q?8/xpjNi/vQWn?=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1e0b21-88e5-44a8-1eff-08d8ba69fdc6
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:59:26.9208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaKDrAzhofJd0qf1bmrO1+X/LhG8Y0DBTe4NwanWudnChej9JND7dPjgS7LXBBpPYv4T6gqCql7AD46aTgYxqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2411

On Fri, 15 Jan 2021, Jan Beulich wrote:

> As you will have seen, I've posted a series apparently doing this a
> little differently, in particular without said LONG_MAX -> INT_MAX
> transformation. While it works fine this way for me, it would be
> nice if you could double check it also does for you.

Yes, it works for me after some minor adjustments as I am still on 4.14.

I did spot a spelling error in the comment at the top of 
xen/include/xen/unaligned.h which has 'witout' which should presumably be 
'without'.

 	Michael Young

