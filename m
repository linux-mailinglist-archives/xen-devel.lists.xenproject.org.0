Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2627449A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:45:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjX5-00086a-8z; Tue, 22 Sep 2020 14:44:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGvm=C7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKjX3-00086F-OG
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:44:37 +0000
X-Inumbo-ID: a5828bfc-09c1-4948-94b9-fdde53aecdc3
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5828bfc-09c1-4948-94b9-fdde53aecdc3;
 Tue, 22 Sep 2020 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600785877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RcSSmcHxzYVbW8kHAuJX8H1PNlflFvFXWb8s0NzusoU=;
 b=SXgQ0J0OH98TslJFNkuVFrVFSaS50sTxVLzvPMpBBdUyR+XLq4QHbwLY
 d9xQRuoweAjTaAM1uz5E69X+l/FqIPM5Ia7zB9j+CpvJdiEXAUIy3vQzB
 cJe+hgJXY2joIas4bbIgGcgWLNZzv8F43hC5ujbn9oYpHHpUI1acoTVc8 U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XBD6INUP8oBB9liQ4LNYA9/wjid0L5qc9+S+Bj5nj22SvUqrjbiv48aVimliGuo4XW45YOe/L8
 kvrGTtwLMBVAB31ShknBlbTGD2gxUQer/zSePc1LKBaUZHM/uEasP72Qb8HwHwgY/E5VM6i2Io
 rXaIG+OVHtmTnzVViuN5kGLgdOX4r5J/USOqp0/qpHsJpcB5c9M0VOEKy8Ifi1MjqDY4Chd/xv
 SdSjiKwB+Ed+Y3eIGopfcVhKMQUl2FtcgVa2gNNC51rZu/16YrVYRWR2I7/hxEwgKWgD+Y9Osz
 0F4=
X-SBRS: 2.7
X-MesageID: 27271375
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27271375"
Date: Tue, 22 Sep 2020 16:44:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.com>, <konrad.wilk@oracle.com>, SeongJae Park
 <sjpark@amazon.de>, <axboe@kernel.dk>, <aliguori@amazon.com>,
 <amit@kernel.org>, <mheyne@amazon.de>, <pdurrant@amazon.co.uk>,
 <linux-block@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] xen-blkfront: Apply changed parameter name to the
 document
Message-ID: <20200922144425.GL19254@Air-de-Roger>
References: <20200922141549.26154-1-sjpark@amazon.com>
 <20200922141549.26154-4-sjpark@amazon.com>
 <0171c36f-138b-8f53-7cb7-3b753c7f23dd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0171c36f-138b-8f53-7cb7-3b753c7f23dd@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Tue, Sep 22, 2020 at 04:27:39PM +0200, Jürgen Groß wrote:
> On 22.09.20 16:15, SeongJae Park wrote:
> > From: SeongJae Park <sjpark@amazon.de>
> > 
> > Commit 14e710fe7897 ("xen-blkfront: rename indirect descriptor
> > parameter") changed the name of the module parameter for the maximum
> > amount of segments in indirect requests but missed updating the
> > document.  This commit updates the document.
> > 
> > Signed-off-by: SeongJae Park <sjpark@amazon.de>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Does this need to be backported to stable branches?

Thanks, Roger.

