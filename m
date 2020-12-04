Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BDA2CED15
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44543.79825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9In-0003Uo-DR; Fri, 04 Dec 2020 11:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44543.79825; Fri, 04 Dec 2020 11:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9In-0003UN-9G; Fri, 04 Dec 2020 11:31:05 +0000
Received: by outflank-mailman (input) for mailman id 44543;
 Fri, 04 Dec 2020 11:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9Il-0003UC-MS
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:31:03 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85c6d7ec-483b-4ea9-a860-f9284980260f;
 Fri, 04 Dec 2020 11:31:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s8so4977167wrw.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:31:03 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w3sm2841035wma.3.2020.12.04.03.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:31:01 -0800 (PST)
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
X-Inumbo-ID: 85c6d7ec-483b-4ea9-a860-f9284980260f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lWeenlqsnvb4pGse1Eiubd2rBtxCxMc/5md6CbaBnjA=;
        b=p1u2+FCp1Z9U8iZqWQt8EHgjxQR2WXOCijwiFeEoQaILtiObZ4bcCSi20iSnDE2QCb
         oNECEB4gMrpD3lNcZs2VKH1s/oecOhDpJhBdKM+iQKb7g4tPy8WfsttxwtRNoqj1s3CU
         WFOQzunmEgw2MHltu25fdS/Ci3mMyeMwPND7crLqZbfTABbA3lzmoiYkKv0MeQfxByG4
         U5AtMzkQNUmENTId+IOluCSij9LeV3nLujngkfW00ADT18WhCfiWLED1sc+CtgDLNg8c
         Jm9EXoqHVZcSRM60Bns4Hf9ZyeKw4qqC4B9nCp8g4OUmOT4KtoDrZ9eWWnd18us3xNIB
         xBvw==
X-Gm-Message-State: AOAM530pirr0HP66Bni8fLsYWgsxyZF05hNKft58YdqtQRY1VAeLPsv8
	xsVBxUra9bTr9Y48ai+N0ZfOR//wzgI=
X-Google-Smtp-Source: ABdhPJy5OmwDqy3QvLFo4vYsvhyA8PXQLUFWHN7Njl1fRcBY92i6uVz+RIeltM+NUf2tg4pJ4tfk5g==
X-Received: by 2002:adf:e551:: with SMTP id z17mr4385806wrm.374.1607081462284;
        Fri, 04 Dec 2020 03:31:02 -0800 (PST)
Date: Fri, 4 Dec 2020 11:31:00 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 16/23] docs/man: fix xl(1) documentation for 'pci'
 operations
Message-ID: <20201204113100.v6dhjzvqnrj4njxn@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-17-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-17-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:27PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Currently the documentation completely fails to mention the existence of
> PCI_SPEC_STRING. This patch tidies things up, specifically clarifying that
> 'pci-assignable-add/remove' take <BDF> arguments where as 'pci-attach/detach'
> take <PCI_SPEC_STRING> arguments (which will be enforced in a subsequent
> patch).
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

