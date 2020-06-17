Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B31FCEB4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 15:40:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlYJ3-0006pX-UH; Wed, 17 Jun 2020 13:40:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1j2=76=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jlYJ2-0006pQ-S3
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 13:40:44 +0000
X-Inumbo-ID: 233e8158-b0a0-11ea-b9eb-12813bfff9fa
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 233e8158-b0a0-11ea-b9eb-12813bfff9fa;
 Wed, 17 Jun 2020 13:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id CFAC9459;
 Wed, 17 Jun 2020 15:40:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyPocBMOFRCV; Wed, 17 Jun 2020 15:40:41 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id AEDA711BE;
 Wed, 17 Jun 2020 15:40:26 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jlYIj-0018VO-Ob; Wed, 17 Jun 2020 15:40:25 +0200
Date: Wed, 17 Jun 2020 15:40:25 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v1] stubdom/vtpm: add extern to function declarations
Message-ID: <20200617134025.2tdrjxslnh66dmng@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Andryuk <jandryuk@gmail.com>, Olaf Hering <olaf@aepfle.de>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20200617060841.7241-1-olaf@aepfle.de>
 <CAKf6xptxO0cVUGzfLw2gEHuzvRZsnQFwhbO9XAzijFRXUq1F5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKf6xptxO0cVUGzfLw2gEHuzvRZsnQFwhbO9XAzijFRXUq1F5g@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk, le mer. 17 juin 2020 09:35:52 -0400, a ecrit:
> On Wed, Jun 17, 2020 at 2:10 AM Olaf Hering <olaf@aepfle.de> wrote:
> >
> > Code compiled with gcc10 will not link properly due to multiple definition of the same function.
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Samuel Thibault <samuel.thibaut@ens-lyon.org>

Thanks!

