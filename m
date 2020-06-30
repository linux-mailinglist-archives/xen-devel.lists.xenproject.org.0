Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E420EB25
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 03:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jq5Un-0003dg-3O; Tue, 30 Jun 2020 01:55:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aLIy=AL=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1jq5Um-0003db-0B
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 01:55:36 +0000
X-Inumbo-ID: c9c89f6c-ba74-11ea-bb8b-bc764e2007e4
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9c89f6c-ba74-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 01:55:35 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id z5so9177079pgb.6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 18:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HS5e6zKVS7g0I3TN+ey+83qSL6DZHPtxKHOSz1FdQDs=;
 b=bKMCFJdzFr2fziAS/VIVfQXtcuD/fDv6UAZQo09MfEsJCiz2XGUWXRfFqbLc14eoCa
 6+I6FFSfmaA51Iz6uH7wvw6A3uPJhBID1+t9IFgX3SAhI4DwySZ56CBxYUEpwcTKcjg7
 TbNxCP5qvmIPUCg0eIRi4MWQ6E72ecKZdnosN8bTO7x+zjVDbzBsc9Ft8tymBz4gArfM
 XFC+ciq18jxocs73kwb0dktvZAgG2737LM15wQ0sCDH+d9JfogCgU54baDYzTWShqB/J
 xe/SSxw952HyhvB49xZdbSreoxjip4iWqYITKUapZ3FPQZLwaI5h7FeBWQ1xN9uUaYUC
 ZuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HS5e6zKVS7g0I3TN+ey+83qSL6DZHPtxKHOSz1FdQDs=;
 b=aWoFBbyjHJL2UUbGVsdOg67FDyC6LdI1Y6bof14OJaApahEZ9rbkFXGASdXiGsa4UW
 2uy1INw4X3S8lYDI5rMhIZH8UarjQ3yHf6akBc3NJl4wu1Rfe84DBDcwRiDwLZHVcd76
 n8oIKvUyDx3II5ePyxpXfANnFEkroMpG62NE8oSGDY47evaacM6WelKMzYbMh1juDb1S
 awcEM3HuZxgrVRK+V47Fqs05fhyzWBjr6xeJKvFMj5MJ+oaXkAlyTXRux6rWnO7ri9WE
 khOLX5QciJkPZKhfr5AleMlWJSDT1jehQQp923VKvAzpdyggSqJYdHbdW3XN286iWvxb
 GVQQ==
X-Gm-Message-State: AOAM533QnnpP2sNPu0XMjKTI5mmIyIJ/Clnq7rHeHURtNULWU2cuHcif
 9fPMDFsSU4e5pVupKp2Wtc8=
X-Google-Smtp-Source: ABdhPJxCjuyup9Tg7rRoCza+5VC4sO3bwCj0cTuYeATLryWCQ6Qz2BNm/uPx4FRzAAEdbx8L62x+1Q==
X-Received: by 2002:a63:e057:: with SMTP id n23mr12657995pgj.368.1593482134739; 
 Mon, 29 Jun 2020 18:55:34 -0700 (PDT)
Received: from piano ([2601:1c2:4f00:c640:fc6:7318:8185:4d2d])
 by smtp.gmail.com with ESMTPSA id h17sm859224pgv.41.2020.06.29.18.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 18:55:34 -0700 (PDT)
Date: Mon, 29 Jun 2020 18:55:32 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC XEN PATCH 19/23] riscv: Add the lib directory
Message-ID: <20200630015532.GC8470@piano>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <65b894a039c4097a25a8d0b19e56646574159b14.1579615303.git.bobbyeshleman@gmail.com>
 <8e76ed4b-6d96-40ad-54bc-4243e6d12915@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e76ed4b-6d96-40ad-54bc-4243e6d12915@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 22, 2020 at 01:38:20PM +0200, Jan Beulich wrote:
> On 22.01.2020 02:58, Bobby Eshleman wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> > 
> > Add the lib directory with find_next_bit support.
> > 
> > This was taken from Linux
> 
> As was Arm64's - the two definitely would want folding.
> 

Indeed.  I'm finding a good more overlap with arch/arm as I move forward, so
expect to see a good degree of folding between the two in v2.

