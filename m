Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45B7DCFA8
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625863.975587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxq6o-0004xX-7a; Tue, 31 Oct 2023 14:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625863.975587; Tue, 31 Oct 2023 14:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxq6o-0004uz-4r; Tue, 31 Oct 2023 14:52:46 +0000
Received: by outflank-mailman (input) for mailman id 625863;
 Tue, 31 Oct 2023 14:52:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxq6m-0004ur-Qe
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:52:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxq6j-0005kw-QT; Tue, 31 Oct 2023 14:52:41 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.9.249]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxq6j-00031U-IX; Tue, 31 Oct 2023 14:52:41 +0000
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
	bh=i+o9xNOUQwP/1uw4PqDICiGsoJ7ABp2Z37PRV7kBtIE=; b=W75Y9uoIYRcyj/T2lbaMpjj20Y
	5Vpxv+09u/xMt1TaAZ44BOPx0OOi9fjJSVAUKFUBvokse1Fv9WiBxwzGn0EWYDQgfdq8/bsYZTSrg
	NfBO4Yk1mp2krkY15LCzrleNbPtuVjuy+DUAEXvmOJ5ye3Scp1s2Rt2IfrMQeCcgeC/A=;
Message-ID: <4f8b3eb4-2765-40e6-8979-ccfebd81e37d@xen.org>
Date: Tue, 31 Oct 2023 14:52:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] CHANGELOG.md: Finalize the 4.18 release date
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>
References: <20231031144925.2416266-1-Henry.Wang@arm.com>
 <20231031144925.2416266-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231031144925.2416266-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/10/2023 14:49, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

