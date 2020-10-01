Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA2B27FDDF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1197.4009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwGh-00014a-Bw; Thu, 01 Oct 2020 10:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197.4009; Thu, 01 Oct 2020 10:56:59 +0000
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
	id 1kNwGh-00014B-87; Thu, 01 Oct 2020 10:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1197;
 Thu, 01 Oct 2020 10:56:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNwGf-000140-GB
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:56:57 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89ae8e78-3b30-440d-8da1-5d39ff710382;
 Thu, 01 Oct 2020 10:56:56 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w5so5137633wrp.8
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:56:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 76sm8804381wma.42.2020.10.01.03.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:56:55 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNwGf-000140-GB
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:56:57 +0000
X-Inumbo-ID: 89ae8e78-3b30-440d-8da1-5d39ff710382
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 89ae8e78-3b30-440d-8da1-5d39ff710382;
	Thu, 01 Oct 2020 10:56:56 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w5so5137633wrp.8
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1XWcXD6FFUKsSbEt2l0rT2x4DcMcLdIMbmuD92O09kM=;
        b=g+3plM+bY/dAQX5U4p0NnkOUZf8mc0c/as/7JWYT3iZ52bwDWOHzgtK1rFOgZkgSq5
         oVoizG2BvO1niR43GuM1nD4SmFjcWuT140P38gLt8g+CQjrIXkvSN5CY0bLrg1kz+1iO
         R+Pm+pT90sUMRXK4hEp5bh7ulSY0JyOlB+zHEKVonUaGBPDlYcBVULjXj3yUOk00JQho
         k3xA70rO5JkwLqWtiRp0tK1FC2o7fU8jMs6MjmYi4vC1Wjxqs1rQVcGVrGW+xcxRD8ie
         fCd8qyD9/kOPKM25Hi/cGd0wtzcGTl4oMiNwHzRiXq3J1q6t2VMrnX0/6+YDx35Qc5p3
         qItg==
X-Gm-Message-State: AOAM532uGxm8BtNePe1EYMu6g3aNmhbir0ebArn8W4sRjsy+DtwefGgn
	Ydjm2v45AsDqh+bKj93fNHo=
X-Google-Smtp-Source: ABdhPJyOPqp5FcwJ+Ph8VeXnlUdUKpXUf9Ltc/lGefwL1TxBLNHKjGkUP+Tv5huKOtEs16Mdavg8bA==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr8011710wrq.424.1601549816158;
        Thu, 01 Oct 2020 03:56:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id 76sm8804381wma.42.2020.10.01.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:56:55 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:56:54 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 4/8] tools/cpuid: Plumb nested_virt down into
 xc_cpuid_apply_policy()
Message-ID: <20201001105654.kpx2sxehk6ca5vc7@liuwe-devbox-debian-v2>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930134248.4918-5-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 30, 2020 at 02:42:44PM +0100, Andrew Cooper wrote:
> Nested Virt is the final special case in legacy CPUID handling.  Pass the
> (poorly named) nested_hvm setting down into xc_cpuid_apply_policy() to break
> the semantic dependency on HVM_PARAM_NESTEDHVM.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This has gone in.

