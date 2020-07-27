Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4004222F447
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 18:05:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k05cg-0001SS-7Y; Mon, 27 Jul 2020 16:05:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GrHA=BG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k05ce-0001SL-S9
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 16:05:04 +0000
X-Inumbo-ID: eec1f4f8-d022-11ea-8ad3-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eec1f4f8-d022-11ea-8ad3-bc764e2007e4;
 Mon, 27 Jul 2020 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X0e+T0Pm0z4vGKCKezjuosEdiWF70tt/kzl1QNExTa0=; b=ImSb7zIbrozq2lLcj8MDFbi6XK
 bTGzp65NQE7pyUn0if+xFNe6pI3mAiHRY4/TS2q1xGGAdR5HM1Ik10UEscF0L2vqBu8s+IdjBkr5s
 HayYiZsYZsMLnhe9qGZiR/T852WVBw1tsIDddt6Ry4FysOJS0zrYvch2OlVcGverjn60=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k05cb-00046l-VG; Mon, 27 Jul 2020 16:05:01 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k05cb-0000kX-NO; Mon, 27 Jul 2020 16:05:01 +0000
Subject: Re: [[XSATOOL]] repo: Add missing spaces in the configure cmdline for
 "xentools"
To: xen-devel@lists.xenproject.org
References: <20200727160415.717-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <0299389e-bb24-6ec9-9fb4-18cc7c4ec181@xen.org>
Date: Mon, 27 Jul 2020 17:04:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727160415.717-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hmmm I forgot to CC George. Sorry for that.

On 27/07/2020 17:04, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The operator + will just concatenate two strings. As the result, the
> configure cmdline for "xentools" will look like:
> 
> ./configure --disable-stubdom --disable-qemu-traditional--with-system-qemu=/bin/false --with-system-seabios=/bin/false--disable-ovmf
> 
> This can be avoided by explicitely adding the spaces.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   repo.go | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/repo.go b/repo.go
> index 1e7802f8142c..f00b7469101f 100644
> --- a/repo.go
> +++ b/repo.go
> @@ -139,8 +139,8 @@ func MainRepoInit(unused *XSAMeta, args []string) (ret int) {
>   	G.config.Tool.BuildSequences = map[string]BuildSequence{
>   		"simple": {"./configure", "make -j 8"},
>   		"xen":    {"make -j 8 xen"},
> -		"xentools": {"./configure --disable-stubdom --disable-qemu-traditional" +
> -			"--with-system-qemu=/bin/false --with-system-seabios=/bin/false" +
> +		"xentools": {"./configure --disable-stubdom --disable-qemu-traditional " +
> +			"--with-system-qemu=/bin/false --with-system-seabios=/bin/false " +
>   			"--disable-ovmf",
>   			"make -j 8"},
>   	}
> 

-- 
Julien Grall

