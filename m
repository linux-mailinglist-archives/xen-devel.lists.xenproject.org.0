Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E24E558A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 16:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293937.499543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX38x-0007Hm-MR; Wed, 23 Mar 2022 15:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293937.499543; Wed, 23 Mar 2022 15:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX38x-0007ER-Ix; Wed, 23 Mar 2022 15:43:27 +0000
Received: by outflank-mailman (input) for mailman id 293937;
 Wed, 23 Mar 2022 15:43:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y+6b=UC=roeck-us.net=linux@srs-se1.protection.inumbo.net>)
 id 1nX38w-0007Dg-9t
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 15:43:26 +0000
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.47.125]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f88f7f6a-aabf-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 16:43:23 +0100 (CET)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 5658F3776
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:43:22 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id X38snZIvHXvvJX38snu5R1; Wed, 23 Mar 2022 10:43:22 -0500
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:57638 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nX38q-0034li-Mc; Wed, 23 Mar 2022 15:43:20 +0000
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
X-Inumbo-ID: f88f7f6a-aabf-11ec-a405-831a346695d4
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
	To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lagRXHohghy8kR3woCuBBmkrcJ/jzmeeFU/A5c+1noo=; b=SKVgFgGANbObFf6amjfV24eu+h
	n0xWMkM27kPmvFAgvKcqFv+hfIHThLfoWcRnd1X8xFUcQP3HR13LA4VzmRqW+O6FeAgRVxjx27KSe
	hl2iN+faBt50LA0zMJAn8QRAKthN0v2Vcku3E5ajko0c30LSgmQO+U3vw8gVUULYf32KGgJo+PCIE
	flVfEntmD6Pxj237DGMtNbwdJvCMhuo0fSfOesmqg5BySHh87KeT7TljcegAXg6iNDlRbUWxBpB1P
	33QYer1vvhIIEQ4VhMb6a9eCkP1nCGe/5sBMPEQF8lCzmBRQ54ViRtb5zi3O8POeIPCXsSH7hXR8d
	33EJ51dQ==;
Date: Wed, 23 Mar 2022 08:43:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Cc: Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.co>,
	device-mapper development <dm-devel@redhat.com>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: Re: [dm-devel] [PATCH 01/19] fs: remove mpage_alloc
Message-ID: <20220323154319.GA2268247@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nX38q-0034li-Mc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57638
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 18
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes

On Wed, Mar 23, 2022 at 07:42:48AM +0100, Christoph Hellwig wrote:
> On Wed, Mar 23, 2022 at 06:38:22AM +0900, Ryusuke Konishi wrote:
> > This looks because the mask of GFP_KERNEL is removed along with
> > the removal of mpage_alloc().
> > 
> 
> > The default value of the gfp flag is set to GFP_HIGHUSER_MOVABLE by
> > inode_init_always().
> > So, __GFP_HIGHMEM hits the gfp warning at bio_alloc() that
> > do_mpage_readpage() calls.
> 
> Yeah.  Let's try this to match the iomap code:
> 
> diff --git a/fs/mpage.c b/fs/mpage.c
> index 9ed1e58e8d70b..d465883edf719 100644
> --- a/fs/mpage.c
> +++ b/fs/mpage.c
> @@ -148,13 +148,11 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
>  	int op = REQ_OP_READ;
>  	unsigned nblocks;
>  	unsigned relative_block;
> -	gfp_t gfp;
> +	gfp_t gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
>  
>  	if (args->is_readahead) {
>  		op |= REQ_RAHEAD;
> -		gfp = readahead_gfp_mask(page->mapping);
> -	} else {
> -		gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
> +		gfp |= __GFP_NORETRY | __GFP_NOWARN;
>  	}
>  
>  	if (page_has_buffers(page))

That fixes the problem for me.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

