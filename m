Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA85B3860
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 14:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404315.646750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdbQ-0007hw-0t; Fri, 09 Sep 2022 12:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404315.646750; Fri, 09 Sep 2022 12:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdbP-0007en-Th; Fri, 09 Sep 2022 12:59:23 +0000
Received: by outflank-mailman (input) for mailman id 404315;
 Fri, 09 Sep 2022 12:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bvbb=ZM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oWdbO-0007eh-H1
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 12:59:22 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38e5d4fc-303f-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 14:59:21 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id lc7so3890794ejb.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Sep 2022 05:59:21 -0700 (PDT)
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
X-Inumbo-ID: 38e5d4fc-303f-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=674w3U9avgHzrGoN6WaCQAkSakf0Zj1lCT/Xa1vsZf4=;
        b=EZCakn1YMqJg/cfQqOayqzhyVZTGhNZoBLNmMlrnnOZEcoUgiW/IYOYQfJEkeIp9kp
         ls8XPXi9wgFSbzQZKCDnN1cm5+H7CIdFSZT9xhlZ3IgIxh9NPd0lL8zQ6gXcRMJrSi/i
         OnieJtD+q33packMXUvLGdkiBUQ3azLndoG6CbIUwKbT4AOjczCWHGzS/N1KyVRJgrH8
         919LNOvYMD+w1uuJ/SFV9A8bZoEtYhskkHhl9X/g+GpzpC3tp7CPlvxcKbDwFutvExfG
         /2crkECt8L+efOL16aA3aXJbrxSiEXwb8d7L8Nqdw7JbZZuO3Zd1xcPBvThks+tvtRDr
         GTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=674w3U9avgHzrGoN6WaCQAkSakf0Zj1lCT/Xa1vsZf4=;
        b=zgSGQZ/L0MqbJ8g10oaSafVhkXWSrlyVvaJOAiqy2Mun1JQbOIM19hCjXdNl/lSPCS
         Q5ahOCYmkfcgty3Kt1rQAm058igvGWk/dglwv91ngBguaXfZ2WTwToOslvXkzJgrr779
         TQ2uAw72ZIGGI9I82Lj8sjipU1oZqyNwGrH/K4DBhWB9AH5p1b3LCzyVfa9kRUDZE9RA
         nyVBbueS13s7W+t0kL0KDKXp5/Jg12k4jcgEN4J0iyssMb1PZbGQiaT6jcBydpW21sPy
         qgqOLVwtUBK6hvm+dm3ybH+1E4sPrzJmNoWlnYD4Ul3cuH4uzmhA8kM30uTzVQkyul8w
         PlQQ==
X-Gm-Message-State: ACgBeo3GvglcC+JVjo6XWfvmPywPtsV5bjhByfT3D2E7HNx5/Y6kmNCo
	Za3VmpM+8WySqWV5PS4C9J2NZj0PUCukacCl2hA=
X-Google-Smtp-Source: AA6agR4MArzVlTIhaEQx7+xFjEElXgWNtKOj+MRYiXkG//atBEjTJBQP7+yM/7DQoNzm0NdawoNOvBdl8LB+m3sQvQc=
X-Received: by 2002:a17:907:94c2:b0:73d:c534:1ac0 with SMTP id
 dn2-20020a17090794c200b0073dc5341ac0mr9778011ejc.461.1662728360989; Fri, 09
 Sep 2022 05:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220908195113.218201-1-jandryuk@gmail.com> <20220908195113.218201-3-jandryuk@gmail.com>
 <YxsTO9Ds2RNJo/3W@perard.uk.xensource.com>
In-Reply-To: <YxsTO9Ds2RNJo/3W@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 9 Sep 2022 08:59:09 -0400
Message-ID: <CAKf6xpugO14yY+3XxKiRwFoks5-iVfoMzjVK-D=PYQBPvjdCSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] xl/libxl: Add ability to specify SMBIOS strings
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 9, 2022 at 6:19 AM Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> On Thu, Sep 08, 2022 at 03:51:12PM -0400, Jason Andryuk wrote:
> > hvm_xs_strings.h specifies xenstore entries which can be used to set or
> > override smbios strings.  hvmloader has support for reading them, but
> > xl/libxl support is not wired up.
> >
> > Allow specifying the strings with the new xl.cfg option:
> > smbios=["bios_vendor=Xen Project","system_version=1.0"]
>
> I've tried something like:
>     smbios=['oem=foo=bar']
> And only "foo" is added to the smbios string. Shouldn't we allow users
> to have '=' in their smbios strings?

Yes, you are correct.  split_string_into_pair() isn't suitable since
it terminates at the second '='.  Also, we probably don't want to trim
the strings to keep them unchanged, especially for any values.  If a
space-padded option name is provided, it'll show up in "xl: unknown
smbios type '%s'" and the whitespace would be evident.

hvmloader iterates through HVM_XS_OEM_STRINGS entries and stops
processing when an entry is not found, or it is zero-length.  So I
think we should disallow zero-length values like "oem=" to avoid
surprises.  For example, smbios=["oem=A","oem=","oem=B"] would result
in only oem-1 "A" making its way through to the guest.

Your other comments sound good.

Thanks,
Jason

