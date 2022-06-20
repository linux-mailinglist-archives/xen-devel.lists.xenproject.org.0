Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0CF551974
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 15:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352793.579654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3H63-00083Q-UZ; Mon, 20 Jun 2022 13:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352793.579654; Mon, 20 Jun 2022 13:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3H63-00081E-RB; Mon, 20 Jun 2022 13:05:39 +0000
Received: by outflank-mailman (input) for mailman id 352793;
 Mon, 20 Jun 2022 13:05:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t3Ah=W3=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1o3H61-000818-WB
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 13:05:38 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9939ff-f099-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 15:05:36 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id 128so3171396pfv.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jun 2022 06:05:36 -0700 (PDT)
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
X-Inumbo-ID: ac9939ff-f099-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5XCq3aw9mDW4vLXTuAFW7Gl3EWmIsDOrQpN5UmWv+fQ=;
        b=Ca8jZKgHlF+F7xawEGDXXVybMDyfFxCJfWeGe5rrwwK+Rr/qm6/8/qwL3VW1LiU64p
         AcKMG7+nf5bJxilwQH5VyjMsQwtFSDhsXeVw854pfdR5VsA5RgAuXoqiVWRKT2m1GH9Z
         ooA3NrC3nbLhKXvBQYIoZD9zkv1QZpWwynStcbJZB20ypW+VqmIUmGdIpS/RuL6udzRw
         aEXqLR4Tpb7tVMv53/KziPMeSL5AQYuRn4p9+SjUlnaNIRMhrr9qO7JduaUMRtfMKoCt
         ftixJOFPZn4qTX2u33HAEpvsG3CLLjZFgc33VphqNWdtGIhEN/nbgOxrXHO4ioXDnd4v
         3r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5XCq3aw9mDW4vLXTuAFW7Gl3EWmIsDOrQpN5UmWv+fQ=;
        b=TM3WObaYekd+CrTFIQR8ufpP8Uisxn0hxEaLPrqlM3hwrovPlYwOFeto4tw9B9XnW5
         bzrz2btN7idV5rfPtgdj0zfjFB1phCKs4bdNu7+MHjytFh7w1W5+y4dYPFEoG9LDCVUo
         y2zfuQ3Zg7NI4nMIYntqvx2aRiMD3/EjtaspVS8zQedUA3oIvJIC+ERwi4/0rPGzDmyN
         H+9VapoY3xhKSnvVcG+Zsd5cul/cKFg4Zlqzyf60HOcgGn5NHnrAUfo+vtWNo/U5SYva
         khDBkItTFsCc3Acwi6nSGE2Oq1lt2TNBBs6zAR+/Mer+4Vs76d+v/jyyTww4Mtgn6wQa
         u4Ng==
X-Gm-Message-State: AJIora+881xyzcHll63rGGLzqfBz9nCeXZvQD5Vfli/RenYsPxwkvKKR
	q07LhmsTckA6i2fps/bhdvQMNLIlXylIKIyMttfZkFhlBxI=
X-Google-Smtp-Source: AGRyM1uXBgvYNGyYYiJ7P+RDvneEFsseZqD3e1M3vKtyVOasZKg0d1N4yYI9FygAGJMznCH2nFrZKHs8oifoCavKCk8=
X-Received: by 2002:a05:6a00:18a9:b0:51b:f63b:6f7c with SMTP id
 x41-20020a056a0018a900b0051bf63b6f7cmr24394513pfh.49.1655730335169; Mon, 20
 Jun 2022 06:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-3-jens.wiklander@linaro.org> <874k0nhvsq.fsf@epam.com>
 <20220616223728.GA71444@jade> <94122e8d-224d-2632-27ad-d56d3a24b367@xen.org>
In-Reply-To: <94122e8d-224d-2632-27ad-d56d3a24b367@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 20 Jun 2022 15:05:24 +0200
Message-ID: <CAHUa44E7takcNtXtLxmrMdDV+hO=86uBpJz7tjp_W26x1mGB-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] xen/arm: add FF-A mediator
To: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Fri, Jun 17, 2022 at 10:16 AM Julien Grall <julien@xen.org> wrote:
>
> Hi Jens,
>
> On 16/06/2022 23:37, Jens Wiklander wrote:
> > On Tue, Jun 14, 2022 at 07:47:18PM +0000, Volodymyr Babchuk wrote:
> >>
> >> Hello Jens,
> >>
> >> Sorry for late review, I was busy with internal projects.
> >>
> >> This is preliminary review. I gave up at scatter-gather operations. Need
> >> more time to review them properly.
> >
> > No problem, thanks for taking the time.
> >
> >>
> >> One thing that bothers me is that Xen is non-preemptive and there are
> >> plenty potentially long-running operations.
> >
> > There's room to deal with that in the FF-A specification. These scatter
> > gather operation are quite complicated so I started with the minimum. We
> > can as a future optimization address the problem with long running
> > operations.
>
> I would be OK to defer this work. However, I think this should be
> written down as Xen community will not be able to security support until
> we resolved the known places where a vCPU may hog pCPU longer than
> necessary.
>
> This reminds me that this series doesn't add a support statement for the
> new subsystem in SUPPORT.md. AFAICT, this should be tech preview for now.

I'll add an entry for this.

Thanks,
Jens

