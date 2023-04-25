Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D86EE6E6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526257.817907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMaP-0002gy-DI; Tue, 25 Apr 2023 17:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526257.817907; Tue, 25 Apr 2023 17:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMaP-0002dt-AK; Tue, 25 Apr 2023 17:36:17 +0000
Received: by outflank-mailman (input) for mailman id 526257;
 Tue, 25 Apr 2023 17:36:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1prMaN-0002dn-OE
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:36:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1prMaM-0002fq-FS; Tue, 25 Apr 2023 17:36:14 +0000
Received: from [54.239.6.184] (helo=[192.168.17.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1prMaM-0008SB-8l; Tue, 25 Apr 2023 17:36:14 +0000
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
	bh=LRP3BF92yluZBIpqFABAu2xc1JQLuJuRtqH56OuTS54=; b=Bx+847RVm8qZMaO+s6ElAIzNIh
	2rGhtulOk3AviFSmbDjs+FspcXeuuWh8Pg+h6DpiAusXEptLl1aCpv/zyFOSQeQPXalLz56AjUj0a
	GWJPA9H9MBSwUYc7Gug0RlnzKjvae/tdfK9yDz6WE302tphX+a4Rw1pd8jaVKwTTM3qw=;
Message-ID: <d27bed23-bd4b-9a50-a0cf-7c3d4d57da22@xen.org>
Date: Tue, 25 Apr 2023 18:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 03/13] tools/xenstore: introduce accounting data array
 for per-domain values
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230405070349.25293-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/04/2023 08:03, Juergen Gross wrote:
> Introduce the scheme of an accounting data array for per-domain
> accounting data and use it initially for the number of nodes owned by
> a domain.
> 
> Make the accounting data type to be unsigned int, as no data is allowed
> to be negative at any time.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

