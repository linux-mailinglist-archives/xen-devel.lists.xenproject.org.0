Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F4445EFE3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 15:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233146.404400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqcDC-0000MN-1c; Fri, 26 Nov 2021 14:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233146.404400; Fri, 26 Nov 2021 14:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqcDB-0000Jc-Tm; Fri, 26 Nov 2021 14:28:25 +0000
Received: by outflank-mailman (input) for mailman id 233146;
 Fri, 26 Nov 2021 14:28:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3jyU=QN=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqcDA-0000JW-GM
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 14:28:24 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c3585d7-4ec5-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 15:28:23 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43128)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqcD4-0011X9-2P (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 26 Nov 2021 14:28:18 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 7EA071FBF1;
 Fri, 26 Nov 2021 14:28:18 +0000 (GMT)
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
X-Inumbo-ID: 1c3585d7-4ec5-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <02af4393-8b31-960e-c509-012b3ce09703@srcf.net>
Date: Fri, 26 Nov 2021 14:28:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 04/65] x86/hypercall: Annotate fnptr targets
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-5-andrew.cooper3@citrix.com>
 <374c6213-4319-91ba-6b69-c695d4b2cd87@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <374c6213-4319-91ba-6b69-c695d4b2cd87@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2021 14:21, Jan Beulich wrote:
> On 26.11.2021 13:33, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I understand there's not much to say here, but the title saying just
> "annotate" without any context as to the purpose of the annotation
> is too little information imo. I guess this then goes for many more
> titles in this series.

I really couldn't think of anything useful to say.  Lots of these
patches are entirely mechanical.

>
>> --- a/xen/include/xen/hypercall.h
>> +++ b/xen/include/xen/hypercall.h
>> @@ -18,12 +18,12 @@
>>  #include <asm/hypercall.h>
>>  #include <xsm/xsm.h>
>>  
>> -extern long
>> +extern long cf_check
>>  do_sched_op(
>>      int cmd,
>>      XEN_GUEST_HANDLE_PARAM(void) arg);
> What purpose does the attribute serve on a declaration? On the surface
> I would consider it meaningful only on definitions, like e.g. __init.

Because GCC treats cf_check (and nocf_check) as part of the function
type.  Simply getting it wrong will yield a "definition doesn't match
prototype" error.

Furthermore, it needs to be visible across translation units so one TU
can spot (and complain at) creating a function pointer to a non-local
non-endbr'd function.

~Andrew

