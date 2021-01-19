Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3B2FC47A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 00:11:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71141.127218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2090-0007Y2-4W; Tue, 19 Jan 2021 23:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71141.127218; Tue, 19 Jan 2021 23:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2090-0007Xf-0q; Tue, 19 Jan 2021 23:10:38 +0000
Received: by outflank-mailman (input) for mailman id 71141;
 Tue, 19 Jan 2021 23:10:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3N0=GW=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1l208x-0007XY-HG
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 23:10:35 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (unknown
 [40.107.10.98]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49b50001-e2c3-48a2-b2d9-defe57fac07c;
 Tue, 19 Jan 2021 23:10:33 +0000 (UTC)
Received: from LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:185::13)
 by LO0P265MB2602.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:14a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 23:10:31 +0000
Received: from LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM
 ([fe80::195d:9a0e:6fbf:14aa]) by LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM
 ([fe80::195d:9a0e:6fbf:14aa%6]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 23:10:31 +0000
Received: from broadband.bt.com (2a00:23c6:751d:7701:1f1a:39af:4235:7681) by
 LO4P123CA0492.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1ab::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Tue, 19 Jan 2021 23:10:30 +0000
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
X-Inumbo-ID: 49b50001-e2c3-48a2-b2d9-defe57fac07c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWWpHg94RkUBQ0+j/BHmY9jLrDxnhOFPmLxMo06QczI19+gtpxkWBfAJQX7yzf9nQ/KwW2EfKhXQWs0eLfU+ATbwkoz8099zYreeP3oNtc83ucIwgDR+T2ETZkFgQWaJkbk0FNRj6omQOGq56yefDDlsbHzHZLaufWyLAkFwD3pZCse5WvdEKzYhjJsBLwITWDBqpJ4xjPtTFUezh+Ix9glmLVDi4JqFVYW6BK5oh+jepUcDG+jRBp0bjsLnO6QAJiRFydvDOTP+La2SPgI0PFfwgfJm9k2jKmjMS1WHQqjC/SfjOJc1M/d4PP79j4Wb3NEOjnGmjz4PlfhtojCGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymT8ofpO3mvwrL/7CWmmf2OEo8LJl5QyvmYiag3EOyQ=;
 b=JNQwY8hat+k1nU2dKHpPAodEdWVhcJx8vWvxYYaC4YAp9kVvcKWXVuWa8rmKLwUHq2RsHi7eK/psGfqtUazUThSyHYBgt7YUrJL/EIi+iALfiEcYd9jJi38lOl0eLgOclAriTvevBL5dNTWtx8p5qKAgl5j8YejKouOfzyXb2f517Z1smumodcUnwgBf0NGn3JhFAmIl0PXPA2V7QqGvYw2fpjNFPAToIapFoJmey6OTnVrUfywcX4qpj4JrkuPjCxKEqJLuCXQwJC2sFeDhB0EvW5pde1A9jtiXnD3CAz4utGylXIpSLm5GxhvQOMAYWKGbAJtq9ZU6HZlKOInPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymT8ofpO3mvwrL/7CWmmf2OEo8LJl5QyvmYiag3EOyQ=;
 b=gO4sztiHuF6jam1IuX2y0TVupR1sx85CPQf63HzORblMzcBIneKO1Wb9BD3QBqh6rwshUr2fWlK/L3X2qTaBErK6eReMjOs1fRHimTiUTHF8z+9g2H2F5fjZobbShk3OXneZEZkOTieWrPkHBZQ0s+rh+rt7XQIUeV0C0q38PHA=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=durham.ac.uk;
Date: Tue, 19 Jan 2021 23:10:28 +0000 (GMT)
From: Michael Young <m.a.young@durham.ac.uk>
To: Jan Beulich <jbeulich@suse.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: zstd compressed kernels
In-Reply-To: <ebca949a-719c-ad5a-37a1-d340f37b59d8@austen3.home>
Message-ID: <52fba28b-9652-e4c1-88e1-e35e2645c72e@austen3.home>
References: <1abcd9d-428f-93d-b63d-996ef4592723@austen3.home> <71d36766-1258-0a79-02ff-d888a41e431e@citrix.com> <6edb6c99-4289-b991-c767-333e376ce66@austen3.home> <e500ee3a-01fb-ac1b-5ea2-47fd0f2a67db@suse.com>
 <ebca949a-719c-ad5a-37a1-d340f37b59d8@austen3.home>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Originating-IP: [2a00:23c6:751d:7701:1f1a:39af:4235:7681]
X-ClientProxiedBy: LO4P123CA0492.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::11) To LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:185::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b57fa4f0-dba6-4e69-902c-08d8bccf6ad1
X-MS-TrafficTypeDiagnostic: LO0P265MB2602:
X-Microsoft-Antispam-PRVS:
	<LO0P265MB2602BC0F1B81B6C1EFCE951C87A30@LO0P265MB2602.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	flu5+hUStVtkhtrmiMRvIpj5ENkl9c+PxmBjN0uBvlHdwPpqROp5tpCVd9IibbR+UXPWhBuEVM7mOgP+YD0bZAHzb0PhhqmAhZZAArINSt8tM+CGlGR+gPDs/ai3wA+Z2TFrKSndnyrdjbH7cM4+i/70/ZJa3qHcQOeoyS0xC6K6QeUc9Z4pBFR9n54JYigp+RBZ5YNG9JB5cRRLqwLB6nHD/7yMf6WWAJosN5hEOVFJRxRlPg/PjD2oP116EmEIcvI/IPo91LXYheG9M8Ka8HOMie6DbZznFQV52cU1AxZtjMns7Z0PySx85EQXG45jH6w44fjpi1N5KauzRC3tZ3fLI4MrHKVJ43P2cj6QhmaQZ8j4sUxsfeIRyphYfTw0EIh7UkyCTK0uIPzufgZDYVgxm20d/3yKFs7DyFJEEGK78DnR8AQxNuedSW3GhtC3riR3gVwJ3UY3RTtchPTc8Q+eau0j55uhlRK4ScxWH/Lr+IE+cbHBHmRiEDKkzZnikC53o2hh6dpGFNsoE6Rkwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(9686003)(36756003)(3480700007)(86362001)(31686004)(316002)(66556008)(478600001)(16526019)(5660300002)(186003)(6486002)(8676002)(31696002)(8936002)(66476007)(66946007)(4326008)(786003)(2906002)(4744005)(6512007)(52116002)(6916009)(6506007)(7116003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?xsQjMtrFtza9mHxQ01//LkEh2WvXWRq90TBZUyzelOAiKpD8s8Agactp+AKm?=
 =?us-ascii?Q?TOthdtlK1xo7JqlEVg9JkZqxIlWwDOzb4Wlwb1T4GxHfg2hFfzR7l6yixHSq?=
 =?us-ascii?Q?fHZ34f0aZ7v95HhWPSNqBpY4m6HLiJrMC1rHgBzvZzalWsxjTBN8r/wFR65W?=
 =?us-ascii?Q?a6NCHOJaG8lcdfq3JRaTi/b4A52vaigOQNbwl/XCEGQiTgOqG3weaJ60pyoX?=
 =?us-ascii?Q?ysJTSFoepyzxILhYuxJU2FYPLd9ucpjiYEQqksJrWl7GsgGFijmPhtrlMlOa?=
 =?us-ascii?Q?Z66fotJSxDAzQxbuqBzaAV48MSJgg40FPtJPkp2NFjaLtwfqOzJSFNEDQlOo?=
 =?us-ascii?Q?VLtbPIpU4e+QQp3qD7dN5WA94JPDoSeBatWzLMACmdI/Oh9WHOFP4eIVbehs?=
 =?us-ascii?Q?jh5+/TnTyKz3MK5OeKadmD3Y3qq1TnAJVdv0UwUZubBSTCNVijSVWrBFkGrA?=
 =?us-ascii?Q?oRDxA5Vf+GsKcioed8W6v/gZyEo002Cl4NHmciIqLB0QB4EjNN1+AIA1/bwW?=
 =?us-ascii?Q?yj+qG/ukYQFj0DTMfGXAHguNnmE+yqrgSsMu2kYAqMCDlu2FUghqyvn8e2K3?=
 =?us-ascii?Q?yxUazeUv76T0SLu0Z/7gmp08YDkHJ5u69d3EEwow7HI4V4Fh2qXEnj79sG1J?=
 =?us-ascii?Q?o/37jSOQP6vWRN+oiX5gFnzVshiEBCLVMkbM7w3aretYjineZC0Sld5sfBuk?=
 =?us-ascii?Q?bd9cWeRyj8/pDWXQlT/UH/fM52VYziSQ3ZKL3a1m0Ehz6x5mVKHHY/ko8Rn2?=
 =?us-ascii?Q?eE0k5G8/OETjCWNf37uakE0WDuLrgTlCr8CJet9Yxo5dCMknPr8PRh49oNHJ?=
 =?us-ascii?Q?FlW23/MKe4YM1zk/8KYRRBNrd9JQ3yGUDuKzAEFJ7A59V5lFkRTSKkhuy8p7?=
 =?us-ascii?Q?gVuThl+NUWB6XrtnrczcH7Y+74ws278xJ9qaeJ0NU7tw1uzEBmii6774Mn3V?=
 =?us-ascii?Q?ehA+EqqOtAwcnII9640rlZeSGXFnAs6MX9qvlk42lAbS3it7fIgRgctpU5Yg?=
 =?us-ascii?Q?fFf7b3A/PYJmkePGv7OgIJacXwizsx2XoLaE1wZAC3p9E61oRJnASmLlKIHO?=
 =?us-ascii?Q?IgiXrBC0U2p39pQvW8qWNmlNyZA7yKvLvWoR7oulgSKaCuXSIpW20zjT/E1h?=
 =?us-ascii?Q?MOYd3qxJA1tF?=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: b57fa4f0-dba6-4e69-902c-08d8bccf6ad1
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB2956.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 23:10:31.1048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MIyU73+b9+KMBJrp0HNS3V+bw0fUX2rE4BaVTw8M4C/LyzMh0zEo2+WaCdT4WdFV1IIE0+JyBwfXI/H56WzEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2602

I have been trying the "[PATCH v2 1/5] libxenguest: support zstd 
compressed kernel" patch, and (assuming I haven't broken anything trying 
to migrate it to 4.14) it fails with

onfigure: error: Package requirements (libzstd) were not met:

Package 'libzstd', required by 'virtual:world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables libzstd_CFLAGS
and libzstd_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
configure: error: ./configure failed for tools

I didn't give it any zstd packages so I would expect this test to fail, 
but I would have expected the build to continue and attempt to use the 
zstd code in the xen tree instead.

 	Michael Young


