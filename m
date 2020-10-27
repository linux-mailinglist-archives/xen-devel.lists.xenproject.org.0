Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C329AA23
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 11:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12779.33104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMfa-0002f4-IX; Tue, 27 Oct 2020 10:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12779.33104; Tue, 27 Oct 2020 10:57:38 +0000
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
	id 1kXMfa-0002ei-FK; Tue, 27 Oct 2020 10:57:38 +0000
Received: by outflank-mailman (input) for mailman id 12779;
 Tue, 27 Oct 2020 10:57:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kXMfY-0002eZ-GM
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:57:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad703685-fd15-43d8-98a1-faeea2ccb4bf;
 Tue, 27 Oct 2020 10:57:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kXMfY-0002eZ-GM
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:57:36 +0000
X-Inumbo-ID: ad703685-fd15-43d8-98a1-faeea2ccb4bf
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ad703685-fd15-43d8-98a1-faeea2ccb4bf;
	Tue, 27 Oct 2020 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603796255;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=FlhFwdK4CvQ766qK2/X/WXSTzHrQlYTWB1SqfcIzsFA=;
  b=PBSgF0e9GTS0yFBEMiOw2/iVZ/DtLvKg6QgLM9uC89fZPTE7YYRBAZuC
   Fl8PJ9Xz5oRrlQT2g5pzvl2bgAN5Nh4DtqsDphCZ4cI0tcytN2xWCKLm5
   1ModNbiKfsFwjQ9LfsPbsRdi/VhmsGJHGDSudJLFSRKAvbZWRijb3Sdmy
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fqykTXJDfFdy1dgPWqYRxY0BAob9QP7nut7E7cT8mH7f48OlczC+2StQMxe2igiBbU1WA5eoeY
 NwGJsN9Le30nhhcMdKjj6BnR4P5nD+DAljg6INpKpImDPX/f8skfhlT1MVUwejY88JT1TE2fWd
 k8EUuhAOlXEmOpx4OaS+ZR/UaCs3/UL72F5x79ZRfg4O1kUR03nQihmi0nZ6f5YwEVq50OsDxt
 mlF6CsvFXOofQD6Dq0qn/YPZLkCR/6KMxe3oVsSdYowTNUtErpIjblNNHbqcC+uIp25uUNyqtf
 qYQ=
X-SBRS: None
X-MesageID: 29858074
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,423,1596513600"; 
   d="scan'208";a="29858074"
Subject: Re: [PATCH v1] libacpi: use temporary files for generated files
To: Jan Beulich <jbeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20201026204151.23459-1-olaf@aepfle.de>
 <68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
 <20201027112703.24d55a50.olaf@aepfle.de>
 <bc7a5e73-af27-45ae-5d82-f53176cd43a9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <24025dd2-2c61-7e92-a9b1-2433eea2e909@citrix.com>
Date: Tue, 27 Oct 2020 10:57:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bc7a5e73-af27-45ae-5d82-f53176cd43a9@suse.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 27/10/2020 10:37, Jan Beulich wrote:
> On 27.10.2020 11:27, Olaf Hering wrote:
>> Am Tue, 27 Oct 2020 11:16:04 +0100
>> schrieb Jan Beulich <jbeulich@suse.com>:
>>
>>> This pattern is used when a rule consists of multiple commands
>>> having their output appended to one another's.
>> My understanding is: a rule is satisfied as soon as the file exists.
> No - once make has found that a rule's commands need running, it'll
> run the full set and only check again afterwards.

It stops at the first command which fails.

Olaf is correct, but the problem here is an incremental build issue, not
a parallel build issue.

Intermediate files must not use the name of the target, or a failure and
re-build will use the (bogus) intermediate state rather than rebuilding it.

~Andrew

