Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A951D287712
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 17:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4502.11771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQXox-0001lo-SP; Thu, 08 Oct 2020 15:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4502.11771; Thu, 08 Oct 2020 15:27:07 +0000
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
	id 1kQXox-0001lP-Or; Thu, 08 Oct 2020 15:27:07 +0000
Received: by outflank-mailman (input) for mailman id 4502;
 Thu, 08 Oct 2020 15:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQXov-0001lI-Pz
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:27:05 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e27c1249-41f5-407f-91b7-9bb8b7a8a2d5;
 Thu, 08 Oct 2020 15:27:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i1so959533wro.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 08:27:04 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h4sm7792367wrv.11.2020.10.08.08.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 08:27:03 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQXov-0001lI-Pz
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:27:05 +0000
X-Inumbo-ID: e27c1249-41f5-407f-91b7-9bb8b7a8a2d5
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e27c1249-41f5-407f-91b7-9bb8b7a8a2d5;
	Thu, 08 Oct 2020 15:27:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i1so959533wro.1
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 08:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jExkVY6rle/g0eFEizOMcJcaaR8v0g7iI/uZrvF8cGk=;
        b=WzvwveNH865KHM6ALDOyL1WH/4+DoLv7Z0BE6ioR34QSJIY5SK2v5LwZJoSVwqvnIj
         v8Qbl847snh8G++tKFtHJ7ZL00WWuZkM54r05McoFndQMTflVU0vRC4SOBK3ZsZZysCG
         xiQJLyPyZ/bQFX6SJN5A7UaRtGe/6mV/MjF+AY2RepNfSB4j/Kc8IvSYN48dZgrZV1du
         p0+0TQEArsU75uPl+xyHvDB2hEmm3KgyV0/tjRxnD19z+oRgYxnXpq1KdUcLg81mSbhN
         vkcx4T4Xs49TTJHncQHRAcH6Y6VmKVQjI3W57e1h1E6nR9xcGT/T82d+M3naZxnWKiDO
         O0jQ==
X-Gm-Message-State: AOAM530gIuViY6e2JTyYPc2rgql1wbqTQV8Y/+OTAfUb57E/tOHqwkrK
	qDsSD5hvR+7cBNS1+D88XQU=
X-Google-Smtp-Source: ABdhPJwhUkZVTlvmjTaHadG3LcxQKAyegHKpY07zWWiKAIYNW9ovzxurOasOCC8NOBVJa082gH2zqQ==
X-Received: by 2002:adf:f508:: with SMTP id q8mr9449655wro.233.1602170823968;
        Thu, 08 Oct 2020 08:27:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id h4sm7792367wrv.11.2020.10.08.08.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 08:27:03 -0700 (PDT)
Date: Thu, 8 Oct 2020 15:27:02 +0000
From: Wei Liu <wl@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] libxl: only query VNC when enabled
Message-ID: <20201008152702.bckdhhrvl3p4p3qw@liuwe-devbox-debian-v2>
References: <20201001235337.83948-1-jandryuk@gmail.com>
 <20201007105049.vfpunr4g62fqvijr@liuwe-devbox-debian-v2>
 <CAKf6xptt_r6_VuRSwRXQRUR4Q39c_619e4iNxi8uVxV7YOHDBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKf6xptt_r6_VuRSwRXQRUR4Q39c_619e4iNxi8uVxV7YOHDBw@mail.gmail.com>
User-Agent: NeoMutt/20180716

On Thu, Oct 08, 2020 at 09:31:15AM -0400, Jason Andryuk wrote:
> On Wed, Oct 7, 2020 at 6:50 AM Wei Liu <wl@xen.org> wrote:
> >
> > On Thu, Oct 01, 2020 at 07:53:37PM -0400, Jason Andryuk wrote:
> > > QEMU without VNC support (configure --disable-vnc) will return an error
> > > when VNC is queried over QMP since it does not recognize the QMP
> > > command.  This will cause libxl to fail starting the domain even if VNC
> > > is not enabled.  Therefore only query QEMU for VNC support when using
> > > VNC, so a VNC-less QEMU will function in this configuration.
> > >
> > > 'goto out' jumps to the call to device_model_postconfig_done(), the
> > > final callback after the chain of vnc queries.  This bypasses all the
> > > QMP VNC queries.
> > >
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > > ---
> > >  tools/libs/light/libxl_dm.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > > index a944181781..d1ff35dda3 100644
> > > --- a/tools/libs/light/libxl_dm.c
> > > +++ b/tools/libs/light/libxl_dm.c
> > > @@ -3140,6 +3140,7 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
> > >  {
> > >      EGC_GC;
> > >      libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
> > > +    const libxl_vnc_info *vnc = libxl__dm_vnc(dmss->guest_config);
> > >      const libxl__json_object *item = NULL;
> > >      const libxl__json_object *o = NULL;
> > >      int i = 0;
> > > @@ -3197,6 +3198,9 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
> > >          if (rc) goto out;
> > >      }
> > >
> > > +    if (!vnc)
> > > +        goto out;
> > > +
> >
> > I would rather this check be done in device_model_postconfig_vnc.
> >
> > Does the following work for you?
> 
> I like your version, but it doesn't work:
> libxl: debug: libxl_qmp.c:1883:libxl__ev_qmp_send: Domain 1: ev
> 0x55aa58417d88, cmd 'query-vnc'
> libxl: error: libxl_qmp.c:1836:qmp_ev_parse_error_messages: Domain
> 1:The command query-vnc has not been found
> libxl: error: libxl_dm.c:3321:device_model_postconfig_done: Domain
> 1:Post DM startup configs failed, rc=-29
> 
> When QEMU has vnc disabled, it doesn't recognize query-vnc.  I looked
> at modifying qemu to support query-vnc even with --disable-vnc, but it
> was messy to untangle the QMP definitions.  Since we are telling libxl
> not to use VNC, it makes sense not to query about it.

Ah, my bad. I misread the code. By the time libxl enters
device_model_postconfig_vnc the query-vnc command will have already been
issued. So your patch is fine.

Acked-by: Wei Liu <wl@xen.org>

