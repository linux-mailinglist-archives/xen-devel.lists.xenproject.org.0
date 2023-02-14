Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0DA696B44
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 18:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495446.765811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyxL-0003on-48; Tue, 14 Feb 2023 17:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495446.765811; Tue, 14 Feb 2023 17:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyxK-0003mf-WD; Tue, 14 Feb 2023 17:19:03 +0000
Received: by outflank-mailman (input) for mailman id 495446;
 Tue, 14 Feb 2023 17:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNhK=6K=csail.mit.edu=srivatsa@srs-se1.protection.inumbo.net>)
 id 1pRyoi-0002JS-4F
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 17:10:08 +0000
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d4ad286-ac8a-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 18:10:06 +0100 (CET)
Received: from c-24-17-218-140.hsd1.wa.comcast.net ([24.17.218.140]
 helo=srivatsab3MD6R.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pRyod-003ROd-5s;
 Tue, 14 Feb 2023 12:10:03 -0500
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
X-Inumbo-ID: 6d4ad286-ac8a-11ed-933c-83870f6b2ba8
Subject: Re: [PATCH] x86/hotplug: Remove incorrect comment about
 mwait_play_dead()
To: tglx@linutronix.de, mingo@redhat.com, x86@kernel.org,
 peterz@infradead.org, hpa@zytor.com
Cc: bp@alien8.de, dave.hansen@linux.intel.com, rafael.j.wysocki@intel.com,
 paulmck@kernel.org, jgross@suse.com, seanjc@google.com,
 thomas.lendacky@amd.com, linux-kernel@vger.kernel.org, imammedo@redhat.com,
 amakhalov@vmware.com, ganb@vmware.com, ankitja@vmware.com,
 bordoloih@vmware.com, keerthanak@vmware.com, blamoreaux@vmware.com,
 namit@vmware.com, wyes.karny@amd.com, lewis.carroll@amd.com,
 pv-drivers@vmware.com, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20230128003751.141317-1-srivatsa@csail.mit.edu>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <e6792ea0-d210-a31d-b7da-8525e1315505@csail.mit.edu>
Date: Tue, 14 Feb 2023 09:09:58 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20230128003751.141317-1-srivatsa@csail.mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hi,

On 1/27/23 4:37 PM, Srivatsa S. Bhat wrote:
> From: "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>
> 
> The comment that says mwait_play_dead() returns only on failure is a
> bit misleading because mwait_play_dead() could actually return for
> valid reasons (such as mwait not being supported by the platform) that
> do not indicate a failure of the CPU offline operation. So, remove the
> comment.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>


Gentle ping for review. Thank you!

Regards,
Srivatsa

> ---
>  arch/x86/kernel/smpboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 55cad72715d9..9013bb28255a 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1833,7 +1833,7 @@ void native_play_dead(void)
>  	play_dead_common();
>  	tboot_shutdown(TB_SHUTDOWN_WFS);
>  
> -	mwait_play_dead();	/* Only returns on failure */
> +	mwait_play_dead();
>  	if (cpuidle_play_dead())
>  		hlt_play_dead();
>  }
> 

