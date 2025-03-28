Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989BA75089
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 19:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931122.1333582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEjO-0005bs-Sn; Fri, 28 Mar 2025 18:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931122.1333582; Fri, 28 Mar 2025 18:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEjO-0005aO-Pv; Fri, 28 Mar 2025 18:47:02 +0000
Received: by outflank-mailman (input) for mailman id 931122;
 Fri, 28 Mar 2025 18:47:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyEjN-0005aI-J8
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 18:47:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEjN-00DzAz-0F;
 Fri, 28 Mar 2025 18:47:01 +0000
Received: from [2a02:8012:3a1:0:9545:fe10:6ede:2324]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEjM-004tDZ-2w;
 Fri, 28 Mar 2025 18:47:01 +0000
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
	bh=qJe3EosGfvejJMgf1jZ3Dh4daxzSJ0nrq4yYUdadJ5g=; b=ijj54IaJbMw3+t/Fa3oO91uy3r
	3dvUw8OBAekiL6jHKn7E99Pcqon87UrXDCH7eCXEBQTPuB1udIHx0yqMx0AdF/1kaRHYbci0t+i5Y
	QU1EVdKg2Ef/hgUFk0SZPA17fmPLHXgzhDPLn15i92P2YinCFAa/2fD4B5hFErvdTPVQ=;
Message-ID: <a1c41776-fb5e-4b83-a6f0-b4370a0c0e0e@xen.org>
Date: Fri, 28 Mar 2025 18:46:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 RESEND 3/6] Arm32: use new-style entry annotations for
 entry code
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
 <149aff98-bccb-4671-9961-484e5651bf1f@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <149aff98-bccb-4671-9961-484e5651bf1f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/03/2025 08:07, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Should the GLOBAL()s also be replaced?

I guess the goal is to use helper from xen/linkage.h. So I would say 
yes. It doesn't need to be done in this series though.

Cheers,

-- 
Julien Grall


