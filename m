Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A322109E4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 13:01:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqaUQ-0006Lq-O7; Wed, 01 Jul 2020 11:01:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDAW=AM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jqaUP-0006Ld-9s
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 11:01:17 +0000
X-Inumbo-ID: 2f045f40-bb8a-11ea-bb8b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f045f40-bb8a-11ea-bb8b-bc764e2007e4;
 Wed, 01 Jul 2020 11:01:16 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CUDjbD5JT1BLO+4XOj8GD7SIwJVKm01Z7/j6H6ADkbOtWJeZlbyap+Rww0tcwBbpgJgFTbsdDd
 zZuoc1wUrIUZmghm/zEqThVS2fhk9QB+DJqdZdzgTfIAKU3qct1jnjCG1zElodpmzxTGT8/aP0
 l7e3FYNC8iIRAVrb71vFB+FEjfOu0R50vA0BLhZ1Ja+bBa2SP8MNA9HcN/1EC++Y7oJqh60tXA
 oqfJb/Vvu90smKrYDhIho7779svaz0Z4tVK6dLybVTiLO4hlZUZ2KZKQmFonn/yAMpr69LQR2R
 f3c=
X-SBRS: 2.7
X-MesageID: 21693498
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,300,1589256000"; d="scan'208";a="21693498"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 8bit
Message-ID: <24316.27891.433815.62003@mariner.uk.xensource.com>
Date: Wed, 1 Jul 2020 12:01:07 +0100
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v3 7/7] tools/proctrace: add proctrace tool
In-Reply-To: <CABfawhmpGEE0jq=vMicqdmf2nbMs-a4Y0nxBUN=JwOeA_H-YGQ@mail.gmail.com>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
 <1786138246.11444015.1592849576272.JavaMail.zimbra@cert.pl>
 <20200626114824.mt2zsbwdbed5dtwj@liuwe-devbox-debian-v2>
 <24309.63267.596889.412833@mariner.uk.xensource.com>
 <CABfawhmpGEE0jq=vMicqdmf2nbMs-a4Y0nxBUN=JwOeA_H-YGQ@mail.gmail.com>
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
 =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, "Kang,
 Luwei" <luwei.kang@intel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tamas K Lengyel writes ("Re: [PATCH v3 7/7] tools/proctrace: add proctrace tool"):
> On Fri, Jun 26, 2020 at 7:26 AM Ian Jackson <ian.jackson@citrix.com> wrote:
> > Wei Liu writes ("Re: [PATCH v3 7/7] tools/proctrace: add proctrace tool"):
> > > On Mon, Jun 22, 2020 at 08:12:56PM +0200, Micha³ Leszczyñski wrote:
> > > > Add an demonstration tool that uses xc_vmtrace_* calls in order
> > > > to manage external IPT monitoring for DomU.
> > ...
> > > > +    if (rc) {
> > > > +        fprintf(stderr, "Failed to call xc_vmtrace_pt_disable\n");
> > > > +        return 1;
> > > > +    }
> > > > +
> > >
> > > You should close fmem and xc in the exit path.
> >
> > Thanks for reviewing this.  I agree with your comments.  But I
> > disagree with this one.
> >
> > This is in main().  When the program exits, the xc handle and memory
> > mappings will go away as the kernel tears down the process.
> >
> > Leaving out this kind of cleanup in standalone command-line programs
> > is fine, I think.  It can make the code simpler - and it avoids the
> > risk of doing it wrong, which can turn errors into crashes.
> 
> Hi Ian,
> while I agree that this particular code would not be an issue,
> consider that these tools are often taken as sample codes to be reused
> in other contexts as well. As such, I think it should include the
> close bits as well and exhibit all the "best practices" we would like
> to see anyone else building tools for Xen.

Well, you're the author if this and I think you get to decide this
question (which is one of style).  If that is your view then you Wei's
comment is certainly right, as far as it goes.

But looking at this program it seems to me that there is a great deal
of other stuff it allocates, one way or another, which it doesn't
free.

Is your intent that this program has this coding style ?

   wombat = xc_allocate_wombat();
   if (bad(wombat)) {
     print_error("wombat");
     exit(-1);
   }

   hippo = xc_allocate_hippo();
   if (bad(hippo)) {
     print_error("hippo");
     xc_free_wombat(wombat);
     exit(-1);
   }

   zebra = xc_allocate_zebra();
   if (bad(zebra)) {
     print_error("zebra");
     xc_free_wombat(wombat);
     xc_free_hippo(hippo);
     exit(-1);
   }
   ...

I think this is an unhelpful coding style.  It inevitably leads to
leaks.  IMO if you are going to try to tear down all things, you
should do it like this:

   xc_wombat *wombat = NULL:
   xc_hippo *hippo = NULL;
   xc_hippo *zebra = NULL;

   wombat = xc_allocate_wombat();
   if (bad(wombat)) {
     print_error("wombat");
     goto exit_error;
   }

   hippo = xc_allocate_hippo();
   if (bad(hipp)) {
     print_error("hippo");
     goto exit_error;
   }

   zebra = xc_allocate_zebra();
   if (bad(hipp)) {
     print_error("zebra");
     goto exit_error;
   }

   ...
  exit_error:
   if (some(wombat)) xc_free_wombat(wombat);
   if (some(hippo)) xc_free_hippo(hippo);
   if (some(zebra)) xc_free_zebra(zebra);
   exit(-1);

or some similar approach that makes it easier to see that the code is
correct and leak-free.

But as I say I think as the author you get to decide.

Regards,
Ian.

