Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75227FD9F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1183.3936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNw6l-0007wc-Un; Thu, 01 Oct 2020 10:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183.3936; Thu, 01 Oct 2020 10:46:43 +0000
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
	id 1kNw6l-0007w1-R4; Thu, 01 Oct 2020 10:46:43 +0000
Received: by outflank-mailman (input) for mailman id 1183;
 Thu, 01 Oct 2020 10:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNw6k-0007vq-AI
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:46:42 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b5413fb-a503-473a-85ce-d38e9bd8fdab;
 Thu, 01 Oct 2020 10:46:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so2403437wmj.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:46:39 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 91sm8802020wrq.9.2020.10.01.03.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:46:38 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNw6k-0007vq-AI
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:46:42 +0000
X-Inumbo-ID: 4b5413fb-a503-473a-85ce-d38e9bd8fdab
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4b5413fb-a503-473a-85ce-d38e9bd8fdab;
	Thu, 01 Oct 2020 10:46:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so2403437wmj.2
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CzaZ9JDBNdOdIu7CxEVCZBj55MHCI4EpDDb+mosYShI=;
        b=Z76FnEIvcQSeP6RnRIDQb2IjJhIRU8WWNKK8EmPE+hwXXJ8ShnZ5Yhu6vJJpLrabMs
         U/XLJh7Bea0J7VXnPlbIB+f+efmpAfRjTUUH2BQ7QvZIP1Cjwh2PmjTrgvxxF004FC04
         6wqBCUYs9mrr3wTSSL146pqZe3zUMrWVz1TJRx5IFNGK5b2ilgTFQKFQ+zgHFv+fwCxF
         7uWWmS3hLO15i18hJ+VYz9zpsr6nKVt2T0V8bc5biI7CdPR3Q64z6nYahDTgaHnnkZoT
         ukWllKetKi1xXFRkpj85ibbjD1pHtY31JWWlDHfsSwO6ygiASbMMyq173/tvy5P4LuAS
         CUOw==
X-Gm-Message-State: AOAM5324ibDfjLcTWkJr79Bg649tD+z/62DzMEFgQyzvjYwDREosG//4
	xOv3wQNorSFTmc5EwBTdG+g=
X-Google-Smtp-Source: ABdhPJxN2KzpQLzJgqlelXUo3j40y3mBH+Iq5Sl5Fd7qgc8vDQt3I9bnPOMKTD+5B3DNBRk+WBE1LA==
X-Received: by 2002:a05:600c:2312:: with SMTP id 18mr7636998wmo.141.1601549198524;
        Thu, 01 Oct 2020 03:46:38 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id 91sm8802020wrq.9.2020.10.01.03.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:46:38 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:46:36 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 31/31] tools: move libxlutil to tools/libs/util
Message-ID: <20201001104636.n2st2lszfvumokl5@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-32-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828150747.25305-32-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Fri, Aug 28, 2020 at 05:07:47PM +0200, Juergen Gross wrote:
> Move the libxlutil source to tools/libs/util and delete tools/libxl.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

