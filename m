Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863E73905E4
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 17:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132260.246765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llZLJ-00074X-Ch; Tue, 25 May 2021 15:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132260.246765; Tue, 25 May 2021 15:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llZLJ-00071n-8a; Tue, 25 May 2021 15:51:41 +0000
Received: by outflank-mailman (input) for mailman id 132260;
 Tue, 25 May 2021 15:51:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR7Q=KU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1llZLG-00071h-Si
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 15:51:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34dd1a88-7522-4a93-b6ae-46de993a35da;
 Tue, 25 May 2021 15:51:37 +0000 (UTC)
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
X-Inumbo-ID: 34dd1a88-7522-4a93-b6ae-46de993a35da
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621957897;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8FH28wRZv8jpY/Y4JSeZjHD48eipdGssRW8a5xyHOAU=;
  b=c113jeuxdBPcr6VeePiprJTATA79S++1uh1lnmWUYAAgVpqxJKzuhu/j
   jYrIZl+eDbHH5VDEONJcR+oamp47/9zvxeBUjpE7kxEMnl0p3d6ueByA0
   GNVDCa5gvwWRHPziwgIhGtBaA+zfRxhb8HYhqHot0JzBgaxr/r4eBsfWR
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7um9Kg6f/fopVFv8eHnZbknmVJZz6AhRIbcQY1DuFdFJFGgrfax9MMp1gCst5Pga6BubX/2OQP
 KkcoWnfflfYkBqW1Osj/8LhCEpvwzjrAbDxidI8UDxZPLoXGitVKAzRBc53up5MRFnVrMXjwaQ
 Y2RLIryQlAq/ZWpB3bbwgkGAhjMjSfvNwuSta9jQnVkVVuL4e+DgifACFwvu9E2IWTiFNA1aqn
 E2Vp4puPDomdcdXJ+XV+Pyd9+RzvVY9GCxx4Ws1gt41UK13TYIbTGUhXEoUwmWbKe1BGi2+Rz5
 3GI=
X-SBRS: 5.1
X-MesageID: 44593182
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:oIOHGa9/1t1A57O7AYFSDrUDn36TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WFOUG3Xb63eN2f9eIslb4uxoUgA6JDTn9BjHVdsrns8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+On8j8kvU2xbuKU5NTsY0idfic5Dnd74f5fs7Rh2Ncw3ILkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYatQwYYJZfBobQiUAFaPXpAGYRd9oaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrkPThE4GAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rpwSQKeFP
 ppDAdZpRD7QfBQSEHgoMs0Rksf23WbyKRpEjmvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/nv7KgEXMsSFzjiI+W7qgfXA9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDQtf0UBK5p3qFlgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHjVGOYSvDrPHO92r0YHVFazVbDcMZcecby8P+qoAClSjCd4ZcE7a3oIbLPRjrz
 Qnf+UDSmI4vYd43O7STpA6d2mP2/MaYEGbZ9S2NADv+sV8RiJqNItzwsAaLsZ6sOa7EFgHpg
 ZQSpySJAAni57mjkzaRCMEEAb2k/fqMNDC0bbVHRMJ6rm3FF5JOZ+ltDNBCyKVBaZxsldzBO
 hW7VeZtCHh7ZiXCUEOPS9jtY/nGNIC5fTgfahwxUjapSsIhHDJrAQk3Oh/Kt4wTuBNEfV4D1
 WezLp/3UCdy5VVP5zuqXeYNuYLHNQhkmTu7eHwP9Dz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7fQFScSdjXciowyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:qm847qPuWaKchMBcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.82,328,1613451600"; 
   d="scan'208";a="44593182"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iy84syZp/MXGoMper3HSeKg8W+jfYxUhMNGSdeMQdXVUAsQ0OY/lLfiVQ68TaCd2Q2v0qT1U9xB5/ZBt7WF+xjkTwhL+7fqjjUvXtOS/J9+ITuwzFcADzigaq25iyI+JF8oMmU0/yTPqNBgVaSKa6r769S6PPjhQsLDMCvNWUFRFSUB6w/ixd8HpfDpKxN2smjM+a4//S1tw8Nv8irhjNytMmyW+YBdjgMbLIFWcSM1bUUso3WhlKJ9IRlWdDziQWjpN9I1NEKqeD5PVPkTSTEMd0l8y3rdJSZSSA6iYEYhoH7njZPA3iXihP3r0DcZAj4v1xS0pfxxd13UDyWjtYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2OcsxlyamJzPBy4XfIq8db55t4FiaySEwdt7FUUyOE=;
 b=Hq2PJ7bmhp774Yruho6RdqVPtIb3krfjjCEVvgV3H9x+QSrzSd4b1Ds8yahjjXl52qd4es6MDRJTSJepzAfq4BpfPaTbvS9o59ORQAYOg5rx37LbIKDAndMAOSKedKTVzVE19bkq65SypjotDPUbWR3umgKKT7nOXrPSNTQaHfXxtk0RnHKril/WFtRl564buwlhCYzwjEr1Gq41iNmaSeWPn5xiD2iDQ27CW/MxRCKJ+vOy9kcQO0/TRslQgRUtTwoz+GYNzOQeyRFQSCm0GatpsAzeJ0JY9t4NnvSnWqHtHkRdvlChdVT6c/D5/hEH1gur6xvJC7PLzYsD4ewzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2OcsxlyamJzPBy4XfIq8db55t4FiaySEwdt7FUUyOE=;
 b=jGrRGmQocNYmptCHAivWuFGgPPkoyIRYVMr253IcfWn8QNHLvEswZohfDt3mUDHV5lUGhOuRU3ekDJI7WmGCUZ2NzZ9LJHqI+x3vOV6aabzDAnwLnON7ZBunpzBhn0a5d20l5FPDhtbIR55IjeU1dVyn15q6AEqQX+bbGulvXug=
