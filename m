Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8660A28E2F1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 17:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6770.17818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSiWh-0005H5-QZ; Wed, 14 Oct 2020 15:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6770.17818; Wed, 14 Oct 2020 15:17:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSiWh-0005Gh-NP; Wed, 14 Oct 2020 15:17:15 +0000
Received: by outflank-mailman (input) for mailman id 6770;
 Wed, 14 Oct 2020 15:17:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSiWg-0005Gc-7z
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:17:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7c8503d-004f-41df-892f-e53aba22975d;
 Wed, 14 Oct 2020 15:17:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSiWg-0005Gc-7z
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:17:14 +0000
X-Inumbo-ID: c7c8503d-004f-41df-892f-e53aba22975d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c7c8503d-004f-41df-892f-e53aba22975d;
	Wed, 14 Oct 2020 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602688633;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+zIBdoz6/W3MUf9wXb+tdhuqXgcLxsY9r6vf27xeiyk=;
  b=Zw++YPLalL/f57kSqt1CoLf74mVTlqN9JZPHVwWQ+VpuuX4fv1airYYT
   tTw2fotaxw7bX+3J153Zo18Tx98rLuLms7/ru4xCL2NMS/CSiitnSaRM+
   SYst4du94XoVzvQD6SMyl+EZKB1bFWae3d7+bUAslQcCbdJGJVg+Nghhw
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AtWA3j4qrb9cVSDLQ8QWzXRJfgLfdk5igd1UbKij4I4kM27skkNSrUAYGYaOyRpmN715efrumw
 GNKEQIrK8xqA/8bPe8DaS5rfffx/1wTy4EqwaHQMGq8IqLj89cQXQFC00bcdKQ+44RNbqS7m9M
 cvjdk77lG/3jqVhhkopN/axrirYGybz2gJqgO4GeWKuVokgTnUh8xlP3EW4BRbxh2R+uMxyRWg
 3fjdIfU5rXVvFg0cwRcVt9nr6/YPZ9sglVHh3ksLIRo1x75HHdhYSrXNYDH6Cl6FIkgOVwxdyD
 ot0=
X-SBRS: 2.5
X-MesageID: 29248410
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,375,1596513600"; 
   d="scan'208";a="29248410"
Subject: Re: [PATCH v2] x86/pv: Inject #UD for missing SYSCALL callbacks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Andy Lutomirski <luto@kernel.org>,
	Manuel Bouyer <bouyer@antioche.eu.org>
References: <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <20201009115301.19516-1-andrew.cooper3@citrix.com>
 <20201014141620.GS19254@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <416f9d8d-532a-6b72-1e06-a325f0edaaab@citrix.com>
Date: Wed, 14 Oct 2020 16:17:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014141620.GS19254@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 14/10/2020 15:16, Roger Pau Monné wrote:
>> This change does constitute a change in the PV ABI, for corner cases of a PV
>> guest kernel registering neither callback, or not registering the 32bit
>> callback when running on AMD/Hygon hardware.
> Is there any place suitable to document this behavior?

In the short term, my XTF test which will eventually get into CI.

Longer term, my theoretical future where I've described some of this
stuff in docs/guest-guide/

~Andrew

