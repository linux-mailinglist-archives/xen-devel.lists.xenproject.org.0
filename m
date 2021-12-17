Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F7478F0D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 16:08:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248739.429058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEpn-0003yP-MN; Fri, 17 Dec 2021 15:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248739.429058; Fri, 17 Dec 2021 15:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEpn-0003wR-J0; Fri, 17 Dec 2021 15:07:47 +0000
Received: by outflank-mailman (input) for mailman id 248739;
 Fri, 17 Dec 2021 15:07:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6k1w=RC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1myEpm-0003wJ-Nz
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 15:07:46 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16d6beee-5f4b-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 16:07:45 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47424)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1myEpk-0001wj-pR (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 17 Dec 2021 15:07:44 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id A62061FF1D;
 Fri, 17 Dec 2021 15:07:44 +0000 (GMT)
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
X-Inumbo-ID: 16d6beee-5f4b-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <b14a518b-504a-9135-e11d-0f774cc02572@srcf.net>
Date: Fri, 17 Dec 2021 15:07:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 5/5] xenperf: name "newer" hypercalls
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
 <dcded1c5-85c8-dd43-6662-115652ce7932@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <dcded1c5-85c8-dd43-6662-115652ce7932@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 12:07, Jan Beulich wrote:
> This table must not have got updated in quite a while; tmem_op for
> example has managed to not only appear since then, but also disappear
> again (adding a name for it nevertheless, to make more obvious that
> something strange is going on if the slot would ever have a non-zero
> value).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wasn't really sure about x86's real names for arch_0 and arch_1. The
> tool runs on the same host as the hypervisor, so __i386__ / __x86_64__
> conditionals wouldn't be inappropriate to use ...

This is a developer tool.  Noone is going to have a perfcounter enabled
hypervisor in production.

Therefore, I think the ifdef's will be fine.

Preferably with, but either way, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

