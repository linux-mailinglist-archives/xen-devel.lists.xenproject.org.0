Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E63234720
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:46:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VMX-0007nV-3L; Fri, 31 Jul 2020 13:46:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5j=BK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1VMV-0007nI-7Z
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:46:15 +0000
X-Inumbo-ID: 32cc8136-d334-11ea-abb4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32cc8136-d334-11ea-abb4-12813bfff9fa;
 Fri, 31 Jul 2020 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596203173;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pxLwBaKdI1Rl3eoAeiydUxHAipGDZU34ct9PFuZ7AW8=;
 b=EHOktpnPjZHgxB/BeetF7YjB7eqP8RKYeMnQeONQDIpCd/H5yXM9or3a
 jJSb1VyoJnX4Xji3AS7WxMfTWPOk+GdVocGTd3O1I4VW6vY+sktIyt9YG
 2mTo2jv77c09hXnoYvlvIOxibZdKFRYTMZcBdo0qINLMD1lE0mgIEPNlR I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qp+giJRsKHqCcTL+S4EWbw00jbbstkd2kJCwx3AI6t7t7MaB0Tubjdpo4k1u7Gu4SOep/lg5l/
 r6nl5cIsBd1hGXNXRSLnqrK06N5leGZhwthOsPzRmcmpXz0/aj1CvfWCO+sgCKsSU42YsvuN85
 cU4g4Bn+nl1okqu7spvFs3Ur79BEHewPy5w+cnuXjlQfbXvHmisUI+E0/IlEL3G4eh4ZxFgrl8
 AHS7bmCovLMp9xlf+N8sYfVnMu9XemwZFeJNOBqK1RXrvOHn5Edr4MmcAvXSK0IHn5/IyIK9zH
 KiY=
X-SBRS: 3.7
X-MesageID: 23810049
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23810049"
Subject: Re: [PATCH] tools/configure: drop BASH configure variable [and 1 more
 messages]
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
References: <20200722113258.3673-1-andrew.cooper3@citrix.com>
 <20200626170038.27650-1-andrew.cooper3@citrix.com>
 <880fcc83-875c-c030-bfac-c64477aa3254@suse.com>
 <24313.55588.61431.336617@mariner.uk.xensource.com>
 <2c202733-cbff-74e0-30c6-4cba227e7969@suse.com>
 <24356.5736.297234.341867@mariner.uk.xensource.com>
 <d963d352-d6d6-393a-9fdf-9d6f46450309@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ff465b58-3547-ac52-8d4b-9159b45da613@citrix.com>
Date: Fri, 31 Jul 2020 14:46:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d963d352-d6d6-393a-9fdf-9d6f46450309@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/07/2020 14:30, Jan Beulich wrote:
> On 31.07.2020 15:02, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [PATCH] tools/configure: drop BASH configure variable"):
>>> On 29.06.2020 14:05, Ian Jackson wrote:
>>>> Jan Beulich writes ("Re: [PATCH] tools/configure: drop BASH configure variable"):
>>>>> On 26.06.2020 19:00, Andrew Cooper wrote:
>>>>> ... this may or may not take effect on the file system the sources
>>>>> are stored on.
>>>> In what circumstances might this not take effect ?
>>> When the file system is incapable of recording execute permissions?
>>> It has been a common workaround for this in various projects that
>>> I've worked with to use $(SHELL) to account for that, so the actual
>>> permissions from the fs don't matter. (There may be mount options
>>> to make everything executable on such file systems, but people may
>>> be hesitant to use them.)
>> I don't think we support building from sources which have been
>> unpacked onto such filesystems.  Other projects which might actually
>> need to build on Windows or something do do this $(SHELL) thing or an
>> equivalent, but I don't think that's us.
> It's not unexpected that you think of Windows here, but my thoughts
> were more towards building from sources on a CD or DVD, where iirc
> execute permissions also don't exist. The latest when we have
> out-of-tree builds fully working, this ought to be something that
> people should be able to do, imo. (Even without out-of-tree builds,
> my "next best" alternative of using a tree of symlinks to build in
> would similarly have an issue with the links pointing at a mounted
> CD/DVD, if the $(SHELL) wasn't present.)

See v2.  I put $(SHELL) in, because it isn't a worthwhile use of our
time to continue arguing over this point.

~Andrew

