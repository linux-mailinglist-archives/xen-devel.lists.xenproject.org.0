Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214720B089
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:31:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomZq-0000lB-Fs; Fri, 26 Jun 2020 11:31:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jomZp-0000l6-LM
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:31:25 +0000
X-Inumbo-ID: 8ed308c4-b7a0-11ea-829e-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ed308c4-b7a0-11ea-829e-12813bfff9fa;
 Fri, 26 Jun 2020 11:31:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k6so9172546wrn.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 04:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=TAHuT5hcvLzaJ5Ysz01dahZq5ZvGfdGPpHLiq1hDhOU=;
 b=Zacj0Ep/Mmj6C9EygnX/V8/DlpzyCuNzDTBiO0UkMTpQLlSmaiJ2TmWNQmVhvg7YcY
 fdJdM8Huhxbc93m+TgDARkHQJmrbTV+uahx4Ker1JBtVIOhg9gLlUjIt10gMAIYYpNR4
 P1PpiQgXbNa8AB2mmyTY2bvmoIEHzS6C4HLNiprd4XJKmHUeA3cdpDnhj6KT08S2tJxv
 qt8zkcVo2j6B+44AKm+amMLBadaYMybAHWB3b47+KToo3Zq597q1EnF8ZWa/yRLLcdXZ
 zKUqSr1jUMoZ03zd5143HBFZgcNreHwXrqo/Z6qiSs8qSENMmQmC8JJmb2KkvbaxloBL
 4a4w==
X-Gm-Message-State: AOAM5301k163+j4wk61bq+PEJhtbkP0obU7Rl0pl/zt10LO3Hd/lxnbx
 xxWB1PxVXnZQHREjaGAQw2s=
X-Google-Smtp-Source: ABdhPJx34nqIoPH1d9qU9+k9g2ymS0HEOlvhtYRrZGNbfBRULICdB117CQgZL/EibK3v++pY4q0uqQ==
X-Received: by 2002:a5d:6749:: with SMTP id l9mr3215344wrw.63.1593171080313;
 Fri, 26 Jun 2020 04:31:20 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c65sm16631702wme.8.2020.06.26.04.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 04:31:19 -0700 (PDT)
Date: Fri, 26 Jun 2020 11:31:18 +0000
From: Wei Liu <wl@xen.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 00/10]  Coverity fixes for vchan-socket-proxy
Message-ID: <20200626113118.mk3dsarodglerfck@liuwe-devbox-debian-v2>
References: <20200611032936.350657-1-jandryuk@gmail.com>
 <20200626101807.za6arkdlah7zsjzc@liuwe-devbox-debian-v2>
 <20200626111201.GS1197@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200626111201.GS1197@mail-itl>
User-Agent: NeoMutt/20180716
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 01:12:01PM +0200, Marek Marczykowski-Górecki wrote:
> On Fri, Jun 26, 2020 at 10:18:07AM +0000, Wei Liu wrote:
> > On Wed, Jun 10, 2020 at 11:29:26PM -0400, Jason Andryuk wrote:
> > > This series addresses some Coverity reports.  To handle closing FDs, a
> > > state struct is introduced to track FDs closed in both main() and
> > > data_loop().
> > > 
> > > v2 changes "Ensure UNIX path NUL terminated" to avoid a warning with
> > > gcc-10.  Also, "Move perror() into listen_socket" and "Move perror()
> > > into connect_socket" are new.
> > > 
> > > Jason Andryuk (10):
> > >   vchan-socket-proxy: Ensure UNIX path NUL terminated
> > >   vchan-socket-proxy: Move perror() into listen_socket
> > >   vchan-socket-proxy: Move perror() into connect_socket
> > >   vchan-socket-proxy: Check xs_watch return value
> > >   vchan-socket-proxy: Unify main return value
> > >   vchan-socket-proxy: Use a struct to store state
> > >   vchan-socket-proxy: Switch data_loop() to take state
> > >   vchan-socket-proxy: Set closed FDs to -1
> > >   vchan-socket-proxy: Cleanup resources on exit
> > >   vchan-socket-proxy: Handle closing shared input/output_fd
> > 
> > Acked-by: Wei Liu <wl@xen.org>
> > 
> > Cc Paul. V1 of this series was posted back in May. I consider this
> > series bug fixes, so they should be applied for 4.14. The risk is low
> > because vchan-socket-proxy is a small utility used by a small number of
> > users.
> > 
> > Marek, you gave Review tags in v1. Do they still apply here?
> 
> Yes. And also for the new patches 2-3. I thought I've posted it here,
> but must have missed clicking "send"...

Thanks for confirming.

Wei.

