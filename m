Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5834C690C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280392.478325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdih-0006Gg-U3; Mon, 28 Feb 2022 10:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280392.478325; Mon, 28 Feb 2022 10:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdih-0006Em-Q7; Mon, 28 Feb 2022 10:57:35 +0000
Received: by outflank-mailman (input) for mailman id 280392;
 Mon, 28 Feb 2022 10:57:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cvol=TL=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nOdig-0006Ef-Fu
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:57:34 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36d9d8a6-9885-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 11:57:26 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:45844)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nOdie-000vQb-Ja (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 28 Feb 2022 10:57:32 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D3AA91FAB7;
 Mon, 28 Feb 2022 10:57:31 +0000 (GMT)
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
X-Inumbo-ID: 36d9d8a6-9885-11ec-8539-5f4723681683
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <cf739bff-9405-31b9-5741-e5ec1989dec7@srcf.net>
Date: Mon, 28 Feb 2022 10:57:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/CPUID: correct FEATURESET_7d2 comment
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e9c810a1-47eb-6901-1a55-481a6bf4c0b7@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <e9c810a1-47eb-6901-1a55-481a6bf4c0b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2022 10:55, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/include/xen/lib/x86/cpuid.h
> +++ b/xen/include/xen/lib/x86/cpuid.h
> @@ -17,7 +17,7 @@
>  #define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
>  #define FEATURESET_e21a  11 /* 0x80000021.eax      */
>  #define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
> -#define FEATURESET_7d2   13 /* 0x80000007:2.edx    */
> +#define FEATURESET_7d2   13 /* 0x00000007:2.edx    */

Oops.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

