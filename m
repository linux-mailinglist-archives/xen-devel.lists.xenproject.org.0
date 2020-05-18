Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D881F1D7E86
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 18:30:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaidh-0001ND-H5; Mon, 18 May 2020 16:29:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jaidg-0001N6-K0
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 16:29:16 +0000
X-Inumbo-ID: b68ee12b-9924-11ea-a87c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b68ee12b-9924-11ea-a87c-12813bfff9fa;
 Mon, 18 May 2020 16:29:15 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LuhgWmARxEc/NkntMIXnQ/hdaom8NfEq/HXWacJe7S/Qa7mNfb5tP42aQyruA8/YBmhH9BfnYx
 h3qq805/aXyO6gXhM5VXR5QF132n+2NN6TQCLwonWAhaFaDigUUM1ffIYbROqF0cSbCQFDhaqo
 TLEB746apsYBdcAUKt6Q9aPsriTJ1gJdgeigtDMxg5czVpSZpG3CVJ00FR4SVnaB9YfrdWLr/E
 JxtLhUejOLCfShKT8DHUC977bIs+lfRTFVqIRDCy2inJNy94s48Zuek9lWczXQtJWSYE9EXmmv
 G0Q=
X-SBRS: 2.7
X-MesageID: 18510447
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18510447"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24258.47057.611121.946520@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 17:29:05 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v6 09/18] libxl: add save/restore support for qemu-xen in
 stubdomain
In-Reply-To: <CAKf6xpt-wBML1kFPOddaM8J8KbqSveN=Z0esvRN-O4UzidrTQg@mail.gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
 <20200518011353.326287-10-jandryuk@gmail.com>
 <24258.39586.245004.804616@mariner.uk.xensource.com>
 <CAKf6xpt-wBML1kFPOddaM8J8KbqSveN=Z0esvRN-O4UzidrTQg@mail.gmail.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("Re: [PATCH v6 09/18] libxl: add save/restore support for qemu-xen in stubdomain"):
> On Mon, May 18, 2020 at 10:24 AM Ian Jackson <ian.jackson@citrix.com> wrote:
> > Provided that you update the docs commit and take my ack off that,
> > please add my ack to this code :-).
> 
> I updated "[PATCH v6 02/18] Document ioemu Linux stubdomain protocol"
> to mention $STUBDOM_RESTORE_INCOMING_ARG as well as the xenstore
> directory change to "dm-argv" in this v6, but I left your Ack on it.
> Sorry about that.  I'll remove your Ack from 02/18 when I post v7,
> but I'll add the Ack to this 09/18.

Oh, that's why I didn't see that docs change.  I went to look what you
wrote in v6 02/18.  It LGTM.  Please put my ack back :-).

Thanks,
Ian.

