Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF820CE6E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 14:06:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpsY0-0007lA-No; Mon, 29 Jun 2020 12:06:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsT6=AK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jpsXy-0007l5-EG
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 12:06:02 +0000
X-Inumbo-ID: e5e5ebce-ba00-11ea-b7bb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5e5ebce-ba00-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 12:06:01 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rf575NL4JziItKVrn0RKJZthvbssvZoBKB7Q5ALaCkfRShDKGCFeq6Sdd9lY/IjOQ68eJ6EBCN
 zyEhj2LGifiVKNLLNRox2VRpWtdXgkBSGH+0cfYqeKdwTflEjdSv4qwLqNKAsOYn8QxjyXeat5
 dp2omnX9eCYmXEMLfhigxvJreQYuKor4I9OwbGrrHEyhK4CNP7zzOmSXcsFpooPMoO5TGVuRNB
 DObiD2D6M11RldR7/ERjpTIEsumrxLbZlwePF50x7XI8jFO6LTT8zkLATSiWT0GW9Q2SFPsfzK
 fHI=
X-SBRS: 2.7
X-MesageID: 21508118
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,294,1589256000"; d="scan'208";a="21508118"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24313.55588.61431.336617@mariner.uk.xensource.com>
Date: Mon, 29 Jun 2020 13:05:56 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] tools/configure: drop BASH configure variable
In-Reply-To: <880fcc83-875c-c030-bfac-c64477aa3254@suse.com>
References: <20200626170038.27650-1-andrew.cooper3@citrix.com>
 <880fcc83-875c-c030-bfac-c64477aa3254@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jan Beulich writes ("Re: [PATCH] tools/configure: drop BASH configure variable"):
> On 26.06.2020 19:00, Andrew Cooper wrote:
> > diff --git a/xen/xsm/flask/policy/mkaccess_vector.sh b/xen/xsm/flask/policy/mkaccess_vector.sh
> > old mode 100644
> > new mode 100755
> > diff --git a/xen/xsm/flask/policy/mkflask.sh b/xen/xsm/flask/policy/mkflask.sh
> > old mode 100644
> > new mode 100755
> 
> ... this may or may not take effect on the file system the sources
> are stored on.

In what circumstances might this not take effect ?

IME all changes to files are properly replicated by git.  Tarball
distributions replicate the permissions of course.

The only difficulty would be if this change were to be carried as a
patch somewhere, by a downstream, but that seems unlikely, and can be
avoided by that downstream not taking this patch.

Ian.

