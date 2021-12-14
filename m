Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE04748B6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246925.425865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBB6-0002vW-Hs; Tue, 14 Dec 2021 17:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246925.425865; Tue, 14 Dec 2021 17:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBB6-0002sn-Em; Tue, 14 Dec 2021 17:01:24 +0000
Received: by outflank-mailman (input) for mailman id 246925;
 Tue, 14 Dec 2021 17:01:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxBB5-0002sf-RX
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:01:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBB5-0004Ug-FG; Tue, 14 Dec 2021 17:01:23 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBB5-0004GO-9X; Tue, 14 Dec 2021 17:01:23 +0000
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
	bh=pQZjbl+7YWLkiQ12TSpI2RPDywROfLWXRYGcilQ12vU=; b=y5JBEqVcwJkUu9s6udrFjXKLYA
	V+d8W5Hc6rBgxxSfLbC/Tpdvj8Nxp02F7hAjbM2ENvpCuquAqUpCeOgkJ4iZZytDu927JSvt26Dyw
	NEZhEn3fXXWDTU64v3DrpC3ZQa9EvCfh9gTENjvjNj7vcbf7vZvemg/puvDHQr97/Hlo=;
Message-ID: <63996801-d069-c648-928d-fe951c35b720@xen.org>
Date: Tue, 14 Dec 2021 17:01:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 05/47] build: adjust $(TARGET).efi creation in
 arch/arm
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-6-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211125134006.1076646-6-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 25/11/2021 13:39, Anthony PERARD wrote:
> There is no need to try to guess a relative path to the "xen.efi" file,
> we can simply use $@. Also, there's no need to use `notdir`, make
> already do that work via $(@F).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

