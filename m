Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D405D355787
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 17:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106065.202813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnR7-0004JP-A5; Tue, 06 Apr 2021 15:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106065.202813; Tue, 06 Apr 2021 15:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnR7-0004J3-6i; Tue, 06 Apr 2021 15:16:13 +0000
Received: by outflank-mailman (input) for mailman id 106065;
 Tue, 06 Apr 2021 15:16:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTnR5-0004Iy-M6
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 15:16:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 747e9f6b-291c-4b4b-a916-8b1137f1bed8;
 Tue, 06 Apr 2021 15:16:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 144A9B211;
 Tue,  6 Apr 2021 15:16:10 +0000 (UTC)
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
X-Inumbo-ID: 747e9f6b-291c-4b4b-a916-8b1137f1bed8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617722170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E5kDzCwey0vPp/1OXLSav9jPixmkPU13olBpaECQy20=;
	b=YiAHdhqZweSJWoGdNY2j3E+g8oiQSuWdYfKFiif7mKlE12aTbS6OALesVJ4BPomA2z/rCM
	KXoNgg+n2FUGAL0mcpN6eFUQRbpZn9K6VChZpM0MNNc25q7nCZLJFwY6czza50mIHUVA8A
	pPFConpLbymhNyB5cx01h4IbX2NHNdk=
Subject: Re: [PATCH 1/2] xen/pci: Move PCI ATS code to common directory
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1617702520.git.rahul.singh@arm.com>
 <e61c9a1190018d8de434d71049b4a97980f22be0.1617702520.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e656413c-e6a1-a305-7980-56732b89a3e2@suse.com>
Date: Tue, 6 Apr 2021 17:16:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e61c9a1190018d8de434d71049b4a97980f22be0.1617702520.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 13:39, Rahul Singh wrote:
> PCI ATS code is common for all architecture, move code to common
> directory to be usable for other architectures.
> 
> No functional change intended.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


