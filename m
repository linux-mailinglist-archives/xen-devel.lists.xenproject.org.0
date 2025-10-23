Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2791CBFF349
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 07:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148671.1480569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBnQG-000241-Sm; Thu, 23 Oct 2025 04:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148671.1480569; Thu, 23 Oct 2025 04:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBnQG-00021Y-PQ; Thu, 23 Oct 2025 04:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1148671;
 Thu, 23 Oct 2025 04:59:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+PI=5A=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1vBnQD-00021S-Ow
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 04:59:34 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a96b114-afcd-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 06:59:25 +0200 (CEST)
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
 (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 59N4q3NC011817
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 23 Oct 2025 13:52:03 +0900 (JST)
 (envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
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
X-Inumbo-ID: 0a96b114-afcd-11f0-980a-7dc792cee155
DKIM-Signature: a=rsa-sha256; bh=9xxZpM2nB0o+d7uobfPXc5xWQTeCnn5dD9HEOV+8JfY=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1761195124; v=1;
        b=jF3ibRwZ1YpqgeWufdnW0Y13nquI1Pea9esn0iH0zkCtqnmwPs1Eo+EIEzahu4CA
         WSZw53qbYxw0m3aVhmM+IPEFlo3TK+WItwGjAu0w7UJBltEaTmKC/DBhm09vQrLP
         dQ60t2nVw4sKFpv0ZPMZgjsDXfh3C2YvmsortOrOECMXVacOfWd1lT1uiVuqJNw2
         CSo6ZLtKggBnJn9SwpJYLxiv2CdD41GR2cHL3JnOehfoid2t0C2gwIkAicEOk0Z9
         nLwg0jqOUASUxIa5ejAJzD0x32S4I5/GL0PnYUXui+XlkKiJeSOQBLhxxCFKomD3
         GRrKSSfXhFwFh2hp75ZadQ==
Message-ID: <f4547020-0df2-40a7-a625-7628ae36db02@rsg.ci.i.u-tokyo.ac.jp>
Date: Thu, 23 Oct 2025 13:52:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] char: rename CharBackend->CharFrontend
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
        Zhenwei Pi <pizhenwei@bytedance.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Stefano Garzarella <sgarzare@redhat.com>,
        Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Igor Mitsyanko <i.mitsyanko@gmail.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Chigot?=
 <chigot@adacore.com>,
        Frederic Konrad <konrad.frederic@yahoo.fr>,
        Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Yoshinori Sato <yoshinori.sato@nifty.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        "Collin L. Walling" <walling@linux.ibm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        Eduardo Habkost <eduardo@habkost.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Helge Deller <deller@gmx.de>, Corey Minyard <minyard@acm.org>,
        Paul Burton <paulburton@kernel.org>,
        Aleksandar Rikalo <arikalo@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
        Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Michael Rolnik <mrolnik@gmail.com>,
        Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
        Vijai Kumar K <vijai@behindbytes.com>,
        Samuel Tardieu <sam@rfc1149.net>,
        Gustavo Romero
 <gustavo.romero@linaro.org>,
        Raphael Norwitz <raphael@enfabrica.net>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "reviewer:vhost-user-scmi" <mzamazal@redhat.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
        "Dr. David Alan Gilbert" <dave@treblig.org>,
        Zhang Chen
 <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>,
        Jason Wang <jasowang@redhat.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
        "open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>,
        "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
        "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>,
        "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
        "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
        "open list:virtiofs" <virtio-fs@lists.linux.dev>,
        "open list:Rust-related patc..." <qemu-rust@nongnu.org>
References: <20251022074612.1258413-1-marcandre.lureau@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20251022074612.1258413-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/10/22 16:46, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The actual backend is "Chardev", CharBackend is the frontend side of
> it (whatever talks to the backend), let's rename it for readability.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

