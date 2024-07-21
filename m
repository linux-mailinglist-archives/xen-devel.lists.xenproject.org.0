Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30979383FB
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jul 2024 10:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761340.1171298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVRjf-0003df-Qp; Sun, 21 Jul 2024 08:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761340.1171298; Sun, 21 Jul 2024 08:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVRjf-0003aY-O9; Sun, 21 Jul 2024 08:16:03 +0000
Received: by outflank-mailman (input) for mailman id 761340;
 Sun, 21 Jul 2024 08:16:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sVRje-0003aS-DT
 for xen-devel@lists.xenproject.org; Sun, 21 Jul 2024 08:16:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVRjb-0001Ug-Dd; Sun, 21 Jul 2024 08:15:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVRjb-00041k-5d; Sun, 21 Jul 2024 08:15:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=U8oVg7+NXRD8fjFhnbd/luxe87YxQC1GIJXaX+lwSm0=; b=0J4mQU9vQb+JCOSWUafWFC9M4J
	MHsjkyRjXAwbdNomgIGe455JfDmEJuEkHKzhYJFTXj+DVi8IIgF2Yq0U1YcNZZzHWC6qk/WFamerp
	/U1szJuqkraKRi/2LHOewtoBFp4h3MlsxuCz7RZxYk8q4McTzQHJ56MU+8c1XO0iNCPM=;
Message-ID: <5f1f9deb-4f79-42a1-8704-7f123bb1041c@xen.org>
Date: Sun, 21 Jul 2024 09:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Commit moratorium
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: "committers@xenproject.org" <committers@xenproject.org>,
 Oleksii <oleksii.kurochko@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <770b22e5-95b2-40ed-ab3a-fb471ecf2f0a@xen.org>
In-Reply-To: <770b22e5-95b2-40ed-ab3a-fb471ecf2f0a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/07/2024 16:34, Julien Grall wrote:
> Hi all,

Hi,

> We intend to branch for Xen 4.19 in the next couple of days.
> 
> As part of the process, it is easier to branch when staging == master.
> Therefore I would like to ask a commit moratorium.
> 
> Please don't commit anything (even patches released-acked) until further 
> notice.

The tree is now re-opened. For the 4.20 branch, please only commit small 
changes until the 4.19 is released.

For the 4.19 branch, any change will still require a release-ack and 
would need to be first merged in staging and then cherry-picked to the 
4.19 branch.

Cheers,

-- 
Julien Grall

