Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28B28CB09
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 11:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6129.16122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSGcg-0004ve-BV; Tue, 13 Oct 2020 09:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6129.16122; Tue, 13 Oct 2020 09:29:34 +0000
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
	id 1kSGcg-0004vF-8F; Tue, 13 Oct 2020 09:29:34 +0000
Received: by outflank-mailman (input) for mailman id 6129;
 Tue, 13 Oct 2020 09:29:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ic0I=DU=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1kSGce-0004vA-Q8
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 09:29:32 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b72c0482-99b7-4dd0-9f51-e469e445e253;
 Tue, 13 Oct 2020 09:29:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 13so20253413wmf.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 02:29:32 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q10sm28340120wrp.83.2020.10.13.02.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 02:29:30 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ic0I=DU=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
	id 1kSGce-0004vA-Q8
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 09:29:32 +0000
X-Inumbo-ID: b72c0482-99b7-4dd0-9f51-e469e445e253
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b72c0482-99b7-4dd0-9f51-e469e445e253;
	Tue, 13 Oct 2020 09:29:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 13so20253413wmf.0
        for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 02:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XztsDfCag2OaDzPERC4MA77k+MHx9zhekJXMdA2e2eU=;
        b=s95VKn07T2bNtZWZu6p0stAWjlDuBbdq7CSIeJ76quK4ef2L2Mawv2rlKDia3vj4a1
         VG2E8Db4/VDlIGd/dTTjsSqQIMS2IgPswBo/UaNt7U8z9FhMV2oB1cbTDpKsg6qNUxoY
         3VeFlDCH2+fUXTAE1UAzVSsic24M0/Xn2eFwsvzCgcOHN3B1L9ydnBEhZVjwF435YGfP
         lc/Iqvd4xddZJraiRwm/1h7ymAYPlSqAnHrtuo0yy9UdfvqBw1z0cl6mB/l1J2s24J8t
         l9Y2FUo3GCjapxtlx/DxdkojkjJ6TJHs3oK38jtPxdT8OxCRvuoOfhXl87IhWzjOzEVI
         Ot+A==
X-Gm-Message-State: AOAM5303K0+qt2nE17xGMZLnjHDrdt6iCgKFSRSfAo4+YiRCiY8eCEtK
	9zvbErYfMJWEWVvhf+7P1ko=
X-Google-Smtp-Source: ABdhPJx0npD3RdFJFlFyHcMgUiTbRjOKNo/TN4PiS1YSPMSJ8oGCSimgWDNQzF8MtoV95myhstqMXw==
X-Received: by 2002:a05:600c:21d3:: with SMTP id x19mr10039455wmj.170.1602581371318;
        Tue, 13 Oct 2020 02:29:31 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id q10sm28340120wrp.83.2020.10.13.02.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 02:29:30 -0700 (PDT)
Date: Tue, 13 Oct 2020 09:29:29 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Olivier Lambert <olivier.lambert@vates.fr>
Subject: Re: [OSSTEST PATCH 16/82] abolish "kernkind"; desupport non-pvops
 kernels
Message-ID: <20201013092929.4xq6l3asckn7setl@liuwe-devbox-debian-v2>
References: <20201007180024.7932-1-iwj@xenproject.org>
 <20201007180024.7932-17-iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007180024.7932-17-iwj@xenproject.org>
User-Agent: NeoMutt/20180716

On Wed, Oct 07, 2020 at 06:59:18PM +0100, Ian Jackson wrote:
> From: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> This was for distinguishing the old-style Xenolinux kernels from pvops
> kernels.
> 
> We have not actually tested any non-pvops kernels for a very very long
> time.  Delete this now because the runvar is slightly in the way of
> test host reuse.
> 
> (Sorry for the wide CC but it seems better to make sure anyone who
> might object can do so.)

No objection from me FWIW.

Wei.

