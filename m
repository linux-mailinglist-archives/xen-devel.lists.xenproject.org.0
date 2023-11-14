Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3857EACE3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632271.986498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pYP-0004WR-Dr; Tue, 14 Nov 2023 09:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632271.986498; Tue, 14 Nov 2023 09:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pYP-0004Ul-BK; Tue, 14 Nov 2023 09:17:53 +0000
Received: by outflank-mailman (input) for mailman id 632271;
 Tue, 14 Nov 2023 09:17:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r2pYO-0004Uf-3d
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:17:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2pYN-0001l7-76; Tue, 14 Nov 2023 09:17:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2pYN-0006AL-1L; Tue, 14 Nov 2023 09:17:51 +0000
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
	bh=/1D3qyzehXU4kM6ToGdwfjf+SyBIsoXqWedrqNQKB6c=; b=Sht3Y88QP7JYWNSKclE+6LhDGH
	3UWOMSQHcL0TUfZE1jWHlyhjWRvfyLshC1fzCnxVDNZcyWvtmbXZR+unvFMDLqm3qTgXhXFBuP/r6
	OhRaJehkVioD7S8eA/CcQsL8zTLdsx+rigKjpKDR99f7AMzQDBm5ih4+ccnxabBes48I=;
Message-ID: <b62a7806-6471-455c-972e-0963f2358562@xen.org>
Date: Tue, 14 Nov 2023 09:17:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] tools/xenstored: remove "-D" command line parameter
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231113124309.10862-1-jgross@suse.com>
 <20231113124309.10862-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231113124309.10862-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 13/11/2023 12:43, Juergen Gross wrote:
> Remove the "-D" command parameter, which is disabling initialization of
> the mandatory domain data handling.

I looked at the code when -D was introduced. It is not clear how it was 
working back then.

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

