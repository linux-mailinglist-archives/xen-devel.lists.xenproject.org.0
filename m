Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF21EFBE4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 16:53:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhDil-000449-Qa; Fri, 05 Jun 2020 14:53:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OQMZ=7S=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jhDik-000444-Nq
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 14:53:22 +0000
X-Inumbo-ID: 4cc963ac-a73c-11ea-9b55-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cc963ac-a73c-11ea-9b55-bc764e2007e4;
 Fri, 05 Jun 2020 14:53:22 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eIVApgBF8PgEw2iFJ0D2xauKhB4RMo0z18V+Ix6TYhXHvZCwmT+r4C8OSXIlEW0hWkw7TGMZCw
 EYtn8axQBI9YO0YviccxhAIKHkK3I98JSp2MsI8iz7e21NiFy65pz2Gd//BDE8dmlB0ela+djT
 5C3zvSHLb/Jhb8u75/rxnXxLbVJm61GKBIOpgllBWSGC/EWdZb+jpIDP4xMBGyZUNE1arKse8M
 TJgJaA1oXY5w+0LNMHJIPPpcY4GVFhnjO4ecF6inzCaLoepJ5cWSQE2kMqbg5x3Xy3ogNd0K/R
 hCU=
X-SBRS: 2.7
X-MesageID: 20088160
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,476,1583211600"; d="scan'208";a="20088160"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24282.23645.278335.309673@mariner.uk.xensource.com>
Date: Fri, 5 Jun 2020 15:53:17 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH for-4.14] libs/hypfs: use correct zlib name in pc file
In-Reply-To: <000901d63b30$9ae387c0$d0aa9740$@xen.org>
References: <20200605113725.30982-1-wl@xen.org>
 <034b6887-640e-a051-3821-00ef7615e010@suse.com>
 <000901d63b30$9ae387c0$d0aa9740$@xen.org>
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
 'Xen Development List' <xen-devel@lists.xenproject.org>, 'Olaf
 Hering' <olaf@aepfle.de>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH for-4.14] libs/hypfs: use correct zlib name in pc file"):
> > -----Original Message-----
> > From: Jürgen Groß <jgross@suse.com>
> > Sent: 05 June 2020 12:43
> > To: Wei Liu <wl@xen.org>; Xen Development List <xen-devel@lists.xenproject.org>
> > Cc: Olaf Hering <olaf@aepfle.de>; paul@xen.org; Ian Jackson <ian.jackson@eu.citrix.com>
> > Subject: Re: [PATCH for-4.14] libs/hypfs: use correct zlib name in pc file
> > 
> > On 05.06.20 13:37, Wei Liu wrote:
> > > Its name is "zlib" not "z".
> > >
> > > Reported-by: Olaf Hering <olaf@aepfle.de>
> > > Fixes: 86234eafb952 ("libs: add libxenhypfs")
> > > Signed-off-by: Wei Liu <wl@xen.org>
> > 
> > Reviewed-by: Juergen Gross <jgross@suse.com>
> >
> 
> Release-acked-by: Paul Durrant <paul@xen.org>

Thanks all.  Committed.

Ian.

