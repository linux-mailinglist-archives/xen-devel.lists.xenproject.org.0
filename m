Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D182486B3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:08:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82HC-00028O-6Z; Tue, 18 Aug 2020 14:07:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k82HA-00028J-Bt
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:07:44 +0000
X-Inumbo-ID: 557ab0c2-c225-4efd-b30c-b3d77ad62bd3
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 557ab0c2-c225-4efd-b30c-b3d77ad62bd3;
 Tue, 18 Aug 2020 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=K5c8RqjQDRdYU1KMZroj5iiv2JELdAF5V8LZk3sLqD0=; b=6EPc4qMOU6iW3zLRZUGLO70FsS
 xtXjQLU0hW1bGcpjyh7tui2DDhJJG5n4th4KxHYq2KGN0eDEMxpSS9lF5gmVAJnV3WSXPVF4ADROT
 7G+g9zTXWTEo3D12IGFr4/Sm2VLLLTxiL/K+Q3YPv9YFwL6zxLSQIKc1NAEJ9/TPM2Xs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k82H7-0005ky-Le; Tue, 18 Aug 2020 14:07:41 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k82H7-0005lA-Dr; Tue, 18 Aug 2020 14:07:41 +0000
Subject: Re: [PATCH 1/2] arm: Add Neoverse N1 processor identifation
To: Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <cover.1597740876.git.bertrand.marquis@arm.com>
 <46faecc92bee2a02490b926a636c3eafef1d185e.1597740876.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <30bb7d3d-864a-6f34-c55f-7130d2acfcf7@xen.org>
Date: Tue, 18 Aug 2020 15:07:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <46faecc92bee2a02490b926a636c3eafef1d185e.1597740876.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

Title: s/identifation/identification/

On 18/08/2020 14:47, Bertrand Marquis wrote:
> Add MIDR and CPU part numbers for Neoverse N1
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

I can fix the typo on commit:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

