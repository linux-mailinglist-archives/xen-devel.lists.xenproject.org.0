Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848A221305
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:55:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkgU-00061k-Is; Wed, 15 Jul 2020 16:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pvp=A2=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jvkgS-00061R-Gs
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:55:04 +0000
X-Inumbo-ID: ecd92744-c6bb-11ea-9422-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecd92744-c6bb-11ea-9422-12813bfff9fa;
 Wed, 15 Jul 2020 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594832102;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=RxF184ngZ84smV8JN0d/jaLXpcSNUgsTt6IavUVihR0=;
 b=O/n8DfCLW84B33YzY5TIU6C5IEL1bne3ypuPtnIQaJfzCvGIFA88Ticu
 os3/KFbW91mCTgf2uA9j9axyEm+MoCexPTbCqnoUDN+PoriJO0ZbBJ7r5
 bnSPmN1sGcCsFmuMjpKHWWM5Y8dZGNeYKPDJ4UrN/aEmy8vt10iD8qwBw s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: D//hff2Xhv9zoJJFxuJV/vGaAUxVcrPadZJsfFp3kiHBsWbupTjq78KkBBxu8ilYLsu9QuXNor
 iukMqaGgsnSXqEM+xn1SQyQbej9iBGA/L3nUQGf7nt1GecaNBA6ubvz7eJJUY1eo2UnY9RgcIU
 nNTSdBdrB679HcS7K+dQOAKnXOluvvFUqLSw+4A2ITUZAj/ZQ4n+fYvjOLRFcx0aEM+9qGQliM
 eN12qqv2xRmILQTlpw4paxg5As/NnPGwq7bOx3GZv/V+dNA6hvudUqWjFXtQlPDShXTXK5OLPn
 Dic=
X-SBRS: 2.7
X-MesageID: 22652175
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22652175"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24335.13539.223285.885690@mariner.uk.xensource.com>
Date: Wed, 15 Jul 2020 17:54:59 +0100
To: "incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com"
 <incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 04/12] tools: don't call make recursively from libs.mk
In-Reply-To: <20200715162511.5941-6-ian.jackson@eu.citrix.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
 <20200715162511.5941-6-ian.jackson@eu.citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("[PATCH 04/12] tools: don't call make recursively from libs.mk"):
> From: Juergen Gross <jgross@suse.com>
> 
> During build of a xen library make is called again via libs.mk. This is
> not necessary as the same can be achieved by a simple dependency.

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

