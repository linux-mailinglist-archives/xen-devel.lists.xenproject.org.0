Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8A5995FD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 09:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390028.627196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwSJ-0004Yp-SA; Fri, 19 Aug 2022 07:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390028.627196; Fri, 19 Aug 2022 07:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwSJ-0004Va-Ot; Fri, 19 Aug 2022 07:30:11 +0000
Received: by outflank-mailman (input) for mailman id 390028;
 Fri, 19 Aug 2022 07:30:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOwSI-0004VU-38
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 07:30:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOwSG-0002ND-IM; Fri, 19 Aug 2022 07:30:08 +0000
Received: from [54.239.6.188] (helo=[192.168.16.114])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOwSG-0003Iw-9k; Fri, 19 Aug 2022 07:30:08 +0000
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
	bh=0c4y1Mu20Yxjw1BRzF1bKdUsbPvsFN2x2gngNXSmZz0=; b=ITr+L1xU5DFolcoCeJ2mEXOAtP
	6w0LiWHH7U8QaF1/sZBd0KigbmWlipQq/EP5zn1j49SOg4nYSpdezLaEt0MXovUyCv5BusVHQxCV2
	7747mjYUN4QIkAZE4Ux+676p5WSfCf0v88fA/+vRgUlrZYDtiv49TnFZ1+HpKt22IyUA=;
Message-ID: <835a1093-1280-1442-9e11-f9f5bbf9f635@xen.org>
Date: Fri, 19 Aug 2022 08:30:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 2/3] Add licenses under LICENSES
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wl@xen.org, jbeulich@suse.com,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
 <20220818220320.2538705-2-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220818220320.2538705-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 18/08/2022 23:03, Stefano Stabellini wrote:
> Add the individual licenses under a new top-level directory named
> "LICENSES". Each license file includes its related SPDX tags.

We already have a copy of the licenses in COPYING/CONTRIBUTING. I don't 
particularly mind where you want to keep the licenses but I don't want 
them duplicated.

Cheers,

-- 
Julien Grall

