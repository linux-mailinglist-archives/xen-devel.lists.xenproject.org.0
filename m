Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12ED23ED91
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 14:54:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k41st-0006Rw-1h; Fri, 07 Aug 2020 12:54:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k41ss-0006Rr-Gd
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 12:54:06 +0000
X-Inumbo-ID: aba66811-5e6b-4b43-84ed-3f6926986aee
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aba66811-5e6b-4b43-84ed-3f6926986aee;
 Fri, 07 Aug 2020 12:54:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C633AAB8B;
 Fri,  7 Aug 2020 12:54:22 +0000 (UTC)
Subject: Re: [PATCH 05/14] kernel-doc: public/features.h
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-5-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab1a0562-6fe0-9613-b6c9-a09714af02cf@suse.com>
Date: Fri, 7 Aug 2020 14:54:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806234933.16448-5-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: julien@xen.org, wl@xen.org, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.08.2020 01:49, Stefano Stabellini wrote:
> @@ -41,19 +41,25 @@
>   * XENFEAT_dom0 MUST be set if the guest is to be booted as dom0,
>   */
>  
> -/*
> - * If set, the guest does not need to write-protect its pagetables, and can
> - * update them via direct writes.
> +/**
> + * DOC: XENFEAT_writable_page_tables
> + *
> + * If set, the guest does not need to write-protect its pagetables, and
> + * can update them via direct writes.
>   */
>  #define XENFEAT_writable_page_tables       0

I dislike such redundancy (and it's more noticable here than with
the struct-s). Is there really no way for the tool to find the
right item, the more that in the cover letter you say that you
even need to get the placement right, i.e. there can't be e.g.
intervening #define-s?

Jan

