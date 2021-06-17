Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788523AB7A8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 17:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144077.265258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltu5K-0001sj-21; Thu, 17 Jun 2021 15:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144077.265258; Thu, 17 Jun 2021 15:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltu5J-0001q4-Uq; Thu, 17 Jun 2021 15:37:37 +0000
Received: by outflank-mailman (input) for mailman id 144077;
 Thu, 17 Jun 2021 15:37:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqVH=LL=prevas.dk=rasmus.villemoes@srs-us1.protection.inumbo.net>)
 id 1ltu5H-0001py-FD
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 15:37:35 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.126]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6985290b-19a9-4234-a427-b80d500f5820;
 Thu, 17 Jun 2021 15:37:33 +0000 (UTC)
Received: from AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:2f::12)
 by AS8PR10MB4791.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:33e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 15:37:32 +0000
Received: from AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::78e7:758a:9dd5:6b52]) by AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::78e7:758a:9dd5:6b52%7]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 15:37:32 +0000
Received: from [192.168.1.149] (80.208.64.110) by
 AM6PR08CA0043.eurprd08.prod.outlook.com (2603:10a6:20b:c0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 15:37:31 +0000
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
X-Inumbo-ID: 6985290b-19a9-4234-a427-b80d500f5820
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QC4dW4HGsfDhQi0lzjYmgPTDbo7QHaySiMf+5R5Xubfhhq46X2UhlK8Mxm97X6KzEmFedPCpEDMdTaoEjuiYyGoWJtqHDpU525RuLJ1bQukq95i7xGL+JxO4F9NlnMi8KFH7uBN/QTtSuG+r2ephKjXslhSDqmI4qQmLgwHyb18PMMsfbJ4G4liDM+rYhIODNWYuo/W6xydMuVG1Ir1sSUZ7DbGnK8GjipUbGnZzIujKYl/mi9pv4G1izOCHdap/FCwi3OIdUBwDweielzSMhPBL5y3E4ZXPLAzTodNHVVnXBP62YIhJGt5VVqPonE8NDEmsbvDcE/oNA8qi1lb6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT85gP+YFDJ5ychGyvNL82kun+NGGvSQi4A8qTsyAT8=;
 b=Jn6IFoWJfr+zFnIgc8XwjnBTU0TkPecvTEejS773agklIsIOBhksDQeOQTuRWM6BFhP6zocssXx/chE/9xIPdQfk1KO3Ya9mKrXwjh+cjDU1JxT4ChayuxWg6fnuLiPCPJHfYQ45uRXsqJ31CFvGVTJ4Xebzra51V2hcNH5EJKq5CaIzRctMuRJeHc0RUC52SFekSyfKXJoowm1qoNhQ19uDV7CtPucV1+TDinqJKzSu3vQkczE+egxtRSKy7DamA+3JgbFmUKYpjN7yLBV1rStuEb3JXPSK507s83SCxiTDrI9hpXRAfvSHpEvtNFdLtYrZwaAh5ILkBWaO+8Vmng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT85gP+YFDJ5ychGyvNL82kun+NGGvSQi4A8qTsyAT8=;
 b=VkTLlQSKzaUXhIugrc3mHjVYLlF61MtgO05xG0WkZRGiYHPGmbsRzBeuTS7atxYnRLl+szj4FbKjPrR1h5O5b5GrFY5OKVYNwvUZCBhbBdQyPfF1NpchbV1Mb/chlw3UPt3w3VJ9pMRWBfebQAiG+h9uOQF/sRUgJsDpo04oDfU=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=prevas.dk;
Subject: Re: Linux 5.13-rc6 regression to 5.12.x: kernel OOM and panic during
 kernel boot in low memory Xen VM's (256MB assigned memory).
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it>
 <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <db3ee875-e299-e8ea-fed2-3b7dbf4682b4@prevas.dk>
Date: Thu, 17 Jun 2021 17:37:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [80.208.64.110]
X-ClientProxiedBy: AM6PR08CA0043.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::31) To AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:2f::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0947b78-09b1-49eb-4696-08d931a5d27c
X-MS-TrafficTypeDiagnostic: AS8PR10MB4791:
X-Microsoft-Antispam-PRVS:
	<AS8PR10MB479105EA042A48502224AAA5930E9@AS8PR10MB4791.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VxBFm0hoMOQp9GwmC//o5Ved+LeuyoLsDaG7Vw7FspA1HBDxp/6eBjAq5m+XGGTL4K5gmyceYhfQZj3BMO3hC9oYsIgQsYNXKxy+knFOwAwDATWYJYnJQ0tpqgWDGkdGlf8vpvFdFaixi03kdo9bQvxyGAUGXfsd8hv+vTRvRSmjBxHSq7u+D6dBi7x7MJh3RDsKlU0z2agzeYPzKfqd2XivO8m6sTYpO8Azaglvm8S8Gt5lx46ed/XTFZ7vnF/ZdpfLPVruv6jShfu94T4QeYvCo3Nqm0bUw6LO7ann4DUqxmni5JcgBf6WgpviNMQ24O/74J4HUpfPLsicl80hr0IitwUy/NKNHROJ4LTcGmejSkXhkChv7YJshKZp0pVFTW6y3t7NDS2+5ULOmdRaaLno4nJ2uagkbC9DDFqHZ+cElCc9Ob3e6JAzv36Psbxnbqmg3T4TwUtIvSrWddCr4ImHheFFr100hUr+37m4Geh/x6kiX3rnHxidO6h8kywJjaTAIaPeLdnN84dGT1FDWaln8JJ6a9PwiC8AQMW/UfrcePRUJEDH6SUtIlAkjBxr4KLraIsk5dVjlw72N0ZoFXxxvqIU55+e25BWU9e0eLVkGcybjaOZRaRkYwC+wD4+B79WvYVgUIEDteRuq2OgMuobSbZd1Zd61hXIy9X8ORDcuyDyiNoSh/rzMgStZwcAP7t9JmZQS3h5zfkyV3n1TK5kA/0QQyIj70RFGWRhCCR1vXnpXtBP7PNN2aPAZ20sVbRzfQNQUMq2h8W9kf3hedcihcPLxQbV6uAJ3iyzKbDdZ/8sE/aJZGEdCvfg68IDbwyGh9zyO+MaUkO3rtB9ZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(346002)(396003)(39840400004)(186003)(66946007)(8676002)(66556008)(956004)(66476007)(16576012)(31686004)(53546011)(38100700002)(16526019)(38350700002)(4326008)(8976002)(54906003)(6486002)(52116002)(2616005)(36756003)(83380400001)(31696002)(8936002)(110136005)(5660300002)(316002)(26005)(44832011)(966005)(86362001)(2906002)(478600001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUpId09BdkNUWnlWUmJPU25tZHpNWnpjcGtsWlNLeUF6bENiWGZvYkVkTytQ?=
 =?utf-8?B?d05jNjJicDdkcFFwczU3YlU2R0ovd3RFVks2U0orem1yRDM2SVdSSGRTRThV?=
 =?utf-8?B?akE5K2xLYjZyaHhQSURkK2JUc1N2RzRoNW1Oa2RTazdrMnNTL1VtOUQvQjdJ?=
 =?utf-8?B?NHlFS3V5SXJOOVovSkFtUkpSLzREdkdaeXpuYWFUOGtzd2s4TDVLYnlLdk4y?=
 =?utf-8?B?NnNDeGx4ZzBmTjVzMURnTW96YytMVkZmbUc5OE01aHB6bURaSFdYYWlRWlox?=
 =?utf-8?B?Q3MwTldMdGFRNmpjcmNWSUJWb3NGN1ExeHhOVXMzSnl6RmRQUUVNTzlsMWti?=
 =?utf-8?B?NjhLZGlDeXQxSVhGeHZRNmdxaGd4eENlUmtlRktQd21VYVZ2Y01DOFByYVA1?=
 =?utf-8?B?TXZ6NjhZOGQrNUYvR0Rtb0kwaXU5TDA2dS9JUGhQR3dYelVvVlZYVFByWCt1?=
 =?utf-8?B?dU1ZOW02d0VFdSs5bnMvVlRDZmRaQStVU1ZUdktXYWp5TkhVWElyZEthZUh6?=
 =?utf-8?B?Rkh6VDI2S3ZtQkNzQW04S0NQeFVNZVpVc2tLaFU0MWlxblhXbVRqRTlyMWR5?=
 =?utf-8?B?cktoWTdqMDZXVlJNZENMVmppbHo1VzdUdjUxSXJIaVpYbVlmZHZLaEw3a3pt?=
 =?utf-8?B?bnpTY3R4YVhTMFlRK0tLci9zTitRNzFQaFVpSlg4cFVUWitPL09meUJPbHB2?=
 =?utf-8?B?a2FpcWpSbWZnYlZMeEdsWGJpR2RQMnJXd0x0WGdxRXZLNnQ5VlhncEtrbEpZ?=
 =?utf-8?B?d1JEVU0ybUV6NzcrOHFMK2prbDNDbjk1ZURoeHQxYkFINnRzb3BxSWQxRXpy?=
 =?utf-8?B?U3RJSzF0SlBpam51WVBqOXBNektiTEFJNk9pOUw1Ym9wNWR2MURrME1uV21l?=
 =?utf-8?B?ZWFBcnhCcHdjWjkxVHJLaENSei95OVlwY3RaVzMzVzRXRGt0UWJyazFINGZ1?=
 =?utf-8?B?UWVEeGF3UjBNdkRQNzBDQXBOdFNId3VnWlZCL3N3WUxuUFBQK3hCOG0xUkI0?=
 =?utf-8?B?RjRyb3RlMWN5VVpGTWFvaHpXbWxudnFJK0ZEVGZuNWFjR2ptRHpQSUE1Z1BR?=
 =?utf-8?B?Vkl0NW4xSXowWHZVZXB0b2NqVE03ZnByd3p6WnZPenRMYXE1L2VMY1I3T1Jx?=
 =?utf-8?B?d0VYTU13a3pnUmhCdkZEeVp1bUh1ZUlTQmxWMGx1YnBGQVpZR3pKU2N6T1JY?=
 =?utf-8?B?UjVzSXBlb3YzdncyYkJScFA0L2tIWHhqb3QvRGZ5amdqbTVXaDZjSWZwL091?=
 =?utf-8?B?Vzc4NnVZUDloN0VJYnhxSS9xRnJLd0VuS2lMbnZlanlPYlREU2xxTTcyM3Q4?=
 =?utf-8?B?eDhwNnJBVWRLMVpFUkNLT0t5TWxJR3RwdHlJdEE5WlQxVW42MXlSR2Z5M1A5?=
 =?utf-8?B?cXJIWXV2ZFFlRkpnejd0N0hVUlB6Z2J1d3VwVHladFFIRVlJbzRIa2tHYUtt?=
 =?utf-8?B?UjE2TlFNL0laYUc0TEJBMjBuY1JWekNXUUxxSXFvSklGbFpWalkvWDRtZ1Fs?=
 =?utf-8?B?T2k4U1ZVRWN5Rmh6QjF1bWowSmhwSk9qV05SV04wVFczR3ZBWXpKM0ZpN0hO?=
 =?utf-8?B?cXNuOTZZcVNoZEt0TUVWTHJZTUpNUWlHOEZkd2RFU3lDTTZGUHJHbUJzdGc2?=
 =?utf-8?B?TnRvZmV1M204ZWZIS1RGYkxBZjQwS0ZKbmFVb1Y5QkpYckdva3dMTEYvUUVI?=
 =?utf-8?B?cXkvSTNjT2RPUVg5OVZsYXl6UlFlNG1NaUdYWlFHSXo0ZE13ZmlROC9aV3cx?=
 =?utf-8?Q?AWpDGZ/5ht3R4M7Q3vnvlhivGsJkcesDF171BwV?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: a0947b78-09b1-49eb-4696-08d931a5d27c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:37:32.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxjApnHbKqKS35j3BPDY+yhhYME7TGNuQLJxBhAxHImoqR5oGEAEku7PlN90JY05oMNY7VzDWUrz5lzWnbc3UXn9cXIgz2woArXns7kGv6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4791

