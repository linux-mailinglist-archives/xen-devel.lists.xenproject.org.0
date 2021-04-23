Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CBB369262
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 14:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116284.221952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvE1-0000Gy-VX; Fri, 23 Apr 2021 12:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116284.221952; Fri, 23 Apr 2021 12:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvE1-0000GR-SQ; Fri, 23 Apr 2021 12:48:01 +0000
Received: by outflank-mailman (input) for mailman id 116284;
 Fri, 23 Apr 2021 12:48:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZvE0-0000GM-SQ
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 12:48:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67d24d29-3bc0-4a4d-adb5-729a961451c1;
 Fri, 23 Apr 2021 12:47:59 +0000 (UTC)
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
X-Inumbo-ID: 67d24d29-3bc0-4a4d-adb5-729a961451c1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619182079;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bRRtqnyqHZTFem9dsVkpkXKTPO1fe+7Ew23UNSxn3Ng=;
  b=L/6u3BlYuXxc4TfhZ4rAuWg2+zroMwmbmltCVRkwR243dovM9g4rc+p6
   WFozufvkxaMd5u6As6xUY8u/hJz664T3hqYfMyWhAU7WcoSmG6cfh0Wt+
   N4evxpqvuj2VZOIzr9ULqNBynKW2F9m6R4rzq7/g8f3+J3T9MQ2jyWb2Y
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PWi+Cxe6bMidLJ3oecWxtvYAtDHp5VUmwlJKYRZ1orekFE5WKq3Mx16ybfcSPaeMxH/e1SjjlW
 sWCvcHZ1CXEF9jhy8heXhleijZha6EmHIyqnxc8xu5UMlinpdVrboonZAboEbdIr6Qau7u5KqG
 /LUTHOz8oW1aYkCgiTujJcEv+iKu+BUUv8TR4RwSIYydmKYEvVIjTgkO3pO05tDY6XJFJZ4xxR
 iVIT99LobtGG+GGLxiiBCUmKTCPB73w8MaSa404TcWzN1c5LVWBM7+qol67gYlR+30MPqm/Ifu
 TU8=
X-SBRS: 5.2
X-MesageID: 42654043
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Cy95hq3pBmR8yDQqBVDiEgqjBWByeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035Qd2+ksFJ2lWxTrv3btEZF64eLZslndMgDd1soY76
 dvdKBiFMb9ZGIRse/W6BS1euxO/PCp66at7N2x815IbSVHL55t9B14DAHzKDwSeCBjCYAiHJ
 SRouprzgDQGkg/VciwCnkbU+WrnbSi+K7OWhIaGwUhrDCHkDLA0tXHOiKF1RQTWS4n+8ZBzU
 H5lWXCh5mLgrWA5TL3k0TS6JlXn9WJ8Ko/OOW8zvI7Bx+ppgKhZIFKU6CPsjYvsIiUmSoXue
 iJmTgMFYBe7G7QY3GUrHLWqnbd+Qdr0VDO4xu5hmbuusPwTj5SMbs+uatpNiH3xmBlmfMU6t
 Mt40up86B5IDmFoQHGo//PbB1unlrcmwtYrccjy0ZxfKFbVKVctuUkjSVoOaZFJg3WwqY9Ht
 JjCcnNjcwmC2+yXjTism5jzMfEZAVLIj62BkwLusmi2zNLhnxOz0wB2MwFnnsbnahNM6V52w
 ==
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42654043"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFZhsILfsoWFx1472h5myNqXYNBx603ujaPIZKgdrRw/YVqqaR+B6BEBxSzdo8b7QMi16BvKyMZn9hzysqDd7aEhu/qkHmOKK4s7kkoZpiRvSii6H30BFHZIDl2YNcCkRoMcFsBec+Vtk5FCk2yP9kt3xNjhr26TQYMbzf+GOSVp9p8dBZn/9oOYM241eMM8gop59rCgUGxo6hED8jyIHBeK/ZiXVDjuAr7GfmkXflLtUhb2PXeMFl7vdAXAZROLNJLzHPq+kxS7JfDplZT2+QF6+Z0YHkRbXe3ZiI5kCPRQuTj8K1qLJYD9Tmkgpffs+BlUOjBVPupMpQJWweQmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jnq4QWgQAnfYyTiwX6AawNNC98MznjLUDFEqXz3Se+Y=;
 b=SpHcibr88fu0sEyp8ev1HR0fnx68pir7TCwXtqwzRDklhl8OEZO4OX2cYBXZ20Ucp9cJRAM7CWzIIHIcdvaa0E5uTBTOdj9YL6pMXFUxjnVt9/RC0mTl6a0ZJzRJtKbMF2VtJe3ZpmFPnIFqyfMFeR+ZjF3E9On6AoNmUrxttyyHV8wCHQMFYFlgYwG2rJBrDt8HSJhCYOgDV1N1WnwUe2ArEACPwF0kLg7fiLgy7jAz+aHb5AhK+pDTvFWnWdGAgcrDd5eAF8qu8udNRtXurgSqKu0ixACB77Omo9+7mqYuHan5dJ2tBhtNilZd+t1Tei9PQ02JIfhM6gSE7m/IeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jnq4QWgQAnfYyTiwX6AawNNC98MznjLUDFEqXz3Se+Y=;
 b=CCGtCe0WdYIy+b6KQoIXFyAA0E2tGOJA7Cv3fA4xfpd1Z5U4/jiavXl/Op/pxHjU3956RWh5hOKVwrfCBu+K4MGfH5MvRc9jnFrNg1/aDPJ0Arhbd6y0kH6L4z7YWVfj6QFgLCaYb7EVK5JXYP+4HvT9bfGPJwHZfIRBX5chGUE=
