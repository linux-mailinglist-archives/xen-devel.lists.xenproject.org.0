Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903AF25FC76
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:59:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFIcM-0003fv-4A; Mon, 07 Sep 2020 14:59:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFIcK-0003fo-UK
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:59:36 +0000
X-Inumbo-ID: 02296f28-75a6-4fef-b726-89344826169e
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02296f28-75a6-4fef-b726-89344826169e;
 Mon, 07 Sep 2020 14:59:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a17so16096516wrn.6
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=1hplAhVE0iV6VDZwVYg0AfZ/qXuHFOBeCkywmabHz7Y=;
 b=eLnH/k6lm3hUwOVnJw1H0P5JMe7hHLD2dfI2SYVpH7oQzjcP2Jq2ktC0F7dgdl/49k
 gwuGzEaXYyHvnKuG+bgsTfYif3ZwjdUVwdHT4AscDE6mBwYdAHWb/vUQg0lnXDBIeKXU
 ZQb1UkE5KUCy+DIeleCogUkY5ScuaHZxDYccPc47qNnofh1DWDf09Eq0fZnK3Nu0kf9w
 DsIFwyoKDSmGKhSCOeDlOaYUFT1NCxDD6OMZA6OzntQHXBleXZ1OxqW/b93wpy559Gwf
 tNlF6n6SXLCBVHbApD4v0G66ZjInOkG4zCeFZJNOA2cB4X3mgfh20edTU6z9W3vulnGm
 Xd8w==
X-Gm-Message-State: AOAM530utDQ2y7jwlRMVOOzwpMgpx2S9Er1aW9PtgSQYhKDe9zUyTCRP
 wYSjtYkpHYfaHpHnZwfvzZY=
X-Google-Smtp-Source: ABdhPJx55EBmqxJ+5HbzkXYLFVe5ogdsiTE3t+JoP23bgiY/Hd01xfA4xs2t5xUOGxl4pnSQ+gquqg==
X-Received: by 2002:adf:ce8e:: with SMTP id r14mr21916416wrn.257.1599490774409; 
 Mon, 07 Sep 2020 07:59:34 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y2sm24604845wmg.23.2020.09.07.07.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:59:33 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:59:32 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Ian Jackson <iwj@xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 01/31] tools: generate pkg-config files from make
 variables
Message-ID: <20200907145932.iue27jriqhbko3td@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-2-jgross@suse.com>
 <20200907142541.nfofazisbqonktdo@liuwe-devbox-debian-v2>
 <3c384cf8-3800-890e-9c11-e65caba9ce8a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c384cf8-3800-890e-9c11-e65caba9ce8a@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 07, 2020 at 04:44:28PM +0200, Jürgen Groß wrote:
> On 07.09.20 16:25, Wei Liu wrote:
> > On Fri, Aug 28, 2020 at 05:07:17PM +0200, Juergen Gross wrote:
> > > For each library built two variants of pkg-config files are created
> > > from a per-library template: an "official" one for installation on
> > > the user's system, and one used for building internal tools, like e.g.
> > > qemu.
> > > 
> > > Instead of the template which is looking very similar for all libraries
> > > generate the pkg-config files directly from make variables.
> > > 
> > > This will reduce the need to specify some pkg-config file entries in
> > > the templates, as the contents can easily be generated from available
> > > data (e.g. "Version:" and "Requires.private:" entries).
> > > 
> > > Especially the variant used for building internal tools needs to gain
> > > additional runtime link parameters for the internally used libraries,
> > > as otherwise those won't be found by the users (e.g. qemu).
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > Do you have the new generated files handy so that I can eyeball them a
> > bit?
> 
> Attached (both, the local and the installed ones, with the complete
> series applied).

Thanks. They look correct to me.

Acked-by: Wei Liu <wl@xen.org>

Wei.

