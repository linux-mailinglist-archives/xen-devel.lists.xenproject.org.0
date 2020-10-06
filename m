Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA228482F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Oct 2020 10:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3129.9040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPi6J-0004Bv-Ep; Tue, 06 Oct 2020 08:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3129.9040; Tue, 06 Oct 2020 08:13:35 +0000
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
	id 1kPi6J-0004BW-BY; Tue, 06 Oct 2020 08:13:35 +0000
Received: by outflank-mailman (input) for mailman id 3129;
 Tue, 06 Oct 2020 08:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FcI=DN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kPi6H-0004BR-W3
 for xen-devel@lists.xen.org; Tue, 06 Oct 2020 08:13:34 +0000
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5145476-7603-4130-bd30-e1eb5714aab8;
 Tue, 06 Oct 2020 08:13:33 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id p15so16309656ejm.7
 for <xen-devel@lists.xen.org>; Tue, 06 Oct 2020 01:13:33 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id o9sm1765320eds.5.2020.10.06.01.13.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2020 01:13:31 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6FcI=DN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kPi6H-0004BR-W3
	for xen-devel@lists.xen.org; Tue, 06 Oct 2020 08:13:34 +0000
X-Inumbo-ID: f5145476-7603-4130-bd30-e1eb5714aab8
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f5145476-7603-4130-bd30-e1eb5714aab8;
	Tue, 06 Oct 2020 08:13:33 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id p15so16309656ejm.7
        for <xen-devel@lists.xen.org>; Tue, 06 Oct 2020 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=HR56wJereoyhBJKXAri+fewH/8JdbbDXN6I88FBg51M=;
        b=BGWdDV2L20bs5zTZev8MACb1x5mxhk/dBnNElUsvJHEPO3oI9dbf0u5SgNc7VVJgqB
         aSoCEms3yykCTtOBS16hfMc8CjNRul2GFIO7ACkO82ZPkXjdEgfZrg1tV3GDE6x4V1Ys
         oyj7iW+a0m1z+CV8Ud17rgOq0kLpvse6gsazZwH0Q1/8XkFL3oZrsEgHh6/BJVmHrfK9
         3VaX7I2i/aLxyuRiKSnzZqahQQEu64n1MzwlnffeFMbP6LTWcFGw4mnhX95ssPgbSfiG
         YzKrtLRysK2Qf3J54NJDrCtPz1+zIe001QxzQNKiK2Ng24RLN4U9CXIM//GrkDuttEC3
         u6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=HR56wJereoyhBJKXAri+fewH/8JdbbDXN6I88FBg51M=;
        b=QU847Dd22JueiDkQyFPEQdxhEzcpooMxa10X7IKAkcnESzcgeWM0BIeIvfFOSQdv1U
         RTQx6U/U0iApZdZoQ54/z4bX+DSG/tYapssr1cP7YUFUQc8yzRItwMQcEe3r/hR1CTig
         ZTih78IAqx7fouaQFvDqyA1bJgcpdaxy7+TluGfkHO1XV/X9TVKnspGYtrW5ypOJ2qjV
         ks3hP2JQ96z9SaM6yXTfVHWXgJc0Zhofcw7X2R03gE3gRXcKsH/x4A8GCR+he5WUqPoi
         68HMatX939RAi+TxD7YknW6bHjlE6Mrk+yyLWPfUvrZ6ZXI6QZbuh4LGHZV9Rw4/i5v9
         wwNQ==
X-Gm-Message-State: AOAM533F+ibkYQUq36ArdpHLMiePS2mALt5IvN6sa0x1KVnE760ypnWd
	PbAEK5le5S/WxHvrVl+++uE=
X-Google-Smtp-Source: ABdhPJyA8I1Q/+tUvyuIXDyjYz8pEVzJJon+Pyfj0lBbLmQRT9sSWNHdG7Cq1Vz0bQf+Ih0me0RUyA==
X-Received: by 2002:a17:906:c191:: with SMTP id g17mr4053148ejz.117.1601972012225;
        Tue, 06 Oct 2020 01:13:32 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id o9sm1765320eds.5.2020.10.06.01.13.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2020 01:13:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Don Slutz'" <don.slutz@gmail.com>
Cc: <xen-devel@lists.xen.org>,
	"'Boris Ostrovsky'" <boris.ostrovsky@oracle.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Tim Deegan'" <tim@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Konrad Rzeszutek Wilk'" <konrad.wilk@oracle.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>
References: <cover.1597854907.git.don.slutz@gmail.com> <bfe0b9bb7b283657bc33edb7c4b425930564ca46.1597854908.git.don.slutz@gmail.com> <e7581f3a-71eb-3181-9128-01e22653a47e@suse.com>
In-Reply-To: <e7581f3a-71eb-3181-9128-01e22653a47e@suse.com>
Subject: RE: [XEN PATCH v14 7/8] Add IOREQ_TYPE_VMWARE_PORT
Date: Tue, 6 Oct 2020 09:13:29 +0100
Message-ID: <000901d69bb8$941489b0$bc3d9d10$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQE3EbIOCgkLUtOBXNlfcF4M3GLQwwHXOsu5AXIpxzqqrv4WAA==



> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 01 October 2020 15:42
> To: Don Slutz <don.slutz@gmail.com>
> Cc: xen-devel@lists.xen.org; Boris Ostrovsky =
<boris.ostrovsky@oracle.com>; Ian Jackson
> <iwj@xenproject.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin =
Tian <kevin.tian@intel.com>;
> Stefano Stabellini <sstabellini@kernel.org>; Tim Deegan <tim@xen.org>; =
Andrew Cooper
> <andrew.cooper3@citrix.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; George Dunlap
> <George.Dunlap@eu.citrix.com>; Paul Durrant <paul@xen.org>
> Subject: Re: [XEN PATCH v14 7/8] Add IOREQ_TYPE_VMWARE_PORT
>=20
> On 19.08.2020 18:52, Don Slutz wrote:
> > This adds synchronization of the 6 vcpu registers (only 32bits of
> > them) that QEMU's vmport.c and vmmouse.c needs between Xen and QEMU.
> > This is how VMware defined the use of these registers.
> >
> > This is to avoid a 2nd and 3rd exchange between QEMU and Xen to
> > fetch and put these 6 vcpu registers used by the code in QEMU's
> > vmport.c and vmmouse.c
>=20
> I'm unconvinced this warrants a new ioreq type, and all the overhead
> associated with it. I'd be curious to know what Paul or the qemu
> folks think here.
>=20

The current shared ioreq_t does appear have enough space to accommodate =
6 32-bit registers (in the addr, data, count and size) fields co =
couldn't the new IOREQ_TYPE_VMWARE_PORT type be dealt with by simply =
unioning the regs with these fields? That avoids the need for a whole =
new shared page.

  Paul


