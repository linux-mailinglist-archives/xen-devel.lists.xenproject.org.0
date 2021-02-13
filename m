Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B5531AE4C
	for <lists+xen-devel@lfdr.de>; Sat, 13 Feb 2021 23:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84731.158831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lB3Xz-0001XN-HC; Sat, 13 Feb 2021 22:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84731.158831; Sat, 13 Feb 2021 22:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lB3Xz-0001Wy-DL; Sat, 13 Feb 2021 22:37:51 +0000
Received: by outflank-mailman (input) for mailman id 84731;
 Sat, 13 Feb 2021 22:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QNNA=HP=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1lB3Xy-0001Wt-Ne
 for xen-devel@lists.xenproject.org; Sat, 13 Feb 2021 22:37:50 +0000
Received: from mout.kundenserver.de (unknown [212.227.126.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id caa44f35-4888-486a-80d2-929de50c2fb2;
 Sat, 13 Feb 2021 22:37:49 +0000 (UTC)
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N7iOw-1ly5gQ30T4-014nob; Sat, 13 Feb 2021 23:37:44 +0100
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
X-Inumbo-ID: caa44f35-4888-486a-80d2-929de50c2fb2
Subject: Re: [PATCH] hw/i386/xen: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210202155644.998812-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d8c7c2c9-031c-3534-d828-c3b232edc674@vivier.eu>
Date: Sat, 13 Feb 2021 23:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202155644.998812-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fg0slwWmDeG5W6CXwD+LFOmr7nTkZRJYbYVrZF2KgwJh4tqjenM
 /hoyI99CpsCV3jiaMWNDOkcczLbBun/CfFUn76o4NhdEcPcjBcQLizPk/jxuAmjF9DPXyzV
 6G+ldbCmL3v7cvczTf6OCu7yC/BYDtFsk4yAJ3rMRTESsBqOdvV/houE9RMe95Ll73EzaSh
 p04cUr9ZL3aCPiOAf69JQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oBoG6KzYfQA=:I1QJIt5t3ob4iCy8v8Avoz
 pN1hkJnA/17x4K02MXs94pUg5fkJWO2R1rJk4b0qHhUcLy+QSTkYegggX06uj4vaSOOyyKHd/
 ohf5fakZi3ZurGMJqqcmv+NT2IxP8eftr77lSqM9bFkfvgRFaCOc5E303yzg5kSGhAaaYbMLw
 kDZL2wGKFRczeCJQaRnAqTP5FeOK5+BmQZ5F5HfmH7o65gicGik2qpiUoV/WROV9pIcIWsaey
 XjIn0ounM2CztblyWF/Qa27qFP23hoFcVe7tuKaCQXUMfHBOMBNC9n1V6EJjptO0d6Iq2T2O4
 8nUVxIzyY66I+0iwRCnBk9TOe0F78rVcx+CpxTqq1lDrUXkHSnq4SkGRNICzdPgWycnsaGYlN
 iuLDhH3DguoBQD9OuhM5rMDD+JIwgJbQYkvw77bPuYF9lGKd/j6W7cYZq4BTuvVB9gP80wILa
 E9sYo8oLNw==

Le 02/02/2021 à 16:56, Philippe Mathieu-Daudé a écrit :
> 'drivers_blacklisted' is never accessed, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/i386/xen/xen_platform.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 7c4db35debb..01ae1fb1618 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -60,7 +60,6 @@ struct PCIXenPlatformState {
>      MemoryRegion bar;
>      MemoryRegion mmio_bar;
>      uint8_t flags; /* used only for version_id == 2 */
> -    int drivers_blacklisted;
>      uint16_t driver_product_version;
>  
>      /* Log from guest drivers */
> @@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
>  
>  static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t addr)
>  {
> -    PCIXenPlatformState *s = opaque;
> -
>      switch (addr) {
>      case 0:
> -        if (s->drivers_blacklisted) {
> -            /* The drivers will recognise this magic number and refuse
> -             * to do anything. */
> -            return 0xd249;
> -        } else {
> -            /* Magic value so that you can identify the interface. */
> -            return 0x49d2;
> -        }
> +        /* Magic value so that you can identify the interface. */
> +        return 0x49d2;
>      default:
>          return 0xffff;
>      }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

