Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94146A2F5A
	for <lists+xen-devel@lfdr.de>; Sun, 26 Feb 2023 13:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502042.773831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWFiE-00059h-Py; Sun, 26 Feb 2023 12:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502042.773831; Sun, 26 Feb 2023 12:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWFiE-000573-MZ; Sun, 26 Feb 2023 12:01:06 +0000
Received: by outflank-mailman (input) for mailman id 502042;
 Sun, 26 Feb 2023 12:01:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pWFiD-00056t-Hj
 for xen-devel@lists.xenproject.org; Sun, 26 Feb 2023 12:01:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWFiC-000687-Bh; Sun, 26 Feb 2023 12:01:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWFiC-0003xx-4a; Sun, 26 Feb 2023 12:01:04 +0000
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
	bh=wcq4fTWULUwiaOJ314uKBfDBPwSIOpXT1RYMg1KoHVY=; b=oNr0qSjWs7TWP4xRw4pHPNUSVj
	IQ6elewHsy77Uvh3UtUFnCa6A9P6XLfkDAsoKF/z6UcA6gUfwZ5qIfAvNwaeQMaaCSOWK9fUaEN6E
	aZQB2mJX50xgpycaRF2mgoV1WZCS5msUL55PvV8wsub3CNVyrM0nPS15A3FM6/T41J2o=;
Message-ID: <7e16908b-4caa-b076-f3cf-b68c1d3dc766@xen.org>
Date: Sun, 26 Feb 2023 12:01:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 2/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag
 in *.c (part 2)
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, demi@invisiblethingslab.com,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>
References: <20230209230020.52695-1-julien@xen.org>
 <20230209230020.52695-3-julien@xen.org> <Y/dMzst9+JJDwAp/@perard.citrite.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Y/dMzst9+JJDwAp/@perard.citrite.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 23/02/2023 11:23, Anthony PERARD wrote:
> On Thu, Feb 09, 2023 at 11:00:16PM +0000, Julien Grall wrote:
>> This is replacing the below pattern with the SPDX tag GPL-2.0 in
>> xen/arch/x86/*.c:
>>
>>   * This program is free software; you can redistribute it and/or modify
>>   * it under the terms of the GNU General Public License as published by
>>   * the Free Software Foundation; either version 2 of the License, or
>>   * (at your option) any later version.
> 
> This boilerplate allow to use newer version of the GPL license, the
> identifier for that is "GPL-2.0-or-later".

Whoops! I will switch to GPL-2.0-or-later.

>      https://spdx.org/licenses/GPL-2.0-or-later.html
> 
>>   * This program is distributed in the hope that it will be useful,
>>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>   * GNU General Public License for more details.
>>   *
>>   * You should have received a copy of the GNU General Public License
>>   * along with this program; If not, see <http://www.gnu.org/licenses/>.

Cheers,

-- 
Julien Grall

