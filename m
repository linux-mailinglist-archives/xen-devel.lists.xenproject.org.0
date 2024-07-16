Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68381932A8F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 17:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759679.1169365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTkCL-0006c4-N7; Tue, 16 Jul 2024 15:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759679.1169365; Tue, 16 Jul 2024 15:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTkCL-0006aU-KG; Tue, 16 Jul 2024 15:34:37 +0000
Received: by outflank-mailman (input) for mailman id 759679;
 Tue, 16 Jul 2024 15:34:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sTkCK-0006aL-6y
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 15:34:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTkCH-0000nV-5R; Tue, 16 Jul 2024 15:34:33 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTkCG-0001tz-UK; Tue, 16 Jul 2024 15:34:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID; bh=mNFbSHqR8D2q75imQLSnrm+y0SYU8S3/bOuVRdKpfmI=
	; b=KKu1s2RYES5OsrNcu45FnbHDGnH5aISaAKas5/w/Ec/nzBGOkWikA/gwU/k/61q3E6vntTbV6
	Welty1NUz+bfY5RgcIGRxnT9OzW07cV1houQhsLRmZgEcEAn/HZ7eAq1ZWDEOb24DNQKkqa3nYBhE
	JqyIDO9P3fLYvFogZ7CPQ=;
Message-ID: <770b22e5-95b2-40ed-ab3a-fb471ecf2f0a@xen.org>
Date: Tue, 16 Jul 2024 16:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "committers@xenproject.org" <committers@xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Julien Grall <julien@xen.org>
Subject: Commit moratorium
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

We intend to branch for Xen 4.19 in the next couple of days.

As part of the process, it is easier to branch when staging == master.
Therefore I would like to ask a commit moratorium.

Please don't commit anything (even patches released-acked) until further 
notice.

Cheers,

-- 
Julien Grall

