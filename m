Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030CF3C8906
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 18:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156134.288110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3i7D-0005EQ-9A; Wed, 14 Jul 2021 16:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156134.288110; Wed, 14 Jul 2021 16:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3i7D-0005CB-5w; Wed, 14 Jul 2021 16:52:07 +0000
Received: by outflank-mailman (input) for mailman id 156134;
 Wed, 14 Jul 2021 16:52:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzwV=MG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1m3i7C-0005C3-E9
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 16:52:06 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d57bec1f-b2e7-40b9-ba74-dbf698365d45;
 Wed, 14 Jul 2021 16:52:05 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h9so4415149ljm.5
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jul 2021 09:52:05 -0700 (PDT)
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
X-Inumbo-ID: d57bec1f-b2e7-40b9-ba74-dbf698365d45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0HntOx9EeqvENKin/Ec695cfEd15UJf/wc3s8WXqsc0=;
        b=QMKTHw85BxxjE2sS6j79s1Vb2g0fibj6I7Ldidrg+bHWpjSpk7HAxyGpjVYTRxL2eX
         wP+qM2jDzRfuK8j1nzGhICgOJ4pV9tjuiGJzu5Sl7U3jv+JebrjD54ywmQtrW/wWm982
         L2xx3ADTDd0iN1kF0Sk32Bnx/x61pPC68DBGj6RFZQE5Ro4ZhGbHHDVXc6VQQJPjl/Pk
         BpGt3vG9xJd4XTLkcHF+k23fS5mhFDMZoU8KE46UXG01W1BvIeSajKY/sz3+QjRH9neF
         PAwZTrpr94EFO0q/frtF540mM8B8sRHeN8T/iE9LMK3iL243rH9y16rArftpmvQRTspx
         quKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0HntOx9EeqvENKin/Ec695cfEd15UJf/wc3s8WXqsc0=;
        b=O0e4HJJVRhE46Rl5zRFTpsd20YSQGXVOL6xTQ+HPPr+vdUaclgj0s4dOEIJL7Gb4uw
         q69cnNSG2cJAGPqRn3PnYibCfqIlaU55g8MM+RcUpnJnuQwgkns/1JgraIHx1ulmYMUh
         r8Fm44+yxo9rd8iSEra4YAZvj2fSTQwzCDkqPTz+5IM0u+IRaV83K8NTVbxeaOXoWIQv
         LMYctyO8JUndtwi5GT1BzNo1C3PGUnSQNCVlMxUujn2gXoIvpnZkeBH9py+0+S+1ss6x
         xq0bDY++hQcV20XqJg0qon6EdF2gGl8FG8A8U2z/9WZbWYzZvdnPanLOKwjF2uVlZnvs
         TDXA==
X-Gm-Message-State: AOAM532YoFNuNHntlx0HGfX1oCsUAw/aO7hPoF0I06tpXD6K2papSaAM
	ohfCFh0v7FEddO5hI77/weR+c9Pm5+9kh8e8MyY=
X-Google-Smtp-Source: ABdhPJwSwupfKi7+NG3+7LZv636hOpwwi2luMDF61x3RCMhC01X7FbeMK0gE7oTgBIeMjjV6e8iwg0Ux20H+4U4HO8k=
X-Received: by 2002:a05:651c:178b:: with SMTP id bn11mr5722781ljb.437.1626281524781;
 Wed, 14 Jul 2021 09:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210714161734.256246-1-anthony.perard@citrix.com>
In-Reply-To: <20210714161734.256246-1-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 14 Jul 2021 12:51:53 -0400
Message-ID: <CAKf6xps8knZPtPwSmJoPsJnK63fD=r0LsBDiEAU=jwgSSuOZyQ@mail.gmail.com>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 14, 2021 at 12:23 PM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> This will help prevent the CI loop from having build failures when
> `checkpolicy` isn't available, when doing "randconfig" jobs.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

