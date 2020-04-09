Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C61A38AF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 19:11:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMai1-0003GP-Bg; Thu, 09 Apr 2020 17:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOqT=5Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMahz-0003GK-RE
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 17:11:19 +0000
X-Inumbo-ID: 2075f4e9-7a85-11ea-8304-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2075f4e9-7a85-11ea-8304-12813bfff9fa;
 Thu, 09 Apr 2020 17:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=5mpcOQQOB6uuwLR/vKr4Lzr8sQYc2hhojgeuL5hZkqA=; b=kXu69VddbAV/FaQPdLAxsD1UiB
 2ZtX+lWo+LTWbJQ0WksysDsbdzHgj1OiLOlp0eIv3aKhyjAmRrgeo4fOZgCGyjlmjJBKarjmNaRbi
 D51UmIzPzJHKwsfZhFf0mbZ6aOqMPl8lyTPDzRyzolitbCfuDpNPhCGCzJNy0ua6G75c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMahw-0002Uc-3v; Thu, 09 Apr 2020 17:11:16 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMahv-0007qh-R4; Thu, 09 Apr 2020 17:11:16 +0000
Date: Thu, 9 Apr 2020 18:11:13 +0100
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v14 3/3] xen/tools: VM forking toolstack side
Message-ID: <20200409171113.cajvhjlftadqqq73@debian>
References: <cover.1586186121.git.tamas.lengyel@intel.com>
 <6d63f89124c7445be3185ab6722992b707dab72b.1586186121.git.tamas.lengyel@intel.com>
 <20200409154243.6ouh7r37fwm32mjg@debian>
 <CABfawhndtUA3hVyq9ObbuGRJOVg84qxPgEpc-HsEMxn7A7j_jA@mail.gmail.com>
 <20200409162159.cb2h7a6tmkbaduay@debian>
 <CABfawhnaDS=nGn3+NqoY_nWXvu0cfsAmpYjiv9VqkT6C0Ow1FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABfawhnaDS=nGn3+NqoY_nWXvu0cfsAmpYjiv9VqkT6C0Ow1FA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

On Thu, Apr 09, 2020 at 10:59:55AM -0600, Tamas K Lengyel wrote:
[...]
> >
> > >
> > > > >
> > > > > +/*
> > > > > + * The parent domain is expected to be created with default settings for
> > > > > + * - max_evtch_port
> > > > > + * - max_grant_frames
> > > > > + * - max_maptrack_frames
> > > > > + */
> > > > > +int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid)
> > > > > +{
> > > > > +    int rc;
> > > > > +    struct xen_domctl_createdomain create = {0};
> > > > > +    create.flags |= XEN_DOMCTL_CDF_hvm;
> > > > > +    create.flags |= XEN_DOMCTL_CDF_hap;
> > > > > +    create.flags |= XEN_DOMCTL_CDF_oos_off;
> > > > > +    create.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> > > > > +    create.ssidref = SECINITSID_DOMU;
> > > > > +    create.max_vcpus = max_vcpus;
> > > >
> > > >
> > > > Some questions:
> > > >
> > > > Why does the caller need to specify the number of vcpus?
> > > >
> > > > Since the parent (source) domain is around, can you retrieve its domain
> > > > configuration such that you know its max_vcpus and other information
> > > > including max_evtchn_port and maptrack frames?
> > >
> > > Because we want to avoid having to issue an extra hypercall for these.
> > > Normally these pieces of information will be available for the user
> > > and won't change, so we save time by not querying for it every time a
> > > fork is created. Remember, we might be creating thousands of forks in
> > > a very short time, so those extra hypercalls add up.
> >
> > I see. Speed is a big concern to you.
> >
> > What I was referring to doesn't require issuing hypercalls but requires
> > calling libxl_retrieve_domain_configuration. That's likely to be even
> > slower than making a hypercall.
> 
> Right. We only want to parse the domain config if the device model is
> being launched.
> 
> >
> > I'm afraid the current incarnation of libxl_domain_fork_vm cannot become
> > supported (as in Xen's support statement) going forward, because it is
> > leaky.
> 
> What do you mean by leaky?

It requires the caller to specify the number of max_vcpus. The reason
for doing that is because you want to avoid extra hypercall(s). There is
nothing that stops someone from coming along in the future claiming some
other parameters are required because of the same concern you have
today. It is an optimisation, not a must-have in terms of functionality.

To me the number shouldn't be specified by the caller in the first
place. It is like forking a process somehow requires you to specify how
many threads it will have.

> 
> >
> > I can see two solutions: 1. batch forking to reduce the number of
> > queries needed; 2. make a proper domctl which duplicates the source
> > domain structure inside Xen.
> 
> I've attempted to do that by extending the domain create hypercall so
> that this information can be copied in the hypervisor. That approach
> was very unpopular.
> 

Sigh. Sorry I haven't had the chance to read previous discussions.
-ETIME.

Wei.

