Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34826915929
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 23:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746943.1154174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLrQZ-0004Q8-Ns; Mon, 24 Jun 2024 21:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746943.1154174; Mon, 24 Jun 2024 21:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLrQZ-0004N4-Kg; Mon, 24 Jun 2024 21:40:43 +0000
Received: by outflank-mailman (input) for mailman id 746943;
 Mon, 24 Jun 2024 21:40:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sLrQY-0004My-Cx
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 21:40:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sLrQV-0002lU-Oy; Mon, 24 Jun 2024 21:40:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sLrQV-00008K-HM; Mon, 24 Jun 2024 21:40:39 +0000
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
	bh=A8B+L7WSYcGhD26sqc57Hx+AUKTOl9PmV4f1wtBgf2s=; b=caLBq4MhdJvsIoRWHwdIiZHEvT
	oJDmxf/vXFNhJqtH0kVLrcgmmjprAXXdwyWOFm5w4p52M+rEoRRcWjssO58EIxGGH5dhVpdkpv1G4
	4FamFSaGKOAbM0bqfsaMYQZERZWLGYnkENtCoKwqZyWZ6Su96LsQpil2+ABCSIrLCEqw=;
Message-ID: <5238d3a6-c47f-4951-b839-a92c5ee4e571@xen.org>
Date: Mon, 24 Jun 2024 22:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] MAINTAINERS: Update my email address again
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Oleksii <oleksii.kurochko@gmail.com>
References: <20240624094030.41692-1-anthony.perard@vates.tech>
 <alpine.DEB.2.22.394.2406240927390.3870429@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2406240927390.3870429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/06/2024 17:27, Stefano Stabellini wrote:
> On Mon, 24 Jun 2024, Anthony PERARD wrote:
>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

I guess this technically need an ack from the release manager. So CC 
Oleksii.

Cheers,


-- 
Julien Grall

