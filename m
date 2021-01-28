Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8E8307B4B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 17:49:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77248.139800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AU7-0006aB-Nq; Thu, 28 Jan 2021 16:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77248.139800; Thu, 28 Jan 2021 16:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AU7-0006Zm-KI; Thu, 28 Jan 2021 16:49:31 +0000
Received: by outflank-mailman (input) for mailman id 77248;
 Thu, 28 Jan 2021 16:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5AU6-0006Zh-I2
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:49:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9746dd0-9026-41cf-b1bf-670ad6725a72;
 Thu, 28 Jan 2021 16:49:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD16AAD5C;
 Thu, 28 Jan 2021 16:49:28 +0000 (UTC)
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
X-Inumbo-ID: d9746dd0-9026-41cf-b1bf-670ad6725a72
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611852569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZdYh7jzmjVtcxaaxK5x4pS20kBrfOS+U6zjtM3Ks14=;
	b=a3GhVBmLlEgvRNYrbFLxxD9/1gvLVS8MWsGxaKSHgPX4M0vRoKWoYFi1/jSyU9XbAsz6bd
	KtuZWQGFtGZIxGehHaaGnIacsuGOtQRqKSswHgkFiY1g/m0RfLB4DjDE06YoUO+OjibFVa
	tYxS0YXsBQwfW8zrP3ohsGSkm9JfYfM=
Subject: Re: [PATCH] xen-release-management doc: More info on schedule
To: Ian Jackson <iwj@xenproject.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Paul Durrant <xadimgnik@gmail.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210128163538.13922-1-iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf93f027-e831-8fcb-7539-c9ed0c7585d9@suse.com>
Date: Thu, 28 Jan 2021 17:49:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128163538.13922-1-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.01.2021 17:35, Ian Jackson wrote:
> This documents our practice, established in 2018
>   https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html
> et seq
> 
> CC: Jürgen Groß <jgross@suse.com>
> CC: Paul Durrant <xadimgnik@gmail.com>
> CC: Wei Liu <wl@xen.org>
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> ---
>  docs/process/xen-release-management.pandoc | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/process/xen-release-management.pandoc b/docs/process/xen-release-management.pandoc
> index e1aa1eda8f..a5d70fed67 100644
> --- a/docs/process/xen-release-management.pandoc
> +++ b/docs/process/xen-release-management.pandoc
> @@ -15,8 +15,10 @@ that they can have an idea what to expect from the Release Manager.
>  
>  # Xen release cycle
>  
> -The Xen hypervisor project now releases every 8 months. The actual release date
> -depends on a lot of factors.
> +The Xen hypervisor project now releases every 8 months.  We aim to
> +release in the first half of March/July/November.  These dates have
> +been chosen to avoid major holidays and cultural events; if one
> +release slips, ideally the previous release cycle would be shortened.

s/previous/subsequent/ ?

> @@ -33,6 +35,12 @@ During freeze period, the tree is closed for new features. Only bug fixes are
>  accepted. This period can be shorter or longer than 2 months. If it ends up
>  longer than 2 months, it eats into the next development period.
>  
> +The precise release schedule depends on a lot of factors and needs to
> +be set afresh by the Release Manager in each release cycle.  When the
> +release is in March, particular consideration should be given to the
> +Chinese New Year holidaty which will then typically occur curing the
> +freeze, so the freeze should probably be extended to compensate.

s/curing/during/ I suppose, and there's a stray t in "holiday".

Lgtm apart from these - feel free to translate to an ack if you
think one is needed.

Jan

