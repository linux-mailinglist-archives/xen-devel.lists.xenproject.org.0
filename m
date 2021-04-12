Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720D35C460
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 12:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108954.207931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVu9L-0000Xb-SI; Mon, 12 Apr 2021 10:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108954.207931; Mon, 12 Apr 2021 10:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVu9L-0000XC-PM; Mon, 12 Apr 2021 10:50:35 +0000
Received: by outflank-mailman (input) for mailman id 108954;
 Mon, 12 Apr 2021 10:50:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVu9K-0000X3-3o
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:50:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c2bce5a-6e92-43aa-8e36-adbf945bde55;
 Mon, 12 Apr 2021 10:50:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CCACAE20;
 Mon, 12 Apr 2021 10:50:32 +0000 (UTC)
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
X-Inumbo-ID: 1c2bce5a-6e92-43aa-8e36-adbf945bde55
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618224632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZFZpFLCtQsGVUmzlOY8atYeKO8X0Xi0MBEOJ96gl4g=;
	b=KHMN7M2G5OovXppCwW3xjMLsWrjXMJq7qIf3c6Go7uyJCkuKzBi9+YZUErLWMVAQv9qqez
	baQwdYm8D5BSvfw5AhJno/ulOU9OPf/kEPmtCxT9puaw9t2059BEMfV50Wc5rDvONHGJK1
	cYGp9gvlHI3LG6QasWzic9cR4xL52vg=
Subject: Re: [PATCH] iommu: remove read_msi_from_ire hook
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20210412104253.54690-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a4a0252-7ad4-82e0-0004-6c85974e8034@suse.com>
Date: Mon, 12 Apr 2021 12:50:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412104253.54690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.04.2021 12:42, Roger Pau Monne wrote:
> It's now unused after commit 28fb8cf323dd93f59a9c851c93ba9b79de8b1c4e.
> 
> Fixes: 28fb8cf323d ('x86/iommu: remove code to fetch MSI message from remap table')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

