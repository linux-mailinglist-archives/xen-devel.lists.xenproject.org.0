Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E057950BDBC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 18:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311150.528234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwbJ-000339-17; Fri, 22 Apr 2022 16:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311150.528234; Fri, 22 Apr 2022 16:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwbI-00030A-UA; Fri, 22 Apr 2022 16:57:44 +0000
Received: by outflank-mailman (input) for mailman id 311150;
 Fri, 22 Apr 2022 16:57:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=utlT=VA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nhwbH-000304-SY
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 16:57:43 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5355c0ee-c25d-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 18:57:42 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id x33so15334909lfu.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 09:57:42 -0700 (PDT)
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
X-Inumbo-ID: 5355c0ee-c25d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rfdHOxkpzIyt1O/sX3V/T6aR7Ux9FcCSbdpHX3js2OU=;
        b=WAYfJQLjb3sTDCqrFB0VW4kqmwqn97Yeu5kzjRnCm+2Gv2qKu6syDVAr2V72gwrewj
         hPCu4oTnx0PU2kXbeIiDfaJsv90wFU/H2OH8cQM7IZQvKnPugkS4yvB5Q/VYBkCsUVQo
         CQ8Uzp6aIh219QlQXFqXZRArwFn/s7O421TQ2suIAKnFlhA2E1yz9MZEOQ4kmk0wuktT
         CkWdYsnRjJxCTieIFKIdj97cok4hKG2B+8xT+GRPoEW+/+jMfjL1NSDZOLqCvAWWPaDf
         JKRAX/b8W5eeTOec/XEU2IPph8EGuq5Foazy+EP6uUnZjH84TL0ZMqwFT+UMyF/psnYI
         Nn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rfdHOxkpzIyt1O/sX3V/T6aR7Ux9FcCSbdpHX3js2OU=;
        b=UDp/AXR4OXNpfeQWgiVi69IoSKnnuzO5gz5pF/GPM4fubAv/JGTGjWce+Q8W9tTiDu
         Gb3SfxhIDo90f1dmJ6jmPx/SiG2QIhbnytFsXwNP+0UbmqYppeNh0BztF5047+AOEigV
         CH0w12Sv3yv8RhaKbS6Q48xWe3HSs+ZuJPHn/KGYcpqyNPjCE3r6U091x+gz/hbCZrsX
         5l0gRDOF6YGGH8CnSR56PDqhSd0gVIa/Ac2/Rp01b95ugjyrL2Cm5jET4msujkYLm59t
         yoYsDjaxBAvUzHrQH01/8rjcHI+D3exkadweJTUtjxnwaa/m+WYakkp2Pcm6A7r1e6oO
         JGOA==
X-Gm-Message-State: AOAM530U9cpq28Nds3HFDtszg+5RdePeu7w3/Vs8/sn4HRPjvAHJPFc2
	ZZ0RgexO+ELW0kp7N4whkg7pU/9i9Kv8b8it0Y4=
X-Google-Smtp-Source: ABdhPJyKUI8VrLLD4c5ypJBtzNyGAJneEOLHkcLQgVc49JQ5pnYxCLmoRHNxMLl8AbjiPXQPT+r4k6PaxWsvAVOWe5Q=
X-Received: by 2002:a05:6512:e83:b0:46f:cc1c:a7b1 with SMTP id
 bi3-20020a0565120e8300b0046fcc1ca7b1mr3751450lfb.388.1650646662315; Fri, 22
 Apr 2022 09:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220422163458.30170-1-dpsmith@apertussolutions.com> <20220422163458.30170-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220422163458.30170-2-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 22 Apr 2022 12:57:30 -0400
Message-ID: <CAKf6xptd7BD4R818q9SpQryn2X_E0PH8LONrjifOw6VK3AikPg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] xsm: create idle domain privileged and demote
 after setup
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, 
	Scott Davis <scott.davis@starlab.io>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 12:35 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> There are now instances where internal hypervisor logic needs to make resource
> allocation calls that are protected by XSM checks. The internal hypervisor logic
> is represented a number of system domains which by designed are represented by
> non-privileged struct domain instances. To enable these logic blocks to
> function correctly but in a controlled manner, this commit changes the idle
> domain to be created as a privileged domain under the default policy, which is
> inherited by the SILO policy, and demoted before transitioning to running. A
> new XSM hook, xsm_set_system_active, is introduced to allow each XSM policy
> type to demote the idle domain appropriately for that policy type.
>
> For flask a stub is added to ensure that flask policy system will function
> correctly with this patch until flask is extended with support for starting the
> idle domain privileged and properly demoting it on the call to
> xsm_set_system_active.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

