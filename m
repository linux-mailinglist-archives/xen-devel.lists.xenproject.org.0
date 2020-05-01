Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5981C154E
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 16:00:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUWDI-00055R-FP; Fri, 01 May 2020 14:00:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CKl=6P=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jUWDH-00055I-EF
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 14:00:23 +0000
X-Inumbo-ID: 19547744-8bb4-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19547744-8bb4-11ea-b9cf-bc764e2007e4;
 Fri, 01 May 2020 14:00:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j1so11663090wrt.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j9Wb4a28pv4W3Xa7edRDFSrtb8gWICqmhdjZIosP3F0=;
 b=vY1u5Q91lXf+b1qkJPYcumRCqZv5qZwQaSzGRQk9+PuhjnaPJq/RR8B7kFpKs6xRod
 G5yqDN8p1daV4XZVAl2rKazNPa2jKTi/EtVAde0lDoRK2b+e2LdyQs5qCC2DVy/70Qu9
 GQOhGJUYRQy3+exA/66ger+mL2qdomN/3J1jgMCiti3eBA2uoLLl8q4WRnpMRGzarJPz
 uKrnJBmQPssvIB+M1SxKFqciiWNMllVSSl1bx/VTvHZ9aCFB5uSGu55SJxCdUVNmmPU0
 ZJYZZN8SGO8kgTBor3ZG8MoAmCKwV0UpPl8zCCNacc5ePWqQf1K8r8O4xSVNhiTcFwcz
 Zm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j9Wb4a28pv4W3Xa7edRDFSrtb8gWICqmhdjZIosP3F0=;
 b=O9Vl7mU5Xq5fWDNgzPZFBly1Qez8Tgu6SeS17+oejA3fnfg1l9J0vE0G6+Mr47guBN
 6aVPIvQKZmwVwXepWEg1IMh0ZhgdgayIrKIazL/W/QHfveSarnUCGQLdpuxfIWynp7Se
 uKLUUTCbq9Sk51CT8Pate0oVUFWzdJwooRffoLMmIKEe7ny/4uJm9ldnzYn6v/d13gQ5
 P6D/LvW5J4vL34Aiit9nVo76yj9TR4ZZs7zsNiNhwGCEZ+hcrNcL2FlbE9OBdlVrXZW1
 Zv2PWFBJo9hW6sVZyIjnJBR1q9HQ4i4L26GhURJrlQs15tpMEMiK9bua8qdm+2MsRlgr
 7XTQ==
X-Gm-Message-State: AGi0Pub8PyNpf+o81vKUIHU0Eqhqnngrbw4uC4dX9/Hw8foF4UAeRhvH
 i/tlX2zKckGlPTaXbZyXy5TDw7gAOU4+o/WQZqU=
X-Google-Smtp-Source: APiQypKnAx7M3IjeyZyBEwiIGKHLhLjDBBoLmVdhCXGS2l6f1ASvJlLEBLAgwN2cb+yq/RsbUEJN14L1jPRD7aQ9XhU=
X-Received: by 2002:adf:e450:: with SMTP id t16mr4651948wrm.301.1588341621975; 
 Fri, 01 May 2020 07:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
 <e416eac0c986fd1aba5f576d9b065a6f47660b2c.1587655725.git.tamas.lengyel@intel.com>
In-Reply-To: <e416eac0c986fd1aba5f576d9b065a6f47660b2c.1587655725.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 1 May 2020 07:59:45 -0600
Message-ID: <CABfawhnxoQbehu-bvT7Uhd808rsjjDsB87O=CKqHDsrBUvur-g@mail.gmail.com>
Subject: Re: [PATCH v17 2/2] xen/tools: VM forking toolstack side
To: Tamas K Lengyel <tamas.lengyel@intel.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 9:33 AM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
>
> Add necessary bits to implement "xl fork-vm" commands. The command allows the
> user to specify how to launch the device model allowing for a late-launch model
> in which the user can execute the fork without the device model and decide to
> only later launch it.
>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Patch ping. If nothing else at least the libxc parts would be nice to
get merged before the freeze.

