Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BBB27EB41
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788.2631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdMv-0003VI-EP; Wed, 30 Sep 2020 14:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788.2631; Wed, 30 Sep 2020 14:46:09 +0000
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
	id 1kNdMv-0003Ut-B9; Wed, 30 Sep 2020 14:46:09 +0000
Received: by outflank-mailman (input) for mailman id 788;
 Wed, 30 Sep 2020 14:46:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdMt-0003Un-M9
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:46:07 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cbe446b-ae96-4c96-87e8-5f24b9f6e30f;
 Wed, 30 Sep 2020 14:46:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t10so2134584wrv.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:46:05 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s12sm2961766wmd.20.2020.09.30.07.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:46:03 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdMt-0003Un-M9
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:46:07 +0000
X-Inumbo-ID: 5cbe446b-ae96-4c96-87e8-5f24b9f6e30f
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5cbe446b-ae96-4c96-87e8-5f24b9f6e30f;
	Wed, 30 Sep 2020 14:46:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t10so2134584wrv.1
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cw/7ZLzVX3TzLqAUggwPXAjDCxUT7OK3tLgh6X+FskA=;
        b=Xy9vOYDQz4ry6lEWLFX6z2NWQoCaWS7ucnJapa/Ig1mfNSu1n0wOeemdpbmmKW3G5A
         +gSy+E0i4alv0oamNih8Waj8mZnazcygebdbVh5P2q18uYexAdcQL+naN4s4uuP1Kj8o
         S+eSEUgnXWi/wY231+CD3mhgDWPR21/IWrUSOLOgpbu5+pHcGZejmSGywTzcMlpkatL3
         Qz9YSkPjr4sHnbrhk4gLJZoyPOnS4pfKyl2/VKbge8i9d17TIhnV0UoVKtNtmFCwCwsE
         yC9IE+YtpGfSZIBqcKJ038zmGC84mImfzyZsR7N293hRtAAPlycvi0E1B2msYHVeXqom
         TDcw==
X-Gm-Message-State: AOAM532hC0O2mwipPJiv9lfXK5nNHcPWvrIGe/AAUB8KUoF29q+KESJN
	IPfLDcDH0hTCY6IjuBkTkoc=
X-Google-Smtp-Source: ABdhPJwFvGmUYxNh3Gao3b9c8mHwE5zLUMIzWiM1b303DjVhLFrpUTxKW+21dQfSiyuQGM5yaSbkTg==
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr3632088wrr.269.1601477164317;
        Wed, 30 Sep 2020 07:46:04 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id s12sm2961766wmd.20.2020.09.30.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:46:03 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:46:02 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v9 8/8] tools/libxc: add DOMAIN_CONTEXT records to the
 migration stream...
Message-ID: <20200930144602.m225dn7t4yajwwi3@liuwe-devbox-debian-v2>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-9-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924131030.1876-9-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 02:10:30PM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and bump the version.
> 
> This patch implements version 4 of the migration stream by adding the code
> necessary to save and restore DOMAIN_CONTEXT records, and removing the code
> to save the SHARED_INFO and TSC_INFO records (as these are deprecated in
> version 4).
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

Again, I think Andrew should have a look at this as well.

