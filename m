Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9990E454482
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 11:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226695.391824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHjs-00063V-JC; Wed, 17 Nov 2021 10:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226695.391824; Wed, 17 Nov 2021 10:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHjs-00060m-Fx; Wed, 17 Nov 2021 10:00:24 +0000
Received: by outflank-mailman (input) for mailman id 226695;
 Wed, 17 Nov 2021 10:00:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnHjq-0005zL-Vo
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 10:00:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnHji-0004DM-7T; Wed, 17 Nov 2021 10:00:14 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.21.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnHjh-0005kh-Uc; Wed, 17 Nov 2021 10:00:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=gQ5und0MGMzv92KoeFJjM2CCanA/7DoVOa+xUCMBDf4=; b=4vqujkYWKwYfDMkhhS9Ll/f78k
	MLZC+vAFS5rgb86IpKuje76iaG21qoYGor/dF0SjNnwgnbOAdmFkHEkQq6OHFth+kb9HGR0wd4fyC
	1ElZb6JCXGNMFPUJ/B05jxrNaPa7UCIQlhhdObQ5KfBBPr4yuHOZ8kuuciAUP9vZtG4E=;
Message-ID: <7354e1bf-f34e-c604-b126-fdbfd53afe62@xen.org>
Date: Wed, 17 Nov 2021 10:00:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Dario Faggioli
 <dfaggioli@suse.com>, David Scott <dave@recoil.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Juergen Gross <jgross@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>,
 Quan Xu <quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Community Manager <community.manager@xenproject.org>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211117095338.14947-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 17/11/2021 09:53, Roger Pau Monne wrote:
> Document some of the relevant changes during the 4.16 release cycle,
> likely more entries are missing.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   CHANGELOG.md | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ad1a8c2bc2..8b0bdd9cf0 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
>      no longer be built per default. In order to be able to use those, configure needs to
>      be called with "--enable-qemu-traditional" as parameter.
> + - Fixes for credit2 scheduler stability in corner case conditions.
> + - Ongoing improvements in the hypervisor build system.
> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> + - 32bit PV guests only supported in shim mode.
> + - Improved PVH dom0 debug key handling.
> + - Fix booting on some Intel systems without a PIT (i8254).
> +
> +### Added
> + - 32bit Arm builds to the automated tests.
> + - New x86 pagetable APIs.
> + - Arm vPMU support.

I would add "Early" or something similar because this can only work in a 
constrained setup.

Cheers,

-- 
Julien Grall

