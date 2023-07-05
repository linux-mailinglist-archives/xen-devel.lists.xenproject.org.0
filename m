Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 428657487C2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:19:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559299.874178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Hw-0008Sy-0j; Wed, 05 Jul 2023 15:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559299.874178; Wed, 05 Jul 2023 15:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Hv-0008Qf-U2; Wed, 05 Jul 2023 15:19:27 +0000
Received: by outflank-mailman (input) for mailman id 559299;
 Wed, 05 Jul 2023 15:19:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xpdo=CX=gmail.com=bart.vanassche@srs-se1.protection.inumbo.net>)
 id 1qH4Hu-0008Q7-NA
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:19:26 +0000
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5325d743-1b47-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 17:19:25 +0200 (CEST)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-783546553ddso241845339f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 08:19:25 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:c1f1:7d21:6172:cbd2?
 ([2620:15c:211:201:c1f1:7d21:6172:cbd2])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b005579c73d209sm15456631pgt.1.2023.07.05.08.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:19:23 -0700 (PDT)
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
X-Inumbo-ID: 5325d743-1b47-11ee-b237-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688570364; x=1691162364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhOVd+fM39By6Neo4SNlvIwXWgDBhgramNmEhS79nFc=;
        b=Z97UNyDgzNS3xSouwOAlvgti1JhvSIgx2MkBRWZzcN6zUYAeBeA+QCZzHcCVC2jyY1
         ZaHMsmLQly1JWFwRtzWCJNrMc4u6NBM6AipTtT7xUnYAs8TAr9BnOJOkYtEIn9t3iuY6
         xBMZnZzYEbix5X4XdtfJ9tgVo5Q9bCIzj9vEDNmteamI71pL888CyS4wIlxFemaEU+IW
         TFmOAMexP4GbSMyV+Qfq/Ri8VtFsmexFM6Y+DGCmga9IIj3EuG7toPFc/dL/TZATtf8e
         KgfV0rg3EhWQYVMcD+AVO3V4f/7WRikoV2jBUW+vb1gUpikJJBL52MKwyMX+ibYbiz/C
         ejyg==
X-Gm-Message-State: AC+VfDx7h2A9XPArpLT1xtET4nuhWLGQZlN1lealuIvKn6XXMqFDMhZY
	NQyCuk8dobNvqVnQCCZzTxg=
X-Google-Smtp-Source: ACHHUZ70uoI88DRVhGiNe4v8NMOn4CckRug5A25bO6UrnrhXn4O+oQb9CB+u9z1UucgpvIObIHjohw==
X-Received: by 2002:a05:6602:2113:b0:784:314f:8d68 with SMTP id x19-20020a056602211300b00784314f8d68mr18093430iox.1.1688570364015;
        Wed, 05 Jul 2023 08:19:24 -0700 (PDT)
Message-ID: <1ea08f84-f900-92f2-e32b-2db242a74559@acm.org>
Date: Wed, 5 Jul 2023 08:19:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@infradead.org>, Alasdair Kergon <agk@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Anna Schumaker <anna@kernel.org>,
 Chao Yu <chao@kernel.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
 dm-devel@redhat.com, drbd-dev@lists.linbit.com, Gao Xiang
 <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Joern Engel <joern@lazybastard.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Kent Overstreet <kent.overstreet@gmail.com>,
 linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-xfs@vger.kernel.org, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
 ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Song Liu <song@kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, target-devel@vger.kernel.org,
 Ted Tso <tytso@mit.edu>, Trond Myklebust <trond.myklebust@hammerspace.com>,
 xen-devel@lists.xenproject.org
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>
 <ZKRFSZQglwCba9/i@casper.infradead.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ZKRFSZQglwCba9/i@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/23 09:14, Matthew Wilcox wrote:
> On Tue, Jul 04, 2023 at 07:06:26AM -0700, Bart Van Assche wrote:
>> On 7/4/23 05:21, Jan Kara wrote:
>>> +struct bdev_handle {
>>> +	struct block_device *bdev;
>>> +	void *holder;
>>> +};
>>
>> Please explain in the patch description why a holder pointer is introduced
>> in struct bdev_handle and how it relates to the bd_holder pointer in struct
>> block_device. Is one of the purposes of this patch series perhaps to add
>> support for multiple holders per block device?
> 
> That is all in patch 0/32.  Why repeat it?

This cover letter: https://lore.kernel.org/linux-block/20230629165206.383-1-jack@suse.cz/T/#t?

The word "holder" doesn't even occur in that cover letter so how could the
answer to my question be present in the cover letter?

Bart.


