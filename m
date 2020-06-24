Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC722072C8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:05:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo49M-0004gb-Md; Wed, 24 Jun 2020 12:05:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ja3c=AF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jo49L-0004gU-HG
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:05:07 +0000
X-Inumbo-ID: f14f7a13-b612-11ea-80a4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f14f7a13-b612-11ea-80a4-12813bfff9fa;
 Wed, 24 Jun 2020 12:05:06 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YSAQ+V6Rmln6w4lLe3tMLNONSDP0o0jCzGk+ZbVjrT2K3UTGt9nduQD7kfx35Q+i/fR1Fcf/DF
 kUrAFDRgmECQeKgWjGlMAz81z0awijQYvKLG7xZrfgCrl72SLbaehsviJkmIKMFRtPpN6acmZB
 5YPYdEce3B2oICaLl7HCttn6D/CR19RzsPndNKJLOdaGt3MaTF71/d0m4XpBidWekiXwYF1btu
 4qC8wS8KRBLtlS/iHWtdhGoNY+Vban5Alu8hhRW4ULOifgaIgb6AGZ2l8d96keZw8agN/QH2/k
 D+0=
X-SBRS: 2.7
X-MesageID: 21611800
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,275,1589256000"; d="scan'208";a="21611800"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24307.16749.664567.685628@mariner.uk.xensource.com>
Date: Wed, 24 Jun 2020 13:05:01 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [INPUT REQUESTED][PATCH v3 for-4.14] pvcalls: Document correctly
 and explicitely the padding for all arches
In-Reply-To: <691258d9-a0e7-ab72-74a3-5c5f6026a7e9@xen.org>
References: <20200613184132.11880-1-julien@xen.org>
 <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
 <35c8373f-b691-d95e-17de-021c72faf216@xen.org>
 <alpine.DEB.2.21.2006161322210.24982@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2cnMUiYBz+hA2_hjf5ShVh66tUwE9kbjqSM-H0TkTbyw@mail.gmail.com>
 <alpine.DEB.2.21.2006171146510.14005@sstabellini-ThinkPad-T480s>
 <cefe0cc7-5b1c-4ae2-a160-3857cc131a3d@xen.org>
 <691258d9-a0e7-ab72-74a3-5c5f6026a7e9@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, George Dunlap <George.Dunlap@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [INPUT REQUESTED][PATCH v3 for-4.14] pvcalls: Document correctly and explicitely the padding for all arches"):
> Gentle ping. It would be good to get this resolved for Xen 4.14.

Oh and I agree that this should be changed for 4.14.

Ian.

