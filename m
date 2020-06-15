Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D8F1F9C0D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 17:34:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkr87-000089-9p; Mon, 15 Jun 2020 15:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkr85-000082-Ob
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 15:34:33 +0000
X-Inumbo-ID: b5c0f9e0-af1d-11ea-b80e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5c0f9e0-af1d-11ea-b80e-12813bfff9fa;
 Mon, 15 Jun 2020 15:34:33 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: H49LTfxHpefTQU6RLb1fGMWXdogjCxJvRIoLSxZUZ0gbVEhpVIS5iTX34OB9xphD7lp5XIEMoz
 14Of9prMVLgyjI6lQjY/0br34WsVuKzTIV35cgN00QRUgKl7DgUE+odf/Bt+1/aBZE56Tpff/t
 nXHm+hQRlVtsykWRfuu9Hdim85GjS68k2uL6AP8aS8XbvUqEbNnLSKt7K1z5dZTZy59lRRveZT
 N0XADO1vIIG/ngtmQ9hulmILEb3HDLV9UScXtqaYdlM65rZ+3cfL4GHHaaVYbpjQDcpaqlBcGK
 H+8=
X-SBRS: 2.7
X-MesageID: 20374245
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20374245"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24295.38146.988316.316252@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 16:34:26 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is
 sorted
In-Reply-To: <ec1364c4-f1df-c52d-8651-bbfb3b5b6a0b@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-3-andrew.cooper3@citrix.com>
 <24295.35624.644030.417783@mariner.uk.xensource.com>
 <ec1364c4-f1df-c52d-8651-bbfb3b5b6a0b@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is sorted"):
> Nothing runs it by default, but it is part of my prepush testing for
> anything in the relevant area.
> 
> We should do something better, but its not totally trivial.  The x86
> emulator test for example needs a fairly bleeding edge version of
> binutils, given that we routinely add support for bleeding edge
> instruction groups.

Hmmm.  Is it likely that installing the version from Debian testing
(say) would work ?  Or do we want to build it from source ?  These are
all possibilities.

We could build binutils from source with a job-specific --prefix
setting and that wouldn't stop it sharing the build host with other
jobs.  Maybe it could be a seperate job which provides an anointed
binutils build.

What other awkward requirements are there ?

Ian.

