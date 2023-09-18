Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521187A50F6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 19:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604154.941389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiI1q-0000KS-8B; Mon, 18 Sep 2023 17:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604154.941389; Mon, 18 Sep 2023 17:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiI1q-0000IP-5S; Mon, 18 Sep 2023 17:27:22 +0000
Received: by outflank-mailman (input) for mailman id 604154;
 Mon, 18 Sep 2023 17:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6qG=FC=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qiI1p-0000IE-39
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 17:27:21 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bfb9e38-5648-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 19:27:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 61326828563B;
 Mon, 18 Sep 2023 12:27:14 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YszbF0qGjcGP; Mon, 18 Sep 2023 12:27:13 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 912E58285708;
 Mon, 18 Sep 2023 12:27:13 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bfHTCTc1wiXn; Mon, 18 Sep 2023 12:27:13 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id AD494828563B;
 Mon, 18 Sep 2023 12:27:12 -0500 (CDT)
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
X-Inumbo-ID: 9bfb9e38-5648-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 912E58285708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695058033; bh=sUVH4tDCN4+gu6lquUx2ptWAO9cS/I0muY3URWeoBJY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=YOzTi3k9f8l+bNqt614JJzGOVh0XrGR95NO2U/RjyZvRTU71F06GZIbGR2AUXbEBm
	 fGe4hNZAYmTHrrdEZ4CBmoewSX2YMWwsVIfdHwhie8uiZQXWlpy7TQj17a1yPw3cwK
	 KXs1IDqON0Fzz6/GKu87Ut5idDsTVdgv0RvzRxgM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <daaff015-6da1-8daa-d8b3-3618c89bc799@raptorengineering.com>
Date: Mon, 18 Sep 2023 12:27:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 0/4] ppc: Enable full Xen build
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1694717278.git.sanastasio@raptorengineering.com>
 <d3f04552-28d3-8745-3def-b7c341f8b76b@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <d3f04552-28d3-8745-3def-b7c341f8b76b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/23 8:19 AM, Jan Beulich wrote:
> On 14.09.2023 21:03, Shawn Anastasio wrote:
>> Shawn Anastasio (4):
>>   xen/ppc: Implement bitops.h
>>   xen/ppc: Define minimal stub headers required for full build
> 
> Compilation fails after applying this.
> 
>>   xen/ppc: Add stub function and symbol definitions
> 
> Continuing nevertheless, linking fails after this.
> 
>>   xen/ppc: Enable full Xen build
> 
> Things build okay for me when the full series is applied. Generally we
> wouldn't deliberately break the build between any two patches; doing so
> may be okay here (except I guest CI's build-each-commit would be upset),
> but I'll do so only upon explicit request (and with no-one else objecting).
>

Sorry about that. Going forward I'll take more care to ensure that
partially-applied series still build correctly. For this series though,
if you could make an exception it would be appreciated.

> Jan

Thanks,
Shawn

