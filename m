Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A3226CDF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 19:09:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxZHf-0004l8-1t; Mon, 20 Jul 2020 17:08:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxZHd-0004l3-Hf
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 17:08:57 +0000
X-Inumbo-ID: b1c86eb4-caab-11ea-84aa-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1c86eb4-caab-11ea-84aa-bc764e2007e4;
 Mon, 20 Jul 2020 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595264937;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Z3qFN0lLsStvYXDINuO1I0grHoWYEzgxBmOYzHIzosM=;
 b=V09sHkTPOEAGadz5I22Mp6/1DslVUoSodApPq4RUn4cdTJK+JYri/4m5
 Vqle/P1Bfo+7lcWkK8dCHTnalqmHqlg/X2voEmVNWcbrWu2UaFFSx+res
 DCPh4/IZ+4awuoH4MV7Z54o5hoRC8/M3PQjHIFUHesZCokCZtpm9m8IV4 Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Bk28VWkLRWalT2SnJf5/zCvJK5Srvu4pCjMM+yf/qCXopsamlJqyxXXFSdAeTNxqVpVjjzEFe3
 AuRtSF3dZOKBG5aDwlQ5aKAH+ed5pBGvmcEAOa35PSzMD6jsIS1xv0t5KI++xy9h4ahYkkpgPB
 ndN+ZPgpid9AUwUCqdgt/bR23x8XTWnOA0O+C8s0KpGCsoeXJ3S74bIbCseqXta+KVmVKrw+q3
 t+sf2joEULODHCBUU/DuWUGW9tTryQPzWLnCWh06uwiPmpPywKnZi48MRbAZYXUeNfbhvGa4PM
 YLg=
X-SBRS: 2.7
X-MesageID: 22776539
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,375,1589256000"; d="scan'208";a="22776539"
Subject: Re: [PATCH] docs: Replace non-UTF-8 character in hypfs-paths.pandoc
To: <paul@xen.org>, 'Xen-devel' <xen-devel@lists.xenproject.org>
References: <20200720165833.14209-1-andrew.cooper3@citrix.com>
 <003101d65eb8$32dc7370$98955a50$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <22659eaa-78b4-dc41-d607-e09b75efc97f@citrix.com>
Date: Mon, 20 Jul 2020 18:08:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <003101d65eb8$32dc7370$98955a50$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: 'Juergen Gross' <jgross@suse.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/07/2020 18:07, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Andrew Cooper
>> Sent: 20 July 2020 17:59
>> To: Xen-devel <xen-devel@lists.xenproject.org>
>> Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
>> <julien@xen.org>; Wei Liu <wl@xen.org>; George Dunlap <George.Dunlap@eu.citrix.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Jan Beulich <JBeulich@suse.com>; Ian Jackson <ian.jackson@citrix.com>
>> Subject: [PATCH] docs: Replace non-UTF-8 character in hypfs-paths.pandoc
>>
>> From the docs cronjob on xenbits:
>>
>>   /usr/bin/pandoc --number-sections --toc --standalone misc/hypfs-paths.pandoc --output
>> html/misc/hypfs-paths.html
>>   pandoc: Cannot decode byte '\x92': Data.Text.Internal.Encoding.decodeUtf8: Invalid UTF-8 stream
>>   make: *** [Makefile:236: html/misc/hypfs-paths.html] Error 1
>>
>> Fixes: 5a4a411bde4 ("docs: specify stability of hypfs path documentation")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-acked-by: Paul Durrant <paul@xen.org>
>
> ...and please commit to staging-4.14 a.s.a.p.

Thanks, and done.

~Andrew

