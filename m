Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776071A498E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 19:52:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMxou-0004dC-Ei; Fri, 10 Apr 2020 17:52:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aV0t=52=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMxos-0004d7-UK
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 17:51:58 +0000
X-Inumbo-ID: f916e9d2-7b53-11ea-848c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f916e9d2-7b53-11ea-848c-12813bfff9fa;
 Fri, 10 Apr 2020 17:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ABR9blzkQkfLbEGXMOr+wFV/u+UvWq0fc0fLjKHJPBU=; b=g7NG9yDOT8RPAbVbXL8OmgEd/0
 JjkJy8EKxKbZwwTDSXqX6bJlrc354eYQWR68TFzBHc344Q2v0mTyjw3+5XutsrWlKB/4xQsUoMEc2
 KotKqUSyrb6W8x59b/dqASgYblXg1LqDDJ9gQmWNbClKK9IqisZgmnKqR2yw81Cfgc6o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMxon-000479-TD; Fri, 10 Apr 2020 17:51:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMxon-0002kL-FB; Fri, 10 Apr 2020 17:51:53 +0000
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20200410164942.9747-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <2e4f1b20-34fa-dd77-9dcc-648be406119e@xen.org>
Date: Fri, 10 Apr 2020 18:51:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410164942.9747-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lars.kurth@citrix.com, konrad.wilk@oracle.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 10/04/2020 17:49, Stefano Stabellini wrote:
> Create a new document under docs/process to describe our special tags.
> For now, only add the new backport tag.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> Acked-by: Wei Liu <wl@xen.org>

Acked-by: Julien Grall <jgrall@amazon.com>

It would be good to get an ack by from Jan as he is the maintainer for 
stable's branch.

Cheers,

> CC: jbeulich@suse.com
> CC: george.dunlap@citrix.com
> CC: julien@xen.org
> CC: lars.kurth@citrix.com
> CC: andrew.cooper3@citrix.com
> CC: konrad.wilk@oracle.com
> 
> ---
> 
> This is the original thread: https://marc.info/?l=xen-devel&m=157324027614941
> 
> The backport tag was agreed upon. George requested the file to be
> renamed to something more generic, where we could add more information
> later.
> 
> I kept the original content and acked-by. I renamed the file to
> tags.pandoc.
> ---
>   docs/process/tags.pandoc | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100644 docs/process/tags.pandoc
> 
> diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
> new file mode 100644
> index 0000000000..e570efdcc8
> --- /dev/null
> +++ b/docs/process/tags.pandoc
> @@ -0,0 +1,23 @@
> +Backport Tag
> +------------
> +
> +A backport tag is an optional tag in the commit message to request a
> +given commit to be backported to the stable trees:
> +
> +    Backport: all
> +
> +It marks a commit for being a candidate for backports to all relevant
> +trees.
> +
> +    Backport: 4.9+
> +
> +It marks a commit for being a candidate for backports to all stable
> +trees from 4.9 onward.
> +
> +Maintainers request the Backport tag to be added on commit.
> +Contributors are also welcome to mark their patches with the Backport
> +tag when they deem appropriate. Maintainers will request for it to be
> +removed when that is not the case.
> +
> +Please note that the Backport tag is a **request** for backport, which
> +will still need to be evaluated by the stable tree maintainers.
> 

-- 
Julien Grall

