Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788527EDBB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.826.2826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNeJU-0001uV-La; Wed, 30 Sep 2020 15:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826.2826; Wed, 30 Sep 2020 15:46:40 +0000
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
	id 1kNeJU-0001u5-Hy; Wed, 30 Sep 2020 15:46:40 +0000
Received: by outflank-mailman (input) for mailman id 826;
 Wed, 30 Sep 2020 15:46:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNeJT-0001tr-3Q
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:46:39 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d665ac1c-ea93-4690-8138-e84d50fc5f8f;
 Wed, 30 Sep 2020 15:46:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l15so289324wmh.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:46:37 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u13sm3535906wrm.77.2020.09.30.08.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:46:36 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNeJT-0001tr-3Q
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:46:39 +0000
X-Inumbo-ID: d665ac1c-ea93-4690-8138-e84d50fc5f8f
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d665ac1c-ea93-4690-8138-e84d50fc5f8f;
	Wed, 30 Sep 2020 15:46:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l15so289324wmh.1
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lT/EjgIk3NLLK25yor6puOeVsEP8+ct95C1qsGEyqeQ=;
        b=oFztt9VYSLbY7Hrna2njPK0qzYptCg1/VzyxhZzqpkv0ErR000hNlOuHiF76EjYJZY
         VdRPGidcuU4dGLjd5qsWRp4pBsdbpkXx4k2Cob+1Shd2M5y/sDEfMh6zLMGw69fmp4+s
         QpJGF4gyaeYQlGnafjYpN6aA/Fp2gjPxm2qnPp/pxfZy1uZSEJ3kLifxnLD0mnlhJfWt
         ebU0KuxeFS5vCclckYZTo7u3MW4i5lPWL3VfMNcav5MUG/RegYbOgZ67TgGsbrn0MzPG
         wq7/+yYsbyM7ZpO//BL1TC7wOhymzRC2WwWQySoPFCmED8bBqDL+mVQWRoQN4NNpfbhL
         YwNA==
X-Gm-Message-State: AOAM530T2PhcPeMTTvrsC6UB5nJnWU7qBW+Ve2xxbpraSxMrnvXEfz5E
	6FXmIY50Jk5ToRnr1xnV4cU=
X-Google-Smtp-Source: ABdhPJzgionQACgjLrOpVOzx/5UHMiozXbc9JAfp06IktIfyLOEhr/YKKd5FiNarlXimpVP3crizpQ==
X-Received: by 2002:a7b:cc17:: with SMTP id f23mr3531817wmh.166.1601480797265;
        Wed, 30 Sep 2020 08:46:37 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id u13sm3535906wrm.77.2020.09.30.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:46:36 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:46:35 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH 3/3] stubdom: add xenstore pvh stubdom
Message-ID: <20200930154635.jb26daawzldp4gwh@liuwe-devbox-debian-v2>
References: <20200923064541.19546-1-jgross@suse.com>
 <20200923064541.19546-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923064541.19546-4-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 23, 2020 at 08:45:41AM +0200, Juergen Gross wrote:
> Add a PVH xenstore stubdom in order to support a Xenstore stubdom on
> a hypervisor built without PV-support.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

Note to self: may need to regenerate stubdom/configure.

