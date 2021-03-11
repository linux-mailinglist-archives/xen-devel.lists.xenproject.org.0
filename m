Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B094A3377BA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 16:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96662.183123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKNGJ-0004xp-1h; Thu, 11 Mar 2021 15:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96662.183123; Thu, 11 Mar 2021 15:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKNGI-0004xT-Uu; Thu, 11 Mar 2021 15:30:06 +0000
Received: by outflank-mailman (input) for mailman id 96662;
 Thu, 11 Mar 2021 15:30:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKNGH-0004ma-8H
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 15:30:05 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9399197-7487-4cbc-b9bb-57ded3b6e8d6;
 Thu, 11 Mar 2021 15:30:03 +0000 (UTC)
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
X-Inumbo-ID: f9399197-7487-4cbc-b9bb-57ded3b6e8d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615476603;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qZjfMbRRgHC6Vcbwl/dmWhEZuTHKgPOjyJVHTLOjFiI=;
  b=iQ0r17zHONtC7Y+iKHLEIO4qEhfdUsbj4NnwXevj5CZIKEi7XN7VHc1a
   8Ge3dSBean5nAoo4BNc14JiC7n2m34i6q3R2mB2PqUetGuc1zQ1Vs83sg
   9VGvPKf/R86lrYHsA6tV/vBI4gHQdEv4cfInq4CnzXFhjeAgue8bJQV1R
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Tur9VbaaZls+DPT3gNvOkx1OCxxtH75J4KzifoTCx5iE1r/JEQV7n712KUSCewb6W58yWnpIA2
 UnmEAfAJsS01GITnudyHCItCkQ9BLcGTeqKwzMMLfxvuwHXRY/0qgFPLg5hYO4YBr7YX4kYP5O
 9o36NA8pGp5lDifFwmJGzDYMsswkE/lrau3wAwbfuJm9p5dux5a1P/XNxKT0mt9kJOquE61qhE
 2/0wm0D0LvLLKVk33pBVJvQIr7Gorz5raoDGSYXxInyYIrVWJxDDsqosH2j6hOnuY2yjTkWKJS
 noM=
X-SBRS: 5.2
X-MesageID: 40483467
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:52i+bK9CckXCcT2ZFFhuk+FLcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmzybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIULD38Zn/+
 Nbf6B6YeedMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsLV4hLxW5Ce2CmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXHOlAuWe/fq9rX0K/3eBJuPW9c1CCirxONrIT7HR+RwwsEX1p0oIsK3G
 DZn2XCl8Cemt6hzBu07R620713n5/bxsJHFIiwjKEuW0nRoyKJQKgkZLGYpjAyp4iUmSYXuf
 3BuQ0pMcg2y165RBDMnTLX1wPt0Ckj5hbZoDfy6xaTwr2aNUAHIvFMio5DfhzS51BIhqAG7I
 tx03+ErJ0SNBvcnU3Glqn1fit3nUm5q2dKq59rs1VjV+IlGdhshL1a1kZUHJAcJTn9+YAqHc
 J/Zfusmsp+QBe0aWvUsXJox8HpdnMvHg2eSkxHgcCN1SNK9UoJg3cw9Yg6pDMt5Zg9Q55L66
 DtNblprqhHSoszYbhmDOkMbMOrAgX2MF3xGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUXtD3FRCO37GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7CLTCDclYziMGtys9vQ/Hzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk7odA+d1WSot/aC4Hju+DBGcyjZobFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfMdyXEjNdNOZmf29JW5JkGN4VKvARQo0++/Nu3JTpLtbFzWE
 N/Jbjgg56qvGXexxeN00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPUdfwWWAPR06a8/NCg
 ZQqxBW9MuMXtKt7BFnL+jiHnORjnMVqn7PZYwbgLe/6cDsfY59KI0nVqx3HQDiDAd0hg5ulW
 dGZGY/NwziPwKrrZ/goI0fBenZedU5qhysO9RopXXWsljZmdsiXUIBXzmlUdeehCEnQzY8vC
 w3z4YvxJ673Rq/I2o2h+o1dHlBcn6eDr59AAOZX4lMgbzwdAZsTWCFuCyCh3gICxnX3nRXol
 akATyfePnNDFYYgHxe36rw2H5fd2mWfStLGztHmLw4MV6Dlmd40OeNaKb27nCYbUEaxPoBdB
 vfZyEJHw9oz9er9RKclTqYD086zpE2MuG1NsVkT5jjnleWbKGYn6APGPFZuKt/PNf1q+kRTK
 axfRSWID6QMZJe5yWl4lIefA96p3kvnam2hFnL7G2k0GU+BvSXClJ8XL0fK8yd6W+hZ/vg6u
 QMsfsF+c+LdkP2YZq67IuSSRhpABbau3S3QOElsoo8h9N7iJJDW73gFQLV33RG1igkJMj6lE
 kiUL12iYqxT7NHTog3QWZl5VInm9SEEVszviH3CuE4e0sxj3WzBaL/35P47Z4uCFaGvg3+JB
 229DBc5e7MW0K4pPQnIpN1BWRdc04n7nt+uMuEao3LEQ2vM8VO5kCzPHP4ULhTTsG+aPgthy
 c/x9GDhOmMcSXknCjWoDtgO6pLt1+dfvnaOnPEJcd4t/qgOVqNhaO24Mm8yBfPIAHLFHgwtM
 libkwfbsNKlz84qpY4uxLCE5DKng==
