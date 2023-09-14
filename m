Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E27A0FE2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 23:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602754.939484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgtvJ-00049M-GJ; Thu, 14 Sep 2023 21:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602754.939484; Thu, 14 Sep 2023 21:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgtvJ-00046s-DS; Thu, 14 Sep 2023 21:30:53 +0000
Received: by outflank-mailman (input) for mailman id 602754;
 Thu, 14 Sep 2023 21:30:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgtvH-00046k-NO
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 21:30:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgtvG-0005aa-Nh; Thu, 14 Sep 2023 21:30:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgtvG-0003mQ-In; Thu, 14 Sep 2023 21:30:50 +0000
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
	bh=SnYjpn2smNsg/pxm4w+pGUEjlDXZ29xGcg+mvYk8pYs=; b=wHidkCc+nBgVsJkoLjSyUT5amf
	sT4SQXEYTGAoq5GX67cwqJvgC508iXQsIGlxajF11E1pXo/w54kFioY0NSdFSWfSW/5M2q5CXyeDi
	o3szu3+lSz1CuQfVktVxX3WSxgVvBaixN0HK7a78NFCsP9TYb18FKtpmLyGXgIW6jgoY=;
Message-ID: <1036676e-db31-450a-bf48-4456f56f2c3f@xen.org>
Date: Thu, 14 Sep 2023 22:30:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] tools/binfile: switch to common annotations model
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
 <2315f865-cd41-b0e6-524c-cee57e748ba1@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2315f865-cd41-b0e6-524c-cee57e748ba1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/08/2023 07:30, Jan Beulich wrote:
> Use DATA() / END() and drop the now redundant .global. No change in
> generated data; of course the two symbols now properly gain "hidden"
> binding.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

