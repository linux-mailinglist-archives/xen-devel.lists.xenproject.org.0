Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7484676B6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237445.411843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt74X-0006xQ-Il; Fri, 03 Dec 2021 11:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237445.411843; Fri, 03 Dec 2021 11:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt74X-0006uk-Ew; Fri, 03 Dec 2021 11:49:49 +0000
Received: by outflank-mailman (input) for mailman id 237445;
 Fri, 03 Dec 2021 11:49:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mt74W-0006uW-98
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:49:48 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ce86d7e-542f-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:49:47 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35060)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mt74U-000ToG-7j (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 11:49:46 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 285AE1FD7A;
 Fri,  3 Dec 2021 11:49:46 +0000 (GMT)
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
X-Inumbo-ID: 1ce86d7e-542f-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <3452b90a-c2f5-168b-9f3e-10f8655c4cde@srcf.net>
Date: Fri, 3 Dec 2021 11:49:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/3] x86/HVM: fail virt-to-linear conversion for insn
 fetches from non-code segments
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
 <46fdafdd-d6a9-778b-d634-fad8d2f6925a@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <46fdafdd-d6a9-778b-d634-fad8d2f6925a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2021 11:22, Jan Beulich wrote:
> Just like (in protected mode) reads may not go to exec-only segments and
> writes may not go to non-writable ones, insn fetches may not access data
> segments.
>
> Fixes: 623e83716791 ("hvm: Support hardware task switching")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

