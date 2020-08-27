Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C222543DF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:38:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFIX-0006XT-1D; Thu, 27 Aug 2020 10:38:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFIW-0006XM-DA
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:38:24 +0000
X-Inumbo-ID: 3c5ca613-2b9e-4f41-98ba-3a36aa0d1aa3
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c5ca613-2b9e-4f41-98ba-3a36aa0d1aa3;
 Thu, 27 Aug 2020 10:38:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id o21so4661224wmc.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nVHJJAx9hFENVUm4XvtEDg9nZe92irUMVieuas5i2Jw=;
 b=IaCg2ghYXXBte0ZxsBdYRt7qkwwS9+ekyYwamzD0Oxcuv0Bj1oJP8FjWLu35ZA5SdL
 DqTKqjmdV3Muq8xW9Q8R9wyv2N7QTJ0S+1ZuzcAVAKcqeDnvpXjyIVgTswYMPMxZ6kO3
 saklbsJnAPRrslzt9aiddivD/SwWvMSjJfwObzZ5/VgBGwl3fuG/P2+c8tBMn2kwdhBG
 JtRG/YHWCHAdkqy03H/zJeY0sxCtkzKrYdGM/87cN2oxydb03kuvva3JiAzJqoNztTld
 PxYiV/2yxUkjIqCYaeQMv8a/PcDWOr9CE8tPjz4LBXi7a1LiMPA0jHkeDTNoKPsgLUd6
 p9aQ==
X-Gm-Message-State: AOAM530dXBJYOFPtrf5gO/twP/Ysx3MkxrpsKd9Y6cl7J7M+uPiZVMkp
 mBe2Pfwm6/YcXvq/FJHLW/c=
X-Google-Smtp-Source: ABdhPJzr7oHg7MTBAI3+owVDJIK1vt/ornWUlfReakoR7xSULIIpwpRPujImZMAJl0I7owUmm+yUFQ==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr11259168wmc.188.1598524701938; 
 Thu, 27 Aug 2020 03:38:21 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x2sm5673134wrg.73.2020.08.27.03.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:38:21 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:38:20 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 17/38] tools/misc: drop all libxc internals from
 xen-mfndump.c
Message-ID: <20200827103820.xh7zrbtsfo5f2pdw@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-18-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-18-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:34:58AM +0200, Juergen Gross wrote:
> The last libxc internal used by xen-mfndump.c is the ERROR() macro.
> Add a simple definition for that macro to xen-mfndump.c and replace
> the libxc private header includes by official ones.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

