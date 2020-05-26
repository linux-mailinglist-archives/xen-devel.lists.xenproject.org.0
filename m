Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC11E23BD
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 16:12:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdaIA-0006aO-Pj; Tue, 26 May 2020 14:10:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5j=7I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jdaI9-0006aJ-Jy
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 14:10:53 +0000
X-Inumbo-ID: b50a87c8-9f5a-11ea-a64b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b50a87c8-9f5a-11ea-a64b-12813bfff9fa;
 Tue, 26 May 2020 14:10:52 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vZMTF4Qyd0Rdcer/lXpd7GdNRTFjtilJq0YVovdZlfHGcquLi6ofAcRq/r5mDmfKbN+q3Xi3Q7
 hdiHs8NDjlQEJRhrWjX9Mwku2E+b+SejYrRTru9+86upOTQBRXSl7SC8TFVjEej/CGmdZHgZbF
 HPcgkD7eTUZvPJnONXtvAZozf51IOFCCQbVKT0XboXcitNSxkxcVZUMp7m1IhSYm74rAP61lqE
 Y7vPm+qw4d5kfC/gPdcWC8+HGQ11Ml/WaeQR/fcL0MwGeDDhhKJg8eXXKy7owgPJD5y6SZZ0gK
 0hs=
X-SBRS: None
X-MesageID: 18441054
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24269.8059.28506.353748@mariner.uk.xensource.com>
Date: Tue, 26 May 2020 14:54:03 +0100
To: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 5/5] gitignore: Ignore golang package directory
In-Reply-To: <20200522161240.3748320-6-george.dunlap@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-6-george.dunlap@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Nick
 Rosbrook <rosbrookn@ainfosec.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("[PATCH 5/5] gitignore: Ignore golang package directory"):
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

I have to say that finding a directory src/ in gitignore is very
startling.

This directory src/ contains only output files ?

Is there not a risk that humans will try to edit it ?

Ian.

