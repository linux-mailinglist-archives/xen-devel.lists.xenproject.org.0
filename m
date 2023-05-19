Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059EB709241
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536787.835482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvtO-0003nC-BH; Fri, 19 May 2023 08:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536787.835482; Fri, 19 May 2023 08:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvtO-0003jp-7Z; Fri, 19 May 2023 08:55:18 +0000
Received: by outflank-mailman (input) for mailman id 536787;
 Fri, 19 May 2023 08:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kTyP=BI=citrix.com=prvs=49624ea57=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzvtM-0003dr-N5
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:55:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd8bf4b8-f622-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 10:55:14 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2023 04:55:11 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6804.namprd03.prod.outlook.com (2603:10b6:510:11b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Fri, 19 May
 2023 08:55:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 08:55:08 +0000
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
X-Inumbo-ID: dd8bf4b8-f622-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684486514;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=aFHWZCpozCx9cXUTBKdiNUYWOvGEG+rsbkG6J+0ya2M=;
  b=QqsR7t1ilD+GFQ05hcvy17RQkF+shU8QvIh5EMUBrDaTihMSpHGVrZPJ
   eKn/W3wXRcjHtHlqrZMPFZUmu/h7qtxQjqsP2GlvUgOvvBZkQpJLL35gr
   lgXHhV1S3Wz8AXY6pZemrj/TjH7eDO6CsUisF6ZaBrQa2rFKd2FifegUX
   0=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 110029355
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GoZCwKuZGqRwqdI/S80uUXAkM+fnVLpfMUV32f8akzHdYApBsoF/q
 tZmKWqDPq3eZGv0L4pwO4u080NVvZHdyIU1TgdorXgwEnwQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKHxiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwDjIBUAmcpLmK2ezgELhDq9QYHtXBFdZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xaLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiANpIReblq5aGhnWv1GNJCl4nBGfqmuCWmkDhCtlVM
 Vcbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiIQ6lBfGVNtgOK+zkNzuGDv0z
 iyKrS4xnLEah4gA0KDT1UDKhTOl4ILAQQ886gzUWX+N5wZ1IoWiYuSVBUPz6P9BKMOcUQOHt
 X1dwcyGtrhSVdeKiTCHR/gLEPex/fGZPTbAgFlpWZ486zCq/H3ldodViN1jGHpU3g8/UWeBS
 CfuVcl5vfe/4FPCgXdLXr+M
IronPort-HdrOrdr: A9a23:f8TcjaAZtcDkJG3lHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: =?us-ascii?q?9a23=3AiVeeHGk09Qf0LQcW3wv/KbJitGzXOVvfwEnJPGz?=
 =?us-ascii?q?jNX83E+fEZnKAw5F4ueM7zg=3D=3D?=
X-Talos-MUID: 9a23:ZRueAggKyvZne5QmA9NgesMpCNVnuabtORExwK4flNmKan17MS2Gg2Hi
X-IronPort-AV: E=Sophos;i="6.00,176,1681185600"; 
   d="scan'208";a="110029355"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG+dnqewUEZqYTTtkXl7IzyQLjL2twTudOd0o4KRsPn+ZR2RN8R4MOPne6HZnx1Ux5JRvyLxx66rhjJTh2+utSJwkpd9Z7K4j1JQ87+UwUApjthFbZtAPNlNfje2z5DX+pcmrojAxA2m6x78jJeWwpgMyr/jtOmOKH6YG36SWis+oRjVIwBto2muEz4aL3Fey6V5Nc1ojkwn4LR4jqLWCtt4EY1jzf1kF6/mriSyapzZvojFpXiDVaBdh6MHhPM8+3uZRSNHgsDlKNpgYEi3/piwIudtTQBCQMlIiI2295KcWBTckngAwudktOFcDaSbiD4w3yOxY6/kG7IRksIf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkaIWG97UiepBuE5L4ND/Gu5vs12Grc760SxaRnzto0=;
 b=Thos1XbuCJVwRXN4oz3pzL+8oOIm/STYAcPLtWiOu1FK9AqzhO9dC5YzOoGlG74xQAxDENrGQ2Q5+K6AIfKAoJ0G9FYf3CCIeaGt0mO5UtHzoAzKDFilWNAw6TkWrJVI+Rw8r4HWvdgctmJ+OkGs2mBzZk5h9R4ZlCtFwOR+QQ2/R66go+H1kYcMrBUIhSaDYaAsXotwA/AeP/6qpcJDtW1927vw8MbYPULOx6ay7LjjmUVYRcTzrjaLlDhL/NSb8/kILkiv/YL5bwiFj0fkPj/eK8OofeHY47OlRzJXalnluSVgtYQJTWZevLKQyr+nschFSm/p4vObKQbz8tOLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkaIWG97UiepBuE5L4ND/Gu5vs12Grc760SxaRnzto0=;
 b=q33styVAfsqxj19/zWYSHPcKAGCDj/xYBD0MZBwiak+qm5v4eeDd3mgVm2yHdWO+Rb+72xa6KaqqeYH6HLJfNNLL7s33+BNiByrexZeyAP6NEdAiNQqEkAQaY0NspRG32Q21PRpI9S3NxvsKHHUZKReytn5rr/xxjPhCFTB+Jj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 19 May 2023 10:55:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
Message-ID: <ZGc5ZfebSL21W5sY@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <b411f7aa-7fd2-7b1c-1bcd-35b989f528b6@suse.com>
 <ZGcnh/DZvFAIBR/n@Air-de-Roger>
 <7a00019e-da64-ad0c-d107-d002cf6bce85@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a00019e-da64-ad0c-d107-d002cf6bce85@suse.com>
X-ClientProxiedBy: LO6P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd9a82b-810e-4180-6a78-08db5846bf1e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSR2N2l7IyEpIPoqRXQVJ+oKPaSUbAURJoH20DFCc6zoAk3WxMP7IcHcRaxGF0A6NzFWQJTRtjDg2rR8q2A+axYpqsrfFu7bwvFrTlx09a3epkw/LCtqYEWB61ibo2bA7r3r6rBtChqnAxOW/+agqJnOwrsKhyrSZ34nDosB8knYBohRlRpFMbgQoFeIUoVvIrGicqkV5rfego55wSeNld7T71SnabAF2nyrPM0yH9sbu6UTU+kqVWdYkcxR3UkNGKe1OqJ6zteJTHIDwL8jGJS4lSiLhrwa16X3uyLR+ioXTTJDZDqBrWQJprkOrjglIczbElbxYbfG9sEs4MOqxmpuAE9ApycWNZ9NWNu+5XGghwEi77NDEtmcYwk48nrPRWXgwNkpwfoNtfBIw6tJAWvA6mxpM7mN2J7tH+el/YLcfK2F28PZqM+iLtsOHbUexO1IUWp7kNMEitMkuHHuXvTwWPA11nysZons2MaqP+/AlUS1rYquPaZmiwMMee3gojySCjY8oGHFfbmdLmN1JTTEcyyVeU3jbNSe4pdepeY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(83380400001)(4326008)(41300700001)(186003)(2906002)(6666004)(6486002)(66476007)(966005)(66946007)(478600001)(66556008)(26005)(53546011)(5660300002)(6512007)(9686003)(8936002)(316002)(6506007)(8676002)(6916009)(82960400001)(33716001)(85182001)(38100700002)(86362001)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3k0bHpvTmh3bUlrNXdmRzZ5czQ2b0FDc1JZYUFzN2Y2TDE3YytnaVA3dU9P?=
 =?utf-8?B?a1BDdnJab0NsTDlUTEgrNm1sNk84NVhMNlZoZytrM1J4SzZaZExXSE91UWhL?=
 =?utf-8?B?Zy8zQWN4S0hDU2dsSERSR1dzREx6R25DQ21Mdytvc0JZL24wR1RpeEFDWEZO?=
 =?utf-8?B?bVU4RjJoVmZYcGFwTllJV2J6YUVtanZIb1V0VDRoaFJFd0xkT3pnZW9hLzhq?=
 =?utf-8?B?QWtnUFdlSkVxcUlFcjJ5YkVFYzlsMXI1UlAwWkdiVm5XSGN1djM1dzNYL01H?=
 =?utf-8?B?aFlSTU10UllCNWVuNHhkSStUaUYzMWlLOWdWcDJJNTY1amZjZ1lJc3Nmekhp?=
 =?utf-8?B?dlozejQ4b1NtK0h1bVQ5dGtOc09VOGRtbElHUmtPZ2xKVFdLQjh4MDJ5WjJB?=
 =?utf-8?B?M05kTUVMU2s0Z2UvYkdCSU9uQ0xDMzZRN0ZtYUFkRlFua2RHcTlQQmN3aDNP?=
 =?utf-8?B?cTVhOWdrMSs3ellqU1d4NUlnR0hjT2MvSlJtWm1vdXFOVHhoL3g0clgxcEFR?=
 =?utf-8?B?UTQrNTFwazJ4QWNpTVpiTndZTkptNkFqUFV6SHZxUEZSbkZlZllFYk1HdkMv?=
 =?utf-8?B?cE10LzVCWm1pUUJobVBWeGNSZS9NUUVqVmFDSVdSSkNycVIwZGEzS1p2OHRv?=
 =?utf-8?B?ZG5MTzJaa3oyOWFlSCtESGsxemdTaTI2QjVzTnlPVFY2bVFOekRhc2oxalkz?=
 =?utf-8?B?aU1rMFRmU3Y3Y0F6QjJvUnd1SXBGeGtaUlpkV1N6MWhxZHM1MHpSZTJNczJF?=
 =?utf-8?B?dHVKamFaV0p2SmFwbFNCTm44VWMvRGlyeDF5VHl3bGZ3ek93OXg3bkRtOEx4?=
 =?utf-8?B?Q1VGeTJKWlYzODZzbUJVdm5NMVk0RTNwL0xCTnE0YUxrQ2tnR3BoUUYrU083?=
 =?utf-8?B?RnVhbXJjUFNGYk5tdFgwU3BwSHZ1RHdkZVdBenFqaTIzY3FWd2JnZ3JkbE0w?=
 =?utf-8?B?ZWNZaTZsVTZiNHpxc3U3Q3Y3TTlkNHJ4U2h4N1dSVDRMMXAydFQ0cURCekRD?=
 =?utf-8?B?YUU0S2FWdlFIU1kvcUhvZ0QvTHdGYVkrMm04MHV2M3plUDZ5S1E2bkQ3ektQ?=
 =?utf-8?B?WjJUZ25DZUViM1J0bmxVUlE4TjBXQ25QZktVNktBSlAyK2syQjBxa1J5UzFI?=
 =?utf-8?B?bzlVeW14Z0NHYlZITjhrNkxsUFpKV3JJbEs4OHRDb2laZHRwMXRlRFgyaTZB?=
 =?utf-8?B?RU9LS1d1ZnpmS1hJQXY0NldvdGIwVFRCQmRxOWN4alo5WnlVRmg0MkFKU0Er?=
 =?utf-8?B?L0xXNVBUTEM4d1BGV0pNeFM0cGVGcmpQOG5LQ21pQW16N1owcVQ4eEJNbVRS?=
 =?utf-8?B?NVRHSHc2djNqZ0VFMm9ROGdTWUFuRkEvc2svVXFpZWtxSndCUHNDaDVmeGlp?=
 =?utf-8?B?R1lneldLcS9lZnlqS2lmaXNENEVwZStWMTRLaDFDNitnbWhXcGdCWTJPRUhX?=
 =?utf-8?B?YWlzYXVOb2dHdHl5Vk1SaUhveE0zUUUyMXBWTlQwNTN0UjE0R1IvUHdrVFhV?=
 =?utf-8?B?d2IwdS9kVEdqWkxWUHcvV3RBVVIvcmZmc1lNS3hjdnI1WVh1QnJVckZrMWR0?=
 =?utf-8?B?Yyt6L3JlS0hncUlWUDhjN1Z3Q1FLdjZrSk5Xdk5XWjBaTlczd1MwTWtkemJv?=
 =?utf-8?B?cGZMTWM3ZGVyWjFJQTlzSEpYV2lGdldqMmJKZk9mUW1EbFk4ZVdyc0lxLzBq?=
 =?utf-8?B?VlFjd3ZwaWl1US95S05CVFVhWFBudEpTYU0zYjArcVlhaFpDV1hVRUwxZWZk?=
 =?utf-8?B?SWg4YW1OK01nWkhMS0lVeEVyczdMZGJ5TFVCaWhwMlpVQ1hKOUJSNTJ6QnM4?=
 =?utf-8?B?ZTZmdWdRVkxodEt2d2dpT3ovODRwbTVwNE1udmROV1NxMzFweGxldzlGNmtO?=
 =?utf-8?B?ekNCN20zSEJEODBrYkd5ckxUM2FETnBpWDNFU3p3aWVuMVJ6YXRQOUtVOFcy?=
 =?utf-8?B?L21waCtsZTgzREJUR1E5VjFtSE1JdUhsMkJQdW9aWmV1djE2R05tTmV0d0hU?=
 =?utf-8?B?VjRabnJ1TWFlL2g3bUJsMG5lRE1vcXM4RS9OYnFGdVUxYUU1WHBpVHRKR25m?=
 =?utf-8?B?UUdlUUJQemFxVEVEbjFzYWtuZFQ4WmRBRWxmdmw5UmlxOWNiVUZiTnllbGlI?=
 =?utf-8?B?MFNvYXp6cnNVdmloZWhlVDFsdjdGdDVwSVdUNFdFR09qM0lRalMyLy84aVBL?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dmssNBAPj23Tw0bin3qPMBE8Yiu/KzfRnl5tnJgnOztZOhhTelSkburvAgl0vFpUSzGVBfhkr+lwvC9cmb09WBjPMF92IzqGvv0+glAQIyi1vtQaM8nPB1hVvg/2kViLM46E/EbmoESPVHi83M7iKpeSZM74lQOVDs1ecHJUMB9DGqWPftWu2yco6vpYUbNzs8J+AD4/1tq4lwJ4IH+LG3OYFSzgmHxViGnaquUqKQhpNc55xV/j7yNVQHNAntEeQ9mPgjgAn0QK4aHmdgFagcVMCauTiHKS+EnG/8g5q1qe4G845bZahgCN62dhh9YCVCX2FhR8sptZpw2H70U5IJIRBwiJzCOsf+UdCuTsQnG1vOVaT0yfgZUOmoLDMBjq4aHPXDvb7fubP+CrwJbwz7zv66t7rgODXLU+CBB44tWlkhkQgYevepYbkX5/eDk8nlhSc6TvhmsOM+dtnDJPG+xjbqTcLXp2nzWt4QUyNrkA7+S6xMbY4Cl70nwQSkDnRMmZt9459Ih5OWFXeaQbMX5z71yMVBswLXaV2wZ1Yev6HLOWwRMgjUngV+Wfbez6e5UqqA6VU6A+kApqAStdnrvVXtVCWZcK5LvWFUFb2ySkg5LAWoRRquEFnvXQIkjzXu0PZMQMwPGeim6YKvnJRoI6GTdYbFFZYRUQU85Ksp+Lg7Xu7xmkKNqRwBTbUQ2TG6iHnm9B2X+WRQYcyfzQuU6GyDrfRLXb5D1Pl4UPjYgwiy+w0zvXU1O21boZ3sWLokE2FVnIYYR4hWQGdo57MOz4WnnisaZYZLD01qCy0N+cSgpXogqIWJqf+P4RyJm8hnlQpzKazoHTHCtCQMnIdT6+n9oI+I9T28MPi50xtDURWVp4osdhwc5109JQUZNUlgQTZEvBREYe9BmvB66QoUUTgPA647sOH1KC5Y8nkD8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd9a82b-810e-4180-6a78-08db5846bf1e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:55:08.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjoxGTU1fS5ZAePudIEstY2fZG2an0dKzHXrKzL52hlFUhxnL6nY7bi17+pI96YtZH0aJcfqiFdTgZP6/3RqWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6804

On Fri, May 19, 2023 at 10:20:24AM +0200, Jan Beulich wrote:
> On 19.05.2023 09:38, Roger Pau Monné wrote:
> > On Fri, May 19, 2023 at 09:22:58AM +0200, Jan Beulich wrote:
> >> On 18.05.2023 12:34, Roger Pau Monné wrote:
> >>> On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
> >>>> I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
> >>>> test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
> >>>> Zen3 system and we already have a few successful tests with it, see
> >>>> automation/gitlab-ci/test.yaml.
> >>>>
> >>>> We managed to narrow down the issue to a console problem. We are
> >>>> currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
> >>>> options, it works with PV Dom0 and it is using a PCI UART card.
> >>>>
> >>>> In the case of Dom0 PVH:
> >>>> - it works without console=com1
> >>>> - it works with console=com1 and with the patch appended below
> >>>> - it doesn't work otherwise and crashes with this error:
> >>>> https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> >>>
> >>> Jan also noticed this, and we have a ticket for it in gitlab:
> >>>
> >>> https://gitlab.com/xen-project/xen/-/issues/85
> >>>
> >>>> What is the right way to fix it?
> >>>
> >>> I think the right fix is to simply avoid hidden devices from being
> >>> handled by vPCI, in any case such devices won't work propewrly with
> >>> vPCI because they are in use by Xen, and so any cached information by
> >>> vPCI is likely to become stable as Xen can modify the device without
> >>> vPCI noticing.
> >>>
> >>> I think the chunk below should help.  It's not clear to me however how
> >>> hidden devices should be handled, is the intention to completely hide
> >>> such devices from dom0?
> >>
> >> No, Dom0 should still be able to see them in a (mostly) r/o fashion.
> >> Hence my earlier RFC patch making vPCI actually deal with them.
> > 
> > What's the difference between a hidden device and one that's marked RO
> > then?
> 
> pci_hide_device() simply makes the device unavailable for assignment
> (by having it owned by DomXEN). pci_ro_device() additionally adds the
> device to the segment's ro_map, thus protecting its config space from
> Dom0 writes.

But above you mention that hidden devices should be visible to dom0
"in a (mostly) r/o fashion.".

I understand that for RO devices the whole config space of the device
is RO, in which case we should simply avoid using vPCI for them.  We
however likely want to have the BARs of such devices permanently
mapped into the dom0 physmap (if memory decoding is enabled).

But for hidden devices it's not clear to me what needs to be RO, do we
also need to protect the config space from dom0 accesses?

It might be complicated for vPCI to deal with devices that have MSI-X
interrupts in use by Xen for example.  So I would suggest that at
leeat for the time being we don't handle hidden devices with vPCI.

We might want to do similar to RO devices and prevent write access to
the config space for those also.

> And just to clarify - a PCI dev containing a UART isn't "hidden" in the
> above sense, but "r/o" (by virtue of calling pci_ro_device() on it).
> But the issue reported long ago (and now re-discovered by Stefano) is
> common to "r/o" and "hidden" devices (it's the "hidden" aspect that
> counts here, which is common for both).

Indeed, the issue is with any device assigned to dom_xen (or not
assigned to the hardware domain, but accessible by the hardware domain
from vPCI).

