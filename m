Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904E41E7E90
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:22:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeexj-00007E-7F; Fri, 29 May 2020 13:22:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jeexh-000079-Pv
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:22:13 +0000
X-Inumbo-ID: 67feb1fa-a1af-11ea-a8b6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67feb1fa-a1af-11ea-a8b6-12813bfff9fa;
 Fri, 29 May 2020 13:22:12 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GU7uOkr3EuzE612T1vejUKRWuo3H9021yEIyWHQ8qIkvsDCxl0YXuPIDLl+iycTskPPRM8vhw4
 PU47+ywWgYgh3D2aFanOHLqK+H/U/WkMDIactjIt+Dws7+b+gfiXXVmTnWINQ13Za7K5e5bH6l
 2sNqx7kbYP1K9Xx/wb2N2EY8TNpVYAT2feCJEMro+/aMk7iGJ0u8r04ReOkDU2KFNGQwyZLC90
 lmdNxqSZzxylpK3YwsSy6MXagzozGGEmRzSgCtEci7rMgTa8L8JrzOeGt2ZRNgBk7wd+LebSam
 0U0=
X-SBRS: 2.7
X-MesageID: 19108972
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,448,1583211600"; d="scan'208";a="19108972"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24273.3201.443254.296963@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 14:22:09 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)
In-Reply-To: <005401d635ac$90bf9510$b23ebf30$@xen.org>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
 <005401d635ac$90bf9510$b23ebf30$@xen.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)"):
> I assume we can revert if things go badly wrong and being able to commission more machines would seem to be quite beneficial at this
> stage.

Thanks for your opinion.

It would be possible to revert the final switch, yes.  Most of the
other changes are supposed to work with stretch too.

I haven't done a test run with the new code, but the old version of
Debian.  I will do that.  That will give confidence that we could, in
fact, revert things.

Ian.

