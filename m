Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5135E271
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 17:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109935.209844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWKke-0005qd-PA; Tue, 13 Apr 2021 15:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109935.209844; Tue, 13 Apr 2021 15:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWKke-0005qE-Lq; Tue, 13 Apr 2021 15:14:52 +0000
Received: by outflank-mailman (input) for mailman id 109935;
 Tue, 13 Apr 2021 15:14:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rNj=JK=ipxe.org=mcb30@srs-us1.protection.inumbo.net>)
 id 1lWKkc-0005q8-Ji
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 15:14:50 +0000
Received: from blyat.fensystems.co.uk (unknown [54.246.183.96])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2953e1c-8cd5-4c95-8b18-f77f74c554ce;
 Tue, 13 Apr 2021 15:14:49 +0000 (UTC)
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5495:5e00:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id DEBBC4427E;
 Tue, 13 Apr 2021 15:14:46 +0000 (UTC)
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
X-Inumbo-ID: f2953e1c-8cd5-4c95-8b18-f77f74c554ce
Subject: Re: xen-netback hotplug-status regression bug
To: paul@xen.org, Wei Liu <wei.liu@kernel.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 Paul Durrant <pdurrant@amazon.com>
References: <afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org>
 <f469cdee-f97e-da3f-bcab-0be9ed8cd836@xen.org>
 <58ccc3b7-9ccb-b9bf-84e7-4a023ccb5c56@ipxe.org>
 <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
From: Michael Brown <mcb30@ipxe.org>
Message-ID: <d452efde-a2cc-ee5e-bea8-a34e657e2f02@ipxe.org>
Date: Tue, 13 Apr 2021 16:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	blyat.fensystems.co.uk

On 13/04/2021 11:55, Paul Durrant wrote:
> Ok, so it sound like this was probably my misunderstanding of xenstore 
> semantics in the first place (although I'm sure I remember watch 
> registration failing for non-existent nodes at some point in the past... 
> that may have been with a non-upstream version of oxenstored though).
> 
> Anyway... a reasonable fix would therefore be to read the node first and 
> only register the watch if it does exist.

Thanks.  Patch coming up shortly!

Michael


