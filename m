Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52E5F8A67
	for <lists+xen-devel@lfdr.de>; Sun,  9 Oct 2022 11:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418956.663671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohSkY-00078q-7L; Sun, 09 Oct 2022 09:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418956.663671; Sun, 09 Oct 2022 09:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohSkY-00075M-40; Sun, 09 Oct 2022 09:37:34 +0000
Received: by outflank-mailman (input) for mailman id 418956;
 Sun, 09 Oct 2022 09:37:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ohSkX-00075G-49
 for xen-devel@lists.xenproject.org; Sun, 09 Oct 2022 09:37:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohSkV-0003Lo-TT; Sun, 09 Oct 2022 09:37:31 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohSkV-0001FA-Nf; Sun, 09 Oct 2022 09:37:31 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=6/iCMtOLA08dXbAmWj7rJVwslFm3Y1V5+grt8biXx+4=; b=HwZvoWTDiJHYmtnyeT2GHsyVmX
	P5TL+DfW9m+9YK2qNaR4SNvncSnZr6Qpsi1MwcPMJ+KyXrc79+Rei0lusQoIGcPDeiRm3EhY18U56
	ToNuXHnt+Ih1R9g4r6BdxDnjxaD7Q8XPFj3LEbCrbvItU6hs2vLPQ9PN94kAZHuKLFA8=;
Message-ID: <d0e54afc-d32c-130e-f829-1eb0970c703f@xen.org>
Date: Sun, 9 Oct 2022 10:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 2/4] Add licenses under LICENSES
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: wl@xen.org, jbeulich@suse.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, roger.pau@citrix.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
 <20221008001544.78302-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221008001544.78302-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/10/2022 01:15, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Add the individual licenses under a new top-level directory named
> "LICENSES". Each license file includes its related SPDX tags.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

I haven't looked at the exact wording of each license. Assuming the 
patch is moved before patch #1:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

