Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0786136FC91
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 16:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120555.227986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUGk-0001SF-7u; Fri, 30 Apr 2021 14:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120555.227986; Fri, 30 Apr 2021 14:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUGk-0001Rq-4Z; Fri, 30 Apr 2021 14:37:26 +0000
Received: by outflank-mailman (input) for mailman id 120555;
 Fri, 30 Apr 2021 14:37:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3Ge=J3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lcUGi-0001Rl-GM
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 14:37:24 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86d06d5c-be08-4b5a-9e24-334942e39fa1;
 Fri, 30 Apr 2021 14:37:23 +0000 (UTC)
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
X-Inumbo-ID: 86d06d5c-be08-4b5a-9e24-334942e39fa1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619793442;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ks5QqTy87fA4LOTzs9bca1tHdSzeC1IxbYhhfpA/iEg=;
  b=DvHs1f4JLZuruBuZkVaf7jh+yDkrpJ4gKb6aLIGXkBwz9ziA+8v73wQX
   NNpSEmeCGs6dVyW0+mz5Jj0Bg7Qyef3YoEto2Y1NcgGdubwqUH71WOaac
   DnHMmOipWw/1bN7ysTy3Me3AcdHqgXMgcMM+0956vBr4xZq378Tz1PBh1
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DZbleYGSfGGOvS4orvI060mpejXleVr7Pl4M2V3MkenXlgE1eANX5/ElKyW/K9yZnt+7IY3HZL
 N6rK7ldxbHkLfYC4Sz0kJPwK1c14iHOJ/0OSg2otyewTkLpz4lirs4mvoIQA0Z24++AO/8RHLm
 a9Gmw84wKfuvoyM/h7QKijvMo3jcAJ7Z5FKS/PRXCnGFKvcUDX0F3UJ3ZLbv8yEQi7SWqnKWn8
 s5VaTm7j1mt20Ha5hKjGkjM9hzdkF4OIwQ4/XWeBNb7R+ftiJU4726UA2J3ywOM6Lc+XJaM785
 hB8=
X-SBRS: 5.1
X-MesageID: 42618853
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lPZVWq4u8Vur5BoeaQPXwTOBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3Xa6JJz/M0tLa6vNTOW31eAAaNDyc/ZwzPmEzDj7eI178
 1dWoV3FdGYNzdHpOng5g3QKbgd6fmBtJulnOLPi0pqJDsaCJ1IyydcJkKlHlZtRA9AbKBJcK
 a0wsZcvTKvdTA2Q62AZkUtZOTIq93VmJ+OW3dvayIP0wWAgSil77T3CXGjr3UjeghC3Ks49i
 z9mxH5j5/Jj9iA1hTe22XPhq4m/efJ990rPq2xo/lQEBrAoEKCZINtW7qN1QpF3N2H2RIRv/
 Tn5zslN8R3wXvNcm+yuguF4Xie7B8er0XM5HXdrXz/odHoZD9SMbs+uatpNiH3xmBlnNZg3L
 lF12iU3qAnfC/orWDGyPXjEzRJ/3DEx0YKoKoooFF0FbY6Uvt3q7cS+UtEea1wZh7S2cQcP8
 RFSP3H6O0+SyLiU1np+lNB7faLRXoJEhKPUiE5y7Go+gkTpnx/wkcCrfZv5ksoxdY4Q5lA0e
 zOLr5lorFIVtMXdqJwHo46MLCKNlA=
