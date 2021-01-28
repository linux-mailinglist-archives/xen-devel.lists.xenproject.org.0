Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7F30769D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 14:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77009.139250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56vH-0004kR-BZ; Thu, 28 Jan 2021 13:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77009.139250; Thu, 28 Jan 2021 13:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56vH-0004k4-8D; Thu, 28 Jan 2021 13:01:19 +0000
Received: by outflank-mailman (input) for mailman id 77009;
 Thu, 28 Jan 2021 13:01:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFCr=G7=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l56vF-0004jz-Mu
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 13:01:17 +0000
Received: from mail-wr1-f53.google.com (unknown [209.85.221.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62744fdb-c947-4557-b9a3-eb1bece16d8b;
 Thu, 28 Jan 2021 13:01:15 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c12so5303496wrc.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 05:01:15 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f17sm7377676wrv.0.2021.01.28.05.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 05:01:13 -0800 (PST)
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
X-Inumbo-ID: 62744fdb-c947-4557-b9a3-eb1bece16d8b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nKIZJsbg+sALp6rTuUlLBwxNjSsmwhcmP0jaqciDgRQ=;
        b=T0d+yTzOfXPoP7HtKE3JdvNPAPW4RDWEaXHTm5eb1wAgNftOePRSULO/q8Ct02sEnB
         IJ1zxicJ41It+WAikwc6A6snGjDhksrC5UGQqSXIQz77GRsLL+cAzZvOgLlLo4X+kVst
         wCAs10qakduxT0qV98TuH/BhAYjZBuV87mkr/5rweoV5yI0i2M7tu/zvSjfEp5b4vzHL
         V9ZcwQ8EqzLsoxq1C7c4IyYDJ+6xWT+KqlvKUZIJ3j7x1lExmPsfnQHvJhVF4foFoDza
         dgdDgMcNwYWXrwBWgeYVP+9+53ANkAobPEMeFca+DQ0iixQ4CucjYH/ob2ew6dYODc6U
         yMig==
X-Gm-Message-State: AOAM531d83K1Nxkdf6Ncq7v0akFXvgMQ1JTTEEXQ97SyMqANipx3Jv4e
	ogoEluGVTWNsOwt7ArSMPaY=
X-Google-Smtp-Source: ABdhPJzF5ULSWxtFvjXuRhlZvQPOVfSmjtIceYER/BqtiD6GOb0BurPxk9jHGvpciHLogqpyh4a70g==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr16151682wrn.88.1611838874863;
        Thu, 28 Jan 2021 05:01:14 -0800 (PST)
Date: Thu, 28 Jan 2021 13:01:12 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Manuel Bouyer <bouyer@netbsd.org>
Subject: Re: [PATCH v4] tools/foreignmem: Support querying the size of a
 resource
Message-ID: <20210128130112.ocr7t2lpw63as2rx@liuwe-devbox-debian-v2>
References: <20210128120152.9908-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128120152.9908-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Thu, Jan 28, 2021 at 12:01:52PM +0000, Andrew Cooper wrote:
> With the Xen side of this interface (soon to be) fixed to return real sizes,
> userspace needs to be able to make the query.
> 
> Introduce xenforeignmemory_resource_size() for the purpose, bumping the
> library minor version.
> 
> Update both all osdep_xenforeignmemory_map_resource() implementations to
> understand size requests, skip the mmap() operation, and copy back the
> nr_frames field.
> 
> For NetBSD, also fix up the ioctl() error path to issue an unmap(), which was
> overlooked by c/s 4a64e2bb39 "libs/foreignmemory: Implement on NetBSD".
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

