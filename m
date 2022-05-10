Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E70E5212C2
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 12:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325388.547955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNSQ-0005Z8-RN; Tue, 10 May 2022 10:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325388.547955; Tue, 10 May 2022 10:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNSQ-0005WP-NR; Tue, 10 May 2022 10:51:10 +0000
Received: by outflank-mailman (input) for mailman id 325388;
 Tue, 10 May 2022 10:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VXvK=VS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1noNSP-0004tq-Mf
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 10:51:09 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 197c483c-d04f-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 12:51:09 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47090)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1noNSL-000SzX-Jf (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 10 May 2022 11:51:05 +0100
Received: from [192.168.1.10] (host-92-26-109-251.as13285.net [92.26.109.251])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D389A1FA59;
 Tue, 10 May 2022 11:51:04 +0100 (BST)
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
X-Inumbo-ID: 197c483c-d04f-11ec-8fc4-03012f2f19d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5d7a33e6-aae1-a6fe-8141-0ac27274aa53@srcf.net>
Date: Tue, 10 May 2022 11:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/6] crypto/vmac: Simplify code with byteswap
Content-Language: en-GB
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <4bf9200cfbd798130d2ef68c9b0f5373f72a1b95.1652170719.git.lin.liu@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <4bf9200cfbd798130d2ef68c9b0f5373f72a1b95.1652170719.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 11:15, Lin Liu wrote:
> This file has its own implementation of swap bytes. Clean up
> the code with xen/byteswap.h.
>
> No functional change.
>
> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

