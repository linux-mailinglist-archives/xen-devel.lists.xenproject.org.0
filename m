Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F1C5930FD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 16:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387555.623859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbNJ-0008NW-K8; Mon, 15 Aug 2022 14:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387555.623859; Mon, 15 Aug 2022 14:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbNJ-0008K3-H0; Mon, 15 Aug 2022 14:47:29 +0000
Received: by outflank-mailman (input) for mailman id 387555;
 Mon, 15 Aug 2022 14:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkVB=YT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oNbNH-0008Jv-Pv
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 14:47:27 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e1b9651-1ca9-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 16:47:26 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id i14so13892599ejg.6
 for <xen-devel@lists.xenproject.org>; Mon, 15 Aug 2022 07:47:26 -0700 (PDT)
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
X-Inumbo-ID: 2e1b9651-1ca9-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=CKL4fm1S7HvlMpkvtfwQKOP/xxInChGIM8vWJJ03gMI=;
        b=krUjW3EEmQVlxie0QPCsvWoA1mmeIyk3OEbWfaViTAGHLfUswB4pntN9zmvVKIpdjB
         NQVnCfB1qmi5XN+vzk7nkwyh5r6BZ7JBjhJwAtYnpZqAORWqIvrdMBxOPuKob9SmOL+i
         ZO9URshXgZv+PULE6CkccgDPg3ZqGeRiH+fWv0hDLuxf/rQA6KEtEzhZaCWKAyJz+bGH
         cfWqDJjWsJ5GfzW1vzIHTFarmCEk+rrfRcLwrD3ANzoO/PCwuNt8vL48QzHvRW+POXR6
         NfNMvLWr+HVAIUGO5vVeA/CyvMyqVb/IbI4QB7X3E3eXjd9pcpFpWxgHQZniTifPixCR
         psHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=CKL4fm1S7HvlMpkvtfwQKOP/xxInChGIM8vWJJ03gMI=;
        b=5sxdJmsgs+CSkfwVQ3YWZBxN1Qqsj/HB807vSteT6oLWtvZf59VdZ9G7thux7QKZP5
         vI09z4IrJaARWTDeSzO4jL31TnUz1jACxgmqAsVPEleYOUmB9DhhTAkDkeLbjFMMAxaz
         iZoIo+L/XfJmqwnMtXPEkly9LgyWcfelvTrohamk77FvXkrEul6K1+ZIR1E8ikqB5pUG
         LZ5Cav7Gg5DRIWgmtAvDdEI3GqhRHqgbMChMnxeO8lD0fZz8ThKBTwfm2v1LSBMzaIRh
         HzvhRRwkopsnvlzigqxCTUTimJWCnQU2gGKiZu2HqDv2fbXqOgk3FUjFbleoB2FQOQ39
         g2nQ==
X-Gm-Message-State: ACgBeo3MwGsyEdP0WM/XFoC5PA+ctEpBRY2oVzVN67JGMQixM5iiUeX1
	N5QPojRWp5b0FKISFUOeywBSo6iUkXqp+ogZW3r0QI2l
X-Google-Smtp-Source: AA6agR536nfSRejsPC0YkGoB9g/zWajVFgABlHeHA9mtKdYHLvfwnrai2gm1WjX93TFZeS25yhbt/8oi3bTjePvfppk=
X-Received: by 2002:a17:907:6e1b:b0:732:25eb:745c with SMTP id
 sd27-20020a1709076e1b00b0073225eb745cmr10574727ejc.297.1660574846405; Mon, 15
 Aug 2022 07:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220810192944.102135-1-jandryuk@gmail.com> <20220810192944.102135-2-jandryuk@gmail.com>
 <dd7b52c1-5ccc-8def-26d1-aa1f73dfe8ac@suse.com>
In-Reply-To: <dd7b52c1-5ccc-8def-26d1-aa1f73dfe8ac@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 15 Aug 2022 10:47:14 -0400
Message-ID: <CAKf6xpuFvBpu3CNMzJwpm+rSaGT3jK428GzuCDmx58Mgcv78zQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] cpufreq: Allow restricting to internal governors only
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 10:22 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 10.08.2022 21:29, Jason Andryuk wrote:
> > For hwp, the standard governors are not usable, and only the internal
> > one is applicable.  Add the cpufreq_governor_internal boolean to
> > indicate when an internal governor, like hwp-internal, will be used.
> > This is set during presmp_initcall, so that it can suppress governor
> > registration during initcall.
>
> At which point ...
>
> >  Only a governor with a name containing
> > "-internal" will be allowed in that case.
> >
> > This way, the unuseable governors are not registered, so they internal
> > one is the only one returned to userspace.  This means incompatible
> > governors won't be advertised to userspace.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > v2:
> > Switch to "-internal"
> > Add blank line in header
> > ---
> >  xen/drivers/cpufreq/cpufreq.c      | 5 +++++
> >  xen/include/acpi/cpufreq/cpufreq.h | 2 ++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
> > index a94520ee57..1fdd63d7b5 100644
> > --- a/xen/drivers/cpufreq/cpufreq.c
> > +++ b/xen/drivers/cpufreq/cpufreq.c
> > @@ -57,6 +57,7 @@ struct cpufreq_dom {
> >  };
> >  static LIST_HEAD_READ_MOSTLY(cpufreq_dom_list_head);
> >
> > +bool __read_mostly cpufreq_governor_internal;
>
> ... I expect this can be __initdata? With that adjustment

Patch 09 "xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op" uses it at
runtime.  But I think it can be dropped since there is a check of the
governor name.  I'll add __initdata.

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thank you,
Jason

