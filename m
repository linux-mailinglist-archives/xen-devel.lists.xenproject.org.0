Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC9D728D22
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 03:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545554.852033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7R1N-0002nT-83; Fri, 09 Jun 2023 01:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545554.852033; Fri, 09 Jun 2023 01:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7R1M-0002m1-Uy; Fri, 09 Jun 2023 01:34:32 +0000
Received: by outflank-mailman (input) for mailman id 545554;
 Fri, 09 Jun 2023 01:34:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7R1L-0002jw-AQ; Fri, 09 Jun 2023 01:34:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7R1K-0003KN-E4; Fri, 09 Jun 2023 01:34:30 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[10.95.166.95])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7R1K-0005Cv-6o; Fri, 09 Jun 2023 01:34:30 +0000
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
	bh=B3h+18k1zK1HHzSTWiiO1IwIppFZgRkziWTk8ZGxEo0=; b=vVddEZF1fy8iX8TBHC6k2Vh4pX
	r6NUD+qoU+vexzF/fX3E2cZMrjsQNfvbuU0pW/tVjaBKdVYpjszr92Esh0RDDE4sGtdohOmd2OvDP
	6PqOaWhOFpWhjU6n/HQG6Fs9bKTjftk+R2c3iwOMOWtkBL9OF+rWWNPiU1TZ06LJMKA4=;
Message-ID: <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org>
Date: Fri, 9 Jun 2023 02:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jiatong Shen <yshxxsjt715@gmail.com>
Cc: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/06/2023 23:39, Stefano Stabellini wrote:
> Hi Jiatong,
> 
> Do you have access to the serial? If so, it is possible that the boot
> is actually successful and it is only the screen initialization the
> problem.
> 
> If kunpeng 920 is a UEFI/ACPI machine, we know that there are issues
> with screen initialization.

More importantly, you may want to check that if Xen was compiled with 
ACPI enabled (unlikely if this is the package from Debian). If not, you 
will need to build your own Xen.

Cheers,

-- 
Julien Grall

