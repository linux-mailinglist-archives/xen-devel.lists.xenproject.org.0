Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F5D1F2068
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 22:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiNzI-0004Qj-5a; Mon, 08 Jun 2020 20:03:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFSh=7V=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jiNzG-0004QP-JD
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 20:03:14 +0000
X-Inumbo-ID: 1266dad0-a9c3-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1266dad0-a9c3-11ea-bb8b-bc764e2007e4;
 Mon, 08 Jun 2020 20:03:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so18838084wru.0;
 Mon, 08 Jun 2020 13:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5NHBLFIrvrnQIUGtRyTRxnMHCx8z8QMwiCN/AFz6Lk=;
 b=P0Dgxi+IsDRGO+Bk3lyRDQgRKlZp+Ci9Pk6gL3G5cwt53aEKy723gSSrVrEwCk/X2X
 FAKbF2EZKYpmI6KLabj8CLrpFraCuLEHxjsZiDiozTniNWHZSpV/IisJcPc5OBlGNbqZ
 YskelP4i5A5wJuI5tJBe+4ZtPfCB1+MPUwU9sR5XMD+LyoymmFHBqPlgN/59KfRhEtvm
 WOdPrOTgAzEcd/gmrl89wVBozhR6+T5k6yv/2z1SWq95nxq5LHHnR0fL/438q+O/O35s
 4bsmMc//JR1VioXooxoKgDNMnDCVa0eZcVBG1OV8jrfb8dIl1g674CT0wf9uQWgTvzQT
 oZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5NHBLFIrvrnQIUGtRyTRxnMHCx8z8QMwiCN/AFz6Lk=;
 b=e/Hy8QSV/A6z/cyo2cSDMNfTqun7oNG8q/Yk+R08E3l5Bug0A8XmfHLcUaQx3upX2J
 2dYdSpFoozSWpxg6xlldeojhoYSZTWuhhJlux50UW/d0xD0N5rzmowpLw4MvchuuEKy3
 WdNlbjfkEfXWklidETgGOWP8nmNruiqnalnmMhfWXb4Fwo0uPRC1a8IhNhu8u8JbTx+1
 rKjxAiVJXiGDM5YDt4/HVC+zT6EQb4EZfvmKVZkOi9A6SdlwFdrk85B7rEGX5HCd27YD
 zQ8eFD/kEBzoNc6MNm54QJk0E9DDA1KjFAoXuLvPpAuoSuaQKu+ZaSbNGvp2Cwu02zmh
 5FYA==
X-Gm-Message-State: AOAM531Ln2kwW/XFgmRZr3ShM0uI56BfGPSJkTgnp6fvZ8CGf3ur4g6I
 3kdgbXAXAfwJ0lsLRBnGvWsMHzgyHtV0uZhp+7b6LqIvDLk=
X-Google-Smtp-Source: ABdhPJz0bwLjqoGXcyBts+PvnSrh0xcHjW2k0+BL1aQesxbAtiVzH6jUXYxAXq5daPk6KAS3uFOizs4nSPd45UOx93U=
X-Received: by 2002:a5d:490f:: with SMTP id x15mr429300wrq.259.1591646587271; 
 Mon, 08 Jun 2020 13:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200608163934.313-1-paul@xen.org>
In-Reply-To: <20200608163934.313-1-paul@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 8 Jun 2020 14:02:31 -0600
Message-ID: <CABfawhn3HJCHonYKnMFPgUEN125SDBSXKcMFMWd2hG5SGKF8YQ@mail.gmail.com>
Subject: Re: Xen 4.14 RC1
To: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-announce@lists.xenproject.org, xen-users@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 8, 2020 at 10:41 AM Paul Durrant <paul@xen.org> wrote:
>
> Hi all,
>
> Xen 4.14 RC1 is tagged. You can check that out from xen.git:
>
> git://xenbits.xen.org/xen.git 4.14.0-rc1
>
> For your convenience there is also a tarball at:
> https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz
>
> And the signature is at:
> https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz.sig
>
> Please send bug reports and test reports to xen-devel@lists.xenproject.org.
> When sending bug reports, please CC relevant maintainers and me (paul@xen.org).
>
> As a reminder, there will be a Xen Test Day. Please see the test day schedule at
> https://wiki.xenproject.org/wiki/Xen_Project_Test_Days and test instructions at
> https://wiki.xenproject.org/wiki/Xen_4.14_RC_test_instructions.

Hi Paul,
I'm sad to see this RC1 still missing patch:

https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00179.html

The following even have the release-ack and yet are also missing:

https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00025.html
https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00028.html

Without these patches I won't be testing or upgrading to 4.14 at all.

Thanks,
Tamas