Date: Tue, 25 May 2021 17:51:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] firmware/shim: UNSUPPORTED=n
Message-ID: <YK0c9oPEYVUlNSU6@Air-de-Roger>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <dbfa9126-6809-64cf-5bd5-01b402616f11@suse.com>
 <YK0MBTWXYJmihvUn@Air-de-Roger>
 <6b74b1de-5ec4-09dc-ba1e-821025402d36@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b74b1de-5ec4-09dc-ba1e-821025402d36@suse.com>
X-ClientProxiedBy: MR2P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e823103-7a3c-4dbb-579f-08d91f94f2fa
X-MS-TrafficTypeDiagnostic: DM6PR03MB4844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4844DA8C1E6C138C2D0785838F259@DM6PR03MB4844.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O3wvGvZ9elEZH6o2PQaZayQH80ny1mufm3YAcqN9pTrsO8HxBha2ZlaHeKAk2pd+A1fC5wfhGM1yPyjstnhpOhAEV2j4SKbbF6OfH7M1p2vS0Y7M6CEM/7ez3FFaGW0xJfujYMH1GJEhAnU4ca1UbYtOVGeFnFhtnaesoi2xSbLiMLAXRQ3coRBWGNb/JCkuGpwnhKbQgCbV+jJ3lgUsD58kNFDMCMzgsqU4iBZCzILk+nYXFSh1yAlcoaYcnuER1nbTemBAGBfhgdlzu6roCkyEQzdfJ9Br5iLxaLFW60q4RTTHtuPSgSQ2y9DyZi4Wm/mLm9acfbpngWsQGecI0vc9JDpzlQrdl8vGuodGWEtVmx8nW0O6JIdyJ3TxSCj6uK+r8QS+oUQnzturOFEhJvaWymh4gYzVZAKJesfQZe8J+VSVbpdOEMVglxcc4mnelax8udGTT40OYBpRzpRmk6HAylIJJ33RzAGilL23rJV3QC+au84a1UgvszqItd28fO1gZwjdsL53C2kwwoQjJ5ywR1ySY7jO8fLsOI4Dg8XFfemC3F/mK8AD01n+BkHKQwNSkWTzSaa1k9mOa5MRxa8BrkSxl1IN8r7bbi1xpmI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(6486002)(478600001)(66946007)(66556008)(66476007)(33716001)(26005)(2906002)(956004)(6916009)(6496006)(9686003)(54906003)(6666004)(53546011)(8936002)(5660300002)(186003)(316002)(4326008)(85182001)(38100700002)(86362001)(4744005)(16526019)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzBZenc3bG9SNXlNTUN3YXYwK2tCWWRqdDVFUEZsV2RLS0JFaDZpOGp3M1lv?=
 =?utf-8?B?RGtIN2V6dng1dmFoQmV3eHlLNG5IVmUwM0h3SjVKTmJjT2ZSVjd4eUUvQVN3?=
 =?utf-8?B?TE9oczQ5dE5iTC9YSzZkZndvemFlbzl6VmF5Wmx0VUo5Wk1uQ05UU1M2dXE1?=
 =?utf-8?B?UXd1STZhd1BMSFpad2ZESWlzYzM0THI2N2wwUGxyQTZjdVZoUGNmQ0I4VW5C?=
 =?utf-8?B?Y2xmTU9WS1ppZmcrVjJKMURKU2NwQVFUYW9mNW5qV29wYjdueUpYMXB2U2tV?=
 =?utf-8?B?NExYd1g0S01HLzF4VFUvaE5CZVMxQ2hua0E1OHZweW1zamJZcTRPL2txaFZ6?=
 =?utf-8?B?ckNuNTZObDN3V3ZZZnpaZEtpSXRLTDg1VVJ6ZWtqNlZLZWY0K1YvakVEUDlQ?=
 =?utf-8?B?QmU5dXV2aGpHN2MrYjVsaXdtSEZBZTdPYUdRcldhT21RbUJ1aDFqcTByRWJv?=
 =?utf-8?B?aUJVQnFObERLa20vNmQxR3ZaZGwzMk52M1VCN3hKZGFva252K3dESHZUc0RB?=
 =?utf-8?B?M1k3cHIyckFoTzk1YmhLN3g2ZWErRkw4V1NKQVhXNWF4eHdsdHd3dVVxaVd2?=
 =?utf-8?B?UFBsbUxRdkErVENlZ0Y5Wml2OFE3L0kramhiSDN1YlVxZ3JKQVlDMHl1c2xm?=
 =?utf-8?B?OGdVbFBUaW85R1dkemsvamlKLyt6SjAyS0dCdmJpRWhVdEpaeXdxYTloeHA3?=
 =?utf-8?B?Ulc1RnB4RlFOSEVXMDJITXZzbk8rQkRvSnNrTno2UHdyUUd4WHExZVIwVkhM?=
 =?utf-8?B?NFo4S0Z5YnI1c256ZjVNYVA4L3g4UnRGWXM4bWwyNWRFU3EvS3VYeVQxcWZz?=
 =?utf-8?B?dlZTT1dTaE9zL25SNWxsT0syUnpIZWNVWG9YR2c1RFl3T1pPakIxcEVicGV4?=
 =?utf-8?B?OGlZcTJ4RTcrQjZ5a29QdVg2MkNtbXJVY3pINGVxUnBBZFJtZDAvN2tqTk9Q?=
 =?utf-8?B?cVIrTG45Mk9PbUJqTEpEM0ljL3NaUHRpWS8rcWViOUhUVEhpeTN4QnRYYXFM?=
 =?utf-8?B?TFV4RndrMlpMaVJiUFpUaGtBTGFJdXovYWRDRmM1ZnMxbVVNZGl4eGthTkpU?=
 =?utf-8?B?QzF4K3JXTGZaOVFsamVXYTl4NVcxdGpwSE53a2kwRXJqY2Rid3dvS01ma2dL?=
 =?utf-8?B?OThhY29rdmhQaUo0K3Q4RFIwN1N0QnpwMFlUU0NlMzE4eHFMTm4wYjJUSG5r?=
 =?utf-8?B?THQvRURSN1RmQSswcDNKQjJUQjQwbUtqSU1LeEhGdFFWTXRGK0RXUjE2Zjhj?=
 =?utf-8?B?THhOR1dEa3pla1pVWmVmZXV3blNkQkxiTXFmVXlYQ0xLSFJVVi9BUTluc2k3?=
 =?utf-8?B?TU1EMGVwendnV0o1OTd1YmMrUmk1ZW1UTTR1MU9MTnBZV3BDQjhGM1MxNlhK?=
 =?utf-8?B?dlF2ZE5mZGhsaVVtd3QyYklyL3FTVDUvV3JrQnRmVmRSSlNna1M0bThUcWM5?=
 =?utf-8?B?bThOQ04yOWw4bk5Tb3J5SWx0NHJUczlEYXpzNW56RVlJbm01alAvdE1kMXFm?=
 =?utf-8?B?NTZOaHptbE9wN0gza1hTMFFCTzl5Ylk0c1R0VDRBNjZIVEV4NHFrazl1TFZp?=
 =?utf-8?B?a1UwaEpYcHMvTTNYRzlCMnBaczI4ZlpjVGVKNUlEU1o5UkVvK2ZzWEVWSDh4?=
 =?utf-8?B?ZExldE9QbGl6dHp4QU5aNkRhM1BjUHM3ZU9aR2FOa2ZPdHpHR1dKNTliSDRv?=
 =?utf-8?B?ZmN0UFFuSWlMVzNXTmgzdjF2VDhOd0VKSzExZ2tNZ0ZDenpLN3lqZHZjNFY5?=
 =?utf-8?Q?9DRfhVHYqEglMx7+EVLV9GAYFVdCxiRNq/6qQtr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e823103-7a3c-4dbb-579f-08d91f94f2fa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 15:51:24.2864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhs/nRSn97y4RY9iPLnIRq6b6sp5fsuai+/JNy9EB4U1vYvW67106oPVwOhzJ+q/6Yd/bPzuJYR64c3wanlVeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4844
X-OriginatorOrg: citrix.com

On Tue, May 25, 2021 at 05:21:43PM +0200, Jan Beulich wrote:
> On 25.05.2021 16:39, Roger Pau Monné wrote:
> > On Fri, Apr 30, 2021 at 04:45:03PM +0200, Jan Beulich wrote:
> >> @@ -31,7 +31,7 @@ config SCHED_ARINC653
> >>  
> >>  config SCHED_NULL
> >>  	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
> >> -	default y
> >> +	default PV_SHIM || DEBUG
> > 
> > Do we need the pvshim_defconfig to set CONFIG_SCHED_NULL=y after this?
> 
> I don't think so, the default will be y for it. Explicit settings
> are needed only when we want a non-default value.

Right, I think I haven't expressed myself correctly. I wanted to point
out that I think CONFIG_SCHED_NULL=y is no longer needed in the
pvshim_defconfig.

Thanks, Roger.

