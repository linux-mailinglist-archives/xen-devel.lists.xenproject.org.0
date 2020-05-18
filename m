Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5DB1D7BA3
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 16:45:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jah1S-0007w0-PL; Mon, 18 May 2020 14:45:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ws3m=7A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jah1R-0007vp-JP
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:45:41 +0000
X-Inumbo-ID: 3e23bd90-9916-11ea-a86e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e23bd90-9916-11ea-a86e-12813bfff9fa;
 Mon, 18 May 2020 14:45:40 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: iV8ummVhtJDE6cAe+rgazhfnKbLaZxUtidOEVvJA49rq0PW++xB8Wz/WkZh5itb0ymArqkHsWY
 QBdOE82nNjF+9nJZXLlhdAkirm7UkHl5ErV0x4lzcex69T0WvwcXOpAGa9R+KoAXZ+KWW8NiGp
 NDVdru7+4XfYNP2rptulUiZNB3G45mt48rMM6QRchx9alUDuLe5tL3Y0Xin74oq5ZXoPmKohyP
 /i1/30g+aamPjtZZvDDR3S5SUbaLI662DhaGxVj8eeax1BMhecLbMfCTnZfeseTbU50wVRRpmq
 Qr8=
X-SBRS: 2.7
X-MesageID: 18072338
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18072338"
Subject: Re: [PATCH v1] tools: use HOSTCC/CPP to compile rombios code and
 helper
To: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200518144400.16708-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <899f9a7d-51a0-ec42-d20c-50a8fda629c8@citrix.com>
Date: Mon, 18 May 2020 15:45:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518144400.16708-1-olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 18/05/2020 15:44, Olaf Hering wrote:
> Use also HOSTCFLAGS for biossums while touching the code.
>
> Spotted by inspecting build logfile.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

