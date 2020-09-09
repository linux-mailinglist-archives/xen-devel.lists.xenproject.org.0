Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A6263153
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 18:07:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG2cx-00048M-3f; Wed, 09 Sep 2020 16:07:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y3mV=CS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kG2cv-00047c-3Y
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 16:07:17 +0000
X-Inumbo-ID: 6f6ebdb6-dffd-44d8-8b25-38b1de13f4c1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f6ebdb6-dffd-44d8-8b25-38b1de13f4c1;
 Wed, 09 Sep 2020 16:07:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 362EEB01E;
 Wed,  9 Sep 2020 16:07:31 +0000 (UTC)
Subject: Ping: [PATCH v3] x86/HVM: more consistently set I/O completion
To: 'Jun Nakajima' <jun.nakajima@intel.com>,
 'Kevin Tian' <kevin.tian@intel.com>
Cc: paul@xen.org, xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>
References: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
 <003301d682d6$d4b5ba20$7e212e60$@xen.org>
 <7efe7de4-bde4-a769-5817-b64b0e757a3f@suse.com>
 <003c01d684fd$6a187b70$3e497250$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bdf4b197-3292-4b93-6dcb-16226e42ea76@suse.com>
Date: Wed, 9 Sep 2020 18:07:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <003c01d684fd$6a187b70$3e497250$@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 11:58, Paul Durrant wrote:
> With the comment addition...
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

With Paul's R-b I'm intending to time out waiting for a VMX
maintainer ack early next week.

Jan

