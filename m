Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26153BBA2A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149989.277397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KtR-00046A-26; Mon, 05 Jul 2021 09:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149989.277397; Mon, 05 Jul 2021 09:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KtQ-000446-Ut; Mon, 05 Jul 2021 09:27:56 +0000
Received: by outflank-mailman (input) for mailman id 149989;
 Mon, 05 Jul 2021 09:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0UI=L5=gmail.com=fontaine.fabrice@srs-us1.protection.inumbo.net>)
 id 1m0KtP-00043z-Ln
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:27:55 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e4d5ce3-02e1-43d0-a266-bea790de399f;
 Mon, 05 Jul 2021 09:27:54 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id t30so3825368ljo.5
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jul 2021 02:27:54 -0700 (PDT)
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
X-Inumbo-ID: 1e4d5ce3-02e1-43d0-a266-bea790de399f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P+qSy8IGAGojkMhIacuBSum3i+RiyiSZGBv9wxV91Ms=;
        b=Do1+2UKaUX7IiK952BaVIqSw0Oa/VSNTMcnqbBcXoPB0/X5gU+RMGW4UzqiS0wmRtw
         YgjQzjQUp0UnLoryUTiBZFLsLfuiLV8z5SJCaYvePxtKSGl+HxY4zaWD0tl/AjLApKPI
         PQeiHWXJoLGrtoix1u4W9twM4sFL+aTCQPElUMj+E4I9/wuGlautT/TbVVX6kD9dPvJS
         rOK9YVJElP2vZmC2+u+8N8wQa9oKbBZnlAdMTfR/UNt4UuD/DQrVGxWpE7KdPGQ4hkDz
         gp4f+rjq7HlheG4YFlBjWqqpczQBGxaYDon8xxed+QwwvXsuW864ue+VL6WR84WvOzhR
         4T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P+qSy8IGAGojkMhIacuBSum3i+RiyiSZGBv9wxV91Ms=;
        b=k866lad7YsPv4yuWQe6447YgnO5p+FuwCdm0hNxEufRcdHCeWDr4DSA3Sa5EUFVk81
         OtUlQlSdW0l6aNf0ki8xxV1VuYgHM1LjvDPycEMtvXgBmZe7x7P4ILEwKx9nWR5eWPnT
         OIKCQWA6S/11vnKsW+zaNLh7DuxKd/sFiEsnHkVZQPqCvChaLb35tu81feoF1dEDJQSe
         pGWjHOZkzM98ydQwBuOjcqzOZC4H7cUG/dTDjuIHqsoTWZ2Sra3J2YITUYwb3rx7/5aj
         S/f1MKHKK5aodEaoSEwCmfrgU4meT0EdxG59nnMCkywT3q9j8oj6pf2q2754eJbSMRg7
         RENA==
X-Gm-Message-State: AOAM532abi3BR9DN4lQ4aP11meUHmjaxBdySoJwFgqV2DQ5f58b95OeD
	socl+wBVwMLe8PPqT7Bz8HmQ/KLanXNrSm+/580=
X-Google-Smtp-Source: ABdhPJxJfBUkXqCdbeU9gCFObz8I8U4281eSs2/ewnjIIzNaQqe4Dp7JmeSUIWCQ5Xwi6J6qyut7CF9W+kGH8+8nsiU=
X-Received: by 2002:a2e:8596:: with SMTP id b22mr10373383lji.63.1625477273720;
 Mon, 05 Jul 2021 02:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210702170602.890817-1-fontaine.fabrice@gmail.com>
 <b920b793-734a-5f1f-6c4c-0d31ed27d01c@citrix.com> <CAPi7W81h=81ztVG6X0kh0+KEn9ryxAwXtK7-BWxonrXLJBZXaw@mail.gmail.com>
 <f56c54db-d3b9-33b0-2c8b-6ee9098e633d@suse.com>
In-Reply-To: <f56c54db-d3b9-33b0-2c8b-6ee9098e633d@suse.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 5 Jul 2021 11:27:42 +0200
Message-ID: <CAPi7W83qfze=4RtCGr+_V+Ph8vhMkOS135NbWoZuqmi1FkLixA@mail.gmail.com>
Subject: Re: [PATCH] xen/Makefile: drop -Werror
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

Le lun. 5 juil. 2021 =C3=A0 10:16, Jan Beulich <jbeulich@suse.com> a =C3=A9=
crit :
>
> On 02.07.2021 19:51, Fabrice Fontaine wrote:
> > Le ven. 2 juil. 2021 =C3=A0 19:34, Andrew Cooper
> > <andrew.cooper3@citrix.com> a =C3=A9crit :
> >>
> >> On 02/07/2021 18:06, Fabrice Fontaine wrote:
> >>> Drop -Werror to avoid the following build failure with -DNDEBUG:
> >>>
> >>> In file included from <command-line>:0:0:
> >>> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/x=
en-4.14.2/xen/include/xen/config.h:94:0: error: "NDEBUG" redefined [-Werror=
]
> >>>  #define NDEBUG
> >>>
> >>> <command-line>:0:0: note: this is the location of the previous defini=
tion
> >>>
> >>> Fixes:
> >>>  - http://autobuild.buildroot.org/results/66573ad0abc4244c0dfeac8b684=
a7bfcc31c0d4d
> >>>
> >>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >>
> >> For better or worse, It is Xen's policy that -Werror will remain.  95%
> >> of the time, it is the right thing.  We will however build failures
> >> whenever they crop up.
> >>
> >> This one is weird though.  How is NDEBUG getting in twice?  What does
> >> the rest of this build environment look like?
> > NDEBUG is added by buildroot in the command line if the user sets
> > BR2_ENABLE_RUNTIME_DEBUG to false since
> > https://git.buildroot.net/buildroot/commit/?id=3D5a8c50fe05afacc3cbe8e7=
347e238da9f242fab0
>
> I suppose the build environment setting is really intended for user mode
> code. I question its applicability to the building of kernels or
> hypervisors, but I can see that opinions may vary here. If we wanted to
> honor a pre-existing NDEBUG, how about simply making xen/config.h have
>
> #if !defined(CONFIG_DEBUG) && !defined(NDEBUG)
> #define NDEBUG
> #endif
>
> ? This then raises the question though how an external environment could
> achieve the opposite effect of suppressing NDEBUG's definition despite
> CONFIG_DEBUG being set. (The main point - hence my view expressed above -
> is that we switched to Kconfig to centralize where settings get
> established, moving away from taking ones from environment or make
> command line.)
FYI, we have reverted the commit that allowed the user to set -DNDEBUG
as it was raising too many build failures:
https://git.buildroot.net/buildroot/commit/?id=3Da1c7cff1a081765c082c196bd9=
e6c1e72ceee797
So, this patch is not needed anymore on buildroot side.
>
> Jan
>
Best Regards,

Fabrice