On 17/06/2021 17.01, Linus Torvalds wrote:
> On Thu, Jun 17, 2021 at 2:26 AM Sander Eikelenboom <linux@eikelenboom.it> wrote:
>>
>> I just tried to upgrade and test the linux kernel going from the 5.12 kernel series to 5.13-rc6 on my homeserver with Xen, but ran in some trouble.
>>
>> Some VM's boot fine (with more than 256MB memory assigned), but the smaller (memory wise) PVH ones crash during kernel boot due to OOM.
>> Booting VM's with 5.12(.9) kernel still works fine, also when dom0 is running 5.13-rc6 (but it has more memory assigned, so that is not unexpected).
> 
> Adding Rasmus to the cc, because this looks kind of like the async
> roofs population thing that caused some other oom issues too.

Yes, that looks like the same issue.

> Rasmus? Original report here:
> 
>    https://lore.kernel.org/lkml/ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it/
> 
> I do find it odd that we'd be running out of memory so early..

Indeed. It would be nice to know if these also reproduce with
initramfs_async=0 on the command line.

But what is even more curious is that in the other report
(https://lore.kernel.org/lkml/20210607144419.GA23706@xsang-OptiPlex-9020/),
it seemed to trigger with _more_ memory - though I may be misreading
what Oliver was telling me:

> please be noted that we use 'vmalloc=512M' for both parent and this
commit.
> since it's ok on parent but oom on this commit, we want to send this
report
> to show the potential problem of the commit on some cases.
>
> we also tested by changing to use 'vmalloc=128M', it will succeed.

Those tests were done in a VM with 16G memory, and then he also wrote

> we also tried to follow exactly above steps to test on
> some local machine (8G memory), but cannot reproduce.

Are there some special rules for what memory pools PID1 versus the
kworker threads can dip into?


Side note: I also had a ppc64 report with different symptoms (the
initramfs was corrupted), but that turned out to also reproduce with
e7cb072eb98 reverted, so that is likely unrelated. But just FTR that
thread is here:
https://lore.kernel.org/lkml/CA+QYu4qxf2CYe2gC6EYnOHXPKS-+cEXL=MnUvqRFaN7W1i6ahQ@mail.gmail.com/

Rasmus

