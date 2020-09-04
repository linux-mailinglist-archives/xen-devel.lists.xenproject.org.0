Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC225D4BE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 11:26:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE7yi-00035P-B5; Fri, 04 Sep 2020 09:25:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE7yg-00035K-Kg
 for xen-devel@lists.xen.org; Fri, 04 Sep 2020 09:25:50 +0000
X-Inumbo-ID: ecff1716-fa9b-4a5d-8009-c2c617ea38ad
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecff1716-fa9b-4a5d-8009-c2c617ea38ad;
 Fri, 04 Sep 2020 09:25:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E391BB68E;
 Fri,  4 Sep 2020 09:25:49 +0000 (UTC)
Subject: Re: [PATCH v4 0/2] xsm: hide detailed Xen version
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Doug Goldstein <cardoe@cardoe.com>
References: <20200211134220.9194-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b91dbfa4-800d-7c00-4adf-5855e3bba8af@suse.com>
Date: Fri, 4 Sep 2020 11:25:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200211134220.9194-1-sergey.dyasli@citrix.com>
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

On 11.02.2020 14:42, Sergey Dyasli wrote:
> Now a proper 2 patches series.
> 
> Sergey Dyasli (2):
>   xsm: add Kconfig option for denied string
>   xsm: hide detailed Xen version from unprivileged guests

As we don't look to be coming to an agreement how to deal with the
situation, I'm going to drop this from my pending patches folder.

Jan

