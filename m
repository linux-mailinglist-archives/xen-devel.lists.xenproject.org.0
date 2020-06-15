Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7BF1F9B22
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:58:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqYb-0004jL-Qm; Mon, 15 Jun 2020 14:57:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqYa-0004jC-L6
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:57:52 +0000
X-Inumbo-ID: 92ebf118-af18-11ea-b807-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92ebf118-af18-11ea-b807-12813bfff9fa;
 Mon, 15 Jun 2020 14:57:47 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WvcSRmTTjTOvfKROtlgMP+AM2tivDfiioW0lo4OJ4pGLaWBxN7RR0ylykaGAdfGw/72/rCFUiq
 vfXM/yv371Qo1G34PkIH1nHZ1YJYwH1PPs24nACg1HGClGIAeLPUZr+O+YBPdgaihSteAi7+i9
 vpOJCpOS7QSYITeljK8DPTRN062IMXTUSNG+YMouE73zCVNhzbxVa+69/4FzB4P8SPPNXtNUnB
 EUOL1uD+qeUGVhgOB+MN1FMFgMo70eFrN2FJ6q5CoFLiuUEpJThmsabqAh4p9p9LSO/Z9Zj1mC
 UIA=
X-SBRS: 2.7
X-MesageID: 20369882
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20369882"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.35941.840393.542543@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:57:41 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] tools/libxengnttab: correct size of allocated memory
In-Reply-To: <c420759a-9fab-1542-ef6b-bff558a6dd05@citrix.com>
References: <20200520083501.31704-1-jgross@suse.com>
 <24261.17303.413916.29534@mariner.uk.xensource.com>
 <20200520155621.GN54375@Air-de-Roger>
 <05eac1e1-63a3-1d03-9f91-d0ffdcc44f23@suse.com>
 <00f701d64009$c2c10000$48430000$@xen.org>
 <24295.32909.686801.47956@mariner.uk.xensource.com>
 <c420759a-9fab-1542-ef6b-bff558a6dd05@citrix.com>
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
Cc: =?iso-8859-1?Q?'J=FCrgen_Gro=DF'?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, 'Wei Liu' <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH] tools/libxengnttab: correct size of allocated memory"):
> I already committed it, seeing as it was fully acked.
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=aad20e538d7ba0e36f5ed8d2bebb74096e3a6d7f

That must be why it didn't apply :-).

Thanks,
Ian.

