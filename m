Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213C042A713
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 16:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207269.363038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIdq-0008M8-HG; Tue, 12 Oct 2021 14:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207269.363038; Tue, 12 Oct 2021 14:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIdq-0008Jp-EB; Tue, 12 Oct 2021 14:20:30 +0000
Received: by outflank-mailman (input) for mailman id 207269;
 Tue, 12 Oct 2021 14:20:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maIdo-0008Jj-CZ
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:20:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maIdn-0002aV-Nc; Tue, 12 Oct 2021 14:20:27 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.23.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maIdn-0006ae-Go; Tue, 12 Oct 2021 14:20:27 +0000
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
	bh=DNLi+OaqYxafUdxxDsvPgrMYg9wEILg3t4r9BKxE2Ck=; b=b8IiIU/sTJ2kDJ4+L4DB6SyjxG
	VjaAaVaXRkS3wnDwvswEwVECkUpjPyYGBDWaxOkF9g3cDdBrLRgHIekJ8QUxvwBwZOdNpf1MUBdod
	jP8LQTg6rHVbYTW99RIqjLY1KbFA61hK1FBURnnEtLocyALYb4/cD9T7FmaT3VsUYPGE=;
Message-ID: <243d4615-fb29-6be0-eef9-c892cb56f8bc@xen.org>
Date: Tue, 12 Oct 2021 15:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [RFC 0/1] tag IOMMU-protected devices in Dom0 fdt
To: Roman Skakun <rm.skakun@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Roman Skakun <roman_skakun@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii_anisov@epam.com>
References: <cover.1633106362.git.roman_skakun@epam.com>
 <CADu_u-PVqHc6RQ4JTpkrmNap+QxEh7=0Mu2xsiAjOty3J5hKjQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CADu_u-PVqHc6RQ4JTpkrmNap+QxEh7=0Mu2xsiAjOty3J5hKjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/10/2021 15:11, Roman Skakun wrote:
> Hi,

Hi Roman,

> Would you be so kind to look at my patches, it would help me to
> know exactly whether I'm moving correctly and whether I've chosen
> the right path?

This is in my queue to review. At the moment, I am prioritizing work 
targeting 4.16. Unfortunately, this RFC was posted after the last 
posting date. So I will review it after the feature freeze.

Best regards,

-- 
Julien Grall

