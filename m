Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C7C514627
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317142.536342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNQh-0005rT-B8; Fri, 29 Apr 2022 10:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317142.536342; Fri, 29 Apr 2022 10:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNQh-0005oA-83; Fri, 29 Apr 2022 10:00:51 +0000
Received: by outflank-mailman (input) for mailman id 317142;
 Fri, 29 Apr 2022 10:00:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nkNQf-0005lA-Kg
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:00:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nkNQf-00053e-8c; Fri, 29 Apr 2022 10:00:49 +0000
Received: from [54.239.6.189] (helo=[192.168.23.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nkNQf-0007DJ-2R; Fri, 29 Apr 2022 10:00:49 +0000
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
	bh=L7qjBGLy7IlNpCb2oBNOhu5gWb8966blZbRHZ/mUusQ=; b=X/PFVxrisF5gABjq9/Y1flUoev
	PyRsVYkhnm1dQQtraUInoy815F3GhGviW4K6rDE0Gaddti91kayVCV6mqdd8bAY7JHs902jIcZBHc
	OMgm2tju9c4nnyTgrd8599KXFyGeSTUKzdMjhwYIAgZIZsJsMINmLAqTrCOxSMXjEI8Y=;
Message-ID: <21f302e7-3e02-6ad1-de1d-55e6bf05be0b@xen.org>
Date: Fri, 29 Apr 2022 11:00:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] kconfig: detect LD implementation
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@arm.com>
References: <20220429093644.99574-1-roger.pau@citrix.com>
 <20220429093644.99574-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220429093644.99574-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 29/04/2022 10:36, Roger Pau Monne wrote:
> Detect GNU and LLVM ld implementations. This is required for further
> patches that will introduce diverging behaviour depending on the
> linker implementation in use.
> 
> Note that LLVM ld returns "compatible with GNU linkers" as part of the
> version string, so be on the safe side and use '^' to only match at
> the start of the line in case LLVM ever decides to change the text to
> use "compatible with GNU ld" instead.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