X-IronPort-AV: E=Sophos;i="5.82,262,1613451600"; 
   d="scan'208";a="42618853"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdaXs7meDncAoWT4N/Fuk82j9DDGdLwXj+X6bjfv2aSCsLpC0Hhr1udXFdgu8+KbbHHRlVTepUrRoBpHRm8sUaNtb3skVlnuSWFUnXLz8WpUvM8qcMl7zahiRNv6um0FoLzyvFPmZibNzlMzDvt6JkzlPVxPbng/bHoXqWsnggFQCMPqaQy60pZiM1jiul8jPr3DZo/Zj8+gYr+KE2AJpLXN630tj5MJUlE7uQTlp7GHWbbehD3AQ3bPVs8mkDAfidKBXhQndEpI2BKYSO5IBve/gBIEtx27nTu+OO+z8rXttQPh7W3OFQFc/+iefu9/weBxiQw1BkC4gcnER1aM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehLA4x5CNAUoyPN7SOlV8lVmFAdHvptm88ghkQ8wJhQ=;
 b=RPE21E9NPxxpAW086DvA/1ZI3Do2PrGY81gJooEUXEm3kvNaRNT5FwiNwyEDDYltt5oA7/yyXOkSzCpCLZ8lYfcyaqAtttUqnwNAVlgfCMKnUdivc/FRuHQWcvhm8eLuURAiXdxUdB0XHHfyBYPp5CWxxqqt3iOgQg7jKxY7YWSu0H7L8CqjjRPccx76b/oloOvlt0+5zFLLIF1DNwSZ2/WIf+IU7KtwTiUt5BShyrqEw/383D05KTaPGQGFjpW0rozHYxEsVTesBm6v+r27iV9TD3OfICE/QNsLdPCIyjGUaV6mtlHBAfwthmQmBi6yNmOnQ/9F3saftQn4CgpNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehLA4x5CNAUoyPN7SOlV8lVmFAdHvptm88ghkQ8wJhQ=;
 b=GgJUl1jQBHViIH38TsFW62lvLkNRy8iNdMPqkq1VBCPtBReOgIx8Xg1xK+ZxNhrX5Y1iATd7BZG8mS1mgVqTRLx1CJGixL1DEyQ90vVFQk4rkksxTAG2/ppkFlQWc/xMhg/JgI3+ZfQj4zw6BecpGekYhX9NFFVj5L3tDaNwxZA=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210429221223.28348-1-andrew.cooper3@citrix.com>
 <4781e8f1-d70b-2736-364c-eeed61869031@suse.com>
 <5b1938c7-408a-5912-7e66-b5e207e268bd@citrix.com>
 <1150e1b5-c6a1-7685-8775-0e4039dbc903@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Always have CR4.PKE set in HVM context
