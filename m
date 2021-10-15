Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD1942F98B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 19:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210987.368044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQbE-0002RA-Ii; Fri, 15 Oct 2021 17:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210987.368044; Fri, 15 Oct 2021 17:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQbE-0002PL-Ff; Fri, 15 Oct 2021 17:02:28 +0000
Received: by outflank-mailman (input) for mailman id 210987;
 Fri, 15 Oct 2021 17:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHjW=PD=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mbQbC-0002PF-R6
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 17:02:26 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abb0f7c0-2dd9-11ec-8249-12813bfff9fa;
 Fri, 15 Oct 2021 17:02:26 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: abb0f7c0-2dd9-11ec-8249-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634317345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PWItVNv2zL0AmFxuoq1ed8CdUkJBfgbTzOjCaui87yE=;
  b=ZtkXsT837z7kdNEam8fugpgX0EOvWMxPaDZC+YAbwF2ipvWbB+ePG9Oj
   5yXl8JeCrsl8b76/w1nywYZlBtIO9VCV/oycjBumE2LYPmQ0wJWtioXOB
   kanU0WFOesudiSsoBFkDYM4HoVsUojrT2tydZ94YqjjLifsKTU73xE9rj
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VSMIolyxUBBZgOqgJnaA3T0UDKiZH8QDDSA3/AqBPUwqO6nrAqNEokjaxcAKjwQlbZJyRwnQRa
 b5RFEVPk2zaxoyyaiM6bFiMjXfrY41Mu5c+K/r+PaKMjVySW+LJefjrAGMfiHWB/JxJcklDEkq
 orOVy7ECjIWWhwNSB5onmPwJEBDwwT9h03Ulu0VD7YACjl9uJBD4z08tPfsKMF5hGkmhic/+eX
 zA+9NWJOukX/emylIjZIUZsNErJMwcftJZfX5yezhJVHHuirXJK3O102c66n3tb1xKDXdQY4Ok
 RLOxu1+wS7znAcjIdyiGCIx8
X-SBRS: 5.1
X-MesageID: 55337651
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RxUluqAeGqsi6RVW/6Tkw5YqxClBgxIJ4kV8jS/XYbTApDsl3jJWy
 WsYX2vUPPaNN2qgeox2PIrl/U9QvpeBz9ZlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX550E87wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/hhi2p4Bt6
 O539rOsYxgDJPP0tcJaekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFgWxr2Z4TRJ4yY
 eJBciFeQRHASidNHXolS5gXwdeEhWbGJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHMOb4SqI9DSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiH+bvDYMVtxICeo45QqRjK3O7G6xBHUATzNHQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBWIvWhdUUSs+2ZrMvKsspAiRdvtFV4fg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVqvluPDwpJ+is8PdT/P9X5tjA3+N4ZdN7BJmRtq
 kTojCR3AAomNpqKiDCWCNsEGLWk9p5p2xWN3AYxQfHNG9mrkkNPnLy8Ahkiey+F0e5eIFcFh
 XM/XysKufe/21PwPMdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhNwy/plY
 srCIZzyZZr/NUiB5GHrLwv6+eRzrh3SOEuJHcyrp/hZ+ev2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0EONASlhL/qNZJRXhTdCBTLcmv96R/K77SSiI7STpJI6KAntscl3lNwv09ehHgp
 SrmBCe1CTPX2BX6FOl9Qis9Ne21BM0h8CtT0O5FFQ/A5kXPqL2HtM83H6bbt5F8nAC65fIrH
 fQDZeuaBfFDFmbO9zgHNMGvp41+bhW7wwmJOnP9MjQ4epdhQS3P+8PlIVSzpHVfUHLvuJtsu
 aCk2yPaXYEHG1ZoAvHJZa/91Fi2p3Ucxr5/BhOaPtlJdUzw24F2MCit3OQvKsQBJEyblDuX3
 gqbGzkCouzJr9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKj7P
 Ldb1fDxNvEDjW1miYskHuY517866vvuu6ReklZuEkLUYgn5EbhnOHSHg5VC7/Uf2r9DtAKqc
 UuT4d0Ga66RMcboHVNNdgooauOPiaMdljXItKlnJUz74Gl8/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L3nJO6mCBDn0cSKF25JgVDbjihhcv1lwfM4fXDTX74c3XZthBWqXwz
 uR4WEYWa2xg+3f/
IronPort-HdrOrdr: A9a23:jzPyral+OontyQAx/gsQErfMdQDpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.85,376,1624334400"; 
   d="scan'208";a="55337651"
Date: Fri, 15 Oct 2021 18:02:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 50/51] build: specify source tree in include/ for
 prerequisite
Message-ID: <YWm0DgfR5XyD1CCj@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-51-anthony.perard@citrix.com>
 <d9591c5f-9cff-e135-1d1e-c79a82095da7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d9591c5f-9cff-e135-1d1e-c79a82095da7@suse.com>

On Thu, Oct 14, 2021 at 12:19:06PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > When doing an out-of-tree build, and thus setting VPATH,
> > GNU Make 0.81 on Ubuntu Trusty complains about Circular dependency of
> > include/Makefile and include/xlat.lst and drop them. The build fails
> > later due to headers malformed.
> 
> Doesn't this change need to come ahead of the one enabling out-of-tree
> builds then?

Probably yes, I've work this patch as a fix. I'll try to make the change
earlier.

> Also do you again mean 3.81?

Indeed.

Thanks,

-- 
Anthony PERARD

