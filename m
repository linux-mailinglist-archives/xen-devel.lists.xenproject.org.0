Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36885239F33
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 07:45:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2TH4-0005YB-DB; Mon, 03 Aug 2020 05:44:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k2TH2-0005Y6-W8
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 05:44:37 +0000
X-Inumbo-ID: 69a95854-d54c-11ea-aef4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69a95854-d54c-11ea-aef4-12813bfff9fa;
 Mon, 03 Aug 2020 05:44:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B2BAAC20;
 Mon,  3 Aug 2020 05:44:50 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] Few bug fixes and Convert to pin_user_pages*()
To: Souptick Joarder <jrdr.linux@gmail.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
References: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b26b61b9-de1f-b86c-be8b-049fa412b509@suse.com>
Date: Mon, 3 Aug 2020 07:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Paul Durrant <xadimgnik@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.07.20 05:39, Souptick Joarder wrote:
> This series contains few clean up, minor bug fixes and
> Convert get_user_pages() to pin_user_pages().
> 
> I'm compile tested this, but unable to run-time test,
> so any testing help is much appriciated.
> 
> v2:
>          Addressed few review comments and compile issue.
>          Patch[1/2] from v1 split into 2 in v2.
> v3:
> 	Address review comment. Add review tag.
> 
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Paul Durrant <xadimgnik@gmail.com>
> 
> Souptick Joarder (3):
>    xen/privcmd: Corrected error handling path
>    xen/privcmd: Mark pages as dirty
>    xen/privcmd: Convert get_user_pages*() to pin_user_pages*()
> 
>   drivers/xen/privcmd.c | 32 ++++++++++++++------------------
>   1 file changed, 14 insertions(+), 18 deletions(-)
> 

Series pushed to xen/tip.git for-linus-5.9


Juergen