Message-ID: <d7628aff-78e5-c557-0498-b7a60a756b89@citrix.com>
Date: Fri, 30 Apr 2021 15:37:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1150e1b5-c6a1-7685-8775-0e4039dbc903@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0352.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c359654-2eeb-45af-00d4-08d90be574e6
X-MS-TrafficTypeDiagnostic: BY5PR03MB5346:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB53468353295C6529111FCE9BBA5E9@BY5PR03MB5346.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJPyuEmGLZ2tVvQO7uDkcJyoX9bEm4JvvRByfkrTEzOnaRNnwqnc+SpqO0klYOz9U5RiXGxY+KgoyR6+aOwd0jc99vIRhao1UhM5TVOtax8KqXPZwzqocvRgGzCZPxF5tkkRXeYzpzNoZtK1h/D4EkQPB1/j3mtzbau+W9S57cA+zGQEHj6YyksyKPGHvZLfQsH7dkkHVIbxW/eOedDP8T1rdsvXLnnsc1I3lY4EeWbJy0L6ZxLKP7KGNcEkX/8PaMVLv3Dq3YZYyCSR79h0J3pVrp1nY0aL8UDvW4ekp/rmGaNEAm5ClWC59vgjqOlA4AIQkWXUsqnvKQi7Ydou1fV0cWXnTlt6ThURgPraCZKNeIOFtfe2uWSmDpuSvqjTA8meWw6q+Nqx0DZhHN6Zt//rogu/4TtqhH8AG+RRuFQ9zADG3qCupq8uVplsImfz3W3BmKy2cV5TkkwIpgyBHQACcIXit0CTG/QkTmom+xHmUpQtpDwz0ZK2fSI+SRYkH6zNttNRfv5onSv36LpsDaHc9RXtzzc4M7QQgKBNoNFK7/8xWF1i3g4RJHjjZ02dTrXQ0TPy4+/KMwhKA1hIYkydgQJy7rxeDdW8kfBvoke672FKZDW+5GTmYJOjmcaH9IPO8xex6g2Nr6ceb4rQoTuqWoqqii61V3hhV5vzL7nhztk4hZND6WHMNeZAonCc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(54906003)(16576012)(316002)(6916009)(83380400001)(31686004)(36756003)(5660300002)(86362001)(8936002)(4326008)(6486002)(66556008)(478600001)(38100700002)(66476007)(66946007)(8676002)(53546011)(26005)(31696002)(6666004)(2616005)(956004)(2906002)(186003)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEVpNmxIOWppbTRlVjIxT3B3TTVHV1ljWXhYL3gxeGsrUEJXR3B0VEtzb2sx?=
 =?utf-8?B?ak9BaCs1dXdEWWtXMTh4WFEyOTl2WWNlM1ZSbWRiYi9WZ0Z6QVIySnRVMUh3?=
 =?utf-8?B?ZDFsV0JPRGJ0cnpkNVZNcXoxbGlRTENXMGRYMmg5blNHMkZVWTZzdDZDSHE1?=
 =?utf-8?B?QlVkVEd5VGxMVTFNcEZ0RnBBSUpSaEJxYzUxVDFJVVpPYTRFREpISzAvcHJW?=
 =?utf-8?B?czA5dUwyc0ZFNXJ6SzdITVh3eG85R0Z6WTlLV0RtVit6cjJXclV6ak1jeitE?=
 =?utf-8?B?bXk0bEMrL2pwbE9vcWdKNzNuN0JHQjZWL29YTVdxcWtvb1QvelNQSWUzTnJ5?=
 =?utf-8?B?d0hxVDhTeUJLVm9xUlRad3JrNWhIdXlqK2dGZ1RCZmRWOTdIZmV0bFBpR0lQ?=
 =?utf-8?B?Tmg3VVhEVEdya2sxQXFnRGRoc0xvQlhib21NQWRibDBzUTNhOG5pRG9zZjZF?=
 =?utf-8?B?aGNvQW43MXlPbGJhdmRXOWt1RzhMUFNBVUh1OHY0OGhFR0NINGxuWnZ0ZTNo?=
 =?utf-8?B?ajdkTHRyMHR0cEZGK1NSVzdmTGRwOFZpL3N5RVV5YVlIZk4xYTUwRXZOTm5r?=
 =?utf-8?B?ZW1Wd2R2N3FSeXJWOVdNNG5EOER3MS9DVEdVcUVHV3h5TFZHcWZXTExKYTkx?=
 =?utf-8?B?Sjk5Vmk3YmpDVjZXYlhkSzBWaFdRK1NBbGh6blNmQ21hdjJMZEFDakNuaXEw?=
 =?utf-8?B?Ky9INnFieDRqS2RvM0h1eGJiWGF6SWxhdEJxU2QyTS9DNDBydVA5UngzcXBY?=
 =?utf-8?B?YnZkeDQ0bmJmY25zWEtiVXRTaHlpVHhtRXNLWURiNE51UlNid0YxZ0VhVHR4?=
 =?utf-8?B?aWZEb3VZNEVrSmNKeExHdGxEL2JkUVhTUXFjYzNhRlJpNTJodUo0cllWdXhi?=
 =?utf-8?B?WWpTRFpOODVqZlVWWFZvcEdLL05pdGF0QTlCOWFCcnFESmRMZ25kOXh2UnV4?=
 =?utf-8?B?Y2VmRUVCb3hCVXZuYW1QZzJLTjkwamNBM2NLamhtVVFzOVNhbE95VXZjTVRV?=
 =?utf-8?B?dkV4eE1nbmJzZlloWWZyYnIyTk5lWTdpOE1sellXODFmSXNVRExoa3U4NnV6?=
 =?utf-8?B?TGNCdVhVRXlpUFE3MHlFczhteGFHOTQwclExVHl3T3g1SGZIRVhPbEVDODBv?=
 =?utf-8?B?UjV5TFE0bUNoS3hPNmRVb1gvczFkdzY3SC9jU3l4R2xzRTN6ajdKdW1WclRO?=
 =?utf-8?B?Q3NQUWFPM2dLa1VnTU5mQTNpMmluT3d3ODVlcFpvZENnQjlNTFZmRlJpNi9C?=
 =?utf-8?B?Y0ZOWGl0NlNHUXRyLzI2QVAzS096M1NCL2NXSklNRnE5SVdiR3NvR0JSVVFL?=
 =?utf-8?B?Y0hsM3NQQ3pMUisvRUlvWGZCRnQwY3FVcFgxQWFmNnFlL1ZkTlRqd0NSdzNJ?=
 =?utf-8?B?Y2J5a3hpaGh1TWh1S05IY2p6RXIzcUF2Ky85a0VzbjdnTU9wY1FZRGJPQUhG?=
 =?utf-8?B?Si9idjdYR1U0YWZiQU8yM0FIb2tQT1NkVER4NDA4aUhHc21YL2JmMFR6STVY?=
 =?utf-8?B?YWlxVG9qSElOZWoxcEVVM0JETy9pUVZNb1VKOXRMTEpaQVRzdVQzMXdTeGVY?=
 =?utf-8?B?c016aCtGSU5uVmFBdE9CWUpJK3F5eTl1S3czS0Zmc2UwbkM4QmtIL3FnU0sx?=
 =?utf-8?B?TUZ3b1ZxR0EvaVEwRUNkekV5QlAweVdXR0RKc21jS1pBVXZwSGFyNmVieVBt?=
 =?utf-8?B?N3BwWU9wTE1KQVVSMy9pTzc1UGZRZTUzQnNpL3FmQVNMaVpYaWpmZTlzSjhq?=
 =?utf-8?Q?vx371etRe7sYr6mEUbjlZt7vU5LvLF87lisv6gF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c359654-2eeb-45af-00d4-08d90be574e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 14:37:18.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKPIlwJJ5hs7t5m2LNgZKzp/gCfyWq1Y/KdI+jljhUeTFY6YUORwI1ClqXvedS2Xo0qR6Z6Z4Stls2WxsX9UVQmFI3r+DnxR+5oDIZiP8OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5346
