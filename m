Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF67D2DB08D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 16:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54341.94350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCfX-0006MP-Au; Tue, 15 Dec 2020 15:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54341.94350; Tue, 15 Dec 2020 15:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCfX-0006M0-7X; Tue, 15 Dec 2020 15:55:19 +0000
Received: by outflank-mailman (input) for mailman id 54341;
 Tue, 15 Dec 2020 15:55:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpCfW-0006Lv-AK
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 15:55:18 +0000
Received: from mail-wr1-f53.google.com (unknown [209.85.221.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ab1e6a3-f180-460d-a483-a1b602cf2312;
 Tue, 15 Dec 2020 15:55:17 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id a12so20333576wrv.8
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 07:55:17 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n3sm39392747wrw.61.2020.12.15.07.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:55:16 -0800 (PST)
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
X-Inumbo-ID: 2ab1e6a3-f180-460d-a483-a1b602cf2312
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+OD5sbekjUDQfZrpR66mCLgwBNZhOjRrfTta/GMA2Lo=;
        b=gfEF3z3faFOY5BxM/HMipLtbfht3FKhfp+HNMYxQyVmGTZvT87u0b5zxMqKi4pEu9U
         S5zIr9p2qVXckBLeUuznTXLreRtpB3kkgYT3MuhEUdsnaRoQeJOBt9UVnCyPhEK405Ak
         y19bfpS1ZT40JvR5SrQeljJE7K6o10y4efZFR6qOzKGc0PsMLjZeFjvdkxZTvsmwXNVi
         whBY8TEvbayJ9Kutk2ohgWo3BZ1ul93ZbFU0X37d0sfOj0v5Nrs+eWANsgH7tN6swmIG
         qCkNT33ViV5LEwZjuaDjKsuDQA5eJV4bQQs46jxLsiGmNH5qSNIGehRLOORUBuc1C2vG
         6g5A==
X-Gm-Message-State: AOAM531e7/i2VGsHYAOYHa2GFRjs6Jd2/qtL6N/AyfP9zZs15N6pXwnb
	M8eC3R6c1t4d01bR4ihXA4A=
X-Google-Smtp-Source: ABdhPJwWA0ZSaerNPmeoMDrvCF/3i9/BFri1QrxJiX0qH899NZSlzwSvE1NsBUq2X1/FRkuEZrB81A==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr35035673wrt.209.1608047716642;
        Tue, 15 Dec 2020 07:55:16 -0800 (PST)
Date: Tue, 15 Dec 2020 15:55:14 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] tools/xenstore: rework path length check
Message-ID: <20201215155514.3yu2frm76vc3lxbf@liuwe-devbox-debian-v2>
References: <20201215150411.9987-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215150411.9987-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Dec 15, 2020 at 04:04:11PM +0100, Juergen Gross wrote:
> The different fixed limits for absolute and relative path lengths of
> Xenstore nodes make it possible to create per-domain nodes via
> absolute paths which are not accessible using relative paths, as the
> two limits differ by 1024 characters.
> 
> Instead of this weird limits use only one limit, which applies to the
> relative path length of per-domain nodes and to the absolute path
> length of all other nodes. This means, the path length check is
> applied to the path after removing a possible start of
> "/local/domain/<n>/" with <n> being a domain id.
> 
> There has been the request to be able to limit the path lengths even
> more, so an additional quota is added which can be applied to path
> lengths. It is XENSTORE_REL_PATH_MAX (2048) per default, but can be
> set to lower values. This is done via the new "-M" or "--path-max"
> option when invoking xenstored.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Acked-by: Julien Grall <jgrall@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