Date: Fri, 23 Apr 2021 14:47:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cpuid: do not expand max leaves on restore
Message-ID: <YILB+fvGT6QPnAhC@Air-de-Roger>
References: <20210423105408.7265-1-roger.pau@citrix.com>
 <91a32d56-c0cd-f883-eee5-de2691417703@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91a32d56-c0cd-f883-eee5-de2691417703@suse.com>
X-ClientProxiedBy: PR2P264CA0010.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::22)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ebd4d89-a6cd-4c8c-28cb-08d90656051f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4474:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB447414B15196E85288D6AB078F459@DM6PR03MB4474.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p95nZaEManErrbssf+Xyv/6dyj3sm8Nq0W3SN9ElO4EjWKSQH1fo6j+/JJRzBjq5NfHk1mw30Lpscn8jK8J0kIMjHmn7le8n0PDXCS5OuWg/xPniendvLbONdoU+ij7EBAfixKiD1ywv6TSoNOBV1yTNSDXLC4ETHmkPpYwuFcNOP5xCdGO5T9enIM56nVjiNEo16OBf18ojyk4iQlcRD19LRl0BN3WESOFRtIYt2K93lMBi4ZTcEj4eC1j4P6rBgswFEu1Rk3X61x6iTxOV0GXEQ+uR6vHPZQ1IFkls6JUtMYXUocjlckHfEeztz/WAs1fvypl8TgXZRa0n9qJDQWzMMoejE6w2ejlpZEm+dXPLOl9mZ/vuQFPQLDfL4K8Gj7W2zAutgB1B5FH4p7LeEWv0uNQrodeI8OYTy6Jm1iCDwsj17Oy395SDAeH9UWsnATzjFERO0BSo8XT2ZcXwHVIQh9FhEJU5nW1kPQQ+/Ttq1Q7HBDvO1RFMGZLa2vq/d1W1pMa9T09ko0EkatzE8rb9s1CupQdBhgylhNi86XnfxUHoqepSIfHK2devKMBkaWbsaG8Zs+K69rdGcP6w0IRjjoFHyeHW1ZbApHURJlT+B1DxnROOgtb6THymKXFTBcG91Ps4/WQGlePlyqugqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(366004)(346002)(136003)(396003)(9686003)(66476007)(66556008)(54906003)(4326008)(83380400001)(33716001)(85182001)(6496006)(6486002)(66946007)(26005)(5660300002)(6666004)(4744005)(956004)(16526019)(316002)(478600001)(86362001)(6916009)(2906002)(186003)(53546011)(8936002)(38100700002)(8676002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UjU1bFJTdUs2clRBQy9pVlV5aVpGMnh2djZRd0ZSK0xVblN2RFkxOXJoOGN3?=
 =?utf-8?B?ZnlSZG96SjR1NncxUHBsNmx0bmk0WW93N2Y1dktBNVRqNzFlWng5dEJ6eWhh?=
 =?utf-8?B?NnhMRVRDYTlhaDQ5STd2NmMxc29OR0QxSVkvMGQ1RFlMZWVoL29vbVZxQkVk?=
 =?utf-8?B?ZGN3QTNFSU1IdTRDeEZJaTRjNWhiTXp0MFlYWmh1Qk1pR3ZOUy83Q1FOdmNh?=
 =?utf-8?B?Q1I4cHpOeElnZEdqMDdWSzlJdFBSWjlDV3RNMlJONVRnVkk1S3d0cnlMTDlF?=
 =?utf-8?B?OE5Jdi9oZmF0WkYvcTRCbm1sbm8zRVJ4QzV4azF1TXlReE45WFFRdGYrTnlK?=
 =?utf-8?B?d3BjRGx6NXlQZW5qUEtJR2VXWVFjMGNCbUlLbEZWUlBPM2pkUWlxSjl6RGNX?=
 =?utf-8?B?QUxQajFDU2pXam8ySjBjR20zSFlxQmRaSFkxbi83SEpDVUMrcUc1c0ovMXFJ?=
 =?utf-8?B?Y2hhdXVBbkFROXBPQ2Z6czRKT0s1c1N5eWlGNzdhQXdySG9WSVloUWk4Sjl2?=
 =?utf-8?B?aVUvNHZqOVZpQnJwNnZGWVFxTXZwWDNUV3cyeEZwWHJpUkcwcldMMk1VS004?=
 =?utf-8?B?UThJWExQaUViLzduamlKdk9VcXhOTER2RWxpT0R1ZXkzbDY2Y3JuUFB5ckRS?=
 =?utf-8?B?cG5LdFAxL0dGQkJ6Z3hYU0VrcXJGSSs1bVdISWQvbzFnL3BQTWsyVmdVZkZ3?=
 =?utf-8?B?VDB2U3ZCUlh1L25MWkxQenJCWHdYbHdiekxWR05yaUJCVUpIU25wNEpTREZn?=
 =?utf-8?B?V3l5aWxOcmJWNnhkZEFNWWdpeDhaL3RlUStFVU13V2dRNXVOcmNoTkZtVkZK?=
 =?utf-8?B?VkVvZEVjQ2N2RndROVVSd3pJa0NodTU5MWtGSU5GNG1qanVELzN1U20wNzBn?=
 =?utf-8?B?SVoxMXlQa3FENW91QnJBc09FcURFb3pnMUxjUW9DTkNXdEVwTHVBb2RObGxh?=
 =?utf-8?B?b2dBNm0xenBiY1c3OGo0YTQxTExlbWJvSE05eTV6U1JPQk1LLzB6ODRNUzlr?=
 =?utf-8?B?ZzBWSi9MZWFwaS9YU0dFcFRPbEJJeTJyZ05ROHhmdkxnL2JMK1dRQ3JoL3VX?=
 =?utf-8?B?Qi9TNzdMN0lZMTE0cmpKeERyd2lIZW9ETmxYb0RMbWpzcElXSTZ4cGFRWTBn?=
 =?utf-8?B?dTJxTUtHdmNvakZLYzhsZEx5NUJXK2hsVzZLVjlLVjAxOTA3ajJ2RURZSVZB?=
 =?utf-8?B?YS91U0p4L0hmTXprK3dmVFRWWkYzNThQdUpDQmZUOGJGNk1kSWUwaXh4M1RS?=
 =?utf-8?B?ZFVBTlZaWGI0L0hXMzFNeTg1a1pjbC93VWs3R0xmUzEyRGMzQVJiZW1tU1Zw?=
 =?utf-8?B?OEJKN0d5ZTBieFZKNXFjMklYNjhkS0pkNkRhV2ZmU2tTUWlTbjZ5akVpOHlN?=
 =?utf-8?B?SUUrREJ1Tkw3L2o3RWdYUlUvNFBDUjhTbmYxQUNmN29leUdrUjhjVS8rc3JT?=
 =?utf-8?B?VmNaUkJ6T2FvcDVYR2NDTXRBa0lrVi9ydkVFUHVSZFpWOTVnd0NvbWl6NjVr?=
 =?utf-8?B?WW5RVUFhSFVTczNNZmlqZnV2WEozMnZ6K2trOUwzU2d1bVhHUy9URG52ckRD?=
 =?utf-8?B?WGhRdU1VaHkvTzVtS1NmcjZjM3luT3pyUGZOVkE1SExTWDN4Y2MydFA1QnFT?=
 =?utf-8?B?c3hjT2xkYXhRbFhsd1lPSEFlNWhndWcyMXpUelhZamF5QWtJV2dHR1dnZS9T?=
 =?utf-8?B?VlZHRjFCaStPYlkwVko1TWZoZ0lXY0pUckZ5bGY5ZGlMMTBpa21ML0JuY2Vn?=
 =?utf-8?Q?CQTEcEe3d3hXAkKgnY130fqibBIctzVoBzPxjEx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebd4d89-a6cd-4c8c-28cb-08d90656051f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 12:47:57.3414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1VbBLIWT8pYQbsYFhVz8Wkz40dpphkR7dgmzvuejd2g/qeNlwfHiH6cFOQnHYAMrSfLCKAdDfZvrP2fTzRS7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4474
X-OriginatorOrg: citrix.com

On Fri, Apr 23, 2021 at 02:41:32PM +0200, Jan Beulich wrote:
> On 23.04.2021 12:54, Roger Pau Monne wrote:
> > When restoring limit the maximum leaves to the ones supported by Xen
> > 4.13 in order to not expand the maximum leaf a guests sees. Note this
> > is unlikely to cause real issues.
> 
> Why 4.13 (and not 4.12) here when ...
> 
> > Guests restored from Xen versions 4.13 or greater will contain CPUID
> > data on the stream that will override the values set by
> > xc_cpuid_apply_policy.
> 
> ... 4.13 already communicates the values?

Urg, yes, my bad. This should have been limited to the max leaves
supported by 4.12, not 4.13.

Let me send a new version also incorporating the feedback from below.

Thanks, Roger.