X-IronPort-AV: E=Sophos;i="5.81,241,1610427600"; 
   d="scan'208";a="40483467"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe54hH1DCj+HsbhRlIunzSp23ZvVkK2plkPGeAJ9v7rNqvUhiZ+HKBllyrNW06L+aNmpiXCBSF/81sUjnR6KOF2kqlNh8MsgMhMzIcDuKrnHF6Hg8bJRhkKzkaYmvinKZs1y+S4x/2jrhGKWswXCdOLPrOJqRB7dVfrg8O5rIWBPnD98LrP4dDjlZxpj/rpnbj8qlk/oOnRdIuh0DhTPKjJtJWfvp5JYMNrVhwq32CDSX1D3iMimwtkHGzZMnDahvAytLoOKjToD+n/2uqx3R5hSoJP6MZoUthM5i45HKdi0Lyg9K34gPnIin0Di4569PQoJTs6Y8ondk4/bU3WH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geDBbU9EjX8Jnex9QKdowsFek8INI4IykGSx1N6fHto=;
 b=BcjEOH9G6WyGGGs5P8wKvwoUIVWFpUyIdTUvxl8A1ToF+gHyEIJw9/GjVgQhINi2/kEOPgcUTZZ+YQcxHfboi5VvpLvIfWxcDcniWaLVJkQ3rY/0mA5tRN+zgKoHIj9KLrSCOM7eFeeyY5psdfJ8cfpR2Z4KXyZ1xfSg8I91tYl9hU3FJhuiDuhgBDkIz2KDzxKBbKXuSLbAa31sOIs1LLPqWFemxDa8qfYTgqoAWqNT4uEqXTcS56eqzO+AlMRcOHc9bvG5zYTobrOS+22gnqdLXfXeyJ6A0dgrO9NX4o0DAUIb5z/G/cYS3zJiA9V2PuDphafYgfeR/BKIxnsbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geDBbU9EjX8Jnex9QKdowsFek8INI4IykGSx1N6fHto=;
 b=SZKt/kzIk8QunYC/DC9n4CDJ+HgKyUxofYJkTgu7G8iBXU7LygdiyazQZYcwcMiGVCsUZKv57BwQa60s78mHufIYE3PEIahyJiYKEuD3ProzJdvXO6UcgSKkKWGb3AQQIVEKBaCgMgOL4mhumj5xWo6c9MZETs59Y4+Ve5bP3Ak=
Date: Thu, 11 Mar 2021 16:29:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Wei Liu" <wl@xen.org>
Subject: Re: [PATCH v2 1/2][4.15] tools/x86: don't rebuild cpuid-autogen.h
 every time
