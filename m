Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FEC5337D5
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 09:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336945.561398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlq0-0002N1-Ed; Wed, 25 May 2022 07:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336945.561398; Wed, 25 May 2022 07:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlq0-0002KM-Ac; Wed, 25 May 2022 07:53:48 +0000
Received: by outflank-mailman (input) for mailman id 336945;
 Wed, 25 May 2022 07:53:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntlpy-0002Ju-If
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 07:53:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntlpy-0002qc-8S; Wed, 25 May 2022 07:53:46 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntlpy-0003Cv-0P; Wed, 25 May 2022 07:53:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=6XRMyhjASiEEJfB1poaas4uLIGf9hJxiZhNXLOC21UI=; b=wHfYe5rm3H2ZNk482w5SSfekrr
	/IClC61VEcgpNle4LiDEujwjD/SHUf1kQW1TZql8uwyI0QWjILYMds/yNpOHKNOgLgXNPJ7a2XScV
	aSr1fJCorO+NoMSKuEU+Iux27cE5KFbhqGbXq0OcFMohSMDcM9soRV5U6AsdhmMtFb9w=;
Message-ID: <c07a17b6-b56a-ddc7-be97-7a20a193e4ec@xen.org>
Date: Wed, 25 May 2022 08:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHY1IDMvNl0gYXJtNjQvZmluZF9uZXh0?=
 =?UTF-8?B?X2JpdDogUmVtb3ZlIGV4dDJfc3dhYigp?=
To: =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <fd7137e91aa6132e2b6a19c53ecce2cac0295b55.1653314499.git.lin.liu@citrix.com>
 <1075e4a2-eb7c-6441-28c4-7dbc871f844d@xen.org>
 <SJ0PR03MB5405AAAC3BF864797314664D9DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <SJ0PR03MB5405AAAC3BF864797314664D9DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/05/2022 02:35, Lin Liu （刘林） wrote:
> 
>>> Hi,
> 
>>> On 23/05/2022 15:50, Lin Liu wrote:
>>> ext2 has nothing to do with this logic.
> 
>> You have again not addressed my comment. If you don't understand my comment then please ask.
> 
>> Cheers,
> 
>> --
>> Julien Grall
> 
> Sorry I missed this one as I saw this patch already got an some tags,

For smaller changes, we tend to provide the Reviewed-by/Acked-by at the 
same time. The comments may then be addressed on commit (if the 
committer is happy with that) or you could handle them on a respin.

>  I suppose your comment requires commit message update,

Yes. I would like the first sentence to be dropped or reworked.

> Will update it if a newer version is required.

Thanks! I would have committed now but AFAIU it depends on previous patches.

Cheers,

-- 
Julien Grall

