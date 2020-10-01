Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347EF28037F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1412.4521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO134-0007Wh-Gn; Thu, 01 Oct 2020 16:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412.4521; Thu, 01 Oct 2020 16:03:14 +0000
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
	id 1kO134-0007WI-Dg; Thu, 01 Oct 2020 16:03:14 +0000
Received: by outflank-mailman (input) for mailman id 1412;
 Thu, 01 Oct 2020 16:03:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kO132-0007WC-Tl
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:03:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a6801f8-9719-46f2-9a27-28a0f58f23e7;
 Thu, 01 Oct 2020 16:03:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D59E5AD5F;
 Thu,  1 Oct 2020 16:03:07 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kO132-0007WC-Tl
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:03:12 +0000
X-Inumbo-ID: 6a6801f8-9719-46f2-9a27-28a0f58f23e7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6a6801f8-9719-46f2-9a27-28a0f58f23e7;
	Thu, 01 Oct 2020 16:03:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601568187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zueDiCrYxomDQCPHoxYGh9olkGatqPlUX0kc0xMr3d4=;
	b=Lo8tfwdfisR5LSdhtFaHHeHx0lDbxlait+JgOZTF+yiWZ1n9Mb23WC4iiDHDeVIv6E+dLB
	xzYYAlXyz33WmV/OKuDhdX4CnI/v59cFWsTCHbfux9n0SfpczZVPxd0wsx93r82Grv92uM
	4nwThj2ST7JRUPs3jDDrTWSKHnArJsw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D59E5AD5F;
	Thu,  1 Oct 2020 16:03:07 +0000 (UTC)
Subject: Ping: [PATCH 0/6] tools/include: adjustments to the population of
 xen/
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Message-ID: <673fdaf3-e770-67c8-0a6c-6cdec79df38a@suse.com>
Date: Thu, 1 Oct 2020 18:03:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.09.2020 14:09, Jan Beulich wrote:
> While looking at what it would take to move around libelf/
> in the hypervisor subtree, I've run into this rule, which I
> think can do with a few improvements and some simplification.
> 
> 1: adjust population of acpi/
> 2: fix (drop) dependencies of when to populate xen/
> 3: adjust population of public headers into xen/
> 4: properly install Arm public headers
> 5: adjust x86-specific population of xen/
> 6: drop remaining -f from ln invocations

May I ask for an ack or otherwise here?

Thanks, Jan

