Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B469B292
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 19:49:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497275.768214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5nF-0007h0-UN; Fri, 17 Feb 2023 18:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497275.768214; Fri, 17 Feb 2023 18:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5nF-0007eY-R7; Fri, 17 Feb 2023 18:49:13 +0000
Received: by outflank-mailman (input) for mailman id 497275;
 Fri, 17 Feb 2023 18:49:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pT5nE-0007cl-7e
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 18:49:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pT5nD-0004Do-GX; Fri, 17 Feb 2023 18:49:11 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.15.164]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pT5nD-0005lg-9n; Fri, 17 Feb 2023 18:49:11 +0000
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
	bh=mGcksg/Z3kagHKEP9xzmsv2srfnFAf+Y1ev/9n/ba/8=; b=Ofr4+Ad6MASI54ggFnpQYul3JJ
	hlKruEjQNa8Tfvqs0QeuSBjR7L4i/34LncLWyTlSP/6ZkhmAlSHgr81UdBY3q+OtbcxU/Ux2dzHBM
	h0z/w0HwsBTCetgVE+sWKHc8yUgrT0XUqbA7jNP99X84Y1YTEquZTD/ug8xbF/+KXwLw=;
Message-ID: <ffc7b99c-1fb7-0a34-3949-63740b658903@xen.org>
Date: Fri, 17 Feb 2023 18:49:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 02/13] tools/xenstore: manage per-transaction domain
 accounting data in an array
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230120100028.11142-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 20/01/2023 10:00, Juergen Gross wrote:
> In order to prepare keeping accounting data in an array instead of
> using independent fields, switch the struct changed_domain accounting
> data to that scheme, for now only using an array with one element.
> 
> In order to be able to extend this scheme add the needed indexing enum
> to xenstored_domain.h.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

