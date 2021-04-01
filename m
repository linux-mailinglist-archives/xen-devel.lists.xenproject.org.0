Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC0E351593
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104525.200017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy5C-0002jU-N7; Thu, 01 Apr 2021 14:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104525.200017; Thu, 01 Apr 2021 14:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy5C-0002io-J9; Thu, 01 Apr 2021 14:14:02 +0000
Received: by outflank-mailman (input) for mailman id 104525;
 Thu, 01 Apr 2021 14:14:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRy5B-0002iT-I3
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:14:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ed5b708-1ae2-452b-9cec-5750334e0ebf;
 Thu, 01 Apr 2021 14:14:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15963AEB9;
 Thu,  1 Apr 2021 14:14:00 +0000 (UTC)
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
X-Inumbo-ID: 1ed5b708-1ae2-452b-9cec-5750334e0ebf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617286440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpCVOHY80H//GRsONMEcUeWejoev2F5CSJsOZBHVfLU=;
	b=QKdfwdwPg8c+FXt3I9Whhyv7IWON66MZT9G4F2k7uVMUdwszRkSo3w1bfDAcv+L35sFNQP
	UMSgyzUbQHwk4dq8MggyfiMAkb5jhd06sAGb54CsCUMaO7yA/u19EtSoNTdiw5A4lqBoDN
	F+eD6nPqI/zE+Q1S+3+On5OjCIb3nS0=
Subject: Re: [PATCH for-4.15 5/7] CHANGELOG.md: Various new entries, mostly
 x86
To: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-5-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <64e450c6-26de-453d-3b57-5d8c0daa85fa@suse.com>
Date: Thu, 1 Apr 2021 16:13:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401133827.362216-5-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 15:38, George Dunlap wrote:
> ...Grouped mostly by submitter / maintainer
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


