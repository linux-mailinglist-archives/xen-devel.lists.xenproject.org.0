Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7236928608E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 15:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3527.10107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9tU-0001vs-KF; Wed, 07 Oct 2020 13:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3527.10107; Wed, 07 Oct 2020 13:54:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9tU-0001vT-Gr; Wed, 07 Oct 2020 13:54:12 +0000
Received: by outflank-mailman (input) for mailman id 3527;
 Wed, 07 Oct 2020 13:54:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQ9tT-0001vO-Fd
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:54:11 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca9907ca-3338-4074-b033-8dbbbaa1233d;
 Wed, 07 Oct 2020 13:54:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e2so2481975wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 06:54:10 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id j101sm3474366wrj.9.2020.10.07.06.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 06:54:08 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQ9tT-0001vO-Fd
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:54:11 +0000
X-Inumbo-ID: ca9907ca-3338-4074-b033-8dbbbaa1233d
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ca9907ca-3338-4074-b033-8dbbbaa1233d;
	Wed, 07 Oct 2020 13:54:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e2so2481975wme.1
        for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 06:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Zo/HSRFcS5MbMS7Xkqevw1ZyhIhAdgyZoDCbw04hyjo=;
        b=SynTEO5UEzvRdKZ3oi/M4Of76GN5N7/BlID5em+PTK4vT6xJaODW7fCkemJLEMWAA+
         BXazAW+MMsaUzffBgnAnsv9svBSLb+NwSrn41wgAupRbj86ahCduBYK1IeB3abNE3hmr
         HD28WeXgmZpw06TEG7WBNYW5pkZeVGI0WwREFdt74TdYC0V+lvm5coZ8h+r6dkObczfX
         UhetfffJyc0nI1eKOLD7BpKT5WKhA6onA4x2HKJlCiYVG3uBGpn4QTXNoBdBpPaA6E9o
         us6yemRSLi8NRZQu+ZtVf5dPmNUqopWXfCcP0qgdd7MPfzTR/1cqQrzAD9A5lP6kDXPD
         r0kg==
X-Gm-Message-State: AOAM530mEVR+X2v1k3jBwaSPwZWOANc1q378cNzoOx7+AjGY7Zblvbuh
	JNwvZhPHPbmQMR5tDKMjryg=
X-Google-Smtp-Source: ABdhPJzetaI07kCaLps5qwNTlUiopORDMLlfA9xYY5u3Ze9fSbl8fqsQwUuchVAcvZOm+sCltLpzBw==
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr3295463wmd.7.1602078849350;
        Wed, 07 Oct 2020 06:54:09 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id j101sm3474366wrj.9.2020.10.07.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 06:54:08 -0700 (PDT)
Date: Wed, 7 Oct 2020 13:54:07 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 3/5] tools/libs/store: drop read-only functionality
Message-ID: <20201007135407.2hmlwfaeauwrbh5m@liuwe-devbox-debian-v2>
References: <20201002154141.11677-1-jgross@suse.com>
 <20201002154141.11677-4-jgross@suse.com>
 <20201007105448.c7scd5hoellddfwd@liuwe-devbox-debian-v2>
 <d03ef7db-8752-ac00-99f1-6c40f62e1162@suse.com>
 <f4b6a87c-ac65-cb3e-d4b2-4504340b81e3@citrix.com>
 <72542057-f5d8-99d5-55d9-2a21b7cb2d93@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72542057-f5d8-99d5-55d9-2a21b7cb2d93@suse.com>
User-Agent: NeoMutt/20180716

