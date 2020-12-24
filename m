Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E02E2883
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 19:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58791.103602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksV8v-0003qk-5V; Thu, 24 Dec 2020 18:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58791.103602; Thu, 24 Dec 2020 18:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksV8v-0003qK-2M; Thu, 24 Dec 2020 18:15:17 +0000
Received: by outflank-mailman (input) for mailman id 58791;
 Thu, 24 Dec 2020 18:15:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JomI=F4=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ksV8t-0003qC-5w
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 18:15:15 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 106c3f48-eca4-4aba-ae03-620bdfada89b;
 Thu, 24 Dec 2020 18:15:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r7so2776439wrc.5
 for <xen-devel@lists.xenproject.org>; Thu, 24 Dec 2020 10:15:14 -0800 (PST)
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
X-Inumbo-ID: 106c3f48-eca4-4aba-ae03-620bdfada89b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5U3LZAIfvUK71X2+Wv2T6aQ7TvG8XEkbwuLTugkLod0=;
        b=FNriO7Mefu0Ec4ruYKQuE+/C9w9a/MTK7kstysVM81cvjpM4QZ+Ebhdr6vlwXdQPZ1
         HzBOkCJFLmrFzVGpFvntL6pHzne0DtGmDtpk+aqTheNl1oqyON9ry9VkS+06zUyyo+hX
         aAornYfEgupi3fS85SpKct5940cFtAT/J9Z8H8dneA+O1+hEy1crSQZaO69cSvNtq41n
         z2kqmEi5wQxJUQE5hKrHMmnW4IHEBChIWFwBqmHYp+7Pd8ebeXQgvTNDoRDKxWvGpJv5
         DrxDKLonXrIrpuJF/zc5pv5whkK1N25XKnQw18Muce0hLroFDGYKGvxb9/OvHtsfmWeh
         akkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5U3LZAIfvUK71X2+Wv2T6aQ7TvG8XEkbwuLTugkLod0=;
        b=uap1ySYH0Gsoh9VAEdEOW2DAvFQGpCIFk4OXUqDasjmOsWlofa49+dXje+erWXPSV4
         9vrRb2cM7C+TjFKxeg7UoZojJI9zyNHpjrh0iz3acZtCTtieti1xikPVnBhD2OTt5P8M
         gxyJV4sZfM8DajFhcSHnlj9/3AJhdiMr/HKbPBksoreJ58mFedpyNxGEYhSshLylyIqF
         XxVDBAVxKT5rFID/txn0ttx+aAOoc0J2UYm9oe6ynO12XNoR0fS0dXO5P3G/tY5xyFZ9
         hGKYHpP4Kzc13SqcXPM3HrDlQWEBjzrAxah9ojPRJqS//NhPZticDvRKe70mYlgTFp45
         trog==
X-Gm-Message-State: AOAM530sugJqAbWYKORFjj9KzGMRXRmRzoA0kCMWD8HroSFbuSgbRlZu
	IV0oooGJAaIOqtrPtBxCY3iyDP5DX+ZRvOePymE=
X-Google-Smtp-Source: ABdhPJzpWuk8e04Hi+NAAY6lTkPlqLvVk9y0ZiHuP1xGPzY0+BiY9q3+U7TC18bVpNP9tvorp24FZ1AsHdUukqgz/Lc=
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr35444207wrr.326.1608833713476;
 Thu, 24 Dec 2020 10:15:13 -0800 (PST)
MIME-Version: 1.0
References: <20201224164953.32357-1-julien@xen.org> <0d592001-66de-4582-f7a1-6ee56cbe7c27@citrix.com>
 <11aad53b-2fca-d893-0897-532e5ac4248c@xen.org> <e5e73b9c-5653-7333-b252-0bcb1f7ebb20@citrix.com>
In-Reply-To: <e5e73b9c-5653-7333-b252-0bcb1f7ebb20@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 24 Dec 2020 18:15:02 +0000
Message-ID: <CAJ=z9a0VB8=za70W7Fsq1GrGXnXRgGzb1RDESbcovRrjf=c_xg@mail.gmail.com>
Subject: Re: [PATCH] xen/iommu: smmu: Rework how the SMMU version is detected
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Dec 2020 at 17:39, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 24/12/2020 17:10, Julien Grall wrote:
> >
> >
> > On 24/12/2020 17:00, Andrew Cooper wrote:
> >> On 24/12/2020 16:49, Julien Grall wrote:
> >>> From: Julien Grall <jgrall@amazon.com>
> >>>
> >>> Clang 11 will throw the following error:
> >>>
> >>> smmu.c:2284:18: error: cast to smaller integer type 'enum
> >>> arm_smmu_arch_version' from 'const void *'
> >>> [-Werror,-Wvoid-pointer-to-enum-cast]
> >>>          smmu->version = (enum arm_smmu_arch_version)of_id->data;
> >>>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>
> >>> The error can be prevented by introduce static variable for each SMMU
> >>> version and store a pointer for each of them.
> >>>
> >>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> >>
> >> You can also fix this by casting through (uintptr_t) instead of (enum
> >> arm_smmu_arch_version), which wouldn't involve an extra indirection.
> >
> > I thought about using a different cast, but it feels just papering
> > over the issue.
> >
> > But I don't see what's the problem with the extra indirection... It is
> > self-contained and only used during the IOMMU initialization.
>
> Well - its extra .rodata for the sake of satisfying the compiler in a
> specific way.

You are making the assumption that I wrote this way only to make the compiler
happy. :)

While the patch was originally written because of the compiler, we will need to
introduce some workaround. So the enum is going to be transformed to a
structure.

I thought about introducing the structure now, but I felt it was more
controversial
than this approach.

>
> Irrespective, all of this looks like it ought to be initdata rather than
> runtime data, which is probably a bigger deal than worrying about one
> extra pointer access.

I thought about that. However, not all the users are in __init yet. So this
would technically be a layer violation (runtime function should not
use init variable).

In practice, I think all the users could be in init. I will check and send a
patch.

Cheers,

