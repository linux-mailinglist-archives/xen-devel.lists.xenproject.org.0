Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025261B7692
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 15:11:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRy6w-00069y-P5; Fri, 24 Apr 2020 13:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRy6v-00069s-Sy
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 13:11:17 +0000
X-Inumbo-ID: 14c80ee8-862d-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14c80ee8-862d-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 13:11:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 42620AC5B;
 Fri, 24 Apr 2020 13:11:15 +0000 (UTC)
Subject: Re: [PATCH v17 2/2] xen/tools: VM forking toolstack side
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
 <e416eac0c986fd1aba5f576d9b065a6f47660b2c.1587655725.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d705ad2-a5a1-8124-b43a-421143728669@suse.com>
Date: Fri, 24 Apr 2020 15:11:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e416eac0c986fd1aba5f576d9b065a6f47660b2c.1587655725.git.tamas.lengyel@intel.com>
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

On 23.04.2020 17:30, Tamas K Lengyel wrote:
> Add necessary bits to implement "xl fork-vm" commands. The command allows the
> user to specify how to launch the device model allowing for a late-launch model
> in which the user can execute the fork without the device model and decide to
> only later launch it.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

As before this will be left for the tool stack maintainers to
ack and commit.

Jan

