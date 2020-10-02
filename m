Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB328180E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 18:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2257.6720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOO33-0004Uo-Cz; Fri, 02 Oct 2020 16:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2257.6720; Fri, 02 Oct 2020 16:36:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOO33-0004UP-9Z; Fri, 02 Oct 2020 16:36:45 +0000
Received: by outflank-mailman (input) for mailman id 2257;
 Fri, 02 Oct 2020 16:36:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7zU=DJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kOO31-0004UK-Vh
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:36:44 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccc6b92e-473b-425a-8f47-347babf8ec51;
 Fri, 02 Oct 2020 16:36:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kOO30-0004Lj-23; Fri, 02 Oct 2020 16:36:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kOO2z-0004zM-QM; Fri, 02 Oct 2020 16:36:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=r7zU=DJ=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kOO31-0004UK-Vh
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:36:44 +0000
X-Inumbo-ID: ccc6b92e-473b-425a-8f47-347babf8ec51
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ccc6b92e-473b-425a-8f47-347babf8ec51;
	Fri, 02 Oct 2020 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=9hKnUM0EhS5OmQFTKA/pPLX9GRxxho6+EFeFecFz2AI=; b=axTIL75PJ3gewzmv36pQAy7hhT
	O0e1JKXOBHINLMT0NcX6VHftQ9TnLFbfic9eir3RT2zxerZOJrh1FFiLpt54cGM0gMidDY+DBFvPG
	DA47JAF2eIvFcY96b0/qtBcHPGKXHHpVgxcYhJCaNMGeuSilHaxMjCB2mvpjg1Oc9MG8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kOO30-0004Lj-23; Fri, 02 Oct 2020 16:36:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kOO2z-0004zM-QM; Fri, 02 Oct 2020 16:36:41 +0000
Subject: Re: [PATCH v3] arm,smmu: match start level of page table walk with
 P2M
To: laurentiu.tudor@nxp.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com, will@kernel.org
Cc: diana.craciun@nxp.com, anda-alexandra.dorneanu@nxp.com
References: <20201002103344.13015-1-laurentiu.tudor@nxp.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5e64ee7a-436f-03ba-9516-f4d5639b93ba@xen.org>
Date: Fri, 2 Oct 2020 17:36:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201002103344.13015-1-laurentiu.tudor@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 02/10/2020 11:33, laurentiu.tudor@nxp.com wrote:
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Don't hardcode the lookup start level of the page table walk to 1
> and instead match the one used in P2M. This should fix scenarios
> involving SMMU where the start level is different than 1.
> In order for the SMMU driver to also compile on arm32 move the
> P2M_ROOT_LEVEL in the p2m header file (while at it, for
> consistency also P2M_ROOT_ORDER) and use the macro in the smmu
> driver.
> 
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

