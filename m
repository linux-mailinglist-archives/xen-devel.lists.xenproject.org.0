Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB379472869
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 11:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245931.424225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwiJ9-00027Z-8e; Mon, 13 Dec 2021 10:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245931.424225; Mon, 13 Dec 2021 10:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwiJ9-00025W-5k; Mon, 13 Dec 2021 10:11:47 +0000
Received: by outflank-mailman (input) for mailman id 245931;
 Mon, 13 Dec 2021 10:11:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mwiJ7-00025Q-Sm
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 10:11:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mwiJ6-0001Qt-QL; Mon, 13 Dec 2021 10:11:44 +0000
Received: from [54.239.6.185] (helo=[192.168.15.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mwiJ6-00043o-Jo; Mon, 13 Dec 2021 10:11:44 +0000
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
	bh=uKcLra/o8CT0XOWJO19vWe6rSYJ2ENpZWqBHwxFGlbs=; b=Aa1HrnaUCU1Xi08hrf5QcXMVjk
	ntEvZhyAHFuo58q2W7IbNJbpr2pVBKLV43O8Xh/7ACQ/1tduqpIe0j0qLti/ZBg8aB0HO8kvA2WDK
	YFmX65YaChmVu3TrQBq2dQr9TalVzBDiyacWZxa7E0eEbiBUtNxwKV9WY6eZj/qNq+GQ=;
Message-ID: <0024265c-e485-8354-361b-9faa36c50a3d@xen.org>
Date: Mon, 13 Dec 2021 10:11:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH 00/10] Add support for Renesas R-Car S4 IPMMU and other
 misc changes
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <3c3c8641-05f5-56b6-b7b1-6942d6bb5a3d@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3c3c8641-05f5-56b6-b7b1-6942d6bb5a3d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/12/2021 10:05, Oleksandr wrote:
> 
> On 27.11.21 19:51, Oleksandr Tyshchenko wrote:
> 
> 
> Hello all.
> 
> Gentle reminder.

This is in my queue of 50+ patches to review. EPAM is the main 
contributor for the IPMMU patches, so can one of your colleagues help to 
review it?

Cheers,

-- 
Julien Grall

