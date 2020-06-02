Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1235C1EBBA0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:26:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg5zs-0007Ru-ER; Tue, 02 Jun 2020 12:26:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTPG=7P=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jg5zq-0007Rp-Cs
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:26:22 +0000
X-Inumbo-ID: 43e99fd0-a4cc-11ea-abe9-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43e99fd0-a4cc-11ea-abe9-12813bfff9fa;
 Tue, 02 Jun 2020 12:26:21 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 38/cUJF2n0GRfQ+3xT75snHQEgyfJAy0Rp8BwX8JHd0piM+97kIXtswsoOlVLZBfHEvj9onD+c
 DbucfAn17gJJ5pR1kk3RWpWuOdel3ejeb4JJRPf6CBviHaId7w6PMzUTP6ptbrC1RHnNJtfo9h
 HZo2lSIJqiV8PmX+OowjsAJLOq3xJl6SJyV2YjVcH7+q9TgMTXNsNCduLkR9zRQOOVAD6+GT4p
 1Hhe7JH4oGMMYpRIdcxvciTwiZxVoPhNSWQ2OYGh+VnOB4WP1pbT9ybdP189JUp1VFbxwivLP2
 v/8=
X-SBRS: 2.7
X-MesageID: 19009501
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,464,1583211600"; d="scan'208";a="19009501"
Date: Tue, 2 Jun 2020 13:26:14 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack
 support
Message-ID: <20200602122614.GN2105@perard.uk.xensource.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-4-andrew.cooper3@citrix.com>
 <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
 <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
 <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
 <f6ec0a0e-c7d0-22b5-b633-458a7fe2375f@citrix.com>
 <b3f62c64-9845-22b9-6855-91a3ecde421c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b3f62c64-9845-22b9-6855-91a3ecde421c@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Roger
 Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 02:06:11PM +0200, Jan Beulich wrote:
> I don't recall; perhaps I was in another parallel session? If it's
> the one with notes at
> https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg00786.html
> then a remark close to the top suggests I was there, but there's no
> sign of this aspect having got discussed. There is, among the issues
> listed, "Xen build re-evaluates compiler support for every translation
> unit", but that's only remotely related.

What is a "translation unit"? What would that have to do with Kconfig?

Thanks,

-- 
Anthony PERARD

