Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD1C81452D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 11:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655012.1022643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE58I-0006jL-Bo; Fri, 15 Dec 2023 10:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655012.1022643; Fri, 15 Dec 2023 10:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE58I-0006gg-94; Fri, 15 Dec 2023 10:09:26 +0000
Received: by outflank-mailman (input) for mailman id 655012;
 Fri, 15 Dec 2023 10:09:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rE58G-0006dc-St
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 10:09:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rE58G-0002W8-EP; Fri, 15 Dec 2023 10:09:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rE58G-0002SS-9g; Fri, 15 Dec 2023 10:09:24 +0000
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
	bh=LKYG6QOonHkrTfzQaFyV96HChZyiX8dgHI4zP6hOfZo=; b=yWE8mV1UVlns7ViFDlGWvMhM4w
	vynaiXmjRGhQEQg7BL/A4uLuuCoyfEjeEh/T86oX7yk0sxsa/UmGmLGhTVP8zeU13ftOz2aXX3zNT
	rF17w4GxZ72kzDocXD6QcoeZUzzRmnrB/xXoaqsO6ouOdC82Y+3Ii9VYvr+uqYhNImA0=;
Message-ID: <ee67fddd-ca90-4b18-9256-579881e9fb87@xen.org>
Date: Fri, 15 Dec 2023 10:09:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra/rules.rst: add Rule 16.2
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, george.dunlap@citrix.com,
 bertrand.marquis@arm.com, roger.pau@citrix.com, roberto.bagnara@bugseng.com,
 federico.serafini@bugseng.com
References: <alpine.DEB.2.22.394.2312071612330.1265976@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312071612330.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/12/2023 00:18, Stefano Stabellini wrote:
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

