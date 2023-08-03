Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12A676F41E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 22:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576610.902938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRfBP-0007Sr-KV; Thu, 03 Aug 2023 20:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576610.902938; Thu, 03 Aug 2023 20:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRfBP-0007Pj-He; Thu, 03 Aug 2023 20:44:31 +0000
Received: by outflank-mailman (input) for mailman id 576610;
 Thu, 03 Aug 2023 20:44:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRfBN-0007Pd-GA
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 20:44:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRfBN-0001Ki-3V; Thu, 03 Aug 2023 20:44:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRfBM-0006iH-U2; Thu, 03 Aug 2023 20:44:29 +0000
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
	bh=g18EERidA2PIYHhnRFU+EyAtFmE+N4QvovOuy/VxbOA=; b=TbkrPmOqtrX8Ofsn4wThX275Kf
	bu3v1asrewWA+KA39R2SIqxED4rTYPROWgW7AQm2Hvt+HwyvfC5yiLmIkzeEUAOfXk+ietS+Xxjow
	4G0iKW4F+cpZ0UkkI/2BDeH9iyREsKYUhkYL7m0U4ZTcT+gMblrNqwk3qTbz8VfihZOQ=;
Message-ID: <adb34b6c-27a2-2f08-3024-747857fe7666@xen.org>
Date: Thu, 3 Aug 2023 21:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230803144035.4071610-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230803144035.4071610-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/08/2023 15:40, Luca Fancellu wrote:
> Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
> when needed, the option is active by default.
> 
> Introduce Kconfig VGICV2 that compiles the Generic Interrupt
> Controller v2 emulation for domains, it is required only when using
> GICv2 driver, otherwise using the GICv3 driver it is optional and can
> be deselected if the user doesn't want to offer the v2 emulation to
> domains or maybe its GICv3 hardware can't offer the GICv2 compatible
> mode.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

