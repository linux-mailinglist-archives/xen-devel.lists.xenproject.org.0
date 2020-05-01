Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59871C0B31
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 02:16:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUJKB-0005l2-7s; Fri, 01 May 2020 00:14:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOzx=6P=gmail.com=pryorm09@srs-us1.protection.inumbo.net>)
 id 1jUJK8-0005kx-Qx
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 00:14:36 +0000
X-Inumbo-ID: bd27c930-8b40-11ea-b9cf-bc764e2007e4
Received: from mail-il1-x12f.google.com (unknown [2607:f8b0:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd27c930-8b40-11ea-b9cf-bc764e2007e4;
 Fri, 01 May 2020 00:14:35 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id t12so3142832ile.9
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2020 17:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=iyGMNZXwsO96nEXQ+ErLdrvn6v4CWSTkPblT+6bbBRo=;
 b=MExk9PQ7Us+aXj+WiN6DRTpQMvRtLgiE1f7//qKKGCPpMwNOSFp70KAgqheYgKwhbG
 EZ10XsjFCJRrhrCBbickH/1prMjKBXTAp+Jdqma31eGgvvWiVHMi2megaJkPO1rjMpEs
 g6eN0TcWjrzwMOiDZIjjVaxMgCsxgWw0DWuLD8qiQFM0eOSIzoDEyCnczGtiSlvb9RRn
 t/AWK96ePVUx2yAkbgEfeaWRSwLsxMteaIETakEvPVhRnfleAlLXpiH3vp5u7xPwX4l7
 mKjcR+OaEsjELa/2V4NuKxDe5qTtuREKgbSkKFPl8lkXgtwo1hp7JI5Ml1/Sjt4kJdJ+
 h9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iyGMNZXwsO96nEXQ+ErLdrvn6v4CWSTkPblT+6bbBRo=;
 b=jKpATlVkLIn7Bsuxj6qojwKe0nAaYrMJTkIDrPU9F58qVmWnhzviWpLJTbONwAjJL7
 mgp1aganR7PDjmsSzI+3ApZ/0CYGjPA8zwhhJm8zB8t9N/L+4yE1jKD7M89WqlWcgY3U
 p7R1MlOw+G0YcvkXI8Xe+t2WMG0oVFJCo489s37R/JzhQ21xkcIwwLd4i6voiXLVnuIm
 00sD4/ZuIYOzxkfL91L/86TbO+GejOAwhEDak/5JbRRfUUtMsYJZozNsdrHcuTLeGPQQ
 E2Kb4D/Yr76i2U5OWcDIbsnoifg2/Bqq000OfSJGP/VuukuGmTu/i8+XIlGFbzIeG70S
 x+XQ==
X-Gm-Message-State: AGi0PubohMRoUaBTNrnM1r3Ld+4NziP7olKy00v6E7ubNI++sNu+9E2A
 NFvAsUheiLMELpQaMiwUlqJ1EWBJYnFp4W/5Jc7kXw==
X-Google-Smtp-Source: APiQypLweRWqoMWHr/H/ZYnNF30AK2Jgls27HH73An5KGcSmvlAEgaeRHfXRIe8mLIItS5maYN4KszjZ8QbQ/1hkcJg=
X-Received: by 2002:a92:8c4c:: with SMTP id o73mr1096337ild.169.1588292074908; 
 Thu, 30 Apr 2020 17:14:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:a518:0:0:0:0:0 with HTTP; Thu, 30 Apr 2020 17:14:34
 -0700 (PDT)
From: Pry Mar <pryorm09@gmail.com>
Date: Thu, 30 Apr 2020 17:14:34 -0700
Message-ID: <CAHnBbQ8F6vQJB4sXorxmfxU7YJ--Nt-4mb8CechXQXdwWJjNgQ@mail.gmail.com>
Subject: Re: Xen Compilation Error on Ubuntu 20.04
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
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

Hello Ayush Dosaj,

https://bugs.launchpad.net/ubuntu/+source/xen/+bug/1851091

see the bug report above ^.

As soon as Ubuntu 19.10 went to LZ4 kernel compression this bug
appeared. As Stefan Bader reports in his testing, the hypervisor not
only crashes, but resets the machine.

The same trouble continued with 20.04. Their solution was to forward
package the Disco hypervisor. You could also hybridize with the Buster
hypervisor - I've done both with perfect results.

Whatever this bug ends up to be, it goes back to 2015 when the lz4
decompression code was first introduced:
[xen.git] / xen / common / lz4 /

I reported trouble too back in Oct 2019:
https://lists.xenproject.org/archives/html/xen-devel/2019-10/msg01637.html

cheers,
PryMar56
##xen-packaging on Freenode IRC

