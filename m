Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1933E63FA4E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 23:07:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451277.708952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0ri4-0001rJ-Qj; Thu, 01 Dec 2022 22:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451277.708952; Thu, 01 Dec 2022 22:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0ri4-0001p9-N5; Thu, 01 Dec 2022 22:07:12 +0000
Received: by outflank-mailman (input) for mailman id 451277;
 Thu, 01 Dec 2022 22:07:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0ri3-0001oz-VN
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 22:07:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0ri3-0005Cn-Es; Thu, 01 Dec 2022 22:07:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0ri3-0002yC-9c; Thu, 01 Dec 2022 22:07:11 +0000
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
	bh=1skNf1SaxFsuG9O5YNfhkL679oumo777KLQSsPBHxZE=; b=zVCJvFXS1wIgE0P7H9acSiRXVF
	fhg++F9qEieibDflQ2gMy4CyPZ48Jl+BPcKenNTiTofomyev4FhtQ84Zi7OiPcVauIWssm96ZYvvq
	qGKWUBz2bRQ8ox3VThQ2p0JcYrTho0yJ5QJ7HDhpeU218yf3Ey8GQwsrgZd7HRZp7MWU=;
Message-ID: <abe72943-e9ec-4532-1667-7dfe1f739046@xen.org>
Date: Thu, 1 Dec 2022 22:07:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 16/20] tools/xenstore: let chk_domain_generation() return
 a bool
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-17-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221101152842.4257-17-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> Instead of returning 0 or 1 let chk_domain_generation() return a
> boolean value.
> 
> Simplify the only caller by removing the ret variable.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

