Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFECC2DF4B3
	for <lists+xen-devel@lfdr.de>; Sun, 20 Dec 2020 10:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57095.99879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqv7l-0004D3-9r; Sun, 20 Dec 2020 09:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57095.99879; Sun, 20 Dec 2020 09:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqv7l-0004Ce-6i; Sun, 20 Dec 2020 09:35:33 +0000
Received: by outflank-mailman (input) for mailman id 57095;
 Sun, 20 Dec 2020 09:35:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lj5K=FY=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1kqv7j-0004CX-M2
 for xen-devel@lists.xenproject.org; Sun, 20 Dec 2020 09:35:31 +0000
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (unknown
 [40.107.11.120]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcb43b0f-f282-4259-b263-3a5a8ce5fc04;
 Sun, 20 Dec 2020 09:35:29 +0000 (UTC)
Received: from LO0P265MB2906.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:180::8)
 by LO2P265MB2623.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:144::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Sun, 20 Dec
 2020 09:35:27 +0000
Received: from LO0P265MB2906.GBRP265.PROD.OUTLOOK.COM
 ([fe80::dd88:994a:a4b4:4d9b]) by LO0P265MB2906.GBRP265.PROD.OUTLOOK.COM
 ([fe80::dd88:994a:a4b4:4d9b%7]) with mapi id 15.20.3676.033; Sun, 20 Dec 2020
 09:35:26 +0000
Received: from broadband.bt.com (2a00:23c6:751d:7701:1f1a:39af:4235:7681) by
 LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:153::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Sun, 20 Dec 2020 09:35:25 +0000
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
X-Inumbo-ID: fcb43b0f-f282-4259-b263-3a5a8ce5fc04
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ON0+kPclfg3ySLoHzjquNq6y4DU/GZr7pOaRM6djeU3DoRvm1zECJTuCSf3f/Ufmv/HVO0xpJ4tmbCs8kA92yDAmmAJzZowbLnofxeLVZYn+iLfKs/dOHQMFV8JiBp9ZJc9QcxtNn5OmrgRVLE5B771GgznrByjHlNfrVXTph2PbajTj7rRfgqys36Dvro8Y9akpaY1dbZKipDEHRk94zwAGzmFc+FHR/VJ25D44sM0hW06xFfWpqzr+3DZLPHXDejnncQo9MLLcczvVlZYp0YuyjbjtyU9RJYeS/oAF5z7+6NIEx7iMIHc7bsUW4A0b32fspiPKuGlIQt6k3k3roQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqVjc4nIVmbGhdVl3Lt+ESrTbsu04q4wHIlaeQojvnQ=;
 b=WdliRdNKlxwK3uxhEK1fHxNVS4oxdEjdUYo0G5xiPp2Ut6uLrHjO8XRiJ9vXWcDniE5avKxl+xS5WNkT5pPKh+Opx9srqcWflJPS3OMrkQvFmThN3pd5AoheQUGJFQRDIO/e4YvmcHBJPKlIN/LWlnqagvUJlZPXVJAYGhfL9tDLzSFN91nxaKLHZSi2cSgZVbjhTl2iTL8aDSyvOqBFGK8byx19qSRMX0CqjQuiaskEdCuttSyZlXibJRaJsmg+SOSX+2/Q98JzzyFiyHxhPN7q4k/8qsI4A2k/uFtwBimV5TapsmM1eJ+b0F84gwnvo2g+0Lp8qY95YBfE29d6Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqVjc4nIVmbGhdVl3Lt+ESrTbsu04q4wHIlaeQojvnQ=;
 b=f01YDdnbaOlL8VqEPUxEkqqOtBDDAN8srD8JMsC0XT/DbjIIPZj9Q1akAMmuy5C+ENq1SOkVyVCCqFsEPnG9s/vN3TeazHaSFVy7OuzrKN41+4Nd6y1OfLn2u7np/cSOpPt1rYeT3rn4ktDkirBZ+nciPS6BOLtR1HV83vlhRpo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=durham.ac.uk;
Date: Sun, 20 Dec 2020 09:35:24 +0000 (GMT)
From: Michael Young <m.a.young@durham.ac.uk>
To: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
cc: xen-devel@lists.xenproject.org
Subject: Re: Xen Release 4.14.0: Couple of "all warnings being treated as
 errors" issues and ongoing docs/man issue in make world
