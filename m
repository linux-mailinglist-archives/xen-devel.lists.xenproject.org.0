Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B609BF72C6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 16:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147406.1479716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDiM-0006Ik-M1; Tue, 21 Oct 2025 14:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147406.1479716; Tue, 21 Oct 2025 14:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDiM-0006Fe-Id; Tue, 21 Oct 2025 14:51:54 +0000
Received: by outflank-mailman (input) for mailman id 1147406;
 Tue, 21 Oct 2025 14:51:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vBDiL-0006FY-01
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 14:51:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBDiK-00CkzO-1e;
 Tue, 21 Oct 2025 14:51:52 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBDiK-005xLs-1J;
 Tue, 21 Oct 2025 14:51:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=sdNiabHQHpTGKNuhV/3alLaPI7EUnoMUv33owjFBzvM=; b=SBmyJdiCAGpRZ4AWnTtoa0HuVh
	8+ngrsiT/5HvXIQpz53gSu6f4EkamSVty+/Hl9qttrS643xNbUI13YIeDQ9fCQ2LpeP/r0TKty0Ce
	UmZUF7mT4XQ3CJBoE6GYap/FII2iGC2/OzBS2OSR83LQN5KZK8rUefqvQrZhlafdiaAI=;
Date: Tue, 21 Oct 2025 16:51:50 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21] libxl: make gentypes.py compatible with Python
 older than 3.9
Message-ID: <aPeeBoE-VDf-FsNt@l14>
References: <751bb140-3f00-47f1-9492-464c01ea1429@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <751bb140-3f00-47f1-9492-464c01ea1429@suse.com>

On Thu, Oct 16, 2025 at 01:22:30PM +0200, Jan Beulich wrote:
> removeprefix() was added only in 3.9. As long as the "jso_sub_" prefix is
> always going to be there anyway, switch to a less specific but more
> compatible construct.
> 
> Fixes: f6c6f2679d49 ("libxl: libxl__object_to_json() to json-c")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

