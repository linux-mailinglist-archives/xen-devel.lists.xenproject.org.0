Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0177349523B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 17:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259142.447079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAaAH-0007fg-KR; Thu, 20 Jan 2022 16:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259142.447079; Thu, 20 Jan 2022 16:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAaAH-0007cx-HU; Thu, 20 Jan 2022 16:19:57 +0000
Received: by outflank-mailman (input) for mailman id 259142;
 Thu, 20 Jan 2022 16:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFdd=SE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nAaAG-0007cr-8S
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 16:19:56 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdac3f9d-7a0c-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 17:19:55 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:52830)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nAaAE-000JtN-p3 (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 20 Jan 2022 16:19:54 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 9591B1FB2F;
 Thu, 20 Jan 2022 16:19:54 +0000 (GMT)
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
X-Inumbo-ID: cdac3f9d-7a0c-11ec-bc18-3156f6d857e4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <2c21f783-8d8e-f1c0-2630-4bfb1d277625@srcf.net>
Date: Thu, 20 Jan 2022 16:19:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen/x86: import intel-family.h from Linux
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20220120161300.8477-1-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220120161300.8477-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/01/2022 16:13, Roger Pau Monne wrote:
> Last commit to the file is:
>
> 7d697f0d5737 x86/cpu: Drop spurious underscore from RAPTOR_LAKE #define
>
> This should help the readability of code that's currently open-coding
> Intel model numbers.
>
> No change introduced to existing code, it's expected that new code
> could start using the defines. Changing existing users could cause
> quite a lot of code churn.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