X-OriginatorOrg: citrix.com

On 30/04/2021 11:42, Jan Beulich wrote:
> On 30.04.2021 12:21, Andrew Cooper wrote:
>> On 30/04/2021 10:08, Jan Beulich wrote:
>>> On 30.04.2021 00:12, Andrew Cooper wrote:
>>>> The sole user of read_pkru() is the emulated pagewalk, and guarded beh=
ind
>>>> guest_pku_enabled() which restricts the path to HVM (hap, even) contex=
t only.
>>>>
>>>> The commentary in read_pkru() concerning _PAGE_GNTTAB overlapping with
>>>> _PAGE_PKEY_BITS is only applicable to PV guests.
>>>>
>>>> The context switch path, via write_ptbase() unconditionally writes CR4=
 on any
>>>> context switch.
>>>>
>>>> Therefore, we can guarantee to separate CR4.PKE between PV and HVM con=
text at
>>>> no extra cost.  Set PKE in mmu_cr4_features on boot, so it becomes set=
 in HVM
>>>> context, and clear it in pv_make_cr4().
>>>>
>>>> Rename read_pkru() to rdpkru() now that it is a simple wrapper around =
the
>>>> instruction.  This saves two CR4 writes on every pagewalk, which typic=
ally
>>>> occur more than one per emulation.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> The changes looks perfectly fine to me, but I still feel urged to make
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> conditional upon my "x86emul: support RDPKRU/WRPKRU" (submitted exactly
>>> half a year ago) going in first, unless there were to be review comment=
s
>>> making extensive rework necessary. In the absence of such review
>>> feedback, I consider it pretty inappropriate for me to do rebasing work
>>> (no matter that this would be largely mechanical afaics) here for a
>>> patch which has been pending and effectively ignored for so long. (The
>>> main thing that immediately struck me as odd was "The sole user of
>>> read_pkru() is ...".)
>> So the observation about "sole user" occurred to me too, right after I
>> sent this.=C2=A0 Then I thought "surely Jan has spotted this and done a =
patch
>> for it".
>>
>> Presumably you're talking about "x86emul: support RDPKRU/WRPKRU" from
>> Oct 30th ?=C2=A0 I found that via the archives, but I literally don't ha=
ve a
>> copy in my inbox.
> Odd. Was that then the time of your severe email issues, and were your
> IT folks not even able to make sure pending email got delivered
> afterwards (or at least enumerate what emails got discarded)? If I had
> got a reply saying the mail couldn't be delivered, I surely would have
> resent it.
>
> Just to be sure - you seem to have got a copy of "x86emul: de-duplicate
> scatters to the same linear address", as I seem to recall you responding
> there, albeit not with an ack or anything I could actually act upon (and
> this might have been in irc). That was sent just a few days later, and
> suffers a similar stall. And while in a ping I did say I would commit it
> without ack, I'm really hesitant to do so there. I've put it on next
> week's community meeting's agenda, just in case.

I do recall that patch.

>
>> If I do the rebase, are you happy for this patch to stay as it is (so
>> the complicated change concerning context switching doesn't get more
>> complicated), and so we're not knowingly adding new constructs which
>> need immediate changes?
> Well, the answer is not just "yes", but in reality I wouldn't mind
> doing the rebasing myself, if only I knew it wasn't for the purpose of
> waiting another half year for an ack (or otherwise).

The patch itself looks entirely fine.=C2=A0 Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

The only observation I've got is that the other instructions in Grp7
probably want a blanket conversion from generate_exception_if(vex.pfx,
EXC_UD); to use the unimplemented_insn path instead, but that's clearly
further work.

I'll commit this patch, and the rebase delta on yours ought to just be
the naming of the helpers.

~Andrew


