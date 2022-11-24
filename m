Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A4637586
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 10:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447910.704541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8qR-0005nT-V6; Thu, 24 Nov 2022 09:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447910.704541; Thu, 24 Nov 2022 09:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8qR-0005ky-SL; Thu, 24 Nov 2022 09:48:35 +0000
Received: by outflank-mailman (input) for mailman id 447910;
 Thu, 24 Nov 2022 09:48:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oy8qQ-0005ks-Ov
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 09:48:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oy8qL-0007s3-Vt; Thu, 24 Nov 2022 09:48:29 +0000
Received: from [54.239.6.186] (helo=[192.168.1.238])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oy8qL-0002gj-Ni; Thu, 24 Nov 2022 09:48:29 +0000
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
	MIME-Version:Date:Message-ID; bh=tcVUoR4KbJwiz9hwZb+tr9FFKbd4IL+/0gkkHkNmrRA=
	; b=7FJxCTlQrT4xbZm1s7d/DakEl20b1Uwkxs54NenNb49kr6ZITJMWZXbtTgyoVf8YK8yYvtwh5
	ov8VbD4O7SLZNczYHmBCbZHkKNetstJdrY2AcTj8EVQNlH0UA9bMurQB4P83+lIfSMnDuk/l36lGM
	2JMMMCY+W3RPMBN/DYSG8=;
Message-ID: <3deaeaf4-dd5d-93cb-2ca5-3c22e2c19bff@xen.org>
Date: Thu, 24 Nov 2022 10:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Content-Language: en-US
To: "committers@xenproject.org" <committers@xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Julien Grall <julien@xen.org>
Subject: Commit moratorium
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

We will be branching the tree for Xen 4.17 in the next few days. Please 
avoid committing any new patches to staging until further notice.

Cheers,

-- 
Julien Grall

