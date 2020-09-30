Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ADD27EB29
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783.2606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdJQ-0003C2-LC; Wed, 30 Sep 2020 14:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783.2606; Wed, 30 Sep 2020 14:42:32 +0000
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
	id 1kNdJQ-0003Bg-Hp; Wed, 30 Sep 2020 14:42:32 +0000
Received: by outflank-mailman (input) for mailman id 783;
 Wed, 30 Sep 2020 14:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdJO-0003BY-Kl
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:42:30 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c7cb64e-1392-4a54-86cd-390cfa688c7d;
 Wed, 30 Sep 2020 14:42:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e2so2069379wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:42:29 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s17sm3560105wrr.40.2020.09.30.07.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:42:27 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdJO-0003BY-Kl
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:42:30 +0000
X-Inumbo-ID: 9c7cb64e-1392-4a54-86cd-390cfa688c7d
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9c7cb64e-1392-4a54-86cd-390cfa688c7d;
	Wed, 30 Sep 2020 14:42:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e2so2069379wme.1
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F9ycK2XMpVrwaELtgKLO7mNhIZzojC0X4zQlSYouZwg=;
        b=T8vHJZeb70yjZEc514XPoUYN34LeWtZ//yoMdnz5xx6oWR+HDkD2jt23h9Rutv8Ac5
         Gfmj+n6MocbyMSp8+TaKOKrwayfJoPraaSNPJTIN5w527zeel1H3a0cDuVxkpnGwfOx9
         TSOwl69QiBfBY+ZwV5/bzaKrIyNl8c1Nj19pcHRhEPPY6ggreKx+XaLQb1vwVgQr3d9H
         e05ZM3lVVhcLRVbqqTjeG755PNRExXdHgGQFUp2j+7hZVJy7fMsDKslxxcP+GM2zFZU5
         lvxo5YqfdEsfmJgDEJ1Nn3qNWU46sG59Zs+9t9oJ/0p8yaeh+5c2/yG0iD7Ge3coKeQk
         wDFw==
X-Gm-Message-State: AOAM533FyJptj4EL0NiXnom8gz+dkJILa03sfzoNL4gOfEEtwFtqaWy/
	YPjnqjfldveKdRufEw8JRdk=
X-Google-Smtp-Source: ABdhPJw0IxdLl3rBc9qndMlgRneeRWcpa2/xvddRQrZ6f9UGOt6Pi1z2/o85t3iT9cys0F8mg6o2FA==
X-Received: by 2002:a1c:b703:: with SMTP id h3mr3342804wmf.131.1601476949083;
        Wed, 30 Sep 2020 07:42:29 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id s17sm3560105wrr.40.2020.09.30.07.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:42:27 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:42:26 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v9 6/8] common/domain: add a domain context record for
 shared_info...
Message-ID: <20200930144226.7e4hy5vpzhtramhg@liuwe-devbox-debian-v2>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-7-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924131030.1876-7-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 02:10:28PM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and update xen-domctx to dump some information describing the record.
> 
> NOTE: Processing of the content during restore is currently limited to
>       PV domains, and matches processing of the PV-only SHARED_INFO record
>       done by libxc. All content is, however, saved such that restore
>       processing can be modified in future without requiring a new record
>       format.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

