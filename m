Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6461E23C2
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 16:13:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdaKD-0006ku-DT; Tue, 26 May 2020 14:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5j=7I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jdaKB-0006kj-KB
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 14:12:59 +0000
X-Inumbo-ID: 001dba00-9f5b-11ea-81bc-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 001dba00-9f5b-11ea-81bc-bc764e2007e4;
 Tue, 26 May 2020 14:12:58 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8jVSF0r7W1MiM9ewOW0jKrkPRHAUpf/tywmL5jk+QXdniHMqcQlwCb4dVWZYU3KnHr/5gv9A70
 knEpGMrWJHBBM1axt6n8CUPv+34EGrQfAsqej/PHt66MPKIaeuG3zjYl2khoT0KRiTEHCm1b1y
 oVnKCDB3w1NmjyKKp9pdb3ranjsWwMNx6z19df9tAbAqL+D9Xolo8YiP1dFWjUiLhvm4JE8eie
 dtQMh+LeZQK9ssEBmQUvK9HC6IFFWat19bfFd3ZiKOQk5m9cu5SzDGi1vp+QAtfJLq2mS5TyPw
 kxQ=
X-SBRS: None
X-MesageID: 18465246
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24269.8336.90027.993820@mariner.uk.xensource.com>
Date: Tue, 26 May 2020 14:58:40 +0100
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 4/5] golang/xenlight: Use XEN_PKG_DIR variable rather than
 open-coding
In-Reply-To: <20200522161240.3748320-5-george.dunlap@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-5-george.dunlap@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("[PATCH 4/5] golang/xenlight: Use XEN_PKG_DIR variable rather than open-coding"):
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

