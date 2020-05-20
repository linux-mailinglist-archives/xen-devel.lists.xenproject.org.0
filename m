Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84CF1DAFF5
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 12:21:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbLqA-0002Zg-7J; Wed, 20 May 2020 10:20:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AW6E=7C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jbLq9-0002Zb-1j
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 10:20:45 +0000
X-Inumbo-ID: 9037e76e-9a83-11ea-b07b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9037e76e-9a83-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 10:20:44 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Y4wQz6edF6UM0teSuTD5OyGrhtAOEpz14EK6fx5zCHKyQPc4kiUvJ2KOSNipNdLnnvbuIjrEFx
 IQh6qCgjbOsQaD6HJUdnto7z5H1A2AaYjBXm0VC6AKzaLDRoNpESKHoxMOIgXV1gi9Dc8/7B8v
 cF5Tv+YVImQhjO51/eQ4l2pPIsPFiGqKF1rDc/3Nol4yaNYCaSnURs5O0SgPfTnXnVkwIFcSs1
 W7Rgm+AnRY3i5nIsf6gC/UoANPDG54jCA8Da3ff4BNCyhPcZ22GWiVCOXYOfbAV8cPHInBYtM7
 pAU=
X-SBRS: 2.7
X-MesageID: 18230849
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,413,1583211600"; d="scan'208";a="18230849"
Date: Wed, 20 May 2020 12:20:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/3] x86: relax GDT check in arch_set_info_guest()
Message-ID: <20200520093656.GJ54375@Air-de-Roger>
References: <cbed3c45-3685-4bce-9719-93b1e8a2599a@suse.com>
 <acbaead9-0f6c-3606-e809-57dafe9b3f01@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acbaead9-0f6c-3606-e809-57dafe9b3f01@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 09:53:50AM +0200, Jan Beulich wrote:
> It is wrong for us to check frames beyond the guest specified limit
> (in the compat case another loop bound is already correct).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

