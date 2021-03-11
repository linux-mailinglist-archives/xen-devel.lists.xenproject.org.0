Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A336F337957
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 17:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96692.183227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKOCQ-0003wH-Rw; Thu, 11 Mar 2021 16:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96692.183227; Thu, 11 Mar 2021 16:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKOCQ-0003vs-Of; Thu, 11 Mar 2021 16:30:10 +0000
Received: by outflank-mailman (input) for mailman id 96692;
 Thu, 11 Mar 2021 16:30:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKOCO-0003vn-8F
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:30:08 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77b171b3-7793-472f-9fc7-de0bb15978ca;
 Thu, 11 Mar 2021 16:30:06 +0000 (UTC)
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
X-Inumbo-ID: 77b171b3-7793-472f-9fc7-de0bb15978ca
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615480205;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tBcIU/uUffBCBTbsnTyDv6UE1JAX76nM2wvPks34Y3o=;
  b=a+hHEJcZUHGYCNz+kAomziEZGn8FpaBQ4LtntWXQur5weG8amlb83oTx
   tUcd2NR2OZOCW1oQ8/nSFgbBcglJIWAZjSrvuht340HAFhBjT6SZTgUNU
   96KomuuVWdYVXhf52kRcFCBhM9zYyj2LR+ORtKCqnBKde1Cjx+i3ue9qH
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: z+N+NGt3BpVnJFWIh1F0EkkhW4vw3sxGEZmGPtRMZpQk4UmFP/eaHI7y4GJh3A4pEQdrrHmKpa
 qe8zZxqMFN5501yUHghHouYiK8Y1npBtHRtoVwf61VLOxpxgK3AOxj1ccURQWztBz+5YAfYHXz
 /OeYa1UpJMRSD8HctUk9upwH3Pjf+eamVwKQwAjNYGERBDVf/vJAnNFM/NzpuuM+kMF/OO9tVn
 edmeDU2dnZeaLB19Wc6+ZLV0CTaCawAhWSBzRaO4z8kqTvXrow6j3sUQkrIDzkOXlrDeT/qP7P
 0gs=
X-SBRS: 5.2
X-MesageID: 39436879
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:e/rDgqrOh19NVVg6bWNMOjYaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.81,241,1610427600"; 
   d="scan'208";a="39436879"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5uRLxMBq/ilq4k/ErNlN9b+HK5cB+kC4WK+S6EhtecBRXnxc2WzF07KORZae4m6jpCT9G4j1J34cFJbzdblmN4ns76xXfSC0zS43Y+JoaRC1OGHKljcf9GAUjn2axkx4JeVqdUfaf1jY/e+y44icZJDYkMts9GeDbnNkSdYefhg4mBMUDYj9fnIprldeDmkB/a5q0EVKHY2PIVax75clYPGUVahOaSmPE9dRsDf0Zmdt5rPwbOQJNxDCoo/pu46kCSCn50sGpuj/XQlI5xQC3BYgir4Lq1xhkzRhZaNmSA810Ero6EF3lftk0ejbMj7E7JB272TUiUa5h2Pz2FJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ldEafCVFZbmjJ0KDRx6tD8FfKkQZCByBg8+UiYZVbY=;
 b=MyI/3rxlnhLo0JCnl1wiHHs74a4ZQBXbWUotqNsPX4vW3Ly/kJpgKDgjn01S6N8mPrb8AH0vJBNGnRGAtspX63+3BDPA1CgKVwqJnpOgDExbrpcmpMILCVt6wqxKM/K5ARNiL4Cqis+XQWHXj8VxyVgPmG3929et/b9ilF+JItobbqTQ+FO988XP7MS199gyLjqN6n+Cq1nNCwbl2Tw2QH3iLOfFmek9zIKhR8BPRG1Vo2zje6TUkEngomxrWn5EthubDc653EeUHB2g6D9wti1Q9oTNaQP+RtQ1tCk/JYP/yjlLUf6pLrzCMKK3I/HE7N1q70RpmmBqHQhBJF3/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ldEafCVFZbmjJ0KDRx6tD8FfKkQZCByBg8+UiYZVbY=;
 b=ikKSDlloaxqE0fcweAVQ3G5YsYGEjL6AwitykSGyiZf0F6GZAkurabBmQQnhEnXQT9AcQCIsvpPvksiiAmC7MRu3NsYZh8PbnCsvqvwpyWUPRwXGA/38hzlmbocDfRPyA0U4poNwoPQO+FZ03SazMy+FpI8KuRtOCuqjUcE+40Q=
Date: Thu, 11 Mar 2021 17:29:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: fix for_each_cpu when NR_CPUS=1
Message-ID: <YEpFaqvfecs760Au@Air-de-Roger>
References: <161545564302.24868.14477928469038686899.stgit@Wayrath>
 <9cc6f3ff-f078-1657-7c5a-9f356a857cdb@suse.com>
 <fc6cf1a2e27fc2c62152e7772be01fac4e9acc50.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc6cf1a2e27fc2c62152e7772be01fac4e9acc50.camel@suse.com>
