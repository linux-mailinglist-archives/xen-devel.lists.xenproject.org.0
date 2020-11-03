Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845062A4366
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18212.43142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtrt-0003oN-NM; Tue, 03 Nov 2020 10:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18212.43142; Tue, 03 Nov 2020 10:48:49 +0000
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
	id 1kZtrt-0003nn-Jv; Tue, 03 Nov 2020 10:48:49 +0000
Received: by outflank-mailman (input) for mailman id 18212;
 Tue, 03 Nov 2020 10:48:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2DW=EJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kZtrs-0003nc-F4
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:48:48 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7916cdea-72dd-402a-9260-b5574d4f4397;
 Tue, 03 Nov 2020 10:48:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y12so17982236wrp.6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 02:48:47 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o7sm25760887wrp.23.2020.11.03.02.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 02:48:45 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z2DW=EJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kZtrs-0003nc-F4
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:48:48 +0000
X-Inumbo-ID: 7916cdea-72dd-402a-9260-b5574d4f4397
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7916cdea-72dd-402a-9260-b5574d4f4397;
	Tue, 03 Nov 2020 10:48:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y12so17982236wrp.6
        for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 02:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VJ35ZHV3XnN6jiKh2gQB8iLy4AOnRolbYpXB6GM3TsI=;
        b=XO9CSoLy3mZkeMgD+EIjikVEe6/m7oZuCIW6EMhkbBqFSU9tlLp0HJ2CMPDT/0sYQK
         8+zYrTiCZDGS1/KSBOn8WH92g7f+YJMxw1Ue058fgQd8pt86kg8VXA6p+BJMegoV0byw
         q7GENAey5/OS7aMICxLrks7l1icZlLj7sN3ruFKRx9qK52PHtNWVEkAiPP/kv4uU4DMS
         thHpRnp9Ecn712gbHBhvJRU0VYd7u0nQC7nhv34aeoTJqvcxRGLXX4THOvZB3ZsW1tki
         jeYzSnpfEmzcHoO++76275Qai5Krf+Q2TCmSWD/Ozcc06SkqFqNTAb46mn/9rt2yKB5k
         dc6Q==
X-Gm-Message-State: AOAM530RDFShyzg9Iz60eSgGib2Qm8YhInpjllqjyw3Aq/mAzwu8vKlV
	C+VCYcxLu0VvVG0GBWMcOJM=
X-Google-Smtp-Source: ABdhPJz/mis5AMwtmHGZ8jufZY7NYfZW25nI47mf9aw1+ZsiS01rOKqyV7qv4sUhAawrWkoPCCgxJw==
X-Received: by 2002:adf:ff82:: with SMTP id j2mr25344824wrr.401.1604400526404;
        Tue, 03 Nov 2020 02:48:46 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id o7sm25760887wrp.23.2020.11.03.02.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 02:48:45 -0800 (PST)
Date: Tue, 3 Nov 2020 10:48:44 +0000
From: Wei Liu <wl@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] libxl: Add suppress-vmdesc to QEMU machine
Message-ID: <20201103104844.t73k4rukp7jezk7d@liuwe-devbox-debian-v2>
References: <20201029190332.31161-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029190332.31161-1-jandryuk@gmail.com>
User-Agent: NeoMutt/20180716

On Thu, Oct 29, 2020 at 03:03:32PM -0400, Jason Andryuk wrote:
> The device model state saved by QMP xen-save-devices-state doesn't
> include the vmdesc json.  When restoring an HVM, xen-load-devices-state
> always triggers "Expected vmdescription section, but got 0".  This is
> not a problem when restore comes from a file.  However, when QEMU runs
> in a linux stubdom and comes over a console, EOF is not received.  This
> causes a delay restoring - though it does restore.
> 
> Setting suppress-vmdesc skips looking for the vmdesc during restore and
> avoids the wait.
> 
> QEMU 5.2 enables suppress-vmdesc by default for xenfv, but this change
> sets it manually for xenfv and xen_platform_pci=0 when -machine pc is
> use.
> 
> QEMU commit 9850c6047b8b "migration: Allow to suppress vmdesc
> submission" added suppress-vmdesc in QEMU 2.3.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> 
> ---
> QEMU 2.3 came out in 2015, so setting suppress-vmdesc unilaterally
> should be okay...  Is this okay?

Anthony, what is your opinion on this?

Wei.