On Wed, Oct 07, 2020 at 02:45:29PM +0200, Jürgen Groß wrote:
> On 07.10.20 13:50, Andrew Cooper wrote:
> > On 07/10/2020 11:57, Jürgen Groß wrote:
> > > On 07.10.20 12:54, Wei Liu wrote:
> > > > On Fri, Oct 02, 2020 at 05:41:39PM +0200, Juergen Gross wrote:
> > > > > Today it is possible to open the connection in read-only mode via
> > > > > xs_daemon_open_readonly(). This is working only with Xenstore running
> > > > > as a daemon in the same domain as the user. Additionally it doesn't
> > > > > add any security as accessing the socket used for that functionality
> > > > > requires the same privileges as the socket used for full Xenstore
> > > > > access.
> > > > > 
> > > > > So just drop the read-only semantics in all cases, leaving the
> > > > > interface existing only for compatibility reasons. This in turn
> > > > > requires to just ignore the XS_OPEN_READONLY flag.
> > > > > 
> > > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > > > ---
> > > > >    tools/libs/store/include/xenstore.h | 8 --------
> > > > >    tools/libs/store/xs.c               | 7 ++-----
> > > > >    2 files changed, 2 insertions(+), 13 deletions(-)
> > > > > 
> > > > > diff --git a/tools/libs/store/include/xenstore.h
> > > > > b/tools/libs/store/include/xenstore.h
> > > > > index cbc7206a0f..158e69ef83 100644
> > > > > --- a/tools/libs/store/include/xenstore.h
> > > > > +++ b/tools/libs/store/include/xenstore.h
> > > > > @@ -60,15 +60,12 @@ typedef uint32_t xs_transaction_t;
> > > > >    /* Open a connection to the xs daemon.
> > > > >     * Attempts to make a connection over the socket interface,
> > > > >     * and if it fails, then over the  xenbus interface.
> > > > > - * Mode 0 specifies read-write access, XS_OPEN_READONLY for
> > > > > - * read-only access.
> > > > >     *
> > > > >     * * Connections made with xs_open(0) (which might be shared page or
> > > > >     *   socket based) are only guaranteed to work in the parent after
> > > > >     *   fork.
> > > > >     * * xs_daemon_open*() and xs_domain_open() are deprecated synonyms
> > > > >     *   for xs_open(0).
> > > > > - * * XS_OPEN_READONLY has no bearing on any of this.
> > > > >     *
> > > > >     * Returns a handle or NULL.
> > > > >     */
> > > > > @@ -83,11 +80,6 @@ void xs_close(struct xs_handle *xsh /* NULL ok */);
> > > > >     */
> > > > >    struct xs_handle *xs_daemon_open(void);
> > > > >    struct xs_handle *xs_domain_open(void);
> > > > > -
> > > > > -/* Connect to the xs daemon (readonly for non-root clients).
> > > > > - * Returns a handle or NULL.
> > > > > - * Deprecated, please use xs_open(XS_OPEN_READONLY) instead
> > > > > - */
> > > > >    struct xs_handle *xs_daemon_open_readonly(void);
> > > > >      /* Close the connection to the xs daemon.
> > > > > diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> > > > > index 320734416f..4ac73ec317 100644
> > > > > --- a/tools/libs/store/xs.c
> > > > > +++ b/tools/libs/store/xs.c
> > > > > @@ -302,7 +302,7 @@ struct xs_handle *xs_daemon_open(void)
> > > > >      struct xs_handle *xs_daemon_open_readonly(void)
> > > > >    {
> > > > > -    return xs_open(XS_OPEN_READONLY);
> > > > > +    return xs_open(0);
> > > > >    }
> > > > 
> > > > This changes the semantics of this function, isn't it? In that the user
> > > > expects a readonly connection but in fact a read-write connection is
> > > > returned.
> > > > 
> > > > Maybe we should return an error here?
> > > 
> > > No, as the behavior is this way already if any of the following is true:
> > > 
> > > - a guest is opening the connection
> > > - Xenstore is running in a stubdom
> > > - oxenstored is being used
> > 
> > Right, and these are just some of the reasons why dropping the R/O
> > socket is a sensible thing to do.
> > 
> > However, I do think xenstore.h needs large disclaimers next to the
> > relevant constants and functions that both XS_OPEN_* flags are now
> > obsolete and ignored (merged into appropriate patches in the series).
> 
> Fine with me.

+1 on this. Let me check other patches first. If there is no need for
another round of posting of this series, the addition of the disclaimers
can come in a separate patch.

Wei.

> 
> 
> Juergen
> 

