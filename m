Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4043EF744
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 03:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168043.306798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGAB4-0000Qm-W0; Wed, 18 Aug 2021 01:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168043.306798; Wed, 18 Aug 2021 01:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGAB4-0000O6-Si; Wed, 18 Aug 2021 01:15:34 +0000
Received: by outflank-mailman (input) for mailman id 168043;
 Wed, 18 Aug 2021 01:15:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tyGE=NJ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mGAB3-0000Nu-AC
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 01:15:33 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d07534c-effd-45d7-b1b9-ee6c96f07bd0;
 Wed, 18 Aug 2021 01:15:32 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id h11so1911348ljo.12
 for <xen-devel@lists.xenproject.org>; Tue, 17 Aug 2021 18:15:32 -0700 (PDT)
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
X-Inumbo-ID: 9d07534c-effd-45d7-b1b9-ee6c96f07bd0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gan1MwN1yQdFBIitrPY5PVROqykgqPTuu7eTG7oROjg=;
        b=FqkNDGqzJiK7aukqstrJ7YV7B+DvWMjyyNsXWLwC2NJYP1HEfAquizX3f1cR7QUva6
         1Rt+JkJK2NqxwZgYcs1pgNzS5RKko+cE7sdDEG6jRzRyR7wHnnMircRP2if6mHZWU49b
         yxsgOKpwqWSMTfVnZsl11mwaw3t+9rccVBImMVquvWtrl6ahw/ADhuvFRTsV72eUFdfR
         EEOyJjRq0/dTw6bluYdUTQGybXPdJHyV4AxVAqQ0FzY0QFVFNVKsheBLgnouaSmT8PPF
         qkTpHLs6vL6x7RXMGh+EpaODXDtSAQ1jJVJYyaYg+6Wcsol7Ii8MgwScrM7UYnBwVzzg
         Bv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gan1MwN1yQdFBIitrPY5PVROqykgqPTuu7eTG7oROjg=;
        b=ApeBej/j9p+9wAuGAlrlI3HUwgGkFYBXlliakaKz//CWo/qhlgSJsYJkzxivTFlt+B
         7DvhMEM7apk8SUZssj0s5Cs0RbdCiILHdgi2ijE7aPqvEpwwuMm3GYRdadDgF+Vi/1rC
         u/pM24Q4wcTg6hrYHMd4PYPa/4PW8QCWRBmsio9on1zsLRw5uYQONvDz2jWaOeUm+Yr3
         x72PE4DNX86WlLxQrzqfgSwZHm5vyC5kFyqu1A/VvJRlwe3Gs4kK8Cs/8bXSTA6khKzp
         A9uIzfVSEDCK8o7xB78HgN6FtLKr6n7XHMJhaHbEzsX1AI1vQw59dDhG/nEtEUrHZFmw
         KUfg==
X-Gm-Message-State: AOAM5312k4f8nqVWCA7+DmtHRXZ+zTQMSoLua8CTiT7WK6r/H8+3juQ+
	Qz0BsMJL3x9iX9vMozvjxtudgjSZuIhJvhGSEYY=
X-Google-Smtp-Source: ABdhPJzLu+OYb3BgQ7C1fEhFWbR7ZgSqib0LPsDHiBufcWZ2U9oEse4ZZ2g1TkQT5EXDcm/0qzR1vdPvpe/93bfvjyI=
X-Received: by 2002:a2e:a5c6:: with SMTP id n6mr5646987ljp.204.1629249331314;
 Tue, 17 Aug 2021 18:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <edb72ed62c7c1154d5ed282e57e1750b6d79fa15.1627672412.git.scott.davis@starlab.io>
In-Reply-To: <edb72ed62c7c1154d5ed282e57e1750b6d79fa15.1627672412.git.scott.davis@starlab.io>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 17 Aug 2021 21:15:19 -0400
Message-ID: <CAKf6xpuAzbz-PP-k3oNGo-3_iXWhjBF=nm4zdDb16UqB8ov_Og@mail.gmail.com>
Subject: Re: [PATCH v2] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg
To: Scott Davis <scottwd@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Scott

On Fri, Jul 30, 2021 at 3:35 PM Scott Davis <scottwd@gmail.com> wrote:
>
> This adds an option to the xl domain configuration syntax for specifying
> a build-time XSM security label for device-model stubdomains separate
> from the run-time label specified by 'device_model_stubdomain_seclabel'.
> Fields are also added to the 'libxl_domain_build_info' struct to contain
> the new information, and a new call to 'xc_flask_relabel_domain'
> inserted to affect the change at the appropriate time.
>
> The device-model stubdomain is relabeled at the same time as its guest,
> just before the guest is unpaused. This requires the stubdomain itself
> to be unpaused and run for a short time prior to being relabeled, but
> allows PCI device assignments specified in xl.cfg to be completed prior
> to relabeling. This choice allows the privileges required to perform
> assignments to be dropped in the relabeling.
>
> The implementation mirrors that of the 'seclabel' and 'init_seclabel'
> options for user domains. When all used in concert, this enables the

Drop all -> "When used in concert"?

> creation of security policies that minimize run-time privileges between
> the toolstack domain, device-model stubdomains, and user domains.
>
> Signed-off-by: Scott Davis <scott.davis@starlab.io>
> ---
> Changes in v2:
> - removed superfluous chanegs to libxl_dm.c
> - changed all security label lookup failures due to FLASK being disabled
>   from warnings to hard errors based on mailing list discussion

I think this should be a separate patch before this one, since it is
distinct from adding device_model_stubdomain_init_seclabel.

> - added discussion of relabel point to commit message

I was hoping for more people's thoughts on this.  I'm just going to
write down my thoughts on this to get them out there.

The non-stubdom case is very straightforward:
<-init-><-relabel-><-unpause-><-exec->

Relabeling before unpause is a nice delineation point.  Since the
guest hasn't run, it can't be mid-operation when the relabel happens.

The stubdom case as implemented by the patch is this:
Guest:
<---------init------------->|<-relabel-><-unpause-><-exec->
Stubdom:                    |
<-init--><-unpause-><-exec->|<-relabel-><-exec->

Here the stubdom runs for some time and then gets relabeled.

The alternative would be to relabel the stubdom before unpause and
then relabel the guest:
Guest:
<----------init---------------------->|<-relabel-><-unpause-><-exec->
Stubdom:                              |
<-init-><-relabel-><-unpause-><-exec--|--exec->

Here relabel then unpause is maintained for both guest and stubdom.

Relabeling the *running* stubdom gives me pause.  We don't have any
synchronization with the stubdom's & QEMU's state.  QEMU wrote
"running" to indicate it was up, but that doesn't say anything about
the rest of the kernel.  From the other side, the stubdom and QEMU
running and having the guest label change could be surprising.

Scott, you are using this, so I may be imagining concerns that don't
exist.  And you did mention your approach gives the PCI assignment
only to the stubdom init label, which could be a nice feature.  It's
just the lack of clear delineation for the stubdom that makes me
wonder about it.

Having said that, for your approach, I think the code looks good.

Regards,
Jason

