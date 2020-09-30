Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F327EB2F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786.2619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdKp-0003Kh-1L; Wed, 30 Sep 2020 14:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786.2619; Wed, 30 Sep 2020 14:43:59 +0000
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
	id 1kNdKo-0003KH-UK; Wed, 30 Sep 2020 14:43:58 +0000
Received: by outflank-mailman (input) for mailman id 786;
 Wed, 30 Sep 2020 14:43:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdKn-0003KA-Qm
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:43:57 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6af5a439-95a1-4582-a711-6856c452e378;
 Wed, 30 Sep 2020 14:43:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v12so2063532wmh.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:43:57 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d2sm3371362wro.34.2020.09.30.07.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:43:54 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdKn-0003KA-Qm
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:43:57 +0000
X-Inumbo-ID: 6af5a439-95a1-4582-a711-6856c452e378
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6af5a439-95a1-4582-a711-6856c452e378;
	Wed, 30 Sep 2020 14:43:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v12so2063532wmh.3
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X1aDZWyMs6MLDHQFMZK16OnTHeYeCKW+BwK1NIDvm7E=;
        b=tjYVcytHMeZXN8e/eY3C+oN4QFkgnsCnXVrY8GhNjcEH/liUxBTYwIZmFo31zXaRd/
         pq8NjZy/CxCyz5SMXDKUfu2zZdW82uLkyNiU7xNAA/8Lu2Nl7eAI29YmitoCiGfIXnup
         i9GbWrDFhpN91ukYsE9kiu55TXqBJUJP8fdIa8hjGAZNtmax4vIN1JvF/uS83txzazrN
         P5Mn89/eR2ovOUSZO5oyGdQUatMHSLHyRhppU/BShHiIXMXwJCCPScXQQcVnfTx70wLl
         MKPKBkMKwZuHzakJvEEV2LRSTyEP6mgM6KPmj97CcGN0ofHKFkzwXy4unoX7eMWYVCeS
         HB7g==
X-Gm-Message-State: AOAM533Bsf3Onh5CcrQ2+Bv2AGmzMixZL+Unxcw/sI4AbfG+bsyQgwoB
	7cCpNhsICoO3PdkHpQHVEZ0=
X-Google-Smtp-Source: ABdhPJw8XqwMsYkSKNjAlIRv57Ww53r0RUwJ0kXtPb/Z8dC47IfyCTlD0g8Yuuuh8FTorWMnXieuuw==
X-Received: by 2002:a1c:a593:: with SMTP id o141mr3516994wme.88.1601477036420;
        Wed, 30 Sep 2020 07:43:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id d2sm3371362wro.34.2020.09.30.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:43:54 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:43:53 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 7/8] x86/time: add a domain context record for
 tsc_info...
Message-ID: <20200930144353.isbxm3pygzlnt34n@liuwe-devbox-debian-v2>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-8-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924131030.1876-8-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 02:10:29PM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and update xen-domctx to dump some information describing the record.
> 
> NOTE: Whilst the record definition is x86 specific, it is visible directly
>       in the common header as context record numbers should be unique across
>       all architectures.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

