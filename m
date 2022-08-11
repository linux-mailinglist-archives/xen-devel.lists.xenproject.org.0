Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A4D58FB4B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 13:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384490.619882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM6OM-0006Q1-QT; Thu, 11 Aug 2022 11:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384490.619882; Thu, 11 Aug 2022 11:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM6OM-0006NM-ME; Thu, 11 Aug 2022 11:30:22 +0000
Received: by outflank-mailman (input) for mailman id 384490;
 Thu, 11 Aug 2022 11:30:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wU7G=YP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oM6OL-0006L3-60
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 11:30:21 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faffcfcf-1968-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 13:30:19 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id f22so22521036edc.7
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 04:30:19 -0700 (PDT)
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
X-Inumbo-ID: faffcfcf-1968-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Z3pEJGy1REnvgyy1oqHrPC2LjoiqiqNYoMkBf57hqjg=;
        b=nONpIuEL/LFcZCFd9KlimL3IEfSecAe2TmXAO4C9/JmMLUHjF18jL4HdsriDYfFOUc
         9V4wIHHAfqztp3VxJAs4W26jCVyD4vezSpm9QkmOw7cQ8GSf/i3dBrqaEPkPJ+o9SYxB
         +ABvuoxty5Et18khBp6YBy3w4azRZ7yUSCzs99Ae0O+Sj0amwp1ZFaHcWmEgRv4ZhoFK
         cDOXgPoU6RFyVUx0o8hdGFkLCr0fryhdUwk2mp3xjuqOtHmb2FV0Vkzh8gSKeaw7FVpC
         EUCgAgq23naLT0xAZPanwsJV0r991yHU1UxKCGQiO58O6HAVrcR+bknJTjEKS8oK2FmU
         QhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Z3pEJGy1REnvgyy1oqHrPC2LjoiqiqNYoMkBf57hqjg=;
        b=jrIi5iGKpVSSK1pn6Mb4bxdNI5ndiAfw8Pzc7xRa68o3I84653Sk64LjxOZjDEPWZ+
         V7FMnFg3NLe61zp5K7di+KYTgLI2nxnac7MSIpNaBDrcmCUgb6+BQ5pzl4fQEDAvHCRH
         psGcCycs1p1qhcv0XkJ/SeWVlaXKvIHUDsWis/1CoJMRRPoHZ8Ctrt2mtjzU7a1wnOZ4
         UJrdE0EF+lUoGR0iNE6UTVGrx1a1wNAM+R1+n23CTCeIJn4sTcmOCxPhc7EJj/rS1T4V
         AKWaj/Fz0i6S6Vu+pgwbt/TtN7GYjFPVqFvZsjSu8V0lGEyxaHfk/2ULLdDgoGh5UpLE
         jOvQ==
X-Gm-Message-State: ACgBeo2i992wmyYTEUWk3T8daBIWH0cFvSvqwXi3xdHhF8Bo6m8uiBNb
	Lvbw8F4WNsLQcKhwmWf8mQFE8Fw5jPTT5UJsLeU=
X-Google-Smtp-Source: AA6agR4K5rz6p7T3vjYS+Jt7gu6UNMdZhfdwJwRIEp4m+SoH4U9cRNuq1scSvguS+rMTEBhx50t2a1qBd7salsq+Irw=
X-Received: by 2002:a05:6402:3595:b0:43d:710a:3f3f with SMTP id
 y21-20020a056402359500b0043d710a3f3fmr30451103edc.375.1660217419336; Thu, 11
 Aug 2022 04:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220810192944.102135-1-jandryuk@gmail.com> <20220810192944.102135-14-jandryuk@gmail.com>
 <dff3fc03-8d94-7ca0-512a-501ed71dcc48@suse.com>
In-Reply-To: <dff3fc03-8d94-7ca0-512a-501ed71dcc48@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 11 Aug 2022 07:30:07 -0400
Message-ID: <CAKf6xpsrTsmUj9+EO31FvY5xB+fnsH8PvQm868s5xO8tcG-OJQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] CHANGELOG: Add Intel HWP entry
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>, 
	Community Manager <community.manager@xenproject.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 11, 2022 at 2:51 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 10.08.2022 21:29, Jason Andryuk wrote:
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -6,6 +6,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >
> >  ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> >
> > +### Added
> > + - Intel Hardware P-States (HWP) cpufreq driver
>
> Note that there already is ...
>
> >  ### Changed
> >   - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
> >     this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.
>
> ... a "Added / support upgraded" section right below here.

Whoops, sorry about that.  Thanks for catching it.

For v3, I'll move to the existing section while keeping Henry's Ack.

Regards,
Jason

