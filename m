Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDv6EjTejWnE8AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:05:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E712E1B7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229033.1535073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXJI-0002wB-EC; Thu, 12 Feb 2026 14:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229033.1535073; Thu, 12 Feb 2026 14:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXJI-0002to-Ac; Thu, 12 Feb 2026 14:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1229033;
 Thu, 12 Feb 2026 14:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ry7C=AQ=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1vqXJG-0002sv-DN
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:04:46 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c70d5595-081b-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:04:43 +0100 (CET)
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 06:04:40 -0800
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123)
 ([10.211.93.152])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2026 06:04:37 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vqXJ4-000000001Kr-2rHR;
 Thu, 12 Feb 2026 14:04:34 +0000
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
X-Inumbo-ID: c70d5595-081b-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770905084; x=1802441084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hC83cy9I+QvOHq44fYtXM6qMN9P2fhKYqhqqNyaPhiw=;
  b=Lie3jEI5jY4FJqeqtEdunHEoQc+iZq2K5A7IN6gDD/n8sg2XSjOs/4Px
   oI1Li9P1cRaNV7cgiQeaq8YWE+I4k7LS6iMdas4DmjTFF+wmVa+9C8KDU
   A/7Uj6rPDK6U2Wvx6rNOY5hzqHaD8rhsAyVcJ3bjKCX0ZgTlx5UnjkONy
   40Wqs0TWYoDRj7f89sWlPcRJpEexp0g/63oo7g+/QgxujDqOEmAOC2w8X
   LTLX1iQGg4m4I5fw1hqC/w4xx3YZ7yDXH4W1oREdiDCVLoPzRDIgS8gPv
   2ED05nmk5r2z8uvwd7pIBkz2rff0A/jZtB2aKT04tb/In5ixdQCCenoHY
   w==;
X-CSE-ConnectionGUID: hjFT8ebsSdyv09SIaZiwHQ==
X-CSE-MsgGUID: K/ALXR6JT62AoEObuW8rDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83443606"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="83443606"
X-CSE-ConnectionGUID: TUgDl26jTP25Gm4vGa+Q2g==
X-CSE-MsgGUID: TXT8PHAFRqu/SXTEK+WepQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="216763664"
Date: Thu, 12 Feb 2026 15:04:02 +0100
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	xen-devel@lists.xenproject.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] xenbus: add xenbus_device parameter to
 xenbus_read_driver_state()
Message-ID: <202602121525.xsMivuEv-lkp@intel.com>
References: <20260212083826.136221-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212083826.136221-2-jgross@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:helgaas@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,01.org:url,git-scm.com:url];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E67E712E1B7
X-Rspamd-Action: no action

Hi Juergen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xen-tip/linux-next]
[also build test WARNING on linus/master v6.19 next-20260211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/xenbus-add-xenbus_device-parameter-to-xenbus_read_driver_state/20260212-164134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20260212083826.136221-2-jgross%40suse.com
patch subject: [PATCH 1/2] xenbus: add xenbus_device parameter to xenbus_read_driver_state()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260212/202602121525.xsMivuEv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121525.xsMivuEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121525.xsMivuEv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/xen/xenbus/xenbus_client.c:940 function parameter 'dev' not described in 'xenbus_read_driver_state'
>> Warning: drivers/xen/xenbus/xenbus_client.c:940 function parameter 'dev' not described in 'xenbus_read_driver_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