In-Reply-To: <CABwOO=dLaL-BLf+GDo71_Btq1R8L5=XmofSs+oHE+P-qx+M49A@mail.gmail.com>
Message-ID: <cb6233a3-93f7-3b5a-d053-f8cb9f12c4b9@austen3.home>
References: <CABwOO=dLaL-BLf+GDo71_Btq1R8L5=XmofSs+oHE+P-qx+M49A@mail.gmail.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Originating-IP: [2a00:23c6:751d:7701:1f1a:39af:4235:7681]
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To LO0P265MB2906.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:180::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5740a923-c994-4fea-b8c1-08d8a4ca955e
X-MS-TrafficTypeDiagnostic: LO2P265MB2623:
X-Microsoft-Antispam-PRVS:
	<LO2P265MB26231D07E396CF8A199103FE87C10@LO2P265MB2623.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g3Blo0IsGz5oqg9X+JPskSdXi9vJjxmuKat93c8elLsiMOgsc9QC7BRyLTN4BiziFHODyPWaKqgAAN+cxM79Yl6YqUIXLC+aLLbnj4LCreCa3A4vt7r1dUnb4M0MgqiXa9rE8ddkTIvl68FNjuoNZog8b353peKQO1oqdpV1lk+l8GR0QCksCfaJxqR/izRuREZUAzkU3uwX6iuS5ZnM2Ce9D2qVDD4xAyC7VN4wRsM2hdyGi7BHp+pSbwAGkVSONwwVyX0Ybs7+jYa9J+5c90IdJfFki8Z9on3xhsGyXGqROtJ1/1S+w4Vg3Tb5BadgRd4cGMD4vstMP+KZI2yAhdMc11aLhKY9u19PqsIMIXBk2YBKFF10aazoQ4azyuIZ7yE6cyB+aylUmEYQ4/L+Zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P265MB2906.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(4744005)(86362001)(9686003)(5660300002)(8676002)(6512007)(6916009)(52116002)(478600001)(6506007)(66946007)(36756003)(316002)(186003)(786003)(4326008)(6486002)(31696002)(2906002)(66476007)(31686004)(16526019)(8936002)(66556008)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?qAipcINeq+8F9h7XCw+saGhdNAo6h3UkXOCrdGsBv6Dg6VXQEgk864fwFH6Y?=
 =?us-ascii?Q?uRsYrw3crcFJ4iFs3LqAgs6eBM5IIvdXZZQ0q/r3DMsEHd5dM5mAgTotT3Xx?=
 =?us-ascii?Q?RjtfXXsBaZ3G6kVGa18DZzX3SgaiIA06eE449Fn55MMBDJdmvbRZaO39BWsr?=
 =?us-ascii?Q?wKqlM2DlTI0W3TTiyoS6yVNt5te1heeGj5+MpLI+htWe3yJtz1yDHZ0qtfYi?=
 =?us-ascii?Q?ZlPAVI5tjnxcF+jWDctLyu5V5akpOeA16Xf+elqFu9DlzDlOZkeVYnPeEQor?=
 =?us-ascii?Q?N3njzjTH8VcA9Laq6mHHCxQD0Ueejx62yKiqb4MDbikCihiG7T5VGNgQgo5T?=
 =?us-ascii?Q?Jsa6e810dmj4IEmwxqEz/o0vibHa31CaD+7mvicU2v4BtT7ZhLzU6zk0NXxL?=
 =?us-ascii?Q?Aisd4QSusU4FcR2bmY3J2Su/BVt8R6be0DkmlQiZG4P+6zbNAPiz1LdEdu/z?=
 =?us-ascii?Q?hHYbZqyBTCohSFWMvSys4NcYowmT4VmpBhvEA9llS+Tz/xOmYucC7s6davto?=
 =?us-ascii?Q?CfLwBHKMlaabRjBrGIXFDz63w2LQ8dKXPfhDPm5DayNrY1VJ06mOC/dosT97?=
 =?us-ascii?Q?CBhxVKBHOZh9jUZQArZycXFSlFOyEwojWQhR46pFN4OfU2yItsinUk59ylSm?=
 =?us-ascii?Q?PckW1bxTRhNmnjFV2L+WS+miWY+uV4SGS3cLRjCYD184G4O4ltXDah2J+Z4k?=
 =?us-ascii?Q?VPW7oDSGTVdliG1OvtkFwgJeNYxggOrJJ4AmVcpLWA9mgiKmDGieuxucCZhN?=
 =?us-ascii?Q?L+IUowuqJRFQo59gWNFCy6s+46B0eANh8rBjCf3yuBpG3IYp0GcX4FDdnWxz?=
 =?us-ascii?Q?24DsbnAXT2/nqeRBg/qE/c7up0jop39TKmzX3SKLQN9UjcQlCRc8XGULGBl2?=
 =?us-ascii?Q?yv1gg62BQgoLva1HYYJMFYQSWwTZMA0PlvO+cZ9oCVEi7H2y/8s/XHsHmd7y?=
 =?us-ascii?Q?jLaSH9zpaZYAByQZJckLP4RtsLglSxX5Z9x/O4aV5JOtmYxC3yBbH+AKcy6A?=
 =?us-ascii?Q?rQJuHSX3G0OP7/lL7hHy5nvoFWs/gYYqYOvL1cbymuFfT8T48RJ3oLs7bx6z?=
 =?us-ascii?Q?MnuIMrsx?=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB2906.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2020 09:35:26.6270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-Network-Message-Id: 5740a923-c994-4fea-b8c1-08d8a4ca955e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uSrUghxEvFYfqsukVPI0t29vIX3B6EGJ+mYKYwZM4k6zgev4QUcYidSGuHvepJC2zvG63P+k9kLYZW+rD/zXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2623

On Sun, 20 Dec 2020, Kevin Buckley wrote:

> Looking to build 4.14.0 on an LFS 10.0 system, so with GCC 10.2.0.
>
> The "all warnings being treated as errors" I'm sure, will have been
> picked up by now, but the issue with the man pages is something
> I have been seeing for a while now.

They are indeed fixed in xen 4.14.1 which available to download though 
hasn't been announced yet (unless I have missed it).

 	Micahel Young

