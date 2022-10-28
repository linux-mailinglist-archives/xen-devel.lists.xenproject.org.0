Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4E5610C8E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 10:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431810.684406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLBJ-0001AE-G7; Fri, 28 Oct 2022 08:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431810.684406; Fri, 28 Oct 2022 08:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLBJ-000188-C8; Fri, 28 Oct 2022 08:57:37 +0000
Received: by outflank-mailman (input) for mailman id 431810;
 Fri, 28 Oct 2022 08:57:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ooLBH-000182-Qe
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 08:57:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooLBH-0007M4-4M; Fri, 28 Oct 2022 08:57:35 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.25.146]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooLBG-0002qR-Tr; Fri, 28 Oct 2022 08:57:35 +0000
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
	bh=xc4rDD/Tjg4Cr4rqbTeGQCCMQ6E5SqAkGxeslyDT418=; b=jBOUSeY9lIkucCDLtyl29NJvXb
	gI1lFgUDB6/khDZJNtFJnCeIKAzlqBInhu39YJRSBbGLeeEm1fXmAu5v9SSwi6CoVNkMvzDdJ5SM4
	VwhRKskoxIA4zzReW+ZnlY91Cxoznxl1ojVcpGK7jmBENcQ3ZcuvhupHO+aySRwfiCdE=;
Message-ID: <e7c17d83-d9f2-bb9e-24ae-8bc44005deeb@xen.org>
Date: Fri, 28 Oct 2022 09:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: Feedback for postponing the 4.17 release to a week later
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>
References: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/10/2022 05:43, Henry Wang wrote:
> Hi all,

Hi Henry and others,

> Since there will be a batch of XSAs released on Nov. 1 [1] and the original date for
> the 4.17 release was supposed to be Nov. 2, I am thinking to postpone the 4.17
> release to a week later (Nov. 11) to give a little bit longer time so that:
> 
> - The security team won't do anything in rush.
> - We can have more feedback after merging these XSAs.
> - Include more release-relevant bugfixes.
> 
> May I please have some feedback on this proposal? Thanks very much!

Somewhat related. When should we branch for the release and set 
CONFIG_DEBUG=n?

I think we would at least need a RC with CONFIG_DEBUG=n but IIUC we 
usually do it at a point where the tree is nearly frozen.


AFAICT, there are still a few things in flight (including fix for 
XSA-409). So I am not sure we are in position yet to branch. Any opinions?

Cheers,

-- 
Julien Grall

