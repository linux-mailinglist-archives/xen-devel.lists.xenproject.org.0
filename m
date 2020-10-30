Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB229FCFA
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 06:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15383.38398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYMjU-00062z-Nu; Fri, 30 Oct 2020 05:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15383.38398; Fri, 30 Oct 2020 05:13:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYMjU-00062a-Ke; Fri, 30 Oct 2020 05:13:48 +0000
Received: by outflank-mailman (input) for mailman id 15383;
 Fri, 30 Oct 2020 02:52:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8EZK=EF=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1kYKWK-00020q-Fg
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 02:52:04 +0000
Received: from mail-pg1-x532.google.com (unknown [2607:f8b0:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52b729cf-5ef6-411a-8d57-5c07cc8941a1;
 Fri, 30 Oct 2020 02:52:03 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id r186so3991047pgr.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 19:52:03 -0700 (PDT)
Received: from laputa (p784a66b9.tkyea130.ap.so-net.ne.jp. [120.74.102.185])
 by smtp.gmail.com with ESMTPSA id n2sm1333790pja.41.2020.10.29.19.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 19:52:01 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8EZK=EF=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
	id 1kYKWK-00020q-Fg
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 02:52:04 +0000
X-Inumbo-ID: 52b729cf-5ef6-411a-8d57-5c07cc8941a1
Received: from mail-pg1-x532.google.com (unknown [2607:f8b0:4864:20::532])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 52b729cf-5ef6-411a-8d57-5c07cc8941a1;
	Fri, 30 Oct 2020 02:52:03 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id r186so3991047pgr.0
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 19:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LJD6otIgNEYI/ougx2MRjDDBkrRANlT+jo+gqX6ZWwE=;
        b=hIBPkU1qqwn9e03MzkVkCSRKYVXL6Y70XXOnMFtYggnPvybAJw8P7HI/tS8JocGMKq
         evJrVrwx6SpHudhSXE6sOSzWB0+spgHp0rrliagRLSM2k25D8HVUIjcrt2sQ0rlC2VAX
         2swE9krS+kOVI8XaXt6qudhREuY1rDYvbcrGsAyWHy0WUJHtVHtDDoblpV/eZ5Ok+gdk
         rtr9EOtBod2KHFTw4R7L2mqHUick8xZLwAmRdw/FKZKrzspTXkXL1NcGgWsR30NKqrMI
         pCVmZIFv7oSgazPCMNACiDOeJYlm6ftmT90MnKBPBbe3Jf8CPGMGdp6fJS9PbcnoN5UT
         0x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LJD6otIgNEYI/ougx2MRjDDBkrRANlT+jo+gqX6ZWwE=;
        b=aESqdwU/LWyn7O+8O73519/cy7QE//C/TETvhzli09hfidIH5NHZa+QhiLE9riuMj5
         B802TtWflvQDIK9rkEMLQIH/E79ZB1yLR/2WQP8eWiTFzTTF6K8RAkLqrRx0xdwUT9M8
         qxfbbzl0jW8LKDgVHTfHaQOPDHbqcfnpx8V92h5TCCQCUCSr+p6QT+8KFiEBJ59RK6H+
         1mUMBJA+oWnQ7vv03qZHQYLfTVmKMwVw2OgzjSbAM1Qn6u4sUdLK/gqXABb44a7NXVbC
         zqFea0Lt0qI4VNBNvPaHicV764rAEnJZXSUlQ3r2fL5heyXxVRoH3qhFFNFyLp39ol9e
         cUYA==
X-Gm-Message-State: AOAM533ydSSbjwLgvnqBi7mq6sLJ6lEL92lxpZVt2cJWpLV/6jZ18Peo
	NKU1igbki8GS60Jojqp/zI9al1d42OEDmA==
X-Google-Smtp-Source: ABdhPJyA/d7MixJvadILEmXf4T7H+WkTx7m1mAzWq6MBL0vd7zLS5b6LB8Q5WRm4Lf+kj7NkM44kfA==
X-Received: by 2002:a63:609:: with SMTP id 9mr271011pgg.227.1604026322402;
        Thu, 29 Oct 2020 19:52:02 -0700 (PDT)
Received: from laputa (p784a66b9.tkyea130.ap.so-net.ne.jp. [120.74.102.185])
        by smtp.gmail.com with ESMTPSA id n2sm1333790pja.41.2020.10.29.19.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 19:52:01 -0700 (PDT)
Date: Fri, 30 Oct 2020 11:51:57 +0900
From: Takahiro Akashi <takahiro.akashi@linaro.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: Alex Benn??e <alex.bennee@linaro.org>,
	Masami Hiramatsu <masami.hiramatsu@linaro.org>,
	ian.jackson@eu.citrix.com, wl@xen.org, anthony.perard@citrix.com,
	xen-devel@lists.xenproject.org
Subject: Re: BUG: libxl vuart build order
Message-ID: <20201030025157.GA18567@laputa>
References: <CAB5YjtCwbvYMVg-9YXjSFtC8KvjkJuYhJFSCHrJaRUKfg4NHYA@mail.gmail.com>
 <alpine.DEB.2.21.2010261634000.12247@sstabellini-ThinkPad-T480s>
 <20201027000214.GA14449@laputa>
 <20201028014105.GA11856@laputa>
 <alpine.DEB.2.21.2010281437010.12247@sstabellini-ThinkPad-T480s>
 <20201029114705.GA291577@laputa>
 <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s>

Hi Stefano,

On Thu, Oct 29, 2020 at 07:03:28PM -0700, Stefano Stabellini wrote:
> + xen-devel and libxl maintainers
> 
> In short, there is a regression in libxl with the ARM vuart introduced
> by moving ARM guests to the PVH build.
> 
> 
> On Thu, 29 Oct 2020, Takahiro Akashi wrote:
> > On Wed, Oct 28, 2020 at 02:44:16PM -0700, Stefano Stabellini wrote:
> > > On Wed, 28 Oct 2020, Takahiro Akashi wrote:
> > > > On Tue, Oct 27, 2020 at 09:02:14AM +0900, Takahiro Akashi wrote:
> > > > > On Mon, Oct 26, 2020 at 04:37:30PM -0700, Stefano Stabellini wrote:
> > > > > > 
> > > > > > On Mon, 26 Oct 2020, Takahiro Akashi wrote:
> > > > > > > Stefano,
> > > > > > > 
> > > > > > > # I'm afraid that I have already bothered you with a lot of questions.
> > > > > > > 
> > > > > > > When I looked at Xen's vpl011 implementation, I found
> > > > > > > CR (and LCHR) register is not supported. (trap may cause a data abort).
> > > > > > > On the other hand, for example, linux's pl011 driver surely
> > > > > > > accesses CR (and LCHR) register.
> > > > > > > So I guess that linux won't be able to use pl011 on a Xen guest vm
> > > > > > > if vuart = "sbsa_uart".
> > > > > > > 
> > > > > > > Is this a known issue or do I miss anything?
> > > > > > 
> > > > > > Linux should definitely be able to use it, and in fact, I am using it
> > > > > > with Linux in my test environment.
> > > > > > 
> > > > > > I think the confusion comes from the name "vpl011": it is in fact not a
> > > > > > full PL011 UART, but an SBSA UART.
> > > > > 
> > > > > Yeah, I have noticed it.
> > > > > 
> > > > > > SBSA UART only implements a subset of
> > > > > > the PL011 registers. The compatible string is "arm,sbsa-uart", also see
> > > > > > drivers/tty/serial/amba-pl011.c:sbsa_uart_probe.
> > > > > 
> > > > > Looking closely into the details of implementation, I found
> > > > > that all the accesses to unimplemented registers, including
> > > > > CR, are deliberately avoided in sbsa part of linux driver.
> > > > 
> > > > So I'm now trying to implement "sbsa-uart" driver on U-Boot
> > > > by modifying the existing pl011 driver.
> > > > (Please note the current xen'ized U-Boot utilises a para-virtualized
> > > > console, i.e. with HVM_PARAM_CONSOLE_PFN.)
> > > > 
> > > > So far my all attempts have failed.
> > > > 
> > > > There are a couple of problems, and one of them is how we can
> > > > access vpl011 port (from dom0).
> > > > What I did is:
> > > > - modify U-Boot's pl011 driver
> > > >   (I'm sure that the driver correctly handle a vpl011 device
> > > >   with regard of accessing a proper set of registers.)
> > > > - start U-Boot guest with "vuart=sbsa_uart" by
> > > >     xl create uboot.cfg -c
> > > > 
> > > > Then I have seen almost nothing on the screen.
> > > > Digging into vpl011 implementation, I found that all the characters
> > > > written DR register will be directed to a "backend domain" if a guest
> > > > vm is launched by xl command.
> > > > (In case of dom0less, the backend seems to be Xen itself.)
> > > > 
> > > > As a silly experiment, I modified domain_vpl011_init() to always create
> > > > a vpl011 device with "backend_in_domain == false".
> > > > Then, I could see more boot messages from U-Boot, but still fails
> > > > to use the device as a console, I mean, we will lose all the outputs
> > > > after at some point and won't be able to type any keys (at a command prompt).
> > > > (This will be another problem on U-Boot side.)
> > > > 
> > > > My first question here is how we can configure and connect a console
> > > > in this case?
> > > > Should "xl create -c" or "xl console -t vuart" simply work?
> > > 
> > > "xl create -c" creates a guest and connect to the primary console which
> > > is the PV console (i.e. HVM_PARAM_CONSOLE_PFN.)
> > 
> > So in case of vuart, it (console) doesn't work?
> > (Apparently, "xl create" doesn't take '-t' option.)
> > 
> > > To connect to the emulated sbsa uart you need to pass -t vuart. So yes,
> > > "xl console -t vuart domain_name" should get you access to the emulated
> > > sbsa uart. The sbsa uart can also be exposed to dom0less guests; you get
> > > their output by using CTRL-AAA to switch to right domU console.
> > > 
> > > You can add printks to xen/arch/arm/vpl011.c in Xen to see what's
> > > happening on the Xen side. vpl011.c is the emulator.
> > 
> > I'm sure that write to "REG_DR" register is caught by Xen.
> > What I don't understand is
> > if back_in_domain -> no outputs
> > if !back_in_domain -> can see outputs
> > 
> > (As you know, if a guest is created by xl command, back_in_domain
> > is forcedly set to true.)
> > 
> > I looked into xenstore and found that "vuart/0/tty" does not exist,
> > but "console/tty" does.
> > How can this happen for vuart?
> > (I clearly specified, vuart = "sbsa_uart" in Xen config.)
> 
> It looks like we have a bug :-(
> 
> I managed to reproduce the issue. The problem is a race in libxl.
> 
> tools/libxc/xc_dom_arm.c:alloc_magic_pages is called first, setting
> dom->vuart_gfn.  Then, libxl__build_hvm should be setting
> state->vuart_gfn to dom->vuart_gfn (like libxl__build_pv does) but it
> doesn't.

Thank you for the patch.
I confirmed that sbsa-uart driver on U-Boot now works.

=== after "xl console -t vuart" ===
U-Boot 2020.10-00777-g10cf956a26ba (Oct 29 2020 - 19:31:29 +0900) xenguest

Xen virtual CPU
Model: XENVM-4.15
DRAM:  128 MiB

In:    sbsa-pl011
Out:   sbsa-pl011
Err:   sbsa-pl011
xenguest# dm tree
 Class     Index  Probed  Driver                Name
-----------------------------------------------------------
 root          0  [ + ]   root_driver           root_driver
 firmware      0  [   ]   psci                  |-- psci
 serial        0  [ + ]   serial_pl01x          |-- sbsa-pl011
 pvblock       0  [   ]   pvblock               `-- pvblock
===

If possible, I hope that "xl create -c" command would accept "-t vuart"
option (or it should automatically selects uart type from the config).

-Takahiro Akashi


> 
> ---
> 
> libxl: set vuart_gfn in libxl__build_hvm
> 
> Setting vuart_gfn was missed when switching ARM guests to the PVH build.
> Like libxl__build_pv, libxl__build_hvm should set state->vuart_gfn to
> dom->vuart_gfn.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
> index f8661e90d4..36fe8915e7 100644
> --- a/tools/libxl/libxl_dom.c
> +++ b/tools/libxl/libxl_dom.c
> @@ -1184,6 +1184,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
>          LOG(ERROR, "hvm build set params failed");
>          goto out;
>      }
> +    state->vuart_gfn = dom->vuart_gfn;
>  
>      rc = hvm_build_set_xs_values(gc, domid, dom, info);
>      if (rc != 0) {


