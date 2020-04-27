Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C79B1BA0E0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 12:15:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT0n8-0008MT-Ob; Mon, 27 Apr 2020 10:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fhyl=6L=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jT0n6-0008MO-W0
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 10:15:09 +0000
X-Inumbo-ID: f6cc111b-886f-11ea-9752-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6cc111b-886f-11ea-9752-12813bfff9fa;
 Mon, 27 Apr 2020 10:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=vb/isXTPmI5esXbhkTiYfHZ3Ej80IyiyEFLunqYZLPQ=; b=o3O7eZ5bmzmhkg8i2eJ3y0qEKR
 +cs77r+4+Fm/oBa1K5oHpur6SvJK4sDIkMRypF80zFXiRL5mP+hSjwdyaqXjuz5QeI329jk3LqQ6F
 wWMPCVcTu5D60mFVm2KGOn1YzV945xxFhGiqU/GlHNppwSLO97Glbsq54AmCmvcYdLUI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jT0n0-0003ks-RN; Mon, 27 Apr 2020 10:15:02 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jT0n0-0005Lt-Hg; Mon, 27 Apr 2020 10:15:02 +0000
Date: Mon, 27 Apr 2020 11:14:59 +0100
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v14 3/3] xen/tools: VM forking toolstack side
Message-ID: <20200427101459.elteymh3qugnh5na@debian>
References: <6d63f89124c7445be3185ab6722992b707dab72b.1586186121.git.tamas.lengyel@intel.com>
 <20200409154243.6ouh7r37fwm32mjg@debian>
 <CABfawhndtUA3hVyq9ObbuGRJOVg84qxPgEpc-HsEMxn7A7j_jA@mail.gmail.com>
 <20200409162159.cb2h7a6tmkbaduay@debian>
 <CABfawhnaDS=nGn3+NqoY_nWXvu0cfsAmpYjiv9VqkT6C0Ow1FA@mail.gmail.com>
 <20200409171113.cajvhjlftadqqq73@debian>
 <CABfawhmdSdC2kKzE5jLLCtkR9Pb4mcT6iRdzv0s=v0mQiju_Kg@mail.gmail.com>
 <CABfawhnw2O6GPXEwk0-vAkAVpwn95F-pcpahOpQUo23Luz7eFg@mail.gmail.com>
 <20200410161906.tjonj2btem5nqkpp@debian>
 <CABfawhn2=-WiEyT--Z-h-mYBSc2uwU8X7VGaTmc6GRzOAEXzLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABfawhn2=-WiEyT--Z-h-mYBSc2uwU8X7VGaTmc6GRzOAEXzLQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 10, 2020 at 10:20:49AM -0600, Tamas K Lengyel wrote:
> On Fri, Apr 10, 2020 at 10:19 AM Wei Liu <wl@xen.org> wrote:
> >
> > On Fri, Apr 10, 2020 at 10:05:50AM -0600, Tamas K Lengyel wrote:
> > > On Thu, Apr 9, 2020 at 11:30 AM Tamas K Lengyel
> > > <tamas.k.lengyel@gmail.com> wrote:
> > > >
> > > > On Thu, Apr 9, 2020 at 11:11 AM Wei Liu <wl@xen.org> wrote:
> > > > >
> > > > > On Thu, Apr 09, 2020 at 10:59:55AM -0600, Tamas K Lengyel wrote:
> > > > > [...]
> > > > > > >
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > +/*
> > > > > > > > > > + * The parent domain is expected to be created with default settings for
> > > > > > > > > > + * - max_evtch_port
> > > > > > > > > > + * - max_grant_frames
> > > > > > > > > > + * - max_maptrack_frames
> > > > > > > > > > + */
> > > > > > > > > > +int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid)
> > > > > > > > > > +{
> > > > > > > > > > +    int rc;
> > > > > > > > > > +    struct xen_domctl_createdomain create = {0};
> > > > > > > > > > +    create.flags |= XEN_DOMCTL_CDF_hvm;
> > > > > > > > > > +    create.flags |= XEN_DOMCTL_CDF_hap;
> > > > > > > > > > +    create.flags |= XEN_DOMCTL_CDF_oos_off;
> > > > > > > > > > +    create.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> > > > > > > > > > +    create.ssidref = SECINITSID_DOMU;
> > > > > > > > > > +    create.max_vcpus = max_vcpus;
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Some questions:
> > > > > > > > >
> > > > > > > > > Why does the caller need to specify the number of vcpus?
> > > > > > > > >
> > > > > > > > > Since the parent (source) domain is around, can you retrieve its domain
> > > > > > > > > configuration such that you know its max_vcpus and other information
> > > > > > > > > including max_evtchn_port and maptrack frames?
> > > > > > > >
> > > > > > > > Because we want to avoid having to issue an extra hypercall for these.
> > > > > > > > Normally these pieces of information will be available for the user
> > > > > > > > and won't change, so we save time by not querying for it every time a
> > > > > > > > fork is created. Remember, we might be creating thousands of forks in
> > > > > > > > a very short time, so those extra hypercalls add up.
> > > > > > >
> > > > > > > I see. Speed is a big concern to you.
> > > > > > >
> > > > > > > What I was referring to doesn't require issuing hypercalls but requires
> > > > > > > calling libxl_retrieve_domain_configuration. That's likely to be even
> > > > > > > slower than making a hypercall.
> > > > > >
> > > > > > Right. We only want to parse the domain config if the device model is
> > > > > > being launched.
> > > > > >
> > > > > > >
> > > > > > > I'm afraid the current incarnation of libxl_domain_fork_vm cannot become
> > > > > > > supported (as in Xen's support statement) going forward, because it is
> > > > > > > leaky.
> > > > > >
> > > > > > What do you mean by leaky?
> > > > >
> > > > > It requires the caller to specify the number of max_vcpus. The reason
> > > > > for doing that is because you want to avoid extra hypercall(s). There is
> > > > > nothing that stops someone from coming along in the future claiming some
> > > > > other parameters are required because of the same concern you have
> > > > > today. It is an optimisation, not a must-have in terms of functionality.
> > > > >
> > > > > To me the number shouldn't be specified by the caller in the first
> > > > > place. It is like forking a process somehow requires you to specify how
> > > > > many threads it will have.
> > > >
> > > > I agree. It's not how I wanted to have the interface work but
> > > > unfortunately this was the least "ugly" of the possible solutions
> > > > given the circumstances.
> > >
> > > By the way, it would be trivial to query the parent in case max_vcpus
> > > is not provided by the user. But I would still like to keep the option
> > > available to skip that step if the number is known already. Let me
> > > know if you would like me to add that.
> >
> > I'm still waiting for Ian and Anthony to chime in to see whether they
> > agree to keep this interface unstable.
> >
> > At the end of the day, if it is unstable, I don't really care that much.
> > I'm happy to let you (the developer and user) have more say in that
> > case.  I will instead divert my (limited) time to code that your patch
> > touches which is also used by other stable functions.
> 
> SGTM

Ian and Anthony, your opinions?

Wei.

