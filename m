Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6A4CC198
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 16:38:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283472.482488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnWz-0005qI-5o; Thu, 03 Mar 2022 15:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283472.482488; Thu, 03 Mar 2022 15:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnWz-0005oT-2q; Thu, 03 Mar 2022 15:38:17 +0000
Received: by outflank-mailman (input) for mailman id 283472;
 Thu, 03 Mar 2022 15:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bD3B=TO=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nPnWy-0005oN-IB
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 15:38:16 +0000
Received: from ppsw-41.csi.cam.ac.uk (ppsw-41.csi.cam.ac.uk [131.111.8.141])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f033d1ee-9b07-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 16:38:14 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44996)
 by ppsw-41.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nPnWs-0010K9-QR (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 03 Mar 2022 15:38:10 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E56711FB21;
 Thu,  3 Mar 2022 15:38:09 +0000 (GMT)
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
X-Inumbo-ID: f033d1ee-9b07-11ec-8eba-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e23e8804-8ee8-aba0-af6e-c5967f8611a7@srcf.net>
Date: Thu, 3 Mar 2022 15:38:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] build: export potentially overridden tool chain
 components
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <ff363631-bf5c-83a8-ccc4-15ddd1eb1d3c@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <ff363631-bf5c-83a8-ccc4-15ddd1eb1d3c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2022 16:11, Jan Beulich wrote:
> When overriding the tool chain via CROSS_COMPILE, the resulting
> components need to be made available to, in particular (but not limited
> to) the check-endbr.sh script. Note that we don't allow overriding
> ADDR2LINE yet; this would first require additions to some config/*.mk
> before it would make sense to export the resulting variable as well.
>
> The lack of NM exporting was apparently not a problem so far, but add it
> at this occasion as well - we're using the tool, after all.
>
> Fixes: 4d037425dccf ("x86: Build check for embedded endbr64 instructions")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

