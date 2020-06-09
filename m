Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC031F382C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 12:32:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jibYZ-0007aD-4k; Tue, 09 Jun 2020 10:32:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jibYY-0007a8-Iy
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 10:32:34 +0000
X-Inumbo-ID: 87594868-aa3c-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87594868-aa3c-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 10:32:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C004ABCF;
 Tue,  9 Jun 2020 10:32:36 +0000 (UTC)
Subject: Re: [PATCH] x86/Intel: insert Ice Lake and Comet Lake model numbers
To: Paul Durrant <paul@xen.org>
References: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
 <d28d54d1-3548-3eca-b672-2f9ea1b5ceb9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d16dda5-298d-248c-7b9e-f27d74ca1b7c@suse.com>
Date: Tue, 9 Jun 2020 12:32:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <d28d54d1-3548-3eca-b672-2f9ea1b5ceb9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.06.2020 19:37, Andrew Cooper wrote:
> On 05/06/2020 08:51, Jan Beulich wrote:
>> Both match prior generation processors as far as LBR and C-state MSRs
>> go (SDM rev 072) as well as applicability of the if_pschange_mc erratum
>> (recent spec updates).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Such changes having been subject to backporting in the past, this
>> change may want considering for 4.14.
>> ---
>> I'm leaving alone spec_ctrl.c, albeit there's a scary looking erratum
>> for Ice Lake indicating that MDS_NO may wrongly be set. But this is
>> apparently addressed by ucode update, so we may not need to deal with
>> it in software.
> 
> I've enquired about this.  At a guess, there was another hole found, so
> MDS_NO has been cleared and VERW flushing reinstated.
> 
> Either way, changes there can wait until we've got confirmation.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Paul - any thoughts about this one either way for 4.14?

Jan

