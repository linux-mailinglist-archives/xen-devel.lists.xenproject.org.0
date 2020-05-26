Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0671E23BE
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 16:12:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdaIx-0006dk-2n; Tue, 26 May 2020 14:11:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5j=7I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jdaIw-0006da-7F
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 14:11:42 +0000
X-Inumbo-ID: d24348ac-9f5a-11ea-a64b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d24348ac-9f5a-11ea-a64b-12813bfff9fa;
 Tue, 26 May 2020 14:11:41 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GtppemxZpmjLTC13PCoZMb124ksaalluAF2xf4LMMrwSYkCMYCAnOezRvX7Qv5TsKuaTPt/JAX
 k8+zb8EfEld55eZ6AeGfbcChX5BiwK+CB4RlqX9UCurbjVEGgl2UbfnH4Nf8sN/+BFiLXSLaZS
 facOY+TzKviwzDN0aPtR0bTndHH15E0ZjZc10JU+c9GJWmEeNgM27dlr0OitnNy6gK3h3t6v2m
 v/744H8j2Pw87W/V3h10OP/AzUW6j3Bw/1kGWEWus4j2GSETTyJ8/9y4BE/v2xF4rgplvgyDVE
 nZQ=
X-SBRS: None
X-MesageID: 18801744
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24269.8453.965170.734723@mariner.uk.xensource.com>
Date: Tue, 26 May 2020 15:00:37 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack
In-Reply-To: <3986B3CE-1730-443C-BD10-D2161C2A75F4@citrix.com>
References: <20200525025506.225959-1-jandryuk@gmail.com>
 <3986B3CE-1730-443C-BD10-D2161C2A75F4@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack"):
> Acked-by: George Dunlap <george.dunlap@citrix.com>
> 
> Out of curiosity, what do you think is missing to be able to declare this ‘Supported’?  Are there any features missing, or do we just  need to add a test to osstest?

I think from my point of view that is all that would be sufficient but
others may have other concerns.

Ian.

