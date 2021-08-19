Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D53F1956
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168726.308051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhCN-0000UO-B0; Thu, 19 Aug 2021 12:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168726.308051; Thu, 19 Aug 2021 12:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhCN-0000Rh-7g; Thu, 19 Aug 2021 12:31:07 +0000
Received: by outflank-mailman (input) for mailman id 168726;
 Thu, 19 Aug 2021 12:31:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGhCM-0000RY-29
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:31:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGhCL-0007I4-Qu; Thu, 19 Aug 2021 12:31:05 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGhCL-0002kK-Kw; Thu, 19 Aug 2021 12:31:05 +0000
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
	bh=AXhWntkWZHYRaUjThPbH7OyGQe8kYQCl69QvAbfyu80=; b=T5JwPFCzpndDKlXXINJf/w/8PG
	21StRTuFXb9eMa/d+LfvU2hNbdoKUQiNGndOXLs9ighvfiBpz1PtLXd6mTBV0AHhWyWoHXkqAbLFn
	CPpPjjaCCK452nx5QNRLjzKjHuVdIibgj7p+TR83kixdkaGoL+KaqLw+zbXzQhah4VCI=;
Subject: Re: [PATCH v1 09/14] xen/arm: Add cmdline boot option "pci=on"
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <731afb80-bb68-0c66-4f0f-341a46118770@xen.org>
Date: Thu, 19 Aug 2021 13:31:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 19/08/2021 13:02, Rahul Singh wrote:
> Add cmdline boot option "pci=on" to enable/disable the PCI init during
> boot.

I read this as "PCI" will be either disabled/enabled for the platform. 
Whereas, I think it will be used to decide whether Xen discover PCI and 
PCI passthrough is supported or not.

Can you also clarify why a user would want to select "pci=off"?

Cheers,

-- 
Julien Grall

