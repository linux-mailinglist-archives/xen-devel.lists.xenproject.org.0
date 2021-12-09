Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F322946E989
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 14:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243069.420369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJwE-0004X9-Ix; Thu, 09 Dec 2021 13:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243069.420369; Thu, 09 Dec 2021 13:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJwE-0004U3-Fu; Thu, 09 Dec 2021 13:58:22 +0000
Received: by outflank-mailman (input) for mailman id 243069;
 Thu, 09 Dec 2021 13:58:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mvJwC-0004Tx-Vo
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 13:58:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvJwB-0002Jt-Pw; Thu, 09 Dec 2021 13:58:19 +0000
Received: from [54.239.6.187] (helo=[192.168.16.79])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvJwB-0000Yb-K0; Thu, 09 Dec 2021 13:58:19 +0000
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
	bh=jUnuTu7eW3DUwd/XVt79ktjFQBNoQs0RQVL+3L+1F4w=; b=zZjKQKT4wReX25W8kX1CKUVK2G
	sQgRP319HiNFQTc/VaD88+xsYHR2siBphNZ2ttc8nNu3cxPza/l2qg54V6+FYi8mzxgOED3GsKXvx
	KXOQFHRQy5G6weH9CQGznAgmeFzCPYadkI/qeDiWRLY8rzzXEUnHHpf/AuUt4faaWupE=;
Message-ID: <6beb8e27-44ab-3b0b-2a88-7da86a0e99ef@xen.org>
Date: Thu, 9 Dec 2021 13:58:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: Xen on LFS
To: Sai Kiran Kumar Reddy <skiran@cimware.in>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <CAAQMfLr_mWgdM3v=smYZbx+t8zhCP7_aCecDPJLLGRu=MH9E0A@mail.gmail.com>
 <e421fc4b-afde-8bdc-9be0-859523512b9b@suse.com>
 <CAAQMfLrxpc=6L_mp_EuPq-B+EydrFGaVqb_MiyjELPQYXi0e=g@mail.gmail.com>
 <CAAQMfLrv_nL_w-VbjSypnY1Ptbe-K_Gq71ovVf5o1nDqwM9cgg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAAQMfLrv_nL_w-VbjSypnY1Ptbe-K_Gq71ovVf5o1nDqwM9cgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/12/2021 05:22, Sai Kiran Kumar Reddy wrote:
> Hi,

Hi,

> I have posted my query in xen-users mailing list one week ago. I was not 
> able to get any response from the community. Could you please look into 
> it and help me out here? I am trying to install xen(from source code), 
> on LInux from Scratch build system. I just want to know the list of xorg 
> packages, to be installed for Xen.

You might want to check your spam box as there were a few answers to the 
thread ([1], [2]).

Cheers,

[1] 
https://lists.xenproject.org/archives/html/xen-users/2021-12/msg00003.html
[2] 
https://lists.xenproject.org/archives/html/xen-users/2021-12/msg00003.html

> 
> Thanks in advance for your time and support.
> 
> Regards,
> Sai Kiran.
> 
> On Tue, Nov 30, 2021 at 12:58 PM Sai Kiran Kumar Reddy 
> <skiran@cimware.in <mailto:skiran@cimware.in>> wrote:
> 
>     Ok, thanks for the reply. Will do that.
> 
>     On Tue, Nov 30, 2021 at 12:52 PM Jan Beulich <jbeulich@suse.com
>     <mailto:jbeulich@suse.com>> wrote:
> 
>         On 30.11.2021 07:50, Sai Kiran Kumar Reddy wrote:
>          > I am Sai Kiran. I am currently working on installing xen on
>         Linux From
>          > Scratch(LFS) system. One of the dependencies of xen is "xorg"
>         package. This
>          > package is present in Beyond
>          > <https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html
>         <https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html>>
>         Linux From
>          > Scratch(BLFS)
>         <https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html
>         <https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html>>
>          > manual. But, there are a lot of packages to be installed. I
>         am not sure if
>          > all these packages are required for Xen. Also, is xorg a
>         must, to build and
>          > install xen?
>          >
>          > Kindly help me out here. Thanks in advance, for the support.
> 
>         Thanks for your interest, but I'm afraid your question isn't
>         fitting xen-devel.
>         Please raise it on xen-users.
> 
>         Jan
> 

-- 
Julien Grall

