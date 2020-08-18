Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359DD248798
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:32:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82eQ-0005Gc-8w; Tue, 18 Aug 2020 14:31:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k82eO-0005GX-NL
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:31:44 +0000
X-Inumbo-ID: 31964244-4de8-4c78-a3d1-ed390d8d64d8
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31964244-4de8-4c78-a3d1-ed390d8d64d8;
 Tue, 18 Aug 2020 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597761104;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Zr6VtCg0GU9AJ97+505H7s03eeqGYvDIQHzIUri7H78=;
 b=N4Uew2/U0etjKeqTIIB3JpTQKKirTnUKFHXPxmH7RHM3l2U51VtUra5s
 GJVcZg8nDwyVwxdc0qlZxZZFVaaMUjCY2DLcswOf4Usnaw5mfjKhO6phd
 dl+uDHuUm6fbfl0COea/ZrlEfSOVl0js55r1ehwyyNO0hLFVXUJ0QIunF k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +wYAnrvDJ5Ev1vkIcF85fdCDelyYcrjbFuWQqCWKfl+CyIKj4BP9hxogAYAvB2zHl9caDOuXNp
 UU0Kw/5/WnDW3gzlpst/bvz2lveni/cAK+W42DN8bFtynBqlGU+GLIwd+mODo1QW3yCwuummbE
 CdYfn6ZqxpqqBlqtYcTGS9a+XeX6vYARVMJNFS8T7b1GEpfsqJQfqity1cBN/TbG9xUYJi7xvI
 8xpOU1E6pkCq1JWX3MsqMJavF2jGdwk+OuS2QXx9QFKDMCw6k0Pjnmc1hOXGRk1UsvtZznVVyi
 bCw=
X-SBRS: 2.7
X-MesageID: 24758579
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="24758579"
Subject: Re: [PATCH 5/8] x86/pv: allow reading APIC_BASE MSR
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-6-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5b4a7a41-bbdd-fc0d-8467-b308acab3e9a@citrix.com>
Date: Tue, 18 Aug 2020 15:31:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817155757.3372-6-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 17/08/2020 16:57, Roger Pau Monne wrote:
> Linux PV guests will attempt to read the APIC_BASE MSR, so just report
> a default value to make Linux happy.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is a massive layering violation, but we're a decade too late to fix
it :(

