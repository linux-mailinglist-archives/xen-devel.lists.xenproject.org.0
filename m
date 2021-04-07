Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C1D356D05
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 15:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106651.203918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU80F-0000UG-B8; Wed, 07 Apr 2021 13:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106651.203918; Wed, 07 Apr 2021 13:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU80F-0000Tu-8B; Wed, 07 Apr 2021 13:13:51 +0000
Received: by outflank-mailman (input) for mailman id 106651;
 Wed, 07 Apr 2021 13:13:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lU80E-0000Tp-4p
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 13:13:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lU80A-0005jX-HO; Wed, 07 Apr 2021 13:13:46 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lU80A-0003ol-6I; Wed, 07 Apr 2021 13:13:46 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=gvJGI3xqiq8VtG9qY+/6SURufqypdjLIM32qPBtE0dw=; b=gKQUTiGO3EYd5pmM3i7RtUVnI/
	1vEP4CH64RK466O5a37x/O2QLn6vLPmCYbKE1f5izXwbMnhp6p2Vxvy/D7+1TFRV7jPCJt83JTiLV
	M+GIjfDOiJtwwjqqGRU1NEh1hSRniVek/E8AUSP7AprKCNrV8SErg4asUYcvsJ7lIPtA=;
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
Date: Wed, 7 Apr 2021 14:13:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406103603.8530-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 06/04/2021 11:36, Luca Fancellu wrote:
> Modification to include/public/grant_table.h:
> 
> 1) Change anonymous structure to be named structure,
>     because doxygen can't deal with them.

What do you mean by can't deal with them? I had a quick try with doxygen 
build and couldn't find any failure (although I haven't looked at the 
output).

Cheers,

-- 
Julien Grall

