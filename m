Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D577BF8F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 20:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583797.914118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVc0E-0006bm-So; Mon, 14 Aug 2023 18:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583797.914118; Mon, 14 Aug 2023 18:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVc0E-0006ZM-QJ; Mon, 14 Aug 2023 18:09:18 +0000
Received: by outflank-mailman (input) for mailman id 583797;
 Mon, 14 Aug 2023 18:09:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qVc0D-0006ZB-7w
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 18:09:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVc0B-0006Et-NT; Mon, 14 Aug 2023 18:09:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVc0B-0007AP-IS; Mon, 14 Aug 2023 18:09:15 +0000
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
	bh=B8aXXC9a+qTGzQ6BWiCa1w5Xd6KfTTfpVot+q2S3yX0=; b=CS9QTEUiNVO3n+rmOuhPuwmITg
	OpcaEVthvni3sO7MyZ+oHD5y0dG2WoOM5YyMUWDH/Hb1Uk77O56u8yeZI0HrLoAO0be0VQ0mqcv9O
	J7Mi2eILNOKVmB7wFqeZwkxj73vocetuQcIMk4uFZJ7pJUGuPv9lAx0+kw/x/lNv6XcU=;
Message-ID: <62417026-c365-4a84-b7d7-ef7909628d4f@xen.org>
Date: Mon, 14 Aug 2023 19:09:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/19] tools/xenstore: don't use struct node_perms in
 struct node
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:46, Juergen Gross wrote:
> Open code struct node_perms in struct node in order to prepare using
> struct node_hdr in struct node.
> 
> Add two helpers to transfer permissions between struct node and struct
> node_perms and a helper to directly get connection base permissions
> from a node.
> 
> Let perms_to_strings() take a struct node as parameter and rename it
> to node_perms_to_strings().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

