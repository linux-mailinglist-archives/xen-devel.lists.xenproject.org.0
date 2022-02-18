Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6FB4BB90F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 13:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275340.471168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL2Ht-0001Wa-Gb; Fri, 18 Feb 2022 12:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275340.471168; Fri, 18 Feb 2022 12:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL2Ht-0001Te-D3; Fri, 18 Feb 2022 12:23:01 +0000
Received: by outflank-mailman (input) for mailman id 275340;
 Fri, 18 Feb 2022 12:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N23X=TB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nL2Hr-0001TS-8B
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 12:22:59 +0000
Received: from ppsw-30.csi.cam.ac.uk (ppsw-30.csi.cam.ac.uk [131.111.8.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81c8a641-90b5-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 13:22:58 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:57546)
 by ppsw-30.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nL2Hm-000v0m-eD (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 18 Feb 2022 12:22:54 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 42D871FDB0;
 Fri, 18 Feb 2022 12:22:54 +0000 (GMT)
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
X-Inumbo-ID: 81c8a641-90b5-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e8be7a6e-162d-bd5d-5955-77e4fa4c3e77@srcf.net>
Date: Fri, 18 Feb 2022 12:22:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] coverity: do not build QEMU, SeaBIOS or OVMF
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220218120042.32102-1-roger.pau@citrix.com>
 <20220218120042.32102-3-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220218120042.32102-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/02/2022 12:00, Roger Pau Monne wrote:
> Such external projects should have their own Coverity runs, and
> there's not much point in also making them part of our scan (apart
> from greatly increasing the amount of code scanned).
>
> Trim the dependencies now that QEMU is not built.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

