Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC5409E1A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 22:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185904.334658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPsUh-00059S-0c; Mon, 13 Sep 2021 20:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185904.334658; Mon, 13 Sep 2021 20:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPsUg-00057W-TM; Mon, 13 Sep 2021 20:23:58 +0000
Received: by outflank-mailman (input) for mailman id 185904;
 Mon, 13 Sep 2021 20:23:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+zYr=OD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mPsUf-00057Q-3j
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 20:23:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84e91ea0-14d0-11ec-b3c9-12813bfff9fa;
 Mon, 13 Sep 2021 20:23:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 301526108B;
 Mon, 13 Sep 2021 20:23:55 +0000 (UTC)
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
X-Inumbo-ID: 84e91ea0-14d0-11ec-b3c9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631564635;
	bh=/YgwrBiEzvCww0bnA51UetOY6a+RunqT1PHF+2GBSw0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BjBrqeaJ7Y26vB/hKo0WgbnPFuYcaqr9H/0jHVzmqY4q2RZlAs2CS3ZzGMkG0Zlv1
	 +0moAul+iRBsTCCPpx2Bakto1OwcFXCvwMGHXHnlFRDmmgYcf4to1rk8QFLGNZ737X
	 4ILP1CBhEHdZOhnK+n8sd2OJ3qUj77uUzQwJ6h3byzgQfPPBHBRFmYANpfyDHXP0rz
	 l6GvriwZStoXC3JFCxA3yIwPul7GHJcrryKt8dxpmA7sReVUd1e72zYoY4UO3pxOGS
	 Nq6EfPvkh6X4DTz33x4k02WwQyEd12cWs/+HM+tifeOz8j4jZUEr95AsyRsOddeNqO
	 ylr5cGmkkxunw==
Date: Mon, 13 Sep 2021 13:23:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Rahul Singh <rahul.singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN
 on ARM
In-Reply-To: <c9484b8e-cad5-d4e4-a25f-749035fe5859@epam.com>
Message-ID: <alpine.DEB.2.21.2109131322190.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com> <c9484b8e-cad5-d4e4-a25f-749035fe5859@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1927430885-1631564635=:10523"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1927430885-1631564635=:10523
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 13 Sep 2021, Oleksandr Andrushchenko wrote:
> Hi, Rahul!
> 
> On 19.08.21 15:02, Rahul Singh wrote:
> > XEN during boot will read the PCI device tree node “reg” property
> > and will map the PCI config space to the XEN memory.
> [snip]
> > +static struct pci_config_window *gen_pci_init(struct dt_device_node *dev,
> > +                                              int ecam_reg_idx)
> > +{
> > +    int err;
> > +    struct pci_config_window *cfg;
> > +    paddr_t addr, size;
> > +
> > +    cfg = xzalloc(struct pci_config_window);
> > +    if ( !cfg )
> > +        return NULL;
> > +
> > +    err = dt_pci_parse_bus_range(dev, cfg);
> > +    if ( !err ) {
> > +        cfg->busn_start = 0;
> > +        cfg->busn_end = 0xff;
> > +        printk(XENLOG_ERR "%s:No bus range found for pci controller\n",
> > +               dt_node_full_name(dev));
> > +    } else {
> > +        if ( cfg->busn_end > cfg->busn_start + 0xff )
> > +            cfg->busn_end = cfg->busn_start + 0xff;
> > +    }
> > +
> > +    /* Parse our PCI ecam register address*/
> > +    err = dt_device_get_address(dev, ecam_reg_idx, &addr, &size);
> 
> I am a bit worried here that we don't get the reg index from the device tree,
> 
> but for generic ECAM we use reg[0] and for Xilinx we use reg[2].
> 
> For example, for Xilinx we have
> 
> reg = <0x00 0xfd0e0000 0x00 0x1000 0x00 0xfd480000 0x00 0x1000 0x80 0x00 0x00 0x1000000>;
> reg-names = "breg\0pcireg\0cfg";
> 
> so, we can parse the reg-names and understand that the configuration space is the last in the reg property.
> 
> The same I think can be done for other device trees probably.

Well spotted!


> Rahul, do you know if reg-names "cfg" is vendor specific of used widely?

Unfortunately it seems to be vendor specific :-(
Which means that "dt_device_get_address" or similar should be moved to a
vendor specific function.
--8323329-1927430885-1631564635=:10523--

