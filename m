Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066872B798E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29515.58995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJF2-0000r6-0K; Wed, 18 Nov 2020 08:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29515.58995; Wed, 18 Nov 2020 08:55:03 +0000
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
	id 1kfJF1-0000qh-TV; Wed, 18 Nov 2020 08:55:03 +0000
Received: by outflank-mailman (input) for mailman id 29515;
 Wed, 18 Nov 2020 08:55:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fGLJ=EY=suse.de=colyli@srs-us1.protection.inumbo.net>)
 id 1kfJF0-0000qc-9A
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:55:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e064198-e2d9-4ea2-bcd2-2901ae9ddd47;
 Wed, 18 Nov 2020 08:54:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65CA0AD45;
 Wed, 18 Nov 2020 08:54:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fGLJ=EY=suse.de=colyli@srs-us1.protection.inumbo.net>)
	id 1kfJF0-0000qc-9A
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:55:02 +0000
X-Inumbo-ID: 4e064198-e2d9-4ea2-bcd2-2901ae9ddd47
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4e064198-e2d9-4ea2-bcd2-2901ae9ddd47;
	Wed, 18 Nov 2020 08:54:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 65CA0AD45;
	Wed, 18 Nov 2020 08:54:57 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-20-hch@lst.de>
From: Coly Li <colyli@suse.de>
Subject: Re: [PATCH 19/20] bcache: remove a superflous lookup_bdev all
Message-ID: <e7f826fd-cb9c-b4ab-fae8-dad398c14eed@suse.de>
Date: Wed, 18 Nov 2020 16:54:51 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201118084800.2339180-20-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/18/20 4:47 PM, Christoph Hellwig wrote:
> Don't bother to call lookup_bdev for just a slightly different error
> message without any functional change.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>ist

Hi Christoph,

NACK. This removing error message is frequently triggered and observed,
and distinct a busy device and an already registered device is important
(the first one is critical error and second one is not).

Remove such error message will be a functional regression.

Coly Li

> ---
>  drivers/md/bcache/super.c | 44 +--------------------------------------
>  1 file changed, 1 insertion(+), 43 deletions(-)
> 
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index e5db2cdd114112..5c531ed7785280 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -2380,40 +2380,6 @@ kobj_attribute_write(register,		register_bcache);
>  kobj_attribute_write(register_quiet,	register_bcache);
>  kobj_attribute_write(pendings_cleanup,	bch_pending_bdevs_cleanup);
>  
> -static bool bch_is_open_backing(struct block_device *bdev)
> -{
> -	struct cache_set *c, *tc;
> -	struct cached_dev *dc, *t;
> -
> -	list_for_each_entry_safe(c, tc, &bch_cache_sets, list)
> -		list_for_each_entry_safe(dc, t, &c->cached_devs, list)
> -			if (dc->bdev == bdev)
> -				return true;
> -	list_for_each_entry_safe(dc, t, &uncached_devices, list)
> -		if (dc->bdev == bdev)
> -			return true;
> -	return false;
> -}
> -
> -static bool bch_is_open_cache(struct block_device *bdev)
> -{
> -	struct cache_set *c, *tc;
> -
> -	list_for_each_entry_safe(c, tc, &bch_cache_sets, list) {
> -		struct cache *ca = c->cache;
> -
> -		if (ca->bdev == bdev)
> -			return true;
> -	}
> -
> -	return false;
> -}
> -
> -static bool bch_is_open(struct block_device *bdev)
> -{
> -	return bch_is_open_cache(bdev) || bch_is_open_backing(bdev);
> -}
> -
>  struct async_reg_args {
>  	struct delayed_work reg_work;
>  	char *path;
> @@ -2535,15 +2501,7 @@ static ssize_t register_bcache(struct kobject *k, struct kobj_attribute *attr,
>  				  sb);
>  	if (IS_ERR(bdev)) {
>  		if (bdev == ERR_PTR(-EBUSY)) {
> -			bdev = lookup_bdev(strim(path));
> -			mutex_lock(&bch_register_lock);
> -			if (!IS_ERR(bdev) && bch_is_open(bdev))
> -				err = "device already registered";
> -			else
> -				err = "device busy";
> -			mutex_unlock(&bch_register_lock);
> -			if (!IS_ERR(bdev))
> -				bdput(bdev);
> +			err = "device busy";
>  			if (attr == &ksysfs_register_quiet)
>  				goto done;
>  		}
> 




