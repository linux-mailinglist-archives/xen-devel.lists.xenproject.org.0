Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024438CA0D0
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 18:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726278.1130544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s965N-0003eC-Ec; Mon, 20 May 2024 16:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726278.1130544; Mon, 20 May 2024 16:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s965N-0003cg-BD; Mon, 20 May 2024 16:42:05 +0000
Received: by outflank-mailman (input) for mailman id 726278;
 Mon, 20 May 2024 16:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+3cx=MX=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s965M-0003ca-P5
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 16:42:04 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2a1e559-16c7-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 18:42:03 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id 490198006F;
 Mon, 20 May 2024 17:42:02 +0100 (BST)
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
X-Inumbo-ID: e2a1e559-16c7-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1716223322;
	bh=/ZnkWziLBVnC6JxsP8Loi42TbdfzlAQwNmRa/ZBHliE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lqLjlwIvccCUHA345PG9ltJGu4grOHFJ9CIlY4Q9TKCgmbk7lVOddr9eoeG6QaMeV
	 /VoXVa4fSgt60WBySNqMabq1wCkFRJXDr/SeXQVcZCCBAtq+1WD198avqDRrya+xAW
	 RlKIQ+MsRqjGG0DQ9+rGHNaSeBFGr3yysTHOyp4E=
MIME-Version: 1.0
Date: Mon, 20 May 2024 17:42:02 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Xen Devel <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: xl list -l aborts with double free error with vlan patches
In-Reply-To: <0d8fbde01bedf97dcd7540ceea6c42ab@solinno.co.uk>
References: <0d8fbde01bedf97dcd7540ceea6c42ab@solinno.co.uk>
Message-ID: <98be4595598cddcd7456a77794992aa1@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2024-05-20 15:33, Leigh Brown wrote:
> Hello,
> 
> When running xl list -l with my VLAN patches applied, a double free 
> error is raised. I'm unable to determine why.
> 
> broken: 0cc01c603f4287233715a526b056bc20e0e97412 (HEAD) tools/xl: add 
> vlan keyword to vif option
> okay:   3bc14e4fa4b9832888710759a7dbe5f0d239f33b tools/libs/light: Add 
> vlan field to libxl_device_nic
> okay:   e27fc7d15eab79e604e8b8728778594accc23cf1 tools/xentop: Fix cpu% 
> sort order
> 
> Any suggestions appreciated...
> 
> Debug run and backtrace:
> [snip]

Thanks for Jason for pointing out my error - patch incoming.

Regards,

Leigh.

