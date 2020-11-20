Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3822BA591
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31801.62492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2Sb-0001C5-7z; Fri, 20 Nov 2020 09:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31801.62492; Fri, 20 Nov 2020 09:12:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2Sb-0001Bg-4W; Fri, 20 Nov 2020 09:12:05 +0000
Received: by outflank-mailman (input) for mailman id 31801;
 Fri, 20 Nov 2020 09:12:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg2SZ-0001Bb-Me
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:12:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 391ebce0-2f7f-48ee-8f90-5fcb2a73d4af;
 Fri, 20 Nov 2020 09:12:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B67B8AC0C;
 Fri, 20 Nov 2020 09:12:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg2SZ-0001Bb-Me
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:12:03 +0000
X-Inumbo-ID: 391ebce0-2f7f-48ee-8f90-5fcb2a73d4af
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 391ebce0-2f7f-48ee-8f90-5fcb2a73d4af;
	Fri, 20 Nov 2020 09:12:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605863521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JeWb2czxrVFkgWEVPsHDHmYKfUupehhGgkrX1SvIDw=;
	b=b2b5Uthk7n6bnxe3OuZLirH/TiW9VT0Bpl4xWU7v/6wK8+zVGkvT5QIWRRCxxlu5HvFat+
	9gQh3bLAR+U7kdAM2TMkt8FgGSeekqDDl7iJXXiyNxevWh0xPWyW3VM4OQtpOrxHJ9YTzM
	l0SHOYJRF0jjoU6cSJ5TWeIWZk2/Iy4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B67B8AC0C;
	Fri, 20 Nov 2020 09:12:01 +0000 (UTC)
Subject: Re: [PATCH] x86/IRQ: drop two unused variables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <75d17df8-706b-08e5-b839-33ed1ce44bf3@suse.com>
Message-ID: <52caf9b8-d296-398e-81b4-4ec6868d778e@suse.com>
Date: Fri, 20 Nov 2020 10:12:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <75d17df8-706b-08e5-b839-33ed1ce44bf3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 09:48, Jan Beulich wrote:
> @@ -1663,13 +1661,11 @@ int pirq_guest_bind(struct vcpu *v, stru

Argh, there's yet one more in this function. Will need v2.

Jan

>  static irq_guest_action_t *__pirq_guest_unbind(
>      struct domain *d, struct pirq *pirq, struct irq_desc *desc)
>  {
> -    unsigned int        irq;
>      irq_guest_action_t *action;
>      cpumask_t           cpu_eoi_map;
>      int                 i;
>  
>      action = (irq_guest_action_t *)desc->action;
> -    irq = desc - irq_desc;
>  
>      if ( unlikely(action == NULL) )
>      {
> 


