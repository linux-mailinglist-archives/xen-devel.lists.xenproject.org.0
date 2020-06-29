Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6620CE90
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 14:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jptFX-0003Og-AV; Mon, 29 Jun 2020 12:51:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R5re=AK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jptFW-0003Ob-Mj
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 12:51:02 +0000
X-Inumbo-ID: 2f0ab37e-ba07-11ea-8561-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f0ab37e-ba07-11ea-8561-12813bfff9fa;
 Mon, 29 Jun 2020 12:51:01 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hOggAfmDbsi8FS5GTKvxaQStBB3UF3WLpR+RR8dT2pNl0yMIUbmW/qF2LyEKc1sRs3+apTmFNV
 YGQ8CeMXbKEToL5JksFACqJLkXELXK4UMeTZ2SGfMi2DsMvYxR8m/gcpa+g6nbBNZr4a/x4km1
 4znaw2+gQlXFYzBuZNlFNsjI7w3ZPF90n1kcaBCVBTzZPbSq3Dw7UOELbg1IhadfaANBkvr2Wq
 3PLGd45SrBc7UsjqxUuDBK8BmaZD7ypafvmoqf+4G3h76AZ3WGvGI66tZlIM2SCKB3uOkjCdSQ
 w8g=
X-SBRS: 2.7
X-MesageID: 21477854
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,294,1589256000"; d="scan'208";a="21477854"
Subject: Re: [PATCH] xsm: Drop trailing whitespace from build scripts
To: <paul@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
References: <20200626170221.28534-1-andrew.cooper3@citrix.com>
 <9822c557-655b-67cb-c513-60039dbe0d8d@suse.com>
 <000601d64dee$e47b2840$ad7178c0$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <257c6ec8-8f0f-c765-d876-803b90832b01@citrix.com>
Date: Mon, 29 Jun 2020 13:50:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <000601d64dee$e47b2840$ad7178c0$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: 'Xen-devel' <xen-devel@lists.xenproject.org>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/06/2020 09:25, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>> Sent: 29 June 2020 09:22
>> To: Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: Xen-devel <xen-devel@lists.xenproject.org>; Daniel De Graaf <dgdegra@tycho.nsa.gov>
>> Subject: Re: [PATCH] xsm: Drop trailing whitespace from build scripts
>>
>> On 26.06.2020 19:02, Andrew Cooper wrote:
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
>> Since we've not heard anything from Daniel in quite a while, just
>> in case:
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
> This is pretty trivial cleanup so, if you want to put it in 4.14 consider it...
>
> Release-acked-by: Paul Durrant <paul@xen.org>

Ok.  In it goes.

~Andrew

