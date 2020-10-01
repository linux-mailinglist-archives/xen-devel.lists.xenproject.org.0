Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7320127FAF9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 10:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096.3597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNtYp-00089r-Tn; Thu, 01 Oct 2020 08:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096.3597; Thu, 01 Oct 2020 08:03:31 +0000
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
	id 1kNtYp-00089S-Q4; Thu, 01 Oct 2020 08:03:31 +0000
Received: by outflank-mailman (input) for mailman id 1096;
 Thu, 01 Oct 2020 08:03:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=937a=DI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNtYn-00089N-Vl
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:03:30 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cbf1905-828f-475f-9b13-84d3264b6b0a;
 Thu, 01 Oct 2020 08:03:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k15so4505948wrn.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 01:03:28 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id l5sm3022012wrv.24.2020.10.01.01.03.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Oct 2020 01:03:26 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=937a=DI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNtYn-00089N-Vl
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:03:30 +0000
X-Inumbo-ID: 4cbf1905-828f-475f-9b13-84d3264b6b0a
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4cbf1905-828f-475f-9b13-84d3264b6b0a;
	Thu, 01 Oct 2020 08:03:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k15so4505948wrn.10
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 01:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=OTrEnhNBN5R4+dyvqauB0Y5OwRj53IzJUx91Bcl+i78=;
        b=imOcekMOnoMaah3UJlqcpTJVMYjVhigkPyz40HYVmXhEJ4xWp4/P1BNO1ZVr9chui+
         +7spsDUSjId3ROYCISatnycAeCmnB5oOcaliX8csdcJswDj4+NH+z5Ohvk7XiF0OkzTz
         OSI3COJMjpjLSEzPBcyVgJVXNjY1duYV1xTSTjMmCgkSNIAY9ESlRqo/TLU4ftp7leDD
         0jJsmgC0EyDWxq2Uzx//u2JmVSZ1n2dRFb2FR1Jsrr4NjkNUPyuw14gS+/5m7juQi6Xl
         a5+POY0TW6Opv4xfeLe/6oniu0rGle8XxdIYJpdgK/NJDvPc205QeL+Q3l+rH85YCNp3
         jvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=OTrEnhNBN5R4+dyvqauB0Y5OwRj53IzJUx91Bcl+i78=;
        b=NRluWBUnSGnyRWQ+/gnEA/9hFrUvzWXQSyGr8Uj1ABf626T95eZC23qLpyMsJRXgO6
         3IdyxMK2/PvY6DmlFrlSGKDrx/gU0nNuM0MoedHBrU0+qj6MhVlIukzhXum3U6W/ZB+z
         YAd7s1ucsepWxWL6cFL5LruBwfc4jYHskdJNJsoZeHrTfwrvoCvUWMMFa5UpU+iGxgtN
         PL39Ihv8MYqqeMJHKABVJsGCntJFd+ZZHMLk9NQfkfzSLqdG/gRaL3erhQl+cbtxYUHT
         1nf1XNNrTXrBV7zMLMi+pMg+6QNRq7nagHE1a29wMIbrSZMOt0ZcMHIMc2tvkrCMNA2K
         KXzg==
X-Gm-Message-State: AOAM531l0+2wzOczcC23Uqn08Zn4M01l2kepIhS4JlNx/4QZ35JmC9/o
	9YMfodW8PIotK6WhKRxngA8=
X-Google-Smtp-Source: ABdhPJwan3nlRJEN7HKE69zar2eImtVpRpYFlhfsKXozjX7PA3CNyjJoF03MdM73/nxESr0z2OvvMw==
X-Received: by 2002:a5d:5583:: with SMTP id i3mr7158520wrv.119.1601539407387;
        Thu, 01 Oct 2020 01:03:27 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
        by smtp.gmail.com with ESMTPSA id l5sm3022012wrv.24.2020.10.01.01.03.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2020 01:03:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Anthony PERARD'" <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
	<qemu-devel@nongnu.org>,
	"'Paul Durrant'" <pdurrant@amazon.com>,
	"'Jerome Leseinne'" <jerome.leseinne@gmail.com>,
	"'Edwin Torok'" <edvin.torok@citrix.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <20200923155731.29528-1-paul@xen.org> <20200930114235.GL2024@perard.uk.xensource.com>