X-ClientProxiedBy: LO2P265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 031cc694-08c7-461f-2053-08d8e4aadba5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4474:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4474723C87FC23D2403BDAB28F909@DM6PR03MB4474.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d9FEVtUYecBBQ7GJXq/1A3BmrrJNcLJ3KRkYmHtX+HKNVFYqVMHAPWamxTOmu25PG5UBlHmbcnj57w4xEAoK8L3qfkuk5/qCZxcDw+M1eYD7j+5f0TKGVTaO/hQERpG1vjuQOh6fuQiB26CEz5HseN7qzOXXKrzJ+tMg07nB+IYDT5iPZjYVD0xt/a90oCFjjjrdgs+/Gt/sFSwvXnGLBD/J1/LWu3PgTqiUBBb/NMZ3tWOVBywTqOmdFZVocNvZRKvbQ5OqtXUyWsdBtFdJ9daCgeDl7ixfRqTwJ2XVlKP9vgpQstsKUSUtPMrmiTw/YnqZN+t4+xv5w75qw4OxV+GYvicvGyMFj//a2a8qjeIISJ8m4mkP/RVNYU0SJXtT/AkNEQYYEXzxnyjgvYFgyQUMmGoPi/kEubEEQzUKqfwcTDuDITAMjhbXkjH+Zds3cLufPwcL9GcF2+ygO7n8hGdHGFZd0U+V2B8cbUovHGHKeTzxY9Bb0f4uQM6qObBsBFHlK5Wf9o4zrJZ6IzsYVOKOptB+Q3WfOTyWPSfHQNWT3xik5ZTu+94NXSmdSOE31JLNSKmqCIw3awm+9gG9Vr03MfwmkXJJooeRz69b6vI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(346002)(39860400002)(136003)(366004)(966005)(6486002)(6496006)(8676002)(4326008)(316002)(8936002)(26005)(53546011)(86362001)(54906003)(16526019)(2906002)(186003)(5660300002)(9686003)(956004)(66476007)(6916009)(85182001)(6666004)(478600001)(66946007)(33716001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MThydktkTHU1SlFzbzhWallxTi9MUUlwMmtMOS84cmxIaW1YTUNsa3k3RS9G?=
 =?utf-8?B?OERWeFhYK1lORHg2R0FrazJyaWpWOGhCTllTVFh0UkZzZno0dko0N0lZb0JB?=
 =?utf-8?B?U3pmYzltdEtEZ3VldkpZWjdzdGRjRDUvdmp2LzYyMzgrQmtRRUVTZnY0bzV4?=
 =?utf-8?B?c2JWVlJwYWJTWk13ZU9kYmZ1T29sRy90em9GMXk0cW9EVVc0dlVRZ2dlWnZp?=
 =?utf-8?B?cG5UcjFOV1pjMFZta0hYaU1DbDlWelpFaDJQaWQzWkpmazJyeXU3S1pUbnJo?=
 =?utf-8?B?RVpoQkdnMXNnWS9pcElERFJLWFFuMHE3MTkza1JjQ1loWXozWUJHeWg4OUQr?=
 =?utf-8?B?cndudkVhSjYwNW02N241TGJBS2lLbzN5MEhBQklwcjgxSTRuVDVmVGRkWERF?=
 =?utf-8?B?QTNIUEVEVTE3T3BjU3VlYU1VckYrSjJSZ0JjakVock1YanVtWkhoTG55VWpE?=
 =?utf-8?B?L0VrVjloU1FWZVFHUDhId2hQK1loaTNFRElxUkowZitaaE5DWDFMOGpoRWZt?=
 =?utf-8?B?R3JHdExEeUVpYzIvR1NOTm90cjA2UXdGclRGM0FYcEFXcFpWcjRXSzVvOWxH?=
 =?utf-8?B?aGtGMnVSazBUa0pZZENvR2FOT2R5MFZ1N2s5Q2lwVzlickFOcE9MOHFOc0x0?=
 =?utf-8?B?ZmZGWWlyZTUzUjh6V0dwd0FEalN0NHJPaTNmRjE1V0h2dVVwajZHM1ZWN091?=
 =?utf-8?B?OVJqWmFLdUpZNjE3WTlEN1RtNU1SYUdwbWJqVjRPRXRwUXBqQVZhWlA3NFlC?=
 =?utf-8?B?TUkyVHBTT2ZTeERsZ2tyTE9qZzB2UnlUWUg2SmxIaWxWd2FwV2tSNTQ2WDlu?=
 =?utf-8?B?bTJja3hTNW1SRmhSMG5NcFZUYmJjcmhWdW52dmJWZTVRWXg1a0dEQVJwOERB?=
 =?utf-8?B?RmYyajU0allOSHNqZ0VPZ1hwUkQ3K2sxbVJjN1ExN2tHbmM2dGpJTkNYd2ZD?=
 =?utf-8?B?d0E1eVdSai8rR3dUdWdRUWRlOXBnMFhwbkNYcjdZWGxVUzdUZmVudmZZeGc5?=
 =?utf-8?B?akhzMFJKNzhjci9NZmJsY1c3WWtaMVYvdStZaVRXZEV2SHp4TldHOHhCeVhU?=
 =?utf-8?B?S0tDZlBab1R4Y3BzdktXT2x4WWIxTkZweDhUSmtpWWdrTEtLeCs5cTZ0dkFr?=
 =?utf-8?B?MzdneFY0dDZRMC9STjA2UXJrcSs5dEJwYUY0b0thN1FkUEhIRWpueE1HWHZU?=
 =?utf-8?B?TmdtQXNxR1NpYUJyb3FrL3hWcVhCQjFGMUp3ZTdRNnZCbEw0dlhWTGhNaUVG?=
 =?utf-8?B?RHg4OVJLckRSYnZoSC9wWWU2UXlHdVRuSStwRXloOXE3YXVHaGZGZU5Ca0Fl?=
 =?utf-8?B?Y01wVlNNdWxiTUljOFpMNkF0MlJMOWp3bEM1dnMveW5XaVcvT1pLamRGUi8v?=
 =?utf-8?B?MVlUWEpzMTlCL2FyYSs1QTlTR3NoZWNjaDBqNG5nRzcxM3ZnTEl5bHVsZXEy?=
 =?utf-8?B?L2VpSlJsTjAwWHkzUk1GT1ZZZVFReGU3YVh5dXA2T21CYkJxcVRBYlJhd3ZZ?=
 =?utf-8?B?amhTUmIvMm11cDBCNXhmRGVMK3NsUUQzeWRmVFNMK2J6RTU5QlNsN0xUY1hi?=
 =?utf-8?B?RmhpcitmWWpNVWI4VklVUUxtbWw0QlNiby9HeDBYaXlCVDBvV2FBcEg5S0lu?=
 =?utf-8?B?SVdFLytvV05qbmdpSVl1cm8ya0ZhbWtudWYxdk9MY2d6cERrV1F6dEQ5YU8v?=
 =?utf-8?B?UVVnQWt4aEM1cE1YVEN3M3lEcUtSZ1pWSmdHZmNWcU9uOEtZcFhMSm0zZmJB?=
 =?utf-8?B?R1hKaHN5bm1md0NDc2hFeE0vRitCa1h1eDFqQ0dsYXRvamF2T0M1ZkxFSUVq?=
 =?utf-8?B?ZjNHaDdiTHYxek0vdlA1QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 031cc694-08c7-461f-2053-08d8e4aadba5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 16:29:35.5461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Zp2wgebnobz/W60+A0C7FZZYSOYhQhV4sKyfBaGLZskMzTfFl9Q2QW6+Fwk98lNcSsUxNnxC/9tVWkqavPcpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4474
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 05:21:16PM +0100, Dario Faggioli wrote:
> On Thu, 2021-03-11 at 12:28 +0100, Jan Beulich wrote:
> > On 11.03.2021 10:40, Dario Faggioli wrote:
> > > 
> > > Removing the special casing of NR_CPUS == 1 makes things work again.
> > > 
> > > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > 
> > Doesn't this want a Reported-by: Roger?
> > 
> It definitely does! And I even forgot to Cc him... Sorry Roger :-(

No problem! Thanks for sending the patch.

> Will you add it, or do you want me to resubmit with it?
> 
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > 
> Thanks
> 
> > And FTR I don't really mind the other NR_CPUS == 1 piece of logic to
> > remain there.
> > 
> Ok. I agree with Juergen that they're totally useless, but at least
> they're not wrong.
> 
> Oh, BTW, since you mentioned in your other email the fact that this
> comes from Linux, I've had a look there and there's a comment in their
> cpumask.h file, under the NR_CPUS==1 define, looking like this:
> 
> /* Uniprocessor.  Assume all masks are "1". */
> 
> https://elixir.bootlin.com/linux/latest/source/include/linux/cpumask.h#L149
> 
> Of course, that does not make the fact that for_each_cpu and
> for_each_cpu_not are identical less weird, and the whole thing still
> does not make sense, at least not to me.
> 
> I'm wondering whether or not it is worth to report this to them too, as
> I have the impression that they just don't care.

I would report it, worse case they will just ignore, but it would be
nice to get it fixed there also, so that someone else doesn't have to
discover the same brokenness.

Roger.

