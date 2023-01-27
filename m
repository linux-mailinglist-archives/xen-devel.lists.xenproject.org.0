Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404467E0D4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 10:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485390.752582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLQw-0005oR-CG; Fri, 27 Jan 2023 09:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485390.752582; Fri, 27 Jan 2023 09:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLQw-0005mk-8o; Fri, 27 Jan 2023 09:54:10 +0000
Received: by outflank-mailman (input) for mailman id 485390;
 Fri, 27 Jan 2023 09:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gttX=5Y=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pLLQu-0005me-Ut
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 09:54:08 +0000
Received: from ppsw-33.srv.uis.cam.ac.uk (ppsw-33.srv.uis.cam.ac.uk
 [131.111.8.133]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89a39567-9e28-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 10:54:07 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:58384)
 by ppsw-33.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pLLQr-000Rmd-Rf (Exim 4.96) (return-path <amc96@srcf.net>);
 Fri, 27 Jan 2023 09:54:05 +0000
Received: from [192.168.1.10] (host-92-12-62-6.as13285.net [92.12.62.6])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 57BA71FBD6;
 Fri, 27 Jan 2023 09:54:05 +0000 (GMT)
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
X-Inumbo-ID: 89a39567-9e28-11ed-a5d9-ddcf98b90cbd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9718888d-96a9-09fb-fca9-f12fa76929f3@srcf.net>
Date: Fri, 27 Jan 2023 09:54:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] Remove unused virtualization technology specific
 headers
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230127094656.140120-1-burzalodowa@gmail.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20230127094656.140120-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/01/2023 9:46 am, Xenia Ragiadakou wrote:
> The patches remove forgotten and now unused virtualization technology specific
> headers from arch/x86/cpu/vpmu.c and arch/x86/hvm/emulate.c.
>
> Xenia Ragiadakou (2):
>   x86/emulate: remove unused svm specific header
>   x86/vpmu: remove unused svm and vmx specific headers
>
>  xen/arch/x86/cpu/vpmu.c    | 4 ----
>  xen/arch/x86/hvm/emulate.c | 1 -
>  2 files changed, 5 deletions(-)
>

Oh excellent.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

IMO the fixes tags are useful even if we won't want to backport them. 
It's an easy pointer for people to follow if needs be.

~Andrew

