Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9444653ABB2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 19:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340644.565724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRzs-0006Hy-3s; Wed, 01 Jun 2022 17:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340644.565724; Wed, 01 Jun 2022 17:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRzs-0006FV-0Q; Wed, 01 Jun 2022 17:19:04 +0000
Received: by outflank-mailman (input) for mailman id 340644;
 Wed, 01 Jun 2022 17:19:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nwRzq-0006FH-Ne
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 17:19:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwRzq-0005la-G6; Wed, 01 Jun 2022 17:19:02 +0000
Received: from [54.239.6.189] (helo=[192.168.4.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwRzq-0002Zq-A0; Wed, 01 Jun 2022 17:19:02 +0000
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
	bh=CkKlMb44dbpeHtXyemQCV0yn+Hbbi6uuH/EJps0JUFU=; b=ZMXmtA9mSp0KC0KHQsabk4QWCJ
	1KKACuZJOnA2BX1zWGz5xvp9WFFEq1/gC0Br0mrGrbimWWvWrk5x9otyh/r61lTd5QefOmQ6aSO7h
	cTFjPBcjthXEsro0Am6h5pTnp9+C1e45EUZB6kKNlaTLg+86rcudJoPGi8hBc6WWDuEc=;
Message-ID: <c31a6b07-8c19-5a67-2dc4-84ab0ee59ac7@xen.org>
Date: Wed, 1 Jun 2022 18:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] docs/misra: add Rule 5.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com,
 Bertrand.Marquis@arm.com, George.Dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205311816170.1905099@ubuntu-linux-20-04-desktop>
 <20220601014402.2293524-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220601014402.2293524-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 01/06/2022 02:44, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Add Rule 5.1, with the additional note that the character limit for Xen
> is 40 characters.
> 
> The max length identifiers found by ECLAIR are:
> 
> __mitigate_spectre_bhb_clear_insn_start
> domain_pause_by_systemcontroller_nosync
> 
> Both of them are 40 characters long.
> 
> Explicitly mention that public headers might have longer identifiers.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

