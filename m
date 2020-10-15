Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995F28ED74
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 09:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7112.18641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSxQD-00036n-6v; Thu, 15 Oct 2020 07:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7112.18641; Thu, 15 Oct 2020 07:11:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSxQD-00036O-3Z; Thu, 15 Oct 2020 07:11:33 +0000
Received: by outflank-mailman (input) for mailman id 7112;
 Thu, 15 Oct 2020 07:11:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSxQB-00036F-Ik
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 07:11:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95f3307b-82c9-4a3c-a69a-291fda1b08bb;
 Thu, 15 Oct 2020 07:11:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99D3DAC24;
 Thu, 15 Oct 2020 07:11:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSxQB-00036F-Ik
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 07:11:31 +0000
X-Inumbo-ID: 95f3307b-82c9-4a3c-a69a-291fda1b08bb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 95f3307b-82c9-4a3c-a69a-291fda1b08bb;
	Thu, 15 Oct 2020 07:11:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602745889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D1rJEdDtfrGwBnMAHJ2Ueb32PjJSc4BSKbXBS3PCFk=;
	b=GAA8+mXr1m/g89JLb7UjsDlPKIADzmF6pG/luWgArmvILNwiy/Ac2WZMmH/3nVlH3Y2OTo
	Z4FcSrEXSD6ClylncaE09z553+JUSREgwYo7vh3l138aRvI0czL6Fn/4i3REA109sEHIAD
	DAgKtgsKlxR+Yc9ykb4Fo2fE2YwSeH8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 99D3DAC24;
	Thu, 15 Oct 2020 07:11:29 +0000 (UTC)
Subject: Re: [PATCH 1/2] x86/intel: insert Ice Lake X (server) model numbers
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, jun.nakajima@intel.com,
 kevin.tian@intel.com
References: <1602558169-23140-1-git-send-email-igor.druzhinin@citrix.com>
 <ca9a1cce-1e51-0f55-4527-42f48bc7d6ab@suse.com>
 <e30f7f98-ee1a-1a24-0496-01911a79c861@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9c208aa0-ec20-7ee5-38ac-faaf1fef5aee@suse.com>
Date: Thu, 15 Oct 2020 09:11:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <e30f7f98-ee1a-1a24-0496-01911a79c861@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.10.2020 18:42, Igor Druzhinin wrote:
> On 14/10/2020 16:47, Jan Beulich wrote:
>> On 13.10.2020 05:02, Igor Druzhinin wrote:
>>> LBR, C-state MSRs and if_pschange_mc erratum applicability should correspond
>>> to Ice Lake desktop according to External Design Specification vol.2.
>>
>> Could you tell me where this is publicly available? Even after spending
>> quite a bit of time on searching for it, I can't seem to be able to
>> find it. And the SDM doesn't have enough information (yet).
> 
> True that SDM doesn't have this data. As I mentioned that data is taken from
> External Design Specification for Ice Lake server which is accessed using Intel
> account. I'm not completely sure it is right to make changes in open source
> project like Linux or Xen based on information which is not publicly available
> yet. But Intel is frequently doing this with Linux : even my second patch uses
> data taken from one of these documents and was committed by Intel to Linux first.
> 
> Do we need the information publicly available to commit these changes as well?

Not necessarily, but it means this patch needs to be acked by someone
having access to the doc, which hence isn't me. Given the last SDM
update was in May, I'm expecting a refresh any day now. Iirc updates
where frequently done on a roughly quarterly basis.

> If not, we can run with these changes in our patchqueue until it gets out properly.

Well, I'm all for having such changes upstream as early as possible.

Jan

