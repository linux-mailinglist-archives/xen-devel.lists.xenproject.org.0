Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90BF27443E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:27:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjGh-0005Qt-7a; Tue, 22 Sep 2020 14:27:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1J9w=C7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKjGf-0005Qb-Ez
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:27:41 +0000
X-Inumbo-ID: 62d75ccf-74bd-4d2b-924f-4a5529ecf548
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62d75ccf-74bd-4d2b-924f-4a5529ecf548;
 Tue, 22 Sep 2020 14:27:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600784859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbqvo7jQY7nww+t3e/LQx59i31HUUyEw9SuY710wtGA=;
 b=k4kNif04DpG6L3exNN7PJsrRETF0KZKPYmSIlKyzefqHP1Apis9604LaPGbhL+9AWsRYJm
 cOoQi3PxybpnaK0eyYHMkDXJ4a7kgeWaTo3Bm71UILANWhRNPc1YbI3IkDTU4AGxV4GEg7
 dqebd0HhEQ8YQWpVd8M8PhRNXF+UfGA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6354CACC2;
 Tue, 22 Sep 2020 14:28:16 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] xen-blkfront: Apply changed parameter name to the
 document
To: SeongJae Park <sjpark@amazon.com>, konrad.wilk@oracle.com,
 roger.pau@citrix.com
Cc: SeongJae Park <sjpark@amazon.de>, axboe@kernel.dk, aliguori@amazon.com,
 amit@kernel.org, mheyne@amazon.de, pdurrant@amazon.co.uk,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200922141549.26154-1-sjpark@amazon.com>
 <20200922141549.26154-4-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0171c36f-138b-8f53-7cb7-3b753c7f23dd@suse.com>
Date: Tue, 22 Sep 2020 16:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922141549.26154-4-sjpark@amazon.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.09.20 16:15, SeongJae Park wrote:
> From: SeongJae Park <sjpark@amazon.de>
> 
> Commit 14e710fe7897 ("xen-blkfront: rename indirect descriptor
> parameter") changed the name of the module parameter for the maximum
> amount of segments in indirect requests but missed updating the
> document.  This commit updates the document.
> 
> Signed-off-by: SeongJae Park <sjpark@amazon.de>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

