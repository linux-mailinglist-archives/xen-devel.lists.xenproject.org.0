Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14F2744E9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 17:03:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjpC-0002MF-LD; Tue, 22 Sep 2020 15:03:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKjpB-0002MA-Dd
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 15:03:21 +0000
X-Inumbo-ID: 31518c99-3883-4edf-ab88-cff03922056e
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31518c99-3883-4edf-ab88-cff03922056e;
 Tue, 22 Sep 2020 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600787000; x=1632323000;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=eRDTrtuN85IXUqjdLp1BB4IHHjXsWG5mm0q8q4Un7ZA=;
 b=Q8kU75/c6yU18L9P5YNPy+GQnz1XtX7bMCSAPx9aP8AQ7WmqZGnSUGCd
 jIk5TRBdShhJ7vroM0D7N5sPaooC+ZoqXe8t5zh3K8Jv+q9wUAPxksXqI
 5BQv+EiH0DTZPyHfyHIiMBW62L3b+Xt2gN0JNncijAEp/5AffTYrxS5mq g=;
X-IronPort-AV: E=Sophos;i="5.77,291,1596499200"; d="scan'208";a="56981745"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 22 Sep 2020 15:03:18 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id A6C051A00BF; Tue, 22 Sep 2020 15:03:17 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.145) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 15:03:10 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
CC: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>, SeongJae Park
 <sjpark@amazon.com>, <konrad.wilk@oracle.com>, SeongJae Park
 <sjpark@amazon.de>, <axboe@kernel.dk>, <aliguori@amazon.com>,
 <amit@kernel.org>, <mheyne@amazon.de>, <pdurrant@amazon.co.uk>,
 <linux-block@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] xen-blkfront: Apply changed parameter name to the
 document
Date: Tue, 22 Sep 2020 17:02:55 +0200
Message-ID: <20200922150255.5850-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <20200922144425.GL19254@Air-de-Roger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.161.145]
X-ClientProxiedBy: EX13D47UWA001.ant.amazon.com (10.43.163.6) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 22 Sep 2020 16:44:25 +0200 "Roger Pau Monné" <roger.pau@citrix.com> wrote:

> On Tue, Sep 22, 2020 at 04:27:39PM +0200, Jürgen Groß wrote:
> > On 22.09.20 16:15, SeongJae Park wrote:
> > > From: SeongJae Park <sjpark@amazon.de>
> > > 
> > > Commit 14e710fe7897 ("xen-blkfront: rename indirect descriptor
> > > parameter") changed the name of the module parameter for the maximum
> > > amount of segments in indirect requests but missed updating the
> > > document.  This commit updates the document.
> > > 
> > > Signed-off-by: SeongJae Park <sjpark@amazon.de>
> > 
> > Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Does this need to be backported to stable branches?

I don't think so, as this is not a bug affecting users?


Thanks,
SeongJae Park

