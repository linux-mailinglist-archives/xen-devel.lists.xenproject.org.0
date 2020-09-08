Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4062613CD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:51:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfu5-0005Ox-Bu; Tue, 08 Sep 2020 15:51:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFfu3-0005Oq-CS
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:51:27 +0000
X-Inumbo-ID: 5689fa2e-aa5c-4853-b4b2-51f7edde68da
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5689fa2e-aa5c-4853-b4b2-51f7edde68da;
 Tue, 08 Sep 2020 15:51:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 924C0B1C9;
 Tue,  8 Sep 2020 15:51:26 +0000 (UTC)
Subject: Re: [PATCH v4 1/5] x86/svm: handle BU_CFG and BU_CFG2 with cases
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200907103143.58845-1-roger.pau@citrix.com>
 <20200907103143.58845-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8bcaebf-e9aa-5891-f12c-5b8b064f6403@suse.com>
Date: Tue, 8 Sep 2020 17:51:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907103143.58845-2-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 12:31, Roger Pau Monne wrote:
> Move the special handling of reads to it's own switch case, and also
> add support for BU_CFG2. On the write side ignore writes if the MSR is
> readable, otherwise return a #GP.
> 
> This is in preparation for changing the default MSR read/write
> behavior, which will instead return #GP on not explicitly handled
> cases.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


