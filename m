Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061B227FDA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 14:21:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrGy-00088s-V9; Tue, 21 Jul 2020 12:21:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxrGx-00088n-8g
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:21:27 +0000
X-Inumbo-ID: b1f13745-cb4c-11ea-a0ac-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1f13745-cb4c-11ea-a0ac-12813bfff9fa;
 Tue, 21 Jul 2020 12:21:25 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f18so21043614wrs.0;
 Tue, 21 Jul 2020 05:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SNfWVX5QtpauRhZzF7YTPhpX/9TOAv34XYBcKG6bEMA=;
 b=W+TxOR4CJVPuTDasmFIIOFR4VZ1FsR441fbrjihVH/hF6IA+UlI2s0aTtLNsrrImQW
 KWwxokhCALIbA+d7fTykjFsd2tl4JuE/IJMAAPhQ6EKfEby+KJWnQEPnwk57Vtpprsvt
 PJmarwc5ZsQn0yHX3sIv6x7ixl4qXuCgoPKS7ytgTqkTd+j1F6J6o5WA09xTEjx3BX0r
 rgCLNMzv52Mxz8CkjxCI5/ybURzZHYKROKQNk29xe60Ro5XK1bijk6f9Qhk2bYjjbzwl
 1ES/eNuOHEzNTS8YmLLvtqoE89s5Tp2Uj0N9Vd6jekU7oJPTp/LZtffHGDKPcUt8UZ4N
 /Acg==
X-Gm-Message-State: AOAM533dZUOFORa+/mJx9j785miPTIsr+RMf64Pg2aA9AgIi4ZvhWhuq
 YUNiC5yiTYMWC6RKv6nTtE0=
X-Google-Smtp-Source: ABdhPJyFSP1Hn9ZbFFG9cK9p8i7a/w3/TND65B/M0cuembEqoOaWJ9HSDLMQ2FkNKeZZWnjfkX9C3Q==
X-Received: by 2002:adf:e801:: with SMTP id o1mr27048159wrm.54.1595334084808; 
 Tue, 21 Jul 2020 05:21:24 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u2sm3102387wml.16.2020.07.21.05.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:21:23 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:21:22 +0000
From: Wei Liu <wl@xen.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH v2] mini-os: don't hard-wire xen internal paths
Message-ID: <20200721122122.ypuumlnwn4djwevw@liuwe-devbox-debian-v2>
References: <20200713084230.18177-1-jgross@suse.com>
 <20200718181827.7jrs5ilutt3jzp4i@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200718181827.7jrs5ilutt3jzp4i@function>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jul 18, 2020 at 08:18:27PM +0200, Samuel Thibault wrote:
> Juergen Gross, le lun. 13 juil. 2020 10:42:30 +0200, a ecrit:
> > Mini-OS shouldn't use Xen internal paths for building. Import the
> > needed paths from Xen and fall back to the current values only if
> > the import was not possible.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Unfortunately this doesn't apply to staging.

Juergen, can you rebase?

Wei.

