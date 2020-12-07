Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3D42D1AF4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 21:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47011.83233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmNQl-00055U-NL; Mon, 07 Dec 2020 20:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47011.83233; Mon, 07 Dec 2020 20:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmNQl-000555-Jg; Mon, 07 Dec 2020 20:48:23 +0000
Received: by outflank-mailman (input) for mailman id 47011;
 Mon, 07 Dec 2020 20:48:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mZuY=FL=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kmNQk-000550-8J
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 20:48:22 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a823cb9-733c-42f6-9b9b-14471ac59f73;
 Mon, 07 Dec 2020 20:48:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y22so1732356ljn.9
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 12:48:21 -0800 (PST)
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
X-Inumbo-ID: 4a823cb9-733c-42f6-9b9b-14471ac59f73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=afeBzrAkz5BwizCHeAJgvDbsOemFkWApafPEH+e5coo=;
        b=MvYUbDa0VUimGq7DOGdUVu7dwP7LEF2c3QsAWimh87QwX6Nv62K9zLhFFVLn9qBZac
         SPFcpd1egvO5SmP1TWr17dth5GA8Xk9bwLt62acxeqFQkA7Ma/6fAj+4oKYPHChpgFAc
         6XXBxW93B3u11eAa8Sr/erm+EJuO63LFruir3fMCB/telhLRjG+3w+lzyEwcS0auKbme
         g7aVUrv10BGIV8btAjzhMMOUft24h7/jP4KOqscuqXZ6gcLw8+PftjN7G5T4aE7WfFs8
         JiCkYcIWL+nY1SOW0pH1lKeUDGsURRRIWavwwOR9ZiiHw/pQiCWHXayr1KMAs61R1dDC
         CczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=afeBzrAkz5BwizCHeAJgvDbsOemFkWApafPEH+e5coo=;
        b=ZSValv/+zg1xHiqtWFL5Qfi6x6+T7oAmmypro/qkx3HJz804ZCcerH8enzqF0PENTX
         d3VCyovDUnIYJkNEhEpq0+ff0IlTaBShdN6hAFvCMY9afSNo2BVLxlXqUHwAno74mPv1
         g7ifioak6GJ4MntHeOFZkNeDzkZT//dd2aLD8sXpRzuE8l94OPyjqzZn4EF0Piq4HBk/
         yuySFW/O9QrNfxrEyqSlZOiZ3k0/5F/NpsUuYNbFNbh3pLsdYk8qn8emqpmEFGYqFBJW
         +ua341g/i49W7uZLOdPnTORAtG+LJWhw4vh6D9B+Z+Sc0c8f/M130L6RrGstgb2Kkdk8
         q2xg==
X-Gm-Message-State: AOAM5302IUzdykbHGcbrmZoRDYgdsTeRrobPOZnK75DrrDoiogYNBYLW
	3fZqAa+OIM9w7v6rtufHRcvEy63o5AC9K8DS0uo=
X-Google-Smtp-Source: ABdhPJwTkr+9lK2EQYVg4JAu6qvcY0ivTKIzhAQQRziBGRp+n2S9E83RzY48r1SabrKZFJZwphmIcgtUl5P2VwiF/sI=
X-Received: by 2002:a2e:9747:: with SMTP id f7mr3313388ljj.262.1607374100396;
 Mon, 07 Dec 2020 12:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20201207133024.16621-1-jgross@suse.com> <20201207133024.16621-3-jgross@suse.com>
In-Reply-To: <20201207133024.16621-3-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 7 Dec 2020 15:48:09 -0500
Message-ID: <CAKf6xpuqdY=TctOjNsnTTexeBpkV+HMkOHFsAd4vxUudBpxizA@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen: don't use page->lru for ZONE_DEVICE memory
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	open list <linux-kernel@vger.kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 7, 2020 at 8:30 AM Juergen Gross <jgross@suse.com> wrote:
>
> Commit 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated
> memory") introduced usage of ZONE_DEVICE memory for foreign memory
> mappings.
>
> Unfortunately this collides with using page->lru for Xen backend
> private page caches.
>
> Fix that by using page->zone_device_data instead.
>
> Fixes: 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated memory")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Would it make sense to add BUG_ON(is_zone_device_page(page)) and the
opposite as appropriate to cache_enq?  Either way:
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

