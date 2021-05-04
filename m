Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B9372EE8
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122632.231311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldypq-0003TZ-2m; Tue, 04 May 2021 17:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122632.231311; Tue, 04 May 2021 17:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldypp-0003TE-Vy; Tue, 04 May 2021 17:27:49 +0000
Received: by outflank-mailman (input) for mailman id 122632;
 Tue, 04 May 2021 17:27:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldypo-0003T8-PS
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:27:48 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11b6ea1c-dac8-4593-bb01-3fbcfee913c9;
 Tue, 04 May 2021 17:27:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id c3so10410194lfs.7
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 10:27:48 -0700 (PDT)
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
X-Inumbo-ID: 11b6ea1c-dac8-4593-bb01-3fbcfee913c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=v0CVkEbf9Ck0jddg6MwqLyIswronxdSbnoHybmIUOck=;
        b=Mug5UL+qcO57rvyTmXzlCgCzqYZiCpOmzlaZ8iZMSyyESNOyGpkIhy9W/TpmjLtY/H
         8JxjeOq65PabpjnCZl7kYoyAKlY6f/wLef/WxxC/9PBplGWQk2cOTt0WwRtT7cwXZacv
         7jcZM88wlfvcxdg9Jxb92R3mbb1dw2iyPomAywIWaV7m16GXd83dO6uuj9m09nsdViOy
         WztbkRH5TkArbFCKMunL+9ijubupBsD/nBMN1I/Ak9Pzyvo9FyiaNWVt0B8NOzCnEcG4
         GMswuksjVybkW8rLwuEgWpzbQemU7ITgp1VPJ5UJ8QpuOHJgLzAgisUZ9/AXGoV7fnuc
         j9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=v0CVkEbf9Ck0jddg6MwqLyIswronxdSbnoHybmIUOck=;
        b=SuYl5VJeTow5CkBtg8a3YP7oST64y6aXct7BeocfU1CkUJwlWDg9J5N7hhFL9+me00
         /mLaJc2/IvDcgtoiDxeAxcMV59UZZaAYpvNNhtSsXzbr8365qG7hjNh8QjZRV8Gd9Dke
         u1QXdYJ3OiBfGD0yMTAzOrURc175UsBRX3D2QPASl7fXBDd5B6wogvQgCIUSnuGoUqdM
         /jpb2AZMPnNlH6MJsJl6txG+0WE2IN3+Hmj3DwDQ6BcglIcUUOIRnoyyGj19Pt2IuG7P
         mtzPOIbKYmUGE7S8dg8KOpYBXdMCIjMp5B0GH5jE8iz0LcUmHK4UU8TWMKxEto+gJeVc
         LJEA==
X-Gm-Message-State: AOAM530txqdeOzVApCV+eLeNdzUqbVTnid6zapvnmzpn92AqyDf0BvT8
	qU3DcA2dLps45fhFGLdXGQsZmjCItcviTEofQ/0=
X-Google-Smtp-Source: ABdhPJyvULL6JNy2sHMgHfno0mV+fsqDnG6koDpptwQNp8/tuS+MmI9d9Oc6KUBjWuv7m+8oGYAKRlOV7vvuFL2m8C0=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr17519120lfq.150.1620149267110;
 Tue, 04 May 2021 10:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210504124842.220445-1-jandryuk@gmail.com> <20210504124842.220445-5-jandryuk@gmail.com>
 <20210504131328.wtoe4swz7nyzyuts@begin> <CAKf6xpsVJQ7LeV63hb8Sm_6gq+xjCwMDOkuMKNsn+-vqHF=9rQ@mail.gmail.com>
 <20210504170719.mnu3e3av7klsvyuq@begin>
In-Reply-To: <20210504170719.mnu3e3av7klsvyuq@begin>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 4 May 2021 13:27:36 -0400
Message-ID: <CAKf6xpvP2TCqZwew8_ykYEcXfsmhsef2TefcV++h2u4BsWVo2A@mail.gmail.com>
Subject: Re: [PATCH 4/9] vtpmmgr: Allow specifying srk_handle for TPM2
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 4, 2021 at 1:07 PM Samuel Thibault
<samuel.thibault@ens-lyon.org> wrote:
>
> Jason Andryuk, le mar. 04 mai 2021 13:04:47 -0400, a ecrit:
> > owner_auth & srk_auth don't check :, but then they don't skip : or =
> > when passing the string to parse_auth_string.  So they can't work
> > properly?
>
> They happen to "work" just because there is no other parameter prefixed
> the same.

parse_auth_string fails on the ":".

Just tested "owner_auth:well-known"
ERROR[VTPM]: Invalid auth string :well-known
ERROR[VTPM]: Invalid Option owner_auth:well-known
ERROR[VTPM]: Command line parsing failed! exiting..

> > > We'd better clean this up to avoid confusions.
> >
> > Right, so what do we want?  I'm leaning toward standardizing on =
> > since the tpm.*= options look to parse properly.
>
> I'd say so too. Also because that's what is apparently documented.

Ok, thanks.

Regards,
Jason