In-Reply-To: <20200930114235.GL2024@perard.uk.xensource.com>
Subject: RE: [PATCH] xen-bus: reduce scope of backend watch
Date: Thu, 1 Oct 2020 09:03:25 +0100
Message-ID: <008c01d697c9$579520a0$06bf61e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFwzHOYQKlt73iXJ/fB9mI5UZbIzgHcxvtVqj8StGA=

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Sent: 30 September 2020 12:43
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; qemu-devel@nongnu.org; Paul Durrant <pdurrant@amazon.com>; Jerome
> Leseinne <jerome.leseinne@gmail.com>; Edwin Torok <edvin.torok@citrix.com>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: Re: [PATCH] xen-bus: reduce scope of backend watch
> 
> On Wed, Sep 23, 2020 at 04:57:31PM +0100, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Currently a single watch on /local/domain/X/backend is registered by each
> > QEMU process running in service domain X (where X is usually 0). The purpose
> > of this watch is to ensure that QEMU is notified when the Xen toolstack
> > creates a new device backend area.
> > Such a backend area is specific to a single frontend area created for a
> > specific guest domain and, since each QEMU process is also created to service
> > a specfic guest domain, it is unnecessary and inefficient to notify all QEMU
> > processes.
> > Only the QEMU process associated with the same guest domain need
> > receive the notification. This patch re-factors the watch registration code
> > such that notifications are targetted appropriately.
> >
> > Reported-by: Jerome Leseinne <jerome.leseinne@gmail.com>
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> >
> > diff --git a/hw/xen/xen-backend.c b/hw/xen/xen-backend.c
> > index 10199fb58d..f2711fe4a7 100644
> > --- a/hw/xen/xen-backend.c
> > +++ b/hw/xen/xen-backend.c
> > @@ -41,6 +41,11 @@ static void xen_backend_table_add(XenBackendImpl *impl)
> >      g_hash_table_insert(xen_backend_table_get(), (void *)impl->type, impl);
> >  }
> >
> > +static void **xen_backend_table_keys(unsigned int *count)
> > +{
> > +    return g_hash_table_get_keys_as_array(xen_backend_table_get(), count);
> 
> That could be cast to (const gchar **) as the GLib doc suggest, or (const
> char **) since gchar and char are the same.
> https://developer.gnome.org/glib/stable/glib-Hash-Tables.html#g-hash-table-get-keys-as-array
> 

Ok, I'll re-arrange the const-ing to cast at the inner level.

> > +}
> > +
> >  static const XenBackendImpl *xen_backend_table_lookup(const char *type)
> >  {
> >      return g_hash_table_lookup(xen_backend_table_get(), type);
> > diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> > index 9ce1c9540b..c83da93bf3 100644
> > --- a/hw/xen/xen-bus.c
> > +++ b/hw/xen/xen-bus.c
> > @@ -430,7 +430,13 @@ static void xen_bus_unrealize(BusState *bus)
> >      trace_xen_bus_unrealize();
> >
> >      if (xenbus->backend_watch) {
> > -        xen_bus_remove_watch(xenbus, xenbus->backend_watch, NULL);
> > +        unsigned int i;
> > +
> > +        for (i = 0; i < xenbus->backend_types; i++) {
> > +            xen_bus_remove_watch(xenbus, xenbus->backend_watch[i], NULL);
> 
> We should check if backend_watch[i] is NULL.
> 

Yes, I'll add a check.

> > +        }
> > +
> > +        g_free(xenbus->backend_watch);
> >          xenbus->backend_watch = NULL;
> >      }
> >
> 
> The rest of the patch looks fine. Next improvement is to only look at
> only one backend type in xen_bus_backend_changed() since there is now a
> watch per backend type :-), but that would be for another day.
> 

Might not be too tricky. I'll see if I can come up with a follow-up patch.

  Paul

> Cheers,
> 
> --
> Anthony PERARD


