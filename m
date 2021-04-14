Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C535F38A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 14:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110559.211013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWeZD-0004Vu-UJ; Wed, 14 Apr 2021 12:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110559.211013; Wed, 14 Apr 2021 12:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWeZD-0004VV-RC; Wed, 14 Apr 2021 12:24:23 +0000
Received: by outflank-mailman (input) for mailman id 110559;
 Wed, 14 Apr 2021 12:24:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWeZC-0004VQ-8T
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 12:24:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a4ba0ce-54a5-4304-846f-fe6d4f4fb207;
 Wed, 14 Apr 2021 12:24:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78276AFC1;
 Wed, 14 Apr 2021 12:24:20 +0000 (UTC)
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
X-Inumbo-ID: 0a4ba0ce-54a5-4304-846f-fe6d4f4fb207
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618403060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fJvyFXVddqOT3O88Gc5kGj2yAEhp5+dwg70m8mdMkw=;
	b=D1QodvSfVnvsCpQzKYQTrenIVYFx23ovaRxeucJd+p/RUwqSIH4jTbXQLFMW8l51De0Uwd
	vrBpdAZxlL6Y+CJf0XwLuMa3DbxD936mz59uHtwZDBiXkJPdnB6OUpCUmikHIhAvb1Ybu9
	ESTGCVEt57uNrLTP0lGaUvJzlyCxoos=
Subject: Re: [PATCH v4 2/2] x86/intel: insert Ice Lake-SP and Ice Lake-D model
 numbers
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 jun.nakajima@intel.com, kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1618375222-9283-1-git-send-email-igor.druzhinin@citrix.com>
 <1618375222-9283-2-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d29db3ab-3e49-41cb-8380-a025d9ba4127@suse.com>
Date: Wed, 14 Apr 2021 14:24:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618375222-9283-2-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.04.2021 06:40, Igor Druzhinin wrote:
> LBR, C-state MSRs should correspond to Ice Lake desktop according to
> SDM rev. 74 for both models.
> 
> Ice Lake-SP is known to expose IF_PSCHANGE_MC_NO in IA32_ARCH_CAPABILITIES MSR
> (as advisory tells and Whitley SDP confirms) which means the erratum is fixed
> in hardware for that model and therefore it shouldn't be present in
> has_if_pschange_mc list. Provisionally assume the same to be the case
> for Ice Lake-D while advisory is not yet updated.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

