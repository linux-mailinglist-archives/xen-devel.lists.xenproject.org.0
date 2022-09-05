Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F175AD7B5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 18:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399042.640081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF9C-0006x7-Em; Mon, 05 Sep 2022 16:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399042.640081; Mon, 05 Sep 2022 16:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF9C-0006uW-Af; Mon, 05 Sep 2022 16:40:30 +0000
Received: by outflank-mailman (input) for mailman id 399042;
 Mon, 05 Sep 2022 16:40:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVF9B-0006uP-4E
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 16:40:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVF9A-0006Jt-Rm; Mon, 05 Sep 2022 16:40:28 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVF9A-0008Nf-Ly; Mon, 05 Sep 2022 16:40:28 +0000
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
	bh=TE7m6aGewoSAgxWuzTVhscDrS+uZQg9ihL2LZLx33V4=; b=tP0muAvZNWqIS1R6PbuwRmuazJ
	BI84Oolnb9prqXmTGktZcU/rFdMgyMKXObsCOcMVKtL7HGyJTKBTfkQKvfQpgbOmauERlyy0q0oa8
	dSlAgQzdeGelCM86r7WBgA9GMlTthXD1xPunN+0Hv+ssUz2/fxs1ide5HegUAXXL5v3M=;
Message-ID: <771e2800-4457-b9f4-63bf-a71f3805e4ea@xen.org>
Date: Mon, 5 Sep 2022 17:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
 <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
 <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
 <6B0D4F4B-C7CC-4C04-9BA4-71976CAA82C5@arm.com>
 <cf2872c6-23e3-ced4-d7c5-2a5e6ade98ad@xen.org>
 <1874D575-E3B3-4221-925F-AF71D3EF0289@arm.com>
 <EBF5412F-F932-4D25-A2E3-9F53D59ABBCC@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <EBF5412F-F932-4D25-A2E3-9F53D59ABBCC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/09/2022 14:36, Rahul Singh wrote:
> Please have a look once if this looks okay.
> 
> /*
>   * List of possible features for dom0less domUs
>   *
>   * DOM0LESS_ENHANCED_BASIC:	Notify the OS it is running on top of Xen. All the
>   *                                                          	default features (excluding Xenstore) will be
>   *                          					available. Note that an OS *must* not rely on the
>   *                          					availability of Xen features if this is not set.
>   * DOM0LESS_XENSTORE:       		Xenstore will be enabled for the VM. This feature
>   *                          					can't be enabled without the DOM0LESS_ENHANCED_BASIC.
>   * DOM0LESS_ENHANCED:			Notify the OS it is running on top of Xen. All the
>   *                          					default features (including Xenstore) will be
>   *                          					available. Note that an OS *must* not rely on the
>   *                          					availability of Xen features if this is not set.
>   */
> #define DOM0LESS_ENHANCED_BASIC     BIT(0, UL)
> #define DOM0LESS_XENSTORE                  BIT(1, UL)
> #define DOM0LESS_ENHANCED                 (DOM0LESS_ENHANCED_BASIC  |  DOM0LESS_XENSTORE)

The explanation looks good to me but the indentation looks odd. Also, I 
think it would be preferable to use U or ULL (if you want 64 bits) so 
the size of the bitfield is not arch depending.

Cheers,

-- 
Julien Grall

