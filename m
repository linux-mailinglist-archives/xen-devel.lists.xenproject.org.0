Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB420CD52
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 10:33:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jppDe-0005va-5f; Mon, 29 Jun 2020 08:32:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jppDc-0005vV-Q5
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 08:32:48 +0000
X-Inumbo-ID: 1cb5d5ce-b9e3-11ea-853f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cb5d5ce-b9e3-11ea-853f-12813bfff9fa;
 Mon, 29 Jun 2020 08:32:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D668AB89;
 Mon, 29 Jun 2020 08:32:47 +0000 (UTC)
Subject: Re: Suspend/hibernate not working on Dell XPS 15 9500 laptop
To: Trevor Bentley <trevor@yubico.com>
References: <afe621ac-d446-7dbf-e368-e06ab0a95970@yubico.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d49bf4a-d82d-36d3-863c-e954d751b959@suse.com>
Date: Mon, 29 Jun 2020 10:32:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <afe621ac-d446-7dbf-e368-e06ab0a95970@yubico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.06.2020 10:35, Trevor Bentley wrote:
> Please let me know if you have any suggestions to try, or if you need 
> any extra information for debugging.

I don't suppose you have a serial port on this laptop? I ask because
the serial log (and the possibility to issue debug keys) are about
the only thing debugging-wise that may help here, short of someone
noticing the underlying problem by code inspection.

Do you have any indication of the laptop at least partly waking up
again, e.g. from some LED or other indicator activity?

Jan

