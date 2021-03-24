Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677683477AF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 12:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100944.192659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP20y-00021f-1l; Wed, 24 Mar 2021 11:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100944.192659; Wed, 24 Mar 2021 11:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP20x-00021G-Un; Wed, 24 Mar 2021 11:49:31 +0000
Received: by outflank-mailman (input) for mailman id 100944;
 Wed, 24 Mar 2021 11:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FjaK=IW=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1lP20w-00021B-2E
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:49:30 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16c4f459-4f9a-4fce-b976-f12810c3916d;
 Wed, 24 Mar 2021 11:49:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v4so24122463wrp.13
 for <xen-devel@lists.xenproject.org>; Wed, 24 Mar 2021 04:49:29 -0700 (PDT)
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
X-Inumbo-ID: 16c4f459-4f9a-4fce-b976-f12810c3916d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YXTahJMGLOD9FEDfVzNB8fy+yQssNFsetfwKdnzBFYA=;
        b=aEy6Z+U1vyGCKV0e164NAlfWTSgjE5XCnWz3+9J03orT/8t35AIDR7yQDrRjmMQBtb
         kEL34aLsyKssYe5xj60toSJjtnDHYieLKg3rODQfDDVRBf8KyKRdPZ0u+tUkkM0kCBxv
         D17BN65m95b1PP9nX0xucR9Y9FbXLz4Jgx/MwIXaJEyxJ2rrpcHhZNmS5pVQigD3aa0I
         MIQgPqAgZ6nE0Uk4cUceNAjuLLqygNJWHK7/n4f9wwOmCIFq8m771GIdTQcWdTmxkQ9D
         gbH3+QbPVWEE0ZCbeQAjowdglOkrQwk2ReHkndRM6YbQRYZb7liZddohr2AFUxI7/Kp7
         qfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YXTahJMGLOD9FEDfVzNB8fy+yQssNFsetfwKdnzBFYA=;
        b=lyJcWQzyk1nCLMYICyYx+eXj+ppy5XMgDm5Xtkzrnx4nHzT6sW4BKFel3bYi2flN0P
         QZm6nO89f2xKZ+/0nclQzujxG7u7G0aYpaq7yEFV4Vo5kB6KlFMktELVSneznfty1MmN
         Ok6vUIkFupILiAHZ+I6h1fera/PiEFDpHzyj8J7k3CLRsttBXrWuaxy70PJUQnvcqLbZ
         vQg04hqac9oc/8xknOC9pHZLGnke468dUSWmTc8amIKpqdQ5Ybg/JXdKnWetaU01BQaG
         kKbilv4IrjoEKc1SAXzFUuHM+HSr2NjqwZddjOnENCWJD+22aaYBwTqMI1LJJqwX8mmf
         ErVg==
X-Gm-Message-State: AOAM530hj/XNZoGxuzEX6uFIlAe+2M9Ie3uYUThIUnmh8zdJ6S1q/0l8
	7S2LoEwRZnxnvAydoY8E5iD8xxN65BIQ5dK2AZE=
X-Google-Smtp-Source: ABdhPJz+O1KszciQBfoh3kAH783BZz2Yyxr84vRIJLCd384JALdXGznmjm5OAQcw9AiZxxLjQ5QzuehrjMmktgJJFNI=
X-Received: by 2002:adf:efc7:: with SMTP id i7mr3031114wrp.182.1616586568382;
 Wed, 24 Mar 2021 04:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <24666.1682.595069.435575@mariner.uk.xensource.com>
 <0bfab829-3841-b2cd-96f9-874340cf75c2@suse.com> <24666.7414.232768.961456@mariner.uk.xensource.com>
 <f0c1df6d-2fcc-11b7-1a90-9a0aa2019686@suse.com> <24666.8820.146895.73948@mariner.uk.xensource.com>
In-Reply-To: <24666.8820.146895.73948@mariner.uk.xensource.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 24 Mar 2021 07:48:51 -0400
Message-ID: <CABfawhnTBmjJbckoCSsDicday_txM98LZLEc3o_rLL-FQ=t+1A@mail.gmail.com>
Subject: Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	community.manager@xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Committers <committers@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
	=?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Content-Type: text/plain; charset="UTF-8"

> The revert seems unattractive.  Your suggested command line option
> sounds like a good workaround to me.  Under the circumstances it seems
> like it should default to the old behaviour, as I think you are
> suggesting.
>
> So I am be inclined to ask if you, Jan, would prepare a patch
> implementing such an option.  Anyone else have any opinions ?

I've replied to Jan's patch as well. IMHO having the option but
leaving things broken without the option set is a bad user experience
as we don't have a way to tell the user when the option is needing to
be set during install. Asking users to see if Xen crashes during boot
is a bad user experience as part of the setup. There should be an
automatic fallback to try enabling the legacy option if things don't
work without it.

Tamas

