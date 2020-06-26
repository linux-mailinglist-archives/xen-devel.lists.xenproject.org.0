Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D6B20AFA8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 12:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jolZS-0002jO-Qr; Fri, 26 Jun 2020 10:26:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jolZR-0002jJ-Qg
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 10:26:57 +0000
X-Inumbo-ID: 8fa984e8-b797-11ea-8293-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fa984e8-b797-11ea-8293-12813bfff9fa;
 Fri, 26 Jun 2020 10:26:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b6so8948564wrs.11
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 03:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i4yNifU9+jLLB/Li+CpkaCtqyDqd7tC6EGbwujm7ksM=;
 b=igFVbPBPhsW1YNRQgBvAeEnYWLv06lsvygD1qLxr3hRXIVHan7v3a0J+4GYMjKDVrF
 vy5F/JAMmXKbVkuF7VPKRrjiyLe3dmWIMZydR5ql3xUCN+8o/rEUMVNBxk74ZqxDYsC5
 9+ixQ0fXa+nIDGjR35+d4VhKI4TDvJzpvLxZ0yNVL64/7vyjD31eUZjVIs4JGnJuLG/e
 351mqFfkUt2Lm3AxUm+km37Cv5gWROcVnr9aWrZP7hLV4ImayWaMWm0V7DsqY9uSoV0g
 V1lWLQWTIDxcZTnVnZYhLotCiUvIQwj7YKT3KTLiP1WYhcV2UIewSKKpmR81SEVtDXBS
 WyKw==
X-Gm-Message-State: AOAM531zNeWVW/ihT0ZzH7U/Cgj+CFTMyV+WauV2lIE578VrOsta9TJ+
 NQHMfVcS8ROQ0HxbmhmdRcM=
X-Google-Smtp-Source: ABdhPJwKfyOORHJJeiiFV6qUkepqzr5IfhGS6xzCP/zYdfmzMjBw44MK7Y/5z200PjK1/DS8rZyh3A==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr3170479wrm.271.1593167216353; 
 Fri, 26 Jun 2020 03:26:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 1sm16269782wmf.21.2020.06.26.03.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 03:26:55 -0700 (PDT)
Date: Fri, 26 Jun 2020 10:26:54 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
Message-ID: <20200626102654.e6ygxgnd37ptxosb@liuwe-devbox-debian-v2>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
 <20200609152233.039cfc86.olaf@aepfle.de>
 <20200610191657.GA69414@deinos.phlegethon.org>
 <20200611211004.11e38f8f.olaf@aepfle.de>
 <CACMJ4Ga2oO94kXw2NVdRQb=dOZ9kqZRgDLkrE630D3RFTMoYQg@mail.gmail.com>
 <005a01d64480$49ce0730$dd6a1590$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <005a01d64480$49ce0730$dd6a1590$@xen.org>
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
Cc: 'Olaf Hering' <olaf@aepfle.de>, 'Wei Liu' <wl@xen.org>,
 'Tim Deegan' <tim@xen.org>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Christopher Clark' <christopher.w.clark@gmail.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 09:21:22AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Christopher Clark <christopher.w.clark@gmail.com>
> > Sent: 16 June 2020 21:50
> > To: Olaf Hering <olaf@aepfle.de>
> > Cc: Tim Deegan <tim@xen.org>; xen-devel <xen-devel@lists.xenproject.org>; Ian Jackson
> > <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; paul@xen.org
> > Subject: Re: [PATCH v1] kdd: remove zero-length arrays
> > 
> > On Thu, Jun 11, 2020 at 12:12 PM Olaf Hering <olaf@aepfle.de> wrote:
> > >
> > > Am Wed, 10 Jun 2020 20:16:57 +0100
> > > schrieb Tim Deegan <tim@xen.org>:
> > >
> > > > How tedious.
> > >
> > > Indeed. This compiles for me as well:
> > 
> > just a nudge on this; it would be nice to get a patch into the tree
> > since the build failure affects master builds of Xen in OpenEmbedded
> > now.
> > 
> 
> I'd be happy to take a patch into 4.14 if someone can provide one with a suitable maintainer ack.

Tim is the maintainer of KDD. :-)

I take it you're happy with me committing his patch then?

Wei.