Message-ID: <YEo3VzlTRTaBUkqw@Air-de-Roger>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
 <1b8aee19-9194-153c-8dbb-0aec3412e255@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b8aee19-9194-153c-8dbb-0aec3412e255@suse.com>
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26eca4f9-1ada-43e5-14b4-08d8e4a27849
X-MS-TrafficTypeDiagnostic: DM6PR03MB4139:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4139D42BBBB71BB74B54E0828F909@DM6PR03MB4139.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9iX24qdMiEUR1BID4J1d+YbGYBXDUrTyjV+T/zVPenLN/kGJGrRwxSuGuCbVIF35gS6pbe+QyHriRh/0cOvisV4AWiWyA4TtgtJsZ8O3dN56dQfhIs0rETxRW11Ul/xNI5yMP/4VhcO5EwSUOZN+0KCFLNP5waf8l9jGN3c+Oiqo5ef4IEVPwug4Ut0V4GL2mTL4FgzefRQfiemU2x/WA6lJbL+8GEwbGiKEcS+EomIiR+SIMV/wyzWcIxYfTH4wxmCix/t0fEEBzNpw7biRLXHROs/NdnalLseITKxxWNVNui+XaVdOdIubBPWoFYeY69CpcCgntk0ZEHmFWsP+ptELLRFH8+AvnMAQ4kYLElUYK6lX0YI7fIaOAbQvg6tLXdFgYHMv0wu7uw+cdLt+JUUnNf1EJYfdqs959sN4jHlbXuZL2bVi9rkX+uM4L0w11XU7ZeTBjQ/iCiIKPETSQOSbpzOajIAX1qYsTe/1Z8l92FzDPn83IciPO+MR8EO6zMRzNeu6h36ZPbQmqkIlhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(478600001)(33716001)(6486002)(9686003)(186003)(16526019)(26005)(8936002)(2906002)(4326008)(956004)(8676002)(66476007)(66946007)(66556008)(6916009)(83380400001)(6666004)(85182001)(5660300002)(6496006)(54906003)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WTU4OUNiRjFBUDB3cTloNEorYUt3RFVqT1NTNUwvSDNhdStkOUE5M2VXa2JP?=
 =?utf-8?B?dC9pTzZOajl0NXdwejFrOUtwVnQ4Z2tRMGtuNDFhK3I0cnJzbzZXOWVhbGx3?=
 =?utf-8?B?UndVemdtR1RDVzR3NS9tNmJlbmI5bzJiNnQ1emQrK2FpbExBS0h2ZG8zajVV?=
 =?utf-8?B?R0NneGRKUFZFRUlBcWdIVXU1TEU2aGVCN2kvVURhWU13Zzk5Vmh3SVhGSzlQ?=
 =?utf-8?B?WWtGWG9pRXNJN3J2SlJheWUxcVRvM0k3bzRZVFdUSVI3Q1pPaUVEc3QyeDVl?=
 =?utf-8?B?WE1yRnp3ZTlwSTkvdS92RXFjWUFOb3E2TGhQRGg2OENaY3hHL09hYWRacDdl?=
 =?utf-8?B?WVlHbDNlMU11OEt5VDVCaFdDdS9BSncwT3ZXa0M5eXpYU292V01LazJYTEFu?=
 =?utf-8?B?ZUViRU1Rb2VpdENRekJhTWVNZjNkbWtPK1R6OUw5Qm05RTIxZmQxeXQzb3lU?=
 =?utf-8?B?cCttN2lzUjc1djhYSVdCbVQrbTQ1Ym9JM3hEZGZ5VjBKZHlzYitTL3o4R2NT?=
 =?utf-8?B?WGhSeGFDZVI1Wk5hbzhsY3I4WCswYkpPV1E2T3E1UkdsUldqYmJyYWkvRHU3?=
 =?utf-8?B?L3JvSTA2WnYxaVcyR01VNHhLdlpFSjk2R3pFbXZjVW4xdzRmNWgvdTNSVi9I?=
 =?utf-8?B?WkhCS0tLVExESW56Z2FLK09QVGxINXEyRGIxTWtpRVZrZGhoZEFKWnhuSGJ3?=
 =?utf-8?B?aVNMRndJQ2NISSt1MzJxUnRQK3J1Y3dYWXdPQW5sL0JNWjIrMWJXZmlka0lC?=
 =?utf-8?B?UjVJeXEwWmJEemszSysrOHV4NG94S2lQYyttNEVRM0hXM0Z6R1E2dEV2enlH?=
 =?utf-8?B?d1hWMzRWSjNza3UzT3piMWUrNGxhWWZycGQ3MXdRMzNzMmZZM1N3NHNxSkp0?=
 =?utf-8?B?NmYwZ2Q1M2k2YWQ2MStMMHV1clI3MDVYdkh0WXRmZGRsSjV2b0MrcjN6ajd3?=
 =?utf-8?B?S2QvV2hLcVRYSjUrSWFDdFdyZHh5eHpKMVI5UWNjK0ZIUnhFdlRkdEloM3VO?=
 =?utf-8?B?enloc1hncnZvMFczclB1TDFLLzU0SGpmeklNREtBY3FlWUhJazE5cm4xQVBq?=
 =?utf-8?B?UlhranNNOXhqR1ZnM0ZxZnBsU1d3NmRKVnpWU3IvdnlRaHFvS3ErTXFITlZB?=
 =?utf-8?B?N01EZWFjWGxtd0R5M01JV3BoMENHejRaKy9HelJ1Qks2OThGUWhSWG9MME90?=
 =?utf-8?B?MUorVGZIbmJua05DNVBmblhWT21kZS8xTHVod1gzZHliWnorR3dtd3YzUkpZ?=
 =?utf-8?B?dDdzcnpFN3hCaHg4SExsYVlBc0NDbnh1VWRhN0hCT2hjR0RIM3huczRQeWhx?=
 =?utf-8?B?UmdYbXFQemo5bzNsMU5ObzRiSFlLY0tOSFpSRmJRRDJBbW5qZ3hGQzh6Wkd2?=
 =?utf-8?B?VmU3ejZNZW04UGRlemtoM1FPelVyc1FmVGlPd3VqcmFkSHp5aWNMQ2laWFJJ?=
 =?utf-8?B?TU5kYUd4TC8vVTdybk1YcnFhRXEvRWxQSkQwUTJxV0pOcFJZa2tlWXBsakFY?=
 =?utf-8?B?dDYxaDh3QkpncVp2MmM1UnlmdW0rSnhNZUtRQncrdjBnUUc1dmVaVFpmYlRM?=
 =?utf-8?B?TERETk1SenY0TWRoWjVKSExZVnIxcXRaTmdoVHRBdkt6WVNyN3V5amVFM1RM?=
 =?utf-8?B?S2k2SXdjcFhiOElBOGpJNWFMSWRGQ3NaS0dvMUtNYm9WaUc4TEdqMVpOcWVi?=
 =?utf-8?B?WmR0M1FWWGxkcnRrN0ZRVlZBQXY2akdFTXVXUDN1SUs3MXRVWTNCWGZReE9s?=
 =?utf-8?Q?5mis98dSvBKlM4tY+RySNj212oWN4CtdwaPdx95?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26eca4f9-1ada-43e5-14b4-08d8e4a27849
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 15:29:32.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01bCuhs//Mlv4yUZmBV9WPL3jt31USEHp7Eu/enSYzeS+3d64JQC2pLdvPnVZkjzteOYlno7dL3crnFf+w1VYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4139
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 03:40:05PM +0100, Jan Beulich wrote:
> The first thing the "xen-dir" rule does is delete the entire xen/
> subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
> result there's no original version for $(move-if-changed ...) to compare
> against, and hence the file and all its consumers would get rebuilt
> every time. Instead only find and delete all the symlinks.
> 
> Fixes: eddf9559c977 ("libx86: generate cpuid-autogen.h in the libx86 include dir")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Different approach.
> ---
> Ian did suggest to pass -0r to xargs (and -print0 to find), but I
> couldn't convince myself that these are standard compliant options. We
> don't use any special characters in file names, so -print0 / -0
> shouldn't be necessary at all. The stray rm invocation when there is no
> output from find can be taken care of by passing -f to it.

Why not use `-exec rm -f {} +` instead? That seems to be part of
POSIX and is likely nicer than piping to xargs?

> 
> --- a/tools/include/Makefile
> +++ b/tools/include/Makefile
> @@ -19,7 +19,7 @@ xen-foreign:
>  	$(MAKE) -C xen-foreign
>  
>  xen-dir:
> -	@rm -rf xen acpi
> +	find xen/ acpi/ -type l 2>/dev/null | xargs rm -f --

Do we care about leaving an empty xen/libelf directory behind?

Thanks, Roger.

