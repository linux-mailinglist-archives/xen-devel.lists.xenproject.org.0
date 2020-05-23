Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F08A1DF85D
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2020 19:03:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcXYJ-0003GK-18; Sat, 23 May 2020 17:03:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9iM=7F=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jcXYH-0003GE-SX
 for xen-devel@lists.xenproject.org; Sat, 23 May 2020 17:03:13 +0000
X-Inumbo-ID: 4945a3a0-9d17-11ea-b07b-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4945a3a0-9d17-11ea-b07b-bc764e2007e4;
 Sat, 23 May 2020 17:03:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z18so16315805lji.12
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2020 10:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S0SOyc3LUuwBwXHuqtQ2x6cooeUtHm7VNacfs/Maa3Y=;
 b=lWn3o6id9Uoadkd2EHp2kvr7hSDT7e6MxKbRarDOsPMkTCrkSQ+tRJNt2+yx5OGMkb
 pxug7DUE83tCvU5ITeqxAm6XDHNjGQ0X3ZPuyDb1mEsHOlPd6MG4uTrctS0tjeqGb/+I
 iYyLetj4F9iUYwno7KVEOfd7o/GuLJTGtGdVbGRXdDkfLpMD6xjdenHmgZ/ek7vvdqtd
 ou0B7Jxg19YdmmlwEiwwRuOyzWbxCZx9/qs88NOAgxeJ9WM5ZmuI7R07o7DBkrAhk0sg
 dned+tPkVrDaTX+b4xaY+5cVmBzkGsLt37eb0ZeAuJZ2SjHIfVcZWmtsdkXD8Yc5fIFz
 LbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S0SOyc3LUuwBwXHuqtQ2x6cooeUtHm7VNacfs/Maa3Y=;
 b=pWL/jX7fWcmVECNFB+K91JA/7XdBddYw02bEv43IuglWKi4TzwJfw32cZ9UNzba7dH
 dCXtp5avmGrEotXRBry+VoC6x5273gCa7n2XXXXeTxtiDTEY4al/NZ2yYvANmAGEsV6L
 EC6McfxvrKbjdYEiD4MpaiP3/mp5ku1J/0ZoU2mNEs8NQ19TsNW+0uPsQqKrq5yhdqq4
 O0bX5gDWyDVOXOR6xUXZX5SJknUJJQ0Y+SdlK+htrRGlMCihpPa6u6N2hMpHM8M4g4VM
 1KZkXSyxdT5w85ySHtzfUcfLnY1ZUFB4JOcLgnQPBaDwemrC/MGdlFUmfWUvVdpq5DMj
 wGWA==
X-Gm-Message-State: AOAM533/QtWM+/A8mW64vBqGuxLlEKRYOzDnYHy798nQOXw1t9n0TYkW
 a/X7Xx46ScWv0fU3Uw6r35k1eVkUEhWLDrx8ntKYfivFr/8=
X-Google-Smtp-Source: ABdhPJwoAP+Gpa2ri9m6QTTyMsHz2hIzra7+AphB85o44jODdGS/ij+6dI4uMcYSMp2aMRrBuvnmLiq8hn6Pcaf2rN4=
X-Received: by 2002:a05:651c:1208:: with SMTP id
 i8mr6600041lja.103.1590253392390; 
 Sat, 23 May 2020 10:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-6-george.dunlap@citrix.com>
In-Reply-To: <20200522161240.3748320-6-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 23 May 2020 13:03:01 -0400
Message-ID: <CAEBZRSeSRFa=HJhJB_xX8a_itkoDQ9MAgAioEeLogdh6k8k_wg@mail.gmail.com>
Subject: Re: [PATCH 5/5] gitignore: Ignore golang package directory
To: George Dunlap <george.dunlap@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>

