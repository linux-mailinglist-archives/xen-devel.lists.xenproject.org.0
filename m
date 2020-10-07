Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085FA285D09
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 12:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3416.9825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ6qg-00050d-99; Wed, 07 Oct 2020 10:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3416.9825; Wed, 07 Oct 2020 10:39:06 +0000
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
	id 1kQ6qg-00050E-5d; Wed, 07 Oct 2020 10:39:06 +0000
Received: by outflank-mailman (input) for mailman id 3416;
 Wed, 07 Oct 2020 10:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FceR=DO=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kQ6qe-000509-1W
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:39:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3aa607b9-3041-4c7d-9b8a-2ba0f52f0ebe;
 Wed, 07 Oct 2020 10:39:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQ6qZ-0001GA-TP; Wed, 07 Oct 2020 10:38:59 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQ6qZ-0003th-Lr; Wed, 07 Oct 2020 10:38:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FceR=DO=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kQ6qe-000509-1W
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:39:04 +0000
X-Inumbo-ID: 3aa607b9-3041-4c7d-9b8a-2ba0f52f0ebe
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3aa607b9-3041-4c7d-9b8a-2ba0f52f0ebe;
	Wed, 07 Oct 2020 10:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=lfyZLJuMXdhWOK+eBZOGP+LCw9yxvshAac7336OYOIw=; b=AM2Yi6iiGGqo7Y05tN6xp9e66V
	bF4l3sqaoVOdbDw0x8KGQrg377hzPHo8bDDc/gXoaepo/dbEovkkDmMpA7qUW7ewUV0IknO6Rgece
	Jb/9MeWFcxsQJZWXoQd387wJrakPUrGl+KcQ7ABDBAXQ3/sNQyE+a75fBglz4PDSWCKs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQ6qZ-0001GA-TP; Wed, 07 Oct 2020 10:38:59 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQ6qZ-0003th-Lr; Wed, 07 Oct 2020 10:38:59 +0000
Subject: Re: [PATCH V1 13/16] xen/ioreq: Make x86's invalidate qemu mapcache
 handling common
To: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-14-git-send-email-olekstysh@gmail.com>
 <83dfb207-c191-8dad-1474-ce57b6d51102@suse.com>
 <2cab3ca5-0f2b-a813-099f-95bbf54bb9c8@gmail.com>
 <17f1c7d2-7a84-a6a5-4afb-f82e67bc9fd0@suse.com>
 <0fa6a31c-8da6-2a0a-b110-a697f4955702@gmail.com>
 <3abe3988-f1c0-9bbf-1ff9-ce3ae380c825@suse.com>
 <47ecdde7-6575-bee8-7981-7b1a31715a0b@gmail.com>
 <0aa9a225-1231-fa98-f2a1-caf898a3ed86@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fa610665-78c2-3bd0-66f4-2aa716bafe64@xen.org>
Date: Wed, 7 Oct 2020 11:38:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <0aa9a225-1231-fa98-f2a1-caf898a3ed86@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 02/10/2020 10:55, Oleksandr wrote:
> If I got it correctly there won't be a suitable common place where to 
> set qemu_mapcache_invalidate flag anymore
> as XENMEM_decrease_reservation is not a single place we need to make a 
> decision whether to set it
> By principle of analogy, on Arm we probably want to do so in 
> guest_physmap_remove_page (or maybe better in p2m_remove_mapping).
> Julien, what do you think?

At the moment, the Arm code doesn't explicitely remove the existing 
mapping before inserting the new mapping. Instead, this is done 
implicitely by p2m_set_entry().

So I think we want to invalidate the QEMU mapcache in p2m_set_entry() if 
the old entry is a RAM page *and* the new MFN is different.

Cheers,

-- 
Julien Grall

